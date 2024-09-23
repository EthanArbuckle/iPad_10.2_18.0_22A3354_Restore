@implementation TUCallCapabilitiesState

- (BOOL)supportsPrimaryCalling
{
  return self->_supportsPrimaryCalling;
}

- (BOOL)supportsDisplayingTelephonyCalls
{
  return self->_supportsDisplayingTelephonyCalls;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[TUCallCapabilitiesState publiclyAccessibleCopyWithZone:](self, "publiclyAccessibleCopyWithZone:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallCapabilitiesState relayCallingDisabledForDeviceID](self, "relayCallingDisabledForDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRelayCallingDisabledForDeviceID:", v5);

  -[TUCallCapabilitiesState outgoingRelayCallerID](self, "outgoingRelayCallerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutgoingRelayCallerID:", v6);

  v7 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[TUCallCapabilitiesState cloudCallingDevices](self, "cloudCallingDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:copyItems:", v8, 1);
  objc_msgSend(v4, "setCloudCallingDevices:", v9);

  objc_msgSend(v4, "setEmergencyCallbackModeEnabled:", -[TUCallCapabilitiesState isEmergencyCallbackModeEnabled](self, "isEmergencyCallbackModeEnabled"));
  objc_msgSend(v4, "setEmergencyCallbackPossible:", -[TUCallCapabilitiesState isEmergencyCallbackPossible](self, "isEmergencyCallbackPossible"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsPrimaryCalling](self, "supportsPrimaryCalling"), CFSTR("supportsPrimaryCalling"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsBasebandCalling](self, "supportsBasebandCalling"), CFSTR("supportsBasebandCalling"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsCellularData](self, "supportsCellularData"), CFSTR("supportsCellularData"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsDisplayingTelephonyCalls](self, "supportsDisplayingTelephonyCalls"), CFSTR("supportsDisplayingTelephonyCalls"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsDisplayingFaceTimeAudioCalls](self, "supportsDisplayingFaceTimeAudioCalls"), CFSTR("supportsDisplayingFaceTimeAudioCalls"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsDisplayingFaceTimeVideoCalls](self, "supportsDisplayingFaceTimeVideoCalls"), CFSTR("supportsDisplayingFaceTimeVideoCalls"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState isFaceTimeAudioAvailable](self, "isFaceTimeAudioAvailable"), CFSTR("faceTimeAudioAvailable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState isFaceTimeVideoAvailable](self, "isFaceTimeVideoAvailable"), CFSTR("faceTimeVideoAvailable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState areCTCapabilitiesValid](self, "areCTCapabilitiesValid"), CFSTR("ctCapabilitiesValid"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsRelayCalling](self, "supportsRelayCalling"), CFSTR("supportsRelayCalling"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState accountsMatchForSecondaryCalling](self, "accountsMatchForSecondaryCalling"), CFSTR("accountsMatchForSecondaryCalling"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState accountsSupportSecondaryCalling](self, "accountsSupportSecondaryCalling"), CFSTR("accountsSupportSecondaryCalling"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState areRelayCallingFeaturesEnabled](self, "areRelayCallingFeaturesEnabled"), CFSTR("relayCallingFeaturesEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState isRelayCallingEnabled](self, "isRelayCallingEnabled"), CFSTR("relayCallingEnabled"));
  objc_msgSend(v4, "encodeInt:forKey:", -[TUCallCapabilitiesState relayCallingAvailability](self, "relayCallingAvailability"), CFSTR("relayCallingAvailability"));
  -[TUCallCapabilitiesState relayCallingDisabledForDeviceID](self, "relayCallingDisabledForDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("relayCallingDisabledForDeviceID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsTelephonyRelayCalling](self, "supportsTelephonyRelayCalling"), CFSTR("supportsTelephonyRelayCalling"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsFaceTimeAudioRelayCalling](self, "supportsFaceTimeAudioRelayCalling"), CFSTR("supportsFaceTimeAudioRelayCalling"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState supportsFaceTimeVideoRelayCalling](self, "supportsFaceTimeVideoRelayCalling"), CFSTR("supportsFaceTimeVideoRelayCalling"));
  -[TUCallCapabilitiesState outgoingRelayCallerID](self, "outgoingRelayCallerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("outgoingRelayCallerID"));

  -[TUCallCapabilitiesState cloudCallingDevices](self, "cloudCallingDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cloudCallingDevices"));

  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState isEmergencyCallbackModeEnabled](self, "isEmergencyCallbackModeEnabled"), CFSTR("emergencyCallbackModeEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TUCallCapabilitiesState isEmergencyCallbackPossible](self, "isEmergencyCallbackPossible"), CFSTR("emergencyCallbackPossible"));
  -[TUCallCapabilitiesState senderIdentityCapabilitiesStateByUUID](self, "senderIdentityCapabilitiesStateByUUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_senderIdentityCapabilitiesStateByUUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v8);

}

- (BOOL)isFaceTimeAudioAvailable
{
  return self->_faceTimeAudioAvailable;
}

- (NSDictionary)relayCallingDisabledForDeviceID
{
  return self->_relayCallingDisabledForDeviceID;
}

- (NSString)outgoingRelayCallerID
{
  return self->_outgoingRelayCallerID;
}

- (BOOL)isEmergencyCallbackPossible
{
  return self->_emergencyCallbackPossible;
}

- (BOOL)isEmergencyCallbackModeEnabled
{
  return self->_emergencyCallbackModeEnabled;
}

- (NSArray)cloudCallingDevices
{
  return self->_cloudCallingDevices;
}

- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSupportsPrimaryCalling:", -[TUCallCapabilitiesState supportsPrimaryCalling](self, "supportsPrimaryCalling"));
  objc_msgSend(v4, "setSupportsBasebandCalling:", -[TUCallCapabilitiesState supportsBasebandCalling](self, "supportsBasebandCalling"));
  objc_msgSend(v4, "setSupportsCellularData:", -[TUCallCapabilitiesState supportsCellularData](self, "supportsCellularData"));
  objc_msgSend(v4, "setSupportsDisplayingTelephonyCalls:", -[TUCallCapabilitiesState supportsDisplayingTelephonyCalls](self, "supportsDisplayingTelephonyCalls"));
  objc_msgSend(v4, "setSupportsDisplayingFaceTimeAudioCalls:", -[TUCallCapabilitiesState supportsDisplayingFaceTimeAudioCalls](self, "supportsDisplayingFaceTimeAudioCalls"));
  objc_msgSend(v4, "setSupportsDisplayingFaceTimeVideoCalls:", -[TUCallCapabilitiesState supportsDisplayingFaceTimeVideoCalls](self, "supportsDisplayingFaceTimeVideoCalls"));
  objc_msgSend(v4, "setFaceTimeAudioAvailable:", -[TUCallCapabilitiesState isFaceTimeAudioAvailable](self, "isFaceTimeAudioAvailable"));
  objc_msgSend(v4, "setFaceTimeVideoAvailable:", -[TUCallCapabilitiesState isFaceTimeVideoAvailable](self, "isFaceTimeVideoAvailable"));
  objc_msgSend(v4, "setCtCapabilitiesValid:", -[TUCallCapabilitiesState areCTCapabilitiesValid](self, "areCTCapabilitiesValid"));
  objc_msgSend(v4, "setSupportsRelayCalling:", -[TUCallCapabilitiesState supportsRelayCalling](self, "supportsRelayCalling"));
  objc_msgSend(v4, "setAccountsMatchForSecondaryCalling:", -[TUCallCapabilitiesState accountsMatchForSecondaryCalling](self, "accountsMatchForSecondaryCalling"));
  objc_msgSend(v4, "setAccountsSupportSecondaryCalling:", -[TUCallCapabilitiesState accountsSupportSecondaryCalling](self, "accountsSupportSecondaryCalling"));
  objc_msgSend(v4, "setRelayCallingFeaturesEnabled:", -[TUCallCapabilitiesState areRelayCallingFeaturesEnabled](self, "areRelayCallingFeaturesEnabled"));
  objc_msgSend(v4, "setRelayCallingEnabled:", -[TUCallCapabilitiesState isRelayCallingEnabled](self, "isRelayCallingEnabled"));
  objc_msgSend(v4, "setRelayCallingAvailability:", -[TUCallCapabilitiesState relayCallingAvailability](self, "relayCallingAvailability"));
  objc_msgSend(v4, "setSupportsTelephonyRelayCalling:", -[TUCallCapabilitiesState supportsTelephonyRelayCalling](self, "supportsTelephonyRelayCalling"));
  objc_msgSend(v4, "setSupportsFaceTimeAudioRelayCalling:", -[TUCallCapabilitiesState supportsFaceTimeAudioRelayCalling](self, "supportsFaceTimeAudioRelayCalling"));
  objc_msgSend(v4, "setSupportsFaceTimeVideoRelayCalling:", -[TUCallCapabilitiesState supportsFaceTimeVideoRelayCalling](self, "supportsFaceTimeVideoRelayCalling"));
  -[TUCallCapabilitiesState senderIdentityCapabilitiesStateByUUID](self, "senderIdentityCapabilitiesStateByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSenderIdentityCapabilitiesStateByUUID:", v5);

  return v4;
}

- (BOOL)supportsDisplayingFaceTimeVideoCalls
{
  return self->_supportsDisplayingFaceTimeVideoCalls;
}

- (BOOL)areRelayCallingFeaturesEnabled
{
  return self->_relayCallingFeaturesEnabled;
}

- (BOOL)supportsTelephonyRelayCalling
{
  return self->_supportsTelephonyRelayCalling;
}

- (BOOL)supportsRelayCalling
{
  return self->_supportsRelayCalling;
}

- (BOOL)supportsFaceTimeVideoRelayCalling
{
  return self->_supportsFaceTimeVideoRelayCalling;
}

- (BOOL)supportsFaceTimeAudioRelayCalling
{
  return self->_supportsFaceTimeAudioRelayCalling;
}

- (BOOL)supportsCellularData
{
  return self->_supportsCellularData;
}

- (BOOL)supportsBasebandCalling
{
  return self->_supportsBasebandCalling;
}

- (NSDictionary)senderIdentityCapabilitiesStateByUUID
{
  return self->_senderIdentityCapabilitiesStateByUUID;
}

- (int)relayCallingAvailability
{
  return self->_relayCallingAvailability;
}

- (BOOL)isRelayCallingEnabled
{
  return self->_relayCallingEnabled;
}

- (BOOL)isFaceTimeVideoAvailable
{
  return self->_faceTimeVideoAvailable;
}

- (BOOL)areCTCapabilitiesValid
{
  return self->_ctCapabilitiesValid;
}

- (BOOL)accountsSupportSecondaryCalling
{
  return self->_accountsSupportSecondaryCalling;
}

- (BOOL)accountsMatchForSecondaryCalling
{
  return self->_accountsMatchForSecondaryCalling;
}

- (TUCallCapabilitiesState)initWithCoder:(id)a3
{
  id v4;
  TUCallCapabilitiesState *v5;
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
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[TUCallCapabilitiesState init](self, "init");
  if (v5)
  {
    -[TUCallCapabilitiesState setSupportsPrimaryCalling:](v5, "setSupportsPrimaryCalling:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsPrimaryCalling")));
    -[TUCallCapabilitiesState setSupportsBasebandCalling:](v5, "setSupportsBasebandCalling:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsBasebandCalling")));
    -[TUCallCapabilitiesState setSupportsCellularData:](v5, "setSupportsCellularData:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsCellularData")));
    -[TUCallCapabilitiesState setSupportsDisplayingTelephonyCalls:](v5, "setSupportsDisplayingTelephonyCalls:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsDisplayingTelephonyCalls")));
    -[TUCallCapabilitiesState setSupportsDisplayingFaceTimeAudioCalls:](v5, "setSupportsDisplayingFaceTimeAudioCalls:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsDisplayingFaceTimeAudioCalls")));
    -[TUCallCapabilitiesState setSupportsDisplayingFaceTimeVideoCalls:](v5, "setSupportsDisplayingFaceTimeVideoCalls:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsDisplayingFaceTimeVideoCalls")));
    -[TUCallCapabilitiesState setFaceTimeAudioAvailable:](v5, "setFaceTimeAudioAvailable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("faceTimeAudioAvailable")));
    -[TUCallCapabilitiesState setFaceTimeVideoAvailable:](v5, "setFaceTimeVideoAvailable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("faceTimeVideoAvailable")));
    -[TUCallCapabilitiesState setCtCapabilitiesValid:](v5, "setCtCapabilitiesValid:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ctCapabilitiesValid")));
    -[TUCallCapabilitiesState setSupportsRelayCalling:](v5, "setSupportsRelayCalling:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsRelayCalling")));
    -[TUCallCapabilitiesState setAccountsMatchForSecondaryCalling:](v5, "setAccountsMatchForSecondaryCalling:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accountsMatchForSecondaryCalling")));
    -[TUCallCapabilitiesState setAccountsSupportSecondaryCalling:](v5, "setAccountsSupportSecondaryCalling:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accountsSupportSecondaryCalling")));
    -[TUCallCapabilitiesState setRelayCallingFeaturesEnabled:](v5, "setRelayCallingFeaturesEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("relayCallingFeaturesEnabled")));
    -[TUCallCapabilitiesState setRelayCallingEnabled:](v5, "setRelayCallingEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("relayCallingEnabled")));
    -[TUCallCapabilitiesState setRelayCallingAvailability:](v5, "setRelayCallingAvailability:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("relayCallingAvailability")));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("relayCallingDisabledForDeviceID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallCapabilitiesState setRelayCallingDisabledForDeviceID:](v5, "setRelayCallingDisabledForDeviceID:", v9);

    -[TUCallCapabilitiesState setSupportsTelephonyRelayCalling:](v5, "setSupportsTelephonyRelayCalling:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsTelephonyRelayCalling")));
    -[TUCallCapabilitiesState setSupportsFaceTimeAudioRelayCalling:](v5, "setSupportsFaceTimeAudioRelayCalling:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsFaceTimeAudioRelayCalling")));
    -[TUCallCapabilitiesState setSupportsFaceTimeVideoRelayCalling:](v5, "setSupportsFaceTimeVideoRelayCalling:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsFaceTimeVideoRelayCalling")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outgoingRelayCallerID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallCapabilitiesState setOutgoingRelayCallerID:](v5, "setOutgoingRelayCallerID:", v10);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("cloudCallingDevices"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallCapabilitiesState setCloudCallingDevices:](v5, "setCloudCallingDevices:", v14);

    -[TUCallCapabilitiesState setEmergencyCallbackModeEnabled:](v5, "setEmergencyCallbackModeEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("emergencyCallbackModeEnabled")));
    -[TUCallCapabilitiesState setEmergencyCallbackPossible:](v5, "setEmergencyCallbackPossible:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("emergencyCallbackPossible")));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_senderIdentityCapabilitiesStateByUUID);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallCapabilitiesState setSenderIdentityCapabilitiesStateByUUID:](v5, "setSenderIdentityCapabilitiesStateByUUID:", v19);

  }
  return v5;
}

