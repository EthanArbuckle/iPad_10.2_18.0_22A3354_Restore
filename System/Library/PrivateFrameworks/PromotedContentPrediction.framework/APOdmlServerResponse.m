@implementation APOdmlServerResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v12 = a3;
  objc_msgSend_featureValues(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v12, v7, (uint64_t)v6, CFSTR("featureValues"));

  v10 = objc_msgSend_odmlEnabled(self, v8, v9);
  objc_msgSend_encodeBool_forKey_(v12, v11, v10, CFSTR("odmlEnabled"));

}

- (APOdmlServerResponse)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  APOdmlServerResponse *v6;
  const char *v7;
  uint64_t v8;
  NSDictionary *featureValues;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APOdmlServerResponse;
  v6 = -[APOdmlServerResponse init](&v11, sel_init);
  if (v6)
  {
    v6->_odmlEnabled = objc_msgSend_decodeBoolForKey_(v4, v5, (uint64_t)CFSTR("odmlEnabled"));
    objc_msgSend_decodeObjectForKey_(v4, v7, (uint64_t)CFSTR("featureValues"));
    v8 = objc_claimAutoreleasedReturnValue();
    featureValues = v6->_featureValues;
    v6->_featureValues = (NSDictionary *)v8;

  }
  return v6;
}

- (APOdmlServerResponse)initWithSRPResponse:(id)a3
{
  id v4;
  const char *v5;
  APOdmlServerResponse *v6;
  const char *v7;
  uint64_t v8;
  NSDictionary *featureValues;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APOdmlServerResponse;
  v6 = -[APOdmlServerResponse init](&v11, sel_init);
  if (v6)
  {
    v6->_odmlEnabled = objc_msgSend_isValidResponse_(APOdmlSRPResponseParser, v5, (uint64_t)v4);
    objc_msgSend_parseResponseForFeatureValues_(APOdmlSRPResponseParser, v7, (uint64_t)v4);
    v8 = objc_claimAutoreleasedReturnValue();
    featureValues = v6->_featureValues;
    v6->_featureValues = (NSDictionary *)v8;

  }
  return v6;
}

- (APOdmlServerResponse)initWithSLPResponse:(id)a3
{
  id v4;
  const char *v5;
  APOdmlServerResponse *v6;
  const char *v7;
  uint64_t v8;
  NSDictionary *featureValues;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APOdmlServerResponse;
  v6 = -[APOdmlServerResponse init](&v11, sel_init);
  if (v6)
  {
    v6->_odmlEnabled = objc_msgSend_isValidResponse_(APOdmlSLPResponseParser, v5, (uint64_t)v4);
    objc_msgSend_parseResponseForFeatureValues_(APOdmlSLPResponseParser, v7, (uint64_t)v4);
    v8 = objc_claimAutoreleasedReturnValue();
    featureValues = v6->_featureValues;
    v6->_featureValues = (NSDictionary *)v8;

  }
  return v6;
}

- (APOdmlServerResponse)initWithSRPResponseData:(id)a3
{
  id v4;
  APOdmlServerResponse *v5;
  ADOdmlResponseV2 *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  NSDictionary *featureValues;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)APOdmlServerResponse;
  v5 = -[APOdmlServerResponse init](&v14, sel_init);
  if (v5)
  {
    v6 = [ADOdmlResponseV2 alloc];
    v8 = (void *)objc_msgSend_initWithData_(v6, v7, (uint64_t)v4);
    v5->_odmlEnabled = objc_msgSend_isValidResponse_(APOdmlSRPResponseParser, v9, (uint64_t)v8);
    objc_msgSend_parseResponseForFeatureValues_(APOdmlSRPResponseParser, v10, (uint64_t)v8);
    v11 = objc_claimAutoreleasedReturnValue();
    featureValues = v5->_featureValues;
    v5->_featureValues = (NSDictionary *)v11;

  }
  return v5;
}

