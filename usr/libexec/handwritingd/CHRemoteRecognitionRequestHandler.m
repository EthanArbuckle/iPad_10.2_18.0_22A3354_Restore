@implementation CHRemoteRecognitionRequestHandler

- (CHRemoteRecognitionRequestHandler)initWithServerQueue:(id)a3 lowPriorityQueue:(id)a4 highPriorityQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHRemoteRecognitionRequestHandler *v11;
  CHCachedRecognizerManager *v12;
  CHCachedRecognizerManager *recognizerManager;
  CHRecognizerInferenceCache *v14;
  CHRecognizerInferenceCache *recognizerInferenceCache;
  CHRecognizerResultCache *v16;
  CHRecognizerResultCache *recognizerResultsCache;
  uint64_t v18;
  CHStrokeClassificationModel *scriptClassifier;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CHRemoteRecognitionRequestHandler;
  v11 = -[CHRemoteRequestHandlerBase initWithServerQueue:lowPriorityQueue:highPriorityQueue:](&v21, "initWithServerQueue:lowPriorityQueue:highPriorityQueue:", v8, v9, v10);
  if (v11)
  {
    v12 = objc_alloc_init(CHCachedRecognizerManager);
    recognizerManager = v11->_recognizerManager;
    v11->_recognizerManager = v12;

    v14 = (CHRecognizerInferenceCache *)objc_alloc_init((Class)CHRecognizerInferenceCache);
    recognizerInferenceCache = v11->_recognizerInferenceCache;
    v11->_recognizerInferenceCache = v14;

    v16 = (CHRecognizerResultCache *)objc_alloc_init((Class)CHRecognizerResultCache);
    recognizerResultsCache = v11->_recognizerResultsCache;
    v11->_recognizerResultsCache = v16;

    v11->_openRequestCount = 0;
    if (_os_feature_enabled_impl("CoreHandwriting", "script_classification_sunglow"))
    {
      v18 = objc_claimAutoreleasedReturnValue(+[CHStrokeClassificationModel modelWithModelName:](CHStrokeClassificationModel, "modelWithModelName:", CFSTR("script_classification.bundle")));
      scriptClassifier = v11->_scriptClassifier;
      v11->_scriptClassifier = (CHStrokeClassificationModel *)v18;
    }
    else
    {
      scriptClassifier = v11->_scriptClassifier;
      v11->_scriptClassifier = 0;
    }

  }
  return v11;
}

- (void)dealloc
{
  CHCachedRecognizerManager *recognizerManager;
  CHInputContextLexiconManager *lexiconManager;
  CHRecognizerInferenceCache *recognizerInferenceCache;
  CHStrokeClassificationModel *scriptClassifier;
  objc_super v7;

  recognizerManager = self->_recognizerManager;
  self->_recognizerManager = 0;

  lexiconManager = self->_lexiconManager;
  self->_lexiconManager = 0;

  recognizerInferenceCache = self->_recognizerInferenceCache;
  self->_recognizerInferenceCache = 0;

  scriptClassifier = self->_scriptClassifier;
  self->_scriptClassifier = 0;

  v7.receiver = self;
  v7.super_class = (Class)CHRemoteRecognitionRequestHandler;
  -[CHRemoteRecognitionRequestHandler dealloc](&v7, "dealloc");
}

- (id)_queueForRequest:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "priority");
  if (!v5)
    goto LABEL_4;
  if (v5 == (id)1)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase highPriorityQueue](self, "highPriorityQueue"));
    goto LABEL_6;
  }
  if (v5 == (id)2)
  {
LABEL_4:
    v6 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase lowPriorityQueue](self, "lowPriorityQueue"));
LABEL_6:
    v7 = (void *)v6;

    return v7;
  }
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v8 = (id)qword_10002AE38;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid recognition request priority specified", v10, 2u);
  }

  return 0;
}

- (void)handleRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C328;
  block[3] = &unk_100024B60;
  block[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_sync(v11, block);

}

+ (id)_invalidInputErrorWithDescription:(id)a3 failureReason:(id)a4 recoverySuggestion:(id)a5 errorCode:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[3];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15[0] = NSLocalizedDescriptionKey;
  v15[1] = NSLocalizedFailureReasonErrorKey;
  v16[0] = v9;
  v16[1] = v10;
  v15[2] = NSLocalizedRecoverySuggestionErrorKey;
  v16[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corehandwriting"), a6, v12));

  return v13;
}

