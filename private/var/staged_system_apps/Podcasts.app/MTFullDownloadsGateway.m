@implementation MTFullDownloadsGateway

- (MTFullDownloadsGateway)initWithDownloadManager:(id)a3
{
  id v4;
  MTFullDownloadsGateway *v5;
  MTFullDownloadsGateway *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTFullDownloadsGateway;
  v5 = -[MTFullDownloadsGateway init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MTFullDownloadsGateway setDownloadManager:](v5, "setDownloadManager:", v4);

  return v6;
}

- (void)setDownloadManager:(id)a3
{
  objc_storeStrong((id *)&self->_downloadManager, a3);
}

- (void)addEpisodeAutoDownloads:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTFullDownloadsGateway downloadManager](self, "downloadManager"));
  objc_msgSend(v8, "addEpisodeAutoDownloads:completion:", v7, v6);

}

- (id)cancelAllDownloadsUserInitiated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTFullDownloadsGateway downloadManager](self, "downloadManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cancelAllDownloadsUserInitiated:", v3));

  return v5;
}

- (void)cancelDownloadsForEpisodeUuid:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTFullDownloadsGateway downloadManager](self, "downloadManager"));
  objc_msgSend(v7, "cancelDownloadsForEpisodeUuid:userInitiated:", v6, v4);

}

- (void)downloadEpisode:(id)a3 isFromSaving:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTFullDownloadsGateway downloadManager](self, "downloadManager"));
  objc_msgSend(v7, "downloadEpisode:isFromSaving:", v6, v4);

}

- (id)episodeUuidForDownloadWithAdamID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFullDownloadsGateway downloadManager](self, "downloadManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "episodeUuidForDownloadWithAdamID:", v4));

  return v6;
}

- (void)removeDownload:(id)a3 shouldAllowAutomaticRedownloads:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[MTFullDownloadsGateway downloadManager](self, "downloadManager"));
  objc_msgSend(v10, "removeDownload:shouldAllowAutomaticRedownloads:completion:", v9, v5, v8);

}

- (void)restoreDownloadedEpisodes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTFullDownloadsGateway downloadManager](self, "downloadManager"));
  objc_msgSend(v8, "restoreDownloadedEpisodes:completion:", v7, v6);

}

- (BOOL)resumeOrPauseEpisodeDownloadWithUuid:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFullDownloadsGateway downloadManager](self, "downloadManager"));
  v6 = objc_msgSend(v5, "resumeOrPauseEpisodeDownloadWithUuid:", v4);

  return v6;
}

- (MTLegacyDownloadManagerProtocol)downloadManager
{
  return self->_downloadManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadManager, 0);
}

@end
