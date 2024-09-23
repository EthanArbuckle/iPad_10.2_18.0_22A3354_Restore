@implementation TSDMovieCompatibilityChecker

- (TSDMovieCompatibilityChecker)initWithAsset:(id)a3
{
  void *v5;
  uint64_t v6;
  TSDMovieCompatibilityChecker *v7;
  objc_super v9;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieCompatibilityChecker initWithAsset:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieCompatibilityChecker.m"), 60, CFSTR("invalid nil value for '%s'"), "asset");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDMovieCompatibilityChecker;
  v7 = -[TSDMovieCompatibilityChecker init](&v9, sel_init);
  if (v7)
    v7->mAsset = (AVAsset *)a3;
  return v7;
}

- (TSDMovieCompatibilityChecker)init
{
  return -[TSDMovieCompatibilityChecker initWithAsset:](self, "initWithAsset:", 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMovieCompatibilityChecker;
  -[TSDMovieCompatibilityChecker dealloc](&v3, sel_dealloc);
}

- (void)checkCompatibilityUpToLevel:(int64_t)a3 completionHandler:(id)a4
{
  void *v7;
  uint64_t v8;
  AVAsset *mAsset;
  _QWORD v10[7];

  if (a3 <= 1)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieCompatibilityChecker.m"), 87, CFSTR("Invalid parameter not satisfying: %s"), "maxDesiredCompatibilityLevel > TSDMovieCompatibilityLevelNone");
  }
  mAsset = self->mAsset;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__TSDMovieCompatibilityChecker_checkCompatibilityUpToLevel_completionHandler___block_invoke;
  v10[3] = &unk_24D82CAF0;
  v10[5] = a4;
  v10[6] = a3;
  v10[4] = self;
  -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](mAsset, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24D8FA2D8, v10);
}

void __78__TSDMovieCompatibilityChecker_checkCompatibilityUpToLevel_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[8];
  _QWORD v28[8];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v30 = 0;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statusOfValueForKey:error:", CFSTR("hasProtectedContent"), &v30);
  if (v2 == 2)
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "hasProtectedContent") & 1) != 0)
    {
      v4 = (void *)objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "applicationName");
      objc_opt_class();
      v5 = (void *)TSUDynamicCast();
      if (!v5)
      {
        v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:]_block_invoke");
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieCompatibilityChecker.m"), 112, CFSTR("invalid nil value for '%s'"), "URLAsset");
      }
      v8 = (void *)objc_msgSend(v5, "URL");
      v29 = 0;
      objc_msgSend(v8, "getResourceValue:forKey:error:", &v29, *MEMORY[0x24BDBCCC0], 0);
      if (!v29)
        v29 = objc_msgSend((id)objc_msgSend(v5, "URL"), "lastPathComponent");
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("Keynote")))
      {
        v9 = (void *)MEMORY[0x24BDD17C8];
        v10 = objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("The media file \\U201C%@\\U201D is copy protected. You don\\U2019t have permission to use it in Keynote."), &stru_24D82FEB0, CFSTR("TSDrawables"));
      }
      else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Numbers")))
      {
        v9 = (void *)MEMORY[0x24BDD17C8];
        v10 = objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("The media file \\U201C%@\\U201D is copy protected. You don\\U2019t have permission to use it in Numbers."), &stru_24D82FEB0, CFSTR("TSDrawables"));
      }
      else
      {
        if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Pages")))
        {
          v25 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:]_block_invoke");
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieCompatibilityChecker.m"), 130, CFSTR("Unknown application name!"));
          v20 = 0;
          goto LABEL_25;
        }
        v9 = (void *)MEMORY[0x24BDD17C8];
        v10 = objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("The media file \\U201C%@\\U201D is copy protected. You don\\U2019t have permission to use it in Pages."), &stru_24D82FEB0, CFSTR("TSDrawables"));
      }
      v20 = objc_msgSend(v9, "stringWithFormat:", v10, v29);
