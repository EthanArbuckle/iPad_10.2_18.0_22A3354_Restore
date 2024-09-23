@implementation ICEvernoteFileParser

- (ICEvernoteFileParser)init
{
  ICEvernoteFileParser *v2;
  ICNotesImporterClient *v3;
  ICNotesImporterClient *notesImporterClient;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *contentParseQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICEvernoteFileParser;
  v2 = -[ICEvernoteFileParser init](&v10, "init");
  if (v2)
  {
    v3 = (ICNotesImporterClient *)objc_alloc_init((Class)ICNotesImporterClient);
    notesImporterClient = v2->_notesImporterClient;
    v2->_notesImporterClient = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.notes.EvernoteFileParser", v6);
    contentParseQueue = v2->_contentParseQueue;
    v2->_contentParseQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)totalNotesFoundAtFileURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  void (**v12)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[ICEvernoteFileParser isParsing](self, "isParsing"))
  {
    v8 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10009E84C();

    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    -[ICEvernoteFileParser setIsParsing:](self, "setIsParsing:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICEvernoteFileParser bookmarkDataFromFileURL:](self, "bookmarkDataFromFileURL:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICEvernoteFileParser notesImporterClient](self, "notesImporterClient"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001AA78;
    v11[3] = &unk_1000D6310;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v10, "countEvernoteNotesFromBookmarkData:completionBlock:", v9, v11);

  }
}

- (void)parseFileURL:(id)a3 newNoteBlock:(id)a4 updatedNoteBlock:(id)a5 errorBlock:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD);
  id v25;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(_QWORD))a7;
  if (-[ICEvernoteFileParser isParsing](self, "isParsing"))
  {
    v17 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_10009E84C();

    if (v16)
      v16[2](v16);
  }
  else
  {
    -[ICEvernoteFileParser setIsParsing:](self, "setIsParsing:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICEvernoteFileParser bookmarkDataFromFileURL:](self, "bookmarkDataFromFileURL:", v12));
    objc_initWeak(&location, self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICEvernoteFileParser notesImporterClient](self, "notesImporterClient"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001ACB8;
    v20[3] = &unk_1000D6400;
    objc_copyWeak(&v25, &location);
    v20[4] = self;
    v21 = v15;
    v22 = v13;
    v23 = v14;
    v24 = v16;
    objc_msgSend(v19, "archiveEvernoteNotesFromBookmarkData:completionBlock:", v18, v20);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
}

- (NSArray)allowedContentTypes
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UTType importedTypeWithIdentifier:](UTType, "importedTypeWithIdentifier:", CFSTR("com.evernote.enex")));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

- (BOOL)canHandleFileURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICEvernoteFileParser getTypeIdentifierForFileURL:](self, "getTypeIdentifierForFileURL:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UTType importedTypeWithIdentifier:](UTType, "importedTypeWithIdentifier:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UTType importedTypeWithIdentifier:](UTType, "importedTypeWithIdentifier:", CFSTR("com.evernote.enex")));
  v6 = objc_msgSend(v4, "conformsToType:", v5);

  return v6;
}

- (void)cancelParsing
{
  NSObject *v3;

  if (-[ICEvernoteFileParser isParsing](self, "isParsing"))
  {
    -[ICEvernoteFileParser setShouldCancelParsingProcess:](self, "setShouldCancelParsingProcess:", 1);
  }
  else
  {
    v3 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_10009E8A8();

  }
}

- (id)bookmarkDataFromFileURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v3 = a3;
  v8 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 512, 0, 0, &v8));
  v5 = v8;
  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10009E8D4((uint64_t)v3, v6);

    v4 = 0;
  }

  return v4;
}

