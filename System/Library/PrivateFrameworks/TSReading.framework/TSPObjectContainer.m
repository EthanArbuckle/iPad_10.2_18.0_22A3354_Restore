@implementation TSPObjectContainer

- (TSPObjectContainer)initWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObjectContainer initWithContext:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContainer.mm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 25, CFSTR("Do not call method"));

  v7 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSPObjectContainer initWithContext:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v8, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v9);
}

- (TSPObjectContainer)initWithContext:(id)a3 packageIdentifier:(unsigned __int8)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  TSPObjectContainer *v10;
  TSPObjectContainer *v11;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObjectContainer initWithContext:packageIdentifier:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContainer.mm");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 30, CFSTR("Unexpected package identifier."));

  }
  v13.receiver = self;
  v13.super_class = (Class)TSPObjectContainer;
  v10 = -[TSPObject initWithContext:](&v13, sel_initWithContext_, v6);
  v11 = v10;
  if (v10)
    v10->_packageIdentifier = v4;

  return v11;
}

+ (int64_t)objectIdentifierForPackageIdentifier:(unsigned __int8)a3
{
  int64_t *v3;

  if (a3 == 2)
  {
    v3 = &UnsafePointer;
    return *v3;
  }
  if (a3 == 1)
  {
    v3 = &UnsafePointer;
    return *v3;
  }
  return 0;
}

- (int64_t)tsp_identifier
{
  int64_t result;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  result = objc_msgSend((id)objc_opt_class(), "objectIdentifierForPackageIdentifier:", self->_packageIdentifier);
  if (!result)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObjectContainer tsp_identifier]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContainer.mm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 100, CFSTR("Unexpected package identifier: %d"), self->_packageIdentifier);

    v7.receiver = self;
    v7.super_class = (Class)TSPObjectContainer;
    return -[TSPObject tsp_identifier](&v7, sel_tsp_identifier);
  }
  return result;
}

- (id)packageLocator
{
  return CFSTR("ObjectContainer");
}

- (BOOL)shouldDelayArchiving
{
  return 1;
}

- (unsigned)delayedArchivingPriority
{
  return -1;
}

- (void)prepareForComponentWriteWithDelayedObjects:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *childObjects;
  id v9;

  v9 = a3;
  if (self->_childObjects)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObjectContainer prepareForComponentWriteWithDelayedObjects:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContainer.mm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 124, CFSTR("expected nil value for '%s'"), "_childObjects");

  }
  v7 = (NSArray *)objc_msgSend(v9, "copy");
  childObjects = self->_childObjects;
  self->_childObjects = v7;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childObjects, 0);
}

@end
