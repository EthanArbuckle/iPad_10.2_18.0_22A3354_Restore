@implementation NFDigitalCarKeyStartEvent

- (id)initFromContactlessPaymentStartEvent:(id)a3
{
  id v4;
  NFDigitalCarKeyStartEvent *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  uint64_t v10;
  NSString *spIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFDigitalCarKeyStartEvent;
  v5 = -[NFDigitalCarKeyStartEvent init](&v13, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appletIdentifier"));
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyIdentifier"));
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "spIdentifier"));
    spIdentifier = v5->_spIdentifier;
    v5->_spIdentifier = (NSString *)v10;

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
  v8.super_class = (Class)NFDigitalCarKeyStartEvent;
  v4 = -[NFDigitalCarKeyStartEvent description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { applet=%@ endpoint=%@ spid=%@ }"), v5, self->_appletIdentifier, self->_keyIdentifier, self->_spIdentifier);

  return v6;
}

- (id)asDictionary
{
  NSString *appletIdentifier;
  NSString *keyIdentifier;
  NSString *spIdentifier;
  _QWORD v6[3];
  _QWORD v7[3];

  appletIdentifier = self->_appletIdentifier;
  v6[0] = CFSTR("applet");
  v6[1] = CFSTR("endpoint");
  keyIdentifier = self->_keyIdentifier;
  spIdentifier = self->_spIdentifier;
  v7[0] = appletIdentifier;
  v7[1] = keyIdentifier;
  v6[2] = CFSTR("spIdentifier");
  v7[2] = spIdentifier;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
}

- (void)_setApplet:(id)a3
{
  objc_storeStrong((id *)&self->_applet, a3);
}

- (NFDigitalCarKeyStartEvent)initWithCoder:(id)a3
{
  id v4;
  NFDigitalCarKeyStartEvent *v5;
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
  v16.super_class = (Class)NFDigitalCarKeyStartEvent;
  v5 = -[NFDigitalCarKeyStartEvent init](&v16, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("appletIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("keyIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("spIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    spIdentifier = v5->_spIdentifier;
    v5->_spIdentifier = (NSString *)v13;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyIdentifier, CFSTR("keyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spIdentifier, CFSTR("spIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFApplet)applet
{
  return self->_applet;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSString)spIdentifier
{
  return self->_spIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
