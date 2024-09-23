@implementation UIAlertView

void __54__UIAlertView_KNAdditions__showWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setCompletionHandler:", 0);

}

@end
