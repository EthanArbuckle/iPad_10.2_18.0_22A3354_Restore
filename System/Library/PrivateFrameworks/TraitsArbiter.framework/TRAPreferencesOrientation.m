@implementation TRAPreferencesOrientation

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TRAPreferencesOrientation initWithOrientationPreferences:](+[TRAMutablePreferencesOrientation allocWithZone:](TRAMutablePreferencesOrientation, "allocWithZone:", a3), "initWithOrientationPreferences:", self);
}

- (BOOL)isEqualToOrientationPreferences:(id)a3
{
  TRAPreferencesOrientation *v5;
  unint64_t supportedOrientations;
  int64_t preferredOrientation;
  _BOOL4 canDetermineActiveOrientation;
  BOOL v9;
  void *v11;

  v5 = (TRAPreferencesOrientation *)a3;
  if (!v5)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAPreferences.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferences == nil || [preferences isKindOfClass:[TRAPreferencesOrientation class]]"));

  }
  if (self == v5)
  {
    v9 = 1;
    goto LABEL_10;
  }
  supportedOrientations = self->_supportedOrientations;
  if (supportedOrientations == -[TRAPreferencesOrientation supportedOrientations](v5, "supportedOrientations")
    && (preferredOrientation = self->_preferredOrientation,
        preferredOrientation == -[TRAPreferencesOrientation preferredOrientation](v5, "preferredOrientation")))
  {
    canDetermineActiveOrientation = self->_canDetermineActiveOrientation;
    v9 = canDetermineActiveOrientation == -[TRAPreferencesOrientation canDetermineActiveOrientation](v5, "canDetermineActiveOrientation");
  }
  else
  {
LABEL_8:
    v9 = 0;
  }
LABEL_10:

  return v9;
}

- (TRAPreferencesOrientation)initWithOrientationPreferences:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  TRAPreferencesOrientation *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "supportedOrientations");
  else
    v6 = 30;
  v7 = -[TRAPreferencesOrientation initWithSupportedMask:preferred:determinesActiveOrientation:](self, "initWithSupportedMask:preferred:determinesActiveOrientation:", v6, objc_msgSend(v5, "preferredOrientation"), objc_msgSend(v5, "canDetermineActiveOrientation"));

  return v7;
}

- (BOOL)canDetermineActiveOrientation
{
  return self->_canDetermineActiveOrientation;
}

- (unint64_t)supportedOrientations
{
  return self->_supportedOrientations;
}

- (int64_t)preferredOrientation
{
  return self->_preferredOrientation;
}

- (TRAPreferencesOrientation)initWithSupportedMask:(unint64_t)a3 preferred:(int64_t)a4 determinesActiveOrientation:(BOOL)a5
{
  TRAPreferencesOrientation *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TRAPreferencesOrientation;
  result = -[TRAPreferencesOrientation init](&v9, sel_init);
  if (result)
  {
    result->_supportedOrientations = a3;
    result->_preferredOrientation = a4;
    result->_canDetermineActiveOrientation = a5;
  }
  return result;
}

- (TRAPreferencesOrientation)init
{
  return -[TRAPreferencesOrientation initWithOrientationPreferences:](self, "initWithOrientationPreferences:", 0);
}

- (TRAPreferencesOrientation)initWithSupportedMask:(unint64_t)a3 determinesActiveOrientation:(BOOL)a4
{
  return -[TRAPreferencesOrientation initWithSupportedMask:preferred:determinesActiveOrientation:](self, "initWithSupportedMask:preferred:determinesActiveOrientation:", a3, 0, a4);
}

- (BOOL)isEqual:(id)a3
{
  TRAPreferencesOrientation *v4;
  BOOL v5;

  v4 = (TRAPreferencesOrientation *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TRAPreferencesOrientation isEqualToOrientationPreferences:](self, "isEqualToOrientationPreferences:", v4);
  }

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAPreferencesOrientation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  int64_t preferredOrientation;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TRAStringForBSInterfaceOrientationMask(self->_supportedOrientations);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("supports"));

  preferredOrientation = self->_preferredOrientation;
  if (preferredOrientation)
  {
    TRAStringForBSInterfaceOrientation(preferredOrientation);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v6, CFSTR("preferred"));

  }
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_canDetermineActiveOrientation, CFSTR("determines active"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAPreferencesOrientation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setCanDetermineActiveOrientation:(BOOL)a3
{
  self->_canDetermineActiveOrientation = a3;
}

- (void)setSupportedOrientations:(unint64_t)a3
{
  self->_supportedOrientations = a3;
}

- (void)setPreferredOrientation:(int64_t)a3
{
  self->_preferredOrientation = a3;
}

@end
