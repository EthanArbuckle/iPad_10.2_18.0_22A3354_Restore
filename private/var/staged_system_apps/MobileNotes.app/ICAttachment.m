@implementation ICAttachment

- (void)undoablySetTitle:(id)a3 isUserDefined:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a4;
  v17 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prepareWithInvocationTarget:", self));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachment title](self, "title"));
  objc_msgSend(v7, "undoablySetTitle:isUserDefined:", v8, v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Set Attachment Name"), &stru_1005704B8, 0));
  objc_msgSend(v9, "setActionName:", v11);

  -[ICAttachment setTitle:](self, "setTitle:", v17);
  if (v4)
    -[ICAttachment setUserTitle:](self, "setUserTitle:", v17);
  -[ICAttachment updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Set attachment title"));
  -[ICAttachment attachmentDidChange](self, "attachmentDidChange");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachment note](self, "note"));
  v13 = objc_msgSend(v12, "regenerateTitle:snippet:", 1, 0);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachment note](self, "note"));
    objc_msgSend(v14, "markShareDirtyIfNeededWithReason:", CFSTR("Set attachment title"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachment note](self, "note"));
    objc_msgSend(v15, "updateChangeCountWithReason:", CFSTR("Set attachment title"));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachment managedObjectContext](self, "managedObjectContext"));
  objc_msgSend(v16, "ic_saveWithLogDescription:", CFSTR("Set attachment title"));

}

@end
