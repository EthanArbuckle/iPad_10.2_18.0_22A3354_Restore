@implementation _UIMagicMorphTransformView

- (BOOL)isUserInteractionEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UIMagicMorphTransformView();
  return -[UIView isUserInteractionEnabled](&v3, sel_isUserInteractionEnabled);
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _TtC5UIKit26_UIMagicMorphTransformView *v4;

  v4 = self;
  sub_18579A8AC(a3);

}

- (_TtC5UIKit26_UIMagicMorphTransformView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18579B868();
}

- (_TtC5UIKit26_UIMagicMorphTransformView)initWithFrame:(CGRect)a3
{
  return (_TtC5UIKit26_UIMagicMorphTransformView *)sub_18579A98C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC5UIKit26_UIMagicMorphTransformView *v2;

  v2 = self;
  sub_18579AAC8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double height;
  double width;
  objc_super v9;
  CGSize result;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5UIKit26_UIMagicMorphTransformView_sourcePreview);
  if (v4)
  {
    objc_msgSend(v4, sel_size, a3.width, a3.height);
  }
  else
  {
    height = a3.height;
    width = a3.width;
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for _UIMagicMorphTransformView();
    -[UIView sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UIMagicMorphTransformView();
  v2 = v3.receiver;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  sub_18579B670();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit26_UIMagicMorphTransformView_sourcePreview));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit26_UIMagicMorphTransformView_portalView));
}

@end
