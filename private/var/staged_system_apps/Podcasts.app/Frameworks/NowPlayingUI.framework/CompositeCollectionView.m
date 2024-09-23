@implementation CompositeCollectionView

- (void)layoutSubviews
{
  _TtC12NowPlayingUI23CompositeCollectionView *v2;

  v2 = self;
  sub_E6FEC();

}

- (void)_applyLayoutAttributes:(id)a3 toView:(id)a4
{
  id v7;
  id v8;
  _TtC12NowPlayingUI23CompositeCollectionView *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_E750C(a3, a4);

}

- (BOOL)allowsMultipleSelection
{
  _TtC12NowPlayingUI23CompositeCollectionView *v2;
  char v3;

  v2 = self;
  v3 = sub_E7A48((SEL *)&selRef_allowsMultipleSelection);

  return v3 & 1;
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  sub_E7BB0(self, (uint64_t)a2, a3, (SEL *)&selRef_setAllowsMultipleSelection_);
}

- (BOOL)_allowsMultipleSelectionDuringEditing
{
  _TtC12NowPlayingUI23CompositeCollectionView *v2;
  char v3;

  v2 = self;
  v3 = sub_E7A48((SEL *)&selRef__allowsMultipleSelectionDuringEditing);

  return v3 & 1;
}

- (void)_setAllowsMultipleSelectionDuringEditing:(BOOL)a3
{
  sub_E7BB0(self, (uint64_t)a2, a3, (SEL *)&selRef__setAllowsMultipleSelectionDuringEditing_);
}

- (BOOL)allowsSelection
{
  _TtC12NowPlayingUI23CompositeCollectionView *v2;
  char v3;

  v2 = self;
  v3 = sub_E7A48((SEL *)&selRef_allowsSelection);

  return v3 & 1;
}

- (void)setAllowsSelection:(BOOL)a3
{
  sub_E7BB0(self, (uint64_t)a2, a3, (SEL *)&selRef_setAllowsSelection_);
}

- (BOOL)_allowsSelectionDuringEditing
{
  _TtC12NowPlayingUI23CompositeCollectionView *v2;
  char v3;

  v2 = self;
  v3 = sub_E7A48((SEL *)&selRef__allowsSelectionDuringEditing);

  return v3 & 1;
}

- (void)_setAllowsSelectionDuringEditing:(BOOL)a3
{
  sub_E7BB0(self, (uint64_t)a2, a3, (SEL *)&selRef__setAllowsSelectionDuringEditing_);
}

- (UICollectionViewLayout)collectionViewLayout
{
  return (UICollectionViewLayout *)sub_E7EE8(self, (uint64_t)a2, (SEL *)&selRef_collectionViewLayout);
}

- (void)setCollectionViewLayout:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  v4 = a3;
  v5 = v6.receiver;
  -[CompositeCollectionView setCollectionViewLayout:](&v6, "setCollectionViewLayout:", v4);
  sub_E7C74();

}

- (UICollectionViewDataSource)dataSource
{
  return (UICollectionViewDataSource *)sub_E7EE8(self, (uint64_t)a2, (SEL *)&selRef_dataSource);
}

- (void)setDataSource:(id)a3
{
  sub_E7F40(self, (uint64_t)a2, (uint64_t)a3, (const char **)&selRef_setDataSource_, (void (*)(id))sub_E7DA0);
}

- (UICollectionViewDelegate)delegate
{
  return (UICollectionViewDelegate *)sub_E7EE8(self, (uint64_t)a2, (SEL *)&selRef_delegate);
}

- (void)setDelegate:(id)a3
{
  sub_E7F40(self, (uint64_t)a2, (uint64_t)a3, (const char **)&selRef_setDelegate_, (void (*)(id))sub_E7FB8);
}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)();
  _TtC12NowPlayingUI23CompositeCollectionView *v12;

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
  v9 = swift_allocObject(&unk_1D0878, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  v6 = sub_2BE90;
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = swift_allocObject(&unk_1D0850, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = (uint64_t (*)())sub_E83A4;
LABEL_6:
  v12 = self;
  sub_E6E04((uint64_t)v6, v9, v11, v10);
  sub_145A0((uint64_t)v11, v10);
  sub_145A0((uint64_t)v6, v9);

}

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
}

- (_TtC12NowPlayingUI23CompositeCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI23CompositeCollectionView_layoutSubviewsIgnoreCount) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI23CompositeCollectionView_didIgnoreLayoutSubviews) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI23CompositeCollectionView_isPerformingBatchUpdates) = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[CompositeCollectionView initWithFrame:collectionViewLayout:](&v12, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtC12NowPlayingUI23CompositeCollectionView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI23CompositeCollectionView_layoutSubviewsIgnoreCount) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI23CompositeCollectionView_didIgnoreLayoutSubviews) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI23CompositeCollectionView_isPerformingBatchUpdates) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[CompositeCollectionView initWithCoder:](&v7, "initWithCoder:", a3);
}

@end
