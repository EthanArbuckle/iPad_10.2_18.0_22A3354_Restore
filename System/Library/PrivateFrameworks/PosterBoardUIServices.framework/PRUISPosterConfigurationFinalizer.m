@implementation PRUISPosterConfigurationFinalizer

+ (id)finalizerErrorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD1398];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PRUISPosterConfigurationFinalizerErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)finalizedConfigurationForAttributes:(id)a3 withConfiguredProperties:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BE74D28];
  objc_msgSend(v8, "extensionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "role");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "posterUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", v12, 0, v13, v14, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BE74D30];
  objc_msgSend(v8, "providerURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "pathWithProviderURL:identity:", v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "instanceURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PFFileProtectionNoneAttributes();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 1, v20, &v33);
  v21 = v33;

  if (v21)
    goto LABEL_6;
  objc_msgSend(v18, "contentsURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  PFFileProtectionNoneAttributes();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v22, 1, v23, &v32);
  v21 = v32;

  if (v21)
    goto LABEL_6;
  v31 = 0;
  objc_msgSend(v18, "copyContentsOfPath:error:", v10, &v31);
  v24 = v31;
  if (!v24)
  {
    objc_msgSend(v18, "supplementURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PFFileProtectionNoneAttributes();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v25, 1, v26, &v30);
    v21 = v30;

    if (v21)
      goto LABEL_6;
    v29 = 0;
    objc_msgSend(MEMORY[0x24BE74E10], "storeConfiguredPropertiesForPath:configuredProperties:error:", v18, v7, &v29);
    v24 = v29;
    if (!v24)
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74C28]), "_initWithPath:", v18);
      goto LABEL_7;
    }
  }
  v21 = v24;
LABEL_6:
  objc_msgSend((id)objc_opt_class(), "finalizerErrorWithCode:underlyingError:", 2, v21);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  v27 = 0;
LABEL_7:

  return v27;
}

@end
