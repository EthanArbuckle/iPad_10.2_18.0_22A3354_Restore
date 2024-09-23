@implementation ActionBrickRowCell

- (_TtC9SeymourUI18ActionBrickRowCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI18ActionBrickRowCell *)sub_22B99BE20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI18ActionBrickRowCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B99DFAC();
}

- (void)prepareForReuse
{
  _TtC9SeymourUI18ActionBrickRowCell *v2;

  v2 = self;
  sub_22B99D380();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI18ActionBrickRowCell *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  v10 = -[ActionBrickRowCell contentView](v9, sel_contentView);
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  objc_msgSend(v10, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
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
  _TtC9SeymourUI18ActionBrickRowCell *v13;
  uint64_t v14;

  v5 = type metadata accessor for ShelfItemAction();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI18ActionBrickRowCell_delegate, v6);
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
    sub_22B119E2C((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for ShelfItemAction);

  }
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18ActionBrickRowCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18ActionBrickRowCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ActionBrickRowCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ActionBrickRowCell_downloadButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ActionBrickRowCell_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ActionBrickRowCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ActionBrickRowCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18ActionBrickRowCell_textLayoutGuide));
}

@end
