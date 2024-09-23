@implementation RBSXPCMessage

- (id)_initWithMessage:(id *)a1
{
  id v4;
  void *v5;
  id *v6;
  uint64_t v7;
  id v8;
  NSString *v9;
  void *v11;
  objc_super v12;

  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4 || MEMORY[0x194019424](v4) != MEMORY[0x1E0C812F8])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithMessage_, a1, CFSTR("RBSXPCUtilities.m"), 209, CFSTR("can only init messages with dictionaries"));

    }
    v12.receiver = a1;
    v12.super_class = (Class)RBSXPCMessage;
    v6 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 1, a2);
      +[RBSXPCCoder coderWithMessage:](RBSXPCCoder, "coderWithMessage:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = a1[2];
      a1[2] = (id)v7;

      objc_msgSend(a1[2], "decodeStringForKey:", CFSTR("rbs_selector"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      a1[3] = (id)NSSelectorFromString(v9);

    }
  }

  return a1;
}

void __44__RBSXPCMessage_messageForMethod_arguments___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v3, CFSTR("rbs_argument_0"));
  }
  else
  {
    v3 = 0;
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 1);
    v4 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("rbs_argument_1"));
    v3 = (void *)v4;
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("RBSXPCUtilities.m"), 177, CFSTR("Only up to two arguments supported by RBSXPCMessage"));

  }
  NSStringFromSelector(*(SEL *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("rbs_selector"));

}

- (BOOL)isEmpty
{
  return xpc_dictionary_get_count(self->_xpc_message) == 0;
}

- (void)sendToConnection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = +[RBSWorkloop sharedBackgroundWorkloop](RBSWorkloop, "sharedBackgroundWorkloop");
  -[RBSXPCMessage sendToConnection:replyQueue:completion:](self, "sendToConnection:replyQueue:completion:", v7, v8, v6);

}

- (id)decodeArgumentWithClass:(Class)a3 atIndex:(unint64_t)a4 allowNil:(BOOL)a5 error:(id *)a6
{
  return -[RBSXPCMessage decodeArgumentCollection:withClass:atIndex:allowNil:error:](self, "decodeArgumentCollection:withClass:atIndex:allowNil:error:", 0, a3, a4, a5, a6);
}

- (void)sendToConnection:(id)a3 replyQueue:(id)a4 completion:(id)a5
{
  _xpc_connection_s *v9;
  NSObject *v10;
  id v11;
  const char *method;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD handler[4];
  id v20;
  _QWORD block[4];
  id v22;

  v9 = (_xpc_connection_s *)a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    v10 = +[RBSWorkloop sharedBackgroundWorkloop](RBSWorkloop, "sharedBackgroundWorkloop");
    if (v9)
    {
LABEL_3:
      method = self->_method;
      if (method)
      {
        NSStringFromSelector(method);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("async_"));

        if ((v14 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(self->_method);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSXPCUtilities.m"), 293, CFSTR("syncronous method cannot be sent async: %@"), v18);

        }
      }
      -[RBSXPCCoder createMessage](self->_payload, "createMessage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        xpc_connection_send_message(v9, v15);

        goto LABEL_13;
      }
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __56__RBSXPCMessage_sendToConnection_replyQueue_completion___block_invoke_2;
      handler[3] = &unk_1E2D17AF8;
      v20 = v11;
      xpc_connection_send_message_with_reply(v9, v15, v10, handler);

      v16 = v20;
      goto LABEL_11;
    }
  }
  if (v11)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__RBSXPCMessage_sendToConnection_replyQueue_completion___block_invoke;
    block[3] = &unk_1E2D17AD0;
    v22 = v11;
    dispatch_async(v10, block);
    v16 = v22;
LABEL_11:

  }
LABEL_13:

}

