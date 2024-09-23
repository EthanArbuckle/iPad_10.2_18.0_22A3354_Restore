@implementation VIQueryContext

- (VIQueryContext)initWithQueryID:(unint64_t)a3 applicationIdentifier:(id)a4 uiScale:(double)a5 teamID:(id)a6 catalogIDs:(id)a7 location:(id)a8 imageURL:(id)a9 referralURL:(id)a10 imageType:(int64_t)a11 featureIdentifier:(id)a12 engagementSuggestionType:(id)a13 locale:(id)a14 countryCode:(id)a15 preferredMetalDevice:(id)a16 includeLowConfidenceRegions:(BOOL)a17 skipDomainModelInParse:(BOOL)a18 runOnDeviceOnlyInSearch:(BOOL)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  VIQueryContext *v32;
  VIQueryContext *v33;
  uint64_t v34;
  NSString *applicationIdentifier;
  uint64_t v36;
  NSString *teamID;
  uint64_t v38;
  NSArray *catalogIDs;
  uint64_t v40;
  CLLocation *location;
  uint64_t v42;
  NSURL *imageURL;
  uint64_t v44;
  NSURL *referralURL;
  uint64_t v46;
  NSString *featureIdentifier;
  uint64_t v48;
  NSString *engagementSuggestionType;
  uint64_t v50;
  NSString *locale;
  uint64_t v52;
  NSString *countryCode;
  id v57;
  id v58;
  id v59;
  objc_super v60;

  v24 = a4;
  v25 = a6;
  v59 = a7;
  v58 = a8;
  v57 = a9;
  v26 = a10;
  v27 = a12;
  v28 = a13;
  v29 = a14;
  v30 = a15;
  v31 = a16;
  v60.receiver = self;
  v60.super_class = (Class)VIQueryContext;
  v32 = -[VIQueryContext init](&v60, sel_init);
  v33 = v32;
  if (v32)
  {
    v32->_queryID = a3;
    v34 = objc_msgSend(v24, "copy");
    applicationIdentifier = v33->_applicationIdentifier;
    v33->_applicationIdentifier = (NSString *)v34;

    v33->_uiScale = a5;
    v36 = objc_msgSend(v25, "copy");
    teamID = v33->_teamID;
    v33->_teamID = (NSString *)v36;

    v38 = objc_msgSend(v59, "copy");
    catalogIDs = v33->_catalogIDs;
    v33->_catalogIDs = (NSArray *)v38;

    v40 = objc_msgSend(v58, "copy");
    location = v33->_location;
    v33->_location = (CLLocation *)v40;

    v42 = objc_msgSend(v57, "copy");
    imageURL = v33->_imageURL;
    v33->_imageURL = (NSURL *)v42;

    v44 = objc_msgSend(v26, "copy");
    referralURL = v33->_referralURL;
    v33->_referralURL = (NSURL *)v44;

    v33->_imageType = a11;
    v46 = objc_msgSend(v27, "copy");
    featureIdentifier = v33->_featureIdentifier;
    v33->_featureIdentifier = (NSString *)v46;

    v48 = objc_msgSend(v28, "copy");
    engagementSuggestionType = v33->_engagementSuggestionType;
    v33->_engagementSuggestionType = (NSString *)v48;

    v50 = objc_msgSend(v29, "copy");
    locale = v33->_locale;
    v33->_locale = (NSString *)v50;

    v52 = objc_msgSend(v30, "copy");
    countryCode = v33->_countryCode;
    v33->_countryCode = (NSString *)v52;

    objc_storeStrong((id *)&v33->_preferredMetalDevice, a16);
    v33->_includeLowConfidenceRegions = a17;
    v33->_skipDomainModelInParse = a18;
    v33->_runOnDeviceOnlyInSearch = a19;
  }

  return v33;
}

