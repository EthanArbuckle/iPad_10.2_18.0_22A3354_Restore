@implementation IPCGuidanceStateReply

- (id)uniqueIdForBannerType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply maneuverUniqueId](self, "maneuverUniqueId", v3, v4));
      break;
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply trafficAlertUniqueId](self, "trafficAlertUniqueId", v3, v4));
      break;
    case 2uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply transitAlightUniqueId](self, "transitAlightUniqueId", v3, v4));
      break;
    case 3uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply transitDestinationUniqueId](self, "transitDestinationUniqueId", v3, v4));
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)maneuverUniqueId
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply maneuverID](self, "maneuverID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ManeuverBannerItem-%@"), v3));

  return v4;
}

- (id)trafficAlertUniqueId
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply trafficIncidentAlert](self, "trafficIncidentAlert"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TrafficAlertBannerItem-%@"), v3));

  return v4;
}

- (id)transitAlightUniqueId
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply alightMessage](self, "alightMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TransitAlightBannerItem-%@"), v3));

  return v4;
}

- (id)transitDestinationUniqueId
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TransitDestinationBannerItem-"));
}

- (BOOL)shouldExpandForSpokenEventFromGuidanceUpdate:(id)a3 forType:(unint64_t)a4
{
  id v6;
  int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = SBUIIsSystemApertureEnabled(v6);
  LOBYTE(v8) = 0;
  if (!a4 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentSpokenEventID"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply currentSpokenEventID](self, "currentSpokenEventID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentSpokenEventID"));
      v8 = objc_msgSend(v10, "isEqual:", v11) ^ 1;

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  return v8;
}

- (BOOL)shouldPresentNextGuidanceUpdate:(id)a3 forType:(unint64_t)a4 target:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  id v33;

  v8 = a3;
  v9 = a5;
  if (a4 == 2)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply alightMessage](self, "alightMessage"));
    v20 = objc_msgSend(v19, "stopIndex");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alightMessage"));
    if (v20 == objc_msgSend(v21, "stopIndex"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply alightMessage](self, "alightMessage"));
      self = (IPCGuidanceStateReply *)objc_msgSend(v22, "stepIndex");
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alightMessage"));
      LOBYTE(self) = self != objc_msgSend(v23, "stepIndex");

    }
    else
    {
      LOBYTE(self) = 1;
    }
  }
  else
  {
    if (a4 != 1)
    {
      if (!a4)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply maneuverID](self, "maneuverID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply maneuverUniqueId](self, "maneuverUniqueId"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "maneuverUniqueId"));
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if (!v14)
          {
LABEL_34:
            LOBYTE(self) = 1;
            goto LABEL_36;
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply laneGuidanceInfo](self, "laneGuidanceInfo"));
          if (!v15)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "laneGuidanceInfo"));
            if (v24)
            {

              goto LABEL_34;
            }
          }
          v16 = objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply laneGuidanceInfo](self, "laneGuidanceInfo"));
          if (v16)
          {
            v17 = (void *)v16;
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "laneGuidanceInfo"));

            if (v15)
            if (!v18)
              goto LABEL_34;
          }
          else if (v15)
          {

          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply laneGuidanceInfo](self, "laneGuidanceInfo"));
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "laneInfoId"));
          if (v26)
          {
            v27 = (void *)v26;
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply laneGuidanceInfo](self, "laneGuidanceInfo"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "laneInfoId"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "laneGuidanceInfo"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "laneInfoId"));
            v32 = objc_msgSend(v29, "isEqual:", v31);

            if (!v32)
              goto LABEL_34;
          }
          else
          {

          }
          v33 = objc_msgSend(v8, "isAlerting");
          if ((_DWORD)v33 && (!SBUIIsSystemApertureEnabled(v33) || objc_msgSend(v9, "destination"))
            || -[IPCGuidanceStateReply isArrived](self, "isArrived")
            && (objc_msgSend(v8, "isParking") & 1) != 0
            || -[IPCGuidanceStateReply isParking](self, "isParking")
            && (objc_msgSend(v8, "isArrived") & 1) != 0
            || -[IPCGuidanceStateReply isParked](self, "isParked")
            && (objc_msgSend(v8, "isArrived") & 1) != 0)
          {
            goto LABEL_34;
          }
        }
      }
      LOBYTE(self) = 0;
      goto LABEL_36;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply trafficAlertUniqueId](self, "trafficAlertUniqueId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trafficAlertUniqueId"));
    LODWORD(self) = objc_msgSend(v19, "isEqualToString:", v21) ^ 1;
  }

LABEL_36:
  return (char)self;
}

- (id)maneuverGuidanceInfo
{
  void *v3;
  void *v4;
  GuidanceManeuverArtwork *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  GuidanceManeuverArtwork *v10;
  NavSignManeuverGuidanceInfo *v11;
  void *v12;
  void *v13;
  void *v14;
  NavSignManeuverGuidanceInfo *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply shieldInfo](self, "shieldInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shieldInfo"));

  v5 = [GuidanceManeuverArtwork alloc];
  v6 = -[IPCGuidanceStateReply maneuver](self, "maneuver");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply junction](self, "junction"));
  v8 = -[IPCGuidanceStateReply drivingSide](self, "drivingSide");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply artworkOverride](self, "artworkOverride"));
  v10 = -[GuidanceManeuverArtwork initWithManeuver:junction:drivingSide:artworkDataSource:](v5, "initWithManeuver:junction:drivingSide:artworkDataSource:", v6, v7, v8, v9);

  v11 = [NavSignManeuverGuidanceInfo alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply maneuverID](self, "maneuverID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply primaryInstructions](self, "primaryInstructions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply secondaryInstructions](self, "secondaryInstructions"));
  v15 = -[NavSignManeuverGuidanceInfo initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:](v11, "initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:", v12, v10, v13, v14, v4);

  return v15;
}

