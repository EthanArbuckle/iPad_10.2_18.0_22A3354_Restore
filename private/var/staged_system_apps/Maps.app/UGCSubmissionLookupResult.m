@implementation UGCSubmissionLookupResult

- (UGCSubmissionLookupResult)initWithSubmissionIdentifier:(id)a3 previousSubmission:(id)a4
{
  id v7;
  id v8;
  UGCSubmissionLookupResult *v9;
  UGCSubmissionLookupResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UGCSubmissionLookupResult;
  v9 = -[UGCSubmissionLookupResult init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentSubmissionIdentifier, a3);
    objc_storeStrong((id *)&v10->_previousSubmission, a4);
    v10->_status = 1;
  }

  return v10;
}

- (UGCSubmissionLookupResult)initWithRatingsSubmissionIdentifier:(id)a3 photosSubmissionIdentifier:(id)a4 previousSubmission:(id)a5
{
  id v9;
  id v10;
  id v11;
  UGCSubmissionLookupResult *v12;
  UGCSubmissionLookupResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UGCSubmissionLookupResult;
  v12 = -[UGCSubmissionLookupResult init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_ratingsSubmissionIdentifier, a3);
    objc_storeStrong((id *)&v13->_photosSubmissionIdentifier, a4);
    objc_storeStrong((id *)&v13->_previousSubmission, a5);
    v13->_status = 1;
  }

  return v13;
}

- (UGCSubmissionLookupResult)initWithError:(id)a3
{
  id v4;
  UGCSubmissionLookupResult *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UGCSubmissionLookupResult;
  v5 = -[UGCSubmissionLookupResult init](&v7, "init");
  if (v5)
    v5->_status = +[UGCSubmissionLookupResult _statusFromError:](UGCSubmissionLookupResult, "_statusFromError:", v4);

  return v5;
}

+ (int64_t)_statusFromError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  int64_t v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v6 = GEOErrorDomain(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v5, "isEqualToString:", v7);

    if (v8 && (v9 = objc_msgSend(v4, "code"), v9 == (id)-8))
    {
      v11 = 3;
    }
    else if ((unint64_t)(MKCurrentNetworkConnectionFailureDiagnosis(v9, v10) - 1) >= 3)
    {
      v11 = 2;
    }
    else
    {
      v11 = 4;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)hasUserUploadedImages
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSubmissionLookupResult previousSubmission](self, "previousSubmission"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "images"));
  v4 = v3 != 0;

  return v4;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)parentSubmissionIdentifier
{
  return self->_parentSubmissionIdentifier;
}

- (GEORPPoiEnrichment)previousSubmission
{
  return self->_previousSubmission;
}

- (NSString)ratingsSubmissionIdentifier
{
  return self->_ratingsSubmissionIdentifier;
}

- (NSString)photosSubmissionIdentifier
{
  return self->_photosSubmissionIdentifier;
}

- (BOOL)hasRatingsWithICloud
{
  return self->_hasRatingsWithICloud;
}

- (void)setHasRatingsWithICloud:(BOOL)a3
{
  self->_hasRatingsWithICloud = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosSubmissionIdentifier, 0);
  objc_storeStrong((id *)&self->_ratingsSubmissionIdentifier, 0);
  objc_storeStrong((id *)&self->_previousSubmission, 0);
  objc_storeStrong((id *)&self->_parentSubmissionIdentifier, 0);
}

@end
