@implementation TSPObject

- (TSPObjectContext)context
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TSPObjectContext *)v3;
}

- (TSPObject)initWithContext:(id)a3
{
  id v4;
  TSPObject *v5;
  TSPObject *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSPObject;
  v5 = -[TSPObject init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_modifyObjectToken = objc_msgSend(v4, "modifyObjectTokenForNewObject");

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unknownContent, 0);
}

- (TSPObject)init
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObject init]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObject.mm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 54, CFSTR("Do not call method"));

  v5 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSPObject init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)initDocumentObjectWithContext:(id)a3
{
  id v4;
  TSPObject *v5;

  v4 = a3;
  v5 = -[TSPObject initWithContext:](self, "initWithContext:", v4);
  if (v5)
    objc_msgSend(v4, "setDocumentObject:", v5);

  return v5;
}

- (NSString)packageLocator
{
  return 0;
}

- (BOOL)isComponentRoot
{
  void *v3;
  BOOL v4;

  -[TSPObject packageLocator](self, "packageLocator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = self->_identifier == 1;

  return v4;
}

- (BOOL)storeOutsideObjectArchive
{
  return 0;
}

- (TSPObject)componentRootObject
{
  return 0;
}

- (BOOL)allowsImplicitComponentOwnership
{
  return 1;
}

- (BOOL)shouldDelayArchiving
{
  return 0;
}

- (unsigned)delayedArchivingPriority
{
  return 500;
}

- (BOOL)isCommandObject
{
  return 0;
}

- (BOOL)allowsDuplicatesOutsideOfDocumentPackage
{
  return 0;
}

- (BOOL)dirtiesDocumentPackage
{
  return 1;
}

- (void)didFinishUnarchiving
{
  self->_unarchiverIdentifier = 0;
}

- (int64_t)tsp_identifier
{
  int64_t result;
  int64_t *p_identifier;
  id WeakRetained;
  unint64_t v6;

  p_identifier = &self->_identifier;
  result = self->_identifier;
  if (!result)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_msgSend(WeakRetained, "newObjectIdentifier");

    while (!__ldaxr((unint64_t *)p_identifier))
    {
      if (!__stlxr(v6, (unint64_t *)p_identifier))
        return *p_identifier;
    }
    __clrex();
    return *p_identifier;
  }
  return result;
}

+ (BOOL)tsp_isTransientObjectIdentifier:(int64_t)a3
{
  return a3 == 2 || a3 == 52 || a3 == 51 || a3 == 61 || a3 == 62;
}

- (BOOL)needsArchiving
{
  return 0;
}

- (void)setTsp_identifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (int64_t)tsp_unarchiverIdentifier
{
  return self->_unarchiverIdentifier;
}

- (TSPUnknownContent)tsp_unknownContent
{
  return self->_unknownContent;
}

- (int64_t)tsp_modifyObjectToken
{
  return self->_modifyObjectToken;
}

- (void)setTsp_modifyObjectToken:(int64_t)a3
{
  self->_modifyObjectToken = a3;
}

- (TSPObjectDelegate)tsp_delegate
{
  return (TSPObjectDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setTsp_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)documentRoot
{
  return -[TSPObjectContext documentRoot](-[TSPObject context](self, "context"), "documentRoot");
}

@end
