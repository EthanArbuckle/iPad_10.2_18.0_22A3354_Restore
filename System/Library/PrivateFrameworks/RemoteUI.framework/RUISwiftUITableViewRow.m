@implementation RUISwiftUITableViewRow

- (RUIXMLElement)xmlElement
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8RemoteUI22RUISwiftUITableViewRow_xmlElement);
  swift_beginAccess();
  return (RUIXMLElement *)*v2;
}

- (void)setXmlElement:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8RemoteUI22RUISwiftUITableViewRow_xmlElement);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RUISwiftUITableViewRow();
  return -[RUITableViewRow isSelected](&v3, sel_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  objc_class *v9;
  _TtC8RemoteUI22RUISwiftUITableViewRow *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v3 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BBDF8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (uint64_t *)((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = (objc_class *)type metadata accessor for RUISwiftUITableViewRow();
  v15.receiver = self;
  v15.super_class = v9;
  v10 = self;
  -[RUITableViewRow setSelected:](&v15, sel_setSelected_, v3);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = v3;
  *v8 = v11;
  v12 = *MEMORY[0x24BE5F340];
  v13 = sub_209F66BF8();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 104))(v8, v12, v13);
  (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v8, 0, 1, v13);
  sub_209F66C34();

}

- (_TtC8RemoteUI22RUISwiftUITableViewRow)init
{
  return (_TtC8RemoteUI22RUISwiftUITableViewRow *)RUISwiftUITableViewRow.init()();
}

- (_TtC8RemoteUI22RUISwiftUITableViewRow)initWithAttributes:(id)a3 parent:(id)a4
{
  uint64_t v5;
  id v6;

  if (a3)
    v5 = sub_209F67258();
  else
    v5 = 0;
  v6 = a4;
  return (_TtC8RemoteUI22RUISwiftUITableViewRow *)RUISwiftUITableViewRow.init(attributes:parent:)(v5, a4);
}

- (id)tableCell
{
  _TtC8RemoteUI22RUISwiftUITableViewRow *v2;
  id v3;

  v2 = self;
  v3 = sub_209F1ECC4();

  return v3;
}

- (void)didBecomeSelected
{
  sub_209F1F030(self, (uint64_t)a2, 1);
}

- (void)didBecomeDeselected
{
  sub_209F1F030(self, (uint64_t)a2, 0);
}

- (void)populatePostbackDictionary:(id)a3
{
  id v5;
  _TtC8RemoteUI22RUISwiftUITableViewRow *v6;

  v5 = a3;
  v6 = self;
  sub_209F1F158(a3);

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RemoteUI22RUISwiftUITableViewRow_xmlElement));

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RemoteUI22RUISwiftUITableViewRow____lazy_storage___contentRegistry));
  swift_release();
  swift_release();
}

@end
