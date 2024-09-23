@implementation SEMIndexUpdaterConfiguration

- (Class)updaterClass
{
  return self->_updaterClass;
}

- (void)setUpdaterClass:(Class)a3
{
  objc_storeStrong((id *)&self->_updaterClass, a3);
}

- (CCSetChangeRegistry)changeRegistry
{
  return self->_changeRegistry;
}

- (void)setChangeRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_changeRegistry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRegistry, 0);
  objc_storeStrong((id *)&self->_updaterClass, 0);
}

@end
