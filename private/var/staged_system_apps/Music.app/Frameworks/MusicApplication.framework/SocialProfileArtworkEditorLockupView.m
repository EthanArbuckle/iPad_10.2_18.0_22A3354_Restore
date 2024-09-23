@implementation SocialProfileArtworkEditorLockupView

- (_TtC16MusicApplication36SocialProfileArtworkEditorLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication36SocialProfileArtworkEditorLockupView *)sub_AB4A4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication36SocialProfileArtworkEditorLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_AB5648();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication36SocialProfileArtworkEditorLockupView *v2;

  v2 = self;
  sub_AB5120();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  BOOL v4;
  double v5;
  double v6;
  CGSize result;

  v3 = a3.width + 32.0;
  v4 = a3.width <= 128.0;
  v5 = 160.0;
  if (v4)
    v5 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkEditButtonHandler), *(_QWORD *)&self->artworkEditButtonHandler[OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkEditButtonHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_lockupImageArtworkCatalog));
  sub_9AFF4(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkPlaceholder), *(void **)&self->artworkEditButtonHandler[OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkPlaceholder], *(void **)&self->artworkEditButtonHandler[OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkPlaceholder+ 8], *(void **)&self->lockupImageArtworkCatalog[OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkPlaceholder]);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication36SocialProfileArtworkEditorLockupView_artworkCameraImageView));
}

@end
