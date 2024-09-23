@implementation BKOfflineCacheLoadingController

- (id)prewarmForLaunchIfNeeded
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  id result;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OfflineCache(0);
  v4 = static OfflineCache.generateCache.getter();
  v5 = static OfflineCache.runFromCache.getter();
  type metadata accessor for ProcessEnvironment(0);
  v6 = (void *)static ProcessEnvironment.current.getter();
  v7 = dispatch thunk of ProcessEnvironment.variant.getter();

  v8 = ProcessEnvironmentVariant.rawValue.getter(v7);
  v9 = ProcessEnvironmentVariant.rawValue.getter(1);
  v10 = static Logger.offlineCache.getter();
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = v8 == v9;
    v14 = swift_slowAlloc(20, -1);
    *(_DWORD *)v14 = 67109632;
    v18 = v4 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v14 + 4, v14 + 8);
    *(_WORD *)(v14 + 8) = 1024;
    v17 = v5 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v14 + 10, v14 + 14);
    *(_WORD *)(v14 + 14) = 1024;
    HIDWORD(v16) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)((char *)&v16 + 4, &v17, v14 + 16, v14 + 20);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Prewarming offline cache, generate=%{BOOL}d, run=%{BOOL}d, PPT=%{BOOL}d", (uint8_t *)v14, 0x14u);
    swift_slowDealloc(v14, -1, -1);
  }

  result = (id)(*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if ((v5 & 1) != 0)
  {

    objc_msgSend((id)objc_opt_self(TUIResourceLoader), "prewarmOfflineCache");
    return objc_msgSend((id)objc_opt_self(JSAStoreHTTPRequest), "prewarmOfflineCache");
  }
  return result;
}

- (BKOfflineCacheLoadingController)init
{
  return (BKOfflineCacheLoadingController *)OfflineCacheLoadingController.init()();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKOfflineCacheLoadingController_cancellable));
}

@end
