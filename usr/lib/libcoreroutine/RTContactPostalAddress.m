@implementation RTContactPostalAddress

+ (id)labelTypeToString:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_1E92A0748[a3];
}

- (RTContactPostalAddress)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_geoAddressData_subPremises_subThoroughfare_thoroughfare_subLocality_locality_subAdministrativeArea_administrativeArea_administrativeAreaCode_postalCode_country_countryCode_inlandWater_ocean_areasOfInterest_isIsland_creationDate_expirationDate_contactsIdentifier_labelType_iso3166CountryCode_iso3166SubdivisionCode_);
}

- (RTContactPostalAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 subThoroughfare:(id)a6 thoroughfare:(id)a7 subLocality:(id)a8 locality:(id)a9 subAdministrativeArea:(id)a10 administrativeArea:(id)a11 administrativeAreaCode:(id)a12 postalCode:(id)a13 country:(id)a14 countryCode:(id)a15 inlandWater:(id)a16 ocean:(id)a17 areasOfInterest:(id)a18 isIsland:(BOOL)a19 creationDate:(id)a20 expirationDate:(id)a21 iso3166CountryCode:(id)a22 iso3166SubdivisionCode:(id)a23
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v32;
  id v33;
  id v35;
  void *v36;
  id v38;
  id v40;
  void *v42;
  RTContactPostalAddress *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;

  v36 = (void *)MEMORY[0x1E0CB3A28];
  v38 = a23;
  v24 = a22;
  v25 = a21;
  v26 = a20;
  v27 = a18;
  v33 = a17;
  v46 = a16;
  v45 = a15;
  v52 = a14;
  v51 = a13;
  v50 = a12;
  v49 = a11;
  v48 = a10;
  v47 = a9;
  v35 = a8;
  v28 = a7;
  v29 = a6;
  v40 = a5;
  v30 = a4;
  objc_msgSend(v36, "UUID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v32) = a19;
  v44 = -[RTContactPostalAddress initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:", v42, v30, v40, v29, v28, v35, v47, v48, v49, v50, v51, v52, v45, v46, v33,
          v27,
          v32,
          v26,
          v25,
          0,
          0,
          v24,
          v38);

  return v44;
}

- (RTContactPostalAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 isIsland:(BOOL)a6 creationDate:(id)a7 expirationDate:(id)a8 contactsIdentifier:(id)a9 labelType:(unint64_t)a10 iso3166CountryCode:(id)a11 iso3166SubdivisionCode:(id)a12
{
  RTContactPostalAddress *v12;
  RTContactPostalAddress *v13;
  NSObject *v14;
  uint64_t v16;
  uint8_t buf[16];

  v12 = self;
  if (a10 >= 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: labelType <= RTAddressLabelTypeMax", buf, 2u);
    }

    v13 = 0;
  }
  else
  {
    LOBYTE(v16) = a6;
    v12 = objc_retain(-[RTContactPostalAddress initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:", a3, a4, a5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              v16,
              a7,
              a8,
              a9,
              a10,
              a11,
              a12));
    v13 = v12;
  }

  return v13;
}

- (RTContactPostalAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 subThoroughfare:(id)a6 thoroughfare:(id)a7 subLocality:(id)a8 locality:(id)a9 subAdministrativeArea:(id)a10 administrativeArea:(id)a11 administrativeAreaCode:(id)a12 postalCode:(id)a13 country:(id)a14 countryCode:(id)a15 inlandWater:(id)a16 ocean:(id)a17 areasOfInterest:(id)a18 isIsland:(BOOL)a19 creationDate:(id)a20 expirationDate:(id)a21 contactsIdentifier:(id)a22 labelType:(unint64_t)a23 iso3166CountryCode:(id)a24 iso3166SubdivisionCode:(id)a25
{
  id v32;
  RTContactPostalAddress *v33;
  RTContactPostalAddress *v34;
  RTContactPostalAddress *v35;
  NSObject *v36;
  objc_super v39;
  uint8_t buf[16];

  v32 = a22;
  if (a23 >= 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: labelType <= RTAddressLabelTypeMax", buf, 2u);
    }

    v35 = 0;
  }
  else
  {
    v39.receiver = self;
    v39.super_class = (Class)RTContactPostalAddress;
    v33 = -[RTContactPostalAddress initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:](&v39, sel_initWithIdentifier_geoAddressData_subPremises_subThoroughfare_thoroughfare_subLocality_locality_subAdministrativeArea_administrativeArea_administrativeAreaCode_postalCode_country_countryCode_inlandWater_ocean_areasOfInterest_isIsland_creationDate_expirationDate_iso3166CountryCode_iso3166SubdivisionCode_, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
            a20,
            a21,
            a24,
            a25);
    v34 = v33;
    if (v33)
    {
      objc_storeStrong((id *)&v33->_contactsIdentifier, a22);
      v34->_labelType = a23;
    }
    self = v34;
    v35 = self;
  }

  return v35;
}

- (RTContactPostalAddress)initWithIdentifier:(id)a3 geoAddressObject:(id)a4 subPremises:(id)a5 isIsland:(BOOL)a6 creationDate:(id)a7 expirationDate:(id)a8 contactsIdentifier:(id)a9 labelType:(unint64_t)a10 iso3166CountryCode:(id)a11 iso3166SubdivisionCode:(id)a12
{
  _BOOL8 v14;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  RTContactPostalAddress *v28;
  NSObject *v29;
  const char *v30;
  uint8_t *v31;
  id v33;
  uint8_t buf[2];
  __int16 v35;
  __int16 v36;
  __int16 v37;

  v14 = a6;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a11;
  v25 = a12;
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v37 = 0;
    v30 = "Invalid parameter not satisfying: identifier";
    v31 = (uint8_t *)&v37;
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, v30, v31, 2u);
    goto LABEL_15;
  }
  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v36 = 0;
    v30 = "Invalid parameter not satisfying: creationDate";
    v31 = (uint8_t *)&v36;
    goto LABEL_14;
  }
  if (!v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v35 = 0;
    v30 = "Invalid parameter not satisfying: expirationDate";
    v31 = (uint8_t *)&v35;
    goto LABEL_14;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v30 = "Invalid parameter not satisfying: geoAddressObject";
      v31 = buf;
      goto LABEL_14;
    }
