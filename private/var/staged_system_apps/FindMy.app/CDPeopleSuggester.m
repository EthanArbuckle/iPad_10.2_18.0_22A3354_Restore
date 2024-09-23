@implementation CDPeopleSuggester

+ (id)peopleSuggester
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CDPeopleSuggester;
  v2 = objc_msgSendSuper2(&v9, "peopleSuggester");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10056A3B8));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "settings"));
  objc_msgSend(v5, "setConstrainPersonIdType:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10056A3D0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "settings"));
  objc_msgSend(v7, "setConstrainMechanisms:", v6);

  return v3;
}

@end
