@implementation TAFilterGeneralSettings

- (TAFilterGeneralSettings)initWithDurationOfConsideration:(double)a3 thresholdOfLocationRelevance:(double)a4 thresholdOfSignificantDuration:(double)a5 thresholdOfSignificantDistance:(double)a6 capOfReasonableWalkingSpeed:(double)a7 allowNavGeoHintAsPrivateVehicleHint:(BOOL)a8 vehicularImmediacyType:(unint64_t)a9 beepOnMoveVehicularImmediacyType:(unint64_t)a10 beepOnMovePedestrianImmediacyType:(unint64_t)a11 nextPLOIVehicularImmediacyType:(unint64_t)a12 nextPLOIPedestrianImmediacyType:(unint64_t)a13 beepOnMoveConsiderationTimeInterval:(unint64_t)a14
{
  TAFilterGeneralSettings *result;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)TAFilterGeneralSettings;
  result = -[TAFilterGeneralSettings init](&v26, sel_init);
  if (result)
  {
    result->_durationOfConsideration = a3;
    result->_thresholdOfLocationRelevance = a4;
    result->_thresholdOfSignificantDuration = a5;
    result->_thresholdOfSignificantDistance = a6;
    result->_capOfReasonableWalkingSpeed = a7;
    result->_allowNavGeoHintAsPrivateVehicleHint = a8;
    result->_vehicularImmediacyType = a9;
    result->_beepOnMoveVehicularImmediacyType = a10;
    result->_beepOnMovePedestrianImmediacyType = a11;
    result->_nextPLOIVehicularImmediacyType = a12;
    result->_nextPLOIPedestrianImmediacyType = a13;
    result->_beepOnMoveConsiderationTimeInterval = a14;
  }
  return result;
}

