@implementation DNDEventBehaviorResolutionService(Notifications)

- (id)nc_behaviorForNotificationRequest:()Notifications
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D1D6D8]);
  objc_msgSend(v4, "notificationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  objc_msgSend(v4, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleIdentifier:", v7);

  objc_msgSend(v4, "threadIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setThreadIdentifier:", v8);

  objc_msgSend(v4, "filterCriteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilterCriteria:", v9);

  DNDContactHandleFromNotificationRequest(v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSender:", v10);
  objc_msgSend(v4, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "overridesQuietMode") & 1) != 0)
  {

LABEL_4:
    v13 = 2;
LABEL_5:
    objc_msgSend(v5, "setUrgency:", v13);
    goto LABEL_6;
  }
  v12 = objc_msgSend(v4, "interruptionLevel");

  if (v12 == 3)
    goto LABEL_4;
  if (objc_msgSend(v4, "interruptionLevel") == 2)
  {
    v13 = 1;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v4, "content");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "communicationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "notifyRecipientAnyway");

  if (v16)
    objc_msgSend(v5, "setNotifyAnyway:", 1);
  objc_msgSend(v4, "content");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(a1, "nc_dndClientEventTypeFromNotificationRequestType:", v18);

  objc_msgSend(v5, "setType:", v19);
  objc_msgSend(v4, "content");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v21);

  objc_msgSend(v4, "content");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "subtitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubtitle:", v23);

  objc_msgSend(v4, "content");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "message");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBody:", v25);

  objc_msgSend(a1, "resolveBehaviorForEventDetails:error:", v5, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (BOOL)nc_shouldSuppressNotificationRequest:()Notifications
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _BOOL8 v9;

  v4 = a3;
  objc_msgSend(v4, "eventBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "nc_behaviorForNotificationRequest:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "interruptionSuppression") != 0;
  return v9;
}

- (uint64_t)nc_dndClientEventTypeFromNotificationRequestType:()Notifications
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEC868]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEC878]) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEC8A0]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEC890]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEC838]) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEC850]);
  }

  return v4;
}

@end
