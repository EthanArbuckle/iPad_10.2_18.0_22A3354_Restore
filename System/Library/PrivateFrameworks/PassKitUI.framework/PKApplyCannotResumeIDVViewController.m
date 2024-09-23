@implementation PKApplyCannotResumeIDVViewController

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  void *v4;

  -[PKApplyExplanationViewController controller](self, "controller", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endApplyFlow");

  -[PKApplyExplanationViewController handleNextStep](self, "handleNextStep");
}

- (void)_restartApplyFlow
{
  void *v3;
  _QWORD v4[5];

  -[PKApplyExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PKApplyCannotResumeIDVViewController__restartApplyFlow__block_invoke;
  v4[3] = &unk_1E3E62260;
  v4[4] = self;
  objc_msgSend(v3, "withdrawApplicationWithCompletion:", v4);

}

void __57__PKApplyCannotResumeIDVViewController__restartApplyFlow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__PKApplyCannotResumeIDVViewController__restartApplyFlow__block_invoke_2;
    v12[3] = &unk_1E3E62288;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v12);
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_pk_popToViewControllerPresentationMarker:animated:", 3, 1);

      goto LABEL_6;
    }
    v8 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    v9 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__PKApplyCannotResumeIDVViewController__restartApplyFlow__block_invoke_3;
    v11[3] = &unk_1E3E612E8;
    v11[4] = v9;
    objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, v11);
  }

LABEL_6:
}

uint64_t __57__PKApplyCannotResumeIDVViewController__restartApplyFlow__block_invoke_2(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "showNavigationBarSpinner:", 0);
  else
    return objc_msgSend(v2, "terminateSetupFlow");
}

uint64_t __57__PKApplyCannotResumeIDVViewController__restartApplyFlow__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
}

@end
