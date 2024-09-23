@implementation SKUIComposeReviewViewController

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (SKUIComposeReviewViewController)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SKUIComposeReviewViewController *v9;
  SKUIComposeReviewViewController *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;

  v3 = objc_alloc_init(MEMORY[0x1E0DDC230]);
  v4 = (void *)MEMORY[0x1E0DDC208];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gradientWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundGradient:", v6);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WRITE_A_REVIEW"), &stru_1E73A9FB0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v8);

  v18.receiver = self;
  v18.super_class = (Class)SKUIComposeReviewViewController;
  v9 = -[SUNavigationController initWithRootViewController:](&v18, sel_initWithRootViewController_, v3);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeholderViewController, v3);
    v11 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
    objc_msgSend(v11, "setAction:", sel__cancelAction_);
    objc_msgSend(v11, "setTarget:", v10);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E73A9FB0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v13);

    -[SUPlaceholderViewController navigationItem](v10->_placeholderViewController, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeftBarButtonItem:", v11);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    if (v16 == 1)
      -[SKUIComposeReviewViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIComposeReviewFormViewController setDelegate:](self->_formViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIComposeReviewViewController;
  -[SUNavigationController dealloc](&v3, sel_dealloc);
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (SKUIReviewMetadata)editedReviewMetadata
{
  void *v3;
  void *v4;

  -[SKUIComposeReviewFormViewController editedReviewMetadata](self->_formViewController, "editedReviewMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_nickname)
    objc_msgSend(v3, "setNickname:");
  return (SKUIReviewMetadata *)v4;
}

- (void)loadReviewWithURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = v6;
  if (v8)
  {
    -[SKUIComposeReviewViewController _loadReviewWithURL:completionBlock:](self, "_loadReviewWithURL:completionBlock:", v8, v6);
  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (void)setRating:(float)a3
{
  -[SKUIComposeReviewFormViewController setRating:](self->_formViewController, "setRating:");
}

- (void)submitReview
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SKUIPostReviewOperation *v9;
  void *v10;
  SKUIPostReviewOperation *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(id *);
  void *v16;
  id v17;
  id v18[2];
  id from;
  id location;
  _QWORD v21[5];

  v3 = *MEMORY[0x1E0DC4878];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __47__SKUIComposeReviewViewController_submitReview__block_invoke;
  v21[3] = &__block_descriptor_40_e5_v8__0l;
  v21[4] = v3;
  v8 = (void *)objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", v6, v21);

  v9 = [SKUIPostReviewOperation alloc];
  -[SKUIComposeReviewViewController editedReviewMetadata](self, "editedReviewMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SKUIPostReviewOperation initWithReviewMetadata:](v9, "initWithReviewMetadata:", v10);

  objc_initWeak(&location, v11);
  objc_initWeak(&from, self);
  v13 = v7;
  v14 = 3221225472;
  v15 = __47__SKUIComposeReviewViewController_submitReview__block_invoke_2;
  v16 = &unk_1E73A1400;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(v18, &from);
  v18[1] = v8;
  -[SKUIPostReviewOperation setCompletionBlock:](v11, "setCompletionBlock:", &v13);
  objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v11);

  objc_destroyWeak(v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __47__SKUIComposeReviewViewController_submitReview__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(a1 + 32));

}

void __47__SKUIComposeReviewViewController_submitReview__block_invoke_2(id *a1)
{
  id WeakRetained;
  id v3;
  _QWORD block[4];
  id v5;
  id v6[2];

  WeakRetained = objc_loadWeakRetained(a1 + 4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SKUIComposeReviewViewController_submitReview__block_invoke_3;
  block[3] = &unk_1E73A13D8;
  v5 = WeakRetained;
  v3 = WeakRetained;
  objc_copyWeak(v6, a1 + 5);
  v6[1] = a1[6];
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v6);

}

void __47__SKUIComposeReviewViewController_submitReview__block_invoke_3(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id obj;
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*v1, "success") & 1) == 0 && v23)
  {
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF4A8]), "initWithResponseDictionary:", v23);
    objc_msgSend(v22, "actions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v2)
    {
      v3 = *(_QWORD *)v34;
      v4 = *MEMORY[0x1E0DAFCC0];
      while (2)
      {
        for (i = 0; i != v2; ++i)
        {
          if (*(_QWORD *)v34 != v3)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v6, "actionType");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "isEqualToString:", v4);

          if (v8)
          {
            objc_msgSend(v6, "dialog");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (void *)MEMORY[0x1E0DC3450];
            objc_msgSend(v21, "title");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "message");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "buttons");
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            v26 = (id)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v30;
              do
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v30 != v14)
                    objc_enumerationMutation(v26);
                  v16 = (void *)MEMORY[0x1E0DC3448];
                  objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "buttonTitle");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v27[0] = MEMORY[0x1E0C809B0];
                  v27[1] = 3221225472;
                  v27[2] = __47__SKUIComposeReviewViewController_submitReview__block_invoke_4;
                  v27[3] = &unk_1E73A13B0;
                  objc_copyWeak(&v28, (id *)(a1 + 40));
                  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v27);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v12, "addAction:", v18);
                  objc_destroyWeak(&v28);
                }
                v13 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              }
              while (v13);
            }

            WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
            objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v12, 1, 0);

            goto LABEL_21;
          }
        }
        v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v2)
          continue;
        break;
      }
    }

  }
  v22 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v22, "_sendDidSubmit");
