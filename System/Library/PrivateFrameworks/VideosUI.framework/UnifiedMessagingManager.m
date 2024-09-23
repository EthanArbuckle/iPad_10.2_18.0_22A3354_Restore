@implementation UnifiedMessagingManager

- (_TtC8VideosUI23UnifiedMessagingManager)init
{
  _TtC8VideosUI23UnifiedMessagingManager *result;

  sub_1D97D3148();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)handleDidBecomeActive
{
  _TtC8VideosUI23UnifiedMessagingManager *v2;

  v2 = self;
  sub_1D97D38B4();

}

- (void)handleTabBarChange:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _TtC8VideosUI23UnifiedMessagingManager *v7;

  sub_1DA13F0B0();
  OUTLINED_FUNCTION_316();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_12();
  sub_1DA13F080();
  v7 = self;
  sub_1D97D39AC();

  OUTLINED_FUNCTION_5_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
}

- (void)dealloc
{
  _TtC8VideosUI23UnifiedMessagingManager *v2;

  v2 = self;
  sub_1D9CC8C10();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_217_5();
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI23UnifiedMessagingManager_fullorhalfSheetPromptedAt, (uint64_t *)&unk_1EDA877D0);
  OUTLINED_FUNCTION_217_5();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI23UnifiedMessagingManager_recentlySearchedBubbleTipViewController));
}

- (id)getFullorHalfSheetPromptedAt
{
  uint64_t v3;
  _TtC8VideosUI23UnifiedMessagingManager *v4;
  uint64_t v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA877D0);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_61();
  v4 = self;
  sub_1D9CCBAF4();

  v5 = OUTLINED_FUNCTION_11_8();
  v6 = 0;
  if (OUTLINED_FUNCTION_53_15(v5) != 1)
  {
    v6 = (void *)sub_1DA13F4AC();
    OUTLINED_FUNCTION_91_25();
  }
  return v6;
}

- (void)markFullorHalfSheetPromptAt:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC8VideosUI23UnifiedMessagingManager *v10;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA877D0);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14_6();
  if (a3)
  {
    sub_1DA13F4F4();
    v8 = OUTLINED_FUNCTION_11_8();
    v9 = 0;
  }
  else
  {
    v8 = OUTLINED_FUNCTION_11_8();
    v9 = 1;
  }
  OUTLINED_FUNCTION_15_3(v3, v9, v7, v8);
  v10 = self;
  sub_1D97D36AC();

  sub_1D970F43C(v3, (uint64_t *)&unk_1EDA877D0);
  OUTLINED_FUNCTION_9();
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC8VideosUI23UnifiedMessagingManager *v14;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v14 = self;
  v11 = OUTLINED_FUNCTION_85_1();
  sub_1D9CCBC94(v11, v12, v13, v8);
  OUTLINED_FUNCTION_331();

  OUTLINED_FUNCTION_3_5(v14);
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  id v8;
  id v9;
  _TtC8VideosUI23UnifiedMessagingManager *v10;

  sub_1DA143E80();
  sub_1DA143E80();
  v8 = a3;
  v9 = OUTLINED_FUNCTION_63_1();
  v10 = self;
  sub_1D9CCC320();

  OUTLINED_FUNCTION_54_0();
  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  id v23;

  OUTLINED_FUNCTION_24();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = _Block_copy(v13);
  v15 = OUTLINED_FUNCTION_155_1();
  v17 = v16;
  v18 = sub_1DA143E80();
  v20 = v19;
  _Block_copy(v14);
  v21 = v10;
  v22 = v8;
  v23 = v12;
  sub_1D9CCD0C4((uint64_t)v21, (uint64_t)v8, v15, v17, v18, v20, (uint64_t)v23, v14);
  _Block_release(v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  *(_QWORD *)(OUTLINED_FUNCTION_48() + 16) = v5;
  OUTLINED_FUNCTION_10_3();
}

@end
