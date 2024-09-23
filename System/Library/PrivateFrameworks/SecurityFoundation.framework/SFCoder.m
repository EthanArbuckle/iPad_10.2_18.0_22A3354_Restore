@implementation SFCoder

- (SFCoder)initWithOptions:(id)a3
{
  id v5;
  SFCoder *v6;
  SFCoder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCoder;
  v6 = -[SFCoder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)v6->_coderInternal + 1, a3);

  return v7;
}

- (id)encodeTopLevelValue:(id)a3 error:(id *)a4
{
  return 0;
}

- (SFCodingOptions)options
{
  return (SFCodingOptions *)(id)objc_msgSend(*((id *)self->_coderInternal + 1), "copy");
}

- (void)setOptions:(id)a3
{
  uint64_t v4;
  _QWORD *coderInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  coderInternal = self->_coderInternal;
  v6 = (void *)coderInternal[1];
  coderInternal[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_coderInternal, 0);
}

@end
