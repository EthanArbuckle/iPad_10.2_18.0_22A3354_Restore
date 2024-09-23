@implementation ICHashtag

+ (void)undoablyMarkForDeletion:(BOOL)a3 standardizedContent:(id)a4 account:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  BOOL v19;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "prepareWithInvocationTarget:", a1));
  objc_msgSend(v11, "undoablyMarkForDeletion:standardizedContent:account:", !v6, v8, v9);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000F5C04;
  v15[3] = &unk_100550188;
  v16 = v8;
  v17 = v9;
  v19 = v6;
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
  v12 = v18;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v12, "performBlockAndWait:", v15);

}

@end
