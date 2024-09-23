@implementation MSDXCTestSpawnWrapper

+ (id)sharedInstance
{
  if (qword_100175528 != -1)
    dispatch_once(&qword_100175528, &stru_10013F800);
  return (id)qword_100175520;
}

- (id)listAllTestScripts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  id v46;
  id v47;
  NSObject *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDXCTestSpawnWrapper _testProductsPath](self, "_testProductsPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/var/tmp/%@.json"), v5));

  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v55 = v3;
    v56 = 2114;
    v57 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Listing all test scripts from input: %{public}@ output: %{public}@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
  v53 = 0;
  v52 = 0;
  v10 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v53, NSURLContentModificationDateKey, &v52);
  v11 = v53;
  v12 = v52;

  if ((v10 & 1) == 0)
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C9700(v12);

  }
  v15 = objc_claimAutoreleasedReturnValue(-[MSDXCTestSpawnWrapper testScripts](self, "testScripts"));
  if (v15)
  {
    v16 = (void *)v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDXCTestSpawnWrapper testScriptsLastModified](self, "testScriptsLastModified"));
    v18 = objc_msgSend(v17, "isEqualToDate:", v11);

    if (v18)
    {
      v19 = sub_1000604F0();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No change in test scripts. Returning cached results!", buf, 2u);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDXCTestSpawnWrapper testScripts](self, "testScripts"));
      goto LABEL_23;
    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/usr/local/bin/xctspawn")));
  v51 = v12;
  v23 = objc_msgSend(v22, "checkResourceIsReachableAndReturnError:", &v51);
  v24 = v51;

  if ((v23 & 1) == 0)
  {
    v39 = sub_1000604F0();
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_1000C9688(v24);

    goto LABEL_22;
  }
  v25 = objc_alloc_init((Class)NSTask);
  objc_msgSend(v25, "setLaunchPath:", CFSTR("/usr/local/bin/xctspawn"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, CFSTR("--enumerate-tests"), CFSTR("--test-enumeration-format"), CFSTR("json"), CFSTR("--test-enumeration-output-path"), v6, 0));
  objc_msgSend(v25, "setArguments:", v26);

  objc_msgSend(v25, "setCurrentDirectoryPath:", CFSTR("/var/tmp"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSPipe pipe](NSPipe, "pipe"));
  objc_msgSend(v25, "setStandardOutput:", v27);
  v28 = sub_1000604F0();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "launchPath"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "arguments"));
    *(_DWORD *)buf = 138543618;
    v55 = v30;
    v56 = 2114;
    v57 = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Launching %{public}@ with arguments: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v25, "launch");
  objc_msgSend(v25, "waitUntilExit");
  v32 = objc_msgSend(v25, "terminationStatus");
  if (v32)
  {
    v33 = v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "fileHandleForReading"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "readDataToEndOfFile"));

    v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v35, 4);
    v37 = sub_1000604F0();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_1000C9604((uint64_t)v36, v33, v38);

LABEL_22:
    v21 = 0;
    v12 = v24;
    goto LABEL_23;
  }
  v50 = v24;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v6, 0, &v50));
  v43 = v50;

  if (v42)
  {
    v49 = v43;
    v44 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v42, 0, &v49));
    v12 = v49;

    if (v44)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MSDXCTestSpawnWrapper _parseTestScriptsFromXCTSpawnResultDictionary:](self, "_parseTestScriptsFromXCTSpawnResultDictionary:", v44));
      -[MSDXCTestSpawnWrapper setTestScripts:](self, "setTestScripts:", v45);

      -[MSDXCTestSpawnWrapper setTestScriptsLastModified:](self, "setTestScriptsLastModified:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDXCTestSpawnWrapper testScripts](self, "testScripts"));
    }
    else
    {
      v47 = sub_1000604F0();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        sub_1000C958C(v12);

      v21 = 0;
    }
  }
  else
  {
    v46 = sub_1000604F0();
    v44 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      sub_1000C9514(v43);
    v21 = 0;
    v12 = v43;
  }

LABEL_23:
  return v21;
}

