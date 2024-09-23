@implementation PPLocationRecord

- (id)init_
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPLocationRecord;
  return -[PPLocationRecord init](&v3, sel_init);
}

- (id)initAmbiguousRecord
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPLocationRecord;
  result = -[PPLocationRecord init](&v3, sel_init);
  if (result)
    *((_BYTE *)result + 69) = 1;
  return result;
}

- (void)supplementFieldsWithClusterID:(id)a3 locationWithLatLong:(id)a4
{
  PPLocation *location;
  id v7;
  void *v8;
  uint64_t v9;
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
  PPLocation *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  PPLocation *v27;
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
  void *v39;
  PPLocationRecord *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v44 = a3;
  v40 = self;
  location = self->_location;
  v7 = a4;
  -[PPLocation placemark](location, "placemark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (uint64_t)v7;
  v39 = v7;
  if (!v7)
  {
    objc_msgSend(v8, "location");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v9;
  objc_msgSend(v8, "name");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v44;
  if (v38)
    v10 = v8;
  objc_msgSend(v10, "name");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thoroughfare");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v44;
  if (v37)
    v11 = v8;
  objc_msgSend(v11, "thoroughfare");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subThoroughfare");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v44;
  if (v36)
    v12 = v8;
  objc_msgSend(v12, "subThoroughfare");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locality");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v44;
  if (v35)
    v13 = v8;
  objc_msgSend(v13, "locality");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subLocality");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v44;
  if (v33)
    v14 = v8;
  objc_msgSend(v14, "subLocality");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "administrativeArea");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v44;
  if (v32)
    v16 = v8;
  objc_msgSend(v16, "administrativeArea");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subAdministrativeArea");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postalCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ISOcountryCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "country");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inlandWater");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ocean");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "areasOfInterest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPLocationStore placemarkWithLocation:name:thoroughfare:subthoroughFare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:countryCode:country:inlandWater:ocean:areasOfInterest:](PPLocationStore, "placemarkWithLocation:name:thoroughfare:subthoroughFare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:countryCode:country:inlandWater:ocean:areasOfInterest:", v41, v43, v42, v31, v30, v15, v29, v28, v17, v18, v19, v20, v21, v22);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
  v23 = [PPLocation alloc];
  v24 = -[PPLocation category](v40->_location, "category");
  -[PPLocation mostRelevantRecord](v40->_location, "mostRelevantRecord");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PPLocation initWithPlacemark:category:mostRelevantRecord:](v23, "initWithPlacemark:category:mostRelevantRecord:", v34, v24, v25);
  v27 = v40->_location;
  v40->_location = (PPLocation *)v26;

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PPMutableLocationRecord *v5;
  void *v6;
  id v7;
  void *v8;

  v5 = -[PPMutableLocationRecord init](+[PPMutableLocationRecord allocWithZone:](PPMutableLocationRecord, "allocWithZone:"), "init");
  v6 = (void *)-[NSUUID copyWithZone:](self->_uuid, "copyWithZone:", a3);
  -[PPMutableLocationRecord setUuid:](v5, "setUuid:", v6);

  v7 = -[PPLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  -[PPMutableLocationRecord setLocation:](v5, "setLocation:", v7);

  -[PPMutableLocationRecord setSource:](v5, "setSource:", self->_source);
  -[PPMutableLocationRecord setAlgorithm:](v5, "setAlgorithm:", self->_algorithm);
  -[PPMutableLocationRecord setInitialScore:](v5, "setInitialScore:", self->_initialScore);
  -[PPMutableLocationRecord setDecayRate:](v5, "setDecayRate:", self->_decayRate);
  v8 = (void *)-[NSArray copyWithZone:](self->_contextualNamedEntities, "copyWithZone:", a3);
  -[PPMutableLocationRecord setContextualNamedEntities:](v5, "setContextualNamedEntities:", v8);

  -[PPMutableLocationRecord setExtractionOsBuild:](v5, "setExtractionOsBuild:", self->_extractionOsBuild);
  -[PPMutableLocationRecord setExtractionAssetVersion:](v5, "setExtractionAssetVersion:", self->_extractionAssetVersion);
  v5->super._bucketizedSentimentScore = self->_bucketizedSentimentScore;
  return v5;
}

