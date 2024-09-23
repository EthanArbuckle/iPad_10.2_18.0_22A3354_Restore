@implementation PXStoryStyleSelectionDataSource

- (PXStoryStyleSelectionDataSource)initWithStyleInfos:(id)a3 indexOfCurrentStyle:(int64_t)a4 indexOfCustomStyle:(int64_t)a5
{
  id v8;
  PXStoryStyleSelectionDataSource *v9;
  PXStoryStyleSelectionDataSource *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryStyleSelectionDataSource;
  v9 = -[PXStoryStyleSelectionDataSource init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_indexOfCurrentStyle = a4;
    v9->_indexOfCustomStyle = a5;
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v10->_styleInfos, v13);

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  _QWORD *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  int v11;
  BOOL v12;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_descriptionForAssertionMessage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleSelectionDataSource.m"), 33, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("object"), v16, v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleSelectionDataSource.m"), 33, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("object"), v16);
    }

LABEL_4:
    v7 = (NSArray *)v6[3];
    v8 = self->_styleInfos;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      v10 = v7;
      v11 = -[NSArray isEqual:](v10, "isEqual:", v9);

      if (!v11)
        goto LABEL_11;
    }
    if (v6[1] == self->_indexOfCurrentStyle)
    {
      v12 = v6[2] == self->_indexOfCustomStyle;
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (PXStoryStyleSelectionDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleSelectionDataSource.m"), 42, CFSTR("%s is not available as initializer"), "-[PXStoryStyleSelectionDataSource init]");

  abort();
}

- (int64_t)numberOfStyles
{
  return -[NSArray count](self->_styleInfos, "count");
}

- (id)songForStyleAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->_styleInfos, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "songResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_storyResourceSongAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)infosForStylesInRange:(_NSRange)a3
{
  return -[NSArray subarrayWithRange:](self->_styleInfos, "subarrayWithRange:", a3.location, a3.length);
}

- (id)styleInfoAtIndex:(int64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_styleInfos, "objectAtIndexedSubscript:", a3);
}

- (PXStoryStyleDescriptor)styleInfoForCurrentStyle
{
  return (PXStoryStyleDescriptor *)-[PXStoryStyleSelectionDataSource styleInfoAtIndex:](self, "styleInfoAtIndex:", -[PXStoryStyleSelectionDataSource indexOfCurrentStyle](self, "indexOfCurrentStyle"));
}

- (int64_t)indexOfCurrentStyle
{
  return self->_indexOfCurrentStyle;
}

- (int64_t)indexOfCustomStyle
{
  return self->_indexOfCustomStyle;
}

- (NSArray)styleInfos
{
  return self->_styleInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleInfos, 0);
}

@end
