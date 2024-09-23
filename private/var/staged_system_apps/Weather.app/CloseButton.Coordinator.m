@implementation CloseButton.Coordinator

- (void)doAction:(id)a3
{
  _TtCV7Weather11CloseButton11Coordinator *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6, a3);
  swift_unknownObjectRelease(a3);
  sub_10071B280();

  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v6);
}

- (_TtCV7Weather11CloseButton11Coordinator)init
{
  sub_100292978();
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->parent[OBJC_IVAR____TtCV7Weather11CloseButton11Coordinator_parent]);
}

@end
