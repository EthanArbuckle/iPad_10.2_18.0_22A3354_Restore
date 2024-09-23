@implementation ICQLinkInAppAction

- (ICQLinkInAppAction)initWithLink:(id)a3
{
  return -[ICQLinkInAppAction initWithLink:inOffer:](self, "initWithLink:inOffer:", a3, 0);
}

- (ICQLinkInAppAction)initWithLink:(id)a3 inOffer:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  ICQLinkInAppAction *v11;
  uint64_t v12;
  NSURL *linkURL;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "action");
  _ICQStringForAction();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)ICQLinkInAppAction;
  v11 = -[ICQInAppAction initWithTitle:type:icqActionType:](&v15, sel_initWithTitle_type_icqActionType_, v9, v10, objc_msgSend(v7, "action"));

  if (v11)
  {
    objc_storeStrong((id *)&v11->_link, a3);
    objc_storeStrong((id *)&v11->_offer, a4);
    objc_msgSend(v7, "serverUIURL");
    v12 = objc_claimAutoreleasedReturnValue();
    linkURL = v11->_linkURL;
    v11->_linkURL = (NSURL *)v12;

  }
  return v11;
}

- (void)performActionWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ICQLinkInAppAction link](self, "link");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "action");
    _ICQStringForAction();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v7;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "In-app message: perform action %{public}@", (uint8_t *)&v19, 0xCu);

  }
  -[ICQLinkInAppAction link](self, "link");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "action");

  if ((unint64_t)(v9 - 102) <= 0x13)
  {
    if (((1 << (v9 - 102)) & 0xCF479) != 0)
    {
LABEL_5:
      -[ICQLinkInAppAction _launchFlowManagerWithContext:](self, "_launchFlowManagerWithContext:", v4);
      goto LABEL_6;
    }
    if (v9 == 118)
    {
      -[ICQLinkInAppAction offer](self, "offer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateOfferWithAction:", 118);

      -[ICQLinkInAppAction _launchFlowManagerWithContext:](self, "_launchFlowManagerWithContext:", v4);
      goto LABEL_5;
    }
  }
  if (v9 == 3)
    goto LABEL_5;
  if (v9 == 1)
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "In-app message: performing dismiss action", (uint8_t *)&v19, 2u);
    }
  }
  else
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[ICQLinkInAppAction link](self, "link");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "action");
      _ICQStringForAction();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "In-app message: performing default action %{public}@", (uint8_t *)&v19, 0xCu);

    }
  }

  -[ICQLinkInAppAction link](self, "link");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performAction");

LABEL_6:
  -[ICQLinkInAppAction offer](self, "offer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLinkInAppAction link](self, "link");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "action");
  _ICQStringForAction();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQAnalytics logInAppBannerInteractionWithAppIdentifier:icqActionName:](ICQAnalytics, "logInAppBannerInteractionWithAppIdentifier:icqActionName:", v11, v13);

}

- (void)_launchFlowManagerWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  ICQUpgradeFlowManager *v8;
  void *v9;
  ICQUpgradeFlowManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t v19[16];

  v4 = a3;
  -[ICQLinkInAppAction flowManager](self, "flowManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICQLinkInAppAction _launchFlowManagerWithContext:].cold.2((uint64_t)self, v6);
  }
  else
  {
    -[ICQLinkInAppAction _linkURLWithContext:](self, "_linkURLWithContext:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "In-app message: present flow manager", v19, 2u);
    }

    v8 = [ICQUpgradeFlowManager alloc];
    -[ICQLinkInAppAction offer](self, "offer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICQUpgradeFlowManager initWithOffer:](v8, "initWithOffer:", v9);
    -[ICQLinkInAppAction setFlowManager:](self, "setFlowManager:", v10);

    -[ICQLinkInAppAction flowManager](self, "flowManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    -[ICQLinkInAppAction flowManager](self, "flowManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFlowOptions:", 0);

    -[ICQLinkInAppAction link](self, "link");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[ICQLinkInAppAction link](self, "link");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setServerUIURL:", v6);

      -[ICQLinkInAppAction flowManager](self, "flowManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLinkInAppAction link](self, "link");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "beginRemoteUpgradeFlowWithICQLink:", v16);

    }
    else
    {
      _ICQGetLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ICQLinkInAppAction _launchFlowManagerWithContext:].cold.1((uint64_t)self, v17, v18);

      -[ICQLinkInAppAction flowManager](self, "flowManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_beginRemoteFlowWithURL:", v6);
    }

  }
}

- (id)_linkURLWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ICQLinkInAppAction linkURL](self, "linkURL");
  v5 = objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v30 = v4;
    v31 = 2114;
    v32 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "In-app message: adding context %{public}@ to link %{public}@", buf, 0x16u);
  }

  v23 = (void *)v5;
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x24BDD1838];
        objc_msgSend(v10, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "queryItemWithName:value:", v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

  objc_msgSend(v7, "setQueryItems:", v9);
  _ICQGetLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v20;
    _os_log_impl(&dword_21F2CC000, v19, OS_LOG_TYPE_DEFAULT, "In-app message: returning link url %{public}@", buf, 0xCu);

  }
  objc_msgSend(v7, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v5 = v8;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did cancel", (uint8_t *)&v7, 0xCu);

  }
  -[ICQLinkInAppAction flowManager](self, "flowManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[ICQLinkInAppAction setFlowManager:](self, "setFlowManager:", 0);
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v5 = v8;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did complete", (uint8_t *)&v7, 0xCu);

  }
  -[ICQLinkInAppAction flowManager](self, "flowManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[ICQLinkInAppAction setFlowManager:](self, "setFlowManager:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQLinkInAppAction;
  v4 = a3;
  -[ICQInAppAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[ICQLinkInAppAction link](self, "link", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("link"));

  -[ICQLinkInAppAction offer](self, "offer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("offer"));

}

- (ICQLinkInAppAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICQLinkInAppAction *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("link"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ICQLinkInAppAction initWithLink:inOffer:](self, "initWithLink:inOffer:", v6, v5);
  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ICQInAppAction title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInAppAction type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLinkInAppAction link](self, "link");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("actionTitle: %@, actionType: %@, link: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (ICQLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
  objc_storeStrong((id *)&self->_link, a3);
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
  objc_storeStrong((id *)&self->_offer, a3);
}

- (ICQUpgradeFlowManager)flowManager
{
  return self->_flowManager;
}

- (void)setFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_flowManager, a3);
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
  objc_storeStrong((id *)&self->_linkURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_flowManager, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_storeStrong((id *)&self->_link, 0);
}

- (void)_launchFlowManagerWithContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_21F2CC000, a2, a3, "Unable to find an ICQLink in %@", (uint8_t *)&v3);
}

- (void)_launchFlowManagerWithContext:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5 = 138543362;
  v6 = (id)objc_opt_class();
  v3 = v6;
  OUTLINED_FUNCTION_0(&dword_21F2CC000, a2, v4, "%{public}@ Already presenting flow manager. Will not present a new one until the previous instance is removed", (uint8_t *)&v5);

}

@end
