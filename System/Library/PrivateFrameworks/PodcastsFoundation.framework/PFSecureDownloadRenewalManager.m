@implementation PFSecureDownloadRenewalManager

- (PFSecureDownloadRenewalManager)init
{
  PFSecureDownloadRenewalManager *v2;
  MTSecureDownloadRenewalManager *v3;
  MTSecureDownloadRenewalManager *manager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFSecureDownloadRenewalManager;
  v2 = -[PFSecureDownloadRenewalManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MTSecureDownloadRenewalManager);
    manager = v2->_manager;
    v2->_manager = v3;

  }
  return v2;
}

- (void)updateDRMKeysForDownloads
{
  -[MTSecureDownloadRenewalManager updateDRMKeysForDownloadsWithUrlProtocolDelegate:completionHandler:](self->_manager, "updateDRMKeysForDownloadsWithUrlProtocolDelegate:completionHandler:", 0, 0);
}

- (void)requestSecureDeletionOfEpisodeWithAdamID:(int64_t)a3
{
  -[MTSecureDownloadRenewalManager requestSecureDeletionOf:completionHandler:](self->_manager, "requestSecureDeletionOf:completionHandler:", a3, 0);
}

- (void)requestSecureDeletionOfOrphanedKeys
{
  -[MTSecureDownloadRenewalManager requestSecureDeletionOfOrphanedKeysWithCompletionHandler:](self->_manager, "requestSecureDeletionOfOrphanedKeysWithCompletionHandler:", 0);
}

+ (id)inContextKeyDataFor:(int64_t)a3 ctx:(id)a4
{
  return +[MTSecureDownloadRenewalManager inContextKeyDataFor:ctx:](MTSecureDownloadRenewalManager, "inContextKeyDataFor:ctx:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
