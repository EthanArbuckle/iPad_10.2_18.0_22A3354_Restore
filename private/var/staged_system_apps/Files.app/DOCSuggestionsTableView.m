@implementation DOCSuggestionsTableView

- (_TtC5Files23DOCSuggestionsTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t ObjectType;
  char *v11;
  _TtC5Files23DOCSuggestionsTableView *v12;
  uint64_t v13;
  uint64_t v14;
  _TtC5Files23DOCSuggestionsTableView *v15;
  uint64_t v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = swift_getObjectType(self);
  v11 = (char *)self + OBJC_IVAR____TtC5Files23DOCSuggestionsTableView_cachedIntrinsicSize;
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 1;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for DOCSuggestionsTableView();
  v12 = -[DOCTableView initWithFrame:style:](&v18, "initWithFrame:style:", a4, x, y, width, height);
  v13 = sub_10006922C((uint64_t *)&unk_1006444C0);
  v14 = swift_allocObject(v13, 48, 7);
  *(_OWORD *)(v14 + 16) = xmmword_1004D9670;
  *(_QWORD *)(v14 + 32) = type metadata accessor for UITraitPreferredContentSizeCategory(0);
  *(_QWORD *)(v14 + 40) = &protocol witness table for UITraitPreferredContentSizeCategory;
  v15 = v12;
  v16 = UIView.registerForTraitChanges<A>(_:handler:)(v14, sub_10041421C, 0, ObjectType);
  swift_unknownObjectRelease(v16);

  swift_bridgeObjectRelease(v14);
  return v15;
}

- (void)reloadData
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCSuggestionsTableView();
  v2 = v3.receiver;
  -[DOCSuggestionsTableView reloadData](&v3, "reloadData");
  objc_msgSend(v2, "invalidateIntrinsicContentSize", v3.receiver, v3.super_class);
  objc_msgSend(v2, "layoutIfNeeded");

}

- (id)invalidateIntrinsicContentSize
{
  char *v1;
  objc_super v3;

  v1 = &a1[OBJC_IVAR____TtC5Files23DOCSuggestionsTableView_cachedIntrinsicSize];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  v1[16] = 1;
  v3.receiver = a1;
  v3.super_class = (Class)type metadata accessor for DOCSuggestionsTableView();
  return objc_msgSendSuper2(&v3, "invalidateIntrinsicContentSize");
}

- (CGSize)intrinsicContentSize
{
  double *v3;
  CGFloat v4;
  _TtC5Files23DOCSuggestionsTableView *v5;
  double v6;
  double v7;
  _TtC5Files23DOCSuggestionsTableView *v8;
  double v9;
  double v10;
  CGSize result;

  v3 = (double *)((char *)self + OBJC_IVAR____TtC5Files23DOCSuggestionsTableView_cachedIntrinsicSize);
  if ((self->cachedIntrinsicSize[OBJC_IVAR____TtC5Files23DOCSuggestionsTableView_cachedIntrinsicSize + 8] & 1) != 0)
  {
    v4 = UIViewNoIntrinsicMetric;
    v5 = self;
    sub_100411FF4();
    v7 = v6;
  }
  else
  {
    v4 = *v3;
    v7 = v3[1];
    v8 = self;
  }
  *v3 = v4;
  v3[1] = v7;
  *((_BYTE *)v3 + 16) = 0;

  v9 = v4;
  v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
