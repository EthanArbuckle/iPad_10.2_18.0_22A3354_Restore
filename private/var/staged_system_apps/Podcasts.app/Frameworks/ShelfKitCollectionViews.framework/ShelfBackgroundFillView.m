@implementation ShelfBackgroundFillView

- (_TtC23ShelfKitCollectionViews23ShelfBackgroundFillView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _OWORD *v7;
  char *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradientView) = 0;
  v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient);
  *v7 = 0u;
  v7[1] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  v8 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_background;
  *(_DWORD *)v8 = 0;
  *((_WORD *)v8 + 2) = 256;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ShelfBackgroundFillView();
  return -[ShelfBackgroundFillView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews23ShelfBackgroundFillView)initWithCoder:(id)a3
{
  _OWORD *v4;
  char *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradientView) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient);
  *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_background;
  *(_DWORD *)v5 = 0;
  *((_WORD *)v5 + 2) = 256;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ShelfBackgroundFillView();
  return -[ShelfBackgroundFillView initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradientView));
  sub_B7AE8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient), *(_QWORD *)&self->gradientView[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient], *(_QWORD *)&self->gradient[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient], *(_QWORD *)&self->gradient[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient + 8], *(_QWORD *)&self->gradient[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient + 16], *(_QWORD *)&self->gradient[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient + 24], *(_QWORD *)&self->gradient[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient + 32], *(void **)&self->gradient[OBJC_IVAR____TtC23ShelfKitCollectionViews23ShelfBackgroundFillView_gradient + 40]);
}

@end
