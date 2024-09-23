@implementation SMSessionTriggerDestinationETAUpdateState

- (SMSessionTriggerDestinationETAUpdateState)initWithDistanceRemaining:(double)a3 distanceDifference:(double)a4 nominalTravelTimeRemaining:(double)a5 nominalTravelTimeDifference:(double)a6 nominalTravelTimeShorter:(BOOL)a7 remainingDistanceShorter:(BOOL)a8 shouldUpdateETAUpperBound:(BOOL)a9
{
  SMSessionTriggerDestinationETAUpdateState *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SMSessionTriggerDestinationETAUpdateState;
  result = -[SMSessionTriggerDestinationETAUpdateState init](&v17, sel_init);
  if (result)
  {
    result->_distanceRemaining = a3;
    result->_distanceDifference = a4;
    result->_nominalTravelTimeRemaining = a5;
    result->_nominalTravelTimeDifference = a6;
    result->_nominalTravelTimeShorter = a7;
    result->_remainingDistanceShorter = a8;
    result->_shouldUpdateETAUpperBound = a9;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionTriggerDestinationETAUpdateState)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("__kSMSessionTriggerDestinationETAUpdateStateDistanceRemainingKey"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("__kSMSessionTriggerDestinationETAUpdateStateDistanceDifferenceKey"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("__kSMSessionTriggerDestinationETAUpdateStateNominalTravelTimeRemainingKey"));
  v10 = v9;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("__kSMSessionTriggerDestinationETAUpdateStateNominalTravelTimeDifferenceKey"));
  v12 = v11;
  v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__kSMSessionTriggerDestinationETAUpdateStateNominalTravelTimeShorterKey"));
  v14 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__kSMSessionTriggerDestinationETAUpdateStateRemainingDistanceShorterKey"));
  v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__kSMSessionTriggerDestinationETAUpdateStateShouldUpdateETAUpperBoundKey"));

  return -[SMSessionTriggerDestinationETAUpdateState initWithDistanceRemaining:distanceDifference:nominalTravelTimeRemaining:nominalTravelTimeDifference:nominalTravelTimeShorter:remainingDistanceShorter:shouldUpdateETAUpperBound:](self, "initWithDistanceRemaining:distanceDifference:nominalTravelTimeRemaining:nominalTravelTimeDifference:nominalTravelTimeShorter:remainingDistanceShorter:shouldUpdateETAUpperBound:", v13, v14, v15, v6, v8, v10, v12);
}

- (void)encodeWithCoder:(id)a3
{
  double distanceRemaining;
  id v5;

  distanceRemaining = self->_distanceRemaining;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("__kSMSessionTriggerDestinationETAUpdateStateDistanceRemainingKey"), distanceRemaining);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("__kSMSessionTriggerDestinationETAUpdateStateDistanceDifferenceKey"), self->_distanceDifference);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("__kSMSessionTriggerDestinationETAUpdateStateNominalTravelTimeRemainingKey"), self->_nominalTravelTimeRemaining);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("__kSMSessionTriggerDestinationETAUpdateStateNominalTravelTimeDifferenceKey"), self->_nominalTravelTimeDifference);
  objc_msgSend(v5, "encodeBool:forKey:", self->_nominalTravelTimeShorter, CFSTR("__kSMSessionTriggerDestinationETAUpdateStateNominalTravelTimeShorterKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_remainingDistanceShorter, CFSTR("__kSMSessionTriggerDestinationETAUpdateStateRemainingDistanceShorterKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldUpdateETAUpperBound, CFSTR("__kSMSessionTriggerDestinationETAUpdateStateShouldUpdateETAUpperBoundKey"));

}

- (double)distanceRemaining
{
  return self->_distanceRemaining;
}

- (void)setDistanceRemaining:(double)a3
{
  self->_distanceRemaining = a3;
}

- (double)distanceDifference
{
  return self->_distanceDifference;
}

- (void)setDistanceDifference:(double)a3
{
  self->_distanceDifference = a3;
}

- (double)nominalTravelTimeRemaining
{
  return self->_nominalTravelTimeRemaining;
}

- (void)setNominalTravelTimeRemaining:(double)a3
{
  self->_nominalTravelTimeRemaining = a3;
}

- (double)nominalTravelTimeDifference
{
  return self->_nominalTravelTimeDifference;
}

- (void)setNominalTravelTimeDifference:(double)a3
{
  self->_nominalTravelTimeDifference = a3;
}

- (BOOL)nominalTravelTimeShorter
{
  return self->_nominalTravelTimeShorter;
}

- (void)setNominalTravelTimeShorter:(BOOL)a3
{
  self->_nominalTravelTimeShorter = a3;
}

- (BOOL)remainingDistanceShorter
{
  return self->_remainingDistanceShorter;
}

- (void)setRemainingDistanceShorter:(BOOL)a3
{
  self->_remainingDistanceShorter = a3;
}

- (BOOL)shouldUpdateETAUpperBound
{
  return self->_shouldUpdateETAUpperBound;
}

- (void)setShouldUpdateETAUpperBound:(BOOL)a3
{
  self->_shouldUpdateETAUpperBound = a3;
}

@end
