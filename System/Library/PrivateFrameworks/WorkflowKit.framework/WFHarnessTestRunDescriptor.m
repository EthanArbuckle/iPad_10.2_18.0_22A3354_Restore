@implementation WFHarnessTestRunDescriptor

- (WFHarnessTestRunDescriptor)initWithTestBundleURL:(id)a3 xcTestClass:(id)a4 xcTestMethodName:(id)a5 testIdentifier:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  WFHarnessTestRunDescriptor *v16;
  WFHarnessTestRunDescriptor *v17;
  uint64_t v18;
  NSString *xcTestClass;
  uint64_t v20;
  NSString *xcTestMethodName;
  uint64_t v22;
  NSString *testIdentifier;
  int v24;
  NSObject *v25;
  WFHarnessTestRunDescriptor *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessTestRunDescriptor.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("testBundleURL"));

    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessTestRunDescriptor.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("xcTestMethodName"));

      if (v15)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessTestRunDescriptor.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("xcTestClass"));

  if (!v14)
    goto LABEL_14;
LABEL_4:
  if (v15)
    goto LABEL_5;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessTestRunDescriptor.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("testIdentifier"));

LABEL_5:
  v32.receiver = self;
  v32.super_class = (Class)WFHarnessTestRunDescriptor;
  v16 = -[WFHarnessTestRunDescriptor init](&v32, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_testBundleURL, a3);
    v18 = objc_msgSend(v13, "copy");
    xcTestClass = v17->_xcTestClass;
    v17->_xcTestClass = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    xcTestMethodName = v17->_xcTestMethodName;
    v17->_xcTestMethodName = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    testIdentifier = v17->_testIdentifier;
    v17->_testIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v12, "startAccessingSecurityScopedResource");
    v17->_holdingSecurityScopedAccess = v24;
    if (v24)
    {
      getWFTestHarnessLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[WFHarnessTestRunDescriptor initWithTestBundleURL:xcTestClass:xcTestMethodName:testIdentifier:]";
        v35 = 2112;
        v36 = v12;
        _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_DEFAULT, "%s Taken sandbox extension to %@", buf, 0x16u);
      }

    }
    v26 = v17;
  }

  return v17;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[WFHarnessTestRunDescriptor holdingSecurityScopedAccess](self, "holdingSecurityScopedAccess"))
  {
    -[WFHarnessTestRunDescriptor testBundleURL](self, "testBundleURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopAccessingSecurityScopedResource");

  }
  v4.receiver = self;
  v4.super_class = (Class)WFHarnessTestRunDescriptor;
  -[WFHarnessTestRunDescriptor dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0CB3910];
  v5 = a3;
  v6 = [v4 alloc];
  -[WFHarnessTestRunDescriptor testBundleURL](self, "testBundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v6, "initWithURL:", v7);

  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("testBundleURL"));
  -[WFHarnessTestRunDescriptor xcTestClass](self, "xcTestClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("xcTestClass"));

  -[WFHarnessTestRunDescriptor xcTestMethodName](self, "xcTestMethodName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("xcTestMethodName"));

  -[WFHarnessTestRunDescriptor testIdentifier](self, "testIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("testIdentifier"));

}

- (WFHarnessTestRunDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v12;
  WFHarnessTestRunDescriptor *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("testBundleURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("xcTestClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("xcTestMethodName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("testIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0 || v8 == 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v5, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFHarnessTestRunDescriptor initWithTestBundleURL:xcTestClass:xcTestMethodName:testIdentifier:](self, "initWithTestBundleURL:xcTestClass:xcTestMethodName:testIdentifier:", v12, v6, v7, v8);

    v13 = self;
  }

  return v13;
}

- (id)testMethodNamebyRemovingSuffixes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasSuffix:", CFSTR("AndReturnError:")))
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - objc_msgSend(CFSTR("AndReturnError:"), "length"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  if (objc_msgSend(v3, "hasSuffix:", CFSTR("WithCompletionHandler:")))
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - objc_msgSend(CFSTR("WithCompletionHandler:"), "length"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  if (objc_msgSend(v3, "hasSuffix:", CFSTR("()")))
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - objc_msgSend(CFSTR("()"), "length"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v6;
  }
  return v3;
}

- (id)loadTestCaseWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  WFHarnessTestRunDescriptor *v13;
  NSString *v14;
  objc_class *v15;
  id v16;
  void *v17;
  char v18;
  Method *v19;
  Method *v20;
  NSObject *v21;
  WFHarnessTestRunDescriptor *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  objc_method *v26;
  const char *Name;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  WFHarnessTestRunDescriptor *v31;
  NSObject *v32;
  WFHarnessTestRunDescriptor *v33;
  WFHarnessTestRunDescriptor *v34;
  NSObject *v35;
  NSObject *v36;
  WFHarnessTestRunDescriptor *v37;
  id v38;
  NSObject *v39;
  WFHarnessTestRunDescriptor *v40;
  void *v42;
  WFHarnessTestRunDescriptor *v43;
  WFHarnessTestRunDescriptor *v44;
  NSObject *v45;
  WFHarnessTestRunDescriptor *v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  int v51;
  int v52;
  const char *v53;
  int v54;
  NSObject *v55;
  NSObject *v56;
  WFHarnessTestRunDescriptor *v57;
  dispatch_semaphore_t v58;
  NSObject *v59;
  WFHarnessTestRunDescriptor *v60;
  dispatch_time_t v61;
  NSObject *v62;
  WFHarnessTestRunDescriptor *v63;
  WFHarnessTestRunDescriptor *v64;
  id v65;
  void *v66;
  id v67;
  char v68;
  WFHarnessTestRunDescriptor *v69;
  void (**v70)(void);
  void *v71;
  void *v72;
  WFHarnessTestRunDescriptor *v73;
  _QWORD v74[5];
  NSObject *v75;
  NSObject *v76;
  _QWORD v77[5];
  NSObject *v78;
  NSObject *v79;
  id *v80;
  id v81;
  id *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  _QWORD aBlock[5];
  unsigned int outCount;
  _BYTE buf[12];
  __int16 v90;
  WFHarnessTestRunDescriptor *v91;
  __int16 v92;
  WFHarnessTestRunDescriptor *v93;
  __int16 v94;
  _BYTE v95[24];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  -[WFHarnessTestRunDescriptor testCase](self, "testCase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFHarnessTestRunDescriptor testCase](self, "testCase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  v7 = (void *)MEMORY[0x1E0CB34D0];
  -[WFHarnessTestRunDescriptor testBundleURL](self, "testBundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleWithURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    getWFTestHarnessLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      -[WFHarnessTestRunDescriptor testBundleURL](self, "testBundleURL");
      v33 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      v90 = 2112;
      v91 = v33;
      _os_log_impl(&dword_1C15B3000, v32, OS_LOG_TYPE_FAULT, "%s Could not load test bundle at URL %@", buf, 0x16u);

    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2, 0);
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    goto LABEL_51;
  }
  objc_msgSend(v9, "sharedSupportURL");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "URLByAppendingPathComponent:", CFSTR("libActionHarnessTests.dylib"));
  v73 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = -[WFHarnessTestRunDescriptor wf_fileExists](v73, "wf_fileExists");
  getWFTestHarnessLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      -[WFHarnessTestRunDescriptor testBundleURL](self, "testBundleURL");
      v34 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      v90 = 2112;
      v91 = v34;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_FAULT, "%s Could not find action harness test dylib in bundle %@", buf, 0x16u);

    }
    if (!a3)
      goto LABEL_49;
    goto LABEL_47;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
    v90 = 2112;
    v91 = v73;
    _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "%s Loading test dylib at path %@", buf, 0x16u);
  }

  v13 = objc_retainAutorelease(v73);
  if (!dlopen((const char *)-[WFHarnessTestRunDescriptor fileSystemRepresentation](v13, "fileSystemRepresentation"), 2))
  {
    getWFTestHarnessLogObject();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      v90 = 2112;
      v91 = v13;
      _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_FAULT, "%s Could not dlopen test dylib at path %@", buf, 0x16u);
    }

    if (!a3)
      goto LABEL_49;
    goto LABEL_47;
  }
  -[WFHarnessTestRunDescriptor xcTestClass](self, "xcTestClass");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = NSClassFromString(v14);

  if (!v15)
  {
    getWFTestHarnessLogObject();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      -[WFHarnessTestRunDescriptor xcTestClass](self, "xcTestClass");
      v40 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      v90 = 2112;
      v91 = v40;
      v92 = 2112;
      v93 = v13;
      _os_log_impl(&dword_1C15B3000, v39, OS_LOG_TYPE_FAULT, "%s Could not find test class %@ inside dylib at path %@", buf, 0x20u);

    }
    if (!a3)
      goto LABEL_49;
