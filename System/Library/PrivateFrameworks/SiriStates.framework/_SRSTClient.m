@implementation _SRSTClient

- (_SRSTClientDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____SRSTClient_delegate;
  swift_beginAccess();
  return (_SRSTClientDelegate *)(id)MEMORY[0x2199DD49C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_SRSTState)currentState
{
  _SRSTClient *v3;
  id v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();

  return (_SRSTState *)v5;
}

- (void)setCurrentState:(id)a3
{
  id v5;
  _SRSTClient *v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v5 = a3;
  v6 = self;
  static Published.subscript.setter();
}

- (NSString)mostRecentEventName
{
  uint64_t (*v2)(void);
  _SRSTClient *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xB8);
  v3 = self;
  v4 = v2();
  if ((v5 & 1) != 0)
  {

    v9 = 0;
  }
  else
  {
    v6 = Event.name.getter(v4);
    v8 = v7;

    v9 = (void *)MEMORY[0x2199DCD04](v6, v8);
    swift_bridgeObjectRelease();
  }
  return (NSString *)v9;
}

- (void)dispatchEvent:(int64_t)a3
{
  unint64_t v4;
  int64_t v5;

  type metadata accessor for NotificationCenterHelper();
  v5 = a3;
  v4 = lazy protocol witness table accessor for type Event and conformance Event();
  static NotificationCenterHelper.dispatch<A>(_:)((uint64_t)&v5, (uint64_t)&type metadata for Event, v4);
}

- (void)dealloc
{
  _SRSTClient *v2;

  v2 = self;
  Client.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  outlined destroy of weak SharedClientDelegate?((uint64_t)self + OBJC_IVAR____SRSTClient_delegate);
  v3 = (char *)self + OBJC_IVAR____SRSTClient__currentState;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<State?>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____SRSTClient__mostRecentEvent;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Event?>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (_SRSTClient)init
{
  _SRSTClient *result;

  Client.init()();
  return result;
}

- (void)stopClient
{
  _SRSTClient *v2;

  v2 = self;
  Client.stopClient()();

}

@end