LABEL_21:

  if (*(_QWORD *)(a1 + 48) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "endBackgroundTask:", *(_QWORD *)(a1 + 48));

  }
}

void __47__SKUIComposeReviewViewController_submitReview__block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setNicknameShouldResetOnError:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_setNickname:", 0);

}

- (void)composeReviewFormDidSubmit:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[SKUIComposeReviewViewController editedReviewMetadata](self, "editedReviewMetadata", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nickname");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v8, "nickname"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v5,
        v7))
  {
    -[SKUIComposeReviewViewController _attemptReviewSubmission](self, "_attemptReviewSubmission");
  }
  else
  {
    -[SKUIComposeReviewViewController _promptForNickname](self, "_promptForNickname");
  }

}

- (void)composeReviewNicknameDidCancel:(id)a3
{
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = self->_formViewController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewViewController setViewControllers:animated:](self, "setViewControllers:animated:", v4, 1);

}

- (void)composeReviewNicknameDidConfirm:(id)a3 nickname:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "length"))
  {
    -[SKUIComposeReviewViewController _setNickname:](self, "_setNickname:", v5);
    -[SKUIComposeReviewViewController _setNicknameShouldResetOnError:](self, "_setNicknameShouldResetOnError:", 1);
    -[SKUIComposeReviewViewController _attemptReviewSubmission](self, "_attemptReviewSubmission");
  }
  else
  {
    -[SKUIComposeReviewViewController _promptForNickname](self, "_promptForNickname");
  }

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAlertAction setEnabled:](self->_nicknameOKAction, "setEnabled:", objc_msgSend(v11, "length") != 0);
  return 1;
}

- (void)_attemptReviewSubmission
{
  void *v3;
  id v4;

  -[SKUIComposeReviewViewController editedReviewMetadata](self, "editedReviewMetadata");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(v3, "composeReviewViewController:shouldSubmitReview:", self, v4))
  {
    -[SKUIComposeReviewViewController submitReview](self, "submitReview");
  }

}