- (PPLocationRecord)initWithCoder:(id)a3
{
  id v4;
  PPLocationRecord *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  PPLocation *location;
  uint64_t v10;
  PPSource *source;
  float v12;
  float v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *contextualNamedEntities;
  uint64_t v20;
  NSString *extractionOsBuild;
  PPLocationRecord *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PPLocationRecord;
  v5 = -[PPLocationRecord init](&v24, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v6 = objc_claimAutoreleasedReturnValue();
  uuid = v5->_uuid;
  v5->_uuid = (NSUUID *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loc"));
  v8 = objc_claimAutoreleasedReturnValue();
  location = v5->_location;
  v5->_location = (PPLocation *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("src"));
  v10 = objc_claimAutoreleasedReturnValue();
  source = v5->_source;
  v5->_source = (PPSource *)v10;

  v5->_algorithm = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("alg"));
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("iscr"));
  v5->_initialScore = v12;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("dr"));
  v5->_decayRate = v13;
  v5->_bucketizedSentimentScore = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bss"));
  v14 = (void *)MEMORY[0x18D7805AC]();
  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  v16 = objc_opt_class();
  v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v14);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("cne"));
  v18 = objc_claimAutoreleasedReturnValue();
  contextualNamedEntities = v5->_contextualNamedEntities;
  v5->_contextualNamedEntities = (NSArray *)v18;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eob"));
  v20 = objc_claimAutoreleasedReturnValue();
  extractionOsBuild = v5->_extractionOsBuild;
  v5->_extractionOsBuild = (NSString *)v20;

  v5->_extractionAssetVersion = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("eav"));
  if (!v5->_uuid)
    goto LABEL_6;
  if (v5->_location && v5->_source)
LABEL_5:
    v22 = v5;
  else
