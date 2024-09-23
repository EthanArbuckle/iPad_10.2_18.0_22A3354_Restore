@implementation PDUAppDisclosureStyle

- (PDUAppDisclosureStyle)initWithBundle:(id)a3
{
  id v4;
  PDUAppDisclosureStyle *v5;
  PDUAppDisclosureStyle *v6;
  PDUAppDisclosureStyle *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDUAppDisclosureStyle;
  v5 = -[PDUAppDisclosureStyle init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PDUAppDisclosureStyle _fetchStyleWithBundle:](v5, "_fetchStyleWithBundle:", v4);
    v7 = v6;
  }

  return v6;
}

+ (id)styleWithBundle:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  PDUAppDisclosureStyle *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)styleWithBundle__styleCache;
  if (!styleWithBundle__styleCache)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    v6 = (void *)styleWithBundle__styleCache;
    styleWithBundle__styleCache = (uint64_t)v5;

    objc_msgSend((id)styleWithBundle__styleCache, "setCountLimit:", 8);
    v4 = (void *)styleWithBundle__styleCache;
  }
  objc_msgSend(v3, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v8 = (PDUAppDisclosureStyle *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = -[PDUAppDisclosureStyle initWithBundle:]([PDUAppDisclosureStyle alloc], "initWithBundle:", v3);
    v9 = (void *)styleWithBundle__styleCache;
    objc_msgSend(v3, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v10);

  }
  return v8;
}

+ (id)styleWithApplication:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(a3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "styleWithBundle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)_styleFromString:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("dark")) & 1) != 0)
    v4 = 2;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("light"));

  return v4;
}

- (void)_fetchStyleWithBundle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UIColor *v9;
  UIColor *tintColor;
  UIColor *v11;
  UIColor *v12;
  void *v13;
  void *v14;
  UIColor *v15;
  UIColor *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  UIColor *v31;
  UIColor *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDF7010]);
  objc_msgSend(v4, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithURL:idiom:error:", v6, objc_msgSend(v7, "userInterfaceIdiom"), 0);

  objc_msgSend(v8, "colorNamed:withTraitCollection:", CFSTR("PrivacyDisclosureTintColor"), 0);
  v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  tintColor = self->_tintColor;
  self->_tintColor = v9;

  if (!self->_tintColor)
  {
    objc_msgSend(v8, "colorNamed:withTraitCollection:", CFSTR("AccentColor"), 0);
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v12 = self->_tintColor;
    self->_tintColor = v11;

    if (!self->_tintColor)
    {
      objc_msgSend(v4, "infoDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NSAccentColorName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v8, "colorNamed:withTraitCollection:", v14, 0);
        v15 = (UIColor *)objc_claimAutoreleasedReturnValue();
        v16 = self->_tintColor;
        self->_tintColor = v15;

      }
    }
  }
  objc_msgSend(v4, "infoDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("UIUserInterfaceStyle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[PDUAppDisclosureStyle _styleFromString:](self, "_styleFromString:", v18);
  self->_interfaceStyle = v19;
  if (!self->_tintColor || !v19)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PDUGetBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "URLForResource:withExtension:", CFSTR("AppDisclosureData"), CFSTR("json"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v40 = 0;
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", v23, 1, &v40);
        v25 = v40;
        v26 = v25;
        if (v24 && !v25)
        {
          v39 = 0;
          objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v24, 0, &v39);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v39;
          v26 = v28;
          if (v27 && !v28)
          {
            v38 = v27;
            objc_msgSend(v27, "objectForKeyedSubscript:", v20);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = v29;
              v37 = v29;
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("tint"));
              v30 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v36 = (void *)v30;
              if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_tintColor)
              {
                objc_msgSend(MEMORY[0x24BDF6950], "pdu_colorWithString:", v30);
                v31 = (UIColor *)objc_claimAutoreleasedReturnValue();
                v32 = self->_tintColor;
                self->_tintColor = v31;

              }
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("appearance"), v34);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_interfaceStyle)
                self->_interfaceStyle = -[PDUAppDisclosureStyle _styleFromString:](self, "_styleFromString:", v33);

              v29 = v35;
            }

            v27 = v38;
          }

        }
      }

    }
  }

}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
