@implementation NSKeyedUnarchiver

+ (id)icWhitelistedClasses
{
  if (qword_10005F4A8 != -1)
    dispatch_once(&qword_10005F4A8, &stru_100048D20);
  return (id)qword_10005F4A0;
}

+ (id)icUnarchivedObjectFromData:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v6, 0);
    v9 = objc_msgSend((id)objc_opt_class(a1), "icWhitelistedClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v10, v7));

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
