@implementation AEAnnotation

- (BOOL)isPlaceholder
{
  return -[AEAnnotation annotationType](self, "annotationType") == 3;
}

- (BOOL)isBookmark
{
  return -[AEAnnotation annotationType](self, "annotationType") == 1;
}

- (BOOL)isOrphan
{
  return -[AEAnnotation annotationLocation](self, "annotationLocation") == 0;
}

- (unint64_t)absolutePhysicalPageIndex
{
  return (unint64_t)objc_msgSend(-[AEAnnotation plAbsolutePhysicalLocation](self, "plAbsolutePhysicalLocation"), "unsignedIntegerValue");
}

- (void)setAbsolutePhysicalPageIndex:(unint64_t)a3
{
  -[AEAnnotation setPlAbsolutePhysicalLocation:](self, "setPlAbsolutePhysicalLocation:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
}

- (void)setAnnotationStorageRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSNumber *v6;
  NSNumber *v7;

  length = a3.length;
  location = a3.location;
  v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", location + length);
  -[AEAnnotation setPlLocationRangeStart:](self, "setPlLocationRangeStart:", v6);
  -[AEAnnotation setPlLocationRangeEnd:](self, "setPlLocationRangeEnd:", v7);
}

- (_NSRange)annotationStorageRange
{
  _BYTE *v3;
  _BYTE *v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v3 = objc_msgSend(-[AEAnnotation plLocationRangeStart](self, "plLocationRangeStart"), "unsignedIntegerValue");
  v4 = objc_msgSend(-[AEAnnotation plLocationRangeEnd](self, "plLocationRangeEnd"), "unsignedIntegerValue");
  if (v4 >= v3)
    v5 = v4 - v3;
  else
    v5 = 0;
  v6 = (NSUInteger)v3;
  result.length = v5;
  result.location = v6;
  return result;
}

- (NSString)annotationBookVersion
{
  return (NSString *)-[AEAnnotation assetVersion](self, "assetVersion");
}

- (void)setAnnotationBookVersion:(id)a3
{
  -[AEAnnotation setAssetVersion:](self, "setAssetVersion:", a3);
}

- (NSString)annotationContentNodeID
{
  id v2;

  v2 = -[AEAnnotation plStorageUUID](self, "plStorageUUID");
  if ((unint64_t)objc_msgSend(v2, "length") < 0x26)
    return 0;
  else
    return (NSString *)objc_msgSend(v2, "substringWithRange:", 0, 38);
}

- (NSString)annotationStorageIDWithoutContentNodeID
{
  id v3;
  id v4;
  char *v5;

  v3 = -[AEAnnotation plStorageUUID](self, "plStorageUUID");
  v4 = objc_msgSend(v3, "length");
  v5 = (char *)objc_msgSend(v3, "length");
  if ((unint64_t)v4 >= 0x28)
    return (NSString *)objc_msgSend(v3, "substringWithRange:", 39, v5 - 39);
  if (v5 != (_BYTE *)&stru_20.cmdsize + 2)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[AEAnnotation(THAdditions) annotationStorageIDWithoutContentNodeID]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/AEAnnotation_THAdditions.m"), 118, CFSTR("Unexpected annotation storageUID string (annotation type=%d): %@"), -[AEAnnotation annotationType](self, "annotationType"), v3);
    return 0;
  }
  return (NSString *)v3;
}

- (id)p_userDataDictionary
{
  id v2;
  id v3;
  NSObject *v4;
  id v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = -[AEAnnotation plUserData](self, "plUserData");
  if (!v2)
    return 0;
  v12 = 0;
  v3 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v2, &v12);
  if (v12)
  {
    v4 = THLog(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_2718F0(&v12, v4);
    return 0;
  }
  else
  {
    v7 = v3;
    v8 = objc_opt_class(NSDictionary);
    v9 = objc_opt_class(NSMutableArray);
    v10 = objc_opt_class(NSString);
    v5 = objc_msgSend(v7, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, objc_opt_class(NSNumber), 0), CFSTR("dictionary"));
    objc_msgSend(v7, "finishDecoding");

  }
  return v5;
}