LABEL_25:
      v35 = *MEMORY[0x24BDD0FC8];
      v36[0] = v20;
      v21 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v22 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.iWork.TSDErrorDomainMovieCompatibility"), 99, v21);
      v3 = 0;
      v30 = v22;
      goto LABEL_3;
    }
    v32[3] = 1;
    v29 = 0;
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statusOfValueForKey:error:", CFSTR("playable"), &v29);
    if (v11 != 2)
    {
      if (v11 == 4)
      {
        v12 = v32[3];
        v13 = 1;
      }
      else
      {
        v12 = 0;
        v13 = 0;
        v32[3] = 0;
      }
      goto LABEL_29;
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isPlayable"))
    {
      v14 = v32;
      v12 = 2;
      v32[3] = 2;
      if (*(uint64_t *)(a1 + 48) < 3 || (v12 = 3, v14[3] = 3, v15 = *(_QWORD *)(a1 + 48), v15 < 4))
      {
        v13 = 0;
LABEL_29:
        objc_msgSend(*(id *)(a1 + 32), "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:didCancel:error:completionHandler:", *(_QWORD *)(a1 + 48), v12, v13, v29, *(_QWORD *)(a1 + 40));
        goto LABEL_4;
      }
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 8);
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __78__TSDMovieCompatibilityChecker_checkCompatibilityUpToLevel_completionHandler___block_invoke_2;
      v28[3] = &unk_24D82CAC8;
      v28[4] = v16;
      v28[6] = &v31;
      v28[7] = v15;
      v18 = &unk_24D8FA2F0;
      v19 = v28;
    }
    else
    {
      v23 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v23 + 8);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __78__TSDMovieCompatibilityChecker_checkCompatibilityUpToLevel_completionHandler___block_invoke_3;
      v27[3] = &unk_24D82CAC8;
      v27[4] = v23;
      v24 = *(_QWORD *)(a1 + 48);
      v27[6] = &v31;
      v27[7] = v24;
      v18 = &unk_24D8FA308;
      v19 = v27;
    }
    v19[5] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v17, "loadValuesAsynchronouslyForKeys:completionHandler:", v18);
    goto LABEL_4;
  }
  v3 = v2 == 4;
LABEL_3:
  objc_msgSend(*(id *)(a1 + 32), "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:didCancel:error:completionHandler:", *(_QWORD *)(a1 + 48), v32[3], v3, v30, *(_QWORD *)(a1 + 40));
LABEL_4:
  _Block_object_dispose(&v31, 8);
}

uint64_t __78__TSDMovieCompatibilityChecker_checkCompatibilityUpToLevel_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v6 = 0;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statusOfValueForKey:error:", CFSTR("tracks"), &v6);
  if (v2 == 4)
  {
    v4 = 1;
  }
  else
  {
    v3 = 0;
    if (v2 == 2)
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "p_isLoadedAssetPlayableOnAllDevices"))
      {
        v4 = 0;
        return objc_msgSend(*(id *)(a1 + 32), "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:didCancel:error:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v4, v6, *(_QWORD *)(a1 + 40));
      }
      v3 = *(_QWORD *)(a1 + 56);
    }
    v4 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  }
  return objc_msgSend(*(id *)(a1 + 32), "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:didCancel:error:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v4, v6, *(_QWORD *)(a1 + 40));
}

