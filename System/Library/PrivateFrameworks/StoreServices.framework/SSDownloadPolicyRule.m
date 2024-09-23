@implementation SSDownloadPolicyRule

- (SSDownloadPolicyRule)init
{
  SSDownloadPolicyRule *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadPolicyRule;
  result = -[SSDownloadPolicyRule init](&v3, sel_init);
  if (result)
  {
    result->_cellularDataStates = 3;
    *(int64x2_t *)&result->_powerStates = vdupq_n_s64(3uLL);
    result->_timeLimitStates = 3;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadPolicyRule;
  -[SSDownloadPolicyRule dealloc](&v3, sel_dealloc);
}

- (void)addApplicationState:(id)a3
{
  NSSet *applicationStates;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  applicationStates = self->_applicationStates;
  if (applicationStates)
  {
    v5 = (void *)-[NSSet mutableCopy](applicationStates, "mutableCopy");
    objc_msgSend(v5, "addObject:", v6);

    self->_applicationStates = (NSSet *)objc_msgSend(v5, "copy");
  }
  else
  {
    self->_applicationStates = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, 0);
  }

}

- (void)addNetworkType:(int64_t)a3
{
  NSSet *networkTypes;
  id v6;
  id v7;

  networkTypes = self->_networkTypes;
  if (networkTypes)
  {
    v7 = (id)-[NSSet mutableCopy](networkTypes, "mutableCopy");
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));

    self->_networkTypes = (NSSet *)objc_msgSend(v7, "copy");
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    self->_networkTypes = (NSSet *)objc_msgSend(v6, "initWithObjects:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), 0);
  }
}

- (void)addUserDefaultState:(id)a3
{
  NSSet *userDefaultStates;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  userDefaultStates = self->_userDefaultStates;
  if (userDefaultStates)
  {
    v5 = (void *)-[NSSet mutableCopy](userDefaultStates, "mutableCopy");
    objc_msgSend(v5, "addObject:", v6);

    self->_userDefaultStates = (NSSet *)objc_msgSend(v5, "copy");
  }
  else
  {
    self->_userDefaultStates = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, 0);
  }

}

- (BOOL)isCellularAllowed
{
  NSSet *networkTypes;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  networkTypes = self->_networkTypes;
  if (!networkTypes)
  {
LABEL_11:
    LOBYTE(v3) = 1;
    return v3;
  }
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](networkTypes, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
LABEL_4:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(networkTypes);
      if ((SSNetworkTypeIsCellularType(objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "integerValue")) & 1) != 0)
        goto LABEL_11;
      if (v4 == ++v6)
      {
        v4 = -[NSSet countByEnumeratingWithState:objects:count:](networkTypes, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        LOBYTE(v3) = 0;
        if (v4)
          goto LABEL_4;
        return v3;
      }
    }
  }
  return v3;
}

- (BOOL)isWiFiAllowed
{
  SSDownloadPolicyRule *v2;
  void *v3;

  if (!self->_networkTypes)
    return 1;
  v2 = self;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 1000);
  LOBYTE(v2) = -[NSSet containsObject:](v2->_networkTypes, "containsObject:", v3);

  return (char)v2;
}

