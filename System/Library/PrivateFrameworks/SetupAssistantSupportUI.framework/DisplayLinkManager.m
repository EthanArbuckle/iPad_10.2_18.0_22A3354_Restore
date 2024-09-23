@implementation DisplayLinkManager

- (void)frameWithDisplayLink:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void (*v8)(uint64_t, double);
  double v9;
  uint64_t v10;
  _TtC23SetupAssistantSupportUI18DisplayLinkManager *v11;

  v4 = a3;
  v11 = self;
  objc_msgSend(v4, sel_targetTimestamp);
  v6 = v5;
  objc_msgSend(v4, sel_timestamp);
  v8 = *(void (**)(uint64_t, double))((char *)&v11->super.isa
                                              + OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_frameUpdateBlock);
  if (v8)
  {
    v9 = v6 - v7;
    v10 = swift_retain();
    v8(v10, v9);
    sub_245DD3954((uint64_t)v8);
  }

}

- (_TtC23SetupAssistantSupportUI18DisplayLinkManager)init
{
  _TtC23SetupAssistantSupportUI18DisplayLinkManager *result;

  result = (_TtC23SetupAssistantSupportUI18DisplayLinkManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink));
  sub_245DD3954(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_frameUpdateBlock));
}

@end
