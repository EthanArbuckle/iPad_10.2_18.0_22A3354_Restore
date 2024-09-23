@implementation PSGAccessoryDetailsController

- (PSGAccessoryDetailsController)init
{
  PSGAccessoryDetailsController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSGAccessoryDetailsController;
  v2 = -[PSGAccessoryDetailsController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7BC8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7BE0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7BD0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7BF0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7C08], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7BF8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7C00], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  EAAccessory *accessory;
  EAAccessory *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  accessory = self->_accessory;
  if (accessory)
  {
    -[EAAccessory setDelegate:](accessory, "setDelegate:", 0);
    v5 = self->_accessory;
    self->_accessory = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)PSGAccessoryDetailsController;
  -[PSGAccessoryDetailsController dealloc](&v6, sel_dealloc);
}

- (id)specifiers
{
  id v3;
  void *v4;
  void *v5;
  EAAccessory **p_accessory;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  char **v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PSGAccessoryDetailsController specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    p_accessory = &self->_accessory;
    objc_storeStrong((id *)&self->_accessory, v5);
    -[EAAccessory setDelegate:](self->_accessory, "setDelegate:", self);
    -[EAAccessory bonjourName](self->_accessory, "bonjourName");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = -[EAAccessory isAvailableOverBonjour](*p_accessory, "isAvailableOverBonjour");

      if (v9)
      {
        v10 = -[EAAccessory hasIPConnection](*p_accessory, "hasIPConnection");
        v11 = (void *)MEMORY[0x24BE75590];
        PSG_BundleForGeneralSettingsUIFramework();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v10)
          v14 = CFSTR("DISCONNECT");
        else
          v14 = CFSTR("CONNECT");
        if (v10)
          v15 = &selRef_disconnect;
        else
          v15 = &selRef_connect;
        objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24F9C95C8, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, self, 0, 0, 0, 13, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setButtonAction:", *v15);
        objc_msgSend(v17, "setIdentifier:", CFSTR("CONNECT_BUTTON"));
        objc_msgSend(v3, "addObject:", v17);

      }
    }
    if (-[EAAccessory isConnected](*p_accessory, "isConnected"))
    {
      -[EAAccessory manufacturer](*p_accessory, "manufacturer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");

      v20 = (_QWORD *)MEMORY[0x24BE759C8];
      if (v19)
      {
        v21 = (void *)MEMORY[0x24BE75590];
        PSG_BundleForGeneralSettingsUIFramework();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("MANUFACTURER"), &stru_24F9C95C8, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, self, 0, sel_manufacturer, 0, 4, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "setIdentifier:", CFSTR("MANUFACTURER"));
        objc_msgSend(v24, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v20);
        objc_msgSend(v3, "addObject:", v24);

      }
      -[EAAccessory modelNumber](*p_accessory, "modelNumber");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "length");

      if (v26)
      {
        v27 = (void *)MEMORY[0x24BE75590];
        PSG_BundleForGeneralSettingsUIFramework();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("MODELNUMBER"), &stru_24F9C95C8, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, self, 0, sel_modelNumber, 0, 4, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "setIdentifier:", CFSTR("MODELNUMBER"));
        objc_msgSend(v30, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v20);
        objc_msgSend(v3, "addObject:", v30);

      }
      -[EAAccessory serialNumber](*p_accessory, "serialNumber");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "length");

      if (v32)
      {
        v33 = (void *)MEMORY[0x24BE75590];
        PSG_BundleForGeneralSettingsUIFramework();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("SERIALNUMBER"), &stru_24F9C95C8, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v35, self, 0, sel_serialNumber, 0, 4, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "setIdentifier:", CFSTR("SERIALNUMBER"));
        objc_msgSend(v36, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v20);
        objc_msgSend(v3, "addObject:", v36);

      }
      -[EAAccessory firmwareRevision](*p_accessory, "firmwareRevision");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "length");

      if (v38)
      {
        v39 = (void *)MEMORY[0x24BE75590];
        PSG_BundleForGeneralSettingsUIFramework();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("FIRMWAREREVISION"), &stru_24F9C95C8, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v41, self, 0, sel_firmwareRevision, 0, 4, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "setIdentifier:", CFSTR("FIRMWAREREVISION"));
        objc_msgSend(v42, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v20);
        objc_msgSend(v3, "addObject:", v42);

      }
      -[EAAccessory hardwareRevision](*p_accessory, "hardwareRevision");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "length");

      if (v44)
      {
        v45 = (void *)MEMORY[0x24BE75590];
        PSG_BundleForGeneralSettingsUIFramework();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("HARDWAREREVISION"), &stru_24F9C95C8, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v47, self, 0, sel_hardwareRevision, 0, 4, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "setIdentifier:", CFSTR("HARDWAREREVISION"));
        objc_msgSend(v48, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v20);
        objc_msgSend(v3, "addObject:", v48);

      }
      if (-[EAAccessory supportsPublicIap](*p_accessory, "supportsPublicIap"))
      {
        v49 = (void *)MEMORY[0x24BE75590];
        PSG_BundleForGeneralSettingsUIFramework();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("FIND_APP_FOR_ACCESSORY"), &stru_24F9C95C8, 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v51, self, 0, 0, 0, 13, 0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v52, "setButtonAction:", sel_findAppForAccessory);
        objc_msgSend(v52, "setIdentifier:", CFSTR("FIND_APP_FOR_ACCESSORY"));
        objc_msgSend(v3, "addObject:", v52);

      }
    }
  }
  v53 = (int)*MEMORY[0x24BE756E0];
  v54 = *(Class *)((char *)&self->super.super.super.super.super.isa + v53);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v53) = (Class)v3;
  v55 = v3;

  v56 = *(id *)((char *)&self->super.super.super.super.super.isa + v53);
  return v56;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  PSGAccessoryDetailsController *v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSGAccessoryDetailsController;
  -[PSGAccessoryDetailsController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  if (self->_shouldEscape)
  {
    -[PSGAccessoryDetailsController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (PSGAccessoryDetailsController *)objc_claimAutoreleasedReturnValue();

    if (v5 == self)
    {
      -[PSGAccessoryDetailsController navigationController](self, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

    }
  }
  self->_finishedAppearing = 1;
}

- (id)manufacturer
{
  return -[EAAccessory manufacturer](self->_accessory, "manufacturer");
}

- (id)modelNumber
{
  return -[EAAccessory modelNumber](self->_accessory, "modelNumber");
}

- (id)serialNumber
{
  return -[EAAccessory serialNumber](self->_accessory, "serialNumber");
}

- (id)firmwareRevision
{
  return -[EAAccessory firmwareRevision](self->_accessory, "firmwareRevision");
}

- (id)hardwareRevision
{
  return -[EAAccessory hardwareRevision](self->_accessory, "hardwareRevision");
}

- (id)bonjourName
{
  return (id)-[EAAccessory bonjourName](self->_accessory, "bonjourName");
}

- (void)connect
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EAAccessory bonjourName](self->_accessory, "bonjourName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initiateConnectionToIPAccessory:", v3);

}

