@implementation ICImportNoteGeneralFileParser

- (ICImportNoteGeneralFileParser)init
{
  ICImportNoteGeneralFileParser *v2;
  ICNotesImporterClient *v3;
  ICNotesImporterClient *notesImporterClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICImportNoteGeneralFileParser;
  v2 = -[ICImportNoteGeneralFileParser init](&v6, "init");
  if (v2)
  {
    v3 = (ICNotesImporterClient *)objc_alloc_init((Class)ICNotesImporterClient);
    notesImporterClient = v2->_notesImporterClient;
    v2->_notesImporterClient = v3;

  }
  return v2;
}

- (NSArray)allowedContentTypes
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", CFSTR("com.apple.stickies.appexport"), UTTypeText, UTTypeHTML, UTTypeRTF, UTTypeRTFD));
  v5[4] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 5));

  return (NSArray *)v3;
}

- (BOOL)canHandleFileURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteGeneralFileParser getTypeIdentifierForFileURL:](self, "getTypeIdentifierForFileURL:", v4));
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteGeneralFileParser allowedContentTypes](self, "allowedContentTypes"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002D8B4;
  v9[3] = &unk_1000D6978;
  v11 = &v12;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  LOBYTE(v6) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v6;
}

- (void)totalNotesFoundAtFileURL:(id)a3 completionBlock:(id)a4
{
  if (a4)
    (*((void (**)(id, BOOL))a4 + 2))(a4, a3 != 0);
}

- (void)parseFileURL:(id)a3 newNoteBlock:(id)a4 updatedNoteBlock:(id)a5 errorBlock:(id)a6 completionBlock:(id)a7
{
  id v12;
  void (**v13)(id, id);
  void (**v14)(id, id);
  void (**v15)(_QWORD);
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t (**v57)(void);
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  id v82;
  _QWORD v83[2];
  _QWORD v84[2];
  uint8_t buf[4];
  id v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  id v90;

  v12 = a3;
  v57 = (uint64_t (**)(void))a4;
  v13 = (void (**)(id, id))a5;
  v14 = (void (**)(id, id))a6;
  v15 = (void (**)(_QWORD))a7;
  -[ICImportNoteGeneralFileParser setIsParsing:](self, "setIsParsing:", 1);
  v82 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteGeneralFileParser attributedStringContentFromFileURL:error:](self, "attributedStringContentFromFileURL:error:", v12, &v82));
  v17 = v82;
  if (v17)
  {
    v18 = v17;
    v19 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10009F488(v18);

    if (v14)
      v14[2](v14, v18);
    goto LABEL_14;
  }
  if (!v16)
  {
LABEL_13:
    v18 = 0;
LABEL_14:
    v28 = 0;
    goto LABEL_15;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "maximumAttachmentSizeMB"));
  v22 = objc_msgSend(v21, "unsignedLongLongValue");

  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v23 = objc_msgSend(v16, "length");
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_10002DFF4;
  v69[3] = &unk_1000D69A0;
  v55 = v12;
  v70 = v55;
  v71 = &v78;
  v72 = &v74;
  v73 = (_QWORD)v22 << 20;
  objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", NSAttachmentAttributeName, 0, v23, 0, v69);
  if (*((_BYTE *)v79 + 24))
  {
    v24 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v49 = (id)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", v75[3], 0));
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", (_QWORD)v22 << 20, 0));
      *(_DWORD *)buf = 138412802;
      v86 = v49;
      v87 = 2112;
      v88 = v50;
      v89 = 2112;
      v90 = v55;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Attachment size (%@) is greater then our max (%@) for %@", buf, 0x20u);

    }
    v84[0] = CFSTR("Note has an attachment that is too large");
    v83[0] = ICErrorFailureReasonKey;
    v83[1] = ICErrorAttachmentCountKey;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v75[3]));
    v84[1] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v84, v83, 2));
    v27 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", ICErrorDomain, 202, v26);

    if (v14)
      v14[2](v14, 0);

    _Block_object_dispose(&v74, 8);
    _Block_object_dispose(&v78, 8);
    goto LABEL_13;
  }

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
  if (v57)
  {
    v29 = v57[2]();
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  }
  else
  {
    v30 = 0;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "managedObjectContext"));
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_10002E25C;
  v66[3] = &unk_1000D5D38;
  v54 = v30;
  v67 = v54;
  v68 = v16;
  objc_msgSend(v31, "performBlockAndWait:", v66);

  v65 = 0;
  v64 = 0;
  objc_msgSend(v55, "getResourceValue:forKey:error:", &v65, NSURLCreationDateKey, &v64);
  v53 = v65;
  v32 = v64;
  if (v32)
  {
    v33 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_10009F420((uint64_t)v55, v33, v34, v35, v36, v37, v38, v39);

  }
  v63 = 0;
  v62 = 0;
  objc_msgSend(v55, "getResourceValue:forKey:error:", &v63, NSURLContentModificationDateKey, &v62);
  v51 = v63;
  v18 = v62;

  if (v18)
  {
    v40 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_10009F3B8((uint64_t)v55, v40, v41, v42, v43, v44, v45, v46);

  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "managedObjectContext", v51));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10002E34C;
  v58[3] = &unk_1000D5C58;
  v28 = v54;
  v59 = v28;
  v60 = v53;
  v61 = v52;
  v56 = v52;
  v48 = v53;
  objc_msgSend(v47, "performBlockAndWait:", v58);

  if (v13 && v28)
    v13[2](v13, v28);
