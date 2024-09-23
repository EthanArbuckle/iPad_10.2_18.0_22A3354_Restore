@implementation MFMailboxFilter

- (MFMailboxFilter)initWithType:(int64_t)a3 name:(id)a4 description:(id)a5 criterion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  MFMailboxFilter *v14;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter _blankImage](self, "_blankImage"));
  v14 = -[MFMailboxFilter initWithType:name:description:icon:iconTintColor:criterion:](self, "initWithType:name:description:icon:iconTintColor:criterion:", a3, v10, v11, v13, 0, v12);

  return v14;
}

- (MFMailboxFilter)initWithType:(int64_t)a3 name:(id)a4 description:(id)a5 icon:(id)a6 iconTintColor:(id)a7 criterion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  MFMailboxFilter *v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  objc_super v27;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (v15)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailboxFilter.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v20)
      goto LABEL_3;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailboxFilter.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("criterion"));

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)MFMailboxFilter;
  LOBYTE(v26) = objc_msgSend(v20, "criterionType") == (id)23;
  v21 = -[MFMailboxFilter initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:](&v27, "initWithType:name:description:iconImageName:iconTintColor:predicate:hasMailboxPredicate:", a3, v15, v16, 0, v18, 0, v26);
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageWithRenderingMode:", 2));
    -[MFMailboxFilter setIcon:](v21, "setIcon:", v22);

    objc_storeStrong((id *)&v21->_criterion, a8);
  }

  return v21;
}

- (id)_blankImage
{
  if (qword_1005AA180 != -1)
    dispatch_once(&qword_1005AA180, &stru_1005212E0);
  return (id)qword_1005AA178;
}

- (BOOL)isEquivalentToCriterion:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter criterion](self, "criterion"));
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (BOOL)hasCriterionOfType:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter criterion](self, "criterion"));
  LOBYTE(a3) = objc_msgSend(v4, "criterionType") == (id)a3;

  return a3;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter predicate](self, "predicate"));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter predicate](self, "predicate"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter criterion](self, "criterion"));
  v5 = v4;
  v6 = objc_msgSend(v4, "hash");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter name](self, "name"));
  v8 = objc_msgSend(v7, "hash");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter filterDescription](self, "filterDescription"));
  v10 = (char *)objc_msgSend(v9, "hash") + 33 * ((_QWORD)v8 + 33 * (_QWORD)v6) + 35937;

  return (unint64_t)v10;
}

- (BOOL)isEqual:(id)a3
{
  MFMailboxFilter *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (MFMailboxFilter *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class(MFMailboxFilter);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = -[MFMailboxFilter isEqualToFilter:](self, "isEqualToFilter:", v4);
    else
      v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter predicate](self, "predicate"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter predicate](self, "predicate"));
      v7 = objc_msgSend(v4, "isEquivalentToPredicate:", v6);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter criterion](self, "criterion"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "criterion"));
      v7 = objc_msgSend(v6, "isEqual:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter name](self, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    if (objc_msgSend(v10, "isEqualToString:", v11))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter filterDescription](self, "filterDescription"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filterDescription"));
      v8 = objc_msgSend(v12, "isEqualToString:", v13) & v7;

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)debugDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter name](self, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter filterDescription](self, "filterDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter criterion](self, "criterion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilter predicate](self, "predicate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p\nName: %@\nDescription:  %@\nCriterion: \n%@\nPredicate: \n%@"), v5, self, v6, v7, v8, v9));

  return v10;
}

- (id)initForFlaggedMessages
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMailboxFilter;
  v2 = -[MFMailboxFilter initForFlaggedMessages](&v6, "initForFlaggedMessages");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MFMessageCriterion flaggedMessageCriterion](MFMessageCriterion, "flaggedMessageCriterion"));
    v4 = (void *)v2[1];
    v2[1] = v3;

  }
  return v2;
}

- (id)initForUnreadMessages
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMailboxFilter;
  v2 = -[MFMailboxFilter initForUnreadMessages](&v6, "initForUnreadMessages");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MFMessageCriterion unreadMessageCriterion](MFMessageCriterion, "unreadMessageCriterion"));
    v4 = (void *)v2[1];
    v2[1] = v3;

  }
  return v2;
}

- (id)initForToMeMessages
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMailboxFilter;
  v2 = -[MFMailboxFilter initForToMeMessages](&v7, "initForToMeMessages");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MFMessageCriterion toMeCriterion](MFMessageCriterion, "toMeCriterion"));
    v4 = (void *)v2[1];
    v2[1] = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailboxFilter _addressLabelOfType:](MFMailboxFilter, "_addressLabelOfType:", 2));
    objc_msgSend(v2, "setIcon:", v5);

  }
  return v2;
}

