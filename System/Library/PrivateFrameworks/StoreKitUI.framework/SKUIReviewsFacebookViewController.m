@implementation SKUIReviewsFacebookViewController

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
}

- (void)setFacebookLikeStatus:(id)a3
{
  SKUIFacebookLikeStatus *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIFacebookLikeStatus *v13;
  SKUIFacebookLikeStatus *facebookLikeStatus;

  v4 = (SKUIFacebookLikeStatus *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIReviewsFacebookViewController setFacebookLikeStatus:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_facebookLikeStatus != v4)
  {
    v13 = (SKUIFacebookLikeStatus *)-[SKUIFacebookLikeStatus copy](v4, "copy");
    facebookLikeStatus = self->_facebookLikeStatus;
    self->_facebookLikeStatus = v13;

    -[SKUIReviewsFacebookViewController _reloadFacebookView](self, "_reloadFacebookView");
  }

}

- (void)loadView
{
  OUTLINED_FUNCTION_1();
}

- (void)_toggleLike:(id)a3
{
  id v4;
  _BOOL4 v5;
  BOOL v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id WeakRetained;
  char v13;
  id v14;
  _QWORD aBlock[4];
  id v16;
  BOOL v17;
  id location;

  v4 = a3;
  v5 = -[SKUIFacebookLikeStatus isUserLiked](self->_facebookLikeStatus, "isUserLiked");
  v6 = v5;
  v7 = !v5;
  -[SKUIReviewsFacebookViewController _changeStatusToUserLiked:](self, "_changeStatusToUserLiked:", v7);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__SKUIReviewsFacebookViewController__toggleLike___block_invoke;
  aBlock[3] = &unk_1E73A6108;
  objc_copyWeak(&v16, &location);
  v17 = v7;
  v8 = _Block_copy(aBlock);
  v9 = SKUISocialFramework();
  objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("SLFacebookSession"), v9), "sharedSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIFacebookLikeStatus URL](self->_facebookLikeStatus, "URL");
  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlikeURL:completion:", v11, v8);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "likeURL:completion:", v11, v8);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "reviewsFacebookViewControllerDidChange:", self);

  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __49__SKUIReviewsFacebookViewController__toggleLike___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __49__SKUIReviewsFacebookViewController__toggleLike___block_invoke_2;
    v3[3] = &unk_1E73A60E0;
    objc_copyWeak(&v4, (id *)(a1 + 32));
    v5 = *(_BYTE *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v3);
    objc_destroyWeak(&v4);
  }
}

void __49__SKUIReviewsFacebookViewController__toggleLike___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_changeStatusToUserLiked:", *(_BYTE *)(a1 + 40) == 0);

}

- (void)_changeStatusToUserLiked:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)-[SKUIFacebookLikeStatus copy](self->_facebookLikeStatus, "copy");
  objc_msgSend(v5, "setUserLiked:", v3);
  -[SKUIReviewsFacebookViewController setFacebookLikeStatus:](self, "setFacebookLikeStatus:", v5);

}

- (void)_reloadFacebookView
{
  SKUIReviewsFacebookView *facebookView;
  void *v4;

  facebookView = self->_facebookView;
  -[SKUIFacebookLikeStatus friendNames](self->_facebookLikeStatus, "friendNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewsFacebookView setFriendNames:](facebookView, "setFriendNames:", v4);

  -[SKUIReviewsFacebookView setUserLiked:](self->_facebookView, "setUserLiked:", -[SKUIFacebookLikeStatus isUserLiked](self->_facebookLikeStatus, "isUserLiked"));
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUIReviewsFacebookViewControllerDelegate)delegate
{
  return (SKUIReviewsFacebookViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKUIFacebookLikeStatus)facebookLikeStatus
{
  return self->_facebookLikeStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facebookView, 0);
  objc_storeStrong((id *)&self->_facebookLikeStatus, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)setFacebookLikeStatus:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
