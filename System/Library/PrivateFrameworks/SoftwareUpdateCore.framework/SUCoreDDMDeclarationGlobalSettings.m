@implementation SUCoreDDMDeclarationGlobalSettings

- (SUCoreDDMDeclarationGlobalSettings)initWithDeclarationKeys:(id)a3
{
  id v4;
  SUCoreDDMDeclarationGlobalSettings *v5;
  uint64_t v6;
  NSNumber *enableGlobalNotifications;
  uint64_t v8;
  NSNumber *majorOSDeferralPeriod;
  uint64_t v10;
  NSNumber *minorOSDeferralPeriod;
  uint64_t v12;
  NSNumber *systemUpdatesDeferralPeriod;
  uint64_t v14;
  NSNumber *combinedUpdatesDeferralPeriod;
  uint64_t v16;
  NSNumber *recommendationCadence;
  uint64_t v18;
  NSNumber *automaticallyInstallOSUpdates;
  uint64_t v20;
  NSNumber *automaticallyInstallSystemAndSecurityUpdates;
  uint64_t v22;
  NSNumber *automaticallyCheck;
  uint64_t v24;
  NSNumber *automaticallyDownload;
  uint64_t v26;
  NSNumber *adminInstallRequired;
  uint64_t v28;
  NSNumber *enableRapidSecurityResponse;
  uint64_t v30;
  NSNumber *enableRapidSecurityResponseRollback;
  uint64_t v32;
  NSArray *serializedKeys;
  uint64_t v34;
  NSNumber *programEnrollment;
  uint64_t v36;
  NSArray *offerPrograms;
  uint64_t v38;
  NSDictionary *requireProgram;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SUCoreDDMDeclarationGlobalSettings;
  v5 = -[SUCoreDDMDeclarationGlobalSettings init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enableGlobalNotifications"));
    v6 = objc_claimAutoreleasedReturnValue();
    enableGlobalNotifications = v5->_enableGlobalNotifications;
    v5->_enableGlobalNotifications = (NSNumber *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("majorOSDeferralPeriod"));
    v8 = objc_claimAutoreleasedReturnValue();
    majorOSDeferralPeriod = v5->_majorOSDeferralPeriod;
    v5->_majorOSDeferralPeriod = (NSNumber *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minorOSDeferralPeriod"));
    v10 = objc_claimAutoreleasedReturnValue();
    minorOSDeferralPeriod = v5->_minorOSDeferralPeriod;
    v5->_minorOSDeferralPeriod = (NSNumber *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemUpdatesDeferralPeriod"));
    v12 = objc_claimAutoreleasedReturnValue();
    systemUpdatesDeferralPeriod = v5->_systemUpdatesDeferralPeriod;
    v5->_systemUpdatesDeferralPeriod = (NSNumber *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("combinedUpdatesDeferralPeriod"));
    v14 = objc_claimAutoreleasedReturnValue();
    combinedUpdatesDeferralPeriod = v5->_combinedUpdatesDeferralPeriod;
    v5->_combinedUpdatesDeferralPeriod = (NSNumber *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recommendationCadence"));
    v16 = objc_claimAutoreleasedReturnValue();
    recommendationCadence = v5->_recommendationCadence;
    v5->_recommendationCadence = (NSNumber *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("automaticallyInstallOSUpdates"));
    v18 = objc_claimAutoreleasedReturnValue();
    automaticallyInstallOSUpdates = v5->_automaticallyInstallOSUpdates;
    v5->_automaticallyInstallOSUpdates = (NSNumber *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("automaticallyInstallSystemAndSecurityUpdates"));
    v20 = objc_claimAutoreleasedReturnValue();
    automaticallyInstallSystemAndSecurityUpdates = v5->_automaticallyInstallSystemAndSecurityUpdates;
    v5->_automaticallyInstallSystemAndSecurityUpdates = (NSNumber *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("automaticallyCheck"));
    v22 = objc_claimAutoreleasedReturnValue();
    automaticallyCheck = v5->_automaticallyCheck;
    v5->_automaticallyCheck = (NSNumber *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("automaticallyDownload"));
    v24 = objc_claimAutoreleasedReturnValue();
    automaticallyDownload = v5->_automaticallyDownload;
    v5->_automaticallyDownload = (NSNumber *)v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adminInstallRequired"));
    v26 = objc_claimAutoreleasedReturnValue();
    adminInstallRequired = v5->_adminInstallRequired;
    v5->_adminInstallRequired = (NSNumber *)v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enableRapidSecurityResponse"));
    v28 = objc_claimAutoreleasedReturnValue();
    enableRapidSecurityResponse = v5->_enableRapidSecurityResponse;
    v5->_enableRapidSecurityResponse = (NSNumber *)v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enableRapidSecurityResponseRollback"));
    v30 = objc_claimAutoreleasedReturnValue();
    enableRapidSecurityResponseRollback = v5->_enableRapidSecurityResponseRollback;
    v5->_enableRapidSecurityResponseRollback = (NSNumber *)v30;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serializedKeys"));
    v32 = objc_claimAutoreleasedReturnValue();
    serializedKeys = v5->_serializedKeys;
    v5->_serializedKeys = (NSArray *)v32;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("programEnrollment"));
    v34 = objc_claimAutoreleasedReturnValue();
    programEnrollment = v5->_programEnrollment;
    v5->_programEnrollment = (NSNumber *)v34;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offerPrograms"));
    v36 = objc_claimAutoreleasedReturnValue();
    offerPrograms = v5->_offerPrograms;
    v5->_offerPrograms = (NSArray *)v36;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requireProgram"));
    v38 = objc_claimAutoreleasedReturnValue();
    requireProgram = v5->_requireProgram;
    v5->_requireProgram = (NSDictionary *)v38;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUCoreDDMDeclarationGlobalSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SUCoreDDMDeclarationGlobalSettings"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreDDMDeclarationGlobalSettings)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SUCoreDDMDeclarationGlobalSettings *v9;
  _QWORD v11[15];

  v11[14] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  v11[8] = objc_opt_class();
  v11[9] = objc_opt_class();
  v11[10] = objc_opt_class();
  v11[11] = objc_opt_class();
  v11[12] = objc_opt_class();
  v11[13] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("SUCoreDDMDeclarationGlobalSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SUCoreDDMDeclarationGlobalSettings initWithDeclarationKeys:](self, "initWithDeclarationKeys:", v8);
  return v9;
}

- (id)dictionaryRepresentation
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclarationGlobalSettings enableGlobalNotifications](self, "enableGlobalNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v4, CFSTR("enableGlobalNotifications"));

  -[SUCoreDDMDeclarationGlobalSettings majorOSDeferralPeriod](self, "majorOSDeferralPeriod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v5, CFSTR("majorOSDeferralPeriod"));

  -[SUCoreDDMDeclarationGlobalSettings minorOSDeferralPeriod](self, "minorOSDeferralPeriod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v6, CFSTR("minorOSDeferralPeriod"));

  -[SUCoreDDMDeclarationGlobalSettings systemUpdatesDeferralPeriod](self, "systemUpdatesDeferralPeriod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v7, CFSTR("systemUpdatesDeferralPeriod"));

  -[SUCoreDDMDeclarationGlobalSettings combinedUpdatesDeferralPeriod](self, "combinedUpdatesDeferralPeriod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v8, CFSTR("combinedUpdatesDeferralPeriod"));

  -[SUCoreDDMDeclarationGlobalSettings recommendationCadence](self, "recommendationCadence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v9, CFSTR("recommendationCadence"));

  -[SUCoreDDMDeclarationGlobalSettings automaticallyInstallOSUpdates](self, "automaticallyInstallOSUpdates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v10, CFSTR("automaticallyInstallOSUpdates"));

  -[SUCoreDDMDeclarationGlobalSettings automaticallyInstallSystemAndSecurityUpdates](self, "automaticallyInstallSystemAndSecurityUpdates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v11, CFSTR("automaticallyInstallSystemAndSecurityUpdates"));

  -[SUCoreDDMDeclarationGlobalSettings automaticallyCheck](self, "automaticallyCheck");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v12, CFSTR("automaticallyCheck"));

  -[SUCoreDDMDeclarationGlobalSettings automaticallyDownload](self, "automaticallyDownload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v13, CFSTR("automaticallyDownload"));

  -[SUCoreDDMDeclarationGlobalSettings adminInstallRequired](self, "adminInstallRequired");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v14, CFSTR("adminInstallRequired"));

  -[SUCoreDDMDeclarationGlobalSettings enableRapidSecurityResponse](self, "enableRapidSecurityResponse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v15, CFSTR("enableRapidSecurityResponse"));

  -[SUCoreDDMDeclarationGlobalSettings enableRapidSecurityResponseRollback](self, "enableRapidSecurityResponseRollback");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v16, CFSTR("enableRapidSecurityResponseRollback"));

  -[SUCoreDDMDeclarationGlobalSettings serializedKeys](self, "serializedKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v17, CFSTR("serializedKeys"));

  -[SUCoreDDMDeclarationGlobalSettings programEnrollment](self, "programEnrollment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v18, CFSTR("programEnrollment"));

  -[SUCoreDDMDeclarationGlobalSettings offerPrograms](self, "offerPrograms");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v19, CFSTR("offerPrograms"));

  -[SUCoreDDMDeclarationGlobalSettings requireProgram](self, "requireProgram");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v20, CFSTR("requireProgram"));

  v21 = (void *)objc_msgSend(v3, "copy");
  return v21;
}

- (BOOL)isValidDeclarationWithReason:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  BOOL result;
  __CFString *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;

  -[SUCoreDDMDeclarationGlobalSettings automaticallyInstallOSUpdates](self, "automaticallyInstallOSUpdates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SUCoreDDMDeclarationGlobalSettings automaticallyInstallOSUpdates](self, "automaticallyInstallOSUpdates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
    {
      -[SUCoreDDMDeclarationGlobalSettings automaticallyDownload](self, "automaticallyDownload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[SUCoreDDMDeclarationGlobalSettings automaticallyDownload](self, "automaticallyDownload");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        if (a3)
        {
          if ((v10 & 1) == 0)
          {
            result = 0;
            v12 = CFSTR("Invalid global settings declaration: attempt to set automatically install OS updates to true while automatically download is false");
LABEL_17:
            *a3 = v12;
            return result;
          }
        }
      }
      -[SUCoreDDMDeclarationGlobalSettings automaticallyCheck](self, "automaticallyCheck");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[SUCoreDDMDeclarationGlobalSettings automaticallyCheck](self, "automaticallyCheck");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        if (a3)
        {
          if ((v15 & 1) == 0)
          {
            result = 0;
            v12 = CFSTR("Invalid global settings declaration: attempt to set automatically install OS updates to true while automatically check is false");
            goto LABEL_17;
          }
        }
      }
    }
  }
  -[SUCoreDDMDeclarationGlobalSettings automaticallyDownload](self, "automaticallyDownload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SUCoreDDMDeclarationGlobalSettings automaticallyDownload](self, "automaticallyDownload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
    {
      -[SUCoreDDMDeclarationGlobalSettings automaticallyCheck](self, "automaticallyCheck");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[SUCoreDDMDeclarationGlobalSettings automaticallyCheck](self, "automaticallyCheck");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "BOOLValue");

        if (a3)
        {
          if ((v21 & 1) == 0)
          {
            result = 0;
            v12 = CFSTR("Invalid global settings declaration: attempt to set automatically download OS updates to true while automatically check is false");
            goto LABEL_17;
          }
        }
      }
    }
  }
  if (a3)
  {
    -[SUCoreDDMDeclarationGlobalSettings description](self, "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1EA87A8E8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return 1;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreDDMDeclarationGlobalSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SUCoreDDMDeclarationGlobalSettings: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSNumber)enableGlobalNotifications
{
  return self->_enableGlobalNotifications;
}

- (void)setEnableGlobalNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_enableGlobalNotifications, a3);
}

- (NSNumber)majorOSDeferralPeriod
{
  return self->_majorOSDeferralPeriod;
}

- (void)setMajorOSDeferralPeriod:(id)a3
{
  objc_storeStrong((id *)&self->_majorOSDeferralPeriod, a3);
}

- (NSNumber)minorOSDeferralPeriod
{
  return self->_minorOSDeferralPeriod;
}

- (void)setMinorOSDeferralPeriod:(id)a3
{
  objc_storeStrong((id *)&self->_minorOSDeferralPeriod, a3);
}

- (NSNumber)systemUpdatesDeferralPeriod
{
  return self->_systemUpdatesDeferralPeriod;
}

- (void)setSystemUpdatesDeferralPeriod:(id)a3
{
  objc_storeStrong((id *)&self->_systemUpdatesDeferralPeriod, a3);
}

- (NSNumber)combinedUpdatesDeferralPeriod
{
  return self->_combinedUpdatesDeferralPeriod;
}

- (void)setCombinedUpdatesDeferralPeriod:(id)a3
{
  objc_storeStrong((id *)&self->_combinedUpdatesDeferralPeriod, a3);
}

- (NSNumber)recommendationCadence
{
  return self->_recommendationCadence;
}

- (void)setRecommendationCadence:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationCadence, a3);
}

- (NSNumber)automaticallyInstallOSUpdates
{
  return self->_automaticallyInstallOSUpdates;
}

- (void)setAutomaticallyInstallOSUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_automaticallyInstallOSUpdates, a3);
}

- (NSNumber)automaticallyInstallSystemAndSecurityUpdates
{
  return self->_automaticallyInstallSystemAndSecurityUpdates;
}

- (void)setAutomaticallyInstallSystemAndSecurityUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_automaticallyInstallSystemAndSecurityUpdates, a3);
}

