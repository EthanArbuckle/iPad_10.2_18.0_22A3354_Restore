@implementation TUIActionAndAXBuilder

- (NSArray)axActions
{
  return self->_axActions;
}

- (void)setAXActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axActions, 0);
}

@end
