@implementation THStudyOptions

- (THStudyOptions)initWithUserDefaults:(id)a3
{
  THStudyOptions *v5;
  THStudyOptions *v6;
  objc_super v8;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THStudyOptions initWithUserDefaults:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptions.mm"), 62, CFSTR("invalid nil value for '%s'"), "userDefaults");
  v8.receiver = self;
  v8.super_class = (Class)THStudyOptions;
  v5 = -[THStudyOptions init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      v5->_userDefaults = (THBookUserDefaults *)a3;
      v6->_observers = (TSUMutablePointerSet *)objc_alloc_init((Class)TSUMutablePointerSet);
      -[THStudyOptions p_registerDefaults](v6, "p_registerDefaults");
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THStudyOptions;
  -[THStudyOptions dealloc](&v3, "dealloc");
}

- (BOOL)shuffle
{
  return -[THBookUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("THStudyOptionsShouldShuffle"));
}

- (void)setShuffle:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[TSUMutablePointerSet makeObjectsPerformSelector:withObject:](self->_observers, "makeObjectsPerformSelector:withObject:", "studyOptionsWillChangeShuffle:", self);
  -[THBookUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("THStudyOptionsShouldShuffle"));
  -[TSUMutablePointerSet makeObjectsPerformSelector:withObject:](self->_observers, "makeObjectsPerformSelector:withObject:", "studyOptionsDidChangeShuffle:", self);
}

- (BOOL)showAnnotations
{
  return -[THBookUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("THStudyOptionsShouldShowAnnotations"));
}

- (void)setShowAnnotations:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[TSUMutablePointerSet makeObjectsPerformSelector:withObject:](self->_observers, "makeObjectsPerformSelector:withObject:", "studyOptionsWillChangeFilterOptions:", self);
  -[THBookUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("THStudyOptionsShouldShowAnnotations"));
  -[TSUMutablePointerSet makeObjectsPerformSelector:withObject:](self->_observers, "makeObjectsPerformSelector:withObject:", "studyOptionsDidChangeFilterOptions:", self);
}

- (BOOL)showVocabulary
{
  return -[THBookUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("THStudyOptionsShouldShowVocabulary"));
}

- (void)setShowVocabulary:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[TSUMutablePointerSet makeObjectsPerformSelector:withObject:](self->_observers, "makeObjectsPerformSelector:withObject:", "studyOptionsWillChangeFilterOptions:", self);
  -[THBookUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("THStudyOptionsShouldShowVocabulary"));
  -[TSUMutablePointerSet makeObjectsPerformSelector:withObject:](self->_observers, "makeObjectsPerformSelector:withObject:", "studyOptionsDidChangeFilterOptions:", self);
}

