@implementation PKStoreProductViewPresenter

- (PKStoreProductViewPresenter)initWithProductDelegate:(id)a3
{
  id v4;
  PKStoreProductViewPresenter *v5;
  PKStoreProductViewPresenter *v6;
  SKStoreProductViewController *v7;
  SKStoreProductViewController *productViewController;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKStoreProductViewPresenter;
  v5 = -[PKStoreProductViewPresenter init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_productDelegate, v4);
    v7 = (SKStoreProductViewController *)objc_alloc_init(MEMORY[0x1E0CD8070]);
    productViewController = v6->_productViewController;
    v6->_productViewController = v7;

    -[SKStoreProductViewController setDelegate:](v6->_productViewController, "setDelegate:", v6);
    if (-[SKStoreProductViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v6->_productViewController, "pkui_userInterfaceIdiomSupportsLargeLayouts"))-[SKStoreProductViewController setModalPresentationStyle:](v6->_productViewController, "setModalPresentationStyle:", 2);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[PKStoreProductViewPresenter setSuppressingFooter:](self, "setSuppressingFooter:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKStoreProductViewPresenter;
  -[PKStoreProductViewPresenter dealloc](&v3, sel_dealloc);
}

- (void)loadProductForItemIdentifier:(id)a3 customProductPageIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  SKStoreProductViewController *productViewController;
  _QWORD v11[4];
  id v12;
  id buf[2];

  v6 = a3;
  v7 = a4;
  if (!self->_productViewController)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKStoreProductViewPresenter: Attempted to load product after previous failure", (uint8_t *)buf, 2u);
    }

  }
  objc_initWeak(buf, self);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CD8110]);
  objc_msgSend(v9, "safelySetObject:forKey:", v7, *MEMORY[0x1E0CD8108]);
  productViewController = self->_productViewController;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__PKStoreProductViewPresenter_loadProductForItemIdentifier_customProductPageIdentifier___block_invoke;
  v11[3] = &unk_1E3E65F18;
  objc_copyWeak(&v12, buf);
  -[SKStoreProductViewController loadProductWithParameters:completionBlock:](productViewController, "loadProductWithParameters:completionBlock:", v9, v11);
  objc_destroyWeak(&v12);

  objc_destroyWeak(buf);
}

void __88__PKStoreProductViewPresenter_loadProductForItemIdentifier_customProductPageIdentifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKStoreProductViewPresenter: Failed to load store sheet: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__PKStoreProductViewPresenter_loadProductForItemIdentifier_customProductPageIdentifier___block_invoke_10;
    block[3] = &unk_1E3E612E8;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __88__PKStoreProductViewPresenter_loadProductForItemIdentifier_customProductPageIdentifier___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(*(id *)(a1 + 32), "setSuppressingFooter:", 0);
  objc_msgSend(v4, "setDelegate:", 0);
  if (objc_msgSend(v4, "isBeingPresented"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  }
  else if ((objc_msgSend(v4, "isBeingDismissed") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "productViewControllerDidFinish:", v4);
  }

}

- (void)presentStoreViewWithBlock:(id)a3
{
  void (**v4)(id, id, _QWORD *);
  SKStoreProductViewController *v5;
  SKStoreProductViewController *v6;
  SKStoreProductViewController *productViewController;
  NSObject *v8;
  _QWORD v9[5];
  SKStoreProductViewController *v10;
  uint8_t buf[16];

  v4 = (void (**)(id, id, _QWORD *))a3;
  v5 = self->_productViewController;
  v6 = v5;
  if (v5)
  {
    objc_setAssociatedObject(v5, &DismisserKey, self, (void *)0x301);
    productViewController = self->_productViewController;
    self->_productViewController = 0;

    -[PKStoreProductViewPresenter setSuppressingFooter:](self, "setSuppressingFooter:", 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PKStoreProductViewPresenter_presentStoreViewWithBlock___block_invoke;
    v9[3] = &unk_1E3E61388;
    v9[4] = self;
    v10 = v6;
    v4[2](v4, v10, v9);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKStoreProductViewPresenter: Ignoring presentation attempt due to prior presentation or product load failure", buf, 2u);
    }

  }
}

uint64_t __57__PKStoreProductViewPresenter_presentStoreViewWithBlock___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 9))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 40), "isBeingDismissed");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(v1 + 32), "productViewControllerDidFinish:", *(_QWORD *)(v1 + 40));
  }
  return result;
}

- (void)setSuppressingFooter:(BOOL)a3
{
  if (self->_suppressingFooter != a3)
  {
    self->_suppressingFooter = a3;
    if (a3)
      +[PKPassGroupsViewController beginSuppressingFooter](PKPassGroupsViewController, "beginSuppressingFooter");
    else
      +[PKPassGroupsViewController endSuppressingFooter](PKPassGroupsViewController, "endSuppressingFooter");
  }
}

- (void)productViewControllerDidFinish:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  SKStoreProductViewController *productViewController;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setDelegate:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_productDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_productDelegate);
    objc_msgSend(v6, "productViewControllerDidFinish:", v8);

  }
  else
  {
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  -[PKStoreProductViewPresenter setSuppressingFooter:](self, "setSuppressingFooter:", 0);
  productViewController = self->_productViewController;
  self->_productViewController = 0;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_productDelegate);
  objc_storeStrong((id *)&self->_productViewController, 0);
}

@end
