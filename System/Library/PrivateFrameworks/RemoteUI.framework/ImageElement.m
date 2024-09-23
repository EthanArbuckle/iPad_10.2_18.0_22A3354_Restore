@implementation ImageElement

- (void)setImage:(id)a3
{
  void (*v5)(id);
  id v6;
  _TtC8RemoteUI12ImageElement *v7;

  v5 = *(void (**)(id))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.isa) + 0x78);
  v6 = a3;
  v7 = self;
  v5(a3);

}

- (void)setImageSize:(CGSize)a3
{
  CGFloat width;
  CGFloat height;
  void (*v5)(_QWORD, _QWORD, _QWORD);
  _TtC8RemoteUI12ImageElement *v6;

  width = a3.width;
  height = a3.height;
  v5 = *(void (**)(_QWORD, _QWORD, _QWORD))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.isa) + 0xA8);
  v6 = self;
  v5(*(_QWORD *)&width, *(_QWORD *)&height, 0);

}

- (void)setTintColor:(id)a3
{
  void (*v5)(id);
  id v6;
  _TtC8RemoteUI12ImageElement *v7;

  v5 = *(void (**)(id))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.isa) + 0xD8);
  v6 = a3;
  v7 = self;
  v5(a3);

}

- (id)sourceURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC8RemoteUI12ImageElement *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BB600);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.isa) + 0x100);
  v8 = self;
  v7();

  v9 = sub_209F66A90();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1)
  {
    v11 = (void *)sub_209F66A48();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
  }
  return v11;
}

- (_TtC8RemoteUI12ImageElement)initWithAttributes:(id)a3 parent:(id)a4
{
  id v4;
  _TtC8RemoteUI12ImageElement *result;

  v4 = a4;
  result = (_TtC8RemoteUI12ImageElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8RemoteUI12ImageElement)init
{
  _TtC8RemoteUI12ImageElement *result;

  result = (_TtC8RemoteUI12ImageElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC8RemoteUI12ImageElement__image;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC358);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8RemoteUI12ImageElement__imageSize;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC368);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8RemoteUI12ImageElement__tintColor;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BC380);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  sub_209EF528C((uint64_t)self + OBJC_IVAR____TtC8RemoteUI12ImageElement_baseURL);
}

@end