- (IPCGuidanceStateReply)initWithDictionary:(id)a3
{
  id v4;
  IPCGuidanceStateReply *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  IPCTrafficIncidentAlertMessage *v11;
  void *v12;
  IPCTrafficIncidentAlertMessage *v13;
  NSString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  TransitAlightMessage *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  IPCShieldInfoMessage *v24;
  void *v25;
  IPCShieldInfoMessage *v26;
  void *v27;
  IPCLaneGuidanceInfoReply *v28;
  void *v29;
  IPCLaneGuidanceInfoReply *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  NSString *v43;
  Class v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  IPCGuidanceStateReply *v84;
  objc_super v86;
  id v87;

  v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)IPCGuidanceStateReply;
  v5 = -[IPCMessageObject initWithDictionary:](&v86, "initWithDictionary:", v4);
  if (!v5)
    goto LABEL_32;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyGuidanceStateKey")));
  -[IPCGuidanceStateReply setGuidanceState:](v5, "setGuidanceState:", objc_msgSend(v6, "unsignedIntegerValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyNavigationStateKey")));
  -[IPCGuidanceStateReply setNavigationState:](v5, "setNavigationState:", objc_msgSend(v7, "unsignedIntegerValue"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyAffectsDimmingKey")));
  -[IPCGuidanceStateReply setAffectsDimming:](v5, "setAffectsDimming:", objc_msgSend(v8, "BOOLValue"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyTransportTypeKey")));
  -[IPCGuidanceStateReply setTransportType:](v5, "setTransportType:", objc_msgSend(v9, "integerValue"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyTrafficIncidentAlertKey")));
  if (v10)
  {
    v11 = [IPCTrafficIncidentAlertMessage alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyTrafficIncidentAlertKey")));
    v13 = -[IPCTrafficIncidentAlertMessage initWithDictionary:](v11, "initWithDictionary:", v12);
    -[IPCGuidanceStateReply setTrafficIncidentAlert:](v5, "setTrafficIncidentAlert:", v13);

  }
  v14 = NSStringFromSelector("alightMessage");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v15));

  v17 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
  {
    v18 = -[TransitAlightMessage initWithDictionary:]([TransitAlightMessage alloc], "initWithDictionary:", v16);
    -[IPCGuidanceStateReply setAlightMessage:](v5, "setAlightMessage:", v18);

  }
  v19 = sub_1009E3F9C(v4, (uint64_t)CFSTR("kIPCGuidanceStateReplyPrimaryInstructionsKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[IPCGuidanceStateReply setPrimaryInstructions:](v5, "setPrimaryInstructions:", v20);

  v21 = sub_1009E3F9C(v4, (uint64_t)CFSTR("kIPCGuidanceStateReplySecondaryInstructionsKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[IPCGuidanceStateReply setSecondaryInstructions:](v5, "setSecondaryInstructions:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyShieldInfoKey")));
  if (v23)
  {
    v24 = [IPCShieldInfoMessage alloc];
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyShieldInfoKey")));
    v26 = -[IPCShieldInfoMessage initWithDictionary:](v24, "initWithDictionary:", v25);
    -[IPCGuidanceStateReply setShieldInfo:](v5, "setShieldInfo:", v26);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyLaneGuidanceInfoKey")));

  if (v27)
  {
    v28 = [IPCLaneGuidanceInfoReply alloc];
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyLaneGuidanceInfoKey")));
    v30 = -[IPCLaneGuidanceInfoReply initWithDictionary:](v28, "initWithDictionary:", v29);
    -[IPCGuidanceStateReply setLaneGuidanceInfo:](v5, "setLaneGuidanceInfo:", v30);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyManeuverIDKey")));

  if (v31)
  {
    v32 = objc_alloc((Class)NSUUID);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyManeuverIDKey")));
    v34 = objc_msgSend(v32, "initWithUUIDString:", v33);
    -[IPCGuidanceStateReply setManeuverID:](v5, "setManeuverID:", v34);

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyManeuverKey")));
  -[IPCGuidanceStateReply setManeuver:](v5, "setManeuver:", objc_msgSend(v35, "integerValue"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyDrivingSideKey")));
  -[IPCGuidanceStateReply setDrivingSide:](v5, "setDrivingSide:", objc_msgSend(v36, "integerValue"));

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyJunctionKey")));
  v38 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0)
  {
    v39 = objc_opt_class(MKJunction);
    v87 = 0;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v39, v37, &v87));
    v41 = v87;
    if (!v41)
      goto LABEL_16;
    v42 = v41;

  }
  v40 = 0;
LABEL_16:

  -[IPCGuidanceStateReply setJunction:](v5, "setJunction:", v40);
  v43 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyArtworkOverrideClassKey")));
  v44 = NSClassFromString(v43);

  if (!v44)
    goto LABEL_22;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyArtworkOverrideKey")));
  v46 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v45, v46) & 1) == 0)
    goto LABEL_20;
  v87 = 0;
  v44 = (Class)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v44, v45, &v87));
  v47 = v87;
  if (v47)
  {
    v48 = v47;

LABEL_20:
    v44 = 0;
  }

LABEL_22:
  -[IPCGuidanceStateReply setArtworkOverride:](v5, "setArtworkOverride:", v44);

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyCurrentLegIndexKey")));
  -[IPCGuidanceStateReply setCurrentLegIndex:](v5, "setCurrentLegIndex:", objc_msgSend(v49, "unsignedIntegerValue"));

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyNumberOfLegsKey")));
  -[IPCGuidanceStateReply setNumberOfLegs:](v5, "setNumberOfLegs:", objc_msgSend(v50, "unsignedIntegerValue"));

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyArrivalInfoKey")));
  v52 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v51, v52) & 1) != 0)
  {
    v53 = objc_opt_class(MNArrivalInfo);
    v87 = 0;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v53, v51, &v87));
    v55 = v87;
    if (!v55)
      goto LABEL_26;
    v56 = v55;

  }
  v54 = 0;
LABEL_26:

  -[IPCGuidanceStateReply setArrivalInfo:](v5, "setArrivalInfo:", v54);
  v57 = objc_opt_class(NSDate);
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplySceneDeactivationDateKey")));
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v57, v58, 0));
  -[IPCGuidanceStateReply setLastSceneDeactivationTime:](v5, "setLastSceneDeactivationTime:", v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyIsAlertingKey")));
  -[IPCGuidanceStateReply setIsAlerting:](v5, "setIsAlerting:", objc_msgSend(v60, "BOOLValue"));

  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyIsReroutingKey")));
  -[IPCGuidanceStateReply setIsRerouting:](v5, "setIsRerouting:", objc_msgSend(v61, "BOOLValue"));

  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyCurrentSpokenEventID")));
  if (v62)
  {
    v63 = objc_alloc((Class)NSUUID);
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyCurrentSpokenEventID")));
    v65 = objc_msgSend(v63, "initWithUUIDString:", v64);
    -[IPCGuidanceStateReply setCurrentSpokenEventID:](v5, "setCurrentSpokenEventID:", v65);

  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyIsStickyKey")));
  -[IPCGuidanceStateReply setIsSticky:](v5, "setIsSticky:", objc_msgSend(v66, "BOOLValue"));

  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyShowInMainScreenKey")));
  -[IPCGuidanceStateReply setShowInMainScreen:](v5, "setShowInMainScreen:", objc_msgSend(v67, "BOOLValue"));

  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyShowInCarPlayKey")));
  -[IPCGuidanceStateReply setShowInCarPlay:](v5, "setShowInCarPlay:", objc_msgSend(v68, "BOOLValue"));

  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyIsMapsForegroundOnMainScreen")));
  -[IPCGuidanceStateReply setIsMapsForegroundOnMainScreen:](v5, "setIsMapsForegroundOnMainScreen:", objc_msgSend(v69, "BOOLValue"));

  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyRouteDataKey")));
  -[IPCGuidanceStateReply setLegacyRouteData:](v5, "setLegacyRouteData:", v70);

  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyOriginalWaypointRouteDataKey")));
  -[IPCGuidanceStateReply setOriginalWaypointRouteData:](v5, "setOriginalWaypointRouteData:", v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyETAFilterDataKey")));
  -[IPCGuidanceStateReply setEtaFilterData:](v5, "setEtaFilterData:", v72);

  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyIncidentsOnRouteDataKey")));
  -[IPCGuidanceStateReply setIncidentsOnRouteData:](v5, "setIncidentsOnRouteData:", v73);

  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyIncidentsOnRouteOffsetsKey")));
  -[IPCGuidanceStateReply setIncidentsOnRouteOffsets:](v5, "setIncidentsOnRouteOffsets:", v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyIsNavigatingKey")));
  -[IPCGuidanceStateReply setIsNavigating:](v5, "setIsNavigating:", objc_msgSend(v75, "BOOLValue"));

  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyNavVolumeSettingKey")));
  -[IPCGuidanceStateReply setNavVolumeSetting:](v5, "setNavVolumeSetting:", v76);

  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyNavSessionDataKey")));
  -[IPCGuidanceStateReply setNavSessionData:](v5, "setNavSessionData:", v77);

  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyDistanceKey")));
  -[IPCGuidanceStateReply setDistance:](v5, "setDistance:", v78);

  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyRemainingDistanceOnRouteKey")));
  -[IPCGuidanceStateReply setRemainingDistanceOnRoute:](v5, "setRemainingDistanceOnRoute:", v79);

  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyRemainingMinutesOnRouteKey")));
  -[IPCGuidanceStateReply setRemainingMinutesOnRoute:](v5, "setRemainingMinutesOnRoute:", v80);

  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyTimeToNextManeuverKey")));
  -[IPCGuidanceStateReply setTimeToNextManeuver:](v5, "setTimeToNextManeuver:", v81);

  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateReplyEvChargingMetadataKey")));
  -[IPCGuidanceStateReply setEvChargingMetadata:](v5, "setEvChargingMetadata:", v82);

  if (!-[IPCGuidanceStateReply maneuver](v5, "maneuver"))
  {

    goto LABEL_32;
  }
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply maneuverID](v5, "maneuverID"));

  if (v83)
  {
LABEL_32:
    v84 = v5;
    goto LABEL_33;
  }
  v84 = 0;
LABEL_33:

  return v84;
}

- (id)dictionaryValue
{
  id v3;
  void *v4;
  id v5;
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
  NSString *v16;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  objc_super v76;

  v76.receiver = self;
  v76.super_class = (Class)IPCGuidanceStateReply;
  v3 = -[IPCMessageObject dictionaryValue](&v76, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCGuidanceStateReply guidanceState](self, "guidanceState")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kIPCGuidanceStateReplyGuidanceStateKey"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCGuidanceStateReply navigationState](self, "navigationState")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kIPCGuidanceStateReplyNavigationStateKey"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply affectsDimming](self, "affectsDimming")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("kIPCGuidanceStateReplyAffectsDimmingKey"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[IPCGuidanceStateReply transportType](self, "transportType")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("kIPCGuidanceStateReplyTransportTypeKey"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply trafficIncidentAlert](self, "trafficIncidentAlert"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply trafficIncidentAlert](self, "trafficIncidentAlert"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dictionaryValue"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("kIPCGuidanceStateReplyTrafficIncidentAlertKey"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply alightMessage](self, "alightMessage"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply alightMessage](self, "alightMessage"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dictionaryValue"));
    v16 = NSStringFromSelector("alightMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply primaryInstructions](self, "primaryInstructions"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply primaryInstructions](self, "primaryInstructions"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, 0));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("kIPCGuidanceStateReplyPrimaryInstructionsKey"));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply secondaryInstructions](self, "secondaryInstructions"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply secondaryInstructions](self, "secondaryInstructions"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, 0));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("kIPCGuidanceStateReplySecondaryInstructionsKey"));

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply shieldInfo](self, "shieldInfo"));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply shieldInfo](self, "shieldInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dictionaryValue"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("kIPCGuidanceStateReplyShieldInfoKey"));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply laneGuidanceInfo](self, "laneGuidanceInfo"));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply laneGuidanceInfo](self, "laneGuidanceInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dictionaryValue"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("kIPCGuidanceStateReplyLaneGuidanceInfoKey"));

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply maneuverID](self, "maneuverID"));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply maneuverID](self, "maneuverID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "UUIDString"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("kIPCGuidanceStateReplyManeuverIDKey"));

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[IPCGuidanceStateReply maneuver](self, "maneuver")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("kIPCGuidanceStateReplyManeuverKey"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[IPCGuidanceStateReply drivingSide](self, "drivingSide")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("kIPCGuidanceStateReplyDrivingSideKey"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply junction](self, "junction"));
  if (v35)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply junction](self, "junction"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v36, 1, 0));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("kIPCGuidanceStateReplyJunctionKey"));

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply artworkOverride](self, "artworkOverride"));

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply artworkOverride](self, "artworkOverride"));
    v40 = (objc_class *)objc_opt_class(v39);
    v41 = NSStringFromClass(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, CFSTR("kIPCGuidanceStateReplyArtworkOverrideClassKey"));

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply artworkOverride](self, "artworkOverride"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v43, 1, 0));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("kIPCGuidanceStateReplyArtworkOverrideKey"));

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCGuidanceStateReply currentLegIndex](self, "currentLegIndex")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("kIPCGuidanceStateReplyCurrentLegIndexKey"));

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCGuidanceStateReply numberOfLegs](self, "numberOfLegs")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v46, CFSTR("kIPCGuidanceStateReplyNumberOfLegsKey"));

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply arrivalInfo](self, "arrivalInfo"));
  if (v47)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply arrivalInfo](self, "arrivalInfo"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v48, 1, 0));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, CFSTR("kIPCGuidanceStateReplyArrivalInfoKey"));

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply lastSceneDeactivationTime](self, "lastSceneDeactivationTime"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v50, 1, 0));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, CFSTR("kIPCGuidanceStateReplySceneDeactivationDateKey"));

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isAlerting](self, "isAlerting")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v52, CFSTR("kIPCGuidanceStateReplyIsAlertingKey"));

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isRerouting](self, "isRerouting")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v53, CFSTR("kIPCGuidanceStateReplyIsReroutingKey"));

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply currentSpokenEventID](self, "currentSpokenEventID"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "UUIDString"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v55, CFSTR("kIPCGuidanceStateReplyCurrentSpokenEventID"));

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isSticky](self, "isSticky")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v56, CFSTR("kIPCGuidanceStateReplyIsStickyKey"));

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply showInMainScreen](self, "showInMainScreen")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v57, CFSTR("kIPCGuidanceStateReplyShowInMainScreenKey"));

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply showInCarPlay](self, "showInCarPlay")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v58, CFSTR("kIPCGuidanceStateReplyShowInCarPlayKey"));

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isMapsForegroundOnMainScreen](self, "isMapsForegroundOnMainScreen")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v59, CFSTR("kIPCGuidanceStateReplyIsMapsForegroundOnMainScreen"));

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply legacyRouteData](self, "legacyRouteData"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v60, CFSTR("kIPCGuidanceStateReplyRouteDataKey"));

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply originalWaypointRouteData](self, "originalWaypointRouteData"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v61, CFSTR("kIPCGuidanceStateReplyOriginalWaypointRouteDataKey"));

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply incidentsOnRouteData](self, "incidentsOnRouteData"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v62, CFSTR("kIPCGuidanceStateReplyIncidentsOnRouteDataKey"));

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply incidentsOnRouteOffsets](self, "incidentsOnRouteOffsets"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v63, CFSTR("kIPCGuidanceStateReplyIncidentsOnRouteOffsetsKey"));

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply etaFilterData](self, "etaFilterData"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v64, CFSTR("kIPCGuidanceStateReplyETAFilterDataKey"));

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isNavigating](self, "isNavigating")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v65, CFSTR("kIPCGuidanceStateReplyIsNavigatingKey"));

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply navVolumeSetting](self, "navVolumeSetting"));
  v67 = objc_msgSend(v66, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v67, CFSTR("kIPCGuidanceStateReplyNavVolumeSettingKey"));

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply navSessionData](self, "navSessionData"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v68, CFSTR("kIPCGuidanceStateReplyNavSessionDataKey"));

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply distance](self, "distance"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v69, CFSTR("kIPCGuidanceStateReplyDistanceKey"));

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply remainingDistanceOnRoute](self, "remainingDistanceOnRoute"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v70, CFSTR("kIPCGuidanceStateReplyRemainingDistanceOnRouteKey"));

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply remainingMinutesOnRoute](self, "remainingMinutesOnRoute"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v71, CFSTR("kIPCGuidanceStateReplyRemainingMinutesOnRouteKey"));

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply timeToNextManeuver](self, "timeToNextManeuver"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v72, CFSTR("kIPCGuidanceStateReplyTimeToNextManeuverKey"));

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply evChargingMetadata](self, "evChargingMetadata"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v73, CFSTR("kIPCGuidanceStateReplyEvChargingMetadataKey"));

  v74 = objc_msgSend(v5, "copy");
  return v74;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_super v53;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply primaryInstructions](self, "primaryInstructions"));
  v4 = sub_10039DCD4(v3, &stru_1011E9F70);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply secondaryInstructions](self, "secondaryInstructions"));
  v6 = sub_10039DCD4(v5, &stru_1011E9F90);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v53.receiver = self;
  v53.super_class = (Class)IPCGuidanceStateReply;
  v7 = -[IPCGuidanceStateReply description](&v53, "description");
  v52 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCGuidanceStateReply guidanceState](self, "guidanceState")));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCGuidanceStateReply navigationState](self, "navigationState")));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply affectsDimming](self, "affectsDimming")));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[IPCGuidanceStateReply transportType](self, "transportType")));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply trafficIncidentAlert](self, "trafficIncidentAlert"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "componentsJoinedByString:", CFSTR(" | ")));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "componentsJoinedByString:", CFSTR(" | ")));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply shieldInfo](self, "shieldInfo"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply maneuverID](self, "maneuverID"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[IPCGuidanceStateReply maneuver](self, "maneuver")));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[IPCGuidanceStateReply drivingSide](self, "drivingSide")));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply junction](self, "junction"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply artworkOverride](self, "artworkOverride"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCGuidanceStateReply currentLegIndex](self, "currentLegIndex")));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCGuidanceStateReply numberOfLegs](self, "numberOfLegs")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isArriving](self, "isArriving")));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isArrived](self, "isArrived")));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isParking](self, "isParking")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isParked](self, "isParked")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply arrivalInfo](self, "arrivalInfo"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isAlerting](self, "isAlerting")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isRerouting](self, "isRerouting")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply currentSpokenEventID](self, "currentSpokenEventID"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isSticky](self, "isSticky")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply showInMainScreen](self, "showInMainScreen")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply showInCarPlay](self, "showInCarPlay")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply navVolumeSetting](self, "navVolumeSetting"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply navSessionData](self, "navSessionData"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply distance](self, "distance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply remainingDistanceOnRoute](self, "remainingDistanceOnRoute"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply remainingMinutesOnRoute](self, "remainingMinutesOnRoute"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateReply isNavigating](self, "isNavigating")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply legacyRouteData](self, "legacyRouteData"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply originalWaypointRouteData](self, "originalWaypointRouteData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply etaFilterData](self, "etaFilterData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply incidentsOnRouteData](self, "incidentsOnRouteData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply incidentsOnRouteOffsets](self, "incidentsOnRouteOffsets"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply timeToNextManeuver](self, "timeToNextManeuver"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply laneGuidanceInfo](self, "laneGuidanceInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply evChargingMetadata](self, "evChargingMetadata"));
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@             guidanceState : {%@}             navigationState : {%@}             affectsDimming : {%@}             transportType : {%@}             trafficIncidentAlert : {%@}             primaryInstructions : [%@]             secondaryInstructions : [%@]             shieldInfo : {%@}             maneuverID : {%@}             maneuver : {%@}             drivingSide : {%@}             junction : {%@}             artworkOverride : {%@}             currentLegIndex : {%@}             numberOfLegs : {%@}             isArriving : {%@}             isArrived : {%@}             isParking : {%@}             isParked : {%@}             arrivalInfo : {%@}             isAlerting : {%@}             isRerouting : {%@}             currentSpokenEventID : {%@}             isSticky : {%@}             showInMainScreen : {%@}             showInCarPlay: {%@}             navVolumeSetting : {%@}             navSessionData : {%@}             distance : {%@}             remainingDistanceOnRoute : {%@}             remainingMinutesOnRoute : {%@}             isNavigating : {%@}             legacyRouteData : {%@}             originalWaypointRouteData : {%@}             etaFilterData: {%@}             incidentsOnRouteData: {%@}             incidentsOnRouteOffsets: {%@}             timeToNextManeuver : {%@}             laneGuidance : {%@}             evChargingMetadata: {%@}"), v52, v51, v50, v49, v48, v47, v46, v45, v44, v43, v42, v41, v35, v40, v39,
                v38,
                v37,
                v36,
                v32,
                v34,
                v20,
                v33,
                v31,
                v19,
                v30,
                v29,
                v28,
                v27,
                v26,
                v25,
                v24,
                v18,
                v8,
                v9,
                v17,
                v10,
                v11,
                v12,
                v13,
                v14,
                v15));

  return v21;
}

