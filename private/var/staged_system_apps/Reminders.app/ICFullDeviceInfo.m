@implementation ICFullDeviceInfo

- (ICFullDeviceInfo)initWithName:(id)a3 model:(id)a4 modelDisplayName:(id)a5 softwareVersion:(id)a6
{
  id v11;
  id v12;
  id v13;
  ICFullDeviceInfo *v14;
  ICFullDeviceInfo *v15;
  __int128 v17;
  int64_t v18;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICFullDeviceInfo;
  v14 = -[ICMigrationDeviceInfo initWithName:](&v19, "initWithName:", a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_model, a4);
    objc_storeStrong((id *)&v15->_modelDisplayName, a5);
    objc_storeStrong((id *)&v15->_softwareVersion, a6);
    -[ICFullDeviceInfo hardwareInfoFromModelId:](v15, "hardwareInfoFromModelId:", v11);
    v15->_hardwareInfo.subVersion = v18;
    *(_OWORD *)&v15->_hardwareInfo.modelName = v17;
  }

  return v15;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICFullDeviceInfo;
  v3 = -[ICFullDeviceInfo description](&v13, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICMigrationDeviceInfo name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo model](self, "model"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo modelDisplayName](self, "modelDisplayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo softwareVersion](self, "softwareVersion"));
  if (-[ICFullDeviceInfo upgradable](self, "upgradable"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[ICFullDeviceInfo upgraded](self, "upgraded"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ <name: %@, model: %@, modelDisplayName: %@, OS: %@, Upgradable: %@, Upgraded: %@"), v4, v5, v6, v7, v8, v9, v10));

  return v11;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICFullDeviceInfo;
  v3 = -[ICFullDeviceInfo description](&v12, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo modelDisplayName](self, "modelDisplayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo softwareVersion](self, "softwareVersion"));
  if (-[ICFullDeviceInfo upgradable](self, "upgradable"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[ICFullDeviceInfo upgraded](self, "upgraded"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ <model: %@, modelDisplayName: %@, OS: %@, Upgradable: %@, Upgraded: %@"), v4, v5, v6, v7, v8, v9));

  return v10;
}

- (BOOL)upgradable
{
  _BYTE v4[24];

  -[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo");
  return -[ICFullDeviceInfo isHardwareInfoUpgradable:](self, "isHardwareInfoUpgradable:", v4);
}

- (BOOL)isOSXDevice
{
  unint64_t v3;

  -[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo");
  return v3 < 9;
}

- (BOOL)isIOSDevice
{
  uint64_t v3;

  -[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo");
  return (unint64_t)(v3 - 9) < 3;
}

- (BOOL)isHardwareInfoUpgradable:(ICDeviceHardwareInfo *)a3
{
  BOOL result;
  int64_t v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  int64_t v8;
  int64_t v9;
  int64_t version;
  int64_t v11;

  result = 1;
  switch(a3->modelName)
  {
    case 1uLL:
      version = a3->version;
      v7 = __OFSUB__(version, 6);
      v5 = version == 6;
      v6 = version - 6 < 0;
      goto LABEL_7;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
      v4 = a3->version;
      v7 = __OFSUB__(v4, 2);
      v5 = v4 == 2;
      v6 = v4 - 2 < 0;
      goto LABEL_7;
    case 6uLL:
    case 9uLL:
      v8 = a3->version;
      v7 = __OFSUB__(v8, 4);
      v5 = v8 == 4;
      v6 = v8 - 4 < 0;
      goto LABEL_7;
    case 8uLL:
    case 0xBuLL:
      v9 = a3->version;
      v7 = __OFSUB__(v9, 1);
      v5 = v9 == 1;
      v6 = v9 - 1 < 0;
      goto LABEL_7;
    case 0xAuLL:
      v11 = a3->version;
      v7 = __OFSUB__(v11, 3);
      v5 = v11 == 3;
      v6 = v11 - 3 < 0;
LABEL_7:
      if (v6 ^ v7 | v5)
        result = 0;
      else
        result = 1;
      break;
    case 0xCuLL:
      result = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)upgradableTo2019OSes
{
  _BYTE v4[24];

  -[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo");
  return -[ICFullDeviceInfo isHardwareInfoUpgradableTo2019OSes:](self, "isHardwareInfoUpgradableTo2019OSes:", v4);
}

- (BOOL)isHardwareInfoUpgradableTo2019OSes:(ICDeviceHardwareInfo *)a3
{
  BOOL v3;
  BOOL result;
  int64_t version;

  switch(a3->modelName)
  {
    case 1uLL:
      v3 = a3->version <= 12;
      goto LABEL_14;
    case 2uLL:
      v3 = a3->version <= 0;
      goto LABEL_14;
    case 3uLL:
    case 4uLL:
      v3 = a3->version <= 5;
      goto LABEL_14;
    case 5uLL:
    case 0xCuLL:
      return 0;
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
      v3 = a3->version <= 7;
      goto LABEL_14;
    case 7uLL:
      v3 = a3->version <= 8;
      goto LABEL_14;
    case 8uLL:
      v3 = a3->version <= 4;
      goto LABEL_14;
    case 0xBuLL:
      version = a3->version;
      if (version == 5 || version == 6 && a3->subVersion > 2)
        goto LABEL_12;
      v3 = version <= 6;
LABEL_14:
      result = !v3;
      break;
    default:
LABEL_12:
      result = 1;
      break;
  }
  return result;
}

- (BOOL)upgradableToSydneyRomeKincaid
{
  _BYTE v4[24];

  -[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo");
  return -[ICFullDeviceInfo isHardwareInfoUpgradableToSydneyRomeKincaid:](self, "isHardwareInfoUpgradableToSydneyRomeKincaid:", v4);
}

- (BOOL)isHardwareInfoUpgradableToSydneyRomeKincaid:(ICDeviceHardwareInfo *)a3
{
  BOOL result;
  int64_t v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  int64_t v8;
  int64_t v9;
  int64_t version;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t subVersion;
  int64_t v15;

  switch(a3->modelName)
  {
    case 1uLL:
      version = a3->version;
      v7 = __OFSUB__(version, 17);
      v5 = version == 17;
      v6 = version - 17 < 0;
      return !(v6 ^ v7 | v5);
    case 2uLL:
      v11 = a3->version;
      v7 = 0;
      v5 = v11 == 0;
      v6 = v11 < 0;
      return !(v6 ^ v7 | v5);
    case 3uLL:
    case 8uLL:
      v4 = a3->version;
      v7 = __OFSUB__(v4, 7);
      v5 = v4 == 7;
      v6 = v4 - 7 < 0;
      return !(v6 ^ v7 | v5);
    case 4uLL:
      v12 = a3->version;
      v7 = __OFSUB__(v12, 6);
      v5 = v12 == 6;
      v6 = v12 - 6 < 0;
      return !(v6 ^ v7 | v5);
    case 5uLL:
    case 9uLL:
    case 0xCuLL:
      return 0;
    case 6uLL:
    case 0xAuLL:
      v8 = a3->version;
      v7 = __OFSUB__(v8, 9);
      v5 = v8 == 9;
      v6 = v8 - 9 < 0;
      return !(v6 ^ v7 | v5);
    case 7uLL:
      v13 = a3->version;
      v7 = __OFSUB__(v13, 13);
      v5 = v13 == 13;
      v6 = v13 - 13 < 0;
      return !(v6 ^ v7 | v5);
    case 0xBuLL:
      v9 = a3->version;
      if (v9 < 6)
        return 0;
      if ((unint64_t)v9 > 0xE)
        return 1;
      result = 1;
      switch(v9)
      {
        case 6:
          subVersion = a3->subVersion;
          v7 = __OFSUB__(subVersion, 2);
          v5 = subVersion == 2;
          v6 = subVersion - 2 < 0;
          return !(v6 ^ v7 | v5);
        case 7:
          v15 = a3->subVersion;
          v7 = __OFSUB__(v15, 4);
          v5 = v15 == 4;
          v6 = v15 - 4 < 0;
          return !(v6 ^ v7 | v5);
        case 8:
        case 11:
        case 12:
        case 13:
        case 14:
          return result;
        default:
          return 0;
      }
      return result;
    default:
      return 1;
  }
}

- (BOOL)upgradedToMajor:(int)a3 minor:(int)a4
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v16;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo softwareVersion](self, "softwareVersion"));

  if (!v7)
    return 0;
  v8 = objc_alloc((Class)NSScanner);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo softwareVersion](self, "softwareVersion"));
  v10 = objc_msgSend(v8, "initWithString:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "invertedSet"));
  objc_msgSend(v10, "setCharactersToBeSkipped:", v12);

  v16 = 0;
  if (!objc_msgSend(v10, "scanInt:", (char *)&v16 + 4)
    || !objc_msgSend(v10, "scanInt:", &v16))
  {
    v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore utility](REMLogStore, "utility"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10050FC48(self, v14);

    goto LABEL_11;
  }
  if (SHIDWORD(v16) <= a3 && (HIDWORD(v16) != a3 || (int)v16 < a4))
  {
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)upgradedTo2019OSes
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo softwareVersion](self, "softwareVersion"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo softwareVersion](self, "softwareVersion"));
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("OSX"));

  if (v5)
    v6 = 10;
  else
    v6 = 13;
  if (v5)
    v7 = 15;
  else
    v7 = 0;
  return -[ICFullDeviceInfo upgradedToMajor:minor:](self, "upgradedToMajor:minor:", v6, v7);
}

- (BOOL)upgradedToSydneyRomeKincaid
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo softwareVersion](self, "softwareVersion"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo softwareVersion](self, "softwareVersion"));
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("OSX"));

  if (v5)
    v6 = 13;
  else
    v6 = 16;
  return -[ICFullDeviceInfo upgradedToMajor:minor:](self, "upgradedToMajor:minor:", v6, 0);
}

- (BOOL)upgraded
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo softwareVersion](self, "softwareVersion"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo softwareVersion](self, "softwareVersion"));
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("OSX"));

  if (v5)
    v6 = 10;
  else
    v6 = 9;
  if (v5)
    v7 = 11;
  else
    v7 = 0;
  return -[ICFullDeviceInfo upgradedToMajor:minor:](self, "upgradedToMajor:minor:", v6, v7);
}

