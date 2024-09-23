@implementation CATComputableWrapper

- (id)valueForComputedProperty:(id)a3 typeName:(id)a4 propName:(id)a5 params:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void *v22;
  _QWORD v24[3];
  uint64_t v25;

  v7 = sub_1BFF38B10();
  v9 = v8;
  v10 = sub_1BFF38B10();
  v12 = v11;
  v13 = sub_1BFF38B10();
  v15 = v14;
  v16 = a6;
  swift_retain();
  sub_1BFF35AB4(v7, v9, v10, v12, v13, v15, v16);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = v25;
  if (!v25)
    return 0;
  v18 = __swift_project_boxed_opaque_existential_1(v24, v25);
  v19 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v19 + 16))(v21);
  v22 = (void *)sub_1BFF39080();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v17);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  return v22;
}

@end
