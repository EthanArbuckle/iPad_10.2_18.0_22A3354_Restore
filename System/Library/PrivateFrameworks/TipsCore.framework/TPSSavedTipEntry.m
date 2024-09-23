@implementation TPSSavedTipEntry

- (NSString)tipIdentifier
{
  return (NSString *)sub_19A95F504();
}

- (void)setTipIdentifier:(id)a3
{
  sub_19A95F580((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSSavedTipEntry_tipIdentifier);
}

- (NSDate)savedDate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_19A990ADC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___TPSSavedTipEntry_savedDate;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_19A990AA0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v8;
}

- (void)setSavedDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  TPSSavedTipEntry *v10;
  uint64_t v11;

  v4 = sub_19A990ADC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A990AB8();
  v8 = (char *)self + OBJC_IVAR___TPSSavedTipEntry_savedDate;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();

}

- (NSString)lastUsedVersion
{
  return (NSString *)sub_19A95F504();
}

- (void)setLastUsedVersion:(id)a3
{
  sub_19A95F580((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion);
}

- (TPSSavedTipEntry)initWithTipIdentifier:(id)a3 savedDate:(id)a4 lastUsedVersion:(id)a5
{
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  TPSSavedTipEntry *v19;
  objc_super v21;

  ObjectType = (objc_class *)swift_getObjectType();
  v7 = sub_19A990ADC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_19A990D58();
  v13 = v12;
  sub_19A990AB8();
  v14 = sub_19A990D58();
  v16 = v15;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___TPSSavedTipEntry_tipIdentifier);
  *v17 = v11;
  v17[1] = v13;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)self + OBJC_IVAR___TPSSavedTipEntry_savedDate, v10, v7);
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion);
  *v18 = v14;
  v18[1] = v16;
  v21.receiver = self;
  v21.super_class = ObjectType;
  v19 = -[TPSSavedTipEntry init](&v21, sel_init);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v19;
}

- (TPSSavedTipEntry)init
{
  TPSSavedTipEntry *result;

  result = (TPSSavedTipEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___TPSSavedTipEntry_savedDate;
  v4 = sub_19A990ADC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TPSSavedTipEntry *v5;

  v4 = a3;
  v5 = self;
  TPSSavedTipEntry.encode(with:)((NSCoder)v4);

}

- (TPSSavedTipEntry)initWithCoder:(id)a3
{
  return (TPSSavedTipEntry *)TPSSavedTipEntry.init(coder:)(a3);
}

@end
