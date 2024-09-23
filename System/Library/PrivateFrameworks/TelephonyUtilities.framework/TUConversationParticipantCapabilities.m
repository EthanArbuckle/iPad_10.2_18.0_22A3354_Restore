@implementation TUConversationParticipantCapabilities

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" momentsAvailable=%d"), -[TUConversationParticipantCapabilities isMomentsAvailable](self, "isMomentsAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" screenSharingAvailable=%d"), -[TUConversationParticipantCapabilities isScreenSharingAvailable](self, "isScreenSharingAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" gondolaCallingAvailable=%d"), -[TUConversationParticipantCapabilities isGondolaCallingAvailable](self, "isGondolaCallingAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" personaAvailable=%d"), -[TUConversationParticipantCapabilities isPersonaAvailable](self, "isPersonaAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" gftDowngradeToOneToOneAvailable=%d"), -[TUConversationParticipantCapabilities isGFTDowngradeToOneToOneAvailable](self, "isGFTDowngradeToOneToOneAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" uPlusNDowngradeAvailable=%d"), -[TUConversationParticipantCapabilities isUPlusNDowngradeAvailable](self, "isUPlusNDowngradeAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" uPlusScreenShareAvailable=%d"), -[TUConversationParticipantCapabilities isUPlusOneScreenShareAvailable](self, "isUPlusOneScreenShareAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" uPlusOneAVLessAvailable=%d"), -[TUConversationParticipantCapabilities isUPlusOneAVLessAvailable](self, "isUPlusOneAVLessAvailable"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TUConversationParticipantCapabilities sharePlayProtocolVersion](self, "sharePlayProtocolVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sharePlayProtocolVersion=%@"), v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TUConversationParticipantCapabilities supportsLeaveContext](self, "supportsLeaveContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsLeaveContext=%@"), v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TUConversationParticipantCapabilities supportsRequestToScreenShare](self, "supportsRequestToScreenShare"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsRequestToScreenShare=%@"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TUConversationParticipantCapabilities visionFeatureVersion](self, "visionFeatureVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" visionFeatureVersion=%@"), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TUConversationParticipantCapabilities visionCallEstablishmentVersion](self, "visionCallEstablishmentVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" visionCallEstablishmentVersion=%@"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(" uPlusOneVisionToVisionAvailable=%d"), -[TUConversationParticipantCapabilities isUPlusOneVisionToVisionAvailable](self, "isUPlusOneVisionToVisionAvailable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" photosSharePlayAvailable=%d"), -[TUConversationParticipantCapabilities isPhotosSharePlayAvailable](self, "isPhotosSharePlayAvailable"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationParticipantCapabilities isEqualToCapabilities:](self, "isEqualToCapabilities:", v4);

  return v5;
}

- (BOOL)isEqualToCapabilities:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unint64_t v11;
  int v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  int v18;
  _BOOL4 v20;

  v4 = a3;
  v5 = -[TUConversationParticipantCapabilities isMomentsAvailable](self, "isMomentsAvailable");
  if (v5 != objc_msgSend(v4, "isMomentsAvailable"))
    goto LABEL_14;
  v6 = -[TUConversationParticipantCapabilities isScreenSharingAvailable](self, "isScreenSharingAvailable");
  if (v6 != objc_msgSend(v4, "isScreenSharingAvailable"))
    goto LABEL_14;
  v7 = -[TUConversationParticipantCapabilities isGondolaCallingAvailable](self, "isGondolaCallingAvailable");
  if (v7 != objc_msgSend(v4, "isGondolaCallingAvailable"))
    goto LABEL_14;
  v8 = -[TUConversationParticipantCapabilities isPersonaAvailable](self, "isPersonaAvailable");
  if (v8 != objc_msgSend(v4, "isPersonaAvailable"))
    goto LABEL_14;
  v9 = -[TUConversationParticipantCapabilities isGFTDowngradeToOneToOneAvailable](self, "isGFTDowngradeToOneToOneAvailable");
  if (v9 != objc_msgSend(v4, "isGFTDowngradeToOneToOneAvailable"))
    goto LABEL_14;
  v10 = -[TUConversationParticipantCapabilities isUPlusNDowngradeAvailable](self, "isUPlusNDowngradeAvailable");
  if (v10 != objc_msgSend(v4, "isUPlusNDowngradeAvailable"))
    goto LABEL_14;
  v11 = -[TUConversationParticipantCapabilities sharePlayProtocolVersion](self, "sharePlayProtocolVersion");
  if (v11 == objc_msgSend(v4, "sharePlayProtocolVersion")
    && (v12 = -[TUConversationParticipantCapabilities supportsLeaveContext](self, "supportsLeaveContext"),
        v12 == objc_msgSend(v4, "supportsLeaveContext"))
    && (v13 = -[TUConversationParticipantCapabilities isUPlusOneAVLessAvailable](self, "isUPlusOneAVLessAvailable"),
        v13 == objc_msgSend(v4, "isUPlusOneAVLessAvailable"))
    && (v14 = -[TUConversationParticipantCapabilities visionFeatureVersion](self, "visionFeatureVersion"),
        v14 == objc_msgSend(v4, "visionFeatureVersion"))
    && (v15 = -[TUConversationParticipantCapabilities visionCallEstablishmentVersion](self, "visionCallEstablishmentVersion"), v15 == objc_msgSend(v4, "visionCallEstablishmentVersion"))&& (v16 = -[TUConversationParticipantCapabilities isUPlusOneVisionToVisionAvailable](self, "isUPlusOneVisionToVisionAvailable"), v16 == objc_msgSend(v4, "isUPlusOneVisionToVisionAvailable"))&& (v17 = -[TUConversationParticipantCapabilities supportsRequestToScreenShare](self, "supportsRequestToScreenShare"), v17 == objc_msgSend(v4, "supportsRequestToScreenShare")))
  {
    v20 = -[TUConversationParticipantCapabilities isPhotosSharePlayAvailable](self, "isPhotosSharePlayAvailable");
    v18 = v20 ^ objc_msgSend(v4, "isPhotosSharePlayAvailable") ^ 1;
  }
  else
  {
LABEL_14:
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (-[TUConversationParticipantCapabilities isMomentsAvailable](self, "isMomentsAvailable"))
    v3 = 1231;
  else
    v3 = 1237;
  if (-[TUConversationParticipantCapabilities isScreenSharingAvailable](self, "isScreenSharingAvailable"))
    v4 = 1231;
  else
    v4 = 1237;
  v5 = v4 ^ v3;
  if (-[TUConversationParticipantCapabilities isGondolaCallingAvailable](self, "isGondolaCallingAvailable"))
    v6 = 1231;
  else
    v6 = 1237;
  if (-[TUConversationParticipantCapabilities isPersonaAvailable](self, "isPersonaAvailable"))
    v7 = 1231;
  else
    v7 = 1237;
  v8 = v5 ^ v6 ^ v7;
  if (-[TUConversationParticipantCapabilities isGFTDowngradeToOneToOneAvailable](self, "isGFTDowngradeToOneToOneAvailable"))
  {
    v9 = 1231;
  }
  else
  {
    v9 = 1237;
  }
  if (-[TUConversationParticipantCapabilities isUPlusNDowngradeAvailable](self, "isUPlusNDowngradeAvailable"))
    v10 = 1231;
  else
    v10 = 1237;
  v11 = v9 ^ v10;
  if (-[TUConversationParticipantCapabilities isUPlusOneAVLessAvailable](self, "isUPlusOneAVLessAvailable"))
    v12 = 1231;
  else
    v12 = 1237;
  v13 = v8 ^ v11 ^ v12;
  v14 = -[TUConversationParticipantCapabilities sharePlayProtocolVersion](self, "sharePlayProtocolVersion");
  v15 = v14 ^ -[TUConversationParticipantCapabilities visionFeatureVersion](self, "visionFeatureVersion");
  v16 = v15 ^ -[TUConversationParticipantCapabilities visionCallEstablishmentVersion](self, "visionCallEstablishmentVersion");
  if (-[TUConversationParticipantCapabilities isUPlusOneVisionToVisionAvailable](self, "isUPlusOneVisionToVisionAvailable"))
  {
    v17 = 1231;
  }
  else
  {
    v17 = 1237;
  }
  v18 = v16 ^ v17;
  if (-[TUConversationParticipantCapabilities supportsLeaveContext](self, "supportsLeaveContext"))
    v19 = 1231;
  else
    v19 = 1237;
  v20 = v18 ^ v19;
  if (-[TUConversationParticipantCapabilities supportsRequestToScreenShare](self, "supportsRequestToScreenShare"))
    v21 = 1231;
  else
    v21 = 1237;
  v22 = v13 ^ v20 ^ v21;
  if (-[TUConversationParticipantCapabilities isPhotosSharePlayAvailable](self, "isPhotosSharePlayAvailable"))
    v23 = 1231;
  else
    v23 = 1237;
  return v22 ^ v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setScreenSharingAvailable:", -[TUConversationParticipantCapabilities isScreenSharingAvailable](self, "isScreenSharingAvailable"));
  objc_msgSend(v4, "setMomentsAvailable:", -[TUConversationParticipantCapabilities isMomentsAvailable](self, "isMomentsAvailable"));
  objc_msgSend(v4, "setGondolaCallingAvailable:", -[TUConversationParticipantCapabilities isGondolaCallingAvailable](self, "isGondolaCallingAvailable"));
  objc_msgSend(v4, "setPersonaAvailable:", -[TUConversationParticipantCapabilities isPersonaAvailable](self, "isPersonaAvailable"));
  objc_msgSend(v4, "setGftDowngradeToOneToOneAvailable:", -[TUConversationParticipantCapabilities isGFTDowngradeToOneToOneAvailable](self, "isGFTDowngradeToOneToOneAvailable"));
  objc_msgSend(v4, "setUPlusOneScreenShareAvailable:", -[TUConversationParticipantCapabilities isUPlusOneScreenShareAvailable](self, "isUPlusOneScreenShareAvailable"));
  objc_msgSend(v4, "setUPlusOneAVLessAvailable:", -[TUConversationParticipantCapabilities isUPlusOneAVLessAvailable](self, "isUPlusOneAVLessAvailable"));
  objc_msgSend(v4, "setUPlusNDowngradeAvailable:", -[TUConversationParticipantCapabilities isUPlusNDowngradeAvailable](self, "isUPlusNDowngradeAvailable"));
  objc_msgSend(v4, "setSharePlayProtocolVersion:", -[TUConversationParticipantCapabilities sharePlayProtocolVersion](self, "sharePlayProtocolVersion"));
  objc_msgSend(v4, "setVisionFeatureVersion:", -[TUConversationParticipantCapabilities visionFeatureVersion](self, "visionFeatureVersion"));
  objc_msgSend(v4, "setVisionCallEstablishmentVersion:", -[TUConversationParticipantCapabilities visionCallEstablishmentVersion](self, "visionCallEstablishmentVersion"));
  objc_msgSend(v4, "setUPlusOneVisionToVisionAvailable:", -[TUConversationParticipantCapabilities isUPlusOneVisionToVisionAvailable](self, "isUPlusOneVisionToVisionAvailable"));
  objc_msgSend(v4, "setSupportsLeaveContext:", -[TUConversationParticipantCapabilities supportsLeaveContext](self, "supportsLeaveContext"));
  objc_msgSend(v4, "setSupportsRequestToScreenShare:", -[TUConversationParticipantCapabilities supportsRequestToScreenShare](self, "supportsRequestToScreenShare"));
  objc_msgSend(v4, "setPhotosSharePlayAvailable:", -[TUConversationParticipantCapabilities isPhotosSharePlayAvailable](self, "isPhotosSharePlayAvailable"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationParticipantCapabilities)initWithCoder:(id)a3
{
  id v4;
  TUConversationParticipantCapabilities *v5;
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

  v4 = a3;
  v5 = -[TUConversationParticipantCapabilities init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_isMomentsAvailable);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_momentsAvailable = objc_msgSend(v4, "decodeBoolForKey:", v6);

    NSStringFromSelector(sel_isScreenSharingAvailable);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_screenSharingAvailable = objc_msgSend(v4, "decodeBoolForKey:", v7);

    NSStringFromSelector(sel_isGondolaCallingAvailable);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_gondolaCallingAvailable = objc_msgSend(v4, "decodeBoolForKey:", v8);

    NSStringFromSelector(sel_isPersonaAvailable);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_personaAvailable = objc_msgSend(v4, "decodeBoolForKey:", v9);

    NSStringFromSelector(sel_isGFTDowngradeToOneToOneAvailable);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_gftDowngradeToOneToOneAvailable = objc_msgSend(v4, "decodeBoolForKey:", v10);

    NSStringFromSelector(sel_isUPlusNDowngradeAvailable);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_uPlusNDowngradeAvailable = objc_msgSend(v4, "decodeBoolForKey:", v11);

    NSStringFromSelector(sel_sharePlayProtocolVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sharePlayProtocolVersion = objc_msgSend(v4, "decodeIntegerForKey:", v12);

    NSStringFromSelector(sel_visionFeatureVersion);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_visionFeatureVersion = objc_msgSend(v4, "decodeIntegerForKey:", v13);

    NSStringFromSelector(sel_visionCallEstablishmentVersion);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_visionCallEstablishmentVersion = objc_msgSend(v4, "decodeIntegerForKey:", v14);

    NSStringFromSelector(sel_isUPlusOneScreenShareAvailable);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_uPlusOneScreenShareAvailable = objc_msgSend(v4, "decodeBoolForKey:", v15);

    NSStringFromSelector(sel_isUPlusOneAVLessAvailable);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_uPlusOneAVLessAvailable = objc_msgSend(v4, "decodeBoolForKey:", v16);

    NSStringFromSelector(sel_isUPlusOneVisionToVisionAvailable);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_uPlusOneVisionToVisionAvailable = objc_msgSend(v4, "decodeBoolForKey:", v17);

    NSStringFromSelector(sel_supportsLeaveContext);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsLeaveContext = objc_msgSend(v4, "decodeBoolForKey:", v18);

    NSStringFromSelector(sel_supportsRequestToScreenShare);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsRequestToScreenShare = objc_msgSend(v4, "decodeBoolForKey:", v19);

    NSStringFromSelector(sel_isPhotosSharePlayAvailable);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_photosSharePlayAvailable = objc_msgSend(v4, "decodeBoolForKey:", v20);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  _BOOL8 v33;
  id v34;

  v4 = a3;
  v5 = -[TUConversationParticipantCapabilities isMomentsAvailable](self, "isMomentsAvailable");
  NSStringFromSelector(sel_isMomentsAvailable);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

  v7 = -[TUConversationParticipantCapabilities isScreenSharingAvailable](self, "isScreenSharingAvailable");
  NSStringFromSelector(sel_isScreenSharingAvailable);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  v9 = -[TUConversationParticipantCapabilities isGondolaCallingAvailable](self, "isGondolaCallingAvailable");
  NSStringFromSelector(sel_isGondolaCallingAvailable);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

  v11 = -[TUConversationParticipantCapabilities isPersonaAvailable](self, "isPersonaAvailable");
  NSStringFromSelector(sel_isPersonaAvailable);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v11, v12);

  v13 = -[TUConversationParticipantCapabilities isGFTDowngradeToOneToOneAvailable](self, "isGFTDowngradeToOneToOneAvailable");
  NSStringFromSelector(sel_isGFTDowngradeToOneToOneAvailable);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  v15 = -[TUConversationParticipantCapabilities isUPlusOneScreenShareAvailable](self, "isUPlusOneScreenShareAvailable");
  NSStringFromSelector(sel_isUPlusOneScreenShareAvailable);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[TUConversationParticipantCapabilities isUPlusOneAVLessAvailable](self, "isUPlusOneAVLessAvailable");
  NSStringFromSelector(sel_isUPlusOneAVLessAvailable);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[TUConversationParticipantCapabilities isUPlusNDowngradeAvailable](self, "isUPlusNDowngradeAvailable");
  NSStringFromSelector(sel_isUPlusNDowngradeAvailable);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

  v21 = -[TUConversationParticipantCapabilities sharePlayProtocolVersion](self, "sharePlayProtocolVersion");
  NSStringFromSelector(sel_sharePlayProtocolVersion);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v21, v22);

  v23 = -[TUConversationParticipantCapabilities visionFeatureVersion](self, "visionFeatureVersion");
  NSStringFromSelector(sel_visionFeatureVersion);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v23, v24);

  v25 = -[TUConversationParticipantCapabilities visionCallEstablishmentVersion](self, "visionCallEstablishmentVersion");
  NSStringFromSelector(sel_visionCallEstablishmentVersion);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v25, v26);

  v27 = -[TUConversationParticipantCapabilities isUPlusOneVisionToVisionAvailable](self, "isUPlusOneVisionToVisionAvailable");
  NSStringFromSelector(sel_isUPlusOneVisionToVisionAvailable);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v27, v28);

  v29 = -[TUConversationParticipantCapabilities supportsLeaveContext](self, "supportsLeaveContext");
  NSStringFromSelector(sel_supportsLeaveContext);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v29, v30);

  v31 = -[TUConversationParticipantCapabilities supportsRequestToScreenShare](self, "supportsRequestToScreenShare");
  NSStringFromSelector(sel_supportsRequestToScreenShare);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v31, v32);

  v33 = -[TUConversationParticipantCapabilities isPhotosSharePlayAvailable](self, "isPhotosSharePlayAvailable");
  NSStringFromSelector(sel_isPhotosSharePlayAvailable);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v33, v34);

}

