@implementation TRAMutableSettingsOrientation

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRASettingsOrientation initWithOrientationSettings:](+[TRASettingsOrientation allocWithZone:](TRASettingsOrientation, "allocWithZone:", a3), "initWithOrientationSettings:", self);
}

- (void)setValidatedOrientationInputs:(id)a3
{
  id v5;
  TRAArbitrationDeviceOrientationInputs **p_validatedOrientationInputs;
  TRAArbitrationDeviceOrientationInputs *validatedOrientationInputs;
  id v8;

  v5 = a3;
  validatedOrientationInputs = self->super._validatedOrientationInputs;
  p_validatedOrientationInputs = &self->super._validatedOrientationInputs;
  v8 = v5;
  if (!-[TRAArbitrationDeviceOrientationInputs isEqual:](validatedOrientationInputs, "isEqual:"))
    objc_storeStrong((id *)p_validatedOrientationInputs, a3);

}

- (void)setRawOrientationInputs:(id)a3
{
  id v5;
  TRAArbitrationDeviceOrientationInputs **p_rawOrientationInputs;
  TRAArbitrationDeviceOrientationInputs *rawOrientationInputs;
  id v8;

  v5 = a3;
  rawOrientationInputs = self->super._rawOrientationInputs;
  p_rawOrientationInputs = &self->super._rawOrientationInputs;
  v8 = v5;
  if (!-[TRAArbitrationDeviceOrientationInputs isEqual:](rawOrientationInputs, "isEqual:"))
    objc_storeStrong((id *)p_rawOrientationInputs, a3);

}

- (void)setOrientation:(int64_t)a3
{
  if (self->super._orientation != a3)
    self->super._orientation = a3;
}

- (void)setOrientationMapResolver:(id)a3
{
  id v5;
  BSInterfaceOrientationMapResolving **p_orientationMapResolver;
  BSInterfaceOrientationMapResolving *orientationMapResolver;
  id v8;

  v5 = a3;
  orientationMapResolver = self->super._orientationMapResolver;
  p_orientationMapResolver = &self->super._orientationMapResolver;
  v8 = v5;
  if ((-[BSInterfaceOrientationMapResolving isEqual:](orientationMapResolver, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_orientationMapResolver, a3);

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithOrientationSettings:", self);
}

@end