- (void)p_setUserDataDictionary:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    v7 = objc_alloc_init((Class)NSMutableData);
    v5 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initForWritingWithMutableData:", v7);
    objc_msgSend(v5, "encodeObject:forKey:", a3, CFSTR("dictionary"));
    objc_msgSend(v5, "finishEncoding");

    v6 = v7;
  }
  else
  {
    v6 = 0;
  }
  v8 = v6;
  -[AEAnnotation setPlUserData:](self, "setPlUserData:", v6);

}

- (id)p_userDataObjectForKey:(id)a3
{
  if (a3)
    return objc_msgSend(-[AEAnnotation p_userDataDictionary](self, "p_userDataDictionary"), "objectForKey:", a3);
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[AEAnnotation(THAdditions) p_userDataObjectForKey:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/AEAnnotation_THAdditions.m"), 192, CFSTR("invalid nil value for '%s'"), "key");
  return 0;
}

- (void)p_setUserDataObject:(id)a3 forKey:(id)a4
{
  id v7;

  if (a4)
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v7, "addEntriesFromDictionary:", -[AEAnnotation p_userDataDictionary](self, "p_userDataDictionary"));
    if (a3)
      objc_msgSend(v7, "setObject:forKey:", a3, a4);
    else
      objc_msgSend(v7, "removeObjectForKey:", a4);
    -[AEAnnotation p_setUserDataDictionary:](self, "p_setUserDataDictionary:", v7);

  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[AEAnnotation(THAdditions) p_setUserDataObject:forKey:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/AEAnnotation_THAdditions.m"), 206, CFSTR("invalid nil value for '%s'"), "key");
  }
}

- (NSDictionary)placeholderHistory
{
  uint64_t v3;
  NSDictionary *result;

  v3 = objc_opt_class(NSDictionary);
  TSUDynamicCast(v3, -[AEAnnotation p_userDataObjectForKey:](self, "p_userDataObjectForKey:", CFSTR("pgHistory")));
  return result;
}

- (void)setPlaceholderHistory:(id)a3
{
  -[AEAnnotation p_setUserDataObject:forKey:](self, "p_setUserDataObject:forKey:", a3, CFSTR("pgHistory"));
}

- (NSString)selectionPreContextText
{
  uint64_t v3;
  NSString *result;

  v3 = objc_opt_class(NSString);
  TSUDynamicCast(v3, -[AEAnnotation p_userDataObjectForKey:](self, "p_userDataObjectForKey:", CFSTR("preContext")));
  return result;
}

- (void)setSelectionPreContextText:(id)a3
{
  -[AEAnnotation p_setUserDataObject:forKey:](self, "p_setUserDataObject:forKey:", a3, CFSTR("preContext"));
}

- (NSString)selectionPostContextText
{
  uint64_t v3;
  NSString *result;

  v3 = objc_opt_class(NSString);
  TSUDynamicCast(v3, -[AEAnnotation p_userDataObjectForKey:](self, "p_userDataObjectForKey:", CFSTR("postContext")));
  return result;
}

- (void)setSelectionPostContextText:(id)a3
{
  -[AEAnnotation p_setUserDataObject:forKey:](self, "p_setUserDataObject:forKey:", a3, CFSTR("postContext"));
}

- (unint64_t)contentNodeRelativePageIndex
{
  id v2;

  v2 = -[AEAnnotation p_userDataObjectForKey:](self, "p_userDataObjectForKey:", CFSTR("cnRelPg"));
  if (v2)
    return (unint64_t)objc_msgSend(v2, "unsignedIntegerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setContentNodeRelativePageIndex:(unint64_t)a3
{
  -[AEAnnotation p_setUserDataObject:forKey:](self, "p_setUserDataObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3), CFSTR("cnRelPg"));
}

@end
