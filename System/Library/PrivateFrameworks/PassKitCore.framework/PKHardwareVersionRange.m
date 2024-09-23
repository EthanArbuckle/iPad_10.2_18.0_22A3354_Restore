@implementation PKHardwareVersionRange

- (PKHardwareVersionRange)initWithDictionary:(id)a3
{
  id v4;
  PKHardwareVersionRange *v5;
  void *v6;
  PKDeviceVersionRange *v7;
  PKDeviceVersionRange *iphone;
  void *v9;
  PKDeviceVersionRange *v10;
  PKDeviceVersionRange *watch;
  void *v12;
  PKDeviceVersionRange *v13;
  PKDeviceVersionRange *ipad;
  void *v15;
  PKDeviceVersionRange *v16;
  PKDeviceVersionRange *ipod;
  void *v18;
  PKDeviceVersionRange *v19;
  PKDeviceVersionRange *appletv;
  void *v21;
  PKDeviceVersionRange *v22;
  PKDeviceVersionRange *vision;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKHardwareVersionRange;
  v5 = -[PKHardwareVersionRange init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("iPhone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[PKDeviceVersionRange initWithDictionary:]([PKDeviceVersionRange alloc], "initWithDictionary:", v6);
      iphone = v5->_iphone;
      v5->_iphone = v7;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("Watch"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = -[PKDeviceVersionRange initWithDictionary:]([PKDeviceVersionRange alloc], "initWithDictionary:", v9);
      watch = v5->_watch;
      v5->_watch = v10;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("iPad"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = -[PKDeviceVersionRange initWithDictionary:]([PKDeviceVersionRange alloc], "initWithDictionary:", v12);
      ipad = v5->_ipad;
      v5->_ipad = v13;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("iPod"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = -[PKDeviceVersionRange initWithDictionary:]([PKDeviceVersionRange alloc], "initWithDictionary:", v15);
      ipod = v5->_ipod;
      v5->_ipod = v16;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("AppleTV"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = -[PKDeviceVersionRange initWithDictionary:]([PKDeviceVersionRange alloc], "initWithDictionary:", v18);
      appletv = v5->_appletv;
      v5->_appletv = v19;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("RealityDevice"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = -[PKDeviceVersionRange initWithDictionary:]([PKDeviceVersionRange alloc], "initWithDictionary:", v21);
      vision = v5->_vision;
      v5->_vision = v22;

    }
  }

  return v5;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKDeviceVersionRange asDictionary](self->_iphone, "asDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("iPhone"));

  -[PKDeviceVersionRange asDictionary](self->_watch, "asDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Watch"));

  -[PKDeviceVersionRange asDictionary](self->_ipad, "asDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("iPad"));

  -[PKDeviceVersionRange asDictionary](self->_ipod, "asDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("iPod"));

  -[PKDeviceVersionRange asDictionary](self->_appletv, "asDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("AppleTV"));

  -[PKDeviceVersionRange asDictionary](self->_vision, "asDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("RealityDevice"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (BOOL)matchesDeviceVersion:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  __CFString *v20;
  __CFString *v21;
  int v22;
  __CFString *v23;
  __CFString *v24;
  int v25;

  v4 = a3;
  objc_msgSend(v4, "deviceClass");
  v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == CFSTR("iPhone"))
    goto LABEL_4;
  if (!v5)
  {
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  v7 = objc_msgSend(CFSTR("iPhone"), "isEqualToString:", v5);

  if (v7)
  {
LABEL_4:
    -[PKHardwareVersionRange iphone](self, "iphone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v6;
    if (v11 == CFSTR("Watch")
      || (v12 = v11, v13 = objc_msgSend(CFSTR("Watch"), "isEqualToString:", v11), v12, v13))
    {
      -[PKHardwareVersionRange watch](self, "watch");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v12;
      if (v14 == CFSTR("iPad")
        || (v15 = v14, v16 = objc_msgSend(CFSTR("iPad"), "isEqualToString:", v14), v15, v16))
      {
        -[PKHardwareVersionRange ipad](self, "ipad");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = v15;
        if (v17 == CFSTR("iPod")
          || (v18 = v17, v19 = objc_msgSend(CFSTR("iPod"), "isEqualToString:", v17), v18, v19))
        {
          -[PKHardwareVersionRange ipod](self, "ipod");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = v18;
          if (v20 == CFSTR("AppleTV")
            || (v21 = v20, v22 = objc_msgSend(CFSTR("AppleTV"), "isEqualToString:", v20), v21, v22))
          {
            -[PKHardwareVersionRange appletv](self, "appletv");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = v21;
            if (v23 != CFSTR("RealityDevice"))
            {
              v24 = v23;
              v25 = objc_msgSend(CFSTR("RealityDevice"), "isEqualToString:", v23);

              if (!v25)
                goto LABEL_22;
            }
            -[PKHardwareVersionRange vision](self, "vision");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
  }
  v9 = v8;
  if (!v8)
    goto LABEL_22;
  v10 = objc_msgSend(v8, "_matchesDeviceVersion:", v4);

LABEL_23:
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKHardwareVersionRange)initWithCoder:(id)a3
{
  id v4;
  PKHardwareVersionRange *v5;
  uint64_t v6;
  uint64_t v7;
  PKDeviceVersionRange *iphone;
  uint64_t v9;
  PKDeviceVersionRange *watch;
  uint64_t v11;
  PKDeviceVersionRange *ipad;
  uint64_t v13;
  PKDeviceVersionRange *ipod;
  uint64_t v15;
  PKDeviceVersionRange *appletv;
  uint64_t v17;
  PKDeviceVersionRange *vision;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKHardwareVersionRange;
  v5 = -[PKHardwareVersionRange init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("iPhone"));
    v7 = objc_claimAutoreleasedReturnValue();
    iphone = v5->_iphone;
    v5->_iphone = (PKDeviceVersionRange *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("Watch"));
    v9 = objc_claimAutoreleasedReturnValue();
    watch = v5->_watch;
    v5->_watch = (PKDeviceVersionRange *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("iPad"));
    v11 = objc_claimAutoreleasedReturnValue();
    ipad = v5->_ipad;
    v5->_ipad = (PKDeviceVersionRange *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("iPod"));
    v13 = objc_claimAutoreleasedReturnValue();
    ipod = v5->_ipod;
    v5->_ipod = (PKDeviceVersionRange *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("AppleTV"));
    v15 = objc_claimAutoreleasedReturnValue();
    appletv = v5->_appletv;
    v5->_appletv = (PKDeviceVersionRange *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("RealityDevice"));
    v17 = objc_claimAutoreleasedReturnValue();
    vision = v5->_vision;
    v5->_vision = (PKDeviceVersionRange *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKDeviceVersionRange *iphone;
  id v5;

  iphone = self->_iphone;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", iphone, CFSTR("iPhone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_watch, CFSTR("Watch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ipad, CFSTR("iPad"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ipod, CFSTR("iPod"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appletv, CFSTR("AppleTV"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vision, CFSTR("RealityDevice"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKHardwareVersionRange *v5;
  PKDeviceVersionRange *v6;
  PKDeviceVersionRange *iphone;
  PKDeviceVersionRange *v8;
  PKDeviceVersionRange *watch;
  PKDeviceVersionRange *v10;
  PKDeviceVersionRange *ipad;
  PKDeviceVersionRange *v12;
  PKDeviceVersionRange *ipod;
  PKDeviceVersionRange *v14;
  PKDeviceVersionRange *appletv;
  PKDeviceVersionRange *v16;
  PKDeviceVersionRange *vision;

  v5 = -[PKHardwareVersionRange init](+[PKHardwareVersionRange allocWithZone:](PKHardwareVersionRange, "allocWithZone:"), "init");
  v6 = -[PKDeviceVersionRange copyWithZone:](self->_iphone, "copyWithZone:", a3);
  iphone = v5->_iphone;
  v5->_iphone = v6;

  v8 = -[PKDeviceVersionRange copyWithZone:](self->_watch, "copyWithZone:", a3);
  watch = v5->_watch;
  v5->_watch = v8;

  v10 = -[PKDeviceVersionRange copyWithZone:](self->_ipad, "copyWithZone:", a3);
  ipad = v5->_ipad;
  v5->_ipad = v10;

  v12 = -[PKDeviceVersionRange copyWithZone:](self->_ipod, "copyWithZone:", a3);
  ipod = v5->_ipod;
  v5->_ipod = v12;

  v14 = -[PKDeviceVersionRange copyWithZone:](self->_appletv, "copyWithZone:", a3);
  appletv = v5->_appletv;
  v5->_appletv = v14;

  v16 = -[PKDeviceVersionRange copyWithZone:](self->_vision, "copyWithZone:", a3);
  vision = v5->_vision;
  v5->_vision = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKHardwareVersionRange *v4;
  PKHardwareVersionRange *v5;
  BOOL v6;

  v4 = (PKHardwareVersionRange *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKHardwareVersionRange isEqualToHardwareVersionRange:](self, "isEqualToHardwareVersionRange:", v5);

  return v6;
}

- (BOOL)isEqualToHardwareVersionRange:(id)a3
{
  _QWORD *v4;
  PKDeviceVersionRange *iphone;
  PKDeviceVersionRange *v6;
  BOOL v7;
  PKDeviceVersionRange *watch;
  PKDeviceVersionRange *v9;
  PKDeviceVersionRange *ipad;
  PKDeviceVersionRange *v11;
  PKDeviceVersionRange *ipod;
  PKDeviceVersionRange *v13;
  PKDeviceVersionRange *appletv;
  PKDeviceVersionRange *v15;
  PKDeviceVersionRange *vision;
  PKDeviceVersionRange *v17;
  BOOL v18;

  v4 = a3;
  iphone = self->_iphone;
  v6 = (PKDeviceVersionRange *)v4[1];
  if (iphone)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (iphone != v6)
      goto LABEL_31;
  }
  else if (!-[PKDeviceVersionRange isEqual:](iphone, "isEqual:"))
  {
    goto LABEL_31;
  }
  watch = self->_watch;
  v9 = (PKDeviceVersionRange *)v4[2];
  if (watch && v9)
  {
    if (!-[PKDeviceVersionRange isEqual:](watch, "isEqual:"))
      goto LABEL_31;
  }
  else if (watch != v9)
  {
    goto LABEL_31;
  }
  ipad = self->_ipad;
  v11 = (PKDeviceVersionRange *)v4[3];
  if (ipad && v11)
  {
    if (!-[PKDeviceVersionRange isEqual:](ipad, "isEqual:"))
      goto LABEL_31;
  }
  else if (ipad != v11)
  {
    goto LABEL_31;
  }
  ipod = self->_ipod;
  v13 = (PKDeviceVersionRange *)v4[4];
  if (ipod && v13)
  {
    if (!-[PKDeviceVersionRange isEqual:](ipod, "isEqual:"))
      goto LABEL_31;
  }
  else if (ipod != v13)
  {
    goto LABEL_31;
  }
  appletv = self->_appletv;
  v15 = (PKDeviceVersionRange *)v4[5];
  if (!appletv || !v15)
  {
    if (appletv == v15)
      goto LABEL_27;
LABEL_31:
    v18 = 0;
    goto LABEL_32;
  }
  if (!-[PKDeviceVersionRange isEqual:](appletv, "isEqual:"))
    goto LABEL_31;
LABEL_27:
  vision = self->_vision;
  v17 = (PKDeviceVersionRange *)v4[6];
  if (vision && v17)
    v18 = -[PKDeviceVersionRange isEqual:](vision, "isEqual:");
  else
    v18 = vision == v17;
LABEL_32:

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_iphone);
  objc_msgSend(v3, "safelyAddObject:", self->_watch);
  objc_msgSend(v3, "safelyAddObject:", self->_ipad);
  objc_msgSend(v3, "safelyAddObject:", self->_ipod);
  objc_msgSend(v3, "safelyAddObject:", self->_appletv);
  objc_msgSend(v3, "safelyAddObject:", self->_vision);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("iphone: '%@'; "), self->_iphone);
  objc_msgSend(v3, "appendFormat:", CFSTR("watch: '%@'; "), self->_watch);
  objc_msgSend(v3, "appendFormat:", CFSTR("ipad: '%@'; "), self->_ipad);
  objc_msgSend(v3, "appendFormat:", CFSTR("ipod: '%@'; "), self->_ipod);
  objc_msgSend(v3, "appendFormat:", CFSTR("appletv: '%@'; "), self->_appletv);
  objc_msgSend(v3, "appendFormat:", CFSTR("vision: '%@'; "), self->_vision);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (PKDeviceVersionRange)iphone
{
  return self->_iphone;
}

- (PKDeviceVersionRange)watch
{
  return self->_watch;
}

- (PKDeviceVersionRange)ipad
{
  return self->_ipad;
}

- (PKDeviceVersionRange)ipod
{
  return self->_ipod;
}

- (PKDeviceVersionRange)appletv
{
  return self->_appletv;
}

- (PKDeviceVersionRange)vision
{
  return self->_vision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vision, 0);
  objc_storeStrong((id *)&self->_appletv, 0);
  objc_storeStrong((id *)&self->_ipod, 0);
  objc_storeStrong((id *)&self->_ipad, 0);
  objc_storeStrong((id *)&self->_watch, 0);
  objc_storeStrong((id *)&self->_iphone, 0);
}

@end
