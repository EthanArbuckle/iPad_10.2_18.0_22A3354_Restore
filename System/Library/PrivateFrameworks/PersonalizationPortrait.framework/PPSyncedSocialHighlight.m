@implementation PPSyncedSocialHighlight

- (PPSyncedSocialHighlight)initWithHighlight:(id)a3 rankingDate:(id)a4 originatingDeviceId:(id)a5
{
  id v9;
  id v10;
  id v11;
  PPSyncedSocialHighlight *v12;
  PPSyncedSocialHighlight *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PPSyncedSocialHighlight;
  v12 = -[PPSyncedSocialHighlight init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_highlight, a3);
    objc_storeStrong((id *)&v13->_rankingDate, a4);
    objc_storeStrong((id *)&v13->_originatingDeviceId, a5);
  }

  return v13;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPSyncedSocialHighlight highlight](self, "highlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSyncedSocialHighlight rankingDate](self, "rankingDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSyncedSocialHighlight originatingDeviceId](self, "originatingDeviceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPSyncedSocialHighlight hi:'%@' rd:'%@' od:'%@'>"), v4, v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  PPSocialHighlight *highlight;
  id v5;

  highlight = self->_highlight;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", highlight, CFSTR("hi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rankingDate, CFSTR("rd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatingDeviceId, CFSTR("od"));

}

- (PPSyncedSocialHighlight)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PPSyncedSocialHighlight *v17;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  v6 = objc_opt_class();
  pp_social_highlights_log_handle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("hi"), v5, 1, CFSTR("PPErrorDomain"), 23, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D81610];
  v10 = objc_opt_class();
  pp_social_highlights_log_handle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("rd"), v5, 1, CFSTR("PPErrorDomain"), 23, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D81610];
  v14 = objc_opt_class();
  pp_social_highlights_log_handle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("od"), v5, 1, CFSTR("PPErrorDomain"), 23, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (v8 && v12 && v16)
  {
    self = -[PPSyncedSocialHighlight initWithHighlight:rankingDate:originatingDeviceId:](self, "initWithHighlight:rankingDate:originatingDeviceId:", v8, v12, v16);
    v17 = self;
  }

  return v17;
}

- (PPSocialHighlight)highlight
{
  return self->_highlight;
}

- (NSDate)rankingDate
{
  return self->_rankingDate;
}

- (NSString)originatingDeviceId
{
  return self->_originatingDeviceId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingDeviceId, 0);
  objc_storeStrong((id *)&self->_rankingDate, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
