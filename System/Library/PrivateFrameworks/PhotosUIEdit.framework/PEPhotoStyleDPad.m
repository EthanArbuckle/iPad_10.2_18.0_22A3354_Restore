@implementation PEPhotoStyleDPad

- (CGPoint)value
{
  PEPhotoStyleDPad *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = self;
  PEPhotoStyleDPad.value.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setValue:(CGPoint)a3
{
  PEPhotoStyleDPad *v3;

  v3 = self;
  PEPhotoStyleDPad.value.setter();

}

- (CGPoint)defaultValue
{
  PEPhotoStyleDPad *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = self;
  PEPhotoStyleDPad.defaultValue.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setDefaultValue:(CGPoint)a3
{
  PEPhotoStyleDPad *v3;

  v3 = self;
  PEPhotoStyleDPad.defaultValue.setter();

}

- (CGImage)backgroundImage
{
  PEPhotoStyleDPad *v2;
  void *v3;

  v2 = self;
  v3 = (void *)PEPhotoStyleDPad.backgroundImage.getter();

  return (CGImage *)v3;
}

- (void)setBackgroundImage:(CGImage *)a3
{
  CGImage *v5;
  PEPhotoStyleDPad *v6;

  v5 = a3;
  v6 = self;
  PEPhotoStyleDPad.backgroundImage.setter(a3);

}

- (UIColor)backgroundColor
{
  PEPhotoStyleDPad *v2;
  void *v3;

  v2 = self;
  v3 = (void *)PEPhotoStyleDPad.backgroundColor.getter();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  PEPhotoStyleDPad *v6;

  v5 = a3;
  v6 = self;
  PEPhotoStyleDPad.backgroundColor.setter(a3);

}

- (NSString)gradientCast
{
  PEPhotoStyleDPad *v2;
  void *v3;

  v2 = self;
  v3 = (void *)PEPhotoStyleDPad.gradientCast.getter();

  return (NSString *)v3;
}

- (void)setGradientCast:(id)a3
{
  id v4;
  PEPhotoStyleDPad *v5;

  v4 = a3;
  v5 = self;
  PEPhotoStyleDPad.gradientCast.setter(v4);

}

- (id)onValueChanged
{
  return sub_20D14C474(self, (uint64_t)a2, (uint64_t (*)(void))PEPhotoStyleDPad.onValueChanged.getter, (uint64_t)sub_20D165670, (uint64_t)&block_descriptor_54);
}

- (void)setOnValueChanged:(id)a3
{
  sub_20D165EDC(self, (int)a2, a3, (uint64_t)&unk_24C617B20, (uint64_t)sub_20D14E4BC, (void (*)(uint64_t, uint64_t))PEPhotoStyleDPad.onValueChanged.setter);
}

- (BOOL)isActive
{
  PEPhotoStyleDPad *v2;
  char v3;

  v2 = self;
  v3 = PEPhotoStyleDPad.isActive.getter();

  return v3 & 1;
}

- (BOOL)pulsingValueIndicator
{
  PEPhotoStyleDPad *v2;
  char v3;

  v2 = self;
  v3 = PEPhotoStyleDPad.pulsingValueIndicator.getter();

  return v3 & 1;
}

- (void)setPulsingValueIndicator:(BOOL)a3
{
  PEPhotoStyleDPad *v3;

  v3 = self;
  PEPhotoStyleDPad.pulsingValueIndicator.setter();

}

- (BOOL)isDottedGridAnimated
{
  PEPhotoStyleDPad *v2;
  char v3;
  char v4;

  v2 = self;
  PEPhotoStyleDPad.isDottedGridAnimated.getter();
  v4 = v3;

  return v4 & 1;
}

- (void)setIsDottedGridAnimated:(BOOL)a3
{
  PEPhotoStyleDPad *v4;

  v4 = self;
  PEPhotoStyleDPad.isDottedGridAnimated.setter(a3);

}

- (BOOL)snapIndicatorToGrid
{
  PEPhotoStyleDPad *v2;
  char v3;
  char v4;

  v2 = self;
  PEPhotoStyleDPad.snapIndicatorToGrid.getter();
  v4 = v3;

  return v4 & 1;
}

- (void)setSnapIndicatorToGrid:(BOOL)a3
{
  PEPhotoStyleDPad *v4;

  v4 = self;
  PEPhotoStyleDPad.snapIndicatorToGrid.setter(a3);

}

- (id)onGestureDidBegin
{
  return sub_20D14C474(self, (uint64_t)a2, (uint64_t (*)(void))PEPhotoStyleDPad.onGestureDidBegin.getter, (uint64_t)sub_20D1635CC, (uint64_t)&block_descriptor_48);
}

- (void)setOnGestureDidBegin:(id)a3
{
  sub_20D165EDC(self, (int)a2, a3, (uint64_t)&unk_24C617AD0, (uint64_t)sub_20D169340, (void (*)(uint64_t, uint64_t))PEPhotoStyleDPad.onGestureDidBegin.setter);
}

- (id)onGestureDidEnd
{
  return sub_20D14C474(self, (uint64_t)a2, (uint64_t (*)(void))PEPhotoStyleDPad.onGestureDidEnd.getter, (uint64_t)sub_20D1635CC, (uint64_t)&block_descriptor_3);
}

- (void)setOnGestureDidEnd:(id)a3
{
  sub_20D165EDC(self, (int)a2, a3, (uint64_t)&unk_24C617A80, (uint64_t)sub_20D168F48, (void (*)(uint64_t, uint64_t))PEPhotoStyleDPad.onGestureDidEnd.setter);
}

- (PEPhotoStyleDPad)initWithSize:(CGSize)a3
{
  return (PEPhotoStyleDPad *)PEPhotoStyleDPad.init(size:)();
}

- (PEPhotoStyleDPad)initWithCoder:(id)a3
{
  PEPhotoStyleDPad.init(coder:)();
}

- (void)setValue:(CGPoint)a3 animated:(BOOL)a4
{
  CGFloat y;
  CGFloat x;
  PEPhotoStyleDPad *v7;

  y = a3.y;
  x = a3.x;
  v7 = self;
  PEPhotoStyleDPad.setValue(_:animated:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), a4);

}

- (void)setDefaultValue:(CGPoint)a3 animated:(BOOL)a4
{
  CGFloat y;
  CGFloat x;
  PEPhotoStyleDPad *v7;

  y = a3.y;
  x = a3.x;
  v7 = self;
  PEPhotoStyleDPad.setDefaultValue(_:animated:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), a4);

}

- (void)setValue:(CGPoint)a3 notifyObserver:(BOOL)a4
{
  CGFloat y;
  CGFloat x;
  PEPhotoStyleDPad *v7;

  y = a3.y;
  x = a3.x;
  v7 = self;
  PEPhotoStyleDPad.setValue(_:notifyObserver:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), a4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PEPhotoStyleDPad)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_20D191E38();
  v5 = a4;
  PEPhotoStyleDPad.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();

}

@end
