@implementation NFFieldNotificationECP1_0

- (unsigned)terminalType
{
  return self->_terminalType;
}

- (unsigned)terminalMode
{
  return self->_terminalMode;
}

- (NFFieldNotificationECP1_0)initWithNotificationType:(unint64_t)a3 rfTechnology:(unsigned int)a4 typeFSystemCode:(unsigned __int16)a5 creationDate:(id)a6 cachedBeforeRFReset:(BOOL)a7 odaRequired:(BOOL)a8 terminalMode:(unsigned int)a9 terminalType:(unsigned int)a10 ignoreRFTechOnIsEqual:(BOOL)a11
{
  NFFieldNotificationECP1_0 *v12;
  NFFieldNotificationECP1_0 *v13;
  NFFieldNotificationECP1_0 *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NFFieldNotificationECP1_0;
  v12 = -[NFFieldNotification initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:](&v16, "initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:", a3, *(_QWORD *)&a4, a5, a6, a7);
  v13 = v12;
  if (v12)
  {
    v12->_odaRequired = a8;
    v12->_terminalMode = a9;
    v12->_terminalType = a10;
    v12->_ignoreRFTechOnIsEqual = a11;
    -[NFFieldNotificationECP1_0 _initCategoryWithType:](v12, "_initCategoryWithType:");
    v14 = v13;
  }

  return v13;
}

- (id)description
{
  NSMutableString *v3;
  id v4;
  const char *ClassName;
  unsigned int v6;
  _BOOL8 odaRequired;
  uint64_t v8;
  uint64_t terminalMode;
  uint64_t terminalType;
  void *v11;
  id v12;

  v3 = objc_opt_new(NSMutableString);
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 1) != 0)
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("A,"));
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 2) != 0)
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("B,"));
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 4) != 0)
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("F,"));
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 0x10) != 0)
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("V,"));
  if ((-[NFFieldNotification rfTechnology](self, "rfTechnology") & 8) != 0)
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("ECP,"));
  if (!-[NSMutableString length](v3, "length"))
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("None"));
  v4 = objc_alloc((Class)NSString);
  ClassName = object_getClassName(self);
  v6 = -[NFFieldNotification typeFSystemCode](self, "typeFSystemCode");
  odaRequired = self->_odaRequired;
  v8 = __rev16(v6);
  terminalMode = self->_terminalMode;
  terminalType = self->_terminalType;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification _creationDateString](self, "_creationDateString"));
  v12 = objc_msgSend(v4, "initWithFormat:", CFSTR("<%s: tech=%@ sc=0x%X, oda=%d, terminalMode=%d, terminalType=%d, date=%@, cached=%d>"), ClassName, v3, v8, odaRequired, terminalMode, terminalType, v11, -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset"));

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NFFieldNotificationECP1_0 *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  NFFieldNotificationECP1_0 *v10;
  uint64_t v12;

  v4 = [NFFieldNotificationECP1_0 alloc];
  v5 = -[NFFieldNotification notificationType](self, "notificationType");
  v6 = -[NFFieldNotification rfTechnology](self, "rfTechnology");
  v7 = -[NFFieldNotification typeFSystemCode](self, "typeFSystemCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification creationDate](self, "creationDate"));
  v9 = -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset");
  LOBYTE(v12) = self->_ignoreRFTechOnIsEqual;
  v10 = -[NFFieldNotificationECP1_0 initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:odaRequired:terminalMode:terminalType:ignoreRFTechOnIsEqual:](v4, "initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:odaRequired:terminalMode:terminalType:ignoreRFTechOnIsEqual:", v5, v6, v7, v8, v9, self->_odaRequired, *(_QWORD *)&self->_terminalMode, v12);

  return v10;
}

- (void)_initCategoryWithType:(unsigned int)a3
{
  uint64_t v5;

  v5 = 1;
  switch(a3)
  {
    case 0u:
      goto LABEL_3;
    case 1u:
      v5 = 4;
      goto LABEL_3;
    case 2u:
      v5 = 5;
      goto LABEL_3;
    case 3u:
    case 4u:
      v5 = 3;
      goto LABEL_3;
    default:
      if (a3 != 15)
        return;
      v5 = 2;
LABEL_3:
      -[NFFieldNotification setCategory:](self, "setCategory:", v5);
      return;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 odaRequired;
  id v5;
  objc_super v6;

  odaRequired = self->_odaRequired;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", odaRequired, CFSTR("odaRequired"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_terminalMode, CFSTR("terminalMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_terminalType, CFSTR("terminalType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ignoreRFTechOnIsEqual, CFSTR("ignoreRFTechOnIsEqual"));
  v6.receiver = self;
  v6.super_class = (Class)NFFieldNotificationECP1_0;
  -[NFFieldNotification encodeWithCoder:](&v6, "encodeWithCoder:", v5);

}

- (NFFieldNotificationECP1_0)initWithCoder:(id)a3
{
  id v4;
  NFFieldNotificationECP1_0 *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NFFieldNotificationECP1_0;
  v5 = -[NFFieldNotification initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
  {
    v5->_odaRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("odaRequired"));
    v5->_terminalMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("terminalMode"));
    v5->_terminalType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("terminalType"));
    v5->_ignoreRFTechOnIsEqual = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreRFTechOnIsEqual"));
  }

  return v5;
}

- (NFFieldNotificationECP1_0)initWithDictionaryForDavenport:(id)a3
{
  id v4;
  NFFieldNotificationECP1_0 *v5;
  NFFieldNotificationECP1_0 *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFFieldNotificationECP1_0;
  v5 = -[NFFieldNotification initWithDictionary:](&v9, "initWithDictionary:", v4);
  v6 = v5;
  if (v5)
  {
    v5->_odaRequired = 0;
    v5->_terminalType = 2;
    v5->_terminalMode = 4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("IgnoreRFTechOnIsEqual")));
    v6->_ignoreRFTechOnIsEqual = objc_msgSend(v7, "BOOLValue");

    -[NFFieldNotification setCategory:](v6, "setCategory:", 5);
    -[NFFieldNotification setNotificationType:](v6, "setNotificationType:", 2);
  }

  return v6;
}

