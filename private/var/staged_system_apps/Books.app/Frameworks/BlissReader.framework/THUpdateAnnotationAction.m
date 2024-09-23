@implementation THUpdateAnnotationAction

- (THUpdateAnnotationAction)initWithAnnotation:(id)a3 contentNode:(id)a4 updateBlock:(id)a5
{
  THUpdateAnnotationAction *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THUpdateAnnotationAction;
  v8 = -[THUpdateAnnotationAction init](&v10, "init");
  if (v8)
  {
    v8->_annotationUuid = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationUuid"), "copy");
    v8->_contentNode = (THModelContentNode *)a4;
    v8->_updateBlock = objc_msgSend(a5, "copy");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THUpdateAnnotationAction;
  -[THUpdateAnnotationAction dealloc](&v3, "dealloc");
}

- (void)commitWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  id v7;
  void *v8;
  NSArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void (**updateBlock)(id, void *);
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v7 = objc_msgSend(a4, "annotationForUUID:includeDeleted:moc:", self->_annotationUuid, 1, a5);
  if (v7)
  {
    v8 = v7;
    -[THUpdateAnnotationAction setChangedProperties:](self, "setChangedProperties:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[THUpdateAnnotationAction setModificationDate:](self, "setModificationDate:", objc_msgSend(v8, "annotationModificationDate"));
    -[THUpdateAnnotationAction setUserModificationDate:](self, "setUserModificationDate:", objc_msgSend(v8, "userModificationDate"));
    v9 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("annotationType"), CFSTR("annotationLocation"), CFSTR("annotationNote"), CFSTR("annotationRepresentativeText"), CFSTR("annotationSelectedText"), CFSTR("annotationStyle"), CFSTR("annotationIsUnderline"), CFSTR("plLocationRangeStart"), CFSTR("plLocationRangeEnd"), CFSTR("plAbsolutePhysicalLocation"), CFSTR("plStorageUUID"), CFSTR("plUserData"), 0);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v13), 2, 0);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v11);
    }
    updateBlock = (void (**)(id, void *))self->_updateBlock;
    if (updateBlock)
      updateBlock[2](updateBlock, v8);
    -[THUpdateAnnotationAction p_maintainIntegrity:](self, "p_maintainIntegrity:", v8);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v9);
          objc_msgSend(v8, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v18));
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }
    objc_msgSend(a3, "registerAnnotationChangedWithUUID:inContentNodeWithID:", objc_msgSend(v8, "annotationUuid"), objc_msgSend(v8, "annotationContentNodeID"));
  }
}

- (void)undoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  id v7;
  void *v8;

  v7 = objc_msgSend(a4, "annotationForUUID:includeDeleted:moc:", self->_annotationUuid, 1, a5);
  if (v7)
  {
    v8 = v7;
    -[THUpdateAnnotationAction p_restoreChangedProperties:](self, "p_restoreChangedProperties:", v7);
    objc_msgSend(a3, "registerAnnotationChangedWithUUID:inContentNodeWithID:", objc_msgSend(v8, "annotationUuid"), objc_msgSend(v8, "annotationContentNodeID"));
  }
}

- (void)redoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  id v7;
  void *v8;

  v7 = objc_msgSend(a4, "annotationForUUID:includeDeleted:moc:", self->_annotationUuid, 1, a5);
  if (v7)
  {
    v8 = v7;
    -[THUpdateAnnotationAction p_restoreChangedProperties:](self, "p_restoreChangedProperties:", v7);
    objc_msgSend(a3, "registerAnnotationChangedWithUUID:inContentNodeWithID:", objc_msgSend(v8, "annotationUuid"), objc_msgSend(v8, "annotationContentNodeID"));
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSMutableDictionary *changedProperties;
  NSNull *v10;

  changedProperties = self->_changedProperties;
  if (!changedProperties)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5, a6), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction observeValueForKeyPath:ofObject:change:context:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m"), 162, CFSTR("no dictionary for tracking changes"));
    changedProperties = self->_changedProperties;
  }
  if (!-[NSMutableDictionary objectForKey:](changedProperties, "objectForKey:", a3, a4, a5, a6))
  {
    v10 = (NSNull *)objc_msgSend(a5, "objectForKey:", NSKeyValueChangeOldKey);
    if (!v10)
      v10 = +[NSNull null](NSNull, "null");
    -[NSMutableDictionary setObject:forKey:](self->_changedProperties, "setObject:forKey:", v10, a3);
  }
}

