@implementation PKPaymentCameraCaptureViewController

uint64_t __71___PKPaymentCameraCaptureViewController_cameraReader_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1568);
  v7 = *MEMORY[0x1E0D68740];
  v8[0] = *MEMORY[0x1E0D684B0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportError:context:", v2, v4);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1560));
  objc_msgSend(WeakRetained, "cameraCaptureViewControllerDidFail:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1544), "setButtonsEnabled:", 1);
}

void __60___PKPaymentCameraCaptureViewController_cameraReaderDidEnd___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  id WeakRetained;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "loadViewIfNeeded");
  mach_absolute_time();
  PKSecondsFromMachTimeInterval();
  v3 = round(v2 * 10.0) / 10.0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D688D8]);

  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 1496);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "type");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  if ((objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0D182B8]) & 1) != 0)
  {
    v14 = &stru_1E3E7D690;
  }
  else
  {
    objc_msgSend(&stru_1E3E7D690, "stringByAppendingFormat:", CFSTR("%@,"), *MEMORY[0x1E0D68498]);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0D182C8]) & 1) == 0)
  {
    -[__CFString stringByAppendingFormat:](v14, "stringByAppendingFormat:", CFSTR("%@,"), *MEMORY[0x1E0D684A8]);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (__CFString *)v15;
  }
  if ((objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0D182C0]) & 1) == 0)
  {
    -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", *MEMORY[0x1E0D684A0]);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (__CFString *)v16;
  }
  if (-[__CFString length](v14, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D68740]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1568), "reportPageCompleted:context:", 1, v4);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1560));
  objc_msgSend(WeakRetained, "cameraCaptureViewController:didRecognizeObjects:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1496));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1544), "setButtonsEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "cancel");

}

uint64_t __74___PKPaymentCameraCaptureViewController_cameraReader_didRecognizeObjects___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 1496) != v2)
  {
    objc_storeStrong((id *)(v3 + 1496), v2);
    v3 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v3 + 1544), "setButtonsEnabled:", 0);
}

- (PKPaymentCameraCaptureViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4
{
  id v6;
  _PKPaymentCameraCaptureViewController *v7;

  v6 = a3;
  v7 = -[_PKPaymentCameraCaptureViewController initWithProvisioningController:context:]([_PKPaymentCameraCaptureViewController alloc], "initWithProvisioningController:context:", v6, a4);

  return (PKPaymentCameraCaptureViewController *)v7;
}

- (BOOL)hideSetupLaterButton
{
  return self->_hideSetupLaterButton;
}

- (void)setHideSetupLaterButton:(BOOL)a3
{
  self->_hideSetupLaterButton = a3;
}

- (BOOL)showTapToProvisionButton
{
  return self->_showTapToProvisionButton;
}

- (void)setShowTapToProvisionButton:(BOOL)a3
{
  self->_showTapToProvisionButton = a3;
}

- (BOOL)showTypeCardNumberButton
{
  return self->_showTypeCardNumberButton;
}

- (void)setShowTypeCardNumberButton:(BOOL)a3
{
  self->_showTypeCardNumberButton = a3;
}

- (PKPaymentCameraCaptureViewControllerDelegate)flowItemDelegate
{
  return (PKPaymentCameraCaptureViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_flowItemDelegate);
}

- (void)setFlowItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowItemDelegate, a3);
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowItemDelegate);
}

@end
