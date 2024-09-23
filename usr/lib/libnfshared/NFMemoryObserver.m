@implementation NFMemoryObserver

- (void)start
{
  OS_dispatch_source *v3;
  OS_dispatch_source *source;
  NSObject *v5;
  _QWORD handler[5];

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 7uLL, MEMORY[0x1E0C80D38]);
  source = self->_source;
  self->_source = v3;

  v5 = self->_source;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __25__NFMemoryObserver_start__block_invoke;
  handler[3] = &unk_1E7D7F7A0;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume((dispatch_object_t)self->_source);
}

void __25__NFMemoryObserver_start__block_invoke(uint64_t a1)
{
  char *v1;
  void *specific;
  void (*v3)(uint64_t, const char *, ...);
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (dispatch_source_get_data(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 8)) == 4)
  {
    v1 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v3 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v3)
    {
      v3(4, "%s:%i Memory Pressure Critical - Jetsam?", "-[NFMemoryObserver start]_block_invoke", 39);
      v1 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v4 = dispatch_get_specific(v1);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v5 = (id)_NFSharedLogClient[(_QWORD)v4];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v7 = "-[NFMemoryObserver start]_block_invoke";
      v8 = 1024;
      v9 = 39;
      _os_log_impl(&dword_1C34DB000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Memory Pressure Critical - Jetsam?", buf, 0x12u);
    }

  }
}

- (void)stop
{
  dispatch_source_cancel((dispatch_source_t)self->_source);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

@end
