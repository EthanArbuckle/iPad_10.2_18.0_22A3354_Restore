@implementation ShelfTitleView

- (_TtC9SeymourUI14ShelfTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI14ShelfTitleView *)sub_22B3B52D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  _TtC9SeymourUI14ShelfTitleView *v2;

  v2 = self;
  sub_22B3B61B8();

}

- (void)applyLayoutAttributes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  id v9;
  _TtC9SeymourUI14ShelfTitleView *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B87230);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for ShelfTitleView(0);
  v15.receiver = self;
  v15.super_class = v8;
  v9 = a3;
  v10 = self;
  -[ShelfTitleView applyLayoutAttributes:](&v15, sel_applyLayoutAttributes_, v9);
  v11 = objc_msgSend(v9, sel_indexPath);
  sub_22BA79BCC();

  v12 = sub_22BA79C14();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 0, 1, v12);
  v13 = (uint64_t)v10 + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_indexPath;
  swift_beginAccess();
  sub_22B12A9A4((uint64_t)v7, v13);
  swift_endAccess();

}

- (void)tappedTitleButton:(id)a3
{
  _TtC9SeymourUI14ShelfTitleView *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_22BA812E8();
  swift_unknownObjectRelease();
  sub_22B3B63E8();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC9SeymourUI14ShelfTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B3B7700();
}

- (void).cxx_destruct
{
  sub_22B18BA1C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_indexPath);
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_titleButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22B3B7F90((uint64_t)self + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_layout);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14ShelfTitleView_titleTopConstraint));
}

@end
