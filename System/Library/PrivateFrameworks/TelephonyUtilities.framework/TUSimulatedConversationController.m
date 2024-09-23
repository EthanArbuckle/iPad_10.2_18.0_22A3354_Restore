@implementation TUSimulatedConversationController

- (TUSimulatedConversationController)init
{
  TUSimulatedConversationControllerXPCClient *v3;
  TUSimulatedConversationController *v4;

  v3 = objc_alloc_init(TUSimulatedConversationControllerXPCClient);
  v4 = -[TUSimulatedConversationController initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (TUSimulatedConversationController)initWithDataSource:(id)a3
{
  id v5;
  TUSimulatedConversationController *v6;
  TUSimulatedConversationController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUSimulatedConversationController;
  v6 = -[TUSimulatedConversationController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TUSimulatedConversationController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)TUSimulatedConversationController;
  -[TUSimulatedConversationController dealloc](&v4, sel_dealloc);
}

- (void)updateParticipant:(id)a3 withUpdate:(id)a4 onConversation:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUSimulatedConversationController dataSource](self, "dataSource");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateParticipant:withUpdate:onConversation:", v10, v9, v8);

}

- (void)addRemoteParticipantWithHandle:(id)a3 update:(id)a4 toConversation:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUSimulatedConversationController dataSource](self, "dataSource");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addRemoteParticipantWithHandle:update:toConversation:", v10, v9, v8);

}

- (void)removeRemoteParticipant:(id)a3 fromConversation:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUSimulatedConversationController dataSource](self, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeRemoteParticipant:fromConversation:", v7, v6);

}

- (void)createIncomingConversationWithHandles:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUSimulatedConversationController dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createIncomingConversationWithHandles:", v4);

}

- (TUSimulatedConversationControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
