@implementation PPNamedEntityWithRecord

- (PPNamedEntityWithRecord)initWithName:(id)a3 category:(unint64_t)a4 dynamicCategory:(id)a5 language:(id)a6 mostRelevantRecord:(id)a7
{
  id v13;
  PPNamedEntityWithRecord *v14;
  PPNamedEntityWithRecord *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)PPNamedEntityWithRecord;
  v14 = -[PPNamedEntity initWithName:category:dynamicCategory:language:mostRelevantRecord:](&v17, sel_initWithName_category_dynamicCategory_language_mostRelevantRecord_, a3, a4, a5, a6, 0);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_mostRelevantRecord, a7);

  return v15;
}

- (id)mostRelevantRecord
{
  return self->_mostRelevantRecord;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPNamedEntity name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPNamedEntity describeCategory:](PPNamedEntity, "describeCategory:", -[PPNamedEntity category](self, "category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPNamedEntity bestLanguage](self, "bestLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPNamedEntityWithRecord n:'%@' c:'%@' l:%@ r:%p>"), v4, v5, v6, self->_mostRelevantRecord);

  return v7;
}

- (double)sentimentScore
{
  PPNamedEntityRecord *mostRelevantRecord;
  double result;

  mostRelevantRecord = self->_mostRelevantRecord;
  if (!mostRelevantRecord)
    return 0.0;
  -[PPNamedEntityRecord sentimentScore](mostRelevantRecord, "sentimentScore");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRelevantRecord, 0);
}

@end
