<#import "template.ftl" as layout>
<#import "components/atoms/button.ftl" as button>
<#import "components/atoms/button-group.ftl" as buttonGroup>
<#import "components/atoms/form.ftl" as form>
<#import "components/atoms/input.ftl" as input>
<#import "components/atoms/link.ftl" as link>
<#import "components/atoms/radio.ftl" as radio>

<@layout.registrationLayout displayInfo=true; section>
  <#if section="header">
    ${msg("emailTOTPFormTitle", realm.displayName)}
  <#elseif section="form">
    <@form.kw action=url.loginAction method="post">
      <@input.kw
        autocomplete="one-time-code"
        autofocus=true
        invalid=messagesPerField.existsError("totp")
        label=msg("emailTOTPFormLabel")
        message=kcSanitize(messagesPerField.get("totp"))
        name="code"
        type="text"
      />
      <div class="flex items-center justify-between">
        <@link.kw color="primary" href=url.loginUrl size="small">
          ${kcSanitize(msg("backToLogin"))?no_esc}
        </@link.kw>
      </div>
      <@buttonGroup.kw>
        <@button.kw color="primary" name="submitAction" type="submit">
          ${msg("doSubmit")}
        </@button.kw>
      </@buttonGroup.kw>
    </@form.kw>
  </#if>
</@layout.registrationLayout>
