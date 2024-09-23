@implementation PECopyEditsSetting

- (PECopyEditsSetting)initWithIdentifier:(unint64_t)a3
{
  PECopyEditsSetting *v4;
  PECopyEditsSetting *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PECopyEditsSetting;
  v4 = -[PECopyEditsSetting init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_identifier = a3;
    v4->_enabled = -[PECopyEditsSetting _isEnabledByDefault](v4, "_isEnabledByDefault");
  }
  return v5;
}

- (BOOL)isApplicableToCompositionController:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  char IsValid;
  char v9;
  void *v10;
  id v12;

  v6 = a3;
  v7 = a4;
  if (-[PECopyEditsSetting identifier](self, "identifier") == 6)
  {
    if (+[PESmartPasteablePreset isAssetTypeEligibleForSmartPaste:](PESmartPasteablePreset, "isAssetTypeEligibleForSmartPaste:", v7))
    {
      IsValid = +[PESmartPasteablePreset isCompositionControllerEligibleForSmartPaste:](PESmartPasteablePreset, "isCompositionControllerEligibleForSmartPaste:", v6);
LABEL_9:
      v9 = IsValid;
      goto LABEL_10;
    }
  }
  else
  {
    if (-[PECopyEditsSetting identifier](self, "identifier") != 5)
    {
      -[PECopyEditsSetting compositionKeys](self, "compositionKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v6;
      v9 = PFExists();

      goto LABEL_10;
    }
    if (objc_msgSend(v6, "userOrientation") != 1)
    {
      IsValid = NUOrientationIsValid();
      goto LABEL_9;
    }
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (NSString)localizedTitle
{
  unint64_t v2;

  v2 = -[PECopyEditsSetting identifier](self, "identifier");
  if (v2 > 9)
    return (NSString *)PELocalizedString(0);
  else
    return (NSString *)PELocalizedString(off_24C618110[v2]);
}

- (BOOL)_isEnabledByDefault
{
  return (-[PECopyEditsSetting identifier](self, "identifier") & 0xFFFFFFFFFFFFFFFELL) != 4;
}

- (NSArray)compositionKeys
{
  unint64_t v2;
  void *v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[12];
  _QWORD v23[2];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[PECopyEditsSetting identifier](self, "identifier");
  v3 = (void *)MEMORY[0x24BDBD1A8];
  switch(v2)
  {
    case 0uLL:
      v24[0] = *MEMORY[0x24BE71E40];
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = v24;
      goto LABEL_13;
    case 1uLL:
      v6 = *MEMORY[0x24BE71E20];
      v23[0] = *MEMORY[0x24BE71DB8];
      v23[1] = v6;
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = v23;
      goto LABEL_6;
    case 2uLL:
      v7 = *MEMORY[0x24BE71F20];
      v22[0] = *MEMORY[0x24BE71F28];
      v22[1] = v7;
      v8 = *MEMORY[0x24BE71DF0];
      v22[2] = *MEMORY[0x24BE71F18];
      v22[3] = v8;
      v9 = *MEMORY[0x24BE71F08];
      v22[4] = *MEMORY[0x24BE71F50];
      v22[5] = v9;
      v10 = *MEMORY[0x24BE71E10];
      v22[6] = *MEMORY[0x24BE71DB0];
      v22[7] = v10;
      v11 = *MEMORY[0x24BE71DA8];
      v22[8] = *MEMORY[0x24BE71F48];
      v22[9] = v11;
      v12 = *MEMORY[0x24BE71E70];
      v22[10] = *MEMORY[0x24BE71E00];
      v22[11] = v12;
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = v22;
      v13 = 12;
      goto LABEL_14;
    case 3uLL:
      v14 = *MEMORY[0x24BE71DE0];
      v21[0] = *MEMORY[0x24BE71DE8];
      v21[1] = v14;
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = v21;
LABEL_6:
      v13 = 2;
      goto LABEL_14;
    case 4uLL:
      v20 = *MEMORY[0x24BE71DA0];
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = &v20;
      goto LABEL_13;
    case 5uLL:
      v19 = *MEMORY[0x24BE71E18];
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = &v19;
      goto LABEL_13;
    case 7uLL:
      v18 = *MEMORY[0x24BE71D70];
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = &v18;
      goto LABEL_13;
    case 8uLL:
      v17 = *MEMORY[0x24BE71E78];
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = &v17;
      goto LABEL_13;
    case 9uLL:
      if (!_os_feature_enabled_impl())
        return (NSArray *)MEMORY[0x24BDBD1A8];
      v16 = *MEMORY[0x24BE71F10];
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = &v16;
LABEL_13:
      v13 = 1;
LABEL_14:
      objc_msgSend(v4, "arrayWithObjects:count:", v5, v13);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSArray *)v3;
    default:
      return (NSArray *)v3;
  }
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

uint64_t __64__PECopyEditsSetting_isApplicableToCompositionController_asset___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "adjustmentControllerForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "canBeEnabled"))
      v4 = objc_msgSend(v3, "enabled");
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)allSettings
{
  PECopyEditsSetting *v2;
  PECopyEditsSetting *v3;
  PECopyEditsSetting *v4;
  PECopyEditsSetting *v5;
  PECopyEditsSetting *v6;
  PECopyEditsSetting *v7;
  PECopyEditsSetting *v8;
  PECopyEditsSetting *v9;
  PECopyEditsSetting *v10;
  void *v11;
  PECopyEditsSetting *v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x24BDAC8D0];
  v13 = -[PECopyEditsSetting initWithIdentifier:]([PECopyEditsSetting alloc], "initWithIdentifier:", 7);
  v14[0] = v13;
  v2 = -[PECopyEditsSetting initWithIdentifier:]([PECopyEditsSetting alloc], "initWithIdentifier:", 8);
  v14[1] = v2;
  v3 = -[PECopyEditsSetting initWithIdentifier:]([PECopyEditsSetting alloc], "initWithIdentifier:", 9);
  v14[2] = v3;
  v4 = -[PECopyEditsSetting initWithIdentifier:]([PECopyEditsSetting alloc], "initWithIdentifier:", 0);
  v14[3] = v4;
  v5 = -[PECopyEditsSetting initWithIdentifier:]([PECopyEditsSetting alloc], "initWithIdentifier:", 1);
  v14[4] = v5;
  v6 = -[PECopyEditsSetting initWithIdentifier:]([PECopyEditsSetting alloc], "initWithIdentifier:", 2);
  v14[5] = v6;
  v7 = -[PECopyEditsSetting initWithIdentifier:]([PECopyEditsSetting alloc], "initWithIdentifier:", 3);
  v14[6] = v7;
  v8 = -[PECopyEditsSetting initWithIdentifier:]([PECopyEditsSetting alloc], "initWithIdentifier:", 4);
  v14[7] = v8;
  v9 = -[PECopyEditsSetting initWithIdentifier:]([PECopyEditsSetting alloc], "initWithIdentifier:", 5);
  v14[8] = v9;
  v10 = -[PECopyEditsSetting initWithIdentifier:]([PECopyEditsSetting alloc], "initWithIdentifier:", 6);
  v14[9] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