+ (id)_maxStrokeLimitErrorWithInputDrawingStrokeCount:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[3];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("The number of strokes in the input drawing exceeds the maximum number permitted for remote recognition (%ld strokes)"), &stru_100025708, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Remote recognition cannot handle the input drawing (%ld strokes) because its stroke count exceeds the limit"), &stru_100025708, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Submit drawings that do not exceed the stroke limit of remote recognition"), &stru_100025708, 0));

  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, objc_msgSend((id)objc_opt_class(CHRemoteRecognizer), "absoluteMaxStrokeCountPerRequest"), NSLocalizedDescriptionKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v17[0] = v11;
  v16[1] = NSLocalizedFailureReasonErrorKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, a3));
  v16[2] = NSLocalizedRecoverySuggestionErrorKey;
  v17[1] = v12;
  v17[2] = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corehandwriting"), -1000, v13));
  return v14;
}

- (BOOL)isValidRemoteRequest:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "lowercaseString"));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.compose"));

  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "drawing"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "drawing"));
      v13 = objc_msgSend(v12, "strokeCount");

      if (v13)
      {
        if ((v10 & 1) != 0
          || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "drawing")),
              v15 = objc_msgSend(v14, "strokeCount"),
              v16 = objc_msgSend((id)objc_opt_class(CHRemoteRecognizer), "absoluteMaxStrokeCountPerRequest"), v14, v15 <= v16))
        {
          v19 = 0;
          v20 = 1;
          if (!a5)
            goto LABEL_15;
        }
        else
        {
          v17 = (void *)objc_opt_class(self);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "drawing"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_maxStrokeLimitErrorWithInputDrawingStrokeCount:", objc_msgSend(v18, "strokeCount")));

          v20 = 0;
          if (!a5)
            goto LABEL_15;
        }
        goto LABEL_14;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("The input drawing is empty (contains no strokes)"), &stru_100025708, 0));

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Recognition cannot be performed on empty drawings"), &stru_100025708, 0));

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Submit drawings containing at least one stroke for recognition"), &stru_100025708, 0));

      v36 = objc_msgSend((id)objc_opt_class(self), "_invalidInputErrorWithDescription:failureReason:recoverySuggestion:errorCode:", v22, v24, v26, -1001);
      v28 = objc_claimAutoreleasedReturnValue(v36);
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("The input drawing is invalid"), &stru_100025708, 0));

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Remote recognition cannot handle empty input drawings"), &stru_100025708, 0));

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Submit valid drawings with one or more strokes for recognition"), &stru_100025708, 0));

      v32 = objc_msgSend((id)objc_opt_class(self), "_invalidInputErrorWithDescription:failureReason:recoverySuggestion:errorCode:", v22, v24, v26, -1001);
      v28 = objc_claimAutoreleasedReturnValue(v32);
    }
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("The recognition request is invalid"), &stru_100025708, 0));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Remote recognition cannot process an empty recognition request"), &stru_100025708, 0));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Submit a new valid recognition request"), &stru_100025708, 0));

    v27 = objc_msgSend((id)objc_opt_class(self), "_invalidInputErrorWithDescription:failureReason:recoverySuggestion:errorCode:", v22, v24, v26, -1002);
    v28 = objc_claimAutoreleasedReturnValue(v27);
  }
  v19 = (void *)v28;

  v20 = 0;
  if (a5)
LABEL_14:
    *a5 = objc_retainAutorelease(v19);
LABEL_15:

  return v20;
}

