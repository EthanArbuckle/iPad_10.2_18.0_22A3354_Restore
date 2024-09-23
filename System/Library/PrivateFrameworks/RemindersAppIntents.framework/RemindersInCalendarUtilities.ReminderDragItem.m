@implementation RemindersInCalendarUtilities.ReminderDragItem

- (_TtCO19RemindersAppIntents28RemindersInCalendarUtilities16ReminderDragItem)init
{
  _TtCO19RemindersAppIntents28RemindersInCalendarUtilities16ReminderDragItem *result;

  result = (_TtCO19RemindersAppIntents28RemindersInCalendarUtilities16ReminderDragItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_244F46234((uint64_t)self+ OBJC_IVAR____TtCO19RemindersAppIntents28RemindersInCalendarUtilities16ReminderDragItem_reminderSpecifier);
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  id v2;
  void *v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_writableTypeIdentifiersForItemProvider);
  sub_24508FCB8();

  v3 = (void *)sub_24508FCAC();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtCO19RemindersAppIntents28RemindersInCalendarUtilities16ReminderDragItem *v9;
  id v10;

  v5 = _Block_copy(a4);
  v6 = sub_24508FB74();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  v10 = sub_244FE6804(v6, v8, (uint64_t)v9, (void (**)(_QWORD, _QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
  return v10;
}

@end
