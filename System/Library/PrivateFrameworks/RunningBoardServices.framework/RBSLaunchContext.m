@implementation RBSLaunchContext

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSLaunchContext)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSLaunchContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  RBSMachPort *dextCheckInPort;
  void *v38;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)RBSLaunchContext;
  v5 = -[RBSLaunchContext init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setIdentity:](v5, "setIdentity:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setAppID:](v5, "setAppID:", v7);

    v8 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v8, objc_opt_class(), CFSTR("_arguments"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setArguments:](v5, "setArguments:", v9);

    -[RBSLaunchContext setExecutionOptions:](v5, "setExecutionOptions:", objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_executionOptions")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__overrideExecutablePath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext _setOverrideExecutablePath:](v5, "_setOverrideExecutablePath:", v10);

    v11 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v11, objc_opt_class(), CFSTR("__additionalMachServices"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext _setAdditionalMachServices:](v5, "_setAdditionalMachServices:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__additionalEnvironment"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext _setAdditionalEnvironment:](v5, "_setAdditionalEnvironment:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_standardOutputPath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setStandardOutputPath:](v5, "setStandardOutputPath:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_standardErrorPath"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setStandardErrorPath:](v5, "setStandardErrorPath:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_standardInPath"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setStandardInPath:](v5, "setStandardInPath:", v16);

    v17 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v17, objc_opt_class(), CFSTR("_attributes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setAttributes:](v5, "setAttributes:", v18);

    v19 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v19, objc_opt_class(), CFSTR("_managedEndpointLaunchIdentifiers"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setManagedEndpointLaunchIdentifiers:](v5, "setManagedEndpointLaunchIdentifiers:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_explanation"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setExplanation:](v5, "setExplanation:", v21);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_managedPersona"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setManagedPersona:](v5, "setManagedPersona:", v22);

    -[RBSLaunchContext setSpawnType:](v5, "setSpawnType:", objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_spawnType")));
    -[RBSLaunchContext setLsManageRoleOnly:](v5, "setLsManageRoleOnly:", objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_lsManageRoleOnly")) != 0);
    -[RBSLaunchContext setLsSpawnFlags:](v5, "setLsSpawnFlags:", objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_lsSpawnFlags")));
    -[RBSLaunchContext setLsUMask:](v5, "setLsUMask:", (unsigned __int16)objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_lsUMask")));
    v23 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v23, objc_opt_class(), CFSTR("_lsBinpref"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setLsBinpref:](v5, "setLsBinpref:", v24);

    v25 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v25, objc_opt_class(), CFSTR("_lsBinprefSubtype"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setLsBinprefSubtype:](v5, "setLsBinprefSubtype:", v26);

    -[RBSLaunchContext setInitialRole:](v5, "setInitialRole:", objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_initialRole")));
    -[RBSLaunchContext setLsPersona:](v5, "setLsPersona:", objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_lsPersona")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setBundleIdentifier:](v5, "setBundleIdentifier:", v27);

    -[RBSLaunchContext setHostPid:](v5, "setHostPid:", objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_hostPid")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_extensionOverlay"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setExtensionOverlay:](v5, "setExtensionOverlay:", v28);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_oneShotUUID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setOneShotUUID:](v5, "setOneShotUUID:", v29);

    -[RBSLaunchContext setForceSubmit:](v5, "setForceSubmit:", objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_forceSubmit")) != 0);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beforeTranslocationBundlePath"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setBeforeTranslocationBundlePath:](v5, "setBeforeTranslocationBundlePath:", v30);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeDirectory"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setHomeDirectory:](v5, "setHomeDirectory:", v31);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tmpDirectory"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setTmpDirectory:](v5, "setTmpDirectory:", v32);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requiredExistingProcess"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setRequiredExistingProcess:](v5, "setRequiredExistingProcess:", v33);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_preventContainerization"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setPreventContainerization:](v5, "setPreventContainerization:", v34);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_containerIdentifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setContainerIdentifier:](v5, "setContainerIdentifier:", v35);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dextCheckInPort"));
    v36 = objc_claimAutoreleasedReturnValue();
    dextCheckInPort = v5->_dextCheckInPort;
    v5->_dextCheckInPort = (RBSMachPort *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_spawnConstraint"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setSpawnConstraint:](v5, "setSpawnConstraint:", v38);

  }
  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v4 = a3;
  -[RBSLaunchContext identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_identity"));

  -[RBSLaunchContext arguments](self, "arguments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v6, CFSTR("_arguments"));

  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext executionOptions](self, "executionOptions"), CFSTR("_executionOptions"));
  -[RBSLaunchContext _overrideExecutablePath](self, "_overrideExecutablePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("__overrideExecutablePath"));

  -[RBSLaunchContext _additionalMachServices](self, "_additionalMachServices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v8, CFSTR("__additionalMachServices"));

  -[RBSLaunchContext _additionalEnvironment](self, "_additionalEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("__additionalEnvironment"));

  -[RBSLaunchContext standardOutputPath](self, "standardOutputPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_standardOutputPath"));

  -[RBSLaunchContext standardErrorPath](self, "standardErrorPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("_standardErrorPath"));

  -[RBSLaunchContext standardInPath](self, "standardInPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("_standardInPath"));

  -[RBSLaunchContext attributes](self, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v13, CFSTR("_attributes"));

  -[RBSLaunchContext managedEndpointLaunchIdentifiers](self, "managedEndpointLaunchIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v14, CFSTR("_managedEndpointLaunchIdentifiers"));

  -[RBSLaunchContext explanation](self, "explanation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("_explanation"));

  -[RBSLaunchContext managedPersona](self, "managedPersona");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("_managedPersona"));

  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext spawnType](self, "spawnType"), CFSTR("_spawnType"));
  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext lsManageRoleOnly](self, "lsManageRoleOnly"), CFSTR("_lsManageRoleOnly"));
  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext lsSpawnFlags](self, "lsSpawnFlags"), CFSTR("_lsSpawnFlags"));
  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext lsUMask](self, "lsUMask"), CFSTR("_lsUMask"));
  -[RBSLaunchContext lsBinpref](self, "lsBinpref");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v17, CFSTR("_lsBinpref"));

  -[RBSLaunchContext lsBinprefSubtype](self, "lsBinprefSubtype");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v18, CFSTR("_lsBinprefSubtype"));

  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext initialRole](self, "initialRole"), CFSTR("_initialRole"));
  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext lsPersona](self, "lsPersona"), CFSTR("_lsPersona"));
  -[RBSLaunchContext bundleIdentifier](self, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("_bundleIdentifier"));

  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext hostPid](self, "hostPid"), CFSTR("_hostPid"));
  -[RBSLaunchContext extensionOverlay](self, "extensionOverlay");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("_extensionOverlay"));

  -[RBSLaunchContext oneShotUUID](self, "oneShotUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("_oneShotUUID"));

  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext forceSubmit](self, "forceSubmit"), CFSTR("_forceSubmit"));
  -[RBSLaunchContext beforeTranslocationBundlePath](self, "beforeTranslocationBundlePath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("_beforeTranslocationBundlePath"));

  -[RBSLaunchContext homeDirectory](self, "homeDirectory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("_homeDirectory"));

  -[RBSLaunchContext tmpDirectory](self, "tmpDirectory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("_tmpDirectory"));

  -[RBSLaunchContext requiredExistingProcess](self, "requiredExistingProcess");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("_requiredExistingProcess"));

  -[RBSLaunchContext preventContainerization](self, "preventContainerization");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("_preventContainerization"));

  -[RBSLaunchContext containerIdentifier](self, "containerIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("_containerIdentifier"));

  -[RBSLaunchContext appID](self, "appID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("_appID"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_dextCheckInPort, CFSTR("_dextCheckInPort"));
  -[RBSLaunchContext spawnConstraint](self, "spawnConstraint");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("_spawnConstraint"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  RBSLaunchContext *v4;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  RBSMachPort *dextCheckInPort;
  void *v31;

  v4 = -[RBSLaunchContext init](+[RBSLaunchContext allocWithZone:](RBSLaunchContext, "allocWithZone:", a3), "init");
  -[RBSLaunchContext identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setIdentity:](v4, "setIdentity:", v5);

  -[RBSLaunchContext appID](self, "appID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setAppID:](v4, "setAppID:", v6);

  -[RBSLaunchContext arguments](self, "arguments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setArguments:](v4, "setArguments:", v7);

  -[RBSLaunchContext setExecutionOptions:](v4, "setExecutionOptions:", -[RBSLaunchContext executionOptions](self, "executionOptions"));
  -[RBSLaunchContext _overrideExecutablePath](self, "_overrideExecutablePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext _setOverrideExecutablePath:](v4, "_setOverrideExecutablePath:", v8);

  -[RBSLaunchContext _additionalMachServices](self, "_additionalMachServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext _setAdditionalMachServices:](v4, "_setAdditionalMachServices:", v9);

  -[RBSLaunchContext _additionalEnvironment](self, "_additionalEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext _setAdditionalEnvironment:](v4, "_setAdditionalEnvironment:", v10);

  -[RBSLaunchContext standardOutputPath](self, "standardOutputPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setStandardOutputPath:](v4, "setStandardOutputPath:", v11);

  -[RBSLaunchContext standardErrorPath](self, "standardErrorPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setStandardErrorPath:](v4, "setStandardErrorPath:", v12);

  -[RBSLaunchContext standardInPath](self, "standardInPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setStandardInPath:](v4, "setStandardInPath:", v13);

  -[RBSLaunchContext attributes](self, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setAttributes:](v4, "setAttributes:", v14);

  -[RBSLaunchContext managedEndpointLaunchIdentifiers](self, "managedEndpointLaunchIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setManagedEndpointLaunchIdentifiers:](v4, "setManagedEndpointLaunchIdentifiers:", v15);

  -[RBSLaunchContext explanation](self, "explanation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setExplanation:](v4, "setExplanation:", v16);

  -[RBSLaunchContext managedPersona](self, "managedPersona");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setManagedPersona:](v4, "setManagedPersona:", v17);

  -[RBSLaunchContext setSpawnType:](v4, "setSpawnType:", -[RBSLaunchContext spawnType](self, "spawnType"));
  -[RBSLaunchContext setLsManageRoleOnly:](v4, "setLsManageRoleOnly:", -[RBSLaunchContext lsManageRoleOnly](self, "lsManageRoleOnly"));
  -[RBSLaunchContext setLsSpawnFlags:](v4, "setLsSpawnFlags:", -[RBSLaunchContext lsSpawnFlags](self, "lsSpawnFlags"));
  -[RBSLaunchContext setLsUMask:](v4, "setLsUMask:", -[RBSLaunchContext lsUMask](self, "lsUMask"));
  -[RBSLaunchContext lsBinpref](self, "lsBinpref");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setLsBinpref:](v4, "setLsBinpref:", v18);

  -[RBSLaunchContext lsBinprefSubtype](self, "lsBinprefSubtype");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setLsBinprefSubtype:](v4, "setLsBinprefSubtype:", v19);

  -[RBSLaunchContext setInitialRole:](v4, "setInitialRole:", -[RBSLaunchContext initialRole](self, "initialRole"));
  -[RBSLaunchContext setLsPersona:](v4, "setLsPersona:", -[RBSLaunchContext lsPersona](self, "lsPersona"));
  -[RBSLaunchContext bundleIdentifier](self, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setBundleIdentifier:](v4, "setBundleIdentifier:", v20);

  -[RBSLaunchContext setHostPid:](v4, "setHostPid:", -[RBSLaunchContext hostPid](self, "hostPid"));
  -[RBSLaunchContext extensionOverlay](self, "extensionOverlay");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setExtensionOverlay:](v4, "setExtensionOverlay:", v21);

  -[RBSLaunchContext oneShotUUID](self, "oneShotUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setOneShotUUID:](v4, "setOneShotUUID:", v22);

  -[RBSLaunchContext setForceSubmit:](v4, "setForceSubmit:", -[RBSLaunchContext forceSubmit](self, "forceSubmit"));
  -[RBSLaunchContext beforeTranslocationBundlePath](self, "beforeTranslocationBundlePath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setBeforeTranslocationBundlePath:](v4, "setBeforeTranslocationBundlePath:", v23);

  -[RBSLaunchContext homeDirectory](self, "homeDirectory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setHomeDirectory:](v4, "setHomeDirectory:", v24);

  -[RBSLaunchContext tmpDirectory](self, "tmpDirectory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setTmpDirectory:](v4, "setTmpDirectory:", v25);

  -[RBSLaunchContext requiredExistingProcess](self, "requiredExistingProcess");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setRequiredExistingProcess:](v4, "setRequiredExistingProcess:", v26);

  -[RBSLaunchContext preventContainerization](self, "preventContainerization");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setPreventContainerization:](v4, "setPreventContainerization:", v27);

  -[RBSLaunchContext containerIdentifier](self, "containerIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setContainerIdentifier:](v4, "setContainerIdentifier:", v28);

  v29 = -[RBSMachPort copy](self->_dextCheckInPort, "copy");
  dextCheckInPort = v4->_dextCheckInPort;
  v4->_dextCheckInPort = (RBSMachPort *)v29;

  -[RBSLaunchContext spawnConstraint](self, "spawnConstraint");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setSpawnConstraint:](v4, "setSpawnConstraint:", v31);

  return v4;
}

- (NSDictionary)_additionalEnvironment
{
  return self->__additionalEnvironment;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)_overrideExecutablePath
{
  return self->__overrideExecutablePath;
}

- (NSString)beforeTranslocationBundlePath
{
  return self->_beforeTranslocationBundlePath;
}

- (unsigned)initialRole
{
  return self->_initialRole;
}

- (NSNumber)preventContainerization
{
  return self->_preventContainerization;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (NSString)tmpDirectory
{
  return self->_tmpDirectory;
}

- (NSDictionary)spawnConstraint
{
  return self->_spawnConstraint;
}

- (NSString)homeDirectory
{
  return self->_homeDirectory;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (unint64_t)lsSpawnFlags
{
  return self->_lsSpawnFlags;
}

- (NSArray)lsBinpref
{
  return self->_lsBinpref;
}

- (void)_setAdditionalMachServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (LSApplicationIdentity)appID
{
  return self->_appID;
}

- (void)setIdentity:(id)a3
{
  void *v5;
  NSString *v6;
  NSString *bundleIdentifier;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_identity, a3);
  -[RBSProcessIdentity embeddedApplicationIdentifier](self->_identity, "embeddedApplicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RBSProcessIdentity embeddedApplicationIdentifier](self->_identity, "embeddedApplicationIdentifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v6;

  }
}

- (int)hostPid
{
  return self->_hostPid;
}

- (void)_setOverrideExecutablePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)_setAdditionalEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (RBSProcessIdentifier)requiredExistingProcess
{
  return self->_requiredExistingProcess;
}

- (NSSet)managedEndpointLaunchIdentifiers
{
  return self->_managedEndpointLaunchIdentifiers;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (unint64_t)executionOptions
{
  return self->_executionOptions;
}

- (NSArray)_additionalMachServices
{
  return self->__additionalMachServices;
}

- (void)setHostPid:(int)a3
{
  self->_hostPid = a3;
}

- (NSDictionary)extensionOverlay
{
  return self->_extensionOverlay;
}

- (void)setManagedEndpointLaunchIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setExtensionOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_extensionOverlay, a3);
}

- (NSString)standardOutputPath
{
  return self->_standardOutputPath;
}

- (NSString)standardInPath
{
  return self->_standardInPath;
}

- (NSString)standardErrorPath
{
  return self->_standardErrorPath;
}

- (unsigned)spawnType
{
  return self->_spawnType;
}

- (NSString)managedPersona
{
  return self->_managedPersona;
}

- (unsigned)lsUMask
{
  return self->_lsUMask;
}

- (unsigned)lsPersona
{
  return self->_lsPersona;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setInitialRole:(unsigned __int8)a3
{
  self->_initialRole = a3;
}

- (void)setRequiredExistingProcess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setStandardOutputPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setStandardErrorPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setExecutionOptions:(unint64_t)a3
{
  self->_executionOptions = a3;
}

- (void)setPreventContainerization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setManagedPersona:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSUUID)oneShotUUID
{
  return self->_oneShotUUID;
}

- (void)setSpawnType:(unsigned __int8)a3
{
  self->_spawnType = a3;
}

- (void)setOneShotUUID:(id)a3
{
  objc_storeStrong((id *)&self->_oneShotUUID, a3);
}

- (BOOL)lsManageRoleOnly
{
  return self->_lsManageRoleOnly;
}

- (NSArray)lsBinprefSubtype
{
  return self->_lsBinprefSubtype;
}

- (BOOL)forceSubmit
{
  return self->_forceSubmit;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setTmpDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setSpawnConstraint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setHomeDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setBeforeTranslocationBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setStandardInPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setLsUMask:(unsigned __int16)a3
{
  self->_lsUMask = a3;
}

- (void)setLsSpawnFlags:(unint64_t)a3
{
  self->_lsSpawnFlags = a3;
}

- (void)setLsPersona:(unsigned int)a3
{
  self->_lsPersona = a3;
}

- (void)setLsManageRoleOnly:(BOOL)a3
{
  self->_lsManageRoleOnly = a3;
}

- (void)setLsBinprefSubtype:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setLsBinpref:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setForceSubmit:(BOOL)a3
{
  self->_forceSubmit = a3;
}

- (void)setBundleIdentifier:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  -[RBSProcessIdentity embeddedApplicationIdentifier](self->_identity, "embeddedApplicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_storeStrong((id *)&self->_bundleIdentifier, a3);

}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

+ (id)contextWithIdentity:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentity:", v4);

  return v5;
}

+ (id)context
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)requiredSequenceNumber
{
  return self->_requiredSequenceNumber;
}

- (NSUUID)requiredCacheUUID
{
  return self->_requiredCacheUUID;
}

- (BOOL)isTesting
{
  return self->_testing;
}

- (RBSProcessHandle)requestorHandle
{
  return self->_requestorHandle;
}

- (void)setHostProcess:(id)a3
{
  objc_storeStrong((id *)&self->_hostProcess, a3);
}

- (void)setRequestorHandle:(id)a3
{
  objc_storeStrong((id *)&self->_requestorHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredSequenceNumber, 0);
  objc_storeStrong((id *)&self->_requiredCacheUUID, 0);
  objc_storeStrong((id *)&self->__additionalEnvironment, 0);
  objc_storeStrong((id *)&self->__additionalMachServices, 0);
  objc_storeStrong((id *)&self->__overrideExecutablePath, 0);
  objc_storeStrong((id *)&self->_hostProcess, 0);
  objc_storeStrong((id *)&self->_managedPersona, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_managedEndpointLaunchIdentifiers, 0);
  objc_storeStrong((id *)&self->_spawnConstraint, 0);
  objc_storeStrong((id *)&self->_requestorHandle, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_preventContainerization, 0);
  objc_storeStrong((id *)&self->_requiredExistingProcess, 0);
  objc_storeStrong((id *)&self->_tmpDirectory, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
  objc_storeStrong((id *)&self->_beforeTranslocationBundlePath, 0);
  objc_storeStrong((id *)&self->_standardInPath, 0);
  objc_storeStrong((id *)&self->_standardErrorPath, 0);
  objc_storeStrong((id *)&self->_standardOutputPath, 0);
  objc_storeStrong((id *)&self->_oneShotUUID, 0);
  objc_storeStrong((id *)&self->_extensionOverlay, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lsBinprefSubtype, 0);
  objc_storeStrong((id *)&self->_lsBinpref, 0);
  objc_storeStrong((id *)&self->_dextCheckInPort, 0);
}

+ (id)contextWithLSAppID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppID:", v4);

  return v5;
}

- (unsigned)lsInitialRole
{
  return RBSDarwinRoleFromRBSRole(self->_initialRole);
}

- (void)setLsInitialRole:(unsigned int)a3
{
  self->_initialRole = RBSRoleFromDarwinRole(a3);
}

- (unsigned)dextCheckInPort
{
  return -[RBSMachPort port](self->_dextCheckInPort, "port");
}

- (void)setDextCheckInPort:(unsigned int)a3
{
  RBSMachPort *v4;
  RBSMachPort *dextCheckInPort;

  +[RBSMachPort portForPort:](RBSMachPort, "portForPort:", *(_QWORD *)&a3);
  v4 = (RBSMachPort *)objc_claimAutoreleasedReturnValue();
  dextCheckInPort = self->_dextCheckInPort;
  self->_dextCheckInPort = v4;

}

- (BOOL)isEqual:(id)a3
{
  RBSLaunchContext *v4;
  uint64_t v5;
  BOOL v6;
  RBSProcessIdentity *identity;
  LSApplicationIdentity *appID;
  NSString *overrideExecutablePath;
  NSArray *arguments;
  NSArray *additionalMachServices;
  NSDictionary *additionalEnvironment;
  NSString *standardOutputPath;
  NSString *standardErrorPath;
  NSString *standardInPath;
  NSString *managedPersona;
  NSArray *attributes;
  NSSet *managedEndpointLaunchIdentifiers;
  NSString *explanation;
  NSArray *lsBinpref;
  NSArray *v21;
  NSArray *lsBinprefSubtype;
  NSArray *v23;
  NSString *bundleIdentifier;
  NSDictionary *extensionOverlay;
  NSUUID *oneShotUUID;
  NSString *beforeTranslocationBundlePath;
  NSString *homeDirectory;
  NSString *tmpDirectory;
  RBSProcessIdentifier *requiredExistingProcess;
  NSNumber *preventContainerization;
  NSString *containerIdentifier;
  RBSMachPort *dextCheckInPort;
  RBSMachPort *v34;
  NSDictionary *spawnConstraint;

  v4 = (RBSLaunchContext *)a3;
  if (self == v4)
    goto LABEL_71;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  identity = self->_identity;
  if (identity != v4->_identity && !-[RBSProcessIdentity isEqual:](identity, "isEqual:"))
    goto LABEL_3;
  appID = self->_appID;
  if (appID != v4->_appID && !-[LSApplicationIdentity isEqual:](appID, "isEqual:"))
    goto LABEL_3;
  overrideExecutablePath = self->__overrideExecutablePath;
  if (overrideExecutablePath != v4->__overrideExecutablePath
    && !-[NSString isEqualToString:](overrideExecutablePath, "isEqualToString:"))
  {
    goto LABEL_3;
  }
  arguments = self->_arguments;
  if (arguments != v4->_arguments && !-[NSArray isEqualToArray:](arguments, "isEqualToArray:"))
    goto LABEL_3;
  additionalMachServices = self->__additionalMachServices;
  if (additionalMachServices != v4->__additionalMachServices
    && !-[NSArray isEqualToArray:](additionalMachServices, "isEqualToArray:"))
  {
    goto LABEL_3;
  }
  if (self->_executionOptions != v4->_executionOptions)
    goto LABEL_3;
  additionalEnvironment = self->__additionalEnvironment;
  if (additionalEnvironment != v4->__additionalEnvironment
    && !-[NSDictionary isEqualToDictionary:](additionalEnvironment, "isEqualToDictionary:"))
  {
    goto LABEL_3;
  }
  standardOutputPath = self->_standardOutputPath;
  if (standardOutputPath != v4->_standardOutputPath
    && !-[NSString isEqualToString:](standardOutputPath, "isEqualToString:"))
  {
    goto LABEL_3;
  }
  standardErrorPath = self->_standardErrorPath;
  if (standardErrorPath != v4->_standardErrorPath
    && !-[NSString isEqualToString:](standardErrorPath, "isEqualToString:"))
  {
    goto LABEL_3;
  }
  standardInPath = self->_standardInPath;
  if (standardInPath != v4->_standardInPath && !-[NSString isEqualToString:](standardInPath, "isEqualToString:"))
    goto LABEL_3;
  managedPersona = self->_managedPersona;
  if (managedPersona != v4->_managedPersona && !-[NSString isEqualToString:](managedPersona, "isEqualToString:"))
    goto LABEL_3;
  if (self->_spawnType != v4->_spawnType)
    goto LABEL_3;
  attributes = self->_attributes;
  if (attributes != v4->_attributes && !-[NSArray isEqualToArray:](attributes, "isEqualToArray:"))
    goto LABEL_3;
  managedEndpointLaunchIdentifiers = self->_managedEndpointLaunchIdentifiers;
  if (managedEndpointLaunchIdentifiers != v4->_managedEndpointLaunchIdentifiers
    && !-[NSSet isEqualToSet:](managedEndpointLaunchIdentifiers, "isEqualToSet:"))
  {
    goto LABEL_3;
  }
  explanation = self->_explanation;
  if (explanation != v4->_explanation && !-[NSString isEqualToString:](explanation, "isEqualToString:"))
    goto LABEL_3;
  if (self->_lsManageRoleOnly != v4->_lsManageRoleOnly
    || self->_lsSpawnFlags != v4->_lsSpawnFlags
    || self->_lsUMask != v4->_lsUMask)
  {
    goto LABEL_3;
  }
  lsBinpref = self->_lsBinpref;
  v21 = v4->_lsBinpref;
  if (lsBinpref != v21)
  {
    v6 = 0;
    if (!lsBinpref || !v21)
      goto LABEL_72;
    if (!-[NSArray isEqual:](lsBinpref, "isEqual:"))
      goto LABEL_3;
  }
  lsBinprefSubtype = self->_lsBinprefSubtype;
  v23 = v4->_lsBinprefSubtype;
  if (lsBinprefSubtype != v23)
  {
    v6 = 0;
    if (!lsBinprefSubtype || !v23)
      goto LABEL_72;
    if (!-[NSArray isEqual:](lsBinprefSubtype, "isEqual:"))
      goto LABEL_3;
  }
  if (self->_initialRole != v4->_initialRole)
    goto LABEL_3;
  if (self->_lsPersona != v4->_lsPersona)
    goto LABEL_3;
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier != v4->_bundleIdentifier && !-[NSString isEqualToString:](bundleIdentifier, "isEqualToString:"))
    goto LABEL_3;
  if (self->_hostPid != v4->_hostPid)
    goto LABEL_3;
  extensionOverlay = self->_extensionOverlay;
  if (extensionOverlay != v4->_extensionOverlay
    && !-[NSDictionary isEqualToDictionary:](extensionOverlay, "isEqualToDictionary:"))
  {
    goto LABEL_3;
  }
  oneShotUUID = self->_oneShotUUID;
  if (oneShotUUID != v4->_oneShotUUID && !-[NSUUID isEqual:](oneShotUUID, "isEqual:"))
    goto LABEL_3;
  if (self->_forceSubmit != v4->_forceSubmit)
    goto LABEL_3;
  beforeTranslocationBundlePath = self->_beforeTranslocationBundlePath;
  if (beforeTranslocationBundlePath != v4->_beforeTranslocationBundlePath
    && !-[NSString isEqualToString:](beforeTranslocationBundlePath, "isEqualToString:"))
  {
    goto LABEL_3;
  }
  homeDirectory = self->_homeDirectory;
  if (homeDirectory != v4->_homeDirectory && !-[NSString isEqualToString:](homeDirectory, "isEqualToString:"))
    goto LABEL_3;
  tmpDirectory = self->_tmpDirectory;
  if (tmpDirectory != v4->_tmpDirectory && !-[NSString isEqualToString:](tmpDirectory, "isEqualToString:"))
    goto LABEL_3;
  requiredExistingProcess = self->_requiredExistingProcess;
  if (requiredExistingProcess != v4->_requiredExistingProcess
    && !-[RBSProcessIdentifier isEqual:](requiredExistingProcess, "isEqual:"))
  {
    goto LABEL_3;
  }
  preventContainerization = self->_preventContainerization;
  if (preventContainerization != v4->_preventContainerization
    && !-[NSNumber isEqual:](preventContainerization, "isEqual:"))
  {
    goto LABEL_3;
  }
  containerIdentifier = self->_containerIdentifier;
  if (containerIdentifier != v4->_containerIdentifier
    && !-[NSString isEqual:](containerIdentifier, "isEqual:"))
  {
    goto LABEL_3;
  }
  dextCheckInPort = self->_dextCheckInPort;
  v34 = v4->_dextCheckInPort;
  if (dextCheckInPort == v34)
  {
LABEL_69:
    spawnConstraint = self->_spawnConstraint;
    if (spawnConstraint == v4->_spawnConstraint
      || -[NSDictionary isEqualToDictionary:](spawnConstraint, "isEqualToDictionary:"))
    {
LABEL_71:
      v6 = 1;
      goto LABEL_72;
    }
    goto LABEL_3;
  }
  v6 = 0;
  if (dextCheckInPort && v34)
  {
    if (-[RBSMachPort isEqual:](dextCheckInPort, "isEqual:"))
      goto LABEL_69;
LABEL_3:
    v6 = 0;
  }
LABEL_72:

  return v6;
}

- (unint64_t)hash
{
  return -[RBSProcessIdentity hash](self->_identity, "hash");
}

- (void)setTesting:(BOOL)a3
{
  self->_testing = a3;
}

- (BOOL)calculatedContainerIdentifier
{
  return self->_calculatedContainerIdentifier;
}

- (void)setCalculatedContainerIdentifier:(BOOL)a3
{
  self->_calculatedContainerIdentifier = a3;
}

- (RBProcess)hostProcess
{
  return self->_hostProcess;
}

- (void)setRequiredCacheUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setRequiredSequenceNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

@end
