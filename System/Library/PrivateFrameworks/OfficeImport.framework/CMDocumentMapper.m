@implementation CMDocumentMapper

- (CMDocumentMapper)initWithDocument:(id)a3 archiver:(id)a4
{
  id v7;
  id v8;
  CMDocumentMapper *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CMDocumentMapper;
  v9 = -[CMMapper initWithParent:](&v11, sel_initWithParent_, 0);
  if (v9)
  {
    +[CMGlobalCache initGlobalCache](CMGlobalCache, "initGlobalCache");
    objc_storeStrong((id *)&v9->super._document, a3);
    objc_storeStrong((id *)&v9->super.mArchiver, a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  +[CMGlobalCache releaseGlobalCache](CMGlobalCache, "releaseGlobalCache");
  v3.receiver = self;
  v3.super_class = (Class)CMDocumentMapper;
  -[CMDocumentMapper dealloc](&v3, sel_dealloc);
}

@end
