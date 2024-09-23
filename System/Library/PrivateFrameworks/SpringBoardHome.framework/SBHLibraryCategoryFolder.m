@implementation SBHLibraryCategoryFolder

- (SBHLibraryCategoryFolder)initWithDisplayName:(id)a3 maxListCount:(unint64_t)a4 listGridSize:(SBHIconGridSize)a5 libraryCategoryIdentifier:(id)a6
{
  id v10;
  SBHLibraryCategoryFolder *v11;
  uint64_t v12;
  SBHLibraryCategoryIdentifier *libraryCategoryIdentifier;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SBHLibraryCategoryFolder;
  v11 = -[SBFolder initWithDisplayName:maxListCount:listGridSize:](&v15, sel_initWithDisplayName_maxListCount_listGridSize_, a3, a4, *(unsigned int *)&a5);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    libraryCategoryIdentifier = v11->_libraryCategoryIdentifier;
    v11->_libraryCategoryIdentifier = (SBHLibraryCategoryIdentifier *)v12;

  }
  return v11;
}

- (BOOL)isLibraryCategoryFolder
{
  return 1;
}

- (id)_indexPathToRevealForJiggleMode
{
  return 0;
}

- (int64_t)listsFixedIconLocationBehavior
{
  return 0;
}

- (SBHLibraryCategoryIdentifier)libraryCategoryIdentifier
{
  return self->_libraryCategoryIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryCategoryIdentifier, 0);
}

@end
