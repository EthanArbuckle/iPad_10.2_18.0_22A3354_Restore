@implementation _APKeyedUnarchiver

- (BOOL)containsValueForKey:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_APKeyedUnarchiver ignoreKeys](self, "ignoreKeys"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_APKeyedUnarchiver;
    v7 = -[_APKeyedUnarchiver containsValueForKey:](&v9, "containsValueForKey:", v4);
  }

  return v7;
}

- (NSArray)ignoreKeys
{
  return self->_ignoreKeys;
}

- (void)setIgnoreKeys:(id)a3
{
  objc_storeStrong((id *)&self->_ignoreKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreKeys, 0);
}

@end
