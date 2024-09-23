@implementation SVXUserFeedbackNode

- (SVXUserFeedbackNode)initWithIdentifier:(id)a3 duration:(double)a4 feedback:(id)a5 dependentNodes:(id)a6
{
  id v10;
  id v11;
  id v12;
  SVXUserFeedbackNode *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  SVXUserFeedback *feedback;
  uint64_t v18;
  NSSet *dependentNodes;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SVXUserFeedbackNode;
  v13 = -[SVXUserFeedbackNode init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v13->_duration = a4;
    v16 = objc_msgSend(v11, "copy");
    feedback = v13->_feedback;
    v13->_feedback = (SVXUserFeedback *)v16;

    v18 = objc_msgSend(v12, "copy");
    dependentNodes = v13->_dependentNodes;
    v13->_dependentNodes = (NSSet *)v18;

  }
  return v13;
}

- (id)description
{
  return -[SVXUserFeedbackNode _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SVXUserFeedbackNode;
  -[SVXUserFeedbackNode description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {identifier = %@, duration = %f, feedback = %@, dependentNodes = %@}"), v5, self->_identifier, *(_QWORD *)&self->_duration, self->_feedback, self->_dependentNodes);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_identifier, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[SVXUserFeedback hash](self->_feedback, "hash");
  v7 = v5 ^ v6 ^ -[NSSet hash](self->_dependentNodes, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SVXUserFeedbackNode *v4;
  SVXUserFeedbackNode *v5;
  double duration;
  double v7;
  BOOL v8;
  NSString *v9;
  NSString *identifier;
  SVXUserFeedback *v11;
  SVXUserFeedback *feedback;
  NSSet *v13;
  NSSet *dependentNodes;

  v4 = (SVXUserFeedbackNode *)a3;
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
      -[SVXUserFeedbackNode duration](v5, "duration");
      if (duration == v7)
      {
        -[SVXUserFeedbackNode identifier](v5, "identifier");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        identifier = self->_identifier;
        if (identifier == v9 || -[NSString isEqual:](identifier, "isEqual:", v9))
        {
          -[SVXUserFeedbackNode feedback](v5, "feedback");
          v11 = (SVXUserFeedback *)objc_claimAutoreleasedReturnValue();
          feedback = self->_feedback;
          if (feedback == v11 || -[SVXUserFeedback isEqual:](feedback, "isEqual:", v11))
          {
            -[SVXUserFeedbackNode dependentNodes](v5, "dependentNodes");
            v13 = (NSSet *)objc_claimAutoreleasedReturnValue();
            dependentNodes = self->_dependentNodes;
            v8 = dependentNodes == v13 || -[NSSet isEqual:](dependentNodes, "isEqual:", v13);

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
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (SVXUserFeedbackNode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  SVXUserFeedbackNode *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedbackNode::identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedbackNode::duration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXUserFeedbackNode::feedback"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("SVXUserFeedbackNode::dependentNodes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SVXUserFeedbackNode initWithIdentifier:duration:feedback:dependentNodes:](self, "initWithIdentifier:duration:feedback:dependentNodes:", v5, v9, v13, v8);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("SVXUserFeedbackNode::identifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("SVXUserFeedbackNode::duration"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_feedback, CFSTR("SVXUserFeedbackNode::feedback"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_dependentNodes, CFSTR("SVXUserFeedbackNode::dependentNodes"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)duration
{
  return self->_duration;
}

- (SVXUserFeedback)feedback
{
  return self->_feedback;
}

- (NSSet)dependentNodes
{
  return self->_dependentNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentNodes, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXUserFeedbackNodeMutation *);
  _SVXUserFeedbackNodeMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXUserFeedbackNodeMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXUserFeedbackNodeMutation initWithBaseModel:]([_SVXUserFeedbackNodeMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXUserFeedbackNodeMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXUserFeedbackNode copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXUserFeedbackNodeMutation *);
  _SVXUserFeedbackNodeMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXUserFeedbackNodeMutation *))a3;
  v4 = objc_alloc_init(_SVXUserFeedbackNodeMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXUserFeedbackNodeMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
