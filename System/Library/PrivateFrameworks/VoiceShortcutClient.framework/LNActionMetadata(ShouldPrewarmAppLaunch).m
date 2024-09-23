@implementation LNActionMetadata(ShouldPrewarmAppLaunch)

- (uint64_t)wf_shouldPrewarmAppLaunchWithAction:()ShouldPrewarmAppLaunch
{
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(a1, "openAppWhenRun") & 1) == 0)
  {
    getWFVoiceShortcutClientLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[LNActionMetadata(ShouldPrewarmAppLaunch) wf_shouldPrewarmAppLaunchWithAction:]";
      v6 = "%s openAppWhenRun is false";
      goto LABEL_7;
    }
LABEL_31:
    v19 = 0;
    goto LABEL_32;
  }
  if ((objc_msgSend(a1, "outputFlags") & 6) != 0)
  {
    getWFVoiceShortcutClientLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[LNActionMetadata(ShouldPrewarmAppLaunch) wf_shouldPrewarmAppLaunchWithAction:]";
      v6 = "%s Intent returns a snippet or dialog";
LABEL_7:
      _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  if (!v4)
  {
    objc_msgSend(a1, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "if_objectsPassingTest:", &__block_literal_global_9597);
    v5 = objc_claimAutoreleasedReturnValue();

    if ((unint64_t)-[NSObject count](v5, "count") >= 2)
    {
      getWFVoiceShortcutClientLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[LNActionMetadata(ShouldPrewarmAppLaunch) wf_shouldPrewarmAppLaunchWithAction:]";
        v21 = "%s App Shortcut with multiple required parameters with missing value";
        goto LABEL_29;
      }
LABEL_30:

      goto LABEL_31;
    }

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a1, "parameters");
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    v23 = *MEMORY[0x1E0D43AD8];
LABEL_13:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
      v13 = objc_msgSend(v12, "isOptional", v23);
      if (v4 && (v13 & 1) == 0)
      {
        objc_msgSend(v4, "parameters");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __80__LNActionMetadata_ShouldPrewarmAppLaunch__wf_shouldPrewarmAppLaunchWithAction___block_invoke_32;
        v24[3] = &unk_1E5FC6B58;
        v24[4] = v12;
        objc_msgSend(v14, "if_firstObjectPassingTest:", v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(v12, "typeSpecificMetadata");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            getWFVoiceShortcutClientLogObject();
            v20 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              goto LABEL_30;
            *(_DWORD *)buf = 136315138;
            v31 = "-[LNActionMetadata(ShouldPrewarmAppLaunch) wf_shouldPrewarmAppLaunchWithAction:]";
            v21 = "%s Required parameter is missing a value";
LABEL_29:
            _os_log_impl(&dword_1AF681000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
            goto LABEL_30;
          }
        }

      }
      if (v9 == ++v11)
      {
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        v19 = 1;
        if (v9)
          goto LABEL_13;
        goto LABEL_32;
      }
    }
  }
  v19 = 1;
LABEL_32:

  return v19;
}

@end
