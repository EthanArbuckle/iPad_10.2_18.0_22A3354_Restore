@implementation OSASubmitter

- (OSASubmitter)init
{
  OSASubmitter *v2;
  OSASubmitter *v3;
  NSString *connectionType;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OSASubmitter;
  v2 = -[OSASubmitter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    connectionType = v2->_connectionType;
    v2->_connectionType = (NSString *)CFSTR("proxied");

  }
  return v3;
}

- (NSURL)submissionURL
{
  return 0;
}

- (void)prefaceSubmission:(id)a3 withData:(id)a4 usingArchive:(id)a5 andHeaders:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  OSAEphemeralLog *v14;
  void *v15;
  OSAEphemeralLog *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("content"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    v14 = [OSAEphemeralLog alloc];
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("metadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[OSAEphemeralLog initWithData:andMetadata:](v14, "initWithData:andMetadata:", v13, v15);

    if (v16)
    {
      v17 = objc_msgSend(v11, "copyDeflatedDataFromStream:withCap:", -[OSAEphemeralLog stream](v16, "stream"), 4096);
      if (v17)
      {
        v18 = (void *)v17;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v19 = objc_msgSend(v18, "length");
          -[OSAEphemeralLog metaData](v16, "metaData");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v27 = v19;
          v28 = 2112;
          v29 = v20;
          _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "preface payload %ld, metadata: %@", buf, 0x16u);

        }
        v21 = (void *)objc_msgSend(v12, "mutableCopy");
        -[OSAEphemeralLog metaData](v16, "metaData");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addEntriesFromDictionary:", v22);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "length"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setValue:forKey:", v23, CFSTR("length"));

        objc_msgSend(v21, "setValue:forKey:", CFSTR("deflate"), CFSTR("compression"));
        v25 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v21, 0, &v25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendData:", v24);
        objc_msgSend(v9, "appendBytes:length:", "\n", 1);
        objc_msgSend(v9, "appendData:", v18);
        objc_msgSend(v9, "appendBytes:length:", "\n", 1);
        -[OSAEphemeralLog closeFileStream](v16, "closeFileStream");

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = 4096;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Submission archive too big (> %u) for submission with preface", buf, 8u);
      }
    }

  }
}

