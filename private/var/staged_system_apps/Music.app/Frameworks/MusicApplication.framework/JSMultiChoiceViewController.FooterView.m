@implementation JSMultiChoiceViewController.FooterView

- (_TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  uint64_t v9;
  _TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView *v10;
  _TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_text);
  *v8 = 0;
  v8[1] = 0xE000000000000000;
  v9 = OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_label;
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)sub_A5FD2C();

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for JSMultiChoiceViewController.FooterView();
  v11 = -[JSMultiChoiceViewController.FooterView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  -[JSMultiChoiceViewController.FooterView addSubview:](v11, "addSubview:", *(Class *)((char *)&v11->super.super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_label));
  return v11;
}

- (_TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView)initWithCoder:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;
  _TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_text);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  v5 = OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_label;
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_A5FD2C();

  result = (_TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSMultiChoiceViewController.swift", 50, 2, 356, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView *v2;

  v2 = self;
  sub_A5FB0C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  -[JSMultiChoiceViewController.FooterView music_inheritedLayoutInsets](v5, "music_inheritedLayoutInsets");
  UIEdgeInsetsInsetRect(0.0, 0.0, width, height, v6, v7);
  objc_msgSend(*(id *)((char *)&v5->super.super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_label), "sizeThatFits:", v8, v9);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->text[OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_text]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_label));
}

@end
