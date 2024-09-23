@implementation PPTopic

- (PPTopic)initWithTopicIdentifier:(id)a3 mostRelevantRecord:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PPTopicWithRecord *v11;
  void *v12;
  PPTopic *v13;
  PPTopic *v14;
  uint64_t v15;
  NSString *clusterIdentifier;
  PPTopic *p_super;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      v11 = -[PPTopicWithRecord initWithTopicIdentifier:mostRelevantRecord:]([PPTopicWithRecord alloc], "initWithTopicIdentifier:mostRelevantRecord:", v8, v10);
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPTopic.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("topicIdentifier"));

    if (v10)
      goto LABEL_3;
  }
  v19.receiver = self;
  v19.super_class = (Class)PPTopic;
  v13 = -[PPTopic init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_topicIdentifier, a3);
    +[PPTopic clusterIdentifierFromTopicId:](PPTopic, "clusterIdentifierFromTopicId:", v8);
    v15 = objc_claimAutoreleasedReturnValue();
    clusterIdentifier = v14->_clusterIdentifier;
    v14->_clusterIdentifier = (NSString *)v15;

  }
  v11 = v14;
  self = &v11->super;
LABEL_8:
  p_super = &v11->super;

  return p_super;
}

- (PPTopic)initWithTopicIdentifier:(id)a3
{
  return -[PPTopic initWithTopicIdentifier:mostRelevantRecord:](self, "initWithTopicIdentifier:mostRelevantRecord:", a3, 0);
}

- (PPTopicRecord)mostRelevantRecord
{
  return 0;
}

- (PPTopic)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PPTopic *v7;
  PPTopic *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rec"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[PPTopic initWithTopicIdentifier:mostRelevantRecord:](self, "initWithTopicIdentifier:mostRelevantRecord:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *topicIdentifier;
  id v5;
  id v6;

  topicIdentifier = self->_topicIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", topicIdentifier, CFSTR("id"));
  -[PPTopic mostRelevantRecord](self, "mostRelevantRecord");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("rec"));

}

- (unint64_t)hash
{
  return -[NSString hash](self->_topicIdentifier, "hash");
}

- (BOOL)isEqualToTopic:(id)a3
{
  PPTopic *v4;
  PPTopic *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = (PPTopic *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4)
  {
    v6 = self->_topicIdentifier;
    -[PPTopic topicIdentifier](v5, "topicIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 | v7)
    {
      v9 = 0;
      if (v6 && v7)
        v9 = objc_msgSend((id)v6, "isEqualToString:", v7);
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PPTopic *v4;
  BOOL v5;

  v4 = (PPTopic *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PPTopic isEqualToTopic:](self, "isEqualToTopic:", v4);
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPTopic i:'%@'>"), self->_topicIdentifier);
}

- (double)sentimentScore
{
  return 0.0;
}

- (NSSet)featureNames
{
  if (featureNames__pasOnceToken6_7544 != -1)
    dispatch_once(&featureNames__pasOnceToken6_7544, &__block_literal_global_7545);
  return (NSSet *)(id)featureNames__pasExprOnceResult_7546;
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("topicId")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithString:", self->_topicIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)id
{
  return self->_topicIdentifier;
}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (NSString)clusterIdentifier
{
  return self->_clusterIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterIdentifier, 0);
  objc_storeStrong((id *)&self->_topicIdentifier, 0);
}

void __23__PPTopic_featureNames__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = (void *)MEMORY[0x18D7805AC]();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("topicId"), 0);
  objc_autoreleasePoolPop(v1);
  v3 = (void *)featureNames__pasExprOnceResult_7546;
  featureNames__pasExprOnceResult_7546 = v2;

  objc_autoreleasePoolPop(v0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)clusterIdentifierFromTopicId:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x18D7805AC]();
  v5 = v3;
  objc_autoreleasePoolPop(v4);

  return v5;
}

@end
