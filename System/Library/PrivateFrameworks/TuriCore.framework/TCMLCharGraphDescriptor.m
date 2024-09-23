@implementation TCMLCharGraphDescriptor

- (NSDictionary)additionDescs
{
  return self->_additionDescs;
}

- (void)setAdditionDescs:(id)a3
{
  objc_storeStrong((id *)&self->_additionDescs, a3);
}

- (NSDictionary)averagePoolDesc
{
  return self->_averagePoolDesc;
}

- (void)setAveragePoolDesc:(id)a3
{
  objc_storeStrong((id *)&self->_averagePoolDesc, a3);
}

- (NSDictionary)batchNormDescs
{
  return self->_batchNormDescs;
}

- (void)setBatchNormDescs:(id)a3
{
  objc_storeStrong((id *)&self->_batchNormDescs, a3);
}

- (NSDictionary)catDescs
{
  return self->_catDescs;
}

- (void)setCatDescs:(id)a3
{
  objc_storeStrong((id *)&self->_catDescs, a3);
}

- (NSDictionary)chunkDescs
{
  return self->_chunkDescs;
}

- (void)setChunkDescs:(id)a3
{
  objc_storeStrong((id *)&self->_chunkDescs, a3);
}

- (NSDictionary)convDescs
{
  return self->_convDescs;
}

- (void)setConvDescs:(id)a3
{
  objc_storeStrong((id *)&self->_convDescs, a3);
}

- (NSDictionary)dropoutDescs
{
  return self->_dropoutDescs;
}

- (void)setDropoutDescs:(id)a3
{
  objc_storeStrong((id *)&self->_dropoutDescs, a3);
}

- (NSDictionary)transposeDescs
{
  return self->_transposeDescs;
}

- (void)setTransposeDescs:(id)a3
{
  objc_storeStrong((id *)&self->_transposeDescs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transposeDescs, 0);
  objc_storeStrong((id *)&self->_dropoutDescs, 0);
  objc_storeStrong((id *)&self->_convDescs, 0);
  objc_storeStrong((id *)&self->_chunkDescs, 0);
  objc_storeStrong((id *)&self->_catDescs, 0);
  objc_storeStrong((id *)&self->_batchNormDescs, 0);
  objc_storeStrong((id *)&self->_averagePoolDesc, 0);
  objc_storeStrong((id *)&self->_additionDescs, 0);
}

@end
