@implementation ATCRTAPHardwareID

+ (id)query
{
  ATCRTAPHardwareID *v2;
  ATCRTAPHardwareID *v3;

  v2 = objc_alloc_init(ATCRTAPHardwareID);
  if (-[ATCRTAPHardwareID queryHardwareParameters](v2, "queryHardwareParameters"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (NSDictionary)personalizationParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("ApBoardID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_boardID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("ApChipID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_chipID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("ApProductionMode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_productionStatus);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("ApSecurityMode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_securityMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (BOOL)queryHardwareParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v3 = (void *)MGCopyAnswer();
  v4 = v3;
  if (v3)
  {
    self->_boardID = objc_msgSend(v3, "unsignedIntValue");
    v5 = (void *)MGCopyAnswer();
    v6 = v5;
    if (v5)
    {
      self->_chipID = objc_msgSend(v5, "unsignedIntValue");
      v7 = (void *)MGCopyAnswer();
      v8 = v7;
      if (v7)
      {
        self->_productionStatus = objc_msgSend(v7, "BOOLValue");
        v9 = (void *)MGCopyAnswer();
        v10 = v9;
        if (v9)
        {
          self->_securityMode = objc_msgSend(v9, "BOOLValue");
          v11 = (void *)MGCopyAnswer();
          v12 = v11;
          v13 = v11 != 0;
          if (v11)
            self->_securityDomain = objc_msgSend(v11, "unsignedIntValue");

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("\tBoard ID: 0x%08x\n"), self->_boardID);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tChip ID: 0x%08x\n"), self->_chipID);
  if (self->_productionStatus)
    v7 = "True";
  else
    v7 = "False";
  objc_msgSend(v6, "appendFormat:", CFSTR("\tProduction Status: %s\n"), v7);
  if (self->_securityMode)
    v8 = "True";
  else
    v8 = "False";
  objc_msgSend(v6, "appendFormat:", CFSTR("\tSecurity Mode: %s\n"), v8);
  objc_msgSend(v6, "appendFormat:", CFSTR("\tSecurity Domain: %u"), self->_securityDomain);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (BOOL)productionStatus
{
  return self->_productionStatus;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

@end
