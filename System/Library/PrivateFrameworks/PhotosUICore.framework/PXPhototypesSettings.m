@implementation PXPhototypesSettings

+ (void)showPhototypesRootsSubscriptionAlert
{
  id v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__PXPhototypesSettings_showPhototypesRootsSubscriptionAlert__block_invoke;
  v3[3] = &__block_descriptor_40_e30_v16__0__PXAlertConfiguration_8l;
  v3[4] = a1;
  v2 = +[PXAlert show:](PXAlert, "show:", v3);
}

+ (void)_openLivabilityPhototypesRootsSubscriptionFlow
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("livability://subscribe/%@"), CFSTR("1547504"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PXPhototypesSettings__openLivabilityPhototypesRootsSubscriptionFlow__block_invoke;
  block[3] = &unk_1E5149198;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __70__PXPhototypesSettings__openLivabilityPhototypesRootsSubscriptionFlow__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:options:completionHandler:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA70], 0);

}

void __60__PXPhototypesSettings_showPhototypesRootsSubscriptionAlert__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  v3 = a2;
  objc_msgSend(v3, "setTitle:", CFSTR("Phototypes Livability Roots"));
  objc_msgSend(v3, "setMessage:", CFSTR("Roots subscriptions is a neat Livability App feature that lets you subscribe to a specific Radar keyword and allow you to fetch and install the attached roots straight from the Livability App.\n\nPlease remember that installing any root on a device might lead to some issues, we stronly recommend doing so on a secondary device."));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PXPhototypesSettings_showPhototypesRootsSubscriptionAlert__block_invoke_2;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "addActionWithTitle:style:action:", CFSTR("Subscribe"), 0, v4);
  objc_msgSend(v3, "addActionWithTitle:style:action:", CFSTR("Cancel"), 1, 0);

}

uint64_t __60__PXPhototypesSettings_showPhototypesRootsSubscriptionAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openLivabilityPhototypesRootsSubscriptionFlow");
}

@end
