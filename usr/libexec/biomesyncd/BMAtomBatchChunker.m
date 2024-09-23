@implementation BMAtomBatchChunker

- (BMAtomBatchChunker)initWithChunkerPolicy:(id)a3
{
  id v4;
  BMAtomBatchChunker *v5;
  BMAtomBatchChunkerPolicy *v6;
  BMAtomBatchChunkerPolicy *chunkerPolicy;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMAtomBatchChunker;
  v5 = -[BMAtomBatchChunker init](&v9, "init");
  if (v5)
  {
    v6 = (BMAtomBatchChunkerPolicy *)objc_msgSend(v4, "copy");
    chunkerPolicy = v5->_chunkerPolicy;
    v5->_chunkerPolicy = v6;

  }
  return v5;
}

- (BOOL)canAddAtomWithData:(id)a3
{
  return -[BMAtomBatchChunkerPolicy canAddAtomWithData:](self->_chunkerPolicy, "canAddAtomWithData:", a3);
}

- (void)didAddAtomWithData:(id)a3
{
  -[BMAtomBatchChunkerPolicy didAddAtomWithData:](self->_chunkerPolicy, "didAddAtomWithData:", a3);
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)setMoreComing:(BOOL)a3
{
  self->_moreComing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chunkerPolicy, 0);
}

@end
