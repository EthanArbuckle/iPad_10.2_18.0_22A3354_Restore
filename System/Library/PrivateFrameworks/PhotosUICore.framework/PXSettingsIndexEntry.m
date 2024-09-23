@implementation PXSettingsIndexEntry

uint64_t __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  return objc_msgSend(*(id *)(a1 + 48), "tableView:didSelectRowAtIndexPath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5148A40;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

void __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_5;
  v9[3] = &unk_1E5149198;
  v10 = *(id *)(a1 + 32);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_6;
  v6[3] = &unk_1E5144558;
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  v5 = v2;
  objc_msgSend(v4, "animateWithDuration:animations:completion:", v9, v6, 0.2);

}

void __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

}

void __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_7;
  v3[3] = &unk_1E5148D08;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "animateWithDuration:animations:", v3, 0.2);

}

uint64_t __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83___PXSettingsIndexEntry__revealInSettingsController_drillIn_withCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_revealInTopOfSettingsController:drillIn:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
