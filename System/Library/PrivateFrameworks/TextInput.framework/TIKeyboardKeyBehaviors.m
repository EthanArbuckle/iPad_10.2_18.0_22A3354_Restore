@implementation TIKeyboardKeyBehaviors

- (TIKeyboardKeyBehaviors)initWithSpaceKeyBehavior:(unint64_t)a3 returnKeyBehavior:(unint64_t)a4 tabKeyBehavior:(unint64_t)a5
{
  TIKeyboardKeyBehaviors *v8;
  TIKeyboardKeyBehaviors *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardKeyBehaviors;
  v8 = -[TIKeyboardKeyBehaviors init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TIKeyboardKeyBehaviors setSpaceKeyBehavior:](v8, "setSpaceKeyBehavior:", a3);
    -[TIKeyboardKeyBehaviors setReturnKeyBehavior:](v9, "setReturnKeyBehavior:", a4);
    -[TIKeyboardKeyBehaviors setTabKeyBehavior:](v9, "setTabKeyBehavior:", a5);
  }
  return v9;
}

- (unint64_t)spaceKeyBehavior
{
  return self->_spaceKeyBehavior;
}

- (void)setSpaceKeyBehavior:(unint64_t)a3
{
  self->_spaceKeyBehavior = a3;
}

- (unint64_t)returnKeyBehavior
{
  return self->_returnKeyBehavior;
}

- (void)setReturnKeyBehavior:(unint64_t)a3
{
  self->_returnKeyBehavior = a3;
}

- (unint64_t)tabKeyBehavior
{
  return self->_tabKeyBehavior;
}

- (void)setTabKeyBehavior:(unint64_t)a3
{
  self->_tabKeyBehavior = a3;
}

+ (id)behaviorForSpaceKey:(unint64_t)a3 forReturnKey:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "behaviorForSpaceKey:forReturnKey:forTabKey:", a3, a4, 1);
}

+ (id)behaviorForSpaceKey:(unint64_t)a3 forReturnKey:(unint64_t)a4 forTabKey:(unint64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSpaceKeyBehavior:returnKeyBehavior:tabKeyBehavior:", a3, a4, a5);
}

@end
