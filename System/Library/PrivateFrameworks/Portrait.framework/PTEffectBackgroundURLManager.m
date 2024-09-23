@implementation PTEffectBackgroundURLManager

- (PTEffectBackgroundURLManager)init
{
  return -[PTEffectBackgroundURLManager initWithUserBackgrounds:](self, "initWithUserBackgrounds:", 1);
}

- (PTEffectBackgroundURLManager)initWithUserBackgrounds:(BOOL)a3
{
  PTEffectBackgroundURLManager *v3;
  PTEffectBackgroundURLManager *v4;
  PTEffectBackgroundURLManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTEffectBackgroundURLManager;
  v3 = -[PTEffectBackgroundURLManager init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)loadUserBackgroundWithPath:(id)a3
{
  id v5;
  NSURL *userBackgroundDirectory;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSURL *v11;
  NSURL *userBackgroundPList;
  void *v13;
  void *v14;
  void *v15;
  NSURL *v16;
  NSURL *userBackgroundDirectoryImages;
  void *v18;
  void *v19;
  void *v20;
  NSURL *v21;
  NSURL *userBackgroundDirectoryThumbnails;
  NSURL *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSFileManager *fileManager;
  void *v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSFileManager *v36;
  void *v37;
  BOOL v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  PTPixelBufferUtil *v43;
  PTPixelBufferUtil *pixelBufferUtil;
  NSObject *v45;
  id v46;
  id v47;
  unsigned __int8 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[4];
  uint64_t v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  NSObject *v58;
  _BYTE v59[128];
  _QWORD v60[4];

  v60[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_userBackgroundDirectory, a3);
  userBackgroundDirectory = self->_userBackgroundDirectory;
  if (userBackgroundDirectory)
  {
    -[NSURL path](userBackgroundDirectory, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v46 = v5;
      v8 = (void *)MEMORY[0x1E0C99E98];
      -[NSURL path](self->_userBackgroundDirectory, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("content.plist"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fileURLWithPath:", v10);
      v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
      userBackgroundPList = self->_userBackgroundPList;
      self->_userBackgroundPList = v11;

      v13 = (void *)MEMORY[0x1E0C99E98];
      -[NSURL path](self->_userBackgroundDirectory, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("images"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fileURLWithPath:", v15);
      v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
      userBackgroundDirectoryImages = self->_userBackgroundDirectoryImages;
      self->_userBackgroundDirectoryImages = v16;

      v18 = (void *)MEMORY[0x1E0C99E98];
      -[NSURL path](self->_userBackgroundDirectory, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("thumbnails"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fileURLWithPath:", v20);
      v21 = (NSURL *)objc_claimAutoreleasedReturnValue();
      userBackgroundDirectoryThumbnails = self->_userBackgroundDirectoryThumbnails;
      self->_userBackgroundDirectoryThumbnails = v21;

      v23 = self->_userBackgroundDirectoryThumbnails;
      v60[0] = self->_userBackgroundDirectoryImages;
      v60[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (!v25)
        goto LABEL_24;
      v26 = v25;
      v27 = *(_QWORD *)v50;
      while (1)
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v50 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v28);
          v48 = 0;
          fileManager = self->_fileManager;
          objc_msgSend(v29, "path");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(fileManager) = -[NSFileManager fileExistsAtPath:isDirectory:](fileManager, "fileExistsAtPath:isDirectory:", v31, &v48);

          if ((fileManager & 1) == 0)
          {
            v36 = self->_fileManager;
            objc_msgSend(v29, "path");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 0;
            v38 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v36, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v37, 1, 0, &v47);
            v34 = v47;

            _PTLogSystem();
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = v39;
            if (v38)
            {
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v29, "path");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v56 = v41;
                _os_log_impl(&dword_1C9281000, v40, OS_LOG_TYPE_INFO, "Created %@", buf, 0xCu);
                goto LABEL_15;
              }
            }
            else if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v29, "path");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v56 = v41;
              v57 = 2112;
              v58 = v34;
              _os_log_error_impl(&dword_1C9281000, v40, OS_LOG_TYPE_ERROR, "Error creating directory %@ error %@", buf, 0x16u);
LABEL_15:

            }
            goto LABEL_20;
          }
          v32 = v48;
          _PTLogSystem();
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v32)
          {
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v29, "path");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v56 = v35;
              _os_log_impl(&dword_1C9281000, v34, OS_LOG_TYPE_INFO, "Found background replacement directory %@", buf, 0xCu);

            }
          }
          else if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            -[PTEffectBackgroundURLManager loadUserBackgroundWithPath:].cold.2(v53, v29, &v54, v34);
          }
LABEL_20:

          ++v28;
        }
        while (v26 != v28);
        v42 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        v26 = v42;
        if (!v42)
        {
LABEL_24:

          v43 = (PTPixelBufferUtil *)objc_opt_new();
          pixelBufferUtil = self->_pixelBufferUtil;
          self->_pixelBufferUtil = v43;

          v5 = v46;
          goto LABEL_28;
        }
      }
    }
  }
  _PTLogSystem();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    -[PTEffectBackgroundURLManager loadUserBackgroundWithPath:].cold.1();

  self->_loadCustomBackgrounds = 0;
LABEL_28:

}

- (id)asyncWorkerQueue
{
  OS_dispatch_queue *asyncWorkerQueue;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;

  asyncWorkerQueue = self->_asyncWorkerQueue;
  if (!asyncWorkerQueue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.portrait.PTEffectBackgroundURLManager", 0);
    v5 = self->_asyncWorkerQueue;
    self->_asyncWorkerQueue = v4;

    asyncWorkerQueue = self->_asyncWorkerQueue;
  }
  return asyncWorkerQueue;
}

