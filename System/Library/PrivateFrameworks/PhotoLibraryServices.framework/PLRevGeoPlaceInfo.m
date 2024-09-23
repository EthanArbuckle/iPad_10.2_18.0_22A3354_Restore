@implementation PLRevGeoPlaceInfo

- (PLRevGeoPlaceInfo)initWithPlaceName:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLRevGeoPlaceInfo;
  v5 = -[PLRevGeoPlaceInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    v5[8] = 0;
    *(_OWORD *)(v5 + 24) = xmmword_199B9FE30;
  }

  return (PLRevGeoPlaceInfo *)v5;
}

- (void)addPlaceInfoArea:(double)maximumArea
{
  double minimumArea;

  if (maximumArea != 0.0)
  {
    self->_hasArea = 1;
    minimumArea = self->_minimumArea;
    if (minimumArea >= maximumArea)
      minimumArea = maximumArea;
    if (self->_maximumArea >= maximumArea)
      maximumArea = self->_maximumArea;
    self->_minimumArea = minimumArea;
    self->_maximumArea = maximumArea;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_placeName, PLRevGeoPlaceInfoPlaceNameKey);
  if (self->_hasArea)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", PLRevGeoPlaceInfoMinimumAreaKey, self->_minimumArea);
    objc_msgSend(v4, "encodeDouble:forKey:", PLRevGeoPlaceInfoMaximumAreaKey, self->_maximumArea);
  }

}

- (PLRevGeoPlaceInfo)initWithCoder:(id)a3
{
  id v4;
  PLRevGeoPlaceInfo *v5;
  uint64_t v6;
  NSString *placeName;
  int v8;
  int v9;
  double v10;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLRevGeoPlaceInfo;
  v5 = -[PLRevGeoPlaceInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), PLRevGeoPlaceInfoPlaceNameKey);
    v6 = objc_claimAutoreleasedReturnValue();
    placeName = v5->_placeName;
    v5->_placeName = (NSString *)v6;

    v8 = objc_msgSend(v4, "containsValueForKey:", PLRevGeoPlaceInfoMinimumAreaKey);
    v9 = objc_msgSend(v4, "containsValueForKey:", PLRevGeoPlaceInfoMaximumAreaKey);
    if (v8)
    {
      if (v9)
      {
        objc_msgSend(v4, "decodeDoubleForKey:", PLRevGeoPlaceInfoMinimumAreaKey);
        v5->_minimumArea = v10;
        objc_msgSend(v4, "decodeDoubleForKey:", PLRevGeoPlaceInfoMaximumAreaKey);
        v5->_maximumArea = v11;
        v5->_hasArea = v11 != 0.0;
      }
    }
  }

  return v5;
}

- (NSString)placeName
{
  return self->_placeName;
}

- (BOOL)hasArea
{
  return self->_hasArea;
}

- (double)minimumArea
{
  return self->_minimumArea;
}

- (double)maximumArea
{
  return self->_maximumArea;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