- (BOOL)isMomentsAvailable
{
  return self->_momentsAvailable;
}

- (void)setMomentsAvailable:(BOOL)a3
{
  self->_momentsAvailable = a3;
}

- (BOOL)isScreenSharingAvailable
{
  return self->_screenSharingAvailable;
}

- (void)setScreenSharingAvailable:(BOOL)a3
{
  self->_screenSharingAvailable = a3;
}

- (BOOL)isGondolaCallingAvailable
{
  return self->_gondolaCallingAvailable;
}

- (void)setGondolaCallingAvailable:(BOOL)a3
{
  self->_gondolaCallingAvailable = a3;
}

- (BOOL)isPersonaAvailable
{
  return self->_personaAvailable;
}

- (void)setPersonaAvailable:(BOOL)a3
{
  self->_personaAvailable = a3;
}

- (BOOL)isGFTDowngradeToOneToOneAvailable
{
  return self->_gftDowngradeToOneToOneAvailable;
}

- (void)setGftDowngradeToOneToOneAvailable:(BOOL)a3
{
  self->_gftDowngradeToOneToOneAvailable = a3;
}

- (BOOL)isUPlusNDowngradeAvailable
{
  return self->_uPlusNDowngradeAvailable;
}

- (void)setUPlusNDowngradeAvailable:(BOOL)a3
{
  self->_uPlusNDowngradeAvailable = a3;
}