- (id)shortDescription
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = -[IPCGuidanceStateReply guidanceState](self, "guidanceState");
  if (v3 >= 5)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("?? - %lu"), v3));
  else
    v4 = *(&off_1011E9FB0 + v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply maneuverID](self, "maneuverID"));
  v6 = -[IPCGuidanceStateReply maneuver](self, "maneuver");
  v7 = CFSTR("NO_TURN");
  switch((int)v6)
  {
    case 0:
      break;
    case 1:
      v7 = CFSTR("LEFT_TURN");
      break;
    case 2:
      v7 = CFSTR("RIGHT_TURN");
      break;
    case 3:
      v7 = CFSTR("STRAIGHT_AHEAD");
      break;
    case 4:
      v7 = CFSTR("U_TURN");
      break;
    case 5:
      v7 = CFSTR("FOLLOW_ROAD");
      break;
    case 6:
      v7 = CFSTR("ENTER_ROUNDABOUT");
      break;
    case 7:
      v7 = CFSTR("EXIT_ROUNDABOUT");
      break;
    case 11:
      v7 = CFSTR("OFF_RAMP");
      break;
    case 12:
      v7 = CFSTR("ON_RAMP");
      break;
    case 16:
      v7 = CFSTR("ARRIVE_END_OF_NAVIGATION");
      break;
    case 17:
      v7 = CFSTR("START_ROUTE");
      break;
    case 18:
      v7 = CFSTR("ARRIVE_AT_DESTINATION");
      break;
    case 20:
      v7 = CFSTR("KEEP_LEFT");
      break;
    case 21:
      v7 = CFSTR("KEEP_RIGHT");
      break;
    case 22:
      v7 = CFSTR("ENTER_FERRY");
      break;
    case 23:
      v7 = CFSTR("EXIT_FERRY");
      break;
    case 24:
      v7 = CFSTR("CHANGE_FERRY");
      break;
    case 25:
      v7 = CFSTR("START_ROUTE_WITH_U_TURN");
      break;
    case 26:
      v7 = CFSTR("U_TURN_AT_ROUNDABOUT");
      break;
    case 27:
      v7 = CFSTR("LEFT_TURN_AT_END");
      break;
    case 28:
      v7 = CFSTR("RIGHT_TURN_AT_END");
      break;
    case 29:
      v7 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
      break;
    case 30:
      v7 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
      break;
    case 33:
      v7 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
      break;
    case 34:
      v7 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
      break;
    case 35:
      v7 = CFSTR("U_TURN_WHEN_POSSIBLE");
      break;
    case 39:
      v7 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
      break;
    case 41:
      v7 = CFSTR("ROUNDABOUT_EXIT_1");
      break;
    case 42:
      v7 = CFSTR("ROUNDABOUT_EXIT_2");
      break;
    case 43:
      v7 = CFSTR("ROUNDABOUT_EXIT_3");
      break;
    case 44:
      v7 = CFSTR("ROUNDABOUT_EXIT_4");
      break;
    case 45:
      v7 = CFSTR("ROUNDABOUT_EXIT_5");
      break;
    case 46:
      v7 = CFSTR("ROUNDABOUT_EXIT_6");
      break;
    case 47:
      v7 = CFSTR("ROUNDABOUT_EXIT_7");
      break;
    case 48:
      v7 = CFSTR("ROUNDABOUT_EXIT_8");
      break;
    case 49:
      v7 = CFSTR("ROUNDABOUT_EXIT_9");
      break;
    case 50:
      v7 = CFSTR("ROUNDABOUT_EXIT_10");
      break;
    case 51:
      v7 = CFSTR("ROUNDABOUT_EXIT_11");
      break;
    case 52:
      v7 = CFSTR("ROUNDABOUT_EXIT_12");
      break;
    case 53:
      v7 = CFSTR("ROUNDABOUT_EXIT_13");
      break;
    case 54:
      v7 = CFSTR("ROUNDABOUT_EXIT_14");
      break;
    case 55:
      v7 = CFSTR("ROUNDABOUT_EXIT_15");
      break;
    case 56:
      v7 = CFSTR("ROUNDABOUT_EXIT_16");
      break;
    case 57:
      v7 = CFSTR("ROUNDABOUT_EXIT_17");
      break;
    case 58:
      v7 = CFSTR("ROUNDABOUT_EXIT_18");
      break;
    case 59:
      v7 = CFSTR("ROUNDABOUT_EXIT_19");
      break;
    case 60:
      v7 = CFSTR("SHARP_LEFT_TURN");
      break;
    case 61:
      v7 = CFSTR("SHARP_RIGHT_TURN");
      break;
    case 62:
      v7 = CFSTR("SLIGHT_LEFT_TURN");
      break;
    case 63:
      v7 = CFSTR("SLIGHT_RIGHT_TURN");
      break;
    case 64:
      v7 = CFSTR("CHANGE_HIGHWAY");
      break;
    case 65:
      v7 = CFSTR("CHANGE_HIGHWAY_LEFT");
      break;
    case 66:
      v7 = CFSTR("CHANGE_HIGHWAY_RIGHT");
      break;
    case 80:
      v7 = CFSTR("TOLL_STATION");
      break;
    case 81:
      v7 = CFSTR("ENTER_TUNNEL");
      break;
    case 82:
      v7 = CFSTR("WAYPOINT_STOP");
      break;
    case 83:
      v7 = CFSTR("WAYPOINT_STOP_LEFT");
      break;
    case 84:
      v7 = CFSTR("WAYPOINT_STOP_RIGHT");
      break;
    case 85:
      v7 = CFSTR("RESUME_ROUTE");
      break;
    case 86:
      v7 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
      break;
    case 87:
      v7 = CFSTR("CUSTOM");
      break;
    case 88:
      v7 = CFSTR("TURN_AROUND");
      break;
    default:
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v6));
      break;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply distance](self, "distance"));
  objc_msgSend(v8, "doubleValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ | ID:%@: %@ in %#.1lfm | alert: %d | MainScreen:%d | Car:%d"), v4, v5, v7, v9, -[IPCGuidanceStateReply isAlerting](self, "isAlerting"), -[IPCGuidanceStateReply showInMainScreen](self, "showInMainScreen"), -[IPCGuidanceStateReply showInCarPlay](self, "showInCarPlay")));

  return v10;
}

