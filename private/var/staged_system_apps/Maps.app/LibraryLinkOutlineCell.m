@implementation LibraryLinkOutlineCell

- (_TtC4Maps27LibraryLinkOutlineCellModel)cellModel
{
  return (_TtC4Maps27LibraryLinkOutlineCellModel *)sub_1000113F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps22LibraryLinkOutlineCell_cellModel);
}

- (void)setCellModel:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC4Maps22LibraryLinkOutlineCell *v8;
  _BYTE v9[24];

  v5 = (void **)((char *)&self->super.super + OBJC_IVAR____TtC4Maps22LibraryLinkOutlineCell_cellModel);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps22LibraryLinkOutlineCell_cellModel, v9, 1, 0);
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_100011568();
}

- (_TtC4Maps22LibraryLinkOutlineCell)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps22LibraryLinkOutlineCell *)LibraryLinkOutlineCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps22LibraryLinkOutlineCell)initWithCoder:(id)a3
{
  id v4;
  _TtC4Maps22LibraryLinkOutlineCell *result;

  *(MapsThemeCollectionViewOutlineCell *)((char *)&self->super.super
                                        + OBJC_IVAR____TtC4Maps22LibraryLinkOutlineCell_cellModel) = 0;
  v4 = a3;

  result = (_TtC4Maps22LibraryLinkOutlineCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E41970, "Maps/LibraryLinkOutlineCell.swift", 33, 2, 60, 0);
  __break(1u);
  return result;
}

- (void)updateFromModel
{
  _TtC4Maps22LibraryLinkOutlineCell *v2;

  v2 = self;
  sub_100011568();

}

- (void).cxx_destruct
{

}

@end
