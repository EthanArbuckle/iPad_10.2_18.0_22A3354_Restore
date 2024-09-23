@implementation NCNotificationRequest(ATXUserNotificationAdditions)

- (id)atxUserNotification
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;

  objc_msgSend(a1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CF91D8]);
    objc_msgSend(a1, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v2 = (void *)objc_msgSend(v3, "initWithUUID:timestamp:", v4);

    objc_msgSend(a1, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNotificationID:", v7);

    objc_msgSend(a1, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("recordDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRecordDate:", v9);

    objc_msgSend(a1, "content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTitle:", v11);

    objc_msgSend(a1, "content");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subtitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSubtitle:", v13);

    objc_msgSend(a1, "content");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "message");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBody:", v15);

    objc_msgSend(a1, "sectionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBundleID:", v16);

    objc_msgSend(a1, "sectionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSectionID:", v17);

    objc_msgSend(a1, "uniqueThreadIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setThreadID:", v18);

    objc_msgSend(a1, "_communicationContactIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setContactIDs:", v19);

    objc_msgSend(a1, "content");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0CEC878];
    if (objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CEC878]))
    {
      objc_msgSend(v2, "setIsMessage:", 1);
    }
    else
    {
      objc_msgSend(a1, "content");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contentType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setIsMessage:", objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0CEC868]));

    }
    objc_msgSend(a1, "content");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contentType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setIsGroupMessage:", objc_msgSend(v26, "isEqualToString:", v22));

    objc_msgSend(v2, "setUrgency:", objc_msgSend(a1, "_atxUrgencyFromInterruptionLevel:", objc_msgSend(a1, "interruptionLevel")));
    objc_msgSend(v2, "setAttachmentType:", objc_msgSend(a1, "_atxAttachmentType"));
    objc_msgSend(a1, "relevanceScore");
    objc_msgSend(v2, "setAppSpecifiedScore:", v27);
    objc_msgSend(v2, "setIsDeterminedUrgentByModel:", objc_msgSend(a1, "isHighlight"));
  }
  return v2;
}

- (uint64_t)_atxUrgencyFromInterruptionLevel:()ATXUserNotificationAdditions
{
  if (a3 >= 4)
    return 4;
  else
    return 3 - a3;
}

- (id)_communicationContactIdentifiers
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "content");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "communicationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cnContactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "addObject:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)_atxAttachmentType
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "userNotification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = UNNotificationAttachmentFamilyFromTypeIdentifier();

    if ((unint64_t)(v7 - 1) > 2)
      v8 = 4;
    else
      v8 = qword_1CFD91C70[v7 - 1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