- (ICDeviceHardwareInfo)hardwareInfoFromModelId:(SEL)a3
{
  ICDeviceHardwareInfo *result;
  ICDeviceHardwareInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;

  result = (ICDeviceHardwareInfo *)a4;
  retstr->version = 0;
  retstr->subVersion = 0;
  retstr->modelName = 0;
  if (result)
  {
    v7 = result;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeviceHardwareInfo lowercaseString](result, "lowercaseString"));

    v24 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("([a-z]+)([0-9]+),([0-9]+)"), 1, &v24));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length")));
    v11 = v10;
    if (v10 && objc_msgSend(v10, "numberOfRanges") == (id)4)
    {
      v12 = objc_msgSend(v11, "rangeAtIndex:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", v12, v13));
      v15 = -[ICFullDeviceInfo hardwareInfoNameFromString:](self, "hardwareInfoNameFromString:", v14);
      retstr->modelName = v15;
      if (v15)
      {
        v16 = objc_msgSend(v11, "rangeAtIndex:", 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", v16, v17));
        v19 = objc_msgSend(v18, "integerValue");

        v20 = objc_msgSend(v11, "rangeAtIndex:", 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", v20, v21));
        v23 = objc_msgSend(v22, "integerValue");

        retstr->version = (int64_t)v19;
        retstr->subVersion = (int64_t)v23;
      }

    }
  }
  return result;
}

- (unint64_t)hardwareInfoNameFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("imac")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("imacpro")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("macmini")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("macpro")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("xserve")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("macbook")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("macbookair")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("macbookpro")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ipod")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iphone")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ipad")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("appletv")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("audioaccessory")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)shouldBeHidden
{
  void *v3;
  BOOL v4;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFullDeviceInfo softwareVersion](self, "softwareVersion"));
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("OSX")) & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "hasPrefix:", CFSTR("iOS"))
         && (-[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo"), v7 != 12))
  {
    -[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo");
    v4 = v6 == 13;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (ICDeviceHardwareInfo)hardwareInfo
{
  *retstr = self[2];
  return self;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
