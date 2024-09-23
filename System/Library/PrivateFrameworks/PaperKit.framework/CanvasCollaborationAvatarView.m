@implementation CanvasCollaborationAvatarView

- (_TtC8PaperKit29CanvasCollaborationAvatarView)initWithFrame:(CGRect)a3
{
  specialized CanvasCollaborationAvatarView.init(frame:)();
}

- (_TtC8PaperKit29CanvasCollaborationAvatarView)initWithCoder:(id)a3
{
  CanvasCollaborationAvatarView.init(coder:)(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8PaperKit29CanvasCollaborationAvatarView *v6;
  _TtC8PaperKit29CanvasCollaborationAvatarView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  CanvasCollaborationAvatarView.traitCollectionDidChange(_:)(v8);

}

- (void)didMoveToWindow
{
  _TtC8PaperKit29CanvasCollaborationAvatarView *v2;

  v2 = self;
  CanvasCollaborationAvatarView.didMoveToWindow()();

}

- (void)handleTap:(id)a3
{
  id v4;
  _TtC8PaperKit29CanvasCollaborationAvatarView *v5;

  v4 = a3;
  v5 = self;
  specialized CanvasCollaborationAvatarView.handleTap(_:)();

}

- (void)handleHoverWithRecognizer:(id)a3
{
  id v4;
  _TtC8PaperKit29CanvasCollaborationAvatarView *v5;

  v4 = a3;
  v5 = self;
  CanvasCollaborationAvatarView.handleHover(recognizer:)(v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CanvasCollaborationAvatarView_color));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CanvasCollaborationAvatarView_boundingSuperview));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CanvasCollaborationAvatarView_autocollapseTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CanvasCollaborationAvatarView_autohideTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CanvasCollaborationAvatarView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CanvasCollaborationAvatarView____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CanvasCollaborationAvatarView____lazy_storage___imageViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CanvasCollaborationAvatarView____lazy_storage___imageViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CanvasCollaborationAvatarView____lazy_storage___imageViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CanvasCollaborationAvatarView____lazy_storage___imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CanvasCollaborationAvatarView____lazy_storage___labelWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CanvasCollaborationAvatarView____lazy_storage___labelHeightConstraint));
}

@end