- (id)getAdditionalRequestHeaders
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(MEMORY[0x1E0D64EE0], "fastLane");
  if (v3 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("x-fast-lane"));

  }
  if (objc_msgSend(v2, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[OSASubmitter getAdditionalRequestHeaders].cold.1((uint64_t)v2);
  return v2;
}

- (id)processSubmissionJobs:(id)a3 usingConfig:(id)a4 summarize:(id)a5
{
  id v8;
  id v9;
  OSASubmitter *v10;
  id v11;
  double Current;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int jobCount;
  void *v65;
  NSObject *v66;
  const __CFString *v67;
  unsigned int v68;
  CFAbsoluteTime v69;
  void *v70;
  NSError *responseError;
  __CFString *v72;
  void *v73;
  void *v74;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  id obj;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  id v88;
  char v89;
  id v90;
  void *v91;
  OSAStreamDeflater *v92;
  OSASubmitter *v93;
  id v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[2];
  _QWORD v110[2];
  uint8_t buf[4];
  _BYTE v112[28];
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = v9;
  v88 = a5;
  Current = CFAbsoluteTimeGetCurrent();
  self->_jobCount = 0;
  v13 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("name"));

  v16 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSASubmitter getAdditionalRequestHeaders](v10, "getAdditionalRequestHeaders");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_alloc_init(OSAStreamDeflater);
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = v8;
  v93 = v10;
  v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v114, 16);
  if (v77)
  {
    v78 = *(_QWORD *)v106;
    v85 = v11;
    v76 = v14;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v106 != v78)
          objc_enumerationMutation(obj);
        v80 = v17;
        v18 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v17);
        objc_msgSend(v18, "objectForKey:", CFSTR("routing"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("<inactive>"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v109[0] = CFSTR("<inactive>");
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("<inactive>"));
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v109[1] = CFSTR("routing");
          v110[0] = v21;
          v110[1] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "addObject:", v22);
        }
        else
        {
          v83 = v18;
          objc_msgSend(v18, "objectForKey:", CFSTR("logs"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 0x80000);
          objc_msgSend(*(id *)(v16 + 3560), "arrayWithCapacity:", objc_msgSend(v23, "count"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v19;
          v25 = (objc_msgSend(v19, "isEqualToString:", CFSTR("anon")) & 1) != 0
             || (objc_msgSend(v19, "isEqualToString:", CFSTR("beta")) & 1) != 0
             || objc_msgSend(v19, "isEqualToString:", CFSTR("session"));
          if (objc_msgSend(v19, "isEqualToString:", CFSTR("anon")))
            v25 |= 2u;
          if (objc_msgSend(v19, "isEqualToString:", CFSTR("ca1")))
            v26 = v25 | 4;
          else
            v26 = v25;
          objc_msgSend(v11, "assembleMetadataAt:withOptions:", v26, Current);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "objectForKey:", CFSTR("submission_info"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = v27;
          objc_msgSend(v27, "setValue:forKey:", v28, CFSTR("submission_info"));

          objc_msgSend(*(id *)(v13 + 3592), "dictionary");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("<metadata>"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            v31 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("<metadata>"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "numberWithBool:", objc_msgSend(v32, "BOOLValue"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, CFSTR("<metadata>"));

            v10 = v93;
          }
          if (-[NSArray count](v10->_internalWhitelist, "count"))
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v10->_internalWhitelist, CFSTR("<whitelist>"));
          v97 = v29;
          v103 = 0u;
          v104 = 0u;
          v101 = 0u;
          v102 = 0u;
          v21 = v23;
          v98 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
          if (v98)
          {
            v96 = *(_QWORD *)v102;
            v94 = v21;
            do
            {
              for (i = 0; i != v98; ++i)
              {
                if (*(_QWORD *)v102 != v96)
                  objc_enumerationMutation(v94);
                v35 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
                v36 = (void *)MEMORY[0x1D8250B74]();
                v100 = 0;
                v37 = v24;
                -[OSASubmitter locateLog:forRouting:usingConfig:options:error:](v10, "locateLog:forRouting:usingConfig:options:error:", v35, v24, v11, v97, &v100);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = v100;
                v40 = objc_retainAutorelease(v35);
                if (getxattr((const char *)objc_msgSend(v40, "UTF8String"), "DoNotSubmit", 0, 0, 0, 0) < 1)
                {
                  if (v38)
                  {
                    v41 = -[OSAStreamDeflater copyDeflatedDataFromStream:withCap:](v92, "copyDeflatedDataFromStream:withCap:", objc_msgSend(v38, "stream"), 10477568);
                    if (v41)
                    {
                      v42 = (void *)v41;
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                      {
                        v57 = objc_msgSend(v42, "length");
                        objc_msgSend(v38, "metaData");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412802;
                        *(_QWORD *)v112 = v40;
                        *(_WORD *)&v112[8] = 2048;
                        *(_QWORD *)&v112[10] = v57;
                        *(_WORD *)&v112[18] = 2112;
                        *(_QWORD *)&v112[20] = v58;
                        _os_log_debug_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "'%@' payload %ld, metadata: %@", buf, 0x20u);

                      }
                      v43 = (void *)objc_msgSend(v87, "mutableCopy");
                      objc_msgSend(v38, "metaData");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "addEntriesFromDictionary:", v44);

                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v42, "length"));
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "setValue:forKey:", v45, CFSTR("length"));

                      objc_msgSend(v43, "setValue:forKey:", CFSTR("deflate"), CFSTR("compression"));
                      v99 = 0;
                      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v43, 0, &v99);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      v90 = v99;
                      v91 = v46;
                      v47 = objc_msgSend(v46, "length");
                      v48 = objc_msgSend(v42, "length");
                      v49 = v86;
                      if (objc_msgSend(v86, "length")
                        && (unint64_t)(v47 + v48 + objc_msgSend(v86, "length") + 2) > 0x80000)
                      {
                        -[OSASubmitter processJob:forRouting:including:usingConfig:taskings:summarize:additionalRequestHeaders:](v93, "processJob:forRouting:including:usingConfig:taskings:summarize:additionalRequestHeaders:", v86, v37, v95, v85, v82, v88, v81);
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v84, "addObject:", v50);
                        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("complete"));
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        v89 = objc_msgSend(v51, "BOOLValue");

                        v49 = v86;
                      }
                      else
                      {
                        v89 = 1;
                      }
                      if (!objc_msgSend(v49, "length"))
                      {
                        objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("<preface>"));
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        -[OSASubmitter prefaceSubmission:withData:usingArchive:andHeaders:](v93, "prefaceSubmission:withData:usingArchive:andHeaders:", v49, v55, v92, v87);

                      }
                      objc_msgSend(v49, "appendData:", v91);
                      objc_msgSend(v49, "appendBytes:length:", "\n", 1);
                      objc_msgSend(v49, "appendData:", v42);
                      objc_msgSend(v49, "appendBytes:length:", "\n", 1);
                      objc_msgSend(v38, "closeFileStream");
                      objc_msgSend(v95, "addObject:", v38);

                      v11 = v85;
                      v10 = v93;
                      if ((v89 & 1) == 0)
                      {

                        objc_autoreleasePoolPop(v36);
                        v21 = v94;

                        v24 = v37;
                        goto LABEL_57;
                      }
                    }
                    else
                    {
                      if (-[OSAStreamDeflater capViolation](v92, "capViolation"))
                      {
                        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 67109378;
                          *(_DWORD *)v112 = 10485760;
                          *(_WORD *)&v112[4] = 2112;
                          *(_QWORD *)&v112[6] = v40;
                          _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Submission archive too big (> %u) for submission with file %@", buf, 0x12u);
                        }
                        AnalyticsSendEvent();
                      }
                      objc_msgSend(v38, "bugType");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v88, "_recordRetirement:reason:", v56, CFSTR("rejected-capviolation"));

                      objc_msgSend(v38, "retire:", "rejected-capviolation");
                    }
                  }
                  else if (objc_msgSend(v39, "code") == 2)
                  {
                    objc_msgSend(v39, "userInfo");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("bug_type"));
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "localizedDescription");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v88, "_recordRetirement:reason:", v53, v54);

                    v10 = v93;
                  }
                }
                else
                {
                  objc_msgSend(v95, "addObject:", v38);
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138543362;
                    *(_QWORD *)v112 = v40;
                    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Skipping DoNotSubmit tagged report at %{public}@", buf, 0xCu);
                  }
                }

                objc_autoreleasePoolPop(v36);
                v24 = v37;
              }
              v21 = v94;
              v98 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
            }
            while (v98);
          }

          -[OSASubmitter processJob:forRouting:including:usingConfig:taskings:summarize:additionalRequestHeaders:](v10, "processJob:forRouting:including:usingConfig:taskings:summarize:additionalRequestHeaders:", v86, v24, v95, v11, v82, v88, v81);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "addObject:", v59);
          objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("complete"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "BOOLValue");

          if ((v61 & 1) == 0)
          {
LABEL_57:
            v14 = v76;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              jobCount = v93->_jobCount;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v112 = jobCount;
              _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Submission aborted after %u jobs", buf, 8u);
            }

            v63 = 0;
            goto LABEL_61;
          }

          v14 = v76;
          v10 = v93;
          v13 = 0x1E0C99000;
          v16 = 0x1E0C99000;
          v19 = v24;
          v22 = v86;
        }

        v17 = v80 + 1;
      }
      while (v80 + 1 != v77);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v114, 16);
      v63 = 1;
      v77 = v62;
      if (v62)
        continue;
      break;
    }
  }
  else
  {
    v63 = 1;
  }
LABEL_61:

  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "logDomain");

  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v63)
      v67 = CFSTR("SUCCESS");
    else
      v67 = CFSTR("ABORTED");
    v68 = v93->_jobCount;
    v69 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v112 = v67;
    *(_WORD *)&v112[8] = 1024;
    *(_DWORD *)&v112[10] = v68;
    *(_WORD *)&v112[14] = 2048;
    *(double *)&v112[16] = v69 - Current;
    _os_log_impl(&dword_1D3A90000, v66, OS_LOG_TYPE_DEFAULT, "Submission Result: %{public}@ after %u job(s), elapsed time %.2f s", buf, 0x1Cu);
  }

  if ((_DWORD)v63)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("success"), CFSTR("result"));
  }
  else
  {
    v70 = (void *)MEMORY[0x1E0CB3940];
    responseError = v93->_responseError;
    if (responseError)
    {
      -[NSError localizedDescription](v93->_responseError, "localizedDescription");
      v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v72 = CFSTR("other");
    }
    objc_msgSend(v70, "stringWithFormat:", CFSTR("ABORTED - %@"), v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v73, CFSTR("result"));

    if (responseError)
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v63);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v74, CFSTR("complete"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v84, CFSTR("jobs"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v82, CFSTR("taskings"));

  return v14;
}

