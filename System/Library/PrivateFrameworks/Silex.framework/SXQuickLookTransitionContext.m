@implementation SXQuickLookTransitionContext

- (SXQuickLookTransitionContext)initWithOriginView:(id)a3
{
  id v5;
  SXQuickLookTransitionContext *v6;
  SXQuickLookTransitionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXQuickLookTransitionContext;
  v6 = -[SXQuickLookTransitionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_originView, a3);

  return v7;
}

- (UIView)originView
{
  return self->_originView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originView, 0);
}

@end