- (BOOL)isInArrivalState
{
  if (-[IPCGuidanceStateReply isArriving](self, "isArriving"))
    return 1;
  else
    return -[IPCGuidanceStateReply isArrived](self, "isArrived");
}

- (BOOL)isArriving
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply arrivalInfo](self, "arrivalInfo"));
  v3 = objc_msgSend(v2, "arrivalState") == (id)2;

  return v3;
}

- (BOOL)isArrived
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply arrivalInfo](self, "arrivalInfo"));
  if (objc_msgSend(v3, "arrivalState") == (id)4)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply arrivalInfo](self, "arrivalInfo"));
    v4 = objc_msgSend(v5, "arrivalState") == (id)3;

  }
  return v4;
}

- (BOOL)isInParkingState
{
  if (-[IPCGuidanceStateReply isParking](self, "isParking"))
    return 1;
  else
    return -[IPCGuidanceStateReply isParked](self, "isParked");
}

- (BOOL)isParking
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply arrivalInfo](self, "arrivalInfo"));
  if (objc_msgSend(v3, "arrivalState") == (id)5)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply arrivalInfo](self, "arrivalInfo"));
    v4 = objc_msgSend(v5, "arrivalState") == (id)6;

  }
  return v4;
}

- (BOOL)isParked
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply arrivalInfo](self, "arrivalInfo"));
  v3 = objc_msgSend(v2, "arrivalState") == (id)1;

  return v3;
}

