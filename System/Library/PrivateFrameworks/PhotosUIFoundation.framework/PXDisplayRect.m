@implementation PXDisplayRect

- (PXDisplayRect)initWithRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  swift_unknownObjectRetain();
  return (PXDisplayRect *)PXDisplayRect.init(rect:in:)();
}

- (UICoordinateSpace)coordinateSpace
{
  PXDisplayRect *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_24433E354();

  return (UICoordinateSpace *)v3;
}

- (BOOL)isEqual:(id)a3
{
  PXDisplayRect *v4;
  PXDisplayRect *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_24437A838();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = PXDisplayRect.isEqual(_:)((uint64_t)v8);

  sub_24433E9C0((uint64_t)v8, &qword_257355AF0);
  return v6 & 1;
}

- (CGRect)rectInCoordinateSpace:(id)a3
{
  PXDisplayRect *v5;
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
  double v16;
  double v17;
  CGRect result;

  swift_unknownObjectRetain();
  v5 = self;
  sub_24433E6F4((uint64_t)a3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease();

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)copyWithZone:(void *)a3
{
  void *v3;
  _QWORD v5[4];

  sub_24433E86C(v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_24437AA60();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

- (PXDisplayRect)init
{
  PXDisplayRect.init()();
}

- (void).cxx_destruct
{
  sub_24433E9C0((uint64_t)self + OBJC_IVAR___PXDisplayRect_implementation, &qword_257356588);
}

@end
