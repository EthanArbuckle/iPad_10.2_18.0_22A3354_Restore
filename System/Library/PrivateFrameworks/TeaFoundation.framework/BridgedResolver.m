@implementation BridgedResolver

- (id)resolveClass:(Class)a3 name:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjCClassMetadata;
  _TtC13TeaFoundation15BridgedResolver *v9;
  void *v10;
  _QWORD v12[4];

  if (a4)
  {
    v5 = sub_190BE5000();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v9 = self;
  sub_190AAF704(ObjCClassMetadata, v5, v7, (_QWORD *(*)(__int128 *__return_ptr))sub_190AA62D4);

  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  v10 = (void *)sub_190BE60A4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v10;
}

- (id)resolveProtocol:(id)a3 name:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC13TeaFoundation15BridgedResolver *v10;
  void *v11;
  _QWORD v13[4];

  if (a4)
  {
    v6 = sub_190BE5000();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  sub_190AAF704((uint64_t)v9, v6, v8, (_QWORD *(*)(__int128 *__return_ptr))sub_190B01090);

  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  v11 = (void *)sub_190BE60A4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v11;
}

- (id)resolveClass:(Class)a3
{
  uint64_t ObjCClassMetadata;
  _TtC13TeaFoundation15BridgedResolver *v5;
  void *v6;
  _QWORD v8[4];

  ObjCClassMetadata = swift_getObjCClassMetadata();
  v5 = self;
  sub_190B01214(ObjCClassMetadata, (_QWORD *(*)(__int128 *__return_ptr))sub_190B02A60);

  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v6 = (void *)sub_190BE60A4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v6;
}

- (id)resolveProtocol:(id)a3
{
  id v4;
  _TtC13TeaFoundation15BridgedResolver *v5;
  void *v6;
  _QWORD v8[4];

  v4 = a3;
  v5 = self;
  sub_190B01214((uint64_t)v4, (_QWORD *(*)(__int128 *__return_ptr))sub_190B01248);

  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v6 = (void *)sub_190BE60A4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v6;
}

- (void).cxx_destruct
{
  swift_release();
}

- (id)resolveOptionalClass:(Class)a3
{
  uint64_t ObjCClassMetadata;
  _TtC13TeaFoundation15BridgedResolver *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[3];
  uint64_t v14;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  v5 = self;
  sub_190B02A60(ObjCClassMetadata);

  v6 = v14;
  if (!v14)
    return 0;
  v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  v11 = (void *)sub_190BE60A4();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v11;
}

- (id)resolveOptionalClass:(Class)a3 name:(id)a4
{
  _TtC13TeaFoundation15BridgedResolver *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[3];
  uint64_t v14;

  if (a4)
    sub_190BE5000();
  swift_getObjCClassMetadata();
  v5 = self;
  sub_190AA62D4();

  swift_bridgeObjectRelease();
  v6 = v14;
  if (!v14)
    return 0;
  v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  v11 = (void *)sub_190BE60A4();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v11;
}

- (id)resolveClass:(Class)a3 contextBlock:(id)a4
{
  void *v5;
  uint64_t ObjCClassMetadata;
  uint64_t v7;
  _TtC13TeaFoundation15BridgedResolver *v8;
  void *v9;
  _QWORD v11[4];

  v5 = _Block_copy(a4);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  sub_190AAF704(ObjCClassMetadata, (uint64_t)sub_190B67FC0, v7, (_QWORD *(*)(__int128 *__return_ptr))sub_190B67108);

  swift_release();
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  v9 = (void *)sub_190BE60A4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v9;
}

- (id)resolveOptionalClass:(Class)a3 contextBlock:(id)a4
{
  void *v5;
  _TtC13TeaFoundation15BridgedResolver *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD v14[3];
  uint64_t v15;

  v5 = _Block_copy(a4);
  swift_getObjCClassMetadata();
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  v6 = self;
  sub_190B67108();

  swift_release();
  v7 = v15;
  if (!v15)
    return 0;
  v8 = __swift_project_boxed_opaque_existential_1(v14, v15);
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v11);
  v12 = (void *)sub_190BE60A4();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v12;
}

