@implementation ManageStorageAppIconURL

- (NSURL)url1x
{
  return (NSURL *)sub_24B52BBDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings23ManageStorageAppIconURL_url1x);
}

- (NSURL)url2x
{
  return (NSURL *)sub_24B52BBDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings23ManageStorageAppIconURL_url2x);
}

- (NSURL)url3x
{
  return (NSURL *)sub_24B52BBDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings23ManageStorageAppIconURL_url3x);
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return ManageStorageAppIconURL.init(_:)(v3);
}

- (_TtC14iCloudSettings23ManageStorageAppIconURL)init
{
  _TtC14iCloudSettings23ManageStorageAppIconURL *result;

  result = (_TtC14iCloudSettings23ManageStorageAppIconURL *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24B511914((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings23ManageStorageAppIconURL_url1x, &qword_2544D8D30);
  sub_24B511914((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings23ManageStorageAppIconURL_url2x, &qword_2544D8D30);
  sub_24B511914((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings23ManageStorageAppIconURL_url3x, &qword_2544D8D30);
}

- (void)urlForScreenScaleWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC14iCloudSettings23ManageStorageAppIconURL *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544D8D80);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_24B5E4464();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25799B788;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_257999560;
  v12[5] = v11;
  v13 = self;
  sub_24B57DBC0((uint64_t)v7, (uint64_t)&unk_257999568, (uint64_t)v12);
  swift_release();
}

@end
