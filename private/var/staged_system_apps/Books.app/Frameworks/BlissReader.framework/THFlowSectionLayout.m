@implementation THFlowSectionLayout

- (void)ensurePageLayoutCreated
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (!objc_msgSend(-[THFlowSectionLayout children](self, "children"), "count"))
  {
    if (!objc_msgSend(objc_msgSend(-[THFlowSectionLayout info](self, "info"), "childInfos"), "count"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionLayout ensurePageLayoutCreated]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionLayout.mm"), 30, CFSTR("section info has no child infos"));
    v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = -[THFlowSectionLayout layoutController](self, "layoutController");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(-[THFlowSectionLayout info](self, "info", 0), "childInfos");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          v11 = objc_msgSend(v4, "layoutForInfo:childOfLayout:", v10, self);
          if (!v11)
          {
            v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "layoutClass")), "initWithInfo:", v10);
            if (!v11)
              continue;
          }
          objc_msgSend(v3, "addObject:", v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    -[THFlowSectionLayout setChildren:](self, "setChildren:", v3);

    objc_msgSend(-[THFlowSectionLayout children](self, "children"), "makeObjectsPerformSelector:", "updateChildrenFromInfo");
    objc_msgSend(-[THFlowSectionLayout children](self, "children"), "makeObjectsPerformSelector:", "validate");
  }
}

- (void)invalidateSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THFlowSectionLayout;
  -[THFlowSectionLayout invalidateSize](&v3, "invalidateSize");
  objc_msgSend(-[THSectionLayout dependentLayouts](self, "dependentLayouts"), "makeObjectsPerformSelector:", "invalidateSize");
}

- (void)invalidatePosition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THFlowSectionLayout;
  -[THFlowSectionLayout invalidatePosition](&v3, "invalidatePosition");
  objc_msgSend(-[THSectionLayout dependentLayouts](self, "dependentLayouts"), "makeObjectsPerformSelector:", "invalidatePosition");
}

@end
