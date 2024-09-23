@implementation GKContactsCacheUpdateFinishedCommand

- (GKContactsCacheUpdateFinishedCommand)initWithChangeHistoryToken:(id)a3
{
  id v5;
  GKContactsCacheUpdateFinishedCommand *v6;
  GKContactsCacheUpdateFinishedCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKContactsCacheUpdateFinishedCommand;
  v6 = -[GKContactsCacheUpdateFinishedCommand init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_changeHistoryToken, a3);

  return v7;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[GKCDContactInfoList _gkPrimaryListWithContext:](GKCDContactInfoList, "_gkPrimaryListWithContext:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsCacheUpdateFinishedCommand changeHistoryToken](self, "changeHistoryToken"));
  objc_msgSend(v6, "setChangeHistoryToken:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", GKCDContactInfoListCurrentVersion));
  objc_msgSend(v6, "setVersion:", v5);

}

- (NSData)changeHistoryToken
{
  return self->_changeHistoryToken;
}

- (void)setChangeHistoryToken:(id)a3
{
  objc_storeStrong((id *)&self->_changeHistoryToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeHistoryToken, 0);
}

@end
