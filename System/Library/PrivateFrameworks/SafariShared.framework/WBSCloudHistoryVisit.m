@implementation WBSCloudHistoryVisit

- (WBSCloudHistoryVisit)initWithDictionary:(id)a3
{
  id v4;
  WBSCloudHistoryVisit *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  WBSHistoryVisitIdentifier *v10;
  WBSHistoryVisitIdentifier *visitIdentifier;
  void *v12;
  uint64_t v13;
  NSString *title;
  void *v15;
  void *v16;
  double v17;
  double v18;
  WBSHistoryVisitIdentifier *v19;
  WBSHistoryVisitIdentifier *redirectSourceVisitIdentifier;
  void *v21;
  void *v22;
  double v23;
  double v24;
  WBSHistoryVisitIdentifier *v25;
  WBSHistoryVisitIdentifier *redirectDestinationVisitIdentifier;
  WBSCloudHistoryVisit *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WBSCloudHistoryVisit;
  v5 = -[WBSCloudHistoryVisit init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v4, "safari_numberForKey:", CFSTR("VisitTime"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      v10 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:]([WBSHistoryVisitIdentifier alloc], "initWithURLString:visitTime:", v6, v9);
      visitIdentifier = v5->_visitIdentifier;
      v5->_visitIdentifier = v10;

      objc_msgSend(v4, "safari_stringForKey:", CFSTR("Title"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      title = v5->_title;
      v5->_title = (NSString *)v13;

      v5->_loadSuccessful = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("LoadSuccessful"));
      v5->_httpNonGet = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("HTTPNonGet"));
      objc_msgSend(v4, "safari_stringForKey:", CFSTR("RedirectSourceURL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v4, "safari_numberForKey:", CFSTR("RedirectSourceVisitTime"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        v19 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:]([WBSHistoryVisitIdentifier alloc], "initWithURLString:visitTime:", v15, v18);
        redirectSourceVisitIdentifier = v5->_redirectSourceVisitIdentifier;
        v5->_redirectSourceVisitIdentifier = v19;

      }
      objc_msgSend(v4, "safari_stringForKey:", CFSTR("RedirectDestinationURL"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v4, "safari_numberForKey:", CFSTR("RedirectDestinationVisitTime"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        v24 = v23;

        v25 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:]([WBSHistoryVisitIdentifier alloc], "initWithURLString:visitTime:", v21, v24);
        redirectDestinationVisitIdentifier = v5->_redirectDestinationVisitIdentifier;
        v5->_redirectDestinationVisitIdentifier = v25;

      }
      v27 = v5;

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (WBSCloudHistoryVisit)initWithHistoryVisit:(id)a3
{
  id v4;
  WBSCloudHistoryVisit *v5;
  void *v6;
  void *v7;
  WBSHistoryVisitIdentifier *v8;
  uint64_t v9;
  WBSHistoryVisitIdentifier *visitIdentifier;
  void *v11;
  uint64_t v12;
  NSString *title;
  void *v14;
  WBSHistoryVisitIdentifier *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  WBSHistoryVisitIdentifier *redirectSourceVisitIdentifier;
  void *v20;
  WBSHistoryVisitIdentifier *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  WBSHistoryVisitIdentifier *redirectDestinationVisitIdentifier;
  WBSCloudHistoryVisit *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)WBSCloudHistoryVisit;
  v5 = -[WBSCloudHistoryVisit init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [WBSHistoryVisitIdentifier alloc];
    objc_msgSend(v4, "visitTime");
    v9 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v8, "initWithURLString:visitTime:", v7);
    visitIdentifier = v5->_visitIdentifier;
    v5->_visitIdentifier = (WBSHistoryVisitIdentifier *)v9;

    objc_msgSend(v4, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v12;

    v5->_loadSuccessful = objc_msgSend(v4, "loadWasSuccessful");
    v5->_httpNonGet = objc_msgSend(v4, "wasHTTPNonGet");
    objc_msgSend(v4, "redirectSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = [WBSHistoryVisitIdentifier alloc];
      objc_msgSend(v14, "item");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "urlString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "visitTime");
      v18 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v15, "initWithURLString:visitTime:", v17);
      redirectSourceVisitIdentifier = v5->_redirectSourceVisitIdentifier;
      v5->_redirectSourceVisitIdentifier = (WBSHistoryVisitIdentifier *)v18;

    }
    objc_msgSend(v4, "redirectDestination");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = [WBSHistoryVisitIdentifier alloc];
      objc_msgSend(v20, "item");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "urlString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "visitTime");
      v24 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v21, "initWithURLString:visitTime:", v23);
      redirectDestinationVisitIdentifier = v5->_redirectDestinationVisitIdentifier;
      v5->_redirectDestinationVisitIdentifier = (WBSHistoryVisitIdentifier *)v24;

    }
    v26 = v5;

  }
  return v5;
}

