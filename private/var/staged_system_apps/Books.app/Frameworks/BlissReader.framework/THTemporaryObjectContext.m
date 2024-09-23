@implementation THTemporaryObjectContext

+ (id)temporaryContextForDocumentContext:(id)a3
{
  uint64_t v5;
  id result;

  v5 = objc_opt_class(THTemporaryObjectContext);
  TSUDynamicCast(v5, a3);
  if (!result)
    return objc_msgSend(objc_alloc((Class)a1), "initWithDelegate:documentContext:", objc_msgSend(objc_alloc((Class)TSPTemporaryObjectContextDelegate), "initWithPackageURL:", 0), a3);
  return result;
}

+ (id)context
{
  return objc_msgSend(a1, "temporaryContextForDocumentContext:", 0);
}

- (THTemporaryObjectContext)initWithDelegate:(id)a3 documentContext:(id)a4
{
  THTemporaryObjectContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THTemporaryObjectContext;
  v5 = -[THTemporaryObjectContext initWithDelegate:](&v7, "initWithDelegate:", a3);
  if (v5)
    v5->_documentContext = (TSPObjectContext *)a4;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THTemporaryObjectContext;
  -[THTemporaryObjectContext dealloc](&v3, "dealloc");
}

- (id)documentRoot
{
  return -[TSPObjectContext documentRoot](self->_documentContext, "documentRoot");
}

@end
