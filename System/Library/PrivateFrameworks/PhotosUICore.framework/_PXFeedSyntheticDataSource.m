@implementation _PXFeedSyntheticDataSource

- (_PXFeedSyntheticDataSource)initWithNumberOfSections:(int64_t)a3 numberOfItemsPerSection:(int64_t)a4
{
  _PXFeedSyntheticDataSource *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PXFeedSyntheticDataSource;
  result = -[_PXFeedSyntheticDataSource init](&v7, sel_init);
  if (result)
  {
    result->_numberOfSections = a3;
    result->_numberOfItemsPerSection = a4;
  }
  return result;
}

- (int64_t)numberOfSections
{
  return self->_numberOfSections;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return self->_numberOfItemsPerSection;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v3;
  void *v7;
  uint64_t v8;

  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
    goto LABEL_8;
  if (a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Synthetic Item %li:%li"), a3->section, a3->item);
      return v3;
    }
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedSyntheticDataSourceManager.m"), 74, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_8;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Synthetic Section %li"), a3->section, v8);
  return v3;
}

@end
