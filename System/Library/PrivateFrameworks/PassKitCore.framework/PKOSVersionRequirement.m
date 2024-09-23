@implementation PKOSVersionRequirement

- (PKOSVersionRequirement)initWithDictionary:(id)a3
{
  id v4;
  PKOSVersionRequirement *v5;
  uint64_t v6;
  NSString *iphone;
  uint64_t v8;
  NSString *ipad;
  uint64_t v10;
  NSString *ipod;
  uint64_t v12;
  NSString *appletv;
  uint64_t v14;
  NSString *vision;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *watch;
  uint64_t v22;
  NSString *mac;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKOSVersionRequirement;
  v5 = -[PKOSVersionRequirement init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("iPhone"));
    v6 = objc_claimAutoreleasedReturnValue();
    iphone = v5->_iphone;
    v5->_iphone = (NSString *)v6;

    objc_storeStrong((id *)&v5->_specifiediphone, v5->_iphone);
    objc_msgSend(v4, "PKStringForKey:", CFSTR("iPad"));
    v8 = objc_claimAutoreleasedReturnValue();
    ipad = v5->_ipad;
    v5->_ipad = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("iPod"));
    v10 = objc_claimAutoreleasedReturnValue();
    ipod = v5->_ipod;
    v5->_ipod = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("AppleTV"));
    v12 = objc_claimAutoreleasedReturnValue();
    appletv = v5->_appletv;
    v5->_appletv = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("RealityDevice"));
    v14 = objc_claimAutoreleasedReturnValue();
    vision = v5->_vision;
    v5->_vision = (NSString *)v14;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("WatchOS"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "PKStringForKey:", CFSTR("iPhone"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v5->_iphone;
      v5->_iphone = (NSString *)v18;

      objc_msgSend(v17, "PKStringForKey:", CFSTR("Watch"));
      v20 = objc_claimAutoreleasedReturnValue();
      watch = v5->_watch;
      v5->_watch = (NSString *)v20;

    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("Mac"));
    v22 = objc_claimAutoreleasedReturnValue();
    mac = v5->_mac;
    v5->_mac = (NSString *)v22;

  }
  return v5;
}

+ (id)fromDeviceVersion
{
  void *v2;
  void *v3;
  void *v4;
  PKOSVersionRequirement *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  PKDeviceClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  PKOSVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PKOSVersionRequirement initWithDictionary:]([PKOSVersionRequirement alloc], "initWithDictionary:", v4);
  return v5;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  NSString *specifiediphone;
  NSString *ipad;
  NSString *ipod;
  NSString *appletv;
  NSString *vision;
  id v10;
  NSString *iphone;
  void *v12;
  NSString *mac;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  specifiediphone = self->_specifiediphone;
  if (specifiediphone)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", specifiediphone, CFSTR("iPhone"));
  ipad = self->_ipad;
  if (ipad)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", ipad, CFSTR("iPad"));
  ipod = self->_ipod;
  if (ipod)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", ipod, CFSTR("iPod"));
  appletv = self->_appletv;
  if (appletv)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", appletv, CFSTR("AppleTV"));
  vision = self->_vision;
  if (vision)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", vision, CFSTR("RealityDevice"));
  if (self->_watch)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_watch, CFSTR("Watch"));
    iphone = self->_iphone;
    if (iphone)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", iphone, CFSTR("iPhone"));
    v12 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("WatchOS"));

  }
  mac = self->_mac;
  if (mac)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", mac, CFSTR("Mac"));
  v14 = (void *)objc_msgSend(v4, "copy");

  return v14;
}

- (int64_t)compare:(id)a3 deviceClass:(id)a4
{
  id v6;
  id v7;
  NSString *mac;
  uint64_t v9;
  void *v10;
  int64_t v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Mac")))
  {
    mac = self->_mac;
    objc_msgSend(v6, "mac");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPhone")))
  {
    mac = self->_iphone;
    objc_msgSend(v6, "iphone");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("Watch")))
  {
    mac = self->_watch;
    objc_msgSend(v6, "watch");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPod")))
  {
    mac = self->_ipod;
    objc_msgSend(v6, "ipod");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPad")))
  {
    mac = self->_ipad;
    objc_msgSend(v6, "ipad");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AppleTV")))
  {
    mac = self->_appletv;
    objc_msgSend(v6, "appletv");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("RealityDevice")))
    {
      v11 = 0;
      goto LABEL_16;
    }
    mac = self->_vision;
    objc_msgSend(v6, "vision");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  v11 = -[NSString compare:options:](mac, "compare:options:", v9, 64);

LABEL_16:
  return v11;
}

- (id)versionForDeviceClass:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Mac")) & 1) != 0)
  {
    v5 = 40;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    v5 = 8;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Watch")) & 1) != 0)
  {
    v5 = 48;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("iPod")) & 1) != 0)
  {
    v5 = 24;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("iPad")) & 1) != 0)
  {
    v5 = 16;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("AppleTV")) & 1) != 0)
  {
    v5 = 32;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("RealityDevice")))
    {
      v6 = 0;
      goto LABEL_16;
    }
    v5 = 56;
  }
  v6 = *(id *)((char *)&self->super.isa + v5);