- (void)addUserRating:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  __CFString **v13;
  __CFString **v14;
  const __CFString **v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  const __CFString *v21;
  const __CFString *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend_featureValues(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithDictionary_(v5, v9, (uint64_t)v8);

  if (v4)
  {
    if (objc_msgSend_BOOLValue(v4, v11, v12))
    {
      v22 = CFSTR("userratingdisplay_off");
      v13 = kAPOdmlFeatureTypeUserRatingValueOn;
      v14 = kAPOdmlFeatureTypeUserRatingValueNull;
      v15 = &v22;
    }
    else
    {
      v21 = CFSTR("userratingdisplay_on");
      v13 = kAPOdmlFeatureTypeUserRatingValueOff;
      v14 = kAPOdmlFeatureTypeUserRatingValueNull;
      v15 = &v21;
    }
  }
  else
  {
    v23[0] = CFSTR("userratingdisplay_off");
    v13 = kAPOdmlFeatureTypeUserRatingValueNull;
    v14 = kAPOdmlFeatureTypeUserRatingValueOn;
    v15 = (const __CFString **)v23;
  }
  v15[1] = *v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v15, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_oneHotEncode_trueKey_(self, v17, (uint64_t)v16, *v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addEntriesFromDictionary_(v10, v19, (uint64_t)v18);
  objc_msgSend_setFeatureValues_(self, v20, (uint64_t)v10);

}

- (void)addCachedFeatures:(id)a3 deviceModel:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  const char *v30;
  id v31;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend_featureValues(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend_initWithDictionary_(v9, v13, (uint64_t)v12);

  objc_msgSend_addDeviceClass_newFeatureValues_(self, v14, (uint64_t)v7, v31);
  objc_msgSend_objectForKey_(v8, v15, (uint64_t)CFSTR("it"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v16, v17, (uint64_t)CFSTR("dm"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v18, v19, (uint64_t)CFSTR("13"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addAgeRange_birthYear_(self, v21, (uint64_t)v31, v20);
  objc_msgSend_objectForKey_(v18, v22, (uint64_t)CFSTR("17"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addGender_gender_(self, v24, (uint64_t)v31, v23);
  objc_msgSend_objectForKey_(v18, v25, (uint64_t)CFSTR("35"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v27, (uint64_t)CFSTR("%@"), v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addStorefront_storefront_(self, v29, (uint64_t)v31, v28);
  objc_msgSend_setFeatureValues_(self, v30, (uint64_t)v31);

}

- (void)addDeviceClass:(id)a3 newFeatureValues:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  __CFString **v9;
  __CFString **v10;
  __CFString **v11;
  const __CFString **v12;
  __CFString *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = a4;
  if (!v6)
  {
    v9 = kAPOdmlFeatureTypeDeviceClassNull;
    v21[0] = CFSTR("deviceclass_ipad");
    v10 = kAPOdmlFeatureTypeDeviceClassIphone;
    v11 = kAPOdmlFeatureTypeDeviceClassIpod;
    v12 = (const __CFString **)v21;
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v6, v7, (uint64_t)CFSTR("iphone")))
  {
    v9 = kAPOdmlFeatureTypeDeviceClassIphone;
    v20 = CFSTR("deviceclass_ipad");
    v10 = kAPOdmlFeatureTypeDeviceClassNull;
    v11 = kAPOdmlFeatureTypeDeviceClassIpod;
    v12 = &v20;
LABEL_9:
    v13 = *v10;
    v12[1] = *v11;
    v12[2] = v13;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v12, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_oneHotEncode_trueKey_(self, v15, (uint64_t)v14, *v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addEntriesFromDictionary_(v8, v17, (uint64_t)v16);
    goto LABEL_10;
  }
  if (objc_msgSend_isEqualToString_(v6, v7, (uint64_t)CFSTR("ipad")))
  {
    v9 = kAPOdmlFeatureTypeDeviceClassIpad;
    v19 = CFSTR("deviceclass_iphone");
    v10 = kAPOdmlFeatureTypeDeviceClassNull;
    v11 = kAPOdmlFeatureTypeDeviceClassIpod;
    v12 = &v19;
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v6, v7, (uint64_t)CFSTR("ipod")))
  {
    v9 = kAPOdmlFeatureTypeDeviceClassIpod;
    v18 = CFSTR("deviceclass_iphone");
    v10 = kAPOdmlFeatureTypeDeviceClassNull;
    v11 = kAPOdmlFeatureTypeDeviceClassIpad;
    v12 = &v18;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)addAgeRange:(id)a3 birthYear:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  unsigned int v9;
  __CFString **v10;
  __CFString **v11;
  __CFString **v12;
  __CFString **v13;
  __CFString **v14;
  __CFString **v15;
  __CFString **v16;
  const __CFString **v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  _QWORD v32[8];

  v32[7] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = objc_msgSend_ageFromBirthYear_(self, v7, (uint64_t)v8);
    if ((int)v9 > 17)
    {
      if (v9 > 0x18)
      {
        if (v9 > 0x22)
        {
          if (v9 > 0x2C)
          {
            if (v9 > 0x36)
            {
              if (v9 > 0x40)
              {
                v10 = kAPOdmlFeatureTypeAgeRange65XX;
                v11 = kAPOdmlFeatureTypeAgeRange5564;
                v12 = kAPOdmlFeatureTypeAgeRange4554;
                v13 = kAPOdmlFeatureTypeAgeRange3544;
                v14 = kAPOdmlFeatureTypeAgeRange2534;
                v25 = CFSTR("agerange_null");
                v15 = kAPOdmlFeatureTypeAgeRange1824;
                v17 = &v25;
              }
              else
              {
                v10 = kAPOdmlFeatureTypeAgeRange5564;
                v11 = kAPOdmlFeatureTypeAgeRange65XX;
                v12 = kAPOdmlFeatureTypeAgeRange4554;
                v13 = kAPOdmlFeatureTypeAgeRange3544;
                v14 = kAPOdmlFeatureTypeAgeRange2534;
                v26 = CFSTR("agerange_null");
                v15 = kAPOdmlFeatureTypeAgeRange1824;
                v17 = &v26;
              }
              v16 = kAPOdmlFeatureTypeAgeRange0017;
            }
            else
            {
              v10 = kAPOdmlFeatureTypeAgeRange4554;
              v11 = kAPOdmlFeatureTypeAgeRange65XX;
              v12 = kAPOdmlFeatureTypeAgeRange5564;
              v13 = kAPOdmlFeatureTypeAgeRange3544;
              v14 = kAPOdmlFeatureTypeAgeRange2534;
              v27 = CFSTR("agerange_null");
              v15 = kAPOdmlFeatureTypeAgeRange1824;
              v16 = kAPOdmlFeatureTypeAgeRange0017;
              v17 = &v27;
            }
          }
          else
          {
            v10 = kAPOdmlFeatureTypeAgeRange3544;
            v11 = kAPOdmlFeatureTypeAgeRange65XX;
            v12 = kAPOdmlFeatureTypeAgeRange5564;
            v13 = kAPOdmlFeatureTypeAgeRange4554;
            v14 = kAPOdmlFeatureTypeAgeRange2534;
            v28 = CFSTR("agerange_null");
            v15 = kAPOdmlFeatureTypeAgeRange1824;
            v16 = kAPOdmlFeatureTypeAgeRange0017;
            v17 = &v28;
          }
        }
        else
        {
          v10 = kAPOdmlFeatureTypeAgeRange2534;
          v11 = kAPOdmlFeatureTypeAgeRange65XX;
          v12 = kAPOdmlFeatureTypeAgeRange5564;
          v13 = kAPOdmlFeatureTypeAgeRange4554;
          v14 = kAPOdmlFeatureTypeAgeRange3544;
          v29 = CFSTR("agerange_null");
          v15 = kAPOdmlFeatureTypeAgeRange1824;
          v16 = kAPOdmlFeatureTypeAgeRange0017;
          v17 = &v29;
        }
      }
      else
      {
        v10 = kAPOdmlFeatureTypeAgeRange1824;
        v11 = kAPOdmlFeatureTypeAgeRange65XX;
        v12 = kAPOdmlFeatureTypeAgeRange5564;
        v13 = kAPOdmlFeatureTypeAgeRange4554;
        v14 = kAPOdmlFeatureTypeAgeRange3544;
        v30 = CFSTR("agerange_null");
        v15 = kAPOdmlFeatureTypeAgeRange2534;
        v16 = kAPOdmlFeatureTypeAgeRange0017;
        v17 = &v30;
      }
    }
    else
    {
      v10 = kAPOdmlFeatureTypeAgeRange0017;
      v11 = kAPOdmlFeatureTypeAgeRange65XX;
      v12 = kAPOdmlFeatureTypeAgeRange5564;
      v13 = kAPOdmlFeatureTypeAgeRange4554;
      v14 = kAPOdmlFeatureTypeAgeRange3544;
      v31 = CFSTR("agerange_null");
      v15 = kAPOdmlFeatureTypeAgeRange2534;
      v16 = kAPOdmlFeatureTypeAgeRange1824;
      v17 = &v31;
    }
  }
  else
  {
    v10 = kAPOdmlFeatureTypeAgeRangeNull;
    v11 = kAPOdmlFeatureTypeAgeRange65XX;
    v12 = kAPOdmlFeatureTypeAgeRange5564;
    v13 = kAPOdmlFeatureTypeAgeRange4554;
    v14 = kAPOdmlFeatureTypeAgeRange3544;
    v32[0] = CFSTR("agerange_a0017");
    v15 = kAPOdmlFeatureTypeAgeRange2534;
    v16 = kAPOdmlFeatureTypeAgeRange1824;
    v17 = (const __CFString **)v32;
  }
  v18 = *v15;
  v17[1] = *v16;
  v17[2] = v18;
  v19 = *v13;
  v17[3] = *v14;
  v17[4] = v19;
  v20 = *v11;
  v17[5] = *v12;
  v17[6] = v20;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v17, 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_oneHotEncode_trueKey_(self, v22, (uint64_t)v21, *v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addEntriesFromDictionary_(v6, v24, (uint64_t)v23);
}

- (void)addGender:(id)a3 gender:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  __CFString **v14;
  __CFString **v15;
  const __CFString **v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const __CFString *v21;
  const __CFString *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = a4;
  if (!v8)
  {
    v23[0] = CFSTR("gender_female");
    v23[1] = CFSTR("gender_male");
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v23, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_oneHotEncode_trueKey_(self, v10, (uint64_t)v9, CFSTR("gender_null"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addEntriesFromDictionary_(v6, v12, (uint64_t)v11);
  }
  if (objc_msgSend_isEqualToString_(v8, v7, (uint64_t)CFSTR("10")))
  {
    v22 = CFSTR("gender_female");
    v14 = kAPOdmlFeatureTypeGenderMale;
    v15 = kAPOdmlFeatureTypeGenderNull;
    v16 = &v22;
LABEL_7:
    v16[1] = *v15;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v13, (uint64_t)v16, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_oneHotEncode_trueKey_(self, v18, (uint64_t)v17, *v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addEntriesFromDictionary_(v6, v20, (uint64_t)v19);
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v8, v13, (uint64_t)CFSTR("11")))
  {
    v21 = CFSTR("gender_null");
    v14 = kAPOdmlFeatureTypeGenderFemale;
    v15 = kAPOdmlFeatureTypeGenderMale;
    v16 = &v21;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)addStorefront:(id)a3 storefront:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  __CFString **v11;
  __CFString **v12;
  __CFString **v13;
  __CFString **v14;
  __CFString **v15;
  __CFString **v16;
  __CFString **v17;
  __CFString **v18;
  __CFString **v19;
  __CFString **v20;
  __CFString **v21;
  __CFString **v22;
  __CFString **v23;
  const __CFString **v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  _QWORD v60[14];

  v60[13] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v9 = v7;
  if (!v7)
  {
    v11 = kAPOdmlFeatureTypeStorefrontNull;
    v12 = kAPOdmlFeatureTypeKRStorefront;
    v13 = kAPOdmlFeatureTypeJPStorefront;
    v14 = kAPOdmlFeatureTypeESStorefront;
    v15 = kAPOdmlFeatureTypeITStorefront;
    v16 = kAPOdmlFeatureTypeFRStorefront;
    v17 = kAPOdmlFeatureTypeDEStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v60[0] = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = (const __CFString **)v60;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("143441")))
  {
    v11 = kAPOdmlFeatureTypeUSStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeCAStorefront;
    v20 = kAPOdmlFeatureTypeMXStorefront;
    v21 = kAPOdmlFeatureTypeCHStorefront;
    v59 = CFSTR("storefront_gb143444");
    v22 = kAPOdmlFeatureTypeNZStorefront;
    v23 = kAPOdmlFeatureTypeAUStorefront;
    v24 = &v59;
LABEL_29:
    v36 = (const char *)*v23;
    v37 = *v22;
    v24[1] = (const __CFString *)v36;
    v24[2] = v37;
    v38 = *v20;
    v24[3] = *v21;
    v24[4] = v38;
    v39 = *v18;
    v24[5] = *v19;
    v24[6] = v39;
    v40 = *v16;
    v24[7] = *v17;
    v24[8] = v40;
    v41 = *v14;
    v24[9] = *v15;
    v24[10] = v41;
    v42 = *v12;
    v24[11] = *v13;
    v24[12] = v42;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v36, (uint64_t)v24, 13);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_oneHotEncode_trueKey_(self, v44, (uint64_t)v43, *v11);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addEntriesFromDictionary_(v6, v46, (uint64_t)v45);
    goto LABEL_30;
  }
  if (objc_msgSend_isEqualToString_(v9, v10, (uint64_t)CFSTR("143444")))
  {
    v11 = kAPOdmlFeatureTypeGBStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeCAStorefront;
    v20 = kAPOdmlFeatureTypeMXStorefront;
    v21 = kAPOdmlFeatureTypeCHStorefront;
    v58 = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeNZStorefront;
    v23 = kAPOdmlFeatureTypeAUStorefront;
    v24 = &v58;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v25, (uint64_t)CFSTR("143460")))
  {
    v11 = kAPOdmlFeatureTypeAUStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeCAStorefront;
    v20 = kAPOdmlFeatureTypeMXStorefront;
    v21 = kAPOdmlFeatureTypeCHStorefront;
    v57 = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeNZStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v57;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v26, (uint64_t)CFSTR("143461")))
  {
    v11 = kAPOdmlFeatureTypeNZStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeCAStorefront;
    v20 = kAPOdmlFeatureTypeMXStorefront;
    v21 = kAPOdmlFeatureTypeCHStorefront;
    v56 = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v56;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v27, (uint64_t)CFSTR("143459")))
  {
    v11 = kAPOdmlFeatureTypeCHStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeCAStorefront;
    v20 = kAPOdmlFeatureTypeMXStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v55 = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v55;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v28, (uint64_t)CFSTR("143468")))
  {
    v11 = kAPOdmlFeatureTypeMXStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeCAStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v54 = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v54;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v29, (uint64_t)CFSTR("143455")))
  {
    v11 = kAPOdmlFeatureTypeCAStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v53 = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v53;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v30, (uint64_t)CFSTR("143443")))
  {
    v11 = kAPOdmlFeatureTypeDEStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v52 = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v52;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v31, (uint64_t)CFSTR("143442")))
  {
    v11 = kAPOdmlFeatureTypeFRStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeDEStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v51 = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v51;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v32, (uint64_t)CFSTR("143450")))
  {
    v11 = kAPOdmlFeatureTypeITStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeFRStorefront;
    v17 = kAPOdmlFeatureTypeDEStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v50 = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v50;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v33, (uint64_t)CFSTR("143454")))
  {
    v11 = kAPOdmlFeatureTypeESStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeITStorefront;
    v16 = kAPOdmlFeatureTypeFRStorefront;
    v17 = kAPOdmlFeatureTypeDEStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v49 = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v49;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v34, (uint64_t)CFSTR("143462")))
  {
    v11 = kAPOdmlFeatureTypeJPStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    v14 = kAPOdmlFeatureTypeESStorefront;
    v15 = kAPOdmlFeatureTypeITStorefront;
    v16 = kAPOdmlFeatureTypeFRStorefront;
    v17 = kAPOdmlFeatureTypeDEStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v48 = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v48;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v35, (uint64_t)CFSTR("143466")))
  {
    v11 = kAPOdmlFeatureTypeKRStorefront;
    v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeJPStorefront;
    v14 = kAPOdmlFeatureTypeESStorefront;
    v15 = kAPOdmlFeatureTypeITStorefront;
    v16 = kAPOdmlFeatureTypeFRStorefront;
    v17 = kAPOdmlFeatureTypeDEStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v47 = CFSTR("storefront_us143441");
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v47;
    goto LABEL_29;
  }
