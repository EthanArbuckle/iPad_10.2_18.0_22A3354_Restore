@implementation EQKitMathMLMPhantom

- (EQKitMathMLMPhantom)init
{
  return -[EQKitMathMLUnaryNode initWithChild:](self, "initWithChild:", 0);
}

- (BOOL)isEmbellishedOperator
{
  return -[EQKitMathMLNode isEmbellishedOperator](self->super.mChild, "isEmbellishedOperator");
}

- (id)operatorCore
{
  return -[EQKitMathMLNode operatorCore](self->super.mChild, "operatorCore");
}

- (id)schemataChild
{
  return self->super.mChild;
}

@end
