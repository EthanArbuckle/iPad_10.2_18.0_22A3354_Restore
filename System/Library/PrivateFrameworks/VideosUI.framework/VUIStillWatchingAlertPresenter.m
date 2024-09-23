@implementation VUIStillWatchingAlertPresenter

+ (void)presentWithTitle:(id)a3 presentingController:(id)a4 timeout:(double)a5 responseHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v9 = a3;
  v29 = a4;
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0CB3940];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:", CFSTR("NOW_PLAYING_STILL_WATCHING_MESSAGE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v14, 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__31;
  v43 = __Block_byref_object_dispose__31;
  v16 = (void *)MEMORY[0x1E0C99E88];
  v17 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke;
  v36[3] = &unk_1E9FA3D90;
  v18 = v15;
  v37 = v18;
  v19 = v10;
  v38 = v19;
  objc_msgSend(v16, "timerWithTimeInterval:repeats:block:", 0, v36, a5);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:", CFSTR("CONTINUE_WATCHING"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke_3;
  v33[3] = &unk_1E9FA3DB8;
  v35 = &v39;
  v22 = v19;
  v34 = v22;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v21, 0, v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "vui_addAction:", v23);

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:", CFSTR("EXIT"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke_4;
  v30[3] = &unk_1E9FA3DB8;
  v32 = &v39;
  v26 = v22;
  v31 = v26;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v25, 0, v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "vui_addAction:", v27);

  objc_msgSend(v18, "vui_presentAlertFromPresentingController:animated:completion:", v29, 1, 0);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addTimer:forMode:", v40[5], *MEMORY[0x1E0C99748]);

  _Block_object_dispose(&v39, 8);
}

void __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke_2;
  v2[3] = &unk_1E9F98E68;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "vui_dismissViewControllerAnimated:completion:", 1, v2);

}

uint64_t __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__VUIStillWatchingAlertPresenter_presentWithTitle_presentingController_timeout_responseHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

@end
