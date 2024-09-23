@implementation PKOpenURLModallyHyperlinkAction

void __PKOpenURLModallyHyperlinkAction_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  PKRemoteDocumentationViewController *v6;
  PKNavigationController *v7;
  id WeakRetained;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Opening URL modally: %@", (uint8_t *)&v9, 0xCu);

  }
  v6 = -[PKRemoteDocumentationViewController initWithContext:URL:]([PKRemoteDocumentationViewController alloc], "initWithContext:URL:", *(_QWORD *)(a1 + 40), v3);
  v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v6);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentModalViewController:withPaymentSetupContext:", v7, *(_QWORD *)(a1 + 40));

}

@end
