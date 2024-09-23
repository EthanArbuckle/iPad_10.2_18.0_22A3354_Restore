@implementation CEMPolicyCategoryDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  DMDSetEffectivePolicyRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  DMDSetEffectivePolicyRequest *v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  id v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyCategoryDeclaration payloadMode](self, "payloadMode"));
  if ((DMDDeclarationModeIsValid(v7) & 1) != 0)
  {
    v8 = objc_opt_new(DMDSetEffectivePolicyRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "organizationIdentifier"));
    -[DMDSetEffectivePolicyRequest setOrganizationIdentifier:](v8, "setOrganizationIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyCategoryDeclaration declarationIdentifier](self, "declarationIdentifier"));
    -[DMDSetEffectivePolicyRequest setDeclarationIdentifier:](v8, "setDeclarationIdentifier:", v10);

    -[DMDSetEffectivePolicyRequest setType:](v8, "setType:", DMFEffectivePolicyTypeCategory);
    -[DMDSetEffectivePolicyRequest setPolicy:](v8, "setPolicy:", DMDPolicyFromDeclarationMode(v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyCategoryDeclaration payloadCategoriesVersion2](self, "payloadCategoriesVersion2"));
    if (v11)
    {
      -[DMDSetEffectivePolicyRequest setIdentifiers:](v8, "setIdentifiers:", v11);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyCategoryDeclaration payloadCategories](self, "payloadCategories"));
      -[DMDSetEffectivePolicyRequest setIdentifiers:](v8, "setIdentifiers:", v14);

    }
    if (v7)
    {
      if (objc_msgSend(v7, "caseInsensitiveCompare:", DMFDeclarationPayloadModeOverride))
        v15 = 100;
      else
        v15 = 1;
    }
    else
    {
      v15 = 100;
    }
    -[DMDSetEffectivePolicyRequest setPriority:](v8, "setPriority:", v15);
    v21 = 0;
    v16 = +[DMDSetEffectivePolicyOperation validateRequest:error:](DMDSetEffectivePolicyOperation, "validateRequest:error:", v8, &v21);
    v17 = v21;
    if (v16)
    {
      v13 = v8;
    }
    else
    {
      v18 = DMFConfigurationEngineLog();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100070F90(v17);

      v13 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v17);
    }

    goto LABEL_20;
  }
  if (a4)
  {
    v22 = DMFInvalidParameterErrorKey;
    v23 = DMFDeclarationPayloadModeKey;
    v8 = (DMDSetEffectivePolicyRequest *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v12 = DMFErrorWithCodeAndUserInfo(4000, v8);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
LABEL_20:

    goto LABEL_21;
  }
  v13 = 0;
LABEL_21:

  return v13;
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
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyCategoryDeclaration declarationIdentifier](self, "declarationIdentifier"));
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
