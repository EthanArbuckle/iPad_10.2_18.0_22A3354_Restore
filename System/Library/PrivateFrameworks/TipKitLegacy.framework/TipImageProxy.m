@implementation TipImageProxy

- (UIImage)image
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TipImageProxy();
  return -[TipImageProxy image](&v3, sel_image);
}

- (void)setImage:(id)a3
{
  _BYTE *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TipImageProxy();
  v4 = v5.receiver;
  -[TipImageProxy setImage:](&v5, sel_setImage_, a3);
  v4[OBJC_IVAR___TipImageProxy_shouldDisplay] = 1;

}

- (BOOL)clipsToBounds
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TipImageProxy();
  return -[TipImageProxy clipsToBounds](&v3, sel_clipsToBounds);
}

- (void)setClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TipImageProxy();
  v4 = v5.receiver;
  -[TipImageProxy setClipsToBounds:](&v5, sel_setClipsToBounds_, v3);
  v4[OBJC_IVAR___TipImageProxy_shouldDisplay] = 1;

}

- (void)addSubview:(id)a3
{
  id v4;
  _BYTE *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TipImageProxy();
  v4 = a3;
  v5 = v6.receiver;
  -[TipImageProxy addSubview:](&v6, sel_addSubview_, v4);
  v5[OBJC_IVAR___TipImageProxy_shouldDisplay] = 1;

}

- (TipImageProxy)initWithImage:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___TipImageProxy_shouldDisplay) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TipImageProxy();
  return -[TipImageProxy initWithImage:](&v5, sel_initWithImage_, a3);
}

- (TipImageProxy)initWithImage:(id)a3 highlightedImage:(id)a4
{
  objc_super v7;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___TipImageProxy_shouldDisplay) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TipImageProxy();
  return -[TipImageProxy initWithImage:highlightedImage:](&v7, sel_initWithImage_highlightedImage_, a3, a4);
}

- (TipImageProxy)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___TipImageProxy_shouldDisplay) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TipImageProxy();
  return -[TipImageProxy initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (TipImageProxy)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___TipImageProxy_shouldDisplay) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TipImageProxy();
  return -[TipImageProxy initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
