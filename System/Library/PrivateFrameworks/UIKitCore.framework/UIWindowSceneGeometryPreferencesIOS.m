@implementation UIWindowSceneGeometryPreferencesIOS

- (UIWindowSceneGeometryPreferencesIOS)init
{
  UIWindowSceneGeometryPreferencesIOS *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWindowSceneGeometryPreferencesIOS;
  result = -[UIWindowSceneGeometryPreferences _init](&v3, sel__init);
  if (result)
    result->_interfaceOrientations = 0;
  return result;
}

- (UIWindowSceneGeometryPreferencesIOS)initWithInterfaceOrientations:(UIInterfaceOrientationMask)interfaceOrientations
{
  UIWindowSceneGeometryPreferencesIOS *result;

  result = -[UIWindowSceneGeometryPreferencesIOS init](self, "init");
  if (result)
    result->_interfaceOrientations = interfaceOrientations;
  return result;
}

- (int64_t)_type
{
  return 2;
}

- (unint64_t)hash
{
  return self->_interfaceOrientations;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIWindowSceneGeometryPreferencesIOS;
  if (-[UIWindowSceneGeometryPreferences isEqual:](&v7, sel_isEqual_, v4))
    v5 = objc_msgSend(v4, "interfaceOrientations") == self->_interfaceOrientations;
  else
    v5 = 0;

  return v5;
}

- (UIInterfaceOrientationMask)interfaceOrientations
{
  return self->_interfaceOrientations;
}

- (void)setInterfaceOrientations:(UIInterfaceOrientationMask)interfaceOrientations
{
  self->_interfaceOrientations = interfaceOrientations;
}

@end