LABEL_47:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2, 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_48;
  }
  v16 = objc_alloc_init(v15);
  v72 = v16;
  v17 = v16;
  if (!v16 || (v18 = objc_msgSend(v16, "conformsToProtocol:", &unk_1EF79EE08), v17 = v72, (v18 & 1) == 0))
  {

    getWFTestHarnessLogObject();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      -[WFHarnessTestRunDescriptor xcTestClass](self, "xcTestClass");
      v37 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      v90 = 2112;
      v91 = v37;
      _os_log_impl(&dword_1C15B3000, v36, OS_LOG_TYPE_FAULT, "%s Test class %@ does not conform to WFHarnessTestCaseVendor", buf, 0x16u);

    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v38 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:
      v6 = 0;
      *a3 = v38;
      goto LABEL_50;
    }
LABEL_49:
    v6 = 0;
    goto LABEL_50;
  }
  objc_msgSend(v72, "setTestBundle:", v9);
  outCount = 0;
  v19 = class_copyMethodList(v15, &outCount);
  v20 = v19;
  if (!v19)
  {
    getWFTestHarnessLogObject();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      -[WFHarnessTestRunDescriptor xcTestClass](self, "xcTestClass");
      v46 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      v90 = 2112;
      v91 = v46;
      _os_log_impl(&dword_1C15B3000, v45, OS_LOG_TYPE_FAULT, "%s Unable to get method list from test class: %@", buf, 0x16u);

    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    goto LABEL_64;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__WFHarnessTestRunDescriptor_loadTestCaseWithError___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v19;
  v70 = (void (**)(void))_Block_copy(aBlock);
  getWFTestHarnessLogObject();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[WFHarnessTestRunDescriptor xcTestClass](self, "xcTestClass");
    v22 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
    -[WFHarnessTestRunDescriptor xcTestMethodName](self, "xcTestMethodName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
    v90 = 2112;
    v91 = self;
    v92 = 2112;
    v93 = v22;
    v94 = 2112;
    *(_QWORD *)v95 = v23;
    _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_DEFAULT, "%s %@: Looking for test method %@ %@", buf, 0x2Au);

  }
  -[WFHarnessTestRunDescriptor xcTestMethodName](self, "xcTestMethodName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHarnessTestRunDescriptor testMethodNamebyRemovingSuffixes:](self, "testMethodNamebyRemovingSuffixes:", v24);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (!outCount)
  {
LABEL_55:
    getWFTestHarnessLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      -[WFHarnessTestRunDescriptor xcTestClass](self, "xcTestClass");
      v43 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
      -[WFHarnessTestRunDescriptor xcTestMethodName](self, "xcTestMethodName");
      v44 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      v90 = 2112;
      v91 = v43;
      v92 = 2112;
      v93 = v44;
      _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_FAULT, "%s Failed to find a test method name matching %@ %@ - check if XCTest calling convention has changed", buf, 0x20u);

    }
    goto LABEL_57;
  }
  v25 = 0;
  v68 = 0;
  while (1)
  {
    while (1)
    {
      v26 = v20[v25];
      Name = method_getName(v26);
      NSStringFromSelector(Name);
      v28 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject hasPrefix:](v28, "hasPrefix:", CFSTR("test")))
        break;
