@implementation PNPChargingStatusConfigureAutoDismissWithTime

void __PNPChargingStatusConfigureAutoDismissWithTime_block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __PNPChargingStatusConfigureAutoDismissWithTime_block_invoke_2;
    v5[3] = &unk_24F4E50A0;
    v6 = v3;
    PNPPlatterDismissPlatterContainerView(WeakRetained, 1, v5);
    objc_msgSend(WeakRetained, "setAutoDismissBlock:", 0);
    objc_msgSend(WeakRetained, "setAutoDismissDate:", 0);

  }
}

uint64_t __PNPChargingStatusConfigureAutoDismissWithTime_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
}

@end
