@implementation _UIEmptyEffect

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (id)_allEffects
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