- (void)prepConfig:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D64EC8], "cleanupRetired:", a3);
}

- (id)locateLog:(id)a3 forRouting:(id)a4 usingConfig:(id)a5 options:(id)a6 error:(id *)a7
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = (objc_class *)MEMORY[0x1E0D64EC8];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend([v11 alloc], "initWithPath:forRouting:usingConfig:options:error:", v15, v14, v13, v12, a7);

  return v16;
}

- (id)applyTasking:(id)a3 taskId:(id)a4 usingConfig:(id)a5 fromBlob:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "isProxy"))
    objc_msgSend(MEMORY[0x1E0D64EE8], "proxyTasking:taskId:usingConfig:fromBlob:", v9, v10, v11, v12);
  else
    objc_msgSend(MEMORY[0x1E0D64EE8], "applyTasking:taskId:fromBlob:", v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("-1")) & 1) == 0)
  {
    v18[0] = CFSTR("action");
    v18[1] = CFSTR("routing");
    v19[0] = CFSTR("received");
    v19[1] = v9;
    v19[2] = v10;
    v18[2] = CFSTR("taskId");
    v18[3] = CFSTR("blob");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (objc_msgSend(v11, "isProxy"))
      objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("proxied"));
    AnalyticsSendEvent();

  }
  return v13;
}

