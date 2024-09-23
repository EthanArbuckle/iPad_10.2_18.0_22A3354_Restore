@implementation CRLMoviePlaybackRegistry

+ (id)sharedMoviePlaybackRegistry
{
  if (qword_101414F40 != -1)
    dispatch_once(&qword_101414F40, &stru_101240628);
  return (id)qword_101414F38;
}

- (CRLMoviePlaybackRegistry)init
{
  CRLMoviePlaybackRegistry *v2;
  NSMutableSet *v3;
  NSMutableSet *playingObjectPointerSet;
  NSString *savedAudioCategory;
  NSString *savedAudioMode;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLMoviePlaybackRegistry;
  v2 = -[CRLMoviePlaybackRegistry init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    playingObjectPointerSet = v2->_playingObjectPointerSet;
    v2->_playingObjectPointerSet = v3;

    savedAudioCategory = v2->_savedAudioCategory;
    v2->_savedAudioCategory = (NSString *)&stru_1012A72B0;

    savedAudioMode = v2->_savedAudioMode;
    v2->_savedAudioMode = (NSString *)&stru_1012A72B0;

    v2->_savedAudioCategoryOptions = 0;
  }
  return v2;
}

- (void)objectWillBeginMoviePlayback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSString *v13;
  NSString *savedAudioCategory;
  NSString *v15;
  NSString *savedAudioMode;
  unsigned __int8 v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[8];
  const __CFString *v26;
  id v27;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240648);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E05D04();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240668);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectWillBeginMoviePlayback:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 58, 0, "invalid nil value for '%{public}s'", "object");

  }
  if (-[NSMutableSet containsObject:](self->_playingObjectPointerSet, "containsObject:", v4))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240688);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E05C84();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012406A8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectWillBeginMoviePlayback:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 59, 0, "The object shouldn't already be playing a movie when -objectWillBeginMoviePlayback is called.");

  }
  -[NSMutableSet addObject:](self->_playingObjectPointerSet, "addObject:", v4);
  if (-[NSMutableSet count](self->_playingObjectPointerSet, "count") == (id)1)
  {
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_1012406C8);
    v11 = off_1013DB560;
    if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Beginning AVAudioSession category AVAudioSessionCategoryPlayback", buf, 2u);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "category"));
    savedAudioCategory = self->_savedAudioCategory;
    self->_savedAudioCategory = v13;

    v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mode"));
    savedAudioMode = self->_savedAudioMode;
    self->_savedAudioMode = v15;

    self->_savedAudioCategoryOptions = (unint64_t)objc_msgSend(v12, "categoryOptions");
    v24 = 0;
    v17 = objc_msgSend(v12, "setCategory:mode:options:error:", AVAudioSessionCategoryPlayback, AVAudioSessionModeDefault, 0, &v24);
    v18 = v24;
    if ((v17 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012406E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E05BF4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101240708);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectWillBeginMoviePlayback:]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 78, 0, "Unable to set audio session category before starting playback (%@)", v18);

    }
  }
  v26 = CFSTR("CRLMoviePlaybackRegistryPlaybackObjectStatusKey");
  v27 = v4;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v23, "postNotificationName:object:userInfo:", CFSTR("CRLMoviePlaybackRegistryObjectWillBeginMoviePlaybackNotification"), self, v22);

}

- (void)objectDidEndMoviePlayback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *savedAudioCategory;
  NSString *savedAudioMode;
  unint64_t savedAudioCategoryOptions;
  unsigned __int8 v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[8];
  const __CFString *v31;
  id v32;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240728);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E05FB0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240748);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectDidEndMoviePlayback:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 88, 0, "invalid nil value for '%{public}s'", "object");

  }
  if ((-[NSMutableSet containsObject:](self->_playingObjectPointerSet, "containsObject:", v4) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240768);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E05F30();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240788);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectDidEndMoviePlayback:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 89, 0, "The object should be playing a movie when -objectDidEndMoviePlayback is called.");

  }
  -[NSMutableSet removeObject:](self->_playingObjectPointerSet, "removeObject:", v4);
  if (!-[NSMutableSet count](self->_playingObjectPointerSet, "count"))
  {
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_1012407A8);
    v11 = off_1013DB560;
    if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ending AVAudioSession category AVAudioSessionCategoryPlayback", buf, 2u);
    }
    if (-[NSString isEqualToString:](self->_savedAudioCategory, "isEqualToString:", &stru_1012A72B0))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012407C8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E05EB0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012407E8);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectDidEndMoviePlayback:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 95, 0, "Should have a category to use to reset the audio session.");

    }
    if (-[NSString isEqualToString:](self->_savedAudioMode, "isEqualToString:", &stru_1012A72B0))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101240808);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E05E30();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101240828);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectDidEndMoviePlayback:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 96, 0, "Should have a mode to use to reset the audio session.");

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    savedAudioCategory = self->_savedAudioCategory;
    savedAudioMode = self->_savedAudioMode;
    savedAudioCategoryOptions = self->_savedAudioCategoryOptions;
    v29 = 0;
    v22 = objc_msgSend(v18, "setCategory:mode:options:error:", savedAudioCategory, savedAudioMode, savedAudioCategoryOptions, &v29);
    v23 = v29;

    if ((v22 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101240848);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E05DA0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101240868);
      v24 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePlaybackRegistry objectDidEndMoviePlayback:]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePlaybackRegistry.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 100, 0, "Unable to set audio session category after ending playback (%@)", v23);

    }
  }
  v31 = CFSTR("CRLMoviePlaybackRegistryPlaybackObjectStatusKey");
  v32 = v4;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("CRLMoviePlaybackRegistryObjectDidEndMoviePlaybackNotification"), self, v27);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAudioMode, 0);
  objc_storeStrong((id *)&self->_savedAudioCategory, 0);
  objc_storeStrong((id *)&self->_playingObjectPointerSet, 0);
}

@end
