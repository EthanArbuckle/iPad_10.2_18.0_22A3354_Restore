@implementation TRASettingsOrientation

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TRASettingsOrientation initWithOrientationSettings:](+[TRAMutableSettingsOrientation allocWithZone:](TRAMutableSettingsOrientation, "allocWithZone:", a3), "initWithOrientationSettings:", self);
}

- (BOOL)isEqualToOrientationSettings:(id)a3
{
  TRASettingsOrientation *v5;
  int64_t orientation;
  BSInterfaceOrientationMapResolving *orientationMapResolver;
  void *v8;
  TRAArbitrationDeviceOrientationInputs *validatedOrientationInputs;
  void *v10;
  TRAArbitrationDeviceOrientationInputs *rawOrientationInputs;
  void *v12;
  char v13;
  void *v15;

  v5 = (TRASettingsOrientation *)a3;
  if (!v5)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRASettings.m"), 324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("orientationSettings == nil || [orientationSettings isKindOfClass:[TRASettingsOrientation class]]"));

  }
  if (self == v5)
  {
    v13 = 1;
    goto LABEL_11;
  }
  orientation = self->_orientation;
  if (orientation != -[TRASettingsOrientation orientation](v5, "orientation"))
    goto LABEL_9;
  orientationMapResolver = self->_orientationMapResolver;
  -[TRASettingsOrientation orientationMapResolver](v5, "orientationMapResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(orientationMapResolver) = -[BSInterfaceOrientationMapResolving isEqual:](orientationMapResolver, "isEqual:", v8);

  if (!(_DWORD)orientationMapResolver)
    goto LABEL_9;
  validatedOrientationInputs = self->_validatedOrientationInputs;
  -[TRASettingsOrientation validatedOrientationInputs](v5, "validatedOrientationInputs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(validatedOrientationInputs) = -[TRAArbitrationDeviceOrientationInputs isEqual:](validatedOrientationInputs, "isEqual:", v10);

  if ((_DWORD)validatedOrientationInputs)
  {
    rawOrientationInputs = self->_rawOrientationInputs;
    -[TRASettingsOrientation rawOrientationInputs](v5, "rawOrientationInputs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[TRAArbitrationDeviceOrientationInputs isEqual:](rawOrientationInputs, "isEqual:", v12);

  }
  else
  {
LABEL_9:
    v13 = 0;
  }
LABEL_11:

  return v13;
}

- (TRASettingsOrientation)initWithOrientationSettings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  TRAArbitrationDeviceOrientationInputs *v8;
  TRAArbitrationDeviceOrientationInputs *v9;
  TRASettingsOrientation *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "orientation");
    objc_msgSend(v5, "orientationMapResolver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "validatedOrientationInputs");
    v8 = (TRAArbitrationDeviceOrientationInputs *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rawOrientationInputs");
    v9 = (TRAArbitrationDeviceOrientationInputs *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BDD0]), "initWithTargetOrientation:currentOrientation:", 0, 0);
    v8 = -[TRAArbitrationDeviceOrientationInputs initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:]([TRAArbitrationDeviceOrientationInputs alloc], "initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:", 0, 0);
    v9 = -[TRAArbitrationDeviceOrientationInputs initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:]([TRAArbitrationDeviceOrientationInputs alloc], "initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:", 0, 0);
    v6 = 0;
  }
  v10 = -[TRASettingsOrientation initWithOrientation:orientationMapResolver:validatedOrientationInputs:rawOrientationInputs:](self, "initWithOrientation:orientationMapResolver:validatedOrientationInputs:rawOrientationInputs:", v6, v7, v8, v9);

  return v10;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BSInterfaceOrientationMapResolving)orientationMapResolver
{
  return self->_orientationMapResolver;
}

- (TRAArbitrationDeviceOrientationInputs)validatedOrientationInputs
{
  return self->_validatedOrientationInputs;
}

- (TRAArbitrationDeviceOrientationInputs)rawOrientationInputs
{
  return self->_rawOrientationInputs;
}

