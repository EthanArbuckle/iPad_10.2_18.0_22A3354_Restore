@implementation _SVXUserFeedbackNodeMutation

- (_SVXUserFeedbackNodeMutation)init
{
  return -[_SVXUserFeedbackNodeMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXUserFeedbackNodeMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXUserFeedbackNodeMutation *v6;
  _SVXUserFeedbackNodeMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXUserFeedbackNodeMutation;
  v6 = -[_SVXUserFeedbackNodeMutation init](&v9, sel_init);
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

- (void)setFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_feedback, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setDependentNodes:(id)a3
{
  objc_storeStrong((id *)&self->_dependentNodes, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)generate
{
  SVXUserFeedbackNode *baseModel;
  SVXUserFeedbackNode *v4;
  SVXUserFeedbackNode *v5;
  NSString *v6;
  NSString *v7;
  double v8;
  double duration;
  SVXUserFeedback *v10;
  SVXUserFeedback *v11;
  NSSet *v12;
  NSSet *v13;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXUserFeedbackNode initWithIdentifier:duration:feedback:dependentNodes:]([SVXUserFeedbackNode alloc], "initWithIdentifier:duration:feedback:dependentNodes:", self->_identifier, self->_feedback, self->_dependentNodes, self->_duration);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXUserFeedbackNode *)-[SVXUserFeedbackNode copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_identifier;
  }
  else
  {
    -[SVXUserFeedbackNode identifier](baseModel, "identifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    duration = self->_duration;
    if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
      goto LABEL_11;
LABEL_13:
    -[SVXUserFeedbackNode feedback](self->_baseModel, "feedback");
    v10 = (SVXUserFeedback *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  -[SVXUserFeedbackNode duration](self->_baseModel, "duration");
  duration = v8;
  if ((*(_BYTE *)&self->_mutationFlags & 8) == 0)
    goto LABEL_13;
LABEL_11:
  v10 = self->_feedback;
LABEL_14:
  v11 = v10;
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v12 = self->_dependentNodes;
  }
  else
  {
    -[SVXUserFeedbackNode dependentNodes](self->_baseModel, "dependentNodes");
    v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  v5 = -[SVXUserFeedbackNode initWithIdentifier:duration:feedback:dependentNodes:]([SVXUserFeedbackNode alloc], "initWithIdentifier:duration:feedback:dependentNodes:", v7, v11, v12, duration);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentNodes, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
