@implementation SUScanOptions

- (BOOL)_identifierIsAllowedToSetManagedScanOptions
{
  if ((objc_msgSend(CFSTR("com.apple.mdm"), "isEqualToString:", self->_identifier) & 1) != 0
    || (objc_msgSend(CFSTR("com.apple.SoftwareUpdateServices.DDM"), "isEqualToString:", self->_identifier) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(CFSTR("com.apple.sus_tool"), "isEqualToString:", self->_identifier);
  }
}

- (NSString)requestedPMV
{
  return -[SUMDMScanOptions requestedProductMarketingVersion](self->_managedScanOptions, "requestedProductMarketingVersion");
}

- (void)setRequestedPMV:(id)a3
{
  -[SUMDMScanOptions setRequestedProductMarketingVersion:](self->_managedScanOptions, "setRequestedProductMarketingVersion:", a3);
}

- (NSString)requestedBuild
{
  return -[SUMDMScanOptions requestedBuildVersion](self->_managedScanOptions, "requestedBuildVersion");
}

- (void)setRequestedBuild:(id)a3
{
  -[SUMDMScanOptions setRequestedBuildVersion:](self->_managedScanOptions, "setRequestedBuildVersion:", a3);
}

- (BOOL)MDMUseDelayPeriod
{
  SUMDMScanOptions *managedScanOptions;

  managedScanOptions = self->_managedScanOptions;
  if (managedScanOptions)
    LOBYTE(managedScanOptions) = -[SUMDMScanOptions useDelayPeriod](managedScanOptions, "useDelayPeriod") == 1;
  return (char)managedScanOptions;
}

- (void)setMDMUseDelayPeriod:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[SUScanOptions _identifierIsAllowedToSetManagedScanOptions](self, "_identifierIsAllowedToSetManagedScanOptions"))
    -[SUMDMScanOptions setUseDelayPeriod:](self->_managedScanOptions, "setUseDelayPeriod:", v3);
}

- (BOOL)MDMShowRapidSecurityResponse
{
  SUMDMScanOptions *managedScanOptions;

  managedScanOptions = self->_managedScanOptions;
  return !managedScanOptions || -[SUMDMScanOptions allowSplat](managedScanOptions, "allowSplat") != 0;
}

- (void)setMDMShowRapidSecurityResponse:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[SUScanOptions _identifierIsAllowedToSetManagedScanOptions](self, "_identifierIsAllowedToSetManagedScanOptions"))
    -[SUMDMScanOptions setAllowSplat:](self->_managedScanOptions, "setAllowSplat:", v3);
}

- (unint64_t)MDMSoftwareUpdatePath
{
  unint64_t result;

  result = -[SUMDMScanOptions MDMSoftwareUpdatePath](self->_managedScanOptions, "MDMSoftwareUpdatePath");
  if (result == 3)
    return 0;
  return result;
}

- (void)setMDMSoftwareUpdatePath:(unint64_t)a3
{
  if (-[SUScanOptions _identifierIsAllowedToSetManagedScanOptions](self, "_identifierIsAllowedToSetManagedScanOptions"))
    -[SUMDMScanOptions setMDMSoftwareUpdatePath:](self->_managedScanOptions, "setMDMSoftwareUpdatePath:", a3);
}

- (id)managedScanOptions
{
  return self->_managedScanOptions;
}

- (void)setManagedScanOptions:(id)a3
{
  objc_storeStrong((id *)&self->_managedScanOptions, a3);
}