LABEL_15:
  -[ICImportNoteGeneralFileParser setIsParsing:](self, "setIsParsing:", 0);
  if (v15)
    v15[2](v15);

}

- (id)attributedStringContentFromFileURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  unsigned __int8 v13;
  id *v14;
  id v15;
  void *v16;
  unsigned int v17;
  NSString *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  dispatch_semaphore_t v23;
  void *v24;
  NSObject *v25;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  NSAttributedStringDocumentAttributeKey v36;
  NSString *v37;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteGeneralFileParser getTypeIdentifierForFileURL:](self, "getTypeIdentifierForFileURL:", v6));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v7));
    v9 = objc_msgSend(v8, "conformsToType:", UTTypeHTML);

    if (v9)
    {
      v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfURL:encoding:error:](NSString, "stringWithContentsOfURL:encoding:error:", v6, 4, a4));
      v11 = v10;
      if (!a4 || !*a4)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByDeletingLastPathComponent"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote attributedStringFromHTMLString:baseURL:readerDelegate:](ICNote, "attributedStringFromHTMLString:baseURL:readerDelegate:", v11, v20, 0));
        v22 = objc_msgSend(v21, "mutableCopy");

        v30 = 0;
        v31 = &v30;
        v32 = 0x3032000000;
        v33 = sub_10002E758;
        v34 = sub_10002E768;
        v35 = 0;
        v23 = dispatch_semaphore_create(0);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportNoteGeneralFileParser notesImporterClient](self, "notesImporterClient"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10002E770;
        v27[3] = &unk_1000D6A08;
        v29 = &v30;
        v25 = v23;
        v28 = v25;
        objc_msgSend(v24, "parseTitleFromHTMLString:completionBlock:", v11, v27);

        dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
        -[ICImportNoteGeneralFileParser addTitleInContent:titleString:](self, "addTitleInContent:titleString:", v22, v31[5]);
        v15 = objc_msgSend(v22, "copy");

        _Block_object_dispose(&v30, 8);
        goto LABEL_14;
      }

    }
    v11 = NSPlainTextDocumentType;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v7));
    v13 = objc_msgSend(v12, "conformsToType:", UTTypeRTF);

    if ((v13 & 1) != 0)
    {
      v14 = (id *)&NSRTFTextDocumentType;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v7));
      v17 = objc_msgSend(v16, "conformsToType:", UTTypeRTFD);

      if (!v17)
      {
LABEL_12:
        v19 = objc_alloc((Class)NSAttributedString);
        v36 = NSDocumentTypeDocumentAttribute;
        v37 = v11;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
        v15 = objc_msgSend(v19, "initWithURL:options:documentAttributes:error:", v6, v20, 0, a4);
LABEL_14:

        goto LABEL_15;
      }
      v14 = (id *)&NSRTFDTextDocumentType;
    }
    v18 = (NSString *)*v14;

    v11 = v18;
    goto LABEL_12;
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (void)addTitleInContent:(id)a3 titleString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7));

  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("\n"));
    objc_msgSend(v5, "insertAttributedString:atIndex:", v9, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICTTParagraphStyle paragraphStyleNamed:](ICTTParagraphStyle, "paragraphStyleNamed:", 0));
    v11 = objc_alloc((Class)NSAttributedString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n"), v8));
    v15 = ICTTAttributeNameParagraphStyle;
    v16 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v14 = objc_msgSend(v11, "initWithString:attributes:", v12, v13);

    objc_msgSend(v5, "insertAttributedString:atIndex:", v14, 0);
  }

}

- (id)getTypeIdentifierForFileURL:(id)a3
{
  id v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  NSObject *v7;
  id v9;
  id v10;

  v3 = a3;
  v10 = 0;
  v9 = 0;
  v4 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v10, NSURLTypeIdentifierKey, &v9);
  v5 = v10;
  v6 = v9;
  if ((v4 & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10009F510(v6);

  }
  return v5;
}

- (BOOL)isParsing
{
  return self->_isParsing;
}

- (void)setIsParsing:(BOOL)a3
{
  self->_isParsing = a3;
}

- (ICNotesImporterClient)notesImporterClient
{
  return self->_notesImporterClient;
}

- (void)setNotesImporterClient:(id)a3
{
  objc_storeStrong((id *)&self->_notesImporterClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notesImporterClient, 0);
}

@end
