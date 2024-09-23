@implementation VIObjectKnowledge

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VIObjectKnowledge)initWithKnowledgeGraphID:(id)a3 title:(id)a4 thumbnailURL:(id)a5 thumbnailAspectRatio:(float)a6 shortDescription:(id)a7 detailedDescription:(id)a8 webURL:(id)a9 knowledgeProperties:(id)a10 serializedDomainType:(int64_t)a11 serializedDomainResponse:(id)a12 csuQid:(unint64_t)a13 csuIdType:(signed __int16)a14 csuLocalizedLabel:(id)a15 csuLocalizedLabelDictionary:(id)a16 csuConfidence:(double)a17 csuSensitiveLocation:(BOOL)a18 csuCategory:(id)a19 csuVertical:(id)a20 csuLocalizedSynonyms:(id)a21 csuLongitute:(double)a22 csuLatitute:(double)a23 csuVersion:(int)a24
{
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  VIObjectKnowledge *v40;
  uint64_t v41;
  NSString *knowledgeGraphID;
  uint64_t v43;
  NSString *title;
  uint64_t v45;
  NSURL *thumbnailURL;
  uint64_t v47;
  NSString *shortDescription;
  uint64_t v49;
  NSString *detailedDescription;
  uint64_t v51;
  NSURL *webURL;
  uint64_t v53;
  NSArray *knowledgeProperties;
  uint64_t v55;
  NSData *serializedDomainResponse;
  uint64_t v57;
  NSString *csuLocalizedLabel;
  uint64_t v59;
  NSDictionary *csuLocalizedLabelDictionary;
  uint64_t v61;
  NSString *csuCategory;
  uint64_t v63;
  NSString *csuVertical;
  uint64_t v65;
  NSDictionary *csuLocalizedSynonymsDictionary;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  objc_super v75;

  v68 = a3;
  v69 = a4;
  v74 = a5;
  v73 = a7;
  v72 = a8;
  v71 = a9;
  v70 = a10;
  v34 = a12;
  v35 = a15;
  v36 = a16;
  v37 = a19;
  v38 = a20;
  v39 = a21;
  v75.receiver = self;
  v75.super_class = (Class)VIObjectKnowledge;
  v40 = -[VIObjectKnowledge init](&v75, sel_init);
  if (v40)
  {
    v41 = objc_msgSend(v68, "copy");
    knowledgeGraphID = v40->_knowledgeGraphID;
    v40->_knowledgeGraphID = (NSString *)v41;

    v43 = objc_msgSend(v69, "copy");
    title = v40->_title;
    v40->_title = (NSString *)v43;

    v45 = objc_msgSend(v74, "copy");
    thumbnailURL = v40->_thumbnailURL;
    v40->_thumbnailURL = (NSURL *)v45;

    v40->_thumbnailAspectRatio = a6;
    v47 = objc_msgSend(v73, "copy");
    shortDescription = v40->_shortDescription;
    v40->_shortDescription = (NSString *)v47;

    v49 = objc_msgSend(v72, "copy");
    detailedDescription = v40->_detailedDescription;
    v40->_detailedDescription = (NSString *)v49;

    v51 = objc_msgSend(v71, "copy");
    webURL = v40->_webURL;
    v40->_webURL = (NSURL *)v51;

    v53 = objc_msgSend(v70, "copy");
    knowledgeProperties = v40->_knowledgeProperties;
    v40->_knowledgeProperties = (NSArray *)v53;

    v40->_serializedDomainType = a11;
    v55 = objc_msgSend(v34, "copy");
    serializedDomainResponse = v40->_serializedDomainResponse;
    v40->_serializedDomainResponse = (NSData *)v55;

    v40->_csuQid = a13;
    v40->_csuIdType = a14;
    v57 = objc_msgSend(v35, "copy");
    csuLocalizedLabel = v40->_csuLocalizedLabel;
    v40->_csuLocalizedLabel = (NSString *)v57;

    v59 = objc_msgSend(v36, "copy");
    csuLocalizedLabelDictionary = v40->_csuLocalizedLabelDictionary;
    v40->_csuLocalizedLabelDictionary = (NSDictionary *)v59;

    v40->_csuConfidence = a17;
    v40->_csuSensitiveLocation = a18;
    v61 = objc_msgSend(v37, "copy");
    csuCategory = v40->_csuCategory;
    v40->_csuCategory = (NSString *)v61;

    v63 = objc_msgSend(v38, "copy");
    csuVertical = v40->_csuVertical;
    v40->_csuVertical = (NSString *)v63;

    v65 = objc_msgSend(v39, "copy");
    csuLocalizedSynonymsDictionary = v40->_csuLocalizedSynonymsDictionary;
    v40->_csuLocalizedSynonymsDictionary = (NSDictionary *)v65;

    v40->_csuLongitute = a22;
    v40->_csuLatitute = a23;
    v40->_csuVersion = a24;
  }

  return v40;
}

