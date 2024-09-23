@implementation RTAuthorizedLocationCurationMetrics

- (RTAuthorizedLocationCurationMetrics)init
{
  RTAuthorizedLocationCurationMetrics *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RTAuthorizedLocationCurationMetrics;
  result = -[RTAuthorizedLocationCurationMetrics init](&v8, sel_init);
  if (result)
  {
    result->_maxCumulativeDwellTimeForNotFamiliarLoiHours = -1.0;
    *(_QWORD *)&result->_maxUniqueVisitDaysForNotFamiliarLois = -1;
    *(_QWORD *)&result->_ageDaysFirstAnyLoiVisit = -1;
    *(_QWORD *)&result->_ageDaysFirstTopLoiRegisteredVisit = -1;
    __asm { FMOV            V0.2S, #-1.0 }
    *(_QWORD *)&result->_visitRegistrationFraction = _D0;
    result->_visitsToTopLOIWithTechAvailabilityKnown = -1;
    *(_QWORD *)&result->_fractionOfVisitsToTopLOIWithGPS = _D0;
  }
  return result;
}

- (float)maxCumulativeDwellTimeForNotFamiliarLoiHours
{
  return self->_maxCumulativeDwellTimeForNotFamiliarLoiHours;
}

- (void)setMaxCumulativeDwellTimeForNotFamiliarLoiHours:(float)a3
{
  self->_maxCumulativeDwellTimeForNotFamiliarLoiHours = a3;
}

- (int)maxUniqueVisitDaysForNotFamiliarLois
{
  return self->_maxUniqueVisitDaysForNotFamiliarLois;
}

- (void)setMaxUniqueVisitDaysForNotFamiliarLois:(int)a3
{
  self->_maxUniqueVisitDaysForNotFamiliarLois = a3;
}

- (int)ageDaysRegistry
{
  return self->_ageDaysRegistry;
}

- (void)setAgeDaysRegistry:(int)a3
{
  self->_ageDaysRegistry = a3;
}

- (int)ageDaysFirstAnyLoiVisit
{
  return self->_ageDaysFirstAnyLoiVisit;
}

- (void)setAgeDaysFirstAnyLoiVisit:(int)a3
{
  self->_ageDaysFirstAnyLoiVisit = a3;
}

- (int)ageDaysFirstTopLoiVisit
{
  return self->_ageDaysFirstTopLoiVisit;
}

- (void)setAgeDaysFirstTopLoiVisit:(int)a3
{
  self->_ageDaysFirstTopLoiVisit = a3;
}

- (int)ageDaysFirstTopLoiRegisteredVisit
{
  return self->_ageDaysFirstTopLoiRegisteredVisit;
}

- (void)setAgeDaysFirstTopLoiRegisteredVisit:(int)a3
{
  self->_ageDaysFirstTopLoiRegisteredVisit = a3;
}

- (int)ageDaysFirstTopLoiGeoVisit
{
  return self->_ageDaysFirstTopLoiGeoVisit;
}

- (void)setAgeDaysFirstTopLoiGeoVisit:(int)a3
{
  self->_ageDaysFirstTopLoiGeoVisit = a3;
}

- (float)visitRegistrationFraction
{
  return self->_visitRegistrationFraction;
}

- (void)setVisitRegistrationFraction:(float)a3
{
  self->_visitRegistrationFraction = a3;
}

- (float)registrationUsesBestTimeFraction
{
  return self->_registrationUsesBestTimeFraction;
}

- (void)setRegistrationUsesBestTimeFraction:(float)a3
{
  self->_registrationUsesBestTimeFraction = a3;
}

- (int)visitsToTopLOIWithTechAvailabilityKnown
{
  return self->_visitsToTopLOIWithTechAvailabilityKnown;
}

- (void)setVisitsToTopLOIWithTechAvailabilityKnown:(int)a3
{
  self->_visitsToTopLOIWithTechAvailabilityKnown = a3;
}

- (float)fractionOfVisitsToTopLOIWithGPS
{
  return self->_fractionOfVisitsToTopLOIWithGPS;
}

- (void)setFractionOfVisitsToTopLOIWithGPS:(float)a3
{
  self->_fractionOfVisitsToTopLOIWithGPS = a3;
}

- (float)fractionOfVisitsToTopLOIWithWiFiHI
{
  return self->_fractionOfVisitsToTopLOIWithWiFiHI;
}

- (void)setFractionOfVisitsToTopLOIWithWiFiHI:(float)a3
{
  self->_fractionOfVisitsToTopLOIWithWiFiHI = a3;
}

@end
