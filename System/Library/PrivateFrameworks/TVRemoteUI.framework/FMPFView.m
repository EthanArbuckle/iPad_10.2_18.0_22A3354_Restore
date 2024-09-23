@implementation FMPFView

- (_TtC10TVRemoteUI8FMPFView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized FMPFView.init(coder:)();
}

- (NSString)description
{
  _TtC10TVRemoteUI8FMPFView *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = FMR1HapticsController.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x22075C584](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  void *v3;
  _TtC10TVRemoteUI8FMPFView *v4;
  id v5;
  objc_super v6;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI8FMPFView_ecoModeObservation);
  v4 = self;
  if (v3)
  {
    v5 = v3;
    dispatch thunk of NSKeyValueObservation.invalidate()();

  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMPFView();
  -[FMPFView dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  _BYTE v5[184];

  outlined init with take of FMPFSKPatternNodeConfig?((uint64_t)self + OBJC_IVAR____TtC10TVRemoteUI8FMPFView_config, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for FMPFSKPatternNodeConfig?);
  outlined retain of FMPFSKPatternNodeConfig?((uint64_t)v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of FMPFSKPatternNodeConfig?);

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI8FMPFView_backdropRGBAColorSprings);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC10TVRemoteUI8FMPFView_backdropRGBAColorSprings);
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC10TVRemoteUI8FMPFView_backdropRGBAColorSprings));

  outlined destroy of weak FMPFSKPatternNodeDelegate?((uint64_t)self + OBJC_IVAR____TtC10TVRemoteUI8FMPFView_fmpfdelegate);
}

- (void)thermalStateDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC10TVRemoteUI8FMPFView *v5;

  v4 = a3;
  v5 = self;
  FMPFView.thermalStateDidChange(notification:)((NSNotification)v4);

}

- (_TtC10TVRemoteUI8FMPFView)initWithFrame:(CGRect)a3
{
  _TtC10TVRemoteUI8FMPFView *result;

  result = (_TtC10TVRemoteUI8FMPFView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
