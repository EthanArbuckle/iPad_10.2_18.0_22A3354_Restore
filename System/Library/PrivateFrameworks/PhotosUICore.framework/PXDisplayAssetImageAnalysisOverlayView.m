@implementation PXDisplayAssetImageAnalysisOverlayView

- (PXDisplayAssetImageAnalysisOverlayView)initWithViewModel:(id)a3
{
  id v5;
  PXDisplayAssetImageAnalysisOverlayView *v6;
  PXDisplayAssetImageAnalysisOverlayView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDisplayAssetImageAnalysisOverlayView;
  v6 = -[PXDisplayAssetImageAnalysisOverlayView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewModel, a3);

  return v7;
}

- (PXDisplayAssetViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

+ (BOOL)isImageAnalysisOverlayNeededForViewModel:(id)a3
{
  if (isImageAnalysisOverlayNeededForViewModel__onceToken != -1)
    dispatch_once(&isImageAnalysisOverlayNeededForViewModel__onceToken, &__block_literal_global_185444);
  return 0;
}

+ (BOOL)changedImageAnalysisOverlayNeededForViewModelChange:(unint64_t)a3
{
  return 0;
}

void __83__PXDisplayAssetImageAnalysisOverlayView_isImageAnalysisOverlayNeededForViewModel___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PLOneUpGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A6789000, v0, OS_LOG_TYPE_ERROR, "image analysis overlay isn't available yet on the current platform", v1, 2u);
  }

}

@end
