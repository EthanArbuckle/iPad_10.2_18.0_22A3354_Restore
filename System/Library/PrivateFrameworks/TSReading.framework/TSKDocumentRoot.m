@implementation TSKDocumentRoot

- (TSKDocumentRoot)initWithContext:(id)a3
{
  TSKDocumentRoot *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSKDocumentRoot;
  v3 = -[TSPObject initWithContext:](&v5, sel_initWithContext_, a3);
  if (v3)
    v3->_annotationAuthorStorage = -[TSPObject initWithContext:]([TSKAnnotationAuthorStorage alloc], "initWithContext:", -[TSPObject context](v3, "context"));
  return v3;
}

- (void)documentDidLoad
{
  self->_accessController = -[TSKAccessController initWithDelegate:]([TSKAccessController alloc], "initWithDelegate:", self);
  self->_changeNotifier = objc_alloc_init(TSKChangeNotifier);
  self->_iCloudTeardownStackQueue = (OS_dispatch_queue *)dispatch_queue_create("TSKDocumentRoot.iCloudTeardownStack", 0);
}

+ (Class)commandControllerClass
{
  return 0;
}

- (void)dealloc
{
  NSObject *iCloudTeardownStackQueue;
  objc_super v4;

  iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue;
  if (iCloudTeardownStackQueue)
  {
    dispatch_release(iCloudTeardownStackQueue);
    self->_iCloudTeardownStackQueue = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)TSKDocumentRoot;
  -[TSKDocumentRoot dealloc](&v4, sel_dealloc);
}

- (unint64_t)applicationType
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot applicationType]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 178, CFSTR("should be overridden in app-specific document roots!"));
  return 3;
}

- (id)dataFromDocumentCachePath:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot dataFromDocumentCachePath:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 186, CFSTR("should be overridden in TSADocumentRoot"));
  return 0;
}

- (BOOL)writeData:(id)a3 atDocumentCachePath:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot writeData:atDocumentCachePath:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 192, CFSTR("should be overridden in TSADocumentRoot"));
  return 0;
}

- (CGImageSource)newImageSourceForDocumentCachePath:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot newImageSourceForDocumentCachePath:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 198, CFSTR("should be overridden in TSADocumentRoot"));
  return 0;
}

- (id)uniqueDocumentCachePathForProposedPath:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot uniqueDocumentCachePathForProposedPath:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 204, CFSTR("should be overridden in TSADocumentRoot"));
  return 0;
}

- (void)changeDocumentCacheFileProtection:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot changeDocumentCacheFileProtection:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 210, CFSTR("should be overridden in TSADocumentRoot"));
}

- (BOOL)documentCacheHasAtMostFileProtection:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot documentCacheHasAtMostFileProtection:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 215, CFSTR("should be overridden in TSADocumentRoot"));
  return 0;
}

- (void)didSaveWithEncryptionChange
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot didSaveWithEncryptionChange]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 221, CFSTR("should be overridden in TSADocumentRoot"));
}

- (unint64_t)writingDirection
{
  return 1;
}

- (NSString)creationLanguage
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot creationLanguage]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 250, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKDocumentRoot creationLanguage]"), 0));
}

- (BOOL)isDirectionRightToLeft
{
  return -[TSKDocumentRoot writingDirection](self, "writingDirection") == 2;
}

- (BOOL)documentDisallowsHighlightsOnStorage:(id)a3
{
  return 0;
}

- (id)modelEnumerator
{
  return -[TSKDocumentModelEnumerator initWithRootModelObject:filter:]([TSKDocumentModelEnumerator alloc], "initWithRootModelObject:filter:", self, 0);
}

- (id)modelEnumeratorForObjectsPassingTest:(id)a3
{
  return -[TSKDocumentModelEnumerator initWithRootModelObject:filter:]([TSKDocumentModelEnumerator alloc], "initWithRootModelObject:filter:", self, a3);
}

- (id)modelEnumeratorForObjectsOfClass:(Class)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__TSKDocumentRoot_modelEnumeratorForObjectsOfClass___block_invoke;
  v4[3] = &unk_24D82A688;
  v4[4] = a3;
  return -[TSKDocumentRoot modelEnumeratorForObjectsPassingTest:](self, "modelEnumeratorForObjectsPassingTest:", v4);
}

