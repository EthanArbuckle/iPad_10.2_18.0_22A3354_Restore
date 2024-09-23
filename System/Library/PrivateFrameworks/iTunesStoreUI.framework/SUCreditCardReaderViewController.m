@implementation SUCreditCardReaderViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CRCameraReader *v9;
  CRCameraReader *cameraController;
  CRCameraReader *v11;
  void *v12;
  void *v13;
  void *v14;
  SUCreditCardReaderInfoView *v15;
  SUCreditCardReaderInfoView *v16;
  SUCreditCardReaderInfoView *captureInfoView;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SUCreditCardReaderViewController;
  -[SUCreditCardReaderViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[SUCreditCardReaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed);
  -[SUCreditCardReaderViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__cancelButtonPressed);
  -[SUCreditCardReaderViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  if (objc_msgSend((id)objc_opt_class(), "cameraSupported"))
  {
    v9 = (CRCameraReader *)objc_alloc_init(MEMORY[0x24BE27E40]);
    cameraController = self->cameraController;
    self->cameraController = v9;

    -[CRCameraReader setHidePlacementText:](self->cameraController, "setHidePlacementText:", 1);
    -[CRCameraReader setDelegate:](self->cameraController, "setDelegate:", self);
    v11 = self->cameraController;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *MEMORY[0x24BE27E28], *MEMORY[0x24BE27E18], *MEMORY[0x24BE27E20], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setOutputObjectTypes:](v11, "setOutputObjectTypes:", v12);

    -[SUCreditCardReaderViewController addChildViewController:](self, "addChildViewController:", self->cameraController);
    -[CRCameraReader didMoveToParentViewController:](self->cameraController, "didMoveToParentViewController:", self);
    -[SUCreditCardReaderViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader view](self->cameraController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v14);

  }
  v15 = [SUCreditCardReaderInfoView alloc];
  v16 = -[SUCreditCardReaderInfoView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  captureInfoView = self->captureInfoView;
  self->captureInfoView = v16;

  -[SUCreditCardReaderViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", self->captureInfoView);

  -[SUCreditCardReaderViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bringSubviewToFront:", self->captureInfoView);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUCreditCardReaderViewController;
  -[SUCreditCardReaderViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[CRCameraReader setDelegate:](self->cameraController, "setDelegate:", 0);
  -[CRCameraReader cancel](self->cameraController, "cancel");
  -[CRCameraReader willMoveToParentViewController:](self->cameraController, "willMoveToParentViewController:", 0);
  -[CRCameraReader view](self->cameraController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[CRCameraReader removeFromParentViewController](self->cameraController, "removeFromParentViewController");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SUCreditCardReaderViewController;
  -[SUCreditCardReaderViewController viewDidLayoutSubviews](&v21, sel_viewDidLayoutSubviews);
  -[SUCreditCardReaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v11 * 0.66;
  -[CRCameraReader view](self->cameraController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v12);

  -[SUCreditCardReaderViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[SUCreditCardReaderInfoView setFrame:](self->captureInfoView, "setFrame:", v16, v12, v18, v20 - v12);
}

- (void)didReceiveMemoryWarning
{
  void *v3;
  void *v4;
  CRCameraReader *cameraController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUCreditCardReaderViewController;
  -[SUCreditCardReaderViewController didReceiveMemoryWarning](&v6, sel_didReceiveMemoryWarning);
  if (-[SUCreditCardReaderViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SUCreditCardReaderViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[SUCreditCardReaderViewController setView:](self, "setView:", 0);
      cameraController = self->cameraController;
      self->cameraController = 0;

    }
  }
}

+ (BOOL)cameraSupported
{
  return objc_msgSend(MEMORY[0x24BE27E40], "supportedCameraCount") != 0;
}

- (void)_cancelButtonPressed
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setCancelled:", 1);
  -[SUCreditCardReaderViewController _returnCameraOutput:error:](self, "_returnCameraOutput:error:", v3, 0);

}

- (void)_returnCameraOutput:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  SUCreditCardReaderOutput *pendingOutput;
  uint64_t v16;
  _QWORD block[4];
  id v18;
  id v19;
  _BYTE location[12];
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setError:", v7);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (v10)
    {
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = objc_opt_class();
      v21 = 2114;
      v22 = v7;
      v12 = *(id *)&location[4];
      LODWORD(v16) = 22;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, location, v16);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  objc_initWeak((id *)location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SUCreditCardReaderViewController__returnCameraOutput_error___block_invoke;
  block[3] = &unk_24DE7B5F0;
  objc_copyWeak(&v19, (id *)location);
  v18 = v6;
  v14 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  pendingOutput = self->pendingOutput;
  self->pendingOutput = 0;

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)location);

}

void __62__SUCreditCardReaderViewController__returnCameraOutput_error___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "completionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "completionBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, *(_QWORD *)(a1 + 32));

  }
  v6 = *(void **)(a1 + 32);
  if (!v6
    || (objc_msgSend(v6, "manualEntrySelected") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "cancelled") & 1) != 0)
  {
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    v7 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__SUCreditCardReaderViewController__returnCameraOutput_error___block_invoke_2;
    block[3] = &unk_24DE7B5C8;
    objc_copyWeak(&v9, v2);
    dispatch_after(v7, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v9);
  }

}

void __62__SUCreditCardReaderViewController__returnCameraOutput_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  -[SUCreditCardReaderViewController _returnCameraOutput:error:](self, "_returnCameraOutput:error:", 0, a4);
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  id v4;
  SUCreditCardReaderOutput *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  SUCreditCardReaderOutput *pendingOutput;
  SUCreditCardReaderViewController *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v28 = self;
  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = (SUCreditCardReaderOutput *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v9 = *MEMORY[0x24BE27E28];
    v10 = *MEMORY[0x24BE27E18];
    v11 = *MEMORY[0x24BE27E20];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v13, "type", v28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v9);

        if (v15)
        {
          objc_msgSend(v13, "stringValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCreditCardReaderOutput setCardNumber:](v5, "setCardNumber:", v16);

        }
        objc_msgSend(v13, "type");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqual:", v10);

        if (v18)
        {
          objc_msgSend(v13, "stringValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCreditCardReaderOutput setCardCardholderName:](v5, "setCardCardholderName:", v19);

        }
        objc_msgSend(v13, "type");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqual:", v11);

        if (v21)
        {
          v22 = v13;
          objc_msgSend(v22, "dayValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCreditCardReaderOutput setCardExpirationDay:](v5, "setCardExpirationDay:", v23);

          objc_msgSend(v22, "monthValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCreditCardReaderOutput setCardExpirationMonth:](v5, "setCardExpirationMonth:", v24);

          objc_msgSend(v22, "yearValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCreditCardReaderOutput setCardExpirationYear:](v5, "setCardExpirationYear:", v25);

          objc_msgSend(v22, "stringValue");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCreditCardReaderOutput setCardExpirationStringValue:](v5, "setCardExpirationStringValue:", v26);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

  pendingOutput = v28->pendingOutput;
  v28->pendingOutput = v5;

}

- (void)cameraReaderDidEnd:(id)a3
{
  SUCreditCardReaderOutput *pendingOutput;

  pendingOutput = self->pendingOutput;
  if (pendingOutput)
    -[SUCreditCardReaderViewController _returnCameraOutput:error:](self, "_returnCameraOutput:error:", pendingOutput, 0);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->pendingOutput, 0);
  objc_storeStrong((id *)&self->captureInfoView, 0);
  objc_storeStrong((id *)&self->cameraController, 0);
}

@end
