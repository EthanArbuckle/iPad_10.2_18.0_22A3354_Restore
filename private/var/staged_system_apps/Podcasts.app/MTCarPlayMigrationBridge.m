@implementation MTCarPlayMigrationBridge

+ (MTCarPlayMigrationBridge)sharedInstance
{
  if (qword_100551FB8 != -1)
    swift_once(&qword_100551FB8, sub_1000074E8);
  return (MTCarPlayMigrationBridge *)(id)qword_100572D40;
}

- (MTCarPlayMigrationBridge)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  MTCarPlayMigrationBridge *v8;
  objc_class *v9;
  uint64_t v11;
  objc_super v12;
  char v13;

  v3 = sub_10003F544(&qword_1005534E8);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___MTCarPlayMigrationBridge__isMigrating;
  v13 = 0;
  v8 = self;
  Published.init(initialValue:)(&v13, &type metadata for Bool);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v6, v3);

  v9 = (objc_class *)type metadata accessor for CarPlayMigrationBridge(0);
  v12.receiver = v8;
  v12.super_class = v9;
  return -[MTCarPlayMigrationBridge init](&v12, "init");
}

- (void)setIsMigrating:(BOOL)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  KeyPath = swift_getKeyPath(&unk_1003CA678, a2);
  v7 = swift_getKeyPath(&unk_1003CA6A0, v6);
  v8 = a3;
  static Published.subscript.setter(&v8, self, KeyPath, v7);
}

- (BOOL)isMigrating
{
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  MTCarPlayMigrationBridge *v6;
  _BOOL8 v8;

  KeyPath = swift_getKeyPath(&unk_1003CA678, a2);
  v5 = swift_getKeyPath(&unk_1003CA6A0, v4);
  v6 = self;
  static Published.subscript.getter(&v8);

  swift_release(KeyPath);
  swift_release(v5);
  return v8;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___MTCarPlayMigrationBridge__isMigrating;
  v3 = sub_10003F544(&qword_1005534E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
