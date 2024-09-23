@implementation CRLAccessibilityBoxedWeakReference

- (CRLAccessibilityBoxedWeakReference)initWithObject:(id)a3
{
  id v4;
  CRLAccessibilityBoxedWeakReference *v5;
  CRLAccessibilityBoxedWeakReference *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLAccessibilityBoxedWeakReference;
  v5 = -[CRLAccessibilityBoxedWeakReference init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_reference, v4);

  return v6;
}

- (id)reference
{
  return objc_loadWeakRetained(&self->_reference);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_reference);
}

@end
