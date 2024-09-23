@implementation TVFilterResultActionsCell

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_sortButton);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI25TVFilterResultActionsCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25TVFilterResultActionsCell *)sub_22B16771C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI25TVFilterResultActionsCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B16890C();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI25TVFilterResultActionsCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVFilterResultActionsCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[TVFilterResultActionsCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (void)clearButtonTapped
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC9SeymourUI25TVFilterResultActionsCell *v9;
  uint64_t v10;

  v3 = type metadata accessor for ShelfItemAction();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_delegate);
  if (v6)
  {
    v7 = v6;
    v8 = swift_storeEnumTagMultiPayload();
    MEMORY[0x24BDAC7A8](v8);
    *(&v10 - 4) = 0;
    *((_BYTE *)&v10 - 24) = 1;
    *(&v10 - 2) = (uint64_t)v5;
    *(&v10 - 1) = v7;
    v9 = self;
    sub_22B174F8C();
    swift_unknownObjectRelease();
    sub_22B1688C0((uint64_t)v5);

  }
}

- (void)sortButtonTapped
{
  _TtC9SeymourUI25TVFilterResultActionsCell *v2;

  v2 = self;
  sub_22B1682C0();

}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_sortButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVFilterResultActionsCell_bottomFocusGuide));
}

@end
