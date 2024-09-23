@implementation LibImageLoader

- (_TtC8VideosUI14LibImageLoader)init
{
  _TtC8VideosUI14LibImageLoader *result;

  sub_1D9BFE8DC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)hasImageCache
{
  return 1;
}

- (id)URLForObject:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  _TtC8VideosUI14LibImageLoader *v6;
  uint64_t v7;
  void *v8;
  _BYTE v10[32];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92BE0);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_12_0();
  swift_unknownObjectRetain();
  v6 = self;
  sub_1DA144B7C();
  OUTLINED_FUNCTION_107_0();
  sub_1D9BFE9AC(v3);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  v7 = sub_1DA13F428();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload(v3, 1, v7) != 1)
  {
    v8 = (void *)sub_1DA13F3A4();
    OUTLINED_FUNCTION_18(v3, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8));
  }
  return v8;
}

- (id)imageKeyForObject:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v9[32];

  OUTLINED_FUNCTION_54_12();
  v4 = v3;
  OUTLINED_FUNCTION_74_22();
  OUTLINED_FUNCTION_107_0();
  sub_1D9BFEAAC((uint64_t)v9);
  v6 = v5;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  if (!v6)
    return 0;
  v7 = (void *)sub_1DA143E50();
  OUTLINED_FUNCTION_79();
  return v7;
}

- (void)cancelLoad:(id)a3
{
  void *v3;
  id v4;
  _BYTE v5[32];

  OUTLINED_FUNCTION_54_12();
  v4 = v3;
  OUTLINED_FUNCTION_74_22();
  OUTLINED_FUNCTION_107_0();
  sub_1D9BFEE10((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  void *v8;
  void *v9;
  const void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  void *v19;
  _BYTE v21[32];
  _QWORD v22[3];
  uint64_t v23;

  OUTLINED_FUNCTION_8_14();
  v9 = v8;
  v11 = _Block_copy(v10);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v12 = v9;
  sub_1DA144B7C();
  swift_unknownObjectRelease();
  *(_QWORD *)(OUTLINED_FUNCTION_48() + 16) = v11;
  sub_1D9BFF014();
  OUTLINED_FUNCTION_107_0();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  v13 = v23;
  if (v23)
  {
    v14 = __swift_project_boxed_opaque_existential_1(v22, v23);
    v15 = *(_QWORD *)(v13 - 8);
    MEMORY[0x1E0C80A78](v14);
    v17 = &v21[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
    OUTLINED_FUNCTION_79_12(v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
    v19 = (void *)sub_1DA1450EC();
    OUTLINED_FUNCTION_18((uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (void).cxx_destruct
{

}

@end
