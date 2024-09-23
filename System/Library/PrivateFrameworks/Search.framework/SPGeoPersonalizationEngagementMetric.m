@implementation SPGeoPersonalizationEngagementMetric

- (SPGeoPersonalizationEngagementMetric)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPGeoPersonalizationEngagementMetric;
  return -[SPGeoPersonalizationEngagementMetric init](&v3, sel_init);
}

- (id)serializedMetric
{
  void *v3;
  void *v4;
  NSNumber *engagedGeoResultEntityRelevanceScore;
  NSNumber *engagedGeoResultNumberOfVisits;
  NSNumber *engagedGeoResultNumberOfVisitsGivenLocation;
  NSNumber *engagedGeoResultPersonalizationType;
  NSNumber *engagedGeoResultPosition;
  NSNumber *engagedGeoResultTimeSinceLastVisit;
  NSNumber *engagedGeoResultTimeUntilUpcomingEvent;
  NSNumber *engagedResultWasTopHit;
  NSNumber *firstGeoResultEntityRelevanceScore;
  NSNumber *firstGeoResultIsCandidateForPromotion;
  NSNumber *firstGeoResultNumberOfVisits;
  NSNumber *firstGeoResultNumberOfVisitsGivenLocation;
  NSNumber *firstGeoResultPersonalizationType;
  NSNumber *firstGeoResultTimeSinceLastVisit;
  NSNumber *firstGeoResultTimeUntilUpcomingEvent;
  NSNumber *firstGeoResultWasReranked;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *trialDeploymentId;
  NSString *trialExperimentId;
  NSString *trialTreatmentId;
  void *v28;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  engagedGeoResultEntityRelevanceScore = self->_engagedGeoResultEntityRelevanceScore;
  if (engagedGeoResultEntityRelevanceScore)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", engagedGeoResultEntityRelevanceScore, CFSTR("engagedGeoResultEntityRelevanceScore"));
  engagedGeoResultNumberOfVisits = self->_engagedGeoResultNumberOfVisits;
  if (engagedGeoResultNumberOfVisits)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", engagedGeoResultNumberOfVisits, CFSTR("engagedGeoResultNumberOfVisits"));
  engagedGeoResultNumberOfVisitsGivenLocation = self->_engagedGeoResultNumberOfVisitsGivenLocation;
  if (engagedGeoResultNumberOfVisitsGivenLocation)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", engagedGeoResultNumberOfVisitsGivenLocation, CFSTR("engagedGeoResultNumberOfVisitsGivenLocation"));
  engagedGeoResultPersonalizationType = self->_engagedGeoResultPersonalizationType;
  if (engagedGeoResultPersonalizationType)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", engagedGeoResultPersonalizationType, CFSTR("engagedGeoResultPersonalizationType"));
  engagedGeoResultPosition = self->_engagedGeoResultPosition;
  if (engagedGeoResultPosition)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", engagedGeoResultPosition, CFSTR("engagedGeoResultPosition"));
  engagedGeoResultTimeSinceLastVisit = self->_engagedGeoResultTimeSinceLastVisit;
  if (engagedGeoResultTimeSinceLastVisit)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", engagedGeoResultTimeSinceLastVisit, CFSTR("engagedGeoResultTimeSinceLastVisit"));
  engagedGeoResultTimeUntilUpcomingEvent = self->_engagedGeoResultTimeUntilUpcomingEvent;
  if (engagedGeoResultTimeUntilUpcomingEvent)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", engagedGeoResultTimeUntilUpcomingEvent, CFSTR("engagedGeoResultTimeUntilUpcomingEvent"));
  engagedResultWasTopHit = self->_engagedResultWasTopHit;
  if (engagedResultWasTopHit)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", engagedResultWasTopHit, CFSTR("engagedResultWasTopHit"));
  firstGeoResultEntityRelevanceScore = self->_firstGeoResultEntityRelevanceScore;
  if (firstGeoResultEntityRelevanceScore)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", firstGeoResultEntityRelevanceScore, CFSTR("firstGeoResultEntityRelevanceScore"));
  firstGeoResultIsCandidateForPromotion = self->_firstGeoResultIsCandidateForPromotion;
  if (firstGeoResultIsCandidateForPromotion)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", firstGeoResultIsCandidateForPromotion, CFSTR("firstGeoResultIsCandidateForPromotion"));
  firstGeoResultNumberOfVisits = self->_firstGeoResultNumberOfVisits;
  if (firstGeoResultNumberOfVisits)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", firstGeoResultNumberOfVisits, CFSTR("firstGeoResultNumberOfVisits"));
  firstGeoResultNumberOfVisitsGivenLocation = self->_firstGeoResultNumberOfVisitsGivenLocation;
  if (firstGeoResultNumberOfVisitsGivenLocation)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", firstGeoResultNumberOfVisitsGivenLocation, CFSTR("firstGeoResultNumberOfVisitsGivenLocation"));
  firstGeoResultPersonalizationType = self->_firstGeoResultPersonalizationType;
  if (firstGeoResultPersonalizationType)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", firstGeoResultPersonalizationType, CFSTR("firstGeoResultPersonalizationType"));
  firstGeoResultTimeSinceLastVisit = self->_firstGeoResultTimeSinceLastVisit;
  if (firstGeoResultTimeSinceLastVisit)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", firstGeoResultTimeSinceLastVisit, CFSTR("firstGeoResultTimeSinceLastVisit"));
  firstGeoResultTimeUntilUpcomingEvent = self->_firstGeoResultTimeUntilUpcomingEvent;
  if (firstGeoResultTimeUntilUpcomingEvent)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", firstGeoResultTimeUntilUpcomingEvent, CFSTR("firstGeoResultTimeUntilUpcomingEvent"));
  firstGeoResultWasReranked = self->_firstGeoResultWasReranked;
  if (firstGeoResultWasReranked)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", firstGeoResultWasReranked, CFSTR("firstGeoResultWasReranked"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_geoResultsViewed);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("geoResultsViewed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_geoResultWasTopHit);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("geoResultWasTopHit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_interaction);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("interaction"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_numberOfPersonalGeoResults);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("numberOfPersonalGeoResults"));

  trialDeploymentId = self->_trialDeploymentId;
  if (trialDeploymentId)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", trialDeploymentId, CFSTR("trialDeploymentId"));
  trialExperimentId = self->_trialExperimentId;
  if (trialExperimentId)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", trialExperimentId, CFSTR("trialExperimentId"));
  trialTreatmentId = self->_trialTreatmentId;
  if (trialTreatmentId)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", trialTreatmentId, CFSTR("trialTreatmentId"));
  v28 = (void *)objc_msgSend(v4, "copy");

  return v28;
}

