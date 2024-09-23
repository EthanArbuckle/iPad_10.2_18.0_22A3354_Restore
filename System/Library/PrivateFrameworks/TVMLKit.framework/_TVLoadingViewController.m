@implementation _TVLoadingViewController

- (_TVLoadingViewController)init
{
  _TVLoadingViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVLoadingViewController;
  result = -[_TVLoadingViewController init](&v3, sel_init);
  if (result)
    result->_spinnerDelay = 0.0;
  return result;
}

- (void)updateWithViewElement:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  IKImageElement **p_bgImageElement;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *k;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v55.receiver = self;
  v55.super_class = (Class)_TVLoadingViewController;
  -[_TVBgImageLoadingViewController updateWithViewElement:](&v55, sel_updateWithViewElement_, v5);
  objc_storeStrong((id *)&self->_loadingTemplateElement, a3);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v34 = v5;
  objc_msgSend(v5, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_41;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v52;
  v36 = *(_QWORD *)v52;
  do
  {
    v10 = 0;
    v37 = v7;
    do
    {
      if (*(_QWORD *)v52 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v10);
      v12 = objc_msgSend(v11, "tv_elementType");
      switch(v12)
      {
        case 12:
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v11, "children");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
          if (!v21)
            break;
          v22 = v21;
          v23 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v44 != v23)
                objc_enumerationMutation(v14);
              v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              if (objc_msgSend(v25, "tv_elementType") == 16 && objc_msgSend(v25, "tv_imageType") == 3)
                objc_storeStrong((id *)&self->_heroImgElement, v25);
            }
            v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
          }
          while (v22);
LABEL_35:
          v9 = v36;
          v7 = v37;
          break;
        case 4:
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          objc_msgSend(v11, "children");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
          if (v15)
          {
            v16 = v15;
            v35 = v8;
            v17 = *(_QWORD *)v48;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v48 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
                p_bgImageElement = &self->_bgImageElement;
                if (self->_bgImageElement
                  || objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "tv_elementType") != 16
                  || objc_msgSend(v19, "tv_imageType"))
                {
                  p_bgImageElement = &self->_heroImgElement;
                  if (self->_heroImgElement
                    || objc_msgSend(v19, "tv_elementType") != 16
                    || objc_msgSend(v19, "tv_imageType") != 3)
                  {
                    continue;
                  }
                }
                objc_storeStrong((id *)p_bgImageElement, v19);
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
            }
            while (v16);
            v8 = v35;
            goto LABEL_35;
          }
          break;
        case 1:
          v13 = v11;
          v14 = v8;
          v8 = v13;
          break;
        default:
          goto LABEL_37;
      }

LABEL_37:
      ++v10;
    }
    while (v10 != v7);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  }
  while (v7);
LABEL_41:

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v8, "children");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v40;
    while (2)
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v26);
        v30 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)k);
        if (objc_msgSend(v30, "tv_elementType") == 55)
        {
          v27 = v30;
          goto LABEL_51;
        }
      }
      v27 = (id)objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
      if (v27)
        continue;
      break;
    }
  }
LABEL_51:

  -[_TVLoadingViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_viewFromElement:existingView:", v27, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVLoadingViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setLoadingTitleLabel:", v32);

}

- (id)_backgroundImageProxy
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  IKImageElement *heroImgElement;

  if (self->_bgImageElement)
  {
    -[IKViewElement appDocument](self->_loadingTemplateElement, "appDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tv_adjustedWindowSize");
    v5 = v4;
    v7 = v6;

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setImageSize:", v5, v7);
    v9 = +[TVImageLayout layoutWithLayout:element:](TVImageLayout, "layoutWithLayout:element:", v8, self->_bgImageElement);
    -[IKImageElement tv_imageProxyWithLayout:](self->_bgImageElement, "tv_imageProxyWithLayout:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    heroImgElement = self->_heroImgElement;
    if (heroImgElement)
    {
      -[IKImageElement tv_imageProxy](heroImgElement, "tv_imageProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  return v10;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return !self->_bgImageElement && self->_heroImgElement != 0;
}

- (int64_t)_blurEffectStyle
{
  if (+[TVMLUtilities interfaceStyleForTemplateElement:](TVMLUtilities, "interfaceStyleForTemplateElement:", self->_loadingTemplateElement) == 1)return 4000;
  else
    return 4005;
}

- (CGSize)_backgroundImageProxySize
{
  IKImageElement *bgImageElement;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  bgImageElement = self->_bgImageElement;
  if (bgImageElement || (bgImageElement = self->_heroImgElement) != 0)
  {
    -[IKImageElement tv_imageScaleToSize](bgImageElement, "tv_imageScaleToSize");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_TVLoadingViewController;
    -[_TVBgImageLoadingViewController _backgroundImageProxySize](&v5, sel__backgroundImageProxySize);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[_TVLoadingViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (void)loadView
{
  _TVLoadingView *v3;
  void *v4;
  _TVLoadingView *v5;

  v3 = [_TVLoadingView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[_TVLoadingView initWithFrame:](v3, "initWithFrame:");

  -[_TVLoadingView setAutoresizingMask:](v5, "setAutoresizingMask:", 45);
  -[_TVLoadingViewController setView:](self, "setView:", v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVLoadingViewController;
  -[_TVBgImageLoadingViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[_TVLoadingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSelector:withObject:afterDelay:", sel__showSpinner, 0, self->_spinnerDelay);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  CGAffineTransform v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_TVLoadingViewController;
  -[_TVBgImageLoadingViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  -[_TVLoadingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadingTitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  objc_msgSend(v4, "loadingTitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v11, 0.85, 0.85);
  objc_msgSend(v6, "setTransform:", &v11);

  v7 = (void *)MEMORY[0x24BDF6F90];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43___TVLoadingViewController_viewWillAppear___block_invoke;
  v9[3] = &unk_24EB85440;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "animateWithDuration:animations:completion:", v9, 0, 0.4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TVLoadingViewController;
  -[_TVLoadingViewController viewWillDisappear:](&v9, sel_viewWillDisappear_, a3);
  -[_TVLoadingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDF6F90];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46___TVLoadingViewController_viewWillDisappear___block_invoke;
  v7[3] = &unk_24EB85440;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "animateWithDuration:animations:completion:", v7, 0, 0.4);

}

- (void)setSpinnerDelay:(double)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  self->_spinnerDelay = a3;
  -[_TVLoadingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spinnerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v7 = v6;

  if (v7 < 1.0)
  {
    v8 = (void *)MEMORY[0x24BEDCDF0];
    -[_TVLoadingViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelPreviousPerformRequestsWithTarget:selector:object:", v9, sel__showSpinner, 0);

    -[_TVLoadingViewController view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performSelector:withObject:afterDelay:", sel__showSpinner, 0, self->_spinnerDelay);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingTemplateElement, 0);
  objc_storeStrong((id *)&self->_heroImgElement, 0);
  objc_storeStrong((id *)&self->_bgImageElement, 0);
}

@end
