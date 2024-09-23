@implementation KNAnimParameterGroup

+ (id)parameterGroupForFile:(id)a3
{
  id v4;
  KNAnimParameterGroup *v5;

  v4 = (id)qword_543318;
  if (!qword_543318)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    qword_543318 = (uint64_t)v4;
  }
  v5 = (KNAnimParameterGroup *)objc_msgSend(v4, "objectForKey:", a3);
  if (!v5)
  {
    v5 = -[KNAnimParameterGroup initWithFileName:]([KNAnimParameterGroup alloc], "initWithFileName:", a3);
    objc_msgSend((id)qword_543318, "setObject:forKey:", v5, a3);
  }
  return v5;
}

- (double)valueForConstant:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double result;

  v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_parametersDict, "objectForKeyedSubscript:");
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type")), "integerValue") == (char *)&dword_0 + 1)
    {
      v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
      if (v6)
      {
        objc_msgSend(v6, "doubleValue");
        return result;
      }
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup valueForConstant:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 86, CFSTR("No value found in parameter %@!"), a3);
    }
    else
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup valueForConstant:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 81, CFSTR("Parameter '%@' is not a constant!"), a3);
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup valueForConstant:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 77, CFSTR("Could not find animation parameter named %@!"), a3);
  }
  return 0.0;
}

- (double)valueForAnimationCurve:(id)a3 atPercent:(double)a4
{
  id v7;
  id v8;
  double result;

  if (a4 < 0.0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup valueForAnimationCurve:atPercent:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 95, CFSTR("percent < 0!"));
  if (a4 > 1.0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup valueForAnimationCurve:atPercent:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 96, CFSTR("percent > 0!"));
  v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_parametersDict, "objectForKeyedSubscript:", a3);
  if (v7)
  {
    v8 = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("value"));
    if (v8)
    {
      objc_msgSend(v8, "yValueFromXValue:", a4);
      return result;
    }
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup valueForAnimationCurve:atPercent:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 105, CFSTR("No path found in curve named %@!"), a3);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup valueForAnimationCurve:atPercent:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 100, CFSTR("Could not find animation curve named %@!"), a3);
  }
  return 0.0;
}

- (id)mediaTimingFunctionForAnimationCurve:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double x;
  double y;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  _QWORD v18[6];

  v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_parametersDict, "objectForKeyedSubscript:");
  if (!v4)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup mediaTimingFunctionForAnimationCurve:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 117, CFSTR("Could not find animation curve named %@!"), a3);
    return 0;
  }
  v5 = v4;
  if (objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type")), "integerValue") != (char *)&dword_8 + 2)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup mediaTimingFunctionForAnimationCurve:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 121, CFSTR("Parameter '%@' is not a simple path!"), a3);
    return 0;
  }
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  if (!v6)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup mediaTimingFunctionForAnimationCurve:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 126, CFSTR("No path found in curve named %@!"), a3);
    return 0;
  }
  v7 = v6;
  x = CGPointZero.x;
  y = CGPointZero.y;
  if ((uint64_t)objc_msgSend(v6, "elementCount") < 2)
  {
    v16 = CGPointZero.x;
    v15 = y;
  }
  else
  {
    v14 = 1;
    v15 = y;
    v16 = CGPointZero.x;
    do
    {
      if (objc_msgSend(v7, "elementAtIndex:associatedPoints:", v14, v18) == (char *)&dword_0 + 2)
      {
        v16 = *(double *)v18;
        v15 = *(double *)&v18[1];
        x = *(double *)&v18[2];
        y = *(double *)&v18[3];
      }
      ++v14;
    }
    while (v14 < (uint64_t)objc_msgSend(v7, "elementCount"));
  }
  *(float *)&v10 = v16;
  *(float *)&v11 = v15;
  *(float *)&v12 = x;
  *(float *)&v13 = y;
  return +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v10, v11, v12, v13);
}

