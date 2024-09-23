@implementation ICQBackupDescriptionFooterView

- (ICQBackupDescriptionFooterView)initWithSpecifier:(id)a3
{
  id v4;
  ICQBackupDescriptionFooterView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICQBackupDescriptionFooterView;
  v5 = -[PSFooterHyperlinkView initWithSpecifier:](&v16, sel_initWithSpecifier_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BACKUPS_INFO_LEARN_MORE"), &stru_24E400750, CFSTR("Backup"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75A68]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSFooterHyperlinkView setText:](v5, "setText:", v10);

    -[PSFooterHyperlinkView text](v5, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rangeOfString:", v7);
    -[PSFooterHyperlinkView setLinkRange:](v5, "setLinkRange:", v12, v13);

    objc_msgSend(v4, "target");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSFooterHyperlinkView setTarget:](v5, "setTarget:", v14);

    -[PSFooterHyperlinkView setAction:](v5, "setAction:", sel_openBackupHelpPage_);
  }

  return v5;
}

@end
