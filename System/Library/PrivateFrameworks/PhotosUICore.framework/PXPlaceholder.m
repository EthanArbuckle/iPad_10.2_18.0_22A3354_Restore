@implementation PXPlaceholder

- (PXPlaceholder)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlaceholder.m"), 41, CFSTR("%s is not available as initializer"), "-[PXPlaceholder init]");

  abort();
}

- (PXPlaceholder)initWithTitle:(id)a3 trackingRadar:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PXPlaceholder *v12;
  void *v14;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tracked with rdar://%ti"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rdar://%ti"), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlaceholder.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

  }
  v12 = -[PXPlaceholder initWithTitle:subtitle:fallbackActionTitle:url:](self, "initWithTitle:subtitle:fallbackActionTitle:url:", v7, v8, CFSTR("Show Radar"), v11);

  return v12;
}

- (PXPlaceholder)initWithTitle:(id)a3 subtitle:(id)a4 fallbackActionTitle:(id)a5 url:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PXPlaceholder *v14;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  NSString *subtitle;
  uint64_t v19;
  NSString *fallbackActionTitle;
  uint64_t v21;
  NSURL *url;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXPlaceholder;
  v14 = -[PXPlaceholder init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    subtitle = v14->_subtitle;
    v14->_subtitle = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    fallbackActionTitle = v14->_fallbackActionTitle;
    v14->_fallbackActionTitle = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    url = v14->_url;
    v14->_url = (NSURL *)v21;

  }
  return v14;
}

- (void)performFallbackAction
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[PXPlaceholder url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__PXPlaceholder_performFallbackAction__block_invoke;
  v5[3] = &unk_1E5147360;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "openURL:options:completionHandler:", v4, MEMORY[0x1E0C9AA70], v5);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)fallbackActionTitle
{
  return self->_fallbackActionTitle;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_fallbackActionTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __38__PXPlaceholder_performFallbackAction__block_invoke(uint64_t a1, char a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v3 = objc_alloc(MEMORY[0x1E0D96D28]);
    v9[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithActivityItems:applicationActivities:", v4, 0);

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_firstKeyWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_presentOverTopmostPresentedViewController:animated:completion:", v5, 1, 0);

  }
}

+ (id)featureNotImplementedWithTrackingRadar:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:trackingRadar:", CFSTR("Not Implemented Yet"), a3);
}

+ (id)featureNotEnabledWithDocumentationURLString:(id)a3
{
  void *v5;
  void *v6;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPlaceholder.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

  }
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:subtitle:fallbackActionTitle:url:", CFSTR("Feature Not Enabled"), 0, CFSTR("How To Enable"), v5);

  return v6;
}

@end
