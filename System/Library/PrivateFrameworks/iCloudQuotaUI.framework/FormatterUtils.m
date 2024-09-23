@implementation FormatterUtils

+ (id)localizedSizeStringFor:(double)a3 unitStyle:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554C1E90);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend((id)objc_opt_self(), sel_bytes);
  sub_21F35D7EC(0, (unint64_t *)&qword_2554C1E98);
  sub_21F454318();
  if (qword_2554D4788 != -1)
    swift_once();
  objc_msgSend((id)qword_2554D53A0, sel_setUnitStyle_, a4);
  sub_21F456424();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = (void *)sub_21F455FEC();
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)totalSizeStringFor:(id)a3
{
  unint64_t v3;
  void *v4;

  sub_21F35D7EC(0, &qword_2554C0B08);
  v3 = sub_21F456160();
  sub_21F43D2C8(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_21F455FEC();
  swift_bridgeObjectRelease();
  return v4;
}

- (_TtC13iCloudQuotaUI14FormatterUtils)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FormatterUtils();
  return -[FormatterUtils init](&v3, sel_init);
}

@end
