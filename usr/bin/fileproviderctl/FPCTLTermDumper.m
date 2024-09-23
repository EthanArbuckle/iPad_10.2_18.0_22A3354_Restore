@implementation FPCTLTermDumper

- (void)dumpProgress:(id)a3 prefix:(id)a4 error:(id)a5
{
  id v8;
  const __CFString *v9;
  double v10;
  void *v11;
  unsigned int v12;
  id v13;
  const __CFString *v14;
  void *v15;
  double v16;
  id v17;

  v17 = a3;
  v8 = a5;
  -[FPCTLTermDumper write:](self, "write:", CFSTR("%@ "), a4);
  if (v17)
  {
    if (objc_msgSend(v17, "isIndeterminate"))
    {
      v9 = CFSTR("(indeterminate) ");
    }
    else
    {
      objc_msgSend(v17, "fractionCompleted");
      v16 = v10 * 100.0;
      v9 = CFSTR("%.01f%% ");
    }
    -[FPCTLTermDumper write:](self, "write:", v9, *(_QWORD *)&v16);
  }
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    v12 = objc_msgSend(v11, "isEqualToString:", NSFileProviderErrorDomain);

    if (v12)
    {
      v13 = objc_msgSend(v8, "code");
      if (v13 == (id)-1000)
      {
        v14 = CFSTR("(not authenticated) ");
      }
      else if (v13 == (id)-1003)
      {
        v14 = CFSTR("(insufficient quota) ");
      }
      else if (v13 == (id)-1004)
      {
        v14 = CFSTR("(offline) ");
      }
      else
      {
        v14 = CFSTR("(fp error) ");
      }
      -[FPCTLTermDumper write:](self, "write:", v14);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
      -[FPCTLTermDumper write:](self, "write:", CFSTR("(%@:%d) "), v15, objc_msgSend(v8, "code"));

    }
  }

}