uint64_t __78__TSDMovieCompatibilityChecker_checkCompatibilityUpToLevel_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = 0;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "statusOfValueForKey:error:", CFSTR("tracks"), &v5);
  if (v2 == 2)
    goto LABEL_5;
  if (v2 != 4)
  {
    v2 = 0;
LABEL_5:
    v3 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
    return objc_msgSend(*(id *)(a1 + 32), "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:didCancel:error:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v3, v5, *(_QWORD *)(a1 + 40));
  }
  v3 = 1;
  return objc_msgSend(*(id *)(a1 + 32), "p_didFinishCheckingCompatibilityUpToLevel:actualLevel:didCancel:error:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v3, v5, *(_QWORD *)(a1 + 40));
}

- (void)checkCustomCompatibilityWithVideoCodecTypes:(id)a3 maxPlayableVideoDimensions:(CGSize)a4 maxPlayableVideoPixelsPerFrame:(int)a5 completionHandler:(id)a6
{
  double height;
  double width;

  height = a4.height;
  width = a4.width;

  self->mCustomPlayableVideoCodecTypes = (NSSet *)objc_msgSend(a3, "copy");
  self->mCustomMaxPlayableVideoDimensions.width = (int)width;
  self->mCustomMaxPlayableVideoDimensions.height = (int)height;
  self->mCustomMaxPlayableVideoPixelsPerFrame = a5;
  -[TSDMovieCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:](self, "checkCompatibilityUpToLevel:completionHandler:", 5, a6);
}

- (void)p_didFinishCheckingCompatibilityUpToLevel:(int64_t)a3 actualLevel:(int64_t)a4 didCancel:(BOOL)a5 error:(id)a6 completionHandler:(id)a7
{
  id v8;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (a5)
    goto LABEL_16;
  v8 = a6;
  if (!a4 && a6)
  {
    if (objc_msgSend(a6, "code") != -11828)
    {
LABEL_11:
      a4 = 0;
      goto LABEL_12;
    }
    v11 = (void *)objc_msgSend(v8, "domain");
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDB1C58]);
    if (v12)
      v8 = 0;
    a4 = v12;
  }
  if (!v8 && !a4)
  {
    v15 = *MEMORY[0x24BDD0FC8];
    v16[0] = objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("This movie can\\U2019t be added."), &stru_24D82FEB0, CFSTR("TSDrawables"));
    v13 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v8 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.iWork.TSDErrorDomainMovieCompatibility"), 100, v13);
    goto LABEL_11;
  }
LABEL_12:
  if (a4 >= a3)
    v14 = a3;
  else
    v14 = a4;
  self->mCompatibilityLevel = v14;
  self->mError = (NSError *)objc_msgSend(v8, "copy");
LABEL_16:
  if (a7)
    (*((void (**)(id, SEL, int64_t, int64_t))a7 + 2))(a7, a2, a3, a4);
}

- (void)cancel
{
  -[AVAsset cancelLoading](self->mAsset, "cancelLoading");
}

- (BOOL)p_isLoadedAssetPlayableOnAllDevices
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSDMovieCompatibilityChecker p_assetHasSupportedFileTypeOnAllDevices](self, "p_assetHasSupportedFileTypeOnAllDevices");
  if (v3)
  {
    if (-[AVAsset statusOfValueForKey:error:](self->mAsset, "statusOfValueForKey:error:", CFSTR("tracks"), 0) != 2)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieCompatibilityChecker p_isLoadedAssetPlayableOnAllDevices]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieCompatibilityChecker.m"), 339, CFSTR("Asset tracks must be loaded"));
    }
    v6 = *MEMORY[0x24BDB1D50];
    v22 = *MEMORY[0x24BDB1CF0];
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDB1D50], *MEMORY[0x24BDB1CF0], *MEMORY[0x24BDB1CF8], *MEMORY[0x24BDB1D38], 0);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = -[AVAsset tracks](self->mAsset, "tracks");
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v23 = 0;
      v11 = 0;
      v21 = 0;
      v12 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v14, "isEnabled"))
          {
            v15 = (void *)objc_msgSend(v14, "mediaType");
            if (objc_msgSend(v7, "containsObject:", v15))
            {
              if (!objc_msgSend(v14, "isSelfContained")
                || !objc_msgSend((id)objc_msgSend(v14, "formatDescriptions"), "count"))
              {
                v16 = 0;
                goto LABEL_21;
              }
              if (objc_msgSend(v15, "isEqualToString:", v6))
              {
                v11 |= -[TSDMovieCompatibilityChecker p_isVideoTrackPlayableOnAllDevices:](self, "p_isVideoTrackPlayableOnAllDevices:", v14);
                BYTE4(v23) = 1;
              }
              else if (objc_msgSend(v15, "isEqualToString:", v22))
              {
                LODWORD(v23) = -[TSDMovieCompatibilityChecker p_isAudioTrackPlayableOnAllDevices:](self, "p_isAudioTrackPlayableOnAllDevices:", v14) | v23;
                v21 = 1;
              }
            }
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v10)
          continue;
        break;
      }
      v16 = 1;