- (id)processJob:(id)a3 forRouting:(id)a4 including:(id)a5 usingConfig:(id)a6 taskings:(id)a7 summarize:(id)a8 additionalRequestHeaders:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  OSASubmitter *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  BOOL v56;
  int v57;
  void *v58;
  OSASubmitter *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  double Current;
  double v80;
  int64_t responseCode;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  NSString *connectionType;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  OSASubmitter *v96;
  int64_t v97;
  _BOOL4 v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t k;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  NSDictionary *v110;
  uint64_t v111;
  void *v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t m;
  void *v117;
  int64_t v118;
  void *v119;
  void *v120;
  NSObject *v121;
  const char *v122;
  os_log_type_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  _BOOL4 allowUnsignedBlobs;
  NSData *v131;
  NSData *responseData;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  int v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  NSDictionary *responseHeaders;
  NSError *responseError;
  __CFString *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t n;
  void *v161;
  void *v162;
  int v163;
  _BOOL4 dryRun;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  int v173;
  int64_t v174;
  _BOOL4 v175;
  void *v176;
  id v177;
  void *v178;
  void *v179;
  void *v180;
  id v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  id obj;
  id v188;
  id v189;
  void *v190;
  id v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  id v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  _QWORD v214[3];
  _QWORD v215[3];
  _QWORD v216[9];
  _QWORD v217[9];
  _BYTE v218[128];
  _QWORD v219[6];
  _QWORD v220[6];
  uint64_t v221;
  void *v222;
  _BYTE v223[128];
  _QWORD v224[3];
  _QWORD v225[3];
  _BYTE v226[128];
  _QWORD v227[7];
  _QWORD v228[7];
  _QWORD v229[2];
  _QWORD v230[2];
  uint8_t v231[128];
  uint8_t buf[4];
  id v233;
  __int16 v234;
  _BYTE v235[18];
  _QWORD v236[7];
  _QWORD v237[7];
  uint64_t v238;
  void *v239;
  _BYTE v240[128];
  uint64_t v241;

  v241 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v188 = a8;
  v19 = a9;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v21 = v20;
  if (((objc_msgSend(v15, "isEqualToString:", CFSTR("da3")) & 1) != 0
     || (objc_msgSend(v15, "isEqualToString:", CFSTR("awd")) & 1) != 0
     || objc_msgSend(v15, "isEqualToString:", CFSTR("ca1")))
    && (objc_msgSend(v18, "objectForKeyedSubscript:", v15),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        !v22))
  {
    v24 = self;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("awd")) & 1) != 0)
      objc_msgSend(v17, "awdReporterKey");
    else
      objc_msgSend(v17, "crashReporterKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[OSASubmitter processJob:forRouting:including:usingConfig:taskings:summarize:additionalRequestHeaders:].cold.1((uint64_t)v15, (uint64_t)v23, v25, v26, v27, v28, v29, v30);
  }
  else
  {
    v23 = 0;
    v24 = self;
  }
  v183 = v18;
  v184 = v23;
  v186 = v14;
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("ca1")))
  {
    v31 = v19;
    v32 = (void *)objc_opt_new();
    v210 = 0u;
    v211 = 0u;
    v212 = 0u;
    v213 = 0u;
    v33 = v16;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v210, v240, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v211;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v211 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v210 + 1) + 8 * i), "filepath");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v38);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v210, v240, 16);
      }
      while (v35);
    }

    v39 = (void *)MEMORY[0x1E0D64ED8];
    v40 = *MEMORY[0x1E0D64F98];
    v238 = *MEMORY[0x1E0D64FA0];
    v239 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v239, &v238, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "recordEvent:with:", v40, v41);

    v18 = v183;
    v23 = v184;
    v19 = v31;
    v24 = self;
    v14 = v186;
  }
  v24->_responseCode = 0;
  if (!objc_msgSend(v14, "length")
    && (!v23 || !-[OSASubmitter taskingNeedsRefreshForRouting:at:](v24, "taskingNeedsRefreshForRouting:at:", v15, v21)))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "identifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v233 = v60;
      v234 = 2112;
      *(_QWORD *)v235 = v15;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "nothing to do for %@-%@", buf, 0x16u);

    }
    v215[0] = MEMORY[0x1E0C9AAB0];
    v214[0] = CFSTR("complete");
    v214[1] = CFSTR("logCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v61 = objc_claimAutoreleasedReturnValue();
    v214[2] = CFSTR("routing");
    v185 = (void *)v61;
    v215[1] = v61;
    v215[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v215, v214, 3);
    v192 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_126;
  }
  ++v24->_jobCount;
  v42 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v17, "identifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stringWithFormat:", CFSTR("job_%@-%u-%@"), v43, v24->_jobCount, v15);
  v185 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v17, "productVersion");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "releaseType");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringWithFormat:", CFSTR("%@-%@"), v45, v46);
  v47 = objc_claimAutoreleasedReturnValue();

  v237[0] = CFSTR("application/vnd.apple.ips");
  v236[0] = CFSTR("Content-Type");
  v236[1] = CFSTR("x-hardware-model");
  objc_msgSend(v17, "modelCode");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v237[1] = v48;
  v236[2] = CFSTR("x-os-version");
  objc_msgSend(v17, "buildVersion");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v237[2] = v49;
  v236[3] = CFSTR("x-os-train");
  objc_msgSend(v17, "osTrain");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v237[3] = v50;
  v236[4] = CFSTR("x-target-audience");
  objc_msgSend(v17, "targetAudience");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v237[4] = v51;
  v176 = (void *)v47;
  v237[5] = v47;
  v236[5] = CFSTR("x-product-release");
  v236[6] = CFSTR("x-routing");
  v237[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v237, v236, 7);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v52, "mutableCopy");

  objc_msgSend(v17, "currentTaskingIDByRouting");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectForKeyedSubscript:", v15);
  v55 = objc_claimAutoreleasedReturnValue();

  if (v184)
    v56 = v55 == 0;
  else
    v56 = 1;
  v57 = !v56;
  v173 = v57;
  if (v56)
  {
    objc_msgSend(v53, "setObject:forKeyedSubscript:", CFSTR("NO"), CFSTR("x-tasking-requested"));
    v59 = self;
    v58 = v53;
  }
  else
  {
    objc_msgSend(v53, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("x-tasking-requested"));
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v184, CFSTR("x-crashreporter-key"));
    v58 = v53;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v233 = v15;
      v234 = 2114;
      *(_QWORD *)v235 = v184;
      *(_WORD *)&v235[8] = 2114;
      *(_QWORD *)&v235[10] = v55;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Requesting tasking for routing %{public}@ using key %{public}@ with task_id %{public}@", buf, 0x20u);
    }
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v55, CFSTR("x-task-id"));
    v59 = self;
  }
  v62 = v186;
  v177 = v19;
  objc_msgSend(v58, "addEntriesFromDictionary:", v19);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v63 = objc_msgSend(v186, "length");
    v64 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 138412802;
    v233 = v185;
    v234 = 2048;
    *(_QWORD *)v235 = v63;
    *(_WORD *)&v235[8] = 2048;
    *(_QWORD *)&v235[10] = v64;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "'%@' posting content of %lu bytes from %lu logs", buf, 0x20u);
  }
  v179 = (void *)v55;
  v181 = v17;
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("ca1")))
  {
    v65 = v58;
    v66 = (void *)objc_opt_new();
    v206 = 0u;
    v207 = 0u;
    v208 = 0u;
    v209 = 0u;
    v67 = v16;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v206, v231, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v207;
      do
      {
        for (j = 0; j != v69; ++j)
        {
          if (*(_QWORD *)v207 != v70)
            objc_enumerationMutation(v67);
          objc_msgSend(*(id *)(*((_QWORD *)&v206 + 1) + 8 * j), "filepath");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addObject:", v72);

        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v206, v231, 16);
      }
      while (v69);
    }

    v73 = (void *)MEMORY[0x1E0D64ED8];
    v74 = *MEMORY[0x1E0D64F80];
    v75 = *MEMORY[0x1E0D64F90];
    v230[0] = v66;
    v76 = *MEMORY[0x1E0D64F88];
    v229[0] = v75;
    v229[1] = v76;
    v62 = v186;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v186, "length"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v230[1] = v77;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v230, v229, 2);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "recordEvent:with:", v74, v78);

    v17 = v181;
    v59 = self;
    v58 = v65;
  }
  Current = CFAbsoluteTimeGetCurrent();
  v178 = v58;
  -[OSASubmitter postContent:withHeaders:](v59, "postContent:withHeaders:", v62, v58);
  v80 = CFAbsoluteTimeGetCurrent() - Current;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    responseCode = v59->_responseCode;
    v82 = -[NSData length](v59->_responseData, "length");
    *(_DWORD *)buf = 138412802;
    v233 = v185;
    v234 = 1024;
    *(_DWORD *)v235 = responseCode;
    *(_WORD *)&v235[4] = 2048;
    *(_QWORD *)&v235[6] = v82;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "'%@' server responded %d with %lu-byte payload", buf, 0x1Cu);
  }
  objc_msgSend(v17, "modelCode");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "modelCode");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v83, "isEqualToString:", v85) ^ 1;

  v227[0] = CFSTR("response");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v59->_responseCode);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  connectionType = v59->_connectionType;
  v228[0] = v87;
  v228[1] = connectionType;
  v227[1] = CFSTR("connection");
  v227[2] = CFSTR("routing");
  v228[2] = v15;
  v227[3] = CFSTR("bytes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v62, "length"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v228[3] = v89;
  v227[4] = CFSTR("logs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v228[4] = v90;
  v227[5] = CFSTR("seconds");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v80);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v228[5] = v91;
  v227[6] = CFSTR("proxied");
  v92 = v16;
  v93 = v86;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v86);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v228[6] = v94;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v228, v227, 7);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  v96 = self;
  v180 = (void *)objc_opt_new();
  v97 = self->_responseCode;
  v98 = v97 == 200;
  if (v97 == 304)
    v98 = 1;
  v175 = v98;
  v189 = v15;
  v99 = v92;
  v182 = v92;
  v174 = self->_responseCode;
  if (v97 != 304 && v97 != 200)
  {
    v124 = (void *)MEMORY[0x1E0D64ED8];
    v125 = *MEMORY[0x1E0D64F68];
    v221 = *MEMORY[0x1E0D64F60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v222 = v126;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v222, &v221, 1);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "recordEvent:with:", v125, v127);

    v113 = 0x1E0D64000;
    v112 = v99;
    goto LABEL_100;
  }
  v204 = 0u;
  v205 = 0u;
  v202 = 0u;
  v203 = 0u;
  obj = v92;
  v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v202, v226, 16);
  if (v100)
  {
    v101 = v100;
    v102 = *(_QWORD *)v203;
    do
    {
      for (k = 0; k != v101; ++k)
      {
        if (*(_QWORD *)v203 != v102)
          objc_enumerationMutation(obj);
        v104 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * k);
        v224[0] = CFSTR("bugType");
        objc_msgSend(v104, "bugType");
        v105 = objc_claimAutoreleasedReturnValue();
        v106 = (void *)v105;
        v107 = (uint64_t)v189;
        if (v105)
          v107 = v105;
        v225[0] = v107;
        v224[1] = CFSTR("proxied");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v93);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v224[2] = CFSTR("logCount");
        v225[1] = v108;
        v225[2] = &unk_1E95522F8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v225, v224, 3);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

      }
      v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v202, v226, 16);
    }
    while (v101);
  }

  v200 = 0u;
  v201 = 0u;
  v198 = 0u;
  v199 = 0u;
  v96 = self;
  v110 = self->_responseHeaders;
  v111 = -[NSDictionary countByEnumeratingWithState:objects:count:](v110, "countByEnumeratingWithState:objects:count:", &v198, v223, 16);
  v112 = v92;
  v113 = 0x1E0D64000uLL;
  if (!v111)
    goto LABEL_98;
  v114 = v111;
  v115 = *(_QWORD *)v199;
  while (2)
  {
    for (m = 0; m != v114; ++m)
    {
      if (*(_QWORD *)v199 != v115)
        objc_enumerationMutation(v110);
      v117 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * m);
      if (!objc_msgSend(v117, "compare:options:", CFSTR("x-task-id"), 1))
      {
        if (v179)
          objc_msgSend(v180, "setObject:forKeyedSubscript:", v179, CFSTR("lastId"));
        v96 = self;
        v118 = self->_responseCode;
        v119 = v183;
        if (v118 == 304)
        {
          objc_msgSend(v180, "setObject:forKeyedSubscript:", CFSTR("affirmed"), CFSTR("action"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", v179, CFSTR("taskId"));
          objc_msgSend(v180, "removeObjectForKey:", CFSTR("lastId"));
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v233 = v189;
            v121 = MEMORY[0x1E0C81028];
            v122 = "device is already in the correct %@ investigation";
            v123 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_82;
          }
LABEL_97:
          objc_msgSend(v119, "setObject:forKeyedSubscript:", v180, v189);
          goto LABEL_98;
        }
        if (v118 != 200)
          goto LABEL_97;
        objc_msgSend(v183, "objectForKeyedSubscript:", v189);
        v120 = (void *)objc_claimAutoreleasedReturnValue();

        if (v120)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v233 = v189;
            v121 = MEMORY[0x1E0C81028];
            v122 = "Unexpected response data; already installed tasking blob of type %@ this session";
            v123 = OS_LOG_TYPE_INFO;
LABEL_82:
            _os_log_impl(&dword_1D3A90000, v121, v123, v122, buf, 0xCu);
            goto LABEL_97;
          }
          goto LABEL_97;
        }
        -[NSDictionary objectForKeyedSubscript:](self->_responseHeaders, "objectForKeyedSubscript:", v117);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v128, "length"))
        {
          objc_msgSend(v180, "setObject:forKeyedSubscript:", CFSTR("unchanged"), CFSTR("action"));
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v233 = v189;
            _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "no tasking id returned for %@", buf, 0xCu);
          }
          goto LABEL_96;
        }
        objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v129, "appleInternal"))
        {
          allowUnsignedBlobs = self->_allowUnsignedBlobs;

          if (allowUnsignedBlobs)
          {
            v131 = self->_responseData;
            goto LABEL_94;
          }
        }
        else
        {

        }
        if (-[NSData length](self->_responseData, "length"))
        {
          responseData = self->_responseData;
          v197 = 0;
          +[OSASubmitter extractAuthenticatedBlob:error:](OSASubmitter, "extractAuthenticatedBlob:error:", responseData, &v197);
          v131 = (NSData *)objc_claimAutoreleasedReturnValue();
          v133 = v197;
          v134 = v133;
          if (v133)
          {
            objc_msgSend(v133, "localizedDescription");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v180, "setObject:forKeyedSubscript:", v135, CFSTR("authenticationError"));

          }
          goto LABEL_95;
        }
        v131 = 0;
