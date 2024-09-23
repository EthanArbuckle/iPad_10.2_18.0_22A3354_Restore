@implementation PXSurveyQuestionCustomizableAssetGroupConfiguration

- (PXSurveyQuestionCustomizableAssetGroupConfiguration)initWithTitle:(id)a3 assetCollection:(id)a4 customMaximumPreviewAssetCount:(id)a5 keyAssetLocalIdentifier:(id)a6
{
  id v11;
  id v12;
  PXSurveyQuestionCustomizableAssetGroupConfiguration *v13;
  PXSurveyQuestionCustomizableAssetGroupConfiguration *v14;
  uint64_t v15;
  NSString *keyAssetLocalIdentifier;
  objc_super v18;

  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXSurveyQuestionCustomizableAssetGroupConfiguration;
  v13 = -[PXSurveyQuestionAssetGroupConfiguration initWithTitle:assetCollection:](&v18, sel_initWithTitle_assetCollection_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_customMaximumPreviewAssetCount, a5);
    v15 = objc_msgSend(v12, "copy");
    keyAssetLocalIdentifier = v14->_keyAssetLocalIdentifier;
    v14->_keyAssetLocalIdentifier = (NSString *)v15;

  }
  return v14;
}

- (PXSurveyQuestionCustomizableAssetGroupConfiguration)initWithTitle:(id)a3 assetCollection:(id)a4
{
  return -[PXSurveyQuestionCustomizableAssetGroupConfiguration initWithTitle:assetCollection:customMaximumPreviewAssetCount:keyAssetLocalIdentifier:](self, "initWithTitle:assetCollection:customMaximumPreviewAssetCount:keyAssetLocalIdentifier:", a3, a4, 0, 0);
}

- (id)contentView
{
  PXSurveyQuestionAssetGroupView *contentView;
  PXSurveyQuestionAssetGroupView *v3;
  PXSurveyQuestionAssetGroupView *v5;
  void *v6;
  void *v7;
  void *v8;
  PXSurveyQuestionAssetGroupView *v9;
  PXSurveyQuestionAssetGroupView *v10;
  PXSurveyQuestionAssetGroupView *v11;

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
    -[PXSurveyQuestionCustomizableAssetGroupConfiguration customMaximumPreviewAssetCount](self, "customMaximumPreviewAssetCount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSurveyQuestionCustomizableAssetGroupConfiguration keyAssetLocalIdentifier](self, "keyAssetLocalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXSurveyQuestionAssetGroupView initWithAssetCollection:customMaximumPreviewAssetCount:keyAssetLocalIdentifier:](v5, "initWithAssetCollection:customMaximumPreviewAssetCount:keyAssetLocalIdentifier:", v6, v7, v8);

    -[PXSurveyQuestionAssetGroupView setDelegate:](v9, "setDelegate:", self);
    v10 = self->_contentView;
    self->_contentView = v9;
    v11 = v9;

    v3 = self->_contentView;
  }
  return v3;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  -[PXSurveyQuestionAssetGroupView setFrame:](self->_contentView, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)px_surveyQuestionAssetGroupViewMetadataLocationString:(id)a3
{
  return &stru_1E5149688;
}

- (id)px_surveyQuestionAssetGroupViewMetadataDateRangeStringWithFormatter:(id)a3 assetGroupView:(id)a4
{
  return &stru_1E5149688;
}

- (NSNumber)customMaximumPreviewAssetCount
{
  return self->_customMaximumPreviewAssetCount;
}

- (void)setCustomMaximumPreviewAssetCount:(id)a3
{
  objc_storeStrong((id *)&self->_customMaximumPreviewAssetCount, a3);
}

- (NSString)keyAssetLocalIdentifier
{
  return self->_keyAssetLocalIdentifier;
}

- (void)setKeyAssetLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetLocalIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_customMaximumPreviewAssetCount, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
