@implementation OS_xpc_datastore_subscriber

- (void)dealloc
{
  objc_super v3;

  if (mach_port_destruct(*MEMORY[0x24BDAEC58], self->recvp, 0, 0))
    _os_assumes_log();
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_datastore_subscriber;
  -[OS_xpc_datastore_object dealloc](&v3, sel_dealloc);
}

- (id)copyCurrentStateWithReqType:(unint64_t)a3
{
  int v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  OS_xpc_datastore_subscriber *v7;
  OS_xds_local_cache *v8;
  uint64_t v9;

  v4 = _xpc_datastore_subscriber_refresh(self, a3);
  if (v4)
  {
    v5 = 0;
    *__error() = v4;
  }
  else
  {
    p_lock = &self->super.lock;
    v7 = self;
    os_unfair_lock_lock_with_options();
    v8 = v7->super.local_data;
    os_unfair_lock_unlock(p_lock);

    if (!v8)
      sub_21F63B430();
    v9 = xpc_create_from_serialization();
    if (!v9)
      sub_21F63B444();
    v5 = (void *)v9;

  }
  return v5;
}

@end
