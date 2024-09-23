@implementation UsageDetails

- (NSArray)usageItems
{
  void *v2;

  sub_219B65A84();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_219B99D60();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSDate)lastUpdatedDate
{
  return (NSDate *)(id)sub_219B99280();
}

- (NSDictionary)firstPickupByWeekdayByWeek
{
  void *v2;

  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AD190);
  v2 = (void *)sub_219B99CA0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (_TtC20ScreenTimeSettingsUI12UsageDetails)init
{
  _TtC20ScreenTimeSettingsUI12UsageDetails *result;

  result = (_TtC20ScreenTimeSettingsUI12UsageDetails *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI12UsageDetails_lastUpdatedDate;
  v4 = sub_219B992BC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

+ (NSString)appUsageItemIdentifier
{
  return (NSString *)(id)sub_219B99CDC();
}

+ (NSString)categoryUsageItemIdentifier
{
  return (NSString *)(id)sub_219B99CDC();
}

+ (NSString)pickupUsageItemIdentifier
{
  return (NSString *)(id)sub_219B99CDC();
}

+ (NSString)notificationUsageItemIdentifier
{
  return (NSString *)(id)sub_219B99CDC();
}

+ (NSString)screenTimeUsageItemIdentifier
{
  return (NSString *)(id)sub_219B99CDC();
}

+ (NSString)webUsageItemIdentifier
{
  return (NSString *)(id)sub_219B99CDC();
}

+ (id)earliestUsageDateForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v19[5];

  v7 = sub_219B992BC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v19[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    v13 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  a3 = (id)sub_219B99CF4();
  v13 = v12;
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v14 = (char *)sub_219B99CF4();
  a4 = v15;
LABEL_6:
  v19[3] = sub_219B994CC();
  v19[4] = sub_219B65BF0(&qword_2550AD010, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7168], (uint64_t)&unk_219BA4EE0);
  __swift_allocate_boxed_opaque_existential_1(v19);
  sub_219B994C0();
  sub_219B60FCC(a3, v13, v14, (uint64_t)a4, v19, v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16 = (void *)sub_219B99280();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v16;
}

+ (id)detailsForUserWithAltDSID:(id)a3 deviceActivityIdentifier:(id)a4 dateInterval:(id)a5 referenceDate:(id)a6 usageContext:(int64_t)a7 error:(id *)a8
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33[5];

  v32 = (char *)a7;
  v11 = sub_219B992BC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_219B991FC();
  v17 = *(_QWORD *)(v16 - 8);
  v19 = MEMORY[0x24BDAC7A8](v16, v18);
  v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = a8;
  v30 = v19;
  v31 = v11;
  if (!a3)
  {
    v22 = 0;
    v24 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v25 = 0;
    goto LABEL_6;
  }
  v22 = (_QWORD *)sub_219B99CF4();
  v24 = v23;
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v25 = sub_219B99CF4();
  a4 = v26;
LABEL_6:
  sub_219B991E4();
  sub_219B992A4();
  v33[3] = sub_219B994CC();
  v33[4] = sub_219B65BF0(&qword_2550AD010, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7168], (uint64_t)&unk_219BA4EE0);
  __swift_allocate_boxed_opaque_existential_1(v33);
  sub_219B994C0();
  v27 = (void *)sub_219B64EF8(v22, v24, v25, (uint64_t)a4, (uint64_t)v21, v15, v32, v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v31);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v30);
  return v27;
}

@end