- (VIObjectKnowledge)initWithKnowledgeGraphID:(id)a3 title:(id)a4 thumbnailURL:(id)a5 thumbnailAspectRatio:(float)a6 shortDescription:(id)a7 detailedDescription:(id)a8 webURL:(id)a9 knowledgeProperties:(id)a10 serializedDomainType:(int64_t)a11 serializedDomainResponse:(id)a12
{
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  VIObjectKnowledge *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v19 = (void *)MEMORY[0x1E0C99DC8];
  v36 = a12;
  v20 = a10;
  v35 = a9;
  v34 = a8;
  v21 = a7;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  objc_msgSend(v19, "currentLocale");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v37;
  v43[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v33;
  v25 = (void *)objc_opt_new();
  v41 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v31) = 0;
  LOBYTE(v30) = 0;
  LOWORD(v29) = 0;
  *(float *)&v27 = a6;
  v39 = -[VIObjectKnowledge initWithKnowledgeGraphID:title:thumbnailURL:thumbnailAspectRatio:shortDescription:detailedDescription:webURL:knowledgeProperties:serializedDomainType:serializedDomainResponse:csuQid:csuIdType:csuLocalizedLabel:csuLocalizedLabelDictionary:csuConfidence:csuSensitiveLocation:csuCategory:csuVertical:csuLocalizedSynonyms:csuLongitute:csuLatitute:csuVersion:](self, "initWithKnowledgeGraphID:title:thumbnailURL:thumbnailAspectRatio:shortDescription:detailedDescription:webURL:knowledgeProperties:serializedDomainType:serializedDomainResponse:csuQid:csuIdType:csuLocalizedLabel:csuLocalizedLabelDictionary:csuConfidence:csuSensitiveLocation:csuCategory:csuVertical:csuLocalizedSynonyms:csuLongitute:csuLatitute:csuVersion:", v24, v23, v22, v21, v34, v35, v27, 1.0, 0.0, 0.0, v20, a11, v36, 0,
          v29,
          v23,
          v32,
          v30,
          &stru_1E980D400,
          &stru_1E980D400,
          v26,
          v31);

  return v39;
}

