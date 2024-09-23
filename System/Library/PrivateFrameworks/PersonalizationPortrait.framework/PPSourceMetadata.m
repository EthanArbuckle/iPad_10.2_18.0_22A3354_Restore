@implementation PPSourceMetadata

- (PPSourceMetadata)initWithDwellTimeSeconds:(unsigned int)a3 lengthSeconds:(unsigned int)a4 lengthCharacters:(unsigned int)a5 donationCount:(unsigned __int16)a6 contactHandleCount:(unsigned __int16)a7 flags:(unsigned __int8)a8
{
  PPSourceMetadata *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PPSourceMetadata;
  result = -[PPSourceMetadata init](&v15, sel_init);
  if (result)
  {
    result->_dwellTimeSeconds = a3;
    result->_lengthSeconds = a4;
    result->_lengthCharacters = a5;
    result->_donationCount = a6;
    result->_contactHandleCount = a7;
    result->_flags = a8;
  }
  return result;
}

- (PPSourceMetadata)initWithFlags:(unsigned __int8)a3
{
  return -[PPSourceMetadata initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:](self, "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, 0, 0, 0, a3);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPSourceMetadata d:%u ls:%u lc:%u dc:%u chc:%u f:%u>"), self->_dwellTimeSeconds, self->_lengthSeconds, self->_lengthCharacters, self->_donationCount, self->_contactHandleCount, self->_flags);
}

- (PPSourceMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int16 v9;
  unsigned int v10;
  unsigned __int16 v11;
  unsigned int v12;
  PPSourceMetadata *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("dts"));
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("lns"));
  v7 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("lnc"));
  v8 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("dct"));
  if (HIWORD(v8)
    || (v9 = v8, v10 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("chc")), HIWORD(v10))
    || (v11 = v10, v12 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("flg")), v12 > 0xFF))
  {
    v13 = 0;
  }
  else
  {
    self = -[PPSourceMetadata initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:](self, "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", v5, v6, v7, v9, v11, v12);
    v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t dwellTimeSeconds;
  id v5;

  dwellTimeSeconds = self->_dwellTimeSeconds;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", dwellTimeSeconds, CFSTR("dts"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_lengthSeconds, CFSTR("lns"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_lengthCharacters, CFSTR("lnc"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_donationCount, CFSTR("dct"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_contactHandleCount, CFSTR("chc"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_flags, CFSTR("flg"));

}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self->_lengthCharacters - (unint64_t)self->_donationCount + 32 * self->_donationCount;
  v3 = self->_lengthSeconds - v2 + 32 * v2;
  v4 = self->_dwellTimeSeconds - v3 + 32 * v3;
  return self->_flags - v4 + 32 * v4;
}

- (BOOL)isEqualToSourceMetadata:(id)a3
{
  PPSourceMetadata *v4;
  PPSourceMetadata *v5;
  unsigned int dwellTimeSeconds;
  unsigned int lengthSeconds;
  unsigned int lengthCharacters;
  int donationCount;
  int contactHandleCount;
  int flags;
  BOOL v12;

  v4 = (PPSourceMetadata *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4
         && (dwellTimeSeconds = self->_dwellTimeSeconds,
             dwellTimeSeconds == -[PPSourceMetadata dwellTimeSeconds](v4, "dwellTimeSeconds"))
         && (lengthSeconds = self->_lengthSeconds,
             lengthSeconds == -[PPSourceMetadata lengthSeconds](v5, "lengthSeconds"))
         && (lengthCharacters = self->_lengthCharacters,
             lengthCharacters == -[PPSourceMetadata lengthCharacters](v5, "lengthCharacters"))
         && (donationCount = self->_donationCount,
             donationCount == -[PPSourceMetadata donationCount](v5, "donationCount"))
         && (contactHandleCount = self->_contactHandleCount,
             contactHandleCount == -[PPSourceMetadata contactHandleCount](v5, "contactHandleCount")))
  {
    flags = self->_flags;
    v12 = flags == -[PPSourceMetadata flags](v5, "flags");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  PPSourceMetadata *v4;
  BOOL v5;

  v4 = (PPSourceMetadata *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PPSourceMetadata isEqualToSourceMetadata:](self, "isEqualToSourceMetadata:", v4);
  }

  return v5;
}

- (NSSet)featureNames
{
  if (featureNames__pasOnceToken4 != -1)
    dispatch_once(&featureNames__pasOnceToken4, &__block_literal_global);
  return (NSSet *)(id)featureNames__pasExprOnceResult;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t dwellTimeSeconds;
  uint64_t v7;
  void *v8;
  double v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("dwellTimeSeconds")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    dwellTimeSeconds = self->_dwellTimeSeconds;
LABEL_13:
    objc_msgSend(v5, "featureValueWithInt64:", dwellTimeSeconds);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("lengthSeconds")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    dwellTimeSeconds = self->_lengthSeconds;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("lengthCharacters")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    dwellTimeSeconds = self->_lengthCharacters;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("donationCount")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    dwellTimeSeconds = self->_donationCount;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("contactHandleCount")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    dwellTimeSeconds = self->_contactHandleCount;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("flags")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    dwellTimeSeconds = self->_flags;
    goto LABEL_13;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("userCreated")))
  {
    v8 = 0;
    goto LABEL_15;
  }
  v10 = 1.0;
  if ((self->_flags & 1) == 0)
    v10 = 0.0;
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithDouble:", v10);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v8 = (void *)v7;
LABEL_15:

  return v8;
}

- (unsigned)dwellTimeSeconds
{
  return self->_dwellTimeSeconds;
}

- (unsigned)lengthSeconds
{
  return self->_lengthSeconds;
}

- (unsigned)lengthCharacters
{
  return self->_lengthCharacters;
}

- (unsigned)donationCount
{
  return self->_donationCount;
}

- (unsigned)contactHandleCount
{
  return self->_contactHandleCount;
}

- (unsigned)flags
{
  return self->_flags;
}

void __32__PPSourceMetadata_featureNames__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = (void *)MEMORY[0x18D7805AC]();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("dwellTimeSeconds"), CFSTR("lengthSeconds"), CFSTR("lengthCharacters"), CFSTR("donationCount"), CFSTR("contactHandleCount"), CFSTR("flags"), CFSTR("userCreated"), 0);
  objc_autoreleasePoolPop(v1);
  v3 = (void *)featureNames__pasExprOnceResult;
  featureNames__pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
