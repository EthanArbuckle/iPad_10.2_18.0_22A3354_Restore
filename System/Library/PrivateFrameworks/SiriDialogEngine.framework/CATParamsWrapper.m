@implementation CATParamsWrapper

- (id)valueForKey:(id)a3
{
  _TtC16SiriDialogEngineP33_0765C0C49696B08FD742D29DC8B43ED916CATParamsWrapper *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  __int128 v12;
  uint64_t v13;

  sub_1BFF38B10();
  v4 = self;
  sub_1BFF358B0(&v12);

  swift_bridgeObjectRelease();
  v5 = v13;
  if (!v13)
    return 0;
  v6 = __swift_project_boxed_opaque_existential_1(&v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)sub_1BFF39080();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v12);
  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16SiriDialogEngineP33_0765C0C49696B08FD742D29DC8B43ED916CATParamsWrapper_mCatParams));
}

@end
