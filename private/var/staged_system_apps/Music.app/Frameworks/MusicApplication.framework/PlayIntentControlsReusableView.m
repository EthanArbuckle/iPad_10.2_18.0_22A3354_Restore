@implementation PlayIntentControlsReusableView

- (_TtC16MusicApplication30PlayIntentControlsReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication30PlayIntentControlsReusableView *)sub_8F9A5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication30PlayIntentControlsReusableView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_8FADB0();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC16MusicApplication30PlayIntentControlsReusableView *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_8FAFEC(v4);

  return v6;
}

- (void)prepareForReuse
{
  _TtC16MusicApplication30PlayIntentControlsReusableView *v2;

  v2 = self;
  sub_8F9F60();

}

- (void)layoutSubviews
{
  _TtC16MusicApplication30PlayIntentControlsReusableView *v2;

  v2 = self;
  sub_8FA020();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication30PlayIntentControlsReusableView *v6;

  v5 = a3;
  v6 = self;
  sub_8FA4FC(a3);

}

- (UIControl)accessibilityPlayButton
{
  return (UIControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                              + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_layoutManager));
}

- (UIControl)accessibilityShuffleButton
{
  return (UIControl *)*(id *)&self->userInterfaceComponents[OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_layoutManager];
}

- (void).cxx_destruct
{
  void *v3;
  uint64_t v4;
  void *v5;

  swift_bridgeObjectRelease();
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_playHandler), *(_QWORD *)&self->userInterfaceComponents[OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_playHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_shuffleHandler), *(_QWORD *)&self->userInterfaceComponents[OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_shuffleHandler]);
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_textDrawingCache));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_layoutManager);

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_textComponents);
  v5 = *(void **)&self->userInterfaceComponents[OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_textComponents];
  swift_bridgeObjectRelease();

  swift_release(v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PlayIntentControlsReusableView_topHairlineView));
}

@end
