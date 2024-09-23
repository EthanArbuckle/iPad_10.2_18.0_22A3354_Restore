@implementation EDString

+ (EDString)edStringWithString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:", v3);

  return (EDString *)v4;
}

- (EDString)initWithString:(id)a3
{
  id v4;
  EDString *v5;
  EDString *v6;

  v4 = a3;
  v5 = -[EDString init](self, "init");
  v6 = v5;
  if (v5)
    -[EDString setString:](v5, "setString:", v4);

  return v6;
}

- (EDString)init
{
  EDString *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDString;
  result = -[EDString init](&v3, sel_init);
  if (result)
    result->mDoNotModify = 0;
  return result;
}

- (void)setString:(id)a3
{
  NSString *v5;
  NSString **p_mString;
  NSString *mString;
  NSString *v8;

  v5 = (NSString *)a3;
  if (!self->mDoNotModify)
  {
    mString = self->mString;
    p_mString = &self->mString;
    if (mString != v5)
    {
      v8 = v5;
      objc_storeStrong((id *)p_mString, a3);
      v5 = v8;
    }
  }

}

- (id)string
{
  return self->mString;
}

- (BOOL)isEqual:(id)a3
{
  EDString *v4;
  EDString *v5;
  BOOL v6;
  BOOL v7;

  v4 = (EDString *)a3;
  v5 = v4;
  if (v4 != self)
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = -[EDString isEqualToString:](self, "isEqualToString:", v5);
LABEL_8:
        v7 = v6;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = -[EDString isEqualToEDString:](self, "isEqualToEDString:", v5);
        goto LABEL_8;
      }
    }
    v7 = 0;
    goto LABEL_10;
  }
  v7 = 1;
LABEL_10:

  return v7;
}

