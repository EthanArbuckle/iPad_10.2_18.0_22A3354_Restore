@implementation _SVXUserFeedbackSceneMutation

- (_SVXUserFeedbackSceneMutation)init
{
  return -[_SVXUserFeedbackSceneMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXUserFeedbackSceneMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXUserFeedbackSceneMutation *v6;
  _SVXUserFeedbackSceneMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXUserFeedbackSceneMutation;
  v6 = -[_SVXUserFeedbackSceneMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setNodes:(id)a3
{
  objc_storeStrong((id *)&self->_nodes, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)generate
{
  SVXUserFeedbackScene *baseModel;
  SVXUserFeedbackScene *v4;
  SVXUserFeedbackScene *v5;
  NSString *v6;
  NSString *v7;
  double v8;
  double duration;
  NSSet *v10;
  NSSet *v11;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXUserFeedbackScene initWithIdentifier:duration:nodes:]([SVXUserFeedbackScene alloc], "initWithIdentifier:duration:nodes:", self->_identifier, self->_nodes, self->_duration);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      v6 = self->_identifier;
    }
    else
    {
      -[SVXUserFeedbackScene identifier](baseModel, "identifier");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    {
      duration = self->_duration;
      if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
        goto LABEL_11;
    }
    else
    {
      -[SVXUserFeedbackScene duration](self->_baseModel, "duration");
      duration = v8;
      if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
      {
LABEL_11:
        v10 = self->_nodes;
LABEL_14:
        v11 = v10;
        v5 = -[SVXUserFeedbackScene initWithIdentifier:duration:nodes:]([SVXUserFeedbackScene alloc], "initWithIdentifier:duration:nodes:", v7, v10, duration);

        return v5;
      }
    }
    -[SVXUserFeedbackScene nodes](self->_baseModel, "nodes");
    v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v4 = (SVXUserFeedbackScene *)-[SVXUserFeedbackScene copy](baseModel, "copy");
LABEL_5:
  v5 = v4;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