LABEL_16:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKOSVersionRequirement)initWithCoder:(id)a3
{
  id v4;
  PKOSVersionRequirement *v5;
  uint64_t v6;
  NSString *mac;
  uint64_t v8;
  NSString *iphone;
  uint64_t v10;
  NSString *specifiediphone;
  uint64_t v12;
  NSString *ipad;
  uint64_t v14;
  NSString *ipod;
  uint64_t v16;
  NSString *appletv;
  uint64_t v18;
  NSString *watch;
  uint64_t v20;
  NSString *vision;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKOSVersionRequirement;
  v5 = -[PKOSVersionRequirement init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Mac"));
    v6 = objc_claimAutoreleasedReturnValue();
    mac = v5->_mac;
    v5->_mac = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iPhone"));
    v8 = objc_claimAutoreleasedReturnValue();
    iphone = v5->_iphone;
    v5->_iphone = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("specifiediPhone"));
    v10 = objc_claimAutoreleasedReturnValue();
    specifiediphone = v5->_specifiediphone;
    v5->_specifiediphone = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iPad"));
    v12 = objc_claimAutoreleasedReturnValue();
    ipad = v5->_ipad;
    v5->_ipad = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iPod"));
    v14 = objc_claimAutoreleasedReturnValue();
    ipod = v5->_ipod;
    v5->_ipod = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppleTV"));
    v16 = objc_claimAutoreleasedReturnValue();
    appletv = v5->_appletv;
    v5->_appletv = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Watch"));
    v18 = objc_claimAutoreleasedReturnValue();
    watch = v5->_watch;
    v5->_watch = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RealityDevice"));
    v20 = objc_claimAutoreleasedReturnValue();
    vision = v5->_vision;
    v5->_vision = (NSString *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *mac;
  id v5;

  mac = self->_mac;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mac, CFSTR("Mac"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iphone, CFSTR("iPhone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_specifiediphone, CFSTR("specifiediPhone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ipad, CFSTR("iPad"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ipod, CFSTR("iPod"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appletv, CFSTR("AppleTV"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_watch, CFSTR("Watch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vision, CFSTR("RealityDevice"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKOSVersionRequirement *v5;
  uint64_t v6;
  NSString *iphone;
  uint64_t v8;
  NSString *specifiediphone;
  uint64_t v10;
  NSString *ipad;
  uint64_t v12;
  NSString *ipod;
  uint64_t v14;
  NSString *appletv;
  uint64_t v16;
  NSString *mac;
  uint64_t v18;
  NSString *watch;
  uint64_t v20;
  NSString *vision;

  v5 = -[PKOSVersionRequirement init](+[PKOSVersionRequirement allocWithZone:](PKOSVersionRequirement, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_iphone, "copyWithZone:", a3);
  iphone = v5->_iphone;
  v5->_iphone = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_specifiediphone, "copyWithZone:", a3);
  specifiediphone = v5->_specifiediphone;
  v5->_specifiediphone = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_ipad, "copyWithZone:", a3);
  ipad = v5->_ipad;
  v5->_ipad = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_ipod, "copyWithZone:", a3);
  ipod = v5->_ipod;
  v5->_ipod = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_appletv, "copyWithZone:", a3);
  appletv = v5->_appletv;
  v5->_appletv = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_mac, "copyWithZone:", a3);
  mac = v5->_mac;
  v5->_mac = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_watch, "copyWithZone:", a3);
  watch = v5->_watch;
  v5->_watch = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_vision, "copyWithZone:", a3);
  vision = v5->_vision;
  v5->_vision = (NSString *)v20;

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_iphone);
  objc_msgSend(v3, "safelyAddObject:", self->_specifiediphone);
  objc_msgSend(v3, "safelyAddObject:", self->_ipad);
  objc_msgSend(v3, "safelyAddObject:", self->_ipod);
  objc_msgSend(v3, "safelyAddObject:", self->_appletv);
  objc_msgSend(v3, "safelyAddObject:", self->_mac);
  objc_msgSend(v3, "safelyAddObject:", self->_watch);
  objc_msgSend(v3, "safelyAddObject:", self->_vision);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKOSVersionRequirement *v4;
  PKOSVersionRequirement *v5;
  BOOL v6;

  v4 = (PKOSVersionRequirement *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKOSVersionRequirement isEqualToOSVersionRequirement:](self, "isEqualToOSVersionRequirement:", v5);

  return v6;
}

