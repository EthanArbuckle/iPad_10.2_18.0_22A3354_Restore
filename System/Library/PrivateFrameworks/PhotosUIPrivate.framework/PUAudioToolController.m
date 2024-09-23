@implementation PUAudioToolController

- (void)viewDidLoad
{
  _TtC15PhotosUIPrivate21PUAudioToolController *v2;

  v2 = self;
  sub_1AAC17288();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15PhotosUIPrivate21PUAudioToolController *v3;

  v3 = self;
  sub_1AAC1766C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15PhotosUIPrivate21PUAudioToolController *v3;

  v3 = self;
  sub_1AAC17718();

}

- (void)viewDidLayoutSubviews
{
  _TtC15PhotosUIPrivate21PUAudioToolController *v2;

  v2 = self;
  sub_1AAC1778C();

}

- (_TtC15PhotosUIPrivate21PUAudioToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1AB08D498();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC15PhotosUIPrivate21PUAudioToolController *)sub_1AAC18F18(v5, v7, a4);
}

- (_TtC15PhotosUIPrivate21PUAudioToolController)initWithCoder:(id)a3
{
  return (_TtC15PhotosUIPrivate21PUAudioToolController *)sub_1AAC19218((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_toolTitleLabel));
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_audioMixModeCollectionViewContainerView);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_audioMixModeCollectionView);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_gradientMask);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_mixBiasLabel);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_slider);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_sliderSnappingController);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate21PUAudioToolController_muteButton);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15PhotosUIPrivate21PUAudioToolController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1AB08B050();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB08B020();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1AAC19574(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5;
  _TtC15PhotosUIPrivate21PUAudioToolController *v6;
  int64_t v7;
  int64_t v8;

  v5 = a3;
  v6 = self;
  sub_1AAC19750();
  v8 = v7;

  return v8;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC15PhotosUIPrivate21PUAudioToolController *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  CGSize result;

  v8 = sub_1AB08B050();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB08B020();
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = sub_1AAC197F0();
  v17 = v16;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15PhotosUIPrivate21PUAudioToolController *v11;
  uint64_t v12;

  v6 = sub_1AB08B050();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB08B020();
  v10 = a3;
  v11 = self;
  sub_1AAC199AC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)sliderWillBeginScrolling:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate21PUAudioToolController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC1A0BC(v4);

}

- (void)slider:(id)a3 willUpdateValue:(double *)a4 withVelocity:(double)a5
{
  id v8;
  _TtC15PhotosUIPrivate21PUAudioToolController *v9;

  v8 = a3;
  v9 = self;
  sub_1AAC1A240(a5, (uint64_t)v9, (uint64_t)a4);

}

- (void)sliderDidScroll:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate21PUAudioToolController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC1A2D4(v4);

}

- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v6;
  _TtC15PhotosUIPrivate21PUAudioToolController *v7;

  v6 = a3;
  v7 = self;
  sub_1AAC1A5A4();

}

- (void)sliderDidEndScrolling:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate21PUAudioToolController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC1A5F8();

}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  id v11;
  id v12;
  id v13;
  _TtC15PhotosUIPrivate21PUAudioToolController *v14;

  swift_unknownObjectRetain();
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_1AAC1A700((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
  swift_unknownObjectRelease();

}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  uint64_t v4;
  _TtC15PhotosUIPrivate21PUAudioToolController *v5;

  if (a3)
    v4 = sub_1AB08D6FC();
  else
    v4 = 0;
  v5 = self;
  sub_1AAC1A868(v4);

  swift_bridgeObjectRelease();
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (NSArray)leadingToolbarViews
{
  void *v2;

  if (sub_1AAC1AA20())
  {
    sub_1AAB74D50(0, &qword_1EEBB8030);
    v2 = (void *)sub_1AB08D5B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (UIView)centerToolbarView
{
  id v2;

  sub_1AAC1AAB0();
  return (UIView *)v2;
}

- (int64_t)toolControllerTag
{
  return 1007;
}

- (NSString)localizedName
{
  return (NSString *)sub_1AAC1AB7C(self, (uint64_t)a2, 0xD00000000000001ALL, 0x80000001AB0F9980, (uint64_t (*)(void))PULocalizedString);
}

- (NSString)toolbarIconGlyphName
{
  return (NSString *)sub_1AAC1AB28((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1AAC1AB10);
}

- (NSString)selectedToolbarIconGlyphName
{
  return (NSString *)sub_1AAC1AB28((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1AAC1AB10);
}

- (NSString)toolbarIconAccessibilityLabel
{
  return (NSString *)sub_1AAC1AB7C(self, (uint64_t)a2, 0xD000000000000024, 0x80000001AB0F9930, MEMORY[0x1E0D7CB88]);
}

@end
