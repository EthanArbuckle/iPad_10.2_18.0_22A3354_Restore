@implementation PersonalizedMapItemKey

- (PersonalizedMapItemKey)init
{

  return 0;
}

- (PersonalizedMapItemKey)initWithGeoMapItem:(id)a3
{
  id v5;
  PersonalizedMapItemKey *v6;
  PersonalizedMapItemKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PersonalizedMapItemKey;
  v6 = -[PersonalizedMapItemKey init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_geoMapItem, a3);
    v7->_hash = GEOMapItemHashForPurpose(v5, 5);
  }

  return v7;
}

- (PersonalizedMapItemKey)initWithGeoMapItem:(id)a3 disambiguationRadiusMeters:(float)a4
{
  PersonalizedMapItemKey *result;

  result = -[PersonalizedMapItemKey initWithGeoMapItem:](self, "initWithGeoMapItem:", a3);
  if (result)
  {
    result->_hasDisambiguationRadiusMeters = 1;
    result->_disambiguationRadiusMeters = a4;
  }
  return result;
}

- (PersonalizedMapItemKey)initWithMapItem:(id)a3
{
  void *v4;
  PersonalizedMapItemKey *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_geoMapItem"));
  v5 = -[PersonalizedMapItemKey initWithGeoMapItem:](self, "initWithGeoMapItem:", v4);

  return v5;
}

- (PersonalizedMapItemKey)initWithMapItem:(id)a3 disambiguationRadiusMeters:(float)a4
{
  void *v6;
  double v7;
  PersonalizedMapItemKey *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_geoMapItem"));
  *(float *)&v7 = a4;
  v8 = -[PersonalizedMapItemKey initWithGeoMapItem:disambiguationRadiusMeters:](self, "initWithGeoMapItem:disambiguationRadiusMeters:", v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PersonalizedMapItemKey *v4;
  PersonalizedMapItemKey *v5;
  uint64_t v6;
  PersonalizedMapItemKey *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  float v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  int IsEqualToMapItemForPurposeWithinDistance;
  PersonalizedMapItemKey *v19;
  double v20;

  v4 = (PersonalizedMapItemKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      v6 = objc_opt_class(self);
      if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      {
        v7 = v5;
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedMapItemKey geoMapItem](self, "geoMapItem"));
        v9 = objc_claimAutoreleasedReturnValue(-[PersonalizedMapItemKey geoMapItem](v7, "geoMapItem"));
        v10 = (void *)v9;
        LOBYTE(v11) = 0;
        if (!v8 || !v9)
          goto LABEL_24;
        if (-[PersonalizedMapItemKey hasDisambiguationRadiusMeters](self, "hasDisambiguationRadiusMeters")
          && -[PersonalizedMapItemKey hasDisambiguationRadiusMeters](v7, "hasDisambiguationRadiusMeters"))
        {
          -[PersonalizedMapItemKey disambiguationRadiusMeters](self, "disambiguationRadiusMeters");
          v13 = v12;
          -[PersonalizedMapItemKey disambiguationRadiusMeters](v7, "disambiguationRadiusMeters");
          v15 = fmaxf(v13, v14);
        }
        else
        {
          if (-[PersonalizedMapItemKey hasDisambiguationRadiusMeters](self, "hasDisambiguationRadiusMeters"))
          {
            v19 = self;
          }
          else
          {
            if (!-[PersonalizedMapItemKey hasDisambiguationRadiusMeters](v7, "hasDisambiguationRadiusMeters"))
            {
              v20 = GEOMapItemEquivalenceDistanceThresholdForPOIDeduplication;
              goto LABEL_23;
            }
            v19 = v7;
          }
          -[PersonalizedMapItemKey disambiguationRadiusMeters](v19, "disambiguationRadiusMeters");
        }
        v20 = v15;
LABEL_23:
        LOBYTE(v11) = GEOMapItemIsEqualToMapItemForPurposeWithinDistance(v8, v10, 5, v20);
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      if (-[PersonalizedMapItemKey conformsToProtocol:](v5, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedItemKeyWithGEOMapItem))
      {
        v7 = (PersonalizedMapItemKey *)objc_claimAutoreleasedReturnValue(-[PersonalizedMapItemKey geoMapItem](v5, "geoMapItem"));
        if (v7
          && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedMapItemKey geoMapItem](self, "geoMapItem")),
              v16,
              v16))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedMapItemKey geoMapItem](self, "geoMapItem"));
          IsEqualToMapItemForPurposeWithinDistance = GEOMapItemIsEqualToMapItemForPurposeWithinDistance(v17, v7, 5, GEOMapItemEquivalenceDistanceThresholdForPOIDeduplication);

          v11 = IsEqualToMapItemForPurposeWithinDistance << 31 >> 31;
        }
        else
        {
          LOBYTE(v11) = 0;
        }
        goto LABEL_25;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_26:

  return v11 & 1;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (GEOMapItem)geoMapItem
{
  return self->_geoMapItem;
}

- (BOOL)hasDisambiguationRadiusMeters
{
  return self->_hasDisambiguationRadiusMeters;
}

- (float)disambiguationRadiusMeters
{
  return self->_disambiguationRadiusMeters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoMapItem, 0);
}

@end
