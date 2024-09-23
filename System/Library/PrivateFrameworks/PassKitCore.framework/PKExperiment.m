@implementation PKExperiment

- (id)namespaceName
{
  return 0;
}

- (PKExperiment)init
{
  PKExperiment *v2;
  PKExperiment *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  uint64_t v7;
  TRIClient *trialClient;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  uint8_t v13[16];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKExperiment;
  v2 = -[PKExperiment init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isExposed = 0;
    PKLogFacilityTypeGetObject(0x22uLL);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, v3);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_18FC92000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "init:trial", ", v13, 2u);
      }
    }

    objc_msgSend(MEMORY[0x1E0DC09D0], "clientWithIdentifier:", 254);
    v7 = objc_claimAutoreleasedReturnValue();
    trialClient = v3->_trialClient;
    v3->_trialClient = (TRIClient *)v7;

    v9 = v4;
    v10 = os_signpost_id_make_with_pointer(v9, v3);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_18FC92000, v9, OS_SIGNPOST_INTERVAL_END, v11, "init:trial", ", v13, 2u);
      }
    }

  }
  return v3;
}

- (PKExperiment)initWithClient:(id)a3
{
  id v5;
  PKExperiment *v6;
  PKExperiment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKExperiment;
  v6 = -[PKExperiment init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_trialClient, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExperiment namespaceName](self, "namespaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("namespaceName: '%@'; "), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (id)experimentDetails
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PKExperiment namespaceName](self, "namespaceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TRIClient experimentIdentifiersWithNamespaceName:](self->_trialClient, "experimentIdentifiersWithNamespaceName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v4, "experimentId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safelySetObject:forKey:", v6, CFSTR("experimentIdentifier"));

      objc_msgSend(v4, "treatmentId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safelySetObject:forKey:", v7, CFSTR("treatmentIdentifier"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "deploymentId"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safelySetObject:forKey:", v8, CFSTR("deploymentIdentifier"));

      -[PKExperiment namespaceName](self, "namespaceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safelySetObject:forKey:", v9, CFSTR("namespaceName"));

      v10 = (void *)objc_msgSend(v5, "copy");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)trackExperimentExposure
{
  void *v3;
  void *v4;
  void *v5;

  -[PKExperiment experimentDetails](self, "experimentDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !self->_isExposed)
  {
    v5 = v3;
    AnalyticsSendEvent();
    v4 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v4, "setObject:forKey:", CFSTR("userViewedExperiment"), CFSTR("eventType"));
    +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("inApp"), v4);
    self->_isExposed = 1;

    v3 = v5;
  }

}

- (void)refresh
{
  self->_isExposed = 0;
  -[TRIClient refresh](self->_trialClient, "refresh");
}

- (id)levelForFactor:(id)a3
{
  NSObject *v5;
  id v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  TRIClient *trialClient;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint8_t v16[16];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject(0x22uLL);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = a3;
  v7 = os_signpost_id_make_with_pointer(v5, self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18FC92000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v8, "get:levelForFactor", ", buf, 2u);
    }
  }

  trialClient = self->_trialClient;
  -[PKExperiment namespaceName](self, "namespaceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient levelForFactor:withNamespaceName:](trialClient, "levelForFactor:withNamespaceName:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v5;
  v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v16 = 0;
      _os_signpost_emit_with_name_impl(&dword_18FC92000, v12, OS_SIGNPOST_INTERVAL_END, v14, "get:levelForFactor", ", v16, 2u);
    }
  }

  return v11;
}

- (id)filePathForFactor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PKExperiment levelForFactor:](self, "levelForFactor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasPath"))
  {
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)stringForFactor:(id)a3
{
  void *v3;
  void *v4;

  -[PKExperiment levelForFactor:](self, "levelForFactor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)BOOLeanForFactor:(id)a3
{
  void *v3;
  char v4;

  -[PKExperiment levelForFactor:](self, "levelForFactor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLeanValue");

  return v4;
}

- (id)metadataForFactor:(id)a3
{
  void *v3;
  void *v4;

  -[PKExperiment levelForFactor:](self, "levelForFactor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isTaggedForFactor:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PKExperiment metadataForFactor:](self, "metadataForFactor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (BOOL)isExposed
{
  return self->_isExposed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end
