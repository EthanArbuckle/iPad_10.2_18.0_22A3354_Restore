@implementation NSUserActivity(TelephonyUtilities)

+ (id)makeActivityWithIntent:()TelephonyUtilities dialRequestAttachment:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[16];
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CA5920];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "_initWithIntent:", v7);

  v9 = (void *)MEMORY[0x1E0CA5920];
  objc_msgSend(v8, "activityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "_isActivityTypeAllowedForDialRequest:", v10);

  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v18;
  if (v13)
  {
    TUDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[NSUserActivity(TelephonyUtilities) makeActivityWithIntent:dialRequestAttachment:].cold.2();
LABEL_11:

    goto LABEL_12;
  }
  if ((v11 & 1) == 0)
  {
    TUDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[NSUserActivity(TelephonyUtilities) makeActivityWithIntent:dialRequestAttachment:].cold.1(v8, v14);
    goto LABEL_11;
  }
  if (v12)
  {
    TUDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "Attaching TUDialRequest to UserActivity", v17, 2u);
    }

    v19 = CFSTR("dialRequest");
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInfo:", v14);
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

+ (id)makeActivityWithIntent:()TelephonyUtilities joinRequestAttachment:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[16];
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CA5920];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "_initWithIntent:", v7);

  v9 = (void *)MEMORY[0x1E0CA5920];
  objc_msgSend(v8, "activityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "_isActivityTypeAllowedForJoinRequest:", v10);

  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v18;
  if (v13)
  {
    TUDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[NSUserActivity(TelephonyUtilities) makeActivityWithIntent:joinRequestAttachment:].cold.2();
LABEL_11:

    goto LABEL_12;
  }
  if ((v11 & 1) == 0)
  {
    TUDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[NSUserActivity(TelephonyUtilities) makeActivityWithIntent:joinRequestAttachment:].cold.1(v8, v14);
    goto LABEL_11;
  }
  if (v12)
  {
    TUDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "Attaching TUJoinConversationRequest to UserActivity", v17, 2u);
    }

    v19 = CFSTR("joinRequest");
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInfo:", v14);
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

- (id)dialRequestAttachment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[16];

  v2 = (void *)MEMORY[0x1E0CA5920];
  objc_msgSend(a1, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "_isActivityTypeAllowedForDialRequest:", v3);

  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v2)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Unarchiving TUDialRequest from UserActivity", buf, 2u);
    }

    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v10)
    {
      TUDefaultLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[NSUserActivity(TelephonyUtilities) dialRequestAttachment].cold.1();

    }
  }

  return v7;
}

- (id)joinRequestAttachment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[16];

  v2 = (void *)MEMORY[0x1E0CA5920];
  objc_msgSend(a1, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "_isActivityTypeAllowedForJoinRequest:", v3);

  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("joinRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v2)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Unarchiving TUJoinConversationRequest from UserActivity", buf, 2u);
    }

    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v10)
    {
      TUDefaultLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[NSUserActivity(TelephonyUtilities) joinRequestAttachment].cold.1();

    }
  }

  return v7;
}

- (id)tu_dynamicIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_internalUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dynamicIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "_internalUserActivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dynamicIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (uint64_t)_isActivityTypeAllowedForDialRequest:()TelephonyUtilities
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("INStartCallIntent"));
}

+ (uint64_t)_isActivityTypeAllowedForJoinRequest:()TelephonyUtilities
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INStartCallIntent")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INJoinCallIntent"));

  return v4;
}

+ (void)makeActivityWithIntent:()TelephonyUtilities dialRequestAttachment:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, a2, v4, "Trying to attach TUDialRequest to a UserActivity with an unsupported activityType: %@", v5);

  OUTLINED_FUNCTION_3();
}

+ (void)makeActivityWithIntent:()TelephonyUtilities dialRequestAttachment:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, v0, v1, "Encountered an error while serializing TUDialRequest: %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)makeActivityWithIntent:()TelephonyUtilities joinRequestAttachment:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, a2, v4, "Trying to attach TUJoinConversationRequest to a UserActivity with an unsupported activityType: %@", v5);

  OUTLINED_FUNCTION_3();
}

+ (void)makeActivityWithIntent:()TelephonyUtilities joinRequestAttachment:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, v0, v1, "Encountered an error while serializing TUJoinConversationRequest: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)dialRequestAttachment
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, v0, v1, "Error unarchiving TUDialRequest: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)joinRequestAttachment
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19A50D000, v0, v1, "Error unarchiving TUJoinConversationRequest: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
