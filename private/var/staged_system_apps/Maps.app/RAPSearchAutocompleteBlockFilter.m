@implementation RAPSearchAutocompleteBlockFilter

- (BOOL)shouldFilterItem:(id)a3
{
  return (*((uint64_t (**)(void))self->_block + 2))();
}

- (RAPSearchAutocompleteBlockFilter)initWithBlock:(id)a3
{
  id v4;
  RAPSearchAutocompleteBlockFilter *v5;
  id v6;
  id block;
  RAPSearchAutocompleteBlockFilter *v8;
  objc_super v10;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)RAPSearchAutocompleteBlockFilter;
    v5 = -[RAPSearchAutocompleteBlockFilter init](&v10, "init");
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      block = v5->_block;
      v5->_block = v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: block != ((void *)0)", buf, 2u);
    }
    v8 = 0;
  }

  return v8;
}

+ (id)addressAutocompleteFilter
{
  return -[RAPSearchAutocompleteBlockFilter initWithBlock:]([RAPSearchAutocompleteBlockFilter alloc], "initWithBlock:", &stru_1011B0DF8);
}

+ (id)poiAutocompleteFilterWithExcludedMUIDs:(id)a3
{
  id v3;
  _QWORD *v4;
  RAPSearchAutocompleteBlockFilter *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002EEA38;
  v7[3] = &unk_1011B0E20;
  v8 = a3;
  v3 = v8;
  v4 = objc_retainBlock(v7);
  v5 = -[RAPSearchAutocompleteBlockFilter initWithBlock:]([RAPSearchAutocompleteBlockFilter alloc], "initWithBlock:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
