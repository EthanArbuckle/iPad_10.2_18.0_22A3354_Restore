@implementation TVShelfSubHeaderView

- (_TtC9SeymourUI20TVShelfSubHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI20TVShelfSubHeaderView *)sub_22B374828(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI20TVShelfSubHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B3751EC();
}

- (void)applyLayoutAttributes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  id v9;
  _TtC9SeymourUI20TVShelfSubHeaderView *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B87230);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for TVShelfSubHeaderView();
  v15.receiver = self;
  v15.super_class = v8;
  v9 = a3;
  v10 = self;
  -[TVShelfSubHeaderView applyLayoutAttributes:](&v15, sel_applyLayoutAttributes_, v9);
  v11 = objc_msgSend(v9, sel_indexPath);
  sub_22BA79BCC();

  v12 = sub_22BA79C14();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 0, 1, v12);
  v13 = (uint64_t)v10 + OBJC_IVAR____TtC9SeymourUI20TVShelfSubHeaderView_indexPath;
  swift_beginAccess();
  sub_22B12A9A4((uint64_t)v7, v13);
  swift_endAccess();

}

- (void).cxx_destruct
{
  sub_22B18BA1C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVShelfSubHeaderView_indexPath);
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20TVShelfSubHeaderView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20TVShelfSubHeaderView_subHeaderLabel));
}

@end
