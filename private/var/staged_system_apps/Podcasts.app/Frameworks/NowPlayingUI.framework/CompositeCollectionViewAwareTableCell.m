@implementation CompositeCollectionViewAwareTableCell

- (id)_collectionView
{
  _TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell *v2;
  id v3;

  v2 = self;
  v3 = sub_FC39C();

  return v3;
}

- (void)_setCollectionView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CompositeCollectionViewAwareTableCell(0);
  -[CompositeCollectionViewAwareTableCell _setCollectionView:](&v4, "_setCollectionView:", a3);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell *v5;

  v4 = a3;
  v5 = self;
  sub_FC7D4(v4);

}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CompositeCollectionViewAwareTableCell(0);
  return -[CompositeCollectionViewAwareTableCell backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CompositeCollectionViewAwareTableCell(0);
  v4 = v9.receiver;
  v5 = a3;
  -[CompositeCollectionViewAwareTableCell setBackgroundColor:](&v9, "setBackgroundColor:", v5);
  v6 = objc_msgSend(v4, "tableViewCell", v9.receiver, v9.super_class);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v4, "backgroundColor");
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell_lastAppliedIndexPath;
  v9 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CompositeCollectionViewAwareTableCell(0);
  return -[CompositeCollectionViewAwareTableCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell_lastAppliedIndexPath;
  v6 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CompositeCollectionViewAwareTableCell(0);
  return -[CompositeCollectionViewAwareTableCell initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_9944((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI37CompositeCollectionViewAwareTableCell_lastAppliedIndexPath, (uint64_t *)&unk_1FA950);
}

@end
