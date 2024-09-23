@implementation NSPServerFlowDivert

- (NSPServerFlowDivert)init
{
  uint64_t v2;
  uint64_t v3;
  NSPServerFlowDivert *v4;
  uint64_t v5;
  OS_nw_context *context;
  OS_nw_context *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSPServerFlowDivert *v11;
  NSPServerFlowDivert *v12;
  NSObject *v13;
  uint64_t v15;
  _QWORD v16[4];
  NSObject *p_super;
  uint8_t buf[16];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NSPServerFlowDivert;
  v4 = -[NSPServerFlowDivert init](&v19, "init");
  if (v4)
  {
    v5 = nw_context_create("com.apple.networksrviceproxy.flow-divert");
    context = v4->_context;
    v4->_context = (OS_nw_context *)v5;

    v7 = v4->_context;
    v9 = NPGetInternalQueue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10009BBD4;
    v16[3] = &unk_1000F5720;
    v11 = v4;
    p_super = &v11->super;
    nw_context_set_idle_handler(v7, v10, v16);

    nw_context_set_isolate_protocol_cache(v4->_context, 1);
    nw_context_activate(v4->_context);
    v12 = v11;
    v13 = p_super;
  }
  else
  {
    v15 = nplog_obj(0, v2, v3);
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  sub_10009BD94((uint64_t)self, 1);
  v3.receiver = self;
  v3.super_class = (Class)NSPServerFlowDivert;
  -[NSPServerFlowDivert dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedNetworkTransaction, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_flowDivertControlHandle, 0);
}

@end
