@implementation PKPaymentAuthorizationDefaultService

- (void)authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:(id)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v4);

}

- (void)authorizationDidAuthorizeContextCompleteWithResult:(id)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v4);

}

- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v4);

}

- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v4);

}

- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v4);

}

- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v4);

}

- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v4);

}

- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v4);

}

- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v4);

}

- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v4);

}

- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4
{
  id v5;

  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v5);

}

- (void)handleDismissWithCompletion:(id)a3
{
  PKPaymentAuthorizationPresenter **p_presenter;
  id v4;
  id WeakRetained;

  p_presenter = &self->_presenter;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_presenter);
  objc_msgSend(WeakRetained, "dismissWithReason:error:completion:", 2, 0, v4);

}

- (void)fulfillRemotePaymentRequestPromise:(id)a3 completion:(id)a4
{
  id v5;

  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v5);

}

- (void)rejectRemotePaymentRequestPromiseWithFailure:(unint64_t)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v4);

}

- (void)handleHostApplicationDidBecomeActive
{
  id v3;

  NSStringFromSelector(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v3);

}

- (void)handleHostApplicationWillResignActive:(BOOL)a3
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationDefaultService hostCallDidGoUnhandledForMethod:](self, "hostCallDidGoUnhandledForMethod:", v4);

}

- (void)hostCallDidGoUnhandledForMethod:(id)a3
{
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = a3;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%@ was called, but no service is present to handle the call.", (uint8_t *)&v5, 0xCu);
  }

}

- (PKPaymentAuthorizationPresenter)presenter
{
  return (PKPaymentAuthorizationPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
}

@end
