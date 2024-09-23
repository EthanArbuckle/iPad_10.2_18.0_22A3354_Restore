@implementation PUCurationImportSourceAssetBrowserDebugViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCurationImportSourceAssetBrowserDebugViewController;
  -[PUPhotosAlbumViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PUCurationImportSourceAssetBrowserDebugViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftItemsSupplementBackButton:", 1);

}

- (NSString)importSourceName
{
  return self->_importSourceName;
}

- (void)setImportSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1800);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importSourceName, 0);
}

@end
