@implementation RTVehicleEventMO

- (id)mapItem
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[RTVehicleEventMO willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("mapItem"));
  -[RTVehicleEventMO cachedMapItem](self, "cachedMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTVehicleEventMO cachedMapItem](self, "cachedMapItem");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v5, "setFetchLimit:", 1);
    v6 = (void *)MEMORY[0x1E0CB3880];
    -[RTVehicleEventMO mapItemIdentifier](self, "mapItemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredicate:", v8);

    v13 = 0;
    objc_msgSend(v5, "execute:", &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Error fulfilling transient property mapItem, %@", buf, 0xCu);
      }

    }
    -[RTVehicleEventMO didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("mapItem"));
    objc_msgSend(v9, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleEventMO setCachedMapItem:](self, "setCachedMapItem:", v12);

    return v12;
  }
}

- (void)setMapItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[RTVehicleEventMO willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mapItem"));
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleEventMO setMapItemIdentifier:](self, "setMapItemIdentifier:", v5);

  -[RTVehicleEventMO setCachedMapItem:](self, "setCachedMapItem:", v4);
  -[RTVehicleEventMO didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mapItem"));
}

+ (id)managedObjectWithVehicleEvent:(id)a3 inManagedObjectContext:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v5 = (void *)MEMORY[0x1E0C97B20];
  v6 = a4;
  v7 = a3;
  +[NSManagedObject entityName](RTVehicleEventMO, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertNewObjectForEntityForName:inManagedObjectContext:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDate:", v10);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "latitude");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocLatitude:", v13);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "longitude");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocLongitude:", v16);

  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "location");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "horizontalUncertainty");
  objc_msgSend(v17, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocUncertainty:", v19);

  objc_msgSend(v7, "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocDate:", v21);

  v22 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithUnsignedInt:", objc_msgSend(v23, "referenceFrame"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocReferenceFrame:", v24);

  objc_msgSend(v7, "vehicleIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVehicleIdentifier:", v25);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "userSetLocation"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserSetLocation:", v26);

  objc_msgSend(v7, "notes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNotes:", v27);

  objc_msgSend(v7, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentifier:", v29);

  objc_msgSend(v7, "photo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPhotoData:", v30);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "locationQuality"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocationQuality:", v31);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "usualLocation"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUsualLocation:", v32);

  objc_msgSend(v7, "mapItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "identifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMapItemIdentifier:", v34);

  return v9;
}

- (RTMapItemMO)cachedMapItem
{
  return self->cachedMapItem;
}

- (void)setCachedMapItem:(id)a3
{
  objc_storeStrong((id *)&self->cachedMapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedMapItem, 0);
}

@end