- (id)_buildMultiLingualResultForRequest:(id)a3 recognitionLocales:(id)a4 recognizersByLocale:(id)a5 statisticsByLocale:(id)a6
{
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CHRecognizerInferenceCache *recognizerInferenceCache;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  uint64_t v33;
  uint64_t v34;
  CHRecognizerInferenceCache *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned __int8 v47;
  int v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  os_signpost_id_t v56;
  NSObject *v57;
  NSObject *v58;
  unint64_t v59;
  NSObject *v60;
  NSObject *v61;
  id v62;
  _QWORD *v63;
  NSObject *v64;
  NSObject *v65;
  _QWORD *v66;
  NSObject *v67;
  os_signpost_id_t v68;
  NSObject *v69;
  NSObject *v70;
  unint64_t v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  id v76;
  os_signpost_id_t spid;
  void *v78;
  void *v79;
  void *v80;
  id obj;
  uint64_t v82;
  id v83;
  id v84;
  id v85;
  id v86;
  _QWORD v88[4];
  NSObject *v89;
  id v90;
  CHRemoteRecognitionRequestHandler *v91;
  _QWORD v92[4];
  NSObject *v93;
  id v94;
  CHRemoteRecognitionRequestHandler *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t buf[4];
  id v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  id v105;
  _BYTE v106[128];

  v86 = a3;
  v76 = a4;
  v85 = a5;
  v84 = a6;
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v9 = (id)qword_10002AE50;
  spid = os_signpost_id_generate(v9);

  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v10 = (id)qword_10002AE50;
  v11 = v10;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHRemoteRecognitionServerComputeMultilocaleResult", (const char *)&unk_10002287A, buf, 2u);
  }

  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v12 = (id)qword_10002AE18[0];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHRemoteRecognitionServerComputeMultilocaleResult\", buf, 2u);
  }

  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = v76;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
  if (v13)
  {
    v80 = 0;
    v14 = 1;
    v82 = *(_QWORD *)v97;
    v83 = v13;
    while (1)
    {
      v15 = v86;
      if (*(_QWORD *)v97 != v82)
        objc_enumerationMutation(obj);
      v16 = **((_QWORD **)&v96 + 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", **((_QWORD **)&v96 + 1)));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKeyedSubscript:", v16));
      if ((v14 & 1) != 0)
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "recognitionEngineCachingKey"));

        v80 = (void *)v19;
        v15 = v86;
      }
      if (v14 & 1 | ((+[CHRecognizerConfiguration isSupportedLatinScriptLocale:withMode:](CHRecognizerConfiguration, "isSupportedLatinScriptLocale:withMode:", v16, objc_msgSend(v15, "recognitionMode")) & 1) == 0)|| (recognizerInferenceCache = self->_recognizerInferenceCache, v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "drawing")), v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecognizerInferenceCache retrieveActivationMatrixForDrawing:recognitionEngineCachingKey:outStrokeIndexMapping:outStrokeEndings:](recognizerInferenceCache, "retrieveActivationMatrixForDrawing:recognitionEngineCachingKey:outStrokeIndexMapping:outStrokeEndings:", v21, v80, 0, 0)), v21, LOBYTE(recognizerInferenceCache) = objc_msgSend(v22, "unlikelyHasLatinContents"), v22, (recognizerInferenceCache & 1) == 0))
      {
        v23 = -[CHInputContextLexiconManager transientLexicon](self->_lexiconManager, "transientLexicon");
        v24 = -[CHInputContextLexiconManager transientPhraseLexicon](self->_lexiconManager, "transientPhraseLexicon");
        v25 = -[CHInputContextLexiconManager vocabulary](self->_lexiconManager, "vocabulary");
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHInputContextLexiconManager textReplacements](self->_lexiconManager, "textReplacements"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CHInputContextLexiconManager addressBookLexicon](self->_lexiconManager, "addressBookLexicon"));
        +[CHCachedRecognizerManager configureRecognizer:forRequest:locale:transientLexicon:transientPhraseLexicon:vocabulary:textReplacements:addressBookLexicon:](CHCachedRecognizerManager, "configureRecognizer:forRequest:locale:transientLexicon:transientPhraseLexicon:vocabulary:textReplacements:addressBookLexicon:", v17, v86, v16, v23, v24, v25, v26, v27);

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "recognizerConfigurationKeyWithLocale:", v16));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHRemoteRecognitionRequestHandler _computeTextRecognitionResultsForRequest:recognizer:recognizerCachingKey:isTopLocale:writingStatistics:](self, "_computeTextRecognitionResultsForRequest:recognizer:recognizerCachingKey:isTopLocale:writingStatistics:", v86, v17, v28, v14 & 1, v18));

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[CHTokenizedTextResult resultRestoringRawPathInResult:](CHTokenizedTextResult, "resultRestoringRawPathInResult:", v29));
        v31 = v30;
        if (v30)
        {
          objc_msgSend(v79, "addObject:", v30);
          objc_msgSend(v78, "addObject:", v16);
        }
        v32 = objc_msgSend(v30, "isMinimalDrawingResult");

        if ((v32 & 1) != 0)
          break;
      }

      if ((unint64_t)v83 >= 2)
      {
        v33 = 1;
        do
        {
          if (*(_QWORD *)v97 != v82)
            objc_enumerationMutation(obj);
          v34 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * v33);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", v34));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKeyedSubscript:", v34));
          if ((+[CHRecognizerConfiguration isSupportedLatinScriptLocale:withMode:](CHRecognizerConfiguration, "isSupportedLatinScriptLocale:withMode:", v34, objc_msgSend(v86, "recognitionMode")) & 1) == 0|| (v35 = self->_recognizerInferenceCache, v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "drawing")), v37 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecognizerInferenceCache retrieveActivationMatrixForDrawing:recognitionEngineCachingKey:outStrokeIndexMapping:outStrokeEndings:](v35, "retrieveActivationMatrixForDrawing:recognitionEngineCachingKey:outStrokeIndexMapping:outStrokeEndings:", v36, v80, 0, 0)), v36, LOBYTE(v35) = objc_msgSend(v37, "unlikelyHasLatinContents"), v37, (v35 & 1) == 0))
          {
            v38 = -[CHInputContextLexiconManager transientLexicon](self->_lexiconManager, "transientLexicon");
            v39 = -[CHInputContextLexiconManager transientPhraseLexicon](self->_lexiconManager, "transientPhraseLexicon");
            v40 = -[CHInputContextLexiconManager vocabulary](self->_lexiconManager, "vocabulary");
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[CHInputContextLexiconManager textReplacements](self->_lexiconManager, "textReplacements"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[CHInputContextLexiconManager addressBookLexicon](self->_lexiconManager, "addressBookLexicon"));
            +[CHCachedRecognizerManager configureRecognizer:forRequest:locale:transientLexicon:transientPhraseLexicon:vocabulary:textReplacements:addressBookLexicon:](CHCachedRecognizerManager, "configureRecognizer:forRequest:locale:transientLexicon:transientPhraseLexicon:vocabulary:textReplacements:addressBookLexicon:", v17, v86, v34, v38, v39, v40, v41, v42);

            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "recognizerConfigurationKeyWithLocale:", v34));
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[CHRemoteRecognitionRequestHandler _computeTextRecognitionResultsForRequest:recognizer:recognizerCachingKey:isTopLocale:writingStatistics:](self, "_computeTextRecognitionResultsForRequest:recognizer:recognizerCachingKey:isTopLocale:writingStatistics:", v86, v17, v43, 0, v18));

            v45 = (void *)objc_claimAutoreleasedReturnValue(+[CHTokenizedTextResult resultRestoringRawPathInResult:](CHTokenizedTextResult, "resultRestoringRawPathInResult:", v44));
            v46 = v45;
            if (v45)
            {
              objc_msgSend(v79, "addObject:", v45);
              objc_msgSend(v78, "addObject:", v34);
            }
            v47 = objc_msgSend(v45, "isMinimalDrawingResult");

            if ((v47 & 1) != 0)
              goto LABEL_35;
          }

        }
        while (v83 != (id)++v33);
      }
      v14 = 0;
      v48 = 0;
      v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
      if (!v83)
        goto LABEL_37;
    }
