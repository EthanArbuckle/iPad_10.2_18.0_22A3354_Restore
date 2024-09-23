@implementation UNCNotificationTopicRecord

- (UNCNotificationTopicRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  UNCNotificationTopicRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)UNCNotificationTopicRecord;
  v5 = -[UNCNotificationTopicRecord init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "objectForKey:", CFSTR("DisplayName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setDisplayName:](v5, "setDisplayName:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("DisplayNameLocalizationKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setDisplayNameLocalizationKey:](v5, "setDisplayNameLocalizationKey:", v8);

    objc_msgSend(v4, "objectForKey:", CFSTR("Priority"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setPriority:](v5, "setPriority:", (int)objc_msgSend(v9, "intValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("SortIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setSortIdentifier:](v5, "setSortIdentifier:", v10);

    objc_msgSend(v4, "objectForKey:", CFSTR("Alert"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setSupportsAlerts:](v5, "setSupportsAlerts:", objc_msgSend(v11, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("Badge"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setSupportsBadges:](v5, "setSupportsBadges:", objc_msgSend(v12, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("LockScreen"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setSupportsLockScreen:](v5, "setSupportsLockScreen:", objc_msgSend(v13, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("NotificationCenter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setSupportsNotificationCenter:](v5, "setSupportsNotificationCenter:", objc_msgSend(v14, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("CarPlay"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setSupportsCarPlay:](v5, "setSupportsCarPlay:", objc_msgSend(v15, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("Spoken"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setSupportsSpoken:](v5, "setSupportsSpoken:", objc_msgSend(v16, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("CriticalAlert"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setSupportsCriticalAlerts:](v5, "setSupportsCriticalAlerts:", objc_msgSend(v17, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("TimeSensitive"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setSupportsTimeSensitive:](v5, "setSupportsTimeSensitive:", objc_msgSend(v18, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("Sound"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setSupportsSounds:](v5, "setSupportsSounds:", objc_msgSend(v19, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("EnablesAlert"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setEnablesAlerts:](v5, "setEnablesAlerts:", objc_msgSend(v20, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("EnablesBadge"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setEnablesBadges:](v5, "setEnablesBadges:", objc_msgSend(v21, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("EnablesLockScreen"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setEnablesLockScreen:](v5, "setEnablesLockScreen:", objc_msgSend(v22, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("EnablesNotificationCenter"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setEnablesNotificationCenter:](v5, "setEnablesNotificationCenter:", objc_msgSend(v23, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("EnablesCarPlay"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setEnablesCarPlay:](v5, "setEnablesCarPlay:", objc_msgSend(v24, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("EnablesSpoken"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setEnablesSpoken:](v5, "setEnablesSpoken:", objc_msgSend(v25, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("EnablesCriticalAlert"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setEnablesCriticalAlerts:](v5, "setEnablesCriticalAlerts:", objc_msgSend(v26, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("EnablesSound"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setEnablesSounds:](v5, "setEnablesSounds:", objc_msgSend(v27, "un_safeBoolValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("Modal"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCNotificationTopicRecord setModalAlertStyle:](v5, "setModalAlertStyle:", objc_msgSend(v28, "un_safeBoolValue"));

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationTopicRecord identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v4, CFSTR("Identifier"));

  -[UNCNotificationTopicRecord displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v5, CFSTR("DisplayName"));

  -[UNCNotificationTopicRecord displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v6, CFSTR("DisplayNameLocalizationKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[UNCNotificationTopicRecord priority](self, "priority"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v7, CFSTR("Priority"));

  -[UNCNotificationTopicRecord sortIdentifier](self, "sortIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v8, CFSTR("SortIdentifier"));

  if (-[UNCNotificationTopicRecord supportsAlerts](self, "supportsAlerts"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("Alert"));
  if (-[UNCNotificationTopicRecord supportsBadges](self, "supportsBadges"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("Badge"));
  if (-[UNCNotificationTopicRecord supportsLockScreen](self, "supportsLockScreen"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("LockScreen"));
  if (-[UNCNotificationTopicRecord supportsNotificationCenter](self, "supportsNotificationCenter"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("NotificationCenter"));
  if (-[UNCNotificationTopicRecord supportsCarPlay](self, "supportsCarPlay"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("CarPlay"));
  if (-[UNCNotificationTopicRecord supportsSpoken](self, "supportsSpoken"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("Spoken"));
  if (-[UNCNotificationTopicRecord supportsCriticalAlerts](self, "supportsCriticalAlerts"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("CriticalAlert"));
  if (-[UNCNotificationTopicRecord supportsTimeSensitive](self, "supportsTimeSensitive"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("TimeSensitive"));
  if (-[UNCNotificationTopicRecord supportsSounds](self, "supportsSounds"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("Sound"));
  if (-[UNCNotificationTopicRecord enablesAlerts](self, "enablesAlerts"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("EnablesAlert"));
  if (-[UNCNotificationTopicRecord enablesBadges](self, "enablesBadges"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("EnablesBadge"));
  if (-[UNCNotificationTopicRecord enablesLockScreen](self, "enablesLockScreen"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("EnablesLockScreen"));
  if (-[UNCNotificationTopicRecord enablesNotificationCenter](self, "enablesNotificationCenter"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("EnablesNotificationCenter"));
  if (-[UNCNotificationTopicRecord enablesCarPlay](self, "enablesCarPlay"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("EnablesCarPlay"));
  if (-[UNCNotificationTopicRecord enablesSpoken](self, "enablesSpoken"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("EnablesSpoken"));
  if (-[UNCNotificationTopicRecord enablesCriticalAlerts](self, "enablesCriticalAlerts"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("EnablesCriticalAlert"));
  if (-[UNCNotificationTopicRecord enablesSounds](self, "enablesSounds"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("EnablesSound"));
  if (-[UNCNotificationTopicRecord modalAlertStyle](self, "modalAlertStyle"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("Modal"));
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationTopicRecord identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("Identifier"));

  -[UNCNotificationTopicRecord displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("DisplayName"));

  -[UNCNotificationTopicRecord displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("DisplayNameLocalizationKey"));

  v10 = (id)objc_msgSend(v3, "appendInteger:withName:", -[UNCNotificationTopicRecord priority](self, "priority"), CFSTR("Priority"));
  -[UNCNotificationTopicRecord sortIdentifier](self, "sortIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("SortIdentifier"));

  v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsAlerts](self, "supportsAlerts"), CFSTR("SupportsAlert"));
  v14 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsBadges](self, "supportsBadges"), CFSTR("SupportsBadge"));
  v15 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsLockScreen](self, "supportsLockScreen"), CFSTR("SupportsLockScreen"));
  v16 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsNotificationCenter](self, "supportsNotificationCenter"), CFSTR("SupportsNotificationCenter"));
  v17 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsCarPlay](self, "supportsCarPlay"), CFSTR("SupportsCarPlay"));
  v18 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsCriticalAlerts](self, "supportsCriticalAlerts"), CFSTR("SupportsCriticalAlert"));
  v19 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsTimeSensitive](self, "supportsTimeSensitive"), CFSTR("SupportsTimeSensitive"));
  v20 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsSounds](self, "supportsSounds"), CFSTR("SupportsSound"));
  v21 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsSpoken](self, "supportsSpoken"), CFSTR("SupportsSpoken"));
  v22 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesAlerts](self, "enablesAlerts"), CFSTR("EnablesAlert"));
  v23 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesBadges](self, "enablesBadges"), CFSTR("EnablesBadge"));
  v24 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesLockScreen](self, "enablesLockScreen"), CFSTR("EnablesLockScreen"));
  v25 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesNotificationCenter](self, "enablesNotificationCenter"), CFSTR("EnablesNotificationCenter"));
  v26 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesCarPlay](self, "enablesCarPlay"), CFSTR("EnablesCarPlay"));
  v27 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesCriticalAlerts](self, "enablesCriticalAlerts"), CFSTR("EnablesCriticalAlert"));
  v28 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesSounds](self, "enablesSounds"), CFSTR("EnablesSound"));
  v29 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesSpoken](self, "enablesSpoken"), CFSTR("EnablesSpoken"));
  v30 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord modalAlertStyle](self, "modalAlertStyle"), CFSTR("ModalAlertStyle"));
  objc_msgSend(v3, "build");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  _BOOL4 v38;

  v4 = a3;
  if (!v4)
    goto LABEL_25;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_25;
  -[UNCNotificationTopicRecord identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = UNSimilarStrings();

  if (!v8)
    goto LABEL_25;
  -[UNCNotificationTopicRecord displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = UNSimilarStrings();

  if (!v11)
    goto LABEL_25;
  -[UNCNotificationTopicRecord displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameLocalizationKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = UNSimilarStrings();

  if (!v14)
    goto LABEL_25;
  v15 = -[UNCNotificationTopicRecord priority](self, "priority");
  if (v15 != objc_msgSend(v4, "priority"))
    goto LABEL_25;
  -[UNCNotificationTopicRecord sortIdentifier](self, "sortIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = UNSimilarStrings();

  if (!v18)
    goto LABEL_25;
  v19 = -[UNCNotificationTopicRecord supportsAlerts](self, "supportsAlerts");
  if (v19 != objc_msgSend(v4, "supportsAlerts"))
    goto LABEL_25;
  v20 = -[UNCNotificationTopicRecord supportsBadges](self, "supportsBadges");
  if (v20 != objc_msgSend(v4, "supportsBadges"))
    goto LABEL_25;
  v21 = -[UNCNotificationTopicRecord supportsLockScreen](self, "supportsLockScreen");
  if (v21 != objc_msgSend(v4, "supportsLockScreen"))
    goto LABEL_25;
  v22 = -[UNCNotificationTopicRecord supportsNotificationCenter](self, "supportsNotificationCenter");
  if (v22 != objc_msgSend(v4, "supportsNotificationCenter"))
    goto LABEL_25;
  v23 = -[UNCNotificationTopicRecord supportsCarPlay](self, "supportsCarPlay");
  if (v23 != objc_msgSend(v4, "supportsCarPlay"))
    goto LABEL_25;
  v24 = -[UNCNotificationTopicRecord supportsCriticalAlerts](self, "supportsCriticalAlerts");
  if (v24 != objc_msgSend(v4, "supportsCriticalAlerts"))
    goto LABEL_25;
  v25 = -[UNCNotificationTopicRecord supportsTimeSensitive](self, "supportsTimeSensitive");
  if (v25 != objc_msgSend(v4, "supportsTimeSensitive"))
    goto LABEL_25;
  v26 = -[UNCNotificationTopicRecord supportsSounds](self, "supportsSounds");
  if (v26 != objc_msgSend(v4, "supportsSounds"))
    goto LABEL_25;
  v27 = -[UNCNotificationTopicRecord supportsSpoken](self, "supportsSpoken");
  if (v27 != objc_msgSend(v4, "supportsSpoken"))
    goto LABEL_25;
  v28 = -[UNCNotificationTopicRecord enablesAlerts](self, "enablesAlerts");
  if (v28 != objc_msgSend(v4, "enablesAlerts"))
    goto LABEL_25;
  v29 = -[UNCNotificationTopicRecord enablesBadges](self, "enablesBadges");
  if (v29 == objc_msgSend(v4, "enablesBadges")
    && (v30 = -[UNCNotificationTopicRecord enablesLockScreen](self, "enablesLockScreen"),
        v30 == objc_msgSend(v4, "enablesLockScreen"))
    && (v31 = -[UNCNotificationTopicRecord enablesNotificationCenter](self, "enablesNotificationCenter"),
        v31 == objc_msgSend(v4, "enablesNotificationCenter"))
    && (v32 = -[UNCNotificationTopicRecord enablesCarPlay](self, "enablesCarPlay"),
        v32 == objc_msgSend(v4, "enablesCarPlay"))
    && (v33 = -[UNCNotificationTopicRecord enablesCriticalAlerts](self, "enablesCriticalAlerts"),
        v33 == objc_msgSend(v4, "enablesCriticalAlerts"))
    && (v34 = -[UNCNotificationTopicRecord enablesSounds](self, "enablesSounds"),
        v34 == objc_msgSend(v4, "enablesSounds"))
    && (v35 = -[UNCNotificationTopicRecord enablesSpoken](self, "enablesSpoken"),
        v35 == objc_msgSend(v4, "enablesSpoken")))
  {
    v38 = -[UNCNotificationTopicRecord modalAlertStyle](self, "modalAlertStyle");
    v36 = v38 ^ objc_msgSend(v4, "modalAlertStyle") ^ 1;
  }
  else
  {
LABEL_25:
    LOBYTE(v36) = 0;
  }

  return v36;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationTopicRecord identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[UNCNotificationTopicRecord displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[UNCNotificationTopicRecord displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  v10 = (id)objc_msgSend(v3, "appendInteger:", -[UNCNotificationTopicRecord priority](self, "priority"));
  -[UNCNotificationTopicRecord sortIdentifier](self, "sortIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:", v11);

  v13 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsAlerts](self, "supportsAlerts"));
  v14 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsBadges](self, "supportsBadges"));
  v15 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsLockScreen](self, "supportsLockScreen"));
  v16 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsNotificationCenter](self, "supportsNotificationCenter"));
  v17 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsCarPlay](self, "supportsCarPlay"));
  v18 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsCriticalAlerts](self, "supportsCriticalAlerts"));
  v19 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsTimeSensitive](self, "supportsTimeSensitive"));
  v20 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsSounds](self, "supportsSounds"));
  v21 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsSpoken](self, "supportsSpoken"));
  v22 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesAlerts](self, "enablesAlerts"));
  v23 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesBadges](self, "enablesBadges"));
  v24 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesLockScreen](self, "enablesLockScreen"));
  v25 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesNotificationCenter](self, "enablesNotificationCenter"));
  v26 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesCarPlay](self, "enablesCarPlay"));
  v27 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesCriticalAlerts](self, "enablesCriticalAlerts"));
  v28 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesSounds](self, "enablesSounds"));
  v29 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesSpoken](self, "enablesSpoken"));
  v30 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord modalAlertStyle](self, "modalAlertStyle"));
  v31 = objc_msgSend(v3, "hash");

  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNCNotificationTopicRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dictionary"));

}

