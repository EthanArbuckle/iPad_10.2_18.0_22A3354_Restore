@implementation CuratedCollectionMediaIntegrationPlatterControl

- (CuratedCollectionMediaIntegrationPlatterControl)initWithFrame:(CGRect)a3
{
  CuratedCollectionMediaIntegrationPlatterControl *v3;
  CuratedCollectionMediaIntegrationPlatterControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionMediaIntegrationPlatterControl;
  v3 = -[CuratedCollectionMediaIntegrationPlatterControl initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CuratedCollectionMediaIntegrationPlatterControl setContextMenuInteractionEnabled:](v3, "setContextMenuInteractionEnabled:", 1);
    -[CuratedCollectionMediaIntegrationPlatterControl setShowsMenuAsPrimaryAction:](v4, "setShowsMenuAsPrimaryAction:", 1);
  }
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationPlatterControl interactionDelegate](self, "interactionDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaIntegrationMenuConfigurationWithInteraction:", v5));

  return v7;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationPlatterControl interactionDelegate](self, "interactionDelegate"));
  objc_msgSend(v5, "mediaIntegrationMenuAttachmentPointForConfiguration:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CuratedCollectionMediaIntegrationPlatterControl;
  -[CuratedCollectionMediaIntegrationPlatterControl contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v7, "contextMenuInteraction:willDisplayMenuForConfiguration:animator:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationPlatterControl interactionDelegate](self, "interactionDelegate"));
  objc_msgSend(v6, "mediaIntegrationMenuWillAppear");

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CuratedCollectionMediaIntegrationPlatterControl;
  -[CuratedCollectionMediaIntegrationPlatterControl contextMenuInteraction:willEndForConfiguration:animator:](&v7, "contextMenuInteraction:willEndForConfiguration:animator:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionMediaIntegrationPlatterControl interactionDelegate](self, "interactionDelegate"));
  objc_msgSend(v6, "mediaIntegrationMenuWillDisappear");

}

- (CuratedCollectionMediaIntegrationInteractionDelegate)interactionDelegate
{
  return (CuratedCollectionMediaIntegrationInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactionDelegate);
}

@end
