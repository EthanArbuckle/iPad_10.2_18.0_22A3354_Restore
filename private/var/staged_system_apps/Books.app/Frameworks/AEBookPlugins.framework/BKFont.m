@implementation BKFont

- (void)dealloc
{
  objc_super v3;

  -[BKFont unregisterFiles](self, "unregisterFiles");
  v3.receiver = self;
  v3.super_class = (Class)BKFont;
  -[BKFont dealloc](&v3, "dealloc");
}

+ (id)_fontDescriptorLookupQueue
{
  if (qword_20F7A0 != -1)
    dispatch_once(&qword_20F7A0, &stru_1C1CC0);
  return (id)qword_20F798;
}

- (NSString)displayName
{
  NSString **p_displayName;
  NSString *v4;
  unint64_t kind;
  const __CTFont *v6;
  const __CTFont *v7;
  __CFString *v8;
  __CFString *v9;

  p_displayName = &self->_displayName;
  v4 = self->_displayName;
  if (v4)
    return v4;
  kind = self->_kind;
  if (kind == 3)
  {
    v6 = (const __CTFont *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    goto LABEL_6;
  }
  if (kind == 4)
  {
    v6 = (const __CTFont *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:design:](UIFont, "systemFontOfSize:weight:design:", kCTFontUIFontDesignSerif, 17.0, UIFontWeightRegular));
LABEL_6:
    v7 = v6;
    if (v6)
    {
      v8 = (__CFString *)CTFontCopyName(v6, kCTFontMarketingNameKey);
      if (v8)
      {
        v9 = v8;
        objc_storeStrong((id *)p_displayName, v8);
        v4 = v9;
        CFRelease(v4);

        return v4;
      }
    }
    goto LABEL_10;
  }
  v7 = 0;
LABEL_10:

  v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[BKFont localizedName](self, "localizedName"));
  if (!v4)
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[BKFont familyName](self, "familyName"));
  return v4;
}

- (BOOL)isOriginalFont
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont familyName](self, "familyName"));
  v3 = objc_msgSend(v2, "isEqualToString:", &stru_1C3088);

  return v3;
}

+ (void)_lookupLocalizedNameForAttrs:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  double v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  *(_QWORD *)&v8 = objc_opt_class(a1).n128_u64[0];
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_fontDescriptorLookupQueue", v8));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_EE6C8;
  v13[3] = &unk_1BF2A0;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, v13);

}

- (id)localizedName
{
  NSString *localizedName;
  void *v4;
  void *v5;
  const CFStringRef *v6;
  void *v7;
  id v8;
  _QWORD v10[5];

  localizedName = self->_localizedName;
  if (!localizedName)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont postscriptName](self, "postscriptName"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont postscriptName](self, "postscriptName"));
      v6 = &kCTFontNameAttribute;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont familyName](self, "familyName"));
      v6 = &kCTFontFamilyNameAttribute;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v5, *v6, 0));

    objc_opt_class(self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_EE8D0;
    v10[3] = &unk_1C1CE8;
    v10[4] = self;
    objc_msgSend(v8, "_lookupLocalizedNameForAttrs:withCompletion:", v7, v10);

    localizedName = self->_localizedName;
  }
  return localizedName;
}

- (NSString)postscriptBoldName
{
  NSString *postscriptBoldName;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CTFontDescriptor *v8;
  const __CTFontDescriptor *v9;
  const __CTFont *v10;
  double v11;
  const __CTFont *v12;
  CFStringRef v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  const __CTFontDescriptor *v18;
  const __CTFontDescriptor *v19;
  __CFString *v20;
  NSString *v21;

  postscriptBoldName = self->_postscriptBoldName;
  if (!postscriptBoldName)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont familyName](self, "familyName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v4, kCTFontFamilyNameAttribute));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v6, kCTFontSymbolicTrait));
    objc_msgSend(v5, "setObject:forKey:", v7, kCTFontTraitsAttribute);

    v8 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)v5);
    if (!v8)
    {
LABEL_10:

      postscriptBoldName = self->_postscriptBoldName;
      return postscriptBoldName;
    }
    v9 = v8;
    v10 = CTFontCreateWithFontDescriptor(v8, 1.0, 0);
    if (v10)
    {
      v12 = v10;
      v13 = CTFontCopyFamilyName(v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont familyName](self, "familyName"));
      v15 = objc_msgSend(v14, "isEqualToString:", v13);

      CFRelease(v13);
      if ((v15 & 1) != 0)
      {
LABEL_8:
        v20 = (__CFString *)CTFontCopyName(v12, kCTFontPostScriptNameKey);
        v21 = self->_postscriptBoldName;
        self->_postscriptBoldName = &v20->isa;

        CFRelease(v12);
LABEL_9:
        CFRelease(v9);
        goto LABEL_10;
      }
      CFRelease(v12);
    }
    LODWORD(v11) = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v16, kCTFontSlantTrait));
    objc_msgSend(v5, "setObject:forKey:", v17, kCTFontTraitsAttribute);

    v18 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)v5);
    if (!v18)
      goto LABEL_9;
    v19 = v18;
    v12 = CTFontCreateWithFontDescriptor(v18, 1.0, 0);
    CFRelease(v19);
    if (!v12)
      goto LABEL_9;
    goto LABEL_8;
  }
  return postscriptBoldName;
}