LABEL_35:

    v48 = 1;
  }
  else
  {
    v48 = 0;
    v80 = 0;
  }
LABEL_37:

  if (!objc_msgSend(v79, "count") || !objc_msgSend(v78, "count"))
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v53 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      v54 = objc_msgSend(v79, "count");
      *(_DWORD *)buf = 138412802;
      v101 = obj;
      v102 = 2112;
      v103 = v78;
      v104 = 2048;
      v105 = v54;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_FAULT, "Unexpected empty array with original Recognition Locales = %@, recognitionLocalesWithResults = %@, resultsByLocaleCount = %ld", buf, 0x20u);
    }
    v52 = 0;
    goto LABEL_94;
  }
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v49 = (id)qword_10002AE50;
  v50 = v49;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_INTERVAL_END, spid, "CHRemoteRecognitionServerComputeMultilocaleResult", (const char *)&unk_10002287A, buf, 2u);
  }

  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v51 = (id)qword_10002AE18[0];
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "END \"CHRemoteRecognitionServerComputeMultilocaleResult\", buf, 2u);
  }

  if (!v48)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v55 = (id)qword_10002AE50;
    v56 = os_signpost_id_generate(v55);

    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v57 = (id)qword_10002AE50;
    v58 = v57;
    v59 = v56 - 1;
    if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_BEGIN, v56, "CHRemoteRecognitionServerPostprocessingBlock", (const char *)&unk_10002287A, buf, 2u);
    }

    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v60 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHRemoteRecognitionServerPostprocessingBlock\", buf, 2u);
    }

    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_10000DCCC;
    v92[3] = &unk_100024B10;
    v61 = v85;
    v93 = v61;
    v62 = v86;
    v94 = v62;
    v95 = self;
    v63 = objc_retainBlock(v92);
    if (qword_10002AE88 == -1)
    {
      v64 = (id)qword_10002AE50;
      if (v59 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_70;
    }
    else
    {
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v64 = (id)qword_10002AE50;
      if (v59 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_70;
    }
    if (os_signpost_enabled(v64))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_INTERVAL_END, v56, "CHRemoteRecognitionServerPostprocessingBlock", (const char *)&unk_10002287A, buf, 2u);
    }