- (id)resolveClass:(Class)a3 name:(id)a4 contextBlock:(id)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t ObjCClassMetadata;
  uint64_t v11;
  _TtC13TeaFoundation15BridgedResolver *v12;
  void *v13;
  _QWORD v15[4];

  v7 = _Block_copy(a5);
  if (a4)
  {
    v8 = sub_190BE5000();
    a4 = v9;
  }
  else
  {
    v8 = 0;
  }
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = self;
  sub_190B67B8C(ObjCClassMetadata, v8, (uint64_t)a4, (uint64_t)sub_190B67FC0, v11, (_QWORD *(*)(__int128 *__return_ptr))sub_190B67398);

  swift_release();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  v13 = (void *)sub_190BE60A4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v13;
}

- (id)resolveOptionalClass:(Class)a3 name:(id)a4 contextBlock:(id)a5
{
  void *v7;
  _TtC13TeaFoundation15BridgedResolver *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD v16[3];
  uint64_t v17;

  v7 = _Block_copy(a5);
  if (a4)
    sub_190BE5000();
  swift_getObjCClassMetadata();
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  v8 = self;
  sub_190B67398();

  swift_release();
  swift_bridgeObjectRelease();
  v9 = v17;
  if (!v17)
    return 0;
  v10 = __swift_project_boxed_opaque_existential_1(v16, v17);
  v11 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v11 + 16))(v13);
  v14 = (void *)sub_190BE60A4();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v14;
}

- (id)resolveOptionalProtocol:(id)a3
{
  id v4;
  _TtC13TeaFoundation15BridgedResolver *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[3];
  uint64_t v14;

  v4 = a3;
  v5 = self;
  sub_190B01248(v4);

  v6 = v14;
  if (!v14)
    return 0;
  v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  v11 = (void *)sub_190BE60A4();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v11;
}

- (id)resolveProtocol:(id)a3 contextBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC13TeaFoundation15BridgedResolver *v9;
  void *v10;
  _QWORD v12[4];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_190AAF704((uint64_t)v8, (uint64_t)sub_190B67FC0, v7, (_QWORD *(*)(__int128 *__return_ptr))sub_190B677DC);

  swift_release();
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  v10 = (void *)sub_190BE60A4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v10;
}

- (id)resolveOptionalProtocol:(id)a3 contextBlock:(id)a4
{
  void *v6;
  id v7;
  _TtC13TeaFoundation15BridgedResolver *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD v16[3];
  uint64_t v17;

  v6 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = a3;
  v8 = self;
  sub_190B677DC();

  swift_release();
  v9 = v17;
  if (!v17)
    return 0;
  v10 = __swift_project_boxed_opaque_existential_1(v16, v17);
  v11 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v11 + 16))(v13);
  v14 = (void *)sub_190BE60A4();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v14;
}

- (id)resolveOptionalProtocol:(id)a3 name:(id)a4
{
  id v6;
  _TtC13TeaFoundation15BridgedResolver *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD v15[3];
  uint64_t v16;

  if (a4)
    sub_190BE5000();
  v6 = a3;
  v7 = self;
  sub_190B01090();

  swift_bridgeObjectRelease();
  v8 = v16;
  if (!v16)
    return 0;
  v9 = __swift_project_boxed_opaque_existential_1(v15, v16);
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v12);
  v13 = (void *)sub_190BE60A4();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v13;
}

- (id)resolveProtocol:(id)a3 name:(id)a4 contextBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _TtC13TeaFoundation15BridgedResolver *v13;
  void *v14;
  _QWORD v16[4];

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = sub_190BE5000();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v12 = a3;
  v13 = self;
  sub_190B67B8C((uint64_t)v12, v9, (uint64_t)a4, (uint64_t)sub_190B67FC0, v11, (_QWORD *(*)(__int128 *__return_ptr))sub_190B67BC0);

  swift_release();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  v14 = (void *)sub_190BE60A4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v14;
}

- (id)resolveOptionalProtocol:(id)a3 name:(id)a4 contextBlock:(id)a5
{
  void *v8;
  id v9;
  _TtC13TeaFoundation15BridgedResolver *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD v18[3];
  uint64_t v19;

  v8 = _Block_copy(a5);
  if (a4)
    sub_190BE5000();
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v9 = a3;
  v10 = self;
  sub_190B67BC0();

  swift_release();
  swift_bridgeObjectRelease();
  v11 = v19;
  if (!v19)
    return 0;
  v12 = __swift_project_boxed_opaque_existential_1(v18, v19);
  v13 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v13 + 16))(v15);
  v16 = (void *)sub_190BE60A4();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return v16;
}

- (_TtC13TeaFoundation15BridgedResolver)init
{
  sub_190B67EC0();
}

@end
