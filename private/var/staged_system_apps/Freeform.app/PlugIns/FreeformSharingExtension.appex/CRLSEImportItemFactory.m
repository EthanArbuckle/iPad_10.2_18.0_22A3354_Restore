@implementation CRLSEImportItemFactory

- (CRLSEImportItemFactory)init
{
  CRLSEImportItemFactory *v2;
  CRLSEImportItemFactory *v3;
  uint64_t v4;
  NSCharacterSet *emptyStringCharacterSet;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLSEImportItemFactory;
  v2 = -[CRLSEImportItemFactory init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CRLSEImportItemFactory p_makeEmptyStringCharacterSet](v2, "p_makeEmptyStringCharacterSet"));
    emptyStringCharacterSet = v3->_emptyStringCharacterSet;
    v3->_emptyStringCharacterSet = (NSCharacterSet *)v4;

  }
  return v3;
}

- (void)createImportItems:(id)a3 skipTextAttachments:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  UTType *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  id v33;
  dispatch_queue_global_t global_queue;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  int v39;
  id obj;
  id v42;
  _QWORD block[4];
  id v44;
  id v45;
  _QWORD v46[6];
  id v47;
  NSObject *v48;
  _QWORD v49[6];
  id v50;
  NSObject *v51;
  _QWORD v52[5];
  id v53;
  NSObject *v54;
  _QWORD v55[6];
  id v56;
  NSObject *v57;
  _QWORD v58[5];
  id v59;
  NSObject *v60;
  _QWORD v61[5];
  id v62;
  NSObject *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[4];
  uint64_t v69;
  _BYTE v70[128];

  v6 = a4;
  v7 = a3;
  v38 = a5;
  v42 = objc_alloc_init((Class)NSMutableArray);
  v8 = dispatch_group_create();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v65;
    v12 = UTTypeURL;
    v39 = !v6;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v65 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v13);
        if (CRLSharingExtensionCat_init_token != -1)
          dispatch_once(&CRLSharingExtensionCat_init_token, &stru_100061810);
        v15 = CRLSharingExtensionCat_log_t;
        if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_DEBUG))
          sub_10004C120(v68, v15, v14, &v69);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[UTType identifier](v12, "identifier"));
        v17 = objc_msgSend(v14, "hasItemConformingToTypeIdentifier:", v16);

        if (v17)
        {
          dispatch_group_enter(v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[UTType identifier](v12, "identifier"));
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472;
          v61[2] = sub_10000ABB0;
          v61[3] = &unk_100061838;
          v61[4] = self;
          v62 = v42;
          v63 = v8;
          objc_msgSend(v14, "loadItemForTypeIdentifier:options:completionHandler:", v18, 0, v61);

          v19 = v62;
LABEL_12:

          goto LABEL_18;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePlainText, "identifier"));
        v21 = objc_msgSend(v14, "hasItemConformingToTypeIdentifier:", v20) & v39;

        if (v21 == 1)
        {
          dispatch_group_enter(v8);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePlainText, "identifier"));
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_10000AC34;
          v58[3] = &unk_100061860;
          v58[4] = self;
          v59 = v42;
          v60 = v8;
          objc_msgSend(v14, "loadItemForTypeIdentifier:options:completionHandler:", v22, 0, v58);

LABEL_17:
          v12 = UTTypeURL;
          goto LABEL_18;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRAWImage, "identifier"));
        v24 = objc_msgSend(v14, "hasItemConformingToTypeIdentifier:", v23);

        if (v24)
        {
          dispatch_group_enter(v8);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRAWImage, "identifier"));
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_10000AD04;
          v55[3] = &unk_1000618C8;
          v55[4] = self;
          v55[5] = v14;
          v56 = v42;
          v57 = v8;
          objc_msgSend(v14, "loadItemForTypeIdentifier:options:completionHandler:", v25, 0, v55);

          goto LABEL_17;
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
        v27 = objc_msgSend(v14, "hasItemConformingToTypeIdentifier:", v26);

        if (v27)
        {
          dispatch_group_enter(v8);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeData, "identifier"));
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_10000B1EC;
          v52[3] = &unk_1000618F0;
          v52[4] = self;
          v53 = v42;
          v54 = v8;
          objc_msgSend(v14, "loadItemForTypeIdentifier:options:completionHandler:", v28, 0, v52);

          goto LABEL_17;
        }
        v12 = UTTypeURL;
        if ((objc_msgSend(v14, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.mapkit.map-item")) & 1) == 0)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "identifier"));
          v30 = objc_msgSend(v14, "hasItemConformingToTypeIdentifier:", v29);

          dispatch_group_enter(v8);
          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "identifier"));
            v49[0] = _NSConcreteStackBlock;
            v49[1] = 3221225472;
            v49[2] = sub_10000B270;
            v49[3] = &unk_1000618C8;
            v49[4] = self;
            v49[5] = v14;
            v50 = v42;
            v51 = v8;
            objc_msgSend(v14, "loadItemForTypeIdentifier:options:completionHandler:", v31, 0, v49);

            v19 = v50;
          }
          else
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeData, "identifier"));
            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472;
            v46[2] = sub_10000B5E0;
            v46[3] = &unk_100061978;
            v46[4] = self;
            v46[5] = v14;
            v47 = v42;
            v48 = v8;
            objc_msgSend(v14, "loadItemForTypeIdentifier:options:completionHandler:", v32, 0, v46);

            v19 = v47;
          }
          goto LABEL_12;
        }
LABEL_18:
        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      v10 = v33;
    }
    while (v33);
  }

  global_queue = dispatch_get_global_queue(0, 0);
  v35 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B710;
  block[3] = &unk_1000619A0;
  v44 = v42;
  v45 = v38;
  v36 = v42;
  v37 = v38;
  dispatch_group_notify(v8, v35, block);

}

- (void)p_logItemProviderError:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (CRLSharingExtensionCat_init_token != -1)
    dispatch_once(&CRLSharingExtensionCat_init_token, &stru_1000619C0);
  v7 = CRLSharingExtensionCat_log_t;
  if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_ERROR))
    sub_10004C34C(v7, v5, v6);

}

- (BOOL)p_urlIsValidImage:(id)a3
{
  const __CFURL *v3;
  const __CFDictionary *v4;
  CGImageSource *v5;
  size_t Count;
  CFStringRef v8;
  void *v9;

  v8 = kCGImageSourceShouldCache;
  v9 = &__kCFBooleanFalse;
  v3 = (const __CFURL *)a3;
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v5 = CGImageSourceCreateWithURL(v3, v4);

  Count = CGImageSourceGetCount(v5);
  if (v5)
    CFRelease(v5);

  return Count != 0;
}

- (id)p_makeEmptyStringCharacterSet
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  __int16 v7;

  v7 = -4;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v7, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableCharacterSet characterSetWithCharactersInString:](NSMutableCharacterSet, "characterSetWithCharactersInString:", v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  objc_msgSend(v3, "formUnionWithCharacterSet:", v4);

  v5 = objc_msgSend(v3, "copy");
  return v5;
}

- (BOOL)p_stringIsConsideredEmpty:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByTrimmingCharactersInSet:", self->_emptyStringCharacterSet));
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (NSString)defaultImageFileName
{
  return self->_defaultImageFileName;
}

- (void)setDefaultImageFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultImageFileName, 0);
  objc_storeStrong((id *)&self->_emptyStringCharacterSet, 0);
}

@end
