@implementation CompactTextStyleView

- (_TtC8PaperKit20CompactTextStyleView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  _TtC8PaperKit20CompactTextStyleView *result;

  v5 = OBJC_IVAR____TtC8PaperKit20CompactTextStyleView_imageView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC8PaperKit20CompactTextStyleView_image;
  closure #1 in variable initialization expression of CompactTextStyleView.image();
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = v9;

  result = (_TtC8PaperKit20CompactTextStyleView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  double Height;
  double Width;
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[CompactTextStyleView layoutSubviews](&v6, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v6.receiver, v6.super_class);
  objc_msgSend(v2, sel_bounds);
  Height = CGRectGetHeight(v7);
  objc_msgSend(v2, sel_bounds);
  Width = CGRectGetWidth(v8);
  if (Width >= Height)
    Width = Height;
  objc_msgSend(v3, sel_setCornerRadius_, Width * 0.5);

}

- (void)didTapSelf
{
  _TtC8PaperKit20CompactTextStyleView *v2;

  v2 = self;
  CompactTextStyleView.didTapSelf()();

}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[CompactTextStyleView isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC8PaperKit20CompactTextStyleView *v6;
  void *v7;
  char **v8;
  id v9;
  objc_super v10;
  objc_super v11;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v11.receiver = self;
  v11.super_class = ObjectType;
  v6 = self;
  -[CompactTextStyleView setHighlighted:](&v11, sel_setHighlighted_, v3);
  v10.receiver = v6;
  v10.super_class = ObjectType;
  LODWORD(v3) = -[CompactTextStyleView isHighlighted](&v10, sel_isHighlighted);
  v7 = (void *)objc_opt_self();
  v8 = &selRef_secondarySystemFillColor;
  if (!v3)
    v8 = &selRef_quaternarySystemFillColor;
  v9 = objc_msgSend(v7, *v8);
  -[CompactTextStyleView setBackgroundColor:](v6, sel_setBackgroundColor_, v9);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (_TtC8PaperKit20CompactTextStyleView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit20CompactTextStyleView *result;

  result = (_TtC8PaperKit20CompactTextStyleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20CompactTextStyleView_textStyleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20CompactTextStyleView_imageView));

}

@end
