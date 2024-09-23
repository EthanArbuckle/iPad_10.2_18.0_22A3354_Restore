@implementation UIStoryboardPreviewingSegueTemplateStorage

- (UIStoryboardPreviewingSegueTemplateStorage)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStoryboardPreviewingSegueTemplateStorage;
  return -[UIStoryboardPreviewingSegueTemplateStorage init](&v4, sel_init, a3);
}

- (UIView)sender
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sender);
}

- (void)setSender:(id)a3
{
  objc_storeWeak((id *)&self->_sender, a3);
}

- (UIStoryboardPreviewingSegueTemplate)previewTemplate
{
  return (UIStoryboardPreviewingSegueTemplate *)objc_loadWeakRetained((id *)&self->_previewTemplate);
}

- (void)setPreviewTemplate:(id)a3
{
  objc_storeWeak((id *)&self->_previewTemplate, a3);
}

- (UIStoryboardSegueTemplate)commitTemplate
{
  return (UIStoryboardSegueTemplate *)objc_loadWeakRetained((id *)&self->_commitTemplate);
}

- (void)setCommitTemplate:(id)a3
{
  objc_storeWeak((id *)&self->_commitTemplate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commitTemplate);
  objc_destroyWeak((id *)&self->_previewTemplate);
  objc_destroyWeak((id *)&self->_sender);
}

@end
