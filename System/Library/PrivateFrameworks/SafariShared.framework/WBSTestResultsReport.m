@implementation WBSTestResultsReport

- (WBSTestResultsReport)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  WBSTestResultsReport *v5;
  uint64_t v6;
  NSDictionary *dictionaryRepresentation;
  WBSTestResultsReport *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSTestResultsReport;
  v5 = -[WBSTestResultsReport init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)reportType
{
  void *v2;
  unint64_t v3;

  -[NSDictionary safari_stringForKey:](self->_dictionaryRepresentation, "safari_stringForKey:", CFSTR("type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("results")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("performance")) & 1) != 0)
  {
    v3 = 2;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("error")))
  {
    v3 = 3;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[NSDictionary safari_stringForKey:](self->_dictionaryRepresentation, "safari_stringForKey:", CFSTR("testBundle"));
}

- (NSString)testIdentifier
{
  return (NSString *)-[NSDictionary safari_stringForKey:](self->_dictionaryRepresentation, "safari_stringForKey:", CFSTR("testIdentifier"));
}

- (NSString)testStage
{
  return (NSString *)-[NSDictionary safari_stringForKey:](self->_dictionaryRepresentation, "safari_stringForKey:", CFSTR("stage"));
}

- (NSNumber)errorCode
{
  return (NSNumber *)-[NSDictionary safari_numberForKey:](self->_dictionaryRepresentation, "safari_numberForKey:", CFSTR("code"));
}

- (NSString)errorDomain
{
  return (NSString *)-[NSDictionary safari_stringForKey:](self->_dictionaryRepresentation, "safari_stringForKey:", CFSTR("domain"));
}

- (NSString)errorMessage
{
  return (NSString *)-[NSDictionary safari_stringForKey:](self->_dictionaryRepresentation, "safari_stringForKey:", CFSTR("message"));
}

- (NSDictionary)performanceValues
{
  return (NSDictionary *)-[NSDictionary safari_dictionaryForKey:](self->_dictionaryRepresentation, "safari_dictionaryForKey:", CFSTR("values"));
}

- (NSData)resultsActual
{
  return (NSData *)-[NSDictionary safari_dataForKey:](self->_dictionaryRepresentation, "safari_dataForKey:", CFSTR("actualResults"));
}

- (NSData)resultsExpected
{
  return (NSData *)-[NSDictionary safari_dataForKey:](self->_dictionaryRepresentation, "safari_dataForKey:", CFSTR("expectedResults"));
}

- (NSString)resultsExpectedName
{
  return (NSString *)-[NSDictionary safari_stringForKey:](self->_dictionaryRepresentation, "safari_stringForKey:", CFSTR("expectedResultsName"));
}

- (NSString)resultsUniformTypeIdentifier
{
  return (NSString *)-[NSDictionary safari_stringForKey:](self->_dictionaryRepresentation, "safari_stringForKey:", CFSTR("uti"));
}

+ (id)reportForActualResults:(id)a3 expectedResults:(id)a4 expectedResultsName:(id)a5 uniformTypeIdentifier:(id)a6 forStage:(id)a7 forTest:(id)a8 inBundle:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("results"), CFSTR("type"));
  if (v21)
  {
    objc_msgSend(v21, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("testBundle"));

  }
  if (v20)
  {
    objc_msgSend(v20, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("testIdentifier"));

  }
  if (v19)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, CFSTR("stage"));
  if (v15)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, CFSTR("actualResults"));
  if (v16)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("expectedResults"));
  if (v17)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, CFSTR("expectedResultsName"));
  if (v18)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, CFSTR("uti"));
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionaryRepresentation:", v22);

  return v25;
}

+ (id)reportForPerformance:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("performance"), CFSTR("type"));
  if (v13)
  {
    objc_msgSend(v13, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("testBundle"));

  }
  if (v12)
  {
    objc_msgSend(v12, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("testIdentifier"));

  }
  if (v11)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("stage"));
  if (v10)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("values"));
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionaryRepresentation:", v14);

  return v17;
}

+ (id)reportForError:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (objc_class *)MEMORY[0x1E0C99E08];
  v14 = a3;
  v15 = objc_alloc_init(v13);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("error"), CFSTR("type"));
  if (v12)
  {
    objc_msgSend(v12, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("testBundle"));

  }
  if (v11)
  {
    objc_msgSend(v11, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("testIdentifier"));

  }
  if (v10)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("stage"));
  objc_msgSend(v14, "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("domain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "code"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("code"));

  objc_msgSend(v14, "localizedDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("message"));
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionaryRepresentation:", v15);

  return v21;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end
