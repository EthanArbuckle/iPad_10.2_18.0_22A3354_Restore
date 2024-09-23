@implementation STLSHandshaker

- (id)getEncryptionSecretWithWrite:(BOOL)a3
{
  _TtC10nwswifttls14STLSHandshaker *v4;
  void *v5;

  v4 = self;
  v5 = (void *)STLSHandshaker.getEncryptionSecret(write:)(a3);

  return v5;
}

- (int64_t)getEncryptionLevel
{
  _TtC10nwswifttls14STLSHandshaker *v2;
  Swift::Int v3;

  v2 = self;
  v3 = STLSHandshaker.getEncryptionLevel()();

  return v3;
}

- (id)getPeerQUICTransportParameters
{
  _TtC10nwswifttls14STLSHandshaker *v2;
  void *v3;

  v2 = self;
  v3 = (void *)STLSHandshaker.getPeerQUICTransportParameters()();

  return v3;
}

- (BOOL)getEarlyDataAccepted
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  _TtC10nwswifttls14STLSHandshaker *v9;
  char v10;
  char v11;
  uint64_t v12;

  v3 = type metadata accessor for HandshakeStateMachine();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC10nwswifttls14STLSHandshaker_stateMachine;
  swift_beginAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v7, 1, v3))
    return 0;
  outlined init with copy of PartialHandshakeResult((uint64_t)v7, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HandshakeStateMachine);
  v9 = self;
  HandshakeStateMachine.earlyDataAccepted.getter();
  v11 = v10;
  outlined destroy of PartialHandshakeResult((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HandshakeStateMachine);

  return v11 & 1;
}

- (id)continueHandshake:(id)a3
{
  id v4;
  _TtC10nwswifttls14STLSHandshaker *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)STLSHandshaker.continueHandshake(_:)((NSData)v4);

  return v6;
}

- (BOOL)hasSessionState
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC10nwswifttls14STLSHandshaker_receivedSessionTickets;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v2 + 16) != 0;
}

- (int64_t)getNegotiatedCiphersuite
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int64_t result;
  _TtC10nwswifttls14STLSHandshaker *v9;
  int v10;
  int v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HandshakeStateMachine?);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC10nwswifttls14STLSHandshaker_stateMachine;
  swift_beginAccess();
  outlined init with copy of PartialHandshakeResult.NewEncryptionLevel?((uint64_t)v6, (uint64_t)v5, &demangling cache variable for type metadata for HandshakeStateMachine?);
  v7 = type metadata accessor for HandshakeStateMachine();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v9 = self;
    HandshakeStateMachine.negotiatedCiphersuite.getter();
    v11 = v10;
    outlined destroy of PartialHandshakeResult((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HandshakeStateMachine);

    if ((v11 & 0x10000) != 0)
      return 0;
    else
      return (unsigned __int16)v11;
  }
  return result;
}

- (int)getErrorCode
{
  _TtC10nwswifttls14STLSHandshaker *v2;
  Swift::Int32 v3;

  v2 = self;
  v3 = STLSHandshaker.getErrorCode()();

  return v3;
}

- (id)getSessionState
{
  _TtC10nwswifttls14STLSHandshaker *v2;
  void *v3;

  v2 = self;
  v3 = (void *)STLSHandshaker.getSessionState()();

  return v3;
}

- (id)startHandshake
{
  _TtC10nwswifttls14STLSHandshaker *v2;
  void *v3;

  v2 = self;
  v3 = (void *)STLSHandshaker.startHandshake()();

  return v3;
}

- (int64_t)isImplemented
{
  return 1;
}

- (id)init:(id)a3 serverName:(id)a4 quicTransportParameters:(id)a5 alpn:(id)a6 sessionState:(id)a7 ticketRequest:(id)a8 useX25519KeyExchange:(BOOL)a9
{
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  if (a8)
    v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v14 = 0;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  return (id)STLSHandshaker.init(_:serverName:quicTransportParameters:alpn:sessionState:ticketRequest:useX25519KeyExchange:)(a3, a4, a5, a6, a7, v14, a9);
}

- (id)getClientRandom
{
  _TtC10nwswifttls14STLSHandshaker *v2;
  void *v3;

  v2 = self;
  v3 = (void *)STLSHandshaker.getClientRandom()();

  return v3;
}

- (id)validateAuthenticatorWithAuthenticator:(id)a3 context:(id)a4 keyParser:(id)a5
{
  void *v8;
  id v9;
  _TtC10nwswifttls14STLSHandshaker *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  Class isa;
  _QWORD v21[4];

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = self;
  v11 = a4;
  v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;

  if (v11)
  {
    v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v18 = v17;

  }
  else
  {
    v16 = 0;
    v18 = 0xF000000000000000;
  }
  MEMORY[0x1E0C80A78](v15);
  v21[2] = v8;
  specialized STLSHandshaker.validateAuthenticator(authenticator:context:keyParser:)(v12, v14, (uint64_t)partial apply for thunk for @callee_unowned @convention(block) (@unowned NSData) -> (@autoreleased NSData?), (uint64_t)v21);
  _Block_release(v8);
  outlined consume of ByteBuffer?(v16, v18);
  outlined consume of Data._Representation(v12, v14);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (_TtC10nwswifttls14STLSHandshaker)init
{
  _TtC10nwswifttls14STLSHandshaker *result;

  result = (_TtC10nwswifttls14STLSHandshaker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of HandshakeStateMachine?((uint64_t)self + OBJC_IVAR____TtC10nwswifttls14STLSHandshaker_stateMachine, &demangling cache variable for type metadata for HandshakeStateMachine?);
  outlined destroy of HandshakeStateMachine?((uint64_t)self + OBJC_IVAR____TtC10nwswifttls14STLSHandshaker_partialHandshakeResult, &demangling cache variable for type metadata for PartialHandshakeResult?);
  swift_bridgeObjectRelease();

}

@end
