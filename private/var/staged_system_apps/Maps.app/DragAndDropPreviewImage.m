@implementation DragAndDropPreviewImage

- (UIDragPreview)dragPreview
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v3 = objc_alloc_init((Class)UIDragPreviewParameters);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreviewImage visiblePath](self, "visiblePath"));
  objc_msgSend(v3, "setVisiblePath:", v4);

  v5 = objc_alloc((Class)UIImageView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreviewImage image](self, "image"));
  v7 = objc_msgSend(v5, "initWithImage:", v6);

  v8 = objc_msgSend(objc_alloc((Class)UIDragPreview), "initWithView:parameters:", v7, v3);
  return (UIDragPreview *)v8;
}

- (id)targetedDragPreviewWithTarget:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = objc_alloc_init((Class)UIDragPreviewParameters);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreviewImage visiblePath](self, "visiblePath"));
  objc_msgSend(v5, "setVisiblePath:", v6);

  v7 = objc_alloc((Class)UIImageView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreviewImage image](self, "image"));
  v9 = objc_msgSend(v7, "initWithImage:", v8);

  v10 = objc_msgSend(objc_alloc((Class)UITargetedDragPreview), "initWithView:parameters:target:", v9, v5, v4);
  return v10;
}

- (BOOL)nightMode
{
  return self->_nightMode;
}

- (void)setNightMode:(BOOL)a3
{
  self->_nightMode = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIBezierPath)visiblePath
{
  return self->_visiblePath;
}

- (void)setVisiblePath:(id)a3
{
  objc_storeStrong((id *)&self->_visiblePath, a3);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visiblePath, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
