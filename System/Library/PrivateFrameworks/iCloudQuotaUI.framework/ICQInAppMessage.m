@implementation ICQInAppMessage

+ (id)fallbackOffer
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BEC72F8]);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithServerDictionary:accountAltDSID:notificationID:retrievalDate:callbackInterval:appLaunchLink:bundleIdentifier:", &unk_24E436358, CFSTR("Test"), &stru_24E400750, v3, 0, CFSTR("com.apple.DocumentsApp"), 0.0);

  return v4;
}

+ (id)fallbackAction
{
  void *v2;
  ICQLinkInAppAction *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC72E0]), "initWithAction:", 100);
  objc_msgSend(v2, "setValue:forKey:", CFSTR("Manage"), CFSTR("_text"));
  v3 = -[ICQLinkInAppAction initWithLink:]([ICQLinkInAppAction alloc], "initWithLink:", v2);

  return v3;
}

+ (id)universalLinkFromOffer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "universalLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "bannerSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "links");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "setValue:forKey:", CFSTR("Get More Storage"), CFSTR("_text"));

  return v6;
}

+ (id)actionFromOffer:(id)a3
{
  id v4;
  void *v5;
  ICQLinkInAppAction *v6;
  ICQLinkInAppAction *v7;

  v4 = a3;
  objc_msgSend(a1, "universalLinkFromOffer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[ICQLinkInAppAction initWithLink:inOffer:]([ICQLinkInAppAction alloc], "initWithLink:inOffer:", v5, v4);
  }
  else
  {
    objc_msgSend(a1, "fallbackAction");
    v6 = (ICQLinkInAppAction *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)quotaAlmostFull
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "fallbackOffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "quotaAlmostFullForOffer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)quotaAlmostFullForOffer:(id)a3
{
  id v4;
  void *v5;
  ICQInAppMessage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICQInAppMessage *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "actionFromOffer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [ICQInAppMessage alloc];
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageSpecificationForPlacement:", CFSTR("InApp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "iconSpecification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:](v6, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:", 0, CFSTR("mockAlmostFull"), CFSTR("iCloudStorageAlmostFull"), CFSTR("[icqctl] Your iCloud Storage is Almost Full"), CFSTR("Some files might stop syncing"), CFSTR("exclamationmark.triangle"), v9, CFSTR("com.apple.icqctl"), v10, v12);

  return v13;
}

+ (id)quotaAlmostFullLongForOffer:(id)a3
{
  id v4;
  void *v5;
  ICQInAppMessage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICQInAppMessage *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "actionFromOffer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [ICQInAppMessage alloc];
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageSpecificationForPlacement:", CFSTR("InApp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "iconSpecification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:](v6, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:", 0, CFSTR("mockAlmostFull"), CFSTR("iCloudStorageAlmostFull"), CFSTR("[icqctl] Your iCloud Storage is Almost Full"), CFSTR("Make sure you have room for your next 20,000 photos with iCloud+"), CFSTR("exclamationmark.triangle"), v9, CFSTR("com.apple.icqctl"), v10, v12);

  return v13;
}

+ (id)quotaFull
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "fallbackOffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "quotaFullForOffer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)quotaFullForOffer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  ICQInAppMessage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ICQInAppMessage *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "actionFromOffer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[ICQInAppMessage(Examples) quotaFullForOffer:].cold.1((uint64_t)v5, v6);

  v7 = [ICQInAppMessage alloc];
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aa_primaryAppleAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageSpecificationForPlacement:", CFSTR("InApp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "iconSpecification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:](v7, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:", 3, CFSTR("mockFull"), CFSTR("iCloudStorageFull"), CFSTR("[icqctl] Your iCloud Storage is Full"), CFSTR("Some files aren't syncing"), CFSTR("exclamationmark.triangle"), v10, CFSTR("com.apple.icqctl"), v11, v13);

  return v14;
}

+ (id)quotaFullLongForOffer:(id)a3
{
  id v4;
  void *v5;
  ICQInAppMessage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICQInAppMessage *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "actionFromOffer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [ICQInAppMessage alloc];
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageSpecificationForPlacement:", CFSTR("InApp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "iconSpecification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:](v6, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:", 3, CFSTR("mockFull"), CFSTR("iCloudStorageFull"), CFSTR("[icqctl] Your iCloud Storage is Full"), CFSTR("New photos and videos won't be uploaded to iCloud because you don't have enough storage"), CFSTR("exclamationmark.triangle"), v9, CFSTR("com.apple.icqctl"), v10, v12);

  return v13;
}

+ (id)airplaneMode
{
  void *v2;
  void *v3;
  void *v4;
  ICQLinkInAppAction *v5;
  ICQInAppMessage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ICQInAppMessage *v11;
  ICQLinkInAppAction *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BEC72E0];
  v14 = *MEMORY[0x24BEC71E8];
  v15[0] = *MEMORY[0x24BEC7238];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "linkWithText:options:action:parameters:", CFSTR("Settings"), 0, 6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[ICQLinkInAppAction initWithLink:]([ICQLinkInAppAction alloc], "initWithLink:", v4);
  v6 = [ICQInAppMessage alloc];
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:](v6, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:", 0, CFSTR("mockAirplaneMode"), CFSTR("AirplaneModeOn"), CFSTR("[icqctl] Syncing with iCloud Paused"), CFSTR("In Airplane Mode"), 0, v9, CFSTR("com.apple.icqctl"), v10, 0);

  return v11;
}

