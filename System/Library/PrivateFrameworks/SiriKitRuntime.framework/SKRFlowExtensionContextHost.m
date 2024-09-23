@implementation SKRFlowExtensionContextHost

- (SKRFlowExtensionContextHost)init
{
  Class isa;
  SKRFlowExtensionContextHost *v4;

  isa = Array._bridgeToObjectiveC()().super.isa;
  v4 = -[SKRFlowExtensionContextHost initWithInputItems:listenerEndpoint:contextUUID:](self, sel_initWithInputItems_listenerEndpoint_contextUUID_, isa, 0, 0);

  return v4;
}

- (SKRFlowExtensionContextHost)initWithInputItems:(id)a3
{
  Class isa;
  SKRFlowExtensionContextHost *v5;

  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v5 = -[SKRFlowExtensionContextHost initWithInputItems:listenerEndpoint:contextUUID:](self, sel_initWithInputItems_listenerEndpoint_contextUUID_, isa, 0, 0);

  return v5;
}

- (SKRFlowExtensionContextHost)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  SKRFlowExtensionContextHost *v14;
  SKRFlowExtensionContextHost *v15;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = type metadata accessor for UUID();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  v13 = a4;
  specialized FlowExtensionContextHost.init(inputItems:listenerEndpoint:contextUUID:)(v10, (uint64_t)a4, (uint64_t)v9);
  v15 = v14;

  return v15;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return @objc static FlowExtensionContext._extensionAuxiliaryVendorProtocol()((uint64_t)a1, (uint64_t)a2, &one-time initialization token for remoteConversationXPCInterface, (id *)&static RemoteConversationXPCHelper.remoteConversationXPCInterface);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return @objc static FlowExtensionContext._extensionAuxiliaryVendorProtocol()((uint64_t)a1, (uint64_t)a2, &one-time initialization token for remoteConversationHostXPCInterface, (id *)&static RemoteConversationXPCHelper.remoteConversationHostXPCInterface);
}

- (SKRFlowExtensionContextHost)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  SKRFlowExtensionContextHost *result;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = type metadata accessor for UUID();
    v9 = 0;
  }
  else
  {
    v8 = type metadata accessor for UUID();
    v9 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, v9, 1);
  result = (SKRFlowExtensionContextHost *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