- (NSNumber)engagedGeoResultEntityRelevanceScore
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEngagedGeoResultEntityRelevanceScore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)engagedGeoResultNumberOfVisits
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEngagedGeoResultNumberOfVisits:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)engagedGeoResultNumberOfVisitsGivenLocation
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEngagedGeoResultNumberOfVisitsGivenLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)engagedGeoResultPersonalizationType
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEngagedGeoResultPersonalizationType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)engagedGeoResultPosition
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEngagedGeoResultPosition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)engagedGeoResultTimeSinceLastVisit
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEngagedGeoResultTimeSinceLastVisit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)engagedGeoResultTimeUntilUpcomingEvent
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEngagedGeoResultTimeUntilUpcomingEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)engagedResultWasTopHit
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEngagedResultWasTopHit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSNumber)firstGeoResultEntityRelevanceScore
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFirstGeoResultEntityRelevanceScore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)firstGeoResultIsCandidateForPromotion
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFirstGeoResultIsCandidateForPromotion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)firstGeoResultNumberOfVisits
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFirstGeoResultNumberOfVisits:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)firstGeoResultNumberOfVisitsGivenLocation
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFirstGeoResultNumberOfVisitsGivenLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)firstGeoResultPersonalizationType
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFirstGeoResultPersonalizationType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSNumber)firstGeoResultTimeSinceLastVisit
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFirstGeoResultTimeSinceLastVisit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSNumber)firstGeoResultTimeUntilUpcomingEvent
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFirstGeoResultTimeUntilUpcomingEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSNumber)firstGeoResultWasReranked
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFirstGeoResultWasReranked:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (BOOL)geoResultsViewed
{
  return self->_geoResultsViewed;
}

- (void)setGeoResultsViewed:(BOOL)a3
{
  self->_geoResultsViewed = a3;
}

- (BOOL)geoResultWasTopHit
{
  return self->_geoResultWasTopHit;
}

- (void)setGeoResultWasTopHit:(BOOL)a3
{
  self->_geoResultWasTopHit = a3;
}

- (unint64_t)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(unint64_t)a3
{
  self->_interaction = a3;
}

- (unint64_t)numberOfPersonalGeoResults
{
  return self->_numberOfPersonalGeoResults;
}

- (void)setNumberOfPersonalGeoResults:(unint64_t)a3
{
  self->_numberOfPersonalGeoResults = a3;
}

- (NSString)trialDeploymentId
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTrialDeploymentId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSString)trialExperimentId
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTrialExperimentId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)trialTreatmentId
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTrialTreatmentId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_firstGeoResultWasReranked, 0);
  objc_storeStrong((id *)&self->_firstGeoResultTimeUntilUpcomingEvent, 0);
  objc_storeStrong((id *)&self->_firstGeoResultTimeSinceLastVisit, 0);
  objc_storeStrong((id *)&self->_firstGeoResultPersonalizationType, 0);
  objc_storeStrong((id *)&self->_firstGeoResultNumberOfVisitsGivenLocation, 0);
  objc_storeStrong((id *)&self->_firstGeoResultNumberOfVisits, 0);
  objc_storeStrong((id *)&self->_firstGeoResultIsCandidateForPromotion, 0);
  objc_storeStrong((id *)&self->_firstGeoResultEntityRelevanceScore, 0);
  objc_storeStrong((id *)&self->_engagedResultWasTopHit, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultTimeUntilUpcomingEvent, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultTimeSinceLastVisit, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultPosition, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultPersonalizationType, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultNumberOfVisitsGivenLocation, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultNumberOfVisits, 0);
  objc_storeStrong((id *)&self->_engagedGeoResultEntityRelevanceScore, 0);
}

@end
