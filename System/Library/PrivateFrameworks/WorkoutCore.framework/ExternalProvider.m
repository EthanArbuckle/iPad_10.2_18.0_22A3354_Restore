@implementation ExternalProvider

+ (id)deserializeFromPersistence:(id)a3
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD v11[3];
  uint64_t v12;

  v3 = a3;
  static ExternalProvider.deserialize(from:)(v3, v11);

  v4 = v12;
  if (!v12)
    return 0;
  v5 = __swift_project_boxed_opaque_existential_1(v11, v12);
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v8);
  v9 = (void *)sub_22874CFF4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v9;
}

- (id)serialize
{
  id v2;

  swift_retain();
  v2 = ExternalProvider.serialize()();
  swift_release();
  return v2;
}

@end
