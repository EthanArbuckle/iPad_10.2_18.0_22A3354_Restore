@implementation SRRReferenceResolutionClient

- (SRRReferenceResolutionClient)init
{
  SRRReferenceResolutionClient *v2;
  uint64_t v3;
  SRRReferenceResolutionClientInternal *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRRReferenceResolutionClient;
  v2 = -[SRRReferenceResolutionClient init](&v6, sel_init);
  v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (SRRReferenceResolutionClientInternal *)v3;

  return v2;
}

- (void)collectSalientEntityStringsWithCompletion:(id)a3
{
  -[SRRReferenceResolutionClientInternal collectEntityStringsWithCompletion:](self->_underlyingObject, "collectEntityStringsWithCompletion:", a3);
}

- (void)collectSalientStringsWithCompletion:(id)a3
{
  -[SRRReferenceResolutionClientInternal collectOnScreenEntityStringsWithCompletion:](self->_underlyingObject, "collectOnScreenEntityStringsWithCompletion:", a3);
}

- (SRRReferenceResolutionClientInternal)underlyingObject
{
  return (SRRReferenceResolutionClientInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
