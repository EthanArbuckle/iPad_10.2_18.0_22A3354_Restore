@implementation RegistryCrux

- (void)xpcDeviceID:(id)a3 needsPasscode:(id)a4
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = type metadata accessor for UUID();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = one-time initialization token for framework;
  v11 = a4;
  swift_retain();
  if (v10 != -1)
    swift_once();
  v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Logs.framework);
  v13 = Logger.logObject.getter();
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_2433AF000, v13, v14, "RegistryCrux: xpcDeviceID", v15, 2u);
    MEMORY[0x2494F8478](v15, -1, -1);
  }
  swift_release();

  outlined destroy of UUID?((uint64_t)v7, &demangling cache variable for type metadata for UUID?);
}

- (void)xpcHasNewOOBKey:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  if (a3)
  {
    swift_retain();
    v4 = a3;
    v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;

  }
  else
  {
    swift_retain();
    v5 = 0;
    v7 = 0xF000000000000000;
  }
  if (one-time initialization token for framework != -1)
    swift_once();
  v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Logs.framework);
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2433AF000, v9, v10, "RegistryCrux: xpcHasNewOOBKey", v11, 2u);
    MEMORY[0x2494F8478](v11, -1, -1);
  }

  outlined consume of Data?(v5, v7);
  swift_release();
}

@end