uint64_t __52__TSKDocumentRoot_modelEnumeratorForObjectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)modelEnumeratorForObjectsConformingToProtocol:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__TSKDocumentRoot_modelEnumeratorForObjectsConformingToProtocol___block_invoke;
  v4[3] = &unk_24D82A688;
  v4[4] = a3;
  return -[TSKDocumentRoot modelEnumeratorForObjectsPassingTest:](self, "modelEnumeratorForObjectsPassingTest:", v4);
}

uint64_t __65__TSKDocumentRoot_modelEnumeratorForObjectsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", *(_QWORD *)(a1 + 32));
}

- (id)modelEnumeratorForObjectsRespondingToSelector:(SEL)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__TSKDocumentRoot_modelEnumeratorForObjectsRespondingToSelector___block_invoke;
  v4[3] = &__block_descriptor_40_e24_B24__0___TSKModel__8_B16l;
  v4[4] = a3;
  return -[TSKDocumentRoot modelEnumeratorForObjectsPassingTest:](self, "modelEnumeratorForObjectsPassingTest:", v4);
}

uint64_t __65__TSKDocumentRoot_modelEnumeratorForObjectsRespondingToSelector___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)additionalDocumentPropertiesForWrite
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("locale");
  v4[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale"), "localeIdentifier");
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
}

- (void)coalesceChanges:(id)a3
{
  unint64_t v4;
  int v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v4 = objc_msgSend(a3, "count");
  if (v4 >= 2)
  {
    v5 = 0;
    v6 = v4 - 1;
    do
    {
      v7 = (void *)objc_msgSend(a3, "objectAtIndex:", v6);
      if (objc_msgSend(v7, "kind") == 2)
      {
        v8 = ((unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "details"), "objectForKey:", CFSTR("flags")), "unsignedIntegerValue") >> 3) & 1;
        if ((v8 & v5) == 1)
        {
          objc_msgSend(a3, "removeObjectAtIndex:", v6);
          v5 = 1;
        }
        else
        {
          v5 |= v8;
        }
      }
      --v6;
    }
    while (v6 != -1);
  }
}

- (void)markAsModifiedIfLocaleIsOutOfDate
{
  NSString *v3;

  v3 = -[NSLocale localeIdentifier](-[TSKDocumentRoot locale](self, "locale"), "localeIdentifier");
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"), "localeIdentifier")))-[TSPObject willModify](self, "willModify");
}

- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot withRootSearchTargetAtIndex:executeBlock:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 514, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKDocumentRoot withRootSearchTargetAtIndex:executeBlock:]"), 0));
}

- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot rootSearchTargetCountThroughIndex:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 519, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKDocumentRoot rootSearchTargetCountThroughIndex:]"), 0));
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  unint64_t v6;

  v6 = a3;
  if (a6 == 1)
  {
    if (a3)
    {
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        return -[TSKDocumentRoot rootSearchTargetCountThroughIndex:](self, "rootSearchTargetCountThroughIndex:", 0x7FFFFFFFFFFFFFFFLL, a4, a5)- 1;
      else
        return a3 - 1;
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if (!a6)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else if (-[TSKDocumentRoot rootSearchTargetCountThroughIndex:](self, "rootSearchTargetCountThroughIndex:", a3, a4, a5)- 1 > a3)
    {
      ++v6;
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v6;
}

- (id)commandForPropagatingPresetChangeCommand:(id)a3 alwaysPreserveAppearance:(BOOL)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot commandForPropagatingPresetChangeCommand:alwaysPreserveAppearance:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 567, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKDocumentRoot commandForPropagatingPresetChangeCommand:alwaysPreserveAppearance:]"), 0));
}

