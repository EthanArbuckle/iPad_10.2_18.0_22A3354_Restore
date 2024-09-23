@implementation NFTechnologyEvent

- (NFTechnologyEvent)initWithTechnology:(unsigned int)a3 andValueAddedServiceMode:(unsigned int)a4 andSystemCode:(unsigned __int16)a5
{
  unsigned __int8 v6;
  NFTechnologyEvent *result;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)NFTechnologyEvent;
  result = -[NFTechnologyEvent init](&v9, "init");
  if (result)
  {
    result->_technology = a3;
    result->_valueAddedServiceMode = v6;
    result->_systemCode = a5;
  }
  return result;
}

- (NFTechnologyEvent)initWithDictionary:(id)a3
{
  id v4;
  NFTechnologyEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFTechnologyEvent;
  v5 = -[NFTechnologyEvent init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("technologyMask")));
    v5->_technology = objc_msgSend(v6, "unsignedIntegerValue");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("valueAddedServiceMode")));
    v5->_valueAddedServiceMode = objc_msgSend(v7, "unsignedIntegerValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemCode")));
    v5->_systemCode = (unsigned __int16)objc_msgSend(v8, "unsignedIntegerValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vasSupported")));
    v5->_vasSupported = objc_msgSend(v9, "BOOLValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("terminalType")));
    v5->_terminalType = objc_msgSend(v10, "unsignedIntegerValue");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("touchIDRequired")));
    v5->_touchIDRequired = objc_msgSend(v11, "BOOLValue");

  }
  return v5;
}

- (NFTechnologyEvent)initWithTechnology:(unsigned int)a3 andValueAddedServiceMode:(unsigned int)a4
{
  unsigned __int8 v4;
  NFTechnologyEvent *result;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)NFTechnologyEvent;
  result = -[NFTechnologyEvent init](&v7, "init");
  if (result)
  {
    result->_technology = a3;
    result->_valueAddedServiceMode = v4;
  }
  return result;
}

- (NFTechnologyEvent)initWithFieldNotification:(id)a3
{
  id v4;
  NFTechnologyEvent *v5;
  id v6;
  unsigned int v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFTechnologyEvent;
  v5 = -[NFTechnologyEvent init](&v9, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "notificationType") == (id)1)
    {
      v5->_technology = objc_msgSend(v4, "rfTechnology");
      v5->_valueAddedServiceMode = 4;
      v5->_systemCode = (unsigned __int16)objc_msgSend(v4, "typeFSystemCode");
    }
    else if (objc_msgSend(v4, "notificationType") == (id)2)
    {
      v6 = v4;
      v5->_technology = objc_msgSend(v6, "rfTechnology");
      v5->_valueAddedServiceMode = objc_msgSend(v6, "terminalMode");
      v5->_systemCode = (unsigned __int16)objc_msgSend(v6, "typeFSystemCode");
      v5->_vasSupported = objc_msgSend(v6, "terminalMode") != 4;
      v5->_touchIDRequired = objc_msgSend(v6, "odaRequired");
      v7 = objc_msgSend(v6, "terminalType");

      v5->_terminalType = v7;
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)description
{
  unsigned int technology;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  id v15;
  id v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v24;
  uint64_t v26;
  objc_super v27;
  objc_super v28;

  technology = self->_technology;
  v4 = objc_alloc((Class)NSString);
  if ((technology & 4) != 0)
  {
    v28.receiver = self;
    v28.super_class = (Class)NFTechnologyEvent;
    v16 = -[NFTechnologyEvent description](&v28, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v17 = self->_technology;
    v18 = v17 & 1;
    v19 = (v17 >> 1) & 1;
    v20 = (v17 >> 2) & 1;
    v21 = (v17 >> 3) & 1;
    v22 = "YES";
    if (self->_vasSupported)
      v23 = "YES";
    else
      v23 = "NO";
    if (!self->_touchIDRequired)
      v22 = "NO";
    v15 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ { A=%d B=%d, F=%d SystemCode=0x%04x, VAS=%d, VAS Mode=0x%04x, VAS Supported=%s, TerminalType=%d, TouchIDRequired=%s }"), v7, v18, v19, v20, self->_systemCode, v21, self->_valueAddedServiceMode, v23, self->_terminalType, v22);
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)NFTechnologyEvent;
    v5 = -[NFTechnologyEvent description](&v27, "description");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)v6;
    v8 = self->_technology;
    v9 = v8 & 1;
    v10 = (v8 >> 1) & 1;
    v11 = (v8 >> 2) & 1;
    v12 = (v8 >> 3) & 1;
    v13 = "YES";
    if (self->_vasSupported)
      v14 = "YES";
    else
      v14 = "NO";
    if (!self->_touchIDRequired)
      v13 = "NO";
    v15 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ { A=%d B=%d, F=%d, ECP=%d, VAS Mode=0x%04x, VAS Supported=%s, TerminalType=%d, TouchIDRequired=%s }"), v6, v9, v10, v11, v12, self->_valueAddedServiceMode, v14, self->_terminalType, v13, v26);
  }
  v24 = v15;

  return v24;
}

- (NFTechnologyEvent)initWithCoder:(id)a3
{
  id v4;
  NFTechnologyEvent *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NFTechnologyEvent;
  v5 = -[NFTechnologyEvent init](&v7, "init");
  if (v5)
  {
    v5->_technology = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("technologyMask"));
    v5->_valueAddedServiceMode = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("valueAddedServiceMode"));
    v5->_systemCode = (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("systemCode"));
    v5->_vasSupported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("vasSupported"));
    v5->_touchIDRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("touchIDRequired"));
    v5->_terminalType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("terminalType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t technology;
  id v5;

  technology = self->_technology;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", technology, CFSTR("technologyMask"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_valueAddedServiceMode, CFSTR("valueAddedServiceMode"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_systemCode, CFSTR("systemCode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_vasSupported, CFSTR("vasSupported"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_touchIDRequired, CFSTR("touchIDRequired"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_terminalType, CFSTR("terminalType"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)technology
{
  return self->_technology;
}

- (unsigned)valueAddedServiceMode
{
  return self->_valueAddedServiceMode;
}

- (unsigned)systemCode
{
  return self->_systemCode;
}

- (BOOL)vasSupported
{
  return self->_vasSupported;
}

- (BOOL)touchIDRequired
{
  return self->_touchIDRequired;
}

- (unsigned)terminalType
{
  return self->_terminalType;
}

@end
