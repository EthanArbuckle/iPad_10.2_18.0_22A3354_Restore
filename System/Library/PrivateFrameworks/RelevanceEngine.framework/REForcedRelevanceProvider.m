@implementation REForcedRelevanceProvider

- (REForcedRelevanceProvider)initWithForcedRelevance:(float)a3
{
  return -[REForcedRelevanceProvider initWithForcedRelevance:isHistoric:](self, "initWithForcedRelevance:isHistoric:", 0);
}

- (REForcedRelevanceProvider)initWithForcedRelevance:(float)a3 isHistoric:(BOOL)a4
{
  REForcedRelevanceProvider *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REForcedRelevanceProvider;
  result = -[RERelevanceProvider init](&v7, sel_init);
  if (result)
  {
    result->_relevance = a3;
    result->_isHistoric = a4;
  }
  return result;
}

+ (id)relevanceSimulatorID
{
  return CFSTR("force");
}

- (REForcedRelevanceProvider)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  double v10;
  REForcedRelevanceProvider *v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relevance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("historic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "floatValue");
  v8 = v7;
  v9 = objc_msgSend(v6, "BOOLValue");
  LODWORD(v10) = v8;
  v11 = -[REForcedRelevanceProvider initWithForcedRelevance:isHistoric:](self, "initWithForcedRelevance:isHistoric:", v9, v10);

  return v11;
}

- (id)dictionaryEncoding
{
  double v2;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("relevance");
  *(float *)&v2 = self->_relevance;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("historic");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isHistoric);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REForcedRelevanceProvider;
  result = -[RERelevanceProvider copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_DWORD *)result + 9) = LODWORD(self->_relevance);
  *((_BYTE *)result + 32) = self->_isHistoric;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  REForcedRelevanceProvider *v4;
  BOOL v5;
  objc_super v7;

  v4 = (REForcedRelevanceProvider *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REForcedRelevanceProvider;
    v5 = -[RERelevanceProvider isEqual:](&v7, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_relevance == v4->_relevance
      && self->_isHistoric == v4->_isHistoric;
  }

  return v5;
}

- (unint64_t)_hash
{
  double v2;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  *(float *)&v2 = self->_relevance;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isHistoric);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REForcedRelevanceProvider;
  -[REForcedRelevanceProvider description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_isHistoric)
    v5 = CFSTR(" historic");
  else
    v5 = &stru_24CF92178;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" relevance=%f%@"), self->_relevance, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (float)relevance
{
  return self->_relevance;
}

- (BOOL)isHistoric
{
  return self->_isHistoric;
}

@end
