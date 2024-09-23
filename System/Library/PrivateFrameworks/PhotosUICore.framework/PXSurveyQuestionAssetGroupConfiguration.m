@implementation PXSurveyQuestionAssetGroupConfiguration

- (PXSurveyQuestionAssetGroupConfiguration)initWithTitle:(id)a3 assetCollection:(id)a4
{
  id v6;
  id v7;
  PXSurveyQuestionAssetGroupConfiguration *v8;
  uint64_t v9;
  NSString *title;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSurveyQuestionAssetGroupConfiguration;
  v8 = -[PXSurveyQuestionAssetGroupConfiguration init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v8->_isStale = 0;
    objc_storeStrong((id *)&v8->_assetCollection, a4);
  }

  return v8;
}

- (PXSurveyQuestionAssetGroupConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionAssetGroupConfiguration.m"), 45, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionAssetGroupConfiguration init]");

  abort();
}

- (UIView)contentView
{
  PXSurveyQuestionAssetGroupView *contentView;
  PXSurveyQuestionAssetGroupView *v3;
  PXSurveyQuestionAssetGroupView *v5;
  void *v6;
  PXSurveyQuestionAssetGroupView *v7;
  PXSurveyQuestionAssetGroupView *v8;
  PXSurveyQuestionAssetGroupView *v9;

  contentView = self->_contentView;
  if (contentView)
  {
    v3 = contentView;
  }
  else
  {
    v5 = [PXSurveyQuestionAssetGroupView alloc];
    -[PXSurveyQuestionAssetGroupConfiguration assetCollection](self, "assetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXSurveyQuestionAssetGroupView initWithAssetCollection:](v5, "initWithAssetCollection:", v6);

    -[PXSurveyQuestionAssetGroupView setDelegate:](v7, "setDelegate:", self);
    v8 = self->_contentView;
    self->_contentView = v7;
    v9 = v7;

    v3 = self->_contentView;
  }
  return (UIView *)v3;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  -[PXSurveyQuestionAssetGroupView setFrame:](self->_contentView, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)contentRectForOneUp
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIImage)contentImageForOneUp
{
  return 0;
}

- (id)px_surveyQuestionAssetGroupViewMetadataLocationString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXSurveyQuestionAssetGroupConfiguration assetCollection](self, "assetCollection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedLocationNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)px_surveyQuestionAssetGroupViewMetadataDateRangeStringWithFormatter:(id)a3 assetGroupView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  -[PXSurveyQuestionAssetGroupConfiguration assetCollection](self, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSurveyQuestionAssetGroupConfiguration assetCollection](self, "assetCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)px_surveyQuestionAssetGroupViewWasTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PXPhotosUIViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  id v14;

  -[PXSurveyQuestionAssetGroupConfiguration assetCollection](self, "assetCollection", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v14, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAssetsInAssetCollection:options:", v14, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXPhotosViewConfigurationForAssetCollectionWithExistingAssetsFetchResult(v14, v7, 0, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v8);
  -[PXSurveyQuestionAssetGroupConfiguration handlers](self, "handlers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewControllerHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PXSurveyQuestionAssetGroupConfiguration handlers](self, "handlers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewControllerHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PXPhotosUIViewController *, id))v13)[2](v13, v9, v14);

  }
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (NSString)title
{
  return self->_title;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
