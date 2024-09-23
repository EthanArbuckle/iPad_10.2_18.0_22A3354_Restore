@implementation SRStreamBlockSample

- (SRStreamBlockSample)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v6;
  SRStreamBlockSample *v7;
  _TtC16SensorKitSupport13SRStreamBlock *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SRStreamBlockSample;
  v7 = -[SRStreamBlockSample init](&v10, sel_init);
  if (v7)
  {
    v8 = -[SRStreamBlock initWithBinaryRep:]([_TtC16SensorKitSupport13SRStreamBlock alloc], "initWithBinaryRep:", v6);
    -[SRStreamBlockSample setStreamBlock:](v7, "setStreamBlock:", v8);

  }
  return v7;
}

- (id)sr_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SRStreamBlockSample streamBlock](self, "streamBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[SRStreamBlockSample sampleDict](self, "sampleDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[SRStreamBlockSample streamBlock](self, "streamBlock");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SRStreamBlockSample setSampleDict:](self, "setSampleDict:", v7);

      -[SRStreamBlockSample setStreamBlock:](self, "setStreamBlock:", 0);
    }
  }
  return -[SRStreamBlockSample sampleDict](self, "sampleDict");
}

- (BOOL)sr_prefersUTF8StringRepresentation
{
  return 1;
}

- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v9;

  v4 = a3;
  -[SRStreamBlockSample sr_dictionaryRepresentation](self, "sr_dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(MEMORY[0x24BDD1608], "writeJSONObject:toStream:options:error:", v5, v4, 0, &v9);

  if (v9)
    v7 = -1;
  else
    v7 = v6;

  return v7;
}

- (_TtC16SensorKitSupport13SRStreamBlock)streamBlock
{
  return self->_streamBlock;
}

- (void)setStreamBlock:(id)a3
{
  objc_storeStrong((id *)&self->_streamBlock, a3);
}

- (NSDictionary)sampleDict
{
  return self->_sampleDict;
}

- (void)setSampleDict:(id)a3
{
  objc_storeStrong((id *)&self->_sampleDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleDict, 0);
  objc_storeStrong((id *)&self->_streamBlock, 0);
}

@end
