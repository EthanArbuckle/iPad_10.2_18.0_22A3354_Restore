@implementation ContainerDetailCollectionTableLayout

- (void)prepareLayout
{
  objc_class *v3;
  _TtC16MusicApplication36ContainerDetailCollectionTableLayout *v4;
  double *v5;
  uint64_t v6;
  double v7;
  objc_super v8;
  objc_super v9;

  v3 = (objc_class *)type metadata accessor for ContainerDetailCollectionTableLayout();
  v9.receiver = self;
  v9.super_class = v3;
  v4 = self;
  -[ContainerDetailCollectionTableLayout prepareLayout](&v9, "prepareLayout");
  v8.receiver = v4;
  v8.super_class = v3;
  -[ContainerDetailCollectionTableLayout collectionViewContentSize](&v8, "collectionViewContentSize");
  v5 = (double *)&v4->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout__collectionViewContentSize];
  *(_QWORD *)v5 = v6;
  v5[1] = v7
        + *(double *)&v4->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout_contentHeightAdjustment];

}

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)&self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout__collectionViewContentSize];
  v3 = *(double *)&self->contentHeightAdjustment[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout__collectionViewContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC16MusicApplication36ContainerDetailCollectionTableLayout *v13;
  id v14;
  uint64_t v16;

  y = a4.y;
  x = a4.x;
  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = a3;
  v13 = self;
  v14 = sub_6320F4(x, y);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

- (_TtC16MusicApplication36ContainerDetailCollectionTableLayout)init
{
  unsigned __int8 *v3;
  objc_class *v4;
  objc_super v6;

  *(_QWORD *)&self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout_contentHeightAdjustment] = 0;
  v3 = &self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout__collectionViewContentSize];
  v4 = (objc_class *)type metadata accessor for ContainerDetailCollectionTableLayout();
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[ContainerDetailCollectionTableLayout init](&v6, "init");
}

- (_TtC16MusicApplication36ContainerDetailCollectionTableLayout)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  id v5;
  _TtC16MusicApplication36ContainerDetailCollectionTableLayout *v6;
  objc_super v8;

  *(_QWORD *)&self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout_contentHeightAdjustment] = 0;
  v4 = &self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC16MusicApplication36ContainerDetailCollectionTableLayout__collectionViewContentSize];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ContainerDetailCollectionTableLayout();
  v5 = a3;
  v6 = -[ContainerDetailCollectionTableLayout initWithCoder:](&v8, "initWithCoder:", v5);

  return v6;
}

@end
