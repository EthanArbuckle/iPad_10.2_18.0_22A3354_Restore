@implementation STCommunicationLimits

+ (BOOL)hasShownCompatibilityAlertForDSID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HasShownCommunicationLimitsCompatibilityAlertByDSID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

+ (void)setHasShownCompatibilityAlert:(BOOL)a3 forDSID:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF50];
  v5 = a4;
  objc_msgSend(v4, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("HasShownCommunicationLimitsCompatibilityAlertByDSID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v5);

  }
  else
  {
    v10 = v5;
    v11[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("HasShownCommunicationLimitsCompatibilityAlertByDSID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[STCommunicationLimits init](+[STCommunicationLimits allocWithZone:](STCommunicationLimits, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 2) = self->_screenTimeCommunicationLimit;
  *((_QWORD *)result + 3) = self->_downtimeCommunicationLimit;
  *((_QWORD *)result + 4) = self->_contactManagementState;
  *((_BYTE *)result + 8) = self->_contactsEditable;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  STCommunicationLimits *v4;
  STCommunicationLimits *v5;
  BOOL v6;

  v4 = (STCommunicationLimits *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = v4 != 0;
  }
  else
  {
    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() & 1) != 0
      && -[STCommunicationLimits isEqualToCommunicationLimits:](self, "isEqualToCommunicationLimits:", v5);
  }

  return v6;
}

- (BOOL)isEqualToCommunicationLimits:(id)a3
{
  STCommunicationLimits *v4;
  STCommunicationLimits *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;

  v4 = (STCommunicationLimits *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else if (v4
         && (v6 = -[STCommunicationLimits screenTimeCommunicationLimit](self, "screenTimeCommunicationLimit"),
             v6 == -[STCommunicationLimits screenTimeCommunicationLimit](v5, "screenTimeCommunicationLimit"))
         && (v7 = -[STCommunicationLimits downtimeCommunicationLimit](self, "downtimeCommunicationLimit"),
             v7 == -[STCommunicationLimits downtimeCommunicationLimit](v5, "downtimeCommunicationLimit"))
         && (v8 = -[STCommunicationLimits contactManagementState](self, "contactManagementState"),
             v8 == -[STCommunicationLimits contactManagementState](v5, "contactManagementState")))
  {
    v9 = -[STCommunicationLimits contactsEditable](self, "contactsEditable");
    v10 = v9 ^ -[STCommunicationLimits contactsEditable](v5, "contactsEditable") ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  int64_t v5;

  v3 = -[STCommunicationLimits screenTimeCommunicationLimit](self, "screenTimeCommunicationLimit");
  v4 = -[STCommunicationLimits downtimeCommunicationLimit](self, "downtimeCommunicationLimit") ^ v3;
  v5 = v4 ^ -[STCommunicationLimits contactManagementState](self, "contactManagementState");
  return v5 ^ -[STCommunicationLimits contactsEditable](self, "contactsEditable");
}

- (int64_t)screenTimeCommunicationLimit
{
  return self->_screenTimeCommunicationLimit;
}

- (void)setScreenTimeCommunicationLimit:(int64_t)a3
{
  self->_screenTimeCommunicationLimit = a3;
}

- (int64_t)downtimeCommunicationLimit
{
  return self->_downtimeCommunicationLimit;
}

- (void)setDowntimeCommunicationLimit:(int64_t)a3
{
  self->_downtimeCommunicationLimit = a3;
}

- (int64_t)contactManagementState
{
  return self->_contactManagementState;
}

- (void)setContactManagementState:(int64_t)a3
{
  self->_contactManagementState = a3;
}

- (BOOL)contactsEditable
{
  return self->_contactsEditable;
}

- (void)setContactsEditable:(BOOL)a3
{
  self->_contactsEditable = a3;
}

@end
