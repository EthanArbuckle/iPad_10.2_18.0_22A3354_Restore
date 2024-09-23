@implementation PhotosDynamicHeaderView

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[PhotosDynamicHeaderView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_contentView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }

}

- (NSCopying)userData
{
  swift_beginAccess();
  return (NSCopying *)(id)swift_unknownObjectRetain();
}

- (void)setUserData:(id)a3
{
  id *v5;
  _TtC12PhotosUICore23PhotosDynamicHeaderView *v6;

  v5 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_userData);
  swift_beginAccess();
  *v5 = a3;
  swift_unknownObjectRetain_n();
  v6 = self;
  swift_unknownObjectRelease();
  sub_1A6B96454();

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

  v2 = (double *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_clippingRect);
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
  v7 = (CGFloat *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_clippingRect);
  swift_beginAccess();
  *v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (void)becomeReusable
{
  _QWORD *v3;
  _TtC12PhotosUICore23PhotosDynamicHeaderView *v4;

  v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_userData);
  swift_beginAccess();
  *v3 = 0;
  v4 = self;
  swift_unknownObjectRelease();
  sub_1A6B96454();

}

- (BOOL)isFloating
{
  return 1;
}

- (_TtC12PhotosUICore23PhotosDynamicHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _OWORD *v9;
  _OWORD *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (_OWORD *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_configuration);
  *v9 = 0u;
  v9[1] = 0u;
  v9[2] = 0u;
  v9[3] = 0u;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_userData) = 0;
  v10 = (_OWORD *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_clippingRect);
  *v10 = 0u;
  v10[1] = 0u;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_isFloating) = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[PhotosDynamicHeaderView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12PhotosUICore23PhotosDynamicHeaderView)initWithCoder:(id)a3
{
  return (_TtC12PhotosUICore23PhotosDynamicHeaderView *)sub_1A6B96D38(a3);
}

- (void).cxx_destruct
{
  sub_1A6B9F4EC((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_configuration, (unint64_t *)&unk_1EE8D4768, (uint64_t)&type metadata for PhotosDynamicHeaderView.Configuration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_contentView));
  swift_unknownObjectRelease();
}

@end
