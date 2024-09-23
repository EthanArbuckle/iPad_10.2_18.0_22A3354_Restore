@implementation SFPeopleSuggesterParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPeopleSuggesterParams)initWithCoder:(id)a3
{
  id v4;
  SFPeopleSuggesterParams *v5;
  id v6;
  SFPeopleSuggesterParams *v7;
  objc_super v9;
  uint64_t v10;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFPeopleSuggesterParams;
  v5 = -[SFPeopleSuggesterParams init](&v9, sel_init);
  if (v5)
  {
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v10 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_flags = v10;
    v10 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_maxPeople = v10;
    v6 = v4;
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("exclBf")))
      v5->_excludeBackfills = objc_msgSend(v6, "decodeBoolForKey:", CFSTR("exclBf"));

    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSArray *contactIDs;
  uint64_t flags;
  uint64_t maxPeople;
  id v8;

  v4 = a3;
  contactIDs = self->_contactIDs;
  v8 = v4;
  if (contactIDs)
  {
    objc_msgSend(v4, "encodeObject:forKey:", contactIDs, CFSTR("cids"));
    v4 = v8;
  }
  flags = self->_flags;
  if ((_DWORD)flags)
  {
    objc_msgSend(v8, "encodeInt64:forKey:", flags, CFSTR("flags"));
    v4 = v8;
  }
  maxPeople = self->_maxPeople;
  if ((_DWORD)maxPeople)
  {
    objc_msgSend(v8, "encodeInt64:forKey:", maxPeople, CFSTR("maxP"));
    v4 = v8;
  }
  if (self->_excludeBackfills)
  {
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("exclBf"));
    v4 = v8;
  }

}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (void)setContactIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)maxPeople
{
  return self->_maxPeople;
}

- (void)setMaxPeople:(unsigned int)a3
{
  self->_maxPeople = a3;
}

- (BOOL)excludeBackfills
{
  return self->_excludeBackfills;
}

- (void)setExcludeBackfills:(BOOL)a3
{
  self->_excludeBackfills = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIDs, 0);
}

@end