- (void)_promptForNickname
{
  SKUIComposeReviewNicknameViewController *v3;
  SKUIComposeReviewNicknameViewController *nicknameViewController;
  SKUIComposeReviewNicknameViewController *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v3 = objc_alloc_init(SKUIComposeReviewNicknameViewController);
    nicknameViewController = self->_nicknameViewController;
    self->_nicknameViewController = v3;

    -[SKUIComposeReviewNicknameViewController setDelegate:](self->_nicknameViewController, "setDelegate:", self);
    v5 = self->_nicknameViewController;
    v7[0] = self->_formViewController;
    v7[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIComposeReviewViewController setViewControllers:animated:](self, "setViewControllers:animated:", v6, 1);

  }
  else
  {
    -[SKUIComposeReviewViewController _promptForNicknameWithAlert](self, "_promptForNicknameWithAlert");
  }
}

- (void)_promptForNicknameWithAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id location;
  _QWORD v26[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NICKNAME_ALERT_TITLE"), &stru_1E73A9FB0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NICKNAME_ALERT_MESSAGE"), &stru_1E73A9FB0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __62__SKUIComposeReviewViewController__promptForNicknameWithAlert__block_invoke;
  v26[3] = &unk_1E73A1428;
  v26[4] = self;
  objc_msgSend(v8, "addTextFieldWithConfigurationHandler:", v26);
  v10 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E73A9FB0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E73A9FB0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v9;
  v20 = 3221225472;
  v21 = __62__SKUIComposeReviewViewController__promptForNicknameWithAlert__block_invoke_2;
  v22 = &unk_1E73A1450;
  objc_copyWeak(&v24, &location);
  v17 = v8;
  v23 = v17;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, &v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setEnabled:", 0, v19, v20, v21, v22);
  objc_msgSend(v17, "addAction:", v18);
  objc_msgSend(v17, "setPreferredAction:", v18);
  objc_storeStrong((id *)&self->_nicknameOKAction, v18);
  -[SKUIComposeReviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __62__SKUIComposeReviewViewController__promptForNicknameWithAlert__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a2;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NICKNAME_ALERT_PLACEHOLDER"), &stru_1E73A9FB0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceholder:", v5);

  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
}

void __62__SKUIComposeReviewViewController__promptForNicknameWithAlert__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(WeakRetained, "_setNickname:", v4);
    objc_msgSend(WeakRetained, "_setNicknameShouldResetOnError:", 1);
    objc_msgSend(WeakRetained, "_attemptReviewSubmission");
  }
  else
  {
    objc_msgSend(WeakRetained, "_promptForNickname");
  }

}

- (void)_setNickname:(id)a3
{
  NSString *v4;
  NSString *nickname;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_nickname, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    nickname = self->_nickname;
    self->_nickname = v4;

  }
}

- (void)_setNicknameShouldResetOnError:(BOOL)a3
{
  if (self->_nicknameShouldResetOnError != a3)
    self->_nicknameShouldResetOnError = a3;
}

- (void)_finishLoadWithOutput:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SKUIReviewMetadata *v11;
  SKUIComposeReviewFormViewController *v12;
  SKUIComposeReviewFormViewController *formViewController;
  void *v14;
  void *v15;
  SKUIComposeReviewFormViewController *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  SKUIReviewMetadata *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DDC1D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC160]), "initWithDialogDictionary:", v7);
    else
      v8 = 0;
    -[SKUIComposeReviewViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DDC1D8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v9, "composeReviewViewController:didFailWithDialog:", self, v8);
