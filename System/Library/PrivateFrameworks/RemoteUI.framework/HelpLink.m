@implementation HelpLink

- (void)tapped
{
  uint64_t (*v2)(void);
  uint64_t v3;
  void *v4;
  void *v5;
  _TtC8RemoteUI8HelpLink *v6;
  _QWORD aBlock[6];

  v2 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.isa) + 0x70);
  v6 = self;
  v3 = v2();
  if (v3)
  {
    v4 = (void *)v3;
    aBlock[4] = nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_209EF5F18;
    aBlock[3] = &block_descriptor_3;
    v5 = _Block_copy(aBlock);
    objc_msgSend(v4, sel_activateElement_completion_, v6, v5);
    _Block_release(v5);

  }
  else
  {

  }
}

- (_TtC8RemoteUI8HelpLink)initWithAttributes:(id)a3 parent:(id)a4
{
  id v4;
  _TtC8RemoteUI8HelpLink *result;

  v4 = a4;
  result = (_TtC8RemoteUI8HelpLink *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8RemoteUI8HelpLink)init
{
  _TtC8RemoteUI8HelpLink *result;

  result = (_TtC8RemoteUI8HelpLink *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
