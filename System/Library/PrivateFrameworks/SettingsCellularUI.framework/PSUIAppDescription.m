@implementation PSUIAppDescription

- (PSUIAppDescription)initWithAMSMediaResponseDictionary:(id)a3
{
  id v4;
  PSUIAppDescription *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
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
  v30.super_class = (Class)PSUIAppDescription;
  v5 = -[PSUIAppDescription init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppDescription setName:](v5, "setName:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("artistName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppDescription setPublisher:](v5, "setPublisher:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ios"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppDescription setBundleID:](v5, "setBundleID:", v13);

    v14 = objc_alloc(MEMORY[0x24BE08210]);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("artwork"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithDictionary:", v15);

    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = v18 * 60.0;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scale");
    objc_msgSend(v16, "URLWithSize:", v19, v21 * 60.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppDescription setIconURL:](v5, "setIconURL:", v22);

    v23 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributes"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("url"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLWithString:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppDescription setInstallURL:](v5, "setInstallURL:", v26);

    objc_msgSend(v12, "objectForKey:", CFSTR("subtitle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("subtitle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIAppDescription setSubtitle:](v5, "setSubtitle:", v28);

    }
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {name: \"%@\", publisher: \"%@\", bundleID: \"%@\", subtitle: \"%@\", icon URL: %@, install URL: %@, icon: %@}"), v5, self->_name, self->_publisher, self->_bundleID, self->_subtitle, self->_iconURL, self->_installURL, self->_icon);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)installURL
{
  return self->_installURL;
}

- (void)setInstallURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BOOL)installed
{
  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)installedLabel
{
  return self->_installedLabel;
}

- (void)setInstalledLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedLabel, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_installURL, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
