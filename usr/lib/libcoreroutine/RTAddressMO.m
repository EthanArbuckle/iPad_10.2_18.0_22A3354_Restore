@implementation RTAddressMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTAddressMO"));
}

+ (id)managedObjectWithAddress:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithAddress:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (id)managedObjectWithAddress:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  NSObject *v13;
  RTAddressMO *v14;
  const char *v15;
  uint8_t *v16;
  RTAddressMO *v17;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int16 v40;
  __int16 v41;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v41 = 0;
    v15 = "Invalid parameter not satisfying: address";
    v16 = (uint8_t *)&v41;
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v15, v16, 2u);
    goto LABEL_12;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v40 = 0;
    v15 = "Invalid parameter not satisfying: managedObjectContext";
    v16 = (uint8_t *)&v40;
    goto LABEL_17;
  }
  objc_msgSend(v8, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "managedObjectContext");
    v13 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject allowTombstones](v13, "allowTombstones") & 1) != 0 || (objc_msgSend(v8, "flags") & 1) == 0)
    {

      goto LABEL_7;
    }
LABEL_12:

    v17 = 0;
    goto LABEL_15;
  }
LABEL_7:
  if (v8)
    v14 = (RTAddressMO *)v8;
  else
    v14 = -[RTAddressMO initWithContext:]([RTAddressMO alloc], "initWithContext:", v10);
  v17 = v14;
  objc_msgSend(v7, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTCloudManagedObject setIdentifier:](v17, "setIdentifier:", v18);

  objc_msgSend(v7, "geoAddressData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setGeoAddressData:](v17, "setGeoAddressData:", v19);

  objc_msgSend(v7, "subPremises");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setSubPremises:](v17, "setSubPremises:", v20);

  objc_msgSend(v7, "subThoroughfare");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setSubThoroughfare:](v17, "setSubThoroughfare:", v21);

  objc_msgSend(v7, "thoroughfare");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setThoroughfare:](v17, "setThoroughfare:", v22);

  objc_msgSend(v7, "subLocality");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setSubLocality:](v17, "setSubLocality:", v23);

  objc_msgSend(v7, "locality");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setLocality:](v17, "setLocality:", v24);

  objc_msgSend(v7, "subAdministrativeArea");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setSubAdministrativeArea:](v17, "setSubAdministrativeArea:", v25);

  objc_msgSend(v7, "administrativeArea");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setAdministrativeArea:](v17, "setAdministrativeArea:", v26);

  objc_msgSend(v7, "administrativeAreaCode");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setAdministrativeAreaCode:](v17, "setAdministrativeAreaCode:", v27);

  objc_msgSend(v7, "postalCode");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setPostalCode:](v17, "setPostalCode:", v28);

  objc_msgSend(v7, "country");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setCountry:](v17, "setCountry:", v29);

  objc_msgSend(v7, "countryCode");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setCountryCode:](v17, "setCountryCode:", v30);

  objc_msgSend(v7, "inlandWater");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setInlandWater:](v17, "setInlandWater:", v31);

  objc_msgSend(v7, "ocean");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setOcean:](v17, "setOcean:", v32);

  objc_msgSend(v7, "areasOfInterest");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setAreasOfInterest:](v17, "setAreasOfInterest:", v33);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isIsland"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setIsland:](v17, "setIsland:", v34);

  objc_msgSend(v7, "creationDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setCreationDate:](v17, "setCreationDate:", v35);

  objc_msgSend(v7, "expirationDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setExpirationDate:](v17, "setExpirationDate:", v36);

  objc_msgSend(v7, "iso3166CountryCode");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setIso3166CountryCode:](v17, "setIso3166CountryCode:", v37);

  objc_msgSend(v7, "iso3166SubdivisionCode");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO setIso3166SubdivisionCode:](v17, "setIso3166SubdivisionCode:", v38);

LABEL_15:
  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
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

  v21 = (void *)MEMORY[0x1E0CB3940];
  -[RTCloudManagedObject identifier](self, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO geoAddressData](self, "geoAddressData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v23, "length");
  -[RTAddressMO subPremises](self, "subPremises");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO subThoroughfare](self, "subThoroughfare");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO thoroughfare](self, "thoroughfare");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO subLocality](self, "subLocality");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO locality](self, "locality");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO subAdministrativeArea](self, "subAdministrativeArea");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO administrativeArea](self, "administrativeArea");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO administrativeAreaCode](self, "administrativeAreaCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO postalCode](self, "postalCode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO country](self, "country");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO countryCode](self, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO inlandWater](self, "inlandWater");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO ocean](self, "ocean");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO areasOfInterest](self, "areasOfInterest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v17, "count");
  -[RTAddressMO island](self, "island");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO creationDate](self, "creationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO iso3166CountryCode](self, "iso3166CountryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTAddressMO iso3166SubdivisionCode](self, "iso3166SubdivisionCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("identifier, %@, geoAddressData.length, %lu, subPremises, %@, subThoroughfare, %@, thoroughfare, %@, subLocality, %@, locality, %@, subAdministrativeArea, %@, administrativeArea, %@, administrativeAreaCode, %@, postalCode, %@, country, %@, countryCode, %@, inlandWater, %@, ocean, %@, areasOfInterest.count, %lu, island, %@, creationDate, %@, expirationDate, %@, iso3166CountryCode, %@, iso3166SubdivisionCode, %@"), v30, v20, v26, v29, v19, v28, v18, v27, v25, v16, v24, v14, v3, v13, v12, v11,
    v4,
    v5,
    v7,
    v8,
    v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