LABEL_70:

    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v65 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "END \"CHRemoteRecognitionServerPostprocessingBlock\", buf, 2u);
    }

    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_10000DEEC;
    v88[3] = &unk_100024B10;
    v89 = v61;
    v90 = v62;
    v91 = self;
    v66 = objc_retainBlock(v88);
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v67 = (id)qword_10002AE50;
    v68 = os_signpost_id_generate(v67);

    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v69 = (id)qword_10002AE50;
    v70 = v69;
    v71 = v68 - 1;
    if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v70, OS_SIGNPOST_INTERVAL_BEGIN, v68, "CHRemoteRecognitionServerMergingBlock", (const char *)&unk_10002287A, buf, 2u);
    }

    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v72 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHRemoteRecognitionServerMergingBlock\", buf, 2u);
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[CHMultiLocaleResultProcessor combineMultiLocaleResults:locales:topLocaleIndex:mergedResultPostprocessingBlock:changeableColumnCountBlock:](CHMultiLocaleResultProcessor, "combineMultiLocaleResults:locales:topLocaleIndex:mergedResultPostprocessingBlock:changeableColumnCountBlock:", v79, v78, 0, v63, v66));
    if (qword_10002AE88 == -1)
    {
      v73 = (id)qword_10002AE50;
      if (v71 <= 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_87;
    }
    else
    {
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v73 = (id)qword_10002AE50;
      if (v71 <= 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_87:
        if (os_signpost_enabled(v73))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v73, OS_SIGNPOST_INTERVAL_END, v68, "CHRemoteRecognitionServerMergingBlock", (const char *)&unk_10002287A, buf, 2u);
        }
      }
    }

    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v74 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "END \"CHRemoteRecognitionServerMergingBlock\", buf, 2u);
    }

    v53 = v93;
LABEL_94:

    goto LABEL_95;
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "firstObject"));
LABEL_95:

  return v52;
}

- (void)_handleValidRecognitionRequest:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  CHInputContextLexiconManager *v9;
  CHInputContextLexiconManager *lexiconManager;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(CHRemoteRecognitionTextRequest);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    if (!self->_lexiconManager)
    {
      v9 = (CHInputContextLexiconManager *)objc_alloc_init((Class)CHInputContextLexiconManager);
      lexiconManager = self->_lexiconManager;
      self->_lexiconManager = v9;

    }
    -[CHRemoteRecognitionRequestHandler _handleValidRecognitionTextRequest:withReply:](self, "_handleValidRecognitionTextRequest:withReply:", v6, v7);
  }
  else
  {
    v11 = objc_opt_class(CHRemoteRecognitionMathRequest);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
    {
      -[CHRemoteRecognitionRequestHandler _handleValidRecognitionMathRequest:withReply:](self, "_handleValidRecognitionMathRequest:withReply:", v6, v7);
    }
    else
    {
      if (qword_10002AE88 != -1)
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v12 = (id)qword_10002AE18[0];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Invalid recognition request class", v13, 2u);
      }

    }
  }

}

