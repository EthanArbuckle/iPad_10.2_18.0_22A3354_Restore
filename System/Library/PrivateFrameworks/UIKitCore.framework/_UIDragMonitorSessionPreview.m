@implementation _UIDragMonitorSessionPreview

- (_UIDragMonitorSessionPreview)initWithImageComponent:(id)a3 preview:(id)a4
{
  id v7;
  id v8;
  _UIDragMonitorSessionPreview *v9;
  _UIDragMonitorSessionPreview *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIDragMonitorSessionPreview;
  v9 = -[_UIDragMonitorSessionPreview init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageComponent, a3);
    objc_storeStrong((id *)&v10->_preview, a4);
  }

  return v10;
}

- (UIImage)previewImage
{
  void *v3;
  void *v4;
  void *v5;

  -[_UIDragMonitorSessionPreview imageComponent](self, "imageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createSnapshotViewForPreview:", self->_preview);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _UIRenderViewImageAfterCommit(v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v5;
}

- (CGSize)previewScaledSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_UIDragMonitorSessionPreview preview](self, "preview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)previewContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_UIDragMonitorSessionPreview preview](self, "preview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGPoint)previewContentOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[_UIDragMonitorSessionPreview preview](self, "preview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (UIBezierPath)outline
{
  void *v2;
  void *v3;

  -[_UIDragMonitorSessionPreview preview](self, "preview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBezierPath *)v3;
}

- (_DUIImageComponent)imageComponent
{
  return self->_imageComponent;
}

- (void)setImageComponent:(id)a3
{
  objc_storeStrong((id *)&self->_imageComponent, a3);
}

- (_DUIPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
  objc_storeStrong((id *)&self->_preview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_imageComponent, 0);
}

@end
