@implementation PXCMMContext

- (PXCMMContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMContext.m"), 16, CFSTR("%s is not available as initializer"), "-[PXCMMContext init]");

  abort();
}

- (PXCMMContext)initWithAssetsDataSourceManager:(id)a3 mediaProvider:(id)a4 activityType:(unint64_t)a5
{
  id v9;
  id v10;
  PXCMMContext *v11;
  PXCMMContext *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXCMMContext;
  v11 = -[PXCMMContext init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSourceManager, a3);
    objc_storeStrong((id *)&v12->_mediaProvider, a4);
    v12->_activityType = a5;
  }

  return v12;
}

- (id)createSession
{
  return -[PXCMMSession initWithContext:]([PXCMMSession alloc], "initWithContext:", self);
}

- (PXCMMActionManager)actionManager
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMContext.m"), 39, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCMMContext actionManager]", v6);

  abort();
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsPreviewDataSourceManager
{
  return self->_peopleSuggestionsPreviewDataSourceManager;
}

- (void)setPeopleSuggestionsPreviewDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_peopleSuggestionsPreviewDataSourceManager, a3);
}

- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsDataSourceManager
{
  return self->_peopleSuggestionsDataSourceManager;
}

- (void)setPeopleSuggestionsDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSourceManager, a3);
}

- (NSString)originalTitle
{
  return self->_originalTitle;
}

- (void)setOriginalTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)hideActionMenu
{
  return self->_hideActionMenu;
}

- (void)setHideActionMenu:(BOOL)a3
{
  self->_hideActionMenu = a3;
}

- (BOOL)disableOneUp
{
  return self->_disableOneUp;
}

- (void)setDisableOneUp:(BOOL)a3
{
  self->_disableOneUp = a3;
}

- (NSDictionary)assetPreparationOptions
{
  return self->_assetPreparationOptions;
}

- (void)setAssetPreparationOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PXDisplayAsset)posterAsset
{
  return self->_posterAsset;
}

- (void)setPosterAsset:(id)a3
{
  objc_storeStrong((id *)&self->_posterAsset, a3);
}

- (PXUIImageProvider)posterMediaProvider
{
  return self->_posterMediaProvider;
}

- (void)setPosterMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_posterMediaProvider, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (int64_t)photosCount
{
  return self->_photosCount;
}

- (void)setPhotosCount:(int64_t)a3
{
  self->_photosCount = a3;
}

- (int64_t)videosCount
{
  return self->_videosCount;
}

- (void)setVideosCount:(int64_t)a3
{
  self->_videosCount = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (PXRecipient)originatorRecipient
{
  return self->_originatorRecipient;
}

- (void)setOriginatorRecipient:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unint64_t)numberOfReceivedAssets
{
  return self->_numberOfReceivedAssets;
}

- (void)setNumberOfReceivedAssets:(unint64_t)a3
{
  self->_numberOfReceivedAssets = a3;
}

- (double)ppt_delay
{
  return self->_ppt_delay;
}

- (void)setPpt_delay:(double)a3
{
  self->_ppt_delay = a3;
}

- (BOOL)ppt_presentComposeRecipientView
{
  return self->_ppt_presentComposeRecipientView;
}

- (void)setPpt_presentComposeRecipientView:(BOOL)a3
{
  self->_ppt_presentComposeRecipientView = a3;
}

- (BOOL)ppt_scrollComposeRecipientsView
{
  return self->_ppt_scrollComposeRecipientsView;
}

- (void)setPpt_scrollComposeRecipientsView:(BOOL)a3
{
  self->_ppt_scrollComposeRecipientsView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatorRecipient, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_posterMediaProvider, 0);
  objc_storeStrong((id *)&self->_posterAsset, 0);
  objc_storeStrong((id *)&self->_assetPreparationOptions, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_originalTitle, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionsPreviewDataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMContext.m"), 20, CFSTR("%s is not available as initializer"), "+[PXCMMContext new]");

  abort();
}

@end
