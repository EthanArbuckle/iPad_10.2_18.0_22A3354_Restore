@implementation UIZoomTransitionAlignmentRectContext

+ (id)_contextSourceView:(id)a3 zoomedViewController:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (_QWORD *)objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v5;
  v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (UIViewController)zoomedViewController
{
  return self->_zoomedViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomedViewController, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end
