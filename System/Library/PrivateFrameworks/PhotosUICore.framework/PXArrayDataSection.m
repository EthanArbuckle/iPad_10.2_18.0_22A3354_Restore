@implementation PXArrayDataSection

- (PXArrayDataSection)initWithOutlineObject:(id)a3 sectionContent:(id)a4
{
  id v6;
  PXArrayDataSection *v7;
  uint64_t v8;
  NSArray *sectionContent;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXArrayDataSection;
  v7 = -[PXDataSection initWithOutlineObject:](&v11, sel_initWithOutlineObject_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    sectionContent = v7->_sectionContent;
    v7->_sectionContent = (NSArray *)v8;

  }
  return v7;
}

- (PXArrayDataSection)initWithSectionContent:(id)a3
{
  return -[PXArrayDataSection initWithOutlineObject:sectionContent:](self, "initWithOutlineObject:sectionContent:", 0, a3);
}

- (PXArrayDataSection)initWithOutlineObject:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDataSection.m"), 90, CFSTR("%s is not available as initializer"), "-[PXArrayDataSection initWithOutlineObject:]");

  abort();
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[PXArrayDataSection sectionContent](self, "sectionContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)objectAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXArrayDataSection sectionContent](self, "sectionContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[PXArrayDataSection sectionContent](self, "sectionContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (int64_t)indexOfObject:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[PXArrayDataSection sectionContent](self, "sectionContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (int64_t)validatedIndexOfObject:(id)a3 hintIndex:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL
    || (-[PXArrayDataSection objectAtIndex:](self, "objectAtIndex:", a4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", v6),
        v7,
        (v8 & 1) == 0))
  {
    a4 = -[PXArrayDataSection indexOfObject:](self, "indexOfObject:", v6);
  }

  return a4;
}

- (NSArray)sectionContent
{
  return self->_sectionContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionContent, 0);
}

@end
