@implementation SSActiveInterfaceOrientationObserver

- (void)_observeActiveInterfaceOrientationChangeToOrientation:(int64_t)a3 withDuration:(double)a4
{
  id v7;

  -[SSActiveInterfaceOrientationObserver delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeInterfaceOrientationObserver:observedChangeToInterfaceOrientation:withDuration:", self, a3, a4);

}

- (SSActiveInterfaceOrientationObserverDelegate)delegate
{
  return (SSActiveInterfaceOrientationObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)beginObserving
{
  void *v3;
  uint64_t v4;

  -[SSActiveInterfaceOrientationObserver _registerForActiveInterfaceOrientationChanges](self, "_registerForActiveInterfaceOrientationChanges");
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activeInterfaceOrientation");

  -[SSActiveInterfaceOrientationObserver _observeActiveInterfaceOrientationChangeToOrientation:withDuration:](self, "_observeActiveInterfaceOrientationChangeToOrientation:withDuration:", v4, 0.0);
}

- (id)_sbUIUserAgent
{
  void (*v2)(void);
  _Unwind_Exception *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (void (*)(void))getSBUIGetUserAgentSymbolLoc_ptr;
  v9 = getSBUIGetUserAgentSymbolLoc_ptr;
  if (!getSBUIGetUserAgentSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getSBUIGetUserAgentSymbolLoc_block_invoke;
    v5[3] = &unk_24D06B990;
    v5[4] = &v6;
    __getSBUIGetUserAgentSymbolLoc_block_invoke((uint64_t)v5);
    v2 = (void (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v4 = (_Unwind_Exception *)-[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:].cold.2();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  v2();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_registerForActiveInterfaceOrientationChanges
{
  void *v3;
  char v4;
  id v5;

  -[SSActiveInterfaceOrientationObserver _sbUIUserAgent](self, "_sbUIUserAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SSActiveInterfaceOrientationObserver _sbUIUserAgent](self, "_sbUIUserAgent");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addActiveInterfaceOrientationObserver:", self);

  }
}

- (void)_unregisterForActiveInterfaceOrientationChanges
{
  void *v3;
  char v4;
  id v5;

  -[SSActiveInterfaceOrientationObserver _sbUIUserAgent](self, "_sbUIUserAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SSActiveInterfaceOrientationObserver _sbUIUserAgent](self, "_sbUIUserAgent");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeActiveInterfaceOrientationObserver:", self);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
