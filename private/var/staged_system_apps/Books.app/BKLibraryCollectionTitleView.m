@implementation BKLibraryCollectionTitleView

- (BKLibraryCollectionTitleViewDelegate)delegate
{
  return (BKLibraryCollectionTitleViewDelegate *)(id)swift_unknownObjectWeakLoadStrong(&self->_UINavigationBarTitleView_opaque[OBJC_IVAR___BKLibraryCollectionTitleView_delegate]);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign(&self->_UINavigationBarTitleView_opaque[OBJC_IVAR___BKLibraryCollectionTitleView_delegate], a3);
}

- (void)contentDidChange
{
  BKLibraryCollectionTitleView *v2;

  v2 = self;
  LibraryCollectionTitleView.contentDidChange()();

}

- (BKLibraryCollectionTitleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR___BKLibraryCollectionTitleView_minHeightThatCountsAsVisible] = 0x4034000000000000;
  swift_unknownObjectWeakInit(&self->_UINavigationBarTitleView_opaque[OBJC_IVAR___BKLibraryCollectionTitleView_delegate]);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for LibraryCollectionTitleView();
  return -[BKLibraryCollectionTitleView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (BKLibraryCollectionTitleView)initWithCoder:(id)a3
{
  objc_super v6;

  *(_QWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR___BKLibraryCollectionTitleView_minHeightThatCountsAsVisible] = 0x4034000000000000;
  swift_unknownObjectWeakInit(&self->_UINavigationBarTitleView_opaque[OBJC_IVAR___BKLibraryCollectionTitleView_delegate]);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LibraryCollectionTitleView();
  return -[BKLibraryCollectionTitleView initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1001FE9A0((uint64_t)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR___BKLibraryCollectionTitleView_delegate]);
}

@end
