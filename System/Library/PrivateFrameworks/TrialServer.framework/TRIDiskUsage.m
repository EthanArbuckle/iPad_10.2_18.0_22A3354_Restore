@implementation TRIDiskUsage

- (TRIDiskUsage)initWithNaiveSum:(unint64_t)a3 deduplicatedSum:(unint64_t)a4 compressedSum:(unint64_t)a5
{
  TRIDiskUsage *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TRIDiskUsage;
  result = -[TRIDiskUsage init](&v9, sel_init);
  if (result)
  {
    result->_naiveSum = a3;
    result->_deduplicatedSum = a4;
    result->_compressedSum = a5;
  }
  return result;
}

+ (id)usageWithNaiveSum:(unint64_t)a3 deduplicatedSum:(unint64_t)a4 compressedSum:(unint64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithNaiveSum:deduplicatedSum:compressedSum:", a3, a4, a5);
}

- (id)copyWithReplacementNaiveSum:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNaiveSum:deduplicatedSum:compressedSum:", a3, self->_deduplicatedSum, self->_compressedSum);
}

- (id)copyWithReplacementDeduplicatedSum:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNaiveSum:deduplicatedSum:compressedSum:", self->_naiveSum, a3, self->_compressedSum);
}

- (id)copyWithReplacementCompressedSum:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNaiveSum:deduplicatedSum:compressedSum:", self->_naiveSum, self->_deduplicatedSum, a3);
}

- (BOOL)isEqualToUsage:(id)a3
{
  id v4;
  void *v5;
  unint64_t naiveSum;
  unint64_t deduplicatedSum;
  unint64_t compressedSum;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4
    && (naiveSum = self->_naiveSum, naiveSum == objc_msgSend(v4, "naiveSum"))
    && (deduplicatedSum = self->_deduplicatedSum, deduplicatedSum == objc_msgSend(v5, "deduplicatedSum")))
  {
    compressedSum = self->_compressedSum;
    v9 = compressedSum == objc_msgSend(v5, "compressedSum");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  TRIDiskUsage *v4;
  TRIDiskUsage *v5;
  BOOL v6;

  v4 = (TRIDiskUsage *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIDiskUsage isEqualToUsage:](self, "isEqualToUsage:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_deduplicatedSum - self->_naiveSum + 32 * self->_naiveSum;
  return self->_compressedSum - v2 + 32 * v2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_naiveSum);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_deduplicatedSum);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_compressedSum);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIDiskUsage | naiveSum:%@ deduplicatedSum:%@ compressedSum:%@>"), v4, v5, v6);

  return v7;
}

- (unint64_t)naiveSum
{
  return self->_naiveSum;
}

- (unint64_t)deduplicatedSum
{
  return self->_deduplicatedSum;
}

- (unint64_t)compressedSum
{
  return self->_compressedSum;
}

@end