LABEL_15:

    v28 = 0;
    goto LABEL_16;
  }
  objc_msgSend((id)objc_opt_class(), "_encodeGeoAddressObject:compress:", v19, 1);
  v33 = v19;
  v26 = v20;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[RTContactPostalAddress initWithIdentifier:geoAddressData:subPremises:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressData:subPremises:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:", v18, v27, v26, v14, v21, v22, v23, a10, v24, v25);

  v20 = v26;
  v19 = v33;
  v28 = self;
LABEL_16:

  return v28;
}

- (RTContactPostalAddress)initWithIdentifier:(id)a3 CNPostalAddress:(id)a4 lableType:(unint64_t)a5 creationDate:(id)a6 expirationDate:(id)a7
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  RTContactPostalAddress *v27;
  objc_class *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1E0C99DC8];
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v13, "preferredLanguages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v30;
      v34 = 2112;
      v35 = v31;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@, %@, [NSLocale currentLocale] failed for NSLocaleCountryCode", buf, 0x16u);

    }
    v21 = &stru_1E92AB3A8;
  }
  v23 = objc_alloc(MEMORY[0x1E0D26EC8]);
  objc_msgSend(v16, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithCNPostalAddress:language:country:phoneticLocale:", v24, v19, v21, v19);

  objc_msgSend(v16, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[RTContactPostalAddress initWithIdentifier:geoAddressObject:subPremises:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressObject:subPremises:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:", v17, v25, 0, 0, v15, v14, v26, a5, 0, 0);
  return v27;
}

- (RTContactPostalAddress)initWithIdentifier:(id)a3 lableType:(unint64_t)a4 geoDictionary:(id)a5 language:(id)a6 country:(id)a7 phoneticLocale:(id)a8
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  RTContactPostalAddress *v23;

  v13 = (void *)MEMORY[0x1E0C99D68];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  objc_msgSend(v13, "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dateByAddingTimeInterval:", 4838400.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26EC8]), "initWithContactAddressDictionary:language:country:phoneticLocale:", v17, v16, v15, v14);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[RTContactPostalAddress initWithIdentifier:geoAddressObject:subPremises:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressObject:subPremises:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:", v22, v21, 0, 0, v19, v20, v18, a4, 0, 0);

  return v23;
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
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[RTContactPostalAddress identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "labelTypeToString:", -[RTContactPostalAddress labelType](self, "labelType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTContactPostalAddress mergedThoroughfare](self, "mergedThoroughfare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTContactPostalAddress subLocality](self, "subLocality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTContactPostalAddress locality](self, "locality");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTContactPostalAddress subAdministrativeArea](self, "subAdministrativeArea");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTContactPostalAddress administrativeArea](self, "administrativeArea");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTContactPostalAddress postalCode](self, "postalCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTContactPostalAddress country](self, "country");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTContactPostalAddress countryCode](self, "countryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("identifier, %@, labelType, %@, street, %@, subLocality, %@, city, %@, subAdministrativeArea, %@, state, %@, postalCode, %@, country, %@, ISOCountryCode, %@"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)contactsIdentifier
{
  return self->_contactsIdentifier;
}

- (unint64_t)labelType
{
  return self->_labelType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsIdentifier, 0);
}

@end
