@implementation OpenURLHandler

- (_TtC8VideosUI14OpenURLHandler)init
{
  _TtC8VideosUI14OpenURLHandler *result;

  sub_1D9803264();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)isLoadingSharedWatchURL
{
  _TtC8VideosUI14OpenURLHandler *v2;
  BOOL result;

  v2 = self;
  sub_1D9803434();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)openedByDeeplink
{
  BOOL result;

  sub_1D980346C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (NSURL)deferredOpenURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92BE0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_13_0();
  sub_1D980368C();
  v5 = OUTLINED_FUNCTION_13_7();
  v6 = 0;
  if (OUTLINED_FUNCTION_53_15(v5) != 1)
  {
    v6 = (void *)sub_1DA13F3A4();
    OUTLINED_FUNCTION_5_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8));
  }
  return (NSURL *)v6;
}

- (void)setDeferredOpenURL:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92BE0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_12_0();
  if (a3)
  {
    OUTLINED_FUNCTION_489();
    OUTLINED_FUNCTION_13_7();
    OUTLINED_FUNCTION_520();
  }
  else
  {
    OUTLINED_FUNCTION_13_7();
    OUTLINED_FUNCTION_519();
  }
  v9 = OUTLINED_FUNCTION_518(v3, v6, v7, v8);
  sub_1D9C1F264();

  OUTLINED_FUNCTION_9();
}

- (void)setOpenedByDeeplink:(BOOL)a3
{
  sub_1D9C1F2CC(a3);
  OUTLINED_FUNCTION_2_1();
}

- (BOOL)isFinished
{
  _TtC8VideosUI14OpenURLHandler *v2;
  BOOL result;

  v2 = self;
  sub_1D9C1F418();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setIsFinished:(BOOL)a3
{
  _TtC8VideosUI14OpenURLHandler *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9C1F45C();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)setIsLoadingSharedWatchURL:(BOOL)a3
{
  _TtC8VideosUI14OpenURLHandler *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9C1F4F0();
  OUTLINED_FUNCTION_5_8(v4);
}

- (BOOL)isRedeemURL:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  char v10;
  char v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92BE0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_12_0();
  if (a3)
  {
    OUTLINED_FUNCTION_489();
    OUTLINED_FUNCTION_13_7();
    OUTLINED_FUNCTION_520();
  }
  else
  {
    OUTLINED_FUNCTION_13_7();
    OUTLINED_FUNCTION_519();
  }
  v9 = OUTLINED_FUNCTION_518(v3, v6, v7, v8);
  sub_1D9C1F748();
  v11 = v10;

  OUTLINED_FUNCTION_48_6(v12, &qword_1EDA92BE0);
  return v11 & 1;
}

- (id)queryParameterStringfromURL:(id)a3 parameter:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC8VideosUI14OpenURLHandler *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92BE0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_13_0();
  if (a3)
  {
    sub_1DA13F3EC();
    OUTLINED_FUNCTION_13_7();
    OUTLINED_FUNCTION_520();
  }
  else
  {
    OUTLINED_FUNCTION_13_7();
    OUTLINED_FUNCTION_519();
  }
  __swift_storeEnumTagSinglePayload(v4, v8, 1, v9);
  OUTLINED_FUNCTION_84_2();
  v10 = self;
  OUTLINED_FUNCTION_51_19();
  sub_1D9C1FD88();
  v12 = v11;

  v13 = OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_90_5(v13, &qword_1EDA92BE0);
  if (v12)
  {
    v14 = (void *)OUTLINED_FUNCTION_357_0();
    OUTLINED_FUNCTION_23();
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)openSharedWatchURL:(id)a3 appContext:(id)a4 completion:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  OUTLINED_FUNCTION_106_0();
  v9 = v8;
  v11 = v10;
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_204_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_79_24();
  OUTLINED_FUNCTION_337_1();
  if (v6)
    *(_QWORD *)(OUTLINED_FUNCTION_48() + 16) = v6;
  v13 = v9;
  v14 = v11;
  OUTLINED_FUNCTION_36_10();
  OUTLINED_FUNCTION_405_0();
  sub_1D9C201E4();
  OUTLINED_FUNCTION_62_14();

  OUTLINED_FUNCTION_18(v5, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  OUTLINED_FUNCTION_90();
}

- (void)processDeeplink:(id)a3 appContext:(id)a4 completion:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  OUTLINED_FUNCTION_106_0();
  v9 = v8;
  v11 = v10;
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_204_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_79_24();
  OUTLINED_FUNCTION_337_1();
  if (v6)
    *(_QWORD *)(OUTLINED_FUNCTION_48() + 16) = v6;
  v13 = v11;
  v14 = v9;
  OUTLINED_FUNCTION_405_0();
  sub_1D9C20AE4();
  OUTLINED_FUNCTION_62_14();

  OUTLINED_FUNCTION_18(v5, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  OUTLINED_FUNCTION_90();
}

