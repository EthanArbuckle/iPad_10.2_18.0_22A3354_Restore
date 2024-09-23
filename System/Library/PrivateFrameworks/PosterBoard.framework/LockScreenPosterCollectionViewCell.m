@implementation LockScreenPosterCollectionViewCell

- (_TtC11PosterBoard34LockScreenPosterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard34LockScreenPosterCollectionViewCell *)sub_1CBB2CAD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard34LockScreenPosterCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1CBB34C58();
}

- (void)dealloc
{
  _TtC11PosterBoard34LockScreenPosterCollectionViewCell *v2;

  v2 = self;
  sub_1CBB2CF1C();
}

- (void).cxx_destruct
{
  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_liveContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_liveFloatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_lockVibrancyConfiguration));
  swift_unknownObjectWeakDestroy();
  sub_1CBAFFB5C((uint64_t)self + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_displayDate, (uint64_t *)&unk_1ED89A0A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_scrollableContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_descriptorProvider));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_floatingLayerSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_prominentController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_widgetSidebarProminentController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_floatingProminentController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_titleStyleConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_complicationLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_floatingLayerSnapshotImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_focusButton));
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  id v4;
  _TtC11PosterBoard34LockScreenPosterCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB34E54((uint64_t)&unk_1E86FA480, (uint64_t)sub_1CBB35188, (uint64_t)&block_descriptor_93);

}

- (void)editingSceneViewControllerDidFinishShowingContent:(id)a3
{
  id v4;
  _TtC11PosterBoard34LockScreenPosterCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB33598();

}

- (BOOL)layoutModeUsesFullscreenSizedMetrics
{
  _TtC11PosterBoard34LockScreenPosterCollectionViewCell *v2;
  char v3;

  v2 = self;
  v3 = sub_1CBB2EC94();

  return v3 & 1;
}

- (void)layoutSubviews
{
  _TtC11PosterBoard34LockScreenPosterCollectionViewCell *v2;

  v2 = self;
  sub_1CBB2FAE8();

}

- (void)prepareForReuse
{
  _TtC11PosterBoard34LockScreenPosterCollectionViewCell *v2;

  v2 = self;
  sub_1CBB2FE34();

}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                 + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_scrollView));
}

- (void)setScrollView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_scrollView);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_scrollView) = (Class)a3;
  v3 = a3;

}

- (void)presentFocusSelector
{
  _TtC11PosterBoard34LockScreenPosterCollectionViewCell *v3;

  if (MEMORY[0x1D17A3DF0]((char *)self + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_delegate, a2))
  {
    v3 = self;
    sub_1CBB570C0((uint64_t)v3);

    swift_unknownObjectRelease();
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC11PosterBoard34LockScreenPosterCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB33ED8(v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  id v8;
  double v9;
  _TtC11PosterBoard34LockScreenPosterCollectionViewCell *v10;

  y = a4.y;
  v8 = a3;
  v10 = self;
  sub_1CBB34430(v8, (uint64_t)a5, v9, y);

}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  _TtC11PosterBoard34LockScreenPosterCollectionViewCell *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1CBB34E54((uint64_t)&unk_1E86FA048, (uint64_t)sub_1CBB3521C, (uint64_t)&block_descriptor_9);
  swift_unknownObjectRelease();

}

@end