- (SUScanOptions)init
{
  SUScanOptions *v2;
  NSMutableSet *v3;
  NSMutableSet *types;
  NSString *sessionID;
  NSString *clientName;
  uint64_t v7;
  SUMDMScanOptions *managedScanOptions;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUScanOptions;
  v2 = -[SUOptionsBase init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    types = v2->_types;
    v2->_types = v3;

    sessionID = v2->_sessionID;
    v2->_sessionID = 0;

    v2->_ignoreNoUpdateFoundResult = 0;
    clientName = v2->_clientName;
    v2->_clientName = (NSString *)CFSTR("com.apple.softwareupdateservicesd");

    v2->_scanType = 0;
    v7 = objc_opt_new();
    managedScanOptions = v2->_managedScanOptions;
    v2->_managedScanOptions = (SUMDMScanOptions *)v7;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUScanOptions)initWithCoder:(id)a3
{
  id v4;
  SUScanOptions *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUScanOptions;
  v5 = -[SUOptionsBase init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScanOptions setIdentifier:](v5, "setIdentifier:", v6);

    -[SUScanOptions setForced:](v5, "setForced:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forced")));
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("types"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScanOptions setTypes:](v5, "setTypes:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScanOptions setSessionID:](v5, "setSessionID:", v11);

    -[SUScanOptions setIgnoreNoUpdateFoundResult:](v5, "setIgnoreNoUpdateFoundResult:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreNoUpdateFoundResult")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUScanClientNameKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScanOptions setClientName:](v5, "setClientName:", v12);

    -[SUScanOptions setScanType:](v5, "setScanType:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("SUScanTaskTypeKey")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managedScanOptions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScanOptions setManagedScanOptions:](v5, "setManagedScanOptions:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forced, CFSTR("forced"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_types, CFSTR("types"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionID, CFSTR("sessionID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ignoreNoUpdateFoundResult, CFSTR("ignoreNoUpdateFoundResult"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientName, CFSTR("SUScanClientNameKey"));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_scanType), CFSTR("SUScanTaskTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_managedScanOptions, CFSTR("managedScanOptions"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)-[NSString copy](self->_identifier, "copy");
  objc_msgSend(v4, "setIdentifier:", v5);

  objc_msgSend(v4, "setForced:", self->_forced);
  v6 = (void *)-[NSMutableSet copy](self->_types, "copy");
  objc_msgSend(v4, "setTypes:", v6);

  v7 = (void *)-[NSString copy](self->_sessionID, "copy");
  objc_msgSend(v4, "setSessionID:", v7);

  objc_msgSend(v4, "setIgnoreNoUpdateFoundResult:", self->_ignoreNoUpdateFoundResult);
  v8 = (void *)-[NSString copy](self->_clientName, "copy");
  objc_msgSend(v4, "setClientName:", v8);

  objc_msgSend(v4, "setScanType:", self->_scanType);
  v9 = (void *)-[SUMDMScanOptions copy](self->_managedScanOptions, "copy");
  objc_msgSend(v4, "setManagedScanOptions:", v9);

  return v4;
}

- (BOOL)isSplatOnlyScan
{
  void *v3;
  void *v4;
  char v5;

  -[SUScanOptions types](self, "types");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[SUScanOptions types](self, "types");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", &unk_24CE6E010);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addType:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](self->_types, "addObject:", v4);

}

- (void)removeType:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](self->_types, "removeObject:", v4);

}

- (BOOL)containsType:(int)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[NSMutableSet containsObject:](self->_types, "containsObject:", v4);

  return (char)self;
}

- (BOOL)findsAnyUpdate
{
  NSMutableSet *types;

  types = self->_types;
  return !types || !-[NSMutableSet count](types, "count") || -[SUScanOptions containsType:](self, "containsType:", 0);
}

- (void)clearTypes
{
  -[NSMutableSet removeAllObjects](self->_types, "removeAllObjects");
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  unint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v19 = (void *)MEMORY[0x24BDD17C8];
  -[SUScanOptions clientName](self, "clientName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScanOptions identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUScanOptions isForced](self, "isForced"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v15 = v3;
  v14 = -[SUScanOptions scanType](self, "scanType");
  -[SUScanOptions types](self, "types");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  SUStringFromUpdateTypes(v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScanOptions requestedPMV](self, "requestedPMV");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScanOptions requestedBuild](self, "requestedBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScanOptions sessionID](self, "sessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUScanOptions MDMUseDelayPeriod](self, "MDMUseDelayPeriod"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[SUScanOptions MDMShowRapidSecurityResponse](self, "MDMShowRapidSecurityResponse"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  -[SUScanOptions managedScanOptions](self, "managedScanOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUScanOptions ignoreNoUpdateFoundResult](self, "ignoreNoUpdateFoundResult"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v19, "stringWithFormat:", CFSTR("\n            ClientName: %@\n            Identifier: %@\n            Forced: %@\n            ScanType: %d\n            Types: %@\n            Requested PMV: %@\n            Requested Build: %@\n            SessionID: %@\n            MDM use delay: %@\n            MDM show RSR: %@\n            =============== MDM: %@ \n            ===================\n            Ignore NoUpdateFound response: %@\n"), v17, v16, v15, v14, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)isForced
{
  return self->_forced;
}

- (void)setForced:(BOOL)a3
{
  self->_forced = a3;
}

- (NSSet)types
{
  return &self->_types->super;
}

- (void)setTypes:(id)a3
{
  objc_storeStrong((id *)&self->_types, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (BOOL)ignoreNoUpdateFoundResult
{
  return self->_ignoreNoUpdateFoundResult;
}

- (void)setIgnoreNoUpdateFoundResult:(BOOL)a3
{
  self->_ignoreNoUpdateFoundResult = a3;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (unint64_t)scanType
{
  return self->_scanType;
}

- (void)setScanType:(unint64_t)a3
{
  self->_scanType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedScanOptions, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isEmergencyOnlyScan
{
  void *v3;
  void *v4;
  char v5;

  -[SUScanOptions types](self, "types");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[SUScanOptions types](self, "types");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", &unk_24CE6E0D0);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isPMVRequested
{
  void *v2;
  BOOL v3;

  -[SUScanOptions requestedPMV](self, "requestedPMV");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)clientIsBuddy
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  char v14;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "buddyInitiatedScan");

  if (v4)
  {
    SULogInfo(CFSTR("%s: Overriding result to YES by SUBuddyInitiatedScan"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUScanOptions(SUS) clientIsBuddy]");
    return 1;
  }
  else
  {
    -[SUScanOptions clientName](self, "clientName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

    return v14;
  }
}

- (BOOL)clientIsDDM
{
  void *v2;
  char v3;

  -[SUScanOptions identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.SoftwareUpdateServices.DDM"));

  return v3;
}

@end
