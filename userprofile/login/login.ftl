<#import "template.ftl" as layout>
<div class="nav-container sticky-top">
	<div>
		<img height="50px" src="${url.resourcesPath}/img/statler_wahldorf.jpg">
		<img height="50px" align="right" src="${url.resourcesPath}/img/sbb_logo.png">
	</div>
</div>
<div class="jumbotron">
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle")}
    <#elseif section = "form">
		<h1>${msg("userprofileservice")}</h1>
		<h2>${msg("login")}</h2>
        <#if realm.password>
            <form id="kc-form-login" class="${properties.kcFormClass!}" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
				<div style="margin-top: 2em">
					<div class="${properties.kcFormGroupClass!} grid-row">
						<div class="${properties.kcLabelWrapperClass!} grid-col-1">
							<label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}:<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}:<#else>${msg("email")}:</#if></label>
						</div>

						<div class="${properties.kcInputWrapperClass!} grid-col-2">
							<#if usernameEditDisabled??>
								<input tabindex="1" id="username" class="${properties.kcInputClass!} ui-input" name="username" value="${(login.username!'')}" type="text" disabled />
							<#else>
								<input tabindex="1" id="username" class="${properties.kcInputClass!} ui-input" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" />
							</#if>
						</div>
					</div>

					<div class="${properties.kcFormGroupClass!} grid-row">

						<div class="${properties.kcLabelWrapperClass!} grid-col-1">
							<label for="password" class="${properties.kcLabelClass!}">${msg("password")}:</label>
						</div>


						<div class="${properties.kcInputWrapperClass!} grid-col-2">
							<input tabindex="2" id="password" class="${properties.kcInputClass!} ui-input" name="password" type="password" autocomplete="off" />
						</div>
					</div>

					<div class="${properties.kcFormGroupClass!}">
						<div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
							<#if realm.rememberMe && !usernameEditDisabled??>
								<div class="checkbox">
									<label>
										<#if login.rememberMe??>
											<input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked> ${msg("rememberMe")}
										<#else>
											<input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"> ${msg("rememberMe")}
										</#if>
									</label>
								</div>
							</#if>
							<div class="${properties.kcFormOptionsWrapperClass!}">
								<#if realm.resetPasswordAllowed>
									<span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
								</#if>
							</div>
						</div>

						<div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}, grid-row">
							<div class="${properties.kcFormButtonsWrapperClass!} grid-col-1">
								<input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} ui-button" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
							</div>
						 </div>
					</div>
				</div>
            </form>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>

        <#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
</div>
