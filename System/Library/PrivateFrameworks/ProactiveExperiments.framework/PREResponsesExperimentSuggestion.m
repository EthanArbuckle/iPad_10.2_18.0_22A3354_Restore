@implementation PREResponsesExperimentSuggestion

- (PREResponsesExperimentSuggestion)initWithCoder:(id)a3
{
  id v4;
  PREResponsesExperimentSuggestion *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  PREResponsesExperimentSuggestion *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PREResponsesExperimentSuggestion;
  v5 = -[PREResponsesExperimentSuggestion init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = (void *)v7;
    if (v7)
      v9 = (__CFString *)v7;
    else
      v9 = &stru_1E7D9F210;
    objc_storeStrong((id *)&v5->_title, v9);

    v5->_dynamicReply = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dynamicReply"));
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_dynamicReply, CFSTR("dynamicReply"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  v5 = (void *)-[NSString copy](self->_title, "copy");
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v4, "setDynamicReply:", self->_dynamicReply);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PREResponsesExperimentSuggestion *v4;
  uint64_t v5;
  BOOL v6;
  PREResponsesExperimentSuggestion *v7;
  unint64_t v8;
  NSString *title;
  void *v10;
  _BOOL4 dynamicReply;

  v4 = (PREResponsesExperimentSuggestion *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = -[PREResponsesExperimentSuggestion hash](self, "hash");
      if (v8 == -[PREResponsesExperimentSuggestion hash](v7, "hash"))
      {
        title = self->_title;
        -[PREResponsesExperimentSuggestion title](v7, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](title, "isEqualToString:", v10))
        {
          dynamicReply = self->_dynamicReply;
          v6 = dynamicReply == -[PREResponsesExperimentSuggestion isDynamicReply](v7, "isDynamicReply");
        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PREResponsesExperimentSuggestion title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") + 31;

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isDynamicReply
{
  return self->_dynamicReply;
}

- (void)setDynamicReply:(BOOL)a3
{
  self->_dynamicReply = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
