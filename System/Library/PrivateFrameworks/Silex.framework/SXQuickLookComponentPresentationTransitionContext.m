@implementation SXQuickLookComponentPresentationTransitionContext

- (SXQuickLookComponentPresentationTransitionContext)initWithFile:(id)a3
{
  id v5;
  SXQuickLookComponentPresentationTransitionContext *v6;
  SXQuickLookComponentPresentationTransitionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXQuickLookComponentPresentationTransitionContext;
  v6 = -[SXQuickLookComponentPresentationTransitionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_file, a3);

  return v7;
}

- (SXQuickLookFile)file
{
  return self->_file;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
}

@end
