@implementation CLFenceStateChangeMetrics

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFenceStateChangeMetrics;
  -[CLFenceStateChangeMetrics dealloc](&v3, "dealloc");
}

- (id)description
{
  return objc_msgSend(-[CLFenceStateChangeMetrics metricDictionary](self, "metricDictionary"), "description");
}

- (id)metricDictionary
{
  _QWORD v4[62];
  _QWORD v5[62];

  v4[0] = CFSTR("adjustedDistance");
  v5[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics adjustedDistance](self, "adjustedDistance"));
  v4[1] = CFSTR("airplaneMode");
  v5[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLFenceStateChangeMetrics airplaneMode](self, "airplaneMode"));
  v4[2] = CFSTR("cellAvailable");
  v5[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLFenceStateChangeMetrics cellAvailable](self, "cellAvailable"));
  v4[3] = CFSTR("distanceFromNMinusOneStateChange");
  v5[3] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics distanceFromNMinusOneStateChange](self, "distanceFromNMinusOneStateChange"));
  v4[4] = CFSTR("distanceFromNMinusTwoStateChange");
  v5[4] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics distanceFromNMinusTwoStateChange](self, "distanceFromNMinusTwoStateChange"));
  v4[5] = CFSTR("distanceToFenceBoundary");
  v5[5] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics distanceToFenceBoundary](self, "distanceToFenceBoundary"));
  v4[6] = CFSTR("adjustedDistanceToFenceBoundary");
  v5[6] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics adjustedDistanceToFenceBoundary](self, "adjustedDistanceToFenceBoundary"));
  v4[7] = CFSTR("dominantMotionState");
  v5[7] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics dominantMotionState](self, "dominantMotionState"));
  v4[8] = CFSTR("effectiveRadius");
  v5[8] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics effectiveRadius](self, "effectiveRadius"));
  v4[9] = CFSTR("entryRadius");
  v5[9] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics entryRadius](self, "entryRadius"));
  v4[10] = CFSTR("eventLatency");
  v5[10] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics eventLatency](self, "eventLatency"));
  v4[11] = CFSTR("timeToInitialStateChange");
  v5[11] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics timeToInitialStateChange](self, "timeToInitialStateChange"));
  v4[12] = CFSTR("currentState");
  v5[12] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics currentState](self, "currentState"));
  v4[13] = CFSTR("nMinusOneState");
  v5[13] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics nMinusOneState](self, "nMinusOneState"));
  v4[14] = CFSTR("nMinusTwoState");
  v5[14] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics nMinusTwoState](self, "nMinusTwoState"));
  v4[15] = CFSTR("nMinusThreeState");
  v5[15] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics nMinusThreeState](self, "nMinusThreeState"));
  v4[16] = CFSTR("nMinusOneStateChangeLocationAccuracy");
  v5[16] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics nMinusOneStateChangeLocationAccuracy](self, "nMinusOneStateChangeLocationAccuracy"));
  v4[17] = CFSTR("nMinusTwoStateChangeLocationAccuracy");
  v5[17] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics nMinusTwoStateChangeLocationAccuracy](self, "nMinusTwoStateChangeLocationAccuracy"));
  v4[18] = CFSTR("nMinusOneStateChangeLocationProvider");
  v5[18] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics nMinusOneStateChangeLocationProvider](self, "nMinusOneStateChangeLocationProvider"));
  v4[19] = CFSTR("nMinusTwoStateChangeLocationProvider");
  v5[19] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics nMinusTwoStateChangeLocationProvider](self, "nMinusTwoStateChangeLocationProvider"));
  v4[20] = CFSTR("eventType");
  v5[20] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics eventType](self, "eventType"));
  v4[21] = CFSTR("eventTypeNMinusOneStateChange");
  v5[21] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics eventTypeNMinusOneStateChange](self, "eventTypeNMinusOneStateChange"));
  v4[22] = CFSTR("eventTypeNMinusTwoStateChange");
  v5[22] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics eventTypeNMinusTwoStateChange](self, "eventTypeNMinusTwoStateChange"));
  v4[23] = CFSTR("exitRadius");
  v5[23] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics exitRadius](self, "exitRadius"));
  v4[24] = CFSTR("fenceCategoryType");
  v5[24] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics fenceCategoryType](self, "fenceCategoryType"));
  v4[25] = CFSTR("fenceRadius");
  v5[25] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics fenceRadius](self, "fenceRadius"));
  v4[26] = CFSTR("fenceType");
  v5[26] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics fenceType](self, "fenceType"));
  v4[27] = CFSTR("hasSignificantPrior");
  v5[27] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLFenceStateChangeMetrics hasSignificantPrior](self, "hasSignificantPrior"));
  v4[28] = CFSTR("isConservativeEntry");
  v5[28] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLFenceStateChangeMetrics isConservativeEntry](self, "isConservativeEntry"));
  v4[29] = CFSTR("isEmergencyFence");
  v5[29] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLFenceStateChangeMetrics isEmergencyFence](self, "isEmergencyFence"));
  v4[30] = CFSTR("isFreeWake");
  v5[30] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLFenceStateChangeMetrics isFreeWake](self, "isFreeWake"));
  v4[31] = CFSTR("isHelperFence");
  v5[31] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLFenceStateChangeMetrics isHelperFence](self, "isHelperFence"));
  v4[32] = CFSTR("isLowPower");
  v5[32] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLFenceStateChangeMetrics isLowPower](self, "isLowPower"));
  v4[33] = CFSTR("isThrottledFence");
  v5[33] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLFenceStateChangeMetrics isThrottledFence](self, "isThrottledFence"));
  v4[34] = CFSTR("locationAccuracy");
  v5[34] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics locationAccuracy](self, "locationAccuracy"));
  v4[35] = CFSTR("locationProvider");
  v5[35] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics locationProvider](self, "locationProvider"));
  v4[36] = CFSTR("loiDistance");
  -[CLFenceStateChangeMetrics loiDistance](self, "loiDistance");
  v5[36] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[37] = CFSTR("loiRadius");
  -[CLFenceStateChangeMetrics loiRadius](self, "loiRadius");
  v5[37] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[38] = CFSTR("motionStateBeforeNMinusOneStateChange");
  v5[38] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics motionStateBeforeNMinusOneStateChange](self, "motionStateBeforeNMinusOneStateChange"));
  v4[39] = CFSTR("motionState");
  v5[39] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics motionState](self, "motionState"));
  v4[40] = CFSTR("motionStateAfterNMinusOneStateChange");
  v5[40] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics motionStateAfterNMinusOneStateChange](self, "motionStateAfterNMinusOneStateChange"));
  v4[41] = CFSTR("motionStateAfterNMinusTwoStateChange");
  v5[41] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics motionStateAfterNMinusTwoStateChange](self, "motionStateAfterNMinusTwoStateChange"));
  v4[42] = CFSTR("motionStateBeforeStateChange");
  v5[42] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics motionStateBeforeStateChange](self, "motionStateBeforeStateChange"));
  v4[43] = CFSTR("previousLocationAccuracy");
  v5[43] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics previousLocationAccuracy](self, "previousLocationAccuracy"));
  v4[44] = CFSTR("passcodeLocked");
  v5[44] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLFenceStateChangeMetrics passcodeLocked](self, "passcodeLocked"));
  v4[45] = CFSTR("previousLocationAge");
  v5[45] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics previousLocationAge](self, "previousLocationAge"));
  v4[46] = CFSTR("previousLocationProvider");
  v5[46] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics previousLocationProvider](self, "previousLocationProvider"));
  v4[47] = CFSTR("lastHandledLocationAccuracy");
  v5[47] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics lastHandledLocationAccuracy](self, "lastHandledLocationAccuracy"));
  v4[48] = CFSTR("lastHandledLocationAge");
  v5[48] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics lastHandledLocationAge](self, "lastHandledLocationAge"));
  v4[49] = CFSTR("lastHandledLocationProvider");
  v5[49] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics lastHandledLocationProvider](self, "lastHandledLocationProvider"));
  v4[50] = CFSTR("reachabilityStatus");
  v5[50] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics reachabilityStatus](self, "reachabilityStatus"));
  v4[51] = CFSTR("settledState");
  v5[51] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics settledState](self, "settledState"));
  v4[52] = CFSTR("signalEnvironmentType");
  v5[52] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics signalEnvironmentType](self, "signalEnvironmentType"));
  v4[53] = CFSTR("significantFence");
  v5[53] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLFenceStateChangeMetrics significantFence](self, "significantFence"));
  v4[54] = CFSTR("stepsSinceNMinusOneStateChange");
  v5[54] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics stepsSinceNMinusOneStateChange](self, "stepsSinceNMinusOneStateChange"));
  v4[55] = CFSTR("stepsSinceNMinusTwoStateChange");
  v5[55] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics stepsSinceNMinusTwoStateChange](self, "stepsSinceNMinusTwoStateChange"));
  v4[56] = CFSTR("timeSinceDominantActivityChange");
  v5[56] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics timeSinceDominantActivityChange](self, "timeSinceDominantActivityChange"));
  v4[57] = CFSTR("timeSinceMotionActivityChange");
  v5[57] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics timeSinceMotionActivityChange](self, "timeSinceMotionActivityChange"));
  v4[58] = CFSTR("timeSinceNMinusOneStateChange");
  v5[58] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics timeSinceNMinusOneStateChange](self, "timeSinceNMinusOneStateChange"));
  v4[59] = CFSTR("timeSinceNMinusTwoStateChange");
  v5[59] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics timeSinceNMinusTwoStateChange](self, "timeSinceNMinusTwoStateChange"));
  v4[60] = CFSTR("timeSinceWifiRoam");
  v5[60] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLFenceStateChangeMetrics timeSinceWifiRoam](self, "timeSinceWifiRoam"));
  v4[61] = CFSTR("wifiAvailable");
  v5[61] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CLFenceStateChangeMetrics wifiAvailable](self, "wifiAvailable"));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 62);
}

