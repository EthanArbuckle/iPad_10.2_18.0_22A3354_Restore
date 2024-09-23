@implementation WebNotificationPolicyListener

- (WebNotificationPolicyListener)initWithPermissionHandler:(void *)a3
{
  WebNotificationPolicyListener *v4;
  WebNotificationPolicyListener *v5;
  void *v6;
  void *value;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebNotificationPolicyListener;
  v4 = -[WebNotificationPolicyListener init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)a3;
    *(_QWORD *)a3 = 0;
    value = v4->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_;
    v5->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_ = v6;
    if (value)
      (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  }
  return v5;
}

- (void)allow
{
  void *value;

  value = self->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  if (value)
  {
    self->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
    (*(void (**)(void *, uint64_t))(*(_QWORD *)value + 16))(value, 2);
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  }
}

- (void)deny
{
  void *value;

  value = self->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  if (value)
  {
    self->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
    (*(void (**)(void *, uint64_t))(*(_QWORD *)value + 16))(value, 1);
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  }
}

- (BOOL)shouldClearCache
{
  return 0;
}

- (void).cxx_destruct
{
  void *value;

  value = self->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_permissionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
