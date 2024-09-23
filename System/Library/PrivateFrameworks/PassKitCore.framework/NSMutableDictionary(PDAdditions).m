@implementation NSMutableDictionary(PDAdditions)

- (void)setEntityPIDOrNull:()PDAdditions forKey:
{
  void *v6;
  id v7;
  id v8;

  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = a4;
    objc_msgSend(v6, "numberWithLongLong:", objc_msgSend(a3, "persistentID"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObjectOrNull:forKey:");

  }
  else
  {
    v8 = a4;
    objc_msgSend(a1, "setObjectOrNull:forKey:", 0);
  }

}

- (void)setObjectOrNull:()PDAdditions forKey:
{
  void *v6;
  id v7;
  id v8;

  if (a3)
  {
    v8 = a4;
    objc_msgSend(a1, "setObject:forKey:", a3);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99E38];
    v7 = a4;
    objc_msgSend(v6, "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKey:");

  }
}

- (void)setInt32:()PDAdditions forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

- (void)setInteger:()PDAdditions forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

- (void)setLongLong:()PDAdditions forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

- (void)setUnsignedLongLong:()PDAdditions forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

- (void)setDouble:()PDAdditions forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

- (void)setBool:()PDAdditions forKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v7);

}

@end
