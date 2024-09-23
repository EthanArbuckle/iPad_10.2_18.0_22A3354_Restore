@implementation MOClusterMetadata

- (MOClusterMetadata)initWithClusterMetadataMO:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MOClusterMetadata *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  MOClusterMetadata *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  if (a3)
  {
    v4 = a3;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v20 = objc_msgSend(v4, "isFiltered");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "phenotype"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topLevelActivityHistogram"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondLevelActivityHistogram"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activityTypeFromPhotoTraitsHistogram"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeTagHistogram"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dayOfWeekHistogram"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeContextFromPhotoTraitsHistogram"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeNameHistogram"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "combinedPlaceTypeHistogram"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enclosingPlaceNameHistogram"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeTypeFromPhotoTraitsHistogram"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactNamesHistogram"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personRelationshipHistogram"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "socialEventFromPhotoTraitsHistogram"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "otherSubjectFromPhotoTraitsHistogram"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subBundleGoodnessScores"));

    v21 = objc_retain(-[MOClusterMetadata initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:](self, "initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:", v25, v20, v19, v18, v17, v16, v24, v23, v22, v15, v14, v5,
              v13,
              v6,
              v12,
              v7,
              v8,
              v9));

    self = v21;
    v10 = v21;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MOClusterMetadata)initWithIdentifier:(id)a3 phenoType:(id)a4
{
  return -[MOClusterMetadata initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:](self, "initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:", a3, 0, a4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           0);
}

