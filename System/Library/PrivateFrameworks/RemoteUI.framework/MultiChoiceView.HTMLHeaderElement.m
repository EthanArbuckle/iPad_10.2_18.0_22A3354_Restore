@implementation MultiChoiceView.HTMLHeaderElement

- (void)webContainerView:(id)a3 didClickLinkWithURL:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtCV8RemoteUI15MultiChoiceView17HTMLHeaderElement *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BB600);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_209F66A60();
    v11 = sub_209F66A90();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = sub_209F66A90();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  v13 = a3;
  v14 = self;
  sub_209F0836C((uint64_t)v10);

  sub_209EE017C((uint64_t)v10, &qword_2545BB600);
}

- (_TtCV8RemoteUI15MultiChoiceView17HTMLHeaderElement)initWithAttributes:(id)a3 parent:(id)a4
{
  sub_209F05A68((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (_TtCV8RemoteUI15MultiChoiceView17HTMLHeaderElement)init
{
  _TtCV8RemoteUI15MultiChoiceView17HTMLHeaderElement *result;

  result = (_TtCV8RemoteUI15MultiChoiceView17HTMLHeaderElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCV8RemoteUI15MultiChoiceView17HTMLHeaderElement_webContainerView));
  swift_unknownObjectWeakDestroy();
}

- (id)parent
{
  uint64_t (*v1)(void);
  _QWORD *v2;
  void *v3;

  v1 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *a1) + 0x60);
  v2 = a1;
  v3 = (void *)v1();

  return v3;
}

@end
