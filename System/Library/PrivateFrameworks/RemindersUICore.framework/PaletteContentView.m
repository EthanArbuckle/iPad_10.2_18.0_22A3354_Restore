@implementation PaletteContentView

- (_TtC15RemindersUICoreP33_7BA5891348DD5304637361581A4B546418PaletteContentView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICoreP33_7BA5891348DD5304637361581A4B546418PaletteContentView *)sub_1B4224360(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICoreP33_7BA5891348DD5304637361581A4B546418PaletteContentView)initWithCoder:(id)a3
{
  _TtC15RemindersUICoreP33_7BA5891348DD5304637361581A4B546418PaletteContentView *result;

  result = (_TtC15RemindersUICoreP33_7BA5891348DD5304637361581A4B546418PaletteContentView *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  v2 = (char *)v11.receiver;
  -[PaletteContentView layoutSubviews](&v11, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v11.receiver, v11.super_class);
  v4 = v3;
  objc_msgSend(v2, sel_layoutMargins);
  v6 = v5;
  objc_msgSend(v2, sel_layoutMargins);
  v8 = v4 - (v6 + v7);
  v9 = *(void **)&v2[OBJC_IVAR____TtC15RemindersUICoreP33_7BA5891348DD5304637361581A4B546418PaletteContentView_titleLabel];
  objc_msgSend(v9, sel_sizeThatFits_, v8, 1.79769313e308);
  objc_msgSend(v9, sel_setFrame_, v6, 0.0, v8, v10);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC15RemindersUICoreP33_7BA5891348DD5304637361581A4B546418PaletteContentView *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double MaxY;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;
  CGRect v16;

  width = a3.width;
  v4 = self;
  -[PaletteContentView layoutMargins](v4, sel_layoutMargins);
  v6 = v5;
  -[PaletteContentView layoutMargins](v4, sel_layoutMargins);
  v8 = width - (v6 + v7);
  objc_msgSend(*(id *)((char *)&v4->super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICoreP33_7BA5891348DD5304637361581A4B546418PaletteContentView_titleLabel), sel_sizeThatFits_, v8, 1.79769313e308);
  v16.size.height = v9;
  v16.origin.y = 0.0;
  v16.origin.x = v6;
  v16.size.width = v8;
  MaxY = CGRectGetMaxY(v16);
  -[PaletteContentView layoutMargins](v4, sel_layoutMargins);
  v12 = v11;

  v13 = MaxY + v12;
  v14 = width;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICoreP33_7BA5891348DD5304637361581A4B546418PaletteContentView_titleLabel));
}

@end
