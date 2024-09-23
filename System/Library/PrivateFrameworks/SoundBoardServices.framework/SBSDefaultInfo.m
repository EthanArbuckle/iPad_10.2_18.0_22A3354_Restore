@implementation SBSDefaultInfo

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[SBSDefaultInfo stringForUserDefault](self, "stringForUserDefault");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("stringForUserDefault"));

  -[SBSDefaultInfo userDescription](self, "userDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("userDescription"));

  -[SBSDefaultInfo defaultValue](self, "defaultValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("defaultValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SBSDefaultInfo isBool](self, "isBool"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("isBool"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SBSDefaultInfo isDouble](self, "isDouble"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("isDouble"));

  -[SBSDefaultInfo rangeMin](self, "rangeMin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("rangeMin"));

  -[SBSDefaultInfo rangeMax](self, "rangeMax");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("rangeMax"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SBSDefaultInfo requiresReinit](self, "requiresReinit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("requiresReinit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SBSDefaultInfo defaultType](self, "defaultType"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("defaultType"));

}

- (SBSDefaultInfo)initWithCoder:(id)a3
{
  id v4;
  SBSDefaultInfo *v5;
  uint64_t v6;
  NSString *stringForUserDefault;
  uint64_t v8;
  NSString *userDescription;
  void *v10;
  uint64_t v11;
  NSObject *defaultValue;
  void *v13;
  void *v14;
  uint64_t v15;
  NSNumber *rangeMin;
  uint64_t v17;
  NSNumber *rangeMax;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBSDefaultInfo;
  v5 = -[SBSDefaultInfo init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringForUserDefault"));
    v6 = objc_claimAutoreleasedReturnValue();
    stringForUserDefault = v5->_stringForUserDefault;
    v5->_stringForUserDefault = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userDescription"));
    v8 = objc_claimAutoreleasedReturnValue();
    userDescription = v5->_userDescription;
    v5->_userDescription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_defaultType = objc_msgSend(v10, "unsignedIntegerValue");

    switch(v5->_defaultType)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
      case 3uLL:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultValue"));
        v11 = objc_claimAutoreleasedReturnValue();
        defaultValue = v5->_defaultValue;
        v5->_defaultValue = v11;

        break;
      default:
        break;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isBool"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isBool = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isDouble"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isDouble = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rangeMin"));
    v15 = objc_claimAutoreleasedReturnValue();
    rangeMin = v5->_rangeMin;
    v5->_rangeMin = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rangeMax"));
    v17 = objc_claimAutoreleasedReturnValue();
    rangeMax = v5->_rangeMax;
    v5->_rangeMax = (NSNumber *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requiresReinit"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requiresReinit = objc_msgSend(v19, "BOOLValue");

  }
  return v5;
}

- (NSString)valueType
{
  unint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;

  if (-[SBSDefaultInfo isBool](self, "isBool"))
    return (NSString *)CFSTR("BOOL");
  if (-[SBSDefaultInfo isDouble](self, "isDouble"))
    return (NSString *)CFSTR("float");
  v4 = -[SBSDefaultInfo defaultType](self, "defaultType");
  if (v4 < 4)
    return &off_24EB7DB00[v4]->isa;
  -[SBSDefaultInfo defaultValue](self, "defaultValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return (NSString *)CFSTR("array");
  -[SBSDefaultInfo defaultValue](self, "defaultValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) != 0)
    return (NSString *)CFSTR("dictionary");
  else
    return (NSString *)&stru_24EB7E758;
}

- (id)getHumanReadable:(id)a3 isDefaultSet:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  char v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  int v33;
  __CFString *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  const char *v39;
  const char *v40;
  void *v41;
  void *v42;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SBSDefaultInfo stringForUserDefault](self, "stringForUserDefault");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getCString:maxLength:encoding:", v45, 128, 1);

  -[SBSDefaultInfo defaultValue](self, "defaultValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (__CFString *)v6;
    }
    else
    {
      objc_msgSend(v6, "stringValue");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  -[SBSDefaultInfo defaultValue](self, "defaultValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = objc_opt_isKindOfClass();

  if ((v13 & 1) != 0)
  {
    if (-[SBSDefaultInfo isBool](self, "isBool"))
    {
      v14 = objc_msgSend(v6, "BOOLValue");
      v15 = CFSTR("NO");
      if (v14)
        v15 = CFSTR("YES");
      v16 = v15;
      goto LABEL_17;
    }
    v17 = -[SBSDefaultInfo isDouble](self, "isDouble");
    v18 = (void *)MEMORY[0x24BDD17C8];
    if (v17)
    {
      objc_msgSend(v6, "doubleValue");
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%-4.2f"), v19);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[SBSDefaultInfo rangeMax](self, "rangeMax");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = (void *)MEMORY[0x24BDD17C8];
        -[SBSDefaultInfo rangeMin](self, "rangeMin");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString doubleValue](v11, "doubleValue");
        v24 = v23;
        -[SBSDefaultInfo rangeMax](self, "rangeMax");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ [%.2f..%.2f]"), v20, v24, v26);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_17:
        v11 = v16;
        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%-4ld"), objc_msgSend(v6, "integerValue"));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[SBSDefaultInfo rangeMax](self, "rangeMax");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = (void *)MEMORY[0x24BDD17C8];
        -[SBSDefaultInfo rangeMin](self, "rangeMin");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v29 = -[__CFString integerValue](v11, "integerValue");
        -[SBSDefaultInfo rangeMax](self, "rangeMax");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ [%ld..%ld]"), v20, v29, objc_msgSend(v30, "integerValue"));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
    }
    v11 = v20;
  }
LABEL_18:
  -[SBSDefaultInfo defaultValue](self, "defaultValue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = -[SBSDefaultInfo isBool](self, "isBool");

    if (!v32)
      goto LABEL_24;
    v33 = objc_msgSend(v6, "BOOLValue");
    v34 = CFSTR("NO");
    if (v33)
      v34 = CFSTR("YES");
    v31 = v11;
    v11 = v34;
  }

LABEL_24:
  -[__CFString getCString:maxLength:encoding:](v11, "getCString:maxLength:encoding:", v44, 128, 1);
  -[SBSDefaultInfo stringForUserDefault](self, "stringForUserDefault");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSDefaultInfo userDescription](self, "userDescription");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v35, "isEqualToString:", v36);

  v38 = (void *)MEMORY[0x24BDD17C8];
  if (v4)
    v39 = "*";
  else
    v39 = "";
  if (v4)
    v40 = "";
  else
    v40 = " ";
  if (v37)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%-40s%s : %-16s%@%@"), v39, v45, v40, v44, &stru_24EB7E758, &stru_24EB7E758);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBSDefaultInfo userDescription](self, "userDescription");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("%s%-40s%s : %-16s%@%@"), v39, v45, v40, v44, CFSTR(" : "), v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v41;
}

- (NSString)stringForUserDefault
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)userDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSObject)defaultValue
{
  return objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isBool
{
  return self->_isBool;
}

- (BOOL)isDouble
{
  return self->_isDouble;
}

- (NSNumber)rangeMin
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)rangeMax
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)requiresReinit
{
  return self->_requiresReinit;
}

