@implementation _DASClosureBatch

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDs, a3);
}

- (double)signpostTimestamp
{
  return self->_signpostTimestamp;
}

- (void)setSignpostTimestamp:(double)a3
{
  self->_signpostTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end
