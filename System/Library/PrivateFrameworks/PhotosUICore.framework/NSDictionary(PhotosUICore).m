@implementation NSDictionary(PhotosUICore)

- (id)px_dictionaryBySettingObject:()PhotosUICore forKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

  v9 = (void *)objc_msgSend(v8, "copy");
  return v9;
}

- (id)px_dictionaryByAddingEntriesFromDictionary:()PhotosUICore
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

@end
