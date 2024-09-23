@implementation PPSocialHighlight

- (PPSocialHighlight)initWithIdentifier:(id)a3 resourceURL:(id)a4 timestamp:(id)a5 attributionIdentifiers:(id)a6 supplementaryData:(id)a7
{
  return -[PPSocialHighlight initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:score:](self, "initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:score:", a3, a4, a5, a6, a7, 0);
}

- (PPSocialHighlight)initWithIdentifier:(id)a3 resourceURL:(id)a4 timestamp:(id)a5 attributionIdentifiers:(id)a6 supplementaryData:(id)a7 score:(id)a8
{
  id v15;
  id v16;
  id v17;
  PPSocialHighlight *v18;
  PPSocialHighlight *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PPSocialHighlight;
  v18 = -[PPSocialHighlight init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_resourceURL, a4);
    objc_storeStrong((id *)&v19->_timestamp, a5);
    objc_storeStrong((id *)&v19->_attributionIdentifiers, a6);
    objc_storeStrong((id *)&v19->_supplementaryData, a7);
    objc_storeStrong((id *)&v19->_score, a8);
  }

  return v19;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPSocialHighlight identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight resourceURL](self, "resourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight attributionIdentifiers](self, "attributionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight supplementaryData](self, "supplementaryData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlight score](self, "score");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPSocialHighlight id:'%@' ru:'%@' ts:'%@' at:'%@' sd:'%@' sc:'%@'>"), v4, v5, v6, v7, v8, v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  id v6;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resourceURL, CFSTR("ru"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("ts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributionIdentifiers, CFSTR("at"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supplementaryData, CFSTR("sd"));
  -[PPSocialHighlight score](self, "score");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("sc"));

}

- (PPSocialHighlight)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  PPSocialHighlight *v33;
  PPSocialHighlight *v34;
  void *v35;
  uint64_t v37;
  void *v38;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = objc_opt_class();
  pp_social_highlights_log_handle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v5, CFSTR("id"), v3, 1, CFSTR("PPErrorDomain"), 23, v6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D81610];
  v8 = objc_opt_class();
  pp_social_highlights_log_handle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("ru"), v3, 1, CFSTR("PPErrorDomain"), 23, v9);
  v37 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D81610];
  v11 = objc_opt_class();
  pp_social_highlights_log_handle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v11, CFSTR("ts"), v3, 1, CFSTR("PPErrorDomain"), 23, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D81610];
  v15 = (void *)MEMORY[0x18D7805AC]();
  v16 = objc_alloc(MEMORY[0x1E0C99E60]);
  v17 = objc_opt_class();
  v18 = (void *)objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v15);
  pp_social_highlights_log_handle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v18, CFSTR("at"), v3, 1, CFSTR("PPErrorDomain"), 23, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D81610];
  v22 = (void *)MEMORY[0x18D7805AC]();
  v23 = objc_alloc(MEMORY[0x1E0C99E60]);
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = (void *)objc_msgSend(v23, "initWithObjects:", v24, v25, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v22);
  pp_social_highlights_log_handle();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v26, CFSTR("sd"), v3, 1, CFSTR("PPErrorDomain"), 23, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0D81610];
  v30 = objc_opt_class();
  pp_social_highlights_log_handle();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v30, CFSTR("sc"), v3, 0, CFSTR("PPErrorDomain"), 23, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  if (v38)
  {
    v34 = self;
    v35 = (void *)v37;
    if (v37 && v13 && v20 && v28)
    {
      v34 = -[PPSocialHighlight initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:score:](self, "initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:score:", v38, v37, v13, v20, v28, v32);
      v33 = v34;
    }
  }
  else
  {
    v34 = self;
    v35 = (void *)v37;
  }

  return v33;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSArray)attributionIdentifiers
{
  return self->_attributionIdentifiers;
}

- (NSDictionary)supplementaryData
{
  return self->_supplementaryData;
}

- (NSNumber)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_supplementaryData, 0);
  objc_storeStrong((id *)&self->_attributionIdentifiers, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