- (unint64_t)adjustedDistance
{
  return self->_adjustedDistance;
}

- (void)setAdjustedDistance:(unint64_t)a3
{
  self->_adjustedDistance = a3;
}

- (BOOL)airplaneMode
{
  return self->_airplaneMode;
}

- (void)setAirplaneMode:(BOOL)a3
{
  self->_airplaneMode = a3;
}

- (BOOL)cellAvailable
{
  return self->_cellAvailable;
}

- (void)setCellAvailable:(BOOL)a3
{
  self->_cellAvailable = a3;
}

- (unint64_t)distanceFromNMinusOneStateChange
{
  return self->_distanceFromNMinusOneStateChange;
}

- (void)setDistanceFromNMinusOneStateChange:(unint64_t)a3
{
  self->_distanceFromNMinusOneStateChange = a3;
}

- (unint64_t)distanceFromNMinusTwoStateChange
{
  return self->_distanceFromNMinusTwoStateChange;
}

- (void)setDistanceFromNMinusTwoStateChange:(unint64_t)a3
{
  self->_distanceFromNMinusTwoStateChange = a3;
}

- (unint64_t)distanceToFenceBoundary
{
  return self->_distanceToFenceBoundary;
}

- (void)setDistanceToFenceBoundary:(unint64_t)a3
{
  self->_distanceToFenceBoundary = a3;
}

