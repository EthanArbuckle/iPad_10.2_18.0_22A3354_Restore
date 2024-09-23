@implementation SFQueryUnderstandingParse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setQueryIntentType:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_queryIntentType = a3;
}

- (BOOL)hasQueryIntentType
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasUnspecifiedTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_hasUnspecifiedTokens = a3;
}

- (BOOL)hasHasUnspecifiedTokens
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSortCriteriaTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_hasSortCriteriaTokens = a3;
}

- (BOOL)hasHasSortCriteriaTokens
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasLocationTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_hasLocationTokens = a3;
}

- (BOOL)hasHasLocationTokens
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasActionTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_hasActionTokens = a3;
}

- (BOOL)hasHasActionTokens
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasMediaTypeTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_hasMediaTypeTokens = a3;
}

- (BOOL)hasHasMediaTypeTokens
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasVisualQualityTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hasVisualQualityTokens = a3;
}

- (BOOL)hasHasVisualQualityTokens
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasNounTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hasNounTokens = a3;
}

- (BOOL)hasHasNounTokens
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasTimeTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hasTimeTokens = a3;
}

- (BOOL)hasHasTimeTokens
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHasEventTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_hasEventTokens = a3;
}

- (BOOL)hasHasEventTokens
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasGenericLocationTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_hasGenericLocationTokens = a3;
}

- (BOOL)hasHasGenericLocationTokens
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasCaptureDeviceTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hasCaptureDeviceTokens = a3;
}

- (BOOL)hasHasCaptureDeviceTokens
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasFavoritedTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_hasFavoritedTokens = a3;
}

- (BOOL)hasHasFavoritedTokens
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasSourceAppTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_hasSourceAppTokens = a3;
}

- (BOOL)hasHasSourceAppTokens
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasPersonTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_hasPersonTokens = a3;
}

- (BOOL)hasHasPersonTokens
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasPersonSenderTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_hasPersonSenderTokens = a3;
}

- (BOOL)hasHasPersonSenderTokens
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSpotlightQueryIntent:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_spotlightQueryIntent = a3;
}

- (BOOL)hasSpotlightQueryIntent
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setIsUnsafeQuery:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isUnsafeQuery = a3;
}

- (BOOL)hasIsUnsafeQuery
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsBlocklistedQuery:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isBlocklistedQuery = a3;
}

