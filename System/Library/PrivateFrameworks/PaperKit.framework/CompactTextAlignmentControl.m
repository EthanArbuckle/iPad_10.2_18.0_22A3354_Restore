@implementation CompactTextAlignmentControl

- (_TtC8PaperKit27CompactTextAlignmentControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized CompactTextAlignmentControl.init(coder:)();
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
  -[CompactTextAlignmentControl layoutSubviews](&v6, sel_layoutSubviews);
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
  _TtC8PaperKit27CompactTextAlignmentControl *v2;

  v2 = self;
  CompactTextAlignmentControl.didTapSelf()();

}

- (void)textAlignmentValueDidChange:(id)a3
{
  char v4;
  char *v5;
  id v6;
  _TtC8PaperKit27CompactTextAlignmentControl *v7;

  v4 = *((_BYTE *)a3 + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_selectedTextAlignment + 8);
  v5 = (char *)self + OBJC_IVAR____TtC8PaperKit27CompactTextAlignmentControl_selectedTextAlignment;
  *(_QWORD *)v5 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_selectedTextAlignment);
  v5[8] = v4;
  v6 = a3;
  v7 = self;
  CompactTextAlignmentControl.updateUI(selectedTextAlignmentDidChange:)(1);
  -[CompactTextAlignmentControl sendActionsForControlEvents:](v7, sel_sendActionsForControlEvents_, 4096);

}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[CompactTextAlignmentControl isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC8PaperKit27CompactTextAlignmentControl *v6;
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
  -[CompactTextAlignmentControl setHighlighted:](&v11, sel_setHighlighted_, v3);
  v10.receiver = v6;
  v10.super_class = ObjectType;
  LODWORD(v3) = -[CompactTextAlignmentControl isHighlighted](&v10, sel_isHighlighted);
  v7 = (void *)objc_opt_self();
  v8 = &selRef_secondarySystemFillColor;
  if (!v3)
    v8 = &selRef_quaternarySystemFillColor;
  v9 = objc_msgSend(v7, *v8);
  -[CompactTextAlignmentControl setBackgroundColor:](v6, sel_setBackgroundColor_, v9);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (_TtC8PaperKit27CompactTextAlignmentControl)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit27CompactTextAlignmentControl *result;

  result = (_TtC8PaperKit27CompactTextAlignmentControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27CompactTextAlignmentControl_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27CompactTextAlignmentControl_symbolConfiguration));
}

@end
