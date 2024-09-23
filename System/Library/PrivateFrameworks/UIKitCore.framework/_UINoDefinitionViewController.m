@implementation _UINoDefinitionViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _UIContentUnavailableView *v5;
  void *v6;
  _UIContentUnavailableView *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UINoDefinitionViewController;
  -[UIViewController viewDidLoad](&v16, sel_viewDidLoad);
  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = [_UIContentUnavailableView alloc];
  _UINSLocalizedStringWithDefaultValue(CFSTR("No definition found."), CFSTR("No definition found."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIContentUnavailableView initWithFrame:title:style:](v5, "initWithFrame:title:style:", v6, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  -[UIView setFrame:](v7, "setFrame:");

  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __44___UINoDefinitionViewController_viewDidLoad__block_invoke;
  v13 = &unk_1E16B3F40;
  objc_copyWeak(&v14, &location);
  -[_UIContentUnavailableView setButtonAction:](v7, "setButtonAction:", &v10);
  -[UIViewController view](self, "view", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v7);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

@end