- (void)unionPolicyRule:(id)a3
{
  int64_t cellularDataStates;
  int64_t powerStates;
  int64_t registrationStates;
  float batteryLevel;
  float v9;
  float v10;
  int64_t timeLimitStates;
  void *v12;
  NSSet *applicationStates;
  void *v14;
  void *v15;
  NSSet *networkTypes;
  void *v17;
  void *v18;
  NSSet *userDefaultStates;
  id v20;

  cellularDataStates = self->_cellularDataStates;
  self->_cellularDataStates = objc_msgSend(a3, "cellularDataStates") | cellularDataStates;
  powerStates = self->_powerStates;
  self->_powerStates = objc_msgSend(a3, "powerStates") | powerStates;
  registrationStates = self->_registrationStates;
  self->_registrationStates = objc_msgSend(a3, "registrationStates") | registrationStates;
  batteryLevel = self->_batteryLevel;
  objc_msgSend(a3, "batteryLevel");
  if (batteryLevel <= v9)
    objc_msgSend(a3, "batteryLevel");
  else
    v10 = self->_batteryLevel;
  self->_batteryLevel = v10;
  timeLimitStates = self->_timeLimitStates;
  self->_timeLimitStates = objc_msgSend(a3, "timeLimitStates") | timeLimitStates;
  v12 = (void *)objc_msgSend(a3, "applicationStates");
  if (objc_msgSend(v12, "count"))
  {
    applicationStates = self->_applicationStates;
    if (applicationStates)
    {
      v14 = (void *)-[NSSet mutableCopy](applicationStates, "mutableCopy");
      objc_msgSend(v14, "unionSet:", v12);

      self->_applicationStates = (NSSet *)objc_msgSend(v14, "copy");
    }
    else
    {
      self->_applicationStates = (NSSet *)v12;
    }
  }
  v15 = (void *)objc_msgSend(a3, "networkTypes");
  if (objc_msgSend(v15, "count"))
  {
    networkTypes = self->_networkTypes;
    if (networkTypes)
    {
      v17 = (void *)-[NSSet mutableCopy](networkTypes, "mutableCopy");
      objc_msgSend(v17, "unionSet:", v15);

      self->_networkTypes = (NSSet *)objc_msgSend(v17, "copy");
    }
    else
    {
      self->_networkTypes = (NSSet *)v15;
    }
  }
  v18 = (void *)objc_msgSend(a3, "userDefaultStates");
  if (objc_msgSend(v18, "count"))
  {
    userDefaultStates = self->_userDefaultStates;
    if (userDefaultStates)
    {
      v20 = (id)-[NSSet mutableCopy](userDefaultStates, "mutableCopy");
      objc_msgSend(v20, "unionSet:", v18);

      self->_userDefaultStates = (NSSet *)objc_msgSend(v20, "copy");
    }
    else
    {
      self->_userDefaultStates = (NSSet *)v18;
    }
  }
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSSet hash](self->_networkTypes, "hash");
  return -[NSSet hash](self->_userDefaultStates, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  int64_t v6;
  NSSet *v7;
  _BOOL4 v8;
  float v9;
  float v10;
  float v11;
  NSSet *v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  NSSet *v17;

  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_14;
  v6 = -[SSDownloadPolicyRule downloadSizeLimit](self, "downloadSizeLimit");
  if (v6 != objc_msgSend(a3, "downloadSizeLimit"))
    goto LABEL_14;
  v7 = -[SSDownloadPolicyRule applicationStates](self, "applicationStates");
  if (v7 == (NSSet *)objc_msgSend(a3, "applicationStates")
    || (v8 = -[NSSet isEqualToSet:](-[SSDownloadPolicyRule applicationStates](self, "applicationStates"), "isEqualToSet:", objc_msgSend(a3, "applicationStates"))))
  {
    -[SSDownloadPolicyRule batteryLevel](self, "batteryLevel");
    v10 = v9;
    objc_msgSend(a3, "batteryLevel");
    if (v10 != v11)
      goto LABEL_14;
    v12 = -[SSDownloadPolicyRule networkTypes](self, "networkTypes");
    if (v12 == (NSSet *)objc_msgSend(a3, "networkTypes")
      || (v8 = -[NSSet isEqualToSet:](-[SSDownloadPolicyRule networkTypes](self, "networkTypes"), "isEqualToSet:", objc_msgSend(a3, "networkTypes"))))
    {
      v13 = -[SSDownloadPolicyRule cellularDataStates](self, "cellularDataStates");
      if (v13 == objc_msgSend(a3, "cellularDataStates"))
      {
        v14 = -[SSDownloadPolicyRule powerStates](self, "powerStates");
        if (v14 == objc_msgSend(a3, "powerStates"))
        {
          v15 = -[SSDownloadPolicyRule registrationStates](self, "registrationStates");
          if (v15 == objc_msgSend(a3, "registrationStates"))
          {
            v16 = -[SSDownloadPolicyRule timeLimitStates](self, "timeLimitStates");
            if (v16 == objc_msgSend(a3, "timeLimitStates"))
            {
              v17 = -[SSDownloadPolicyRule userDefaultStates](self, "userDefaultStates");
              LOBYTE(v8) = v17 == (NSSet *)objc_msgSend(a3, "userDefaultStates")
                        || -[NSSet isEqualToSet:](-[SSDownloadPolicyRule userDefaultStates](self, "userDefaultStates"), "isEqualToSet:", objc_msgSend(a3, "userDefaultStates"));
              return v8;
            }
          }
        }
      }
LABEL_14:
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;

  objc_msgSend(a3, "encodeObject:forKey:", -[NSSet allObjects](self->_applicationStates, "allObjects"), CFSTR("appsts"));
  *(float *)&v5 = self->_batteryLevel;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("bttlvl"), v5);
  objc_msgSend(a3, "encodeInt64:forKey:", self->_cellularDataStates, CFSTR("cellds"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_downloadSizeLimit, CFSTR("szlmt"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSet allObjects](self->_networkTypes, "allObjects"), CFSTR("nwktps"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_powerStates, CFSTR("powsts"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_registrationStates, CFSTR("regsts"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_timeLimitStates, CFSTR("tmlsts"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSet allObjects](self->_userDefaultStates, "allObjects"), CFSTR("usdfts"));
}

- (SSDownloadPolicyRule)initWithCoder:(id)a3
{
  SSDownloadPolicyRule *v4;
  float v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SSDownloadPolicyRule;
  v4 = -[SSDownloadPolicyRule init](&v18, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("bttlvl"));
    v4->_batteryLevel = v5;
    v4->_downloadSizeLimit = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("szlmt"));
    v4->_powerStates = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("powsts"));
    v4->_registrationStates = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("regsts"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("cellds")))
      v6 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("cellds"));
    else
      v6 = 3;
    v4->_cellularDataStates = v6;
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("tmlsts")))
      v7 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("tmlsts"));
    else
      v7 = 3;
    v4->_timeLimitStates = v7;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0), CFSTR("appsts"));
    if (v10)
      v4->_applicationStates = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v10);
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0), CFSTR("nwktps"));
    if (v13)
      v4->_networkTypes = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v13);
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0), CFSTR("usdfts"));
    if (v16)
      v4->_userDefaultStates = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v16);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = -[NSSet copyWithZone:](self->_applicationStates, "copyWithZone:", a3);
  *(float *)(v5 + 16) = self->_batteryLevel;
  *(_OWORD *)(v5 + 24) = *(_OWORD *)&self->_cellularDataStates;
  *(_QWORD *)(v5 + 40) = -[NSSet copyWithZone:](self->_networkTypes, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 48) = self->_powerStates;
  *(_QWORD *)(v5 + 56) = self->_registrationStates;
  *(_QWORD *)(v5 + 64) = self->_timeLimitStates;
  *(_QWORD *)(v5 + 72) = self->_userDefaultStates;
  return (id)v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)-[NSSet allObjects](self->_applicationStates, "allObjects"));
  xpc_dictionary_set_double(v3, "1", self->_batteryLevel);
  xpc_dictionary_set_int64(v3, "2", self->_cellularDataStates);
  xpc_dictionary_set_int64(v3, "3", self->_downloadSizeLimit);
  SSXPCDictionarySetCFObject(v3, "4", (__CFString *)-[NSSet allObjects](self->_networkTypes, "allObjects"));
  xpc_dictionary_set_int64(v3, "5", self->_powerStates);
  xpc_dictionary_set_int64(v3, "6", self->_registrationStates);
  xpc_dictionary_set_int64(v3, "7", self->_timeLimitStates);
  SSXPCDictionarySetCFObject(v3, "8", (__CFString *)-[NSSet allObjects](self->_userDefaultStates, "allObjects"));
  return v3;
}

