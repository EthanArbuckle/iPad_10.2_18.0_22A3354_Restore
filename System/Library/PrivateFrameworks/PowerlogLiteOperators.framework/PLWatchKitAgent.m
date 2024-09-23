@implementation PLWatchKitAgent

+ (void)load
{
  objc_msgSend(MEMORY[0x1E0D7FF90], "registerOperator:", objc_opt_class());
}

+ (id)entryEventPointDefinitions
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  const __CFString *v22;
  _QWORD v23[3];

  v23[1] = *MEMORY[0x1E0C80C00];
  v22 = CFSTR("WatchKitTransport");
  v20[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v18[0] = *MEMORY[0x1E0D80318];
  v18[1] = v2;
  v19[0] = &unk_1E8653430;
  v19[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E0D802F0];
  v16[0] = CFSTR("action");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v16[1] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  v16[2] = CFSTR("length");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  v16[3] = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)initOperatorDependancies
{
  id v3;
  PLXPCListenerOperatorComposition *v4;
  PLXPCListenerOperatorComposition *xpcHandler;
  _QWORD v6[5];

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    v3 = objc_alloc(MEMORY[0x1E0D80090]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__PLWatchKitAgent_initOperatorDependancies__block_invoke;
    v6[3] = &unk_1E8578610;
    v6[4] = self;
    v4 = (PLXPCListenerOperatorComposition *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D070, v6);
    xpcHandler = self->_xpcHandler;
    self->_xpcHandler = v4;

  }
}

void __43__PLWatchKitAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[5];
  _QWORD block[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  void *v60;
  uint8_t buf[4];
  uint64_t v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SP-transport")))
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v8;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    if (v43)
    {
      v40 = v8;
      v41 = v7;
      v42 = *(_QWORD *)v56;
      v47 = *MEMORY[0x1E0D80390];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v56 != v42)
            objc_enumerationMutation(obj);
          v45 = v9;
          objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v46 = v10;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
          if (v11)
          {
            v12 = v11;
            v48 = *(_QWORD *)v52;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v52 != v48)
                  objc_enumerationMutation(v46);
                v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v13);
                +[PLOperator entryKeyForType:andName:](PLWatchKitAgent, "entryKeyForType:andName:", v47, CFSTR("WatchKitTransport"));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v15);
                objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("action"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("action"));

                objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("application"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("bundleID"));

                objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("length"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("length"));

                objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("count"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("count"));

                objc_msgSend(*(id *)(a1 + 32), "logEntry:", v16);
                if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
                {
                  v21 = objc_opt_class();
                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = __43__PLWatchKitAgent_initOperatorDependancies__block_invoke_2;
                  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  block[4] = v21;
                  if (qword_1ED886E90 != -1)
                    dispatch_once(&qword_1ED886E90, block);
                  if (_MergedGlobals_101)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entry %@"), v16);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = (void *)MEMORY[0x1E0D7FF98];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLWatchKitAgent.m");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "lastPathComponent");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWatchKitAgent initOperatorDependancies]_block_invoke");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 77);

                    PLLogCommon();
                    v27 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v62 = (uint64_t)v22;
                      _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                  }
                }
                if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
                {
                  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("bundleID"));
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v28)
                  {
                    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(a1 + 32), "appNameForWatchAppExtension:", v28);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v59 = v30;
                    v60 = &unk_1E8653440;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "entryDate");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 32, v31, v32);

                  }
                }

                ++v13;
              }
              while (v12 != v13);
              v12 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
            }
            while (v12);
          }

          v9 = v45 + 1;
        }
        while (v45 + 1 != v43);
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      }
      while (v43);
      v8 = v40;
      v7 = v41;
    }
LABEL_35:

    goto LABEL_36;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v33 = objc_opt_class();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __43__PLWatchKitAgent_initOperatorDependancies__block_invoke_40;
    v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v49[4] = v33;
    if (qword_1ED886E98 != -1)
      dispatch_once(&qword_1ED886E98, v49);
    if (byte_1ED886E89)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("New event: %@ = %@"), v7, v8);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLWatchKitAgent.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWatchKitAgent initOperatorDependancies]_block_invoke_2");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      obj = (id)v34;
      objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 93);

      PLLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v34;
        _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_35;
    }
  }
LABEL_36:

}

uint64_t __43__PLWatchKitAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_101 = result;
  return result;
}

uint64_t __43__PLWatchKitAgent_initOperatorDependancies__block_invoke_40(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886E89 = result;
  return result;
}

- (id)appNameForWatchAppExtension:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasSuffix:", CFSTR(".watchapp")))
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".watchapp"), &stru_1E8587D00);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (PLXPCListenerOperatorComposition)xpcHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setXpcHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcHandler, 0);
}

@end
