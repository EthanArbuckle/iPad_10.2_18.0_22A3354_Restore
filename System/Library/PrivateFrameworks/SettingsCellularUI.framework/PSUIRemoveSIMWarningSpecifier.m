@implementation PSUIRemoveSIMWarningSpecifier

- (PSUIRemoveSIMWarningSpecifier)initWithPlanUniversalReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PSUIRemoveSIMWarningSpecifier *v8;
  PSUIRemoveSIMWarningSpecifier *v9;
  __CFString *v10;
  void *v11;
  PSUIRemoveSIMWarningSpecifier *v12;
  PSUIRemoveSIMWarningSpecifier *v13;
  objc_super v15;
  objc_super v16;

  v4 = a3;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "planFromReferenceSafe:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[PSUIRemoveSIMWarningSpecifier getTransferredTitle:](PSUIRemoveSIMWarningSpecifier, "getTransferredTitle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v6, "transferredStatus") == 4)
  {
    v16.receiver = self;
    v16.super_class = (Class)PSUIRemoveSIMWarningSpecifier;
    v8 = -[PSUIRemoveSIMWarningSpecifier initWithName:target:set:get:detail:cell:edit:](&v16, sel_initWithName_target_set_get_detail_cell_edit_, 0, 0, 0, 0, 0, 0, 0);
    v9 = v8;
    if (v8)
    {
      -[PSUIRemoveSIMWarningSpecifier setIdentifier:](v8, "setIdentifier:", CFSTR("PLAN_TRANSFER_COMPLETED_GROUP"));
      -[PSUIRemoveSIMWarningSpecifier setProperty:forKey:](v9, "setProperty:forKey:", v7, *MEMORY[0x24BE75A68]);
      v10 = (__CFString *)*MEMORY[0x24BE75A28];
      v11 = &unk_24D51C308;
      v12 = v9;
LABEL_9:
      -[PSUIRemoveSIMWarningSpecifier setProperty:forKey:](v12, "setProperty:forKey:", v11, v10);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PSUIRemoveSIMWarningSpecifier;
    v9 = -[PSUIRemoveSIMWarningSpecifier initWithName:target:set:get:detail:cell:edit:](&v15, sel_initWithName_target_set_get_detail_cell_edit_, 0, 0, 0, 0, 0, 3, 0);
    if (v9)
    {
      -[PSUIRemoveSIMWarningSpecifier setProperty:forKey:](v9, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      v10 = CFSTR("RemoveSIMWarningKey");
      v12 = v9;
      v11 = v7;
      goto LABEL_9;
    }
  }
  v13 = v9;

  return v13;
}

+ (id)getTransferredTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;

  v3 = a3;
  if (objc_msgSend(v3, "type") || objc_msgSend(v3, "transferredStatus") != 4)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TRANSFER_COMPLETED_DELETE_IPAD_%@"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "transferredToDeviceDisplayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "phoneNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      v13 = objc_msgSend(v3, "type");
      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v15;
      if (v12)
      {
        if (v13 == 2)
          v16 = CFSTR("TRANSFER_COMPLETED_DELETE_ESIM_WITH_NUMBER_%@_%@");
        else
          v16 = CFSTR("TRANSFER_COMPLETED_REMOVE_SIM_WITH_NUMBER_%@_%@");
        objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "phoneNumber");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[SettingsCellularUtils formattedPhoneNumber:](SettingsCellularUtils, "formattedPhoneNumber:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "transferredToDeviceDisplayName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", v9, v18, v19);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      if (v13 == 2)
        v20 = CFSTR("TRANSFER_COMPLETED_DELETE_ESIM_CARRIER_%@_%@");
      else
        v20 = CFSTR("TRANSFER_COMPLETED_REMOVE_SIM_CARRIER_%@_%@");
      objc_msgSend(v15, "localizedStringForKey:value:table:", v20, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "carrierName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "transferredToDeviceDisplayName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v9, v10, v21);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CONVERSION_COMPLETED_REMOVE_SIM"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v5;
}

@end