- (unint64_t)adjustedDistanceToFenceBoundary
{
  return self->_adjustedDistanceToFenceBoundary;
}

- (void)setAdjustedDistanceToFenceBoundary:(unint64_t)a3
{
  self->_adjustedDistanceToFenceBoundary = a3;
}

- (unint64_t)dominantMotionState
{
  return self->_dominantMotionState;
}

- (void)setDominantMotionState:(unint64_t)a3
{
  self->_dominantMotionState = a3;
}

- (unint64_t)effectiveRadius
{
  return self->_effectiveRadius;
}

- (void)setEffectiveRadius:(unint64_t)a3
{
  self->_effectiveRadius = a3;
}

- (unint64_t)entryRadius
{
  return self->_entryRadius;
}

- (void)setEntryRadius:(unint64_t)a3
{
  self->_entryRadius = a3;
}

- (unint64_t)eventLatency
{
  return self->_eventLatency;
}

- (void)setEventLatency:(unint64_t)a3
{
  self->_eventLatency = a3;
}

- (unint64_t)timeToInitialStateChange
{
  return self->_timeToInitialStateChange;
}

- (void)setTimeToInitialStateChange:(unint64_t)a3
{
  self->_timeToInitialStateChange = a3;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (unint64_t)nMinusOneState
{
  return self->_nMinusOneState;
}

- (void)setNMinusOneState:(unint64_t)a3
{
  self->_nMinusOneState = a3;
}

- (unint64_t)nMinusTwoState
{
  return self->_nMinusTwoState;
}

- (void)setNMinusTwoState:(unint64_t)a3
{
  self->_nMinusTwoState = a3;
}

- (unint64_t)nMinusThreeState
{
  return self->_nMinusThreeState;
}

- (void)setNMinusThreeState:(unint64_t)a3
{
  self->_nMinusThreeState = a3;
}

- (unint64_t)nMinusOneStateChangeLocationProvider
{
  return self->_nMinusOneStateChangeLocationProvider;
}

- (void)setNMinusOneStateChangeLocationProvider:(unint64_t)a3
{
  self->_nMinusOneStateChangeLocationProvider = a3;
}

- (unint64_t)nMinusTwoStateChangeLocationProvider
{
  return self->_nMinusTwoStateChangeLocationProvider;
}

- (void)setNMinusTwoStateChangeLocationProvider:(unint64_t)a3
{
  self->_nMinusTwoStateChangeLocationProvider = a3;
}

- (unint64_t)nMinusOneStateChangeLocationAccuracy
{
  return self->_nMinusOneStateChangeLocationAccuracy;
}

- (void)setNMinusOneStateChangeLocationAccuracy:(unint64_t)a3
{
  self->_nMinusOneStateChangeLocationAccuracy = a3;
}

- (unint64_t)nMinusTwoStateChangeLocationAccuracy
{
  return self->_nMinusTwoStateChangeLocationAccuracy;
}

- (void)setNMinusTwoStateChangeLocationAccuracy:(unint64_t)a3
{
  self->_nMinusTwoStateChangeLocationAccuracy = a3;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (unint64_t)eventTypeNMinusOneStateChange
{
  return self->_eventTypeNMinusOneStateChange;
}

- (void)setEventTypeNMinusOneStateChange:(unint64_t)a3
{
  self->_eventTypeNMinusOneStateChange = a3;
}

- (unint64_t)eventTypeNMinusTwoStateChange
{
  return self->_eventTypeNMinusTwoStateChange;
}

- (void)setEventTypeNMinusTwoStateChange:(unint64_t)a3
{
  self->_eventTypeNMinusTwoStateChange = a3;
}

- (unint64_t)exitRadius
{
  return self->_exitRadius;
}

- (void)setExitRadius:(unint64_t)a3
{
  self->_exitRadius = a3;
}

- (unint64_t)fenceCategoryType
{
  return self->_fenceCategoryType;
}

- (void)setFenceCategoryType:(unint64_t)a3
{
  self->_fenceCategoryType = a3;
}

- (unint64_t)fenceRadius
{
  return self->_fenceRadius;
}

- (void)setFenceRadius:(unint64_t)a3
{
  self->_fenceRadius = a3;
}

- (unint64_t)fenceType
{
  return self->_fenceType;
}

- (void)setFenceType:(unint64_t)a3
{
  self->_fenceType = a3;
}

- (BOOL)isConservativeEntry
{
  return self->_isConservativeEntry;
}

- (void)setIsConservativeEntry:(BOOL)a3
{
  self->_isConservativeEntry = a3;
}

- (BOOL)isEmergencyFence
{
  return self->_isEmergencyFence;
}

- (void)setIsEmergencyFence:(BOOL)a3
{
  self->_isEmergencyFence = a3;
}

- (BOOL)isFreeWake
{
  return self->_isFreeWake;
}

- (void)setIsFreeWake:(BOOL)a3
{
  self->_isFreeWake = a3;
}

- (BOOL)isHelperFence
{
  return self->_isHelperFence;
}

- (void)setIsHelperFence:(BOOL)a3
{
  self->_isHelperFence = a3;
}

- (BOOL)isLowPower
{
  return self->_isLowPower;
}

- (void)setIsLowPower:(BOOL)a3
{
  self->_isLowPower = a3;
}

- (BOOL)isThrottledFence
{
  return self->_isThrottledFence;
}

- (void)setIsThrottledFence:(BOOL)a3
{
  self->_isThrottledFence = a3;
}

- (unint64_t)locationAccuracy
{
  return self->_locationAccuracy;
}

- (void)setLocationAccuracy:(unint64_t)a3
{
  self->_locationAccuracy = a3;
}

- (unint64_t)locationProvider
{
  return self->_locationProvider;
}

- (void)setLocationProvider:(unint64_t)a3
{
  self->_locationProvider = a3;
}

- (unint64_t)motionStateBeforeNMinusOneStateChange
{
  return self->_motionStateBeforeNMinusOneStateChange;
}

- (void)setMotionStateBeforeNMinusOneStateChange:(unint64_t)a3
{
  self->_motionStateBeforeNMinusOneStateChange = a3;
}

- (unint64_t)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(unint64_t)a3
{
  self->_motionState = a3;
}

- (unint64_t)motionStateAfterNMinusOneStateChange
{
  return self->_motionStateAfterNMinusOneStateChange;
}

- (void)setMotionStateAfterNMinusOneStateChange:(unint64_t)a3
{
  self->_motionStateAfterNMinusOneStateChange = a3;
}

- (unint64_t)motionStateAfterNMinusTwoStateChange
{
  return self->_motionStateAfterNMinusTwoStateChange;
}

- (void)setMotionStateAfterNMinusTwoStateChange:(unint64_t)a3
{
  self->_motionStateAfterNMinusTwoStateChange = a3;
}

- (unint64_t)motionStateBeforeStateChange
{
  return self->_motionStateBeforeStateChange;
}

- (void)setMotionStateBeforeStateChange:(unint64_t)a3
{
  self->_motionStateBeforeStateChange = a3;
}

- (BOOL)passcodeLocked
{
  return self->_passcodeLocked;
}

- (void)setPasscodeLocked:(BOOL)a3
{
  self->_passcodeLocked = a3;
}

- (unint64_t)previousLocationAccuracy
{
  return self->_previousLocationAccuracy;
}

- (void)setPreviousLocationAccuracy:(unint64_t)a3
{
  self->_previousLocationAccuracy = a3;
}

- (unint64_t)previousLocationAge
{
  return self->_previousLocationAge;
}

- (void)setPreviousLocationAge:(unint64_t)a3
{
  self->_previousLocationAge = a3;
}

- (unint64_t)previousLocationProvider
{
  return self->_previousLocationProvider;
}

- (void)setPreviousLocationProvider:(unint64_t)a3
{
  self->_previousLocationProvider = a3;
}

- (unint64_t)lastHandledLocationAccuracy
{
  return self->_lastHandledLocationAccuracy;
}

- (void)setLastHandledLocationAccuracy:(unint64_t)a3
{
  self->_lastHandledLocationAccuracy = a3;
}

- (unint64_t)lastHandledLocationAge
{
  return self->_lastHandledLocationAge;
}

- (void)setLastHandledLocationAge:(unint64_t)a3
{
  self->_lastHandledLocationAge = a3;
}

- (unint64_t)lastHandledLocationProvider
{
  return self->_lastHandledLocationProvider;
}

- (void)setLastHandledLocationProvider:(unint64_t)a3
{
  self->_lastHandledLocationProvider = a3;
}

- (unint64_t)reachabilityStatus
{
  return self->_reachabilityStatus;
}

- (void)setReachabilityStatus:(unint64_t)a3
{
  self->_reachabilityStatus = a3;
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (void)setSettledState:(unint64_t)a3
{
  self->_settledState = a3;
}

- (unint64_t)signalEnvironmentType
{
  return self->_signalEnvironmentType;
}

- (void)setSignalEnvironmentType:(unint64_t)a3
{
  self->_signalEnvironmentType = a3;
}

- (BOOL)significantFence
{
  return self->_significantFence;
}

- (void)setSignificantFence:(BOOL)a3
{
  self->_significantFence = a3;
}

- (unint64_t)stepsSinceNMinusOneStateChange
{
  return self->_stepsSinceNMinusOneStateChange;
}

- (void)setStepsSinceNMinusOneStateChange:(unint64_t)a3
{
  self->_stepsSinceNMinusOneStateChange = a3;
}

- (unint64_t)stepsSinceNMinusTwoStateChange
{
  return self->_stepsSinceNMinusTwoStateChange;
}

- (void)setStepsSinceNMinusTwoStateChange:(unint64_t)a3
{
  self->_stepsSinceNMinusTwoStateChange = a3;
}

- (unint64_t)timeSinceDominantActivityChange
{
  return self->_timeSinceDominantActivityChange;
}

- (void)setTimeSinceDominantActivityChange:(unint64_t)a3
{
  self->_timeSinceDominantActivityChange = a3;
}

- (unint64_t)timeSinceMotionActivityChange
{
  return self->_timeSinceMotionActivityChange;
}

- (void)setTimeSinceMotionActivityChange:(unint64_t)a3
{
  self->_timeSinceMotionActivityChange = a3;
}

- (unint64_t)timeSinceNMinusOneStateChange
{
  return self->_timeSinceNMinusOneStateChange;
}

- (void)setTimeSinceNMinusOneStateChange:(unint64_t)a3
{
  self->_timeSinceNMinusOneStateChange = a3;
}

- (unint64_t)timeSinceNMinusTwoStateChange
{
  return self->_timeSinceNMinusTwoStateChange;
}

- (void)setTimeSinceNMinusTwoStateChange:(unint64_t)a3
{
  self->_timeSinceNMinusTwoStateChange = a3;
}

- (unint64_t)timeSinceWifiRoam
{
  return self->_timeSinceWifiRoam;
}

- (void)setTimeSinceWifiRoam:(unint64_t)a3
{
  self->_timeSinceWifiRoam = a3;
}

- (BOOL)wifiAvailable
{
  return self->_wifiAvailable;
}

- (void)setWifiAvailable:(BOOL)a3
{
  self->_wifiAvailable = a3;
}

- (double)loiDistance
{
  return self->_loiDistance;
}

- (void)setLoiDistance:(double)a3
{
  self->_loiDistance = a3;
}

- (double)loiRadius
{
  return self->_loiRadius;
}

- (void)setLoiRadius:(double)a3
{
  self->_loiRadius = a3;
}

- (BOOL)hasSignificantPrior
{
  return self->_hasSignificantPrior;
}

- (void)setHasSignificantPrior:(BOOL)a3
{
  self->_hasSignificantPrior = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (int64_t)loiType
{
  return self->_loiType;
}

- (void)setLoiType:(int64_t)a3
{
  self->_loiType = a3;
}

- (BOOL)hasLoiAtFence
{
  return self->_hasLoiAtFence;
}

- (void)setHasLoiAtFence:(BOOL)a3
{
  self->_hasLoiAtFence = a3;
}

@end
