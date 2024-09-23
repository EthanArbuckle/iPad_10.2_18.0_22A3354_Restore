@implementation UIShape

+ (UIShape)rectShape
{
  return (UIShape *)sub_1856E2918((uint64_t)a1, (uint64_t)a2, qword_1EDD82820, (id *)&qword_1EDD82830);
}

+ (UIShape)circleShape
{
  return (UIShape *)sub_1856E2918((uint64_t)a1, (uint64_t)a2, qword_1EDD7D398, (id *)&qword_1EDD7D488);
}

+ (UIShape)capsuleShape
{
  return (UIShape *)sub_1856E2918((uint64_t)a1, (uint64_t)a2, &qword_1EDD83D20, (id *)&qword_1EDD8B400);
}

+ (UIShape)rectShapeWithCornerRadius:(CGFloat)cornerRadius
{
  char *v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v4 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  v5 = &v4[OBJC_IVAR___UIShape_value];
  v6 = *(void **)&v4[OBJC_IVAR___UIShape_value];
  v7 = *(_QWORD *)&v4[OBJC_IVAR___UIShape_value + 8];
  v8 = *(_QWORD *)&v4[OBJC_IVAR___UIShape_value + 16];
  v9 = *(_QWORD *)&v4[OBJC_IVAR___UIShape_value + 24];
  v10 = *(_QWORD *)&v4[OBJC_IVAR___UIShape_value + 32];
  v11 = *(_QWORD *)&v4[OBJC_IVAR___UIShape_value + 40];
  v12 = *(_QWORD *)&v4[OBJC_IVAR___UIShape_value + 48];
  *(CGFloat *)v5 = cornerRadius;
  *(_OWORD *)(v5 + 8) = xmmword_186677900;
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  v13 = v5[56];
  v5[56] = 0;
  sub_185228168(v6, v7, v8, v9, v10, v11, v12, v13);
  return (UIShape *)v4;
}

+ (UIShape)rectShapeWithCornerRadius:(CGFloat)cornerRadius cornerCurve:(UICornerCurve)cornerCurve
{
  char *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v6 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  v7 = &v6[OBJC_IVAR___UIShape_value];
  v8 = *(void **)&v6[OBJC_IVAR___UIShape_value];
  v9 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 8];
  v10 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 16];
  v11 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 24];
  v12 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 32];
  v13 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 40];
  v14 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 48];
  *(CGFloat *)v7 = cornerRadius;
  *((_QWORD *)v7 + 1) = cornerCurve;
  *((_QWORD *)v7 + 2) = -1;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  v15 = v7[56];
  v7[56] = 0;
  sub_185228168(v8, v9, v10, v11, v12, v13, v14, v15);
  return (UIShape *)v6;
}

+ (UIShape)rectShapeWithCornerRadius:(CGFloat)cornerRadius cornerCurve:(UICornerCurve)cornerCurve maskedCorners:(UIRectCorner)maskedCorners
{
  char *v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v8 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  v9 = &v8[OBJC_IVAR___UIShape_value];
  v10 = *(void **)&v8[OBJC_IVAR___UIShape_value];
  v11 = *(_QWORD *)&v8[OBJC_IVAR___UIShape_value + 8];
  v12 = *(_QWORD *)&v8[OBJC_IVAR___UIShape_value + 16];
  v13 = *(_QWORD *)&v8[OBJC_IVAR___UIShape_value + 24];
  v14 = *(_QWORD *)&v8[OBJC_IVAR___UIShape_value + 32];
  v15 = *(_QWORD *)&v8[OBJC_IVAR___UIShape_value + 40];
  v16 = *(_QWORD *)&v8[OBJC_IVAR___UIShape_value + 48];
  *(CGFloat *)v9 = cornerRadius;
  *((_QWORD *)v9 + 1) = cornerCurve;
  *((_QWORD *)v9 + 2) = maskedCorners;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  v17 = v9[56];
  v9[56] = 0;
  sub_185228168(v10, v11, v12, v13, v14, v15, v16, v17);
  return (UIShape *)v8;
}

