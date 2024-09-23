@implementation TTKConversationTest

- (id)toJsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("conversation");
  conversationToJsonArray(self->_conversation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("sendersToTest");
  -[NSSet allObjects](self->_sendersToTest, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("warmupMessages");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", LODWORD(self->_warmupMessages));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("adaptToSentMessages");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adaptToSentMessages);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("adaptToReceivedMessages");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adaptToReceivedMessages);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)overridingJsonKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TTKConversationTest toJsonDict](self, "toJsonDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addEntriesFromDictionary:", v4);
  +[TTKConversationTest fromJsonDict:](TTKConversationTest, "fromJsonDict:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)conversation
{
  return self->_conversation;
}

- (NSSet)sendersToTest
{
  return self->_sendersToTest;
}

- (unint64_t)warmupMessages
{
  return self->_warmupMessages;
}

- (BOOL)adaptToSentMessages
{
  return self->_adaptToSentMessages;
}

- (BOOL)adaptToReceivedMessages
{
  return self->_adaptToReceivedMessages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendersToTest, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

+ (id)testWithConversation:(id)a3 sendersToTest:(id)a4 warmupMessages:(unint64_t)a5 adaptToSentMessages:(BOOL)a6 adaptToReceivedMessages:(BOOL)a7
{
  id v12;
  id v13;
  TTKConversationTest *v14;
  TTKConversationTest *v15;
  uint64_t v16;
  NSSet *sendersToTest;

  v12 = a3;
  v13 = a4;
  v14 = objc_alloc_init(TTKConversationTest);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_conversation, a3);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    sendersToTest = v15->_sendersToTest;
    v15->_sendersToTest = (NSSet *)v16;

    v15->_warmupMessages = a5;
    v15->_adaptToSentMessages = a6;
    v15->_adaptToReceivedMessages = a7;
  }

  return v15;
}

+ (id)fromJsonDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("warmupMessages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("warmupMessages"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("conversation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  conversationFromJsonArray(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sendersToTest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("adaptToSentMessages"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("adaptToReceivedMessages"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[TTKConversationTest testWithConversation:sendersToTest:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:](TTKConversationTest, "testWithConversation:sendersToTest:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:", v9, v10, v7, v12, objc_msgSend(v13, "BOOLValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
