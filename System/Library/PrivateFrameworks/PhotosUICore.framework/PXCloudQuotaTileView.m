@implementation PXCloudQuotaTileView

- (PXCloudQuotaTileView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaTileView.m"), 37, CFSTR("%s is not available as initializer"), "-[PXCloudQuotaTileView init]");

  abort();
}

- (PXCloudQuotaTileView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaTileView.m"), 41, CFSTR("%s is not available as initializer"), "-[PXCloudQuotaTileView initWithFrame:]");

  abort();
}

- (PXCloudQuotaTileView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaTileView.m"), 45, CFSTR("%s is not available as initializer"), "-[PXCloudQuotaTileView initWithCoder:]");

  abort();
}

- (PXCloudQuotaTileView)initWithContentView:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaTileView.m"), 49, CFSTR("%s is not available as initializer"), "-[PXCloudQuotaTileView initWithContentView:]");

  abort();
}

- (PXCloudQuotaTileView)initWithTileView:(id)a3
{
  id v6;
  PXCloudQuotaTileView *v7;
  PXCloudQuotaTileView *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaTileView.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileView"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXCloudQuotaTileView;
  v7 = -[PXCloudQuotaView initWithContentView:](&v11, sel_initWithContentView_, v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_tileView, a3);

  return v8;
}

- (id)contentViewFont
{
  return (id)-[ICQTileView font](self->_tileView, "font");
}

- (CGSize)contentViewSizeForWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  LODWORD(v3) = 1144750080;
  LODWORD(v4) = 1132068864;
  -[ICQTileView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_tileView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileView, 0);
}

@end
