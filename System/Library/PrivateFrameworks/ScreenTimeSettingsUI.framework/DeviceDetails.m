@implementation DeviceDetails

- (NSString)coreDuetIdentifier
{
  return (NSString *)sub_219B680DC();
}

- (NSString)identifier
{
  return (NSString *)sub_219B680DC();
}

- (NSString)name
{
  return (NSString *)sub_219B680DC();
}

- (signed)platform
{
  return *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_platform);
}

- (BOOL)isLocalDevice
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_isLocalDevice);
}

- (NSDate)lastUpdatedDate
{
  return (NSDate *)(id)sub_219B99280();
}

- (_TtC20ScreenTimeSettingsUI13DeviceDetails)initWithCoreDuetIdentifier:(id)a3 identifier:(id)a4 name:(id)a5 platform:(signed __int16)a6 isLocalDevice:(BOOL)a7 lastUpdatedDate:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  objc_class *v26;
  _TtC20ScreenTimeSettingsUI13DeviceDetails *v27;
  id v29;
  int v30;
  _BOOL4 v31;
  objc_super v32;

  v29 = a8;
  v30 = a6;
  v31 = a7;
  v9 = sub_219B992BC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_219B99CF4();
  v16 = v15;
  v17 = sub_219B99CF4();
  v19 = v18;
  v20 = sub_219B99CF4();
  v22 = v21;
  sub_219B992A4();
  v23 = (uint64_t *)((char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_coreDuetIdentifier);
  *v23 = v14;
  v23[1] = v16;
  v24 = (uint64_t *)((char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_identifier);
  *v24 = v17;
  v24[1] = v19;
  v25 = (uint64_t *)((char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_name);
  *v25 = v20;
  v25[1] = v22;
  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_platform) = v30;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_isLocalDevice) = v31;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_lastUpdatedDate, v13, v9);
  v26 = (objc_class *)type metadata accessor for DeviceDetails();
  v32.receiver = self;
  v32.super_class = v26;
  v27 = -[DeviceDetails init](&v32, sel_init, v29);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  return v27;
}

+ (id)detailsForUserWithAltDSID:(id)a3 error:(id *)a4
{
  void *v4;

  if (a3)
    sub_219B99CF4();
  sub_219B68820();
  swift_bridgeObjectRelease();
  type metadata accessor for DeviceDetails();
  v4 = (void *)sub_219B99D60();
  swift_bridgeObjectRelease();
  return v4;
}

- (_TtC20ScreenTimeSettingsUI13DeviceDetails)init
{
  _TtC20ScreenTimeSettingsUI13DeviceDetails *result;

  result = (_TtC20ScreenTimeSettingsUI13DeviceDetails *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI13DeviceDetails_lastUpdatedDate;
  v4 = sub_219B992BC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
