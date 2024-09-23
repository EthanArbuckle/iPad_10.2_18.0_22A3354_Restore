@implementation SFDecoder

- (SFDecoder)initWithOptions:(id)a3
{
  id v5;
  SFDecoder *v6;
  SFDecoder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFDecoder;
  v6 = -[SFDecoder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)v6->_decoderInternal + 1, a3);

  return v7;
}

- (id)decodeValueOfType:(Class)a3 fromData:(id)a4 error:(id)a5
{
  return 0;
}

- (SFCodingOptions)options
{
  return (SFCodingOptions *)(id)objc_msgSend(*((id *)self->_decoderInternal + 1), "copy");
}

- (void)setOptions:(id)a3
{
  uint64_t v4;
  _QWORD *decoderInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  decoderInternal = self->_decoderInternal;
  v6 = (void *)decoderInternal[1];
  decoderInternal[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_decoderInternal, 0);
}

@end