- (void)setSupportsTelephonyRelayCalling:(BOOL)a3
{
  self->_supportsTelephonyRelayCalling = a3;
}

- (void)setSupportsRelayCalling:(BOOL)a3
{
  self->_supportsRelayCalling = a3;
}

- (void)setSupportsPrimaryCalling:(BOOL)a3
{
  self->_supportsPrimaryCalling = a3;
}

- (void)setSupportsFaceTimeVideoRelayCalling:(BOOL)a3
{
  self->_supportsFaceTimeVideoRelayCalling = a3;
}

- (void)setSupportsFaceTimeAudioRelayCalling:(BOOL)a3
{
  self->_supportsFaceTimeAudioRelayCalling = a3;
}

- (void)setSupportsDisplayingTelephonyCalls:(BOOL)a3
{
  self->_supportsDisplayingTelephonyCalls = a3;
}

- (void)setSupportsDisplayingFaceTimeVideoCalls:(BOOL)a3
{
  self->_supportsDisplayingFaceTimeVideoCalls = a3;
}

- (void)setSupportsDisplayingFaceTimeAudioCalls:(BOOL)a3
{
  self->_supportsDisplayingFaceTimeAudioCalls = a3;
}

- (void)setSupportsCellularData:(BOOL)a3
{
  self->_supportsCellularData = a3;
}

