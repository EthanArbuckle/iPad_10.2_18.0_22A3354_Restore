@implementation RBSProcessBeforeTranslocationBundlePathPredicate

- (RBSProcessBeforeTranslocationBundlePathPredicate)initWithIdentifier:(id)a3
{
  RBSProcessBeforeTranslocationBundlePathPredicate *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RBSProcessBeforeTranslocationBundlePathPredicate;
  result = -[RBSProcessStringPredicate initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (RBSProcessBeforeTranslocationBundlePathPredicate)init
{
  RBSProcessBeforeTranslocationBundlePathPredicate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBSProcessBeforeTranslocationBundlePathPredicate;
  result = -[RBSProcessBeforeTranslocationBundlePathPredicate init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (BOOL)matchesProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[RBSProcessBeforeTranslocationBundlePathPredicate beforeTranslocationBundlePath](self, "beforeTranslocationBundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beforeTranslocationBundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beforeTranslocationBundlePath, 0);
}

@end