- (unint64_t)defaultType
{
  return self->_defaultType;
}

- (void)setDefaultType:(unint64_t)a3
{
  self->_defaultType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeMax, 0);
  objc_storeStrong((id *)&self->_rangeMin, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_stringForUserDefault, 0);
}

+ (id)defaultsName:(id)a3 asBool:(id)a4
{
  return +[SBSDefaultInfo defaultsName:asBool:userInfo:requiresReinit:](SBSDefaultInfo, "defaultsName:asBool:userInfo:requiresReinit:", a3, a4, a3, 0);
}

+ (id)defaultsName:(id)a3 asBool:(id)a4 userInfo:(id)a5 requiresReinit:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_opt_new();
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    v14 = *(void **)(v12 + 16);
    *(_QWORD *)(v12 + 16) = v13;

    v15 = objc_msgSend(v11, "copy");
    v16 = *(void **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = v15;

    objc_storeStrong((id *)(v12 + 32), a4);
    *(_BYTE *)(v12 + 8) = 1;
    *(_BYTE *)(v12 + 10) = a6;
    *(_QWORD *)(v12 + 56) = 2;
    v17 = (id)v12;
  }

  return (id)v12;
}

+ (id)defaultsName:(id)a3 asInt:(id)a4
{
  return +[SBSDefaultInfo defaultsName:asInt:rangeMin:rangeMax:userInfo:requiresReinit:](SBSDefaultInfo, "defaultsName:asInt:rangeMin:rangeMax:userInfo:requiresReinit:", a3, a4, 0, 0, a3, 0);
}

+ (id)defaultsName:(id)a3 asInt:(id)a4 rangeMin:(id)a5 rangeMax:(id)a6
{
  return +[SBSDefaultInfo defaultsName:asInt:rangeMin:rangeMax:userInfo:requiresReinit:](SBSDefaultInfo, "defaultsName:asInt:rangeMin:rangeMax:userInfo:requiresReinit:", a3, a4, a5, a6, a3, 0);
}

