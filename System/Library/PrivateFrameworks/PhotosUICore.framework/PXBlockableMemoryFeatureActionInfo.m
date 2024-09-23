@implementation PXBlockableMemoryFeatureActionInfo

- (PXBlockableMemoryFeatureActionInfo)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBlockableMemoryFeatureActionInfo.m"), 14, CFSTR("%s is not available as initializer"), "-[PXBlockableMemoryFeatureActionInfo init]");

  abort();
}

- (PXBlockableMemoryFeatureActionInfo)initWithActionType:(id)a3 localizedTitle:(id)a4
{
  id v7;
  id v8;
  PXBlockableMemoryFeatureActionInfo *v9;
  PXBlockableMemoryFeatureActionInfo *v10;
  uint64_t v11;
  NSString *localizedTitle;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXBlockableMemoryFeatureActionInfo;
  v9 = -[PXBlockableMemoryFeatureActionInfo init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionType, a3);
    v11 = objc_msgSend(v8, "copy");
    localizedTitle = v10->_localizedTitle;
    v10->_localizedTitle = (NSString *)v11;

  }
  return v10;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
}

@end
