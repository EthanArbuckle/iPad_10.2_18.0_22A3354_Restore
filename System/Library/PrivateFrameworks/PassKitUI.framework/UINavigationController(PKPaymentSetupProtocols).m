@implementation UINavigationController(PKPaymentSetupProtocols)

- (uint64_t)pk_presentPaymentSetupViewController:()PKPaymentSetupProtocols animated:completion:
{
  return objc_msgSend(a1, "_pk_presentPaymentSetupViewController:animated:performPreflight:delay:completion:", a3, a4, 1, 0, a5);
}

- (uint64_t)pk_presentPaymentSetupViewController:()PKPaymentSetupProtocols animated:performPreflight:completion:
{
  return objc_msgSend(a1, "_pk_presentPaymentSetupViewController:animated:performPreflight:delay:completion:", a3, a4, a5, 0, a6);
}

- (uint64_t)pk_presentPaymentSetupViewController:()PKPaymentSetupProtocols animated:delay:completion:
{
  return objc_msgSend(a1, "_pk_presentPaymentSetupViewController:animated:performPreflight:delay:completion:", a3, a4, 1, a5, a6);
}

- (void)_pk_presentPaymentSetupViewController:()PKPaymentSetupProtocols animated:performPreflight:delay:completion:
{
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  dispatch_time_t v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t *v27;
  char v28;
  _QWORD aBlock[5];
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  _QWORD block[4];
  NSObject *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v12 = a3;
  v13 = a7;
  v14 = v13;
  if (v12)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v15 = dispatch_group_create();
    v16 = v15;
    v17 = MEMORY[0x1E0C809B0];
    if (a6 >= 1)
    {
      dispatch_group_enter(v15);
      v18 = dispatch_time(0, a6);
      block[0] = v17;
      block[1] = 3221225472;
      block[2] = __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke;
      block[3] = &unk_1E3E612E8;
      v35 = v16;
      dispatch_after(v18, MEMORY[0x1E0C80D38], block);

    }
    if (a5)
    {
      dispatch_group_enter(v16);
      v31[0] = v17;
      v31[1] = 3221225472;
      v31[2] = __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_2;
      v31[3] = &unk_1E3E67580;
      v33 = &v36;
      v32 = v16;
      objc_msgSend(v12, "pk_paymentSetupPreflight:", v31);

    }
    else
    {
      *((_BYTE *)v37 + 24) = 1;
    }
    aBlock[0] = v17;
    aBlock[1] = 3221225472;
    aBlock[2] = __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_3;
    aBlock[3] = &unk_1E3E61850;
    aBlock[4] = a1;
    v19 = v14;
    v30 = v19;
    v20 = _Block_copy(aBlock);
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_4;
    v22[3] = &unk_1E3E67C20;
    v27 = &v36;
    v23 = v12;
    v24 = a1;
    v25 = v19;
    v28 = a4;
    v26 = v20;
    v21 = v20;
    dispatch_group_notify(v16, MEMORY[0x1E0C80D38], v22);

    _Block_object_dispose(&v36, 8);
  }
  else if (v13)
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

- (uint64_t)_pk_popToViewControllerPresentationMarker:()PKPaymentSetupProtocols animated:
{
  uint64_t v4;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char **v12;
  uint64_t v13;
  char **v14;
  id v15;
  void *v17;
  unsigned int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v4 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(a1, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v19 = a4;
      v11 = *(_QWORD *)v21;
      v12 = &selRef_nextViewControllerAfterPerfomingOperations_completion_;
      while (2)
      {
        v13 = 0;
        v14 = v12;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v15 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v15, "paymentSetupMarker") == v4)
          {
            -[NSObject addObject:](v7, "addObject:", v15);

            v4 = 1;
            goto LABEL_15;
          }
          -[NSObject addObject:](v7, "addObject:", v15);

          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v12 = v14;
        if (v10)
          continue;
        break;
      }
      v4 = 0;
LABEL_15:
      a4 = v19;
    }
    else
    {
      v4 = 0;
    }

    objc_msgSend(a1, "setViewControllers:animated:", v7, a4);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v17;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "%@ called without specified presentation marker, no-op.", buf, 0xCu);

      v4 = 0;
    }
  }

  return v4;
}

- (void)_pk_popToViewController:()PKPaymentSetupProtocols animated:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "viewControllers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        if (*(id *)(*((_QWORD *)&v13 + 1) + 8 * i) == v6)
        {
          objc_msgSend(v7, "addObject:", v6);
          goto LABEL_11;
        }
        objc_msgSend(v7, "addObject:");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(a1, "setViewControllers:animated:", v7, a4);
}

- (void)_pk_popViewControllersFromViewController:()PKPaymentSetupProtocols toViewController:animated:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v10);
        v16 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        if (v13)
        {
          if (v16 != v8 || v16 == v7)
          {
            v13 = 1;
          }
          else
          {
            objc_msgSend(v9, "addObject:", v8);
            v13 = 0;
          }
        }
        else
        {
          objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15));
          v13 = v16 == v7;
        }
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }
  if ((PKEqualObjects() & 1) == 0)
    objc_msgSend(a1, "setViewControllers:animated:", v9, a5);

}

@end
