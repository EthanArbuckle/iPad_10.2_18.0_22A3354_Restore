@implementation WBSAutomationUtilities

+ (int64_t)canCreateSessionWithExistingSession:(id)a3 retryBehavior:(int64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  int64_t v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isPendingTermination"))
    {
      v7 = WBS_LOG_CHANNEL_PREFIXWebDriver();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (a4)
      {
        if (v8)
        {
          v9 = v7;
          objc_msgSend(v6, "sessionIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543362;
          v23 = v10;
          v11 = "Cannot fulfill new session request while existing session (%{public}@) is pending termination and retryi"
                "ng is not allowed.";
LABEL_12:
          _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v22, 0xCu);

          goto LABEL_13;
        }
        goto LABEL_13;
      }
      if (v8)
      {
        v19 = v7;
        objc_msgSend(v6, "sessionIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v20;
        _os_log_impl(&dword_1A3D90000, v19, OS_LOG_TYPE_DEFAULT, "Cannot immediatley fulfill new session request while existing session (%{public}@) is pending termination. Should retry.", (uint8_t *)&v22, 0xCu);

      }
      v13 = 2;
    }
    else
    {
      v14 = objc_msgSend(v6, "isPaired");
      v15 = WBS_LOG_CHANNEL_PREFIXWebDriver();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          v9 = v15;
          objc_msgSend(v6, "sessionIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543362;
          v23 = v10;
          v11 = "Cannot fulfill new session request while existing session (%{public}@) is still paired.";
          goto LABEL_12;
        }
LABEL_13:
        v13 = 3;
        goto LABEL_20;
      }
      if (v16)
      {
        v17 = v15;
        objc_msgSend(v6, "sessionIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v18;
        _os_log_impl(&dword_1A3D90000, v17, OS_LOG_TYPE_DEFAULT, "Existing session (%{public}@) is not paired; Allowing session creation after termination of existing session.",
          (uint8_t *)&v22,
          0xCu);

      }
      v13 = 1;
    }
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXWebDriver();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_DEFAULT, "No existing session; Allowing immediate session creation.",
        (uint8_t *)&v22,
        2u);
    }
    v13 = 0;
  }
LABEL_20:

  return v13;
}

@end
