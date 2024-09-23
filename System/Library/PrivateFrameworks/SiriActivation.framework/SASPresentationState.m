@implementation SASPresentationState

- (SASPresentationState)initWithBuilder:(id)a3
{
  SASPresentationState *v4;

  v4 = +[SASPresentationState newWithBuilder:](SASPresentationState, "newWithBuilder:", a3);

  return v4;
}

- (SASPresentationState)initWithPresentationIdentifier:(id)a3
{
  id v4;
  SASPresentationState *v5;
  uint64_t v6;
  NSString *presentationIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASPresentationState;
  v5 = -[SASPresentationState init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    presentationIdentifier = v5->_presentationIdentifier;
    v5->_presentationIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12.receiver = self;
  v12.super_class = (Class)SASPresentationState;
  -[SASPresentationState description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_presentationIdentifier, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("presentationIdentifier = %@"), v6);
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {%@}"), v4, v9);

  return v10;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_presentationIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SASPresentationState *v4;
  NSString *v5;
  NSString *presentationIdentifier;
  BOOL v7;

  v4 = (SASPresentationState *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SASPresentationState presentationIdentifier](v4, "presentationIdentifier");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      presentationIdentifier = self->_presentationIdentifier;
      v7 = presentationIdentifier == v5 || -[NSString isEqual:](presentationIdentifier, "isEqual:", v5);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASPresentationState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SASPresentationState *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASPresentationState::presentationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SASPresentationState initWithPresentationIdentifier:](self, "initWithPresentationIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_presentationIdentifier, CFSTR("SASPresentationState::presentationIdentifier"));
}

- (NSString)presentationIdentifier
{
  return self->_presentationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationIdentifier, 0);
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SASPresentationStateMutation *);
  _SASPresentationStateMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SASPresentationStateMutation *))a3;
  v4 = objc_alloc_init(_SASPresentationStateMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SASPresentationStateMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SASPresentationStateMutation *);
  _SASPresentationStateMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SASPresentationStateMutation *))a3;
  if (v4)
  {
    v5 = -[_SASPresentationStateMutation initWithBaseModel:]([_SASPresentationStateMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SASPresentationStateMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SASPresentationState copy](self, "copy");
  }

  return v6;
}

@end