LABEL_30:

}

- (id)falseFeatureValue
{
  void *v2;
  const char *v3;
  void *v4;

  objc_msgSend_multiarrayFromArray_(MEMORY[0x1E0C9E970], a2, (uint64_t)&unk_1E6A33CA8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E0C9E918], v3, (uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)trueFeatureValue
{
  void *v2;
  const char *v3;
  void *v4;

  objc_msgSend_multiarrayFromArray_(MEMORY[0x1E0C9E970], a2, (uint64_t)&unk_1E6A33CC0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E0C9E918], v3, (uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)oneHotEncode:(id)a3 trueKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trueFeatureValue(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v10, v14, (uint64_t)v13, v7);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v6;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v30, v34, 16);
  if (v17)
  {
    v20 = v17;
    v21 = *(_QWORD *)v31;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v15);
        v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v22);
        objc_msgSend_falseFeatureValue(self, v18, v19, (_QWORD)v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(v10, v25, (uint64_t)v24, v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v30, v34, 16);
    }
    while (v20);
  }

  v28 = (void *)objc_msgSend_copy(v10, v26, v27);
  return v28;
}

- (int)ageFromBirthYear:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  int v23;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend_currentCalendar(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(MEMORY[0x1E0C99D68], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_components_fromDate_(v7, v11, 28, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_year(v12, v14, v15);
  objc_msgSend_numberWithInteger_(v13, v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend_intValue(v18, v19, v20);
  v23 = objc_msgSend_intValue(v4, v21, v22);

  return (_DWORD)v10 - v23;
}

- (BOOL)odmlEnabled
{
  return self->_odmlEnabled;
}

- (void)setOdmlEnabled:(BOOL)a3
{
  self->_odmlEnabled = a3;
}

- (NSDictionary)featureValues
{
  return self->_featureValues;
}

- (void)setFeatureValues:(id)a3
{
  objc_storeStrong((id *)&self->_featureValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValues, 0);
}

@end