LABEL_21:
      v18 = v23;
      v17 = BYTE4(v23);
      v19 = v21;
    }
    else
    {
      v17 = 0;
      LOBYTE(v11) = 0;
      v19 = 0;
      v18 = 0;
      v16 = 1;
    }
    LOBYTE(v3) = (v11 | ~v17) & (v18 | ~v19) & v16;
  }
  return v3;
}

- (BOOL)p_assetHasSupportedFileTypeOnAllDevices
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (v2)
  {
    v3 = (void *)objc_msgSend(v2, "URL");
    LODWORD(v2) = objc_msgSend(v3, "isFileURL");
    if ((_DWORD)v2)
    {
      v7 = 0;
      LODWORD(v2) = objc_msgSend(v3, "getResourceValue:forKey:error:", &v7, *MEMORY[0x24BDBCCF0], 0);
      if ((_DWORD)v2)
      {
        v4 = (void *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDB1C40], *MEMORY[0x24BDB1C30], *MEMORY[0x24BDB1C08], *MEMORY[0x24BDB1C00], CFSTR("public.3gpp"), CFSTR("public.3gpp2"), CFSTR("com.apple.itunes.audible"), *MEMORY[0x24BDC1710], *MEMORY[0x24BDB1BF0], *MEMORY[0x24BDB1BE8], *MEMORY[0x24BDB1C10], *MEMORY[0x24BDB1C50], CFSTR("public.au-audio"), *MEMORY[0x24BDC17E8], *MEMORY[0x24BDB1BF8], *MEMORY[0x24BDC17F0], CFSTR("public.mpeg-2-video"),
                       CFSTR("public.mp2"),
                       CFSTR("public.mpeg-2-transport-stream"),
                       CFSTR("public.avi"),
                       0);
        if ((objc_msgSend(v4, "containsObject:", v7) & 1) != 0)
        {
          LOBYTE(v2) = 1;
        }
        else
        {
          v5 = objc_msgSend(v3, "pathExtension");
          LOBYTE(v2) = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("mqv"), CFSTR("m4r"), CFSTR("m1a"), CFSTR("m2a"), CFSTR("mpa"), CFSTR("aac"), CFSTR("adts"), CFSTR("mod"), CFSTR("vob"), CFSTR("m2ts"), CFSTR("m2t"), CFSTR("mts"), 0), "containsObject:", v5);
        }
      }
    }
  }
  return (char)v2;
}

