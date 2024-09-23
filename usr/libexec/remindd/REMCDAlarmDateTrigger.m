@implementation REMCDAlarmDateTrigger

- (id)modelObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarmDateTrigger account](self, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remObjectID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarmDateTrigger alarm](self, "alarm"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remObjectID"));

  if (v4 && v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[REMAlarmDateTriggerCDIngestor_ObjC storageFrom:accountID:alarmID:](_TtC7remindd34REMAlarmDateTriggerCDIngestor_ObjC, "storageFrom:accountID:alarmID:", self, v4, v6));
  }
  else
  {
    v8 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10067F820((uint64_t)v4, (uint64_t)v6, v8);

    v7 = 0;
  }

  return v7;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDAlarmDateTrigger"));
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMAlarmDateTrigger cdEntityName](REMAlarmDateTrigger, "cdEntityName");
}

- (BOOL)isTemporal
{
  return 1;
}

- (void)willSave
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (!-[REMCDAlarmDateTrigger didHandleMarkingExtraneousAlarmDuringWillSave](self, "didHandleMarkingExtraneousAlarmDuringWillSave"))
  {
    -[REMCDAlarmDateTrigger setDidHandleMarkingExtraneousAlarmDuringWillSave:](self, "setDidHandleMarkingExtraneousAlarmDuringWillSave:", 1);
    if (-[REMCDAlarmDateTrigger markedForDeletion](self, "markedForDeletion"))
    {
      v3 = objc_claimAutoreleasedReturnValue(-[REMCDAlarmDateTrigger alarm](self, "alarm"));
      if (!v3
        || (v4 = (void *)v3,
            v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAlarmDateTrigger alarm](self, "alarm")),
            v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reminder")),
            v6,
            v5,
            v4,
            !v6))
      {
        -[REMCDAlarmDateTrigger setIsExtraneous:](self, "setIsExtraneous:", 1);
      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)REMCDAlarmDateTrigger;
  -[REMCDObject willSave](&v7, "willSave");
}

- (void)didSave
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMCDAlarmDateTrigger;
  -[REMCDObject didSave](&v3, "didSave");
  -[REMCDAlarmDateTrigger setDidHandleMarkingExtraneousAlarmDuringWillSave:](self, "setDidHandleMarkingExtraneousAlarmDuringWillSave:", 0);
}

- (BOOL)didHandleMarkingExtraneousAlarmDuringWillSave
{
  return self->didHandleMarkingExtraneousAlarmDuringWillSave;
}

- (void)setDidHandleMarkingExtraneousAlarmDuringWillSave:(BOOL)a3
{
  self->didHandleMarkingExtraneousAlarmDuringWillSave = a3;
}

- (double)generateNonce
{
  REMCDAlarmDateTrigger *v2;
  double v3;

  v2 = self;
  v3 = REMCDAlarmDateTrigger.generateNonce()();

  return v3;
}

@end
