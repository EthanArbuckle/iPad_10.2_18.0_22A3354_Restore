@implementation APContentDataPrivate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSequenceNumber:(int)a3
{
  self->_sequenceNumber = a3;
}

- (void)setBatchResponseID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataPrivate adResponseIdentifier](self, "adResponseIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("adResponseIdentifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataPrivate batchResponseID](self, "batchResponseID"));
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("batchResponseID"));

  objc_msgSend(v10, "encodeInt32:forKey:", -[APContentDataPrivate impressionCount](self, "impressionCount"), CFSTR("impressionCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataPrivate impressionIdentifier](self, "impressionIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("impressionIdentifier"));

  -[APContentDataPrivate selectedCreativeSize](self, "selectedCreativeSize");
  objc_msgSend(v10, "encodeInt32:forKey:", (int)v7, CFSTR("kSelectedCreativeSizeWidth"));
  -[APContentDataPrivate selectedCreativeSize](self, "selectedCreativeSize");
  objc_msgSend(v10, "encodeInt32:forKey:", (int)v8, CFSTR("kSelectedCreativeSizeHeight"));
  objc_msgSend(v10, "encodeInt32:forKey:", -[APContentDataPrivate sequenceNumber](self, "sequenceNumber"), CFSTR("sequenceNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataPrivate statusConditionExpression](self, "statusConditionExpression"));
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("statusConditionExpression"));

  objc_msgSend(v10, "encodeInt32:forKey:", -[APContentDataPrivate consumedImpressions](self, "consumedImpressions"), CFSTR("consumedImpressions"));
  objc_msgSend(v10, "encodeBool:forKey:", -[APContentDataPrivate isOutstreamVideo](self, "isOutstreamVideo"), CFSTR("isOutstreamVideo"));
  objc_msgSend(v10, "encodeBool:forKey:", -[APContentDataPrivate isPrerollVideo](self, "isPrerollVideo"), CFSTR("isPrerollVideo"));
  objc_msgSend(v10, "encodeBool:forKey:", -[APContentDataPrivate isNativeAd](self, "isNativeAd"), CFSTR("isNativeAd"));
  objc_msgSend(v10, "encodeBool:forKey:", -[APContentDataPrivate isCarouselAd](self, "isCarouselAd"), CFSTR("isCarouselAd"));
  objc_msgSend(v10, "encodeBool:forKey:", -[APContentDataPrivate isSponsorshipAd](self, "isSponsorshipAd"), CFSTR("isSponsorshipAd"));

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedCreativeSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  objc_copyStruct(v4, &self->_selectedCreativeSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSString)statusConditionExpression
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (int)sequenceNumber
{
  return self->_sequenceNumber;
}

- (BOOL)isPrerollVideo
{
  return self->_isPrerollVideo;
}

- (BOOL)isOutstreamVideo
{
  return self->_isOutstreamVideo;
}

- (BOOL)isNativeAd
{
  return self->_isNativeAd;
}

- (BOOL)isCarouselAd
{
  return self->_isCarouselAd;
}

- (NSData)impressionIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (int)impressionCount
{
  return self->_impressionCount;
}

- (int)consumedImpressions
{
  return self->_consumedImpressions;
}

- (NSString)batchResponseID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)adResponseIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (APContentDataPrivate)initWithAdData:(id)a3 forPlacementType:(int64_t)a4
{
  id v6;
  APContentDataPrivate *v7;
  uint64_t v8;
  NSString *adResponseIdentifier;
  uint64_t v10;
  NSString *statusConditionExpression;
  uint64_t v12;
  NSData *impressionIdentifier;
  void *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  _BOOL4 v18;
  uint64_t v19;

  v6 = a3;
  v7 = -[APContentDataPrivate init](self, "init");
  if (v7)
  {
    if (objc_msgSend(v6, "hasAdDataResponseIdentifier"))
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adDataResponseIdentifier"));
      adResponseIdentifier = v7->_adResponseIdentifier;
      v7->_adResponseIdentifier = (NSString *)v8;

    }
    if (objc_msgSend(v6, "hasExpressionToEvaluate"))
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "expressionToEvaluate"));
      statusConditionExpression = v7->_statusConditionExpression;
      v7->_statusConditionExpression = (NSString *)v10;

    }
    if (objc_msgSend(v6, "hasImpressionIdentifierData"))
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "impressionIdentifierData"));
      impressionIdentifier = v7->_impressionIdentifier;
      v7->_impressionIdentifier = (NSData *)v12;

    }
    v7->_impressionCount = objc_msgSend(v6, "impressionCount");
    if (objc_msgSend(v6, "hasAdTagContentString"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adTagContentString"));
      v15 = objc_msgSend(v14, "length") == 0;

    }
    else
    {
      v15 = 1;
    }
    if (objc_msgSend(v6, "hasMediaFiles"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaFiles"));
      v17 = objc_msgSend(v16, "mediaAssetsCount");

      v18 = !v17 || v15;
      if (!a4 && !v18)
      {
        v19 = 8;
LABEL_29:
        *((_BYTE *)&v7->super.isa + v19) = 1;
        goto LABEL_30;
      }
    }
    switch(a4)
    {
      case 1:
        v19 = 13;
        goto LABEL_29;
      case 3:
        v19 = 10;
        goto LABEL_29;
      case 4:
        v19 = 9;
        goto LABEL_29;
    }
    if (a4)
    {
      if (a4 == 7)
      {
        v19 = 12;
        goto LABEL_29;
      }
    }
    else if (objc_msgSend(v6, "adLayoutDatasCount"))
    {
      v19 = 11;
      goto LABEL_29;
    }
  }
LABEL_30:

  return v7;
}

