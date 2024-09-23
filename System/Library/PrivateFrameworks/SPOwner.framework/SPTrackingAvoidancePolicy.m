@implementation SPTrackingAvoidancePolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPTrackingAvoidancePolicy)initWithType:(int64_t)a3 expiryTimeInterval:(double)a4 keepAliveInterval:(double)a5 minimumStagingInterval:(double)a6 stagingBackstopHour:(int64_t)a7 assumedKeyRollHour:(int64_t)a8 scanInterval:(double)a9 surfaceImmediatelyBetweenBackstopAndKeyroll:(BOOL)a10 maxExpectedWildInterval:(double)a11 shouldAlertImmediatelyForImmediateTypes:(BOOL)a12 durationOfConsideration:(double)a13 thresholdOfLocationRelevance:(double)a14 thresholdOfSignificantDuration:(double)a15 thresholdOfSignificantDistance:(double)a16 capOfReasonableWalkingSpeed:(double)a17 allowNavGeoHintAsPrivateVehicleHint:(BOOL)a18
{
  SPTrackingAvoidancePolicy *result;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)SPTrackingAvoidancePolicy;
  result = -[SPTrackingAvoidancePolicy init](&v32, sel_init, a4, a5, a6, a9, a11);
  if (result)
  {
    result->_type = a3;
    result->_expiryTimeInterval = a4;
    result->_keepAliveInterval = a5;
    result->_minimumStagingInterval = a6;
    result->_stagingBackstopHour = a7;
    result->_assumedKeyRollHour = a8;
    result->_scanInterval = a9;
    result->_surfaceImmediatelyBetweenBackstopAndKeyroll = a10;
    result->_shouldAlertImmediatelyForImmediateTypes = a12;
    result->_durationOfConsideration = a13;
    result->_thresholdOfLocationRelevance = a14;
    result->_thresholdOfSignificantDuration = a15;
    result->_thresholdOfSignificantDistance = a16;
    result->_capOfReasonableWalkingSpeed = a17;
    result->_allowNavGeoHintAsPrivateVehicleHint = a18;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SPTrackingAvoidancePolicy *v4;
  SPTrackingAvoidancePolicy *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (SPTrackingAvoidancePolicy *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SPTrackingAvoidancePolicy type](self, "type");
      v7 = -[SPTrackingAvoidancePolicy type](v5, "type");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("expiryTimeInterval"), self->_expiryTimeInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("keepAliveInterval"), self->_keepAliveInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("minimumStagingInterval"), self->_minimumStagingInterval);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stagingBackstopHour, CFSTR("stagingBackstopHour"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_assumedKeyRollHour, CFSTR("assumedKeyRollHour"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_surfaceImmediatelyBetweenBackstopAndKeyroll, CFSTR("surfaceImmediatelyBetweenBackstopAndKeyroll"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("maxExpectedWildInterval"), self->_maxExpectedWildInterval);
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldAlertImmediatelyForImmediateTypes, CFSTR("shouldAlertImmediatelyForImmediateTypes"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("durationOfConsideration"), self->_durationOfConsideration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("thresholdOfLocationRelevance"), self->_thresholdOfLocationRelevance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("thresholdOfSignificantDuration"), self->_thresholdOfSignificantDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("thresholdOfSignificantDistance"), self->_thresholdOfSignificantDistance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("capOfReasonableWalkingSpeed"), self->_capOfReasonableWalkingSpeed);
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowNavGeoHintAsPrivateVehicleHint, CFSTR("allowNavGeoHintAsPrivateVehicleHint"));

}

- (SPTrackingAvoidancePolicy)initWithCoder:(id)a3
{
  id v4;
  SPTrackingAvoidancePolicy *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SPTrackingAvoidancePolicy;
  v5 = -[SPTrackingAvoidancePolicy init](&v16, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("expiryTimeInterval"));
    v5->_expiryTimeInterval = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("keepAliveInterval"));
    v5->_keepAliveInterval = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minimumStagingInterval"));
    v5->_minimumStagingInterval = v8;
    v5->_stagingBackstopHour = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stagingBackstopHour"));
    v5->_assumedKeyRollHour = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("assumedKeyRollHour"));
    v5->_surfaceImmediatelyBetweenBackstopAndKeyroll = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("surfaceImmediatelyBetweenBackstopAndKeyroll"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxExpectedWildInterval"));
    v5->_maxExpectedWildInterval = v9;
    v5->_shouldAlertImmediatelyForImmediateTypes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAlertImmediatelyForImmediateTypes"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("durationOfConsideration"));
    v5->_durationOfConsideration = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("thresholdOfLocationRelevance"));
    v5->_thresholdOfLocationRelevance = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("thresholdOfSignificantDuration"));
    v5->_thresholdOfSignificantDuration = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("thresholdOfSignificantDistance"));
    v5->_thresholdOfSignificantDistance = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("capOfReasonableWalkingSpeed"));
    v5->_capOfReasonableWalkingSpeed = v14;
    v5->_allowNavGeoHintAsPrivateVehicleHint = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowNavGeoHintAsPrivateVehicleHint"));
  }

  return v5;
}

