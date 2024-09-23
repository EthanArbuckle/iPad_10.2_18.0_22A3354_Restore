@implementation UICollectionViewDropProposal

- (UICollectionViewDropProposal)initWithDropOperation:(UIDropOperation)operation intent:(UICollectionViewDropIntent)intent
{
  UICollectionViewDropProposal *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewDropProposal;
  result = -[UIDropProposal initWithDropOperation:](&v6, sel_initWithDropOperation_, operation);
  if (result)
    result->_intent = intent;
  return result;
}

- (UICollectionViewDropProposal)initWithDropOperation:(unint64_t)a3 dropLocation:(int64_t)a4
{
  UICollectionViewDropProposal *result;
  int64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewDropProposal;
  result = -[UIDropProposal initWithDropOperation:](&v7, sel_initWithDropOperation_, a3);
  if (result)
  {
    v6 = 2 * (a4 == 1);
    if (!a4)
      v6 = 1;
    result->_intent = v6;
  }
  return result;
}

- (UICollectionViewDropProposal)initWithDropOperation:(unint64_t)a3
{
  UICollectionViewDropProposal *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewDropProposal;
  result = -[UIDropProposal initWithDropOperation:](&v4, sel_initWithDropOperation_, a3);
  if (result)
    result->_intent = 0;
  return result;
}

- (int64_t)dropLocation
{
  int64_t intent;
  int64_t v3;

  intent = self->_intent;
  v3 = 1;
  if (intent != 2)
    v3 = 2;
  if (intent == 1)
    return 0;
  else
    return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  UIDropOperation v6;
  const __CFString *v7;
  unint64_t intent;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIDropProposal operation](self, "operation");
  if (v6 > UIDropOperationMove)
    v7 = &stru_1E16EDF20;
  else
    v7 = off_1E16BE3E0[v6];
  intent = self->_intent;
  if (intent > 2)
    v9 = &stru_1E16EDF20;
  else
    v9 = off_1E16BE400[intent];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p operation = %@; location = %@>"), v5, self, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UICollectionViewDropIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(int64_t)a3
{
  self->_intent = a3;
}

@end
