@implementation StorageNeededLinkFooterView

- (StorageNeededLinkFooterView)initWithSpecifier:(id)a3
{
  StorageNeededLinkFooterView *v3;
  StorageNeededLinkFooterView *v5;
  id v6;
  objc_super v7;
  id location[2];
  StorageNeededLinkFooterView *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)StorageNeededLinkFooterView;
  v9 = -[PSFooterHyperlinkView initWithSpecifier:](&v7, sel_initWithSpecifier_, location[0]);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v6 = (id)objc_msgSend(location[0], "propertyForKey:", *MEMORY[0x24BE75A68]);
    if (objc_msgSend(v6, "length"))
      -[StorageNeededLinkFooterView setText:](v9, "setText:", v6);
    objc_storeStrong(&v6, 0);
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)setText:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  id v10;
  id location[2];
  StorageNeededLinkFooterView *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (objc_msgSend(location[0], "length"))
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE_LINK"), &stru_24E0011F0, CFSTR("Software Update"));

    v3 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@  %@"), location[0], v10);
    v4 = location[0];
    location[0] = v3;

    *(_QWORD *)&v9 = objc_msgSend(location[0], "rangeOfString:", v10);
    *((_QWORD *)&v9 + 1) = v5;
    v8 = v9;
    -[PSFooterHyperlinkView setLinkRange:](v12, "setLinkRange:", (_QWORD)v9, v5);
    objc_storeStrong(&v10, 0);
  }
  v7.receiver = v12;
  v7.super_class = (Class)StorageNeededLinkFooterView;
  -[PSFooterHyperlinkView setText:](&v7, sel_setText_, location[0]);
  objc_storeStrong(location, 0);
}

@end
