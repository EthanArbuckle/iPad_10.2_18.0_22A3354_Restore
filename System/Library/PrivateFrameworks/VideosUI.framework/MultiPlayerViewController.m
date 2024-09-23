@implementation MultiPlayerViewController

- (NSArray)playerViewControllers
{
  _TtC8VideosUI25MultiPlayerViewController *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  sub_1D9AFC4FC();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_6_10(v3, &qword_1F0207478);
  v4 = (void *)sub_1DA1440F0();
  OUTLINED_FUNCTION_79();
  return (NSArray *)OUTLINED_FUNCTION_111(v4);
}

- (VUIImageProxy)backgroundImageProxy
{
  void *v2;
  _TtC8VideosUI25MultiPlayerViewController *v3;

  v3 = self;
  sub_1D9AFC798();
  OUTLINED_FUNCTION_214();
  return (VUIImageProxy *)OUTLINED_FUNCTION_111(v2);
}

- (void)setBackgroundImageProxy:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_91_0();
  v4 = v3;
  OUTLINED_FUNCTION_36_5();
  sub_1D9AFC7F0();
  OUTLINED_FUNCTION_5_8(v5);
}

- (VUIMultiPlayerViewControllerDelegate)delegate
{
  sub_1D9AFC990();
}

- (void)setDelegate:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_352();
  v4 = v3;
  OUTLINED_FUNCTION_36_5();
  sub_1D9AFC9F8();
  OUTLINED_FUNCTION_5_8(v5);
}

- (unint64_t)distribution
{
  _TtC8VideosUI25MultiPlayerViewController *v2;
  unint64_t result;

  v2 = self;
  sub_1D9AFCB2C();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)isShowingProspectivePlayer
{
  _TtC8VideosUI25MultiPlayerViewController *v2;
  BOOL result;

  v2 = self;
  sub_1D9AFCC54();

  OUTLINED_FUNCTION_2_1();
  return result;
}

- (int64_t)prospectivePlayerIndex
{
  _TtC8VideosUI25MultiPlayerViewController *v2;
  int64_t result;

  v2 = self;
  sub_1D9AFCCA8();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)prefersStatusBarHidden
{
  BOOL result;

  sub_1D9AFCEF0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  BOOL result;

  sub_1D9AFCF20();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI25MultiPlayerViewController)initWithCoder:(id)a3
{
  _TtC8VideosUI25MultiPlayerViewController *result;

  sub_1D9AFF074(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)viewDidLoad
{
  _TtC8VideosUI25MultiPlayerViewController *v2;

  v2 = self;
  sub_1D9B05A70((SEL *)&selRef_viewDidLoad);
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)viewDidLayoutSubviews
{
  _TtC8VideosUI25MultiPlayerViewController *v2;

  v2 = self;
  sub_1D9AFF330();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI25MultiPlayerViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9AFF3F4(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8VideosUI25MultiPlayerViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9AFF514(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)addPlayerViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;

  OUTLINED_FUNCTION_276_1();
  if (OUTLINED_FUNCTION_188_1(v7, v8, v9, v10, v11))
  {
    v12 = OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_321_1(v12);
  }
  v6;
  v13 = v5;
  OUTLINED_FUNCTION_95_11();
  sub_1D9B00F60();
  OUTLINED_FUNCTION_112_8();
  OUTLINED_FUNCTION_3_5(v13);
}

- (void)removePlayerViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;

  OUTLINED_FUNCTION_276_1();
  if (OUTLINED_FUNCTION_188_1(v7, v8, v9, v10, v11))
  {
    v12 = OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_321_1(v12);
  }
  v6;
  v13 = v5;
  OUTLINED_FUNCTION_95_11();
  sub_1D9B01064();
  OUTLINED_FUNCTION_112_8();
  OUTLINED_FUNCTION_3_5(v13);
}

- (void)replacePlayerViewController:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const void *v10;
  void *v11;
  id v12;
  id v13;

  OUTLINED_FUNCTION_276_1();
  v7 = v6;
  v9 = v8;
  v11 = _Block_copy(v10);
  if (v11)
    *(_QWORD *)(OUTLINED_FUNCTION_37() + 16) = v11;
  v12 = v7;
  v13 = v9;
  OUTLINED_FUNCTION_248_1();
  sub_1D9B01400();
  OUTLINED_FUNCTION_62_14();

  OUTLINED_FUNCTION_3_5(v13);
}

- (void)enterFullscreenWithPlayerViewController:(id)a3 completion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const void *v8;
  void *v9;
  id v10;
  id v11;

  OUTLINED_FUNCTION_276_1();
  v5 = v4;
  v7 = v6;
  v9 = _Block_copy(v8);
  if (v9)
    *(_QWORD *)(OUTLINED_FUNCTION_37() + 16) = v9;
  v10 = v5;
  v11 = v7;
  sub_1D9B017D8();
  OUTLINED_FUNCTION_148_0();

  OUTLINED_FUNCTION_3_5(v11);
}

- (void)exitFullscreenWithCompletion:(id)a3
{
  void *v4;
  _TtC8VideosUI25MultiPlayerViewController *v5;

  v4 = _Block_copy(a3);
  if (v4)
    *(_QWORD *)(OUTLINED_FUNCTION_37() + 16) = v4;
  v5 = self;
  sub_1D9B01B0C();
  OUTLINED_FUNCTION_148_0();
  OUTLINED_FUNCTION_4_3(v5);
}