- (SSDownloadPolicyRule)initWithXPCEncoding:(id)a3
{
  SSDownloadPolicyRule *v5;
  xpc_object_t value;
  uint64_t v8;
  id v9;
  void *v10;
  float v11;
  CFArrayRef v12;
  CFArrayRef v13;
  xpc_object_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  objc_super v18;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v18.receiver = self;
    v18.super_class = (Class)SSDownloadPolicyRule;
    v5 = -[SSDownloadPolicyRule init](&v18, sel_init);
    if (v5)
    {
      value = xpc_dictionary_get_value(a3, "0");
      v8 = objc_opt_class();
      v9 = SSXPCCreateNSArrayFromXPCEncodedArray(value, v8);
      if (v9)
      {
        v10 = v9;
        v5->_applicationStates = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v9);

      }
      v11 = xpc_dictionary_get_double(a3, "1");
      v5->_batteryLevel = v11;
      v5->_cellularDataStates = xpc_dictionary_get_int64(a3, "2");
      v5->_downloadSizeLimit = xpc_dictionary_get_int64(a3, "3");
      objc_opt_class();
      v12 = SSXPCDictionaryCopyCFObjectWithClass(a3, "4");
      if (v12)
      {
        v13 = v12;
        v5->_networkTypes = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v12);

      }
      v5->_powerStates = xpc_dictionary_get_int64(a3, "5");
      v5->_registrationStates = xpc_dictionary_get_int64(a3, "6");
      v5->_timeLimitStates = xpc_dictionary_get_int64(a3, "7");
      v14 = xpc_dictionary_get_value(a3, "8");
      v15 = objc_opt_class();
      v16 = SSXPCCreateNSArrayFromXPCEncodedArray(v14, v15);
      if (v16)
      {
        v17 = v16;
        v5->_userDefaultStates = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v16);

      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSSet)applicationStates
{
  return self->_applicationStates;
}

- (void)setApplicationStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(float)a3
{
  self->_batteryLevel = a3;
}

- (int64_t)cellularDataStates
{
  return self->_cellularDataStates;
}

- (void)setCellularDataStates:(int64_t)a3
{
  self->_cellularDataStates = a3;
}

- (int64_t)downloadSizeLimit
{
  return self->_downloadSizeLimit;
}

- (void)setDownloadSizeLimit:(int64_t)a3
{
  self->_downloadSizeLimit = a3;
}

- (NSSet)networkTypes
{
  return self->_networkTypes;
}

- (void)setNetworkTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)powerStates
{
  return self->_powerStates;
}

- (void)setPowerStates:(int64_t)a3
{
  self->_powerStates = a3;
}

- (int64_t)registrationStates
{
  return self->_registrationStates;
}

- (void)setRegistrationStates:(int64_t)a3
{
  self->_registrationStates = a3;
}

- (int64_t)timeLimitStates
{
  return self->_timeLimitStates;
}

- (void)setTimeLimitStates:(int64_t)a3
{
  self->_timeLimitStates = a3;
}

- (NSSet)userDefaultStates
{
  return self->_userDefaultStates;
}

- (void)setUserDefaultStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
