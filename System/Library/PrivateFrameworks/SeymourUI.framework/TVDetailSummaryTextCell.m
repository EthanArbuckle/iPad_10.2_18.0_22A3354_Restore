@implementation TVDetailSummaryTextCell

- (_TtC9SeymourUI23TVDetailSummaryTextCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23TVDetailSummaryTextCell *)sub_22B5BD1EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23TVDetailSummaryTextCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B5BEAA8();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI23TVDetailSummaryTextCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVDetailSummaryTextCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[TVFocusableCollectionViewCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI23TVDetailSummaryTextCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (void).cxx_destruct
{
  void *v3;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23TVDetailSummaryTextCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23TVDetailSummaryTextCell_itemInfo);
  v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI23TVDetailSummaryTextCell_layout);
  objc_release(*(id *)((char *)&self->super.super.super.super.super._animationInfo
                     + OBJC_IVAR____TtC9SeymourUI23TVDetailSummaryTextCell_layout));
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVDetailSummaryTextCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVDetailSummaryTextCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVDetailSummaryTextCell_textView));
}

@end
