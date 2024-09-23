@implementation CompositeComponentCollectionView

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CompositeComponentCollectionView(0);
  -[CompositeComponentCollectionView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *Strong;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC12NowPlayingUI32CompositeComponentCollectionView_compositeCollectionView);
  v9 = self;

  if (Strong)
  {

  }
  else
  {
    v10.receiver = v9;
    v10.super_class = (Class)type metadata accessor for CompositeComponentCollectionView(0);
    -[CompositeComponentCollectionView setFrame:](&v10, "setFrame:", x, y, width, height);

  }
}

- (void)addGestureRecognizer:(id)a3
{
  sub_15442C((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_addGestureRecognizer_);
}

- (void)bringSubviewToFront:(id)a3
{
  id v4;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v5;

  v4 = a3;
  v5 = self;
  sub_1544DC(v4, (SEL *)&selRef_bringSubviewToFront_);

}

- (void)layoutSubviews
{
  void *Strong;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v4;
  objc_super v5;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC12NowPlayingUI32CompositeComponentCollectionView_compositeCollectionView);
  v4 = self;

  if (Strong)
  {

  }
  else
  {
    v5.receiver = v4;
    v5.super_class = (Class)type metadata accessor for CompositeComponentCollectionView(0);
    -[CompositeComponentCollectionView layoutSubviews](&v5, "layoutSubviews");

  }
}

- (void)removeGestureRecognizer:(id)a3
{
  sub_15442C((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_removeGestureRecognizer_);
}

- (void)sendSubviewToBack:(id)a3
{
  id v4;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v5;

  v4 = a3;
  v5 = self;
  sub_1544DC(v4, (SEL *)&selRef_sendSubviewToBack_);

}

- (void)registerClass:(Class)a3 forCellWithReuseIdentifier:(id)a4
{
  uint64_t ObjCClassMetadata;
  uint64_t v7;
  void *v8;
  void *v9;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v10;

  if (a3)
    ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  else
    ObjCClassMetadata = 0;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v9 = v8;
  v10 = self;
  sub_1545FC(ObjCClassMetadata, v7, v9);

  swift_bridgeObjectRelease(v9);
}

- (void)registerClass:(Class)a3 forSupplementaryViewOfKind:(id)a4 withReuseIdentifier:(id)a5
{
  uint64_t ObjCClassMetadata;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v15;

  if (a3)
    ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  else
    ObjCClassMetadata = 0;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = v13;
  v15 = self;
  sub_15486C(ObjCClassMetadata, v9, v11, v12, v14);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v14;
  id v15;
  __n128 v16;
  uint64_t v18;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = self;
  v15 = sub_154B6C(v11, v13, (uint64_t)v10);

  v16 = swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v16);
  return v15;
}

- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v19;
  id v20;
  __n128 v21;
  uint64_t v23;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = v17;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = self;
  v20 = sub_154EFC(v13, v15, v16, v18, (uint64_t)v12);

  swift_bridgeObjectRelease(v15);
  v21 = swift_bridgeObjectRelease(v18);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v21);
  return v20;
}

- (NSArray)indexPathsForVisibleItems
{
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_15533C();

  type metadata accessor for IndexPath(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (NSArray)visibleCells
{
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;

  v2 = self;
  sub_155C58();
  v4 = v3;

  sub_F174(0, &qword_1FDDF0, UICollectionViewCell_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return sub_158464(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_layoutAttributesForItemAtIndexPath_);
}

- (void)insertItemsAtIndexPaths:(id)a3
{
  sub_1565A0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_insertItemsAtIndexPaths_);
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  sub_1565A0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_deleteItemsAtIndexPaths_);
}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v16 - v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = self;
  sub_156600((uint64_t)v13, (uint64_t)v10);

  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v10, v7);
  v15(v13, v7);
}

- (void)reloadItemsAtIndexPaths:(id)a3
{
  sub_1565A0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_reloadItemsAtIndexPaths_);
}

- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v11;
  uint64_t v12;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = self;
  sub_156F18((uint64_t)v10, a4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  _BOOL4 v6;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v14;
  uint64_t v15;

  v6 = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1FA950);
  __chkstk_darwin(v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = self;
  sub_1571B0((uint64_t)v11, v6, a5);

  sub_9944((uint64_t)v11, (uint64_t *)&unk_1FA950);
}

- (void)scrollToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v13;
  uint64_t v14;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = self;
  sub_157694((uint64_t)v12, a4, a5);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v14;

  y = a3.y;
  x = a3.x;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1FA950);
  __chkstk_darwin(v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  sub_15793C((uint64_t)v8, x, y);

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  return isa;
}

- (id)indexPathForCell:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1FA950);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  sub_157DD4((uint64_t)v8, (uint64_t)v7);

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }
  return isa;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  return sub_158464(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_cellForItemAtIndexPath_);
}

- (void)deleteSections:(id)a3
{
  sub_158BD0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_deleteSections_);
}

- (void)insertSections:(id)a3
{
  sub_158BD0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_insertSections_);
}

- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4
{
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v6;

  v6 = self;
  sub_158980(a3, a4);

}

- (void)reloadSections:(id)a3
{
  sub_158BD0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_reloadSections_);
}

