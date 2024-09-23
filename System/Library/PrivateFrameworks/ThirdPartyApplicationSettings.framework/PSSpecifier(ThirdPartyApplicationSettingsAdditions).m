@implementation PSSpecifier(ThirdPartyApplicationSettingsAdditions)

- (id)sui_image
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_opt_class();
  objc_msgSend(a1, "propertyForKey:", *MEMORY[0x24BE75AC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
    v5 = v4;
  else
    v2 = 0;

  return v2;
}

- (id)sui_titleString
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v9;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    objc_msgSend(a1, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "copy");
  }
  else
  {
    v7 = objc_msgSend(a1, "cellType");
    if (v7 <= 0xD && ((1 << v7) & 0x200A) != 0 || !objc_msgSend(a1, "hasValidGetter"))
    {
      v6 = 0;
      return v6;
    }
    objc_opt_class();
    objc_msgSend(a1, "performGetter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v4;
    else
      v9 = 0;
    v5 = v9;
  }
  v6 = v5;

  return v6;
}

- (id)sui_detailString
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  if (!objc_msgSend(a1, "hasValidGetter")
    || (objc_msgSend(a1, "performGetter"), (v2 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_14:
    objc_msgSend(a1, "propertyForKey:", *MEMORY[0x24BE75DA0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v3 = (void *)v2;
  if (objc_msgSend(a1, "cellType") == 9)
    goto LABEL_15;
  if (objc_msgSend(a1, "cellType") == 2 || objc_msgSend(a1, "cellType") == 4)
  {
    objc_msgSend(a1, "shortTitleDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "titleDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "objectForKeyedSubscript:", v3),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_opt_class();
    objc_msgSend(v5, "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    v3 = v7;
    if (!v9)
      goto LABEL_14;
  }
  else
  {

  }
LABEL_15:
  objc_opt_class();
  v10 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)sui_footerString
{
  id v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "cellType"))
  {
    v2 = 0;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(a1, "propertyForKey:", *MEMORY[0x24BE75A68]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v2 = v4;

  }
  return v2;
}

- (uint64_t)sui_BOOLValue
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;

  if (objc_msgSend(a1, "cellType") != 6
    || !objc_msgSend(a1, "hasValidSetter")
    || !objc_msgSend(a1, "hasValidGetter"))
  {
    return 0;
  }
  objc_msgSend(a1, "performGetter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = NSBOOLFromString();
  }
  else
  {
    objc_opt_class();
    v8 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
      v6 = objc_msgSend(v10, "BOOLValue");
    else
      v6 = 0;

  }
  return v6;
}

- (uint64_t)setSui_BOOLValue:()ThirdPartyApplicationSettingsAdditions
{
  void *v5;

  objc_msgSend(a1, "willChangeValueForKey:", CFSTR("sui_BOOLValue"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "performSetterWithValue:", v5);

  return objc_msgSend(a1, "didChangeValueForKey:", CFSTR("sui_BOOLValue"));
}

- (uint64_t)sui_prefersSubtitleAppearance
{
  objc_class *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (objc_class *)(id)objc_msgSend(a1, "propertyForKey:", *MEMORY[0x24BE75948]);
  if (!v2)
    return 0;
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("NOTIFICATIONS"), "isEqualToString:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(CFSTR("PSAppDataUsagePolicyTernaryControlTableCell"), "isEqualToString:", v3);

  return v5;
}

- (void)sui_loadValueFromCell
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(a1, "sui_prefersSubtitleAppearance"))
  {
    objc_msgSend(a1, "sui_createCellInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v5 = v2;
      objc_msgSend(v2, "refreshCellContentsWithSpecifier:", a1);
      objc_msgSend(v5, "detailTextLabel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "text");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "length"))
        objc_msgSend(a1, "setProperty:forKey:", v4, *MEMORY[0x24BE75DA0]);

      v2 = v5;
    }

  }
}

- (uint64_t)sui_isUserInteractive
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;

  if (objc_msgSend(a1, "controllerLoadAction")
    || !CFPreferencesGetAppBooleanValue(CFSTR("kDontUseOldAction"), CFSTR("com.apple.Preferences"), 0)
    && *(_QWORD *)&a1[*MEMORY[0x24BE75720]]
    || *(_QWORD *)&a1[*MEMORY[0x24BE75760]]
    || *(_QWORD *)&a1[*MEMORY[0x24BE75748]]
    || *(_QWORD *)&a1[*MEMORY[0x24BE75740]])
  {
    goto LABEL_10;
  }
  objc_msgSend(a1, "propertyForKey:", *MEMORY[0x24BE75B68]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "propertyForKey:", *MEMORY[0x24BE75AC8]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v10 = *(_QWORD *)&a1[*MEMORY[0x24BE75738]];
      if ((unint64_t)(v10 - 3) >= 2)
      {
        if (v10 == 15)
          goto LABEL_10;
        if (v10 != 13)
          return 0;
      }
    }
  }

LABEL_10:
  objc_opt_class();
  v3 = *MEMORY[0x24BE75A18];
  objc_msgSend(a1, "propertyForKey:", *MEMORY[0x24BE75A18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
    return 1;
  objc_msgSend(a1, "propertyForKey:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (id)sui_createCellInstance
{
  objc_class *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)objc_msgSend(MEMORY[0x24BE755E8], "cellClassForSpecifier:", a1);
  if (-[objc_class isSubclassOfClass:](v2, "isSubclassOfClass:", objc_opt_class()))
  {
    v3 = [v2 alloc];
    v4 = -[objc_class cellStyle](v2, "cellStyle");
    -[objc_class reuseIdentifierForSpecifier:](v2, "reuseIdentifierForSpecifier:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithStyle:reuseIdentifier:specifier:", v4, v5, a1);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