- (NFFieldNotificationECP1_0)initWithDictionary:(id)a3
{
  id v4;
  NFFieldNotificationECP1_0 *v5;
  void *v6;
  id v7;
  _BYTE *v8;
  char v9;
  int v10;
  NFFieldNotificationECP1_0 *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NFFieldNotificationECP1_0;
  v5 = -[NFFieldNotification initWithDictionary:](&v14, "initWithDictionary:", v4);
  if (!v5)
  {
LABEL_8:
    v11 = v5;
    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("ECPData")));
  if (objc_msgSend(v6, "length") == (id)5)
  {
    -[NFFieldNotification setNotificationType:](v5, "setNotificationType:", 2);
    v7 = objc_retainAutorelease(v6);
    v8 = objc_msgSend(v7, "bytes");
    v9 = v8[2];
    v5->_odaRequired = (v9 & 0x40) == 0;
    v5->_terminalType = v9 & 0xF;
    if (v9 < 0)
      v10 = 4;
    else
      v10 = v8[4] & 3;
    v5->_terminalMode = v10;
    -[NFFieldNotificationECP1_0 _initCategoryWithType:](v5, "_initCategoryWithType:", v5->_terminalType);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("IgnoreRFTechOnIsEqual")));
    v5->_ignoreRFTechOnIsEqual = objc_msgSend(v12, "BOOLValue");

    goto LABEL_8;
  }

  v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  NFFieldNotificationECP1_0 *v4;
  uint64_t v5;
  NFFieldNotificationECP1_0 *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  char **v10;
  NFFieldNotificationECP1_0 **v11;
  unsigned __int8 v12;
  NFFieldNotificationECP1_0 *v14;
  NFFieldNotificationECP1_0 *v15;

  v4 = (NFFieldNotificationECP1_0 *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v5 = objc_opt_class(NFFieldNotificationECP1_0);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = -[NFFieldNotificationECP1_0 odaRequired](v6, "odaRequired");
      if (v7 == -[NFFieldNotificationECP1_0 odaRequired](self, "odaRequired")
        && (v8 = -[NFFieldNotificationECP1_0 terminalType](v6, "terminalType"),
            v8 == -[NFFieldNotificationECP1_0 terminalType](self, "terminalType"))
        && (v9 = -[NFFieldNotificationECP1_0 terminalMode](v6, "terminalMode"),
            v9 == -[NFFieldNotificationECP1_0 terminalMode](self, "terminalMode"))
        && -[NFFieldNotificationECP1_0 ignoreRFTechOnIsEqual](self, "ignoreRFTechOnIsEqual"))
      {
        v15 = self;
        v10 = &selRef_isEqualWithoutRFTech_;
        v11 = &v15;
      }
      else
      {
        v14 = self;
        v10 = &selRef_isEqual_;
        v11 = &v14;
      }
      v11[1] = (NFFieldNotificationECP1_0 *)NFFieldNotificationECP1_0;
      v12 = objc_msgSendSuper2((objc_super *)v11, *v10, v6, v14);

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (BOOL)odaRequired
{
  return self->_odaRequired;
}

- (BOOL)ignoreRFTechOnIsEqual
{
  return self->_ignoreRFTechOnIsEqual;
}

- (void)setIgnoreRFTechOnIsEqual:(BOOL)a3
{
  self->_ignoreRFTechOnIsEqual = a3;
}

@end
