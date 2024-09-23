@implementation PEPhotoStylePaletteSlider

- (double)value
{
  PEPhotoStylePaletteSlider *v2;
  double v3;

  v2 = self;
  v3 = PEPhotoStylePaletteSlider.value.getter();

  return v3;
}

- (void)setValue:(double)a3
{
  PEPhotoStylePaletteSlider *v3;

  v3 = self;
  PEPhotoStylePaletteSlider.value.setter();

}

- (NSArray)colors
{
  PEPhotoStylePaletteSlider *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  PEPhotoStylePaletteSlider.colors.getter();
  v4 = v3;

  if (v4)
  {
    sub_20D14E520(0, &qword_2549A8BC8);
    v5 = (void *)sub_20D191E5C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (void)setColors:(id)a3
{
  PEPhotoStylePaletteSlider *v4;

  if (a3)
  {
    sub_20D14E520(0, &qword_2549A8BC8);
    sub_20D191E68();
  }
  v4 = self;
  PEPhotoStylePaletteSlider.colors.setter();

}

- (NSString)gradientCast
{
  PEPhotoStylePaletteSlider *v2;
  void *v3;
  void *v4;

  v2 = self;
  PEPhotoStylePaletteSlider.gradientCast.getter();
  v4 = v3;

  return (NSString *)v4;
}

- (void)setGradientCast:(id)a3
{
  id v4;
  PEPhotoStylePaletteSlider *v5;

  v4 = a3;
  v5 = self;
  PEPhotoStylePaletteSlider.gradientCast.setter();

}

- (id)onValueChanged
{
  return sub_20D14C474(self, (uint64_t)a2, PEPhotoStylePaletteSlider.onValueChanged.getter, (uint64_t)sub_20D14C210, (uint64_t)&block_descriptor_33);
}

- (void)setOnValueChanged:(id)a3
{
  sub_20D14C528(self, (int)a2, a3, (uint64_t)&unk_24C616C30, (uint64_t)sub_20D14E4BC, (void (*)(uint64_t, uint64_t))PEPhotoStylePaletteSlider.onValueChanged.setter);
}

- (id)onGestureDidBegin
{
  return sub_20D14C474(self, (uint64_t)a2, PEPhotoStylePaletteSlider.onGestureDidBegin.getter, (uint64_t)sub_20D1635CC, (uint64_t)&block_descriptor_27);
}

- (void)setOnGestureDidBegin:(id)a3
{
  sub_20D14C528(self, (int)a2, a3, (uint64_t)&unk_24C616BE0, (uint64_t)sub_20D14E8F4, (void (*)(uint64_t, uint64_t))PEPhotoStylePaletteSlider.onGestureDidBegin.setter);
}

- (id)onGestureDidEnd
{
  return sub_20D14C474(self, (uint64_t)a2, PEPhotoStylePaletteSlider.onGestureDidEnd.getter, (uint64_t)sub_20D1635CC, (uint64_t)&block_descriptor_0);
}

- (void)setOnGestureDidEnd:(id)a3
{
  sub_20D14C528(self, (int)a2, a3, (uint64_t)&unk_24C616B90, (uint64_t)sub_20D14E49C, (void (*)(uint64_t, uint64_t))PEPhotoStylePaletteSlider.onGestureDidEnd.setter);
}

- (PEPhotoStylePaletteSlider)initWithValue:(double)a3
{
  return (PEPhotoStylePaletteSlider *)PEPhotoStylePaletteSlider.init(value:)();
}

- (PEPhotoStylePaletteSlider)initWithFrame:(CGRect)a3
{
  return (PEPhotoStylePaletteSlider *)PEPhotoStylePaletteSlider.init(frame:)();
}

- (PEPhotoStylePaletteSlider)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  PEPhotoStylePaletteSlider.init(coder:)();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  Class isa;
  UIEvent_optional v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v10.value.super.isa = (Class)self;
  isa = v10.value.super.isa;
  LOBYTE(self) = PEPhotoStylePaletteSlider.point(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v10);

  return self & 1;
}

- (void)setValue:(double)a3 notifyObserver:(BOOL)a4
{
  PEPhotoStylePaletteSlider *v6;

  v6 = self;
  PEPhotoStylePaletteSlider.setValue(_:notifyObserver:)(a3, a4);

}

- (void).cxx_destruct
{
  swift_release();

}

@end
