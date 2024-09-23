@implementation _SBIconListViewDataDraggingContext

- (_SBIconListViewDataDraggingContext)initWithIconView:(id)a3 bestUTI:(id)a4 allowsMoveOperation:(BOOL)a5 fileOptions:(int64_t)a6
{
  id v11;
  id v12;
  _SBIconListViewDataDraggingContext *v13;
  _SBIconListViewDataDraggingContext *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_SBIconListViewDataDraggingContext;
  v13 = -[_SBIconListViewDataDraggingContext init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_iconView, a3);
    objc_storeStrong((id *)&v14->_bestAvailableUTI, a4);
    v14->_allowsMoveOperation = a5;
    v14->_fileOptions = a6;
  }

  return v14;
}

- (NSString)description
{
  return (NSString *)-[_SBIconListViewDataDraggingContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBIconListViewDataDraggingContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_iconView, CFSTR("iconView"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_SBIconListViewDataDraggingContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[_SBIconListViewDataDraggingContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_bestAvailableUTI, CFSTR("bestAvailableUTI"));
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_allowsMoveOperation, CFSTR("allowsMoveOperation"));
  v6 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_fileOptions, CFSTR("fileOptions"));
  return v4;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (NSString)bestAvailableUTI
{
  return self->_bestAvailableUTI;
}

- (BOOL)allowsMoveOperation
{
  return self->_allowsMoveOperation;
}

- (int64_t)fileOptions
{
  return self->_fileOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestAvailableUTI, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
