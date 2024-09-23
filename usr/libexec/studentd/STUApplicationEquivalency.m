@implementation STUApplicationEquivalency

+ (id)equivalencyForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "safari"));
  v21[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "books"));
  v21[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v13, "containsBundleIdentifier:", v4, (_QWORD)v16) & 1) != 0)
        {
          v14 = v13;

          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }

  v14 = objc_msgSend(objc_alloc((Class)a1), "initWithBundleIdentifier:", v4);
LABEL_11:

  return v14;
}

+ (id)safari
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithmacOSBundleIdentifier:iOSBundleIdentifier:", CFSTR("com.apple.Safari"), CFSTR("com.apple.mobilesafari"));
}

+ (id)books
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithmacOSBundleIdentifier:iOSBundleIdentifier:", CFSTR("com.apple.iBooksX"), CFSTR("com.apple.iBooks"));
}

- (STUApplicationEquivalency)initWithBundleIdentifier:(id)a3
{
  return -[STUApplicationEquivalency initWithmacOSBundleIdentifier:iOSBundleIdentifier:](self, "initWithmacOSBundleIdentifier:iOSBundleIdentifier:", a3, a3);
}

- (STUApplicationEquivalency)initWithmacOSBundleIdentifier:(id)a3 iOSBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  STUApplicationEquivalency *v8;
  NSString *v9;
  NSString *macOSBundleIdentifier;
  NSString *v11;
  NSString *iOSBundleIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STUApplicationEquivalency;
  v8 = -[STUApplicationEquivalency init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    macOSBundleIdentifier = v8->_macOSBundleIdentifier;
    v8->_macOSBundleIdentifier = v9;

    v11 = (NSString *)objc_msgSend(v7, "copy");
    iOSBundleIdentifier = v8->_iOSBundleIdentifier;
    v8->_iOSBundleIdentifier = v11;

  }
  return v8;
}

- (BOOL)containsBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUApplicationEquivalency macOSBundleIdentifier](self, "macOSBundleIdentifier"));
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUApplicationEquivalency iOSBundleIdentifier](self, "iOSBundleIdentifier"));
    v6 = objc_msgSend(v7, "isEqualToString:", v4);

  }
  return v6;
}

- (id)bundleIdentifierForPlatform:(unint64_t)a3
{
  void *v3;

  if (a3 == 2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUApplicationEquivalency macOSBundleIdentifier](self, "macOSBundleIdentifier"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUApplicationEquivalency iOSBundleIdentifier](self, "iOSBundleIdentifier"));
  return v3;
}

- (NSString)macOSBundleIdentifier
{
  return self->_macOSBundleIdentifier;
}

- (NSString)iOSBundleIdentifier
{
  return self->_iOSBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iOSBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_macOSBundleIdentifier, 0);
}

@end
