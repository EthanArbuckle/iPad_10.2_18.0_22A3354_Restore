@implementation BlurView

- (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView)initWithEffect:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView *)sub_1B4546500(a3);
}

- (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView)initWithCoder:(id)a3
{
  _TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView *result;

  result = (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[BlurView layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  v5 = CGRectInset(v4, 8.0, 8.0);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView_label], sel_setFrame_, v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;
  CGRect v15;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView_label);
  v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  v14.size.width = v7;
  v14.size.height = v8;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v15 = CGRectInset(v14, -8.0, -8.0);
  v9 = v15.size.width;
  v10 = v15.size.height;

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView_label));
}

@end
