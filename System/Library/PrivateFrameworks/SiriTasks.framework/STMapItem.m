@implementation STMapItem

- (STMapItem)initWithMKMapItem:(id)a3
{
  id v4;
  STMapItem *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  void *v10;
  uint64_t v11;
  CLLocation *location;
  uint64_t v13;
  NSData *placeData;
  uint64_t v15;
  NSNumber *businessID;
  void *v17;
  uint64_t v18;
  NSNumber *localSearchProviderID;
  objc_super v21;

  v4 = a3;
  if (initWithMKMapItem__onceToken != -1)
    dispatch_once(&initWithMKMapItem__onceToken, &__block_literal_global);
  v21.receiver = self;
  v21.super_class = (Class)STMapItem;
  v5 = -[STMapItem init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v7;

    objc_msgSend(v4, "placemark");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    location = v5->_location;
    v5->_location = (CLLocation *)v11;

    objc_msgSend(v4, "_placeDataAsData");
    v13 = objc_claimAutoreleasedReturnValue();
    placeData = v5->_placeData;
    v5->_placeData = (NSData *)v13;

    v5->_isCurrentLocation = objc_msgSend(v4, "isCurrentLocation");
    if (objc_msgSend(v4, "_hasMUID"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "_muid"));
      v15 = objc_claimAutoreleasedReturnValue();
      businessID = v5->_businessID;
      v5->_businessID = (NSNumber *)v15;

    }
    objc_msgSend(v4, "_geoMapItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "_hasResultProviderID"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v17, "_resultProviderID"));
      v18 = objc_claimAutoreleasedReturnValue();
      localSearchProviderID = v5->_localSearchProviderID;
      v5->_localSearchProviderID = (NSNumber *)v18;

    }
  }

  return v5;
}

- (id)_aceContextObjectValue
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BE81408]);
  v4 = objc_alloc_init(MEMORY[0x24BE81450]);
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CLLocation coordinate](self->_location, "coordinate");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLatitude:", v6);

  v7 = (void *)MEMORY[0x24BDD16E0];
  -[CLLocation coordinate](self->_location, "coordinate");
  objc_msgSend(v7, "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLongitude:", v9);

  objc_msgSend(v3, "setLocation:", v4);
  objc_msgSend(v3, "setLabel:", self->_title);
  objc_msgSend(v3, "setPlaceData2:", self->_placeData);
  objc_msgSend(v3, "setLocalSearchProviderId:", self->_localSearchProviderID);
  if (self->_isCurrentLocation)
  {
    objc_msgSend(v3, "setDetailType:", *MEMORY[0x24BE82300]);
  }
  else if (self->_businessID)
  {
    objc_msgSend(v3, "setDetailType:", *MEMORY[0x24BE822F8]);
    v10 = objc_alloc_init(MEMORY[0x24BE813E8]);
    if (self->_businessID)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("urn:places:%lld"), -[NSNumber unsignedLongLongValue](self->_businessID, "unsignedLongLongValue"));
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v11);
      objc_msgSend(v10, "setIdentifier:", v12);

    }
    objc_msgSend(v3, "setDetail:", v10);

  }
  return v3;
}

- (Class)_aceCollectionClass
{
  return (Class)objc_opt_class();
}

- (STMapItem)initWithCoder:(id)a3
{
  id v4;
  STMapItem *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  CLLocation *location;
  uint64_t v10;
  NSData *placeData;
  uint64_t v12;
  NSNumber *businessID;
  uint64_t v14;
  NSNumber *localSearchProviderID;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STMapItem;
  v5 = -[STSiriModelObject initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_location"));
    v8 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_placeData"));
    v10 = objc_claimAutoreleasedReturnValue();
    placeData = v5->_placeData;
    v5->_placeData = (NSData *)v10;

    v5->_isCurrentLocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isCurrentLocation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_businessID"));
    v12 = objc_claimAutoreleasedReturnValue();
    businessID = v5->_businessID;
    v5->_businessID = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localSearchProviderID"));
    v14 = objc_claimAutoreleasedReturnValue();
    localSearchProviderID = v5->_localSearchProviderID;
    v5->_localSearchProviderID = (NSNumber *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STMapItem;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("_title"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_location, CFSTR("_location"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_placeData, CFSTR("_placeData"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isCurrentLocation, CFSTR("_isCurrentLocation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_businessID, CFSTR("_businessID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localSearchProviderID, CFSTR("_localSearchProviderID"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSearchProviderID, 0);
  objc_storeStrong((id *)&self->_businessID, 0);
  objc_storeStrong((id *)&self->_placeData, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

id __31__STMapItem_initWithMKMapItem___block_invoke()
{
  if (initMKMapItem_sOnce != -1)
    dispatch_once(&initMKMapItem_sOnce, &__block_literal_global_48);
  return objc_retainAutorelease((id)classMKMapItem);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