- (id)providerNameForProviderIdentifier:(id)a3
{
  id v4;
  id AssociatedObject;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  id v13;
  uint64_t v15;

  v4 = a3;
  AssociatedObject = objc_getAssociatedObject(self, &unk_100018D00);
  v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_setAssociatedObject(self, &unk_100018D00, v6, (void *)0x301);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("🍎 "), CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("🏢 "), CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("🍏 "), CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("🏢 "), CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("📍 "), CFSTR("com.apple.FileProvider.LocalStorage"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("🚧 "), CFSTR("com.apple.FileProvider.TestingHarness.TestFileProvider"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("🍍 "), CFSTR("com.apple.BerryBox.BerryPickerFileProvider"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("💾 "), CFSTR("com.apple.filesystems.UserFS.FileProvider"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("📠 "), CFSTR("com.apple.SMBClientProvider.FileProvider"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));
  if (!v7)
  {
    v8 = qword_100018D18;
    v9 = objc_msgSend(&off_100016868, "count");
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(&off_100016868, "objectAtIndex:", qword_100018D18 % (unint64_t)objc_msgSend(&off_100016868, "count")));
    v11 = (void *)v10;
    if (v8 <= (unint64_t)v9)
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ "), v10, v15);
    else
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@  - %i"), v10, qword_100018D18 / (unint64_t)objc_msgSend(&off_100016868, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v12);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v4);
    ++qword_100018D18;
  }
  v13 = v7;

  return v13;
}

- (id)thumbnailQueue
{
  id AssociatedObject;
  NSOperationQueue *v4;

  AssociatedObject = objc_getAssociatedObject(self, &unk_100018D08);
  v4 = (NSOperationQueue *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v4 = objc_opt_new(NSOperationQueue);
    objc_setAssociatedObject(self, &unk_100018D08, v4, (void *)0x301);
  }
  return v4;
}

- (id)dateFormatter
{
  id AssociatedObject;
  NSDateFormatter *v4;

  AssociatedObject = objc_getAssociatedObject(self, &unk_100018D10);
  v4 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v4 = objc_opt_new(NSDateFormatter);
    -[NSDateFormatter setDateStyle:](v4, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v4, "setTimeStyle:", 1);
    -[NSDateFormatter setDoesRelativeDateFormatting:](v4, "setDoesRelativeDateFormatting:", 1);
    objc_setAssociatedObject(self, &unk_100018D10, v4, (void *)0x301);
  }
  return v4;
}

- (void)dumpItem:(id)a3 verbose:(int)a4 hasItemsFromMultipleProviders:(BOOL)a5 showThumbnails:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  _QWORD v46[4];
  id v47;
  FPCTLTermDumper *v48;
  id v49;
  int v50;
  _QWORD v51[5];
  void *v52;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = v10;
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "providerID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FPCTLTermDumper providerNameForProviderIdentifier:](self, "providerNameForProviderIdentifier:", v12));
    -[FPCTLTermDumper write:](self, "write:", CFSTR("%@"), v13);

  }
  if ((objc_msgSend(v11, "isContainer") & 1) != 0)
  {
    v14 = CFSTR("📚 ");
  }
  else if ((objc_msgSend(v11, "isFolder") & 1) != 0)
  {
    v14 = CFSTR("📁 ");
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentType"));
    v16 = objc_msgSend(v15, "conformsToType:", UTTypeSymbolicLink);

    if (v16)
      v14 = CFSTR("🔗 ");
    else
      v14 = CFSTR("   ");
  }
  -[FPCTLTermDumper write:](self, "write:", v14);
  if (v6)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[FPItemManager defaultManager](FPItemManager, "defaultManager"));
    v52 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "thumbnailsFetchOperationForItems:withSize:scale:", v18, 16.0, 16.0, 2.0));

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100007BC4;
    v51[3] = &unk_100014C08;
    v51[4] = self;
    objc_msgSend(v19, "setPerThumbnailCompletionBlock:", v51);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FPCTLTermDumper thumbnailQueue](self, "thumbnailQueue"));
    objc_msgSend(v20, "addOperation:", v19);

    objc_msgSend(v19, "waitUntilFinished");
  }
  if (a4)
  {
    if (a4 >= 2)
      -[FPCTLTermDumper write:](self, "write:", CFSTR(" %p"), v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "descriptionForFPCTL:", 1));
    -[FPCTLTermDumper write:](self, "write:", CFSTR(" %@"), v21);

    goto LABEL_56;
  }
  if (objc_msgSend(v11, "isDownloaded")
    && (objc_msgSend(v11, "isMostRecentVersionDownloaded") & 1) == 0)
  {
    -[FPCTLTermDumper write:](self, "write:", CFSTR("🔵 "));
  }
  -[FPCTLTermDumper startAttributes:](self, "startAttributes:", ~(objc_msgSend(v11, "fileSystemFlags") >> 2) & 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description"));
  -[FPCTLTermDumper write:](self, "write:", CFSTR("%@ "), v23);

  -[FPCTLTermDumper reset](self, "reset");
  if ((objc_msgSend(v11, "fileSystemFlags") & 8) != 0)
    -[FPCTLTermDumper write:](self, "write:", CFSTR("(hidden) "));
  -[FPCTLTermDumper startAttributes:](self, "startAttributes:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "description"));
  -[FPCTLTermDumper write:](self, "write:", CFSTR("id:%@ "), v25);

  -[FPCTLTermDumper reset](self, "reset");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "documentSize"));

  if (v26)
  {
    -[FPCTLTermDumper startAttributes:](self, "startAttributes:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "documentSize"));
    -[FPCTLTermDumper write:](self, "write:", CFSTR("size:%lu "), objc_msgSend(v27, "integerValue"));

    -[FPCTLTermDumper reset](self, "reset");
  }
  if (objc_msgSend(v11, "isCloudItem"))
  {
    if (objc_msgSend(v11, "isDownloading"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "downloadingProgress"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "downloadingError"));
      -[FPCTLTermDumper dumpProgress:prefix:error:](self, "dumpProgress:prefix:error:", v28, CFSTR("⬇ "), v29);

    }
    if (objc_msgSend(v11, "isUploading"))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uploadingProgress"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uploadingError"));
      -[FPCTLTermDumper dumpProgress:prefix:error:](self, "dumpProgress:prefix:error:", v30, CFSTR("⬆ "), v31);

    }
  }
  if ((objc_msgSend(v11, "isPinned") & 1) != 0)
  {
    v32 = CFSTR("📌 ");
LABEL_32:
    -[FPCTLTermDumper write:](self, "write:", v32);
    goto LABEL_33;
  }
  if (objc_msgSend(v11, "isInPinnedFolder"))
  {
    v32 = CFSTR("📍 ");
    goto LABEL_32;
  }
