@implementation BKDocument

- (CGRect)estimatedFixedLayoutViewFrame
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __n128 v15;
  double v16;
  double v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CGFloat y;
  double v35;
  double v36;
  double v37;
  double x;
  double v39;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument fixedLayoutWidth](self, "fixedLayoutWidth"));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument fixedLayoutHeight](self, "fixedLayoutHeight"));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v5 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_11C3CC();
    v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v18)
      sub_11C394(v18, v19, v20, v21, v22, v23, v24, v25);
  }
  else if (v8 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_11C304();
    v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v26)
      sub_11C2CC(v26, v27, v28, v29, v30, v31, v32, v33);
  }
  else
  {
    v9 = v5 / v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    v16 = v12 / (v5 / v8);
    if (v5 > v12)
    {
      v17 = v12;
    }
    else
    {
      v16 = v8;
      v17 = v5;
    }
    v15.n128_f64[0] = v9 * v14;
    if (v16 <= v14)
      v8 = v16;
    else
      v8 = v14;
    if (v16 <= v14)
      v5 = v17;
    else
      v5 = v9 * v14;
  }
  y = CGRectZero.origin.y;
  v35 = IMSizeRound(v5, v8, v15);
  v37 = v36;
  x = CGRectZero.origin.x;
  v39 = y;
  result.size.height = v37;
  result.size.width = v35;
  result.origin.y = v39;
  result.origin.x = x;
  return result;
}

- (CGSize)fixedLayoutSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument fixedLayoutWidth](self, "fixedLayoutWidth"));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument fixedLayoutHeight](self, "fixedLayoutHeight"));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)copyPropertiesFrom:(id)a3
{
  id v4;
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
  void *v21;
  void *v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookDatabaseKey"));
  -[BKDocument setBookDatabaseKey:](self, "setBookDatabaseKey:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "href"));
  -[BKDocument setHref:](self, "setHref:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mime"));
  -[BKDocument setMime:](self, "setMime:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "compressionAlgorithm"));
  -[BKDocument setCompressionAlgorithm:](self, "setCompressionAlgorithm:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encryptionAlgorithm"));
  -[BKDocument setEncryptionAlgorithm:](self, "setEncryptionAlgorithm:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "documentOrdinal"));
  -[BKDocument setDocumentOrdinal:](self, "setDocumentOrdinal:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileSize"));
  -[BKDocument setFileSize:](self, "setFileSize:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hasTocElements"));
  -[BKDocument setHasTocElements:](self, "setHasTocElements:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hasLandmarkElements"));
  -[BKDocument setHasLandmarkElements:](self, "setHasLandmarkElements:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hasPhysicalElements"));
  -[BKDocument setHasPhysicalElements:](self, "setHasPhysicalElements:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nonlinearElement"));
  -[BKDocument setNonlinearElement:](self, "setNonlinearElement:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaOverlayHref"));
  -[BKDocument setMediaOverlayHref:](self, "setMediaOverlayHref:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaOverlayParsed"));
  -[BKDocument setMediaOverlayParsed:](self, "setMediaOverlayParsed:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sinfNumber"));
  -[BKDocument setSinfNumber:](self, "setSinfNumber:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fallbackId"));
  -[BKDocument setFallbackId:](self, "setFallbackId:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manifestId"));
  -[BKDocument setManifestId:](self, "setManifestId:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manifestProperties"));
  -[BKDocument setManifestProperties:](self, "setManifestProperties:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "orthography"));
  -[BKDocument setOrthography:](self, "setOrthography:", v22);

  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isDuplicateSpineEntry"));
  -[BKDocument setIsDuplicateSpineEntry:](self, "setIsDuplicateSpineEntry:", v23);

}

+ (id)newEmptyDocument:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  *(_QWORD *)&v4 = objc_opt_class(BKDocument).n128_u64[0];
  v6 = objc_msgSend(v3, "newByClass:", v5, v4);

  return v6;
}

- (BOOL)hasMediaOverlayElements
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument mediaOverlayHref](self, "mediaOverlayHref"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)mediaOverlayElements
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (-[BKDocument hasMediaOverlayElements](self, "hasMediaOverlayElements"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument mediaOverlayParsed](self, "mediaOverlayParsed"));
    v4 = objc_msgSend(v3, "BOOLValue");

    if ((v4 & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument managedObjectContext](self, "managedObjectContext"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument bookDatabaseKey](self, "bookDatabaseKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookInfo bookFromDatabaseKey:withMOC:](AEBookInfo, "bookFromDatabaseKey:withMOC:", v6, v5));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookContentSubpath"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "basePlusContentPath"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "basePlusContentPath"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument mediaOverlayHref](self, "mediaOverlayHref"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v11));

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument bookDatabaseKey](self, "bookDatabaseKey"));
        v14 = +[BKMediaOverlayElement parseSMIL:contentSubpath:bookBasePath:bookDatabaseKey:managedObjectContext:](BKMediaOverlayElement, "parseSMIL:contentSubpath:bookBasePath:bookDatabaseKey:managedObjectContext:", v12, v8, v9, v13, v5);

        if ((_DWORD)v14)
        {
          NSLog(CFSTR("SMIL Parsing failed: %d Path: %@"), v14, v12);
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
          -[BKDocument setMediaOverlayParsed:](self, "setMediaOverlayParsed:", v16);

          objc_msgSend(v5, "save:", 0);
        }

      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument href](self, "href"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument bookDatabaseKey](self, "bookDatabaseKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("documentHref == %@ AND bookDatabaseKey == %@"), v17, v18));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument managedObjectContext](self, "managedObjectContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("BKMediaOverlayElement"), v19, CFSTR("documentAbsoluteOrder"), 1, 0));

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

+ (id)documentKeyWithHref:(id)a3 documentOrdinal:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (qword_20F5F0 == -1)
  {
    if (!v5)
    {
LABEL_6:
      v7 = v5;
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_20F5F0, &stru_1C10D0);
    if (!v5)
      goto LABEL_6;
  }
  if (!v6)
    goto LABEL_6;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v5, v6));
LABEL_7:
  v8 = v7;

  return v8;
}

- (id)documentKey
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument href](self, "href", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument documentOrdinal](self, "documentOrdinal"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "documentKeyWithHref:documentOrdinal:", v6, v7));

  return v8;
}

- (int64_t)unboxedDocumentOrdinal
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKDocument documentOrdinal](self, "documentOrdinal"));
  v3 = v2;
  if (v2)
    v4 = (int64_t)objc_msgSend(v2, "integerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (unint64_t)linearDocumentIndex
{
  return self->linearDocumentIndex;
}

- (void)setLinearDocumentIndex:(unint64_t)a3
{
  self->linearDocumentIndex = a3;
}

@end
