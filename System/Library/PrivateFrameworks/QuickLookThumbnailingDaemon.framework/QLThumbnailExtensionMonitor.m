@implementation QLThumbnailExtensionMonitor

+ (QLThumbnailExtensionMonitor)shared
{
  if (qword_1ED9A6730 != -1)
    swift_once();
  swift_beginAccess();
  return (QLThumbnailExtensionMonitor *)(id)qword_1ED9A6550;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED9A6730;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = (void *)qword_1ED9A6550;
  qword_1ED9A6550 = (uint64_t)v4;

}

- (QLThumbnailExtensionMonitor)init
{
  return (QLThumbnailExtensionMonitor *)ThumbnailExtensionMonitor.init()();
}

- (BOOL)canGenerateThumbnailWith:(id)a3 at:(CGSize)a4
{
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  QLThumbnailExtensionMonitor *v13;
  double v14;
  char v15;
  BOOL v16;
  uint64_t v18;

  height = a4.height;
  width = a4.width;
  v8 = sub_1D54FC590();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a3;
  v13 = self;
  sub_1D54FC53C();

  v14 = COERCE_DOUBLE(sub_1D54EBD88((uint64_t)v11));
  LOBYTE(v12) = v15;

  if ((v12 & 1) != 0)
    v16 = 0;
  else
    v16 = width == 0.0 && height == 0.0 || width >= v14 && height >= v14;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v16;
}

- (id)bestExtensionFor:(id)a3
{
  id v4;
  QLThumbnailExtensionMonitor *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1D54EBFD8(v4);

  return v6;
}

- (id)bestExtensionFor:(id)a3 shouldUseRestrictedExtension:(BOOL)a4
{
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  id v15;
  QLThumbnailExtensionMonitor *v16;
  void *v17;
  id v18;
  void *v19;
  _BYTE v21[16];
  QLThumbnailExtensionMonitor *v22;
  _BYTE *v23;
  uint64_t v24;
  void *v25;

  ObjectType = swift_getObjectType();
  v8 = type metadata accessor for ThumbnailExtensionMonitor.Predicate(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_1D54FC590();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = &v21[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = a3;
  v16 = self;
  sub_1D54FC53C();

  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v12 + 16))(v10, v14, v11);
  v10[*(int *)(v8 + 20)] = a4;
  v17 = *(Class *)((char *)&v16->super.isa + OBJC_IVAR___QLThumbnailExtensionMonitor_queue);
  v22 = v16;
  v23 = v10;
  v24 = ObjectType;
  v18 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A65C0);
  sub_1D54FC758();

  v19 = v25;
  sub_1D54ECDCC((uint64_t)v10);

  (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v11);
  return v19;
}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  QLThumbnailExtensionMonitor *v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66B0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D54EA260(0, &qword_1ED9A6628);
  sub_1D54FC8CC();
  v10 = a3;
  v11 = self;
  sub_1D54ECE08(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
