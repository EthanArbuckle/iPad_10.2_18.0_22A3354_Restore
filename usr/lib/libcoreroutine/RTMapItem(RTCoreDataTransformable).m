@implementation RTMapItem(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "createWithLearnedPlaceMO:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "createWithLearnedLocationOfInterestMO:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412802;
      v10 = v4;
      v11 = 2080;
      v12 = "+[RTMapItem(RTCoreDataTransformable) createWithManagedObject:]";
      v13 = 1024;
      v14 = 43;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "managed object, %@, is not supported by RTMapItem+CoreDataTransformable (in %s:%d)", (uint8_t *)&v9, 0x1Cu);
    }

LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  objc_msgSend(a1, "createWithMapItemMO:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v6 = (void *)v5;
LABEL_13:

  return v6;
}

+ (id)createWithMapItemMO:()RTCoreDataTransformable
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  uint64_t v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  uint8_t buf[16];

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItemMO", buf, 2u);
    }
    goto LABEL_11;
  }
  objc_msgSend(v3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "managedObjectContext");
    v7 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject allowTombstones](v7, "allowTombstones") & 1) != 0 || (objc_msgSend(v4, "flags") & 1) == 0)
    {

      goto LABEL_6;
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_6:
  objc_msgSend(v4, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();

  if ((v10 & 1) == 0)
  {
LABEL_14:
    v94 = objc_alloc(MEMORY[0x1E0D18330]);
    objc_msgSend(v4, "address");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "identifier");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "geoAddressData");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "subPremises");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "subThoroughfare");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "thoroughfare");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "subLocality");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "locality");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "subAdministrativeArea");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "administrativeArea");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "administrativeAreaCode");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "postalCode");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "country");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "countryCode");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "inlandWater");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "ocean");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "areasOfInterest");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "island");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v54, "BOOLValue");
    objc_msgSend(v4, "address");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "creationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "expirationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "iso3166CountryCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "iso3166SubdivisionCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v48) = v49;
    v95 = (void *)objc_msgSend(v94, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v92, v90, v88, v86, v84, v80, v82, v78, v76, v75, v74, v55, v53, v73, v51,
                    v50,
                    v48,
                    v16,
                    v18,
                    v20,
                    v22);

    v23 = objc_alloc(MEMORY[0x1E0D183B0]);
    objc_msgSend(v4, "latitude");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;
    objc_msgSend(v4, "longitude");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v29 = v28;
    objc_msgSend(v4, "uncertainty");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    v32 = v31;
    objc_msgSend(v4, "creationDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "referenceFrame");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)objc_msgSend(v23, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", v33, objc_msgSend(v34, "longValue"), v26, v29, v32);

    v35 = objc_alloc(MEMORY[0x1E0D183F0]);
    objc_msgSend(v4, "extendedAttributes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = (void *)objc_msgSend(v35, "initWithExtendedAttributesMO:", v36);

    v37 = objc_alloc(MEMORY[0x1E0D183E8]);
    objc_msgSend(v4, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "category");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapItemSource");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v89, "unsignedIntegerValue");
    objc_msgSend(v4, "mapItemPlaceType");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v87, "unsignedIntegerValue");
    objc_msgSend(v4, "muid");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v83, "unsignedIntegerValue");
    objc_msgSend(v4, "resultProviderID");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (int)objc_msgSend(v77, "intValue");
    objc_msgSend(v4, "geoMapItemHandle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "creationDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expirationDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayLanguage");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v47) = objc_msgSend(v4, "disputed");
    v13 = (void *)objc_msgSend(v37, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v38, v85, v81, v95, v91, v79, v39, v40, v41, v42, v43, v44, v93, v45, v47);

    goto LABEL_15;
  }
  objc_msgSend(v4, "address");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "allowTombstones"))
  {

    goto LABEL_14;
  }
  objc_msgSend(v4, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "flags");

  if ((v15 & 1) == 0)
    goto LABEL_14;
LABEL_12:
  v13 = 0;
LABEL_15:

  return v13;
}

+ (id)createWithLearnedPlaceMO:()RTCoreDataTransformable
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_class();
    objc_msgSend(v3, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createWithMapItemMO:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedPlaceMO", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)createWithLearnedLocationOfInterestMO:()RTCoreDataTransformable
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v13;
  __int16 v14;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v8 = 0;
      goto LABEL_8;
    }
    v14 = 0;
    v10 = "Invalid parameter not satisfying: loiMO";
    v11 = (uint8_t *)&v14;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    goto LABEL_7;
  }
  objc_msgSend(v3, "placeMapItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v13 = 0;
    v10 = "Invalid parameter not satisfying: loiMO.placeMapItemIdentifier";
    v11 = (uint8_t *)&v13;
    goto LABEL_10;
  }
  v6 = (void *)objc_opt_class();
  objc_msgSend(v4, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createWithMapItemMO:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v8;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTMapItemMO managedObjectWithMapItem:inManagedObjectContext:](RTMapItemMO, "managedObjectWithMapItem:inManagedObjectContext:", a1, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    v3 = 0;
  }
  return v3;
}

@end
