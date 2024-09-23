@implementation PDRSignposts

- (PDRSignposts)init
{
  PDRSignposts *v2;
  os_log_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDRSignposts;
  v2 = -[PDRSignposts init](&v5, sel_init);
  if (v2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v3 = os_log_create("com.apple.watch.nanoregistry.trace", "signposts");
      -[PDRSignposts setTraceLog:](v2, "setTraceLog:", v3);

    }
    -[PDRSignposts setIntervalStart:](v2, "setIntervalStart:", 0);
    -[PDRSignposts setLock:](v2, "setLock:", 0);
  }
  return v2;
}

+ (id)instance
{
  if (instance_onceToken != -1)
    dispatch_once(&instance_onceToken, &__block_literal_global_0);
  return (id)instance_instance;
}

void __24__PDRSignposts_instance__block_invoke()
{
  PDRSignposts *v0;
  void *v1;

  v0 = objc_alloc_init(PDRSignposts);
  v1 = (void *)instance_instance;
  instance_instance = (uint64_t)v0;

}

- (void)beginFetchIntervalTrace
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PDRSignposts traceLog](self, "traceLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[PDRSignposts intervalStart](self, "intervalStart");

    if (!v6)
      -[PDRSignposts setIntervalStart:](self, "setIntervalStart:", mach_continuous_time());
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)endFetchIntervalTrace
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PDRSignposts traceLog](self, "traceLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[PDRSignposts intervalStart](self, "intervalStart");

    if (v6)
    {
      -[PDRSignposts traceLog](self, "traceLog");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        v8 = 134349056;
        v9 = -[PDRSignposts intervalStart](self, "intervalStart");
        _os_signpost_emit_with_name_impl(&dword_2433AF000, v7, OS_SIGNPOST_EVENT, 0xB8AB62A7B18D7940, "nanoregistry.pdr.slowFetch", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v8, 0xCu);
      }

    }
  }
  -[PDRSignposts setIntervalStart:](self, "setIntervalStart:", 0);
  os_unfair_lock_unlock(p_lock);
}

- (void)cancelFetchIntervalTrace
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PDRSignposts setIntervalStart:](self, "setIntervalStart:", 0);
  os_unfair_lock_unlock(p_lock);
}

- (OS_os_log)traceLog
{
  return self->_traceLog;
}

- (void)setTraceLog:(id)a3
{
  objc_storeStrong((id *)&self->_traceLog, a3);
}

- (unint64_t)intervalStart
{
  return self->_intervalStart;
}

- (void)setIntervalStart:(unint64_t)a3
{
  self->_intervalStart = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceLog, 0);
}

@end