- (WBSCloudHistoryVisit)initWithVisitIdentifier:(id)a3 title:(id)a4 loadSuccessful:(BOOL)a5 httpNonGet:(BOOL)a6 redirectSourceVisitIdentifier:(id)a7 redirectDestinationVisitIdentifier:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  WBSCloudHistoryVisit *v17;
  WBSCloudHistoryVisit *v18;
  WBSCloudHistoryVisit *v19;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  v23.receiver = self;
  v23.super_class = (Class)WBSCloudHistoryVisit;
  v17 = -[WBSCloudHistoryVisit init](&v23, sel_init);
  v18 = v17;
  v19 = 0;
  if (v13 && v17)
  {
    objc_storeStrong((id *)&v17->_visitIdentifier, a3);
    objc_storeStrong((id *)&v18->_title, a4);
    v18->_loadSuccessful = a5;
    v18->_httpNonGet = a6;
    objc_storeStrong((id *)&v18->_redirectSourceVisitIdentifier, a7);
    objc_storeStrong((id *)&v18->_redirectDestinationVisitIdentifier, a8);
    v19 = v18;
  }

  return v19;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *title;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[WBSHistoryVisitIdentifier urlString](self->_visitIdentifier, "urlString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSHistoryVisitIdentifier urlString](self->_visitIdentifier, "urlString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("URL"));

    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[WBSHistoryVisitIdentifier visitTime](self->_visitIdentifier, "visitTime");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("VisitTime"));

    title = self->_title;
    if (title)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", title, CFSTR("Title"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_loadSuccessful);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("LoadSuccessful"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_httpNonGet);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("HTTPNonGet"));

    -[WBSHistoryVisitIdentifier urlString](self->_redirectSourceVisitIdentifier, "urlString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("RedirectSourceURL"));
      v11 = (void *)MEMORY[0x1E0CB37E8];
      -[WBSHistoryVisitIdentifier visitTime](self->_redirectSourceVisitIdentifier, "visitTime");
      objc_msgSend(v11, "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("RedirectSourceVisitTime"));

    }
    -[WBSHistoryVisitIdentifier urlString](self->_redirectDestinationVisitIdentifier, "urlString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("RedirectDestinationURL"));
      v14 = (void *)MEMORY[0x1E0CB37E8];
      -[WBSHistoryVisitIdentifier visitTime](self->_redirectDestinationVisitIdentifier, "visitTime");
      objc_msgSend(v14, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("RedirectDestinationVisitTime"));

    }
  }
  return (NSDictionary *)v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *title;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryVisitIdentifier urlString](self->_visitIdentifier, "urlString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryVisitIdentifier visitTime](self->_visitIdentifier, "visitTime");
  v8 = v7;
  title = self->_title;
  -[WBSHistoryVisitIdentifier urlString](self->_redirectSourceVisitIdentifier, "urlString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryVisitIdentifier urlString](self->_redirectDestinationVisitIdentifier, "urlString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; urlString = \"%@\"; visitTime = %lf; title = \"%@\"; redirectSourceURLString = \"%@\"; _redirectDestinationURLString = \"%@\">"),
    v5,
    self,
    v6,
    v8,
    title,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCloudHistoryVisit)initWithCoder:(id)a3
{
  id v4;
  WBSCloudHistoryVisit *v5;
  uint64_t v6;
  WBSHistoryVisitIdentifier *visitIdentifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  WBSHistoryVisitIdentifier *redirectSourceVisitIdentifier;
  uint64_t v12;
  WBSHistoryVisitIdentifier *redirectDestinationVisitIdentifier;
  WBSCloudHistoryVisit *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSCloudHistoryVisit;
  v5 = -[WBSCloudHistoryVisit init](&v16, sel_init);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL")),
        v6 = objc_claimAutoreleasedReturnValue(),
        visitIdentifier = v5->_visitIdentifier,
        v5->_visitIdentifier = (WBSHistoryVisitIdentifier *)v6,
        visitIdentifier,
        v5->_visitIdentifier))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_loadSuccessful = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("LoadSuccessful"));
    v5->_httpNonGet = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HTTPNonGet"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RedirectSourceURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    redirectSourceVisitIdentifier = v5->_redirectSourceVisitIdentifier;
    v5->_redirectSourceVisitIdentifier = (WBSHistoryVisitIdentifier *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RedirectDestinationURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    redirectDestinationVisitIdentifier = v5->_redirectDestinationVisitIdentifier;
    v5->_redirectDestinationVisitIdentifier = (WBSHistoryVisitIdentifier *)v12;

    v14 = v5;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  WBSHistoryVisitIdentifier *visitIdentifier;
  id v5;

  visitIdentifier = self->_visitIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", visitIdentifier, CFSTR("URL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("Title"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_loadSuccessful, CFSTR("LoadSuccessful"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_httpNonGet, CFSTR("HTTPNonGet"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_redirectSourceVisitIdentifier, CFSTR("RedirectSourceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_redirectDestinationVisitIdentifier, CFSTR("RedirectDestinationURL"));

}

- (WBSHistoryVisitIdentifier)visitIdentifier
{
  return self->_visitIdentifier;
}

- (void)setVisitIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)loadWasSuccessful
{
  return self->_loadSuccessful;
}

- (void)setLoadSuccessful:(BOOL)a3
{
  self->_loadSuccessful = a3;
}

- (BOOL)wasHTTPNonGet
{
  return self->_httpNonGet;
}

- (void)setHttpNonGet:(BOOL)a3
{
  self->_httpNonGet = a3;
}

- (WBSHistoryVisitIdentifier)redirectSourceVisitIdentifier
{
  return self->_redirectSourceVisitIdentifier;
}

- (void)setRedirectSourceVisitIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (WBSCloudHistoryVisit)redirectSourceVisit
{
  return (WBSCloudHistoryVisit *)objc_loadWeakRetained((id *)&self->_redirectSourceVisit);
}

- (void)setRedirectSourceVisit:(id)a3
{
  objc_storeWeak((id *)&self->_redirectSourceVisit, a3);
}

- (WBSHistoryVisitIdentifier)redirectDestinationVisitIdentifier
{
  return self->_redirectDestinationVisitIdentifier;
}

- (void)setRedirectDestinationVisitIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (WBSCloudHistoryVisit)redirectDestinationVisit
{
  return (WBSCloudHistoryVisit *)objc_loadWeakRetained((id *)&self->_redirectDestinationVisit);
}

- (void)setRedirectDestinationVisit:(id)a3
{
  objc_storeWeak((id *)&self->_redirectDestinationVisit, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redirectDestinationVisit);
  objc_storeStrong((id *)&self->_redirectDestinationVisitIdentifier, 0);
  objc_destroyWeak((id *)&self->_redirectSourceVisit);
  objc_storeStrong((id *)&self->_redirectSourceVisitIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_visitIdentifier, 0);
}

@end
