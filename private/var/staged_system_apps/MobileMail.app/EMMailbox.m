@implementation EMMailbox

- (id)iconFromBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EMMailbox objectID](self, "objectID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legacyMailboxForObjectID:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailboxUid iconFromBundle:forType:](MFMailboxUid, "iconFromBundle:forType:", v4, objc_msgSend(v8, "mailboxType")));
  return v9;
}

- (int)level
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mailboxProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EMMailbox objectID](self, "objectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legacyMailboxForObjectID:", v5));

  LODWORD(v3) = objc_msgSend(v6, "level");
  return (int)v3;
}

+ (id)mailboxesWithTypes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ef_map:", &stru_10051E260));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v6 = objc_msgSend(objc_alloc((Class)EMQuery), "initWithTargetClass:predicate:sortDescriptors:", objc_opt_class(EMMailbox), v4, &__NSArray0__struct);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "daemonInterface"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailboxRepository"));

  if (v9)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000DD8B4;
    v15[3] = &unk_10051E288;
    v16 = v5;
    objc_msgSend(v9, "performQuery:completionHandler:", v6, v15);

  }
  else
  {
    objc_msgSend(v5, "finishWithResult:error:", &__NSArray0__struct, 0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "future"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "result:", 0));
  v12 = v11;
  if (!v11)
    v11 = &__NSArray0__struct;
  v13 = v11;

  return v13;
}

+ (id)receivingAccounts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "daemonInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountRepository"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "receivingAccounts"));

  return v5;
}

@end
