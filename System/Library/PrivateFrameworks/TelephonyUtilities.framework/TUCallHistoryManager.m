@implementation TUCallHistoryManager

- (TUCallHistoryManager)init
{
  TUCallHistoryManagerXPCClient *v3;
  TUCallHistoryManager *v4;

  v3 = objc_alloc_init(TUCallHistoryManagerXPCClient);
  v4 = -[TUCallHistoryManager initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (TUCallHistoryManager)initWithDataSource:(id)a3
{
  id v5;
  TUCallHistoryManager *v6;
  TUCallHistoryManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUCallHistoryManager;
  v6 = -[TUCallHistoryManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[TUCallHistoryManagerDataSource invalidate](self->_dataSource, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUCallHistoryManager;
  -[TUCallHistoryManager dealloc](&v3, sel_dealloc);
}

- (void)updateOutgoingLocalParticipantUUID:(id)a3 forCallsWithOutgoingLocalParticipantUUID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUCallHistoryManager dataSource](self, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateOutgoingLocalParticipantUUID:forCallsWithOutgoingLocalParticipantUUID:", v7, v6);

}

- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[TUCallHistoryManager dataSource](self, "dataSource");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportRecentCallForConversation:withStartDate:avMode:", v9, v8, a5);

}

- (TUCallHistoryManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