- (APContentDataPrivate)init
{
  APContentDataPrivate *v2;
  APContentDataPrivate *v3;
  NSString *adResponseIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APContentDataPrivate;
  v2 = -[APContentDataPrivate init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    adResponseIdentifier = v2->_adResponseIdentifier;
    v2->_adResponseIdentifier = (NSString *)CFSTR("-2|-2");

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusConditionExpression, 0);
  objc_storeStrong((id *)&self->_impressionIdentifier, 0);
  objc_storeStrong((id *)&self->_batchResponseID, 0);
  objc_storeStrong((id *)&self->_adResponseIdentifier, 0);
}

- (APContentDataPrivate)initWithCoder:(id)a3
{
  id v4;
  APContentDataPrivate *v5;
  id v6;
  uint64_t v7;
  NSString *adResponseIdentifier;
  id v9;
  uint64_t v10;
  NSString *batchResponseID;
  id v12;
  uint64_t v13;
  NSData *impressionIdentifier;
  id v15;
  uint64_t v16;
  NSString *statusConditionExpression;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)APContentDataPrivate;
  v5 = -[APContentDataPrivate init](&v19, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("adResponseIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    adResponseIdentifier = v5->_adResponseIdentifier;
    v5->_adResponseIdentifier = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("batchResponseID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    batchResponseID = v5->_batchResponseID;
    v5->_batchResponseID = (NSString *)v10;

    v5->_impressionCount = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("impressionCount"));
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("impressionIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    impressionIdentifier = v5->_impressionIdentifier;
    v5->_impressionIdentifier = (NSData *)v13;

    v5->_selectedCreativeSize.width = (double)(int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("kSelectedCreativeSizeWidth"));
    v5->_selectedCreativeSize.height = (double)(int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("kSelectedCreativeSizeHeight"));
    v5->_sequenceNumber = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sequenceNumber"));
    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("statusConditionExpression"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    statusConditionExpression = v5->_statusConditionExpression;
    v5->_statusConditionExpression = (NSString *)v16;

    v5->_consumedImpressions = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("consumedImpressions"));
    v5->_isCarouselAd = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCarouselAd"));
    v5->_isOutstreamVideo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOutstreamVideo"));
    v5->_isPrerollVideo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrerollVideo"));
    v5->_isNativeAd = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isNativeAd"));
    v5->_isSponsorshipAd = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSponsorshipAd"));
  }

  return v5;
}

- (int)impressionsRemaining
{
  unsigned int v3;

  v3 = -[APContentDataPrivate impressionCount](self, "impressionCount");
  return v3 - -[APContentDataPrivate consumedImpressions](self, "consumedImpressions");
}

- (BOOL)impressionIsAvailable
{
  _BOOL4 v3;

  if (-[APContentDataPrivate impressionsRemaining](self, "impressionsRemaining") <= 0)
    return -[APContentDataPrivate impressionCount](self, "impressionCount") >> 31;
  else
    LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)isClientRenderedAd
{
  if (-[APContentDataPrivate isNativeAd](self, "isNativeAd"))
    return 1;
  else
    return -[APContentDataPrivate isPrerollVideo](self, "isPrerollVideo");
}

- (BOOL)isVideo
{
  if (-[APContentDataPrivate isOutstreamVideo](self, "isOutstreamVideo"))
    return 1;
  else
    return -[APContentDataPrivate isPrerollVideo](self, "isPrerollVideo");
}

- (void)save
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataPrivate delegate](self, "delegate"));
  objc_msgSend(v2, "privateDataDidChange");

}

- (void)setAdResponseIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setImpressionCount:(int)a3
{
  self->_impressionCount = a3;
}

- (void)setImpressionIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setSelectedCreativeSize:(id)a3
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v3;

  v3 = a3;
  objc_copyStruct(&self->_selectedCreativeSize, &v3, 16, 1, 0);
}

- (void)setStatusConditionExpression:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setConsumedImpressions:(int)a3
{
  self->_consumedImpressions = a3;
}

- (void)setIsOutstreamVideo:(BOOL)a3
{
  self->_isOutstreamVideo = a3;
}

- (void)setIsNativeAd:(BOOL)a3
{
  self->_isNativeAd = a3;
}

- (void)setIsPrerollVideo:(BOOL)a3
{
  self->_isPrerollVideo = a3;
}

- (void)setIsCarouselAd:(BOOL)a3
{
  self->_isCarouselAd = a3;
}

- (BOOL)isSponsorshipAd
{
  return self->_isSponsorshipAd;
}

- (APContentDataPrivateDelegate)delegate
{
  return (APContentDataPrivateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)consumed50PercentImpressions
{
  return self->_consumed50PercentImpressions;
}

- (void)setConsumed50PercentImpressions:(int)a3
{
  self->_consumed50PercentImpressions = a3;
}

- (int)impression50PercentCount
{
  return self->_impression50PercentCount;
}

- (void)setImpression50PercentCount:(int)a3
{
  self->_impression50PercentCount = a3;
}

- (BOOL)isInterstitialAd
{
  return self->_isInterstitialAd;
}

- (void)setIsInterstitialAd:(BOOL)a3
{
  self->_isInterstitialAd = a3;
}

- (double)responseTime
{
  return self->_responseTime;
}

@end
