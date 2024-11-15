@implementation MTLegacyDownloadManagerProvider

- (MTLegacyDownloadManagerProtocol)downloads
{
  return self->_downloads;
}

- (void)setupWith:(id)a3 downloadsNotifier:(id)a4
{
  id v6;

  v6 = a4;
  -[MTLegacyDownloadManagerProvider setDownloads:](self, "setDownloads:", a3);
  -[MTLegacyDownloadManagerProvider setNotifier:](self, "setNotifier:", v6);

}

- (void)setNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_notifier, a3);
}

- (void)setDownloads:(id)a3
{
  objc_storeStrong((id *)&self->_downloads, a3);
}

- (MTLegacyDownloadNotifier)notifier
{
  return self->_notifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
}

@end
