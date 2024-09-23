@implementation TRASettingsAmbientPresentation

- (TRASettingsAmbientPresentation)initWithAmbientPresentationInputs:(id)a3
{
  id v5;
  TRASettingsAmbientPresentation *v6;
  TRASettingsAmbientPresentation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRASettingsAmbientPresentation;
  v6 = -[TRASettingsAmbientPresentation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ambientPresentationInputs, a3);

  return v7;
}

- (TRASettingsAmbientPresentation)initWithAmbientPresentationSettings:(id)a3
{
  void *v4;
  TRASettingsAmbientPresentation *v5;

  objc_msgSend(a3, "ambientPresentationInputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TRASettingsAmbientPresentation initWithAmbientPresentationInputs:](self, "initWithAmbientPresentationInputs:", v4);

  return v5;
}

- (TRASettingsAmbientPresentation)init
{
  return -[TRASettingsAmbientPresentation initWithAmbientPresentationSettings:](self, "initWithAmbientPresentationSettings:", 0);
}

- (BOOL)isEqualToAmbientPresentationSettings:(id)a3
{
  TRASettingsAmbientPresentation *v5;
  TRAArbitrationAmbientPresentationInputs *ambientPresentationInputs;
  void *v7;
  char v8;
  void *v10;

  v5 = (TRASettingsAmbientPresentation *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRASettings.m"), 474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ambientPresentationSettings == nil || [ambientPresentationSettings isKindOfClass:[TRASettingsAmbientPresentation class]]"));

    }
    if (self == v5)
    {
      v8 = 1;
    }
    else
    {
      ambientPresentationInputs = self->_ambientPresentationInputs;
      -[TRASettingsAmbientPresentation ambientPresentationInputs](v5, "ambientPresentationInputs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[TRAArbitrationAmbientPresentationInputs isEqual:](ambientPresentationInputs, "isEqual:", v7);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TRASettingsAmbientPresentation initWithAmbientPresentationSettings:](+[TRAMutableSettingsAmbientPresentation allocWithZone:](TRAMutableSettingsAmbientPresentation, "allocWithZone:", a3), "initWithAmbientPresentationSettings:", self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TRASettingsAmbientPresentation descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  TRASettingsAmbientPresentation *v4;
  BOOL v5;

  v4 = (TRASettingsAmbientPresentation *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TRASettingsAmbientPresentation isEqualToAmbientPresentationSettings:](self, "isEqualToAmbientPresentationSettings:", v4);
  }

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRASettingsAmbientPresentation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[TRAArbitrationAmbientPresentationInputs ambientDisplayStyle](self->_ambientPresentationInputs, "ambientDisplayStyle"), CFSTR("ambientDisplayStyle"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[TRAArbitrationAmbientPresentationInputs isAmbientPresented](self->_ambientPresentationInputs, "isAmbientPresented"), CFSTR("isAmbientPresented"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRASettingsAmbientPresentation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (TRAArbitrationAmbientPresentationInputs)ambientPresentationInputs
{
  return self->_ambientPresentationInputs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientPresentationInputs, 0);
}

@end