+ (UIShape)fixedRectShapeWithRect:(CGRect)rect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char *v7;
  CGFloat *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v7 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  v8 = (CGFloat *)&v7[OBJC_IVAR___UIShape_value];
  v9 = *(void **)&v7[OBJC_IVAR___UIShape_value];
  v10 = *(_QWORD *)&v7[OBJC_IVAR___UIShape_value + 8];
  v11 = *(_QWORD *)&v7[OBJC_IVAR___UIShape_value + 16];
  v12 = *(_QWORD *)&v7[OBJC_IVAR___UIShape_value + 24];
  v13 = *(_QWORD *)&v7[OBJC_IVAR___UIShape_value + 32];
  v14 = *(_QWORD *)&v7[OBJC_IVAR___UIShape_value + 40];
  v15 = *(_QWORD *)&v7[OBJC_IVAR___UIShape_value + 48];
  *v8 = x;
  v8[1] = y;
  v8[2] = width;
  v8[3] = height;
  v8[4] = 0.0;
  v8[5] = 0.0;
  v8[6] = NAN;
  v16 = *((_BYTE *)v8 + 56);
  *((_BYTE *)v8 + 56) = 1;
  sub_185228168(v9, v10, v11, v12, v13, v14, v15, v16);
  return (UIShape *)v7;
}

+ (UIShape)fixedRectShapeWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v9 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  v10 = &v9[OBJC_IVAR___UIShape_value];
  v11 = *(void **)&v9[OBJC_IVAR___UIShape_value];
  v12 = *(_QWORD *)&v9[OBJC_IVAR___UIShape_value + 8];
  v13 = *(_QWORD *)&v9[OBJC_IVAR___UIShape_value + 16];
  v14 = *(_QWORD *)&v9[OBJC_IVAR___UIShape_value + 24];
  v15 = *(_QWORD *)&v9[OBJC_IVAR___UIShape_value + 32];
  v16 = *(_QWORD *)&v9[OBJC_IVAR___UIShape_value + 40];
  v17 = *(_QWORD *)&v9[OBJC_IVAR___UIShape_value + 48];
  *(CGFloat *)v10 = x;
  *((CGFloat *)v10 + 1) = y;
  *((CGFloat *)v10 + 2) = width;
  *((CGFloat *)v10 + 3) = height;
  *((CGFloat *)v10 + 4) = cornerRadius;
  *(_OWORD *)(v10 + 40) = xmmword_186677900;
  v18 = v10[56];
  v10[56] = 1;
  sub_185228168(v11, v12, v13, v14, v15, v16, v17, v18);
  return (UIShape *)v9;
}

+ (UIShape)fixedRectShapeWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius cornerCurve:(UICornerCurve)cornerCurve maskedCorners:(UIRectCorner)maskedCorners
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char *v13;
  CGFloat *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v13 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  v14 = (CGFloat *)&v13[OBJC_IVAR___UIShape_value];
  v15 = *(void **)&v13[OBJC_IVAR___UIShape_value];
  v16 = *(_QWORD *)&v13[OBJC_IVAR___UIShape_value + 8];
  v17 = *(_QWORD *)&v13[OBJC_IVAR___UIShape_value + 16];
  v18 = *(_QWORD *)&v13[OBJC_IVAR___UIShape_value + 24];
  v19 = *(_QWORD *)&v13[OBJC_IVAR___UIShape_value + 32];
  v20 = *(_QWORD *)&v13[OBJC_IVAR___UIShape_value + 40];
  v21 = *(_QWORD *)&v13[OBJC_IVAR___UIShape_value + 48];
  *v14 = x;
  v14[1] = y;
  v14[2] = width;
  v14[3] = height;
  v14[4] = cornerRadius;
  *((_QWORD *)v14 + 5) = cornerCurve;
  *((_QWORD *)v14 + 6) = maskedCorners;
  v22 = *((_BYTE *)v14 + 56);
  *((_BYTE *)v14 + 56) = 1;
  sub_185228168(v15, v16, v17, v18, v19, v20, v21, v22);
  return (UIShape *)v13;
}

