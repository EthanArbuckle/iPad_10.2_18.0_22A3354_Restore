@implementation PGChildActivityMemoryTitleGenerator

- (PGChildActivityMemoryTitleGenerator)initWithMomentNodes:(id)a3 activityLabels:(id)a4 childName:(id)a5 titleGenerationContext:(id)a6 loggingConnection:(id)a7
{
  id v13;
  id v14;
  id v15;
  PGChildActivityMemoryTitleGenerator *v16;
  PGChildActivityMemoryTitleGenerator *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PGChildActivityMemoryTitleGenerator;
  v16 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v19, sel_initWithMomentNodes_type_titleGenerationContext_, a3, 0, a6);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_activityLabels, a4);
    objc_storeStrong((id *)&v17->_childName, a5);
    objc_storeStrong((id *)&v17->_loggingConnection, a7);
  }

  return v17;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void (**v4)(id, void *, void *);
  __CFString *v5;
  _BOOL4 v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PGTimeTitleOptions *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *loggingConnection;
  NSSet *activityLabels;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  if (-[NSSet containsObject:](self->_activityLabels, "containsObject:", CFSTR("PersonActionPlayingOnASwing"))
    && -[NSSet containsObject:](self->_activityLabels, "containsObject:", CFSTR("PersonActionPlayingOnASlide")))
  {
    v5 = CFSTR("PGChildActivityMemoryTitlePersonActionSwingsAndSlide");
    goto LABEL_7;
  }
  if (-[NSSet containsObject:](self->_activityLabels, "containsObject:", CFSTR("PersonActionHugging"))
    || -[NSSet containsObject:](self->_activityLabels, "containsObject:", CFSTR("PersonActionKissing")))
  {
    v5 = CFSTR("PGChildActivityMemoryTitlePersonActionSweetMoments");
    goto LABEL_7;
  }
  if (-[NSSet count](self->_activityLabels, "count") == 1)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    -[NSSet anyObject](self->_activityLabels, "anyObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("PGChildActivityMemoryTitle%@"), v19);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
LABEL_7:
      v6 = -[PGChildActivityMemoryTitleGenerator _shouldIncludeChildNameForActivityLabels:](self, "_shouldIncludeChildNameForActivityLabels:", self->_activityLabels);
      if (-[NSString length](self->_childName, "length"))
        v7 = !v6;
      else
        v7 = 1;
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", v5, v5, CFSTR("Localizable"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(" %@"));
        v8 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", v8, v8, CFSTR("Localizable"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PFStringWithValidatedFormat();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = (__CFString *)v8;
      }

      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc_init(PGTimeTitleOptions);
      -[PGTitleGenerator momentNodes](self, "momentNodes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTimeTitleOptions setMomentNodes:](v13, "setMomentNodes:", v14);

      -[PGTimeTitleOptions setAllowedFormats:](v13, "setAllowedFormats:", 20);
      -[PGTitleGenerator featuredYearNodes](self, "featuredYearNodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTimeTitleOptions setFeaturedYearNodes:](v13, "setFeaturedYearNodes:", v15);

      +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v16, 5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v12, v17);

      goto LABEL_14;
    }
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
  {
    activityLabels = self->_activityLabels;
    v22 = loggingConnection;
    -[NSSet allObjects](activityLabels, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v23;
    _os_log_error_impl(&dword_1CA237000, v22, OS_LOG_TYPE_ERROR, "[PGChildActivityMemoryTitleGenerator] Invalid Combination:%@", buf, 0xCu);

  }
  v4[2](v4, 0, 0);
LABEL_14:

}

- (BOOL)_shouldIncludeChildNameForActivityLabels:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (objc_class *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithObjects:", CFSTR("PersonActionJumpingOrLeaping"), CFSTR("PersonActionRunningOrJogging"), 0);
  v6 = objc_msgSend(v5, "intersectsSet:", v4);

  return v6 ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_childName, 0);
  objc_storeStrong((id *)&self->_activityLabels, 0);
}

@end
