@implementation PUImportOneUpPreviewingViewController

- (PUImportOneUpPreviewingViewController)initWithImportItemViewModel:(id)a3 startingImage:(id)a4 mediaProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  PUImportOneUpPreviewingViewController *v12;
  PUImportOneUpPreviewingViewController *v13;
  PUImportOneUpTransitionView *v14;
  PUImportOneUpTransitionView *previewView;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PUImportOneUpPreviewingViewController;
  v12 = -[PUImportOneUpPreviewingViewController init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_importItemViewModel, a3);
    objc_storeStrong((id *)&v13->_mediaProvider, a5);
    v14 = -[PUImportOneUpTransitionView initWithImportItem:startingImage:mediaProvider:]([PUImportOneUpTransitionView alloc], "initWithImportItem:startingImage:mediaProvider:", v13->_importItemViewModel, v10, v13->_mediaProvider);
    previewView = v13->_previewView;
    v13->_previewView = v14;

  }
  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUImportOneUpPreviewingViewController;
  -[PUImportOneUpPreviewingViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[PUImportOneUpPreviewingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpPreviewingViewController previewView](self, "previewView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[PUImportOneUpPreviewingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PUImportOneUpPreviewingViewController previewView](self, "previewView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[PUImportOneUpPreviewingViewController previewView](self, "previewView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  -[PUImportOneUpPreviewingViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (void)updatePreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[PUImportOneUpPreviewingViewController importItemViewModel](self, "importItemViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpPreviewingViewController sizeForImportItemViewModel:](self, "sizeForImportItemViewModel:", v3);
  v5 = v4;
  v7 = v6;

  if (v5 / v7 >= 0.75)
    v8 = v5 / v7;
  else
    v8 = 0.75;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  PURectWithAspectRatioFittingRect(v8, v10, v11, v12, v13);
  v15 = v14;
  v17 = v16;

  -[PUImportOneUpPreviewingViewController setPreferredContentSize:](self, "setPreferredContentSize:", v15, v17);
}

- (CGSize)sizeForImportItemViewModel:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  objc_msgSend(a3, "importAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orientedPixelSize");
  v6 = v5;
  v7 = v4;
  if (v5 == *MEMORY[0x1E0C9D820] && v4 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v6 = v10;
    v7 = v11;

  }
  v12 = round(v6);
  v13 = round(v7);
  result.height = v13;
  result.width = v12;
  return result;
}

- (PXImportItemViewModel)importItemViewModel
{
  return self->_importItemViewModel;
}

- (void)setImportItemViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_importItemViewModel, a3);
}

- (PXImportMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, a3);
}

- (PUImportOneUpTransitionView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_previewView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_importItemViewModel, 0);
}

@end