- (unint64_t)guidanceState
{
  return self->_guidanceState;
}

- (void)setGuidanceState:(unint64_t)a3
{
  self->_guidanceState = a3;
}

- (BOOL)affectsDimming
{
  return self->_affectsDimming;
}

- (void)setAffectsDimming:(BOOL)a3
{
  self->_affectsDimming = a3;
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (IPCTrafficIncidentAlertMessage)trafficIncidentAlert
{
  return self->_trafficIncidentAlert;
}

- (void)setTrafficIncidentAlert:(id)a3
{
  objc_storeStrong((id *)&self->_trafficIncidentAlert, a3);
}

- (TransitAlightMessage)alightMessage
{
  return self->_alightMessage;
}

- (void)setAlightMessage:(id)a3
{
  objc_storeStrong((id *)&self->_alightMessage, a3);
}

- (NSArray)primaryInstructions
{
  return self->_primaryInstructions;
}

- (void)setPrimaryInstructions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)secondaryInstructions
{
  return self->_secondaryInstructions;
}

- (void)setSecondaryInstructions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (IPCShieldInfoMessage)shieldInfo
{
  return self->_shieldInfo;
}

- (void)setShieldInfo:(id)a3
{
  objc_storeStrong((id *)&self->_shieldInfo, a3);
}

