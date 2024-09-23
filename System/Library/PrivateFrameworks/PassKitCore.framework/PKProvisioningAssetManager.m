@implementation PKProvisioningAssetManager

+ (id)sharedInstance
{
  if (_MergedGlobals_222 != -1)
    dispatch_once(&_MergedGlobals_222, &__block_literal_global_76);
  return (id)qword_1ECF22480;
}

void __44__PKProvisioningAssetManager_sharedInstance__block_invoke()
{
  PKProvisioningAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(PKProvisioningAssetManager);
  v1 = (void *)qword_1ECF22480;
  qword_1ECF22480 = (uint64_t)v0;

}

- (PKProvisioningAssetManager)init
{
  PKProvisioningAssetManager *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKProvisioningAssetManager;
  v2 = -[PKProvisioningAssetManager init](&v6, sel_init);
  if (v2)
  {
    +[PKMobileAssetManager sharedInstance](PKMobileAssetManager, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_mobileAssetManager;
    _mobileAssetManager = v3;

  }
  return v2;
}

- (void)carPairingImageForRadioTechnology:(unint64_t)a3 templateIdentifier:(id)a4 darkMode:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;
  BOOL v18;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  if (v10)
  {
    if ((a3 & 2) != 0)
      v12 = CFSTR("CarPairingUWB");
    else
      v12 = CFSTR("CarPairingNFC");
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("_"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)_mobileAssetManager;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __103__PKProvisioningAssetManager_carPairingImageForRadioTechnology_templateIdentifier_darkMode_completion___block_invoke;
    v15[3] = &unk_1E2AC9C70;
    v15[4] = self;
    v18 = v7;
    v16 = v11;
    v17 = a3;
    objc_msgSend(v14, "dynamicAssetWithIdentifier:mappedIdentifierPrefix:parameters:timeout:completion:", v10, v13, 0, 10, v15);

  }
  else
  {
    -[PKProvisioningAssetManager _defaultCarPairingImage:darkMode:completion:](self, "_defaultCarPairingImage:darkMode:completion:", a3, v7, v11);
  }

}

void __103__PKProvisioningAssetManager_carPairingImageForRadioTechnology_templateIdentifier_darkMode_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_carPairingImageFromBundle:darkMode:", a2, *(unsigned __int8 *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "_defaultCarPairingImage:darkMode:completion:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)cardArtworkForTemplateIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  if (a3)
  {
    objc_msgSend(CFSTR("CardArtwork"), "stringByAppendingFormat:", CFSTR("_%@"), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)_mobileAssetManager;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__PKProvisioningAssetManager_cardArtworkForTemplateIdentifier_completion___block_invoke;
    v9[3] = &unk_1E2AC16F8;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(v8, "dynamicAssetWithIdentifier:parameters:timeout:completion:", v7, 0, 10, v9);

  }
  else
  {
    -[PKProvisioningAssetManager _defaultCardArtwork:](self, "_defaultCardArtwork:", v6);
  }

}

void __74__PKProvisioningAssetManager_cardArtworkForTemplateIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(a2, "URLForResource:withExtension:", CFSTR("image"), CFSTR("png"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      v3 = v5;
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_defaultCardArtwork:", *(_QWORD *)(a1 + 40));
  }
}

- (id)provisioningString:(id)a3 templateIdentifier:(id)a4
{
  NSString *v5;
  id v6;
  NSBundle *v7;
  NSString *v8;
  void *v9;

  v5 = (NSString *)a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend((id)_mobileAssetManager, "cachedStringsBundleWithIdentifier:", CFSTR("Provisioning"));
    v7 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (-[NSString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR("_%@"), v6),
          v8 = (NSString *)objc_claimAutoreleasedReturnValue(),
          PKLocalizedStringInMobileAssetsStringsBundle(v8, v7, 0),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v9))
    {
      PKLocalizedStringInMobileAssetsStringsBundle(v5, v7, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_defaultCarPairingImage:(unint64_t)a3 darkMode:(BOOL)a4 completion:(id)a5
{
  char v6;
  id v8;
  BOOL v9;
  void *v10;
  const __CFString *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v6 = a3;
  v8 = a5;
  v9 = (v6 & 2) == 0;
  v10 = (void *)_mobileAssetManager;
  v13[0] = MEMORY[0x1E0C809B0];
  if (v9)
    v11 = CFSTR("CarPairingNFC");
  else
    v11 = CFSTR("CarPairingUWB");
  v13[1] = 3221225472;
  v13[2] = __74__PKProvisioningAssetManager__defaultCarPairingImage_darkMode_completion___block_invoke;
  v13[3] = &unk_1E2AC9C98;
  v15 = a4;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v10, "dynamicAssetWithIdentifier:parameters:timeout:completion:", v11, 0, 10, v13);

}

void __74__PKProvisioningAssetManager__defaultCarPairingImage_darkMode_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_carPairingImageFromBundle:darkMode:", a2, *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)_defaultCardArtwork:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)_mobileAssetManager;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PKProvisioningAssetManager__defaultCardArtwork___block_invoke;
  v6[3] = &unk_1E2AC9CC0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "dynamicAssetWithIdentifier:parameters:timeout:completion:", CFSTR("GenericCardArtwork"), 0, 10, v6);

}

void __50__PKProvisioningAssetManager__defaultCardArtwork___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    objc_msgSend(v9, "URLForResource:withExtension:", CFSTR("image"), CFSTR("png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }

}

- (id)_carPairingImageFromBundle:(id)a3 darkMode:(BOOL)a4
{
  const __CFString *v5;
  id v6;
  void *v7;
  void *v8;

  if (a3)
  {
    if (a4)
      v5 = CFSTR("dark");
    else
      v5 = CFSTR("light");
    v6 = a3;
    -[PKProvisioningAssetManager _assetNameWithScreenScalingSuffix:](self, "_assetNameWithScreenScalingSuffix:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLForResource:withExtension:", v7, CFSTR("png"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_assetNameWithScreenScalingSuffix:(id)a3
{
  id v3;
  double v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  v4 = PKScreenScale();
  v5 = CFSTR("@2x");
  if (v4 < 2.0)
    v5 = CFSTR("@1x");
  if (v4 >= 3.0)
    v6 = CFSTR("@3x");
  else
    v6 = v5;
  objc_msgSend(v3, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
