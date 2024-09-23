@implementation ViewControllerBackOption

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (void)setHidesBackButton:(BOOL)a3
{
  self->_hidesBackButton = a3;
}

- (NSArray)leftBarButtonItems
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLeftBarButtonItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
}

@end
