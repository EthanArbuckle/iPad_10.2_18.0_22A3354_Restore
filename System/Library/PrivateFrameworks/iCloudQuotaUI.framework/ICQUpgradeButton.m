@implementation ICQUpgradeButton

+ (BOOL)shouldShowForOffer:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "buttonSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(v3, "level") != 0;
  else
    v5 = 0;

  return v5;
}

+ (id)buttonWithType:(int64_t)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ICQUpgradeButton;
  objc_msgSendSuper2(&v4, sel_buttonWithType_, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)upgradeButton
{
  return (id)objc_msgSend(a1, "buttonWithType:", 1);
}

+ (id)spaceArrowAttributedStringWithBaseAttributes:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x24BDD1688];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 8197);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  v8 = objc_msgSend(v7, "length");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB4B8]), "initWithData:ofType:", 0, 0);
  objc_msgSend(MEMORY[0x24BEBD640], "icqBundleImageNamed:", CFSTR("PresentationRightArrowRed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v10);

  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendAttributedString:", v11);

  objc_msgSend(v7, "addAttributes:range:", v4, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x24BEBB330], &unk_24E436028, v8, objc_msgSend(v7, "length") - v8);
  v12 = (void *)objc_msgSend(v7, "copy");

  return v12;
}

+ (id)attributedStringWithFormat:(id)a3 attributes:(id)a4 buttonLinkAttributes:(id)a5 links:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;

  v9 = a3;
  v44 = a4;
  v43 = a5;
  v10 = a6;
  v11 = objc_msgSend(v9, "length");
  v45 = (void *)objc_opt_new();
  v42 = v11;
  v12 = objc_msgSend(v9, "rangeOfString:options:range:", CFSTR("%@"), 2, 0, v11);
  v14 = v13;
  v15 = objc_msgSend(v10, "count");
  if (v15)
    v16 = v14;
  else
    v16 = 0;
  if (v15)
    v17 = v12;
  else
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  v18 = 0;
  if (v16)
  {
    v19 = 0;
    v40 = v9;
    v41 = v10;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v43;
      v22 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(v9, "substringWithRange:", v18, v17 - v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithString:attributes:", v23, v44);
      objc_msgSend(v45, "appendAttributedString:", v24);

      v25 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v20, "text");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("%@"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v27, v21);
      objc_msgSend(v45, "appendAttributedString:", v28);

      if ((objc_msgSend(v20, "options") & 1) != 0)
      {
        objc_msgSend(a1, "spaceArrowAttributedStringWithBaseAttributes:", v21);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "appendAttributedString:", v29);

      }
      v18 = v17 + v16;
      ++v19;

      v9 = v40;
      v30 = objc_msgSend(v40, "rangeOfString:options:range:", CFSTR("%@"), 2, v17 + v16, v42 - (v17 + v16));
      v32 = v31;
      v10 = v41;
      v33 = objc_msgSend(v41, "count");
      if (v19 >= v33)
        v16 = 0;
      else
        v16 = v32;
      if (v19 >= v33)
        v17 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v17 = v30;
    }
    while (v16);
  }
  v34 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(v9, "substringFromIndex:", v18);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithString:attributes:", v35, v44);
  objc_msgSend(v45, "appendAttributedString:", v36);

  v37 = (void *)objc_msgSend(v45, "copy");
  return v37;
}

- (ICQUpgradeButton)initWithFrame:(CGRect)a3
{
  ICQUpgradeButton *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQUpgradeButton;
  v3 = -[ICQUpgradeButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentOffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeButton setOffer:](v3, "setOffer:", v5);

  }
  return v3;
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
  id v5;
  void *v6;
  ICQLink *v7;
  ICQLink *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  ICQLink *link;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSAttributedString *v22;
  NSAttributedString *attributedDetailedText;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSAttributedString *v29;
  NSAttributedString *attributedDetailedLink;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  ICQLink *v37;
  ICQLink *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_offer, a3);
  objc_msgSend(v5, "buttonSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonLink");
  v7 = (ICQLink *)(id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (-[ICQLink action](v7, "action") == 105)
  {
    v9 = (void *)MEMORY[0x24BEC72E0];
    -[ICQLink text](v7, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ICQLink options](v7, "options");
    -[ICQLink parameters](v7, "parameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "linkWithText:options:action:parameters:", v10, v11, 3, v12);
    v8 = (ICQLink *)objc_claimAutoreleasedReturnValue();

  }
  link = self->_link;
  self->_link = v8;

  objc_msgSend(v5, "buttonSpecification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "buttonFormat");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v15, "length"))
  {

    v15 = CFSTR("%@");
  }
  if (self->_link)
  {
    objc_msgSend(v14, "textFormat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)objc_opt_class();
      objc_msgSend(v14, "textFormat");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUpgradeButton buttonAttributes](self, "buttonAttributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUpgradeButton buttonLinkAttributes](self, "buttonLinkAttributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = self->_link;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "attributedStringWithFormat:attributes:buttonLinkAttributes:links:", v18, v19, v20, v21);
      v22 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      attributedDetailedText = self->_attributedDetailedText;
      self->_attributedDetailedText = v22;

    }
    if (self->_link)
    {
      objc_msgSend(v14, "linkFormat");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v36 = (void *)objc_opt_class();
        objc_msgSend(v14, "linkFormat");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQUpgradeButton buttonAttributes](self, "buttonAttributes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQUpgradeButton buttonLinkAttributes](self, "buttonLinkAttributes");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = self->_link;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "attributedStringWithFormat:attributes:buttonLinkAttributes:links:", v25, v26, v27, v28);
        v29 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
        attributedDetailedLink = self->_attributedDetailedLink;
        self->_attributedDetailedLink = v29;

      }
      if (self->_link)
      {
        v31 = (void *)objc_opt_class();
        -[ICQUpgradeButton buttonAttributes](self, "buttonAttributes");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQUpgradeButton buttonLinkAttributes](self, "buttonLinkAttributes");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = self->_link;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "attributedStringWithFormat:attributes:buttonLinkAttributes:links:", v15, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICQUpgradeButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v35, 0);
      }
    }
  }

}

- (id)buttonAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 11.0, *MEMORY[0x24BEBB608]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buttonLinkAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 11.0, *MEMORY[0x24BEBB608]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ICQLink)link
{
  return self->_link;
}

- (NSAttributedString)attributedDetailedText
{
  return self->_attributedDetailedText;
}

- (NSAttributedString)attributedDetailedLink
{
  return self->_attributedDetailedLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedDetailedLink, 0);
  objc_storeStrong((id *)&self->_attributedDetailedText, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

@end
