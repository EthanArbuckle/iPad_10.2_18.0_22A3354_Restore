@implementation DownloadButtonContentView

- (_TtC9SeymourUI25DownloadButtonContentView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25DownloadButtonContentView *)sub_22B6EB988(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI25DownloadButtonContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6ED558();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25DownloadButtonContentView_contentBottomConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25DownloadButtonContentView_contentLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25DownloadButtonContentView_contentTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25DownloadButtonContentView_contentTrailingConstraint));

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI25DownloadButtonContentView_titleFontDescriptor);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI25DownloadButtonContentView_titleFontDescriptor);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI25DownloadButtonContentView_titleFontDescriptor);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25DownloadButtonContentView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25DownloadButtonContentView_titleLabel));
}

@end