LABEL_94:
        v134 = 0;
LABEL_95:
        -[OSASubmitter applyTasking:taskId:usingConfig:fromBlob:](self, "applyTasking:taskId:usingConfig:fromBlob:", v189, v128, v181, v131);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "addEntriesFromDictionary:", v136);

        v119 = v183;
LABEL_96:

        goto LABEL_97;
      }
    }
    v114 = -[NSDictionary countByEnumeratingWithState:objects:count:](v110, "countByEnumeratingWithState:objects:count:", &v198, v223, 16);
    v96 = self;
    if (v114)
      continue;
    break;
  }
LABEL_98:

  v15 = v189;
  if (v173)
    -[OSASubmitter updateTaskingLastSuccessfulRequest:at:](v96, "updateTaskingLastSuccessfulRequest:at:", v189, v21);
LABEL_100:
  objc_msgSend(*(id *)(v113 + 3808), "sharedInstance");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend(v137, "appleInternal");

  if (v138)
  {
    objc_msgSend(*(id *)(v113 + 3808), "sharedInstance");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "pathDiagnostics");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "stringByAppendingPathComponent:", v185);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "stringByAppendingPathExtension:", CFSTR("ips"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v186, "writeToFile:atomically:", v142, 0);
    v219[0] = CFSTR("logs");
    objc_msgSend(v112, "valueForKey:", CFSTR("getFilenames"));
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v220[0] = v143;
    v220[1] = v178;
    v219[1] = CFSTR("postHeaders");
    v219[2] = CFSTR("response");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v96->_responseCode);
    v144 = objc_claimAutoreleasedReturnValue();
    v145 = (void *)v144;
    responseHeaders = (NSDictionary *)MEMORY[0x1E0C9AA70];
    responseError = v96->_responseError;
    if (v96->_responseHeaders)
      responseHeaders = v96->_responseHeaders;
    v220[2] = v144;
    v220[3] = responseHeaders;
    v219[3] = CFSTR("responseHeaders");
    v219[4] = CFSTR("responseError");
    if (responseError)
    {
      -[NSError localizedDescription](responseError, "localizedDescription");
      v148 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v148 = &stru_1E954D0B0;
    }
    v220[4] = v148;
    v219[5] = CFSTR("payloadLength");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSData length](v96->_responseData, "length"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v220[5] = v149;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v220, v219, 6);
    v150 = (void *)objc_claimAutoreleasedReturnValue();

    if (responseError)
    objc_msgSend(*(id *)(v113 + 3808), "sharedInstance");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "pathDiagnostics");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "stringByAppendingPathComponent:", v185);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "stringByAppendingPathExtension:", CFSTR("diagnostics"));
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "writeToFile:atomically:", v154, 1);

    v15 = v189;
    v112 = v182;
  }
  if (v174 == 304 || v174 == 200)
  {
    v195 = 0u;
    v196 = 0u;
    v193 = 0u;
    v194 = 0u;
    v155 = v112;
    v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v193, v218, 16);
    if (v156)
    {
      v157 = v156;
      LODWORD(v158) = 0;
      v159 = *(_QWORD *)v194;
      do
      {
        for (n = 0; n != v157; ++n)
        {
          if (*(_QWORD *)v194 != v159)
            objc_enumerationMutation(v155);
          v161 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * n);
          objc_msgSend(v161, "bugType");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          v163 = objc_msgSend(v162, "isEqualToString:", CFSTR("193"));

          dryRun = self->_dryRun;
          objc_msgSend(v161, "bugType");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          if (dryRun)
          {
            objc_msgSend(v188, "_recordRetirement:reason:", v165, CFSTR("pending"));

          }
          else
          {
            objc_msgSend(v188, "_recordRetirement:reason:", v165, CFSTR("submitted"));

            objc_msgSend(v161, "retire:", "submitted");
          }
          v158 = (v158 + v163);
        }
        v157 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v193, v218, 16);
      }
      while (v157);
    }
    else
    {
      v158 = 0;
    }

    v15 = v189;
  }
  else
  {
    v158 = 0;
  }
  v216[0] = CFSTR("complete");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v175);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v217[0] = v190;
  v217[1] = v15;
  v216[1] = CFSTR("routing");
  v216[2] = CFSTR("logCount");
  v16 = v182;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v182, "count"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v217[2] = v166;
  v216[3] = CFSTR("aggdCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v158);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v217[3] = v167;
  v216[4] = CFSTR("contentLength");
  v14 = v186;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v186, "length"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v217[4] = v168;
  v216[5] = CFSTR("response");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_responseCode);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v217[5] = v169;
  v216[6] = CFSTR("payloadLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSData length](self->_responseData, "length"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v217[6] = v170;
  v217[7] = v180;
  v216[7] = CFSTR("tasking");
  v216[8] = CFSTR("seconds");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v80);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v217[8] = v171;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v217, v216, 9);
  v192 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v182, "removeAllObjects");
  objc_msgSend(v186, "setLength:", 0);

  v17 = v181;
  v18 = v183;
  v23 = v184;
  v19 = v177;