- (BOOL)hasIsBlocklistedQuery
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (SFQueryUnderstandingParse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBQueryUnderstandingParse *v6;
  SFQueryUnderstandingParse *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBQueryUnderstandingParse initWithData:]([_SFPBQueryUnderstandingParse alloc], "initWithData:", v5);
  v7 = -[SFQueryUnderstandingParse initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBQueryUnderstandingParse *v6;

  v4 = a3;
  v6 = -[_SFPBQueryUnderstandingParse initWithFacade:]([_SFPBQueryUnderstandingParse alloc], "initWithFacade:", self);
  -[_SFPBQueryUnderstandingParse data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBQueryUnderstandingParse *v2;
  void *v3;

  v2 = -[_SFPBQueryUnderstandingParse initWithFacade:]([_SFPBQueryUnderstandingParse alloc], "initWithFacade:", self);
  -[_SFPBQueryUnderstandingParse dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBQueryUnderstandingParse *v2;
  void *v3;

  v2 = -[_SFPBQueryUnderstandingParse initWithFacade:]([_SFPBQueryUnderstandingParse alloc], "initWithFacade:", self);
  -[_SFPBQueryUnderstandingParse jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setQueryIntentType:", -[SFQueryUnderstandingParse queryIntentType](self, "queryIntentType"));
  objc_msgSend(v4, "setHasUnspecifiedTokens:", -[SFQueryUnderstandingParse hasUnspecifiedTokens](self, "hasUnspecifiedTokens"));
  objc_msgSend(v4, "setHasSortCriteriaTokens:", -[SFQueryUnderstandingParse hasSortCriteriaTokens](self, "hasSortCriteriaTokens"));
  objc_msgSend(v4, "setHasLocationTokens:", -[SFQueryUnderstandingParse hasLocationTokens](self, "hasLocationTokens"));
  objc_msgSend(v4, "setHasActionTokens:", -[SFQueryUnderstandingParse hasActionTokens](self, "hasActionTokens"));
  objc_msgSend(v4, "setHasMediaTypeTokens:", -[SFQueryUnderstandingParse hasMediaTypeTokens](self, "hasMediaTypeTokens"));
  objc_msgSend(v4, "setHasVisualQualityTokens:", -[SFQueryUnderstandingParse hasVisualQualityTokens](self, "hasVisualQualityTokens"));
  objc_msgSend(v4, "setHasNounTokens:", -[SFQueryUnderstandingParse hasNounTokens](self, "hasNounTokens"));
  objc_msgSend(v4, "setHasTimeTokens:", -[SFQueryUnderstandingParse hasTimeTokens](self, "hasTimeTokens"));
  objc_msgSend(v4, "setHasEventTokens:", -[SFQueryUnderstandingParse hasEventTokens](self, "hasEventTokens"));
  objc_msgSend(v4, "setHasGenericLocationTokens:", -[SFQueryUnderstandingParse hasGenericLocationTokens](self, "hasGenericLocationTokens"));
  objc_msgSend(v4, "setHasCaptureDeviceTokens:", -[SFQueryUnderstandingParse hasCaptureDeviceTokens](self, "hasCaptureDeviceTokens"));
  objc_msgSend(v4, "setHasFavoritedTokens:", -[SFQueryUnderstandingParse hasFavoritedTokens](self, "hasFavoritedTokens"));
  objc_msgSend(v4, "setHasSourceAppTokens:", -[SFQueryUnderstandingParse hasSourceAppTokens](self, "hasSourceAppTokens"));
  objc_msgSend(v4, "setHasPersonTokens:", -[SFQueryUnderstandingParse hasPersonTokens](self, "hasPersonTokens"));
  objc_msgSend(v4, "setHasPersonSenderTokens:", -[SFQueryUnderstandingParse hasPersonSenderTokens](self, "hasPersonSenderTokens"));
  objc_msgSend(v4, "setSpotlightQueryIntent:", -[SFQueryUnderstandingParse spotlightQueryIntent](self, "spotlightQueryIntent"));
  objc_msgSend(v4, "setIsUnsafeQuery:", -[SFQueryUnderstandingParse isUnsafeQuery](self, "isUnsafeQuery"));
  objc_msgSend(v4, "setIsBlocklistedQuery:", -[SFQueryUnderstandingParse isBlocklistedQuery](self, "isBlocklistedQuery"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFQueryUnderstandingParse *v4;
  SFQueryUnderstandingParse *v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  int v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v26;

  v4 = (SFQueryUnderstandingParse *)a3;
  if (self == v4)
  {
    LOBYTE(v24) = 1;
  }
  else if (-[SFQueryUnderstandingParse isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SFQueryUnderstandingParse queryIntentType](self, "queryIntentType");
    if (v6 != -[SFQueryUnderstandingParse queryIntentType](v5, "queryIntentType"))
      goto LABEL_21;
    v7 = -[SFQueryUnderstandingParse hasUnspecifiedTokens](self, "hasUnspecifiedTokens");
    if (v7 != -[SFQueryUnderstandingParse hasUnspecifiedTokens](v5, "hasUnspecifiedTokens"))
      goto LABEL_21;
    v8 = -[SFQueryUnderstandingParse hasSortCriteriaTokens](self, "hasSortCriteriaTokens");
    if (v8 != -[SFQueryUnderstandingParse hasSortCriteriaTokens](v5, "hasSortCriteriaTokens"))
      goto LABEL_21;
    v9 = -[SFQueryUnderstandingParse hasLocationTokens](self, "hasLocationTokens");
    if (v9 != -[SFQueryUnderstandingParse hasLocationTokens](v5, "hasLocationTokens"))
      goto LABEL_21;
    v10 = -[SFQueryUnderstandingParse hasActionTokens](self, "hasActionTokens");
    if (v10 != -[SFQueryUnderstandingParse hasActionTokens](v5, "hasActionTokens"))
      goto LABEL_21;
    v11 = -[SFQueryUnderstandingParse hasMediaTypeTokens](self, "hasMediaTypeTokens");
    if (v11 != -[SFQueryUnderstandingParse hasMediaTypeTokens](v5, "hasMediaTypeTokens"))
      goto LABEL_21;
    v12 = -[SFQueryUnderstandingParse hasVisualQualityTokens](self, "hasVisualQualityTokens");
    if (v12 != -[SFQueryUnderstandingParse hasVisualQualityTokens](v5, "hasVisualQualityTokens"))
      goto LABEL_21;
    v13 = -[SFQueryUnderstandingParse hasNounTokens](self, "hasNounTokens");
    if (v13 != -[SFQueryUnderstandingParse hasNounTokens](v5, "hasNounTokens"))
      goto LABEL_21;
    v14 = -[SFQueryUnderstandingParse hasTimeTokens](self, "hasTimeTokens");
    if (v14 != -[SFQueryUnderstandingParse hasTimeTokens](v5, "hasTimeTokens"))
      goto LABEL_21;
    v15 = -[SFQueryUnderstandingParse hasEventTokens](self, "hasEventTokens");
    if (v15 != -[SFQueryUnderstandingParse hasEventTokens](v5, "hasEventTokens"))
      goto LABEL_21;
    v16 = -[SFQueryUnderstandingParse hasGenericLocationTokens](self, "hasGenericLocationTokens");
    if (v16 != -[SFQueryUnderstandingParse hasGenericLocationTokens](v5, "hasGenericLocationTokens"))
      goto LABEL_21;
    v17 = -[SFQueryUnderstandingParse hasCaptureDeviceTokens](self, "hasCaptureDeviceTokens");
    if (v17 == -[SFQueryUnderstandingParse hasCaptureDeviceTokens](v5, "hasCaptureDeviceTokens")
      && (v18 = -[SFQueryUnderstandingParse hasFavoritedTokens](self, "hasFavoritedTokens"),
          v18 == -[SFQueryUnderstandingParse hasFavoritedTokens](v5, "hasFavoritedTokens"))
      && (v19 = -[SFQueryUnderstandingParse hasSourceAppTokens](self, "hasSourceAppTokens"),
          v19 == -[SFQueryUnderstandingParse hasSourceAppTokens](v5, "hasSourceAppTokens"))
      && (v20 = -[SFQueryUnderstandingParse hasPersonTokens](self, "hasPersonTokens"),
          v20 == -[SFQueryUnderstandingParse hasPersonTokens](v5, "hasPersonTokens"))
      && (v21 = -[SFQueryUnderstandingParse hasPersonSenderTokens](self, "hasPersonSenderTokens"),
          v21 == -[SFQueryUnderstandingParse hasPersonSenderTokens](v5, "hasPersonSenderTokens"))
      && (v22 = -[SFQueryUnderstandingParse spotlightQueryIntent](self, "spotlightQueryIntent"),
          v22 == -[SFQueryUnderstandingParse spotlightQueryIntent](v5, "spotlightQueryIntent"))
      && (v23 = -[SFQueryUnderstandingParse isUnsafeQuery](self, "isUnsafeQuery"),
          v23 == -[SFQueryUnderstandingParse isUnsafeQuery](v5, "isUnsafeQuery")))
    {
      v26 = -[SFQueryUnderstandingParse isBlocklistedQuery](self, "isBlocklistedQuery");
      v24 = v26 ^ -[SFQueryUnderstandingParse isBlocklistedQuery](v5, "isBlocklistedQuery") ^ 1;
    }
    else
    {
LABEL_21:
      LOBYTE(v24) = 0;
    }

  }
  else
  {
    LOBYTE(v24) = 0;
  }

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = -[SFQueryUnderstandingParse queryIntentType](self, "queryIntentType");
  v4 = -[SFQueryUnderstandingParse hasUnspecifiedTokens](self, "hasUnspecifiedTokens") ^ v3;
  v5 = -[SFQueryUnderstandingParse hasSortCriteriaTokens](self, "hasSortCriteriaTokens");
  v6 = v4 ^ v5 ^ -[SFQueryUnderstandingParse hasLocationTokens](self, "hasLocationTokens");
  v7 = -[SFQueryUnderstandingParse hasActionTokens](self, "hasActionTokens");
  v8 = v7 ^ -[SFQueryUnderstandingParse hasMediaTypeTokens](self, "hasMediaTypeTokens");
  v9 = v6 ^ v8 ^ -[SFQueryUnderstandingParse hasVisualQualityTokens](self, "hasVisualQualityTokens");
  v10 = -[SFQueryUnderstandingParse hasNounTokens](self, "hasNounTokens");
  v11 = v10 ^ -[SFQueryUnderstandingParse hasTimeTokens](self, "hasTimeTokens");
  v12 = v11 ^ -[SFQueryUnderstandingParse hasEventTokens](self, "hasEventTokens");
  v13 = v9 ^ v12 ^ -[SFQueryUnderstandingParse hasGenericLocationTokens](self, "hasGenericLocationTokens");
  v14 = -[SFQueryUnderstandingParse hasCaptureDeviceTokens](self, "hasCaptureDeviceTokens");
  v15 = v14 ^ -[SFQueryUnderstandingParse hasFavoritedTokens](self, "hasFavoritedTokens");
  v16 = v15 ^ -[SFQueryUnderstandingParse hasSourceAppTokens](self, "hasSourceAppTokens");
  v17 = v16 ^ -[SFQueryUnderstandingParse hasPersonTokens](self, "hasPersonTokens");
  v18 = v13 ^ v17 ^ -[SFQueryUnderstandingParse hasPersonSenderTokens](self, "hasPersonSenderTokens");
  v19 = -[SFQueryUnderstandingParse spotlightQueryIntent](self, "spotlightQueryIntent");
  v20 = v19 ^ -[SFQueryUnderstandingParse isUnsafeQuery](self, "isUnsafeQuery");
  return v18 ^ v20 ^ -[SFQueryUnderstandingParse isBlocklistedQuery](self, "isBlocklistedQuery");
}

- (int)queryIntentType
{
  return self->_queryIntentType;
}

- (BOOL)hasUnspecifiedTokens
{
  return self->_hasUnspecifiedTokens;
}

- (BOOL)hasSortCriteriaTokens
{
  return self->_hasSortCriteriaTokens;
}

- (BOOL)hasLocationTokens
{
  return self->_hasLocationTokens;
}

- (BOOL)hasActionTokens
{
  return self->_hasActionTokens;
}

- (BOOL)hasMediaTypeTokens
{
  return self->_hasMediaTypeTokens;
}

- (BOOL)hasVisualQualityTokens
{
  return self->_hasVisualQualityTokens;
}

- (BOOL)hasNounTokens
{
  return self->_hasNounTokens;
}

- (BOOL)hasTimeTokens
{
  return self->_hasTimeTokens;
}

- (BOOL)hasEventTokens
{
  return self->_hasEventTokens;
}

- (BOOL)hasGenericLocationTokens
{
  return self->_hasGenericLocationTokens;
}

- (BOOL)hasCaptureDeviceTokens
{
  return self->_hasCaptureDeviceTokens;
}

- (BOOL)hasFavoritedTokens
{
  return self->_hasFavoritedTokens;
}

- (BOOL)hasSourceAppTokens
{
  return self->_hasSourceAppTokens;
}

- (BOOL)hasPersonTokens
{
  return self->_hasPersonTokens;
}

- (BOOL)hasPersonSenderTokens
{
  return self->_hasPersonSenderTokens;
}

- (int)spotlightQueryIntent
{
  return self->_spotlightQueryIntent;
}

- (BOOL)isUnsafeQuery
{
  return self->_isUnsafeQuery;
}

- (BOOL)isBlocklistedQuery
{
  return self->_isBlocklistedQuery;
}

- (SFQueryUnderstandingParse)initWithProtobuf:(id)a3
{
  id v4;
  SFQueryUnderstandingParse *v5;
  SFQueryUnderstandingParse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFQueryUnderstandingParse;
  v5 = -[SFQueryUnderstandingParse init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "queryIntentType"))
      -[SFQueryUnderstandingParse setQueryIntentType:](v5, "setQueryIntentType:", objc_msgSend(v4, "queryIntentType"));
    if (objc_msgSend(v4, "hasUnspecifiedTokens"))
      -[SFQueryUnderstandingParse setHasUnspecifiedTokens:](v5, "setHasUnspecifiedTokens:", objc_msgSend(v4, "hasUnspecifiedTokens"));
    if (objc_msgSend(v4, "hasSortCriteriaTokens"))
      -[SFQueryUnderstandingParse setHasSortCriteriaTokens:](v5, "setHasSortCriteriaTokens:", objc_msgSend(v4, "hasSortCriteriaTokens"));
    if (objc_msgSend(v4, "hasLocationTokens"))
      -[SFQueryUnderstandingParse setHasLocationTokens:](v5, "setHasLocationTokens:", objc_msgSend(v4, "hasLocationTokens"));
    if (objc_msgSend(v4, "hasActionTokens"))
      -[SFQueryUnderstandingParse setHasActionTokens:](v5, "setHasActionTokens:", objc_msgSend(v4, "hasActionTokens"));
    if (objc_msgSend(v4, "hasMediaTypeTokens"))
      -[SFQueryUnderstandingParse setHasMediaTypeTokens:](v5, "setHasMediaTypeTokens:", objc_msgSend(v4, "hasMediaTypeTokens"));
    if (objc_msgSend(v4, "hasVisualQualityTokens"))
      -[SFQueryUnderstandingParse setHasVisualQualityTokens:](v5, "setHasVisualQualityTokens:", objc_msgSend(v4, "hasVisualQualityTokens"));
    if (objc_msgSend(v4, "hasNounTokens"))
      -[SFQueryUnderstandingParse setHasNounTokens:](v5, "setHasNounTokens:", objc_msgSend(v4, "hasNounTokens"));
    if (objc_msgSend(v4, "hasTimeTokens"))
      -[SFQueryUnderstandingParse setHasTimeTokens:](v5, "setHasTimeTokens:", objc_msgSend(v4, "hasTimeTokens"));
    if (objc_msgSend(v4, "hasEventTokens"))
      -[SFQueryUnderstandingParse setHasEventTokens:](v5, "setHasEventTokens:", objc_msgSend(v4, "hasEventTokens"));
    if (objc_msgSend(v4, "hasGenericLocationTokens"))
      -[SFQueryUnderstandingParse setHasGenericLocationTokens:](v5, "setHasGenericLocationTokens:", objc_msgSend(v4, "hasGenericLocationTokens"));
    if (objc_msgSend(v4, "hasCaptureDeviceTokens"))
      -[SFQueryUnderstandingParse setHasCaptureDeviceTokens:](v5, "setHasCaptureDeviceTokens:", objc_msgSend(v4, "hasCaptureDeviceTokens"));
    if (objc_msgSend(v4, "hasFavoritedTokens"))
      -[SFQueryUnderstandingParse setHasFavoritedTokens:](v5, "setHasFavoritedTokens:", objc_msgSend(v4, "hasFavoritedTokens"));
    if (objc_msgSend(v4, "hasSourceAppTokens"))
      -[SFQueryUnderstandingParse setHasSourceAppTokens:](v5, "setHasSourceAppTokens:", objc_msgSend(v4, "hasSourceAppTokens"));
    if (objc_msgSend(v4, "hasPersonTokens"))
      -[SFQueryUnderstandingParse setHasPersonTokens:](v5, "setHasPersonTokens:", objc_msgSend(v4, "hasPersonTokens"));
    if (objc_msgSend(v4, "hasPersonSenderTokens"))
      -[SFQueryUnderstandingParse setHasPersonSenderTokens:](v5, "setHasPersonSenderTokens:", objc_msgSend(v4, "hasPersonSenderTokens"));
    if (objc_msgSend(v4, "spotlightQueryIntent"))
      -[SFQueryUnderstandingParse setSpotlightQueryIntent:](v5, "setSpotlightQueryIntent:", objc_msgSend(v4, "spotlightQueryIntent"));
    if (objc_msgSend(v4, "isUnsafeQuery"))
      -[SFQueryUnderstandingParse setIsUnsafeQuery:](v5, "setIsUnsafeQuery:", objc_msgSend(v4, "isUnsafeQuery"));
    if (objc_msgSend(v4, "isBlocklistedQuery"))
      -[SFQueryUnderstandingParse setIsBlocklistedQuery:](v5, "setIsBlocklistedQuery:", objc_msgSend(v4, "isBlocklistedQuery"));
    v6 = v5;
  }

  return v5;
}

@end
