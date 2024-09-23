@implementation __RCFolderContentsDelegate

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  RCFoldersFetchedResultsController *foldersController;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "folder"));
  v4 = objc_msgSend(v6, "folderType");
  foldersController = self->_foldersController;
  if (v4 == (id)4)
    -[RCFoldersFetchedResultsController reloadUserFolder:](foldersController, "reloadUserFolder:", v6);
  else
    -[RCFoldersFetchedResultsController reloadBuiltinFolder:](foldersController, "reloadBuiltinFolder:", v6);

}

- (RCFoldersFetchedResultsController)foldersController
{
  return self->_foldersController;
}

- (void)setFoldersController:(id)a3
{
  self->_foldersController = (RCFoldersFetchedResultsController *)a3;
}

@end