LABEL_19:

      if (++v25 >= outCount)
      {
        if ((v68 & 1) == 0)
          goto LABEL_55;
        goto LABEL_54;
      }
    }
    -[WFHarnessTestRunDescriptor testMethodNamebyRemovingSuffixes:](self, "testMethodNamebyRemovingSuffixes:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "isEqualToString:", v71) & 1) == 0)
    {

      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", method_getTypeEncoding(v26), 4);
    v69 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      if (-[WFHarnessTestRunDescriptor length](v69, "length"))
        break;
    }
    getWFTestHarnessLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      -[WFHarnessTestRunDescriptor xcTestClass](self, "xcTestClass");
      v31 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      v90 = 2112;
      v91 = self;
      v92 = 2112;
      v93 = v31;
      v94 = 2112;
      *(_QWORD *)v95 = v28;
      _os_log_impl(&dword_1C15B3000, v30, OS_LOG_TYPE_DEFAULT, "%s %@: Skipping considering %@ %@ - method has empty type encoding", buf, 0x2Au);

    }
    ++v25;
    v68 = 1;
    if (v25 >= outCount)
      goto LABEL_54;
  }
  getWFTestHarnessLogObject();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
    v90 = 2112;
    v91 = self;
    v92 = 2112;
    v93 = v69;
    _os_log_impl(&dword_1C15B3000, v47, OS_LOG_TYPE_DEFAULT, "%s %@: types=%@", buf, 0x20u);
  }

  -[objc_class instanceMethodSignatureForSelector:](v15, "instanceMethodSignatureForSelector:", Name);
  v67 = (id)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v67, "numberOfArguments");
  getWFTestHarnessLogObject();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
    v90 = 2112;
    v91 = self;
    v92 = 2048;
    v93 = (WFHarnessTestRunDescriptor *)v48;
    _os_log_impl(&dword_1C15B3000, v49, OS_LOG_TYPE_DEFAULT, "%s %@: methodSignature.numberOfArguments=%lu", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v67);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setSelector:", Name);
  objc_msgSend(v50, "setTarget:", v72);
  v66 = v50;
  v51 = -[NSObject containsString:](v28, "containsString:", CFSTR("WithCompletionHandler:"));
  if ((v51 & 1) != 0)
  {
    if (v48 == 3)
    {
      v52 = -[WFHarnessTestRunDescriptor containsString:](v69, "containsString:", CFSTR("\"NSError\"));
      goto LABEL_77;
    }
LABEL_76:
    v52 = 0;
  }
  else
  {
    if (v48 != 3)
      goto LABEL_76;
    v53 = (const char *)objc_msgSend(objc_retainAutorelease(v67), "getArgumentTypeAtIndex:", 2);
    v54 = strncmp(v53, "^@", 2uLL);
    v52 = v54 == 0;
    getWFTestHarnessLogObject();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      v90 = 2112;
      v91 = self;
      v92 = 2112;
      v93 = (WFHarnessTestRunDescriptor *)v28;
      v94 = 1024;
      *(_DWORD *)v95 = v54 == 0;
      *(_WORD *)&v95[4] = 2080;
      *(_QWORD *)&v95[6] = v53;
      *(_WORD *)&v95[14] = 2080;
      *(_QWORD *)&v95[16] = "^@";
      _os_log_impl(&dword_1C15B3000, v55, OS_LOG_TYPE_DEFAULT, "%s %@: %@ isThrowingTest %d type=%s errorTestArgumentType=%s", buf, 0x3Au);
    }

  }
LABEL_77:
  getWFTestHarnessLogObject();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    -[WFHarnessTestRunDescriptor xcTestClass](self, "xcTestClass");
    v57 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
    v90 = 2112;
    v91 = self;
    v92 = 2112;
    v93 = v57;
    v94 = 2112;
    *(_QWORD *)v95 = v28;
    *(_WORD *)&v95[8] = 1024;
    *(_DWORD *)&v95[10] = v51;
    *(_WORD *)&v95[14] = 1024;
    *(_DWORD *)&v95[16] = v52;
    _os_log_impl(&dword_1C15B3000, v56, OS_LOG_TYPE_DEFAULT, "%s %@: Invoking test method %@ %@, isAsyncTest: %d, isThrowingTest: %d", buf, 0x36u);

  }
  if (!v51)
  {
    objc_msgSend(v66, "invoke");
    if (v52)
    {
      v81 = 0;
      objc_msgSend(v66, "getArgument:atIndex:", &v81, 2);
      if (a3)
        *a3 = objc_retainAutorelease(v81);
      if (v81)
      {
        getWFTestHarnessLogObject();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          -[WFHarnessTestRunDescriptor xcTestClass](self, "xcTestClass");
          v60 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
          v90 = 2112;
          v91 = self;
          v92 = 2112;
          v93 = v60;
          v94 = 2112;
          *(_QWORD *)v95 = v28;
          *(_WORD *)&v95[8] = 2112;
          *(_QWORD *)&v95[10] = v81;
          _os_log_impl(&dword_1C15B3000, v59, OS_LOG_TYPE_ERROR, "%s %@: Got error running test method %@ %@ - %@", buf, 0x34u);

        }
        goto LABEL_99;
      }
    }
    goto LABEL_101;
  }
  v81 = 0;
  v82 = &v81;
  v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__18434;
  v85 = __Block_byref_object_dispose__18435;
  v86 = 0;
  v58 = dispatch_semaphore_create(0);
  if (v52)
  {
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __52__WFHarnessTestRunDescriptor_loadTestCaseWithError___block_invoke_152;
    v77[3] = &unk_1E7AEE548;
    v77[4] = self;
    v78 = v28;
    v80 = &v81;
    v79 = v58;
    *(_QWORD *)buf = _Block_copy(v77);
    objc_msgSend(v66, "setArgument:atIndex:", buf, 2);
    objc_msgSend(v66, "invoke");

  }
  else
  {
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __52__WFHarnessTestRunDescriptor_loadTestCaseWithError___block_invoke_154;
    v74[3] = &unk_1E7AF55D0;
    v74[4] = self;
    v75 = v28;
    v76 = v58;
    *(_QWORD *)buf = _Block_copy(v74);
    objc_msgSend(v66, "setArgument:atIndex:", buf, 2);
    objc_msgSend(v66, "invoke");

  }
  v61 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v58, v61))
  {
    getWFTestHarnessLogObject();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      -[WFHarnessTestRunDescriptor xcTestClass](self, "xcTestClass");
      v63 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
      v90 = 2112;
      v91 = self;
      v92 = 2112;
      v93 = v63;
      v94 = 2112;
      *(_QWORD *)v95 = v28;
      _os_log_impl(&dword_1C15B3000, v62, OS_LOG_TYPE_DEFAULT, "%s %@: Timeout - giving up waiting on async test method %@ %@", buf, 0x2Au);

    }
    goto LABEL_98;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v82[5]);
  if (!v82[5])
  {

    _Block_object_dispose(&v81, 8);
LABEL_101:

LABEL_54:
    -[WFHarnessTestRunDescriptor testIdentifier](self, "testIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "testCaseWithIdentifier:", v42);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFHarnessTestRunDescriptor setTestCase:](self, "setTestCase:", v6);
    goto LABEL_58;
  }
  getWFTestHarnessLogObject();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    -[WFHarnessTestRunDescriptor xcTestClass](self, "xcTestClass");
    v64 = (WFHarnessTestRunDescriptor *)objc_claimAutoreleasedReturnValue();
    v65 = v82[5];
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]";
    v90 = 2112;
    v91 = self;
    v92 = 2112;
    v93 = v64;
    v94 = 2112;
    *(_QWORD *)v95 = v28;
    *(_WORD *)&v95[8] = 2112;
    *(_QWORD *)&v95[10] = v65;
    _os_log_impl(&dword_1C15B3000, v62, OS_LOG_TYPE_ERROR, "%s %@: Got error running async test method %@ %@ - %@", buf, 0x34u);

  }
