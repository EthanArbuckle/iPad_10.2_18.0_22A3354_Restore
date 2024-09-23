@implementation PPExtractionSet

- (PPExtractionSet)initWithNamedEntityRecords:(id)a3 topicRecords:(id)a4
{
  id v7;
  id v8;
  PPExtractionSet *v9;
  PPExtractionSet *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPExtractionSet;
  v9 = -[PPExtractionSet init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_namedEntityRecords, a3);
    objc_storeStrong((id *)&v10->_topicRecords, a4);
  }

  return v10;
}

- (PPExtractionSet)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PPExtractionSet *v12;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = (void *)MEMORY[0x18D7805AC]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v5, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("nam"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x18D7805AC]();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v5, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("top"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PPExtractionSet initWithNamedEntityRecords:topicRecords:](self, "initWithNamedEntityRecords:topicRecords:", v8, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *namedEntityRecords;
  id v5;

  namedEntityRecords = self->_namedEntityRecords;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", namedEntityRecords, CFSTR("nam"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topicRecords, CFSTR("top"));

}

- (id)merge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *namedEntityRecords;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray *topicRecords;
  NSArray *v15;
  NSArray *v16;
  PPExtractionSet *v17;
  void *v18;
  void *v19;
  PPExtractionSet *v20;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = v5;
  v7 = (NSArray *)MEMORY[0x1E0C9AA60];
  if (self->_namedEntityRecords)
    namedEntityRecords = self->_namedEntityRecords;
  else
    namedEntityRecords = (NSArray *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v5, "addObjectsFromArray:", namedEntityRecords);
  objc_msgSend(v4, "namedEntityRecords");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = (uint64_t)v7;
  objc_msgSend(v6, "addObjectsFromArray:", v11);

  v12 = (void *)objc_opt_new();
  v13 = v12;
  if (self->_topicRecords)
    topicRecords = self->_topicRecords;
  else
    topicRecords = v7;
  objc_msgSend(v12, "addObjectsFromArray:", topicRecords);
  objc_msgSend(v4, "topicRecords");
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = v15;
  else
    v16 = v7;
  objc_msgSend(v13, "addObjectsFromArray:", v16);

  v17 = [PPExtractionSet alloc];
  if (objc_msgSend(v6, "count"))
    v18 = v6;
  else
    v18 = 0;
  if (objc_msgSend(v13, "count"))
    v19 = v13;
  else
    v19 = 0;
  v20 = -[PPExtractionSet initWithNamedEntityRecords:topicRecords:](v17, "initWithNamedEntityRecords:topicRecords:", v18, v19);

  return v20;
}

- (BOOL)isEmpty
{
  return !-[NSArray count](self->_namedEntityRecords, "count") && -[NSArray count](self->_topicRecords, "count") == 0;
}

- (NSArray)namedEntityRecords
{
  return self->_namedEntityRecords;
}

- (NSArray)topicRecords
{
  return self->_topicRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicRecords, 0);
  objc_storeStrong((id *)&self->_namedEntityRecords, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