- (void)setSupportsBasebandCalling:(BOOL)a3
{
  self->_supportsBasebandCalling = a3;
}

- (void)setSenderIdentityCapabilitiesStateByUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setRelayCallingFeaturesEnabled:(BOOL)a3
{
  self->_relayCallingFeaturesEnabled = a3;
}

- (void)setRelayCallingEnabled:(BOOL)a3
{
  self->_relayCallingEnabled = a3;
}

- (void)setRelayCallingAvailability:(int)a3
{
  self->_relayCallingAvailability = a3;
}

- (void)setFaceTimeVideoAvailable:(BOOL)a3
{
  self->_faceTimeVideoAvailable = a3;
}

- (void)setFaceTimeAudioAvailable:(BOOL)a3
{
  self->_faceTimeAudioAvailable = a3;
}

- (void)setCtCapabilitiesValid:(BOOL)a3
{
  self->_ctCapabilitiesValid = a3;
}

- (void)setAccountsSupportSecondaryCalling:(BOOL)a3
{
  self->_accountsSupportSecondaryCalling = a3;
}

- (void)setAccountsMatchForSecondaryCalling:(BOOL)a3
{
  self->_accountsMatchForSecondaryCalling = a3;
}

- (TUCallCapabilitiesState)init
{
  TUCallCapabilitiesState *v2;
  TUCallCapabilitiesState *v3;
  NSArray *cloudCallingDevices;
  NSDictionary *relayCallingDisabledForDeviceID;
  NSDictionary *v6;
  NSDictionary *senderIdentityCapabilitiesStateByUUID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUCallCapabilitiesState;
  v2 = -[TUCallCapabilitiesState init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    cloudCallingDevices = v2->_cloudCallingDevices;
    v2->_cloudCallingDevices = (NSArray *)MEMORY[0x1E0C9AA60];

    relayCallingDisabledForDeviceID = v3->_relayCallingDisabledForDeviceID;
    v6 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v3->_relayCallingDisabledForDeviceID = (NSDictionary *)MEMORY[0x1E0C9AA70];

    senderIdentityCapabilitiesStateByUUID = v3->_senderIdentityCapabilitiesStateByUUID;
    v3->_senderIdentityCapabilitiesStateByUUID = v6;

  }
  return v3;
}

- (void)setRelayCallingDisabledForDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setOutgoingRelayCallerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setEmergencyCallbackPossible:(BOOL)a3
{
  self->_emergencyCallbackPossible = a3;
}

- (void)setEmergencyCallbackModeEnabled:(BOOL)a3
{
  self->_emergencyCallbackModeEnabled = a3;
}

- (void)setCloudCallingDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)supportsDisplayingFaceTimeAudioCalls
{
  return self->_supportsDisplayingFaceTimeAudioCalls;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)publiclyAccessibleCopy
{
  return -[TUCallCapabilitiesState publiclyAccessibleCopyWithZone:](self, "publiclyAccessibleCopyWithZone:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderIdentityCapabilitiesStateByUUID, 0);
  objc_storeStrong((id *)&self->_cloudCallingDevices, 0);
  objc_storeStrong((id *)&self->_outgoingRelayCallerID, 0);
  objc_storeStrong((id *)&self->_relayCallingDisabledForDeviceID, 0);
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p>\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("Device Capabilities:\n"));
  if (-[TUCallCapabilitiesState supportsPrimaryCalling](self, "supportsPrimaryCalling"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsPrimaryCalling: %@\n"), v4);
  if (-[TUCallCapabilitiesState supportsBasebandCalling](self, "supportsBasebandCalling"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsBasebandCalling: %@\n"), v5);
  if (-[TUCallCapabilitiesState supportsCellularData](self, "supportsCellularData"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsCellularData: %@\n"), v6);
  objc_msgSend(v3, "appendString:", CFSTR("Displaying support:\n"));
  if (-[TUCallCapabilitiesState supportsDisplayingTelephonyCalls](self, "supportsDisplayingTelephonyCalls"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsDisplayingTelephonyCalls: %@\n"), v7);
  if (-[TUCallCapabilitiesState supportsDisplayingFaceTimeAudioCalls](self, "supportsDisplayingFaceTimeAudioCalls"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsDisplayingFaceTimeAudioCalls: %@\n"), v8);
  if (-[TUCallCapabilitiesState supportsDisplayingFaceTimeVideoCalls](self, "supportsDisplayingFaceTimeVideoCalls"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsDisplayingFaceTimeVideoCalls: %@\n"), v9);
  objc_msgSend(v3, "appendString:", CFSTR("Calling Availability:\n"));
  if (-[TUCallCapabilitiesState isFaceTimeAudioAvailable](self, "isFaceTimeAudioAvailable"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    isFaceTimeAudioAvailable: %@\n"), v10);
  if (-[TUCallCapabilitiesState isFaceTimeVideoAvailable](self, "isFaceTimeVideoAvailable"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    isFaceTimeVideoAvailable: %@\n"), v11);
  objc_msgSend(v3, "appendString:", CFSTR("CT Capability Validity:\n"));
  if (-[TUCallCapabilitiesState areCTCapabilitiesValid](self, "areCTCapabilitiesValid"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    areCTCapabilitiesValid: %@\n"), v12);
  objc_msgSend(v3, "appendString:", CFSTR("Secondary calling:\n"));
  if (-[TUCallCapabilitiesState accountsMatchForSecondaryCalling](self, "accountsMatchForSecondaryCalling"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    accountsMatchForSecondaryCalling: %@\n"), v13);
  if (-[TUCallCapabilitiesState accountsSupportSecondaryCalling](self, "accountsSupportSecondaryCalling"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    accountsSupportSecondaryCalling: %@\n"), v14);
  objc_msgSend(v3, "appendString:", CFSTR("Relay calling:\n"));
  if (-[TUCallCapabilitiesState supportsRelayCalling](self, "supportsRelayCalling"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsRelayCalling: %@\n"), v15);
  if (-[TUCallCapabilitiesState areRelayCallingFeaturesEnabled](self, "areRelayCallingFeaturesEnabled"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    areRelayCallingFeaturesEnabled: %@\n"), v16);
  if (-[TUCallCapabilitiesState isRelayCallingEnabled](self, "isRelayCallingEnabled"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    isRelayCallingEnabled: %@\n"), v17);
  objc_msgSend(v3, "appendFormat:", CFSTR("    relayCallingAvailability: %d\n"), -[TUCallCapabilitiesState relayCallingAvailability](self, "relayCallingAvailability"));
  -[TUCallCapabilitiesState relayCallingDisabledForDeviceID](self, "relayCallingDisabledForDeviceID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    relayCallingDisabledForDeviceID: %@\n"), v18);

  objc_msgSend(v3, "appendString:", CFSTR("Outgoing relay calling:\n"));
  if (-[TUCallCapabilitiesState supportsTelephonyRelayCalling](self, "supportsTelephonyRelayCalling"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsTelephonyRelayCalling: %@\n"), v19);
  if (-[TUCallCapabilitiesState supportsFaceTimeAudioRelayCalling](self, "supportsFaceTimeAudioRelayCalling"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsFaceTimeAudioRelayCalling: %@\n"), v20);
  if (-[TUCallCapabilitiesState supportsFaceTimeVideoRelayCalling](self, "supportsFaceTimeVideoRelayCalling"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    supportsFaceTimeVideoRelayCalling: %@\n"), v21);
  -[TUCallCapabilitiesState outgoingRelayCallerID](self, "outgoingRelayCallerID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    outgoingRelayCallerID: %@\n"), v22);

  objc_msgSend(v3, "appendString:", CFSTR("Devices:\n"));
  -[TUCallCapabilitiesState cloudCallingDevices](self, "cloudCallingDevices");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    cloudCallingDevices: %@\n"), v23);

  objc_msgSend(v3, "appendString:", CFSTR("Emergency callback:\n"));
  if (-[TUCallCapabilitiesState isEmergencyCallbackModeEnabled](self, "isEmergencyCallbackModeEnabled"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    emergencyCallbackModeEnabled: %@\n"), v24);
  if (-[TUCallCapabilitiesState isEmergencyCallbackPossible](self, "isEmergencyCallbackPossible"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("    emergencyCallbackPossible: %@\n"), v25);
  objc_msgSend(v3, "appendString:", CFSTR("Sender Identity capabilities:\n"));
  -[TUCallCapabilitiesState senderIdentityCapabilitiesStateByUUID](self, "senderIdentityCapabilitiesStateByUUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    senderIdentityCapabilitiesStateByUUID: %@\n"), v26);

  return (NSString *)v3;
}

- (TUCloudCallingDevice)defaultPairedDevice
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TUCallCapabilitiesState cloudCallingDevices](self, "cloudCallingDevices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isDefaultPairedDevice"))
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (TUCloudCallingDevice *)v3;
}

@end