- (BOOL)p_isVideoTrackPlayableOnAllDevices:(id)a3
{
  NSSet *mCustomPlayableVideoCodecTypes;
  int32_t height;
  int32_t width;
  int mCustomMaxPlayableVideoPixelsPerFrame;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const opaqueCMFormatDescription *v13;
  uint64_t MediaSubType;
  CMVideoDimensions Dimensions;
  int v17;
  _BOOL4 v18;
  BOOL v19;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  mCustomPlayableVideoCodecTypes = self->mCustomPlayableVideoCodecTypes;
  if (mCustomPlayableVideoCodecTypes)
  {
    width = self->mCustomMaxPlayableVideoDimensions.width;
    height = self->mCustomMaxPlayableVideoDimensions.height;
    mCustomMaxPlayableVideoPixelsPerFrame = self->mCustomMaxPlayableVideoPixelsPerFrame;
  }
  else
  {
    mCustomPlayableVideoCodecTypes = (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24D8FACE0, &unk_24D8FACF8, &unk_24D8FAD10, &unk_24D8FAD28, &unk_24D8FAD40, &unk_24D8FAD58, &unk_24D8FAD70, &unk_24D8FAD88, 0);
    mCustomMaxPlayableVideoPixelsPerFrame = 921600;
    height = 1280;
    width = 1280;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_msgSend(a3, "formatDescriptions");
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    v21 = a3;
LABEL_6:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v11)
        objc_enumerationMutation(obj);
      v13 = *(const opaqueCMFormatDescription **)(*((_QWORD *)&v29 + 1) + 8 * v12);
      MediaSubType = CMFormatDescriptionGetMediaSubType(v13);
      if (!-[NSSet containsObject:](mCustomPlayableVideoCodecTypes, "containsObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", MediaSubType)))goto LABEL_36;
      Dimensions = CMVideoFormatDescriptionGetDimensions(v13);
      v17 = height < Dimensions.height || width < Dimensions.width;
      v18 = Dimensions.height * Dimensions.width > mCustomMaxPlayableVideoPixelsPerFrame;
      v19 = 1;
      if ((v17 & 1) != 0 || (v18 & ~v17 & 1) != 0)
        return !v19;
      if ((int)MediaSubType > 1748121138)
      {
        if ((_DWORD)MediaSubType == 1748121139)
        {
          if (!-[TSDMovieCompatibilityChecker p_isH263VideoFormatPlayableOnAllDevices:](self, "p_isH263VideoFormatPlayableOnAllDevices:", v13))goto LABEL_36;
        }
        else if ((_DWORD)MediaSubType == 1836070006
               && !-[TSDMovieCompatibilityChecker p_isMPEG4VideoFormatPlayableOnAllDevices:](self, "p_isMPEG4VideoFormatPlayableOnAllDevices:", v13))
        {
          goto LABEL_36;
        }
      }
      else if ((_DWORD)MediaSubType == 1398165811)
      {
        if (!-[TSDMovieCompatibilityChecker p_isSorenson3VideoFormatPlayableOnAllDevices:](self, "p_isSorenson3VideoFormatPlayableOnAllDevices:", v13))goto LABEL_36;
      }
      else if ((_DWORD)MediaSubType == 1635148593
             && !-[TSDMovieCompatibilityChecker p_isH264VideoFormatPlayableOnAllDevices:](self, "p_isH264VideoFormatPlayableOnAllDevices:", v13))
      {
        goto LABEL_36;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        a3 = v21;
        if (v10)
          goto LABEL_6;
        break;
      }
    }
  }
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  if (a3)
    objc_msgSend(a3, "preferredTransform");
  v23 = v26;
  v24 = v27;
  v25 = v28;
  if (!TSDIsTransformAxisAligned((double *)&v23))
  {
LABEL_36:
    v19 = 1;
    return !v19;
  }
  v23 = v26;
  v24 = v27;
  v25 = v28;
  v19 = TSDIsTransformFlipped((double *)&v23);
  return !v19;
}

- (BOOL)p_isSorenson3VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  CMVideoDimensions Dimensions;

  Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  return Dimensions.height * Dimensions.width < 76801;
}

- (BOOL)p_isH264VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  id Extension;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;

  Extension = -[TSDMovieCompatibilityChecker p_sampleDescriptionExtensionAtomDataFromVideoFormatDescription:forAtomType:](self, "p_sampleDescriptionExtensionAtomDataFromVideoFormatDescription:forAtomType:", a3, CFSTR("avcC"));
  if (Extension)
  {
    v5 = Extension;
    if ((unint64_t)objc_msgSend(Extension, "length") < 4
      || (v6 = objc_msgSend(v5, "bytes"), *(unsigned __int8 *)(v6 + 3) > 0x29u)
      || ((v7 = *(unsigned __int8 *)(v6 + 1) - 66, v8 = v7 > 0x22, v9 = (1 << v7) & 0x400000801, !v8)
        ? (v10 = v9 == 0)
        : (v10 = 1),
          v10))
    {
      LOBYTE(Extension) = 0;
    }
    else
    {
      Extension = (id)CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x24BDC54E0]);
      if (Extension)
        LOBYTE(Extension) = objc_msgSend(Extension, "integerValue") == 1;
    }
  }
  return (char)Extension;
}