- (NSNumber)automaticallyCheck
{
  return self->_automaticallyCheck;
}

- (void)setAutomaticallyCheck:(id)a3
{
  objc_storeStrong((id *)&self->_automaticallyCheck, a3);
}

- (NSNumber)automaticallyDownload
{
  return self->_automaticallyDownload;
}

- (void)setAutomaticallyDownload:(id)a3
{
  objc_storeStrong((id *)&self->_automaticallyDownload, a3);
}

- (NSNumber)adminInstallRequired
{
  return self->_adminInstallRequired;
}

- (void)setAdminInstallRequired:(id)a3
{
  objc_storeStrong((id *)&self->_adminInstallRequired, a3);
}

- (NSNumber)enableRapidSecurityResponse
{
  return self->_enableRapidSecurityResponse;
}

- (void)setEnableRapidSecurityResponse:(id)a3
{
  objc_storeStrong((id *)&self->_enableRapidSecurityResponse, a3);
}

- (NSNumber)enableRapidSecurityResponseRollback
{
  return self->_enableRapidSecurityResponseRollback;
}

- (void)setEnableRapidSecurityResponseRollback:(id)a3
{
  objc_storeStrong((id *)&self->_enableRapidSecurityResponseRollback, a3);
}

- (NSArray)serializedKeys
{
  return self->_serializedKeys;
}