- (void)_handleValidRecognitionTextRequest:(id)a3 withReply:(id)a4
{
  id v6;
  void *v7;
  CHStrokeClassificationModel *scriptClassifier;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id obj;
  id obja;
  void *v34;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v6 = a3;
  v31 = a4;
  obj = objc_alloc_init((Class)NSArray);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (self->_scriptClassifier && objc_msgSend(v6, "recognitionMode") == 4)
  {
    scriptClassifier = self->_scriptClassifier;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "drawing"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHStrokeClassificationModel predictedScriptsForDrawing:maxNumberOfLocales:](scriptClassifier, "predictedScriptsForDrawing:maxNumberOfLocales:", v9, 1));

    v11 = (void *)objc_opt_class(CHRecognizerConfiguration);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locales"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localesForScriptClassification:selectedScriptCodepoints:", v12, v10));

    if (objc_msgSend(v13, "count"))
      goto LABEL_7;
    v14 = (void *)objc_opt_class(CHRecognizerConfiguration);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locales"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "effectiveRecognitionLocales:recognitionMode:", v15, objc_msgSend(v6, "recognitionMode")));

    v13 = (void *)v16;
  }
  else
  {
    v17 = (void *)objc_opt_class(CHRecognizerConfiguration);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locales"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "effectiveRecognitionLocales:recognitionMode:", v10, objc_msgSend(v6, "recognitionMode")));
    v15 = obj;
  }

LABEL_7:
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obja = v13;
  v18 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(obja);
        v21 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHCachedRecognizerManager checkOutRecognizerForTextRequest:locale:](self->_recognizerManager, "checkOutRecognizerForTextRequest:locale:", v6, v21));
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v22, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHCachedRecognizerManager writingStatsForRequest:locale:](self->_recognizerManager, "writingStatsForRequest:locale:", v6, v21));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, v21);

      }
      v18 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v18);
  }

  -[CHRemoteRequestHandlerBase setDirty](self, "setDirty");
  ++self->_openRequestCount;
  v24 = objc_claimAutoreleasedReturnValue(-[CHRemoteRecognitionRequestHandler _queueForRequest:](self, "_queueForRequest:", v6));
  if (!v24)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v25 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "A valid queue is required to run recognition", buf, 2u);
    }

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E724;
  block[3] = &unk_100024B38;
  block[4] = self;
  v36 = v6;
  v37 = obja;
  v38 = v34;
  v39 = v7;
  v40 = v31;
  v26 = v31;
  v27 = v7;
  v28 = v34;
  v29 = obja;
  v30 = v6;
  dispatch_async(v24, block);

}

- (void)_handleValidRecognitionMathRequest:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  CHRemoteRecognitionRequestHandler *v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHCachedRecognizerManager checkOutRecognizerForMathRequest:](self->_recognizerManager, "checkOutRecognizerForMathRequest:", v6));
  -[CHRemoteRequestHandlerBase setDirty](self, "setDirty");
  ++self->_openRequestCount;
  v9 = objc_claimAutoreleasedReturnValue(-[CHRemoteRecognitionRequestHandler _queueForRequest:](self, "_queueForRequest:", v6));
  if (!v9)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v10 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "A valid queue is required to run recognition", buf, 2u);
    }

  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000EBC4;
  v14[3] = &unk_100024B60;
  v15 = v8;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v8;
  dispatch_async(v9, v14);

}

