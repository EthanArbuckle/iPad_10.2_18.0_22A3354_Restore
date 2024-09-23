@implementation UGCSubmissionFields

- (UGCSubmissionFields)init
{
  UGCSubmissionFields *v2;
  NSMutableArray *v3;
  NSMutableArray *photos;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UGCSubmissionFields;
  v2 = -[UGCSubmissionFields init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    photos = v2->_photos;
    v2->_photos = v3;

  }
  return v2;
}

- (GEORPPoiEnrichmentUpdate)poiEnrichment
{
  GEORPPoiEnrichmentUpdate *poiEnrichment;
  GEORPPoiEnrichmentUpdate *v4;
  GEORPPoiEnrichmentUpdate *v5;

  poiEnrichment = self->_poiEnrichment;
  if (!poiEnrichment)
  {
    v4 = (GEORPPoiEnrichmentUpdate *)objc_alloc_init((Class)GEORPPoiEnrichmentUpdate);
    v5 = self->_poiEnrichment;
    self->_poiEnrichment = v4;

    poiEnrichment = self->_poiEnrichment;
  }
  return poiEnrichment;
}

- (GEORPIncidentFeedback)incidentFeedback
{
  GEORPIncidentFeedback *incidentFeedback;
  GEORPIncidentFeedback *v4;
  GEORPIncidentFeedback *v5;

  incidentFeedback = self->_incidentFeedback;
  if (!incidentFeedback)
  {
    v4 = (GEORPIncidentFeedback *)objc_alloc_init((Class)GEORPIncidentFeedback);
    v5 = self->_incidentFeedback;
    self->_incidentFeedback = v4;

    incidentFeedback = self->_incidentFeedback;
  }
  return incidentFeedback;
}

- (NSArray)photoList
{
  return (NSArray *)-[NSMutableArray copy](self->_photos, "copy");
}

- (void)addPhoto:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_photos, "containsObject:") & 1) == 0)
    -[NSMutableArray addObject:](self->_photos, "addObject:", v4);

}

- (GEORPFeedbackUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)parentSubmissionIdentifier
{
  return self->_parentSubmissionIdentifier;
}

- (void)setParentSubmissionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentSubmissionIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_incidentFeedback, 0);
  objc_storeStrong((id *)&self->_poiEnrichment, 0);
  objc_storeStrong((id *)&self->_photos, 0);
}

@end
