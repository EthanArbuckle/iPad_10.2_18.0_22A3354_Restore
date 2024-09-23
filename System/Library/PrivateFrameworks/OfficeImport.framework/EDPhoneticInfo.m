@implementation EDPhoneticInfo

- (EDPhoneticInfo)initWithResources:(id)a3
{
  id v4;
  EDPhoneticInfo *v5;
  EDPhoneticInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDPhoneticInfo;
  v5 = -[EDPhoneticInfo init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mFontIndex = 0;
    *(_QWORD *)&v6->mType = 0;
  }

  return v6;
}

+ (id)phoneticInfoWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = objc_alloc((Class)objc_opt_class());
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v7 = objc_msgSend(v5, "initWithResources:", WeakRetained);

  if (v7)
  {
    *(_QWORD *)(v7 + 16) = self->mFontIndex;
    *(_QWORD *)(v7 + 32) = *(_QWORD *)&self->mType;
    v8 = -[NSString copy](self->mString, "copy");
    v9 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v8;

    v10 = -[EDCollection copyWithZone:](self->mRuns, "copyWithZone:", a3);
    v11 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v10;

    *(_BYTE *)(v7 + 48) = self->mDoNotModify;
    v12 = (id)v7;
  }

  return (id)v7;
}

- (BOOL)isEqualToEDPhoneticInfo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  v6 = self->mFontIndex == v4[2]
    && self->mType == *((_DWORD *)v4 + 8)
    && -[EDCollection isEqual:](self->mRuns, "isEqual:", v4[5])
    && -[NSString isEqualToString:](self->mString, "isEqualToString:", v5[3])
    && self->mAlign == *((_DWORD *)v5 + 9);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  EDPhoneticInfo *v4;
  EDPhoneticInfo *v5;
  BOOL v6;

  v4 = (EDPhoneticInfo *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDPhoneticInfo isEqualToEDPhoneticInfo:](self, "isEqualToEDPhoneticInfo:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t mFontIndex;

  mFontIndex = self->mFontIndex;
  return (-[EDCollection hash](self->mRuns, "hash") << 8) + (mFontIndex << 16) + self->mAlign + (uint64_t)self->mType;
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  if (!self->mDoNotModify)
    self->mType = a3;
}

- (int)align
{
  return self->mAlign;
}

- (void)setAlign:(int)a3
{
  if (!self->mDoNotModify)
    self->mAlign = a3;
}

- (id)string
{
  return self->mString;
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

- (void)prependString:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v10 = a3;
  if (!self->mDoNotModify)
  {
    objc_msgSend(v10, "stringByAppendingString:", self->mString);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPhoneticInfo setString:](self, "setString:", v4);

    v5 = -[EDCollection count](self->mRuns, "count");
    v6 = objc_msgSend(v10, "length");
    if (v5 >= 2)
    {
      v7 = v6;
      for (i = 1; i != v5; ++i)
      {
        -[EDCollection objectAtIndex:](self->mRuns, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "adjustIndex:", v7);

      }
    }
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
    -[EDPhoneticInfo setString:](self, "setString:", v5);

    v4 = v6;
  }

}

- (id)font
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "fonts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mFontIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setFont:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->mDoNotModify)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    objc_msgSend(WeakRetained, "fonts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    self->mFontIndex = objc_msgSend(v6, "addObject:", v7);
    v4 = v7;
  }

}

- (id)runs
{
  return self->mRuns;
}

- (void)setDoNotModify:(BOOL)a3
{
  self->mDoNotModify = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRuns, 0);
  objc_storeStrong((id *)&self->mString, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)fontIndex
{
  return self->mFontIndex;
}

- (void)setFontIndex:(unint64_t)a3
{
  if (!self->mDoNotModify)
    self->mFontIndex = a3;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPhoneticInfo;
  -[EDPhoneticInfo description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