LABEL_33:
  if ((objc_msgSend(v11, "isDownloaded") & 1) != 0
    || (objc_msgSend(v11, "isCloudItem") & 1) == 0)
  {
    if (objc_msgSend(v11, "isFolder") && objc_msgSend(v11, "isRecursivelyDownloaded"))
      -[FPCTLTermDumper write:](self, "write:", CFSTR("🌳 "));
    -[FPCTLTermDumper write:](self, "write:", CFSTR("📱 "));
    if (objc_msgSend(v11, "isExcludedFromSync"))
      -[FPCTLTermDumper write:](self, "write:", CFSTR("🚫 "));
  }
  if (objc_msgSend(v11, "isTrashed"))
    -[FPCTLTermDumper write:](self, "write:", CFSTR("🗑 "));
  if (objc_msgSend(v11, "isCloudItem") && objc_msgSend(v11, "isUploaded"))
    -[FPCTLTermDumper write:](self, "write:", CFSTR("☁️ "));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fileURL"));

  if (!v33)
    -[FPCTLTermDumper write:](self, "write:", CFSTR("(no url) "));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastUsedDate"));

  if (v34)
  {
    -[FPCTLTermDumper startAttributes:](self, "startAttributes:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[FPCTLTermDumper dateFormatter](self, "dateFormatter"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastUsedDate"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringFromDate:", v36));
    -[FPCTLTermDumper write:](self, "write:", CFSTR(" %@ (used)"), v37);
LABEL_51:

    -[FPCTLTermDumper reset](self, "reset");
    goto LABEL_52;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentModificationDate"));

  if (v38)
  {
    -[FPCTLTermDumper startAttributes:](self, "startAttributes:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[FPCTLTermDumper dateFormatter](self, "dateFormatter"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentModificationDate"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringFromDate:", v36));
    -[FPCTLTermDumper write:](self, "write:", CFSTR(" %@"), v37);
    goto LABEL_51;
  }
LABEL_52:
  if (objc_msgSend(v11, "typeAndCreator"))
    -[FPCTLTermDumper write:](self, "write:", CFSTR("ostype:%x "), objc_msgSend(v11, "typeAndCreator"));
  if ((unint64_t)objc_msgSend(v11, "typeAndCreator") >> 32)
    -[FPCTLTermDumper write:](self, "write:", CFSTR("creatorcode: %x "), (unint64_t)objc_msgSend(v11, "typeAndCreator") >> 32);
LABEL_56:
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tags"));
  v40 = sub_100006ECC(v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

  if (objc_msgSend(v41, "length"))
  {
    -[FPCTLTermDumper startAttributes:](self, "startAttributes:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "description"));
    -[FPCTLTermDumper write:](self, "write:", CFSTR(" [%@]"), v42);

    -[FPCTLTermDumper reset](self, "reset");
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemDecorations"));
  v44 = v43;
  if (v43)
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100007C1C;
    v46[3] = &unk_100014C30;
    v47 = v43;
    v48 = self;
    v49 = v11;
    v50 = a4;
    v45 = objc_retainBlock(v46);
    ((void (*)(_QWORD *, _QWORD, uint64_t, _QWORD))v45[2])(v45, FPItemDecorationTypeSharing, 7, 0);
    ((void (*)(_QWORD *, _QWORD, uint64_t, uint64_t))v45[2])(v45, FPItemDecorationTypeBadge, 4, 1);
    ((void (*)(_QWORD *, _QWORD, uint64_t, uint64_t))v45[2])(v45, FPItemDecorationTypeFolderBadge, 4, 1);
    -[FPCTLTermDumper reset](self, "reset");

  }
}

@end