- (UNCNotificationTopicRecord)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UNCNotificationTopicRecord *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14, v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[UNCNotificationTopicRecord initWithDictionaryRepresentation:]([UNCNotificationTopicRecord alloc], "initWithDictionaryRepresentation:", v8);
  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (NSString)sortIdentifier
{
  return self->_sortIdentifier;
}

- (void)setSortIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)supportsAlerts
{
  return self->_supportsAlerts;
}

- (void)setSupportsAlerts:(BOOL)a3
{
  self->_supportsAlerts = a3;
}

- (BOOL)supportsBadges
{
  return self->_supportsBadges;
}

- (void)setSupportsBadges:(BOOL)a3
{
  self->_supportsBadges = a3;
}

- (BOOL)supportsSounds
{
  return self->_supportsSounds;
}

- (void)setSupportsSounds:(BOOL)a3
{
  self->_supportsSounds = a3;
}

- (BOOL)supportsLockScreen
{
  return self->_supportsLockScreen;
}

- (void)setSupportsLockScreen:(BOOL)a3
{
  self->_supportsLockScreen = a3;
}

- (BOOL)supportsNotificationCenter
{
  return self->_supportsNotificationCenter;
}

- (void)setSupportsNotificationCenter:(BOOL)a3
{
  self->_supportsNotificationCenter = a3;
}

