@implementation SCROPendingBrailleModifierPair

- (SCROPendingBrailleModifierPair)initWithPendingBraille:(id)a3 modifiers:(id)a4
{
  NSString *v6;
  NSArray *v7;
  SCROPendingBrailleModifierPair *v8;
  NSString *pendingBraille;
  NSString *v10;
  NSArray *modifiers;
  objc_super v13;

  v6 = (NSString *)a3;
  v7 = (NSArray *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SCROPendingBrailleModifierPair;
  v8 = -[SCROPendingBrailleModifierPair init](&v13, sel_init);
  pendingBraille = v8->_pendingBraille;
  v8->_pendingBraille = v6;
  v10 = v6;

  modifiers = v8->_modifiers;
  v8->_modifiers = v7;

  return v8;
}

- (NSString)pendingBraille
{
  return self->_pendingBraille;
}

- (NSArray)modifiers
{
  return self->_modifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiers, 0);
  objc_storeStrong((id *)&self->_pendingBraille, 0);
}

@end
