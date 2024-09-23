int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v25;

  v3 = type metadata accessor for Logger(0, argv, envp);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v25 - v8;
  v10 = _set_user_dir_suffix("com.apple.ciphermld");
  if ((_DWORD)v10)
  {
    v11 = static Logger.daemon.getter(v10);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Entered non-macOS Sandbox", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    v15 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
    v16 = v15(v9, v3);
    v17 = static Logger.daemon.getter(v16);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Starting daemon", v20, 2u);
      swift_slowDealloc(v20, -1, -1);
    }

    v15(v7, v3);
    type metadata accessor for CMLXPCServer(0);
    qword_100008010 = CMLXPCServer.__allocating_init()();
    v21 = dispatch thunk of CMLXPCServer.registerScheduledTasks()();
    dispatch thunk of CMLXPCServer.start()(v21);
    v22 = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
    objc_msgSend(v22, "run");

    exit(0);
  }
  v23 = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001ELL, 0x8000000100003AB0, "ciphermld/DaemonSandbox.swift", 29, 2, 49, 0);
  __break(1u);
  return static Logger.daemon.getter(v23);
}
