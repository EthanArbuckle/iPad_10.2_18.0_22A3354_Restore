@implementation PLMediaAnalysisEmbedding

- (PLMediaAnalysisEmbedding)initWithMADEmbedding:(id)a3
{
  id v5;
  PLMediaAnalysisEmbedding *v6;
  PLMediaAnalysisEmbedding *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLMediaAnalysisEmbedding;
  v6 = -[PLMediaAnalysisEmbedding init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_madEmbedding, a3);

  return v7;
}

- (int64_t)format
{
  return -[MADEmbedding format](self->_madEmbedding, "format");
}

- (int64_t)dimension
{
  return -[MADEmbedding dimension](self->_madEmbedding, "dimension");
}

- (int64_t)version
{
  return -[MADEmbedding version](self->_madEmbedding, "version");
}

- (NSArray)vectors
{
  return (NSArray *)-[MADEmbedding vectors](self->_madEmbedding, "vectors");
}

- (_CSEmbedding)csEmbedding
{
  return (_CSEmbedding *)-[MADEmbedding csEmbedding](self->_madEmbedding, "csEmbedding");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madEmbedding, 0);
}

@end
