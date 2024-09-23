@implementation ObjectComparisonByTokens

+ (BOOL)addComparison:(id)a3 to:(id)a4 ifMinOverlap:(unint64_t)a5
{
  id v7;
  id v8;
  BOOL v9;

  v7 = a3;
  v8 = a4;
  if (v7 && objc_msgSend(v7, "sameTokensCount") >= a5)
  {
    objc_msgSend(v8, "addObject:", v7);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (ObjectComparisonByTokens)initWithObj1:(id)a3 obj2:(id)a4 reference:(id)a5
{
  id v7;
  id v8;
  id v9;
  ObjectComparisonByTokens *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ObjectComparisonByTokens;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[ObjectComparisonByTokens init](&v12, sel_init);
  -[ObjectComparisonByTokens setObj1:](v10, "setObj1:", v9, v12.receiver, v12.super_class);

  -[ObjectComparisonByTokens setObj2:](v10, "setObj2:", v8);
  -[ObjectComparisonByTokens setReference:](v10, "setReference:", v7);

  -[ObjectComparisonByTokens setSameTokensCount:](v10, "setSameTokensCount:", 0);
  -[ObjectComparisonByTokens setDiffTokensCount:](v10, "setDiffTokensCount:", 0);
  -[ObjectComparisonByTokens setDistance:](v10, "setDistance:", 0);
  return v10;
}

- (void)incrementTokensWith:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (a3)
    v3 = 8;
  ++*(Class *)((char *)&self->super.isa + v3);
}

- (void)incrementDistanceWith:(unint64_t)a3
{
  self->_distance += a3;
}

- (void)accountForadditionalLength
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(self->_obj1, "length");
  v4 = objc_msgSend(self->_obj2, "length");
  if (v3 <= v4)
    v5 = 40;
  else
    v5 = 32;
  if (v3 <= v4)
    v6 = 32;
  else
    v6 = 40;
  v7 = objc_msgSend(*(id *)((char *)&self->super.isa + v5), "length");
  self->_diffTokensCount += v7 - objc_msgSend(*(id *)((char *)&self->super.isa + v6), "length");
}

- (id)description
{
  void *v3;
  id reference;
  char isKindOfClass;
  __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  reference = self->_reference;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_reference, 4);
  else
    v6 = &stru_1E881F240;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ %@] %@ <> %@ overlap:%lu diff:%lu distance:%lu"), reference, v6, self->_obj1, self->_obj2, self->_sameTokensCount, self->_diffTokensCount, self->_distance);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)

  return v7;
}

- (unint64_t)sameTokensCount
{
  return self->_sameTokensCount;
}

- (void)setSameTokensCount:(unint64_t)a3
{
  self->_sameTokensCount = a3;
}

- (unint64_t)diffTokensCount
{
  return self->_diffTokensCount;
}

- (void)setDiffTokensCount:(unint64_t)a3
{
  self->_diffTokensCount = a3;
}

- (unint64_t)distance
{
  return self->_distance;
}

- (void)setDistance:(unint64_t)a3
{
  self->_distance = a3;
}

- (id)obj1
{
  return self->_obj1;
}

- (void)setObj1:(id)a3
{
  objc_storeStrong(&self->_obj1, a3);
}

- (id)obj2
{
  return self->_obj2;
}

- (void)setObj2:(id)a3
{
  objc_storeStrong(&self->_obj2, a3);
}

- (id)reference
{
  return self->_reference;
}

- (void)setReference:(id)a3
{
  objc_storeStrong(&self->_reference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reference, 0);
  objc_storeStrong(&self->_obj2, 0);
  objc_storeStrong(&self->_obj1, 0);
}

@end
