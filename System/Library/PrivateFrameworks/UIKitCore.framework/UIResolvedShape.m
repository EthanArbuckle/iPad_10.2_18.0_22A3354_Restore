@implementation UIResolvedShape

- (UIResolvedShape)init
{
  return (UIResolvedShape *)sub_1857A134C((char *)self, (uint64_t)a2, &OBJC_IVAR___UIResolvedShape_cachedShape, &OBJC_IVAR___UIResolvedShape_value, (objc_class **)off_1E167B358);
}

- (UIBezierPath)path
{
  UIResolvedShape *v2;
  id v3;

  v2 = self;
  v3 = sub_18579FC44();

  return (UIBezierPath *)v3;
}

- (UIShape)shape
{
  UIResolvedShape *v2;
  char *v3;

  v2 = self;
  v3 = sub_18579FE00();

  return (UIShape *)v3;
}

- (CGRect)boundingRect
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (double *)((char *)self + OBJC_IVAR___UIResolvedShape_value);
  v3 = *(double *)&self->value[OBJC_IVAR___UIResolvedShape_value + 64];
  v4 = *(double *)&self->value[OBJC_IVAR___UIResolvedShape_value + 72];
  v5 = *(double *)&self->value[OBJC_IVAR___UIResolvedShape_value + 80];
  if ((self->value[OBJC_IVAR___UIResolvedShape_value + 112] & 1) != 0)
  {
    v6 = *(double *)&self->value[OBJC_IVAR___UIResolvedShape_value + 64];
    v3 = *(double *)&self->value[OBJC_IVAR___UIResolvedShape_value + 72];
    v4 = *(double *)&self->value[OBJC_IVAR___UIResolvedShape_value + 80];
    v5 = v2[12];
  }
  else
  {
    v6 = v2[8];
  }
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v6;
  return result;
}

- (UIResolvedShape)shapeByApplyingInsets:(UIEdgeInsets)insets
{
  double right;
  double bottom;
  double left;
  double top;
  UIResolvedShape *v7;
  char *v8;

  right = insets.right;
  bottom = insets.bottom;
  left = insets.left;
  top = insets.top;
  v7 = self;
  v8 = sub_18579FF58(top, left, bottom, right);

  return (UIResolvedShape *)v8;
}

- (UIResolvedShape)shapeByApplyingInset:(CGFloat)inset
{
  UIResolvedShape *v4;
  char *v5;

  v4 = self;
  v5 = sub_1857A02AC(inset);

  return (UIResolvedShape *)v5;
}

- (NSString)description
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  UIResolvedShape *v5;
  void *v6;
  _OWORD v8[6];
  _BYTE v9[25];

  *(_OWORD *)&v9[9] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 97];
  v2 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 72];
  v8[4] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 56];
  v8[5] = v2;
  *(_OWORD *)v9 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 88];
  v3 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___UIResolvedShape_value);
  v8[1] = v3;
  v4 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 40];
  v8[2] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 24];
  v8[3] = v4;
  v5 = self;
  sub_1855B8DA4((uint64_t)v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_185228314, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1855B8D98);
  sub_186507C30();
  swift_bridgeObjectRelease();
  sub_1855BB78C();
  sub_186507564();
  swift_bridgeObjectRelease();
  sub_1855B8DA4((uint64_t)v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_185228168, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1855B8D8C);

  v6 = (void *)sub_1865074D4();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (NSString)debugDescription
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  UIResolvedShape *v5;
  void *v6;
  _OWORD v8[6];
  _BYTE v9[25];

  *(_OWORD *)&v9[9] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 97];
  v2 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 72];
  v8[4] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 56];
  v8[5] = v2;
  *(_OWORD *)v9 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 88];
  v3 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___UIResolvedShape_value);
  v8[1] = v3;
  v4 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 40];
  v8[2] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 24];
  v8[3] = v4;
  v5 = self;
  sub_1855B8DA4((uint64_t)v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_185228314, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1855B8D98);
  sub_186507C30();
  swift_bridgeObjectRelease();
  sub_1855BB78C();
  sub_186507564();
  swift_bridgeObjectRelease();
  sub_1855B8DA4((uint64_t)v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_185228168, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1855B8D8C);

  v6 = (void *)sub_1865074D4();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[6];
  _OWORD v7[2];

  v3 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 72];
  v6[4] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 56];
  v6[5] = v3;
  v7[0] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 88];
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 97];
  v4 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___UIResolvedShape_value);
  v6[1] = v4;
  v5 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 40];
  v6[2] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 24];
  v6[3] = v5;
  sub_1855B8DA4((uint64_t)v6, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_185228168, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1855B8D8C);

}

- (id)_shapeByClippingToShape:(id)a3
{
  id v4;
  UIResolvedShape *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1857A0C70((uint64_t)v4);

  return v6;
}

- (id)_shapeByConvertingFromSpace:(id)a3 toSpace:(id)a4
{
  UIResolvedShape *v7;
  char *v8;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1857A0DF0(a3, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v8;
}

@end
