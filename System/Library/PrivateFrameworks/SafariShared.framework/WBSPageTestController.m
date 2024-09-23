@implementation WBSPageTestController

- (id)expectedResultsPathExtension
{
  return CFSTR("txt");
}

- (id)bundleFromNSBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WBSPageTest *v16;
  void *v17;
  void *v18;
  void *v19;
  WBSPageTest *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  WBSPageTest *v30;
  void *v31;
  void *v32;
  WBSPageTest *v33;
  void *v34;
  void *v35;
  void *v36;
  WBSPageTestBundle *v37;
  NSObject *v38;
  WBSPageTestController *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t i;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  WBSPageTestEvaluator *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v40 = self;
  v67 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v51 = objc_alloc_init(WBSPageTestEvaluator);
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = v3;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), CFSTR("TestPages"));
  obj = (id)objc_claimAutoreleasedReturnValue();

  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v58 != v42)
          objc_enumerationMutation(obj);
        v49 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v49, "safari_stringForKey:", CFSTR("WebArchiveFileName"), v40);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v48, "bundleURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "URLWithString:relativeToURL:", v46, v6);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v49, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), CFSTR("Expectations"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v7;
        if (v7)
        {
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          v52 = v7;
          v8 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
          if (v8)
          {
            v9 = *(_QWORD *)v54;
            do
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v54 != v9)
                  objc_enumerationMutation(v52);
                v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
                objc_msgSend(v11, "safari_stringForKey:", CFSTR("ExpectedResults"));
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                if (v12)
                {
                  objc_msgSend(v11, "safari_stringForKey:", CFSTR("Identifier"));
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v13)
                  {
                    objc_msgSend(v11, "safari_stringForKey:", CFSTR("Condition"));
                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v14);
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v15, "evaluateWithObject:", v51))
                    {
                      v16 = [WBSPageTest alloc];
                      v17 = (void *)MEMORY[0x1E0C99E98];
                      objc_msgSend(v48, "bundleURL");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v17, "URLWithString:relativeToURL:", v12, v18);
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      v20 = -[WBSPageTest initWithIdentifier:pageURL:expectedResultsURL:dictionary:](v16, "initWithIdentifier:pageURL:expectedResultsURL:dictionary:", v13, v50, v19, v49);
                      objc_msgSend(v47, "addObject:", v20);

                    }
                    v21 = WBS_LOG_CHANNEL_PREFIXTest();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543618;
                      v62 = v12;
                      v63 = 2114;
                      v64 = v14;
                      _os_log_impl(&dword_1A3D90000, v21, OS_LOG_TYPE_INFO, "Skipping expectation '%{public}@' because the current device didn't meet the condition '%{public}@'", buf, 0x16u);
                    }

                  }
                  else
                  {
                    v23 = WBS_LOG_CHANNEL_PREFIXTest();
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v62 = v46;
                      _os_log_error_impl(&dword_1A3D90000, v23, OS_LOG_TYPE_ERROR, "Test for '%{public}@' is required to specify identifiers", buf, 0xCu);
                    }
                  }

                }
                else
                {
                  v22 = WBS_LOG_CHANNEL_PREFIXTest();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v62 = v46;
                    _os_log_error_impl(&dword_1A3D90000, v22, OS_LOG_TYPE_ERROR, "Test for '%{public}@' is required to specify an expected result files", buf, 0xCu);
                  }
                }

              }
              v8 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
            }
            while (v8);
          }
        }
        else
        {
          v24 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v50, "URLByDeletingPathExtension");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "absoluteString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringByAppendingString:", CFSTR("-expected"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "URLWithString:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSPageTestController expectedResultsPathExtension](v40, "expectedResultsPathExtension");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "URLByAppendingPathExtension:", v29);
          v52 = (id)objc_claimAutoreleasedReturnValue();

          v30 = [WBSPageTest alloc];
          objc_msgSend(v50, "URLByDeletingPathExtension");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "lastPathComponent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[WBSPageTest initWithIdentifier:pageURL:expectedResultsURL:dictionary:](v30, "initWithIdentifier:pageURL:expectedResultsURL:dictionary:", v32, v50, v52, v49);
          objc_msgSend(v47, "addObject:", v33);

        }
      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v43);
  }

  objc_msgSend(v48, "bundleIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v34)
  {
    objc_msgSend(v48, "bundleURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "URLByDeletingPathExtension");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "lastPathComponent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v47, "count", v40))
  {
    v37 = -[WBSPageTestBundle initWithIdentifier:tests:]([WBSPageTestBundle alloc], "initWithIdentifier:tests:", v34, v47);
  }
  else
  {
    v38 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v62 = v34;
      _os_log_impl(&dword_1A3D90000, v38, OS_LOG_TYPE_INFO, "Skipping bundle '%{public}@' because they contained no runnable tests for current device", buf, 0xCu);
    }
    v37 = 0;
  }

  return v37;
}

- (unint64_t)pageTestType
{
  return 0;
}

- (WBSPageTestDelegate)delegate
{
  return (WBSPageTestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