- (BOOL)supportsCarPlay
{
  return self->_supportsCarPlay;
}

- (void)setSupportsCarPlay:(BOOL)a3
{
  self->_supportsCarPlay = a3;
}

- (BOOL)supportsSpoken
{
  return self->_supportsSpoken;
}

- (void)setSupportsSpoken:(BOOL)a3
{
  self->_supportsSpoken = a3;
}

- (BOOL)supportsCriticalAlerts
{
  return self->_supportsCriticalAlerts;
}

- (void)setSupportsCriticalAlerts:(BOOL)a3
{
  self->_supportsCriticalAlerts = a3;
}

- (BOOL)supportsTimeSensitive
{
  return self->_supportsTimeSensitive;
}

- (void)setSupportsTimeSensitive:(BOOL)a3
{
  self->_supportsTimeSensitive = a3;
}

- (BOOL)enablesAlerts
{
  return self->_enablesAlerts;
}

- (void)setEnablesAlerts:(BOOL)a3
{
  self->_enablesAlerts = a3;
}

- (BOOL)enablesBadges
{
  return self->_enablesBadges;
}

- (void)setEnablesBadges:(BOOL)a3
{
  self->_enablesBadges = a3;
}

- (BOOL)enablesSounds
{
  return self->_enablesSounds;
}

