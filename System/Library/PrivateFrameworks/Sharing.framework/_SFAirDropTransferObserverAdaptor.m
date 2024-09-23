@implementation _SFAirDropTransferObserverAdaptor

- (SFAirDropTransferObserverDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC7Sharing33_SFAirDropTransferObserverAdaptor_delegate;
  swift_beginAccess();
  return (SFAirDropTransferObserverDelegate *)(id)MEMORY[0x1A8589784](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC7Sharing33_SFAirDropTransferObserverAdaptor)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC7Sharing33_SFAirDropTransferObserverAdaptor *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = type metadata accessor for SFAirDropClient.Identifier();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  swift_storeEnumTagMultiPayload();
  type metadata accessor for SFAirDropClient(0);
  swift_allocObject();
  v7 = self;
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC7Sharing33_SFAirDropTransferObserverAdaptor_client) = (Class)SFAirDropClient.init(identifier:)((uint64_t)v6);

  v9.receiver = v7;
  v9.super_class = ObjectType;
  return -[_SFAirDropTransferObserverAdaptor init](&v9, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
  sub_1A29C0DE0((uint64_t)self + OBJC_IVAR____TtC7Sharing33_SFAirDropTransferObserverAdaptor_delegate);
}

@end