- (void)addAttachmentsInContent:(id)a3 forEvernoteResource:(id)a4 forNote:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char *v14;
  void *v15;
  char *v16;
  void *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  char *v37;
  void *v38;
  uint8_t v39;
  char v40[15];
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "md5Hash"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "md5Hash"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{{NotesAttachment:%@}}"), v11));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "string"));
        v13 = objc_msgSend(v12, "length");

        if (v13)
        {
          v14 = 0;
          do
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "string"));
            v16 = (char *)((_BYTE *)objc_msgSend(v15, "length") - v14);

            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "string"));
            v18 = (char *)objc_msgSend(v17, "rangeOfString:options:range:", v38, 2, v14, v16);
            v20 = v19;

            if (v18 == (char *)0x7FFFFFFFFFFFFFFFLL)
              break;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mime"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithMIMEType:](UTType, "typeWithMIMEType:", v21));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fileName"));
            v25 = v24;
            v26 = v24
                ? v24
                : (id)objc_claimAutoreleasedReturnValue(+[ICAttachment filenameFromUTI:](ICAttachment, "filenameFromUTI:", v23));
            v27 = v26;

            v47 = 0;
            v48 = &v47;
            v49 = 0x3032000000;
            v50 = sub_10001B4F0;
            v51 = sub_10001B500;
            v52 = 0;
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v41[2] = sub_10001BFA0;
            v41[3] = &unk_1000D6428;
            v42 = v9;
            v29 = v23;
            v43 = v29;
            v44 = v8;
            v30 = v27;
            v45 = v30;
            v46 = &v47;
            objc_msgSend(v28, "performBlockAndWait:", v41);

            if (v48[5])
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:"));
              v32 = objc_msgSend(v31, "mutableCopy");

              objc_msgSend(v32, "addAttribute:value:range:", NSAttachmentAttributeName, v48[5], 0, objc_msgSend(v32, "length"));
              v33 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("\n"));
              objc_msgSend(v32, "appendAttributedString:", v33);

              objc_msgSend(v7, "replaceCharactersInRange:withAttributedString:", v18, v20, v32);
              v34 = objc_msgSend(v32, "length");

            }
            else
            {
              v35 = os_log_create("com.apple.notes", "Import");
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                sub_10009E948(&v39, v40, v35);

              objc_msgSend(v7, "replaceCharactersInRange:withString:", v18, v20, CFSTR("\n\n"));
              v34 = objc_msgSend(CFSTR("\n\n"), "length");
            }
            v14 = &v18[(_QWORD)v34];

            _Block_object_dispose(&v47, 8);
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "string"));
            v37 = (char *)objc_msgSend(v36, "length");

          }
          while (v14 < v37);
        }

      }
    }
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "content", "-[ICEvernoteFileParser addAttachmentsInContent:forEvernoteResource:forNote:]", 1, 0, CFSTR("Can't add attachment to nil content."));
  }

}

- (void)addTodoListsIfNeededInContent:(id)a3 forEvernoteNote:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _UNKNOWN **v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v29 = v6;
    v30 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("\\{\\{NotesCheckbox\\:(.+?)\\}\\}"), 1, &v30));
    v28 = v30;
    v9 = &ICTTAttributeNameUnderline_ptr;
    while (1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));
      v12 = (char *)objc_msgSend(v8, "rangeOfFirstMatchInString:options:range:", v10, 1, 0, objc_msgSend(v11, "length"));
      v14 = v13;

      if (v12 == (char *)0x7FFFFFFFFFFFFFFFLL && !v14)
        break;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringWithRange:", v12 + 16, v14 - 18));

      v17 = objc_msgSend(objc_alloc((Class)v9[91]), "initWithString:", &stru_1000DAF38);
      objc_msgSend(v5, "replaceCharactersInRange:withAttributedString:", v12, v14, v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICTTParagraphStyle paragraphStyleNamed:](ICTTParagraphStyle, "paragraphStyleNamed:", 103));
      if (objc_msgSend(v16, "BOOLValue"))
      {
        v19 = objc_msgSend(v18, "mutableCopy");
        v20 = v9;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "todo"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "todoWithDone:", 1));
        objc_msgSend(v19, "setTodo:", v22);

        v9 = v20;
        v23 = objc_msgSend(v19, "copy");

        v18 = v23;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));
      v25 = objc_msgSend(v24, "paragraphRangeForRange:", v12, 0);
      v27 = v26;

      objc_msgSend(v5, "addAttribute:value:range:", ICTTAttributeNameParagraphStyle, v18, v25, v27);
    }

    v7 = v29;
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "content", "-[ICEvernoteFileParser addTodoListsIfNeededInContent:forEvernoteNote:]", 1, 0, CFSTR("Can't add todo lists to nil content."));
  }

}

- (void)addTitleInContent:(id)a3 forEvernoteNote:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("\n"));
  objc_msgSend(v6, "insertAttributedString:atIndex:", v7, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICTTParagraphStyle paragraphStyleNamed:](ICTTParagraphStyle, "paragraphStyleNamed:", 0));
  v9 = objc_alloc((Class)NSAttributedString);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));

  v11 = &stru_1000DAF38;
  if (v10)
    v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@\n"), v11));
  v15 = ICTTAttributeNameParagraphStyle;
  v16 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v14 = objc_msgSend(v9, "initWithString:attributes:", v12, v13);

  objc_msgSend(v6, "insertAttributedString:atIndex:", v14, 0);
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
      sub_10009E4D4(v6, (uint64_t)v3, v7);

  }
  return v5;
}

- (ICNotesImporterClient)notesImporterClient
{
  return self->_notesImporterClient;
}

- (void)setNotesImporterClient:(id)a3
{
  objc_storeStrong((id *)&self->_notesImporterClient, a3);
}

- (OS_dispatch_queue)contentParseQueue
{
  return self->_contentParseQueue;
}

- (void)setContentParseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_contentParseQueue, a3);
}

- (BOOL)isParsing
{
  return self->_isParsing;
}

- (void)setIsParsing:(BOOL)a3
{
  self->_isParsing = a3;
}

- (BOOL)shouldCancelParsingProcess
{
  return self->_shouldCancelParsingProcess;
}

- (void)setShouldCancelParsingProcess:(BOOL)a3
{
  self->_shouldCancelParsingProcess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentParseQueue, 0);
  objc_storeStrong((id *)&self->_notesImporterClient, 0);
}

@end