+ (VIQueryContext)contextWithDictionary:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  _BYTE v45[128];
  _QWORD v46[17];
  _QWORD v47[19];

  v47[17] = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v46[0] = CFSTR("com.apple.argos.query_context_key.query_id");
  v37 = (void *)objc_opt_new();
  v47[0] = v37;
  v46[1] = CFSTR("com.apple.argos.query_context_key.application_id");
  v36 = (void *)objc_opt_new();
  v47[1] = v36;
  v46[2] = CFSTR("com.apple.argos.query_context_key.uiScale");
  v35 = (void *)objc_opt_new();
  v47[2] = v35;
  v46[3] = CFSTR("com.apple.argos.query_context_key.team_id");
  v34 = (void *)objc_opt_new();
  v47[3] = v34;
  v46[4] = CFSTR("com.apple.argos.query_context_key.catalog_ids");
  v33 = (void *)objc_opt_new();
  v47[4] = v33;
  v46[5] = CFSTR("com.apple.argos.query_context_key.location");
  v32 = (void *)objc_opt_new();
  v47[5] = v32;
  v46[6] = CFSTR("com.apple.argos.query_context_key.image_url");
  v31 = (void *)objc_opt_new();
  v47[6] = v31;
  v46[7] = CFSTR("com.apple.argos.query_context_key.referral_url");
  v30 = (void *)objc_opt_new();
  v47[7] = v30;
  v46[8] = CFSTR("com.apple.argos.query_context_key.image_type");
  v4 = (void *)objc_opt_new();
  v47[8] = v4;
  v46[9] = CFSTR("com.apple.argos.query_context_key.feature_identifier");
  v5 = (void *)objc_opt_new();
  v47[9] = v5;
  v46[10] = CFSTR("com.apple.argos.query_context_key.engagement_suggestion_type");
  v6 = (void *)objc_opt_new();
  v47[10] = v6;
  v46[11] = CFSTR("com.apple.argos.query_context_key.preferred_metal_device");
  v7 = (void *)objc_opt_new();
  v47[11] = v7;
  v46[12] = CFSTR("com.apple.argos.query_context_key.locale");
  v8 = (void *)objc_opt_new();
  v47[12] = v8;
  v46[13] = CFSTR("com.apple.argos.query_context_key.country_code");
  v9 = (void *)objc_opt_new();
  v47[13] = v9;
  v46[14] = CFSTR("com.apple.argos.query_context_key.include_low_confidence_region");
  v10 = (void *)objc_opt_new();
  v47[14] = v10;
  v46[15] = CFSTR("com.apple.argos.query_context_key.skip_domain_model_in_parse");
  v11 = (void *)objc_opt_new();
  v47[15] = v11;
  v46[16] = CFSTR("com.apple.argos.query_context_key.run_on_device_only_in_search");
  v12 = (void *)objc_opt_new();
  v47[16] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v15 = v38;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v40;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v18)
        objc_enumerationMutation(v15);
      v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v19);
      objc_msgSend(v13, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        break;
      objc_msgSend(v13, "objectForKeyedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateBuilder:withDictionary:", v14, v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v23);
LABEL_16:

        v24 = 0;
        goto LABEL_17;
      }
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v17)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v43 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unrecognized key: %@"), v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.argos.query_context.error_domain"), 1, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a4)
      *a4 = objc_retainAutorelease(v26);

    goto LABEL_16;
  }
LABEL_10:

  objc_msgSend(v14, "build");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return (VIQueryContext *)v24;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (double)uiScale
{
  return self->_uiScale;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSArray)catalogIDs
{
  return self->_catalogIDs;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSURL)referralURL
{
  return self->_referralURL;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)engagementSuggestionType
{
  return self->_engagementSuggestionType;
}

- (MTLDevice)preferredMetalDevice
{
  return self->_preferredMetalDevice;
}

- (BOOL)includeLowConfidenceRegions
{
  return self->_includeLowConfidenceRegions;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (BOOL)skipDomainModelInParse
{
  return self->_skipDomainModelInParse;
}

- (BOOL)runOnDeviceOnlyInSearch
{
  return self->_runOnDeviceOnlyInSearch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_engagementSuggestionType, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_referralURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_catalogIDs, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

- (NSString)description
{
  return (NSString *)sub_1D481EFD4(self, (uint64_t)a2, (void (*)(void))VIQueryContext.description.getter);
}

@end