+ (id)defaultsName:(id)a3 asInt:(id)a4 userInfo:(id)a5 requiresReinit:(BOOL)a6
{
  return +[SBSDefaultInfo defaultsName:asInt:rangeMin:rangeMax:userInfo:requiresReinit:](SBSDefaultInfo, "defaultsName:asInt:rangeMin:rangeMax:userInfo:requiresReinit:", a3, a4, 0, 0, a5, a6);
}

+ (id)defaultsName:(id)a3 asInt:(id)a4 rangeMin:(id)a5 rangeMax:(id)a6 userInfo:(id)a7 requiresReinit:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = objc_opt_new();
  if (v18)
  {
    v19 = objc_msgSend(v13, "copy");
    v20 = *(void **)(v18 + 16);
    *(_QWORD *)(v18 + 16) = v19;

    v21 = objc_msgSend(v17, "copy");
    v22 = *(void **)(v18 + 24);
    *(_QWORD *)(v18 + 24) = v21;

    objc_storeStrong((id *)(v18 + 32), a4);
    objc_storeStrong((id *)(v18 + 40), a5);
    objc_storeStrong((id *)(v18 + 48), a6);
    *(_BYTE *)(v18 + 10) = a8;
    *(_QWORD *)(v18 + 56) = 2;
    v23 = (id)v18;
  }

  return (id)v18;
}

+ (id)defaultsName:(id)a3 asDouble:(id)a4
{
  return +[SBSDefaultInfo defaultsName:asDouble:rangeMin:rangeMax:userInfo:requiresReinit:](SBSDefaultInfo, "defaultsName:asDouble:rangeMin:rangeMax:userInfo:requiresReinit:", a3, a4, 0, 0, a3, 0);
}

+ (id)defaultsName:(id)a3 asDouble:(id)a4 rangeMin:(id)a5 rangeMax:(id)a6
{
  return +[SBSDefaultInfo defaultsName:asDouble:rangeMin:rangeMax:userInfo:requiresReinit:](SBSDefaultInfo, "defaultsName:asDouble:rangeMin:rangeMax:userInfo:requiresReinit:", a3, a4, a5, a6, a3, 0);
}

+ (id)defaultsName:(id)a3 asDouble:(id)a4 userInfo:(id)a5 requiresReinit:(BOOL)a6
{
  return +[SBSDefaultInfo defaultsName:asDouble:rangeMin:rangeMax:userInfo:requiresReinit:](SBSDefaultInfo, "defaultsName:asDouble:rangeMin:rangeMax:userInfo:requiresReinit:", a3, a4, 0, 0, a5, a6);
}

+ (id)defaultsName:(id)a3 asDouble:(id)a4 rangeMin:(id)a5 rangeMax:(id)a6 userInfo:(id)a7 requiresReinit:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = objc_opt_new();
  if (v18)
  {
    v19 = objc_msgSend(v13, "copy");
    v20 = *(void **)(v18 + 16);
    *(_QWORD *)(v18 + 16) = v19;

    v21 = objc_msgSend(v17, "copy");
    v22 = *(void **)(v18 + 24);
    *(_QWORD *)(v18 + 24) = v21;

    objc_storeStrong((id *)(v18 + 32), a4);
    objc_storeStrong((id *)(v18 + 40), a5);
    objc_storeStrong((id *)(v18 + 48), a6);
    *(_BYTE *)(v18 + 9) = 1;
    *(_BYTE *)(v18 + 10) = a8;
    *(_QWORD *)(v18 + 56) = 2;
    v23 = (id)v18;
  }

  return (id)v18;
}

+ (id)defaultsName:(id)a3 asString:(id)a4
{
  return +[SBSDefaultInfo defaultsName:asString:userInfo:requiresReinit:](SBSDefaultInfo, "defaultsName:asString:userInfo:requiresReinit:", a3, a4, a3, 0);
}

+ (id)defaultsName:(id)a3 asString:(id)a4 userInfo:(id)a5 requiresReinit:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_opt_new();
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    v14 = *(void **)(v12 + 16);
    *(_QWORD *)(v12 + 16) = v13;

    v15 = objc_msgSend(v11, "copy");
    v16 = *(void **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = v15;

    v17 = objc_msgSend(v10, "copy");
    v18 = *(void **)(v12 + 32);
    *(_QWORD *)(v12 + 32) = v17;

    *(_BYTE *)(v12 + 8) = 0;
    *(_BYTE *)(v12 + 10) = a6;
    *(_QWORD *)(v12 + 56) = 1;
    v19 = (id)v12;
  }

  return (id)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
