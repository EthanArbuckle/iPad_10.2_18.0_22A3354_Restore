@implementation _ICQUpgradeOfferPageSpecification

- (_ICQUpgradeOfferPageSpecification)initWithServerDictionary:(id)a3 pageIdentifier:(id)a4
{
  id v7;
  id v8;
  _ICQUpgradeOfferPageSpecification *v9;
  _ICQUpgradeOfferPageSpecification *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;

  v7 = a3;
  v8 = a4;
  v48.receiver = self;
  v48.super_class = (Class)_ICQUpgradeOfferPageSpecification;
  v9 = -[_ICQUpgradeOfferPageSpecification init](&v48, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serverDict, a3);
    -[_ICQPageSpecification setPageIdentifier:](v10, "setPageIdentifier:", v8);
    v11 = v7;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("appId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("icloudApps"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "count"))
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v12 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("appId"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v12 = 0;
      }

    }
    -[_ICQUpgradeOfferPageSpecification setIconBundleIdentifier:](v10, "setIconBundleIdentifier:", v12);

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("title"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQUpgradeOfferPageSpecification setTitle:](v10, "setTitle:", v15);

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("header"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v47 = 0;
    _ICQServerHeaderGetFormatAndLinks(v16, &v47, &v46);
    v17 = v47;
    v18 = v46;

    -[_ICQUpgradeOfferPageSpecification setMessage:](v10, "setMessage:", v17);
    -[_ICQUpgradeOfferPageSpecification setMessageLinks:](v10, "setMessageLinks:", v18);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("altHeader"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("altHeader"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v18;
      v45 = v17;
      _ICQServerHeaderGetFormatAndLinks(v20, &v45, &v44);
      v21 = v45;

      v22 = v44;
      -[_ICQUpgradeOfferPageSpecification setAltMessage:](v10, "setAltMessage:", v21);
      -[_ICQUpgradeOfferPageSpecification setAltMessageLinks:](v10, "setAltMessageLinks:", v22);
      v18 = v22;
      v17 = v21;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("footer"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v18;
    v43 = v17;
    _ICQServerHeaderGetFormatAndLinks(v23, &v43, &v42);
    v24 = v43;

    v25 = v42;
    -[_ICQUpgradeOfferPageSpecification setFineprintFormat:](v10, "setFineprintFormat:", v24);
    -[_ICQUpgradeOfferPageSpecification setFineprintLinks:](v10, "setFineprintLinks:", v25);
    _ICQDictionaryForKey(v11, CFSTR("actionBtn"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      _ICQLinkForServerMessageParameterWithOptions(v26, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQUpgradeOfferPageSpecification setPurchaseLink:](v10, "setPurchaseLink:", v28);
    }
    else
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("buyBtn"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        v31 = v29;
      }
      else
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("doneBtn"));
        v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      v28 = v31;

      -[_ICQPageSpecification pageIdentifier](v10, "pageIdentifier");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "isEqualToString:", CFSTR("UpgradeOffer")) & 1) != 0)
      {
        v33 = 4;
      }
      else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("UpgradeComplete")) & 1) != 0)
      {
        v33 = 5;
      }
      else if (objc_msgSend(v32, "isEqualToString:", CFSTR("UpgradeSuccessWiFi")))
      {
        v33 = 5;
      }
      else
      {
        v33 = 1;
      }

      +[ICQLink linkWithText:action:parameters:](ICQLink, "linkWithText:action:parameters:", v28, v33, MEMORY[0x1E0C9AA70]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ICQUpgradeOfferPageSpecification setPurchaseLink:](v10, "setPurchaseLink:", v34);

    }
    _ICQDictionaryForKey(v11, CFSTR("actionBtn2"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    _ICQLinkForServerMessageParameterWithOptions(v35, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQUpgradeOfferPageSpecification setPurchase2Link:](v10, "setPurchase2Link:", v36);

    _ICQLinkVisibleKeyForServerMessageParameter(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQUpgradeOfferPageSpecification setPurchase2LinkVisibleKey:](v10, "setPurchase2LinkVisibleKey:", v37);

    _ICQDictionaryForOneOfKeys(v11, &unk_1E8B552A0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    _ICQLinkForServerMessageParameterWithOptions(v38, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQUpgradeOfferPageSpecification setBottomLink:](v10, "setBottomLink:", v39);

    _ICQLinkVisibleKeyForServerMessageParameter(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQUpgradeOfferPageSpecification setBottomLinkVisibleKey:](v10, "setBottomLinkVisibleKey:", v40);

    -[_ICQPageSpecification setHasCancelButtonForBack:](v10, "setHasCancelButtonForBack:", 1);
  }

  return v10;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setPurchaseLink:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseLink, a3);
}

- (void)setPurchase2LinkVisibleKey:(id)a3
{
  objc_storeStrong((id *)&self->_purchase2LinkVisibleKey, a3);
}

- (void)setPurchase2Link:(id)a3
{
  objc_storeStrong((id *)&self->_purchase2Link, a3);
}

- (void)setMessageLinks:(id)a3
{
  objc_storeStrong((id *)&self->_messageLinks, a3);
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void)setIconBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_iconBundleIdentifier, a3);
}

- (void)setFineprintLinks:(id)a3
{
  objc_storeStrong((id *)&self->_fineprintLinks, a3);
}

- (void)setFineprintFormat:(id)a3
{
  objc_storeStrong((id *)&self->_fineprintFormat, a3);
}

