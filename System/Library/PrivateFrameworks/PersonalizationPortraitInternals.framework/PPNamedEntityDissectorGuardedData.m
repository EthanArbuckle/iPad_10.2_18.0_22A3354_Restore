@implementation PPNamedEntityDissectorGuardedData

- (_PASLazyPurgeableResult)purgeableGazetteer
{
  return self->_purgeableGazetteer;
}

- (void)setPurgeableGazetteer:(id)a3
{
  objc_storeStrong((id *)&self->_purgeableGazetteer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeableGazetteer, 0);
}

@end