- (TRASettingsOrientation)initWithOrientation:(int64_t)a3 orientationMapResolver:(id)a4 validatedOrientationInputs:(id)a5 rawOrientationInputs:(id)a6
{
  id v11;
  id v12;
  id v13;
  TRASettingsOrientation *v14;
  TRASettingsOrientation *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)TRASettingsOrientation;
  v14 = -[TRASettingsOrientation init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_orientation = a3;
    objc_storeStrong((id *)&v14->_orientationMapResolver, a4);
    objc_storeStrong((id *)&v15->_validatedOrientationInputs, a5);
    objc_storeStrong((id *)&v15->_rawOrientationInputs, a6);
  }

  return v15;
}

- (TRASettingsOrientation)init
{
  return -[TRASettingsOrientation initWithOrientationSettings:](self, "initWithOrientationSettings:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawOrientationInputs, 0);
  objc_storeStrong((id *)&self->_validatedOrientationInputs, 0);
  objc_storeStrong((id *)&self->_orientationMapResolver, 0);
}

- (TRASettingsOrientation)initWithOrientation:(int64_t)a3
{
  void *v5;
  TRAArbitrationDeviceOrientationInputs *v6;
  TRAArbitrationDeviceOrientationInputs *v7;
  TRASettingsOrientation *v8;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BDD0]), "initWithTargetOrientation:currentOrientation:", 0, 0);
  v6 = -[TRAArbitrationDeviceOrientationInputs initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:]([TRAArbitrationDeviceOrientationInputs alloc], "initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:", 0, 0);
  v7 = -[TRAArbitrationDeviceOrientationInputs initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:]([TRAArbitrationDeviceOrientationInputs alloc], "initWithCurrentDeviceOrientation:nonFlatDeviceOrientation:", 0, 0);
  v8 = -[TRASettingsOrientation initWithOrientation:orientationMapResolver:validatedOrientationInputs:rawOrientationInputs:](self, "initWithOrientation:orientationMapResolver:validatedOrientationInputs:rawOrientationInputs:", a3, v5, v6, v7);

  return v8;
}

- (NSString)debugDescription
{
  return (NSString *)-[TRASettingsOrientation descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  TRASettingsOrientation *v4;
  BOOL v5;

  v4 = (TRASettingsOrientation *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TRASettingsOrientation isEqualToOrientationSettings:](self, "isEqualToOrientationSettings:", v4);
  }

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  TRAStringForBSInterfaceOrientation(self->_orientation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("orientation: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)MEMORY[0x24BDD17C8];
  TRAStringForBSDeviceOrientation(-[TRAArbitrationDeviceOrientationInputs currentDeviceOrientation](self->_validatedOrientationInputs, "currentDeviceOrientation", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TRAStringForBSDeviceOrientation(-[TRAArbitrationDeviceOrientationInputs nonFlatDeviceOrientation](self->_validatedOrientationInputs, "nonFlatDeviceOrientation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("current: %@, nonFlat: %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  TRAStringForBSDeviceOrientation(-[TRAArbitrationDeviceOrientationInputs currentDeviceOrientation](self->_rawOrientationInputs, "currentDeviceOrientation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  TRAStringForBSDeviceOrientation(-[TRAArbitrationDeviceOrientationInputs nonFlatDeviceOrientation](self->_rawOrientationInputs, "nonFlatDeviceOrientation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("current: %@, nonFlat: %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  TRAStringForBSInterfaceOrientation(self->_orientation);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("orientation: %@, deviceValidated: {%@}, deviceRaw: {%@}, mapResolver: {%@}"), v13, v7, v11, self->_orientationMapResolver);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return 0;
}

- (id)succinctDescriptionBuilder
{
  return 0;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setOrientationMapResolver:(id)a3
{
  objc_storeStrong((id *)&self->_orientationMapResolver, a3);
}

- (void)setValidatedOrientationInputs:(id)a3
{
  objc_storeStrong((id *)&self->_validatedOrientationInputs, a3);
}

- (void)setRawOrientationInputs:(id)a3
{
  objc_storeStrong((id *)&self->_rawOrientationInputs, a3);
}

@end
