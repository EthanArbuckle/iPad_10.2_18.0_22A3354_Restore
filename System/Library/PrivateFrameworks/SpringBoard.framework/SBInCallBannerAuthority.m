@implementation SBInCallBannerAuthority

- (void)mayChangeDecisionForResponsiblePresentable:(id)a3
{
  BNConsideringDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "bannerAuthority:mayChangeDecisionForResponsiblePresentable:", self, v5);

}

- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int64_t v11;

  v6 = a4;
  +[SBInCallBannerPresentableViewController requesterIdentifier](SBInCallBannerPresentableViewController, "requesterIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v8);
  objc_msgSend(v8, "requesterIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v7);

  if (v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = objc_msgSend(v8, "isCallConnected") - 1;
    else
      v11 = -1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  +[SBInCallBannerPresentableViewController requesterIdentifier](SBInCallBannerPresentableViewController, "requesterIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requesterIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", v7) & 1) != 0)
  {
    v9 = -1;
  }
  else
  {
    objc_msgSend(v5, "requesterIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isEqualToString:", v7) << 63 >> 63;

  }
  return v9;
}

- (BNConsideringDelegate)delegate
{
  return (BNConsideringDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
