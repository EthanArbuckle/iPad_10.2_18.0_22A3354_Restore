@implementation PXSidebarDataContext

- (PXSidebarDataContext)initWithLibraryFilterState:(id)a3 workQueue:(id)a4 enablementProvider:(id)a5 assetsFilterPredicate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PXSidebarDataContext *v15;
  PXSidebarDataContext *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXSidebarDataContext;
  v15 = -[PXSidebarDataContext init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a4);
    objc_storeStrong((id *)&v16->_libraryFilterState, a3);
    objc_storeStrong((id *)&v16->_enablementProvider, a5);
    objc_storeStrong((id *)&v16->_assetsFilterPredicate, a6);
  }

  return v16;
}

- (PXSidebarDataContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSidebarDataContext.m"), 27, CFSTR("%s is not available as initializer"), "-[PXSidebarDataContext init]");

  abort();
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (NSOperationQueue)workQueue
{
  return self->_workQueue;
}

- (PXSidebarDataSectionEnablement)enablementProvider
{
  return self->_enablementProvider;
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_enablementProvider, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
}

@end
