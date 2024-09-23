@implementation PKPayLaterHandleFrontOfPassAlertsWithAccount

void __PKPayLaterHandleFrontOfPassAlertsWithAccount_block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (PKShouldSeePayLaterEnablementAlert())
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Presenting pay later enablement alert", v4, 2u);
    }

    PKCreateAlertControllerForPayLaterEnablement();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v3, 1, &__block_literal_global_23);

  }
}

uint64_t __PKPayLaterHandleFrontOfPassAlertsWithAccount_block_invoke_21()
{
  return PKSetShouldSeePayLaterEnablementAlert();
}

void __PKPayLaterHandleFrontOfPassAlertsWithAccount_block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  objc_msgSend(a1[4], "payLaterDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1[4], "payLaterDetails");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPayLaterSupportedInCurrentRegion") ^ 1;

  }
  else
  {
    v4 = 0;
  }

  v5 = PKHasSeenPayLaterRegionUnsupportedAlert();
  if (!v4 || (v5 & 1) != 0)
  {
    if (((v4 | v5 ^ 1) & 1) == 0)
      PKSetHasSeenPayLaterRegionUnsupportedAlert();
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Presenting pay later region unsupported alert", buf, 2u);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __PKPayLaterHandleFrontOfPassAlertsWithAccount_block_invoke_24;
    v8[3] = &unk_1E3E61590;
    v9 = a1[6];
    PKCreateAlertControllerForPayLaterNotAvailableInRegion(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "presentViewController:animated:completion:", v7, 1, &__block_literal_global_26);

  }
}

uint64_t __PKPayLaterHandleFrontOfPassAlertsWithAccount_block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __PKPayLaterHandleFrontOfPassAlertsWithAccount_block_invoke_2_25()
{
  return PKSetHasSeenPayLaterRegionUnsupportedAlert();
}

@end