- (void)setEnablesSounds:(BOOL)a3
{
  self->_enablesSounds = a3;
}

- (BOOL)enablesLockScreen
{
  return self->_enablesLockScreen;
}

- (void)setEnablesLockScreen:(BOOL)a3
{
  self->_enablesLockScreen = a3;
}

- (BOOL)enablesNotificationCenter
{
  return self->_enablesNotificationCenter;
}

- (void)setEnablesNotificationCenter:(BOOL)a3
{
  self->_enablesNotificationCenter = a3;
}

- (BOOL)enablesCarPlay
{
  return self->_enablesCarPlay;
}

- (void)setEnablesCarPlay:(BOOL)a3
{
  self->_enablesCarPlay = a3;
}

- (BOOL)enablesSpoken
{
  return self->_enablesSpoken;
}

- (void)setEnablesSpoken:(BOOL)a3
{
  self->_enablesSpoken = a3;
}

- (BOOL)enablesCriticalAlerts
{
  return self->_enablesCriticalAlerts;
}

- (void)setEnablesCriticalAlerts:(BOOL)a3
{
  self->_enablesCriticalAlerts = a3;
}

- (BOOL)enablesTimeSensitive
{
  return self->_enablesTimeSensitive;
}

- (void)setEnablesTimeSensitive:(BOOL)a3
{
  self->_enablesTimeSensitive = a3;
}

- (BOOL)modalAlertStyle
{
  return self->_modalAlertStyle;
}

- (void)setModalAlertStyle:(BOOL)a3
{
  self->_modalAlertStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortIdentifier, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
