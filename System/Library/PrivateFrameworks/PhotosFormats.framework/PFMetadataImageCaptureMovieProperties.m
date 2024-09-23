@implementation PFMetadataImageCaptureMovieProperties

- (PFMetadataImageCaptureMovieProperties)initWithImageCaptureMovieProperties:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v9;
  PFMetadataImageCaptureMovieProperties *v10;
  PFMetadataImageCaptureMovieProperties *v11;
  objc_super v13;

  v9 = a3;
  if (v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)PFMetadataImageCaptureMovieProperties;
    v10 = -[PFMetadata initWithContentType:options:timeZoneLookup:](&v13, sel_initWithContentType_options_timeZoneLookup_, a4, 12, a5);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_iccMovieProperties, a3);
      -[PFMetadata setSourceType:](v11, "setSourceType:", 11);
    }
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (BOOL)configureWithMetadataPlist:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSDictionary *v6;
  NSDictionary *iccMovieProperties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFMetadataImageCaptureMovieProperties;
  v5 = -[PFMetadata configureWithMetadataPlist:](&v9, sel_configureWithMetadataPlist_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", PFMetadataICCMovieProperties);
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    iccMovieProperties = self->_iccMovieProperties;
    self->_iccMovieProperties = v6;

  }
  return v5;
}

- (id)originalFilenamee
{
  return -[NSDictionary objectForKeyedSubscript:](self->_iccMovieProperties, "objectForKeyedSubscript:", PFMetadataImageCapturePropertyCreatedFilename);
}

- (id)livePhotoPairingIdentifier
{
  return -[NSDictionary objectForKeyedSubscript:](self->_iccMovieProperties, "objectForKeyedSubscript:", PFMetadataImageCapturePropertyGroupUUID);
}

- (id)durationTimeInterval
{
  return -[NSDictionary objectForKeyedSubscript:](self->_iccMovieProperties, "objectForKeyedSubscript:", PFMetadataImageCapturePropertyDuration);
}

- (BOOL)isSloMo
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_iccMovieProperties, "objectForKeyedSubscript:", PFMetadataImageCapturePropertyHighFramerate);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isTimelapse
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_iccMovieProperties, "objectForKeyedSubscript:", PFMetadataImageCapturePropertyTimeLapse);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)_makeGPSProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v7;
  double v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_iccMovieProperties, "objectForKeyedSubscript:", PFMetadataImageCapturePropertyGPSString);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = 0.0;
    v8 = 0.0;
    v3 = 0;
    if (+[PFMetadataMovie parseISO6709String:outLatitude:outLongitude:](PFMetadataMovie, "parseISO6709String:outLatitude:outLongitude:", v2, &v8, &v7))
    {
      v9[0] = *MEMORY[0x1E0CBCD90];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v4;
      v9[1] = *MEMORY[0x1E0CBCDA0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)plistForEncoding
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFMetadataImageCaptureMovieProperties;
  -[PFMetadata plistForEncoding](&v6, sel_plistForEncoding);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_iccMovieProperties, PFMetadataICCMovieProperties);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iccMovieProperties, 0);
}

@end