- (void)p_maintainIntegrityForStorageRangeChange:(id)a3
{
  if (-[NSMutableDictionary objectForKey:](self->_changedProperties, "objectForKey:", CFSTR("annotationLocation")))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_maintainIntegrityForStorageRangeChange:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m"), 182, CFSTR("possible conflict setting annotationLocation"));
  if (-[NSMutableDictionary objectForKey:](self->_changedProperties, "objectForKey:", CFSTR("annotationRepresentativeText")))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_maintainIntegrityForStorageRangeChange:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m"), 183, CFSTR("possible conflict setting annotationRepresentativeText"));
  }
  if (-[NSMutableDictionary objectForKey:](self->_changedProperties, "objectForKey:", CFSTR("plAbsolutePhysicalLocation")))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_maintainIntegrityForStorageRangeChange:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m"), 184, CFSTR("possible conflict setting plAbsolutePhysicalLocation"));
  }
  -[THUpdateAnnotationAction p_updateAnnotationForStorageRangeChange:](self, "p_updateAnnotationForStorageRangeChange:", a3);
}

- (void)p_maintainIntegrity:(id)a3
{
  unsigned int v5;
  NSMutableDictionary *changedProperties;
  id v7;

  v5 = objc_msgSend(a3, "annotationType");
  if (v5 != 1 && v5 != 3)
  {
    if (v5 != 2)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_maintainIntegrity:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m"), 219, CFSTR("unexpected annotation type: %d"), objc_msgSend(a3, "annotationType"));
      return;
    }
    changedProperties = self->_changedProperties;
    goto LABEL_11;
  }
  v7 = -[NSMutableDictionary objectForKey:](self->_changedProperties, "objectForKey:", CFSTR("plAbsolutePhysicalLocation"));
  changedProperties = self->_changedProperties;
  if (!v7)
  {
LABEL_11:
    if (-[NSMutableDictionary objectForKey:](changedProperties, "objectForKey:", CFSTR("plLocationRangeStart"))
      || -[NSMutableDictionary objectForKey:](self->_changedProperties, "objectForKey:", CFSTR("plLocationRangeEnd"))
      || -[NSMutableDictionary objectForKey:](self->_changedProperties, "objectForKey:", CFSTR("plStorageUUID")))
    {
      -[THUpdateAnnotationAction p_maintainIntegrityForStorageRangeChange:](self, "p_maintainIntegrityForStorageRangeChange:", a3);
    }
    return;
  }
  if (-[NSMutableDictionary objectForKey:](changedProperties, "objectForKey:", CFSTR("annotationLocation")))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_maintainIntegrity:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m"), 206, CFSTR("possible conflict setting annotationLocation"));
  if (-[NSMutableDictionary objectForKey:](self->_changedProperties, "objectForKey:", CFSTR("annotationRepresentativeText")))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_maintainIntegrity:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m"), 207, CFSTR("possible conflict setting annotationRepresentativeText"));
  }
  -[THUpdateAnnotationAction p_updatePageAnnotationForPageChange:](self, "p_updatePageAnnotationForPageChange:", a3);
}

- (void)p_updatePageAnnotationForPageChange:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a3, "setContentNodeRelativePageIndex:", -[THModelNode relativePageIndexForAbsolutePageIndex:](self->_contentNode, "relativePageIndexForAbsolutePageIndex:", objc_msgSend(a3, "absolutePhysicalPageIndex")));
  v5 = objc_msgSend(a3, "annotationStorageRange");
  v7 = v6;
  v8 = objc_msgSend(a3, "annotationStorageIDWithoutContentNodeID");
  v9 = objc_opt_class(THWPStorage);
  v10 = TSUDynamicCast(v9, -[THModelContentNode infoForNodeUniqueID:](self->_contentNode, "infoForNodeUniqueID:", v8)).n128_u64[0];
  v12 = v11;
  if (!v11)
  {
    v13 = objc_opt_class(THWPStorage);
    v10 = TSUDynamicCast(v13, -[THModelContentNode infoForNodeUniqueID:forPresentationType:](self->_contentNode, "infoForNodeUniqueID:forPresentationType:", v8, +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", -[THModelContentNode context](self->_contentNode, "context")))).n128_u64[0];
    v12 = v14;
  }
  -[THUpdateAnnotationAction p_updateContextAndCFIForStorage:storageID:range:annotation:](self, "p_updateContextAndCFIForStorage:storageID:range:annotation:", v12, v8, v5, v7, a3, *(double *)&v10);
  if (!v12 || v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a3, "setAnnotationRepresentativeText:", 0);
    objc_msgSend(a3, "setSelectionPreContextText:", 0);
    objc_msgSend(a3, "setSelectionPostContextText:", 0);
  }
}

