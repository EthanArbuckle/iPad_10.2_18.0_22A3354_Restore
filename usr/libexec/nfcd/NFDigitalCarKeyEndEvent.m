@implementation NFDigitalCarKeyEndEvent

- (id)initFromContactlessPaymentEndEvent:(id)a3
{
  id v4;
  NFDigitalCarKeyEndEvent *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSNumber *brandCode;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NFDigitalCarKeyEndEvent;
  v5 = -[NFDigitalCarKeyEndEvent init](&v15, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appletIdentifier"));
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyIdentifier"));
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    v5->_didError = objc_msgSend(v4, "didError");
    v5->_result = objc_msgSend(v4, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parsedInfo"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parsedInfo"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PairingModeBrandCode")));
      brandCode = v5->_brandCode;
      v5->_brandCode = (NSNumber *)v12;

    }
  }

  return v5;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  NSString *appletIdentifier;
  NSString *keyIdentifier;
  const __CFString *v8;
  void *v9;
  id v10;
  objc_super v12;

  v3 = objc_alloc((Class)NSString);
  v12.receiver = self;
  v12.super_class = (Class)NFDigitalCarKeyEndEvent;
  v4 = -[NFDigitalCarKeyEndEvent description](&v12, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  appletIdentifier = self->_appletIdentifier;
  keyIdentifier = self->_keyIdentifier;
  if (self->_didError)
    v8 = CFSTR("yes");
  else
    v8 = CFSTR("no");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_result));
  v10 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { applet=%@ endpoint=%@ didError=%@ result=%@ brandCode=%@ }"), v5, appletIdentifier, keyIdentifier, v8, v9, self->_brandCode);

  return v10;
}

- (id)asDictionary
{
  NSString *appletIdentifier;
  NSString *keyIdentifier;
  const __CFString *v5;
  void *v6;
  NSNumber *brandCode;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  appletIdentifier = self->_appletIdentifier;
  v10[0] = CFSTR("applet");
  v10[1] = CFSTR("endpoint");
  keyIdentifier = self->_keyIdentifier;
  v11[0] = appletIdentifier;
  v11[1] = keyIdentifier;
  v5 = CFSTR("no");
  if (self->_didError)
    v5 = CFSTR("yes");
  v11[2] = v5;
  v10[2] = CFSTR("didError");
  v10[3] = CFSTR("result");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_result));
  v10[4] = CFSTR("brandCode");
  brandCode = self->_brandCode;
  v11[3] = v6;
  v11[4] = brandCode;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 5));

  return v8;
}

- (id)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)_setApplet:(id)a3
{
  objc_storeStrong((id *)&self->_applet, a3);
}

- (NFDigitalCarKeyEndEvent)initWithCoder:(id)a3
{
  id v4;
  NFDigitalCarKeyEndEvent *v5;
  id v6;
  uint64_t v7;
  NSString *appletIdentifier;
  id v9;
  uint64_t v10;
  NSString *keyIdentifier;
  id v12;
  uint64_t v13;
  NSNumber *brandCode;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NFDigitalCarKeyEndEvent;
  v5 = -[NFDigitalCarKeyEndEvent init](&v16, "init");
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

    v5->_didError = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didError"));
    v5->_result = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("result"));
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("brandCode"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    brandCode = v5->_brandCode;
    v5->_brandCode = (NSNumber *)v13;

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
  objc_msgSend(v5, "encodeBool:forKey:", self->_didError, CFSTR("didError"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_result, CFSTR("result"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_brandCode, CFSTR("brandCode"));

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

- (BOOL)didError
{
  return self->_didError;
}

- (unsigned)result
{
  return self->_result;
}

- (NSNumber)brandCode
{
  return self->_brandCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandCode, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