- (MOClusterMetadata)initWithIdentifier:(id)a3 isFiltered:(BOOL)a4 phenoType:(id)a5 topLevelActivityHistogram:(id)a6 secondLevelActivityHistogram:(id)a7 activityTypeFromPhotoTraitsHistogram:(id)a8 timeTagHistogram:(id)a9 dayOfWeekHistogram:(id)a10 timeContextFromPhotoTraitsHistogram:(id)a11 placeNameHistogram:(id)a12 combinedPlaceTypeHistogram:(id)a13 enclosingPlaceNameHistogram:(id)a14 placeTypeFromPhotoTraitsHistogram:(id)a15 contactNamesHistogram:(id)a16 personRelationshipHistogram:(id)a17 socialEventFromPhotoTraitsHistogram:(id)a18 otherSubjectFromPhotoTraitsHistogram:(id)a19 subBundleGoodnessScores:(id)a20
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  MOClusterMetadata *v31;
  MOClusterMetadata *v32;
  id v36;
  id v37;
  id v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;

  v49 = a3;
  v36 = a5;
  v48 = a5;
  v37 = a6;
  v47 = a6;
  v38 = a7;
  v46 = a7;
  v45 = a8;
  v44 = a9;
  v43 = a10;
  v42 = a11;
  v41 = a12;
  v40 = a13;
  v24 = a14;
  v25 = a15;
  v26 = a16;
  v27 = a17;
  v28 = a18;
  v29 = a19;
  v30 = a20;
  v50.receiver = self;
  v50.super_class = (Class)MOClusterMetadata;
  v31 = -[MOClusterMetadata init](&v50, "init");
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_identifier, a3);
    v32->_isFiltered = a4;
    objc_storeStrong((id *)&v32->_phenotype, v36);
    objc_storeStrong((id *)&v32->_topLevelActivityHistogram, v37);
    objc_storeStrong((id *)&v32->_secondLevelActivityHistogram, v38);
    objc_storeStrong((id *)&v32->_activityTypeFromPhotoTraitsHistogram, a8);
    objc_storeStrong((id *)&v32->_timeTagHistogram, a9);
    objc_storeStrong((id *)&v32->_dayOfWeekHistogram, a10);
    objc_storeStrong((id *)&v32->_timeContextFromPhotoTraitsHistogram, a11);
    objc_storeStrong((id *)&v32->_placeNameHistogram, a12);
    objc_storeStrong((id *)&v32->_combinedPlaceTypeHistogram, a13);
    objc_storeStrong((id *)&v32->_enclosingPlaceNameHistogram, a14);
    objc_storeStrong((id *)&v32->_placeTypeFromPhotoTraitsHistogram, a15);
    objc_storeStrong((id *)&v32->_contactNamesHistogram, a16);
    objc_storeStrong((id *)&v32->_personRelationshipHistogram, a17);
    objc_storeStrong((id *)&v32->_socialEventFromPhotoTraitsHistogram, a18);
    objc_storeStrong((id *)&v32->_otherSubjectFromPhotoTraitsHistogram, a19);
    objc_storeStrong((id *)&v32->_subBundleGoodnessScores, a20);
  }

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  identifier = self->_identifier;
  v20 = a3;
  objc_msgSend(v20, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v20, "encodeBool:forKey:", self->_isFiltered, CFSTR("isFiltered"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_phenotype));
  objc_msgSend(v20, "encodeObject:forKey:", v5, CFSTR("phenotype"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_topLevelActivityHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v6, CFSTR("topLevelActivityTypeHistogram"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_secondLevelActivityHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v7, CFSTR("secondLevelActivityTypeHistogram"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_activityTypeFromPhotoTraitsHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v8, CFSTR("activityTypeFromPhotoTraitsHistogram"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_timeTagHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v9, CFSTR("timeTagHistogram"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_dayOfWeekHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v10, CFSTR("dayOfWeekHistogram"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_timeContextFromPhotoTraitsHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v11, CFSTR("timeContextFromPhotoTraitsHistogram"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_placeNameHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v12, CFSTR("placeNameHistogram"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_combinedPlaceTypeHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v13, CFSTR("combinedPlaceTypeHistogram"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_enclosingPlaceNameHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v14, CFSTR("enclosingPlaceNameHistogram"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_placeTypeFromPhotoTraitsHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v15, CFSTR("placeTypeFromPhotoTraitsHistogram"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_contactNamesHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v16, CFSTR("contactNamesHistogram"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_personRelationshipHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v17, CFSTR("personRelationshipHistogram"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_socialEventFromPhotoTraitsHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v18, CFSTR("socialEventFromPhotoTraitsHistogram"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_otherSubjectFromPhotoTraitsHistogram));
  objc_msgSend(v20, "encodeObject:forKey:", v19, CFSTR("otherSubjectFromPhotoTraitsHistogram"));

  objc_msgSend(v20, "encodeObject:forKey:", self->_subBundleGoodnessScores, CFSTR("subBundleGoodnessScores"));
}

- (MOClusterMetadata)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSSet *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  unsigned int v69;
  MOClusterMetadata *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;

  v3 = a3;
  v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v4), CFSTR("identifier"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v69 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isFiltered"));
  v7 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v6), CFSTR("phenotype"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v8));

  v10 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v9), CFSTR("topLevelActivityTypeHistogram"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v11));

  v13 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v12), CFSTR("secondLevelActivityTypeHistogram"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v14));

  v16 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v15), CFSTR("activityTypeFromPhotoTraitsHistogram"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v17));

  v19 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v18), CFSTR("timeTagHistogram"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v20));

  v22 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v21), CFSTR("dayOfWeekHistogram"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v23));

  v25 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v24), CFSTR("timeContextFromPhotoTraitsHistogram"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v26));

  v28 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v27), CFSTR("placeNameHistogram"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v29));

  v31 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v30), CFSTR("combinedPlaceTypeHistogram"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v32));

  v34 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v33), CFSTR("enclosingPlaceNameHistogram"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v35));

  v37 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v36), CFSTR("placeTypeFromPhotoTraitsHistogram"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v38));

  v40 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v39), CFSTR("contactNamesHistogram"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v41));

  v43 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v42), CFSTR("personRelationshipHistogram"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v44));

  v47 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v46), CFSTR("socialEventFromPhotoTraitsHistogram"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v48));

  v51 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v50), CFSTR("otherSubjectFromPhotoTraitsHistogram"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v52));

  v55 = objc_opt_class(NSArray, v54);
  v57 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v55, objc_opt_class(NSNumber, v56), 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v58, CFSTR("subBundleGoodnessScores")));

  v71 = -[MOClusterMetadata initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:](self, "initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:", v76, v69, v75, v74, v68, v67, v66, v65, v64, v63, v73, v72, v62,
          v61,
          v45,
          v49,
          v53,
          v59);

  return v71;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (void)setIsFiltered:(BOOL)a3
{
  self->_isFiltered = a3;
}

- (NSDictionary)phenotype
{
  return self->_phenotype;
}