- (void)disconnect
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EAAccessory bonjourName](self->_accessory, "bonjourName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disconnectIPAccessory:", v3);

}

- (void)findAppForAccessory
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  PSGAccessoryDetailsController *v40;
  id obj;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("action"), CFSTR("accessory-lookup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  objc_msgSend(v3, "addObject:", v4);

  v40 = self;
  -[EAAccessory allPublicProtocolStrings](self->_accessory, "allPublicProtocolStrings");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x24BDD1838];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("id%d"), v9 + i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "queryItemWithName:value:", v13, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      v9 = (v9 + i);
    }
    while (v7);
  }
  v15 = (void *)MEMORY[0x24BDD1838];
  -[EAAccessory preferredApp](v40->_accessory, "preferredApp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queryItemWithName:value:", CFSTR("bid"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v17);

  v18 = (void *)MEMORY[0x24BDD1838];
  -[EAAccessory name](v40->_accessory, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "queryItemWithName:value:", CFSTR("accessoryName"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v20);

  v21 = (void *)MEMORY[0x24BDD1838];
  -[EAAccessory manufacturer](v40->_accessory, "manufacturer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "queryItemWithName:value:", CFSTR("manufacturer"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v23);

  v24 = (void *)MEMORY[0x24BDD1838];
  -[EAAccessory modelNumber](v40->_accessory, "modelNumber");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "queryItemWithName:value:", CFSTR("modelNumber"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v26);

  v27 = (void *)MEMORY[0x24BDD1838];
  -[EAAccessory firmwareRevision](v40->_accessory, "firmwareRevision");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "queryItemWithName:value:", CFSTR("firmwareVersion"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v29);

  v30 = (void *)MEMORY[0x24BDD1838];
  -[EAAccessory hardwareRevision](v40->_accessory, "hardwareRevision");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "queryItemWithName:value:", CFSTR("hardwareVersion"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v32);

  v33 = (void *)MEMORY[0x24BDD1838];
  -[EAAccessory serialNumber](v40->_accessory, "serialNumber");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "queryItemWithName:value:", CFSTR("serialNumber"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v35);

  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", CFSTR("itms-apps://?"));
  objc_msgSend(v36, "setQueryItems:", v5);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "URL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __52__PSGAccessoryDetailsController_findAppForAccessory__block_invoke;
  v42[3] = &unk_24F9C7FB8;
  v43 = v36;
  v39 = v36;
  objc_msgSend(v37, "openURL:options:completionHandler:", v38, MEMORY[0x24BDBD1B8], v42);

}

void __52__PSGAccessoryDetailsController_findAppForAccessory__block_invoke(uint64_t a1, char a2)
{
  id v2;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("could not open URL %@"), v2);

  }
}