- (void)setSerializedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_serializedKeys, a3);
}

- (NSNumber)programEnrollment
{
  return self->_programEnrollment;
}

- (void)setProgramEnrollment:(id)a3
{
  objc_storeStrong((id *)&self->_programEnrollment, a3);
}

- (NSArray)offerPrograms
{
  return self->_offerPrograms;
}

- (void)setOfferPrograms:(id)a3
{
  objc_storeStrong((id *)&self->_offerPrograms, a3);
}

- (NSDictionary)requireProgram
{
  return self->_requireProgram;
}

- (void)setRequireProgram:(id)a3
{
  objc_storeStrong((id *)&self->_requireProgram, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requireProgram, 0);
  objc_storeStrong((id *)&self->_offerPrograms, 0);
  objc_storeStrong((id *)&self->_programEnrollment, 0);
  objc_storeStrong((id *)&self->_serializedKeys, 0);
  objc_storeStrong((id *)&self->_enableRapidSecurityResponseRollback, 0);
  objc_storeStrong((id *)&self->_enableRapidSecurityResponse, 0);
  objc_storeStrong((id *)&self->_adminInstallRequired, 0);
  objc_storeStrong((id *)&self->_automaticallyDownload, 0);
  objc_storeStrong((id *)&self->_automaticallyCheck, 0);
  objc_storeStrong((id *)&self->_automaticallyInstallSystemAndSecurityUpdates, 0);
  objc_storeStrong((id *)&self->_automaticallyInstallOSUpdates, 0);
  objc_storeStrong((id *)&self->_recommendationCadence, 0);
  objc_storeStrong((id *)&self->_combinedUpdatesDeferralPeriod, 0);
  objc_storeStrong((id *)&self->_systemUpdatesDeferralPeriod, 0);
  objc_storeStrong((id *)&self->_minorOSDeferralPeriod, 0);
  objc_storeStrong((id *)&self->_majorOSDeferralPeriod, 0);
  objc_storeStrong((id *)&self->_enableGlobalNotifications, 0);
}

@end
