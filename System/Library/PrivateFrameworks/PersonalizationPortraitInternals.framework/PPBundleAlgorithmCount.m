@implementation PPBundleAlgorithmCount

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (unsigned)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(unsigned int)a3
{
  self->_algorithm = a3;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
