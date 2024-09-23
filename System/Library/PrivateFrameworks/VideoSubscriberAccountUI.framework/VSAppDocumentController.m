@implementation VSAppDocumentController

- (VSAppDocumentController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSAppDocumentController)initWithAppDocument:(id)a3
{
  id v5;
  VSAppDocumentController *v6;
  VSAppDocumentController *v7;
  uint64_t v8;
  IKViewElement *templateElement;
  id v10;
  _BOOL4 v11;
  id v12;
  id v13;
  VSViewModel *viewModel;
  id v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VSAppDocumentController;
  v6 = -[VSAppDocumentController init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appDocument, a3);
    -[IKAppDocument setDelegate:](v7->_appDocument, "setDelegate:", v7);
    -[IKAppDocument templateElement](v7->_appDocument, "templateElement");
    v8 = objc_claimAutoreleasedReturnValue();
    templateElement = v7->_templateElement;
    v7->_templateElement = (IKViewElement *)v8;

    v10 = -[VSAppDocumentController _newViewModel](v7, "_newViewModel");
    objc_storeStrong((id *)&v7->_viewModel, v10);
    v16 = 0;
    v11 = -[VSAppDocumentController _updateViewModel:error:](v7, "_updateViewModel:error:", v10, &v16);
    v12 = v16;
    v13 = v16;
    if (v11)
    {
      -[VSAppDocumentController _startObservingViewModel:](v7, "_startObservingViewModel:", v10);
    }
    else
    {
      viewModel = v7->_viewModel;
      v7->_viewModel = 0;

      objc_storeStrong((id *)&v7->_viewModelError, v12);
    }

  }
  return v7;
}

- (void)dealloc
{
  VSViewModel *v3;
  objc_super v4;

  -[IKAppDocument setDelegate:](self->_appDocument, "setDelegate:", 0);
  v3 = self->_viewModel;
  if (v3)
    -[VSAppDocumentController _stopObservingViewModel:](self, "_stopObservingViewModel:", v3);

  v4.receiver = self;
  v4.super_class = (Class)VSAppDocumentController;
  -[VSAppDocumentController dealloc](&v4, sel_dealloc);
}

- (void)documentNeedsUpdate:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Document needs update: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)documentDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Document did update: %@", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x24BDF8C38];
  -[VSAppDocumentController viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "optionalWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "forceUnwrapObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = -[VSAppDocumentController _updateViewModel:error:](self, "_updateViewModel:error:", v9, &v14);
  v11 = v14;
  v12 = v11;
  if (v10)
  {
    -[VSAppDocumentController _notiftyDidUpdateViewModel:](self, "_notiftyDidUpdateViewModel:", v9);
  }
  else
  {
    if (!v11)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The errorOrNil parameter must not be nil."));
    v13 = v12;
    -[VSAppDocumentController _stopObservingViewModel:](self, "_stopObservingViewModel:", v9);
    -[VSAppDocumentController setViewModel:](self, "setViewModel:", 0);
    -[VSAppDocumentController setViewModelError:](self, "setViewModelError:", v13);
    -[VSAppDocumentController _notiftyDidFailToUpdateViewModelWithError:](self, "_notiftyDidFailToUpdateViewModelWithError:", v13);

  }
}

- (BOOL)document:(id)a3 evaluateStyleMediaQuery:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDF6D38];
  v5 = a4;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  objc_msgSend(v5, "featureValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("min-pixel-ratio"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  return v8 == (double)v11;
}

- (id)_newViewModel
{
  return objc_alloc_init(VSViewModel);
}

- (BOOL)_updateViewModel:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  _QWORD v47[2];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[VSAppDocumentController templateElement](self, "templateElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v12, "vs_elementType") == 156)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v9);
  }

  if ((unint64_t)objc_msgSend(v5, "count") < 3)
  {
    -[VSAppDocumentController setFilteredButtonLockupElements:](self, "setFilteredButtonLockupElements:", v5);
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v5);
    v14 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v13, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v15;
    objc_msgSend(v13, "objectAtIndex:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v14, "initWithArray:", v17);

    v35 = (void *)v18;
    objc_msgSend(v13, "removeObjectsInArray:", v18);
    VSErrorLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[VSAppDocumentController _updateViewModel:error:].cold.1(v13, v19);

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v20 = v13;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      v24 = *MEMORY[0x24BDBCAB8];
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          if (objc_msgSend(v26, "vs_elementType") == 138)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v27 = (void *)MEMORY[0x24BDBCE88];
              v28 = (objc_class *)objc_opt_class();
              NSStringFromClass(v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "raise:format:", v24, CFSTR("Unexpectedly, extraButton was %@, instead of IKTextElement."), v29);

            }
            v30 = v26;
            objc_msgSend(v30, "text");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "string");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            VSErrorLogObject();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v45 = v32;
              _os_log_error_impl(&dword_2303C5000, v33, OS_LOG_TYPE_ERROR, "Attempted to add extra button with text: %@", buf, 0xCu);
            }

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v22);
    }

    -[VSAppDocumentController setFilteredButtonLockupElements:](self, "setFilteredButtonLockupElements:", v35);
  }

  return 1;
}

