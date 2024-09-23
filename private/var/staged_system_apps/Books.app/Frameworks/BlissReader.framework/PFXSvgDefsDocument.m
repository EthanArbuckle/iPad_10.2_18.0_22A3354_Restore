@implementation PFXSvgDefsDocument

- (PFXSvgDefsDocument)initWithReaderState:(id)a3 entryPath:(id)a4 definitionMap:(id)a5
{
  PFXSvgDefsDocument *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PFXSvgDefsDocument;
  v8 = -[PFXSvgDefsDocument init](&v10, "init");
  if (v8)
  {
    v8->mReaderState = (PFXHtmlReaderState *)a3;
    v8->mEntryPath = (NSString *)a4;
    v8->mDefinitionMap = (NSMutableDictionary *)a5;
    v8->mElementStack = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXSvgDefsDocument;
  -[PFXSvgDefsDocument dealloc](&v3, "dealloc");
}

- (void)pushElement:(id)a3
{
  -[NSMutableArray addObject:](self->mElementStack, "addObject:", a3);
}

- (void)popElement
{
  -[NSMutableArray removeLastObject](self->mElementStack, "removeLastObject");
}

- (id)innermostElement
{
  id result;

  result = -[NSMutableArray count](self->mElementStack, "count");
  if (result)
    return -[NSMutableArray lastObject](self->mElementStack, "lastObject");
  return result;
}

- (id)definitionMap
{
  return self->mDefinitionMap;
}

- (id)entryPath
{
  return self->mEntryPath;
}

- (id)readerState
{
  return self->mReaderState;
}

@end