LABEL_21:

        goto LABEL_22;
      }
    }
    else if (!v8)
    {
      v11 = -[SKUIReviewMetadata initWithReviewDictionary:]([SKUIReviewMetadata alloc], "initWithReviewDictionary:", v6);
      v12 = -[SKUIComposeReviewFormViewController initWithReviewMetadata:]([SKUIComposeReviewFormViewController alloc], "initWithReviewMetadata:", v11);
      formViewController = self->_formViewController;
      self->_formViewController = v12;

      -[SKUIComposeReviewFormViewController setDelegate:](self->_formViewController, "setDelegate:", self);
      v23 = v11;
      if (v11)
      {
        -[SKUIReviewMetadata title](v11, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
        {
          -[SKUIComposeReviewViewController setEdit:](self, "setEdit:", 1);
        }
        else
        {
          -[SKUIReviewMetadata body](v11, "body");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIComposeReviewViewController setEdit:](self, "setEdit:", objc_msgSend(v15, "length") != 0);

        }
      }
      else
      {
        -[SKUIComposeReviewViewController setEdit:](self, "setEdit:", 0);
      }
      v16 = self->_formViewController;
      v17 = -[SKUIComposeReviewViewController isEdit](self, "isEdit");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
        v20 = CFSTR("EDIT_REVIEW");
      else
        v20 = CFSTR("WRITE_A_REVIEW");
      objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1E73A9FB0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUViewController setTitle:](v16, "setTitle:", v21);

      v24[0] = self->_formViewController;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUNavigationController setViewControllers:](self, "setViewControllers:", v22);

      goto LABEL_21;
    }
    -[SKUIComposeReviewViewController _sendDidCancel](self, "_sendDidCancel");
    goto LABEL_21;
  }
  -[SKUIComposeReviewViewController _sendDidCancel](self, "_sendDidCancel");
LABEL_22:

}

- (void)_loadReviewWithURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *);
  void *v21;
  id v22;
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0DDC1B0]);
  objc_msgSend(v8, "authenticationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0DAF5C0]);
  objc_msgSend(v10, "setCanSetActiveAccount:", 1);
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v8, "setAuthenticationContext:", v11);

  objc_msgSend(MEMORY[0x1E0DDC1A0], "provider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShouldProcessDialogs:", 0);
  objc_msgSend(v8, "setDataProvider:", v12);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF670]), "initWithURL:", v6);
  objc_msgSend(v8, "setRequestProperties:", v13);
  objc_initWeak(&location, self);
  v14 = v8;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __70__SKUIComposeReviewViewController__loadReviewWithURL_completionBlock___block_invoke;
  v21 = &unk_1E73A1478;
  objc_copyWeak(&v24, &location);
  v15 = v14;
  v22 = v15;
  v16 = v7;
  v23 = v16;
  objc_msgSend(v15, "setCompletionBlock:", &v18);
  -[SUPlaceholderViewController setSkLoading:](self->_placeholderViewController, "setSkLoading:", 1, v18, v19, v20, v21);
  objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addOperation:", v15);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __70__SKUIComposeReviewViewController__loadReviewWithURL_completionBlock___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SKUIComposeReviewViewController__loadReviewWithURL_completionBlock___block_invoke_2;
  block[3] = &unk_1E73A1478;
  objc_copyWeak(&v5, a1 + 6);
  v3 = a1[4];
  v4 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(a1[4], "setCompletionBlock:", 0);

  objc_destroyWeak(&v5);
}

void __70__SKUIComposeReviewViewController__loadReviewWithURL_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "output");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_finishLoadWithOutput:error:", v4, v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, 1, v7);

  }
}

- (void)_sendDidSubmit
{
  id v3;

  -[SKUIComposeReviewViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "composeReviewViewControllerDidSubmit:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "composeReviewViewController:didSubmitWithEdit:", self, -[SKUIComposeReviewViewController isEdit](self, "isEdit"));

}

- (void)_sendDidCancel
{
  id v3;

  -[SKUIComposeReviewViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "composeReviewViewControllerDidCancel:", self);

}

- (SKUIWriteAReviewTemplateViewElement)templateViewElement
{
  return self->_templateViewElement;
}

- (void)setTemplateViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_templateViewElement, a3);
}

- (BOOL)isEdit
{
  return self->_edit;
}

- (void)setEdit:(BOOL)a3
{
  self->_edit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateViewElement, 0);
  objc_storeStrong((id *)&self->_nicknameOKAction, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_nicknameViewController, 0);
  objc_storeStrong((id *)&self->_formViewController, 0);
}

@end