- (id)_getSupportedButtonTextsforTemplate:(id)a3 andElementKeys:(id)a4 supportedCount:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  VSAppDocumentController *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v7 = a4;
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[VSAppDocumentController filteredButtonLockupElements](self, "filteredButtonLockupElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[VSAppDocumentController filteredButtonLockupElements](self, "filteredButtonLockupElements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = 0;
      v36 = *MEMORY[0x24BDBCAB8];
      v32 = self;
      do
      {
        -[VSAppDocumentController filteredButtonLockupElements](self, "filteredButtonLockupElements", v32);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v38 = v12;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v33 = v14;
          objc_msgSend(v14, "vs_itemElementsOfType:", 138);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v16)
          {
            v17 = v16;
            v18 = 0;
            v19 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v40 != v19)
                  objc_enumerationMutation(v15);
                if (v18)
                {
                  v18 = 1;
                }
                else
                {
                  v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                  objc_msgSend(v21, "elementName");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v22 && objc_msgSend(v7, "containsObject:", v22))
                  {
                    if (!v21)
                      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v36, CFSTR("The textElement parameter must not be nil."));
                    v23 = v21;
                    objc_msgSend(v23, "text");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "string");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v25)
                    {
                      if (v38 >= a5)
                      {
                        VSErrorLogObject();
                        v27 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          v44 = v34;
                          v45 = 2112;
                          v46 = v25;
                          _os_log_error_impl(&dword_2303C5000, v27, OS_LOG_TYPE_ERROR, "Tried to add invalid extra button to %@ Template with text: %@", buf, 0x16u);
                        }
                      }
                      else
                      {
                        VSDefaultLogObject();
                        v26 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v44 = v34;
                          v45 = 2112;
                          v46 = v25;
                          _os_log_impl(&dword_2303C5000, v26, OS_LOG_TYPE_DEFAULT, "Setting %@ Template button with text: %@", buf, 0x16u);
                        }

                        v27 = objc_msgSend(v25, "copy");
                        objc_msgSend(v35, "addObject:", v27);
                      }

                      v18 = v38 < a5;
                    }
                    else
                    {
                      v18 = 0;
                    }

                  }
                  else
                  {
                    v18 = 0;
                  }

                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v17);
          }

          self = v32;
          v14 = v33;
          v12 = v38;
        }

        ++v12;
        -[VSAppDocumentController filteredButtonLockupElements](self, "filteredButtonLockupElements");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

      }
      while (v12 < v29);
    }
  }
  else
  {
    VSErrorLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[VSAppDocumentController _getSupportedButtonTextsforTemplate:andElementKeys:supportedCount:].cold.1((uint64_t)v34, v30);

  }
  return v35;
}

- (void)_startObservingViewModel:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = kVSKeyValueObservingContext_ViewModelViewState;
  v5 = a3;
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("viewState"), 3, v4);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("userInterfaceStyle"), 1, kVSKeyValueObservingContext_ViewModelUserInterfaceStyle);

}

- (void)_stopObservingViewModel:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = kVSKeyValueObservingContext_ViewModelViewState;
  v5 = a3;
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewState"), v4);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("userInterfaceStyle"), kVSKeyValueObservingContext_ViewModelUserInterfaceStyle);

}

