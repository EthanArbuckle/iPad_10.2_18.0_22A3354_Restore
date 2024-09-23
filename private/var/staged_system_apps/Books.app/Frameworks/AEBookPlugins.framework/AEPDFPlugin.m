@implementation AEPDFPlugin

- (BOOL)isPdfURL:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "isFileURL"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathExtension"));
    v5 = objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pdf")) == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)generateImageForDocument:(id)a3 pageIndex:(unint64_t)a4 size:(CGSize)a5
{
  return _objc_msgSend(a1, "generateImageForDocument:pageIndex:size:showBookmark:", a3, a4, 0, a5.width, a5.height);
}

+ (id)generateImageForDocument:(id)a3 pageIndex:(unint64_t)a4 size:(CGSize)a5 showBookmark:(BOOL)a6
{
  void *v6;
  _BOOL8 v7;
  double height;
  double width;
  void *v10;
  void *v11;
  double BoxRectWithRotation;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[2];

  v6 = 0;
  if (a3 && a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = a6;
    height = a5.height;
    width = a5.width;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pageAtIndex:", a4));
    v11 = v10;
    if (width == CGSizeZero.width && height == CGSizeZero.height)
    {
      BoxRectWithRotation = PDFPageGetBoxRectWithRotation(v10, 1);
      width = v14;
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen", BoxRectWithRotation));
      objc_msgSend(v17, "bounds");
      v19 = v18;
      v21 = v20;

      if (width > v19 || v16 > v21)
        width = CGSizeScaledToFitInSize(width, v16, v19, v21);
    }
    v23 = BKImageSizeForScreenSize(width);
    v25 = v24;
    v29[0] = PDFPageImageProperty_DrawBookmark;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
    v29[1] = PDFPageImageProperty_WithRotation;
    v30[0] = v26;
    v30[1] = &__kCFBooleanTrue;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageOfSize:forBox:withOptions:", 1, v27, v23, v25));

  }
  return v6;
}

+ (id)associatedAssetType
{
  return CFSTR("application/pdf");
}

- (id)associatedAssetType
{
  return CFSTR("application/pdf");
}

- (id)supportedFileExtensions
{
  return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("pdf"));
}

- (id)supportedUrlSchemes
{
  return 0;
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v5;
  AEPDFBookHelper *v6;

  v5 = a3;
  v6 = -[AEPDFBookHelper initWithDelegate:forURL:]([AEPDFBookHelper alloc], "initWithDelegate:forURL:", self, v5);

  return v6;
}

- (id)helper:(id)a3 annotationProviderForURL:(id)a4 needsCoordination:(BOOL)a5 forAssetID:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEPDFPlugin sharedAnnotationProvider](self, "sharedAnnotationProvider"));
  if (v11)
    v14 = v11;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataAssetIDKey, v7));
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist isManagedBookFromURL:](IMLibraryPlist, "isManagedBookFromURL:", v12));
  v17 = objc_msgSend(v16, "BOOLValue");

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationSerializationManager annotationSerializationManagerWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:](AEAnnotationSerializationManager, "annotationSerializationManagerWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:", v15, v12, 0, 0, v17));
  if ((objc_msgSend(v18, "isAssetOfflineWithAssetID:", v15) & 1) != 0
    || objc_msgSend(v18, "takeBookOfflineIfManagedWithAnnotationProvider:assetID:", v13, v15))
  {
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "annotationProviderForOfflineDBWithAssetID:", v15));

    v13 = (void *)v19;
  }

  return v13;
}

- (id)_updateBook:(id)a3 onMoc:(id)a4 forCurrentURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  void *v26;
  id v28;
  id v29;
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fileSize"));
    v14 = objc_msgSend(v13, "longLongValue");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v30 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "attributesOfItemAtPath:error:", v16, &v30));
    v18 = v30;

    v19 = objc_msgSend(v17, "fileSize");
    v20 = v12;
    if (v19)
    {
      v21 = v19;
      v20 = v12;
      if (v14 != v19)
      {
        v29 = 0;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
        objc_msgSend(v22, "resetBookForURL:", v10);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEPDFPlugin _bookInfoForAssetAtURL:withMoc:error:needsCoordination:](self, "_bookInfoForAssetAtURL:withMoc:error:needsCoordination:", v10, v9, &v29, 1));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v21));
        objc_msgSend(v20, "setFileSize:", v23);

        if (objc_msgSend(v9, "hasChanges"))
        {
          v28 = 0;
          v24 = objc_msgSend(v9, "save:", &v28);
          v25 = v28;
          v26 = v25;
          if ((v24 & 1) == 0)
            NSLog(CFSTR("Error updating book's file size: %@ -- %@"), v10, v25);

        }
      }
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)helper:(id)a3 coverImageForURL:(id)a4
{
  return -[AEPDFPlugin helper:coverImageForURL:size:](self, "helper:coverImageForURL:size:", a3, a4, CGSizeZero.width, CGSizeZero.height);
}

