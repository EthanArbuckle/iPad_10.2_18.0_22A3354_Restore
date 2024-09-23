@implementation _PXSharedLibraryMenuConfiguration

- (_PXSharedLibraryMenuConfiguration)initWithMenuBuilder:(id)a3
{
  id v6;
  _PXSharedLibraryMenuConfiguration *v7;
  _PXSharedLibraryMenuConfiguration *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryUtilities.m"), 2043, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("menuBuilder != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_PXSharedLibraryMenuConfiguration;
  v7 = -[_PXSharedLibraryMenuConfiguration init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_extraItemsMenuBuilder, a3);

  return v8;
}

- (PXMenuBuilder)extraItemsMenuBuilder
{
  return self->_extraItemsMenuBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraItemsMenuBuilder, 0);
}

@end