- (KNAnimParameterGroup)initWithFileName:(id)a3
{
  KNAnimParameterGroup *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KNAnimParameterGroup;
  v4 = -[KNAnimParameterGroup init](&v6, "init");
  if (v4)
  {
    if (!a3)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup initWithFileName:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 151, CFSTR("nil file path to animation parameters!"));
    v4->_fileName = (NSString *)a3;
    v4->_originalFileName = (NSString *)a3;
    v4->_name = (NSString *)objc_msgSend(objc_msgSend(a3, "lastPathComponent"), "stringByDeletingPathExtension");
    -[KNAnimParameterGroup readAnimationCurvesFromFile](v4, "readAnimationCurvesFromFile");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KNAnimParameterGroup;
  -[KNAnimParameterGroup dealloc](&v3, "dealloc");
}

- (void)readAnimationCurvesFromFile
{
  NSString **p_fileName;
  NSData *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[128];
  NSSortDescriptor *v23;

  p_fileName = &self->_fileName;
  if ((objc_msgSend(objc_alloc_init((Class)NSFileManager), "fileExistsAtPath:", self->_fileName) & 1) == 0)objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup readAnimationCurvesFromFile]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 224, CFSTR("File doesn't exist at path! %@"), *p_fileName);
  v4 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", *p_fileName);
  v21 = 0;
  v5 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v4, &v21);
  if (v21)
  {
    v6 = THLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_271818();
  }
  else
  {
    v7 = objc_opt_class(NSMutableArray);
    v8 = objc_opt_class(NSDictionary);
    v9 = objc_opt_class(NSNumber);
    v10 = objc_opt_class(NSString);
    v11 = objc_msgSend(v5, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(TSDBezierPath), 0), NSKeyedArchiveRootObjectKey);
    v23 = +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
    v12 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", objc_msgSend(v11, "sortedArrayUsingDescriptors:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1)));
    if (!v12)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup readAnimationCurvesFromFile]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 236, CFSTR("Invalid file??? %@"), *p_fileName);
    -[KNAnimParameterGroup willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("parameterArray"));
    self->_parameterArray = (NSArray *)v12;
    -[KNAnimParameterGroup didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("parameterArray"));

    self->_parametersDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parametersDict, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("name")));
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v14);
    }
  }

}

- (void)resetAnimationCurvesFromBundle
{
  id v3;
  NSString *v4;
  NSString **p_fileName;
  NSString *v6;
  id v7;
  NSString *v8;
  NSString *v9;
  NSData *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _BYTE v27[128];

  v3 = objc_alloc_init((Class)NSFileManager);
  v4 = -[NSString stringByAppendingPathComponent:](NSHomeDirectory(), "stringByAppendingPathComponent:", CFSTR("Keynote Animation Parameters"));
  if ((objc_msgSend(v3, "fileExistsAtPath:", v4) & 1) == 0)
    objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 0, 0, 0);
  p_fileName = &self->_fileName;
  v6 = -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", -[NSString lastPathComponent](self->_fileName, "lastPathComponent"));
  if ((objc_msgSend(v3, "fileExistsAtPath:", v6) & 1) == 0)
  {
    v26 = 0;
    if ((objc_msgSend(v3, "copyItemAtPath:toPath:error:", *p_fileName, v6, &v26) & 1) == 0)
    {
      v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup resetAnimationCurvesFromBundle]");
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 273, CFSTR("%@"), v26);
    }
  }
  if ((objc_msgSend(v3, "fileExistsAtPath:", *p_fileName) & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup resetAnimationCurvesFromBundle]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 276, CFSTR("File doesn't exist at path! %@"), *p_fileName);
  v10 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", self->_originalFileName);
  v26 = 0;
  v11 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v10, &v26);
  if (v26)
  {
    v12 = THLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_271884();
  }
  else
  {
    v13 = objc_opt_class(NSMutableArray);
    v14 = objc_opt_class(NSDictionary);
    v15 = objc_opt_class(NSNumber);
    v16 = objc_opt_class(NSString);
    v17 = objc_msgSend(v11, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(TSDBezierPath), 0), NSKeyedArchiveRootObjectKey);
    if (!v17)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup resetAnimationCurvesFromBundle]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 285, CFSTR("Invalid file??? %@"), self->_originalFileName);
    -[KNAnimParameterGroup willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("parameterArray"));
    self->_parameterArray = (NSArray *)v17;
    -[KNAnimParameterGroup didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("parameterArray"));

    self->_parametersDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parametersDict, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("name")));
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v19);
    }
    +[NSKeyedArchiver archiveRootObject:toFile:](NSKeyedArchiver, "archiveRootObject:toFile:", self->_parameterArray, self->_fileName);
  }

}

