@implementation UGCSubmissionParameters

- (UGCSubmissionParameters)initWithRequestParameters:(id)a3 attachedImages:(id)a4
{
  id v7;
  id v8;
  UGCSubmissionParameters *v9;
  UGCSubmissionParameters *v10;
  void *v11;
  uint64_t v12;
  GEOMapServiceTraits *traits;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UGCSubmissionParameters;
  v9 = -[UGCSubmissionParameters init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestParams, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "defaultTraits"));
    traits = v10->_traits;
    v10->_traits = (GEOMapServiceTraits *)v12;

    if ((sub_100847AC0() & 1) == 0)
      -[GEOMapServiceTraits setDeviceLocation:](v10->_traits, "setDeviceLocation:", 0);
    objc_storeStrong((id *)&v10->_attachedImages, a4);
  }

  return v10;
}

- (GEORPFeedbackRequestParameters)requestParams
{
  return self->_requestParams;
}

- (NSArray)attachedImages
{
  return self->_attachedImages;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_attachedImages, 0);
  objc_storeStrong((id *)&self->_requestParams, 0);
}

@end
