@implementation BKPreferredLayoutCache

- (unint64_t)preferredDirectoryTypeForBook:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryForKey:", CFSTR("_BKFixedLayoutPreferredTOCStyle")));
  v6 = sub_C823C(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  return (unint64_t)v9;
}

- (void)setPreferredDirectoryType:(unint64_t)a3 forBook:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = a4;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionaryForKey:", CFSTR("_BKFixedLayoutPreferredTOCStyle")));
  v7 = v6;
  if (!v6)
    v6 = &__NSDictionary0__struct;
  v8 = objc_msgSend(v6, "mutableCopy");

  v9 = sub_C823C(v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v10);

  v12 = objc_msgSend(v8, "copy");
  objc_msgSend(v13, "setValue:forKey:", v12, CFSTR("_BKFixedLayoutPreferredTOCStyle"));

}

@end
