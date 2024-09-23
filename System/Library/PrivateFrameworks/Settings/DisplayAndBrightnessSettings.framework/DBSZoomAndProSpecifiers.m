@implementation DBSZoomAndProSpecifiers

+ (BOOL)specifiersPresentIn:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "specifierForID:", CFSTR("DISPLAY_ZOOM_PRO_GROUP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (void)removeSpecifiersFrom:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specifierForID:", CFSTR("DISPLAY_ZOOM_PRO_GROUP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(v7, "specifierForID:", CFSTR("MAGNIFY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  objc_msgSend(v7, "specifierForID:", CFSTR("ADVANCED_LINK_GROUP_ID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v7, "removeContiguousSpecifiers:animated:", v3, 1);

}

- (NSArray)specifiers
{
  NSMutableArray *specifiers;
  NSMutableArray *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  _QWORD *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  PSSpecifier *v26;
  PSSpecifier *advancedSpecifier;
  NSMutableArray *v28;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75498], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "capabilityBoolAnswer:", *MEMORY[0x24BE75C48]);

    objc_msgSend(MEMORY[0x24BE75498], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "capabilityBoolAnswer:", *MEMORY[0x24BE75A00]);

    v9 = (_QWORD *)MEMORY[0x24BE75AC0];
    if (v8 && (v6 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x24BE75590];
      if (DBSChamoisEnabled())
        v11 = CFSTR("DISPLAY_ZOOM_PRO");
      else
        v11 = CFSTR("DISPLAY_ZOOM_LEGACY");
      DBS_LocalizedStringForDisplays(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "groupSpecifierWithID:name:", CFSTR("DISPLAY_ZOOM_PRO_GROUP"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[DBSZoomAndProSpecifiers _displayZoomFooterText](self, "_displayZoomFooterText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setProperty:forKey:", v14, *MEMORY[0x24BE75A68]);
      -[NSMutableArray addObject:](v4, "addObject:", v13);
      v15 = (void *)MEMORY[0x24BE75590];
      if (DBSChamoisEnabled())
        v16 = CFSTR("VIEW");
      else
        v16 = CFSTR("VIEW_LEGACY");
      DBS_LocalizedStringForDisplays(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, sel_localizedMagnifyModeName, 0, 2, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("MAGNIFY"), *v9);
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "sf_isiPad");

      if (v20)
      {
        objc_msgSend(v18, "setButtonAction:", sel_presentModalMagnifyController);
        objc_msgSend(v18, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
      }
      else
      {
        objc_msgSend(v18, "setDetailControllerClass:", objc_opt_class());
      }
      -[NSMutableArray addObject:](v4, "addObject:", v18);

    }
    -[DBSZoomAndProSpecifiers delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "proModeSupported");

    if (v22)
    {
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ADVANCED_LINK_GROUP_ID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v4, "addObject:", v23);
      v24 = (void *)MEMORY[0x24BE75590];
      DBS_LocalizedStringForDisplays(CFSTR("ADVANCED"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, self, 0, sel_advancedDetailString_, objc_opt_class(), 2, 0);
      v26 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      advancedSpecifier = self->_advancedSpecifier;
      self->_advancedSpecifier = v26;

      -[PSSpecifier setObject:forKeyedSubscript:](self->_advancedSpecifier, "setObject:forKeyedSubscript:", CFSTR("ADVANCED"), *v9);
      -[NSMutableArray addObject:](v4, "addObject:", self->_advancedSpecifier);

    }
    v28 = self->_specifiers;
    self->_specifiers = v4;

    specifiers = self->_specifiers;
  }
  return (NSArray *)specifiers;
}

- (id)_displayZoomFooterText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;

  +[DBSDisplayZoomConfigurationController defaultController](DBSDisplayZoomConfigurationController, "defaultController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayZoomModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  DBSStringForDisplayZoomOption(1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DBSStringForDisplayZoomOption(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DBSStringForDisplayZoomOption(2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSZoomAndProSpecifiers delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectedDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v9)
  {
    if (v10)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v6);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        objc_msgSend(v4, "objectForKeyedSubscript:", v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = CFSTR("DEFAULT_DISPLAY_ZOOMED_STANDARD_DENSE_DESCRIPTION");
LABEL_27:
          DBS_LocalizedStringForDisplays(v20);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29
      && (v30 = (void *)v29,
          objc_msgSend(v4, "objectForKeyedSubscript:", v6),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v31,
          v30,
          v31))
    {
      v20 = CFSTR("DEFAULT_DISPLAY_ZOOMED_STANDARD_DESCRIPTION");
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v7);
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32
        && (v33 = (void *)v32,
            objc_msgSend(v4, "objectForKeyedSubscript:", v6),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            v34,
            v33,
            v34))
      {
        v20 = CFSTR("DEFAULT_DISPLAY_STANDARD_DENSE_DESCRIPTION");
      }
      else
      {
        v20 = CFSTR("DEFAULT_DISPLAY_ZOOM_DEFAULT_DESCRIPTION");
      }
    }
    goto LABEL_27;
  }
  if (!v10)
    goto LABEL_11;
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_11;
  }
  v13 = (void *)v12;
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
LABEL_11:
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21
      && (v22 = (void *)v21,
          objc_msgSend(v4, "objectForKeyedSubscript:", v6),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v23,
          v22,
          v23))
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      v16 = CFSTR("EXTERNALDISPLAY_DISPLAY_ZOOMED_STANDARD_DESCRIPTION");
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v7);
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24
        && (v25 = (void *)v24,
            objc_msgSend(v4, "objectForKeyedSubscript:", v6),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v26,
            v25,
            v26))
      {
        v15 = (void *)MEMORY[0x24BDD17C8];
        v16 = CFSTR("EXTERNALDISPLAY_DISPLAY_STANDARD_DENSE_DESCRIPTION");
      }
      else
      {
        v15 = (void *)MEMORY[0x24BDD17C8];
        v16 = CFSTR("EXTERNALDISPLAY_DISPLAY_ZOOM_DEFAULT_DESCRIPTION");
      }
    }
    goto LABEL_18;
  }
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = CFSTR("EXTERNALDISPLAY_DISPLAY_ZOOMED_STANDARD_DENSE_DESCRIPTION");
LABEL_18:
  DBS_LocalizedStringForDisplays(v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringWithFormat:", v27, v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
  return v28;
}

- (id)localizedMagnifyModeName
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[DBSZoomAndProSpecifiers delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[DBSZoomAndProSpecifiers delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedMagnifyModeName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[DBSDisplayZoomConfigurationController defaultController](DBSDisplayZoomConfigurationController, "defaultController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentDisplayZoomMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)presentModalMagnifyController
{
  id v2;

  -[DBSZoomAndProSpecifiers delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentModalMagnifyController");

}

- (id)advancedDetailString:(id)a3
{
  void *v3;
  int v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReference");

  if (v4)
  {
    DBS_LocalizedStringForDisplays(CFSTR("REFERENCE_MODE_ON"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24F026548;
  }
  return v5;
}

- (DBSZoomAndProSpecifiersDelegate)delegate
{
  return (DBSZoomAndProSpecifiersDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PSSpecifier)advancedSpecifier
{
  return self->_advancedSpecifier;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_advancedSpecifier, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end