- (int64_t)addObserverForICloudTeardownWithBlock:(id)a3
{
  void *v5;
  uint64_t v6;
  TSKDocumentRootICloudObserver *v7;
  NSObject *iCloudTeardownStackQueue;
  _QWORD block[6];

  if (self->_iCloudTeardownStackQueue
    || (v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot addObserverForICloudTeardownWithBlock:]"), objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 580, CFSTR("invalid nil value for '%s'"), "_iCloudTeardownStackQueue"), self->_iCloudTeardownStackQueue))
  {
    v7 = -[TSKDocumentRootICloudObserver initWithBlock:]([TSKDocumentRootICloudObserver alloc], "initWithBlock:", a3);
    iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__TSKDocumentRoot_addObserverForICloudTeardownWithBlock___block_invoke;
    block[3] = &unk_24D82A5C8;
    block[4] = self;
    block[5] = v7;
    dispatch_async(iCloudTeardownStackQueue, block);
  }
  else
  {
    v7 = 0;
  }
  return -[TSKDocumentRootICloudObserver identifer](v7, "identifer");
}

uint64_t __57__TSKDocumentRoot_addObserverForICloudTeardownWithBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeICloudTeardownObserver:(int64_t)a3
{
  NSObject *iCloudTeardownStackQueue;
  void *v6;
  uint64_t v7;
  _QWORD block[6];

  iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue;
  if (iCloudTeardownStackQueue
    || (v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot removeICloudTeardownObserver:]"), objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 599, CFSTR("invalid nil value for '%s'"), "_iCloudTeardownStackQueue"), (iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue) != 0))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__TSKDocumentRoot_removeICloudTeardownObserver___block_invoke;
    block[3] = &unk_24D82A6D0;
    block[4] = self;
    block[5] = a3;
    dispatch_async(iCloudTeardownStackQueue, block);
  }
}

uint64_t __48__TSKDocumentRoot_removeICloudTeardownObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "reverseObjectEnumerator", 0);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (objc_msgSend(v7, "identifer") == *(_QWORD *)(a1 + 40))
          return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObjectIdenticalTo:", v7);
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (void)notifyICloudTeardownObservers
{
  NSObject *iCloudTeardownStackQueue;
  void *v4;
  uint64_t v5;
  _QWORD block[5];

  iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue;
  if (iCloudTeardownStackQueue
    || (v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot notifyICloudTeardownObservers]"), objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 620, CFSTR("invalid nil value for '%s'"), "_iCloudTeardownStackQueue"), (iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue) != 0))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__TSKDocumentRoot_notifyICloudTeardownObservers__block_invoke;
    block[3] = &unk_24D829278;
    block[4] = self;
    dispatch_sync(iCloudTeardownStackQueue, block);
  }
}

uint64_t __48__TSKDocumentRoot_notifyICloudTeardownObservers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "reverseObjectEnumerator", 0);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invokeWithDocumentRoot:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)hasICloudTeardownObserver
{
  NSObject *iCloudTeardownStackQueue;
  void *v4;
  uint64_t v5;
  char v6;
  _QWORD block[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue;
  if (iCloudTeardownStackQueue
    || (v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot hasICloudTeardownObserver]"),
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 636, CFSTR("invalid nil value for '%s'"), "_iCloudTeardownStackQueue"), (iCloudTeardownStackQueue = self->_iCloudTeardownStackQueue) != 0))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__TSKDocumentRoot_hasICloudTeardownObserver__block_invoke;
    block[3] = &unk_24D82A6F8;
    block[4] = self;
    block[5] = &v9;
    dispatch_sync(iCloudTeardownStackQueue, block);
  }
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __44__TSKDocumentRoot_hasICloudTeardownObserver__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (BOOL)hasICloudConflict
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot hasICloudConflict]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 649, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKDocumentRoot hasICloudConflict]"), 0));
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (TSKAccessController)accessController
{
  return self->_accessController;
}

- (TSKChangeNotifier)changeNotifier
{
  return self->_changeNotifier;
}

- (TSKPasteboardController)pasteboardController
{
  return self->_pasteboardController;
}

- (void)setPasteboardController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (BOOL)isFindActive
{
  return self->_isFindActive;
}

- (void)setFindActive:(BOOL)a3
{
  self->_isFindActive = a3;
}

- (TSKUndoRedoState)undoRedoState
{
  return self->_undoRedoState;
}

- (void)setUndoRedoState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (TSKAnnotationAuthorStorage)annotationAuthorStorage
{
  return self->_annotationAuthorStorage;
}

- (void)setAnnotationAuthorStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (BOOL)isBeingLocalized
{
  return self->_isBeingLocalized;
}

