@implementation TRICKRecordProgress

- (TRICKRecordProgress)initWithSize:(unint64_t)a3 transferred:(unint64_t)a4
{
  TRICKRecordProgress *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TRICKRecordProgress;
  result = -[TRICKRecordProgress init](&v7, sel_init);
  if (result)
  {
    result->_size = a3;
    result->_transferred = a4;
  }
  return result;
}

+ (id)progressWithSize:(unint64_t)a3 transferred:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSize:transferred:", a3, a4);
}

- (id)copyWithReplacementSize:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSize:transferred:", a3, self->_transferred);
}

- (id)copyWithReplacementTransferred:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSize:transferred:", self->_size, a3);
}

- (BOOL)isEqualToProgress:(id)a3
{
  id v4;
  void *v5;
  unint64_t size;
  unint64_t transferred;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4 && (size = self->_size, size == objc_msgSend(v4, "size")))
  {
    transferred = self->_transferred;
    v8 = transferred == objc_msgSend(v5, "transferred");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  TRICKRecordProgress *v4;
  TRICKRecordProgress *v5;
  BOOL v6;

  v4 = (TRICKRecordProgress *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRICKRecordProgress isEqualToProgress:](self, "isEqualToProgress:", v5);

  return v6;
}

- (unint64_t)hash
{
  return self->_transferred - self->_size + 32 * self->_size;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_size);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_transferred);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRICKRecordProgress | size:%@ transferred:%@>"), v4, v5);

  return v6;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)transferred
{
  return self->_transferred;
}

@end
