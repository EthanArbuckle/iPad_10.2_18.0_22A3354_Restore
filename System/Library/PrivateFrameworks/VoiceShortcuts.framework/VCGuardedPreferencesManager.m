@implementation VCGuardedPreferencesManager

+ (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 inDomain:(id)a5 withAccessSpecifier:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VCGuardedPreferencesManager.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domain"));

    if (v15)
      goto LABEL_4;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VCGuardedPreferencesManager.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  if (!v14)
    goto LABEL_17;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VCGuardedPreferencesManager.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

LABEL_4:
  objc_msgSend(v15, "associatedAppBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {

  }
  else
  {
    objc_msgSend(v15, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DC8058], 1011, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v25;
      if (a7)
      {
        v19 = objc_retainAutorelease(v25);
        v23 = 0;
        *a7 = v19;
      }
      else
      {
        v23 = 0;
      }
      goto LABEL_12;
    }
  }
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v14);
  objc_msgSend(v15, "associatedAppBundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
  {
    objc_msgSend(v15, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "keyWithPreferenceKey:bundleId:", v13, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInteger:forKey:", a3, v22);

  if (!v20)
  v23 = CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B248]) != 0;
LABEL_12:

  return v23;
}

+ (id)keyWithPreferenceKey:(id)a3 bundleId:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v11[0] = a4;
  v11[1] = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("-"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
