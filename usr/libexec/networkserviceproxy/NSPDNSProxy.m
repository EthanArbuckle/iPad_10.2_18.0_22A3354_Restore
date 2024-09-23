@implementation NSPDNSProxy

- (NSPDNSProxy)init
{
  NSPDNSProxy *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSPDNSProxy *v6;
  NSPDNSProxy *v7;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSPDNSProxy;
  v2 = -[NSPDNSProxy init](&v12, "init");
  v6 = v2;
  if (v2)
  {
    v7 = v2;
  }
  else
  {
    v9 = nplog_obj(0, v3, v4, v5);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "[super init] failed", v11, 2u);
    }

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  sub_100041454((uint64_t)self, 0);
  v3.receiver = self;
  v3.super_class = (Class)NSPDNSProxy;
  -[NSPDNSProxy dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
