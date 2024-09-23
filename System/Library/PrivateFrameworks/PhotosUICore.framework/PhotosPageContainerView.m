@implementation PhotosPageContainerView

- (NSCopying)userData
{
  swift_beginAccess();
  return (NSCopying *)(id)swift_unknownObjectRetain();
}

- (void)setUserData:(id)a3
{
  _TtC12PhotosUICore23PhotosPageContainerView *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1A6C66174((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (CGRect)clippingRect
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_clippingRect);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (CGFloat *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_clippingRect);
  swift_beginAccess();
  *v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (void)prepareForReuse
{
  _TtC12PhotosUICore23PhotosPageContainerView *v2;
  _QWORD *v3;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_configuration);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_configuration) = 0;
  v2 = self;
  sub_1A6C6521C(v3);

}

- (_TtC12PhotosUICore23PhotosPageContainerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _OWORD *v7;
  __int128 v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_configuration) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_userData) = 0;
  v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_clippingRect);
  v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *v7 = *MEMORY[0x1E0C9D628];
  v7[1] = v8;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PhotosPageContainerView();
  return -[PhotosPageContainerView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12PhotosUICore23PhotosPageContainerView)initWithCoder:(id)a3
{
  return (_TtC12PhotosUICore23PhotosPageContainerView *)sub_1A6C66070(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_contentView));
  swift_unknownObjectRelease();
}

@end