- (BOOL)executeTestScriptOfIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  NSObject *v23;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDXCTestSpawnWrapper _testProductsPath](self, "_testProductsPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/var/tmp/%@.xcresult"), v7));

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pressDemoTestTarget"));

    if (v10)
      v11 = v10;
    else
      v11 = CFSTR("PressDemoScripts");

  }
  else
  {
    v11 = CFSTR("PressDemoScripts");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v11, v4));
  v13 = sub_1000604F0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Exexcuting test script of identifier %{public}@", buf, 0xCu);
  }

  v15 = objc_alloc_init((Class)NSTask);
  objc_msgSend(v15, "setLaunchPath:", CFSTR("/usr/local/bin/xctspawn"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, CFSTR("--result-bundle-path"), v8, CFSTR("--only-testing"), v12, 0));
  objc_msgSend(v15, "setArguments:", v16);

  objc_msgSend(v15, "setCurrentDirectoryPath:", CFSTR("/var/tmp"));
  v17 = sub_1000604F0();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "launchPath"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "arguments"));
    *(_DWORD *)buf = 138543618;
    v26 = v19;
    v27 = 2114;
    v28 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Launching %{public}@ with arguments: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v15, "launch");
  objc_msgSend(v15, "waitUntilExit");
  v21 = objc_msgSend(v15, "terminationStatus");
  if (v21)
  {
    v22 = sub_1000604F0();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1000C9778(v21, v23);

  }
  return v21 == 0;
}

- (id)_testProductsPath
{
  void *v2;
  void *v3;
  __CFString *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pressDemoXCTestProductsPath"));

  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("/var/mobile/XcodeBuiltProducts/Tests/PressDemoScripts.xctestproducts");

  return v4;
}

- (id)_parseTestScriptsFromXCTSpawnResultDictionary:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v50;
  void *v51;
  NSObject *obj;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  unsigned int v69;
  _BYTE v70[128];
  _BYTE v71[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("values")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));

  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name")));
      *(_DWORD *)buf = 138543362;
      v67 = (uint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found test plan: %{public}@", buf, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("children")));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));

    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v7)
    {
      v51 = v4;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("name")));
        *(_DWORD *)buf = 138543362;
        v67 = (uint64_t)v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "> Found test target: %{public}@", buf, 0xCu);

      }
      v50 = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("children")));
      v54 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      obj = v14;
      v55 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      if (v55)
      {
        v53 = *(_QWORD *)v63;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v63 != v53)
              objc_enumerationMutation(obj);
            v57 = v15;
            v16 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v15);
            v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("name")));
            v18 = sub_1000604F0();
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v67 = v17;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, ">> Found test case: %{public}@", buf, 0xCu);
            }
            v56 = (void *)v17;

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("children")));
            v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            v22 = v20;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v59;
              do
              {
                for (i = 0; i != v24; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v59 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("name")));
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("disabled")));
                  v30 = objc_msgSend(v29, "BOOLValue");

                  v31 = sub_1000604F0();
                  v32 = objc_claimAutoreleasedReturnValue(v31);
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v67 = (uint64_t)v28;
                    v68 = 1024;
                    v69 = v30;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, ">>> Found test method: %{public}@  Disabled: %{BOOL}d", buf, 0x12u);
                  }

                  if ((v30 & 1) == 0)
                    objc_msgSend(v21, "addObject:", v28);

                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
              }
              while (v24);
            }

            v33 = objc_msgSend(objc_alloc((Class)MSDKPeerDemoTestScript), "initWithName:andMethods:", v56, v21);
            objc_msgSend(v54, "addObject:", v33);

            v15 = v57 + 1;
          }
          while ((id)(v57 + 1) != v55);
          v55 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        }
        while (v55);
      }
      v12 = obj;

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v54));
      v7 = v50;
      v4 = v51;
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1000C9818(v12, v42, v43, v44, v45, v46, v47, v48);
      v34 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000C97E8(v7, v35, v36, v37, v38, v39, v40, v41);
    v34 = 0;
  }

  return v34;
}

- (NSArray)testScripts
{
  return self->_testScripts;
}

- (void)setTestScripts:(id)a3
{
  objc_storeStrong((id *)&self->_testScripts, a3);
}

- (NSDate)testScriptsLastModified
{
  return self->_testScriptsLastModified;
}

- (void)setTestScriptsLastModified:(id)a3
{
  objc_storeStrong((id *)&self->_testScriptsLastModified, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testScriptsLastModified, 0);
  objc_storeStrong((id *)&self->_testScripts, 0);
}

@end
