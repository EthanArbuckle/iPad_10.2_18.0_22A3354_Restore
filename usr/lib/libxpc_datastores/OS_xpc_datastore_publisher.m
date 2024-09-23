@implementation OS_xpc_datastore_publisher

- (id)copyCurrentStateWithReqType:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  OS_xpc_datastore_publisher *v4;
  OS_xds_local_cache *v5;
  void *v6;

  p_lock = &self->super.lock;
  v4 = self;
  os_unfair_lock_lock_with_options();
  v5 = v4->super.local_data;
  os_unfair_lock_unlock(p_lock);

  if (v5)
  {
    v6 = (void *)xpc_create_from_serialization();
    if (!v6)
      sub_21F63B444();
  }
  else
  {
    v6 = 0;
    *__error() = 96;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->publish_data, 0);
  objc_storeStrong((id *)&self->dq, 0);
  objc_storeStrong((id *)&self->pending_work_dq, 0);
}

@end
