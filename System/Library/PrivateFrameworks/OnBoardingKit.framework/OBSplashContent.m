@implementation OBSplashContent

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setText:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSArray)bullets
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBullets:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bullets, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
