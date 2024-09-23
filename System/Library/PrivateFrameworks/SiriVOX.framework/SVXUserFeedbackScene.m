@implementation SVXUserFeedbackScene

- (SVXUserFeedbackScene)initWithIdentifier:(id)a3 duration:(double)a4 nodes:(id)a5
{
  id v8;
  id v9;
  SVXUserFeedbackScene *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSSet *nodes;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SVXUserFeedbackScene;
  v10 = -[SVXUserFeedbackScene init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_duration = a4;
    v13 = objc_msgSend(v9, "copy");
    nodes = v10->_nodes;
    v10->_nodes = (NSSet *)v13;

  }
  return v10;
}

- (id)description
{
  return -[SVXUserFeedbackScene _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SVXUserFeedbackScene;
  -[SVXUserFeedbackScene description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {identifier = %@, duration = %f, nodes = %@}"), v5, self->_identifier, *(_QWORD *)&self->_duration, self->_nodes);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_identifier, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[NSSet hash](self->_nodes, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SVXUserFeedbackScene *v4;
  SVXUserFeedbackScene *v5;
  double duration;
  double v7;
  BOOL v8;
  NSString *v9;
  NSString *identifier;
  NSSet *v11;
  NSSet *nodes;

  v4 = (SVXUserFeedbackScene *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      duration = self->_duration;
      -[SVXUserFeedbackScene duration](v5, "duration");
      if (duration == v7)
      {
        -[SVXUserFeedbackScene identifier](v5, "identifier");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        identifier = self->_identifier;
        if (identifier == v9 || -[NSString isEqual:](identifier, "isEqual:", v9))
        {
          -[SVXUserFeedbackScene nodes](v5, "nodes");
          v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
          nodes = self->_nodes;
          v8 = nodes == v11 || -[NSSet isEqual:](nodes, "isEqual:", v11);

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (SVXUserFeedbackScene)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SVXUserFeedbackScene *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedbackScene::identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedbackScene::duration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("SVXUserFeedbackScene::nodes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SVXUserFeedbackScene initWithIdentifier:duration:nodes:](self, "initWithIdentifier:duration:nodes:", v5, v12, v8);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("SVXUserFeedbackScene::identifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("SVXUserFeedbackScene::duration"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_nodes, CFSTR("SVXUserFeedbackScene::nodes"));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)duration
{
  return self->_duration;
}

- (NSSet)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXUserFeedbackSceneMutation *);
  _SVXUserFeedbackSceneMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXUserFeedbackSceneMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXUserFeedbackSceneMutation initWithBaseModel:]([_SVXUserFeedbackSceneMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXUserFeedbackSceneMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXUserFeedbackScene copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXUserFeedbackSceneMutation *);
  _SVXUserFeedbackSceneMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXUserFeedbackSceneMutation *))a3;
  v4 = objc_alloc_init(_SVXUserFeedbackSceneMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXUserFeedbackSceneMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
