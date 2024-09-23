@implementation PLFetchRecorderPredicateVisitor

- (void)visitPredicateOperator:(id)a3
{
  if (objc_msgSend(a3, "operatorType") == 10)
    self->_foundOperatorIN = 1;
}

- (void)reset
{
  self->_foundOperatorIN = 0;
}

- (void)examinePredicate:(id)a3
{
  objc_msgSend(a3, "acceptVisitor:flags:", self, 2);
}

- (BOOL)foundOperatorIN
{
  return self->_foundOperatorIN;
}

@end