- (IPCLaneGuidanceInfoReply)laneGuidanceInfo
{
  return self->_laneGuidanceInfo;
}

- (void)setLaneGuidanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidanceInfo, a3);
}

- (NSUUID)maneuverID
{
  return self->_maneuverID;
}

- (void)setManeuverID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int)maneuver
{
  return self->_maneuver;
}

- (void)setManeuver:(int)a3
{
  self->_maneuver = a3;
}

- (int)drivingSide
{
  return self->_drivingSide;
}

- (void)setDrivingSide:(int)a3
{
  self->_drivingSide = a3;
}

- (MKJunction)junction
{
  return self->_junction;
}

- (void)setJunction:(id)a3
{
  objc_storeStrong((id *)&self->_junction, a3);
}

- (GEOTransitArtworkDataSource)artworkOverride
{
  return self->_artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  objc_storeStrong((id *)&self->_artworkOverride, a3);
}

- (MNArrivalInfo)arrivalInfo
{
  return self->_arrivalInfo;
}

- (void)setArrivalInfo:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalInfo, a3);
}

- (unint64_t)currentLegIndex
{
  return self->_currentLegIndex;
}

- (void)setCurrentLegIndex:(unint64_t)a3
{
  self->_currentLegIndex = a3;
}

- (unint64_t)numberOfLegs
{
  return self->_numberOfLegs;
}