- (BOOL)shouldShowAnnotationStyle:(int)a3
{
  uint64_t v3;

  v3 = 0;
  while (kHighlightInfos[v3] != a3)
  {
    v3 += 4;
    if (v3 == 24)
      return 0;
  }
  return -[THBookUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", *(_QWORD *)&kHighlightInfos[v3 + 2]);
}

- (void)showAnnotationStyle:(int)a3
{
  -[THStudyOptions p_setShouldShowAnnotationStyle:to:](self, "p_setShouldShowAnnotationStyle:to:", *(_QWORD *)&a3, 1);
}

- (void)hideAnnotationStyle:(int)a3
{
  -[THStudyOptions p_setShouldShowAnnotationStyle:to:](self, "p_setShouldShowAnnotationStyle:to:", *(_QWORD *)&a3, 0);
}

- (BOOL)shouldShowAllAnnotationStyles
{
  _BOOL4 v3;
  unint64_t v4;
  __CFString **v5;
  unint64_t v6;
  __CFString *v7;
  unsigned __int8 v8;

  v3 = -[THBookUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", off_53DB90);
  if (v3)
  {
    v4 = 0;
    v5 = &off_53DBA0;
    do
    {
      v6 = v4;
      if (v4 == 5)
        break;
      v7 = *v5;
      v5 += 2;
      v8 = -[THBookUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", v7);
      v4 = v6 + 1;
    }
    while ((v8 & 1) != 0);
    LOBYTE(v3) = v6 > 4;
  }
  return v3;
}

- (void)showAllAnnotationStyles
{
  -[THStudyOptions p_setShouldShowAllAnnotationStyles:](self, "p_setShouldShowAllAnnotationStyles:", 1);
}

- (void)hideAllAnnotationStyles
{
  -[THStudyOptions p_setShouldShowAllAnnotationStyles:](self, "p_setShouldShowAllAnnotationStyles:", 0);
}

- (void)showAll
{
  uint64_t v3;

  -[TSUMutablePointerSet makeObjectsPerformSelector:withObject:](self->_observers, "makeObjectsPerformSelector:withObject:", "studyOptionsWillChangeFilterOptions:", self);
  -[THBookUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", 1, CFSTR("THStudyOptionsShouldShowAnnotations"));
  -[THBookUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", 1, CFSTR("THStudyOptionsShouldShowVocabulary"));
  v3 = &dword_8;
  do
  {
    -[THBookUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", 1, *(_QWORD *)((char *)kHighlightInfos + v3));
    v3 += 16;
  }
  while (v3 != 104);
  -[TSUMutablePointerSet makeObjectsPerformSelector:withObject:](self->_observers, "makeObjectsPerformSelector:withObject:", "studyOptionsDidChangeFilterOptions:", self);
}

- (void)addObserver:(id)a3
{
  if (self->_observers)
  {
    if (a3)
    {
LABEL_3:
      -[TSUMutablePointerSet addObject:](self->_observers, "addObject:", a3);
      return;
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THStudyOptions addObserver:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptions.mm"), 200, CFSTR("invalid nil value for '%s'"), "_observers");
    if (a3)
      goto LABEL_3;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THStudyOptions addObserver:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptions.mm"), 201, CFSTR("invalid nil value for '%s'"), "observer");
}

- (void)removeObserver:(id)a3
{
  if (self->_observers)
  {
    if (a3)
    {
LABEL_3:
      -[TSUMutablePointerSet removeObject:](self->_observers, "removeObject:", a3);
      return;
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THStudyOptions removeObserver:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptions.mm"), 211, CFSTR("invalid nil value for '%s'"), "_observers");
    if (a3)
      goto LABEL_3;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THStudyOptions removeObserver:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptions.mm"), 212, CFSTR("invalid nil value for '%s'"), "observer");
}

- (void)p_setShouldShowAnnotationStyle:(int)a3 to:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;

  v4 = a4;
  -[TSUMutablePointerSet makeObjectsPerformSelector:withObject:](self->_observers, "makeObjectsPerformSelector:withObject:", "studyOptionsWillChangeFilterOptions:", self);
  v7 = 0;
  while (kHighlightInfos[v7] != a3)
  {
    v7 += 4;
    if (v7 == 24)
      goto LABEL_6;
  }
  -[THBookUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v4, *(_QWORD *)&kHighlightInfos[v7 + 2]);
LABEL_6:
  -[TSUMutablePointerSet makeObjectsPerformSelector:withObject:](self->_observers, "makeObjectsPerformSelector:withObject:", "studyOptionsDidChangeFilterOptions:", self);
}

- (void)p_setShouldShowAllAnnotationStyles:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  -[TSUMutablePointerSet makeObjectsPerformSelector:withObject:](self->_observers, "makeObjectsPerformSelector:withObject:", "studyOptionsWillChangeFilterOptions:", self);
  v5 = &dword_8;
  do
  {
    -[THBookUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, *(_QWORD *)((char *)kHighlightInfos + v5));
    v5 += 16;
  }
  while (v5 != 104);
  -[TSUMutablePointerSet makeObjectsPerformSelector:withObject:](self->_observers, "makeObjectsPerformSelector:withObject:", "studyOptionsDidChangeFilterOptions:", self);
}

- (void)p_registerDefaults
{
  NSMutableDictionary *v3;
  uint64_t v4;
  NSUserDefaults *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), CFSTR("THStudyOptionsShouldShuffle"), +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("THStudyOptionsShouldShowAnnotations"), +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("THStudyOptionsShouldShowVocabulary"), 0);
  v4 = &dword_8;
  do
  {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), *(_QWORD *)((char *)kHighlightInfos + v4));
    v4 += 16;
  }
  while (v4 != 104);
  v5 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[NSMutableDictionary allKeys](v3, "allKeys");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v12 = -[NSUserDefaults objectForKey:](v5, "objectForKey:", v11);
        if (v12)
          -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v12, v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  -[THBookUserDefaults registerDefaults:](self->_userDefaults, "registerDefaults:", v3);
}

@end
