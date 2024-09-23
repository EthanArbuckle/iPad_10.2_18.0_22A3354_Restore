@implementation MTLegacyDownloadListener

- (MTLegacyDownloadListener)initWithDelegate:(id)a3
{
  id v4;
  MTLegacyDownloadListener *v5;
  MTLegacyDownloadListener *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTLegacyDownloadListener;
  v5 = -[MTLegacyDownloadListener init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (MTLegacyDownloadManagerDelegate)delegate
{
  return (MTLegacyDownloadManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
