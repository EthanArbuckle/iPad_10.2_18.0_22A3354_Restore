@implementation CEMPolicyAppDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  DMDSetEffectivePolicyRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  DMDSetEffectivePolicyRequest *v14;
  unsigned int v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyAppDeclaration payloadMode](self, "payloadMode"));
  if ((DMDDeclarationModeIsValid(v7) & 1) != 0)
  {
    v8 = objc_opt_new(DMDSetEffectivePolicyRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationIdentifier"));
    -[DMDSetEffectivePolicyRequest setOrganizationIdentifier:](v8, "setOrganizationIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyAppDeclaration declarationIdentifier](self, "declarationIdentifier"));
    -[DMDSetEffectivePolicyRequest setDeclarationIdentifier:](v8, "setDeclarationIdentifier:", v10);

    -[DMDSetEffectivePolicyRequest setType:](v8, "setType:", DMFEffectivePolicyTypeApplication);
    -[DMDSetEffectivePolicyRequest setPolicy:](v8, "setPolicy:", DMDPolicyFromDeclarationMode(v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyAppDeclaration payloadApps](self, "payloadApps"));
    -[DMDSetEffectivePolicyRequest setIdentifiers:](v8, "setIdentifiers:", v11);

    if (v7)
    {
      if (objc_msgSend(v7, "caseInsensitiveCompare:", DMFDeclarationPayloadModeOverride))
        v12 = 100;
      else
        v12 = 1;
    }
    else
    {
      v12 = 100;
    }
    -[DMDSetEffectivePolicyRequest setPriority:](v8, "setPriority:", v12);
    v20 = 0;
    v15 = +[DMDSetEffectivePolicyOperation validateRequest:error:](DMDSetEffectivePolicyOperation, "validateRequest:error:", v8, &v20);
    v16 = v20;
    if (v15)
    {
      v14 = v8;
    }
    else
    {
      v17 = DMFConfigurationEngineLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100070F90(v16);

      v14 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v16);
    }

    goto LABEL_17;
  }
  if (a4)
  {
    v21 = DMFInvalidParameterErrorKey;
    v22 = DMFDeclarationPayloadModeKey;
    v8 = (DMDSetEffectivePolicyRequest *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v13 = DMFErrorWithCodeAndUserInfo(4000, v8);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
LABEL_17:

    goto LABEL_18;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  id v6;
  DMDRemoveEffectivePolicyRequest *v7;
  void *v8;
  void *v9;
  id v10;
  DMDRemoveEffectivePolicyRequest *v11;
  uint64_t v12;
  NSObject *v13;
  id v15;

  v6 = a3;
  v7 = objc_opt_new(DMDRemoveEffectivePolicyRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationIdentifier"));

  -[DMDRemoveEffectivePolicyRequest setOrganizationIdentifier:](v7, "setOrganizationIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyAppDeclaration declarationIdentifier](self, "declarationIdentifier"));
  -[DMDRemoveEffectivePolicyRequest setDeclarationIdentifier:](v7, "setDeclarationIdentifier:", v9);

  v15 = 0;
  LODWORD(v6) = +[DMDRemoveEffectivePolicyOperation validateRequest:error:](DMDRemoveEffectivePolicyOperation, "validateRequest:error:", v7, &v15);
  v10 = v15;
  if ((_DWORD)v6)
  {
    v11 = v7;
  }
  else
  {
    v12 = DMFConfigurationEngineLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10007100C(v10);

    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v11;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0;
}

@end
