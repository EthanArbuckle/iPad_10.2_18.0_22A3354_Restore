@implementation ICMusicSubscriptionLeasePlaybackRequest

- (ICMusicSubscriptionLeasePlaybackRequest)initWithRequestContext:(id)a3
{
  id v4;
  ICMusicSubscriptionLeasePlaybackRequest *v5;
  uint64_t v6;
  ICStoreRequestContext *requestContext;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICMusicSubscriptionLeasePlaybackRequest;
  v5 = -[ICMusicSubscriptionLeasePlaybackRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestContext = v5->_requestContext;
    v5->_requestContext = (ICStoreRequestContext *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_assetSourceStorefrontID);
    objc_storeStrong((id *)(v5 + 24), self->_requestContext);
    objc_storeStrong((id *)(v5 + 56), self->_cloudUniversalLibraryID);
    *(_QWORD *)(v5 + 32) = self->_storeCloudID;
    *(_QWORD *)(v5 + 40) = self->_storePurchasedAdamID;
    *(_QWORD *)(v5 + 48) = self->_storeSubscriptionAdamID;
    *(_BYTE *)(v5 + 8) = self->_shouldPreventLeaseAcquisition;
    *(_BYTE *)(v5 + 9) = self->_shouldRequireLeaseAcquisition;
    *(_BYTE *)(v5 + 10) = self->_triggeredByLeasePrevention;
    *(_BYTE *)(v5 + 11) = self->_followUp;
  }
  return (id)v5;
}

- (NSString)assetSourceStorefrontID
{
  return self->_assetSourceStorefrontID;
}

- (void)setAssetSourceStorefrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (unint64_t)storeCloudID
{
  return self->_storeCloudID;
}

- (void)setStoreCloudID:(unint64_t)a3
{
  self->_storeCloudID = a3;
}

- (int64_t)storePurchasedAdamID
{
  return self->_storePurchasedAdamID;
}

- (void)setStorePurchasedAdamID:(int64_t)a3
{
  self->_storePurchasedAdamID = a3;
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_storeSubscriptionAdamID;
}

- (void)setStoreSubscriptionAdamID:(int64_t)a3
{
  self->_storeSubscriptionAdamID = a3;
}

- (NSString)cloudUniversalLibraryID
{
  return self->_cloudUniversalLibraryID;
}

- (void)setCloudUniversalLibraryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)shouldPreventLeaseAcquisition
{
  return self->_shouldPreventLeaseAcquisition;
}

- (void)setShouldPreventLeaseAcquisition:(BOOL)a3
{
  self->_shouldPreventLeaseAcquisition = a3;
}

- (BOOL)shouldRequireLeaseAcquisition
{
  return self->_shouldRequireLeaseAcquisition;
}

- (void)setShouldRequireLeaseAcquisition:(BOOL)a3
{
  self->_shouldRequireLeaseAcquisition = a3;
}

- (BOOL)isTriggeredByLeasePrevention
{
  return self->_triggeredByLeasePrevention;
}

- (void)setTriggeredByLeasePrevention:(BOOL)a3
{
  self->_triggeredByLeasePrevention = a3;
}

- (BOOL)isFollowUp
{
  return self->_followUp;
}

- (void)setFollowUp:(BOOL)a3
{
  self->_followUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudUniversalLibraryID, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_assetSourceStorefrontID, 0);
}

@end
