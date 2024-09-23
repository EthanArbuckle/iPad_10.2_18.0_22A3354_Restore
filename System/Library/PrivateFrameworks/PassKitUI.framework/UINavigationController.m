@implementation UINavigationController

void __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "navigationBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "interactivePopGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_4(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *oslog;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v2 = objc_opt_respondsToSelector();
    v3 = *(void **)(a1 + 32);
    if ((v2 & 1) != 0)
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(unsigned __int8 *)(a1 + 72);
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_66;
      v38[3] = &unk_1E3E61590;
      v39 = *(id *)(a1 + 56);
      objc_msgSend(v3, "presentWithNavigationController:animated:completion:", v4, v5, v38);

      return;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_33;
    v10 = objc_msgSend(*(id *)(a1 + 32), "onPresentationRemoveViewControllersAfterMarker");
    if (!v10)
      goto LABEL_33;
    v11 = v10;
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v14;
      v44 = 2048;
      v45 = v11;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "%@ asked to remove view controllers after marker: %lu", buf, 0x16u);

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "viewControllers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v16)
    {
      v17 = v16;
      oslog = v12;
      v18 = 0;
      v19 = *(_QWORD *)v35;
      while (2)
      {
        v20 = 0;
        v21 = v17 + v18;
        do
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v15);
          v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v20);
          if ((objc_opt_respondsToSelector() & 1) != 0 && v11 == objc_msgSend(v22, "paymentSetupMarker"))
          {
            v21 = v18 + v20;
            if ((objc_opt_respondsToSelector() & 1) != 0
              && objc_msgSend(v22, "paymentSetupMarkerRemovalIsInclusive"))
            {
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v43 = v22;
                _os_log_impl(&dword_19D178000, oslog, OS_LOG_TYPE_DEFAULT, "Removal is inclusive of marked view controller: %@", buf, 0xCu);
              }

            }
            else
            {
              ++v21;
            }
            goto LABEL_28;
          }
          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        v18 = v21;
        if (v17)
          continue;
        break;
      }
LABEL_28:

      v12 = oslog;
      if (v21)
      {
        objc_msgSend(*(id *)(a1 + 40), "viewControllers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v21 != v24)
        {
          objc_msgSend(*(id *)(a1 + 40), "viewControllers");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "subarrayWithRange:", 0, v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v28, "mutableCopy");

          objc_msgSend(v29, "addObject:", *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 40), "setViewControllers:animated:", v29, *(unsigned __int8 *)(a1 + 72));

          goto LABEL_39;
        }
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, oslog, OS_LOG_TYPE_DEFAULT, "No target or mark found, pushing new view controller onto existing stack. This may be an error.", buf, 2u);
        }

LABEL_33:
        objc_msgSend(*(id *)(a1 + 40), "pushViewController:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), oslog);
LABEL_39:
        objc_msgSend(*(id *)(a1 + 40), "transitionCoordinator", oslog);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_73;
          v32[3] = &unk_1E3E67BD0;
          v33 = *(id *)(a1 + 56);
          objc_msgSend(v30, "animateAlongsideTransition:completion:", 0, v32);

        }
        else
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        }

        return;
      }
    }
    else
    {

    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "No view controllers remain, setting new view controller as root", buf, 2u);
    }

    v25 = *(void **)(a1 + 40);
    v40 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setViewControllers:animated:", v26, *(unsigned __int8 *)(a1 + 72));

    goto LABEL_39;
  }
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v8;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Error: Preflight failed for view controller: %@", buf, 0xCu);

  }
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
}

uint64_t __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