- (UIShape)shapeWithBezierPath:(id)a3
{
  id v4;
  id v5;
  UIShape *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromObject());
  v5 = a3;
  v6 = (UIShape *)objc_msgSend(v4, sel_init);
  v7 = (char *)v6 + OBJC_IVAR___UIShape_value;
  v8 = *(Class *)((char *)&v6->super.isa + OBJC_IVAR___UIShape_value);
  v9 = *(_QWORD *)&v6->value[OBJC_IVAR___UIShape_value];
  v10 = *(_QWORD *)&v6->value[OBJC_IVAR___UIShape_value + 8];
  v11 = *(_QWORD *)&v6->value[OBJC_IVAR___UIShape_value + 16];
  v12 = *(_QWORD *)&v6->value[OBJC_IVAR___UIShape_value + 24];
  v13 = *(_QWORD *)&v6->value[OBJC_IVAR___UIShape_value + 32];
  v14 = *(_QWORD *)&v6->value[OBJC_IVAR___UIShape_value + 40];
  *(_QWORD *)v7 = a3;
  *(_OWORD *)(v7 + 8) = 0u;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  v15 = v7[56];
  v7[56] = 2;
  sub_185228168(v8, v9, v10, v11, v12, v13, v14, v15);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (UIShape)shapeWithProvider:(id)a3
{
  objc_class *ObjCClassFromObject;
  uint64_t v5;
  id v6;
  UIShape *v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  ObjCClassFromObject = (objc_class *)swift_getObjCClassFromObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDD8B4D0);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  v6 = objc_allocWithZone(ObjCClassFromObject);
  swift_unknownObjectRetain_n();
  v7 = (UIShape *)objc_msgSend(v6, sel_init);
  v8 = (char *)v7 + OBJC_IVAR___UIShape_value;
  v9 = *(Class *)((char *)&v7->super.isa + OBJC_IVAR___UIShape_value);
  v10 = *(_QWORD *)&v7->value[OBJC_IVAR___UIShape_value];
  v11 = *(_QWORD *)&v7->value[OBJC_IVAR___UIShape_value + 8];
  v12 = *(_QWORD *)&v7->value[OBJC_IVAR___UIShape_value + 16];
  v13 = *(_QWORD *)&v7->value[OBJC_IVAR___UIShape_value + 24];
  v14 = *(_QWORD *)&v7->value[OBJC_IVAR___UIShape_value + 32];
  v15 = *(_QWORD *)&v7->value[OBJC_IVAR___UIShape_value + 40];
  *(_QWORD *)v8 = v5;
  *(_OWORD *)(v8 + 8) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  v16 = v8[56];
  v8[56] = 3;
  sub_185228168(v9, v10, v11, v12, v13, v14, v15, v16);
  swift_unknownObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (UIResolvedShape)resolvedShapeInContext:(UIShapeResolutionContext *)context
{
  UIShapeResolutionContext *v4;
  UIShape *v5;
  char *v6;

  v4 = context;
  v5 = self;
  v6 = sub_18579EB3C((uint64_t)v4);

  return (UIResolvedShape *)v6;
}

- (UIShape)shapeByApplyingInsets:(UIEdgeInsets)insets
{
  double right;
  double bottom;
  double left;
  double top;
  UIShape *v7;
  char *v8;

  right = insets.right;
  bottom = insets.bottom;
  left = insets.left;
  top = insets.top;
  v7 = self;
  v8 = sub_18579ECF0(top, left, bottom, right);

  return (UIShape *)v8;
}

- (UIShape)shapeByApplyingInset:(CGFloat)inset
{
  UIShape *v4;
  char *v5;

  v4 = self;
  v5 = sub_18579EE88(inset);

  return (UIShape *)v5;
}

