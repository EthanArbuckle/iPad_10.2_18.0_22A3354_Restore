@implementation TRAMutableSettingsAmbientPresentation

- (void)setAmbientPresentationInputs:(id)a3
{
  TRAArbitrationAmbientPresentationInputs *v5;
  TRAArbitrationAmbientPresentationInputs **p_ambientPresentationInputs;
  TRAArbitrationAmbientPresentationInputs *ambientPresentationInputs;
  TRAArbitrationAmbientPresentationInputs *v8;

  v5 = (TRAArbitrationAmbientPresentationInputs *)a3;
  ambientPresentationInputs = self->super._ambientPresentationInputs;
  p_ambientPresentationInputs = &self->super._ambientPresentationInputs;
  if (ambientPresentationInputs != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_ambientPresentationInputs, a3);
    v5 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRASettingsAmbientPresentation initWithAmbientPresentationSettings:](+[TRASettingsAmbientPresentation allocWithZone:](TRASettingsAmbientPresentation, "allocWithZone:", a3), "initWithAmbientPresentationSettings:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAmbientPresentationSettings:", self);
}

@end