- (BOOL)isUPlusOneScreenShareAvailable
{
  return self->_uPlusOneScreenShareAvailable;
}

- (void)setUPlusOneScreenShareAvailable:(BOOL)a3
{
  self->_uPlusOneScreenShareAvailable = a3;
}

- (BOOL)isUPlusOneAVLessAvailable
{
  return self->_uPlusOneAVLessAvailable;
}

- (void)setUPlusOneAVLessAvailable:(BOOL)a3
{
  self->_uPlusOneAVLessAvailable = a3;
}

- (BOOL)supportsLeaveContext
{
  return self->_supportsLeaveContext;
}

- (void)setSupportsLeaveContext:(BOOL)a3
{
  self->_supportsLeaveContext = a3;
}

- (BOOL)supportsRequestToScreenShare
{
  return self->_supportsRequestToScreenShare;
}

- (void)setSupportsRequestToScreenShare:(BOOL)a3
{
  self->_supportsRequestToScreenShare = a3;
}

- (unint64_t)sharePlayProtocolVersion
{
  return self->_sharePlayProtocolVersion;
}

- (void)setSharePlayProtocolVersion:(unint64_t)a3
{
  self->_sharePlayProtocolVersion = a3;
}

- (unint64_t)visionFeatureVersion
{
  return self->_visionFeatureVersion;
}

- (void)setVisionFeatureVersion:(unint64_t)a3
{
  self->_visionFeatureVersion = a3;
}

- (unint64_t)visionCallEstablishmentVersion
{
  return self->_visionCallEstablishmentVersion;
}

- (void)setVisionCallEstablishmentVersion:(unint64_t)a3
{
  self->_visionCallEstablishmentVersion = a3;
}

- (BOOL)isUPlusOneVisionToVisionAvailable
{
  return self->_uPlusOneVisionToVisionAvailable;
}

- (void)setUPlusOneVisionToVisionAvailable:(BOOL)a3
{
  self->_uPlusOneVisionToVisionAvailable = a3;
}

- (BOOL)isPhotosSharePlayAvailable
{
  return self->_photosSharePlayAvailable;
}

- (void)setPhotosSharePlayAvailable:(BOOL)a3
{
  self->_photosSharePlayAvailable = a3;
}

@end
