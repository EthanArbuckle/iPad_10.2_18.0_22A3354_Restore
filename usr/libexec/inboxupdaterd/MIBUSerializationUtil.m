@implementation MIBUSerializationUtil

+ (id)typeLengthMapping
{
  if (qword_100068928 != -1)
    dispatch_once(&qword_100068928, &stru_1000580E8);
  return (id)qword_100068920;
}

+ (id)tagTypeMapping
{
  if (qword_100068938 != -1)
    dispatch_once(&qword_100068938, &stru_100058108);
  return (id)qword_100068930;
}

+ (id)tagLengthMapping
{
  if (qword_100068948 != -1)
    dispatch_once(&qword_100068948, &stru_100058128);
  return (id)qword_100068940;
}

+ (id)typeForTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tagTypeMapping"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

+ (id)maxLengthForTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tagTypeMapping"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "typeLengthMapping"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tagLengthMapping"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v4));

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
