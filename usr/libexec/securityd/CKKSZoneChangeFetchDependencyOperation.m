@implementation CKKSZoneChangeFetchDependencyOperation

- (CKKSZoneChangeFetchDependencyOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKKSZoneChangeFetchDependencyOperation;
  return -[CKKSResultOperation init](&v3, "init");
}

- (id)descriptionError
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetchDependencyOperation owner](self, "owner"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastCKFetchError"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSResultOperationDescriptionError"), 2, CFSTR("Fetch failed"), v3));

  return v4;
}

- (CKKSZoneChangeFetcher)owner
{
  return (CKKSZoneChangeFetcher *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
}

@end