- (id)initForCCMeMessages
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMailboxFilter;
  v2 = -[MFMailboxFilter initForCCMeMessages](&v7, "initForCCMeMessages");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MFMessageCriterion ccMeCriterion](MFMessageCriterion, "ccMeCriterion"));
    v4 = (void *)v2[1];
    v2[1] = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailboxFilter _addressLabelOfType:](MFMailboxFilter, "_addressLabelOfType:", 3));
    objc_msgSend(v2, "setIcon:", v5);

  }
  return v2;
}

- (id)initForTodayMessages
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMailboxFilter;
  v2 = -[MFMailboxFilter initForTodayMessages](&v6, "initForTodayMessages");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MFMessageCriterion todayMessageCriterion](MFMessageCriterion, "todayMessageCriterion"));
    v4 = (void *)v2[1];
    v2[1] = v3;

  }
  return v2;
}

- (id)initForMessagesWithAttachments
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMailboxFilter;
  v2 = -[MFMailboxFilter initForMessagesWithAttachments](&v6, "initForMessagesWithAttachments");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MFMessageCriterion hasAttachmentsCriterion](MFMessageCriterion, "hasAttachmentsCriterion"));
    v4 = (void *)v2[1];
    v2[1] = v3;

  }
  return v2;
}

- (id)initForVIPMessages
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMailboxFilter;
  v2 = -[MFMailboxFilter initForVIPMessages](&v6, "initForVIPMessages");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MFMessageCriterion senderIsVIPCriterion:](MFMessageCriterion, "senderIsVIPCriterion:", 1));
    v4 = (void *)v2[1];
    v2[1] = v3;

  }
  return v2;
}

- (MFMailboxFilter)initWithAccount:(id)a3 iconFromSmartMailbox:(id)a4
{
  id v6;
  MFMailboxFilter *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MFMessageCriterion *criterion;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MFMailboxFilter;
  v7 = -[MFMailboxFilter initWithAccount:iconFromSmartMailbox:](&v14, "initWithAccount:iconFromSmartMailbox:", v6, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representedObjectID"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", v9));
    v11 = objc_claimAutoreleasedReturnValue(+[MFMessageCriterion criterionForAccount:](MFMessageCriterion, "criterionForAccount:", v10));
    criterion = v7->_criterion;
    v7->_criterion = (MFMessageCriterion *)v11;

  }
  return v7;
}

+ (id)filterForFlaggedMessages
{
  return -[MFMailboxFilter initForFlaggedMessages]([MFMailboxFilter alloc], "initForFlaggedMessages");
}

+ (id)filterForUnreadMessages
{
  return -[MFMailboxFilter initForUnreadMessages]([MFMailboxFilter alloc], "initForUnreadMessages");
}

+ (id)filterForToMeMessages
{
  return -[MFMailboxFilter initForToMeMessages]([MFMailboxFilter alloc], "initForToMeMessages");
}

+ (id)filterForCCMeMessages
{
  return -[MFMailboxFilter initForCCMeMessages]([MFMailboxFilter alloc], "initForCCMeMessages");
}

+ (id)filterForTodayMessages
{
  return -[MFMailboxFilter initForTodayMessages]([MFMailboxFilter alloc], "initForTodayMessages");
}

+ (id)filterForMessagesWithAttachments
{
  return -[MFMailboxFilter initForMessagesWithAttachments]([MFMailboxFilter alloc], "initForMessagesWithAttachments");
}

+ (id)filterForVIPMessages
{
  return -[MFMailboxFilter initForVIPMessages]([MFMailboxFilter alloc], "initForVIPMessages");
}

+ (id)filterForAccount:(id)a3 iconFromSmartMailbox:(id)a4
{
  id v5;
  id v6;
  MFMailboxFilter *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[MFMailboxFilter initWithAccount:iconFromSmartMailbox:]([MFMailboxFilter alloc], "initWithAccount:iconFromSmartMailbox:", v5, v6);

  return v7;
}

+ (id)_addressLabelOfType:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v6 = sub_10010A330(a3, v5, 36.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v9 = sub_100109D80(a3, v5, v7, v8, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (MFMessageCriterion)criterion
{
  return self->_criterion;
}

- (void)setCriterion:(id)a3
{
  objc_storeStrong((id *)&self->_criterion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criterion, 0);
}

@end
