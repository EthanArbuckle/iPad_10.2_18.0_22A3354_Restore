@implementation PLPhotoDCFFileGroup

- (PLPhotoDCFFileGroup)initWithName:(id)a3 number:(int)a4 directory:(id)a5
{
  uint64_t v6;
  id v9;
  PLPhotoDCFFileGroup *v10;
  PLPhotoDCFFileGroup *v11;
  uint64_t v12;
  NSString *directoryPath;
  NSString *preferredExtension;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *prebakedThumbnailPath;
  objc_super v20;

  v6 = *(_QWORD *)&a4;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PLPhotoDCFFileGroup;
  v10 = -[PLPhotoDCFObject initWithName:number:](&v20, sel_initWithName_number_, a3, v6);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_directory, a5);
    -[PLPhotoDCFDirectory fullPath](v11->_directory, "fullPath");
    v12 = objc_claimAutoreleasedReturnValue();
    directoryPath = v11->_directoryPath;
    v11->_directoryPath = (NSString *)v12;

    preferredExtension = v11->_preferredExtension;
    v11->_preferredExtension = (NSString *)CFSTR("JPG");

    -[PLPhotoDCFFileGroup pathForMetadata](v11, "pathForMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoDCFFileGroup prebakedThumbnailFilename](v11, "prebakedThumbnailFilename");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    prebakedThumbnailPath = v11->_prebakedThumbnailPath;
    v11->_prebakedThumbnailPath = (NSString *)v17;

  }
  return v11;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong(&self->_delegate, a3);
}

- (id)delegate
{
  return self->_delegate;
}

- (id)directory
{
  return self->_directory;
}

- (id)imageSourceTypeHint
{
  if (-[NSString isEqualToString:](self->_preferredExtension, "isEqualToString:", CFSTR("TIF")))
    return CFSTR("public.tiff");
  if (-[NSString isEqualToString:](self->_preferredExtension, "isEqualToString:", CFSTR("PNG")))
    return CFSTR("public.png");
  if (-[NSString isEqualToString:](self->_preferredExtension, "isEqualToString:", CFSTR("GIF")))
    return CFSTR("com.compuserve.gif");
  return CFSTR("public.jpeg");
}

- (unint64_t)hash
{
  void *v3;

  if ((*((_BYTE *)self + 96) & 1) == 0)
  {
    -[PLPhotoDCFFileGroup pathForGroupWithoutExtension](self, "pathForGroupWithoutExtension");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hash = objc_msgSend(v3, "hash");

    *((_BYTE *)self + 96) |= 1u;
  }
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  PLPhotoDCFFileGroup *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (PLPhotoDCFFileGroup *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PLPhotoDCFFileGroup pathForGroupWithoutExtension](self, "pathForGroupWithoutExtension");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPhotoDCFFileGroup pathForGroupWithoutExtension](v4, "pathForGroupWithoutExtension");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isValid
{
  return (-[NSMutableSet containsObject:](self->_extensions, "containsObject:", self->_preferredExtension) & 1) != 0
      || -[PLPhotoDCFFileGroup hasVideoFile](self, "hasVideoFile");
}

- (void)deleteObsoleteFiles
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_directoryPath, "stringByAppendingPathComponent:", self->super._name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  _ObsoleteFileExtensions();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "stringByAppendingPathExtension:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "removeItemAtPath:error:", v10, 0);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)hasObsoleteFiles
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_directoryPath, "stringByAppendingPathComponent:", self->super._name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  _ObsoleteFileExtensions();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "stringByAppendingPathExtension:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v3, "fileExistsAtPath:", v9);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)addExtension:(id)a3
{
  id v5;
  NSMutableSet *extensions;
  NSMutableSet *v7;
  NSMutableSet *v8;
  NSString **p_preferredExtension;
  void *v10;
  char v11;
  id v12;

  v5 = a3;
  extensions = self->_extensions;
  v12 = v5;
  if (!extensions)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = self->_extensions;
    self->_extensions = v7;

    v5 = v12;
    extensions = self->_extensions;
  }
  -[NSMutableSet addObject:](extensions, "addObject:", v5);
  pl_dispatch_once(&_InitializeFileExtensions_onceToken, &__block_literal_global_3681);
  if (objc_msgSend((id)__imageFileExtensions, "containsObject:", v12))
  {
    p_preferredExtension = &self->_preferredExtension;
LABEL_5:
    objc_storeStrong((id *)p_preferredExtension, a3);
    goto LABEL_8;
  }
  p_preferredExtension = &self->_videoFileExtension;
  if (!*p_preferredExtension)
  {
    _MetadataFileExtensions();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v12);

    if ((v11 & 1) == 0)
      goto LABEL_5;
  }
LABEL_8:

}

