@implementation THAnnotationSearchIndexBuildOperation

- (THAnnotationSearchIndexBuildOperation)initWithDelegate:(id)a3 documentRoot:(id)a4
{
  THAnnotationSearchIndexBuildOperation *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THAnnotationSearchIndexBuildOperation;
  result = -[THAnnotationSearchIndexBuildOperation init](&v7, "init");
  if (result)
  {
    result->mDelegate = (THAnnotationSearchIndexBuildOperationDelegate *)a3;
    result->mDocumentRoot = (THDocumentRoot *)a4;
  }
  return result;
}

- (void)main
{
  id v3;
  id v4;
  THAnnotationSearchIndex *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSAutoreleasePool);
  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v5 = -[THDocumentRoot annotationSearchIndex](self->mDocumentRoot, "annotationSearchIndex");
  -[THSearchIndex unload](v5, "unload");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = -[THAnnotationStorageController allAnnotations](-[THDocumentRoot annotationController](self->mDocumentRoot, "annotationController"), "allAnnotations");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        -[THAnnotationSearchIndex addTermsForAnnotation:](v5, "addTermsForAnnotation:", v10);
        if (objc_msgSend(objc_msgSend(v10, "annotationNote"), "length"))
          objc_msgSend(v4, "setObject:forKey:", objc_msgSend(v10, "annotationNote"), objc_msgSend(v10, "annotationUuid"));
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  -[THAnnotationSearchIndexBuildOperationDelegate setAnnotationSearchRefText:](self->mDelegate, "setAnnotationSearchRefText:", v4);

}

@end