- (id)createBuiltInBackgroundURLsWithFiles:(id)a3 extension:(id)a4 subdirectory:(id)a5
{
  void *v5;
  NSObject *v6;
  void *v7;

  v5 = (void *)objc_opt_new();
  _PTLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:].cold.1();

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

- (id)backgroundsWithType:(int64_t)a3
{
  NSObject *v3;

  _PTLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:].cold.1();

  return 0;
}

- (id)makeUniqueFilename
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.heic"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)hasUserBackground:(id)a3 completion:(id)a4
{
  -[PTEffectBackgroundURLManager hasUserBackgroundWithPixelBuffer:ciImage:completion:](self, "hasUserBackgroundWithPixelBuffer:ciImage:completion:", a3, 0, a4);
}

- (void)hasUserBackgroundWithImage:(id)a3 completion:(id)a4
{
  -[PTEffectBackgroundURLManager hasUserBackgroundWithPixelBuffer:ciImage:completion:](self, "hasUserBackgroundWithPixelBuffer:ciImage:completion:", 0, a3, a4);
}

- (void)hasUserBackgroundWithPixelBuffer:(id)a3 ciImage:(id)a4 completion:(id)a5
{
  NSObject *v5;

  _PTLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:].cold.1();

}

- (void)addUserBackground:(id)a3 ciImage:(id)a4 backgroundToReplace:(id)a5 withOptions:(id)a6 completion:(id)a7
{
  NSObject *v7;

  _PTLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:].cold.1();

}

- (void)addUserBackground:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  -[PTEffectBackgroundURLManager addUserBackground:ciImage:backgroundToReplace:withOptions:completion:](self, "addUserBackground:ciImage:backgroundToReplace:withOptions:completion:", a3, 0, 0, a4, a5);
}

- (void)addUserBackgroundWithImage:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  -[PTEffectBackgroundURLManager addUserBackground:ciImage:backgroundToReplace:withOptions:completion:](self, "addUserBackground:ciImage:backgroundToReplace:withOptions:completion:", 0, a3, 0, a4, a5);
}

- (void)replaceUserBackground:(id)a3 withBackground:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  -[PTEffectBackgroundURLManager addUserBackground:ciImage:backgroundToReplace:withOptions:completion:](self, "addUserBackground:ciImage:backgroundToReplace:withOptions:completion:", a4, 0, a3, a5, a6);
}

- (void)replaceUserBackground:(id)a3 withImage:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  -[PTEffectBackgroundURLManager addUserBackground:ciImage:backgroundToReplace:withOptions:completion:](self, "addUserBackground:ciImage:backgroundToReplace:withOptions:completion:", 0, a4, a3, a5, a6);
}

- (void)removeUserBackground:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  NSObject *v5;

  _PTLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:].cold.1();

}

+ (CGSize)findSize:(CGSize)a3 maxSize:(CGSize)a4
{
  double v4;
  float v5;
  double v6;
  float v7;
  double height;
  double v10;
  double v11;
  CGSize result;

  v4 = a3.width / a4.width;
  v5 = a3.width / a4.width;
  v6 = a3.height / a4.height;
  v7 = a3.height / a4.height;
  if (v5 > 1.0 || v7 > 1.0)
  {
    if (v5 >= 1.0)
    {
      if (v7 >= 1.0)
      {
        a3 = a4;
      }
      else
      {
        if (a4.width * v6 < a4.width)
          a4.width = a4.width * v6;
        if (a4.width < a3.width)
          a3.width = a4.width;
      }
    }
    else
    {
      height = a4.height * v4;
      if (a4.height * v4 >= a4.height)
        height = a4.height;
      if (height < a3.height)
        a3.height = height;
    }
  }
  v10 = floor(a3.width);
  v11 = floor(a3.height);
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)copyAsFullsizeAndThumbnailFromPixelBuffer:(__CVBuffer *)a3 outputPathFullsize:(id)a4 outputPathThumbnail:(id)a5
{
  NSObject *v5;

  _PTLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:].cold.1();

  return 0;
}

- (id)arrayToPlist:(id)a3
{
  __CFString *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id obj;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v27[0] = CFSTR("fullsize");
        objc_msgSend(v9, "fullsizeURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v11;
        v27[1] = CFSTR("thumbnail");
        objc_msgSend(v9, "thumbnailURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v28[1] = v13;
        v27[2] = CFSTR("inputBufferChecksum");
        objc_msgSend(v9, "inputBufferChecksum");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v9, "inputBufferChecksum");
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v15 = v3;
        }
        else
        {
          v15 = &stru_1E822B200;
        }
        v28[2] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v16);

        if (v14)
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v6);
  }

  v25 = CFSTR("content");
  v26 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)plistToArray:(id)a3
{
  NSObject *v3;

  _PTLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:].cold.1();

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferUtil, 0);
  objc_storeStrong((id *)&self->_asyncWorkerQueue, 0);
  objc_storeStrong((id *)&self->_userBackgroundDirectoryThumbnails, 0);
  objc_storeStrong((id *)&self->_userBackgroundDirectoryImages, 0);
  objc_storeStrong((id *)&self->_userBackgroundPList, 0);
  objc_storeStrong((id *)&self->_userBackgroundDirectory, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_backgroundGradient, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

- (void)loadUserBackgroundWithPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Error loading secure container", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)loadUserBackgroundWithPath:(_QWORD *)a3 .cold.2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1C9281000, a4, OS_LOG_TYPE_ERROR, "%@ is not a directory", a1, 0xCu);

}

- (void)createBuiltInBackgroundURLsWithFiles:extension:subdirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end
