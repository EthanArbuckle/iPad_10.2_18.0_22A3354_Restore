@implementation WFScreenTimeHelper

+ (void)isContentDestinationAllowedByScreenTimeSettings:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v24;
  void (**v25)(id, _QWORD, void *);
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t v35[128];
  _BYTE buf[24];
  void *v37;
  uint64_t *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v8 = (void *)getWFUserSettingsClass_softClass;
    v34 = getWFUserSettingsClass_softClass;
    if (!getWFUserSettingsClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getWFUserSettingsClass_block_invoke;
      v37 = &unk_1E7AF9520;
      v38 = &v31;
      __getWFUserSettingsClass_block_invoke((uint64_t)buf);
      v8 = (void *)v32[3];
    }
    v25 = v6;
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v31, 8);
    v10 = [v9 alloc];
    NSUserName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v10, "initWithUserName:", v11);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v7, "hostnames");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@"), v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "URLWithString:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            if ((objc_msgSend(v26, "contentFilterListsAllowURL:", v19) & 1) == 0)
            {
              getWFSecurityLogObject();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "+[WFScreenTimeHelper isContentDestinationAllowedByScreenTimeSettings:completionHandler:]";
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v7;
                _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_INFO, "%s Content destination %@ is being prohibited by Screen Time.", buf, 0x16u);
              }

              objc_msgSend((id)objc_opt_class(), "restrictedURLErrorWithHostname:", v16);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25[2](v25, 0, v24);

              goto LABEL_25;
            }
          }
          else
          {
            getWFSecurityLogObject();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "+[WFScreenTimeHelper isContentDestinationAllowedByScreenTimeSettings:completionHandler:]";
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v16;
              _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_ERROR, "%s Could not verify Screen Time configuration of invalid hostname %@", buf, 0x16u);
            }

          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v13)
          continue;
        break;
      }
    }

    getWFSecurityLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[WFScreenTimeHelper isContentDestinationAllowedByScreenTimeSettings:completionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_DEBUG, "%s Screen Time is allowing URL content destination: %@", buf, 0x16u);
    }

    v25[2](v25, 1, 0);
LABEL_25:

    v6 = v25;
  }
  else
  {

    v6[2](v6, 1, 0);
  }

}

+ (id)restrictedURLErrorWithHostname:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v12[0] = *MEMORY[0x1E0CB2D50];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  WFLocalizedString(CFSTR("The action could not run because “%@” was blocked by the Content Restrictions on this device."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v6, v5, v12[0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v7;
  v12[1] = *MEMORY[0x1E0CB2D80];
  WFLocalizedString(CFSTR("You can change this in the Screen Time settings."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("WFScreenTimeHelperErrorDomain"), 1000, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
