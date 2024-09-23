@implementation CRLShapeLibraryShape

+ (id)baseKeywordsForShapeFromDictionary:(id)a3 keywordDelimiter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_localizationKeyForShapeFromDictionary:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_stringForKey:inBaseStringsTableWithName:", v7, CFSTR("CRLShapeLibrarianKeywords")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsSeparatedByString:", v6));

  return v9;
}

+ (id)baseNameForShapeFromDictionary:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_localizationKeyForShapeFromDictionary:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_stringForKey:inBaseStringsTableWithName:", v4, CFSTR("CRLShapeLibrarianShapeNames")));

  return v5;
}

+ (id)localizedKeywordsForShapeFromDictionary:(id)a3 keywordDelimiter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_localizationKeyForShapeFromDictionary:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v7, 0, CFSTR("CRLShapeLibrarianKeywords")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsSeparatedByString:", v6));
  return v10;
}

+ (id)localizedNameForShapeFromDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_localizationKeyForShapeFromDictionary:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v3, 0, CFSTR("CRLShapeLibrarianShapeNames")));

  return v5;
}

+ (id)shapeIDForShapeFromDictionary:(id)a3
{
  return objc_msgSend(a3, "objectForKey:", CFSTR("id"));
}

+ (id)p_localizationKeyForShapeFromDictionary:(id)a3
{
  return objc_msgSend(a3, "objectForKey:", CFSTR("localizationKey"));
}

+ (id)p_stringForKey:(id)a3 inBaseStringsTableWithName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:localization:", v5, 0, v6, CFSTR("en")));

  v9 = v8;
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012310D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEF320();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012310F0);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLShapeLibraryShape p_stringForKey:inBaseStringsTableWithName:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryShape.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 93, 0, "invalid nil value for '%{public}s'", "englishString");

    v9 = v5;
  }
  v13 = v9;

  return v13;
}

- (CRLShapeLibraryShape)initWithDictionary:(id)a3 keywordDelimiter:(id)a4
{
  id v6;
  id v7;
  CRLShapeLibraryShape *v8;
  CRLShapeLibraryShape *v9;
  void *v10;
  NSString *v11;
  NSString *bezierPathString;
  CRLBezierPath *v13;
  CRLBezierPath *bezierPath;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRLShapeLibraryShape;
  v8 = -[CRLShapeLibraryObject initWithDictionary:](&v16, "initWithDictionary:", v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_keywordDelimiter, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("shapePath")));
    v11 = (NSString *)objc_msgSend(v10, "copy");
    bezierPathString = v9->_bezierPathString;
    v9->_bezierPathString = v11;

    v13 = -[CRLBezierPath initWithCString:]([CRLBezierPath alloc], "initWithCString:", -[NSString UTF8String](v9->_bezierPathString, "UTF8String"));
    bezierPath = v9->_bezierPath;
    v9->_bezierPath = v13;

    v9->_rendersSlowly = -[CRLBezierPath elementCount](v9->_bezierPath, "elementCount") > 1000;
    -[CRLShapeLibraryObject i_removeObjectForKey:](v9, "i_removeObjectForKey:", CFSTR("shapePath"));
  }

  return v9;
}

- (NSArray)categoryIDs
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = objc_alloc_init((Class)NSNumberFormatter);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryShape p_categoryMetadata](self, "p_categoryMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007060C;
  v10[3] = &unk_101231118;
  v11 = v3;
  v6 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crl_arrayByMappingObjectsUsingBlock:", v10));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingSelector:", "compare:"));

  return (NSArray *)v8;
}

- (NSString)localizationKey
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryObject i_dictionary](self, "i_dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "p_localizationKeyForShapeFromDictionary:", v4));

  return (NSString *)v5;
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryObject i_dictionary](self, "i_dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedNameForShapeFromDictionary:", v4));

  return (NSString *)v5;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryShape name](self, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p name=%@>"), v5, self, v6));

  return (NSString *)v7;
}

- (NSNumber)shapeID
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryObject i_dictionary](self, "i_dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shapeIDForShapeFromDictionary:", v4));

  return (NSNumber *)v5;
}

- (int64_t)shapeType
{
  return 21;
}

- (NSArray)keywords
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryObject i_dictionary](self, "i_dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryShape p_keywordDelimiter](self, "p_keywordDelimiter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedKeywordsForShapeFromDictionary:keywordDelimiter:", v4, v5));

  return (NSArray *)v6;
}

- (id)pathSourceWithSize:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryShape p_bezierPath](self, "p_bezierPath", a3.width, a3.height));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryShape localizationKey](self, "localizationKey"));
  objc_msgSend(v5, "setLocalizationKey:", v6);

  return v5;
}

- (unint64_t)positionInCategoryWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231138);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEF3CC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231158);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibraryShape positionInCategoryWithID:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryShape.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 150, 0, "Must pass a categoryID when fetching a shape library shape's position.");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryShape p_categoryMetadata](self, "p_categoryMetadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("position")));

  if (v11)
    v12 = (unint64_t)objc_msgSend(v11, "unsignedIntegerValue");
  else
    v12 = 0x7FFFFFFFFFFFFFFFLL;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;

  v4 = a3;
  v6 = objc_opt_class(CRLShapeLibraryShape, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryShape shapeID](self, "shapeID"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shapeID"));
  if (v9 | v10)
    v11 = objc_msgSend((id)v9, "isEqual:", v10);
  else
    v11 = 1;

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryShape shapeID](self, "shapeID"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (id)p_categoryMetadata
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryObject i_dictionary](self, "i_dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("categories")));

  return v3;
}

- (NSString)bezierPathString
{
  return self->_bezierPathString;
}

- (BOOL)rendersSlowly
{
  return self->_rendersSlowly;
}

- (CRLBezierPath)p_bezierPath
{
  return self->_bezierPath;
}

- (void)setP_bezierPath:(id)a3
{
  objc_storeStrong((id *)&self->_bezierPath, a3);
}

- (NSString)p_keywordDelimiter
{
  return self->_keywordDelimiter;
}

- (void)setP_keywordDelimiter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywordDelimiter, 0);
  objc_storeStrong((id *)&self->_bezierPath, 0);
  objc_storeStrong((id *)&self->_bezierPathString, 0);
}

@end
