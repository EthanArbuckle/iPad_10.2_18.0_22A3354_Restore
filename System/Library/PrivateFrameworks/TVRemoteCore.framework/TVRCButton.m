@implementation TVRCButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCButton)initWithCoder:(id)a3
{
  id v4;
  TVRCButton *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *properties;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TVRCButton;
  v5 = -[TVRCButton init](&v13, sel_init);
  if (v5)
  {
    v5->_buttonType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("buttonType"));
    v5->_hasTapAction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasTapAction"));
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("properties"));
    v10 = objc_claimAutoreleasedReturnValue();
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t buttonType;
  id v5;

  buttonType = self->_buttonType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", buttonType, CFSTR("buttonType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasTapAction, CFSTR("hasTapAction"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_properties, CFSTR("properties"));

}

- (id)_initWithButtonType:(int64_t)a3
{
  return -[TVRCButton _initWithButtonType:hasTapAction:properties:](self, "_initWithButtonType:hasTapAction:properties:", a3, 0, MEMORY[0x24BDBD1B8]);
}

- (id)_initWithButtonType:(int64_t)a3 hasTapAction:(BOOL)a4 properties:(id)a5
{
  id v8;
  TVRCButton *v9;
  TVRCButton *v10;
  void *v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TVRCButton;
  v9 = -[TVRCButton init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_buttonType = a3;
    v9->_hasTapAction = a4;
    if (v8)
      v11 = v8;
    else
      v11 = (void *)MEMORY[0x24BDBD1B8];
    objc_storeStrong((id *)&v9->_properties, v11);
    v10->_enabled = 1;
  }

  return v10;
}

- (void)_setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

+ (BOOL)_isMediaButtonEvent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = a3;
  objc_msgSend(v3, "setWithArray:", &unk_24DCF9398);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "buttonType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v5, "containsObject:", v8);

  return (char)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TVRCButton isEqualToButton:](self, "isEqualToButton:", v4);

  return v5;
}

- (unint64_t)hash
{
  return (((unint64_t)self->_enabled << 24) ^ (self->_buttonType << 16) | ((unint64_t)self->_hasTapAction << 8)) ^ -[NSDictionary hash](self->_properties, "hash");
}

- (BOOL)isEqualToButton:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  BOOL v6;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  v6 = self->_buttonType == *((_QWORD *)v4 + 2)
    && self->_hasTapAction == v4[9]
    && self->_enabled == v4[8]
    && -[NSDictionary isEqualToDictionary:](self->_properties, "isEqualToDictionary:", *((_QWORD *)v4 + 3));

  return v6;
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = objc_opt_class();
  TVRCButtonTypeDescription(self->_buttonType);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_hasTapAction)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; type=%@; hasTapAction=%@"), v4, self, v5, v7);

  if (!self->_enabled)
    objc_msgSend(v8, "appendString:", CFSTR("; disabled"));
  if (-[NSDictionary count](self->_properties, "count"))
    objc_msgSend(v8, "appendFormat:", CFSTR("; properties=%@"), self->_properties);
  objc_msgSend(v8, "appendString:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)hasTapAction
{
  return self->_hasTapAction;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
