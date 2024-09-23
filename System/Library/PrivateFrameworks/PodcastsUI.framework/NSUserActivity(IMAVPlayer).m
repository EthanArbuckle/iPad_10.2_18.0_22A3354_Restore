@implementation NSUserActivity(IMAVPlayer)

- (uint64_t)setValue:()IMAVPlayer forKey:
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void *)result;
    v10 = a4;
    v11[0] = a3;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a4;
    v8 = a3;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addUserInfoEntriesFromDictionary:", v9);
    return objc_msgSend(v5, "setNeedsSave:", 1);
  }
  return result;
}

- (uint64_t)setContainerTitle:()IMAVPlayer
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("containerTitle"));
}

- (uint64_t)setItemTitle:()IMAVPlayer
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("itemTitle"));
}

- (void)setCurrentTime:()IMAVPlayer
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forKey:", v2, CFSTR("currentTime"));

}

- (uint64_t)setItemIdentifier:()IMAVPlayer
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("itemIdentifier"));
}

- (uint64_t)setContainerIdentifier:()IMAVPlayer
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("containerIdentifier"));
}

- (id)itemIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("itemIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)containerIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("containerIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)itemTitle
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("itemTitle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)containerTitle
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("containerTitle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)currentTime
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("currentTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (uint64_t)setStoreTrackID:()IMAVPlayer
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("storeTrackID"));
}

- (id)storeTrackID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("storeTrackID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
