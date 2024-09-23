@implementation VKImageAnalysisBarButtonItem

+ (id)analysisButtonWithTarget:(id)a3 action:(SEL)a4 mode:(unint64_t)a5
{
  id v7;
  VKImageAnalysisBarButtonItem *v8;
  void *v9;

  v7 = a3;
  v8 = objc_alloc_init(VKImageAnalysisBarButtonItem);
  -[VKSelectableBarButtonItem setTarget:](v8, "setTarget:", v7);

  -[VKSelectableBarButtonItem setAction:](v8, "setAction:", a4);
  objc_msgSend((id)objc_opt_class(), "imageForMode:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKSelectableBarButtonItem setImage:](v8, "setImage:", v9);

  v8->_mode = a5;
  -[VKSelectableBarButtonItem setCornerRadiusRatio:](v8, "setCornerRadiusRatio:", 0.25);
  return v8;
}

- (void)setMode:(unint64_t)a3
{
  id v4;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    objc_msgSend((id)objc_opt_class(), "imageForMode:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[VKSelectableBarButtonItem setImage:](self, "setImage:", v4);

  }
}

+ (id)imageForMode:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 2)
  {
    v3 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("appclip");
  }
  else if (a3 == 1)
  {
    v3 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("qrcode.viewfinder");
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      return v6;
    }
    v3 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("text.viewfinder");
  }
  objc_msgSend(v3, "systemImageNamed:withConfiguration:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)mode
{
  return self->_mode;
}

@end