- (BOOL)isEqualToEDString:(id)a3
{
  _QWORD *v4;
  EDRunsCollection *mRuns;
  EDPhoneticInfo *mPhoneticInfo;
  NSString *mString;
  char v8;

  v4 = a3;
  mRuns = self->mRuns;
  if ((mRuns == (EDRunsCollection *)v4[2] || -[EDCollection isEqual:](mRuns, "isEqual:"))
    && ((mPhoneticInfo = self->mPhoneticInfo, mPhoneticInfo == (EDPhoneticInfo *)v4[3])
     || -[EDPhoneticInfo isEqual:](mPhoneticInfo, "isEqual:")))
  {
    mString = self->mString;
    if (mString == (NSString *)v4[1])
      v8 = 1;
    else
      v8 = -[NSString isEqual:](mString, "isEqual:");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setDoNotModify:(BOOL)a3
{
  self->mDoNotModify = a3;
}

- (id)runs
{
  return self->mRuns;
}

- (void)setRuns:(id)a3
{
  EDRunsCollection *v5;
  EDRunsCollection **p_mRuns;
  EDRunsCollection *mRuns;
  EDRunsCollection *v8;

  v5 = (EDRunsCollection *)a3;
  if (!self->mDoNotModify)
  {
    mRuns = self->mRuns;
    p_mRuns = &self->mRuns;
    if (mRuns != v5)
    {
      v8 = v5;
      objc_storeStrong((id *)p_mRuns, a3);
      v5 = v8;
    }
  }

}

- (BOOL)isEmpty
{
  NSString *mString;

  mString = self->mString;
  return !mString || -[NSString length](mString, "length") == 0;
}

- (BOOL)areThereRuns
{
  EDRunsCollection *mRuns;

  mRuns = self->mRuns;
  if (mRuns)
    LOBYTE(mRuns) = -[EDCollection count](mRuns, "count") != 0;
  return (char)mRuns;
}

- (BOOL)isEqualToString:(id)a3
{
  return -[NSString isEqual:](self->mString, "isEqual:", a3);
}

+ (id)string
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[EDPhoneticInfo hash](self->mPhoneticInfo, "hash");
  v4 = (-[EDCollection hash](self->mRuns, "hash") << 8) + (v3 << 16);
  return v4 + -[NSString hash](self->mString, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD *v13;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = v5;
  if (v5)
  {
    *((_BYTE *)v5 + 32) = 0;
    v7 = -[EDKeyedCollection copyWithZone:](self->mRuns, "copyWithZone:", a3);
    v8 = (void *)v6[2];
    v6[2] = v7;

    v9 = -[NSString copy](self->mString, "copy");
    v10 = (void *)v6[1];
    v6[1] = v9;

    v11 = -[EDPhoneticInfo copyWithZone:](self->mPhoneticInfo, "copyWithZone:", a3);
    v12 = (void *)v6[3];
    v6[3] = v11;

    v13 = v6;
  }

  return v6;
}

- (id)phoneticInfo
{
  return self->mPhoneticInfo;
}

- (void)setPhoneticInfo:(id)a3
{
  EDPhoneticInfo **p_mPhoneticInfo;
  EDPhoneticInfo *mPhoneticInfo;
  EDPhoneticInfo *v7;

  v7 = (EDPhoneticInfo *)a3;
  if (!self->mDoNotModify)
  {
    mPhoneticInfo = self->mPhoneticInfo;
    p_mPhoneticInfo = &self->mPhoneticInfo;
    if (mPhoneticInfo != v7)
    {
      objc_storeStrong((id *)p_mPhoneticInfo, a3);
      -[EDPhoneticInfo setDoNotModify:](*p_mPhoneticInfo, "setDoNotModify:", 1);
    }
  }

}

- (id)firstRunFont
{
  void *v3;
  void *v4;

  if (-[EDString areThereRuns](self, "areThereRuns"))
  {
    -[EDCollection objectAtIndex:](self->mRuns, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "font");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)firstRunEffects
{
  void *v3;
  void *v4;

  if (-[EDString areThereRuns](self, "areThereRuns"))
  {
    -[EDCollection objectAtIndex:](self->mRuns, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "effects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (EDString)initWithString:(id)a3 runs:(id)a4
{
  id v6;
  id v7;
  EDString *v8;
  EDString *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[EDString initWithString:](self, "initWithString:", v6);
  v9 = v8;
  if (v8)
    -[EDString setRuns:](v8, "setRuns:", v7);

  return v9;
}

+ (EDString)edStringWithString:(id)a3 runs:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:runs:", v5, v6);

  return (EDString *)v7;
}

- (void)prependString:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;

  v4 = a3;
  if (!self->mDoNotModify)
  {
    v11 = v4;
    objc_msgSend(v4, "stringByAppendingString:", self->mString);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDString setString:](self, "setString:", v5);

    v6 = -[EDCollection count](self->mRuns, "count");
    v7 = objc_msgSend(v11, "length");
    if (v6 >= 2)
    {
      v8 = v7;
      for (i = 1; i != v6; ++i)
      {
        -[EDCollection objectAtIndex:](self->mRuns, "objectAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "adjustIndex:", v8);

      }
    }
    -[EDPhoneticInfo prependString:](self->mPhoneticInfo, "prependString:", v11);
    v4 = v11;
  }

}

- (void)appendString:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->mDoNotModify)
  {
    v6 = v4;
    -[NSString stringByAppendingString:](self->mString, "stringByAppendingString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDString setString:](self, "setString:", v5);

    v4 = v6;
  }

}

- (void)removeCharacterAtIndex:(unint64_t)a3
{
  NSString *mString;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  BOOL v10;
  id v11;
  id v12;

  mString = self->mString;
  if (mString && -[NSString length](mString, "length") > a3)
  {
    v6 = -[EDCollection count](self->mRuns, "count");
    if (v6 >= 2)
    {
      v7 = v6;
      for (i = 1; i != v7; ++i)
      {
        -[EDCollection objectAtIndex:](self->mRuns, "objectAtIndex:", i);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v11, "charIndex");
        if (v9)
          v10 = v9 >= a3;
        else
          v10 = 0;
        if (v10)
          objc_msgSend(v11, "setCharIndex:", v9 - 1);

      }
    }
    -[NSString stringByReplacingCharactersInRange:withString:](self->mString, "stringByReplacingCharactersInRange:withString:", a3, 1, &stru_24F3BFFF8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[EDString setString:](self, "setString:");

  }
}

- (void)removeCharactersInSet:(id)a3
{
  NSString *mString;
  uint64_t i;
  id v6;

  v6 = a3;
  if (v6)
  {
    mString = self->mString;
    if (mString)
    {
      for (i = -[NSString rangeOfCharacterFromSet:](mString, "rangeOfCharacterFromSet:", v6);
            i != 0x7FFFFFFFFFFFFFFFLL;
            i = -[NSString rangeOfCharacterFromSet:](self->mString, "rangeOfCharacterFromSet:", v6))
      {
        -[EDString removeCharacterAtIndex:](self, "removeCharacterAtIndex:");
      }
    }
  }

}

- (id)firstFont
{
  EDRunsCollection *mRuns;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  mRuns = self->mRuns;
  if (mRuns
    && -[EDCollection count](mRuns, "count")
    && (-[EDCollection objectAtIndex:](self->mRuns, "objectAtIndex:", 0),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    -[EDCollection objectAtIndex:](self->mRuns, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDString;
  -[EDString description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPhoneticInfo, 0);
  objc_storeStrong((id *)&self->mRuns, 0);
  objc_storeStrong((id *)&self->mString, 0);
}

@end