- (void)registerFiles
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  NSArray *v19;
  NSArray *registeredFiles;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];

  if (!self->_registeredFiles)
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont fileExtension](self, "fileExtension"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLsForResourcesWithExtension:subdirectory:", v5, 0));

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v23;
      *(_QWORD *)&v9 = 138543362;
      v21 = v9;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent", v21, (_QWORD)v22));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont fileNamePrefix](self, "fileNamePrefix"));
          v16 = objc_msgSend(v14, "hasPrefix:", v15);

          if (v16)
          {
            if (CTFontManagerRegisterFontsForURL((CFURLRef)v13, kCTFontManagerScopeProcess, 0))
            {
              objc_msgSend(v3, "addObject:", v13);
            }
            else
            {
              v17 = _AEBookPluginsFontCacheLog();
              v18 = objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v21;
                v27 = v13;
                _os_log_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "-[BKFont registerFiles:] could not register %{public}@", buf, 0xCu);
              }

            }
          }

        }
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v10);
    }

    v19 = (NSArray *)objc_msgSend(v3, "copy");
    registeredFiles = self->_registeredFiles;
    self->_registeredFiles = v19;

  }
}

- (void)unregisterFiles
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSArray *registeredFiles;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_registeredFiles;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        CTFontManagerUnregisterFontsForURL(*(CFURLRef *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), kCTFontManagerScopeProcess, 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  registeredFiles = self->_registeredFiles;
  self->_registeredFiles = 0;

}

- (BOOL)isInstalled
{
  unint64_t v3;
  BOOL v4;
  void *v6;
  const __CFDictionary *v7;
  const __CTFontDescriptor *v8;
  const __CTFontDescriptor *v9;
  CTFontDescriptorRef MatchingFontDescriptor;

  v3 = -[BKFont kind](self, "kind");
  if (v3 - 1 < 4)
    return 1;
  if (v3)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont familyName](self, "familyName"));
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, kCTFontNameAttribute, 0));
  v8 = CTFontDescriptorCreateWithAttributes(v7);
  if (v8)
  {
    v9 = v8;
    MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v8, 0);
    v4 = MatchingFontDescriptor != 0;
    if (MatchingFontDescriptor)
      CFRelease(MatchingFontDescriptor);
    CFRelease(v9);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isAvailable
{
  return -[BKFont state](self, "state") == 1;
}

- (BOOL)isUnavailable
{
  return -[BKFont state](self, "state") == 4;
}

- (BOOL)isDownloading
{
  return -[BKFont state](self, "state") == 3;
}

- (BOOL)isDownloadable
{
  return -[BKFont state](self, "state") == 2;
}

- (void)checkStateSynchronously:(BOOL)a3
{
  -[BKFont checkStateSynchronously:completion:](self, "checkStateSynchronously:completion:", a3, 0);
}

- (void)checkStateSynchronously:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  void *v9;
  CTFontDescriptorRef v10;
  CTFontDescriptorRef v11;
  void *v12;
  NSObject *v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  void *v16;
  const __CFSet *v17;
  NSObject *v18;
  dispatch_time_t v19;
  _QWORD progressBlock[5];
  NSObject *v21;
  _QWORD block[4];
  void (**v23)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if ((char *)-[BKFont kind](self, "kind") - 1 > (_BYTE *)&dword_0 + 3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont familyName](self, "familyName"));
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v9, kCTFontFamilyNameAttribute, 0));

    v10 = CTFontDescriptorCreateWithAttributes(v8);
    if (v10)
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v10));
      objc_msgSend(v12, "addObject:", v11);
      CFRelease(v11);
      if (v6 || v4)
      {
        v13 = dispatch_group_create();
        dispatch_group_enter(v13);
        if (v6)
        {
          global_queue = dispatch_get_global_queue(0, 0);
          v15 = objc_claimAutoreleasedReturnValue(global_queue);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_EF288;
          block[3] = &unk_1BEC70;
          v23 = v6;
          dispatch_group_notify(v13, v15, block);

        }
      }
      else
      {
        v13 = 0;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary allKeys](v8, "allKeys"));
      v17 = (const __CFSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
      progressBlock[0] = _NSConcreteStackBlock;
      progressBlock[1] = 3221225472;
      progressBlock[2] = sub_EF294;
      progressBlock[3] = &unk_1C1D10;
      progressBlock[4] = self;
      v18 = v13;
      v21 = v18;
      CTFontDescriptorMatchFontDescriptorsWithProgressHandler((CFArrayRef)v12, v17, progressBlock);

      if (v4)
      {
        v19 = dispatch_time(0, 2000000000);
        if (dispatch_group_wait(v18, v19))
          dispatch_group_notify(v18, (dispatch_queue_t)&_dispatch_main_q, &stru_1C1D30);
      }

    }
    else if (v6)
    {
      v6[2](v6);
    }
  }
  else
  {
    -[BKFont setState:](self, "setState:", 1);
    v7 = objc_retainBlock(v6);
    v8 = v7;
    if (v7)
      (*((void (**)(const __CFDictionary *))v7 + 2))(v7);
  }

}

