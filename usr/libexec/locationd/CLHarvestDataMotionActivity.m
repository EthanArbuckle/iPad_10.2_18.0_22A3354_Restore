@implementation CLHarvestDataMotionActivity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHarvestDataMotionActivity)initWithMotionActivity:(CLMotionActivity *)a3
{
  CLHarvestDataMotionActivity *result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CLHarvestDataMotionActivity;
  result = -[CLHarvestDataMotionActivity init](&v20, "init", a3, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&a9, a4, a10);
  if (result)
  {
    *(_OWORD *)&result->_activity.type = *(_OWORD *)&a3->type;
    v14 = *(_OWORD *)&a3->mountedConfidence;
    v15 = *(_OWORD *)&a3->isStanding;
    v16 = *(_OWORD *)&a3->isVehicleConnected;
    *(_OWORD *)&result->_activity.vehicleType = *(_OWORD *)&a3->vehicleType;
    *(_OWORD *)&result->_activity.isVehicleConnected = v16;
    *(_OWORD *)&result->_activity.isStanding = v15;
    *(_OWORD *)&result->_activity.mountedConfidence = v14;
    v17 = *(_OWORD *)&a3[1].type;
    v18 = *(_OWORD *)&a3[1].mountedConfidence;
    v19 = *(_OWORD *)&a3[1].isStanding;
    result[1]._activity.timestamp = *(double *)&a3[1].isVehicleConnected;
    *(_OWORD *)&result[1]._activity.conservativeMountedProbability = v19;
    *(_OWORD *)&result[1]._activity.source = v18;
    *(_OWORD *)&result[1].super.isa = v17;
  }
  return result;
}

- (CLHarvestDataMotionActivity)initWithCoder:(id)a3
{
  CLHarvestDataMotionActivity *v4;
  float v5;
  double v6;
  double v7;
  objc_class *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLHarvestDataMotionActivity;
  v4 = -[CLHarvestDataMotionActivity init](&v10, "init");
  if (v4)
  {
    v4->_activity.type = objc_msgSend(a3, "decodeIntForKey:", CFSTR("TypeKey"));
    v4->_activity.confidence = objc_msgSend(a3, "decodeIntForKey:", CFSTR("ConfidenceKey"));
    v4->_activity.mountedState = objc_msgSend(a3, "decodeIntForKey:", CFSTR("MountedStateKey"));
    v4->_activity.mountedConfidence = objc_msgSend(a3, "decodeIntForKey:", CFSTR("MountedConfidenceKey"));
    v4->_activity.isStanding = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("StandingKey"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("TiltKey"));
    v4->_activity.tilt = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("TimestampKey"));
    v4->_activity.timestamp = v6;
    v4->_activity.isVehicleConnected = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("VehicleConnectedKey"));
    v4->_activity.exitState = objc_msgSend(a3, "decodeIntForKey:", CFSTR("ExitStateKey"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("ExtExitTimeKey"));
    v4->_activity.estExitTime = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("StartTimeKey"));
    v4[1].super.isa = v8;
    v4[1]._activity.type = objc_msgSend(a3, "decodeIntForKey:", CFSTR("RawTypeKey"));
    v4[1]._activity.confidence = objc_msgSend(a3, "decodeIntForKey:", CFSTR("kRawConfidenceKey"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;

  objc_msgSend(a3, "encodeInt:forKey:", self->_activity.type, CFSTR("TypeKey"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_activity.confidence, CFSTR("ConfidenceKey"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_activity.mountedState, CFSTR("MountedStateKey"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_activity.mountedConfidence, CFSTR("MountedConfidenceKey"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_activity.isStanding, CFSTR("StandingKey"));
  *(float *)&v5 = self->_activity.tilt;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("TiltKey"), v5);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("TimestampKey"), self->_activity.timestamp);
  objc_msgSend(a3, "encodeBool:forKey:", self->_activity.isVehicleConnected, CFSTR("VehicleConnectedKey"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_activity.exitState, CFSTR("ExitStateKey"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("ExtExitTimeKey"), self->_activity.estExitTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("StartTimeKey"), *(double *)&self[1].super.isa);
  objc_msgSend(a3, "encodeInt:forKey:", self[1]._activity.type, CFSTR("RawTypeKey"));
  objc_msgSend(a3, "encodeInt:forKey:", self[1]._activity.confidence, CFSTR("kRawConfidenceKey"));
}

- (CLMotionActivity)activity
{
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v10 = *(_OWORD *)&self[1].source;
  v11 = *(_OWORD *)&self[1].timestamp;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[1].conservativeMountedProbability;
  *(_OWORD *)&retstr[1].isStanding = v11;
  *(double *)&retstr[1].isVehicleConnected = self[1].estExitTime;
  v12 = *(_OWORD *)&self->conservativeMountedProbability;
  v13 = *(_OWORD *)&self->estExitTime;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self->timestamp;
  *(_OWORD *)&retstr->isVehicleConnected = v13;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self->fsmTransitionData.fConsecStatic;
  *(_OWORD *)&retstr[1].type = v10;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self->source;
  *(_OWORD *)&retstr->mountedConfidence = v12;
  return self;
}

- (void)setActivity:(CLMotionActivity *)a3
{
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_OWORD *)&self->_activity.type = *(_OWORD *)&a3->type;
  v12 = *(_OWORD *)&a3->mountedConfidence;
  v13 = *(_OWORD *)&a3->isStanding;
  v14 = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_activity.vehicleType = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_activity.isVehicleConnected = v14;
  *(_OWORD *)&self->_activity.isStanding = v13;
  *(_OWORD *)&self->_activity.mountedConfidence = v12;
  v15 = *(_OWORD *)&a3[1].type;
  v16 = *(_OWORD *)&a3[1].mountedConfidence;
  v17 = *(_OWORD *)&a3[1].isStanding;
  self[1]._activity.timestamp = *(double *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self[1]._activity.conservativeMountedProbability = v17;
  *(_OWORD *)&self[1]._activity.source = v16;
  *(_OWORD *)&self[1].super.isa = v15;
}

@end
