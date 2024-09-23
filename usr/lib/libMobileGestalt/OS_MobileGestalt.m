@implementation OS_MobileGestalt

- (OS_MobileGestalt)init
{
  OS_MobileGestalt *v2;
  os_log_t v3;
  NSDictionary *overrides;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OS_MobileGestalt;
  v2 = -[OS_MobileGestalt init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("MobileGestalt", "Wrapper");
    v2->_log = (OS_os_log *)v3;

    overrides = v2->_overrides;
    v2->_overrides = 0;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrides, 0);
}

- (NSDictionary)overrides
{
  return self->_overrides;
}

- (void)setOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_overrides, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  self->_log = (OS_os_log *)a3;
}

@end