LABEL_126:

  return v192;
}

- (BOOL)cheaterTaskingWithSets:(id)a3 usingConfig:(id)a4 resultsCallback:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v8 = (void (**)(id, void *))a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  -[OSASubmitter processSubmissionJobs:usingConfig:summarize:](self, "processSubmissionJobs:usingConfig:summarize:", v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v8[2](v8, v12);
  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("complete"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)submitLogsUsingPolicy:(id)a3 resultsCallback:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  unint64_t v8;
  void *v9;
  int v10;
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
  void *v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  __CFString *v40;
  __CFString *v41;
  NSObject *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  char v48;
  void *v49;
  NSObject *v50;
  void *v51;
  int v52;
  const __CFString *v53;
  __CFString *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t k;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t m;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  NSDictionary *launchInfo;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  unint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v110;
  void *v111;
  id obj;
  void (**v113)(id, void *, void *);
  uint64_t v114;
  uint64_t v115;
  void *v116;
  __CFString *v117;
  __CFString *v118;
  uint64_t v119;
  void *v120;
  void *context;
  const __CFString *v122;
  OSASubmitter *v123;
  __CFString *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  char v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _QWORD v150[2];
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[2];
  _QWORD v154[2];
  _QWORD v155[2];
  _BYTE v156[128];
  _BYTE v157[128];
  uint64_t v158;
  uint64_t v159;
  uint8_t v160[128];
  uint8_t buf[4];
  const __CFString *v162;
  __int16 v163;
  const __CFString *v164;
  _BYTE v165[128];
  void *v166;
  _BYTE v167[128];
  uint64_t v168;
  _QWORD v169[4];

  v169[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v116 = (void *)objc_opt_new();
  v111 = (void *)objc_opt_new();
  v8 = 0x1E0D64000uLL;
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "appleInternal");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathDiagnostics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0D64EC8];
      v168 = *MEMORY[0x1E0D64FF0];
      v169[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v169, &v168, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "iterateLogsWithOptions:usingBlock:", v14, &__block_literal_global);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Not clearing past submission artifacts because path is not available.", buf, 2u);
    }

  }
  v15 = (void *)MEMORY[0x1E0D64EC8];
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pathSubmission");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scanProxies:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D64EC8], "isDataVaultEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pathSubmissionDataVault");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0D64EC8], "scanProxies:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v22;
    }
    else
    {
      v23 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v23)
        -[OSASubmitter submitLogsUsingPolicy:resultsCallback:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
    }

  }
  if ((objc_msgSend(v6, "ignoreProxies") & 1) != 0)
  {
    v31 = &unk_1E95525F0;
  }
  else
  {
    objc_msgSend(&unk_1E9552608, "arrayByAddingObjectsFromArray:", v18);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  obj = v31;
  v125 = v6;
  v113 = v7;
  v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v167, 16);
  v110 = v18;
  if (!v115)
  {
    LOBYTE(v47) = 1;
    goto LABEL_96;
  }
  v114 = *(_QWORD *)v147;
  v126 = *MEMORY[0x1E0D64F78];
  v127 = *MEMORY[0x1E0D64F70];
  v123 = self;
  do
  {
    v32 = 0;
    do
    {
      if (*(_QWORD *)v147 != v114)
        objc_enumerationMutation(obj);
      v119 = v32;
      v33 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * v32);
      context = (void *)MEMORY[0x1D8250B74]();
      if (objc_msgSend(v33, "length"))
      {
        objc_msgSend(v33, "lastPathComponent");
        v122 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        v166 = v33;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v166, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[OSASubmitter primarySubmissionPaths](self, "primarySubmissionPaths");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = CFSTR("Primary");
      }
      v144 = 0u;
      v145 = 0u;
      v142 = 0u;
      v143 = 0u;
      v128 = v34;
      v35 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v142, v165, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v143;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v143 != v37)
              objc_enumerationMutation(v128);
            -[OSASubmitter prepConfig:](self, "prepConfig:", *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * i));
          }
          v36 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v142, v165, 16);
        }
        while (v36);
      }

      if (objc_msgSend(v33, "length"))
      {
        v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0D64ED0]), "initFromPath:", v33);
      }
      else
      {
        objc_msgSend(*(id *)(v8 + 3808), "sharedInstance");
        v39 = objc_claimAutoreleasedReturnValue();
      }
      v40 = (__CFString *)v39;
      v41 = (__CFString *)v122;
      v42 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v162 = v122;
        _os_log_impl(&dword_1D3A90000, v42, OS_LOG_TYPE_DEFAULT, "----- '%{public}@' -----", buf, 0xCu);
      }
      if (v40)
      {
        v118 = v40;
        objc_msgSend(v6, "buildSubmissionTemplateForConfig:", v40);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (__CFString *)objc_msgSend(v43, "copy");

        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v162 = v118;
          v163 = 2112;
          v164 = v44;
          _os_log_debug_impl(&dword_1D3A90000, v42, OS_LOG_TYPE_DEBUG, "config: %@\npolicy: %@", buf, 0x16u);
        }
        v45 = (void *)MEMORY[0x1E0D64EC8];
        objc_msgSend(v6, "scanOptions");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = v44;
        if (objc_msgSend(v45, "scanLogs:from:options:", v44, v128, v46))
        {

          goto LABEL_45;
        }
        v48 = objc_msgSend(v6, "hasTasking");

        if ((v48 & 1) != 0)
        {
LABEL_45:
          objc_msgSend(*(id *)(v8 + 3808), "sharedInstance");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "logDomain");

          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(v8 + 3808), "sharedInstance");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "optInApple");
            *(_DWORD *)buf = 138543618;
            v53 = CFSTR("OUT");
            if (v52)
              v53 = CFSTR("IN");
            v162 = v122;
            v163 = 2112;
            v164 = v53;
            _os_log_impl(&dword_1D3A90000, v50, OS_LOG_TYPE_DEFAULT, "Initiating submission for '%{public}@' optIn: %@", buf, 0x16u);

          }
          v140 = 0u;
          v141 = 0u;
          v138 = 0u;
          v139 = 0u;
          v54 = v44;
          v55 = -[__CFString countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v138, v160, 16);
          if (v55)
          {
            v56 = v55;
            v57 = *(_QWORD *)v139;
            do
            {
              for (j = 0; j != v56; ++j)
              {
                if (*(_QWORD *)v139 != v57)
                  objc_enumerationMutation(v54);
                v59 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * j);
                objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("routing"));
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("ca1"));

                if (v61)
                {
                  v62 = (void *)MEMORY[0x1E0D64ED8];
                  v158 = v126;
                  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("logs"));
                  v63 = objc_claimAutoreleasedReturnValue();
                  v64 = (void *)v63;
                  v65 = MEMORY[0x1E0C9AA60];
                  if (v63)
                    v65 = v63;
                  v159 = v65;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "recordEvent:with:", v127, v66);

                }
              }
              v56 = -[__CFString countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v138, v160, 16);
            }
            while (v56);
          }

          -[OSASubmitter processSubmissionJobs:usingConfig:summarize:](self, "processSubmissionJobs:usingConfig:summarize:", v54, v118, v111);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("complete"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v68, "BOOLValue");

          v120 = v67;
          if (!self->_dryRun)
          {
            v136 = 0u;
            v137 = 0u;
            v134 = 0u;
            v135 = 0u;
            objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("jobs"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v134, v157, 16);
            if (v70)
            {
              v71 = v70;
              v72 = *(_QWORD *)v135;
              do
              {
                for (k = 0; k != v71; ++k)
                {
                  if (*(_QWORD *)v135 != v72)
                    objc_enumerationMutation(v69);
                  v74 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * k);
                  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("<inactive>"));
                  v75 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v75)
                  {
                    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("routing"));
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v125, "registerRouting:result:", v76, v47);

                  }
                }
                v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v134, v157, 16);
              }
              while (v71);
            }
            goto LABEL_86;
          }
        }
        else
        {
          v77 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v162 = v122;
            _os_log_impl(&dword_1D3A90000, v77, OS_LOG_TYPE_DEFAULT, "No logs/tasking found for submission from '%{public}@'", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString identifier](v118, "identifier");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v79, CFSTR("name"));

          objc_msgSend(v78, "setObject:forKeyedSubscript:", CFSTR("empty"), CFSTR("result"));
          v69 = (void *)objc_opt_new();
          v120 = v78;
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v69, CFSTR("jobs"));
          v132 = 0u;
          v133 = 0u;
          v130 = 0u;
          v131 = 0u;
          v124 = v44;
          v80 = -[__CFString countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v130, v156, 16);
          if (v80)
          {
            v81 = v80;
            v82 = *(_QWORD *)v131;
            do
            {
              for (m = 0; m != v81; ++m)
              {
                if (*(_QWORD *)v131 != v82)
                  objc_enumerationMutation(v124);
                v84 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * m);
                objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("routing"));
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("<inactive>"));
                v86 = (void *)objc_claimAutoreleasedReturnValue();

                if (v86)
                {
                  v152[0] = CFSTR("<inactive>");
                  objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("<inactive>"));
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  v152[1] = CFSTR("routing");
                  v153[0] = v87;
                  v153[1] = v85;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v153, v152, 2);
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "addObject:", v88);

                }
                else
                {
                  if (!v123->_dryRun)
                    objc_msgSend(v125, "registerRouting:result:", v85, 1);
                  v154[0] = CFSTR("logCount");
                  v154[1] = CFSTR("routing");
                  v155[0] = &unk_1E9552310;
                  v155[1] = v85;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v155, v154, 2);
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "addObject:", v87);
                }

              }
              v81 = -[__CFString countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v130, v156, 16);
            }
            while (v81);
          }

          LODWORD(v47) = 1;
          self = v123;
