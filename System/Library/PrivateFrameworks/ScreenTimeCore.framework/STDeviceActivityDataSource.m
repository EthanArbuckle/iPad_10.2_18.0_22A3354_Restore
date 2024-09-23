@implementation STDeviceActivityDataSource

+ (NSDictionary)deviceIdentifiersByUserAltDSID
{
  void *v2;

  _s14ScreenTimeCore26STDeviceActivityDataSourceC30deviceIdentifiersByUserAltDSIDSDySSSaySSGGvgZ_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7AA38);
  v2 = (void *)sub_1D2363708();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

+ (NSDictionary)deviceIdentifierByCoreDuetIdentifier
{
  uint64_t v2;
  void *v3;

  if (qword_1ED0258D8 != -1)
    swift_once();
  v2 = sub_1D23636B4();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED0258E0);
  sub_1D2363690();
  v3 = (void *)sub_1D2363708();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

+ (NSArray)allLocallyUsedBundleIdentifiers
{
  void *v2;

  _s14ScreenTimeCore26STDeviceActivityDataSourceC31allLocallyUsedBundleIdentifiersSaySSGvgZ_0();
  v2 = (void *)sub_1D2363744();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

+ (void)setGenesisDate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_1D236351C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D2363510();
  _s14ScreenTimeCore26STDeviceActivityDataSourceC14setGenesisDateyy10Foundation0J0VFZ_0((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

+ (id)totalWeeklyUsageDuringDateInterval:(id)a3 userAltDSID:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v6 = sub_1D23634E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D23634C8();
  if (a4)
  {
    v10 = sub_1D2363714();
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  v13 = (void *)sub_1D2359E08((unint64_t)v9, v10, v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  return v13;
}

+ (id)lastUpdatedDateFor:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v3 = sub_1D23634E0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7A9E8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D23634C8();
  static STDeviceActivityDataSource.lastUpdatedDate(for:)((uint64_t)v6, (uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v10 = sub_1D236351C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
  {
    v12 = (void *)sub_1D23634F8();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  }
  return v12;
}

+ (void)refreshAndUploadLocalDataSinceDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void (**v24)(uint64_t);
  uint64_t v25;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7AA08);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7A9E8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v25 - v14;
  v16 = _Block_copy(a4);
  if (a3)
  {
    sub_1D2363510();
    v17 = sub_1D236351C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v15, 0, 1, v17);
  }
  else
  {
    v18 = sub_1D236351C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  }
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v16;
  v20 = sub_1D2363768();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v8, 1, 1, v20);
  sub_1D235A21C((uint64_t)v15, (uint64_t)v13);
  v21 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v22 = (v11 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = 0;
  *(_QWORD *)(v23 + 24) = 0;
  sub_1D235A264((uint64_t)v13, v23 + v21);
  v24 = (void (**)(uint64_t))(v23 + v22);
  *v24 = sub_1D235AB10;
  v24[1] = (void (*)(uint64_t))v19;
  swift_retain();
  sub_1D23561E0((uint64_t)v8, (uint64_t)&unk_1EFC7AA30, v23);
  swift_release();
  swift_release();
  sub_1D235AD3C((uint64_t)v15, &qword_1EFC7A9E8);
}

+ (void)downloadRemoteData
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v2 = sub_1D236363C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D2363630();
  sub_1D23635F4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

+ (BOOL)hasDataForUserWithAltDSID:(id)a3 userDeviceStates:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  if (a3)
  {
    v5 = sub_1D2363714();
    v7 = v6;
    if (a4)
    {
LABEL_3:
      sub_1D235AA68();
      sub_1D235AAA4();
      v8 = sub_1D2363780();
      goto LABEL_6;
    }
  }
  else
  {
    v5 = 0;
    v7 = 0;
    if (a4)
      goto LABEL_3;
  }
  v8 = 0;
LABEL_6:
  v9 = _s14ScreenTimeCore26STDeviceActivityDataSourceC30deviceIdentifiersByUserAltDSIDSDySSSaySSGGvgZ_0();
  if (qword_1ED0258D8 != -1)
    swift_once();
  v10 = sub_1D23636B4();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED0258E0);
  v11 = sub_1D236369C();
  v12 = _s14ScreenTimeCore26STDeviceActivityDataSourceC03hasF018forUserWithAltDSID16userDeviceStates019deviceIdentifiersByjlM00qrsC14DuetIdentifierSbSSSg_ShySo06STUserO5StateCGSgSDySSSaySSGGSDySSShySSGGtFZ_0(v5, v7, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

- (_TtC14ScreenTimeCore26STDeviceActivityDataSource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STDeviceActivityDataSource();
  return -[STDeviceActivityDataSource init](&v3, sel_init);
}

@end