- (void)_invalidateLayoutWithContext:(id)a3
{
  id v5;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v6;

  v5 = a3;
  v6 = self;
  sub_158C74(a3);

}

- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v9;
  uint64_t v11;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  LOBYTE(a3) = sub_158FE8((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a3 & 1;
}

- (void)updateInteractiveMovementTargetPosition:(CGPoint)a3
{
  double y;
  double x;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_1591E0(x, y);

}

- (void)endInteractiveMovement
{
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v2;

  v2 = self;
  sub_15962C();

}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char);
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v12;

  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  v8 = v7;
  if (!v6)
  {
    v9 = 0;
    if (v7)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  v9 = swift_allocObject(&unk_1D3E20, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  v6 = sub_15CEA8;
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = swift_allocObject(&unk_1D3DF8, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = sub_15CE94;
LABEL_6:
  v12 = self;
  sub_15975C((uint64_t)v6, v9, v11, v10);
  sub_145A0((uint64_t)v11, v10);
  sub_145A0((uint64_t)v6, v9);

}

- (id)_viewAnimationsForCurrentUpdate
{
  void *Strong;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  Class isa;
  objc_super v10;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC12NowPlayingUI32CompositeComponentCollectionView_compositeCollectionView);
  v4 = self;

  if (Strong)
  {

    v5 = _swiftEmptyArrayStorage;
  }
  else
  {
    v10.receiver = v4;
    v10.super_class = (Class)type metadata accessor for CompositeComponentCollectionView(0);
    v6 = -[CompositeComponentCollectionView _viewAnimationsForCurrentUpdate](&v10, "_viewAnimationsForCurrentUpdate");
    if (!v6)
    {

      return 0;
    }
    v7 = v6;
    v5 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, (char *)&type metadata for Any + 8);

  }
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (UIEdgeInsets)contentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  UIEdgeInsets result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CompositeComponentCollectionView(0);
  -[CompositeComponentCollectionView contentInset](&v6, "contentInset");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  sub_159C6C(top, left, bottom, right);

}

- (BOOL)isEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CompositeComponentCollectionView(0);
  return -[CompositeComponentCollectionView isEditing](&v3, "isEditing");
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *Strong;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v6;
  objc_super v7;

  v3 = a3;
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC12NowPlayingUI32CompositeComponentCollectionView_compositeCollectionView);
  v6 = self;

  if (Strong)
  {

  }
  else
  {
    v7.receiver = v6;
    v7.super_class = (Class)type metadata accessor for CompositeComponentCollectionView(0);
    -[CompositeComponentCollectionView setEditing:](&v7, "setEditing:", v3);

  }
}

- (BOOL)_isEditing
{
  uint64_t Strong;
  void *v4;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v5;
  unsigned __int8 v6;
  objc_super v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC12NowPlayingUI32CompositeComponentCollectionView_compositeCollectionView);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    v6 = objc_msgSend(v4, "mt_isEditing");

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)type metadata accessor for CompositeComponentCollectionView(0);
    return -[CompositeComponentCollectionView _isEditing](&v8, "_isEditing");
  }
}

- (void)reloadData
{
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v2;

  v2 = self;
  sub_159F60();

}

- (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  sub_15A0F4((char *)self, a3.x, a3.y, (uint64_t)a2, a4, (SEL *)&selRef_convertPoint_toView_);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  sub_15A0F4((char *)self, a3.x, a3.y, (uint64_t)a2, a4, (SEL *)&selRef_convertPoint_fromView_);
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  uint64_t Strong;
  void *v9;
  id v10;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v11;
  id v12;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC12NowPlayingUI32CompositeComponentCollectionView_compositeCollectionView);
  if (Strong)
  {
    v9 = (void *)Strong;
    v10 = a4;
    v11 = self;
    v12 = objc_msgSend(v9, "hitTest:withEvent:", v10, x, y);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)type metadata accessor for CompositeComponentCollectionView(0);
    v12 = -[CompositeComponentCollectionView hitTest:withEvent:](&v14, "hitTest:withEvent:", a4, x, y);
  }
  return v12;
}

- (_TtC12NowPlayingUI32CompositeComponentCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  _TtC12NowPlayingUI32CompositeComponentCollectionView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v9 = (_TtC12NowPlayingUI32CompositeComponentCollectionView *)sub_15CD54((uint64_t)v8, x, y, width, height);

  return v9;
}

- (_TtC12NowPlayingUI32CompositeComponentCollectionView)initWithCoder:(id)a3
{
  return (_TtC12NowPlayingUI32CompositeComponentCollectionView *)sub_15A46C(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC12NowPlayingUI32CompositeComponentCollectionView_compositeCollectionView);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI32CompositeComponentCollectionView_registeredReusableViewClasses));
  sub_9944((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI32CompositeComponentCollectionView_reorderingItemGlobalIndexPath, (uint64_t *)&unk_1FA950);
  swift_bridgeObjectRelease(*(_QWORD *)&self->isInvalidatingLayout[OBJC_IVAR____TtC12NowPlayingUI32CompositeComponentCollectionView_componentReuseIdentifierAddition]);
}

@end
