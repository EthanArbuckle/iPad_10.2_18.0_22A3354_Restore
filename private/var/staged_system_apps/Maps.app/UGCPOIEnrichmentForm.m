@implementation UGCPOIEnrichmentForm

+ (id)addPOIEnrichmentFormWithMapItem:(id)a3 photosForm:(id)a4 ratingsForm:(id)a5
{
  id v7;
  id v8;
  id v9;
  UGCPOIEnrichmentForm *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[UGCPOIEnrichmentForm initWithMapItem:actionType:photosForm:ratingsForm:]([UGCPOIEnrichmentForm alloc], "initWithMapItem:actionType:photosForm:ratingsForm:", v9, 0, v8, v7);

  return v10;
}

+ (id)editPOIEnrichmentFormWithMapItem:(id)a3 parentSubmissionIdentifier:(id)a4 photosForm:(id)a5 ratingsForm:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  UGCPOIEnrichmentForm *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[UGCPOIEnrichmentForm initWithMapItem:parentSubmissionIdentifier:photosForm:ratingsForm:]([UGCPOIEnrichmentForm alloc], "initWithMapItem:parentSubmissionIdentifier:photosForm:ratingsForm:", v12, v11, v10, v9);

  return v13;
}

- (UGCPOIEnrichmentForm)initWithMapItem:(id)a3 parentSubmissionIdentifier:(id)a4 photosForm:(id)a5 ratingsForm:(id)a6
{
  id v10;
  id v11;
  id v12;
  UGCPOIEnrichmentForm *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[UGCPOIEnrichmentForm initWithMapItem:actionType:photosForm:ratingsForm:]([UGCPOIEnrichmentForm alloc], "initWithMapItem:actionType:photosForm:ratingsForm:", v12, 1, v11, v10);

  if (v13)
    v13->_parentSubmissionIdentifier = (NSString *)a4;
  return v13;
}

- (UGCPOIEnrichmentForm)initWithMapItem:(id)a3 actionType:(int64_t)a4 photosForm:(id)a5 ratingsForm:(id)a6
{
  id v11;
  id v12;
  id v13;
  UGCPOIEnrichmentForm *v14;
  UGCPOIEnrichmentForm *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)UGCPOIEnrichmentForm;
  v14 = -[UGCForm init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_mapItem, a3);
    objc_storeStrong((id *)&v15->_photosForm, a5);
    objc_storeStrong((id *)&v15->_ratingsForm, a6);
    v15->_actionType = a4;
    -[UGCForm addObserver:](v15->_photosForm, "addObserver:", v15);
    -[UGCForm addObserver:](v15->_ratingsForm, "addObserver:", v15);
  }

  return v15;
}

