@implementation STMutableFocusStatusDomainData

- (void)setModeIdentifier:(id)a3
{
  NSString *v5;
  NSString **p_modeIdentifier;
  NSString *modeIdentifier;
  NSString *v8;

  v5 = (NSString *)a3;
  modeIdentifier = self->super._modeIdentifier;
  p_modeIdentifier = &self->super._modeIdentifier;
  if (modeIdentifier != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_modeIdentifier, a3);
    v5 = v8;
  }

}

- (void)setModeName:(id)a3
{
  NSString *v5;
  NSString **p_modeName;
  NSString *modeName;
  NSString *v8;

  v5 = (NSString *)a3;
  modeName = self->super._modeName;
  p_modeName = &self->super._modeName;
  if (modeName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_modeName, a3);
    v5 = v8;
  }

}

- (void)setModeSymbol:(id)a3
{
  NSString *v5;
  NSString **p_modeSymbol;
  NSString *modeSymbol;
  NSString *v8;

  v5 = (NSString *)a3;
  modeSymbol = self->super._modeSymbol;
  p_modeSymbol = &self->super._modeSymbol;
  if (modeSymbol != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_modeSymbol, a3);
    v5 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STFocusStatusDomainData initWithData:]((id *)+[STFocusStatusDomainData allocWithZone:](STFocusStatusDomainData, "allocWithZone:", a3), self);
}

- (BOOL)applyDiff:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v4, "applyToMutableData:", self);

  return isKindOfClass & 1;
}

@end
