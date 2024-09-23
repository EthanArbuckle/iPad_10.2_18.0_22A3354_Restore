@implementation ShelfPageControl

- (_TtC23ShelfKitCollectionViews16ShelfPageControl)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews16ShelfPageControl *)sub_F2570(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews16ShelfPageControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_F3B24();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  objc_class *ObjectType;
  id v9;
  _TtC23ShelfKitCollectionViews16ShelfPageControl *v10;
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  BOOL v20;
  objc_super v22;
  CGPoint v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = a4;
  v10 = self;
  v11 = -[ShelfPageControl layoutMarginsGuide](v10, "layoutMarginsGuide");
  objc_msgSend(v11, "layoutFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  v23.x = x;
  v23.y = y;
  if (CGRectContainsPoint(v24, v23))
  {

    return 0;
  }
  else
  {
    v22.receiver = v10;
    v22.super_class = ObjectType;
    v20 = -[ShelfPageControl pointInside:withEvent:](&v22, "pointInside:withEvent:", v9, x, y);

  }
  return v20;
}

- (void)layoutMarginsDidChange
{
  _TtC23ShelfKitCollectionViews16ShelfPageControl *v2;

  v2 = self;
  ShelfPageControl.layoutMarginsDidChange()();

}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews16ShelfPageControl *v2;

  v2 = self;
  ShelfPageControl.layoutSubviews()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShelfPageControl_pageControls));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShelfPageControl_leftBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShelfPageControl_leftBackgroundMask));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShelfPageControl_rightBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShelfPageControl_rightBackgroundMask));
}

@end
