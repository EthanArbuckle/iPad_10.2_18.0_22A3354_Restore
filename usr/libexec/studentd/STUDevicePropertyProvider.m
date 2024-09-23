@implementation STUDevicePropertyProvider

- (void)failedToFetchValueWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (qword_1000FC178 != -1)
    dispatch_once(&qword_1000FC178, &stru_1000CA078);
  v5 = (void *)qword_1000FC170;
  if (os_log_type_enabled((os_log_t)qword_1000FC170, OS_LOG_TYPE_ERROR))
    sub_10007AE94(v5, self, v4);

}

- (NSString)key
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDevicePropertyProvider.m"), 24, CFSTR("Key must be overridden."));

  return 0;
}

- (NSString)debugDescription
{
  return -[STUDevicePropertyProvider description](self, "description");
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider key](self, "key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> %@ : %@"), v3, self, v4, v5));

  return (NSString *)v6;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
