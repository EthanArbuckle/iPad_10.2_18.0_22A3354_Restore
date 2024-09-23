@implementation PXGHostingControllerProposedSize

- (PXGHostingControllerProposedSize)initWithReferenceSize:(CGSize)a3 hostingController:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  PXGHostingControllerProposedSize *v8;
  PXGHostingControllerProposedSize *v9;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXGHostingControllerProposedSize;
  v8 = -[PXGHostingControllerProposedSize init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_referenceSize.width = width;
    v8->_referenceSize.height = height;
    objc_storeWeak((id *)&v8->_hostingController, v7);
  }

  return v9;
}

- (void)willAccept
{
  id v3;

  -[PXGHostingControllerProposedSize hostingController](self, "hostingController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutQueue_skipFrameCount:forProposedSize:", 1, self);

}

- (BOOL)accept
{
  PXGHostingControllerProposedSize *v2;
  void *v3;

  v2 = self;
  -[PXGHostingControllerProposedSize hostingController](self, "hostingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGHostingControllerProposedSize setHostingController:](v2, "setHostingController:", 0);
  LOBYTE(v2) = objc_msgSend(v3, "layoutQueue_acceptSize:", v2);

  return (char)v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGSize v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGHostingControllerProposedSize referenceSize](self, "referenceSize");
  NSStringFromCGSize(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGHostingControllerProposedSize hostingController](self, "hostingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p referenceSize: %@ hostingController: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PXGHostingController)hostingController
{
  return (PXGHostingController *)objc_loadWeakRetained((id *)&self->_hostingController);
}

- (void)setHostingController:(id)a3
{
  objc_storeWeak((id *)&self->_hostingController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostingController);
}

@end
