@implementation ResizableLabel

- (_TtC12PhotosUICore14ResizableLabel)initWithFrame:(CGRect)a3
{
  return (_TtC12PhotosUICore14ResizableLabel *)ResizableLabel.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12PhotosUICore14ResizableLabel)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s12PhotosUICore14ResizableLabelC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore14ResizableLabel_targetLabel), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ResizableLabel();
  -[ResizableLabel frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  _TtC12PhotosUICore14ResizableLabel *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for ResizableLabel();
  v15.receiver = self;
  v15.super_class = v8;
  v9 = self;
  -[ResizableLabel frame](&v15, sel_frame);
  v17.origin.x = v10;
  v17.origin.y = v11;
  v17.size.width = v12;
  v17.size.height = v13;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (!CGRectEqualToRect(v16, v17))
    sub_1A69C2810(0.0, 0.0, width, height);
  v14.receiver = v9;
  v14.super_class = v8;
  -[ResizableLabel setFrame:](&v14, sel_setFrame_, x, y, width, height);

}

- (void).cxx_destruct
{

}

@end