- (id)retrievePartialResultsForDrawing:(id)a3 recognitionEngineCachingKey:(id)a4 matchingColumnRangeToKeep:(_NSRange *)a5 strokesToRecognize:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _BYTE *v28;
  uint64_t v29;
  id *v31;
  _QWORD *v32;
  id v33;
  __int128 v34;

  v31 = a6;
  v9 = a3;
  v33 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", 0, objc_msgSend(v9, "strokeCount")));
  v34 = xmmword_10001B0F0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecognizerResultCache retrievePartialResultsForDrawing:recognitionEngineCachingKey:matchingColumnRange:](self->_recognizerResultsCache, "retrievePartialResultsForDrawing:recognitionEngineCachingKey:matchingColumnRange:", v9, v33, &v34));
  v12 = *((_QWORD *)&v34 + 1);
  if (v12 <= (uint64_t)objc_msgSend(v11, "tokenColumnCount"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "strokeIndexes"));
    v14 = objc_msgSend(v13, "count");
    v15 = objc_msgSend(v9, "strokeCount");

    if (v14 < v15)
    {
      v16 = (uint64_t)fmin((double)(uint64_t)objc_msgSend(v11, "tokenColumnCount"), 2.0);
      if (v16 < 1)
      {
        v18 = 0;
      }
      else
      {
        v17 = 0;
        v18 = 0;
        v19 = 1;
        while (1)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tokenColumns", v31));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", (char *)objc_msgSend(v11, "tokenColumnCount") - v19));

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "strokeIndexes"));
          v17 += (uint64_t)objc_msgSend(v22, "count");

          if (v17 >= 21)
            break;
          ++v18;
          ++v19;
          if (v18 == v16)
          {
            v18 = v16;
            break;
          }
        }
      }
      v12 = (uint64_t)fmax((double)(*((_QWORD *)&v34 + 1) - v18), 0.0);
    }
  }
  if (v12 >= 1)
  {
    for (i = 0; i != v12; ++i)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tokenColumns", v31));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", i));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "strokeIndexes"));
      objc_msgSend(v10, "removeIndexes:", v26);

    }
  }
  if (objc_msgSend(v10, "count", v31))
  {
    v27 = objc_msgSend(v10, "count");
    v28 = objc_msgSend(v10, "lastIndex");
    if (v27 != (id)(v28 - (_BYTE *)objc_msgSend(v10, "firstIndex") + 1))
    {
      v29 = objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", 0, objc_msgSend(v9, "strokeCount")));

      v11 = 0;
      v10 = (void *)v29;
    }
  }
  if (v32)
    *v32 = objc_retainAutorelease(v10);
  if (a5)
  {
    a5->location = 0;
    a5->length = v12;
  }

  return v11;
}

- (id)_computeTextRecognitionResultsForRequest:(id)a3 recognizer:(id)a4 recognizerCachingKey:(id)a5 isTopLocale:(BOOL)a6 writingStatistics:(id)a7
{
  _BOOL8 v8;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char *v28;
  void *v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;

  v8 = a6;
  v11 = a3;
  v33 = a4;
  v34 = a5;
  v32 = a7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "drawing"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", 0, objc_msgSend(v12, "strokeCount")));

  v37 = xmmword_10001B0F0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "drawing"));
  if (objc_msgSend(v11, "enableStrokeReordering"))
  {
    v36 = 0;
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sortedDrawingUsingStrokeMidPoint:", &v36));
    v16 = v36;

    v14 = (void *)v15;
  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v11, "enableCachingIfAvailable"))
  {
    v35 = v13;
    v17 = objc_claimAutoreleasedReturnValue(-[CHRemoteRecognitionRequestHandler retrievePartialResultsForDrawing:recognitionEngineCachingKey:matchingColumnRangeToKeep:strokesToRecognize:](self, "retrievePartialResultsForDrawing:recognitionEngineCachingKey:matchingColumnRangeToKeep:strokesToRecognize:", v14, v34, &v37, &v35));
    v18 = v35;

    if (objc_msgSend(v18, "firstIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
      v19 = 0;
    else
      v19 = (uint64_t)objc_msgSend(v18, "firstIndex");
    v20 = (void *)v17;
    v13 = v18;
  }
  else
  {
    v20 = 0;
    v19 = 0;
  }
  if (objc_msgSend(v13, "count"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "drawingWithStrokesFromIndexSet:", v13));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHRemoteRecognitionRequestHandler generateRecognitionOptionsFromRequest:isTopLocale:cachedPrefixResult:cachedPrefixColumnRangeToKeep:](self, "generateRecognitionOptionsFromRequest:isTopLocale:cachedPrefixResult:cachedPrefixColumnRangeToKeep:", v11, v8, v20, v37));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "textRecognitionResultForDrawing:options:writingStatistics:shouldCancel:", v30, v21, v32, 0));
    v23 = objc_msgSend(v22, "mutableCopy");

    if (v19 >= 1)
      objc_msgSend(v23, "offsetAllStrokeIndexesBy:", v19);
    if (objc_msgSend(v11, "enableCachingIfAvailable"))
      objc_msgSend(v23, "adjustColumns");
    if (v20)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tokenColumns"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "subarrayWithRange:", v37));

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "transcriptionPaths"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v23, "prependTokenColumns:prefixTopPath:", v25, v27);

      v28 = (char *)objc_msgSend(v23, "tokenColumnCount");
      objc_msgSend(v23, "setChangeableTokenColumnCount:", &v28[-*((_QWORD *)&v37 + 1)]);

    }
  }
  else
  {
    v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subResultWithColumnRange:", v37));
  }
  if (objc_msgSend(v11, "enableCachingIfAvailable"))
    -[CHRecognizerResultCache cacheTextResult:drawing:recognitionEngineCachingKey:](self->_recognizerResultsCache, "cacheTextResult:drawing:recognitionEngineCachingKey:", v23, v14, v34);
  if (v16)
    objc_msgSend(v23, "remapAllStrokeIndexesWithArray:", v16);

  return v23;
}