- (BOOL)isEqual:(id)a3
{
  UIShape *v4;
  UIShape *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_186507B1C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = UIShape.isEqual(_:)((uint64_t)v8);

  sub_1855BDE94((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  UIShape *v12;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___UIShape_value);
  v3 = *(_QWORD *)&self->value[OBJC_IVAR___UIShape_value];
  v4 = *(_QWORD *)&self->value[OBJC_IVAR___UIShape_value + 8];
  v5 = *(_QWORD *)&self->value[OBJC_IVAR___UIShape_value + 16];
  v6 = *(_QWORD *)&self->value[OBJC_IVAR___UIShape_value + 24];
  v7 = *(_QWORD *)&self->value[OBJC_IVAR___UIShape_value + 32];
  v8 = *(_QWORD *)&self->value[OBJC_IVAR___UIShape_value + 40];
  v9 = self->value[OBJC_IVAR___UIShape_value + 48];
  v12 = self;
  sub_185228314(v2, v3, v4, v5, v6, v7, v8, v9);
  sub_1855BAE80();
  sub_186507564();
  swift_bridgeObjectRelease();
  sub_185228168(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)sub_1865074D4();
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (NSString)debugDescription
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  UIShape *v12;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___UIShape_value);
  v3 = *(_QWORD *)&self->value[OBJC_IVAR___UIShape_value];
  v4 = *(_QWORD *)&self->value[OBJC_IVAR___UIShape_value + 8];
  v5 = *(_QWORD *)&self->value[OBJC_IVAR___UIShape_value + 16];
  v6 = *(_QWORD *)&self->value[OBJC_IVAR___UIShape_value + 24];
  v7 = *(_QWORD *)&self->value[OBJC_IVAR___UIShape_value + 32];
  v8 = *(_QWORD *)&self->value[OBJC_IVAR___UIShape_value + 40];
  v9 = self->value[OBJC_IVAR___UIShape_value + 48];
  v12 = self;
  sub_185228314(v2, v3, v4, v5, v6, v7, v8, v9);
  sub_1855BAE80();
  sub_186507564();
  swift_bridgeObjectRelease();
  sub_185228168(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)sub_1865074D4();
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (UIShape)init
{
  char *v2;
  objc_super v4;

  v2 = (char *)self + OBJC_IVAR___UIShape_value;
  *(_QWORD *)v2 = 1;
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  v2[56] = 6;
  v4.receiver = self;
  v4.super_class = (Class)UIShape;
  return -[UIShape init](&v4, sel_init);
}

- (void).cxx_destruct
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___UIShape_value;
  sub_185228168(*(void **)((char *)&self->super.isa + OBJC_IVAR___UIShape_value), *((_QWORD *)v2 + 1), *((_QWORD *)v2 + 2), *((_QWORD *)v2 + 3), *((_QWORD *)v2 + 4), *((_QWORD *)v2 + 5), *((_QWORD *)v2 + 6), v2[56]);
}

- (id)_resolvedShapeInView:(id)a3
{
  id v4;
  UIShape *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_18579F724(v4);

  return v6;
}

+ (id)_contentShape
{
  char *v2;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v2 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  v3 = &v2[OBJC_IVAR___UIShape_value];
  v4 = *(void **)&v2[OBJC_IVAR___UIShape_value];
  v5 = *(_QWORD *)&v2[OBJC_IVAR___UIShape_value + 8];
  v6 = *(_QWORD *)&v2[OBJC_IVAR___UIShape_value + 16];
  v7 = *(_QWORD *)&v2[OBJC_IVAR___UIShape_value + 24];
  v8 = *(_QWORD *)&v2[OBJC_IVAR___UIShape_value + 32];
  v9 = *(_QWORD *)&v2[OBJC_IVAR___UIShape_value + 40];
  v10 = *(_QWORD *)&v2[OBJC_IVAR___UIShape_value + 48];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_QWORD *)v3 + 6) = 0;
  v11 = v3[56];
  v3[56] = 6;
  sub_185228168(v4, v5, v6, v7, v8, v9, v10, v11);
  return v2;
}

+ (UIShape)shapeWithBezierPath:(UIBezierPath *)path
{
  id v4;
  UIBezierPath *v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v4 = objc_allocWithZone((Class)UIShape);
  v5 = path;
  v6 = (char *)objc_msgSend(v4, sel_init);
  v7 = &v6[OBJC_IVAR___UIShape_value];
  v8 = *(void **)&v6[OBJC_IVAR___UIShape_value];
  v9 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 8];
  v10 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 16];
  v11 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 24];
  v12 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 32];
  v13 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 40];
  v14 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 48];
  *(_QWORD *)v7 = path;
  *(_OWORD *)(v7 + 8) = 0u;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  v15 = v7[56];
  v7[56] = 2;
  sub_185228168(v8, v9, v10, v11, v12, v13, v14, v15);

  return (UIShape *)v6;
}

+ (UIShape)shapeWithProvider:(id)provider
{
  uint64_t v4;
  id v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDD8B4D0);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = provider;
  v5 = objc_allocWithZone((Class)UIShape);
  swift_unknownObjectRetain_n();
  v6 = (char *)objc_msgSend(v5, sel_init);
  v7 = &v6[OBJC_IVAR___UIShape_value];
  v8 = *(void **)&v6[OBJC_IVAR___UIShape_value];
  v9 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 8];
  v10 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 16];
  v11 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 24];
  v12 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 32];
  v13 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 40];
  v14 = *(_QWORD *)&v6[OBJC_IVAR___UIShape_value + 48];
  *(_QWORD *)v7 = v4;
  *(_OWORD *)(v7 + 8) = 0u;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  v15 = v7[56];
  v7[56] = 3;
  sub_185228168(v8, v9, v10, v11, v12, v13, v14, v15);
  swift_unknownObjectRelease();
  return (UIShape *)v6;
}

@end
