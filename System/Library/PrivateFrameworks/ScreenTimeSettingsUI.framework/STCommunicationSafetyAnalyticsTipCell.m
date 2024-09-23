@implementation STCommunicationSafetyAnalyticsTipCell

- (STCommunicationSafetyAnalyticsTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7;
  STCommunicationSafetyAnalyticsTipCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)STCommunicationSafetyAnalyticsTipCell;
  v7 = a5;
  v8 = -[STTableCell initWithStyle:reuseIdentifier:specifier:](&v17, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v7);
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE75900], v17.receiver, v17.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE759F0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE84900], "makeCommunicationSafetyAnalyticsTipViewControllerWithActionBlock:dismissTipBlock:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STCommunicationSafetyAnalyticsTipCell contentView](v8, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v12);
  v14 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "st_constraintsForView:equalToView:", v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v15);

  return v8;
}

+ (void)acknowledgeTipViewForDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("HasShownCommunicationSafetyAnalyticsTipByDSID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1, "didAcknowledgeTipViewForDSID:", v4) & 1) == 0)
    {
      if (v6)
      {
        v7 = (void *)objc_msgSend(v6, "mutableCopy");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v4);

        v6 = v7;
      }
      else
      {
        v8 = v4;
        v9[0] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("HasShownCommunicationSafetyAnalyticsTipByDSID"));
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[STCommunicationSafetyAnalyticsTipCell acknowledgeTipViewForDSID:].cold.1();
  }

}

+ (BOOL)didAcknowledgeTipViewForDSID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HasShownCommunicationSafetyAnalyticsTipByDSID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "BOOLValue");
  return (char)v4;
}

+ (void)acknowledgeTipViewForDSID:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to update communication safety analytics tip by DSID dictionary due to nil DSID.", v0, 2u);
}

@end
