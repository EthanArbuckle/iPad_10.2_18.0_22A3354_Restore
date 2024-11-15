@implementation PKBannerPresentable

- (PKBannerPresentable)init
{

  return 0;
}

void __43__PKBannerPresentable__postWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = v5;
  if (v6)
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_revoke
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_BYTE *)(a1 + 25))
  {
    *(_BYTE *)(a1 + 25) = 1;
    if (!*(_BYTE *)(a1 + 26))
    {
LABEL_11:
      objc_msgSend(*(id *)(a1 + 40), "setPresentable:", 0);
      objc_msgSend(*(id *)(a1 + 40), "revoked");
      -[PKBannerPresentable _finish](a1);
      return;
    }
    *(_BYTE *)(a1 + 26) = 0;
    v2 = -[PKBannerPresentationManager _source](*(_QWORD *)(a1 + 8));
    v3 = *(_QWORD *)(a1 + 16);
    v11 = 0;
    objc_msgSend(v2, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v3, CFSTR("dismiss"), 1, 0, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;

    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        *(_DWORD *)buf = 134217984;
        v13 = a1;
        v8 = "PKBannerPresentable (%p): revoked.";
        v9 = v6;
        v10 = 12;
LABEL_9:
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
    else if (v7)
    {
      *(_DWORD *)buf = 134218242;
      v13 = a1;
      v14 = 2112;
      v15 = v5;
      v8 = "PKBannerPresentable (%p): failed to revoke - %@.";
      v9 = v6;
      v10 = 22;
      goto LABEL_9;
    }

    goto LABEL_11;
  }
}

- (void)_finish
{
  void *v2;
  const void *v3;
  void *v4;
  void (**v5)(id, uint64_t, _QWORD);

  if (a1)
  {
    v2 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    v3 = *(const void **)(a1 + 56);
    if (v3)
    {
      v5 = (void (**)(id, uint64_t, _QWORD))_Block_copy(v3);
      v4 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

      v5[2](v5, a1, *(unsigned __int8 *)(a1 + 24));
    }
  }
}

- (NSString)requesterIdentifier
{
  PKBannerPresentationManager *manager;

  manager = self->_manager;
  if (manager)
    return manager->_requesterIdentifier;
  else
    return (NSString *)0;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (BOOL)isDraggingInteractionEnabled
{
  return 1;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_viewController;
}

- (SBUISystemApertureElement)systemApertureElementViewController
{
  return self->_viewController;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKBannerViewController presentableWillAppearAsBanner:](self->_viewController, "presentableWillAppearAsBanner:", v4);

}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id didStartHandler;
  void (**v5)(void *, PKBannerPresentable *);
  id v6;
  id v7;

  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKBannerViewController presentableDidAppearAsBanner:](self->_viewController, "presentableDidAppearAsBanner:", v7);
  didStartHandler = self->_didStartHandler;
  if (didStartHandler)
  {
    v5 = (void (**)(void *, PKBannerPresentable *))_Block_copy(didStartHandler);
    v6 = self->_didStartHandler;
    self->_didStartHandler = 0;

    v5[2](v5, self);
  }

}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  PKBannerPresentable *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_needsRevoke)
  {
    self->_needsRevoke = 0;
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): implicitly revoked due to disappearance - %@.", (uint8_t *)&v9, 0x16u);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKBannerViewController presentableWillDisappearAsBanner:withReason:](self->_viewController, "presentableWillDisappearAsBanner:withReason:", v6, v7);
  -[PKBannerPresentable _finish]((uint64_t)self);

}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKBannerViewController presentableDidDisappearAsBanner:withReason:](self->_viewController, "presentableDidDisappearAsBanner:withReason:", v7, v6);
  -[PKBannerPresentable _revoke]((uint64_t)self);

}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  PKBannerPresentable *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_needsRevoke)
  {
    self->_needsRevoke = 0;
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKBannerPresentable (%p): implicitly revoked due to appearance failure - %@.", (uint8_t *)&v9, 0x16u);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKBannerViewController presentableWillNotAppearAsBanner:withReason:](self->_viewController, "presentableWillNotAppearAsBanner:withReason:", v6, v7);
  -[PKBannerPresentable _revoke]((uint64_t)self);

}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKBannerViewController userInteractionWillBeginForBannerForPresentable:](self->_viewController, "userInteractionWillBeginForBannerForPresentable:", v4);

}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKBannerViewController userInteractionDidEndForBannerForPresentable:](self->_viewController, "userInteractionDidEndForBannerForPresentable:", v4);

}

- (BNPresentableContext)presentableContext
{
  return (BNPresentableContext *)objc_loadWeakRetained((id *)&self->_presentableContext);
}

- (void)setPresentableContext:(id)a3
{
  objc_storeWeak((id *)&self->_presentableContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentableContext);
  objc_storeStrong(&self->_didFinishHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_factory, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
