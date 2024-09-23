@implementation NSManagedObjectContext(MTTheme)

- (id)themeForUuid:()MTTheme
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("MTTheme"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid = %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  v14 = 0;
  objc_msgSend(a1, "executeFetchRequest:error:", v5, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  v9 = v8;
  if (!v7)
    objc_msgSend(v8, "logAndThrow:", 1);
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    _MTLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2048;
      v18 = v11;
      _os_log_impl(&dword_1DA478000, v10, OS_LOG_TYPE_DEFAULT, "WARNING: Duplicate themes for %@ (%ld)", buf, 0x16u);
    }

  }
  objc_msgSend(v7, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)colorThemeForUuid:()MTTheme
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "themeForUuid:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "convertToColorTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