- (void)_accessoryDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  EAAccessory **p_accessory;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  int v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  char *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  PSGAccessoryDetailsController *v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;

  v100 = a3;
  objc_msgSend(v100, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDC7BD8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDelegate:", self);
  if (!v5)
  {
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "bonjourName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "bonjourName");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_8;
    objc_msgSend(v5, "name");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_8:
  p_accessory = &self->_accessory;
  -[EAAccessory name](self->_accessory, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", v10))
  {

    goto LABEL_11;
  }
  -[EAAccessory bonjourName](*p_accessory, "bonjourName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqualToString:", v11);

  if (v12)
  {
LABEL_11:
    -[PSGAccessoryDetailsController specifierForID:](self, "specifierForID:", CFSTR("CONNECT_BUTTON"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAccessoryDetailsController specifierForID:](self, "specifierForID:", CFSTR("MANUFACTURER"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAccessoryDetailsController specifierForID:](self, "specifierForID:", CFSTR("MODELNUMBER"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAccessoryDetailsController specifierForID:](self, "specifierForID:", CFSTR("SERIALNUMBER"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAccessoryDetailsController specifierForID:](self, "specifierForID:", CFSTR("FIRMWAREREVISION"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAccessoryDetailsController specifierForID:](self, "specifierForID:", CFSTR("HARDWAREREVISION"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAccessoryDetailsController specifierForID:](self, "specifierForID:", CFSTR("FIND_APP_FOR_ACCESSORY"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAccessoryDetailsController beginUpdates](self, "beginUpdates");
    objc_msgSend(v100, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v16;
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDC7BC8]))
    {
      v18 = objc_msgSend(v5, "isConnected");

      if (v18)
      {
        v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if (v13)
          objc_msgSend(v19, "addObject:", v13);
        if (v14)
          objc_msgSend(v19, "addObject:", v14);
        if (v15)
          objc_msgSend(v19, "addObject:", v15);
        if (v16)
          objc_msgSend(v19, "addObject:", v16);
        if (v99)
          objc_msgSend(v19, "addObject:");
        if (v98)
          objc_msgSend(v19, "addObject:");
        v90 = v20;
        v92 = v15;
        v94 = v14;
        if (objc_msgSend(v19, "count"))
          -[PSGAccessoryDetailsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v19, 1);
        objc_msgSend(v5, "manufacturer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length");

        v23 = (_QWORD *)MEMORY[0x24BE759C8];
        v88 = v19;
        if (v22)
        {
          v24 = (void *)MEMORY[0x24BE75590];
          PSG_BundleForGeneralSettingsUIFramework();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("MANUFACTURER"), &stru_24F9C95C8, 0);
          v26 = v13;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v27, self, 0, sel_manufacturer, 0, 4, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "setIdentifier:", CFSTR("MANUFACTURER"));
          objc_msgSend(v28, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v23);
          objc_msgSend(v90, "addObject:", v28);
          v13 = v28;
        }
        v29 = v23;
        objc_msgSend(v5, "modelNumber");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "length");

        v89 = v13;
        if (v31)
        {
          v32 = (void *)MEMORY[0x24BE75590];
          PSG_BundleForGeneralSettingsUIFramework();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("MODELNUMBER"), &stru_24F9C95C8, 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v34, self, 0, sel_modelNumber, 0, 4, 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "setIdentifier:", CFSTR("MODELNUMBER"));
          objc_msgSend(v35, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v23);
          v36 = v90;
          objc_msgSend(v90, "addObject:", v35);
          v94 = v35;
        }
        else
        {
          v36 = v90;
        }
        objc_msgSend(v5, "serialNumber");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "length");

        if (v42)
        {
          v43 = (void *)MEMORY[0x24BE75590];
          PSG_BundleForGeneralSettingsUIFramework();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("SERIALNUMBER"), &stru_24F9C95C8, 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v45, self, 0, sel_serialNumber, 0, 4, 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v46, "setIdentifier:", CFSTR("SERIALNUMBER"));
          objc_msgSend(v46, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v29);
          objc_msgSend(v36, "addObject:", v46);
          v92 = v46;
        }
        objc_msgSend(v5, "firmwareRevision");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "length");

        if (v48)
        {
          v49 = (void *)MEMORY[0x24BE75590];
          PSG_BundleForGeneralSettingsUIFramework();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("FIRMWAREREVISION"), &stru_24F9C95C8, 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v51, self, 0, sel_firmwareRevision, 0, 4, 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v52, "setIdentifier:", CFSTR("FIRMWAREREVISION"));
          v53 = v36;
          v54 = v29;
          objc_msgSend(v52, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v29);
          objc_msgSend(v53, "addObject:", v52);
          v55 = v52;
        }
        else
        {
          v54 = v29;
          v55 = v16;
        }
        objc_msgSend(v5, "hardwareRevision");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "length");

        v97 = v55;
        if (v57)
        {
          v58 = (void *)MEMORY[0x24BE75590];
          PSG_BundleForGeneralSettingsUIFramework();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("HARDWAREREVISION"), &stru_24F9C95C8, 0);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v60, self, 0, sel_hardwareRevision, 0, 4, 0);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v61, "setIdentifier:", CFSTR("HARDWAREREVISION"));
          objc_msgSend(v61, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v54);
          v62 = v90;
          objc_msgSend(v90, "addObject:", v61);
          v99 = v61;
          v37 = v88;
        }
        else
        {
          v37 = v88;
          v62 = v90;
        }
        if (objc_msgSend(v5, "supportsPublicIap"))
        {
          v63 = (void *)MEMORY[0x24BE75590];
          PSG_BundleForGeneralSettingsUIFramework();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("FIND_APP_FOR_ACCESSORY"), &stru_24F9C95C8, 0);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v65, self, 0, 0, 0, 13, 0);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v66, "setButtonAction:", sel_findAppForAccessory);
          objc_msgSend(v66, "setIdentifier:", CFSTR("FIND_APP_FOR_ACCESSORY"));
          objc_msgSend(v62, "addObject:", v66);
          v98 = v66;
        }
        v13 = v89;
        v15 = v92;
        v14 = v94;
        if (objc_msgSend(v62, "count"))
          -[PSGAccessoryDetailsController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", v62, 1);

        goto LABEL_63;
      }
    }
    else
    {

    }
    objc_msgSend(v100, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "isEqualToString:", *MEMORY[0x24BDC7BD0]))
    {
      v38 = objc_msgSend(v5, "isConnected");

      if ((v38 & 1) == 0)
      {
        objc_msgSend(v5, "bonjourName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v37 = v40;
          if (v13)
            objc_msgSend(v40, "addObject:", v13);
          if (v14)
            objc_msgSend(v37, "addObject:", v14);
          if (v15)
            objc_msgSend(v37, "addObject:", v15);
          if (v16)
            objc_msgSend(v37, "addObject:", v16);
          if (v99)
            objc_msgSend(v37, "addObject:", v99);
          if (v98)
            objc_msgSend(v37, "addObject:");
          if (objc_msgSend(v37, "count"))
            -[PSGAccessoryDetailsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v37, 1);
          goto LABEL_63;
        }
        v67 = 1;
        if (self->_finishedAppearing)
          goto LABEL_65;
        self->_shouldEscape = 1;
      }
LABEL_64:
      v67 = 0;
LABEL_65:
      objc_msgSend(v5, "bonjourName");
      v68 = objc_claimAutoreleasedReturnValue();
      if (v68 && (v69 = (void *)v68, v70 = objc_msgSend(v5, "isAvailableOverBonjour"), v69, v70))
      {
        objc_msgSend(v100, "name");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v71, "isEqualToString:", *MEMORY[0x24BDC7BF8]))
        {
          v72 = objc_msgSend(v5, "hasIPConnection");

          if (v72)
          {
            v93 = v15;
            v95 = v14;
            if (v96)
            {
              v91 = -[PSGAccessoryDetailsController indexOfSpecifier:](self, "indexOfSpecifier:", v96);
              -[PSGAccessoryDetailsController removeSpecifier:animated:](self, "removeSpecifier:animated:", v96, 1);
            }
            else
            {
              v91 = 1;
            }
            v76 = (void *)MEMORY[0x24BE75590];
            PSG_BundleForGeneralSettingsUIFramework();
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("DISCONNECT"), &stru_24F9C95C8, 0);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v78, self, 0, 0, 0, 13, 0);
            v79 = (void *)objc_claimAutoreleasedReturnValue();

            v80 = sel_disconnect;
            goto LABEL_91;
          }
        }
        else
        {

        }
        objc_msgSend(v100, "name");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v74, "isEqualToString:", *MEMORY[0x24BDC7C00]))
        {
          v75 = objc_msgSend(v5, "hasIPConnection");

          if ((v75 & 1) == 0)
          {
            v93 = v15;
            v95 = v14;
            if (v96)
            {
              v91 = -[PSGAccessoryDetailsController indexOfSpecifier:](self, "indexOfSpecifier:", v96);
              -[PSGAccessoryDetailsController removeSpecifier:animated:](self, "removeSpecifier:animated:", v96, 1);
            }
            else
            {
              v91 = 1;
            }
            v81 = (void *)MEMORY[0x24BE75590];
            PSG_BundleForGeneralSettingsUIFramework();
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("CONNECT"), &stru_24F9C95C8, 0);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v83, self, 0, 0, 0, 13, 0);
            v79 = (void *)objc_claimAutoreleasedReturnValue();

            v80 = sel_connect;
