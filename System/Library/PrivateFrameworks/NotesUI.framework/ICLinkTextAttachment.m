@implementation ICLinkTextAttachment

- (ICLinkEditorDelegate)linkDelegate
{
  return (ICLinkEditorDelegate *)objc_loadWeakRetained((id *)&self->_linkDelegate);
}

- (void)setLinkDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_linkDelegate, a3);
}

- (ICLinkMenuDelegate)linkMenuDelegate
{
  return (ICLinkMenuDelegate *)objc_loadWeakRetained((id *)&self->_linkMenuDelegate);
}

- (void)setLinkMenuDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_linkMenuDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_linkMenuDelegate);
  objc_destroyWeak((id *)&self->_linkDelegate);
}

@end
