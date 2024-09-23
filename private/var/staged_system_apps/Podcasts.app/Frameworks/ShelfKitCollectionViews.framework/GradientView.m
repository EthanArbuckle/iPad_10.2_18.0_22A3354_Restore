@implementation GradientView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_E710(0, &qword_3D5AA0, CAGradientLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews12GradientView *v6;

  v5 = a3;
  v6 = self;
  sub_ECD94((uint64_t)a3);

}

- (_TtC23ShelfKitCollectionViews12GradientView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _OWORD *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews12GradientView_kind) = 0;
  v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews12GradientView_gradient);
  *v7 = 0u;
  v7[1] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews12GradientView_cornerRadius) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews12GradientView_cornerStyle) = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for GradientView();
  return -[GradientView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews12GradientView)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews12GradientView *)GradientView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews12GradientView_gradient;
  sub_B7AE8(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews12GradientView_gradient), *((_QWORD *)v2 + 1), *((_QWORD *)v2 + 2), *((_QWORD *)v2 + 3), *((_QWORD *)v2 + 4), *((_QWORD *)v2 + 5), *((_QWORD *)v2 + 6), *((void **)v2 + 7));
}

@end
