@implementation MFMailboxFilterProvider

- (MFMailboxFilterProvider)initWithFilterContext:(id)a3
{
  id v4;
  uint64_t v5;
  MFMailboxFilterProvider *v6;
  objc_super v8;

  v4 = a3;
  v5 = objc_opt_class(MFMailboxFilter);
  v8.receiver = self;
  v8.super_class = (Class)MFMailboxFilterProvider;
  v6 = -[MFMailboxFilterProvider initWithFilterContext:mailboxFilterClass:](&v8, "initWithFilterContext:mailboxFilterClass:", v4, v5);

  return v6;
}

- (id)filterMatchingCriterion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterProvider allFilters](self, "allFilters"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10016B37C;
  v9[3] = &unk_100521360;
  v6 = v4;
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_firstObjectPassingTest:", v9));

  return v7;
}

- (id)focusFilters
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterProvider focus](self, "focus"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterProvider criterionsForFocus:](self, "criterionsForFocus:", v3));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10016B448;
    v7[3] = &unk_10051FD78;
    v7[4] = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_compactMap:", v7));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)criterionsForFocus:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "focusedAccountIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_compactMap:", &stru_100521380));

  return v5;
}

- (id)individualVIPFilterGroup
{
  MUIMailboxFilterGroup *individualVIPFilterGroup;
  void *v4;
  void *v5;
  void *v6;
  MUIMailboxFilterGroup *v7;
  MUIMailboxFilterGroup *v8;

  individualVIPFilterGroup = self->_individualVIPFilterGroup;
  if (!individualVIPFilterGroup)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vipCriteria"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_compactMap:", &stru_1005213C0));
    v7 = (MUIMailboxFilterGroup *)objc_claimAutoreleasedReturnValue(+[MUIMailboxFilterGroup groupWithName:combinator:selectionCardinality:filters:](MUIMailboxFilterGroup, "groupWithName:combinator:selectionCardinality:filters:", 0, 1, 1, v6));
    v8 = self->_individualVIPFilterGroup;
    self->_individualVIPFilterGroup = v7;

    individualVIPFilterGroup = self->_individualVIPFilterGroup;
  }
  return individualVIPFilterGroup;
}

- (void)setIndividualVIPFilterGroup:(id)a3
{
  MUIMailboxFilterGroup *v5;
  MUIMailboxFilterGroup *v6;

  v5 = (MUIMailboxFilterGroup *)a3;
  if (self->_individualVIPFilterGroup != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_individualVIPFilterGroup, a3);
    v5 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_individualVIPFilterGroup, 0);
}

@end
