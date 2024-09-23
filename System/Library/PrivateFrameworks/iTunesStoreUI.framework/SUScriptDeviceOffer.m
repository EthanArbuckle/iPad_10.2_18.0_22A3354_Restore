@implementation SUScriptDeviceOffer

- (SUScriptDeviceOffer)initWithDeviceOffer:(id)a3
{
  id v5;
  SUScriptDeviceOffer *v6;
  SUScriptDeviceOffer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUScriptDeviceOffer;
  v6 = -[SUScriptObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_offer, a3);

  return v7;
}

- (AMSDeviceOffer)nativeOffer
{
  return self->_offer;
}

- (NSNumber)adamId
{
  void *v2;
  void *v3;

  -[SUScriptDeviceOffer offer](self, "offer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adamId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (id)_className
{
  return CFSTR("iTunesDeviceOffer");
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[SUScriptDeviceOffer offer](self, "offer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)isDowngrading
{
  void *v2;
  int v3;
  id *v4;
  id v5;

  -[SUScriptDeviceOffer offer](self, "offer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDowngrading");
  v4 = (id *)MEMORY[0x24BDBD270];
  if (!v3)
    v4 = (id *)MEMORY[0x24BDBD268];
  v5 = *v4;

  return v5;
}

- (id)isSubscribed
{
  void *v2;
  int v3;
  id *v4;
  id v5;

  -[SUScriptDeviceOffer offer](self, "offer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSubscribed");
  v4 = (id *)MEMORY[0x24BDBD270];
  if (!v3)
    v4 = (id *)MEMORY[0x24BDBD268];
  v5 = *v4;

  return v5;
}

- (unint64_t)offerType
{
  void *v2;
  unint64_t v3;

  -[SUScriptDeviceOffer offer](self, "offer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "offerType");

  return v3;
}

- (void)setAdamId:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("adamId"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setDescription:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("description"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setDowngrading:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("downgrading"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setOfferType:(unint64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("offerType"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (void)setSubscribed:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("subscribed"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_52, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptDeviceOffer;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptDeviceOffer;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_52, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  void *v2;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__KeyMapping_52;
    __KeyMapping_52 = (uint64_t)&unk_24DEDC680;

  }
}

- (AMSDeviceOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
  objc_storeStrong((id *)&self->_offer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offer, 0);
}

@end
