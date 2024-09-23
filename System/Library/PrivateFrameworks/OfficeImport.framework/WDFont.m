@implementation WDFont

- (WDFont)initWithName:(id)a3
{
  id v4;
  WDFont *v5;
  uint64_t v6;
  NSString *mName;
  NSMutableArray *v8;
  NSMutableArray *mAlternateNames;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDFont;
  v5 = -[WDFont init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mName = v5->mName;
    v5->mName = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mAlternateNames = v5->mAlternateNames;
    v5->mAlternateNames = v8;

    *(_QWORD *)&v5->mFontFamily = 1;
    v5->mPitch = 0;
  }

  return v5;
}

- (void)setPitch:(int)a3
{
  self->mPitch = a3;
}

- (void)setFontFamily:(int)a3
{
  self->mFontFamily = a3;
}

- (void)setCharacterSet:(int)a3
{
  self->mCharacterSet = a3;
}

- (id)name
{
  return self->mName;
}

+ (int)cpFontClassFromWdFontFamily:(int)a3
{
  if ((a3 - 1) > 4)
    return 0;
  else
    return dword_22A4D22E8[a3 - 1];
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *mName;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  mName = self->mName;
  self->mName = v4;

}

- (id)alternateNames
{
  return self->mAlternateNames;
}

- (void)addAlternateName:(id)a3
{
  NSMutableArray *mAlternateNames;
  id v4;

  mAlternateNames = self->mAlternateNames;
  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](mAlternateNames, "addObject:");

}

- (id)secondName
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->mAlternateNames, "count");
  if (v3)
  {
    -[NSMutableArray objectAtIndex:](self->mAlternateNames, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)fontFamily
{
  return self->mFontFamily;
}

- (int)characterSet
{
  return self->mCharacterSet;
}

- (int)pitch
{
  return self->mPitch;
}

- (WDFont)init
{
  WDFont *v2;
  NSString *v3;
  NSString *mName;
  NSMutableArray *v5;
  NSMutableArray *mAlternateNames;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WDFont;
  v2 = -[WDFont init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSString *)objc_alloc_init(MEMORY[0x24BDD17C8]);
    mName = v2->mName;
    v2->mName = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mAlternateNames = v2->mAlternateNames;
    v2->mAlternateNames = v5;

    *(_QWORD *)&v2->mFontFamily = 1;
    v2->mPitch = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WDFont *v4;
  uint64_t v5;
  NSString *mName;
  uint64_t v7;
  NSMutableArray *mAlternateNames;

  v4 = -[WDFont init](+[WDFont allocWithZone:](WDFont, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->mName, "copy");
  mName = v4->mName;
  v4->mName = (NSString *)v5;

  v7 = -[NSMutableArray copy](self->mAlternateNames, "copy");
  mAlternateNames = v4->mAlternateNames;
  v4->mAlternateNames = (NSMutableArray *)v7;

  *(_QWORD *)&v4->mFontFamily = *(_QWORD *)&self->mFontFamily;
  v4->mPitch = self->mPitch;
  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->mName, "hash");
  return -[NSMutableArray hash](self->mAlternateNames, "hash") ^ v3 ^ self->mFontFamily ^ (unint64_t)self->mCharacterSet ^ self->mPitch;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *mName;
  void *v7;
  NSMutableArray *mAlternateNames;
  void *v9;
  int mFontFamily;
  int mCharacterSet;
  int mPitch;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    mName = self->mName;
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](mName, "isEqualToString:", v7))
    {
      mAlternateNames = self->mAlternateNames;
      objc_msgSend(v5, "alternateNames");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableArray isEqualToArray:](mAlternateNames, "isEqualToArray:", v9)
        && (mFontFamily = self->mFontFamily, mFontFamily == objc_msgSend(v5, "fontFamily"))
        && (mCharacterSet = self->mCharacterSet, mCharacterSet == objc_msgSend(v5, "characterSet")))
      {
        mPitch = self->mPitch;
        v13 = mPitch == objc_msgSend(v5, "pitch");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDFont;
  -[WDFont description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAlternateNames, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end