LABEL_6:
    v22 = 0;

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  double v5;
  double v6;
  id v7;

  uuid = self->_uuid;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", uuid, CFSTR("uuid"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_location, CFSTR("loc"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_source, CFSTR("src"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_algorithm, CFSTR("alg"));
  *(float *)&v5 = self->_initialScore;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("iscr"), v5);
  *(float *)&v6 = self->_decayRate;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("dr"), v6);
  objc_msgSend(v7, "encodeInt32:forKey:", self->_bucketizedSentimentScore, CFSTR("bss"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_contextualNamedEntities, CFSTR("cne"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_extractionOsBuild, CFSTR("eob"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_extractionAssetVersion, CFSTR("eav"));

}

- (BOOL)isEqualToLocationRecord:(id)a3
{
  unsigned __int8 *v4;
  NSUUID *uuid;
  uint64_t v6;
  PPLocation *location;
  uint64_t v8;
  PPSource *v9;
  unint64_t v10;
  void *v11;
  _BOOL4 v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  BOOL v16;
  _BOOL4 v17;

  v4 = (unsigned __int8 *)a3;
  if (!v4)
    goto LABEL_31;
  uuid = self->_uuid;
  v6 = *((_QWORD *)v4 + 1);
  if (uuid)
  {
    if (!v6 || !-[NSUUID isEqual:](uuid, "isEqual:"))
      goto LABEL_31;
  }
  else if (v6)
  {
    goto LABEL_31;
  }
  location = self->_location;
  v8 = *((_QWORD *)v4 + 2);
  if (location)
  {
    if (!v8 || !-[PPLocation isEqual:](location, "isEqual:"))
      goto LABEL_31;
  }
  else if (v8)
  {
    goto LABEL_31;
  }
  v9 = self->_source;
  v10 = (unint64_t)*((id *)v4 + 3);
  if ((unint64_t)v9 | v10)
  {
    v11 = (void *)v10;
    if (!v9 || !v10)
      goto LABEL_30;
    v12 = -[PPSource isEqualToSource:](v9, "isEqualToSource:", v10);

    if (!v12)
      goto LABEL_31;
  }
  if (self->_algorithm != v4[32]
    || self->_initialScore != *((float *)v4 + 9)
    || self->_decayRate != *((float *)v4 + 10)
    || self->_bucketizedSentimentScore != v4[68])
  {
    goto LABEL_31;
  }
  v9 = self->_contextualNamedEntities;
  v13 = (unint64_t)*((id *)v4 + 6);
  if ((unint64_t)v9 | v13)
  {
    v11 = (void *)v13;
    if (!v9 || !v13)
      goto LABEL_30;
    v17 = -[PPSource isEqualToArray:](v9, "isEqualToArray:", v13);

    if (!v17)
      goto LABEL_31;
  }
  v9 = self->_extractionOsBuild;
  v14 = (unint64_t)*((id *)v4 + 7);
  if ((unint64_t)v9 | v14)
  {
    v11 = (void *)v14;
    if (v9 && v14)
    {
      v15 = -[PPSource isEqualToString:](v9, "isEqualToString:", v14);

      if (v15)
        goto LABEL_25;
LABEL_31:
      v16 = 0;
      goto LABEL_32;
    }
LABEL_30:

    goto LABEL_31;
  }
LABEL_25:
  v16 = self->_extractionAssetVersion == *((_DWORD *)v4 + 16);
LABEL_32:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PPLocationRecord *v4;
  PPLocationRecord *v5;
  BOOL v6;

  v4 = (PPLocationRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && -[PPLocationRecord isEqualToLocationRecord:](self, "isEqualToLocationRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;

  v3 = -[NSUUID hash](self->_uuid, "hash");
  v4 = -[PPLocation hash](self->_location, "hash") - v3 + 32 * v3;
  v5 = -[PPSource hash](self->_source, "hash");
  v6 = self->_algorithm - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  *(float *)&v7 = self->_initialScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") - v6 + 32 * v6;

  *(float *)&v10 = self->_decayRate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash") - v9 + 32 * v9;

  v13 = self->_bucketizedSentimentScore - v12 + 32 * v12;
  v14 = -[NSArray hash](self->_contextualNamedEntities, "hash") - v13 + 32 * v13;
  v15 = -[NSString hash](self->_extractionOsBuild, "hash");
  return self->_extractionAssetVersion - (v15 - v14 + 32 * v14) + 32 * (v15 - v14 + 32 * v14);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (PPLocation)location
{
  return self->_location;
}

- (PPSource)source
{
  return self->_source;
}

- (unsigned)algorithm
{
  return self->_algorithm;
}

- (double)initialScore
{
  return self->_initialScore;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (double)sentimentScore
{
  return (double)self->_bucketizedSentimentScore * 0.00787401575;
}

- (unsigned)extractionAssetVersion
{
  return self->_extractionAssetVersion;
}

- (id)description
{
  id v3;
  NSUUID *uuid;
  PPLocation *location;
  void *v6;
  void *v7;
  double initialScore;
  double decayRate;
  uint64_t v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  uuid = self->_uuid;
  location = self->_location;
  -[PPSource bundleId](self->_source, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPLocationRecord describeAlgorithm:](PPLocationRecord, "describeAlgorithm:", self->_algorithm);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  initialScore = self->_initialScore;
  decayRate = self->_decayRate;
  -[PPLocationRecord sentimentScore](self, "sentimentScore");
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPLocationRecord u:%@ l:%@ src:%@ a:'%@' is:%f dr:%f ss:%f cne:%@ eos:%@ eav:%u>"), uuid, location, v6, v7, *(_QWORD *)&initialScore, *(_QWORD *)&decayRate, v10, self->_contextualNamedEntities, self->_extractionOsBuild, self->_extractionAssetVersion);

  return v11;
}

- (NSSet)featureNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PPLocationRecord_featureNames__block_invoke;
  block[3] = &unk_1E226C130;
  block[4] = self;
  if (featureNames__pasOnceToken14 != -1)
    dispatch_once(&featureNames__pasOnceToken14, block);
  return (NSSet *)(id)featureNames__pasExprOnceResult_225;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t extractionAssetVersion;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSArray *contextualNamedEntities;
  void *v20;
  float decayRate;
  double v22;
  void *v23;

  v4 = a3;
  if (!objc_msgSend(v4, "hasPrefix:", CFSTR("location_")))
  {
    if (objc_msgSend(v4, "hasPrefix:", CFSTR("source_")))
    {
      -[PPLocationRecord source](self, "source");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("source_");
      goto LABEL_5;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("extractionAssetVersion")))
    {
      v10 = (void *)MEMORY[0x1E0C9E918];
      extractionAssetVersion = self->_extractionAssetVersion;
LABEL_16:
      objc_msgSend(v10, "featureValueWithInt64:", extractionAssetVersion);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v8 = (void *)v17;
      goto LABEL_6;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("extractionOsBuild")))
    {
      v12 = (void *)MEMORY[0x1E0C9E918];
      -[PPLocationRecord extractionOsBuild](self, "extractionOsBuild");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (const __CFString *)v13;
      else
        v15 = &stru_1E226D4B0;
      objc_msgSend(v12, "featureValueWithString:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v8 = (void *)v16;

      goto LABEL_6;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("algorithm")))
    {
      v10 = (void *)MEMORY[0x1E0C9E918];
      extractionAssetVersion = self->_algorithm;
      goto LABEL_16;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("contextualNamedEntities")))
    {
      v18 = (void *)MEMORY[0x1E0C9E918];
      if (self->_contextualNamedEntities)
        contextualNamedEntities = self->_contextualNamedEntities;
      else
        contextualNamedEntities = (NSArray *)MEMORY[0x1E0C9AA60];
      objc_msgSend(MEMORY[0x1E0C9E9C0], "sequenceWithStringArray:", contextualNamedEntities);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "featureValueWithSequence:", v14);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("decayRate")))
    {
      v20 = (void *)MEMORY[0x1E0C9E918];
      decayRate = self->_decayRate;
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("initialScore")))
      {
        if (!objc_msgSend(v4, "isEqualToString:", CFSTR("sentimentScore")))
        {
          v8 = 0;
          goto LABEL_6;
        }
        v23 = (void *)MEMORY[0x1E0C9E918];
        -[PPLocationRecord sentimentScore](self, "sentimentScore");
        v20 = v23;
        goto LABEL_29;
      }
      v20 = (void *)MEMORY[0x1E0C9E918];
      decayRate = self->_initialScore;
    }
    v22 = decayRate;
