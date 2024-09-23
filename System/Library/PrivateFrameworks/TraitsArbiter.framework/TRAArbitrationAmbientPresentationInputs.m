@implementation TRAArbitrationAmbientPresentationInputs

- (TRAArbitrationAmbientPresentationInputs)initWithAmbientPresented:(BOOL)a3 ambientDisplayStyle:(int64_t)a4
{
  TRAArbitrationAmbientPresentationInputs *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TRAArbitrationAmbientPresentationInputs;
  result = -[TRAArbitrationAmbientPresentationInputs init](&v7, sel_init);
  if (result)
  {
    result->_ambientPresented = a3;
    result->_ambientDisplayStyle = a4;
  }
  return result;
}

- (BOOL)isEqualToAmbientPresentationInputs:(id)a3
{
  TRAArbitrationAmbientPresentationInputs *v5;
  _BOOL4 ambientPresented;
  int64_t ambientDisplayStyle;
  BOOL v8;
  void *v10;

  v5 = (TRAArbitrationAmbientPresentationInputs *)a3;
  if (!v5)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 662, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inputs == nil || [inputs isKindOfClass:[TRAArbitrationAmbientPresentationInputs class]]"));

  }
  if (self == v5)
  {
    v8 = 1;
    goto LABEL_9;
  }
  ambientPresented = self->_ambientPresented;
  if (ambientPresented == -[TRAArbitrationAmbientPresentationInputs isAmbientPresented](v5, "isAmbientPresented"))
  {
    ambientDisplayStyle = self->_ambientDisplayStyle;
    v8 = ambientDisplayStyle == -[TRAArbitrationAmbientPresentationInputs ambientDisplayStyle](v5, "ambientDisplayStyle");
  }
  else
  {
LABEL_7:
    v8 = 0;
  }
LABEL_9:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  TRAArbitrationAmbientPresentationInputs *v4;
  BOOL v5;

  v4 = (TRAArbitrationAmbientPresentationInputs *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TRAArbitrationAmbientPresentationInputs isEqualToAmbientPresentationInputs:](self, "isEqualToAmbientPresentationInputs:", v4);
  }

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAArbitrationAmbientPresentationInputs succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_ambientPresented, CFSTR("isAmbientPresented"));
  v5 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_ambientDisplayStyle, CFSTR("ambientDisplayStyle"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAArbitrationAmbientPresentationInputs descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isAmbientPresented
{
  return self->_ambientPresented;
}

- (int64_t)ambientDisplayStyle
{
  return self->_ambientDisplayStyle;
}

@end
