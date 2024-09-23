@implementation StateCaptureServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC14ReplicatorCore18StateCaptureServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_245237720(v8);

  swift_unknownObjectRelease();
}

- (_TtC14ReplicatorCore18StateCaptureServer)init
{
  _TtC14ReplicatorCore18StateCaptureServer *result;

  result = (_TtC14ReplicatorCore18StateCaptureServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14ReplicatorCore18StateCaptureServer_requestProcessingQueue));
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC14ReplicatorCore18StateCaptureServer_stateCaptureManager);

}

- (id)stateFor:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC14ReplicatorCore18StateCaptureServer *v8;
  void *v9;

  if (a3)
  {
    v5 = sub_245244A68();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = self;
  sub_245236F34(v5, v7);

  swift_bridgeObjectRelease();
  v9 = (void *)sub_245244A44();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)dataPathAndReturnError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC14ReplicatorCore18StateCaptureServer *v8;
  void *v9;
  uint64_t v11;

  v4 = sub_245243790();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_24521E604((uint64_t)v7);
  sub_245243760();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  v9 = (void *)sub_245244A44();
  swift_bridgeObjectRelease();
  return v9;
}

@end
