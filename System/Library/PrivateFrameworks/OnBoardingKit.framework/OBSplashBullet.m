@implementation OBSplashBullet

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setText:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (OBImage)icon
{
  return (OBImage *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIcon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
