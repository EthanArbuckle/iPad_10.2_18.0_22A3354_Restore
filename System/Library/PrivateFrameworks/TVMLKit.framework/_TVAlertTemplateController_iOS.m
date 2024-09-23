@implementation _TVAlertTemplateController_iOS

- (void)updateWithTemplateElement:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  void *v20;
  int v21;
  void *v22;
  NSString *v23;
  NSString *title;
  void *v25;
  int v26;
  void *v27;
  NSString *v28;
  NSString *v29;
  NSString *message;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  NSArray *v37;
  NSArray *buttonElements;
  NSMutableArray *v39;
  NSMutableArray *additionalLabels;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v41 = v4;
  objc_msgSend(v4, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v49;
    v10 = 0x255777000uLL;
    v42 = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (objc_msgSend(v12, "tv_elementType") == 16)
        {
          objc_msgSend(v12, "tv_imageProxy");
          v13 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v14 = *(int *)(v10 + 2116);
          v15 = *(Class *)((char *)&self->super.super.super.isa + v14);
          *(Class *)((char *)&self->super.super.super.isa + v14) = v13;

          objc_msgSend(v12, "width");
          v17 = v16;
          objc_msgSend(v12, "height");
          v19 = fmin(v18, 112.0);
          self->_imageSize.width = round(v17 * (v19 / v18));
          self->_imageSize.height = v19;
          continue;
        }
        if (objc_msgSend(v12, "tv_elementType") == 55)
        {
          objc_msgSend(v12, "elementName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("title"));

          if (v21)
          {
            objc_msgSend(v12, "text");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "string");
            v23 = (NSString *)objc_claimAutoreleasedReturnValue();
            title = self->_title;
            self->_title = v23;

            continue;
          }
          objc_msgSend(v12, "elementName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("description"));

          objc_msgSend(v12, "text");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "string");
          v28 = (NSString *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v26)
          {
            message = self->_message;
            self->_message = v28;

          }
          else
          {
            objc_msgSend(v43, "addObject:", v28);

          }
          goto LABEL_28;
        }
        if (objc_msgSend(v12, "tv_elementType") == 6)
        {
          objc_msgSend(v5, "addObject:", v12);
          continue;
        }
        if (objc_msgSend(v12, "tv_elementType") == 44)
        {
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          objc_msgSend(v12, "children");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v45 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
                if (objc_msgSend(v36, "tv_elementType") == 6)
                  objc_msgSend(v5, "addObject:", v36);
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            }
            while (v33);
          }

          v6 = v42;
LABEL_28:
          v10 = 0x255777000;
          continue;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v8);
  }

  v37 = (NSArray *)objc_msgSend(v5, "copy");
  buttonElements = self->_buttonElements;
  self->_buttonElements = v37;

  v39 = (NSMutableArray *)objc_msgSend(v43, "copy");
  additionalLabels = self->_additionalLabels;
  self->_additionalLabels = v39;

  if (self->_alertController)
    -[_TVAlertTemplateController_iOS _presentAlertController](self, "_presentAlertController");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVAlertTemplateController_iOS;
  -[_TVAlertTemplateController_iOS viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[_TVAlertTemplateController_iOS _presentAlertController](self, "_presentAlertController");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_TVAlertTemplateController_iOS;
  -[_TVAlertTemplateController_iOS viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[_TVAlertTemplateController_iOS _dismissAlertControllerAnimated:](self, "_dismissAlertControllerAnimated:", v3);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setOpaque:", 0);

}

- (void)_dismissAlertControllerAnimated:(BOOL)a3
{
  UIAlertController *alertController;
  _BOOL8 v5;
  void *v6;
  UIAlertController *v7;

  alertController = self->_alertController;
  if (alertController)
  {
    v5 = a3;
    -[UIAlertController presentingViewController](alertController, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", v5, 0);

    v7 = self->_alertController;
    self->_alertController = 0;

  }
}

- (void)_presentAlertController
{
  id *p_alertController;
  uint64_t v4;
  id v5;
  _TVAlertView *v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIAlertController *alertController;
  NSArray *obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  id location;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  p_alertController = (id *)&self->_alertController;
  alertController = self->_alertController;
  -[_TVAlertTemplateController_iOS _dismissAlertControllerAnimated:](self, "_dismissAlertControllerAnimated:", alertController == 0);
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *p_alertController;
  *p_alertController = (id)v4;

  v6 = objc_alloc_init(_TVAlertView);
  -[_TVAlertView setImageProxy:](v6, "setImageProxy:", self->_imageProxy);
  -[_TVAlertView setImageSize:](v6, "setImageSize:", self->_imageSize.width, self->_imageSize.height);
  -[_TVAlertView setTitle:](v6, "setTitle:", self->_title);
  -[_TVAlertView setAdditionalLabels:](v6, "setAdditionalLabels:", self->_additionalLabels);
  -[_TVAlertView sizeThatFits:](v6, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v8 = v7;
  -[_TVAlertView setFrame:](v6, "setFrame:", 0.0, 0.0, 270.0, v7);
  v9 = objc_alloc_init(MEMORY[0x24BDF6F98]);
  objc_msgSend(v9, "setPreferredContentSize:", 270.0, v8);
  objc_msgSend(v9, "setView:", v6);
  v23 = v9;
  objc_msgSend(*p_alertController, "setContentViewController:", v9);
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  v36 = 0u;
  obj = self->_buttonElements;
  v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v37;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v37 != v26)
        {
          v11 = v10;
          objc_enumerationMutation(obj);
          v10 = v11;
        }
        v28 = v10;
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v12, "children");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v33 != v15)
                objc_enumerationMutation(v13);
              v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              if (objc_msgSend(v17, "elementType") == 55)
              {
                v18 = v17;
                objc_msgSend(v18, "text");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "string");
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                objc_initWeak(&location, self->_alertController);
                v21 = (void *)MEMORY[0x24BDF67E8];
                v29[0] = MEMORY[0x24BDAC760];
                v29[1] = 3221225472;
                v29[2] = __57___TVAlertTemplateController_iOS__presentAlertController__block_invoke;
                v29[3] = &unk_24EB85D88;
                objc_copyWeak(&v30, &location);
                v29[4] = v12;
                objc_msgSend(v21, "actionWithTitle:style:handler:", v20, 0, v29);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIAlertController addAction:](self->_alertController, "addAction:", v22);

                objc_destroyWeak(&v30);
                objc_destroyWeak(&location);

              }
            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v14);
        }

        v10 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v27);
  }

  -[_TVAlertTemplateController_iOS presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_alertController, alertController == 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_buttonElements, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_additionalLabels, 0);
}

@end
