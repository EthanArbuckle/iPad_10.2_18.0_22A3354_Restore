@implementation TTKConversationMessage

- (id)toJsonDict
{
  NSString *senderId;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("text");
  v4[1] = CFSTR("senderId");
  senderId = self->_senderId;
  v5[0] = self->_text;
  v5[1] = senderId;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)text
{
  return self->_text;
}

- (NSString)senderId
{
  return self->_senderId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderId, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (id)messageWithText:(id)a3 senderId:(id)a4
{
  id v6;
  id v7;
  TTKConversationMessage *v8;
  id *p_isa;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(TTKConversationMessage);
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_text, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (id)fromJsonDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("senderId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[TTKConversationMessage messageWithText:senderId:](TTKConversationMessage, "messageWithText:senderId:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
