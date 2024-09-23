@implementation BKAudiobookPlayerDataSource

- (void)setDelegate:(id)a3
{
  id v4;
  BKAudiobookPlayerDataSourceDelegate **p_delegate;
  id WeakRetained;
  id v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained != v4)
  {
    v7 = BKAudiobooksStreamingLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Data source delegate changed to %@.", (uint8_t *)&v9, 0xCu);
    }

    objc_storeWeak((id *)p_delegate, v4);
  }

}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  unsigned int v16;
  void *v17;
  char v18;
  _BOOL4 v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  int v26;
  id v27;
  __int16 v28;
  _BOOL4 v29;

  v5 = a4;
  v6 = BKAudiobooksStreamingLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412290;
    v27 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "AVAsset requested %@", (uint8_t *)&v26, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathExtension"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lowercaseString"));

  if (objc_msgSend(v12, "bk_isPlaylistExtension"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayerDataSource delegate](self, "delegate"));
    v14 = objc_opt_respondsToSelector(v13, "playerDataSource:shouldWaitForLoadingOfRequestedPlaylist:fileName:");

    if ((v14 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayerDataSource delegate](self, "delegate"));
      v16 = objc_msgSend(v15, "playerDataSource:shouldWaitForLoadingOfRequestedPlaylist:fileName:", self, v5, v10);
LABEL_9:
      v19 = v16;
LABEL_14:

      goto LABEL_16;
    }
  }
  else if (objc_msgSend(v12, "bk_isAudioFileExtension"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayerDataSource delegate](self, "delegate"));
    v18 = objc_opt_respondsToSelector(v17, "playerDataSource:shouldWaitForLoadingOfRequestedAudioFile:fileName:");

    if ((v18 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayerDataSource delegate](self, "delegate"));
      v16 = objc_msgSend(v15, "playerDataSource:shouldWaitForLoadingOfRequestedAudioFile:fileName:", self, v5, v10);
      goto LABEL_9;
    }
  }
  else if (ICSecureKeyDeliveryRequestSupportsAssetResourceLoadingRequest(v5))
  {
    v20 = BKAudiobooksStreamingLog();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412290;
      v27 = v10;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "AVAsset requested skd file '%@'.", (uint8_t *)&v26, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayerDataSource delegate](self, "delegate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mediaItem"));
    v19 = -[BKAudiobookPlayerDataSource _fetchKeysForMediaItem:loadingRequest:](self, "_fetchKeysForMediaItem:loadingRequest:", v22, v5);

    goto LABEL_14;
  }
  v19 = 0;
LABEL_16:
  v23 = BKAudiobooksStreamingLog();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412546;
    v27 = v10;
    v28 = 1024;
    v29 = v19;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "AVAsset request of '%@' wait for loading? %d", (uint8_t *)&v26, 0x12u);
  }

  return v19;
}

- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  id v12;

  v5 = a4;
  v6 = BKAudiobooksStreamingLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "AVAsset cancelled request %@", (uint8_t *)&v11, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayerDataSource delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "playerDataSource:didCancelLoadingRequest:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayerDataSource delegate](self, "delegate"));
    objc_msgSend(v10, "playerDataSource:didCancelLoadingRequest:", self, v5);

  }
}

- (BOOL)_fetchKeysForMediaItem:(id)a3 loadingRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BLHLSKeyFetcher sharedInstance](BLHLSKeyFetcher, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_CE2C;
  v14[3] = &unk_38CF8;
  v15 = v6;
  v11 = v6;
  v12 = objc_msgSend(v10, "fetchOfflineKeyForMediaItem:identity:completion:", v5, v9, v14);

  return 1;
}

- (BKAudiobookPlayerDataSourceDelegate)delegate
{
  return (BKAudiobookPlayerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