- (void)setNumberOfLegs:(unint64_t)a3
{
  self->_numberOfLegs = a3;
}

- (NSDate)lastSceneDeactivationTime
{
  return self->_lastSceneDeactivationTime;
}

- (void)setLastSceneDeactivationTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastSceneDeactivationTime, a3);
}

- (BOOL)isAlerting
{
  return self->_isAlerting;
}

- (void)setIsAlerting:(BOOL)a3
{
  self->_isAlerting = a3;
}

- (BOOL)isRerouting
{
  return self->_isRerouting;
}

- (void)setIsRerouting:(BOOL)a3
{
  self->_isRerouting = a3;
}

- (NSUUID)currentSpokenEventID
{
  return self->_currentSpokenEventID;
}

- (void)setCurrentSpokenEventID:(id)a3
{
  objc_storeStrong((id *)&self->_currentSpokenEventID, a3);
}

- (BOOL)isSticky
{
  return self->_isSticky;
}

- (void)setIsSticky:(BOOL)a3
{
  self->_isSticky = a3;
}

- (BOOL)showInMainScreen
{
  return self->_showInMainScreen;
}

- (void)setShowInMainScreen:(BOOL)a3
{
  self->_showInMainScreen = a3;
}

- (BOOL)showInCarPlay
{
  return self->_showInCarPlay;
}

