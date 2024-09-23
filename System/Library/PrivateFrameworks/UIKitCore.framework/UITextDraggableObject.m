@implementation UITextDraggableObject

+ (id)draggableObjectWithItemProvider:(id)a3 fromRange:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setItemProvider:", v6);

  objc_msgSend(v7, "setRange:", v5);
  return v7;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (UITextRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
  objc_storeStrong((id *)&self->_range, a3);
}

- (id)targetedPreviewProvider
{
  return self->_targetedPreviewProvider;
}

- (void)setTargetedPreviewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)previewProvider
{
  return self->_previewProvider;
}

- (void)setPreviewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previewProvider, 0);
  objc_storeStrong(&self->_targetedPreviewProvider, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end
