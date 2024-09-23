@implementation UITableViewCellUnhighlightedState

- (void)setOpaque:(BOOL)a3
{
  self->_opaque = a3;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)opaque
{
  return self->_opaque;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
