@implementation PXFetchResultDataSection

- (PXFetchResultDataSection)initWithFetchResult:(id)a3
{
  id v5;
  PXFetchResultDataSection *v6;
  PXFetchResultDataSection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFetchResultDataSection;
  v6 = -[PXDataSection initWithOutlineObject:](&v9, sel_initWithOutlineObject_, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fetchResult, a3);

  return v7;
}

- (PXFetchResultDataSection)initWithOutlineObject:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultDataSection.m"), 23, CFSTR("%s is not available as initializer"), "-[PXFetchResultDataSection initWithOutlineObject:]");

  abort();
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[PXFetchResultDataSection fetchResult](self, "fetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)objectAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXFetchResultDataSection fetchResult](self, "fetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)objectsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXFetchResultDataSection fetchResult](self, "fetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[PXFetchResultDataSection fetchResult](self, "fetchResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

@end
