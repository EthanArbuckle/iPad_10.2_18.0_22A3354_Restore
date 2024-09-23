@implementation Router

- (void)dealloc
{
  _TtC8VideosUI6Router *v2;

  v2 = self;
  sub_1DA01912C();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI6Router__id;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAB0140);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_15_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  swift_bridgeObjectRelease();
}

- (void)presentRouterDataSource:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v4 = a3;
  v5 = OUTLINED_FUNCTION_4_11();
  sub_1DA01D764();

  OUTLINED_FUNCTION_4_3(v5);
}

- (_TtC8VideosUI6Router)init
{
  sub_1DA021B30();
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v4 = a3;
  v5 = OUTLINED_FUNCTION_4_11();
  sub_1DA021BCC();

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 actions:(id)a5 animated:(BOOL)a6
{
  id v7;
  uint64_t v9;
  void *v10;
  _TtC8VideosUI6Router *v11;
  uint64_t v12;
  unint64_t v13;

  v7 = a4;
  if (a3)
  {
    sub_1DA143E80();
    if (v7)
      goto LABEL_3;
LABEL_7:
    v9 = 0;
    if (!a5)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (!a4)
    goto LABEL_7;
LABEL_3:
  v9 = sub_1DA143E80();
  v7 = v10;
  if (a5)
LABEL_4:
    a5 = (id)sub_1DA1440FC();
LABEL_5:
  v11 = self;
  v12 = OUTLINED_FUNCTION_181_0();
  sub_1DA024918(v12, v13, v9, (uint64_t)v7, (uint64_t)a5);

  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_22();
  swift_bridgeObjectRelease();
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC8VideosUI6Router *v11;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = OUTLINED_FUNCTION_48();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1D9B0BA94;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_1DA024D70(v10, a4, v8, v9);
  sub_1D97B50A8((uint64_t)v8);

  OUTLINED_FUNCTION_3_5(v11);
}

- (void)presentViewController:(id)a3 modalPresentationStyle:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  _TtC8VideosUI6Router *v13;

  v10 = _Block_copy(a6);
  if (v10)
  {
    v11 = OUTLINED_FUNCTION_48();
    *(_QWORD *)(v11 + 16) = v10;
    v10 = sub_1D9B0BA94;
  }
  else
  {
    v11 = 0;
  }
  v12 = a3;
  v13 = self;
  sub_1DA024ECC((uint64_t)v12, a4, a5, (uint64_t)v10, v11);
  OUTLINED_FUNCTION_62_14();

  OUTLINED_FUNCTION_3_5(v13);
}

- (void)handleAccountSettingsEventWithUrl:(id)a3 amsBagKey:(id)a4 useAMSWebView:(BOOL)a5
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _TtC8VideosUI6Router *v14;
  uint64_t v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92BE0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_12_0();
  if (a3)
  {
    sub_1DA13F3EC();
    v11 = OUTLINED_FUNCTION_13_7();
    v12 = 0;
  }
  else
  {
    v11 = OUTLINED_FUNCTION_13_7();
    v12 = 1;
  }
  OUTLINED_FUNCTION_15_3(v5, v12, v10, v11);
  if (a4)
  {
    sub_1DA143E80();
    a4 = v13;
  }
  v14 = self;
  v15 = OUTLINED_FUNCTION_143_10();
  sub_1DA025018(v15, v16, (uint64_t)a4);

  OUTLINED_FUNCTION_22();
  sub_1D970F43C(v5, &qword_1EDA92BE0);
  OUTLINED_FUNCTION_28_0();
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC8VideosUI6Router *v7;

  v5 = _Block_copy(a4);
  if (v5)
    *(_QWORD *)(OUTLINED_FUNCTION_48() + 16) = v5;
  v7 = self;
  sub_1DA02523C();
  v6 = OUTLINED_FUNCTION_240();
  sub_1D97B50A8(v6);
  OUTLINED_FUNCTION_4_3(v7);
}

- (BOOL)dismissViewControllerWithID:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8VideosUI6Router *v11;
  char v12;
  char v13;

  v5 = a4;
  v7 = (void (*)(uint64_t))_Block_copy(a5);
  v8 = sub_1DA143E80();
  v10 = v9;
  if (v7)
  {
    *(_QWORD *)(OUTLINED_FUNCTION_48() + 16) = v7;
    v7 = (void (*)(uint64_t))sub_1D9B07CC0;
  }
  v11 = self;
  sub_1DA0252E0(v8, v10, v5, v7);
  v13 = v12;
  OUTLINED_FUNCTION_62_14();

  OUTLINED_FUNCTION_79();
  return v13 & 1;
}

@end
