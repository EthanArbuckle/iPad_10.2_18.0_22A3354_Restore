@implementation PLStreamShareSource

- (id)serializedDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLStreamShareSource mediaData](self, "mediaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLStreamShareSource mediaData](self, "mediaData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("SerializedDataKey"));

  }
  -[PLStreamShareSource mediaURL](self, "mediaURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("SerializedURLKey"));

    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PLGetSandboxExtensionToken();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("SerializedSandboxExtensionTokenKey"));

  }
  -[PLStreamShareSource fileExtension](self, "fileExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PLStreamShareSource fileExtension](self, "fileExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("SerializedFileExtensionKey"));

  }
  -[PLStreamShareSource videoComplement](self, "videoComplement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "propertyListRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("SerializedVideoComplementKey"));
    objc_msgSend(v14, "imagePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PLGetSandboxExtensionToken();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("SerializedVideoComplementImageSandboxExtensionTokenKey"));

    objc_msgSend(v14, "videoPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PLGetSandboxExtensionToken();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("SerializedVideoComplementVideoSandboxExtensionTokenKey"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PLStreamShareSource mediaType](self, "mediaType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("SerializedMediaTypeKey"));

  return v3;
}

- (PLStreamShareSource)initWithDictionary:(id)a3
{
  id v4;
  PLStreamShareSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PLSandboxedURL *sandboxedVideoComplementImageURL;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PLSandboxedURL *sandboxedVideoComplementVideoURL;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  PLSandboxedURL *sandboxedMediaURL;
  PLStreamShareSource *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PLStreamShareSource;
  v5 = -[PLStreamShareSource init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SerializedFileExtensionKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLStreamShareSource setFileExtension:](v5, "setFileExtension:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SerializedDataKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLStreamShareSource setMediaData:](v5, "setMediaData:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SerializedMediaTypeKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLStreamShareSource setMediaType:](v5, "setMediaType:", objc_msgSend(v8, "integerValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SerializedVideoComplementKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithPropertyList:", v9);
      -[PLStreamShareSource setVideoComplement:](v5, "setVideoComplement:", v10);
      v11 = objc_alloc(MEMORY[0x1E0D732D0]);
      objc_msgSend(v10, "imagePath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SerializedVideoComplementImageSandboxExtensionTokenKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "initFileURLWithPath:sandboxExtensionToken:consume:", v12, v13, 1);
      sandboxedVideoComplementImageURL = v5->_sandboxedVideoComplementImageURL;
      v5->_sandboxedVideoComplementImageURL = (PLSandboxedURL *)v14;

      v16 = objc_alloc(MEMORY[0x1E0D732D0]);
      objc_msgSend(v10, "videoPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SerializedVideoComplementVideoSandboxExtensionTokenKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "initFileURLWithPath:sandboxExtensionToken:consume:", v17, v18, 1);
      sandboxedVideoComplementVideoURL = v5->_sandboxedVideoComplementVideoURL;
      v5->_sandboxedVideoComplementVideoURL = (PLSandboxedURL *)v19;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SerializedURLKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLStreamShareSource setMediaURL:](v5, "setMediaURL:", v22);

      v23 = objc_alloc(MEMORY[0x1E0D732D0]);
      -[PLStreamShareSource mediaURL](v5, "mediaURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SerializedSandboxExtensionTokenKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v23, "initWithURL:sandboxExtensionToken:consume:", v24, v25, 1);
      sandboxedMediaURL = v5->_sandboxedMediaURL;
      v5->_sandboxedMediaURL = (PLSandboxedURL *)v26;

    }
    v28 = v5;

  }
  return v5;
}

- (void)setMediaURL:(id)a3
{
  NSURL *v5;
  NSURL *mediaURL;
  NSURL *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSURL *v13;

  v5 = (NSURL *)a3;
  mediaURL = self->_mediaURL;
  if (mediaURL != v5)
  {
    v13 = v5;
    v7 = mediaURL;
    objc_storeStrong((id *)&self->_mediaURL, a3);
    -[NSURL path](v7, "path");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[NSURL path](v7, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL path](v13, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if ((v12 & 1) == 0)
        -[PLStreamShareSource _cleanupIfNeededMediaAtURL:](self, "_cleanupIfNeededMediaAtURL:", v7);
    }

    v5 = v13;
  }

}

- (void)_cleanupIfNeededMediaAtURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSURL *mediaURL;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "temporaryDragAndDropDirectoryCreateIfNeeded:error:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "hasPrefix:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    mediaURL = self->_mediaURL;
    v13 = 0;
    v10 = objc_msgSend(v8, "removeItemAtURL:error:", mediaURL, &v13);
    v11 = v13;

    if ((v10 & 1) == 0)
    {
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v11;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Cleanup failed with error %@.", buf, 0xCu);
      }

    }
  }
}

- (void)cleanupResources
{
  -[PLStreamShareSource _cleanupIfNeededMediaAtURL:](self, "_cleanupIfNeededMediaAtURL:", self->_mediaURL);
}

- (id)photoLibrary
{
  return +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
}

- (NSData)mediaData
{
  return self->_mediaData;
}

- (void)setMediaData:(id)a3
{
  objc_storeStrong((id *)&self->_mediaData, a3);
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (void)setFileExtension:(id)a3
{
  objc_storeStrong((id *)&self->_fileExtension, a3);
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (PFVideoComplement)videoComplement
{
  return self->_videoComplement;
}

- (void)setVideoComplement:(id)a3
{
  objc_storeStrong((id *)&self->_videoComplement, a3);
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoComplement, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_mediaData, 0);
  objc_storeStrong((id *)&self->_sandboxedVideoComplementVideoURL, 0);
  objc_storeStrong((id *)&self->_sandboxedVideoComplementImageURL, 0);
  objc_storeStrong((id *)&self->_sandboxedMediaURL, 0);
}

@end