LABEL_91:
            objc_msgSend(v79, "setButtonAction:", v80);
            objc_msgSend(v79, "setIdentifier:", CFSTR("CONNECT_BUTTON"));
            -[PSGAccessoryDetailsController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v79, v91, 1);
            -[PSGAccessoryDetailsController endUpdates](self, "endUpdates");
            v96 = v79;
            v15 = v93;
            v14 = v95;
            if ((v67 & 1) != 0)
            {
LABEL_92:
              -[PSGAccessoryDetailsController navigationController](self, "navigationController");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "topViewController");
              v85 = (PSGAccessoryDetailsController *)objc_claimAutoreleasedReturnValue();

              if (v85 == self)
              {
                -[PSGAccessoryDetailsController navigationController](self, "navigationController");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                v87 = (id)objc_msgSend(v86, "popViewControllerAnimated:", 1);

              }
            }
LABEL_94:
            objc_storeStrong((id *)p_accessory, v5);

            goto LABEL_95;
          }
LABEL_78:
          -[PSGAccessoryDetailsController endUpdates](self, "endUpdates");
          if (v67)
            goto LABEL_92;
          goto LABEL_94;
        }

      }
      else
      {
        objc_msgSend(v5, "bonjourName");
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v73)
          goto LABEL_78;
        if (self->_finishedAppearing)
        {
          -[PSGAccessoryDetailsController endUpdates](self, "endUpdates");
          goto LABEL_92;
        }
        self->_shouldEscape = 1;
      }
      -[PSGAccessoryDetailsController endUpdates](self, "endUpdates");
      if ((v67 & 1) != 0)
        goto LABEL_92;
      goto LABEL_94;
    }
LABEL_63:

    goto LABEL_64;
  }
LABEL_95:

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PSGAccessoryDetailsController;
  v6 = a4;
  -[PSGAccessoryDetailsController tableView:cellForRowAtIndexPath:](&v13, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PSGAccessoryDetailsController indexForIndexPath:](self, "indexForIndexPath:", v6, v13.receiver, v13.super_class);

  -[PSGAccessoryDetailsController specifierAtIndex:](self, "specifierAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v10, "isEqualToString:", CFSTR("SERIALNUMBER"));

  if ((_DWORD)v6)
  {
    objc_msgSend(v7, "detailTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
