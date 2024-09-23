@implementation NFContactlessPaymentStartEvent

- (NFContactlessPaymentStartEvent)initWithDictionary:(id)a3
{
  id v4;
  NFContactlessPaymentStartEvent *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *spIdentifier;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NFContactlessPaymentStartEvent;
  v5 = -[NFContactlessPaymentStartEvent init](&v16, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endPointIdentifier")));
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectStatus")));
    v5->_selectStatus = (unsigned __int16)objc_msgSend(v10, "unsignedShortValue");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("paymentMode")));
    v5->_paymentMode = (unsigned __int16)objc_msgSend(v11, "unsignedShortValue");

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spIdentifier")));
    spIdentifier = v5->_spIdentifier;
    v5->_spIdentifier = (NSString *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BackgroundTransaction")));
    v5->_background = objc_msgSend(v14, "BOOLValue");

  }
  return v5;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v3 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)NFContactlessPaymentStartEvent;
  v4 = -[NFContactlessPaymentStartEvent description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { applet=%@ endpoint=%@ select=0x%04x mode=0x%04x spid=%@ background=%d }"), v5, self->_appletIdentifier, self->_keyIdentifier, self->_selectStatus, self->_paymentMode, self->_spIdentifier, self->_background);

  return v6;
}

- (id)asDictionary
{
  id v3;
  NSString *appletIdentifier;
  NSString *keyIdentifier;
  void *v6;
  void *v7;
  NSString *spIdentifier;
  void *v9;
  id v10;

  v3 = objc_alloc((Class)NSDictionary);
  appletIdentifier = self->_appletIdentifier;
  keyIdentifier = self->_keyIdentifier;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", self->_selectStatus));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", self->_paymentMode));
  spIdentifier = self->_spIdentifier;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_background));
  v10 = objc_msgSend(v3, "initWithObjectsAndKeys:", appletIdentifier, CFSTR("applet"), keyIdentifier, CFSTR("endpoint"), v6, CFSTR("selectStatus"), v7, CFSTR("mode"), spIdentifier, CFSTR("spIdentifier"), v9, CFSTR("background"), 0);

  return v10;
}

- (id)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)_setApplet:(id)a3
{
  objc_storeStrong((id *)&self->_applet, a3);
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyIdentifier, a3);
}

- (NFContactlessPaymentStartEvent)initWithCoder:(id)a3
{
  id v4;
  NFContactlessPaymentStartEvent *v5;
  id v6;
  uint64_t v7;
  NSString *appletIdentifier;
  id v9;
  uint64_t v10;
  NSString *keyIdentifier;
  id v12;
  uint64_t v13;
  NSString *spIdentifier;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NFContactlessPaymentStartEvent;
  v5 = -[NFContactlessPaymentStartEvent init](&v16, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("appletIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("endPointIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v10;

    v5->_selectStatus = (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("selectStatus"));
    v5->_paymentMode = (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("paymentMode"));
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("spIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    spIdentifier = v5->_spIdentifier;
    v5->_spIdentifier = (NSString *)v13;

    v5->_background = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BackgroundTransaction"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *appletIdentifier;
  id v5;

  appletIdentifier = self->_appletIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appletIdentifier, CFSTR("appletIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyIdentifier, CFSTR("endPointIdentifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_selectStatus, CFSTR("selectStatus"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_paymentMode, CFSTR("paymentMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spIdentifier, CFSTR("spIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_background, CFSTR("BackgroundTransaction"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFApplet)applet
{
  return self->_applet;
}

- (unsigned)selectStatus
{
  return self->_selectStatus;
}

- (unsigned)paymentMode
{
  return self->_paymentMode;
}

- (NSString)spIdentifier
{
  return self->_spIdentifier;
}

- (BOOL)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spIdentifier, 0);
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
