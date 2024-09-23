@implementation SUCoreErrorLayerGroup

- (NSString)domain
{
  return self->_domain;
}

- (id)initForLayer:(int64_t)a3 withDomain:(id)a4
{
  id v7;
  SUCoreErrorLayerGroup *v8;
  SUCoreErrorLayerGroup *v9;
  NSString *keyMatchTrue;
  NSDictionary *keyMatchTrueMap;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUCoreErrorLayerGroup;
  v8 = -[SUCoreErrorLayerGroup init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_errorLayer = a3;
    objc_storeStrong((id *)&v8->_domain, a4);
    v9->_minCode = -1;
    v9->_maxCode = -1;
    keyMatchTrue = v9->_keyMatchTrue;
    v9->_indications = 0;
    v9->_keyMatchTrue = 0;

    keyMatchTrueMap = v9->_keyMatchTrueMap;
    v9->_keyMatchTrueMap = 0;

  }
  return v9;
}

- (id)initForLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6
{
  id v11;
  SUCoreErrorLayerGroup *v12;
  SUCoreErrorLayerGroup *v13;
  NSString *keyMatchTrue;
  NSDictionary *keyMatchTrueMap;
  objc_super v17;

  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SUCoreErrorLayerGroup;
  v12 = -[SUCoreErrorLayerGroup init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_errorLayer = a3;
    objc_storeStrong((id *)&v12->_domain, a4);
    v13->_minCode = a5;
    v13->_maxCode = a6;
    keyMatchTrue = v13->_keyMatchTrue;
    v13->_indications = 0;
    v13->_keyMatchTrue = 0;

    keyMatchTrueMap = v13->_keyMatchTrueMap;
    v13->_keyMatchTrueMap = 0;

  }
  return v13;
}

- (id)initForLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9
{
  id v15;
  id v16;
  id v17;
  SUCoreErrorLayerGroup *v18;
  SUCoreErrorLayerGroup *v19;
  objc_super v22;

  v15 = a4;
  v16 = a8;
  v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)SUCoreErrorLayerGroup;
  v18 = -[SUCoreErrorLayerGroup init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_errorLayer = a3;
    objc_storeStrong((id *)&v18->_domain, a4);
    v19->_minCode = a5;
    v19->_maxCode = a6;
    v19->_indications = a7;
    objc_storeStrong((id *)&v19->_keyMatchTrue, a8);
    objc_storeStrong((id *)&v19->_keyMatchTrueMap, a9);
  }

  return v19;
}

- (id)summary
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  const __CFString *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[SUCoreErrorInformation nameForSUCoreLayer:](SUCoreErrorInformation, "nameForSUCoreLayer:", -[SUCoreErrorLayerGroup errorLayer](self, "errorLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreErrorLayerGroup domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUCoreErrorLayerGroup minCode](self, "minCode");
  v7 = -[SUCoreErrorLayerGroup maxCode](self, "maxCode");
  v8 = -[SUCoreErrorLayerGroup indications](self, "indications");
  v9 = CFSTR("DEFINED");
  if (!v8)
    v9 = CFSTR("NONE");
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("SUCoreErrorLayerGroup(layer=%@,domain=%@,minCode=%d,maxCode=%d,indications=%@)"), v4, v5, v6, v7, v9);

  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[SUCoreErrorInformation nameForSUCoreLayer:](SUCoreErrorInformation, "nameForSUCoreLayer:", -[SUCoreErrorLayerGroup errorLayer](self, "errorLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreErrorLayerGroup domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUCoreErrorLayerGroup minCode](self, "minCode");
  v7 = -[SUCoreErrorLayerGroup maxCode](self, "maxCode");
  v8 = -[SUCoreErrorLayerGroup indications](self, "indications");
  -[SUCoreErrorLayerGroup keyMatchTrue](self, "keyMatchTrue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SUCoreErrorLayerGroup keyMatchTrue](self, "keyMatchTrue");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("NONE");
  }
  -[SUCoreErrorLayerGroup keyMatchTrueMap](self, "keyMatchTrueMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("DEFINED");
  if (!v11)
    v12 = CFSTR("NONE");
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("\n[>>>\n              layer: %@\n             domain: %@\n            minCode: %d\n            maxCode: %d\n        indications: 0x%08llX\n       keyMatchTrue: %@\n    keyMatchTrueMap: %@\n<<<]"), v4, v5, v6, v7, v8, v10, v12);

  if (v9)
  return v13;
}

- (int64_t)errorLayer
{
  return self->_errorLayer;
}

- (int64_t)minCode
{
  return self->_minCode;
}

- (int64_t)maxCode
{
  return self->_maxCode;
}

- (int64_t)indications
{
  return self->_indications;
}

- (void)setIndications:(int64_t)a3
{
  self->_indications = a3;
}

- (NSString)keyMatchTrue
{
  return self->_keyMatchTrue;
}

- (void)setKeyMatchTrue:(id)a3
{
  objc_storeStrong((id *)&self->_keyMatchTrue, a3);
}

- (NSDictionary)keyMatchTrueMap
{
  return self->_keyMatchTrueMap;
}

- (void)setKeyMatchTrueMap:(id)a3
{
  objc_storeStrong((id *)&self->_keyMatchTrueMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyMatchTrueMap, 0);
  objc_storeStrong((id *)&self->_keyMatchTrue, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