LABEL_29:
    objc_msgSend(v20, "featureValueWithDouble:", v22);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  -[PPLocationRecord location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("location_");
LABEL_5:
  objc_msgSend(v4, "substringFromIndex:", -[__CFString length](v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureValueForName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v8;
}

- (id)identifier
{
  return -[PPLocation clusterIdentifier](self->_location, "clusterIdentifier");
}

- (NSArray)contextualNamedEntities
{
  return self->_contextualNamedEntities;
}

- (NSString)extractionOsBuild
{
  return self->_extractionOsBuild;
}

- (BOOL)isAmbiguous
{
  return self->_isAmbiguous;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionOsBuild, 0);
  objc_storeStrong((id *)&self->_contextualNamedEntities, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

void __32__PPLocationRecord_featureNames__block_invoke(uint64_t a1)
{
  void *v2;
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
  void *v13;
  uint64_t v14;
  void *v15;

  v2 = (void *)MEMORY[0x18D7805AC]();
  v3 = (void *)MEMORY[0x18D7805AC]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("extractionOsBuild"), CFSTR("extractionAssetVersion"), CFSTR("contextualNamedEntities"), CFSTR("decayRate"), CFSTR("initialScore"), CFSTR("sentimentScore"), CFSTR("algorithm"), 0);
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_226);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "featureNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_227_3648);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setByAddingObjectsFromArray:", v8);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)featureNames__pasExprOnceResult_225;
  featureNames__pasExprOnceResult_225 = v14;

  objc_autoreleasePoolPop(v2);
}

uint64_t __32__PPLocationRecord_featureNames__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("source_"), "stringByAppendingString:", a2);
}

uint64_t __32__PPLocationRecord_featureNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("location_"), "stringByAppendingString:", a2);
}

+ (id)sharedAmbiguousRecord
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PPLocationRecord_sharedAmbiguousRecord__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAmbiguousRecord__pasOnceToken9 != -1)
    dispatch_once(&sharedAmbiguousRecord__pasOnceToken9, block);
  return (id)sharedAmbiguousRecord__pasExprOnceResult;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)describeAlgorithm:(unsigned __int16)a3
{
  __CFString *v3;
  void *v4;

  if ((a3 - 1) >= 0xC)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown (%u)"), a3);
    objc_msgSend(v4, "_pas_stringBackedByUTF8CString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = off_1E226AA00[(unsigned __int16)(a3 - 1)];
  }
  return v3;
}

+ (id)algorithmForName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[12];
  _QWORD v11[13];

  v11[12] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CoreNLP");
  v10[1] = CFSTR("Lookup Hints");
  v11[0] = &unk_1E2284C70;
  v11[1] = &unk_1E2284C88;
  v10[2] = CFSTR("Data Detectors");
  v10[3] = CFSTR("Custom Tagger");
  v11[2] = &unk_1E2284CA0;
  v11[3] = &unk_1E2284CB8;
  v10[4] = CFSTR("Core Routine");
  v10[5] = CFSTR("NSUA Structured Location");
  v11[4] = &unk_1E2284CD0;
  v11[5] = &unk_1E2284CE8;
  v10[6] = CFSTR("Trusted Location");
  v10[7] = CFSTR("Maps Interaction");
  v11[6] = &unk_1E2284D00;
  v11[7] = &unk_1E2284D18;
  v10[8] = CFSTR("EventKit Import");
  v10[9] = CFSTR("Photos Knowledge Graph");
  v11[8] = &unk_1E2284D30;
  v11[9] = &unk_1E2284D48;
  v10[10] = CFSTR("Augmented Gazetteer");
  v10[11] = CFSTR("Knowledge Graph");
  v11[10] = &unk_1E2284D60;
  v11[11] = &unk_1E2284D78;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v11, v10, 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = &unk_1E2284D90;
  v8 = v7;

  return v8;
}

void __41__PPLocationRecord_sharedAmbiguousRecord__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x18D7805AC]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initAmbiguousRecord");
  v4 = (void *)sharedAmbiguousRecord__pasExprOnceResult;
  sharedAmbiguousRecord__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

@end
