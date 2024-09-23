@implementation EDContentFormat

+ (id)contentFormatWithNSString:(id)a3 formatId:(unint64_t)a4 builtIn:(BOOL)a5
{
  void *v8;
  _BYTE *v9;

  +[EDString edStringWithString:](EDString, "edStringWithString:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contentFormatWithFormatString:formatId:", v8, a4);
  v9 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  v9[24] = a5;
  return v9;
}

+ (id)contentFormatWithFormatString:(id)a3 formatId:(unint64_t)a4
{
  _QWORD *v5;

  objc_msgSend(a1, "contentFormatWithFormatString:", a3);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5[2] = a4;
  return v5;
}

+ (id)contentFormatWithFormatString:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

- (EDContentFormat)init
{
  EDContentFormat *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDContentFormat;
  result = -[EDContentFormat init](&v3, sel_init);
  if (result)
  {
    result->mFormatId = -1;
    *(_WORD *)&result->mBuiltIn = 0;
  }
  return result;
}

- (unint64_t)formatId
{
  return self->mFormatId;
}

- (int64_t)key
{
  return self->mFormatId;
}

- (void)setReferenced:(BOOL)a3
{
  self->mReferenced = a3;
}

- (BOOL)isEqual:(id)a3
{
  EDContentFormat *v4;
  EDContentFormat *v5;
  BOOL v6;

  v4 = (EDContentFormat *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDContentFormat isEqualToContentFormat:](self, "isEqualToContentFormat:", v5);

  return v6;
}

- (BOOL)isEqualToContentFormat:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t mFormatId;
  uint64_t v7;
  BOOL v8;
  EDString *mFormatString;
  char v10;

  v4 = a3;
  v5 = v4;
  mFormatId = self->mFormatId;
  if (mFormatId == -1 || ((v7 = v4[2], v7 != -1) ? (v8 = mFormatId == v7) : (v8 = 1), v8))
  {
    mFormatString = self->mFormatString;
    if (mFormatString == (EDString *)v5[1])
      v10 = 1;
    else
      v10 = -[EDString isEqual:](mFormatString, "isEqual:");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)formatString
{
  return self->mFormatString;
}

- (void)setFormatId:(unint64_t)a3
{
  self->mFormatId = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v5 = -[EDString copy](self->mFormatString, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

    v4[2] = self->mFormatId;
    *((_BYTE *)v4 + 24) = self->mBuiltIn;
    *((_BYTE *)v4 + 25) = 0;
    v7 = v4;
  }

  return v4;
}

- (unint64_t)hash
{
  unint64_t mFormatId;

  mFormatId = self->mFormatId;
  return -[EDString hash](self->mFormatString, "hash") ^ mFormatId;
}

- (BOOL)builtIn
{
  return self->mBuiltIn;
}

- (BOOL)referenced
{
  return self->mReferenced;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDContentFormat;
  -[EDContentFormat description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFormatString, 0);
}

@end
