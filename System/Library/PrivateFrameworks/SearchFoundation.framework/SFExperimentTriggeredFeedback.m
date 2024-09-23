@implementation SFExperimentTriggeredFeedback

- (SFExperimentTriggeredFeedback)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFExperimentTriggeredFeedback;
  return -[SFFeedback init](&v3, sel_init);
}

- (SFExperimentTriggeredFeedback)initWithCodepathId:(id)a3
{
  id v4;
  SFExperimentTriggeredFeedback *v5;
  SFExperimentTriggeredFeedback *v6;
  SFExperimentTriggeredFeedback *v7;

  v4 = a3;
  v5 = -[SFExperimentTriggeredFeedback init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[SFExperimentTriggeredFeedback setCodepathId:](v5, "setCodepathId:", v4);
    v7 = v6;
  }

  return v6;
}

- (SFExperimentTriggeredFeedback)initWithCfDiffered:(BOOL)a3 cfUsed:(BOOL)a4 cfError:(unint64_t)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  SFExperimentTriggeredFeedback *v8;
  SFCounterfactualInfo *v9;
  SFExperimentTriggeredFeedback *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[SFExperimentTriggeredFeedback init](self, "init");
  if (v8)
  {
    v9 = objc_alloc_init(SFCounterfactualInfo);
    -[SFCounterfactualInfo setCfDiffered:](v9, "setCfDiffered:", v7);
    -[SFCounterfactualInfo setCfUsed:](v9, "setCfUsed:", v6);
    -[SFCounterfactualInfo setCfError:](v9, "setCfError:", a5);
    -[SFExperimentTriggeredFeedback setCounterfactual:](v8, "setCounterfactual:", v9);
    v10 = v8;

  }
  return v8;
}

- (SFExperimentTriggeredFeedback)initWithCoder:(id)a3
{
  id v4;
  SFExperimentTriggeredFeedback *v5;
  SFCounterfactualInfo *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFExperimentTriggeredFeedback;
  v5 = -[SFFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasCF")))
    {
      v6 = objc_alloc_init(SFCounterfactualInfo);
      -[SFCounterfactualInfo setCfDiffered:](v6, "setCfDiffered:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_cfDiffered")));
      -[SFCounterfactualInfo setCfUsed:](v6, "setCfUsed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_cfUsed")));
      -[SFCounterfactualInfo setCfError:](v6, "setCfError:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_cfError")));
      -[SFExperimentTriggeredFeedback setCounterfactual:](v5, "setCounterfactual:", v6);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_codepathId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFExperimentTriggeredFeedback setCodepathId:](v5, "setCodepathId:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFExperimentTriggeredFeedback;
  -[SFFeedback encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[SFExperimentTriggeredFeedback counterfactual](self, "counterfactual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("_hasCF"));
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v5, "cfDiffered"), CFSTR("_cfDiffered"));
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v5, "cfUsed"), CFSTR("_cfUsed"));
    objc_msgSend(v4, "encodeInt64:forKey:", objc_msgSend(v5, "cfError"), CFSTR("_cfError"));
  }
  -[SFExperimentTriggeredFeedback codepathId](self, "codepathId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SFExperimentTriggeredFeedback codepathId](self, "codepathId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_codepathId"));

  }
}

- (SFCounterfactualInfo)counterfactual
{
  return self->_counterfactual;
}

- (void)setCounterfactual:(id)a3
{
  objc_storeStrong((id *)&self->_counterfactual, a3);
}

- (NSUUID)codepathId
{
  return self->_codepathId;
}

- (void)setCodepathId:(id)a3
{
  objc_storeStrong((id *)&self->_codepathId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codepathId, 0);
  objc_storeStrong((id *)&self->_counterfactual, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