- (void)p_updateAnnotationForStorageRangeChange:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (char *)objc_msgSend(a3, "annotationStorageRange");
  if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_contentNode)
    {
      v7 = v5;
      v8 = v6;
      v9 = objc_msgSend(a3, "annotationStorageIDWithoutContentNodeID");
      v10 = objc_opt_class(THWPStorage);
      v11 = TSUDynamicCast(v10, -[THModelContentNode infoForNodeUniqueID:forPresentationType:](self->_contentNode, "infoForNodeUniqueID:forPresentationType:", v9, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelContentNode context](self->_contentNode, "context")))).n128_u64[0];
      v13 = v12;
      if (v12
        || (v14 = objc_opt_class(THWPStorage),
            v11 = TSUDynamicCast(v14, -[THModelContentNode infoForNodeUniqueID:forPresentationType:](self->_contentNode, "infoForNodeUniqueID:forPresentationType:", v9, +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", -[THModelContentNode context](self->_contentNode, "context")))).n128_u64[0], (v13 = v15) != 0))
      {
        if (&v7[v8] > objc_msgSend(v13, "length", *(double *)&v11))
          objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_updateAnnotationForStorageRangeChange:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m"), 268, CFSTR("annotation has an invalid storage range"));
        if (&v7[v8] <= objc_msgSend(v13, "length"))
        {
          objc_msgSend(a3, "setContentNodeRelativePageIndex:", -[THModelContentNode relativePageIndexForCharacterIndex:forInfo:](self->_contentNode, "relativePageIndexForCharacterIndex:forInfo:", v7, v13));
          objc_msgSend(a3, "setAbsolutePhysicalPageIndex:", -[THModelNode absolutePageIndexForRelativePageIndex:forPresentationType:](self->_contentNode, "absolutePageIndexForRelativePageIndex:forPresentationType:", objc_msgSend(a3, "contentNodeRelativePageIndex"), +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(v13, "context"))));
          -[THUpdateAnnotationAction p_updateContextAndCFIForStorage:storageID:range:annotation:](self, "p_updateContextAndCFIForStorage:storageID:range:annotation:", v13, v9, v7, v8, a3);
        }
      }
    }
  }
}

- (void)p_updateContextAndCFIForStorage:(id)a3 storageID:(id)a4 range:(_NSRange)a5 annotation:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;

  length = a5.length;
  location = a5.location;
  objc_msgSend(a6, "setAnnotationLocation:", -[THModelContentNode cfiForRange:storageUID:includeFilename:pedantic:](self->_contentNode, "cfiForRange:storageUID:includeFilename:pedantic:", a5.location, a5.length, a4, 1, 0));
  if (a3 && location != 0x7FFFFFFFFFFFFFFFLL && location + length > (unint64_t)objc_msgSend(a3, "length"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_updateContextAndCFIForStorage:storageID:range:annotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m"), 288, CFSTR("annotation has an invalid storage range"));
  if (a3 && location != 0x7FFFFFFFFFFFFFFFLL && location + length <= (unint64_t)objc_msgSend(a3, "length"))
  {
    v11 = 0;
    v12 = 0;
    if (objc_msgSend(a6, "annotationType") == 2)
      v10 = length;
    else
      v10 = 0;
    objc_msgSend(a3, "contextualStringsForSelection:prefix:suffix:", location, v10, &v12, &v11);
    objc_msgSend(a6, "setAnnotationRepresentativeText:", objc_msgSend(a3, "substringWithRange:", location, length));
    objc_msgSend(a6, "setSelectionPreContextText:", v12);
    objc_msgSend(a6, "setSelectionPostContextText:", v11);
  }
}

- (void)p_restoreChangedProperties:(id)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *changedProperties;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  NSNull *v12;
  id v13;
  NSMutableDictionary *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  uint64_t v19;
  NSNull *v20;
  NSNull *v21;
  NSDate *v22;
  NSDate *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v23 = (NSDate *)objc_msgSend(objc_msgSend(a3, "annotationModificationDate"), "copy");
  v22 = (NSDate *)objc_msgSend(objc_msgSend(a3, "userModificationDate"), "copy");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  changedProperties = self->_changedProperties;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](changedProperties, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(changedProperties);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v12 = (NSNull *)objc_msgSend(a3, "valueForKey:", v11);
        if (!v12)
          v12 = +[NSNull null](NSNull, "null");
        v13 = -[NSNull copy](v12, "copy");
        -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v13, v11);

      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](changedProperties, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = self->_changedProperties;
  v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j);
        v20 = (NSNull *)-[NSMutableDictionary objectForKey:](self->_changedProperties, "objectForKey:", v19);
        if (v20 == +[NSNull null](NSNull, "null"))
          v21 = 0;
        else
          v21 = v20;
        objc_msgSend(a3, "setValue:forKey:", v21, v19);
      }
      v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }
  objc_msgSend(a3, "setAnnotationModificationDate:", self->_modificationDate);
  objc_msgSend(a3, "setUserModificationDate:", self->_userModificationDate);

  self->_changedProperties = v5;
  self->_modificationDate = v23;

  self->_userModificationDate = v22;
}

- (NSMutableDictionary)changedProperties
{
  return self->_changedProperties;
}

- (void)setChangedProperties:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)userModificationDate
{
  return self->_userModificationDate;
}

- (void)setUserModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)autoUpdateWhenStorageRangeChanges
{
  return self->_autoUpdateWhenStorageRangeChanges;
}

- (void)setAutoUpdateWhenStorageRangeChanges:(BOOL)a3
{
  self->_autoUpdateWhenStorageRangeChanges = a3;
}

@end
