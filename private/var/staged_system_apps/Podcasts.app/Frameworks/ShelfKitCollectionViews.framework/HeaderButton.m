@implementation HeaderButton

- (_TtC23ShelfKitCollectionViews12HeaderButton)init
{
  char *v3;
  uint64_t ObjectType;
  _QWORD v6[11];
  __int16 v7;

  swift_getObjectType();
  if (qword_3CF590 != -1)
    swift_once(&qword_3CF590, sub_140894);
  v6[0] = qword_3FBEB0;
  v6[1] = *(_QWORD *)algn_3FBEB8;
  v6[2] = qword_3FBEC0;
  v6[3] = qword_3FBEC8;
  v6[4] = qword_3FBED0;
  v6[5] = qword_3FBED8;
  v6[6] = qword_3FBEE0;
  v6[7] = qword_3FBEE8;
  v6[8] = qword_3FBEF0;
  v6[9] = qword_3FBEF8;
  v6[10] = qword_3FBF00;
  v7 = word_3FBF08;
  sub_DDA0((void *)qword_3FBEB0, *(uint64_t *)algn_3FBEB8, qword_3FBEC0, qword_3FBEC8, qword_3FBED0, qword_3FBED8, (void *)qword_3FBEE0, qword_3FBEE8, qword_3FBEF0, qword_3FBEF8, qword_3FBF00, word_3FBF08, SHIBYTE(word_3FBF08));
  v3 = sub_2D5CD4((uint64_t)v6);
  ObjectType = swift_getObjectType();
  swift_deallocPartialClassInstance(self, ObjectType, 136, 7);
  return (_TtC23ShelfKitCollectionViews12HeaderButton *)v3;
}

- (void)tintColorDidChange
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HeaderButton();
  v2 = v4.receiver;
  -[HeaderButton tintColorDidChange](&v4, "tintColorDidChange");
  v3 = objc_msgSend(v2, "tintColor", v4.receiver, v4.super_class);
  objc_msgSend(v2, "setTitleColor:forState:", v3, 0);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  _TtC23ShelfKitCollectionViews12HeaderButton *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v7 = *(double *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC23ShelfKitCollectionViews12HeaderButton_touchOutsideMargin);
  v8 = *(double *)&self->super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews12HeaderButton_touchOutsideMargin];
  v9 = *(double *)&self->super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews12HeaderButton_touchOutsideMargin
                                         + 8];
  v10 = *(double *)&self->super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews12HeaderButton_touchOutsideMargin
                                          + 16];
  v11 = a4;
  v12 = self;
  -[HeaderButton bounds](v12, "bounds");
  v20.origin.x = v13 - v8;
  v20.origin.y = v14 - v7;
  v20.size.width = v8 + v10 + v15;
  v20.size.height = v7 + v9 + v16;
  v19.x = x;
  v19.y = y;
  v17 = CGRectContainsPoint(v20, v19);

  return v17;
}

- (_TtC23ShelfKitCollectionViews12HeaderButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  __int128 v7;
  _OWORD *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews12HeaderButton_touchOutsideMargin);
  *v8 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v8[1] = v7;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HeaderButton();
  return -[DynamicTypeButton initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews12HeaderButton)initWithCoder:(id)a3
{
  _OWORD *v4;
  __int128 v5;
  objc_super v7;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews12HeaderButton_touchOutsideMargin);
  v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HeaderButton();
  return -[DynamicTypeButton initWithCoder:](&v7, "initWithCoder:", a3);
}

@end
