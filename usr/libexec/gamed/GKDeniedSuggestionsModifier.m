@implementation GKDeniedSuggestionsModifier

- (GKDeniedSuggestionsModifier)initWithDeniedContactIDs:(id)a3
{
  id v5;
  GKDeniedSuggestionsModifier *v6;
  GKDeniedSuggestionsModifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKDeniedSuggestionsModifier;
  v6 = -[GKDeniedSuggestionsModifier init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deniedContactIDs, a3);

  return v7;
}

- (id)modifySuggestions:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    v5 = (id)objc_claimAutoreleasedReturnValue(-[GKDeniedSuggestionsModifier nonDeniedRecipientsFromInitialRecipients:](self, "nonDeniedRecipientsFromInitialRecipients:", v4));
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (id)nonDeniedRecipientsFromInitialRecipients:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008A12C;
  v4[3] = &unk_1002C0260;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_gkFilterWithBlock:", v4));
}

- (NSSet)deniedContactIDs
{
  return self->_deniedContactIDs;
}

- (void)setDeniedContactIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deniedContactIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedContactIDs, 0);
}

@end