- (id)date
{
  NSDate *date;

  date = self->_date;
  if (date)
    return date;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  NSComparisonResult v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSDate compare:](self->_date, "compare:", v5);
  if (v6 == NSOrderedSame)
  {
    -[PLPhotoDCFObject name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "compare:", v8);

  }
  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: %@ (%d), extensions: %@>"), objc_opt_class(), self, self->super._name, self->super._number, self->_extensions);
}

- (void)addExtensionsFromMetadataDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 96) & 2) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoDCFFileGroup pathForMetadata](self, "pathForMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", self->super._name);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    _MetadataFileExtensions();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v5, "stringByAppendingPathExtension:", v11, (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v3, "fileExistsAtPath:", v12))
            -[PLPhotoDCFFileGroup addExtension:](self, "addExtension:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    *((_BYTE *)self + 96) |= 2u;
  }
}

- (void)forceAddExtensionsFromMetadataDirectory
{
  *((_BYTE *)self + 96) &= ~2u;
  -[PLPhotoDCFFileGroup addExtensionsFromMetadataDirectory](self, "addExtensionsFromMetadataDirectory");
}

- (id)extensions
{
  if ((*((_BYTE *)self + 96) & 2) == 0)
    -[PLPhotoDCFFileGroup addExtensionsFromMetadataDirectory](self, "addExtensionsFromMetadataDirectory");
  return self->_extensions;
}

- (id)pathForContainingDirectory
{
  return self->_directoryPath;
}

- (id)pathForGroupWithoutExtension
{
  return -[NSString stringByAppendingPathComponent:](self->_directoryPath, "stringByAppendingPathComponent:", self->super._name);
}

- (id)pathForMetadata
{
  return -[NSString stringByAppendingPathComponent:](self->_directoryPath, "stringByAppendingPathComponent:", CFSTR(".MISC"));
}

- (id)pathForMetadataWithGroupName
{
  void *v3;
  void *v4;

  -[PLPhotoDCFFileGroup pathForMetadata](self, "pathForMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", self->super._name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)createMetadataDirectoryIfNecessary
{
  void *v2;
  id v3;

  -[PLPhotoDCFFileGroup pathForMetadata](self, "pathForMetadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", v3) & 1) == 0)
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

}

