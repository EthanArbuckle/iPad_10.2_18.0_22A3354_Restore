@implementation _TVListTemplateController

- (void)updateWithViewElement:(id)a3
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_TVListTemplateController;
  -[_TVBgImageLoadingViewController updateWithViewElement:](&v19, sel_updateWithViewElement_, v5);
  objc_storeStrong((id *)&self->_templateElement, a3);
  objc_msgSend(v5, "appDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "impressionThreshold");
  self->_impressionThreshold = v7;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "children", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "tv_elementType");
        switch(v14)
        {
          case 22:
            -[_TVListTemplateController _configureWithListElement:](self, "_configureWithListElement:", v13);
            break;
          case 12:
            objc_storeStrong((id *)&self->_bannerElement, v13);
            break;
          case 4:
            -[_TVListTemplateController _configureWithBgElement:](self, "_configureWithBgElement:", v13);
            break;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v10);
  }

  if (-[_TVListTemplateController isViewLoaded](self, "isViewLoaded"))
    -[_TVListTemplateController _updateView](self, "_updateView");

}

- (BOOL)setNeedsFocusUpdateToList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[_TVListTemplateController setFocusedController:](self, "setFocusedController:", 0);
  -[_TVListTemplateController listViewController](self, "listViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsFocusUpdate");

  -[_TVListTemplateController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVListTemplateController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isDescendantOfView:", v6);

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVListTemplateController;
  -[_TVBgImageLoadingViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVListTemplateController;
  -[_TVBgImageLoadingViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)loadView
{
  _TVListTemplateView *v3;

  v3 = -[_TVListTemplateView initWithFrame:]([_TVListTemplateView alloc], "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[_TVListTemplateController setView:](self, "setView:", v3);
  -[_TVListTemplateController _updateView](self, "_updateView");

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_TVListTemplateController;
  v6 = a3;
  -[_TVListTemplateController didUpdateFocusInContext:withAnimationCoordinator:](&v19, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", v19.receiver, v19.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "focusedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVListTemplateController listViewController](self, "listViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isDescendantOfView:", v10);

  if (v11)
  {
    -[_TVListTemplateController listViewController](self, "listViewController");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v16 = (void *)v12;
    -[_TVListTemplateController setFocusedController:](self, "setFocusedController:", v12);

    goto LABEL_6;
  }
  -[_TVListTemplateController previewViewController](self, "previewViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "isDescendantOfView:", v14);

  if (v15)
  {
    -[_TVListTemplateController previewViewController](self, "previewViewController");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  -[_TVListTemplateController listViewController](self, "listViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previouslyFocusedView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "templateControllerDidUpdateFocusFromView:", v18);
}

- (id)preferredFocusEnvironments
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (-[IKViewElement isDisabled](self->_templateElement, "isDisabled"))
  {
    if (self->_disabledTemplateFocusCaptureView)
    {
      v10[0] = self->_disabledTemplateFocusCaptureView;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    -[_TVListTemplateController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVListTemplateController focusedController](self, "focusedController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_TVListTemplateController focusedController](self, "focusedController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

    }
    -[_TVListTemplateController listViewController](self, "listViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_TVListTemplateController listViewController](self, "listViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

    }
  }
  return v5;
}

- (void)_updateView
{
  void *v3;
  IKViewElement *bannerElement;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  _TVFocusCaptureView *disabledTemplateFocusCaptureView;
  _TVFocusCaptureView *v24;
  _TVFocusCaptureView *v25;
  _TVFocusCaptureView *v26;
  void *v27;
  void *v28;
  id v29;

  -[_TVListTemplateController _listTemplateView](self, "_listTemplateView");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSemanticContentAttribute:", -[IKViewElement tv_semanticContentAttribute](self->_templateElement, "tv_semanticContentAttribute"));
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  bannerElement = self->_bannerElement;
  objc_msgSend(v29, "bannerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_viewFromElement:existingView:", bannerElement, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBannerView:", v6);

  -[IKViewElement attributes](self->_bannerElement, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("floating"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
    objc_msgSend(v29, "setFloatingBanner:", objc_msgSend(v8, "BOOLValue"));
  -[IKCollectionElement style](self->_listElement, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tv_backgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setBackdropEnabled:", objc_msgSend(v10, "colorType") == 2);
  -[IKViewElement style](self->_templateElement, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tv_backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[IKViewElement style](self->_templateElement, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tv_backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBackgroundColor:", v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBackgroundColor:", v14);
  }

  -[_TVListTemplateController listViewController](self, "listViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_viewControllerFromElement:existingController:", self->_listElement, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKViewElement elementName](self->_templateElement, "elementName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlwaysSoftFocusEnabled:", objc_msgSend(v20, "isEqualToString:", CFSTR("catalogTemplate")));

  if (v17 != v19)
  {
    objc_msgSend(v17, "willMoveToParentViewController:", 0);
    if (v19)
    {
      -[_TVListTemplateController addChildViewController:](self, "addChildViewController:", v19);
      objc_msgSend(v19, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setListView:", v21);

    }
    objc_msgSend(v17, "removeFromParentViewController");
    objc_msgSend(v19, "didMoveToParentViewController:", self);
    -[_TVListTemplateController setListViewController:](self, "setListViewController:", v19);
    objc_msgSend(v19, "setDelegate:", self);
  }
  v22 = -[IKViewElement isDisabled](self->_templateElement, "isDisabled");
  disabledTemplateFocusCaptureView = self->_disabledTemplateFocusCaptureView;
  if (v22)
  {
    if (!disabledTemplateFocusCaptureView)
    {
      v24 = -[_TVFocusCaptureView initWithFrame:]([_TVFocusCaptureView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
      v25 = self->_disabledTemplateFocusCaptureView;
      self->_disabledTemplateFocusCaptureView = v24;

      v26 = self->_disabledTemplateFocusCaptureView;
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVFocusCaptureView setBackgroundColor:](v26, "setBackgroundColor:", v27);

    }
    -[_TVListTemplateController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", self->_disabledTemplateFocusCaptureView);
  }
  else
  {
    -[_TVFocusCaptureView removeFromSuperview](disabledTemplateFocusCaptureView, "removeFromSuperview");
    v28 = self->_disabledTemplateFocusCaptureView;
    self->_disabledTemplateFocusCaptureView = 0;
  }

}

- (void)listViewController:(id)a3 updatePreviewViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  v13 = a4;
  -[_TVListTemplateController previewViewController](self, "previewViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v13)
  {
    -[_TVListTemplateController focusedController](self, "focusedController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v5)
      -[_TVListTemplateController setFocusedController:](self, "setFocusedController:", 0);
    -[_TVListTemplateController _listTemplateView](self, "_listTemplateView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willMoveToParentViewController:", 0);
    v8 = v13;
    if (v13)
    {
      -[_TVListTemplateController addChildViewController:](self, "addChildViewController:", v13);
      v8 = v13;
    }
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreviewView:", v9);

    objc_msgSend(v5, "removeFromParentViewController");
    objc_msgSend(v13, "didMoveToParentViewController:", self);
    -[_TVListTemplateController setPreviewViewController:](self, "setPreviewViewController:", v13);
    if (self->_impressionThreshold > 0.0 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "performSelector:", sel__cancelImpressionsUpdate);
    objc_msgSend(v13, "tv_associatedIKViewElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "tv_elementType") != 14;

    -[_TVListTemplateController listViewController](self, "listViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIndexDisplayEnabled:", v11);

  }
}

- (void)listViewController:(id)a3 didScrollWithScrollView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v5 = a4;
  -[_TVListTemplateController _listTemplateView](self, "_listTemplateView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustScrollForListView:", v5);

  if (self->_impressionThreshold > 0.0)
  {
    -[_TVListTemplateController previewViewController](self, "previewViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[_TVListTemplateController previewViewController](self, "previewViewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "performSelector:", sel__cancelImpressionsUpdate);

    }
  }
}

- (void)_configureWithBgElement:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  IKAudioElement *bgAudioElement;
  IKAudioElement *v14;
  void *v15;
  UIView *overlayView;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = a3;
  objc_msgSend(v20, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_25;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v24;
  v21 = *(_QWORD *)v24;
  do
  {
    v9 = 0;
    v22 = v6;
    do
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
      v11 = 1040;
      if ((self->_bgImageElement
         || objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "tv_elementType") != 16
         || objc_msgSend(v10, "tv_imageType"))
        && ((v11 = 1056, self->_heroImageElement)
         || objc_msgSend(v10, "tv_elementType") != 16
         || objc_msgSend(v10, "tv_imageType") != 3))
      {
        if (objc_msgSend(v10, "tv_elementType") == 3)
        {
          v14 = v10;
          bgAudioElement = self->_bgAudioElement;
          self->_bgAudioElement = v14;
        }
        else
        {
          if (objc_msgSend(v10, "tv_elementType") != 35)
            goto LABEL_21;
          bgAudioElement = v10;
          -[IKAudioElement children](bgAudioElement, "children");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            overlayView = self->_overlayView;
          else
            overlayView = 0;
          v17 = v7;
          +[TVMLViewFactory organizerViewWithElements:existingView:](TVMLViewFactory, "organizerViewWithElements:existingView:", v15, overlayView);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "setUserInteractionEnabled:", 0);
          v8 = v21;
          v6 = v22;
        }
      }
      else
      {
        v12 = v10;
        bgAudioElement = *(Class *)((char *)&self->super.super.super.super.isa + v11);
        *(Class *)((char *)&self->super.super.super.super.isa + v11) = v12;
      }

LABEL_21:
      ++v9;
    }
    while (v6 != v9);
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v6);
LABEL_25:

  -[UIView removeFromSuperview](self->_overlayView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_overlayView, v7);
  if (v7)
  {
    -[_TVListTemplateController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v7);

    -[_TVListTemplateController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    objc_msgSend(v7, "setFrame:");

  }
}

- (void)_configureWithListElement:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  _TVListTemplateController *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_listElement, a3);
  if (!self->_bgImageElement)
  {
    v22 = self;
    v23 = v5;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v5, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v12, "tv_elementType") == 43)
          {
            v26 = 0u;
            v27 = 0u;
            v24 = 0u;
            v25 = 0u;
            objc_msgSend(v12, "children");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "firstObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "children");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v25;
              while (2)
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v25 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
                  if (objc_msgSend(v20, "tv_elementType") == 16 && objc_msgSend(v20, "tv_imageType") == 3)
                  {
                    v21 = v20;

                    v9 = v21;
                    goto LABEL_19;
                  }
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
                if (v17)
                  continue;
                break;
              }
            }
LABEL_19:

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    if (!v22->_heroImageElement)
      objc_storeStrong((id *)&v22->_heroImageElement, v9);

    v5 = v23;
  }

}

- (CGSize)_backgroundImageProxySize
{
  IKImageElement *bgImageElement;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  bgImageElement = self->_bgImageElement;
  if (bgImageElement || (bgImageElement = self->_heroImageElement) != 0)
  {
    -[IKImageElement tv_imageScaleToSize](bgImageElement, "tv_imageScaleToSize");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_TVListTemplateController;
    -[_TVBgImageLoadingViewController _backgroundImageProxySize](&v5, sel__backgroundImageProxySize);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_backgroundImageProxy
{
  void *v3;
  uint64_t v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  _TVUberBlurImageDecorator *v17;
  void *v18;
  void *v19;
  void *v20;
  IKImageElement *heroImageElement;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_graphicsQuality");

  if (v4 == 10)
    return 0;
  if (self->_bgImageElement)
  {
    -[IKViewElement appDocument](self->_templateElement, "appDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tv_adjustedWindowSize");
    v8 = v7;
    v10 = v9;

    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setImageSize:", v8, v10);
    v12 = +[TVImageLayout layoutWithLayout:element:](TVImageLayout, "layoutWithLayout:element:", v11, self->_bgImageElement);
    -[IKImageElement tv_imageProxyWithLayout:](self->_bgImageElement, "tv_imageProxyWithLayout:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKImageElement style](self->_bgImageElement, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tv_imageTreatment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("blur"));

    if (v16)
    {
      v17 = objc_alloc_init(_TVUberBlurImageDecorator);
      -[IKImageElement style](self->_bgImageElement, "style");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "tv_tintColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "color");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVUberBlurImageDecorator setGradientColor:](v17, "setGradientColor:", v20);

      -[_TVUberBlurImageDecorator setBlurType:](v17, "setBlurType:", 2);
      objc_msgSend(v13, "setDecorator:", v17);

    }
  }
  else
  {
    heroImageElement = self->_heroImageElement;
    if (!heroImageElement)
      return 0;
    -[IKImageElement tv_imageProxy](heroImageElement, "tv_imageProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return !self->_bgImageElement && self->_heroImageElement != 0;
}

- (int64_t)_blurEffectStyle
{
  if (+[TVMLUtilities interfaceStyleForTemplateElement:](TVMLUtilities, "interfaceStyleForTemplateElement:", self->_templateElement) == 1)return 4000;
  else
    return 4005;
}

- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  -[_TVListTemplateController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v5, "bgImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v12);
      objc_msgSend(v5, "setBgImageView:", v7);
      -[IKImageElement style](self->_bgImageElement, "style");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tv_imageTreatment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("blurOverlay"));

      if (v10)
      {
        -[IKImageElement style](self->_bgImageElement, "style");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "tv_padding");
        objc_msgSend(v5, "setOverlayBlurOffset:");

      }
    }
  }

}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[IKViewElement appDocument](self->_templateElement, "appDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVListTemplateController listViewController](self, "listViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tv_impressionableElementsForDocument:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

    -[_TVListTemplateController _listTemplateView](self, "_listTemplateView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tv_impressionableElementsForDocument:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v11);

    -[_TVListTemplateController previewViewController](self, "previewViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tv_impressionableElementsForDocument:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v13);

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (UIViewController)focusedController
{
  return self->_focusedController;
}

- (void)setFocusedController:(id)a3
{
  objc_storeStrong((id *)&self->_focusedController, a3);
}

- (_TVListViewController)listViewController
{
  return self->_listViewController;
}

- (void)setListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_listViewController, a3);
}

- (UIViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_previewViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_storeStrong((id *)&self->_listViewController, 0);
  objc_storeStrong((id *)&self->_focusedController, 0);
  objc_storeStrong((id *)&self->_disabledTemplateFocusCaptureView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_heroImageElement, 0);
  objc_storeStrong((id *)&self->_bgAudioElement, 0);
  objc_storeStrong((id *)&self->_bgImageElement, 0);
  objc_storeStrong((id *)&self->_bannerElement, 0);
  objc_storeStrong((id *)&self->_listElement, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
}

@end
