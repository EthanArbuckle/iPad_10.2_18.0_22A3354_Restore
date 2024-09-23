@implementation ICFixPasswordProtectedNotesInSharedFoldersLaunchTask

- (void)runLaunchTask
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005BE54;
  v4[3] = &unk_100550110;
  v4[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

- (id)fetchPasswordProtectedNotesInSharedFolders
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFixPasswordProtectedNotesInSharedFoldersLaunchTask passwordProtectedNoteInSharedFolderPredicate](self, "passwordProtectedNoteInSharedFolderPredicate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote ic_objectsMatchingPredicate:context:](ICNote, "ic_objectsMatchingPredicate:context:", v3, v4));

  return v5;
}

- (NSPredicate)passwordProtectedNoteInSharedFolderPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudSyncingObject predicateForPasswordProtectedObjects](ICCloudSyncingObject, "predicateForPasswordProtectedObjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("folder.serverShareData != nil")));
  v7[0] = v2;
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v4));

  return (NSPredicate *)v5;
}

- (NSSet)movedNoteObjectIDs
{
  return self->_movedNoteObjectIDs;
}

- (void)setMovedNoteObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_movedNoteObjectIDs, a3);
}

- (void)setPasswordProtectedNoteInSharedFolderPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_passwordProtectedNoteInSharedFolderPredicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordProtectedNoteInSharedFolderPredicate, 0);
  objc_storeStrong((id *)&self->_movedNoteObjectIDs, 0);
}

@end
