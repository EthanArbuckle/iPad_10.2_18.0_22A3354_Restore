@implementation VKVisualSearchActivity

- (VKVisualSearchActivity)initWithImage:(CGImage *)a3 presentingViewController:(id)a4
{
  id v6;
  VKVisualSearchActivity *v7;
  void *v8;
  uint64_t v9;
  NSString *title;
  void *v11;
  void *v12;
  uint64_t v13;
  UIImage *image;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VKVisualSearchActivity;
  v7 = -[UIActivity init](&v16, sel_init);
  if (v7)
  {
    VKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("VK_LOOK_UP_VISUAL_SEARCH_ITEM_TITLE"), CFSTR("VK_LOOK_UP_VISUAL_SEARCH_ITEM_TITLE"), CFSTR("Localizable"));
    v9 = objc_claimAutoreleasedReturnValue();
    title = v7->_title;
    v7->_title = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("info.circle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB5B8], 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithSymbolConfiguration:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    image = v7->_image;
    v7->_image = (UIImage *)v13;

    objc_storeWeak((id *)&v7->_presentingViewController, v6);
    v7->_imageToProcess = a3;
  }

  return v7;
}

- (id)activityType
{
  return CFSTR("com.apple.visionkit.visualSearch");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  void *v3;
  VKVisualSearchViewController *v4;

  v4 = -[VKVisualSearchViewController initWithImage:]([VKVisualSearchViewController alloc], "initWithImage:", -[VKVisualSearchActivity imageToProcess](self, "imageToProcess"));
  -[VKVisualSearchViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
  -[VKVisualSearchActivity presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0);

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (CGImage)imageToProcess
{
  return self->_imageToProcess;
}

- (void)setImageToProcess:(CGImage *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
