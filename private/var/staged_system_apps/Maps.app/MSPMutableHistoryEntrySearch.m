@implementation MSPMutableHistoryEntrySearch

- (MSPMutableHistoryEntrySearch)initWithTicket:(id)a3
{
  return -[MSPMutableHistoryEntrySearch initWithTicket:completionTitle:](self, "initWithTicket:completionTitle:", a3, 0);
}

- (MSPMutableHistoryEntrySearch)initWithTicket:(id)a3 completionTitle:(id)a4
{
  id v6;
  id v7;
  MSPMutableHistoryEntrySearch *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSPMutableHistoryEntrySearch;
  v8 = -[MSPMutableHistoryEntrySearch init](&v14, "init");
  if (v8)
  {
    if (objc_msgSend(v7, "length"))
    {
      -[MSPMutableHistoryEntrySearch setQuery:](v8, "setQuery:", v7);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchQuery"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10));
      -[MSPMutableHistoryEntrySearch setQuery:](v8, "setQuery:", v11);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "boundingRegion"));
    -[MSPMutableHistoryEntrySearch setMapRegion:](v8, "setMapRegion:", v12);

  }
  return v8;
}

@end