- (id)description
{
  unint64_t type;
  __CFString *v3;

  type = self->_type;
  if (type > 2)
    v3 = 0;
  else
    v3 = off_1E5E185E8[type];
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Policy type: %@"), v3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)expiryTimeInterval
{
  return self->_expiryTimeInterval;
}

- (void)setExpiryTimeInterval:(double)a3
{
  self->_expiryTimeInterval = a3;
}

- (double)purgeTimeInterval
{
  return self->_purgeTimeInterval;
}

- (void)setPurgeTimeInterval:(double)a3
{
  self->_purgeTimeInterval = a3;
}

- (double)keepAliveInterval
{
  return self->_keepAliveInterval;
}

- (void)setKeepAliveInterval:(double)a3
{
  self->_keepAliveInterval = a3;
}

- (double)minimumStagingInterval
{
  return self->_minimumStagingInterval;
}

- (void)setMinimumStagingInterval:(double)a3
{
  self->_minimumStagingInterval = a3;
}

- (int64_t)stagingBackstopHour
{
  return self->_stagingBackstopHour;
}

- (void)setStagingBackstopHour:(int64_t)a3
{
  self->_stagingBackstopHour = a3;
}

- (int64_t)assumedKeyRollHour
{
  return self->_assumedKeyRollHour;
}

- (void)setAssumedKeyRollHour:(int64_t)a3
{
  self->_assumedKeyRollHour = a3;
}

- (double)scanInterval
{
  return self->_scanInterval;
}

- (void)setScanInterval:(double)a3
{
  self->_scanInterval = a3;
}

- (BOOL)surfaceImmediatelyBetweenBackstopAndKeyroll
{
  return self->_surfaceImmediatelyBetweenBackstopAndKeyroll;
}

- (void)setSurfaceImmediatelyBetweenBackstopAndKeyroll:(BOOL)a3
{
  self->_surfaceImmediatelyBetweenBackstopAndKeyroll = a3;
}

- (double)maxExpectedWildInterval
{
  return self->_maxExpectedWildInterval;
}

- (void)setMaxExpectedWildInterval:(double)a3
{
  self->_maxExpectedWildInterval = a3;
}

- (BOOL)shouldAlertImmediatelyForImmediateTypes
{
  return self->_shouldAlertImmediatelyForImmediateTypes;
}

- (void)setShouldAlertImmediatelyForImmediateTypes:(BOOL)a3
{
  self->_shouldAlertImmediatelyForImmediateTypes = a3;
}

- (double)durationOfConsideration
{
  return self->_durationOfConsideration;
}

- (void)setDurationOfConsideration:(double)a3
{
  self->_durationOfConsideration = a3;
}

- (double)thresholdOfLocationRelevance
{
  return self->_thresholdOfLocationRelevance;
}

- (void)setThresholdOfLocationRelevance:(double)a3
{
  self->_thresholdOfLocationRelevance = a3;
}

- (double)thresholdOfSignificantDuration
{
  return self->_thresholdOfSignificantDuration;
}

- (void)setThresholdOfSignificantDuration:(double)a3
{
  self->_thresholdOfSignificantDuration = a3;
}

- (double)thresholdOfSignificantDistance
{
  return self->_thresholdOfSignificantDistance;
}

- (void)setThresholdOfSignificantDistance:(double)a3
{
  self->_thresholdOfSignificantDistance = a3;
}

- (double)capOfReasonableWalkingSpeed
{
  return self->_capOfReasonableWalkingSpeed;
}

- (void)setCapOfReasonableWalkingSpeed:(double)a3
{
  self->_capOfReasonableWalkingSpeed = a3;
}

- (BOOL)allowNavGeoHintAsPrivateVehicleHint
{
  return self->_allowNavGeoHintAsPrivateVehicleHint;
}

- (void)setAllowNavGeoHintAsPrivateVehicleHint:(BOOL)a3
{
  self->_allowNavGeoHintAsPrivateVehicleHint = a3;
}

@end