- (BOOL)isEqualToOSVersionRequirement:(id)a3
{
  _QWORD *v4;
  NSString *iphone;
  NSString *v6;
  BOOL v7;
  NSString *specifiediphone;
  NSString *v9;
  NSString *ipad;
  NSString *v11;
  NSString *ipod;
  NSString *v13;
  NSString *appletv;
  NSString *v15;
  NSString *mac;
  NSString *v17;
  NSString *watch;
  NSString *v19;
  NSString *vision;
  NSString *v21;
  char v22;

  v4 = a3;
  iphone = self->_iphone;
  v6 = (NSString *)v4[1];
  if (iphone)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (iphone != v6)
      goto LABEL_41;
  }
  else if ((-[NSString isEqual:](iphone, "isEqual:") & 1) == 0)
  {
    goto LABEL_41;
  }
  specifiediphone = self->_specifiediphone;
  v9 = (NSString *)v4[8];
  if (specifiediphone && v9)
  {
    if ((-[NSString isEqual:](specifiediphone, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (specifiediphone != v9)
  {
    goto LABEL_41;
  }
  ipad = self->_ipad;
  v11 = (NSString *)v4[2];
  if (ipad && v11)
  {
    if ((-[NSString isEqual:](ipad, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (ipad != v11)
  {
    goto LABEL_41;
  }
  ipod = self->_ipod;
  v13 = (NSString *)v4[3];
  if (ipod && v13)
  {
    if ((-[NSString isEqual:](ipod, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (ipod != v13)
  {
    goto LABEL_41;
  }
  appletv = self->_appletv;
  v15 = (NSString *)v4[4];
  if (appletv && v15)
  {
    if ((-[NSString isEqual:](appletv, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (appletv != v15)
  {
    goto LABEL_41;
  }
  mac = self->_mac;
  v17 = (NSString *)v4[5];
  if (mac && v17)
  {
    if ((-[NSString isEqual:](mac, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (mac != v17)
  {
    goto LABEL_41;
  }
  watch = self->_watch;
  v19 = (NSString *)v4[6];
  if (!watch || !v19)
  {
    if (watch == v19)
      goto LABEL_37;
LABEL_41:
    v22 = 0;
    goto LABEL_42;
  }
  if ((-[NSString isEqual:](watch, "isEqual:") & 1) == 0)
    goto LABEL_41;
LABEL_37:
  vision = self->_vision;
  v21 = (NSString *)v4[7];
  if (vision && v21)
    v22 = -[NSString isEqual:](vision, "isEqual:");
  else
    v22 = vision == v21;
LABEL_42:

  return v22;
}

- (NSString)iphone
{
  return self->_iphone;
}

- (NSString)ipad
{
  return self->_ipad;
}

- (NSString)ipod
{
  return self->_ipod;
}

- (NSString)appletv
{
  return self->_appletv;
}

- (NSString)mac
{
  return self->_mac;
}

- (NSString)watch
{
  return self->_watch;
}

- (NSString)vision
{
  return self->_vision;
}

- (NSString)specifiediphone
{
  return self->_specifiediphone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiediphone, 0);
  objc_storeStrong((id *)&self->_vision, 0);
  objc_storeStrong((id *)&self->_watch, 0);
  objc_storeStrong((id *)&self->_mac, 0);
  objc_storeStrong((id *)&self->_appletv, 0);
  objc_storeStrong((id *)&self->_ipod, 0);
  objc_storeStrong((id *)&self->_ipad, 0);
  objc_storeStrong((id *)&self->_iphone, 0);
}

@end
