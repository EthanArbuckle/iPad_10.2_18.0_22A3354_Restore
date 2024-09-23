@implementation NCNotificationRequest

- (BOOL)isCollapsibleWithNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationRequest sectionIdentifier](self, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (NCNotificationRequest)initWithNotificationRequest:(id)a3
{
  id v4;
  NCNotificationRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *sectionIdentifier;
  void *v9;
  uint64_t v10;
  NSString *notificationIdentifier;
  void *v12;
  uint64_t v13;
  NSString *threadIdentifier;
  void *v15;
  uint64_t v16;
  NSString *categoryIdentifier;
  void *v18;
  uint64_t v19;
  NSSet *subSectionIdentifiers;
  void *v21;
  uint64_t v22;
  NSString *highestPrioritySubSectionIdentifier;
  void *v24;
  uint64_t v25;
  NSArray *intentIdentifiers;
  void *v27;
  uint64_t v28;
  NSArray *peopleIdentifiers;
  void *v30;
  uint64_t v31;
  NSString *parentSectionIdentifier;
  void *v33;
  uint64_t v34;
  DNDClientEventBehavior *eventBehavior;
  void *v36;
  uint64_t v37;
  NSDate *timestamp;
  void *v39;
  uint64_t v40;
  NSSet *requestDestinations;
  void *v42;
  uint64_t v43;
  NCNotificationContent *content;
  void *v45;
  uint64_t v46;
  NCNotificationOptions *options;
  void *v48;
  uint64_t v49;
  NCNotificationAlertOptions *alertOptions;
  void *v51;
  uint64_t v52;
  NSDictionary *context;
  void *v54;
  uint64_t v55;
  NSSet *settingsSections;
  void *v57;
  uint64_t v58;
  NCNotificationSound *sound;
  uint64_t v60;
  NCNotificationAction *cancelAction;
  uint64_t v62;
  NCNotificationAction *clearAction;
  uint64_t v64;
  NCNotificationAction *closeAction;
  uint64_t v66;
  NCNotificationAction *defaultAction;
  uint64_t v68;
  NCNotificationAction *silenceAction;
  uint64_t v70;
  NCNotificationAction *inlineAction;
  void *v72;
  uint64_t v73;
  NSDictionary *supplementaryActions;
  uint64_t v75;
  UNNotification *userNotification;
  void *v77;
  uint64_t v78;
  NSDictionary *sourceInfo;
  uint64_t v80;
  NSUUID *uuid;
  float v82;
  uint64_t v83;
  NSString *filterCriteria;

  v4 = a3;
  v5 = -[NCNotificationRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "sectionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    sectionIdentifier = v5->_sectionIdentifier;
    v5->_sectionIdentifier = (NSString *)v7;

    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    notificationIdentifier = v5->_notificationIdentifier;
    v5->_notificationIdentifier = (NSString *)v10;

    objc_msgSend(v4, "threadIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    threadIdentifier = v5->_threadIdentifier;
    v5->_threadIdentifier = (NSString *)v13;

    objc_msgSend(v4, "categoryIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    categoryIdentifier = v5->_categoryIdentifier;
    v5->_categoryIdentifier = (NSString *)v16;

    objc_msgSend(v4, "subSectionIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    subSectionIdentifiers = v5->_subSectionIdentifiers;
    v5->_subSectionIdentifiers = (NSSet *)v19;

    objc_msgSend(v4, "highestPrioritySubSectionIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    highestPrioritySubSectionIdentifier = v5->_highestPrioritySubSectionIdentifier;
    v5->_highestPrioritySubSectionIdentifier = (NSString *)v22;

    objc_msgSend(v4, "intentIdentifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    intentIdentifiers = v5->_intentIdentifiers;
    v5->_intentIdentifiers = (NSArray *)v25;

    objc_msgSend(v4, "peopleIdentifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    peopleIdentifiers = v5->_peopleIdentifiers;
    v5->_peopleIdentifiers = (NSArray *)v28;

    objc_msgSend(v4, "parentSectionIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    parentSectionIdentifier = v5->_parentSectionIdentifier;
    v5->_parentSectionIdentifier = (NSString *)v31;

    v5->_threadIdentifierUnique = objc_msgSend(v4, "isUniqueThreadIdentifier");
    objc_msgSend(v4, "eventBehavior");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copy");
    eventBehavior = v5->_eventBehavior;
    v5->_eventBehavior = (DNDClientEventBehavior *)v34;

    v5->_isHighlight = objc_msgSend(v4, "isHighlight");
    objc_msgSend(v4, "timestamp");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copy");
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v37;

    objc_msgSend(v4, "requestDestinations");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    requestDestinations = v5->_requestDestinations;
    v5->_requestDestinations = (NSSet *)v40;

    objc_msgSend(v4, "content");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copy");
    content = v5->_content;
    v5->_content = (NCNotificationContent *)v43;

    objc_msgSend(v4, "options");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "copy");
    options = v5->_options;
    v5->_options = (NCNotificationOptions *)v46;

    objc_msgSend(v4, "alertOptions");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "copy");
    alertOptions = v5->_alertOptions;
    v5->_alertOptions = (NCNotificationAlertOptions *)v49;

    objc_msgSend(v4, "context");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "copy");
    context = v5->_context;
    v5->_context = (NSDictionary *)v52;

    objc_msgSend(v4, "settingsSections");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "copy");
    settingsSections = v5->_settingsSections;
    v5->_settingsSections = (NSSet *)v55;

    objc_msgSend(v4, "sound");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "copy");
    sound = v5->_sound;
    v5->_sound = (NCNotificationSound *)v58;

    objc_msgSend(v4, "cancelAction");
    v60 = objc_claimAutoreleasedReturnValue();
    cancelAction = v5->_cancelAction;
    v5->_cancelAction = (NCNotificationAction *)v60;

    objc_msgSend(v4, "clearAction");
    v62 = objc_claimAutoreleasedReturnValue();
    clearAction = v5->_clearAction;
    v5->_clearAction = (NCNotificationAction *)v62;

    objc_msgSend(v4, "closeAction");
    v64 = objc_claimAutoreleasedReturnValue();
    closeAction = v5->_closeAction;
    v5->_closeAction = (NCNotificationAction *)v64;

    objc_msgSend(v4, "defaultAction");
    v66 = objc_claimAutoreleasedReturnValue();
    defaultAction = v5->_defaultAction;
    v5->_defaultAction = (NCNotificationAction *)v66;

    objc_msgSend(v4, "silenceAction");
    v68 = objc_claimAutoreleasedReturnValue();
    silenceAction = v5->_silenceAction;
    v5->_silenceAction = (NCNotificationAction *)v68;

    objc_msgSend(v4, "inlineAction");
    v70 = objc_claimAutoreleasedReturnValue();
    inlineAction = v5->_inlineAction;
    v5->_inlineAction = (NCNotificationAction *)v70;

    objc_msgSend(v4, "supplementaryActions");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "copy");
    supplementaryActions = v5->_supplementaryActions;
    v5->_supplementaryActions = (NSDictionary *)v73;

    objc_msgSend(v4, "userNotification");
    v75 = objc_claimAutoreleasedReturnValue();
    userNotification = v5->_userNotification;
    v5->_userNotification = (UNNotification *)v75;

    v5->_isCollapsedNotification = objc_msgSend(v4, "isCollapsedNotification");
    v5->_collapsedNotificationsCount = objc_msgSend(v4, "collapsedNotificationsCount");
    objc_msgSend(v4, "sourceInfo");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "copy");
    sourceInfo = v5->_sourceInfo;
    v5->_sourceInfo = (NSDictionary *)v78;

    v5->_criticalAlert = objc_msgSend(v4, "isCriticalAlert");
    v5->_interruptionLevel = objc_msgSend(v4, "interruptionLevel");
    objc_msgSend(v4, "uuid");
    v80 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v80;

    objc_msgSend(v4, "relevanceScore");
    v5->_relevanceScore = v82;
    objc_msgSend(v4, "filterCriteria");
    v83 = objc_claimAutoreleasedReturnValue();
    filterCriteria = v5->_filterCriteria;
    v5->_filterCriteria = (NSString *)v83;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  unint64_t v53;
  int v54;
  unint64_t v55;
  void *v56;
  void *v57;
  int v58;
  float v59;
  float v60;
  float v61;
  void *v62;
  void *v63;
  char v64;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
LABEL_29:
      v64 = 0;
      goto LABEL_30;
    }
  }
  v5 = v4;
  if (!v5)
    goto LABEL_29;
  -[NCNotificationRequest sectionIdentifier](self, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NCIsEqual(v6, v7);

  if (!v8)
    goto LABEL_29;
  -[NCNotificationRequest notificationIdentifier](self, "notificationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = NCIsEqual(v9, v10);

  if (!v11)
    goto LABEL_29;
  -[NCNotificationRequest threadIdentifier](self, "threadIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = NCIsEqual(v12, v13);

  if (!v14)
    goto LABEL_29;
  -[NCNotificationRequest categoryIdentifier](self, "categoryIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = NCIsEqual(v15, v16);

  if (!v17)
    goto LABEL_29;
  -[NCNotificationRequest subSectionIdentifiers](self, "subSectionIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subSectionIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = NCIsEqualToSet(v18, v19);

  if (!v20)
    goto LABEL_29;
  -[NCNotificationRequest highestPrioritySubSectionIdentifier](self, "highestPrioritySubSectionIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "highestPrioritySubSectionIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = NCIsEqual(v21, v22);

  if (!v23)
    goto LABEL_29;
  -[NCNotificationRequest intentIdentifiers](self, "intentIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intentIdentifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = NCIsEqualToArray(v24, v25);

  if (!v26)
    goto LABEL_29;
  -[NCNotificationRequest peopleIdentifiers](self, "peopleIdentifiers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peopleIdentifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = NCIsEqualToArray(v27, v28);

  if (!v29)
    goto LABEL_29;
  -[NCNotificationRequest parentSectionIdentifier](self, "parentSectionIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentSectionIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = NCIsEqual(v30, v31);

  if (!v32)
    goto LABEL_29;
  v33 = -[NCNotificationRequest isUniqueThreadIdentifier](self, "isUniqueThreadIdentifier");
  if (v33 != objc_msgSend(v5, "isUniqueThreadIdentifier"))
    goto LABEL_29;
  -[NCNotificationRequest eventBehavior](self, "eventBehavior");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventBehavior");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34 != v35)
    goto LABEL_29;
  v36 = -[NCNotificationRequest isHighlight](self, "isHighlight");
  if (v36 != objc_msgSend(v5, "isHighlight"))
    goto LABEL_29;
  -[NCNotificationRequest timestamp](self, "timestamp");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = NCIsEqual(v37, v38);

  if (!v39)
    goto LABEL_29;
  -[NCNotificationRequest content](self, "content");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "content");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = NCIsEqual(v40, v41);

  if (!v42)
    goto LABEL_29;
  -[NCNotificationRequest context](self, "context");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = NCIsEqual(v43, v44);

  if (!v45)
    goto LABEL_29;
  -[NCNotificationRequest settingsSections](self, "settingsSections");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settingsSections");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = NCIsEqual(v46, v47);

  if (!v48)
    goto LABEL_29;
  -[NCNotificationRequest sound](self, "sound");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sound");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = NCIsEqual(v49, v50);

  if (!v51)
    goto LABEL_29;
  v52 = -[NCNotificationRequest isCollapsedNotification](self, "isCollapsedNotification");
  if (v52 != objc_msgSend(v5, "isCollapsedNotification"))
    goto LABEL_29;
  v53 = -[NCNotificationRequest collapsedNotificationsCount](self, "collapsedNotificationsCount");
  if (v53 != objc_msgSend(v5, "collapsedNotificationsCount"))
    goto LABEL_29;
  v54 = -[NCNotificationRequest isCriticalAlert](self, "isCriticalAlert");
  if (v54 != objc_msgSend(v5, "isCriticalAlert"))
    goto LABEL_29;
  v55 = -[NCNotificationRequest interruptionLevel](self, "interruptionLevel");
  if (v55 != objc_msgSend(v5, "interruptionLevel"))
    goto LABEL_29;
  -[NCNotificationRequest uuid](self, "uuid");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = NCIsEqual(v56, v57);

  if (!v58)
    goto LABEL_29;
  -[NCNotificationRequest relevanceScore](self, "relevanceScore");
  v60 = v59;
  objc_msgSend(v5, "relevanceScore");
  if (v60 != v61)
    goto LABEL_29;
  -[NCNotificationRequest filterCriteria](self, "filterCriteria");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterCriteria");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = NCIsEqual(v62, v63);

LABEL_30:
  return v64;
}

- (BOOL)matchesRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[NCNotificationRequest notificationIdentifier](self, "notificationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (NCIsEqual(v5, v6))
  {
    -[NCNotificationRequest threadIdentifier](self, "threadIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "threadIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (NCIsEqual(v7, v8))
    {
      -[NCNotificationRequest sectionIdentifier](self, "sectionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sectionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = NCIsEqual(v9, v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)matchesThreadForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[NCNotificationRequest threadIdentifier](self, "threadIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (NCIsEqual(v5, v6))
  {
    -[NCNotificationRequest sectionIdentifier](self, "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = NCIsEqual(v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)topLevelSectionIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NCNotificationRequest parentSectionIdentifier](self, "parentSectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NCNotificationRequest sectionIdentifier](self, "sectionIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)uniqueThreadIdentifier
{
  void *v3;

  if (-[NCNotificationRequest isUniqueThreadIdentifier](self, "isUniqueThreadIdentifier"))
  {
    -[NCNotificationRequest threadIdentifier](self, "threadIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  void *v19;
  uint64_t v20;
  NSUInteger v21;
  unint64_t v22;

  v3 = -[NSString hash](self->_sectionIdentifier, "hash");
  v4 = -[NSString hash](self->_notificationIdentifier, "hash") + v3;
  v5 = -[NSString hash](self->_threadIdentifier, "hash");
  v6 = v4 + v5 + -[NSString hash](self->_categoryIdentifier, "hash");
  v7 = -[NSSet hash](self->_subSectionIdentifiers, "hash");
  v8 = v7 + -[NSString hash](self->_highestPrioritySubSectionIdentifier, "hash");
  v9 = v6 + v8 + -[NSArray hash](self->_intentIdentifiers, "hash");
  v10 = -[NSArray hash](self->_peopleIdentifiers, "hash");
  v11 = v10 + -[NSString hash](self->_parentSectionIdentifier, "hash");
  v12 = v11 + -[NSDate hash](self->_timestamp, "hash");
  v13 = v9 + v12 + -[NCNotificationContent hash](self->_content, "hash");
  v14 = -[NSDictionary hash](self->_context, "hash");
  v15 = v14 + -[NSSet hash](self->_settingsSections, "hash");
  v16 = v15 + -[NCNotificationSound hash](self->_sound, "hash") + self->_interruptionLevel;
  v17 = v13 + v16 + -[NSUUID hash](self->_uuid, "hash");
  *(float *)&v18 = self->_relevanceScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  v21 = v20 + -[NSString hash](self->_filterCriteria, "hash");
  v22 = v17 + v21 + -[DNDClientEventBehavior hash](self->_eventBehavior, "hash") + self->_isHighlight;

  return v22;
}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NCNotificationRequest initWithNotificationRequest:]([NCMutableNotificationRequest alloc], "initWithNotificationRequest:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  NCNotificationRequest *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__NCNotificationRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_24D270158;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __63__NCNotificationRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  float v79;
  id v80;
  void *v81;
  id v82;
  id v83;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("sectionId"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "threadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("threadId"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "notificationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("notificationId"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "categoryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v11, "appendObject:withName:", v12, CFSTR("categoryId"));

  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subSectionIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendArraySection:withName:skipIfEmpty:", v16, CFSTR("subSectionIds"), 1);

  v17 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "highestPrioritySubSectionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "appendObject:withName:", v18, CFSTR("highestPrioritySubSectionId"));

  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "intentIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendArraySection:withName:skipIfEmpty:", v21, CFSTR("intentIds"), 1);

  v22 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "peopleIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendArraySection:withName:skipIfEmpty:", v23, CFSTR("peopleIds"), 1);

  v24 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "parentSectionIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v24, "appendObject:withName:skipIfNil:", v25, CFSTR("parentSectionId"), 1);

  v27 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUniqueThreadIdentifier"), CFSTR("isUniqueThreadIdentifier"));
  v28 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "eventBehavior");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v28, "appendObject:withName:skipIfNil:", v29, CFSTR("eventBehavior"), 1);

  v31 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isHighlight"), CFSTR("isHighlight"));
  v32 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timestamp");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "description");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (id)objc_msgSend(v32, "appendObject:withName:", v34, CFSTR("timestamp"));

  v36 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "requestDestinations");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "allObjects");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "appendArraySection:withName:skipIfEmpty:", v38, CFSTR("requestDestinations"), 0);

  v39 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "content");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)objc_msgSend(v39, "appendObject:withName:", v40, CFSTR("content"));

  v42 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "options");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (id)objc_msgSend(v42, "appendObject:withName:", v43, CFSTR("options"));

  v45 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alertOptions");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (id)objc_msgSend(v45, "appendObject:withName:", v46, CFSTR("alertOptions"));

  v48 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sound");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (id)objc_msgSend(v48, "appendObject:withName:", v49, CFSTR("sound"));

  v51 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isCollapsedNotification"), CFSTR("isCollapsedNotification"));
  v52 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "collapsedNotificationsCount"), CFSTR("collapsedNotificationsCount"));
  v53 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cancelAction");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (id)objc_msgSend(v53, "appendObject:withName:", v54, CFSTR("cancelAction"));

  v56 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clearAction");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (id)objc_msgSend(v56, "appendObject:withName:", v57, CFSTR("clearAction"));

  v59 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "closeAction");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (id)objc_msgSend(v59, "appendObject:withName:", v60, CFSTR("closeAction"));

  v62 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "defaultAction");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (id)objc_msgSend(v62, "appendObject:withName:", v63, CFSTR("defaultAction"));

  v65 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "silenceAction");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (id)objc_msgSend(v65, "appendObject:withName:", v66, CFSTR("silenceAction"));

  v68 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "inlineAction");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (id)objc_msgSend(v68, "appendObject:withName:", v69, CFSTR("inlineAction"));

  v71 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "supplementaryActions");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "appendDictionarySection:withName:skipIfEmpty:", v72, CFSTR("supplementaryActions"), 0);

  v73 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isCriticalAlert"), CFSTR("isCriticalAlert"));
  v74 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "interruptionLevel"), CFSTR("interruptionLevel"));
  v75 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (id)objc_msgSend(v75, "appendObject:withName:", v76, CFSTR("uuid"));

  v78 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "relevanceScore");
  v80 = (id)objc_msgSend(v78, "appendFloat:withName:", CFSTR("relevanceScore"), v79);
  v81 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "filterCriteria");
  v83 = (id)objc_claimAutoreleasedReturnValue();
  v82 = (id)objc_msgSend(v81, "appendObject:withName:", v83, CFSTR("filterCriteria"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequest timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("timestamp"));

  -[NCNotificationRequest sectionIdentifier](self, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("sectionId"));

  -[NCNotificationRequest threadIdentifier](self, "threadIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v9, CFSTR("threadId"), 1);

  -[NCNotificationRequest notificationIdentifier](self, "notificationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("notificationId"));

  -[NCNotificationRequest categoryIdentifier](self, "categoryIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:withName:", v13, CFSTR("categoryId"));

  -[NCNotificationRequest uuid](self, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:withName:", v15, CFSTR("uuid"));

  return v3;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)notificationIdentifier
{
  return self->_notificationIdentifier;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSSet)subSectionIdentifiers
{
  return self->_subSectionIdentifiers;
}

- (NSString)highestPrioritySubSectionIdentifier
{
  return self->_highestPrioritySubSectionIdentifier;
}

- (NSArray)intentIdentifiers
{
  return self->_intentIdentifiers;
}

- (NSArray)peopleIdentifiers
{
  return self->_peopleIdentifiers;
}

- (NSString)parentSectionIdentifier
{
  return self->_parentSectionIdentifier;
}

- (BOOL)isUniqueThreadIdentifier
{
  return self->_threadIdentifierUnique;
}

- (DNDClientEventBehavior)eventBehavior
{
  return self->_eventBehavior;
}

- (BOOL)isHighlight
{
  return self->_isHighlight;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSSet)requestDestinations
{
  return self->_requestDestinations;
}

- (NCNotificationContent)content
{
  return self->_content;
}

- (NCNotificationOptions)options
{
  return self->_options;
}

- (NCNotificationAlertOptions)alertOptions
{
  return self->_alertOptions;
}

- (NSDictionary)context
{
  return self->_context;
}

- (NSSet)settingsSections
{
  return self->_settingsSections;
}

- (NCNotificationSound)sound
{
  return self->_sound;
}

- (NCNotificationAction)cancelAction
{
  return self->_cancelAction;
}

- (NCNotificationAction)clearAction
{
  return self->_clearAction;
}

- (NCNotificationAction)closeAction
{
  return self->_closeAction;
}

- (NCNotificationAction)defaultAction
{
  return self->_defaultAction;
}

- (NCNotificationAction)silenceAction
{
  return self->_silenceAction;
}

- (NCNotificationAction)inlineAction
{
  return self->_inlineAction;
}

- (NSDictionary)supplementaryActions
{
  return self->_supplementaryActions;
}

- (UNNotification)userNotification
{
  return self->_userNotification;
}

- (BOOL)isCollapsedNotification
{
  return self->_isCollapsedNotification;
}

- (unint64_t)collapsedNotificationsCount
{
  return self->_collapsedNotificationsCount;
}

- (NSDictionary)sourceInfo
{
  return self->_sourceInfo;
}

- (BOOL)isCriticalAlert
{
  return self->_criticalAlert;
}

- (unint64_t)interruptionLevel
{
  return self->_interruptionLevel;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (float)relevanceScore
{
  return self->_relevanceScore;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sourceInfo, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_storeStrong((id *)&self->_supplementaryActions, 0);
  objc_storeStrong((id *)&self->_inlineAction, 0);
  objc_storeStrong((id *)&self->_silenceAction, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_closeAction, 0);
  objc_storeStrong((id *)&self->_clearAction, 0);
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_settingsSections, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_alertOptions, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_requestDestinations, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_eventBehavior, 0);
  objc_storeStrong((id *)&self->_parentSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_peopleIdentifiers, 0);
  objc_storeStrong((id *)&self->_intentIdentifiers, 0);
  objc_storeStrong((id *)&self->_highestPrioritySubSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_subSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 title:(id)a6 message:(id)a7 timestamp:(id)a8 destination:(id)a9
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;

  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  objc_msgSend(v15, "setWithObject:", a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:title:message:timestamp:destinations:", v21, v20, v19, v18, v17, v16, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v23;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 title:(id)a6 message:(id)a7 timestamp:(id)a8 destination:(id)a9 uuid:(id)a10
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v30;

  v16 = (void *)MEMORY[0x24BDBCF20];
  v28 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  objc_msgSend(v16, "set");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)objc_opt_new();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:subSectionIds:title:message:timestamp:destinations:options:uuid:", v23, v22, v21, v24, v20, v19, v18, v25, v26, v28);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v30;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 title:(id)a6 message:(id)a7 timestamp:(id)a8 destinations:(id)a9
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;

  v16 = (void *)MEMORY[0x24BDBCF20];
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  objc_msgSend(v16, "set");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_opt_new();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:subSectionIds:title:message:timestamp:destinations:options:", v23, v22, v21, v24, v20, v19, v18, v17, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v26;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 subSectionIds:(id)a6 title:(id)a7 message:(id)a8 timestamp:(id)a9 destinations:(id)a10 options:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v30;

  v26 = (void *)MEMORY[0x24BDBCF20];
  v16 = a11;
  v17 = a10;
  v27 = a9;
  v28 = a8;
  v18 = a7;
  v19 = a5;
  v20 = a4;
  v25 = a3;
  objc_msgSend(v26, "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_new();
  v23 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:subSectionIds:title:message:timestamp:destinations:options:alertOptions:uuid:", v25, v20, v19, v21, v18, v28, v27, v17, v16, v22, v23);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v30;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 subSectionIds:(id)a6 title:(id)a7 message:(id)a8 timestamp:(id)a9 destinations:(id)a10 options:(id)a11 uuid:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v31;

  v27 = (void *)MEMORY[0x24BDBCF20];
  v17 = a12;
  v18 = a10;
  v28 = a9;
  v29 = a8;
  v19 = a7;
  v20 = a5;
  v21 = a4;
  v26 = a3;
  objc_msgSend(v27, "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_opt_new();
  v24 = (void *)objc_opt_new();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:subSectionIds:title:message:timestamp:destinations:options:alertOptions:uuid:", v26, v21, v20, v22, v19, v29, v28, v18, v23, v24, v17);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v31;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 subSectionIds:(id)a6 title:(id)a7 message:(id)a8 timestamp:(id)a9 destinations:(id)a10 options:(id)a11 alertOptions:(id)a12 uuid:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v32;
  id v33;
  id v34;

  v34 = a13;
  v33 = a12;
  v32 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "setSectionIdentifier:", v25);

  objc_msgSend(v26, "setNotificationIdentifier:", v24);
  objc_msgSend(v26, "setThreadIdentifier:", v23);

  objc_msgSend(v26, "setSubSectionIdentifiers:", v22);
  objc_msgSend(v26, "setTimestamp:", v19);
  objc_msgSend(v26, "setRequestDestinations:", v18);

  v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "setTitle:", v21);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v20);
  objc_msgSend(v27, "setAttributedMessage:", v28);
  objc_msgSend(v27, "setDate:", v19);

  objc_msgSend(v26, "setContent:", v27);
  objc_msgSend(v26, "setOptions:", v32);

  objc_msgSend(v26, "setAlertOptions:", v33);
  objc_msgSend(v26, "setUuid:", v34);

  v29 = (void *)objc_msgSend(v26, "copy");
  return (NCNotificationRequest *)v29;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 timestamp:(id)a6
{
  return (NCNotificationRequest *)objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:title:message:timestamp:destination:", a3, a4, a5, CFSTR("title"), CFSTR("message"), a6, NCNotificationRequestTestingDestination);
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 threadId:(id)a4 notificationId:(id)a5 requestDestination:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = (void *)MEMORY[0x24BDBCE60];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:title:message:timestamp:destinations:", v14, v12, v13, CFSTR("title"), CFSTR("message"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v17;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 threadId:(id)a4 notificationId:(id)a5 requestDestinations:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v10 = (void *)MEMORY[0x24BDBCE60];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:title:message:timestamp:destinations:", v14, v12, v13, CFSTR("title"), CFSTR("message"), v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v16;
}

+ (NCNotificationRequest)notificationRequestWithRequestDestination:(id)a3
{
  return (NCNotificationRequest *)objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:requestDestination:", CFSTR("sectionId"), CFSTR("notificationId"), a3);
}

+ (NCNotificationRequest)notificationRequestWithRequestDestinations:(id)a3
{
  return (NCNotificationRequest *)objc_msgSend(a1, "notificationRequestWithSectionId:threadId:notificationId:requestDestinations:", CFSTR("sectionId"), CFSTR("threadId"), CFSTR("notificationId"), a3);
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 requestDestination:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "setWithObject:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithSectionId:threadId:notificationId:requestDestinations:", v10, CFSTR("threadId"), v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v12;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 timestamp:(id)a5
{
  return (NCNotificationRequest *)objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:timestamp:", a3, a4, CFSTR("threadId"), a5);
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:timestamp:", v8, v7, CFSTR("threadId"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v10;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 threadId:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:timestamp:", v8, CFSTR("notificationId"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v10;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3
{
  return (NCNotificationRequest *)objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:", a3, CFSTR("notificationId"));
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 timestamp:(id)a4
{
  return (NCNotificationRequest *)objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:timestamp:", CFSTR("sectionId"), a3, a4);
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:timestamp:", CFSTR("sectionId"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v7;
}

+ (NCNotificationRequest)notificationRequestWithThreadId:(id)a3 timestamp:(id)a4
{
  return (NCNotificationRequest *)objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:timestamp:", CFSTR("sectionId"), CFSTR("notificationId"), a3, a4);
}

+ (NCNotificationRequest)notificationRequestWithThreadId:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithThreadId:timestamp:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v7;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 threadId:(id)a4 timestamp:(id)a5
{
  return (NCNotificationRequest *)objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:timestamp:", CFSTR("sectionId"), a3, a4, a5);
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 sectionId:(id)a4 threadId:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x24BDBCE60];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:timestamp:", v10, v11, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v13;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 threadId:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithNotificationId:threadId:timestamp:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v10;
}

+ (NCNotificationRequest)notificationRequestWithTimestamp:(id)a3
{
  return (NCNotificationRequest *)objc_msgSend(a1, "notificationRequestWithNotificationId:timestamp:", CFSTR("notificationId"), a3);
}

+ (id)notificationRequest
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithTimestamp:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (NCNotificationRequest)notificationRequestWithActionWithId:(id)a3 runner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NCMutableNotificationAction *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "notificationRequestWithNotificationId:", CFSTR("action-notification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = objc_alloc_init(NCMutableNotificationAction);
  -[NCMutableNotificationAction setIdentifier:](v10, "setIdentifier:", v7);

  -[NCMutableNotificationAction setActionRunner:](v10, "setActionRunner:", v6);
  objc_msgSend(v9, "setDefaultAction:", v10);

  return (NCNotificationRequest *)v9;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 lockScreenPriority:(unint64_t)a4
{
  return (NCNotificationRequest *)objc_msgSend(a1, "notificationRequestWithNotificationId:lockScreenPriority:lockScreenPersistence:", a3, a4, 0);
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 lockScreenPriority:(unint64_t)a4 lockScreenPersistence:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setLockScreenPriority:", a4);
  objc_msgSend(v9, "setLockScreenPersistence:", a5);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:subSectionIds:title:message:timestamp:destinations:options:", CFSTR("sectionId"), v8, CFSTR("threadId"), v10, CFSTR("title"), CFSTR("message"), v11, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v13;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4
{
  return (NCNotificationRequest *)objc_msgSend(a1, "notificationRequestWithNotificationId:requestDestinations:isCritical:", a3, a4, 0);
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4 isCritical:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setPreemptsPresentedNotification:", v5);
  objc_msgSend(v10, "setRevealsAdditionalContentOnPresentation:", v5);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:subSectionIds:title:message:timestamp:destinations:options:", CFSTR("sectionId"), v9, CFSTR("threadId"), v11, CFSTR("title"), CFSTR("message"), v12, v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v13;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 subSectionIds:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:subSectionIds:requestDestinations:", v8, CFSTR("notificationId"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v10;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 subSectionIds:(id)a5 requestDestinations:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = (void *)MEMORY[0x24BDBCE60];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:subSectionIds:title:message:timestamp:destinations:options:", v14, v13, CFSTR("threadId"), v12, CFSTR("title"), CFSTR("message"), v15, v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v17;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4 lockScreenPersistence:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setLockScreenPersistence:", a5);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:subSectionIds:title:message:timestamp:destinations:options:", CFSTR("sectionId"), v9, CFSTR("threadId"), v11, CFSTR("title"), CFSTR("message"), v12, v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v13;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4 alertOptionsSuppression:(unint64_t)a5
{
  id v8;
  id v9;
  NCMutableNotificationAlertOptions *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(NCMutableNotificationAlertOptions);
  -[NCMutableNotificationAlertOptions setSuppression:](v10, "setSuppression:", a5);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v14 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:subSectionIds:title:message:timestamp:destinations:options:alertOptions:uuid:", CFSTR("sectionId"), v9, CFSTR("threadId"), v11, CFSTR("title"), CFSTR("message"), v12, v8, v13, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v15;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4 lockScreenPersistence:(unint64_t)a5 alertOptionsSuppression:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  NCMutableNotificationAlertOptions *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setLockScreenPersistence:", a5);
  v13 = objc_alloc_init(NCMutableNotificationAlertOptions);
  -[NCMutableNotificationAlertOptions setSuppression:](v13, "setSuppression:", a6);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(a1, "notificationRequestWithSectionId:notificationId:threadId:subSectionIds:title:message:timestamp:destinations:options:alertOptions:uuid:", CFSTR("sectionId"), v11, CFSTR("threadId"), v14, CFSTR("title"), CFSTR("message"), v15, v10, v12, v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationRequest *)v17;
}

- (id)loggingDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NCNotificationRequest notificationIdentifier](self, "notificationIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "un_logDigest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequest sectionIdentifier](self, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequest threadIdentifier](self, "threadIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "un_logDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequest categoryIdentifier](self, "categoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequest timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequest _interruptionLevelLoggingDescription](self, "_interruptionLevelLoggingDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequest relevanceScore](self, "relevanceScore");
  v11 = v10;
  -[NCNotificationRequest filterCriteria](self, "filterCriteria");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequest _actionsLoggingDescription](self, "_actionsLoggingDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequest requestDestinations](self, "requestDestinations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("id: %@; section: %@; thread: %@; category: %@; timestamp: %@; interruption-level: %@; relevance-score: %.2f; filter-criteria: %@; actions: [ %@ ]; destinations: [ %@ ]"),
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(_QWORD *)&v11,
    v12,
    v13,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_interruptionLevelLoggingDescription
{
  unint64_t v2;

  v2 = -[NCNotificationRequest interruptionLevel](self, "interruptionLevel");
  if (v2 - 1 > 2)
    return CFSTR("passive");
  else
    return *(&off_24D270480 + v2 - 1);
}

- (id)_actionsLoggingDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[NCNotificationRequest _actionsDescriptionForEnvironment:](self, "_actionsDescriptionForEnvironment:", CFSTR("NCNotificationActionEnvironmentMinimal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("minimal: %@"), v4);

  -[NCNotificationRequest _actionsDescriptionForEnvironment:](self, "_actionsDescriptionForEnvironment:", CFSTR("NCNotificationActionEnvironmentDefault"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", default: %@"), v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)_actionsDescriptionForEnvironment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NCNotificationRequest supplementaryActions](self, "supplementaryActions", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("NCNotificationActionEnvironmentMinimal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("behavior == %d"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d (%d text)"), objc_msgSend(v5, "count"), objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