LABEL_86:

        }
        v6 = v125;
        v7 = v113;
        v8 = 0x1E0D64000;
        v41 = (__CFString *)v122;
        v40 = v118;

        goto LABEL_88;
      }
      v150[0] = CFSTR("name");
      v150[1] = CFSTR("result");
      v151[0] = v122;
      v151[1] = CFSTR("skipped - no metadata for proxy device");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, v150, 2);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v162 = v122;
        _os_log_impl(&dword_1D3A90000, v42, OS_LOG_TYPE_DEFAULT, "No submission parameters found from '%{public}@'", buf, 0xCu);
      }
      LODWORD(v47) = 1;
LABEL_88:
      objc_msgSend(v116, "addObject:", v120);
      if (v7)
        v7[2](v7, v120, v40);

      objc_autoreleasePoolPop(context);
      if (!(_DWORD)v47)
        goto LABEL_96;
      v32 = v119 + 1;
    }
    while (v119 + 1 != v115);
    v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v167, 16);
  }
  while (v115);
  LOBYTE(v47) = 1;
LABEL_96:

  if (!self->_dryRun)
    objc_msgSend(v6, "persist");
  objc_msgSend(*(id *)(v8 + 3808), "sharedInstance");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "appleInternal");

  if (v90)
  {
    launchInfo = self->_launchInfo;
    if (launchInfo)
      v92 = -[NSDictionary mutableCopy](launchInfo, "mutableCopy");
    else
      v92 = objc_opt_new();
    v93 = (void *)v92;
    v129 = v47;
    -[NSDictionary objectForKeyedSubscript:](self->_launchInfo, "objectForKeyedSubscript:", CFSTR("time"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v94)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setObject:forKeyedSubscript:", v94, CFSTR("time"));
    }
    objc_msgSend(*(id *)(v8 + 3808), "sharedInstance");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "pathDiagnostics");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = (void *)MEMORY[0x1E0CB3940];
    OSANSDateFormat();
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "stringWithFormat:", CFSTR("submission-%@"), v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "stringByAppendingPathComponent:", v99);
    v100 = v8;
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "stringByAppendingPathExtension:", CFSTR("results"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v93, "setObject:forKeyedSubscript:", v116, CFSTR("submissions"));
    objc_msgSend(v93, "setObject:forKeyedSubscript:", v111, CFSTR("retirement-summary"));
    -[OSASubmitter submissionURL](self, "submissionURL");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "absoluteString");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setObject:forKeyedSubscript:", v104, CFSTR("url"));

    objc_msgSend(v93, "setObject:forKeyedSubscript:", self->_connectionType, CFSTR("connection"));
    objc_msgSend(*(id *)(v100 + 3808), "sharedInstance");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "buildVersion");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setObject:forKeyedSubscript:", v106, CFSTR("version"));

    if ((objc_msgSend(v93, "writeToFile:atomically:", v102, 1) & 1) != 0)
    {
      v6 = v125;
      v7 = v113;
      LOBYTE(v47) = v129;
    }
    else
    {
      v6 = v125;
      v7 = v113;
      LOBYTE(v47) = v129;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "failed to write results file, saving as txt", buf, 2u);
      }
      objc_msgSend(v102, "stringByAppendingPathExtension:", CFSTR("txt"));
      v107 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v93, "description");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "writeToFile:atomically:encoding:error:", v107, 1, 4, 0);

      v102 = (void *)v107;
    }

    v18 = v110;
  }

  return v47;
}

