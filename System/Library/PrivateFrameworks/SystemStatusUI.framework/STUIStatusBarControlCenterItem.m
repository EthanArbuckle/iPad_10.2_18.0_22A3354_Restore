@implementation STUIStatusBarControlCenterItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0CB8];
}

+ (STUIStatusBarIdentifier)grabberIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("grabberIdentifier"));
}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  +[STUIStatusBarControlCenterItem grabberIdentifier](STUIStatusBarControlCenterItem, "grabberIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarControlCenterItem grabberView](self, "grabberView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarControlCenterItem;
    -[STUIStatusBarIndicatorItem viewForIdentifier:](&v9, sel_viewForIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (STUIStatusBarControlCenterGrabberView)grabberView
{
  STUIStatusBarControlCenterGrabberView *grabberView;

  grabberView = self->_grabberView;
  if (!grabberView)
  {
    -[STUIStatusBarControlCenterItem _create_grabberView](self, "_create_grabberView");
    grabberView = self->_grabberView;
  }
  return grabberView;
}

- (void)_create_grabberView
{
  STUIStatusBarControlCenterGrabberView *v3;
  STUIStatusBarControlCenterGrabberView *v4;
  STUIStatusBarControlCenterGrabberView *grabberView;

  v3 = [STUIStatusBarControlCenterGrabberView alloc];
  v4 = -[STUIStatusBarControlCenterGrabberView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  grabberView = self->_grabberView;
  self->_grabberView = v4;

}

- (Class)imageViewClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberView, 0);
}

- (id)systemImageNameForUpdate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlCenterEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setGrabberView:(id)a3
{
  objc_storeStrong((id *)&self->_grabberView, a3);
}

@end