LABEL_98:

  _Block_object_dispose(&v81, 8);
LABEL_99:

LABEL_57:
  v6 = 0;
LABEL_58:

  v70[2]();
LABEL_64:

LABEL_50:
LABEL_51:

  return v6;
}

- (BOOL)shouldDisablePrivacyPrompts
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[WFHarnessTestRunDescriptor testCase](self, "testCase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[WFHarnessTestRunDescriptor testCase](self, "testCase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", &__block_literal_global_18410);

  return v6 ^ 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: xcTestClass: %@, xcTestMethodName: %@, testIdentifier: %@, testCase != nil: %d, testBundleURL: %@)"), v5, self, self->_xcTestClass, self->_xcTestMethodName, self->_testIdentifier, self->_testCase != 0, self->_testBundleURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSURL)testBundleURL
{
  return self->_testBundleURL;
}

- (NSString)xcTestClass
{
  return self->_xcTestClass;
}

- (NSString)xcTestMethodName
{
  return self->_xcTestMethodName;
}

- (NSString)testIdentifier
{
  return self->_testIdentifier;
}

- (BOOL)holdingSecurityScopedAccess
{
  return self->_holdingSecurityScopedAccess;
}

- (WFHarnessTestCase)testCase
{
  return self->_testCase;
}

