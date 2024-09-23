@implementation WidgetRendererClient

- (_TtC14WidgetRenderer20WidgetRendererClient)init
{
  return (_TtC14WidgetRenderer20WidgetRendererClient *)sub_24A5386D4();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer20WidgetRendererClient__queue_connection));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC14WidgetRenderer20WidgetRendererClient__lock_systemEnvironment;
  v4 = sub_24A558728();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)initializeConnection:(id)a3
{
  id v4;
  _TtC14WidgetRenderer20WidgetRendererClient *v5;

  v4 = a3;
  v5 = self;
  sub_24A53E4C4(v4);

}

- (void)clientConfigurationsDidChange:(id)a3 forHost:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtC14WidgetRenderer20WidgetRendererClient *v10;

  v6 = sub_24A55931C();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_24A540260(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)extensionsDidChange:(id)a3
{
  id v4;
  _TtC14WidgetRenderer20WidgetRendererClient *v5;

  v4 = a3;
  v5 = self;
  sub_24A540778(v4);

}

- (void)systemEnvironmentDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC14WidgetRenderer20WidgetRendererClient *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_24A5581A0();
  v7 = v6;

  sub_24A540D44();
  sub_24A52F044(v5, v7);

}

- (void)timelinesDidChange:(id)a3
{
  sub_24A5429AC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_24A5416D4);
}

- (void)snapshotsDidChange:(id)a3
{
  sub_24A5429AC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_24A541A68);
}

- (void)placeholdersDidChange:(id)a3
{
  sub_24A5429AC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_24A5424CC);
}

- (uint64_t)flushPowerlog
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD aBlock[6];

  v0 = sub_24A558848();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v12 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_24A558884();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A50F674(0, (unint64_t *)&qword_2544D4600);
  v8 = (void *)sub_24A5594CC();
  aBlock[4] = sub_24A53E3A4;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A53792C;
  aBlock[3] = &block_descriptor_57;
  v9 = _Block_copy(aBlock);
  sub_24A558860();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_24A4FE0CC(&qword_2544D4488, v1, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D4590);
  sub_24A501724((unint64_t *)&qword_2544D4598, &qword_2544D4590, MEMORY[0x24BEE12C8]);
  sub_24A559610();
  MEMORY[0x24BD12A40](0, v7, v3, v9);
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
