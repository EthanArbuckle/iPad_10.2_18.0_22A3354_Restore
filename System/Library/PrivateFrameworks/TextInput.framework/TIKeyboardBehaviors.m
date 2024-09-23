@implementation TIKeyboardBehaviors

- (TIKeyboardBehaviors)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardBehaviors;
  return -[TIKeyboardBehaviors init](&v4, sel_init, a3);
}

- (id)keyBehaviorsForState:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  return -[TIKeyboardBehaviors isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
