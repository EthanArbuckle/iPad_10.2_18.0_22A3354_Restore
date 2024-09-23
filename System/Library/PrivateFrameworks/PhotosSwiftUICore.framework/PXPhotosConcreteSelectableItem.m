@implementation PXPhotosConcreteSelectableItem

- (PXPhotosConcreteSelectableItem)initWithSelectionIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_2442876D0();
  return (PXPhotosConcreteSelectableItem *)sub_24421E8B4(v3, v4);
}

- (NSString)selectionIdentifier
{
  PXPhotosConcreteSelectableItem *v2;
  void *v3;

  v2 = self;
  sub_24421EA78();

  v3 = (void *)sub_2442876AC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  PXPhotosConcreteSelectableItem *v4;
  PXPhotosConcreteSelectableItem *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_244287CC4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_24421EAA8((uint64_t)v8);

  sub_24409C4DC((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  PXPhotosConcreteSelectableItem *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_24421EC64();

  return v3;
}

- (PXPhotosConcreteSelectableItem)init
{
  PhotosConcreteSelectableItem.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___PXPhotosConcreteSelectableItem_item);
}

@end