- (BOOL)p_isMPEG4VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  char *v10;
  int v11;

  v3 = -[TSDMovieCompatibilityChecker p_sampleDescriptionExtensionAtomDataFromVideoFormatDescription:forAtomType:](self, "p_sampleDescriptionExtensionAtomDataFromVideoFormatDescription:forAtomType:", a3, CFSTR("esds"));
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "bytes");
    v6 = objc_msgSend(v4, "length");
    if (v6 < 5)
      goto LABEL_9;
    v7 = 0;
    while (*(_BYTE *)(v5 + v7)
         || *(_BYTE *)(v5 + v7 + 1)
         || *(_BYTE *)(v5 + v7 + 2) != 1
         || *(unsigned __int8 *)(v5 + v7 + 3) != 176)
    {
      if (++v7 + 4 >= v6)
        goto LABEL_9;
    }
    if (v7 + 4 >= v6)
    {
LABEL_9:
      LOBYTE(v3) = 0;
    }
    else
    {
      v8 = 0;
      v9 = *(unsigned __int8 *)(v5 + v7 + 4);
      v10 = &p_isMPEG4VideoFormatPlayableOnAllDevices__profileMaps;
      while (1)
      {
        v11 = *v10;
        v10 += 3;
        if (v11 == v9)
          break;
        LOBYTE(v3) = 0;
        if (++v8 == 15)
          return (char)v3;
      }
      LOBYTE(v3) = v8 < 0xB;
    }
  }
  return (char)v3;
}

- (BOOL)p_isH263VideoFormatPlayableOnAllDevices:(opaqueCMFormatDescription *)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  v3 = -[TSDMovieCompatibilityChecker p_sampleDescriptionExtensionAtomDataFromVideoFormatDescription:forAtomType:](self, "p_sampleDescriptionExtensionAtomDataFromVideoFormatDescription:forAtomType:", a3, CFSTR("d263"));
  if (v3)
  {
    v4 = v3;
    if ((unint64_t)objc_msgSend(v3, "length") < 7)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v5 = objc_msgSend(v4, "bytes");
      if (*(_BYTE *)(v5 + 6))
        v6 = 1;
      else
        v6 = *(unsigned __int8 *)(v5 + 5) >= 0x2Eu;
      LOBYTE(v3) = !v6;
    }
  }
  return (char)v3;
}

- (id)p_sampleDescriptionExtensionAtomDataFromVideoFormatDescription:(opaqueCMFormatDescription *)a3 forAtomType:(id)a4
{
  id result;
  void *v6;

  result = (id)CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x24BDC0B80]);
  if (result)
  {
    v6 = (void *)objc_msgSend(result, "objectForKeyedSubscript:", a4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      result = (id)objc_msgSend(v6, "count");
      if (result)
        return (id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v6;
      else
        return 0;
    }
  }
  return result;
}

- (BOOL)p_isAudioTrackPlayableOnAllDevices:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  const opaqueCMFormatDescription *v12;
  uint64_t MediaSubType;
  int v14;
  const AudioStreamBasicDescription *StreamBasicDescription;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", &unk_24D8FADA0, &unk_24D8FADB8, &unk_24D8FADD0, &unk_24D8FADE8, &unk_24D8FAE00, &unk_24D8FAE18, &unk_24D8FAE30, &unk_24D8FAE48, &unk_24D8FAE60, &unk_24D8FAE78, &unk_24D8FAE90, &unk_24D8FAEA8, &unk_24D8FAE48, &unk_24D8FAEC0, &unk_24D8FAED8, 0);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = a3;
  v6 = (void *)objc_msgSend(a3, "formatDescriptions");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(const opaqueCMFormatDescription **)(*((_QWORD *)&v19 + 1) + 8 * v11);
        MediaSubType = CMFormatDescriptionGetMediaSubType(v12);
        if ((v9 & 1) == 0
          && (v14 = MediaSubType,
              objc_msgSend(v4, "containsObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", MediaSubType)))&& (StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v12)) != 0&& StreamBasicDescription->mChannelsPerFrame <= 6&& StreamBasicDescription->mSampleRate <= 48000.0)
        {
          if (v14 == 1885430579 || v14 == 1633889587)
            v9 = objc_msgSend(v5, "isEnabled", StreamBasicDescription->mSampleRate);
          else
            v9 = 0;
        }
        else
        {
          v9 = 1;
        }
        ++v11;
      }
      while (v8 != v11);
      v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v8 = v17;
    }
    while (v17);
  }
  else
  {
    v9 = 0;
  }
  return v9 ^ 1;
}

- (int64_t)compatibilityLevel
{
  return self->mCompatibilityLevel;
}

- (NSError)error
{
  return self->mError;
}

@end