- (void)download
{
  -[BKFont downloadWithAllowCellular:](self, "downloadWithAllowCellular:", 1);
}

- (void)downloadWithAllowCellular:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  void *v8;
  CTFontDescriptorRef v9;
  CTFontDescriptorRef v10;
  unsigned int v11;
  _QWORD *v12;
  _QWORD progressBlock[5];
  unsigned int v14;
  _QWORD block[4];
  _QWORD *v16;
  _QWORD v17[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont familyName](self, "familyName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kCTFontFamilyNameAttribute, v6, kCTFontAllowCellularDownloadAttribute, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v9 = CTFontDescriptorCreateWithAttributes(v7);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v8, "addObject:", v9);
    CFRelease(v10);
    v11 = -[BKFont state](self, "state");
    -[BKFont setState:](self, "setState:", 3);
    -[BKFont setContinueDownloading:](self, "setContinueDownloading:", 1);
    if (-[BKFont state](self, "state") != v11)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_EF76C;
      v17[3] = &unk_1BEA38;
      v17[4] = self;
      v12 = objc_retainBlock(v17);
      if (v12)
      {
        if (+[NSThread isMainThread](NSThread, "isMainThread"))
        {
          ((void (*)(_QWORD *))v12[2])(v12);
        }
        else
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_EF7BC;
          block[3] = &unk_1BEC70;
          v16 = v12;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        }
      }

    }
    progressBlock[0] = _NSConcreteStackBlock;
    progressBlock[1] = 3221225472;
    progressBlock[2] = sub_EF7C8;
    progressBlock[3] = &unk_1C1D58;
    progressBlock[4] = self;
    v14 = v11;
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler((CFArrayRef)v8, 0, progressBlock);
  }

}

- (void)cancelDownload
{
  _QWORD *v3;
  _QWORD v4[4];
  _QWORD *v5;
  _QWORD v6[5];

  -[BKFont setContinueDownloading:](self, "setContinueDownloading:", 0);
  if (-[BKFont state](self, "state") == 3)
  {
    -[BKFont setState:](self, "setState:", 2);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_EFDE4;
    v6[3] = &unk_1BEA38;
    v6[4] = self;
    v3 = objc_retainBlock(v6);
    if (v3)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        ((void (*)(_QWORD *))v3[2])(v3);
      }
      else
      {
        v4[0] = _NSConcreteStackBlock;
        v4[1] = 3221225472;
        v4[2] = sub_EFE34;
        v4[3] = &unk_1BEC70;
        v5 = v3;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

      }
    }

  }
}

- (NSString)description
{
  Class v3;
  NSString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromBKFontKind(-[BKFont kind](self, "kind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = -[BKFont state](self, "state") - 1;
  if (v8 > 3)
    v9 = CFSTR("Unknown");
  else
    v9 = off_1C1DE0[v8];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont systemName](self, "systemName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont familyName](self, "familyName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont displayName](self, "displayName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont postscriptName](self, "postscriptName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKFont postscriptBoldName](self, "postscriptBoldName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> kind: %@, state: %@, systemName: %@, familyName: %@, displayName: %@, postscriptName: %@, postscriptBoldName: %@"), v5, self, v7, v9, v10, v11, v12, v13, v14));

  return (NSString *)v15;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (void)setSystemName:(id)a3
{
  objc_storeStrong((id *)&self->_systemName, a3);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_familyName, a3);
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)postscriptName
{
  return self->_postscriptName;
}

- (void)setPostscriptName:(id)a3
{
  objc_storeStrong((id *)&self->_postscriptName, a3);
}

- (void)setPostscriptBoldName:(id)a3
{
  objc_storeStrong((id *)&self->_postscriptBoldName, a3);
}

- (NSString)fileNamePrefix
{
  return self->_fileNamePrefix;
}

- (void)setFileNamePrefix:(id)a3
{
  objc_storeStrong((id *)&self->_fileNamePrefix, a3);
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (void)setFileExtension:(id)a3
{
  objc_storeStrong((id *)&self->_fileExtension, a3);
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(float)a3
{
  self->_downloadProgress = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)continueDownloading
{
  return self->_continueDownloading;
}

- (void)setContinueDownloading:(BOOL)a3
{
  self->_continueDownloading = a3;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (unsigned)lastKnownState
{
  return self->_lastKnownState;
}

- (void)setLastKnownState:(unsigned int)a3
{
  self->_lastKnownState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredFiles, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_fileNamePrefix, 0);
  objc_storeStrong((id *)&self->_postscriptBoldName, 0);
  objc_storeStrong((id *)&self->_postscriptName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
}

@end
