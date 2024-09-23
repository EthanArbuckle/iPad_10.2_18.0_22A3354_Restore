@implementation TPSUserTypesValidation

+ (BOOL)isBetaBuild
{
  return objc_msgSend((id)objc_opt_class(), "isUserMatchingType:", CFSTR("Beta"));
}

+ (BOOL)isInternalBuild
{
  return objc_msgSend((id)objc_opt_class(), "isUserMatchingType:", CFSTR("Internal"));
}

+ (BOOL)isUserMatchingType:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;

  v3 = (void *)MEMORY[0x1E0DBF3A0];
  v4 = a3;
  objc_msgSend(v3, "releaseType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)MGCopyAnswer();
  v8 = v7;

  v9 = objc_msgSend(v8, "isEqualToString:", v4);
  return v9;
}

- (TPSUserTypesValidation)initWithTargetUserTypes:(id)a3 excludeUserTypes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  TPSUserTypesValidation *v9;
  objc_super v11;

  v6 = a4;
  objc_msgSend(a3, "valueForKeyPath:", CFSTR("lowercaseString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("lowercaseString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)TPSUserTypesValidation;
  v9 = -[TPSInclusivityValidation initWithTargetValues:excludeValues:](&v11, sel_initWithTargetValues_excludeValues_, v7, v8);

  return v9;
}

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[TPSUserTypesValidation targetUserTypes](self, "targetUserTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userType");

    if (v9 > 2)
      v10 = 0;
    else
      v10 = off_1EA1E1268[v9];
    -[__CFString lowercaseString](v10, "lowercaseString");
    v11 = objc_claimAutoreleasedReturnValue();
    -[TPSUserTypesValidation targetUserTypes](self, "targetUserTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      -[TPSUserTypesValidation targetUserTypes](self, "targetUserTypes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v11);

    }
    else
    {
      v14 = 1;
    }

    -[TPSUserTypesValidation excludeUserTypes](self, "excludeUserTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v11);

    v17 = v14 & (v16 ^ 1u);
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = (void *)objc_opt_class();
      v20 = v19;
      -[TPSUserTypesValidation targetUserTypes](self, "targetUserTypes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSUserTypesValidation excludeUserTypes](self, "excludeUserTypes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138413314;
      v26 = v19;
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = v22;
      v31 = 2112;
      v32 = v24;
      v33 = 1024;
      v34 = v17;
      _os_log_debug_impl(&dword_1DAC2F000, v18, OS_LOG_TYPE_DEBUG, "%@ - checking user type: %@, target user types: %@, exclude user types: %@. Valid: %d", (uint8_t *)&v25, 0x30u);

    }
    goto LABEL_13;
  }
  -[TPSUserTypesValidation excludeUserTypes](self, "excludeUserTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[TPSUserTypesValidation validateWithCompletion:].cold.1((uint64_t)self, v11);
  v17 = 1;
LABEL_13:

  v4[2](v4, v17, 0);
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "%@ - neither target nor exclude user type(s) is specified.", (uint8_t *)&v4, 0xCu);

}

@end
