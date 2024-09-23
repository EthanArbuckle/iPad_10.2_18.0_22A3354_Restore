@implementation ICPillOrnamentViewController

- (ICPillOrnamentViewController)initWithRootViewController:(id)a3 contentAnchorPoint:(CGPoint)a4 sceneAnchorPoint:(CGPoint)a5 offset:(CGPoint)a6 cornerRadius:(double)a7
{
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v16;
  ICPillOrnamentViewController *v17;
  ICPillOrnamentViewController *v18;
  UIView *v19;
  UIView *contentView;
  objc_super v22;

  y = a6.y;
  x = a6.x;
  v10 = a5.y;
  v11 = a5.x;
  v12 = a4.y;
  v13 = a4.x;
  v16 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICPillOrnamentViewController;
  v17 = -[ICPillOrnamentViewController init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rootViewController, a3);
    v18->_contentAnchorPoint.x = v13;
    v18->_contentAnchorPoint.y = v12;
    v18->_sceneAnchorPoint.x = v11;
    v18->_sceneAnchorPoint.y = v10;
    v18->_offset.x = x;
    v18->_offset.y = y;
    v18->_cornerRadius = a7;
    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v18->_contentView;
    v18->_contentView = v19;

  }
  return v18;
}

- (void)loadView
{
  id v3;

  -[ICPillOrnamentViewController contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICPillOrnamentViewController setView:](self, "setView:", v3);

}

- (BOOL)isShowing
{
  return 0;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICPillOrnamentViewController;
  -[ICPillOrnamentViewController setPreferredContentSize:](&v3, sel_setPreferredContentSize_, a3.width, a3.height);
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (CGPoint)contentAnchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentAnchorPoint.x;
  y = self->_contentAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContentAnchorPoint:(CGPoint)a3
{
  self->_contentAnchorPoint = a3;
}

- (CGPoint)sceneAnchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_sceneAnchorPoint.x;
  y = self->_sceneAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSceneAnchorPoint:(CGPoint)a3
{
  self->_sceneAnchorPoint = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end
