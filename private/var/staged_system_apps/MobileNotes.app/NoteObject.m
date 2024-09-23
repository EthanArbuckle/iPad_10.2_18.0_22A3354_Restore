@implementation NoteObject

- (void)undoablyMoveToTrashWithActionName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "undoManager"));

  if ((-[NoteObject isMarkedForDeletion](self, "isMarkedForDeletion") & 1) == 0)
  {
    -[NoteObject markForDeletion](self, "markForDeletion");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "prepareWithInvocationTarget:", self));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NoteObject store](self, "store"));
    objc_msgSend(v6, "undoablyUndeleteTo:actionName:", v7, v8);

  }
}

- (void)undoablyUndeleteTo:(id)a3 actionName:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "undoManager"));

  v7 = objc_claimAutoreleasedReturnValue(-[NoteObject managedObjectContext](self, "managedObjectContext"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[NoteObject isMarkedForDeletion](self, "isMarkedForDeletion");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prepareWithInvocationTarget:", self));
      objc_msgSend(v10, "undoablyMoveToTrashWithActionName:", v11);

    }
  }

}

@end
