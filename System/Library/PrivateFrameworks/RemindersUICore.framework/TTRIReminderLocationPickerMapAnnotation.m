@implementation TTRIReminderLocationPickerMapAnnotation

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation_region), sel_center);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (NSString)title
{
  void *v2;

  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  v2 = (void *)sub_1B4906A34();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)subtitle
{
  return (NSString *)0;
}

- (_TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation)init
{
  _TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation *result;

  result = (_TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  v3 = *(void **)&self->item[OBJC_IVAR____TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation_item + 40];
  v4 = *(void **)&self->item[OBJC_IVAR____TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation_item + 48];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIReminderLocationPickerMapAnnotation_region));
}

@end