- (void)writeAnimationCurvesToFile
{
  id v3;
  NSString *v4;
  NSString *v5;
  id v6;
  id v7;
  NSString *v8;
  NSString *v9;
  id v10;
  id v11;
  NSString *v12;
  NSString *v13;
  id v14;
  NSString *v15;
  NSString *v16;
  const __CFString *v17;
  void *v18;
  NSString *v19;
  uint64_t v20;
  id v21;
  NSString *v22;
  NSString *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = objc_alloc_init((Class)NSFileManager);
  v4 = -[NSString stringByAppendingPathComponent:](NSHomeDirectory(), "stringByAppendingPathComponent:", CFSTR("Keynote Animation Parameters"));
  if ((objc_msgSend(v3, "fileExistsAtPath:", v4) & 1) == 0)
    objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 0, 0, 0);
  v5 = -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", -[NSString lastPathComponent](self->_fileName, "lastPathComponent"));
  if ((objc_msgSend(v3, "fileExistsAtPath:", v5) & 1) == 0)
  {
    v25 = 0;
    if ((objc_msgSend(v3, "copyItemAtPath:toPath:error:", self->_fileName, v5, &v25) & 1) != 0)
      goto LABEL_13;
    v21 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup writeAnimationCurvesToFile]");
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m");
    v17 = CFSTR("%@");
    v24 = v25;
    v18 = v21;
    v19 = v22;
    v20 = 326;
    goto LABEL_12;
  }
  v25 = 0;
  v6 = objc_msgSend(v3, "attributesOfItemAtPath:error:", v5, &v25);
  if (v25)
  {
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup writeAnimationCurvesToFile]");
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 332, CFSTR("Error trying to look at %@: %@"), v5, v25);
  }
  v10 = objc_msgSend(v3, "attributesOfItemAtPath:error:", self->_fileName, &v25);
  if (v25)
  {
    v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup writeAnimationCurvesToFile]");
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 334, CFSTR("Error trying to look at %@: %@"), self->_fileName, v25);
  }
  if (objc_msgSend(objc_msgSend(v6, "objectForKey:", NSFileModificationDate), "compare:", objc_msgSend(v10, "objectForKey:", NSFileModificationDate)) == (id)-1)
  {
    v14 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup writeAnimationCurvesToFile]");
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m");
    v17 = CFSTR("Warning! File in Desktop's \"Keynote Animation Parameters\" is less recent than packaged parameter file!");
    v18 = v14;
    v19 = v15;
    v20 = 340;
LABEL_12:
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v16, v20, v17, v24);
  }
LABEL_13:

  v23 = v5;
  self->_fileName = v23;
  if ((objc_msgSend(v3, "fileExistsAtPath:", v23) & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNAnimParameterGroup writeAnimationCurvesToFile]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/KNAnimParameterGroup.m"), 347, CFSTR("File doesn't exist at path! %@"), self->_fileName);
  +[NSKeyedArchiver archiveRootObject:toFile:](NSKeyedArchiver, "archiveRootObject:toFile:", self->_parameterArray, self->_fileName);
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)parameterArray
{
  return self->_parameterArray;
}

@end
