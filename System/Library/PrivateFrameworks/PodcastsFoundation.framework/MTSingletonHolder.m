@implementation MTSingletonHolder

- (id)instance
{
  return self->_instance;
}

- (void)setInstance:(id)a3
{
  objc_storeStrong(&self->_instance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_instance, 0);
}

@end
