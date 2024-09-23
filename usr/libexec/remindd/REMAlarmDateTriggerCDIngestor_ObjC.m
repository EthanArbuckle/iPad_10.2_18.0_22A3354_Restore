@implementation REMAlarmDateTriggerCDIngestor_ObjC

+ (id)storageFrom:(id)a3 accountID:(id)a4 alarmID:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_10014A364(v7, v8, v9);

  return v10;
}

- (_TtC7remindd34REMAlarmDateTriggerCDIngestor_ObjC)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for REMAlarmDateTriggerCDIngestor_ObjC();
  return -[REMAlarmDateTriggerCDIngestor_ObjC init](&v3, "init");
}

@end