- (void)setPhenotype:(id)a3
{
  objc_storeStrong((id *)&self->_phenotype, a3);
}

- (NSDictionary)topLevelActivityHistogram
{
  return self->_topLevelActivityHistogram;
}

- (void)setTopLevelActivityHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelActivityHistogram, a3);
}

- (NSDictionary)secondLevelActivityHistogram
{
  return self->_secondLevelActivityHistogram;
}

- (void)setSecondLevelActivityHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_secondLevelActivityHistogram, a3);
}

- (NSDictionary)activityTypeFromPhotoTraitsHistogram
{
  return self->_activityTypeFromPhotoTraitsHistogram;
}

- (void)setActivityTypeFromPhotoTraitsHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_activityTypeFromPhotoTraitsHistogram, a3);
}

- (NSDictionary)timeTagHistogram
{
  return self->_timeTagHistogram;
}

- (void)setTimeTagHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_timeTagHistogram, a3);
}

- (NSDictionary)dayOfWeekHistogram
{
  return self->_dayOfWeekHistogram;
}

- (void)setDayOfWeekHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_dayOfWeekHistogram, a3);
}

- (NSDictionary)timeContextFromPhotoTraitsHistogram
{
  return self->_timeContextFromPhotoTraitsHistogram;
}

- (void)setTimeContextFromPhotoTraitsHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_timeContextFromPhotoTraitsHistogram, a3);
}

- (NSDictionary)placeNameHistogram
{
  return self->_placeNameHistogram;
}

- (void)setPlaceNameHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_placeNameHistogram, a3);
}

- (NSDictionary)combinedPlaceTypeHistogram
{
  return self->_combinedPlaceTypeHistogram;
}

- (void)setCombinedPlaceTypeHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_combinedPlaceTypeHistogram, a3);
}

- (NSDictionary)enclosingPlaceNameHistogram
{
  return self->_enclosingPlaceNameHistogram;
}

- (void)setEnclosingPlaceNameHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_enclosingPlaceNameHistogram, a3);
}

- (NSDictionary)placeTypeFromPhotoTraitsHistogram
{
  return self->_placeTypeFromPhotoTraitsHistogram;
}

- (void)setPlaceTypeFromPhotoTraitsHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_placeTypeFromPhotoTraitsHistogram, a3);
}

- (NSDictionary)contactNamesHistogram
{
  return self->_contactNamesHistogram;
}

- (void)setContactNamesHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_contactNamesHistogram, a3);
}

- (NSDictionary)personRelationshipHistogram
{
  return self->_personRelationshipHistogram;
}

- (void)setPersonRelationshipHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_personRelationshipHistogram, a3);
}

- (NSDictionary)socialEventFromPhotoTraitsHistogram
{
  return self->_socialEventFromPhotoTraitsHistogram;
}

- (void)setSocialEventFromPhotoTraitsHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_socialEventFromPhotoTraitsHistogram, a3);
}

- (NSDictionary)otherSubjectFromPhotoTraitsHistogram
{
  return self->_otherSubjectFromPhotoTraitsHistogram;
}

- (void)setOtherSubjectFromPhotoTraitsHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_otherSubjectFromPhotoTraitsHistogram, a3);
}

- (NSArray)subBundleGoodnessScores
{
  return self->_subBundleGoodnessScores;
}

- (void)setSubBundleGoodnessScores:(id)a3
{
  objc_storeStrong((id *)&self->_subBundleGoodnessScores, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subBundleGoodnessScores, 0);
  objc_storeStrong((id *)&self->_otherSubjectFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_socialEventFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_personRelationshipHistogram, 0);
  objc_storeStrong((id *)&self->_contactNamesHistogram, 0);
  objc_storeStrong((id *)&self->_placeTypeFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_enclosingPlaceNameHistogram, 0);
  objc_storeStrong((id *)&self->_combinedPlaceTypeHistogram, 0);
  objc_storeStrong((id *)&self->_placeNameHistogram, 0);
  objc_storeStrong((id *)&self->_timeContextFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_dayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_timeTagHistogram, 0);
  objc_storeStrong((id *)&self->_activityTypeFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_secondLevelActivityHistogram, 0);
  objc_storeStrong((id *)&self->_topLevelActivityHistogram, 0);
  objc_storeStrong((id *)&self->_phenotype, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
