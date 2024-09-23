@implementation ATXHeroEntry

- (ATXHeroEntry)initWithAdamId:(unint64_t)a3 urlHash:(id)a4 location:(CLLocationCoordinate2D)a5 radiusInMeters:(unint64_t)a6 rank:(unint64_t)a7 isTouristApp:(BOOL)a8 poiCategory:(id)a9 poiMuid:(id)a10
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v18;
  id v19;
  id v20;
  ATXHeroEntry *v21;
  ATXHeroEntry *v22;
  objc_super v25;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v18 = a4;
  v19 = a9;
  v20 = a10;
  v25.receiver = self;
  v25.super_class = (Class)ATXHeroEntry;
  v21 = -[ATXHeroEntry init](&v25, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_adamId = a3;
    objc_storeStrong((id *)&v21->_urlHash, a4);
    v22->_location.latitude = latitude;
    v22->_location.longitude = longitude;
    v22->_radiusInMeters = a6;
    v22->_rank = a7;
    v22->_isTouristApp = a8;
    objc_storeStrong((id *)&v22->_poiCategory, a9);
    objc_storeStrong((id *)&v22->_poiMuid, a10);
  }

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  ATXHeroEntry *v4;
  ATXHeroEntry *v5;
  BOOL v6;

  v4 = (ATXHeroEntry *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXHeroEntry isEqualToAppAndClipEntry:](self, "isEqualToAppAndClipEntry:", v5);

  return v6;
}

- (BOOL)isEqualToAppAndClipEntry:(id)a3
{
  id v4;
  unint64_t adamId;
  NSString *urlHash;
  NSString *v7;
  char v8;
  double latitude;
  double v11;
  double longitude;
  double v13;
  unint64_t radiusInMeters;
  unint64_t rank;
  uint64_t isTouristApp;
  NSString *poiCategory;
  uint64_t v18;
  void *v19;
  NSString *v20;
  void *v21;

  v4 = a3;
  adamId = self->_adamId;
  if (adamId != objc_msgSend(v4, "adamId"))
  {
    v8 = 0;
    goto LABEL_6;
  }
  urlHash = self->_urlHash;
  objc_msgSend(v4, "urlHash");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (urlHash == v7
    && (latitude = self->_location.latitude, objc_msgSend(v4, "location"), latitude == v11)
    && (longitude = self->_location.longitude, objc_msgSend(v4, "location"), longitude == v13)
    && (radiusInMeters = self->_radiusInMeters, radiusInMeters == objc_msgSend(v4, "radiusInMeters"))
    && (rank = self->_rank, rank == objc_msgSend(v4, "rank"))
    && (isTouristApp = self->_isTouristApp, (_DWORD)isTouristApp == objc_msgSend(v4, "isTouristApp")))
  {
    poiCategory = self->_poiCategory;
    if (!poiCategory)
    {
      objc_msgSend(v4, "poiCategory");
      isTouristApp = objc_claimAutoreleasedReturnValue();
      if (!isTouristApp)
      {
        v8 = 1;
LABEL_20:

        goto LABEL_4;
      }
    }
    objc_msgSend(v4, "poiCategory");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      v20 = self->_poiCategory;
      objc_msgSend(v4, "poiCategory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSString isEqualToString:](v20, "isEqualToString:", v21);

      if (!poiCategory)
        goto LABEL_20;
    }
    else
    {
      v8 = 0;
      if (!poiCategory)
        goto LABEL_20;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_4:

LABEL_6:
  return v8;
}

- (id)heroDataForLocation:(id)a3
{
  id v4;

  v4 = objc_alloc(MEMORY[0x24BE4CC50]);
  return (id)objc_msgSend(v4, "initWithPredictedAdamId:bundleId:latitude:longitude:radiusInMeters:rank:isTouristApp:score:urlHash:clipMetadata:poiCategory:poiMuid:", self->_adamId, *MEMORY[0x24BE4CC90], self->_radiusInMeters, self->_rank, self->_isTouristApp, self->_urlHash, self->_location.latitude, self->_location.longitude, (double)(unint64_t)*MEMORY[0x24BE4CC80], 0, self->_poiCategory, self->_poiMuid);
}

- (unint64_t)adamId
{
  return self->_adamId;
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (CLLocationCoordinate2D)location
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_location.latitude;
  longitude = self->_location.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (unint64_t)radiusInMeters
{
  return self->_radiusInMeters;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (BOOL)isTouristApp
{
  return self->_isTouristApp;
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (NSNumber)poiMuid
{
  return self->_poiMuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiMuid, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_urlHash, 0);
}

@end