- (void)processNonDeeplinkURL:(id)a3 contextData:(id)a4 completion:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  OUTLINED_FUNCTION_106_0();
  v8 = v7;
  v10 = v9;
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v11);
  v12 = OUTLINED_FUNCTION_79_24();
  sub_1DA13F3EC();
  if (v8)
    sub_1DA143C7C();
  if (v12)
  {
    *(_QWORD *)(OUTLINED_FUNCTION_48() + 16) = v12;
    v12 = sub_1D9C35EA4;
  }
  v13 = v10;
  OUTLINED_FUNCTION_36_10();
  sub_1D9C21598();
  sub_1D97B50A8((uint64_t)v12);

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_18(v5, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  OUTLINED_FUNCTION_90();
}

- (void)processRouterDeeplink:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  _TtC8VideosUI14OpenURLHandler *v9;

  v6 = _Block_copy(a4);
  if (v6)
    *(_QWORD *)(OUTLINED_FUNCTION_48() + 16) = v6;
  v7 = a3;
  v9 = self;
  OUTLINED_FUNCTION_101_1();
  sub_1D9C21CD0();
  v8 = OUTLINED_FUNCTION_240();
  sub_1D97B50A8(v8);

  OUTLINED_FUNCTION_3_5(v9);
}

- (void)saveDeferredURL:(id)a3 completion:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  id v9;

  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_216();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_26();
  _Block_copy(a4);
  OUTLINED_FUNCTION_489();
  v8 = OUTLINED_FUNCTION_48();
  v9 = OUTLINED_FUNCTION_497(v8);
  sub_1D9C2214C();

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18(v4, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_28_0();
}

- (void)handleDeferredURLWithAppContext:(id)a3
{
  id v4;
  _TtC8VideosUI14OpenURLHandler *v5;

  v4 = a3;
  v5 = self;
  sub_1D9C222A4();

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)processEntityWithContextData:(id)a3 appContext:(id)a4
{
  id v6;
  _TtC8VideosUI14OpenURLHandler *v7;

  sub_1DA143C7C();
  v6 = a4;
  v7 = self;
  OUTLINED_FUNCTION_181_0();
  sub_1D9C22448();

  swift_bridgeObjectRelease();
}

- (void)parseURL:(id)a3 appContext:(id)a4 completion:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  const void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;

  OUTLINED_FUNCTION_106_0();
  v8 = v7;
  v10 = v9;
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_14_6();
  _Block_copy(v8);
  sub_1DA13F3EC();
  v12 = OUTLINED_FUNCTION_48();
  v13 = OUTLINED_FUNCTION_497(v12);
  v14 = v10;
  OUTLINED_FUNCTION_36_10();
  sub_1D9C22A08();

  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_18(v5, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  OUTLINED_FUNCTION_90();
}

- (void)processEngagementResult:(id)a3 error:(id)a4
{
  void *v4;
  id v6;
  id v7;

  v6 = a3;
  OUTLINED_FUNCTION_63_1();
  v7 = OUTLINED_FUNCTION_91_0();
  OUTLINED_FUNCTION_181_0();
  sub_1D9C234DC();

  OUTLINED_FUNCTION_4_3(v7);
}

- (void)processItunesExtrasStoreLink:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92BE0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_14_6();
  if (a3)
  {
    sub_1DA13F3EC();
    OUTLINED_FUNCTION_13_7();
    OUTLINED_FUNCTION_520();
  }
  else
  {
    OUTLINED_FUNCTION_13_7();
    OUTLINED_FUNCTION_519();
  }
  v9 = OUTLINED_FUNCTION_518(v3, v6, v7, v8);
  sub_1D9C23BA8();

  OUTLINED_FUNCTION_266(v10, &qword_1EDA92BE0);
  OUTLINED_FUNCTION_9();
}

- (void).cxx_destruct
{
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI14OpenURLHandler_deferredOpenURL, &qword_1EDA92BE0);
  OUTLINED_FUNCTION_50_2(OBJC_IVAR____TtC8VideosUI14OpenURLHandler_deferredOpenURLCompletion);

  OUTLINED_FUNCTION_50_2(OBJC_IVAR____TtC8VideosUI14OpenURLHandler_deferredAMSDynamicURLCompletion);
  OUTLINED_FUNCTION_43_6();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_43_6();
  OUTLINED_FUNCTION_43_6();
  swift_bridgeObjectRelease();
}

@end
