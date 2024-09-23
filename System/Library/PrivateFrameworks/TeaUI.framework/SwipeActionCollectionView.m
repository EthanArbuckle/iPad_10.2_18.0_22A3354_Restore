@implementation SwipeActionCollectionView

- (BOOL)allowsSelection
{
  _TtC5TeaUI25SwipeActionCollectionView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = SwipeActionCollectionView.allowsSelection.getter();

  return v3 & 1;
}

- (void)reloadData
{
  _TtC5TeaUI25SwipeActionCollectionView *v2;

  v2 = self;
  SwipeActionCollectionView.reloadData()();

}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char);
  _TtC5TeaUI25SwipeActionCollectionView *v12;

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
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v6;
  v6 = sub_1B1456244;
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  v11 = sub_1B145E328;
LABEL_6:
  v12 = self;
  SwipeActionCollectionView.performBatchUpdates(_:completion:)((uint64_t)v6, v9, (uint64_t)v11, v10);
  sub_1B13B9100((uint64_t)v11);
  sub_1B13B9100((uint64_t)v6);

}

- (void)layoutSubviews
{
  _TtC5TeaUI25SwipeActionCollectionView *v2;

  v2 = self;
  SwipeActionCollectionView.layoutSubviews()();

}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  _TtC5TeaUI25SwipeActionCollectionView *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  SwipeActionCollectionView.contentOffset.setter(x, y);

}

- (CGPoint)contentOffset
{
  _TtC5TeaUI25SwipeActionCollectionView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = self;
  SwipeActionCollectionView.contentOffset.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (_TtC5TeaUI25SwipeActionCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4;

  v4 = a4;
  SwipeActionCollectionView.init(frame:collectionViewLayout:)();
}

- (void)didMoveToWindow
{
  _TtC5TeaUI25SwipeActionCollectionView *v2;

  v2 = self;
  SwipeActionCollectionView.didMoveToWindow()();

}

- (void)insertSections:(id)a3
{
  sub_1B13A6C38(self, (uint64_t)a2, (uint64_t)a3, SwipeActionCollectionView.insertSections(_:));
}

- (void)insertItemsAtIndexPaths:(id)a3
{
  sub_1B140E7E4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))SwipeActionCollectionView.insertItems(at:));
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  sub_1B140E7E4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))SwipeActionCollectionView.deleteItems(at:));
}

- (void)setAllowsSelection:(BOOL)a3
{
  _TtC5TeaUI25SwipeActionCollectionView *v4;

  v4 = self;
  SwipeActionCollectionView.allowsSelection.setter(a3);

}

- (void)dealloc
{
  _TtC5TeaUI25SwipeActionCollectionView *v2;

  v2 = self;
  SwipeActionCollectionView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI25SwipeActionCollectionView_swipeActionManager));
  OUTLINED_FUNCTION_46_1();
  OUTLINED_FUNCTION_46_1();
  OUTLINED_FUNCTION_46_1();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI25SwipeActionCollectionView_updateGroup));
  sub_1B140F694((uint64_t)self + OBJC_IVAR____TtC5TeaUI25SwipeActionCollectionView_swipeActionRestoreState, &qword_1ED1850C8, (uint64_t (*)(uint64_t))type metadata accessor for SwipeActionRestoreState);
  OUTLINED_FUNCTION_0_0();
}

- (_TtC5TeaUI25SwipeActionCollectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B15DA274();
}

- (void)handlePanGestureWithGestureRecognizer:(id)a3
{
  id v4;
  _TtC5TeaUI25SwipeActionCollectionView *v5;

  v4 = a3;
  v5 = self;
  sub_1B15DA5D8(v4);

}

- (void)handleFromCoordinatingGestureWithGestureRecognizer:(id)a3
{
  id v4;
  _TtC5TeaUI25SwipeActionCollectionView *v5;

  v4 = a3;
  v5 = self;
  sub_1B15DA670(v4);

}

- (UIPanGestureRecognizer)coordinatingSwipeActionPanGestureRecognizer
{
  return (UIPanGestureRecognizer *)SwipeActionCollectionView.coordinatingSwipeActionPanGestureRecognizer.getter();
}

- (BOOL)coordinatingSwipeActionShouldCancel
{
  _TtC5TeaUI25SwipeActionCollectionView *v2;
  BOOL v3;

  v2 = self;
  v3 = SwipeActionCollectionView.coordinatingSwipeActionShouldCancel.getter();

  return v3;
}

- (void)coordinatingResetSwipeAction
{
  _TtC5TeaUI25SwipeActionCollectionView *v2;

  v2 = self;
  SwipeActionCollectionView.coordinatingResetSwipeAction()();

}

- (void)reloadSections:(id)a3
{
  sub_1B13A6C38(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))SwipeActionCollectionView.reloadSections(_:));
}

- (void)reloadItemsAtIndexPaths:(id)a3
{
  sub_1B140E7E4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))SwipeActionCollectionView.reloadItems(at:));
}

- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4
{
  _TtC5TeaUI25SwipeActionCollectionView *v6;

  v6 = self;
  SwipeActionCollectionView.moveSection(_:toSection:)(a3, a4);

}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _TtC5TeaUI25SwipeActionCollectionView *v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;

  v5 = sub_1B16B7D60();
  v6 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x1E0C80A78](v5, v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8, v11);
  v13 = (char *)&v16 - v12;
  sub_1B16B7D0C();
  sub_1B16B7D0C();
  v14 = self;
  SwipeActionCollectionView.moveItem(at:to:)();

  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v10, v5);
  v15(v13, v5);
}

- (void)deleteSections:(id)a3
{
  sub_1B13A6C38(self, (uint64_t)a2, (uint64_t)a3, SwipeActionCollectionView.deleteSections(_:));
}

@end
