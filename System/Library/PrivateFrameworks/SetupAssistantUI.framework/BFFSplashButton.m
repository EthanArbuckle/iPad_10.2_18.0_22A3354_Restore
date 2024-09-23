@implementation BFFSplashButton

- (UIButton)button
{
  return (UIButton *)objc_getProperty(self, a2, 8, 1);
}

- (void)setButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (id)action
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