- (void)setBottomLinkVisibleKey:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLinkVisibleKey, a3);
}

- (void)setBottomLink:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLink, a3);
}

- (_ICQUpgradeOfferPageSpecification)initWithServerDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _ICQUpgradeOfferPageSpecification *v8;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_ICQUpgradeOfferPageSpecification initWithServerDictionary:pageIdentifier:](self, "initWithServerDictionary:pageIdentifier:", v5, v7);
  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)_ICQUpgradeOfferPageSpecification;
  -[_ICQPageSpecification debugDescription](&v16, sel_debugDescription);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQUpgradeOfferPageSpecification title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQUpgradeOfferPageSpecification message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQUpgradeOfferPageSpecification purchaseLink](self, "purchaseLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQUpgradeOfferPageSpecification purchase2Link](self, "purchase2Link");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQUpgradeOfferPageSpecification bottomLink](self, "bottomLink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQUpgradeOfferPageSpecification fineprintFormat](self, "fineprintFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: title:%@ message:%@ purchase:%@ purchase2:%@ bottom:%@ fine:%@"), v14, v3, v4, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)copy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  -[_ICQUpgradeOfferPageSpecification serverDict](self, "serverDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQPageSpecification pageIdentifier](self, "pageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithServerDictionary:pageIdentifier:", v4, v5);

  return v6;
}

- (id)copyWithBindings:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  v5 = -[_ICQUpgradeOfferPageSpecification copy](self, "copy");
  objc_msgSend(v5, "purchase2LinkVisibleKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "purchase2LinkVisibleKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _ICQBooleanForServerObjectDefault(v8, 0);

    if ((v9 & 1) == 0)
      objc_msgSend(v5, "setPurchase2Link:", 0);
  }
  objc_msgSend(v5, "bottomLinkVisibleKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v5, "bottomLinkVisibleKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = _ICQBooleanForServerObjectDefault(v12, 0);

    if ((v13 & 1) == 0)
      objc_msgSend(v5, "setBottomLink:", 0);
  }

  return v5;
}

- (NSDictionary)serverDict
{
  return self->_serverDict;
}

- (NSString)iconBundleIdentifier
{
  return self->_iconBundleIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSArray)messageLinks
{
  return self->_messageLinks;
}

- (NSString)altMessage
{
  return self->_altMessage;
}

- (void)setAltMessage:(id)a3
{
  objc_storeStrong((id *)&self->_altMessage, a3);
}

- (NSArray)altMessageLinks
{
  return self->_altMessageLinks;
}

- (void)setAltMessageLinks:(id)a3
{
  objc_storeStrong((id *)&self->_altMessageLinks, a3);
}

- (ICQLink)purchaseLink
{
  return self->_purchaseLink;
}

- (ICQLink)purchase2Link
{
  return self->_purchase2Link;
}

- (ICQLink)bottomLink
{
  return self->_bottomLink;
}

- (NSString)fineprintFormat
{
  return self->_fineprintFormat;
}

- (NSArray)fineprintLinks
{
  return self->_fineprintLinks;
}

- (NSString)purchase2LinkVisibleKey
{
  return self->_purchase2LinkVisibleKey;
}

- (NSString)bottomLinkVisibleKey
{
  return self->_bottomLinkVisibleKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLinkVisibleKey, 0);
  objc_storeStrong((id *)&self->_purchase2LinkVisibleKey, 0);
  objc_storeStrong((id *)&self->_fineprintLinks, 0);
  objc_storeStrong((id *)&self->_fineprintFormat, 0);
  objc_storeStrong((id *)&self->_bottomLink, 0);
  objc_storeStrong((id *)&self->_purchase2Link, 0);
  objc_storeStrong((id *)&self->_purchaseLink, 0);
  objc_storeStrong((id *)&self->_altMessageLinks, 0);
  objc_storeStrong((id *)&self->_altMessage, 0);
  objc_storeStrong((id *)&self->_messageLinks, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

+ (id)upgradeOfferPageSpecificationSampleForLevel:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTitle:", CFSTR("Upgrade your iCloud Storage"));
  objc_msgSend(v3, "setMessage:", CFSTR("Add more storage to continue using iCloud and keep the most important things on your iPhone safe."));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Buy 50 GB for $0.99%C/%Cmo"), 8288, 8288);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQLink linkWithText:action:parameters:](ICQLink, "linkWithText:action:parameters:", v4, 4, MEMORY[0x1E0C9AA70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPurchaseLink:", v5);

  v16 = CFSTR("URL");
  v17[0] = CFSTR("http://www.apple.com/icloud/");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQLink linkWithText:action:parameters:](ICQLink, "linkWithText:action:parameters:", CFSTR("Learn about managing storage"), 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBottomLink:", v7);

  objc_msgSend(v3, "setFineprintFormat:", CFSTR("You will be charged $0.99 right now and each month. You can cancel at any time. Contact Apple within 15 days for a refund. Partial refunds are available where required. See %@."));
  v14 = CFSTR("URL");
  v15 = CFSTR("https://www.apple.com/legal/internet-services/icloud/en/terms.html");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQLink linkWithText:action:parameters:](ICQLink, "linkWithText:action:parameters:", CFSTR("Terms & Conditions"), 6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFineprintLinks:", v10);

  objc_msgSend(v3, "setHasCancelButtonForBack:", 1);
  objc_msgSend(v3, "pageIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(v3, "setPageIdentifier:", &stru_1E8B3C468);

  return v3;
}

@end
