@implementation UITextItemMenuPreview

+ (UITextItemMenuPreview)defaultPreview
{
  return (UITextItemMenuPreview *)objc_alloc_init((Class)a1);
}

- (UITextItemMenuPreview)initWithView:(UIView *)view
{
  UIView *v5;
  UITextItemMenuPreview *v6;
  UITextItemMenuPreview *v7;
  objc_super v9;

  v5 = view;
  v9.receiver = self;
  v9.super_class = (Class)UITextItemMenuPreview;
  v6 = -[UITextItemMenuPreview init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_previewView, view);

  return v7;
}

- (UIView)_previewView
{
  return self->_previewView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
}

@end
