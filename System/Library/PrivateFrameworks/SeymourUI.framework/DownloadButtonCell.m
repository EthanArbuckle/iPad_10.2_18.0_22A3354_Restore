@implementation DownloadButtonCell

- (_TtC9SeymourUI18DownloadButtonCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI18DownloadButtonCell *)sub_22B9E3C9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI18DownloadButtonCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B9E4994();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI18DownloadButtonCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for DownloadButtonCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[DownloadButtonCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI18DownloadButtonCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (void)handleDownloadButtonTapped:(id)a3
{
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC9SeymourUI18DownloadButtonCell *v13;
  uint64_t v14;

  v5 = type metadata accessor for ShelfItemAction();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI18DownloadButtonCell_delegate, v6);
  if (v9)
  {
    v10 = v9;
    v11 = swift_storeEnumTagMultiPayload();
    MEMORY[0x24BDAC7A8](v11);
    *(&v14 - 4) = 0;
    *((_BYTE *)&v14 - 24) = 1;
    *(&v14 - 2) = (uint64_t)v8;
    *(&v14 - 1) = v10;
    v12 = a3;
    v13 = self;
    sub_22B174F8C(v13, sub_22B1688FC, &v14 - 6, v10);
    swift_unknownObjectRelease();
    sub_22B1688C0((uint64_t)v8);

  }
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18DownloadButtonCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18DownloadButtonCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18DownloadButtonCell_downloadButton));
}

@end