- (void)setShowInCarPlay:(BOOL)a3
{
  self->_showInCarPlay = a3;
}

- (BOOL)isMapsForegroundOnMainScreen
{
  return self->_isMapsForegroundOnMainScreen;
}

- (void)setIsMapsForegroundOnMainScreen:(BOOL)a3
{
  self->_isMapsForegroundOnMainScreen = a3;
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (void)setIsNavigating:(BOOL)a3
{
  self->_isNavigating = a3;
}

- (NSData)legacyRouteData
{
  return self->_legacyRouteData;
}

- (void)setLegacyRouteData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSData)originalWaypointRouteData
{
  return self->_originalWaypointRouteData;
}

- (void)setOriginalWaypointRouteData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unint64_t)navigationState
{
  return self->_navigationState;
}

- (void)setNavigationState:(unint64_t)a3
{
  self->_navigationState = a3;
}

- (NSData)etaFilterData
{
  return self->_etaFilterData;
}

- (void)setEtaFilterData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)incidentsOnRouteData
{
  return self->_incidentsOnRouteData;
}

- (void)setIncidentsOnRouteData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)incidentsOnRouteOffsets
{
  return self->_incidentsOnRouteOffsets;
}

- (void)setIncidentsOnRouteOffsets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSData)evChargingMetadata
{
  return self->_evChargingMetadata;
}

- (void)setEvChargingMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)navVolumeSetting
{
  return self->_navVolumeSetting;
}

- (void)setNavVolumeSetting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSData)navSessionData
{
  return self->_navSessionData;
}

- (void)setNavSessionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)remainingDistanceOnRoute
{
  return self->_remainingDistanceOnRoute;
}

- (void)setRemainingDistanceOnRoute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSNumber)remainingMinutesOnRoute
{
  return self->_remainingMinutesOnRoute;
}

- (void)setRemainingMinutesOnRoute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)timeToNextManeuver
{
  return self->_timeToNextManeuver;
}

- (void)setTimeToNextManeuver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToNextManeuver, 0);
  objc_storeStrong((id *)&self->_remainingMinutesOnRoute, 0);
  objc_storeStrong((id *)&self->_remainingDistanceOnRoute, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_navSessionData, 0);
  objc_storeStrong((id *)&self->_navVolumeSetting, 0);
  objc_storeStrong((id *)&self->_evChargingMetadata, 0);
  objc_storeStrong((id *)&self->_incidentsOnRouteOffsets, 0);
  objc_storeStrong((id *)&self->_incidentsOnRouteData, 0);
  objc_storeStrong((id *)&self->_etaFilterData, 0);
  objc_storeStrong((id *)&self->_originalWaypointRouteData, 0);
  objc_storeStrong((id *)&self->_legacyRouteData, 0);
  objc_storeStrong((id *)&self->_currentSpokenEventID, 0);
  objc_storeStrong((id *)&self->_lastSceneDeactivationTime, 0);
  objc_storeStrong((id *)&self->_arrivalInfo, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_junction, 0);
  objc_storeStrong((id *)&self->_maneuverID, 0);
  objc_storeStrong((id *)&self->_laneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_shieldInfo, 0);
  objc_storeStrong((id *)&self->_secondaryInstructions, 0);
  objc_storeStrong((id *)&self->_primaryInstructions, 0);
  objc_storeStrong((id *)&self->_alightMessage, 0);
  objc_storeStrong((id *)&self->_trafficIncidentAlert, 0);
}

@end