+ (id)serverUnreachable
{
  ICQInAppMessage *v2;
  void *v3;
  void *v4;
  void *v5;
  ICQInAppMessage *v6;

  v2 = [ICQInAppMessage alloc];
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:](v2, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:iconSpecification:", 4, CFSTR("mockServerUnreachable"), CFSTR("WiFiConnectivityIssues"), CFSTR("[icqctl] Syncing with iCloud Paused"), CFSTR("No Internet Connection"), 0, v5, CFSTR("com.apple.icqctl"), MEMORY[0x24BDBD1A8], 0);

  return v6;
}

- (ICQInAppMessage)initWithContentType:(unint64_t)a3 identifier:(id)a4 reason:(id)a5 title:(id)a6 subTitle:(id)a7 sfSymbolName:(id)a8 accountId:(id)a9 bundleID:(id)a10 actions:(id)a11 iconSpecification:(id)a12
{
  return -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:](self, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12);
}

- (ICQInAppMessage)initWithContentType:(unint64_t)a3 identifier:(id)a4 reason:(id)a5 title:(id)a6 subTitle:(id)a7 sfSymbolName:(id)a8 accountId:(id)a9 bundleID:(id)a10 actions:(id)a11 dismissAction:(id)a12 iconSpecification:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  ICQInAppMessage *v22;
  ICQInAppMessage *v23;
  id obj;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a4;
  obj = a5;
  v33 = a5;
  v27 = a6;
  v32 = a6;
  v31 = a7;
  v30 = a8;
  v29 = a9;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  v21 = a13;
  v35.receiver = self;
  v35.super_class = (Class)ICQInAppMessage;
  v22 = -[ICQInAppMessage init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_contentType = a3;
    objc_storeStrong((id *)&v22->_identifier, a4);
    objc_storeStrong((id *)&v23->_reason, obj);
    objc_storeStrong((id *)&v23->_title, v27);
    objc_storeStrong((id *)&v23->_subTitle, a7);
    objc_storeStrong((id *)&v23->_sfSymbolName, a8);
    objc_storeStrong((id *)&v23->_accountId, a9);
    objc_storeStrong((id *)&v23->_bundleID, a10);
    objc_storeStrong((id *)&v23->_actions, a11);
    objc_storeStrong((id *)&v23->_dismissAction, a12);
    objc_storeStrong((id *)&v23->_iconSpecification, a13);
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ICQInAppMessage contentType](self, "contentType"), CFSTR("contentType"));
  -[ICQInAppMessage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[ICQInAppMessage reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("reason"));

  -[ICQInAppMessage title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("title"));

  -[ICQInAppMessage subTitle](self, "subTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("subTitle"));

  -[ICQInAppMessage sfSymbolName](self, "sfSymbolName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("sfSymbolName"));

  -[ICQInAppMessage accountId](self, "accountId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("accountId"));

  -[ICQInAppMessage bundleID](self, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("bundleID"));

  -[ICQInAppMessage actions](self, "actions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("actions"));

  -[ICQInAppMessage dismissAction](self, "dismissAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("dismissAction"));

  -[ICQInAppMessage iconSpecification](self, "iconSpecification");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("iconSpecification"));

}

- (ICQInAppMessage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ICQInAppMessage *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subTitle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sfSymbolName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("actions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dismissAction"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconSpecification"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[ICQInAppMessage initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:](self, "initWithContentType:identifier:reason:title:subTitle:sfSymbolName:accountId:bundleID:actions:dismissAction:iconSpecification:", v5, v6, v7, v20, v19, v18, v8, v9, v11, v12, v13);
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](identifier, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ICQInAppMessage actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        objc_msgSend(v3, "appendString:", CFSTR("\n"));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v10 = (void *)MEMORY[0x24BDD17C8];
  -[ICQInAppMessage bundleID](self, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessage title](self, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppMessage subTitle](self, "subTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("In-App Message for bundle ID %@ with title: %@, subTitle: %@, actions:\n%@"), v11, v12, v13, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)fetchIconIfNeededWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[ICQInAppMessage icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v4[2](v4);
  }
  else
  {
    -[ICQInAppMessage iconSpecification](self, "iconSpecification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__ICQInAppMessage_fetchIconIfNeededWithCompletion___block_invoke;
    v7[3] = &unk_24E3F4EE0;
    v7[4] = self;
    v8 = v4;
    +[ICQUIImageLoader fetchIconFromIconSpecification:completion:](ICQUIImageLoader, "fetchIconFromIconSpecification:completion:", v6, v7);

  }
}

void __51__ICQInAppMessage_fetchIconIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)didDisplayMessage
{
  id v2;

  -[ICQInAppMessage bundleID](self, "bundleID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[ICQAnalytics logInAppBannerViewWithAppIdentifier:](ICQAnalytics, "logInAppBannerViewWithAppIdentifier:", v2);

}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (NSString)sfSymbolName
{
  return self->_sfSymbolName;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSString)accountId
{
  return self->_accountId;
}

- (ICQInAppAction)dismissAction
{
  return self->_dismissAction;
}

- (NSString)placement
{
  return self->_placement;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (ICQIconSpecification)iconSpecification
{
  return self->_iconSpecification;
}

- (void)setIconSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_iconSpecification, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_iconSpecification, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_sfSymbolName, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
