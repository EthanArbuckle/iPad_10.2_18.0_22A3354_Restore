@implementation UIShapeResolutionContext

- (UIShapeResolutionContext)initWithView:(id)a3
{
  return (UIShapeResolutionContext *)sub_1857A1140(a3);
}

- (UIShapeResolutionContext)init
{
  return (UIShapeResolutionContext *)sub_1857A134C((char *)self, (uint64_t)a2, &OBJC_IVAR___UIShapeResolutionContext_cachedContentShape, &OBJC_IVAR___UIShapeResolutionContext_value, (objc_class **)off_1E167B578);
}

- (UIResolvedShape)contentShape
{
  UIShapeResolutionContext *v2;
  char *v3;

  v2 = self;
  v3 = sub_1857A1458();

  return (UIResolvedShape *)v3;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[6];
  _OWORD v7[2];

  v3 = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 72];
  v6[4] = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 56];
  v6[5] = v3;
  v7[0] = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 88];
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 97];
  v4 = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___UIShapeResolutionContext_value);
  v6[1] = v4;
  v5 = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 40];
  v6[2] = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 24];
  v6[3] = v5;
  sub_1855B8DA4((uint64_t)v6, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_185228168, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1855B8D8C);

}

@end