- (TAFilterGeneralSettings)initWithDurationOfConsiderationOrDefault:(id)a3 thresholdOfLocationRelevanceOrDefault:(id)a4 thresholdOfSignificantDurationOrDefault:(id)a5 thresholdOfSignificantDistanceOrDefault:(id)a6 capOfReasonableWalkingSpeedOrDefault:(id)a7 allowNavGeoHintAsPrivateVehicleHintOrDefault:(id)a8 vehicularImmediacyTypeOrDefault:(id)a9 beepOnMoveVehicularImmediacyTypeOrDefault:(id)a10 beepOnMovePedestrianImmediacyTypeOrDefault:(id)a11 nextPLOIVehicularImmediacyTypeOrDefault:(id)a12 nextPLOIPedestrianImmediacyTypeOrDefault:(id)a13 beepOnMoveConsiderationTimeIntervalOrDefault:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  TAFilterGeneralSettings *v48;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v58 = a7;
  v57 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v56 = a13;
  v27 = a14;
  v55 = v19;
  if (v19)
  {
    objc_msgSend(v19, "doubleValue");
    v29 = v28;
    if (v20)
      goto LABEL_3;
  }
  else
  {
    v29 = 900.0;
    if (v20)
    {
LABEL_3:
      objc_msgSend(v20, "doubleValue");
      v31 = v30;
      if (v21)
        goto LABEL_4;
LABEL_8:
      v33 = 600.0;
      if (v22)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  v31 = 60.0;
  if (!v21)
    goto LABEL_8;
LABEL_4:
  objc_msgSend(v21, "doubleValue");
  v33 = v32;
  if (v22)
  {
LABEL_5:
    objc_msgSend(v22, "doubleValue");
    v35 = v34;
    goto LABEL_10;
  }
LABEL_9:
  v35 = 840.0;
LABEL_10:
  if (v58)
  {
    objc_msgSend(v58, "doubleValue");
    v37 = v36;
  }
  else
  {
    v37 = 5.5;
  }
  v52 = v22;
  if (v57)
    v38 = objc_msgSend(v57, "BOOLValue");
  else
    v38 = 0;
  v53 = v21;
  if (v23)
    v39 = objc_msgSend(v23, "unsignedIntegerValue");
  else
    v39 = 1;
  v54 = v20;
  v50 = v24;
  if (v24)
    v40 = objc_msgSend(v24, "unsignedIntegerValue");
  else
    v40 = 2;
  v41 = v23;
  if (v25)
  {
    v42 = objc_msgSend(v25, "unsignedIntegerValue");
    if (v26)
    {
LABEL_24:
      v43 = v26;
      v44 = objc_msgSend(v26, "unsignedIntegerValue");
      goto LABEL_27;
    }
  }
  else
  {
    v42 = 2;
    if (v26)
      goto LABEL_24;
  }
  v43 = v26;
  v44 = 3;
LABEL_27:
  v45 = v25;
  if (!v56)
  {
    v46 = 3;
    if (v27)
      goto LABEL_29;
LABEL_31:
    v47 = 25;
    goto LABEL_32;
  }
  v46 = objc_msgSend(v56, "unsignedIntegerValue");
  if (!v27)
    goto LABEL_31;
LABEL_29:
  v47 = objc_msgSend(v27, "unsignedIntegerValue");
LABEL_32:
  v48 = -[TAFilterGeneralSettings initWithDurationOfConsideration:thresholdOfLocationRelevance:thresholdOfSignificantDuration:thresholdOfSignificantDistance:capOfReasonableWalkingSpeed:allowNavGeoHintAsPrivateVehicleHint:vehicularImmediacyType:beepOnMoveVehicularImmediacyType:beepOnMovePedestrianImmediacyType:nextPLOIVehicularImmediacyType:nextPLOIPedestrianImmediacyType:beepOnMoveConsiderationTimeInterval:](self, "initWithDurationOfConsideration:thresholdOfLocationRelevance:thresholdOfSignificantDuration:thresholdOfSignificantDistance:capOfReasonableWalkingSpeed:allowNavGeoHintAsPrivateVehicleHint:vehicularImmediacyType:beepOnMoveVehicularImmediacyType:beepOnMovePedestrianImmediacyType:nextPLOIVehicularImmediacyType:nextPLOIPedestrianImmediacyType:beepOnMoveConsiderationTimeInterval:", v38, v39, v40, v42, v44, v46, v29, v31, v33, v35, v37, v47);

  return v48;
}

- (TAFilterGeneralSettings)initWithDefaults
{
  return -[TAFilterGeneralSettings initWithDurationOfConsideration:thresholdOfLocationRelevance:thresholdOfSignificantDuration:thresholdOfSignificantDistance:capOfReasonableWalkingSpeed:allowNavGeoHintAsPrivateVehicleHint:vehicularImmediacyType:beepOnMoveVehicularImmediacyType:beepOnMovePedestrianImmediacyType:nextPLOIVehicularImmediacyType:nextPLOIPedestrianImmediacyType:beepOnMoveConsiderationTimeInterval:](self, "initWithDurationOfConsideration:thresholdOfLocationRelevance:thresholdOfSignificantDuration:thresholdOfSignificantDistance:capOfReasonableWalkingSpeed:allowNavGeoHintAsPrivateVehicleHint:vehicularImmediacyType:beepOnMoveVehicularImmediacyType:beepOnMovePedestrianImmediacyType:nextPLOIVehicularImmediacyType:nextPLOIPedestrianImmediacyType:beepOnMoveConsiderationTimeInterval:", 0, 1, 2, 2, 3, 3, 900.0, 60.0, 600.0, 840.0, 5.5, 25);
}

- (double)durationOfConsideration
{
  return self->_durationOfConsideration;
}

- (double)thresholdOfLocationRelevance
{
  return self->_thresholdOfLocationRelevance;
}

- (double)thresholdOfSignificantDuration
{
  return self->_thresholdOfSignificantDuration;
}

- (double)thresholdOfSignificantDistance
{
  return self->_thresholdOfSignificantDistance;
}

- (double)capOfReasonableWalkingSpeed
{
  return self->_capOfReasonableWalkingSpeed;
}

- (BOOL)allowNavGeoHintAsPrivateVehicleHint
{
  return self->_allowNavGeoHintAsPrivateVehicleHint;
}

- (unint64_t)vehicularImmediacyType
{
  return self->_vehicularImmediacyType;
}

- (unint64_t)beepOnMoveVehicularImmediacyType
{
  return self->_beepOnMoveVehicularImmediacyType;
}

- (unint64_t)beepOnMovePedestrianImmediacyType
{
  return self->_beepOnMovePedestrianImmediacyType;
}

- (unint64_t)nextPLOIVehicularImmediacyType
{
  return self->_nextPLOIVehicularImmediacyType;
}

- (unint64_t)nextPLOIPedestrianImmediacyType
{
  return self->_nextPLOIPedestrianImmediacyType;
}

- (unint64_t)beepOnMoveConsiderationTimeInterval
{
  return self->_beepOnMoveConsiderationTimeInterval;
}

@end
