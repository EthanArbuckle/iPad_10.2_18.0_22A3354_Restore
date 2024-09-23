@implementation UIWindowSceneGeometryPreferences

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWindowSceneGeometryPreferences;
  return -[UIWindowSceneGeometryPreferences init](&v3, sel_init);
}

- (int64_t)_type
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[UIWindowSceneGeometryPreferences _type](self, "_type");
    v6 = v5 == objc_msgSend(v4, "_type");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