- (id)generateRecognitionOptionsFromRequest:(id)a3 isTopLocale:(BOOL)a4 cachedPrefixResult:(id)a5 cachedPrefixColumnRangeToKeep:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v8;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;

  length = a6.length;
  location = a6.location;
  v8 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "options"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v12));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", self->_recognizerInferenceCache, CHRecognitionOptionInferenceCache);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", !v8));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CHRecognitionOptionIsRunningSecondaryLocale);

  if (v11 && length)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CHRecognitionOptionTextBefore));
    if (v15)
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CHRecognitionOptionTextBefore));
    else
      v16 = &stru_100025708;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transcriptionPaths"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transcriptionWithPath:columnRange:filterLowConfidence:", v18, location, length, 0));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "precedingSeparatorForTopTranscriptionPath"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v16, "stringByAppendingFormat:", CFSTR("%@%@"), v20, v19));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CHRecognitionOptionTextBefore);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeys"));
  v23 = objc_msgSend(v22, "containsObject:", CHRecognitionOptionPrecedingSpaceBehavior);

  if ((v23 & 1) == 0)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_100025DE0, CHRecognitionOptionPrecedingSpaceBehavior);

  return v13;
}

- (void)transcriptionPathsForTokenizedTextResult:(id)a3 recognitionRequest:(id)a4 withReply:(id)a5 bundleIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHRemoteRecognitionRequestHandler _queueForRequest:](self, "_queueForRequest:", v11));
  if (!v14)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v15 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "A valid queue is required for building transcription paths", buf, 2u);
    }

  }
  v16 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000FC20;
  v22[3] = &unk_100024B38;
  v22[4] = self;
  v23 = v11;
  v24 = v13;
  v25 = v14;
  v26 = v10;
  v27 = v12;
  v17 = v12;
  v18 = v10;
  v19 = v14;
  v20 = v13;
  v21 = v11;
  dispatch_sync(v16, v22);

}

- (void)handleSketchRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000101DC;
  block[3] = &unk_100024B60;
  block[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_sync(v11, block);

}

- (void)_handleValidSketchRecognitionRequest:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  CHRemoteRecognitionRequestHandler *v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHCachedRecognizerManager checkOutRecognizerForSketchRequest:](self->_recognizerManager, "checkOutRecognizerForSketchRequest:", v6));
  -[CHRemoteRequestHandlerBase setDirty](self, "setDirty");
  v9 = objc_claimAutoreleasedReturnValue(-[CHRemoteRecognitionRequestHandler _queueForRequest:](self, "_queueForRequest:", v6));
  if (!v9)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v10 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "A valid queue is required to run recognition", buf, 2u);
    }

  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010410;
  v14[3] = &unk_100024B60;
  v15 = v8;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v8;
  dispatch_async(v9, v14);

}

- (void)optimizeResourceUsage
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000107AC;
  block[3] = &unk_100024AA0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizerResultsCache, 0);
  objc_storeStrong((id *)&self->_recognizerInferenceCache, 0);
  objc_storeStrong((id *)&self->_scriptClassifier, 0);
  objc_storeStrong((id *)&self->_lexiconManager, 0);
  objc_storeStrong((id *)&self->_recognizerManager, 0);
}

@end
