@implementation PPTopicMetadata

- (PPTopicMetadata)initWithImpressionCount:(unsigned __int16)a3 occurrencesInSource:(unsigned __int16)a4 algorithmResultPosition:(unsigned __int16)a5 algorithmResultCount:(unsigned __int16)a6 exactMatchInSourceText:(BOOL)a7
{
  PPTopicMetadata *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PPTopicMetadata;
  result = -[PPTopicMetadata init](&v13, sel_init);
  if (result)
  {
    result->_impressionCount = a3;
    result->_occurrencesInSource = a4;
    result->_algorithmResultPosition = a5;
    result->_algorithmResultCount = a6;
    result->_exactMatchInSourceText = a7;
  }
  return result;
}

- (PPTopicMetadata)initWithCoder:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned __int16 v6;
  unsigned int v7;
  unsigned __int16 v8;
  unsigned int v9;
  unsigned __int16 v10;
  unsigned int v11;
  PPTopicMetadata *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ict"));
  if (HIWORD(v5)
    || (v6 = v5, v7 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ois")), HIWORD(v7))
    || (v8 = v7, v9 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("arp")), HIWORD(v9))
    || (v10 = v9, v11 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("arc")), HIWORD(v11)))
  {
    v12 = 0;
  }
  else
  {
    self = -[PPTopicMetadata initWithImpressionCount:occurrencesInSource:algorithmResultPosition:algorithmResultCount:exactMatchInSourceText:](self, "initWithImpressionCount:occurrencesInSource:algorithmResultPosition:algorithmResultCount:exactMatchInSourceText:", v6, v8, v10, (unsigned __int16)v11, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ext")));
    v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t impressionCount;
  id v5;

  impressionCount = self->_impressionCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", impressionCount, CFSTR("ict"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_occurrencesInSource, CFSTR("ois"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_algorithmResultPosition, CFSTR("arp"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_algorithmResultCount, CFSTR("arc"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_exactMatchInSourceText, CFSTR("ext"));

}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self->_occurrencesInSource - (unint64_t)self->_impressionCount + 32 * self->_impressionCount;
  v3 = self->_algorithmResultPosition - v2 + 32 * v2;
  v4 = self->_algorithmResultCount - v3 + 32 * v3;
  return self->_exactMatchInSourceText - v4 + 32 * v4;
}

- (BOOL)isEqualToTopicMetadata:(id)a3
{
  PPTopicMetadata *v4;
  PPTopicMetadata *v5;
  int impressionCount;
  int occurrencesInSource;
  int algorithmResultPosition;
  int algorithmResultCount;
  _BOOL4 exactMatchInSourceText;
  BOOL v11;

  v4 = (PPTopicMetadata *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4
         && (impressionCount = self->_impressionCount,
             impressionCount == -[PPTopicMetadata impressionCount](v4, "impressionCount"))
         && (occurrencesInSource = self->_occurrencesInSource,
             occurrencesInSource == -[PPTopicMetadata occurrencesInSource](v5, "occurrencesInSource"))
         && (algorithmResultPosition = self->_algorithmResultPosition,
             algorithmResultPosition == -[PPTopicMetadata algorithmResultPosition](v5, "algorithmResultPosition"))
         && (algorithmResultCount = self->_algorithmResultCount,
             algorithmResultCount == -[PPTopicMetadata algorithmResultCount](v5, "algorithmResultCount")))
  {
    exactMatchInSourceText = self->_exactMatchInSourceText;
    v11 = exactMatchInSourceText == -[PPTopicMetadata exactMatchInSourceText](v5, "exactMatchInSourceText");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PPTopicMetadata *v4;
  BOOL v5;

  v4 = (PPTopicMetadata *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PPTopicMetadata isEqualToTopicMetadata:](self, "isEqualToTopicMetadata:", v4);
  }

  return v5;
}

- (id)description
{
  id v3;
  const __CFString *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_exactMatchInSourceText)
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPTopicMetadata i:%hu o:%hu arp:%hu arc:%hu em:%@>"), self->_impressionCount, self->_occurrencesInSource, self->_algorithmResultPosition, self->_algorithmResultCount, v4);
}

- (NSSet)featureNames
{
  if (featureNames__pasOnceToken4_6067 != -1)
    dispatch_once(&featureNames__pasOnceToken4_6067, &__block_literal_global_6068);
  return (NSSet *)(id)featureNames__pasExprOnceResult_6069;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t impressionCount;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("impressionCount")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    impressionCount = self->_impressionCount;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("occurrencesInSource")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    impressionCount = self->_occurrencesInSource;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("algorithmResultPosition")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    impressionCount = self->_algorithmResultPosition;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("algorithmResultCount")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    impressionCount = self->_algorithmResultCount;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("exactMatchInSourceText")))
    {
      v7 = 0;
      goto LABEL_12;
    }
    v5 = (void *)MEMORY[0x1E0C9E918];
    impressionCount = self->_exactMatchInSourceText;
  }
  objc_msgSend(v5, "featureValueWithInt64:", impressionCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v7;
}

- (unsigned)impressionCount
{
  return self->_impressionCount;
}

- (unsigned)occurrencesInSource
{
  return self->_occurrencesInSource;
}

- (unsigned)algorithmResultPosition
{
  return self->_algorithmResultPosition;
}

- (unsigned)algorithmResultCount
{
  return self->_algorithmResultCount;
}

- (BOOL)exactMatchInSourceText
{
  return self->_exactMatchInSourceText;
}

void __31__PPTopicMetadata_featureNames__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = (void *)MEMORY[0x18D7805AC]();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("impressionCount"), CFSTR("occurrencesInSource"), CFSTR("algorithmResultPosition"), CFSTR("algorithmResultCount"), CFSTR("exactMatchInSourceText"), 0);
  objc_autoreleasePoolPop(v1);
  v3 = (void *)featureNames__pasExprOnceResult_6069;
  featureNames__pasExprOnceResult_6069 = v2;

  objc_autoreleasePoolPop(v0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