- (BOOL)isComplete
{
  unsigned int v3;
  int64_t v4;

  if (-[UGCPOIEnrichmentForm passesMinimumRequirementsToBeSubmittable](self, "passesMinimumRequirementsToBeSubmittable"))
  {
    if (-[UGCRatingsForm isComplete](self->_ratingsForm, "isComplete"))
      v3 = 1;
    else
      v3 = -[UGCPhotosForm isComplete](self->_photosForm, "isComplete");
    v4 = -[UGCPOIEnrichmentForm actionType](self, "actionType");
    if (v4 == 2)
    {
      LOBYTE(v3) = 1;
    }
    else if (v4 == 1)
    {
      v3 &= -[UGCPOIEnrichmentForm isEdited](self, "isEdited");
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (int64_t)actionType
{
  if (self->_parentSubmissionIdentifier && -[UGCPOIEnrichmentForm isEmpty](self, "isEmpty"))
    return 2;
  else
    return self->_actionType;
}

- (BOOL)isEmpty
{
  _BOOL4 v3;

  v3 = -[UGCRatingsForm isEmpty](self->_ratingsForm, "isEmpty");
  if (v3)
    LOBYTE(v3) = -[UGCPhotosForm isEmpty](self->_photosForm, "isEmpty");
  return v3;
}

- (BOOL)isEdited
{
  if (-[UGCRatingsForm isEdited](self->_ratingsForm, "isEdited"))
    return 1;
  else
    return -[UGCPhotosForm isEdited](self->_photosForm, "isEdited");
}

- (BOOL)passesMinimumRequirementsToBeSubmittable
{
  UGCRatingsForm *ratingsForm;
  UGCPhotosForm *photosForm;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;

  ratingsForm = self->_ratingsForm;
  photosForm = self->_photosForm;
  if (!ratingsForm)
    goto LABEL_8;
  v5 = -[UGCRatingsForm passesMinimumRequirementsToBeSubmittable](ratingsForm, "passesMinimumRequirementsToBeSubmittable");
  v6 = v5;
  if (photosForm)
  {
    LOBYTE(v5) = 0;
    v7 = v6 == 0;
  }
  else
  {
    v7 = 1;
  }
  if (!v7)
  {
    photosForm = self->_photosForm;
LABEL_8:
    LOBYTE(v5) = -[UGCPhotosForm passesMinimumRequirementsToBeSubmittable](photosForm, "passesMinimumRequirementsToBeSubmittable");
  }
  return v5;
}

- (void)fillSubmissionFields:(id)a3
{
  id v4;

  v4 = a3;
  -[UGCPOIEnrichmentForm _fillSubmissionFields:](self, "_fillSubmissionFields:", v4);
  -[UGCRatingsForm fillSubmissionFields:](self->_ratingsForm, "fillSubmissionFields:", v4);
  -[UGCPhotosForm fillSubmissionFields:](self->_photosForm, "fillSubmissionFields:", v4);

}

- (void)fillSubmissionFieldsForPhotos:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UGCPOIEnrichmentForm _fillSubmissionFields:](self, "_fillSubmissionFields:", v5);
  -[UGCPhotosForm fillSubmissionFields:](self->_photosForm, "fillSubmissionFields:", v5);
  if ((id)-[UGCPOIEnrichmentForm actionType](self, "actionType") == (id)1
    || (id)-[UGCPOIEnrichmentForm actionType](self, "actionType") == (id)2)
  {
    if (-[NSString length](self->_parentSubmissionIdentifier, "length"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm parentSubmissionIdentifier](self->_photosForm, "parentSubmissionIdentifier"));
      objc_msgSend(v5, "setParentSubmissionIdentifier:", v4);

    }
  }

}

- (void)fillSubmissionFieldsForRatings:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UGCPOIEnrichmentForm _fillSubmissionFields:](self, "_fillSubmissionFields:", v5);
  -[UGCRatingsForm fillSubmissionFields:](self->_ratingsForm, "fillSubmissionFields:", v5);
  if ((id)-[UGCPOIEnrichmentForm actionType](self, "actionType") == (id)1
    || (id)-[UGCPOIEnrichmentForm actionType](self, "actionType") == (id)2)
  {
    if (-[NSString length](self->_parentSubmissionIdentifier, "length"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsForm parentSubmissionIdentifier](self->_ratingsForm, "parentSubmissionIdentifier"));
      objc_msgSend(v5, "setParentSubmissionIdentifier:", v4);

    }
  }

}

- (void)_fillSubmissionFields:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "poiEnrichment"));
  if ((id)-[UGCPOIEnrichmentForm actionType](self, "actionType") == (id)2)
    v5 = 2;
  else
    v5 = 1;
  objc_msgSend(v4, "setAction:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_placeData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEORPPoiEnrichmentPlaceContext buildPlaceContextWithPlaceData:](GEORPPoiEnrichmentPlaceContext, "buildPlaceContextWithPlaceData:", v7));
  objc_msgSend(v4, "setPlaceContext:", v8);

  if ((id)-[UGCPOIEnrichmentForm actionType](self, "actionType") == (id)1
    || (id)-[UGCPOIEnrichmentForm actionType](self, "actionType") == (id)2)
  {
    if (-[NSString length](self->_parentSubmissionIdentifier, "length"))
      objc_msgSend(v9, "setParentSubmissionIdentifier:", self->_parentSubmissionIdentifier);
  }

}

- (id)parentSubmissionIdentifier
{
  return self->_parentSubmissionIdentifier;
}

- (void)setParentSubmissionIdentifier:(id)a3
{
  self->_parentSubmissionIdentifier = (NSString *)a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (UGCPhotosForm)photosForm
{
  return self->_photosForm;
}

- (UGCRatingsForm)ratingsForm
{
  return self->_ratingsForm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingsForm, 0);
  objc_storeStrong((id *)&self->_photosForm, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