- (VIObjectKnowledge)initWithCoder:(id)a3
{
  id v4;
  VIObjectKnowledge *v5;
  uint64_t v6;
  NSString *knowledgeGraphID;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSURL *thumbnailURL;
  void *v12;
  float v13;
  uint64_t v14;
  NSString *shortDescription;
  uint64_t v16;
  NSString *detailedDescription;
  uint64_t v18;
  NSURL *webURL;
  uint64_t v20;
  NSArray *knowledgeProperties;
  void *v22;
  uint64_t v23;
  NSData *serializedDomainResponse;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *csuLocalizedLabel;
  uint64_t v29;
  NSDictionary *csuLocalizedLabelDictionary;
  void *v31;
  double v32;
  void *v33;
  uint64_t v34;
  NSString *csuCategory;
  uint64_t v36;
  NSString *csuVertical;
  uint64_t v38;
  NSDictionary *csuLocalizedSynonymsDictionary;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;

  v4 = a3;
  v5 = -[VIObjectKnowledge init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("knowledgeGraphID"));
    v6 = objc_claimAutoreleasedReturnValue();
    knowledgeGraphID = v5->_knowledgeGraphID;
    v5->_knowledgeGraphID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("thumbnailURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    thumbnailURL = v5->_thumbnailURL;
    v5->_thumbnailURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("thumbnailAspectRatio"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v5->_thumbnailAspectRatio = v13;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("shortDecription"));
    v14 = objc_claimAutoreleasedReturnValue();
    shortDescription = v5->_shortDescription;
    v5->_shortDescription = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("detailedDescription"));
    v16 = objc_claimAutoreleasedReturnValue();
    detailedDescription = v5->_detailedDescription;
    v5->_detailedDescription = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("webURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    webURL = v5->_webURL;
    v5->_webURL = (NSURL *)v18;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("knowledgeProperties"));
    v20 = objc_claimAutoreleasedReturnValue();
    knowledgeProperties = v5->_knowledgeProperties;
    v5->_knowledgeProperties = (NSArray *)v20;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("serializedDomainType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_serializedDomainType = objc_msgSend(v22, "integerValue");

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("serializedDomainResponse"));
    v23 = objc_claimAutoreleasedReturnValue();
    serializedDomainResponse = v5->_serializedDomainResponse;
    v5->_serializedDomainResponse = (NSData *)v23;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("csuQid"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_csuQid = objc_msgSend(v25, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("csuQid"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_csuIdType = objc_msgSend(v26, "shortValue");

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("csuLocalizedLabel"));
    v27 = objc_claimAutoreleasedReturnValue();
    csuLocalizedLabel = v5->_csuLocalizedLabel;
    v5->_csuLocalizedLabel = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("csuLocalizedLabelDictionary"));
    v29 = objc_claimAutoreleasedReturnValue();
    csuLocalizedLabelDictionary = v5->_csuLocalizedLabelDictionary;
    v5->_csuLocalizedLabelDictionary = (NSDictionary *)v29;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("csuConfidence"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    v5->_csuConfidence = v32;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("csuSensitiveLocation"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_csuSensitiveLocation = objc_msgSend(v33, "BOOLValue");

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("csuCategory"));
    v34 = objc_claimAutoreleasedReturnValue();
    csuCategory = v5->_csuCategory;
    v5->_csuCategory = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("csuVertical"));
    v36 = objc_claimAutoreleasedReturnValue();
    csuVertical = v5->_csuVertical;
    v5->_csuVertical = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("csuLocalizedSynonymsDictionary"));
    v38 = objc_claimAutoreleasedReturnValue();
    csuLocalizedSynonymsDictionary = v5->_csuLocalizedSynonymsDictionary;
    v5->_csuLocalizedSynonymsDictionary = (NSDictionary *)v38;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("csuLongitute"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleValue");
    v5->_csuLongitute = v41;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("csuLatitute"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    v5->_csuLatitute = v43;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("csuVersion"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_csuVersion = objc_msgSend(v44, "intValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *knowledgeGraphID;
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  knowledgeGraphID = self->_knowledgeGraphID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", knowledgeGraphID, CFSTR("knowledgeGraphID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thumbnailURL, CFSTR("thumbnailURL"));
  *(float *)&v6 = self->_thumbnailAspectRatio;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("thumbnailAspectRatio"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_shortDescription, CFSTR("shortDecription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailedDescription, CFSTR("detailedDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webURL, CFSTR("webURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_knowledgeProperties, CFSTR("knowledgeProperties"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_serializedDomainType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("serializedDomainType"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_serializedDomainResponse, CFSTR("serializedDomainResponse"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_csuQid);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("csuQid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_csuIdType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("csuIdType"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_csuLocalizedLabel, CFSTR("csuLocalizedLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_csuLocalizedLabelDictionary, CFSTR("csuLocalizedLabelDictionary"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_csuConfidence);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("csuConfidence"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_csuSensitiveLocation);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("csuSensitiveLocation"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_csuCategory, CFSTR("csuCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_csuVertical, CFSTR("csuVertical"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_csuLocalizedSynonymsDictionary, CFSTR("csuLocalizedSynonymsDictionary"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_csuLongitute);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("csuLongitute"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_csuLatitute);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("csuLatitute"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_csuVersion);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("csuVersion"));

}

- (BOOL)isEqual:(id)a3
{
  VIObjectKnowledge *v4;
  VIObjectKnowledge *v5;
  VIObjectKnowledge *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  BOOL v16;
  void *v18;
  void *v19;
  void *v20;

  v4 = (VIObjectKnowledge *)a3;
  if (v4 == self)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    -[VIObjectKnowledge knowledgeGraphID](v6, "knowledgeGraphID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (VIObjectIsEqual((unint64_t)v7, (uint64_t)self->_knowledgeGraphID))
    {
      -[VIObjectKnowledge title](v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (VIObjectIsEqual((unint64_t)v8, (uint64_t)self->_title))
      {
        -[VIObjectKnowledge thumbnailURL](v6, "thumbnailURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (VIObjectIsEqual((unint64_t)v9, (uint64_t)self->_thumbnailURL)
          && (-[VIObjectKnowledge thumbnailAspectRatio](v6, "thumbnailAspectRatio"),
              VICompareFloat(v10, self->_thumbnailAspectRatio)))
        {
          -[VIObjectKnowledge shortDescription](v6, "shortDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (VIObjectIsEqual((unint64_t)v11, (uint64_t)self->_shortDescription))
          {
            -[VIObjectKnowledge detailedDescription](v6, "detailedDescription");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (VIObjectIsEqual((unint64_t)v12, (uint64_t)self->_detailedDescription))
            {
              -[VIObjectKnowledge webURL](v6, "webURL");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (VIObjectIsEqual((unint64_t)v13, (uint64_t)self->_webURL))
              {
                -[VIObjectKnowledge knowledgeProperties](v6, "knowledgeProperties");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (VIObjectIsEqual((unint64_t)v14, (uint64_t)self->_knowledgeProperties))
                {
                  -[VIObjectKnowledge csuLocalizedLabel](v6, "csuLocalizedLabel");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  if (VIObjectIsEqual((unint64_t)v20, (uint64_t)self->_csuLocalizedLabel)
                    && (-[VIObjectKnowledge csuConfidence](v6, "csuConfidence"),
                        VICompareDouble(v15, self->_csuConfidence)))
                  {
                    -[VIObjectKnowledge csuCategory](v6, "csuCategory");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    if (VIObjectIsEqual((unint64_t)v19, (uint64_t)self->_csuCategory))
                    {
                      -[VIObjectKnowledge csuVertical](v6, "csuVertical");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      v16 = VIObjectIsEqual((unint64_t)v18, (uint64_t)self->_csuVertical)
                         && VICompareUInt64(-[VIObjectKnowledge csuQid](v6, "csuQid"), self->_csuQid)
                         && self->_csuSensitiveLocation == -[VIObjectKnowledge csuSensitiveLocation](v6, "csuSensitiveLocation")&& -[VIObjectKnowledge csuVersion](v6, "csuVersion") == self->_csuVersion;

                    }
                    else
                    {
                      v16 = 0;
                    }

                  }
                  else
                  {
                    v16 = 0;
                  }

                }
                else
                {
                  v16 = 0;
                }

              }
              else
              {
                v16 = 0;
              }

            }
            else
            {
              v16 = 0;
            }

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  float thumbnailAspectRatio;
  float v7;
  float v8;
  float v9;
  float v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  double csuConfidence;
  double v21;
  long double v22;
  double v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  void *v30;
  unint64_t v31;

  v3 = -[NSString hash](self->_knowledgeGraphID, "hash");
  v4 = -[NSString hash](self->_title, "hash");
  v5 = -[NSURL hash](self->_thumbnailURL, "hash");
  thumbnailAspectRatio = self->_thumbnailAspectRatio;
  v7 = -thumbnailAspectRatio;
  if (thumbnailAspectRatio >= 0.0)
    v7 = self->_thumbnailAspectRatio;
  v8 = floorf(v7 + 0.5);
  v9 = (float)(v7 - v8) * 1.8447e19;
  v10 = fmodf(v8, 1.8447e19);
  v11 = 2654435761u * (unint64_t)v10;
  v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0)
    v12 = 2654435761u * (unint64_t)v10;
  v13 = v11 - (unint64_t)fabsf(v9);
  if (v9 < 0.0)
    v14 = v13;
  else
    v14 = v12;
  v15 = -[NSString hash](self->_shortDescription, "hash");
  v16 = -[NSString hash](self->_detailedDescription, "hash");
  v17 = -[NSURL hash](self->_webURL, "hash");
  v18 = -[NSArray hash](self->_knowledgeProperties, "hash");
  v19 = -[NSString hash](self->_csuLocalizedLabel, "hash");
  csuConfidence = self->_csuConfidence;
  v21 = -csuConfidence;
  if (csuConfidence >= 0.0)
    v21 = self->_csuConfidence;
  v22 = floor(v21 + 0.5);
  v23 = (v21 - v22) * 1.84467441e19;
  v24 = fmod(v22, 1.84467441e19);
  v25 = 2654435761u * (unint64_t)v24;
  v26 = v25 + (unint64_t)v23;
  if (v23 <= 0.0)
    v26 = 2654435761u * (unint64_t)v24;
  v27 = v25 - (unint64_t)fabs(v23);
  if (v23 >= 0.0)
    v27 = v26;
  v28 = v4 ^ v3 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v27 ^ v5 ^ v14 ^ -[NSString hash](self->_csuCategory, "hash");
  v29 = -[NSString hash](self->_csuVertical, "hash");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), self->_csuQid);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v28 ^ v29 ^ objc_msgSend(v30, "hash");

  return v31;
}

- (NSString)knowledgeGraphID
{
  return self->_knowledgeGraphID;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (float)thumbnailAspectRatio
{
  return self->_thumbnailAspectRatio;
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (NSString)detailedDescription
{
  return self->_detailedDescription;
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (NSArray)knowledgeProperties
{
  return self->_knowledgeProperties;
}

- (unint64_t)csuQid
{
  return self->_csuQid;
}

- (signed)csuIdType
{
  return self->_csuIdType;
}

- (NSString)csuLocalizedLabel
{
  return self->_csuLocalizedLabel;
}

- (NSDictionary)csuLocalizedLabelDictionary
{
  return self->_csuLocalizedLabelDictionary;
}

- (double)csuConfidence
{
  return self->_csuConfidence;
}

- (BOOL)csuSensitiveLocation
{
  return self->_csuSensitiveLocation;
}

- (NSString)csuCategory
{
  return self->_csuCategory;
}

- (NSString)csuVertical
{
  return self->_csuVertical;
}

- (NSDictionary)csuLocalizedSynonymsDictionary
{
  return self->_csuLocalizedSynonymsDictionary;
}

- (double)csuLongitute
{
  return self->_csuLongitute;
}

- (double)csuLatitute
{
  return self->_csuLatitute;
}

- (int)csuVersion
{
  return self->_csuVersion;
}

- (int64_t)serializedDomainType
{
  return self->_serializedDomainType;
}

- (NSData)serializedDomainResponse
{
  return self->_serializedDomainResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedDomainResponse, 0);
  objc_storeStrong((id *)&self->_csuLocalizedSynonymsDictionary, 0);
  objc_storeStrong((id *)&self->_csuVertical, 0);
  objc_storeStrong((id *)&self->_csuCategory, 0);
  objc_storeStrong((id *)&self->_csuLocalizedLabelDictionary, 0);
  objc_storeStrong((id *)&self->_csuLocalizedLabel, 0);
  objc_storeStrong((id *)&self->_knowledgeProperties, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong((id *)&self->_detailedDescription, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_knowledgeGraphID, 0);
}

@end
