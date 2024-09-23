@implementation CMAPrecisionFindingManagerAdapter

- (CMAPrecisionFindingManagerAdapter)initWithFindingManager:(void *)a3
{
  CMAPrecisionFindingManagerAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMAPrecisionFindingManagerAdapter;
  result = -[CMAPrecisionFindingManagerAdapter init](&v5, "init");
  if (result)
    result->_manager = a3;
  return result;
}

- (void)invalidate
{
  self->_manager = 0;
}

- (void)didUpdatePreciseDevicePosition:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *manager;
  int v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#findalgs-devicefinder,didUpdatePreciseDevicePosition failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    manager = self->_manager;
    if (manager)
    {
      sub_100358078((uint64_t)manager, v6);
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003EF8D0();
    }
  }

}

- (void)didUpdateAnalytics:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *manager;
  int v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#findalgs-devicefinder,didUpdateAnalytics failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    manager = self->_manager;
    if (manager)
    {
      sub_1003582E0((uint64_t)manager, v6);
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003EF8FC();
    }
  }

}

@end
