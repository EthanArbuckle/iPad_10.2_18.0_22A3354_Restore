@implementation ICSyncSettings

+ (void)initSharedSettingsWithOptions:(unint64_t)a3
{
  ICSyncSettings *v4;
  void *v5;
  NSObject *v6;

  if (qword_100852848)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_100681F30(v6);

  }
  v4 = -[ICSyncSettings initWithOptions:]([ICSyncSettings alloc], "initWithOptions:", a3);
  v5 = (void *)qword_100852848;
  qword_100852848 = (uint64_t)v4;

}

+ (id)sharedSettings
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000704A0;
  block[3] = &unk_1007D9EE0;
  block[4] = a1;
  if (qword_100852850 != -1)
    dispatch_once(&qword_100852850, block);
  return (id)qword_100852848;
}

- (ICSyncSettings)initWithOptions:(unint64_t)a3
{
  ICSyncSettings *v4;
  ICSyncSettings *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICSyncSettings;
  v4 = -[ICSyncSettings init](&v7, "init");
  v5 = v4;
  if (v4)
    -[ICSyncSettings setOptions:](v4, "setOptions:", a3);
  return v5;
}

+ (BOOL)hasOptions:(unint64_t)a3
{
  BOOL result;

  result = qword_100852848;
  if (qword_100852848)
    return objc_msgSend((id)qword_100852848, "hasOptions:", a3);
  return result;
}

- (BOOL)hasOptions:(unint64_t)a3
{
  return (a3 & ~-[ICSyncSettings options](self, "options")) == 0;
}

- (BOOL)hasAnyOptions:(unint64_t)a3
{
  return (-[ICSyncSettings options](self, "options") & a3) != 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
