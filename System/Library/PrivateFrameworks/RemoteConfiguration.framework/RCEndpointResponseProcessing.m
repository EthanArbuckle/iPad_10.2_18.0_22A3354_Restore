@implementation RCEndpointResponseProcessing

+ (void)parseEndpointResponse:(id)a3 configurationSettings:(id)a4 maxAge:(id)a5 loggingPrefix:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "rc_gzipInflate");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (id)v17;
  else
    v19 = v12;
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "rc_dictionaryFromData:error:", v19, &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v23;
  if (v21)
  {
    RCSharedLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v25 = v15;
      v26 = 2114;
      v27 = v21;
      _os_log_impl(&dword_1A1FB5000, v22, OS_LOG_TYPE_ERROR, "%{public}@ parseEndpointResponse - JSON parsing failed with error: %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(a1, "parseEndpointResponseDict:parsingError:configurationSettings:maxAge:loggingPrefix:completion:", v20, v21, v13, v14, v15, v16);

}

+ (void)parseEndpointResponseDict:(id)a3 parsingError:(id)a4 configurationSettings:(id)a5 maxAge:(id)a6 loggingPrefix:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  RCConfigurationResource *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id obj;
  id v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *context;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[7];
  _QWORD v82[6];
  uint8_t buf[4];
  id v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v69 = a6;
  v65 = a7;
  v17 = a8;
  v18 = v17;
  v70 = v14;
  if (v14)
  {
    RCJSONDictionaryValue(v14, CFSTR("errorWrapper"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    RCJSONArrayValue(v19, CFSTR("errors"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __125__RCEndpointResponseProcessing_parseEndpointResponseDict_parsingError_configurationSettings_maxAge_loggingPrefix_completion___block_invoke_2;
      v81[3] = &unk_1E470ECC8;
      v81[5] = v18;
      v81[6] = a1;
      v81[4] = v20;
      __125__RCEndpointResponseProcessing_parseEndpointResponseDict_parsingError_configurationSettings_maxAge_loggingPrefix_completion___block_invoke_2((uint64_t)v81);
    }
    else
    {
      v57 = v20;
      v58 = v19;
      v59 = v18;
      v60 = v15;
      RCJSONDictionaryValue(v14, CFSTR("userInfo"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      RCJSONArrayValue(v21, CFSTR("treatmentIds"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v21;
      RCJSONArrayValue(v21, CFSTR("segmentSetIds"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      objc_msgSend(v16, "requestInfos");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
      if (v71)
      {
        v67 = *(_QWORD *)v78;
        v62 = v22;
        v63 = v16;
        v61 = v23;
        do
        {
          for (i = 0; i != v71; ++i)
          {
            if (*(_QWORD *)v78 != v67)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
            v26 = MEMORY[0x1A8581434]();
            objc_msgSend(v25, "responseKey");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            RCJSONDictionaryValue(v70, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            RCJSONDictionaryValue(v28, CFSTR("configuration"));
            v29 = objc_claimAutoreleasedReturnValue();
            context = (void *)v26;
            if (v29)
            {
              objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v29, 0, 0);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v30 = 0;
            }
            v31 = objc_alloc_init(RCConfigurationResource);
            v74 = v25;
            objc_msgSend(v25, "requestCacheKey");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[RCConfigurationResource setRequestKey:](v31, "setRequestKey:", v32);

            v72 = v30;
            objc_msgSend(v30, "rc_gzipDeflate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[RCConfigurationResource setGzippedConfigurationData:](v31, "setGzippedConfigurationData:", v33);

            objc_msgSend(v16, "debugOverrides");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = (void *)v29;
            +[RCUserSegmentationConfiguration userSegmentationConfigurationWithConfigDict:environment:](RCUserSegmentationConfiguration, "userSegmentationConfigurationWithConfigDict:environment:", v29, objc_msgSend(v34, "debugEnvironment"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[RCConfigurationResource setUserSegmentationConfiguration:](v31, "setUserSegmentationConfiguration:", v35);

            -[RCConfigurationResource setTreatmentIDs:](v31, "setTreatmentIDs:", v22);
            -[RCConfigurationResource setSegmentSetIDs:](v31, "setSegmentSetIDs:", v23);
            objc_msgSend(v16, "userID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[RCConfigurationResource setUserID:](v31, "setUserID:", v36);

            objc_msgSend(v16, "storefrontID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[RCConfigurationResource setStorefrontID:](v31, "setStorefrontID:", v37);

            RCJSONStringValue(v28, CFSTR("id"), 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[RCConfigurationResource setConfigurationID:](v31, "setConfigurationID:", v38);

            RCJSONStringValue(v28, CFSTR("changeTag"), 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[RCConfigurationResource setContentHash:](v31, "setContentHash:", v39);

            v75 = v28;
            RCJSONStringValue(v28, CFSTR("lastModified"), 0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[RCConfigurationResource setLastModifiedString:](v31, "setLastModifiedString:", v40);

            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[RCConfigurationResource setLastFetchedDate:](v31, "setLastFetchedDate:", v41);

            -[RCConfigurationResource setEndpointMaxAge:](v31, "setEndpointMaxAge:", v69);
            RCSharedLog();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              -[RCConfigurationResource configurationID](v31, "configurationID");
              v66 = i;
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[RCConfigurationResource lastModifiedString](v31, "lastModifiedString");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[RCConfigurationResource lastFetchedDate](v31, "lastFetchedDate");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[RCConfigurationResource endpointMaxAge](v31, "endpointMaxAge");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[RCConfigurationResource treatmentIDs](v31, "treatmentIDs");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "rc_description");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[RCConfigurationResource segmentSetIDs](v31, "segmentSetIDs");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "rc_description");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544898;
              v84 = v65;
              v85 = 2114;
              v86 = v43;
              v87 = 2114;
              v88 = v44;
              v89 = 2114;
              v90 = v45;
              v91 = 2112;
              v92 = v46;
              v93 = 2114;
              v94 = v48;
              v95 = 2114;
              v96 = v50;
              _os_log_impl(&dword_1A1FB5000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ endpoint: received configuration with configurationID: %{public}@ lastModified: %{public}@ lastFetched: %{public}@ maxAge: %@ treatmentIDs: %{public}@ segmentSetIDs: %{public}@", buf, 0x48u);

              v16 = v63;
              v22 = v62;

              i = v66;
              v23 = v61;

            }
            objc_msgSend(v16, "debugOverrides");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "enableExtraLogs");

            if (v52)
            {
              RCSharedLog();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v72, 4);
                *(_DWORD *)buf = 138543618;
                v84 = v65;
                v85 = 2112;
                v86 = v54;
                _os_log_impl(&dword_1A1FB5000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ Endpoint JSON response: %@", buf, 0x16u);

              }
            }
            objc_msgSend(v74, "requestCacheKey");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v31, v55);

            objc_autoreleasePoolPop(context);
          }
          v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
        }
        while (v71);
      }

      v18 = v59;
      (*((void (**)(void *, void *, _QWORD))v59 + 2))(v59, v68, 0);

      v15 = v60;
      v20 = v57;
      v19 = v58;
    }

  }
  else
  {
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __125__RCEndpointResponseProcessing_parseEndpointResponseDict_parsingError_configurationSettings_maxAge_loggingPrefix_completion___block_invoke;
    v82[3] = &unk_1E470DEC8;
    v82[4] = v15;
    v82[5] = v17;
    __125__RCEndpointResponseProcessing_parseEndpointResponseDict_parsingError_configurationSettings_maxAge_loggingPrefix_completion___block_invoke((uint64_t)v82);
  }

}

void __125__RCEndpointResponseProcessing_parseEndpointResponseDict_parsingError_configurationSettings_maxAge_loggingPrefix_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "rc_parsingError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __125__RCEndpointResponseProcessing_parseEndpointResponseDict_parsingError_configurationSettings_maxAge_loggingPrefix_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 48), "_configurationErrorForErrorDicts:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)_configurationErrorForErrorDicts:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "rc_arrayByTransformingWithBlock:", &__block_literal_global_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "rc_endpointErrorWithUnderlyingEndpointErrors:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

RCEndpointError *__65__RCEndpointResponseProcessing__configurationErrorForErrorDicts___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[RCEndpointError endpointErrorWithDictionary:](RCEndpointError, "endpointErrorWithDictionary:", a2);
}

@end
