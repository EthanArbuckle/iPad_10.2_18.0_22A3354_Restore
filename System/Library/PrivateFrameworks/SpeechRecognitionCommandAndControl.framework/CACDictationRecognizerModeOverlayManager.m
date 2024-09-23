@implementation CACDictationRecognizerModeOverlayManager

- (void)showOverlayForDictiationRecognizerMode
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __82__CACDictationRecognizerModeOverlayManager_showOverlayForDictiationRecognizerMode__block_invoke_2;
  v2[3] = &unk_24F2AB088;
  v2[4] = self;
  -[CACSimpleContentViewManager showViewControllerWithCreationHandler:updateHandler:](self, "showViewControllerWithCreationHandler:updateHandler:", &__block_literal_global_1, v2);
}

CACDictationRecognizerModeOverlayViewController *__82__CACDictationRecognizerModeOverlayManager_showOverlayForDictiationRecognizerMode__block_invoke()
{
  return objc_alloc_init(CACDictationRecognizerModeOverlayViewController);
}

void __82__CACDictationRecognizerModeOverlayManager_showOverlayForDictiationRecognizerMode__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDictationRecognizerMode:", objc_msgSend(v5, "modeForDictationRecognizerModeOverlayManager:", *(_QWORD *)(a1 + 32)));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageRectForDictationRecognizerModeOverlayManager:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setImageRect:");

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[CACSimpleContentViewManager setContentViewManagerDelegate:](self, "setContentViewManagerDelegate:", obj);
  }

}

- (BOOL)isOverlay
{
  return 1;
}

- (CACDictationRecognizerModeOverlayManagerDelegate)delegate
{
  return (CACDictationRecognizerModeOverlayManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