- (id)pathForFullSizeImage
{
  void *v3;
  void *v4;

  -[NSString stringByAppendingPathComponent:](self->_directoryPath, "stringByAppendingPathComponent:", self->super._name);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathExtension:", self->_preferredExtension);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pathForVideoFile
{
  NSString *videoFileExtension;
  NSString *directoryPath;
  NSString *name;
  NSString *v5;
  void *v6;
  void *v7;

  videoFileExtension = self->_videoFileExtension;
  if (!videoFileExtension)
    videoFileExtension = (NSString *)CFSTR("MOV");
  directoryPath = self->_directoryPath;
  name = self->super._name;
  v5 = videoFileExtension;
  -[NSString stringByAppendingPathComponent:](directoryPath, "stringByAppendingPathComponent:", name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pathForTrimmedVideoFile
{
  void *v2;
  void *v3;

  -[NSString stringByAppendingPathComponent:](self->_directoryPath, "stringByAppendingPathComponent:", self->super._name);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathExtension:", CFSTR("TRIM.MOV"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)thumbnailFilename
{
  return -[NSString stringByAppendingPathExtension:](self->super._name, "stringByAppendingPathExtension:", CFSTR("THM"));
}

- (id)prebakedThumbnailFilename
{
  return -[NSString stringByAppendingPathExtension:](self->super._name, "stringByAppendingPathExtension:", CFSTR("BTH"));
}

- (id)prebakedLandscapeScrubberThumbnailsFilename
{
  return -[NSString stringByAppendingPathExtension:](self->super._name, "stringByAppendingPathExtension:", CFSTR("THL"));
}

- (id)prebakedPortraitScrubberThumbnailsFilename
{
  return -[NSString stringByAppendingPathExtension:](self->super._name, "stringByAppendingPathExtension:", CFSTR("THP"));
}

- (id)prebakedWildcatThumbnailsFilename
{
  return -[NSString stringByAppendingPathExtension:](self->super._name, "stringByAppendingPathExtension:", CFSTR("WTH"));
}

- (id)lowResolutionFilename
{
  return -[NSString stringByAppendingPathExtension:](self->super._name, "stringByAppendingPathExtension:", CFSTR("LRZ"));
}

- (id)videoPreviewFilename
{
  return -[NSString stringByAppendingPathExtension:](self->super._name, "stringByAppendingPathExtension:", CFSTR("JPG"));
}

- (id)pathForThumbnailFile
{
  void *v3;
  void *v4;
  void *v5;

  -[PLPhotoDCFFileGroup pathForMetadata](self, "pathForMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoDCFFileGroup thumbnailFilename](self, "thumbnailFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pathForPrebakedThumbnail
{
  return self->_prebakedThumbnailPath;
}

- (id)pathForPrebakedLandscapeScrubberThumbnails
{
  void *v3;
  void *v4;
  void *v5;

  -[PLPhotoDCFFileGroup pathForMetadata](self, "pathForMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoDCFFileGroup prebakedLandscapeScrubberThumbnailsFilename](self, "prebakedLandscapeScrubberThumbnailsFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pathForPrebakedPortraitScrubberThumbnails
{
  void *v3;
  void *v4;
  void *v5;

  -[PLPhotoDCFFileGroup pathForMetadata](self, "pathForMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoDCFFileGroup prebakedPortraitScrubberThumbnailsFilename](self, "prebakedPortraitScrubberThumbnailsFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pathForPrebakedWildcatThumbnailsFile
{
  void *v3;
  void *v4;
  void *v5;

  -[PLPhotoDCFFileGroup pathForMetadata](self, "pathForMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoDCFFileGroup prebakedWildcatThumbnailsFilename](self, "prebakedWildcatThumbnailsFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pathForLowResolutionFile
{
  void *v3;
  void *v4;
  void *v5;

  -[PLPhotoDCFFileGroup pathForMetadata](self, "pathForMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoDCFFileGroup lowResolutionFilename](self, "lowResolutionFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pathForVideoPreviewFile
{
  void *v3;
  void *v4;
  void *v5;

  -[PLPhotoDCFFileGroup pathForMetadata](self, "pathForMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoDCFFileGroup videoPreviewFilename](self, "videoPreviewFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasThumbnail
{
  if ((*((_BYTE *)self + 96) & 2) == 0)
    -[PLPhotoDCFFileGroup addExtensionsFromMetadataDirectory](self, "addExtensionsFromMetadataDirectory");
  return -[NSMutableSet containsObject:](self->_extensions, "containsObject:", CFSTR("THM"));
}

- (BOOL)hasVideoFile
{
  return self->_videoFileExtension != 0;
}

- (BOOL)hasPrebakedThumbnail
{
  if ((*((_BYTE *)self + 96) & 2) == 0)
    -[PLPhotoDCFFileGroup addExtensionsFromMetadataDirectory](self, "addExtensionsFromMetadataDirectory");
  return -[NSMutableSet containsObject:](self->_extensions, "containsObject:", CFSTR("BTH"));
}

- (BOOL)hasPrebakedLandscapeScrubberThumbnails
{
  if ((*((_BYTE *)self + 96) & 2) == 0)
    -[PLPhotoDCFFileGroup addExtensionsFromMetadataDirectory](self, "addExtensionsFromMetadataDirectory");
  return -[NSMutableSet containsObject:](self->_extensions, "containsObject:", CFSTR("THL"));
}

- (BOOL)hasPrebakedPortraitScrubberThumbnails
{
  if ((*((_BYTE *)self + 96) & 2) == 0)
    -[PLPhotoDCFFileGroup addExtensionsFromMetadataDirectory](self, "addExtensionsFromMetadataDirectory");
  return -[NSMutableSet containsObject:](self->_extensions, "containsObject:", CFSTR("THP"));
}

- (BOOL)hasPrebakedWildcatThumbnails
{
  if ((*((_BYTE *)self + 96) & 2) == 0)
    -[PLPhotoDCFFileGroup addExtensionsFromMetadataDirectory](self, "addExtensionsFromMetadataDirectory");
  return -[NSMutableSet containsObject:](self->_extensions, "containsObject:", CFSTR("WTH"));
}

- (void)deleteFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoDCFFileGroup pathForFullSizeImage](self, "pathForFullSizeImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

  -[PLPhotoDCFFileGroup pathForVideoFile](self, "pathForVideoFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v5, 0);

  -[PLPhotoDCFFileGroup pathForMetadata](self, "pathForMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", self->super._name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  _MetadataFileExtensions();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "stringByAppendingPathExtension:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "removeItemAtPath:error:", v13, 0);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  -[PLPhotoDCFFileGroup pathForGroupWithoutExtension](self, "pathForGroupWithoutExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = self->_extensions;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v14, "stringByAppendingPathExtension:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19), (_QWORD)v21);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "removeItemAtPath:error:", v20, 0);

        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

}

- (void)setWriteIsPending:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 96) = *((_BYTE *)self + 96) & 0xFB | v3;
  -[PLPhotoDCFDirectory setWriteIsPending:](self->_directory, "setWriteIsPending:");
}

- (BOOL)isWritePending
{
  return (*((unsigned __int8 *)self + 96) >> 2) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredExtension, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_videoFileExtension, 0);
  objc_storeStrong((id *)&self->_prebakedThumbnailPath, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong(&self->_delegate, 0);
}

@end
