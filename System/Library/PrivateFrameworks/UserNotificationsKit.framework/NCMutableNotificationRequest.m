@implementation NCMutableNotificationRequest

- (void)setSectionIdentifier:(id)a3
{
  NSString *v4;
  NSString *sectionIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sectionIdentifier = self->super._sectionIdentifier;
  self->super._sectionIdentifier = v4;

}

- (void)setNotificationIdentifier:(id)a3
{
  NSString *v4;
  NSString *notificationIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  notificationIdentifier = self->super._notificationIdentifier;
  self->super._notificationIdentifier = v4;

}

- (void)setThreadIdentifier:(id)a3
{
  NSString *v4;
  NSString *threadIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  threadIdentifier = self->super._threadIdentifier;
  self->super._threadIdentifier = v4;

}

- (void)setCategoryIdentifier:(id)a3
{
  NSString *v4;
  NSString *categoryIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  categoryIdentifier = self->super._categoryIdentifier;
  self->super._categoryIdentifier = v4;

}

- (void)setSubSectionIdentifiers:(id)a3
{
  NSSet *v4;
  NSSet *subSectionIdentifiers;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  subSectionIdentifiers = self->super._subSectionIdentifiers;
  self->super._subSectionIdentifiers = v4;

}

- (void)setHighestPrioritySubSectionIdentifier:(id)a3
{
  NSString *v4;
  NSString *highestPrioritySubSectionIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  highestPrioritySubSectionIdentifier = self->super._highestPrioritySubSectionIdentifier;
  self->super._highestPrioritySubSectionIdentifier = v4;

}

- (void)setIntentIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *intentIdentifiers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  intentIdentifiers = self->super._intentIdentifiers;
  self->super._intentIdentifiers = v4;

}

- (void)setPeopleIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *peopleIdentifiers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  peopleIdentifiers = self->super._peopleIdentifiers;
  self->super._peopleIdentifiers = v4;

}

- (void)setParentSectionIdentifier:(id)a3
{
  NSString *v4;
  NSString *parentSectionIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  parentSectionIdentifier = self->super._parentSectionIdentifier;
  self->super._parentSectionIdentifier = v4;

}

- (void)setThreadIdentifierUnique:(BOOL)a3
{
  self->super._threadIdentifierUnique = a3;
}

- (void)setEventBehavior:(id)a3
{
  DNDClientEventBehavior *v4;
  DNDClientEventBehavior *eventBehavior;

  v4 = (DNDClientEventBehavior *)objc_msgSend(a3, "copy");
  eventBehavior = self->super._eventBehavior;
  self->super._eventBehavior = v4;

}

- (void)setIsHighlight:(BOOL)a3
{
  self->super._isHighlight = a3;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->super._timestamp, a3);
}

- (void)setRequestDestinations:(id)a3
{
  NSSet *v4;
  NSSet *requestDestinations;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  requestDestinations = self->super._requestDestinations;
  self->super._requestDestinations = v4;

}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->super._content, a3);
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->super._options, a3);
}

- (void)setAlertOptions:(id)a3
{
  NCNotificationAlertOptions *v4;
  NCNotificationAlertOptions *alertOptions;

  v4 = (NCNotificationAlertOptions *)objc_msgSend(a3, "copy");
  alertOptions = self->super._alertOptions;
  self->super._alertOptions = v4;

}

- (void)setContext:(id)a3
{
  NSDictionary *v4;
  NSDictionary *context;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  context = self->super._context;
  self->super._context = v4;

}

- (void)setSettingsSections:(id)a3
{
  NSSet *v4;
  NSSet *settingsSections;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  settingsSections = self->super._settingsSections;
  self->super._settingsSections = v4;

}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->super._sound, a3);
}

- (void)setCancelAction:(id)a3
{
  objc_storeStrong((id *)&self->super._cancelAction, a3);
}

- (void)setClearAction:(id)a3
{
  objc_storeStrong((id *)&self->super._clearAction, a3);
}

- (void)setCloseAction:(id)a3
{
  objc_storeStrong((id *)&self->super._closeAction, a3);
}

- (void)setDefaultAction:(id)a3
{
  objc_storeStrong((id *)&self->super._defaultAction, a3);
}

- (void)setSilenceAction:(id)a3
{
  objc_storeStrong((id *)&self->super._silenceAction, a3);
}

- (void)setInlineAction:(id)a3
{
  objc_storeStrong((id *)&self->super._inlineAction, a3);
}

- (void)setSupplementaryActions:(id)a3
{
  NSDictionary *v4;
  NSDictionary *supplementaryActions;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  supplementaryActions = self->super._supplementaryActions;
  self->super._supplementaryActions = v4;

}

- (void)setUserNotification:(id)a3
{
  objc_storeStrong((id *)&self->super._userNotification, a3);
}

- (void)setIsCollapsedNotification:(BOOL)a3
{
  self->super._isCollapsedNotification = a3;
}

- (void)setCollapsedNotificationsCount:(unint64_t)a3
{
  self->super._collapsedNotificationsCount = a3;
}

- (void)setSourceInfo:(id)a3
{
  NSDictionary *v4;
  NSDictionary *sourceInfo;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  sourceInfo = self->super._sourceInfo;
  self->super._sourceInfo = v4;

}

- (void)setCriticalAlert:(BOOL)a3
{
  self->super._criticalAlert = a3;
}

- (void)setInterruptionLevel:(unint64_t)a3
{
  self->super._interruptionLevel = a3;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->super._uuid, a3);
}

- (void)setRelevanceScore:(float)a3
{
  self->super._relevanceScore = a3;
}

- (void)setFilterCriteria:(id)a3
{
  NSString *v4;
  NSString *filterCriteria;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  filterCriteria = self->super._filterCriteria;
  self->super._filterCriteria = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NCNotificationRequest initWithNotificationRequest:]([NCNotificationRequest alloc], "initWithNotificationRequest:", self);
}

@end