- (id)sendToConnection:(id)a3 error:(id *)a4
{
  _xpc_connection_s *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  xpc_object_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = (_xpc_connection_s *)a3;
  if (!v6)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB28A8];
      v21 = *MEMORY[0x1E0CB2D68];
      v22[0] = CFSTR("The connection does not exist");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 4099, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_6;
  }
  NSStringFromSelector(self->_method);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("async_"));

  if (!v8)
  {
    NSStringFromSelector(self->_method);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("void_"));

    -[RBSXPCCoder createMessage](self->_payload, "createMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = xpc_connection_send_message_with_reply_sync(v6, v16);

    if ((v15 & 1) != 0)
    {
      if (!v17)
        goto LABEL_13;
    }
    else
    {
      if (!v17)
      {
LABEL_13:
        v13 = 0;
LABEL_21:

        goto LABEL_22;
      }
      if (MEMORY[0x194019424](v17) == MEMORY[0x1E0C812F8])
      {
        +[RBSXPCCoder coderWithMessage:](RBSXPCCoder, "coderWithMessage:", v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!a4)
          goto LABEL_21;
        objc_msgSend(v13, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__RBSXPCError__"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    if (MEMORY[0x194019424](v17) != MEMORY[0x1E0C81310])
      goto LABEL_13;
    rbs_connection_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[RBSXPCMessage sendToConnection:error:].cold.1(v18);

    if (!a4)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4101, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
LABEL_20:
    *a4 = v19;
    goto LABEL_21;
  }
  -[RBSXPCCoder createMessage](self->_payload, "createMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v6, v9);

LABEL_6:
  v13 = 0;
LABEL_22:

  return v13;
}

- (id)invokeOnConnection:(uint64_t)a3 withReturnCollectionClass:(uint64_t)a4 entryClass:(_QWORD *)a5 error:
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v9 = a2;
  if (!a1)
  {
    v12 = 0;
    goto LABEL_15;
  }
  if (!a1[3])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel_invokeOnConnection_withReturnCollectionClass_entryClass_error_, a1, CFSTR("RBSXPCUtilities.m"), 317, CFSTR("must initialize message with a method to use this mechanism"));

  }
  -[SEL sendToConnection:error:](a1, "sendToConnection:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a5 && objc_msgSend(v10, "containsValueForKey:", CFSTR("__RBSXPCError__")))
  {
    objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__RBSXPCError__"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v11, "containsValueForKey:", CFSTR("return-value")))
  {
    if (a3)
      objc_msgSend(v11, "decodeCollectionOfClass:containingClass:forKey:", a3, a4, CFSTR("return-value"));
    else
      objc_msgSend(v11, "decodeObjectOfClass:forKey:", a4, CFSTR("return-value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a1[3]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_invokeOnConnection_withReturnCollectionClass_entryClass_error_, a1, CFSTR("RBSXPCUtilities.m"), 332, CFSTR("failed to decode return value for %@"), v14);

  }
  v12 = 0;
LABEL_14:

LABEL_15:
  return v12;
}

void __56__RBSXPCMessage_sendToConnection_replyQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    if (MEMORY[0x194019424]() == MEMORY[0x1E0C812F8])
    {
      +[RBSXPCMessage messageForXPCMessage:](RBSXPCMessage, "messageForXPCMessage:", v5);
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      -[RBSXPCMessage error](v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    if (MEMORY[0x194019424](v5) == MEMORY[0x1E0C81310])
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4101, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v3 = 0;
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)messageForXPCMessage:(id)a3
{
  id v3;
  void *v4;
  id *v5;

  v3 = a3;
  v4 = v3;
  if (v3 && MEMORY[0x194019424](v3) == MEMORY[0x1E0C812F8])
    v5 = -[RBSXPCMessage _initWithMessage:]((id *)[RBSXPCMessage alloc], v4);
  else
    v5 = 0;

  return v5;
}

- (SEL)method
{
  return self->_method;
}

- (RBSXPCMessageReply)reply
{
  xpc_object_t reply;
  void *v4;
  _QWORD *v5;

  if (xpc_dictionary_expects_reply() && (reply = xpc_dictionary_create_reply(self->_xpc_message)) != 0)
  {
    v4 = reply;
    v5 = -[RBSXPCMessageReply _initWithMessage:]([RBSXPCMessageReply alloc], reply);

  }
  else
  {
    v5 = 0;
  }
  return (RBSXPCMessageReply *)v5;
}

- (id)error
{
  if (a1)
  {
    objc_msgSend(a1[2], "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__RBSXPCError__"));
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)decodeArgumentCollection:(Class)a3 withClass:(Class)a4 atIndex:(unint64_t)a5 allowNil:(BOOL)a6 error:(id *)a7
{
  const __CFString *v11;
  RBSXPCCoder *payload;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[2];
  _QWORD v24[15];
  _QWORD v25[3];
  _QWORD v26[5];

  v26[3] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    if (a5 != 1)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2D68];
      v26[0] = CFSTR("requested argument index not supported");
      v25[0] = v14;
      v25[1] = CFSTR("method-name");
      NSStringFromSelector(self->_method);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v15;
      v25[2] = CFSTR("argument-index");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("RBSXPCCodingErrorDomain"), 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
LABEL_12:
      *a7 = v18;

      return v19;
    }
    v11 = CFSTR("rbs_argument_1");
  }
  else
  {
    v11 = CFSTR("rbs_argument_0");
  }
  payload = self->_payload;
  if (a3)
    -[RBSXPCCoder decodeCollectionOfClass:containingClass:forKey:](payload, "decodeCollectionOfClass:containingClass:forKey:", a3, a4, v11);
  else
    -[RBSXPCCoder decodeObjectOfClass:forKey:](payload, "decodeObjectOfClass:forKey:", a4, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19 && !a6)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D68];
    v24[0] = CFSTR("nil argument when nonnil expected");
    v23[0] = v21;
    v23[1] = CFSTR("method-name");
    NSStringFromSelector(self->_method);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5, v23[0], CFSTR("method-name"), CFSTR("argument-index"), CFSTR("nil argument when nonnil expected"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("RBSXPCCodingErrorDomain"), 1, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_xpc_message, 0);
}

- (SEL)invokeOnConnection:(uint64_t)a3 withReturnClass:(_QWORD *)a4 error:
{
  if (a1)
  {
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](a1, a2, 0, a3, a4);
    a1 = (SEL *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)messageForMethod:(SEL)a3 varguments:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id v9;
  void *v10;
  id *v12;
  uint64_t v13;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id *)&v13;
  if (v5)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v6, "insertObject:atIndex:", v5, v7);
      v8 = v12++;
      v9 = *v8;

      ++v7;
      v5 = v9;
    }
    while (v9);
  }
  +[RBSXPCMessage messageForMethod:arguments:]((uint64_t)RBSXPCMessage, (uint64_t)a3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (_QWORD)messageForMethod:(void *)a3 arguments:
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  void *v9;
  _QWORD v10[4];
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = objc_opt_self();
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel_messageForMethod_arguments_, v5, CFSTR("RBSXPCUtilities.m"), 165, CFSTR("method must be specified"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__RBSXPCMessage_messageForMethod_arguments___block_invoke;
  v10[3] = &unk_1E2D17AA8;
  v11 = v4;
  v12 = sel_messageForMethod_arguments_;
  v13 = v5;
  v14 = a2;
  v6 = v4;
  +[RBSXPCMessage messageWithEncoder:]((uint64_t)RBSXPCMessage, v10);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7[3] = a2;

  return v7;
}

+ (RBSXPCMessage)messageWithEncoder:(uint64_t)a1
{
  void (**v2)(id, _QWORD);
  RBSXPCMessage *v3;
  RBSXPCMessage *v4;

  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc_init(RBSXPCMessage);
  v4 = v3;
  if (v2)
    ((void (**)(id, RBSXPCCoder *))v2)[2](v2, v3->_payload);

  return v4;
}

- (RBSXPCMessage)init
{
  xpc_object_t v3;
  RBSXPCMessage *v4;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = (RBSXPCMessage *)-[RBSXPCMessage _initWithMessage:]((id *)&self->super.isa, v3);

  return v4;
}

- (void)sendToConnection:(id)a3
{
  -[RBSXPCMessage sendToConnection:completion:](self, "sendToConnection:completion:", a3, 0);
}

void __56__RBSXPCMessage_sendToConnection_replyQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB28A8];
  v6 = *MEMORY[0x1E0CB2D68];
  v7[0] = CFSTR("The connection does not exist");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 4099, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);

}

- (void)sendToConnection:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190CD6000, log, OS_LOG_TYPE_ERROR, "XPC message send failed", v1, 2u);
}

@end