- (void)setProspectivePlayerVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  OUTLINED_FUNCTION_276_1();
  v11 = OUTLINED_FUNCTION_187_3(v6, v7, v8, v9, v10);
  if (v11)
  {
    v12 = OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_321_1(v12);
    v11 = sub_1D9B0BA94;
  }
  v13 = v5;
  OUTLINED_FUNCTION_95_11();
  sub_1D9B01D28();
  sub_1D97B50A8((uint64_t)v11);
  OUTLINED_FUNCTION_3_5(v13);
}

- (void)setProspectivePlayerVisible:(BOOL)a3 atIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  void *v6;
  void *v7;
  const void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  char v12;
  void (*v13)(uint64_t);
  uint64_t v14;
  id v15;

  OUTLINED_FUNCTION_276_1();
  v7 = v6;
  v9 = _Block_copy(v8);
  if (v9)
    *(_QWORD *)(OUTLINED_FUNCTION_37() + 16) = v9;
  v15 = v7;
  OUTLINED_FUNCTION_248_1();
  sub_1D9B01E2C(v10, v11, v12, v13, v14);
  OUTLINED_FUNCTION_62_14();
  OUTLINED_FUNCTION_3_5(v15);
}

- (void)setDetailsViewControllerVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  OUTLINED_FUNCTION_276_1();
  v11 = OUTLINED_FUNCTION_187_3(v6, v7, v8, v9, v10);
  if (v11)
  {
    v12 = OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_321_1(v12);
    v11 = sub_1D9B07CC0;
  }
  v17 = v5;
  OUTLINED_FUNCTION_95_11();
  sub_1D9B02160(v13, v14, v15, v16);
  sub_1D97B50A8((uint64_t)v11);
  OUTLINED_FUNCTION_3_5(v17);
}

- (CGRect)presentationRectForPlayerViewController:(id)a3
{
  void *v3;
  id v5;
  _TtC8VideosUI25MultiPlayerViewController *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  v5 = a3;
  v6 = self;
  OUTLINED_FUNCTION_183_0();
  sub_1D9B02FE8();
  OUTLINED_FUNCTION_42();

  v7 = OUTLINED_FUNCTION_88();
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (BOOL)isSupportedScreenSize:(CGSize)a3
{
  id v3;
  id v4;
  double v5;
  double v6;
  BOOL result;

  OUTLINED_FUNCTION_8_14();
  v4 = v3;
  v5 = OUTLINED_FUNCTION_21_4();
  sub_1D9B03260(v5, v6);

  OUTLINED_FUNCTION_59();
  return result;
}

- (void)captureAndShowPlayerScreenshots
{
  _TtC8VideosUI25MultiPlayerViewController *v2;

  v2 = self;
  sub_1D9B033BC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)recordMetricsEventWithIdentifier:(id)a3 impressionsData:(id)a4 locationData:(id)a5 didAddPlayer:(BOOL)a6
{
  char v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  OUTLINED_FUNCTION_106_0();
  v7 = v6;
  v9 = v8;
  v10 = sub_1DA143E80();
  v12 = v11;
  v13 = sub_1DA1440FC();
  v14 = sub_1DA1440FC();
  v15 = v9;
  sub_1D9B03434(v10, v12, v13, v14, v7);

  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_46();
  swift_bridgeObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v4;
  id v6;

  OUTLINED_FUNCTION_8_14();
  OUTLINED_FUNCTION_352();
  v6 = v4;
  OUTLINED_FUNCTION_21_4();
  sub_1D9B04C74(a4);
  OUTLINED_FUNCTION_107_0();

}

- (_TtC8VideosUI25MultiPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9B05A14();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_fullscreenPlayerViewController);
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_exitFullscreenCompletion));
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController____lazy_storage___gestureManager);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController____lazy_storage___backgroundView);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_ghostPlayerViewController);
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_delegate);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_playerView);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController____lazy_storage___headerView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController____lazy_storage___grabberView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_detailsViewController);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_topConstraint);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_bottomConstraint);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_leadingConstraint);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_trailingConstraint);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_grabberBottomConstraint);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_stateMachine));
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v5 = OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  swift_unknownObjectRetain();
  v6 = v4;
  sub_1D9B06080();

  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_4_3(v6);
}

- (id)playerViewController:(id)a3 targetViewForDismissalAnimationWithProposedTargetView:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v6 = OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v7 = v4;
  v8 = v5;
  v9 = OUTLINED_FUNCTION_183_0();
  sub_1D9B061F0(v9, v4);

  return v7;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  _TtC8VideosUI25MultiPlayerViewController *v6;
  void *v7;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  v7 = (void *)sub_1D9D742B0((uint64_t)v6);

  OUTLINED_FUNCTION_107_0();
  return v7;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  sub_1D9D75614(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_1D9D74BD0);
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  sub_1D9D75614(self, (uint64_t)a2, a3, (uint64_t)a4, sub_1D9D74DA8);
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  sub_1D9D75614(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_1D9D7505C);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  sub_1D9D75614(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_1D9D752D0);
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8VideosUI25MultiPlayerViewController *v11;
  uint64_t v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1D9D75678((uint64_t)v11, v12, v10);
  OUTLINED_FUNCTION_86_4();

  return self;
}

@end
