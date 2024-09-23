@implementation RAPNotificationDetailsViewModel

- (RAPNotificationDetailsViewModelDescriptionInfo)descriptionInfo
{
  return (RAPNotificationDetailsViewModelDescriptionInfo *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_descriptionInfo);
}

- (int64_t)displayStyle
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_displayStyle);
}

- (int)mapType
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_mapType);
}

- (GEOMapRegion)mapRegion
{
  return (GEOMapRegion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_mapRegion));
}

- (NSArray)mapItems
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_mapItems);
  sub_10000E4BC(0, &qword_101493E78, MKMapItem_ptr);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (NSString)reportId
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->descriptionInfo[OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_reportId];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (GEORPUpdatedLabel)updatedLabel
{
  return (GEORPUpdatedLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_updatedLabel));
}

- (BOOL)hasButton
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_hasButton);
}

- (GEORPButton)button
{
  return (GEORPButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_button));
}

- (RAPRecord)rapRecord
{
  return (RAPRecord *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_rapRecord));
}

- (void)setRapRecord:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_rapRecord);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_rapRecord) = (Class)a3;
  v3 = a3;

}

- (BOOL)editMode
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_rapRecord);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "reportStatus") == 2;
  return (char)v2;
}

- (NSString)linkButtonLink
{
  return (NSString *)sub_10009F900(self, (uint64_t)a2, (void (*)(void))sub_10009F7FC);
}

- (NSString)linkButtonText
{
  return (NSString *)sub_10009F900(self, (uint64_t)a2, sub_10009F968);
}

- (_TtC4Maps31RAPNotificationDetailsViewModel)initWithDescriptionInfo:(id)a3 displayStyle:(int64_t)a4 mapType:(int)a5 mapRegion:(id)a6 mapItems:(id)a7 reportId:(id)a8 updatedLabel:(id)a9 hasButton:(BOOL)a10 button:(id)a11 rapRecord:(id)a12
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _TtC4Maps31RAPNotificationDetailsViewModel *v25;
  uint64_t v27;

  v16 = sub_10000E4BC(0, &qword_101493E78, MKMapItem_ptr);
  v27 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a7, v16);
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
  v19 = v18;
  v20 = a3;
  v21 = a6;
  v22 = a9;
  v23 = a11;
  v24 = a12;
  v25 = (_TtC4Maps31RAPNotificationDetailsViewModel *)sub_1000A0758(v20, a4, a5, v21, v27, v17, v19, a9, a10, a11, a12);

  return v25;
}

- (_TtC4Maps31RAPNotificationDetailsViewModel)init
{
  _TtC4Maps31RAPNotificationDetailsViewModel *result;

  result = (_TtC4Maps31RAPNotificationDetailsViewModel *)_swift_stdlib_reportUnimplementedInitializer("Maps.RAPNotificationDetailsViewModel", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_mapItems));
  swift_bridgeObjectRelease(*(_QWORD *)&self->descriptionInfo[OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_reportId]);

}

- (_TtC4Maps31RAPNotificationDetailsViewModel)initWithRapRecord:(id)a3
{
  return (_TtC4Maps31RAPNotificationDetailsViewModel *)sub_10009FDC4(a3);
}

- (_TtC4Maps31RAPNotificationDetailsViewModel)initWithProblemStatus:(id)a3
{
  _TtC4Maps31RAPNotificationDetailsViewModel *result;

  sub_1000A0314(a3);
  return result;
}

@end
