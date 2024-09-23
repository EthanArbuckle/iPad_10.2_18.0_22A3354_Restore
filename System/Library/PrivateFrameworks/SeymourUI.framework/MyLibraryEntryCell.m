@implementation MyLibraryEntryCell

- (_TtC9SeymourUI18MyLibraryEntryCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI18MyLibraryEntryCell *)sub_22B6E9410(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI18MyLibraryEntryCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC9SeymourUI18MyLibraryEntryCell *result;

  *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC9SeymourUI18MyLibraryEntryCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI18MyLibraryEntryCell_itemInfo;
  v6 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC9SeymourUI18MyLibraryEntryCell *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI18MyLibraryEntryCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for MyLibraryEntryCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[MyLibraryEntryCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI18MyLibraryEntryCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18MyLibraryEntryCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18MyLibraryEntryCell_itemInfo);
}

@end
