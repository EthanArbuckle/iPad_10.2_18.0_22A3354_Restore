@implementation NSError(WFUnsupportedOnPlatform)

- (uint64_t)wf_isUnsupportedOnPlatformError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("WFUnsupportedOnPlatformErrorDomain"));

  return v2;
}

- (id)wf_localizedErrorStringWithActionName:()WFUnsupportedOnPlatform
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  uint64_t v31;

  v4 = a3;
  if (objc_msgSend(a1, "wf_isUnsupportedOnPlatformError"))
  {
    objc_msgSend(a1, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("WFUnsupportedOnPlatformIdiom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(a1, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("WFUnsupportedOnPlatformErrorType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WFDisplayNameForDeviceIdiom(v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "code"))
    {
      objc_msgSend(a1, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("WFUnsupportedOnPlatformParameterName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        if (!v12)
        {
          WFLocalizedString(CFSTR("This parameter cannot be edited on this device."));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

LABEL_35:
          goto LABEL_36;
        }
        v20 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("The parameter “%@” cannot be edited on this device."));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", v21, v12);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_28:
        v16 = (void *)v22;

        goto LABEL_29;
      }
      v13 = objc_msgSend(v9, "isEqualToString:", CFSTR("NotAvailableOnSpecifiedPlatform"));
      v14 = (void *)MEMORY[0x1E0CB3940];
      if (v13)
      {
        if (v12)
        {
          v15 = CFSTR("The parameter “%@” cannot be edited on %@.");
LABEL_16:
          WFLocalizedString(v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringWithFormat:", v21, v12, v10);
LABEL_27:
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
        v29 = CFSTR("This parameter cannot be edited on %@.");
      }
      else
      {
        if (v12)
        {
          v15 = CFSTR("The parameter “%@” can only be edited on %@.");
          goto LABEL_16;
        }
        v29 = CFSTR("This parameter can only be edited on %@.");
      }
      WFLocalizedString(v29);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v21, v10, v31);
      goto LABEL_27;
    }
    if (objc_msgSend(v4, "length"))
    {
      if (!v10)
      {
        v26 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("The action “%@” is not supported on this device."));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", v27, v4);
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_34:
        v16 = (void *)v28;

        goto LABEL_35;
      }
      v17 = objc_msgSend(v9, "isEqualToString:", CFSTR("NotAvailableOnSpecifiedPlatform"));
      v18 = (void *)MEMORY[0x1E0CB3940];
      if (v17)
        v19 = CFSTR("The action “%@” is not supported on %@.");
      else
        v19 = CFSTR("The action “%@” can only run on %@.");
      WFLocalizedString(v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringWithFormat:", v27, v4, v10);
    }
    else
    {
      if (!v10)
      {
        WFLocalizedString(CFSTR("This action is not supported on this device."));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      v23 = objc_msgSend(v9, "isEqualToString:", CFSTR("NotAvailableOnSpecifiedPlatform"));
      v24 = (void *)MEMORY[0x1E0CB3940];
      if (v23)
        v25 = CFSTR("This action is not supported on %@.");
      else
        v25 = CFSTR("This action can only run on %@.");
      WFLocalizedString(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringWithFormat:", v27, v10, v31);
    }
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v16 = 0;
LABEL_36:

  return v16;
}

+ (id)wf_unsupportedActionErrorWithType:()WFUnsupportedOnPlatform platformIdiom:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSError+WFUnsupportedOnPlatform.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorType"));

  }
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v14[0] = CFSTR("WFUnsupportedOnPlatformIdiom");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("WFUnsupportedOnPlatformErrorType");
  v15[0] = v9;
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("WFUnsupportedOnPlatformErrorDomain"), 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)wf_unsupportedParameterErrorWithParameterName:()WFUnsupportedOnPlatform errorType:platformIdiom:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSError+WFUnsupportedOnPlatform.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorType"));

  }
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v18[0] = v9;
  v17[0] = CFSTR("WFUnsupportedOnPlatformParameterName");
  v17[1] = CFSTR("WFUnsupportedOnPlatformIdiom");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = CFSTR("WFUnsupportedOnPlatformErrorType");
  v18[1] = v12;
  v18[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WFUnsupportedOnPlatformErrorDomain"), 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