void __54__OSASubmitter_submitLogsUsingPolicy_resultsCallback___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v2 = a2;
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ips")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("diagnostics")))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtURL:error:", v2, 0);
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("results")))
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "fileModificationDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceNow");
      v9 = fabs(v8);

      if (v9 > 604800.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeItemAtURL:error:", v2, 0);

      }
    }
  }

LABEL_5:
}

- (BOOL)taskingNeedsRefreshForRouting:(id)a3 at:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  -[OSASubmitter taskingLastSuccessfulRequest](self, "taskingLastSuccessfulRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

    }
    else
    {
      v12 = 0.0;
    }

  }
  else
  {
    v12 = 0.0;
  }
  v13 = a4 - v12;
  if (v13 >= 43200.0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[OSASubmitter taskingNeedsRefreshForRouting:at:].cold.1((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);

  return v13 >= 43200.0;
}

+ (id)submissionPathsWithHomeDirectory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D64EC8], "isDataVaultEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathSubmissionDataVault");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v3, "addObject:", v5);
    }
    else
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v6)
        -[OSASubmitter submitLogsUsingPolicy:resultsCallback:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }

  }
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pathSubmission");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(v3, "addObject:", v15);
  }
  else
  {
    v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v16)
      +[OSASubmitter submissionPathsWithHomeDirectory:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)primarySubmissionPaths
{
  void *v2;
  void *v3;
  void *v4;

  -[OSASubmitter launchInfo](self, "launchInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("legacy-homePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASubmitter submissionPathsWithHomeDirectory:](OSASubmitter, "submissionPathsWithHomeDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)extractAuthenticatedBlob:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t ApplePinned;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CFErrorRef v16;
  CFErrorRef error;
  SecTrustRef trust;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  ApplePinned = SecPolicyCreateApplePinned();
  if (ApplePinned)
  {
    v7 = (const void *)ApplePinned;
    trust = 0;
    v20 = 0;
    v8 = SecCMSVerifyCopyDataAndAttributes();
    if ((_DWORD)v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not extract signature from blob, error %d"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (__CFString *)v9;
      if (a4)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v23 = *MEMORY[0x1E0CB2D50];
        v24 = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("OSASubmitter"), 1, v12);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v10;
        _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      v13 = 0;
    }
    else
    {
      error = 0;
      if (SecTrustEvaluateWithError(trust, &error))
      {
        v13 = v20;
      }
      else
      {
        v16 = error;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = (const __CFString *)v16;
          _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Signature on blob is not trusted, %@", buf, 0xCu);
        }
        if (a4)
          *a4 = objc_retainAutorelease(v16);

        v13 = 0;
      }
      CFRelease(trust);
    }
    CFRelease(v7);
  }
  else
  {
    if (a4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D50];
      v22 = CFSTR("Unable to create pinned policy");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("OSASubmitter"), 2, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = CFSTR("Unable to create pinned policy");
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

- (void)updateTaskingLastSuccessfulRequest:(id)a3 at:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  -[OSASubmitter taskingLastSuccessfulRequest](self, "taskingLastSuccessfulRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v6);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("taskingLastSuccessfulRequest"));

}

- (id)taskingLastSuccessfulRequest
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("taskingLastSuccessfulRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)allowUnsignedBlobs
{
  return self->_allowUnsignedBlobs;
}

- (void)setAllowUnsignedBlobs:(BOOL)a3
{
  self->_allowUnsignedBlobs = a3;
}

- (NSArray)internalWhitelist
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInternalWhitelist:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)connectionType
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConnectionType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSDictionary)launchInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLaunchInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchInfo, 0);
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_internalWhitelist, 0);
  objc_storeStrong((id *)&self->_responseError, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
}

- (void)getAdditionalRequestHeaders
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = a1;
  _os_log_debug_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Submission jobs will include additional request headers %{public}@", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)processJob:(uint64_t)a3 forRouting:(uint64_t)a4 including:(uint64_t)a5 usingConfig:(uint64_t)a6 taskings:(uint64_t)a7 summarize:(uint64_t)a8 additionalRequestHeaders:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "%@ tasking key is %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)submitLogsUsingPolicy:(uint64_t)a3 resultsCallback:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "Failed to get the data vault submission path.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)taskingNeedsRefreshForRouting:(uint64_t)a3 at:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "%@ tasking needs refresh for routing (time elapsed: %f)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)submissionPathsWithHomeDirectory:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "Failed to get the root submission path.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
