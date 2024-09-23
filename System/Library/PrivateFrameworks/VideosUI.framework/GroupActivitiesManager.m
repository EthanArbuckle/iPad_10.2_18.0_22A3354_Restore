@implementation GroupActivitiesManager

- (_TtC8VideosUI22GroupActivitiesManager)init
{
  _TtC8VideosUI22GroupActivitiesManager *result;

  sub_1D97D6F8C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)isSessionActive
{
  _TtC8VideosUI22GroupActivitiesManager *v2;
  BOOL result;

  v2 = self;
  sub_1D9D42770();

  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setIsSessionActive:(BOOL)a3
{
  _TtC8VideosUI22GroupActivitiesManager *v4;

  v4 = self;
  sub_1D9D42804(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)requestForegroundPresentation
{
  _TtC8VideosUI22GroupActivitiesManager *v2;

  v2 = self;
  sub_1D9D43618();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_1DA13FF74();
  OUTLINED_FUNCTION_4_12(v3);
  OUTLINED_FUNCTION_15_2();
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA9B8C0);
  OUTLINED_FUNCTION_4_12(v4);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();

  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI22GroupActivitiesManager_previousState, &qword_1F02191B8);
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI22GroupActivitiesManager_modifyingActivityIdentifier, (uint64_t *)&unk_1EDAAFE40);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA87880);
  OUTLINED_FUNCTION_4_12(v5);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();

}

- (BOOL)isEligibleForSession
{
  _TtC8VideosUI22GroupActivitiesManager *v2;
  BOOL result;

  v2 = self;
  sub_1D9D454B4();

  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)isSharedWatchIdValidForCurrentSession:(id)a3
{
  _TtC8VideosUI22GroupActivitiesManager *v4;
  char v5;

  if (a3)
    sub_1DA143E80();
  v4 = self;
  v5 = sub_1D9D454EC();

  OUTLINED_FUNCTION_79();
  return v5 & 1;
}

- (id)itemProviderForActivityWithSharedWatchId:(id)a3 sharedWatchUrl:(id)a4 previewMetadata:(id)a5 existingItemProvider:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  OUTLINED_FUNCTION_24();
  v9 = v8;
  v11 = v10;
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_48_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_63();
  sub_1DA143E80();
  sub_1DA13F3EC();
  v13 = v9;
  v14 = OUTLINED_FUNCTION_63_1();
  v15 = v11;
  sub_1D9D458C8();
  v17 = v16;

  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_18(v6, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  return v17;
}

- (id)itemProviderForActivityWithAdamId:(id)a3 previewMetadata:(id)a4 existingItemProvider:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;

  OUTLINED_FUNCTION_106_0();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = sub_1DA143E80();
  v13 = v12;
  v14 = v8;
  v15 = v6;
  v16 = v10;
  v17 = sub_1D9D45B5C(v11, v13, v14, v6);

  OUTLINED_FUNCTION_74();
  return v17;
}

- (void)handleSharedPlayable:(VUIVideosPlayable *)a3 watchTogetherUrl:(NSURL *)a4 startupAction:(int64_t)a5 previewMetadata:(VUIGroupWatchActivityPreviewMetadata *)a6 completion:(id)a7
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const void *v17;
  void *v18;
  _QWORD *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  OUTLINED_FUNCTION_106_0();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = _Block_copy(v17);
  v19 = (_QWORD *)OUTLINED_FUNCTION_48();
  v19[2] = v14;
  v19[3] = v12;
  v19[4] = v10;
  v19[5] = v8;
  v19[6] = v18;
  v19[7] = v16;
  v20 = v14;
  v21 = v12;
  v22 = v8;
  v23 = v16;
  sub_1D9BCFD10((uint64_t)&unk_1F0219258, (uint64_t)v19);
}

- (BOOL)handleCommerceSharedWatchUrl:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _TtC8VideosUI22GroupActivitiesManager *v7;
  char v8;
  char v9;

  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_316();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_79_4();
  sub_1DA13F3EC();
  v7 = self;
  sub_1D9D479FC();
  v9 = v8;

  OUTLINED_FUNCTION_5_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  return v9 & 1;
}

- (void)playerDidStart:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  OUTLINED_FUNCTION_63_1();
  v5 = (void *)OUTLINED_FUNCTION_36_5();
  sub_1D9D48E40(v5);

  OUTLINED_FUNCTION_4_3(v6);
}

- (void)requestPermissionToStartCowatchingForPlayable:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC8VideosUI22GroupActivitiesManager *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1D9D48FD4(a3, (uint64_t)v8, v6);
  _Block_release(v6);

  OUTLINED_FUNCTION_4_3(v8);
}

- (void)startPlaybackFailed
{
  _TtC8VideosUI22GroupActivitiesManager *v2;

  v2 = self;
  sub_1D9D49CB8();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)leaveSession
{
  _TtC8VideosUI22GroupActivitiesManager *v2;

  v2 = self;
  sub_1D9D49D00();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)endSessionWithReason:(unint64_t)a3
{
  _TtC8VideosUI22GroupActivitiesManager *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9D42EA8();
  OUTLINED_FUNCTION_5_8(v4);
}

@end
