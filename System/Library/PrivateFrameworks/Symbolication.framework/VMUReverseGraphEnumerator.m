@implementation VMUReverseGraphEnumerator

- (VMUReverseGraphEnumerator)initWithGraph:(id)a3
{
  void *v4;
  VMUReverseGraphEnumerator *v5;
  objc_super v7;

  objc_msgSend(a3, "invertedGraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)VMUReverseGraphEnumerator;
  v5 = -[VMUGraphEnumerator initWithGraph:](&v7, sel_initWithGraph_, v4);

  return v5;
}

- (id)statusDisplayDescription
{
  return CFSTR("reverse");
}

@end