- (void)setTestCase:(id)a3
{
  objc_storeStrong((id *)&self->_testCase, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testCase, 0);
  objc_storeStrong((id *)&self->_testIdentifier, 0);
  objc_storeStrong((id *)&self->_xcTestMethodName, 0);
  objc_storeStrong((id *)&self->_xcTestClass, 0);
  objc_storeStrong((id *)&self->_testBundleURL, 0);
}

BOOL __57__WFHarnessTestRunDescriptor_shouldDisablePrivacyPrompts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "dialogRequestClass");
  return v2 == objc_opt_class();
}

void __52__WFHarnessTestRunDescriptor_loadTestCaseWithError___block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

void __52__WFHarnessTestRunDescriptor_loadTestCaseWithError___block_invoke_152(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  getWFTestHarnessLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "xcTestClass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 136316162;
    v10 = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]_block_invoke";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s %@: Async test method completed %@ %@ ; error %@",
      (uint8_t *)&v9,
      0x34u);

  }
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

intptr_t __52__WFHarnessTestRunDescriptor_loadTestCaseWithError___block_invoke_154(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  getWFTestHarnessLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "xcTestClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 136315906;
    v8 = "-[WFHarnessTestRunDescriptor loadTestCaseWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_DEFAULT, "%s %@: Test method completed %@ %@", (uint8_t *)&v7, 0x2Au);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)createWorkflowWithEnvironment:(int64_t)a3 database:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  WFHarnessTestRunDescriptor *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  getWFTestHarnessLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[WFHarnessTestRunDescriptor(Conversion) createWorkflowWithEnvironment:database:completionHandler:]";
    v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ - Loading testCase", buf, 0x16u);
  }

  v19 = 0;
  -[WFHarnessTestRunDescriptor loadTestCaseWithError:](self, "loadTestCaseWithError:", &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  if (v11)
  {
    objc_msgSend(v11, "runDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    getWFTestHarnessLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v21 = "-[WFHarnessTestRunDescriptor(Conversion) createWorkflowWithEnvironment:database:completionHandler:]";
      v22 = 2112;
      v23 = self;
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_DEFAULT, "%s %@ - Running workflow %@ %@", buf, 0x2Au);

    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __99__WFHarnessTestRunDescriptor_Conversion__createWorkflowWithEnvironment_database_completionHandler___block_invoke;
    v16[3] = &unk_1E7AEE5B0;
    v17 = v11;
    v18 = v9;
    objc_msgSend(v13, "createWorkflowWithEnvironment:database:completionHandler:", a3, v8, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v12);
  }

}

void __99__WFHarnessTestRunDescriptor_Conversion__createWorkflowWithEnvironment_database_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v8 = a2;
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