- (id)helper:(id)a3 coverImageForURL:(id)a4 size:(CGSize)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;

  height = a5.height;
  width = a5.width;
  v8 = a4;
  if (-[AEPDFPlugin isPdfURL:](self, "isPdfURL:", v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
    v10 = objc_msgSend(v9, "copyCacheObjectForURL:", v8);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "document"));
    if (v11
      && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "document")),
          v13 = objc_msgSend(v12, "isEncrypted"),
          v12,
          (v13 & 1) == 0))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[AEPDFPlugin generateImageForDocument:pageIndex:size:](AEPDFPlugin, "generateImageForDocument:pageIndex:size:", v11, 0, width, height));
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)helper:(id)a3 metadataForKey:(id)a4 forURL:(id)a5 needsCoordination:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  __CFString *v11;
  void *v12;

  v6 = a6;
  v9 = a4;
  v10 = a5;
  if (-[AEPDFPlugin isPdfURL:](self, "isPdfURL:", v10))
  {
    if ((objc_msgSend(v9, "isEqualToString:", AEHelperStringMetadataDefaultCollectionNameKey) & 1) != 0)
    {
      v11 = CFSTR("PDF");
    }
    else if (objc_msgSend(v9, "isEqualToString:", AEHelperStringMetadataCoverArtEffectKey))
    {
      v11 = (__CFString *)AEHelperStringMetadataCoverArtEffectEdgeSpiralValue;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadataForKey:forURL:needsCoordination:", v9, v10, v6));

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)helper:(id)a3 setMetadata:(id)a4 forKey:(id)a5 forURL:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = a6;
  if (-[AEPDFPlugin isPdfURL:](self, "isPdfURL:", v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
    objc_msgSend(v11, "setMetadata:forKey:forURL:", v12, v9, v10);

  }
}

- (void)helper:(id)a3 deletePersistentCacheForURL:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
  objc_msgSend(v5, "resetBookForURL:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
  objc_msgSend(v6, "clearNativeObjectCache");

}

- (void)helper:(id)a3 updateCachedURLFrom:(id)a4 to:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
  objc_msgSend(v8, "updateCachedURLFrom:to:", v7, v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
  objc_msgSend(v9, "clearNativeObjectCache");

}

- (void)sendViewControllerForBook:(id)a3 toCompletion:(id)a4
{
  id v6;
  id v7;
  BKPDFModernBookViewController *v8;
  void *v9;
  BKPDFModernBookViewController *v10;
  id v11;
  _QWORD v12[4];
  BKPDFModernBookViewController *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = -[BKPDFModernBookViewController initWithBook:storeID:]([BKPDFModernBookViewController alloc], "initWithBook:storeID:", v7, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEPDFPlugin sharedBookCoverResetter](self, "sharedBookCoverResetter"));
  -[BKPDFModernBookViewController setSharedBookCoverResetter:](v8, "setSharedBookCoverResetter:", v9);

  v10 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_39414;
  v12[3] = &unk_1BF0C0;
  v13 = v10;
  v14 = v6;
  v11 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

}

- (void)sendError:(id)a3 toCompletion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_394C4;
  v7[3] = &unk_1BF0C0;
  v8 = a3;
  v9 = a4;
  v5 = v8;
  v6 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

}

- (void)loadError:(id)a3
{
  uint64_t v3;
  void (**v4)(id, _QWORD, id);
  id v5;

  v3 = AssetEngineErrorDomain;
  v4 = (void (**)(id, _QWORD, id))a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v3, 3001, 0));
  v4[2](v4, 0, v5);

}

- (void)helper:(id)a3 viewControllerWithOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  AEPDFPlugin *v15;
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "url"));
  if (-[AEPDFPlugin isPdfURL:](self, "isPdfURL:", v10))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue(global_queue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_3964C;
    v13[3] = &unk_1BF728;
    v14 = v10;
    v15 = self;
    v17 = v9;
    v16 = v8;
    dispatch_async(v12, v13);

  }
}

- (BOOL)helper:(id)a3 validateBookAuthorizationWithError:(id *)a4 needsCoordination:(BOOL)a5
{
  return 0;
}

- (id)_bookInfoForAssetAtURL:(id)a3 withMoc:(id)a4 error:(id *)a5 needsCoordination:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a6;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AEEpubInfoSource sharedInstance](AEEpubInfoSource, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bookInfoForURL:fromManagedObjectContext:error:needsCoordination:updateDate:", v10, v9, a5, v6, 0));

  return v12;
}

- (void)showPasswordDialogForBook:(id)a3 transaction:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  AEPDFPlugin *v39;
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;

  v7 = a3;
  v8 = a4;
  v32 = a5;
  if (!v8)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/AssetTypes/PDF/AEPDFPlugin.m", 414, "-[AEPDFPlugin showPasswordDialogForBook:transaction:withCompletion:]", "transaction", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));
  v9 = AEBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PDF Password Protected"), &stru_1C3088, 0));
  v12 = AEBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Please type the password below."), &stru_1C3088, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v11, v14, 1));

  v16 = AEBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1C3088, 0));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_3A2C4;
  v42[3] = &unk_1BF750;
  v42[4] = self;
  v19 = v32;
  v44 = v19;
  v20 = v15;
  v43 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 1, v42));
  objc_msgSend(v20, "addAction:", v21);

  v22 = AEBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1C3088, 0));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_3A334;
  v35[3] = &unk_1BF778;
  v36 = v20;
  v37 = v7;
  v38 = v33;
  v39 = self;
  v40 = v8;
  v41 = v19;
  v25 = v8;
  v26 = v19;
  v27 = v33;
  v28 = v7;
  v29 = v20;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 0, v35));
  objc_msgSend(v29, "addAction:", v30);

  objc_msgSend(v29, "addTextFieldWithConfigurationHandler:", &stru_1BF7B8);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine appInfoMgr](AEAssetEngine, "appInfoMgr"));
  objc_msgSend(v31, "presentViewController:transaction:animated:completion:", v29, v25, 1, 0);

}

- (AEAnnotationProvider)sharedAnnotationProvider
{
  return self->_sharedAnnotationProvider;
}

- (void)setSharedAnnotationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, a3);
}

- (BCCoverResetting)sharedBookCoverResetter
{
  return self->_sharedBookCoverResetter;
}

- (void)setSharedBookCoverResetter:(id)a3
{
  objc_storeStrong((id *)&self->_sharedBookCoverResetter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedBookCoverResetter, 0);
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, 0);
}

@end
