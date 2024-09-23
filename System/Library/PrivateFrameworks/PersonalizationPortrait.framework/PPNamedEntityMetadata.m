@implementation PPNamedEntityMetadata

- (PPNamedEntityMetadata)initWithImpressionCount:(unsigned __int16)a3 occurrencesInSource:(unsigned __int16)a4
{
  PPNamedEntityMetadata *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PPNamedEntityMetadata;
  result = -[PPNamedEntityMetadata init](&v7, sel_init);
  if (result)
  {
    result->_impressionCount = a3;
    result->_occurrencesInSource = a4;
  }
  return result;
}

- (PPNamedEntityMetadata)initWithCoder:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned __int16 v6;
  unsigned int v7;
  PPNamedEntityMetadata *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ict"));
  if (HIWORD(v5) || (v6 = v5, v7 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ois")), HIWORD(v7)))
  {
    v8 = 0;
  }
  else
  {
    self = -[PPNamedEntityMetadata initWithImpressionCount:occurrencesInSource:](self, "initWithImpressionCount:occurrencesInSource:", v6, (unsigned __int16)v7);
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t impressionCount;
  id v5;

  impressionCount = self->_impressionCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", impressionCount, CFSTR("ict"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_occurrencesInSource, CFSTR("ois"));

}

- (unint64_t)hash
{
  return self->_occurrencesInSource - (unint64_t)self->_impressionCount + 32 * self->_impressionCount;
}

- (BOOL)isEqualToNamedEntityMetadata:(id)a3
{
  PPNamedEntityMetadata *v4;
  PPNamedEntityMetadata *v5;
  int impressionCount;
  int occurrencesInSource;
  BOOL v8;

  v4 = (PPNamedEntityMetadata *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4
         && (impressionCount = self->_impressionCount,
             impressionCount == -[PPNamedEntityMetadata impressionCount](v4, "impressionCount")))
  {
    occurrencesInSource = self->_occurrencesInSource;
    v8 = occurrencesInSource == -[PPNamedEntityMetadata occurrencesInSource](v5, "occurrencesInSource");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PPNamedEntityMetadata *v4;
  BOOL v5;

  v4 = (PPNamedEntityMetadata *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PPNamedEntityMetadata isEqualToNamedEntityMetadata:](self, "isEqualToNamedEntityMetadata:", v4);
  }

  return v5;
}

- (NSSet)featureNames
{
  if (featureNames__pasOnceToken4_1693 != -1)
    dispatch_once(&featureNames__pasOnceToken4_1693, &__block_literal_global_1694);
  return (NSSet *)(id)featureNames__pasExprOnceResult_1695;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("impressionCount")) & 1) != 0)
  {
    v5 = 8;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("occurrencesInSource")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = 10;
  }
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithInt64:", *(unsigned __int16 *)((char *)&self->super.isa + v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (unsigned)impressionCount
{
  return self->_impressionCount;
}

- (unsigned)occurrencesInSource
{
  return self->_occurrencesInSource;
}

void __37__PPNamedEntityMetadata_featureNames__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = (void *)MEMORY[0x18D7805AC]();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("impressionCount"), CFSTR("occurrencesInSource"), 0);
  objc_autoreleasePoolPop(v1);
  v3 = (void *)featureNames__pasExprOnceResult_1695;
  featureNames__pasExprOnceResult_1695 = v2;

  objc_autoreleasePoolPop(v0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