- (id)_imageItemProviderWithImageElement:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a3, "vs_url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDD15F0]);
    v5 = (void *)objc_msgSend(v4, "initWithItem:typeIdentifier:", v3, *MEMORY[0x24BDC17A0]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  objc_super v26;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if ((void *)kVSKeyValueObservingContext_ViewModelViewState == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    switch(v15)
    {
      case 1:
        VSDefaultLogObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2303C5000, v16, OS_LOG_TYPE_DEFAULT, "Will call onLoad()", buf, 2u);
        }

        -[VSAppDocumentController appDocument](self, "appDocument");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "onLoad");

        VSDefaultLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        *(_WORD *)buf = 0;
        v19 = "Did call onLoad()";
        break;
      case 2:
        VSDefaultLogObject();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2303C5000, v20, OS_LOG_TYPE_DEFAULT, "Will call onAppear()", buf, 2u);
        }

        -[VSAppDocumentController appDocument](self, "appDocument");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "onAppear");

        VSDefaultLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        *(_WORD *)buf = 0;
        v19 = "Did call onAppear()";
        break;
      case 4:
        VSDefaultLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2303C5000, v22, OS_LOG_TYPE_DEFAULT, "Will call onDisappear()", buf, 2u);
        }

        -[VSAppDocumentController appDocument](self, "appDocument");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "onDisappear");

        VSDefaultLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        *(_WORD *)buf = 0;
        v19 = "Did call onDisappear()";
        break;
      case 6:
        VSDefaultLogObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2303C5000, v24, OS_LOG_TYPE_DEFAULT, "Will call onUnload()", buf, 2u);
        }

        -[VSAppDocumentController appDocument](self, "appDocument");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "onUnload");

        VSDefaultLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        *(_WORD *)buf = 0;
        v19 = "Did call onUnload()";
        break;
      default:
        goto LABEL_24;
    }
    _os_log_impl(&dword_2303C5000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
LABEL_23:

  }
  else if ((void *)kVSKeyValueObservingContext_ViewModelUserInterfaceStyle == a6)
  {
    -[VSAppDocumentController userInterfaceStyleDidUpdate](self, "userInterfaceStyleDidUpdate");
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)VSAppDocumentController;
    -[VSAppDocumentController observeValueForKeyPath:ofObject:change:context:](&v26, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
LABEL_24:

}

- (void)_notiftyDidUpdateViewModel:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VSAppDocumentController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "appDocumentController:didUpdateViewModel:", self, v5);

}

- (void)_notiftyDidFailToUpdateViewModelWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VSAppDocumentController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "appDocumentController:didFailToUpdateViewModelWithError:", self, v5);

}

- (void)_notifyDidUpdateLogoViewModel:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VSAppDocumentController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "appDocumentController:didUpdateLogoViewModel:", self, v5);

}

- (void)userInterfaceStyleDidUpdate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[VSAppDocumentController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VSAppDocumentController viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self viewModel] parameter must not be nil."));
    -[VSAppDocumentController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_255E8E790))
    {
      v6 = v5;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[VSAppDocumentController templateElement](self, "templateElement");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "children");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (objc_msgSend(v13, "vs_elementType") == 49)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v14 = (void *)MEMORY[0x24BDBCE88];
                v15 = *MEMORY[0x24BDBCAB8];
                v16 = (objc_class *)objc_opt_class();
                NSStringFromClass(v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "raise:format:", v15, CFSTR("Unexpectedly, childElement was %@, instead of IKImageElement."), v17);

              }
              -[VSAppDocumentController _imageItemProviderWithImageElement:](self, "_imageItemProviderWithImageElement:", v13);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setLogoProvider:", v18);
              -[VSAppDocumentController _notifyDidUpdateLogoViewModel:](self, "_notifyDidUpdateLogoViewModel:", v6);

              goto LABEL_17;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_17:

    }
  }

}

- (IKAppDocument)appDocument
{
  return self->_appDocument;
}

- (void)setAppDocument:(id)a3
{
  objc_storeStrong((id *)&self->_appDocument, a3);
}

- (NSArray)filteredButtonLockupElements
{
  return self->_filteredButtonLockupElements;
}

- (void)setFilteredButtonLockupElements:(id)a3
{
  objc_storeStrong((id *)&self->_filteredButtonLockupElements, a3);
}

- (VSAppDocumentControllerDelegate)delegate
{
  return (VSAppDocumentControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (NSError)viewModelError
{
  return self->_viewModelError;
}

- (void)setViewModelError:(id)a3
{
  objc_storeStrong((id *)&self->_viewModelError, a3);
}

- (IKViewElement)templateElement
{
  return self->_templateElement;
}

- (void)setTemplateElement:(id)a3
{
  objc_storeStrong((id *)&self->_templateElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_viewModelError, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_filteredButtonLockupElements, 0);
  objc_storeStrong((id *)&self->_appDocument, 0);
}

- (void)_updateViewModel:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = 2;
  v5 = 2048;
  v6 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Only %ld button lockups are allowed, attempted adding %ld extra button(s).", (uint8_t *)&v3, 0x16u);
}

- (void)_getSupportedButtonTextsforTemplate:(uint64_t)a1 andElementKeys:(NSObject *)a2 supportedCount:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "No button specified for the %@ Template", (uint8_t *)&v2, 0xCu);
}

@end