- (TSKSearchReference)activeSearchReference
{
  return self->_activeSearchReference;
}

- (void)setActiveSearchReference:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSDictionary)searchReferencesToHighlight
{
  return self->_searchReferencesToHighlight;
}

- (void)setSearchReferencesToHighlight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (TSKDocumentSupport)documentSupport
{
  return self->_documentSupport;
}

- (TSKDocumentViewController)viewController
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot(iOS) viewController]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot_iOS.m"), 12, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKDocumentRoot(iOS) viewController]"), 0));
}

- (TSSTheme)theme
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot(TSSAdditions) theme]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSKDocumentRoot_TSSAdditions.m"), 20, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKDocumentRoot(TSSAdditions) theme]"), 0));
}

- (void)setTheme:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot(TSSAdditions) setTheme:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSKDocumentRoot_TSSAdditions.m"), 25, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKDocumentRoot(TSSAdditions) setTheme:]"), 0));
}

- (void)setThemeForTemplateImport:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot(TSSAdditions) setThemeForTemplateImport:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSKDocumentRoot_TSSAdditions.m"), 30, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKDocumentRoot(TSSAdditions) setThemeForTemplateImport:]"), 0));
}

- (TSSStylesheet)stylesheet
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRoot(TSSAdditions) stylesheet]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSKDocumentRoot_TSSAdditions.m"), 35, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKDocumentRoot(TSSAdditions) stylesheet]"), 0));
}

- (void)enumerateStyleClientsUsingBlock:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = -[TSKDocumentRoot modelEnumerator](self, "modelEnumerator");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__TSKDocumentRoot_TSSAdditions__enumerateStyleClientsUsingBlock___block_invoke;
  v5[3] = &unk_24D82B190;
  v5[4] = a3;
  objc_msgSend(v4, "enumerateUsingBlock:", v5);
}

uint64_t __65__TSKDocumentRoot_TSSAdditions__enumerateStyleClientsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_opt_class();
  result = TSUClassAndProtocolCast();
  if (result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

- (id)changeSessionManagerForModel:(id)a3
{
  return 0;
}

- (id)changeVisibility
{
  return 0;
}

- (BOOL)shouldHyphenate
{
  return 0;
}

- (__CFLocale)hyphenationLocale
{
  return 0;
}

- (BOOL)useLigatures
{
  return 1;
}

- (id)documentFonts
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _BYTE v27[128];
  _QWORD v28[2];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v28[0] = -[TSKDocumentRoot stylesheet](self, "stylesheet");
  v28[1] = -[TSSTheme stylesheet](-[TSKDocumentRoot theme](self, "theme"), "stylesheet");
  obj = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v23;
    v4 = MEMORY[0x24BDAC760];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v5);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v26[0] = objc_opt_class();
        v26[1] = objc_opt_class();
        v7 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v19;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v19 != v10)
                objc_enumerationMutation(v7);
              v12 = (void *)objc_msgSend(v6, "stylesOfClass:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11));
              v17[0] = v4;
              v17[1] = 3221225472;
              v17[2] = __47__TSKDocumentRoot_TSWPAdditions__documentFonts__block_invoke;
              v17[3] = &unk_24D82D1D8;
              v17[4] = v3;
              objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
          }
          while (v9);
        }
        ++v5;
      }
      while (v5 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    }
    while (v16);
  }
  return v3;
}

uint64_t __47__TSKDocumentRoot_TSWPAdditions__documentFonts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "propertyMap"), "objectForProperty:", 16);
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", result);
  return result;
}

- (id)unavailableDocumentFonts
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CTFontDescriptor *v10;
  const __CTFontDescriptor *v11;
  CFArrayRef MatchingFontDescriptors;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = -[TSKDocumentRoot documentFonts](self, "documentFonts");
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x24BDC4D70];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v18 = v7;
        v19 = v9;
        v10 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        if (v10
          && (v11 = v10,
              MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v10, 0),
              CFRelease(v11),
              MatchingFontDescriptors))
        {
          CFRelease(MatchingFontDescriptors);
        }
        else
        {
          objc_msgSend(v3, "addObject:", v9);
        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }
  return v3;
}

@end
