@implementation PNCVNLPWrapper

- (PNCVNLPWrapper)initWithCLIPModelName:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PNCVNLPWrapper;
  return -[PNCVNLPWrapper init](&v5, sel_init, a3, a4);
}

- (id)encodeText:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  void *v6;

  v4 = objc_alloc(MEMORY[0x1E0CEE030]);
  v5 = objc_alloc_init(MEMORY[0x1E0CB3510]);
  v6 = (void *)objc_msgSend(v4, "initWithCoder:", v5);

  return v6;
}

@end
