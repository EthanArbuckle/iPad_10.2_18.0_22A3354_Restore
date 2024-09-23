@implementation SPXPCMessage

- (NSDictionary)info
{
  return self->_info;
}

- (OS_xpc_object)feedbackData
{
  return self->_x_feedbackData;
}

- (void)setRootObject:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  OS_xpc_object *v7;
  OS_xpc_object *x_rootObject;
  id v9;

  v4 = (objc_class *)MEMORY[0x24BDD1618];
  v5 = a3;
  v9 = (id)objc_msgSend([v4 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v9, "encodeObject:forKey:", v5, *MEMORY[0x24BDD0E88]);

  objc_msgSend(v9, "finishEncoding");
  objc_msgSend(v9, "encodedData");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (OS_xpc_object *)xpc_data_create((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  x_rootObject = self->_x_rootObject;
  self->_x_rootObject = v7;

}

- (void)setInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setRootObjectForFeedback:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  OS_xpc_object *v7;
  OS_xpc_object *x_feedbackData;
  id v9;

  v4 = (objc_class *)MEMORY[0x24BDD1618];
  v5 = a3;
  v9 = (id)objc_msgSend([v4 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v9, "encodeObject:forKey:", v5, *MEMORY[0x24BDD0E88]);

  objc_msgSend(v9, "finishEncoding");
  objc_msgSend(v9, "encodedData");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (OS_xpc_object *)xpc_data_create((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  x_feedbackData = self->_x_feedbackData;
  self->_x_feedbackData = v7;

}

- (id)_createXPCMessage
{
  xpc_object_t v3;
  NSDictionary *info;
  void *v5;
  id v6;
  xpc_object_t v7;
  id v8;
  id v9;
  xpc_object_t v10;
  uint64_t i;
  xpc_object_t values[5];
  char *keys[2];
  __int128 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = xpc_string_create(-[NSString UTF8String](self->_name, "UTF8String"));
  info = self->_info;
  if (info
    && (objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", info, 200, 0, 0),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = objc_retainAutorelease(v5);
    v7 = xpc_data_create((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *(_OWORD *)keys = xmmword_24CF64908;
  v15 = *(_OWORD *)&off_24CF64918;
  v16 = "kDKMessageFeedbackDataKey";
  v8 = v3;
  values[0] = v8;
  v9 = v7;
  values[1] = v9;
  values[2] = self->_x_Objects;
  values[3] = self->_x_rootObject;
  values[4] = self->_x_feedbackData;
  v10 = xpc_dictionary_create((const char *const *)keys, values, 5uLL);
  for (i = 4; i != -1; --i)

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (id)_initWithXPCMessage:(id)a3 onConnection:(id)a4
{
  id v7;
  id v8;
  SPXPCMessage *v9;
  SPXPCMessage *v10;
  const char *string;
  uint64_t v12;
  NSString *name;
  const void *data;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  OS_xpc_object *x_Objects;
  uint64_t v20;
  OS_xpc_object *x_rootObject;
  uint64_t v22;
  OS_xpc_object *x_feedbackData;
  OS_xpc_object *reply;
  OS_xpc_object *x_reply;
  uint64_t v26;
  OS_xpc_object *x_reply_connection;
  NSString *v28;
  void *v29;
  uint64_t v30;
  OS_os_transaction *replyTransaction;
  size_t v33;
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = -[SPXPCMessage init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_receivingConnection, v8);
    string = xpc_dictionary_get_string(v7, "kDKMessageNameKey");
    if (string)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", string);
      name = v10->_name;
      v10->_name = (NSString *)v12;
    }
    else
    {
      name = v10->_name;
      v10->_name = 0;
    }

    v33 = 0;
    data = xpc_dictionary_get_data(v7, "kDKMessageInfoKey", &v33);
    v15 = 0;
    if (data && v33)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", data, v33, 0);
      if (v16)
      {
        v34 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v16, 0, 0, &v34);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v34;
        if (v17 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[SPXPCMessage _initWithXPCMessage:onConnection:].cold.1();
      }
      else
      {
        v17 = 0;
        v15 = 0;
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_info, v15);
    xpc_dictionary_get_value(v7, "kDKMessageObjectGraphKey");
    v18 = objc_claimAutoreleasedReturnValue();
    x_Objects = v10->_x_Objects;
    v10->_x_Objects = (OS_xpc_object *)v18;

    xpc_dictionary_get_value(v7, "kDKMessageObjectRootGraphKey");
    v20 = objc_claimAutoreleasedReturnValue();
    x_rootObject = v10->_x_rootObject;
    v10->_x_rootObject = (OS_xpc_object *)v20;

    xpc_dictionary_get_value(v7, "kDKMessageFeedbackDataKey");
    v22 = objc_claimAutoreleasedReturnValue();
    x_feedbackData = v10->_x_feedbackData;
    v10->_x_feedbackData = (OS_xpc_object *)v22;

    objc_storeStrong((id *)&v10->_x_message, a3);
    reply = (OS_xpc_object *)xpc_dictionary_create_reply(v7);
    x_reply = v10->_x_reply;
    v10->_x_reply = reply;

    if (v10->_x_reply)
    {
      xpc_dictionary_get_remote_connection(v7);
      v26 = objc_claimAutoreleasedReturnValue();
      x_reply_connection = v10->_x_reply_connection;
      v10->_x_reply_connection = (OS_xpc_object *)v26;

      v28 = v10->_name;
      if (v28)
      {
        v35[0] = v10->_name;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
      }
      SPTransactionCreate(v29);
      v30 = objc_claimAutoreleasedReturnValue();
      replyTransaction = v10->_replyTransaction;
      v10->_replyTransaction = (OS_os_transaction *)v30;

      if (v28)
    }

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_replyTransaction, 0);
  objc_storeStrong((id *)&self->_x_feedbackData, 0);
  objc_storeStrong((id *)&self->_x_reply, 0);
  objc_storeStrong((id *)&self->_x_Objects, 0);
  objc_storeStrong((id *)&self->_x_rootObject, 0);
  objc_storeStrong((id *)&self->_x_message, 0);
  objc_storeStrong((id *)&self->_x_reply_connection, 0);
  objc_destroyWeak((id *)&self->_receivingConnection);
}

- (SPXPCMessage)initWithName:(id)a3
{
  id v4;
  SPXPCMessage *v5;
  uint64_t v6;
  NSString *name;

  v4 = a3;
  v5 = -[SPXPCMessage init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (SPXPCMessage)init
{
  SPXPCMessage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPXPCMessage;
  result = -[SPXPCMessage init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (SPXPCMessage)initWithName:(id)a3 batchSize:(unint64_t)a4
{
  SPXPCMessage *v5;
  OS_xpc_object *v6;
  OS_xpc_object *x_Objects;
  OS_xpc_object *v8;
  xpc_object_t v9;

  v5 = -[SPXPCMessage initWithName:](self, "initWithName:", a3);
  if (v5)
  {
    v6 = (OS_xpc_object *)xpc_array_create(0, 0);
    x_Objects = v5->_x_Objects;
    v5->_x_Objects = v6;

    for (; a4; --a4)
    {
      v8 = v5->_x_Objects;
      v9 = xpc_null_create();
      xpc_array_append_value(v8, v9);

    }
  }
  return v5;
}

- (SPXPCMessage)initWithName:(id)a3 connection:(id)a4
{
  SPXPCMessage *v4;
  SPXPCMessage *v5;
  NSString *name;
  void *v7;
  uint64_t v8;
  OS_os_transaction *replyTransaction;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = -[SPXPCMessage initWithName:](self, "initWithName:", a3, a4);
  v5 = v4;
  if (v4)
  {
    name = v4->_name;
    if (name)
    {
      v11[0] = v4->_name;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    SPTransactionCreate(v7);
    v8 = objc_claimAutoreleasedReturnValue();
    replyTransaction = v5->_replyTransaction;
    v5->_replyTransaction = (OS_os_transaction *)v8;

    if (name)
  }
  return v5;
}

- (id)rootObjectOfClasses:(id)a3
{
  id v4;
  OS_xpc_object *x_rootObject;
  void *bytes_ptr;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  x_rootObject = self->_x_rootObject;
  if (!x_rootObject)
    goto LABEL_5;
  bytes_ptr = (void *)xpc_data_get_bytes_ptr(x_rootObject);
  if (bytes_ptr)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(self->_x_rootObject), 0);
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v7, 0);
      objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v4, *MEMORY[0x24BDD0E88]);
      bytes_ptr = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_5:
    bytes_ptr = 0;
  }
LABEL_6:

  return bytes_ptr;
}

- (id)objectsOfClasses:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  OS_xpc_object *x_Objects;
  const void *data;
  const void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  size_t length;

  v6 = a3;
  length = 0;
  x_Objects = self->_x_Objects;
  if (x_Objects
    && xpc_array_get_count(x_Objects) > a4
    && (data = xpc_array_get_data(self->_x_Objects, a4, &length)) != 0
    && (v9 = data,
        v10 = objc_alloc(MEMORY[0x24BDBCE50]),
        (v11 = objc_msgSend(v10, "initWithBytesNoCopy:length:freeWhenDone:", v9, length, 0)) != 0))
  {
    v12 = (void *)v11;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v11, 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%lu"), CFSTR("kMessageResultSetDataKey"), a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "decodeObjectOfClasses:forKey:", v6, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *p_lock;
  OS_xpc_object *x_Objects;
  id v12;
  xpc_object_t v13;
  id v14;

  v6 = (objc_class *)MEMORY[0x24BDD1618];
  v7 = a3;
  v14 = (id)objc_msgSend([v6 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%lu"), CFSTR("kMessageResultSetDataKey"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v7, v8);

  objc_msgSend(v14, "finishEncoding");
  objc_msgSend(v14, "encodedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  x_Objects = self->_x_Objects;
  v12 = objc_retainAutorelease(v9);
  v13 = xpc_data_create((const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
  xpc_array_set_value(x_Objects, a4, v13);

  os_unfair_lock_unlock(p_lock);
}

- (id)rootObjectOfClassesForFeedback:(id)a3
{
  id v4;
  OS_xpc_object *x_feedbackData;
  void *bytes_ptr;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  x_feedbackData = self->_x_feedbackData;
  if (!x_feedbackData)
    goto LABEL_5;
  bytes_ptr = (void *)xpc_data_get_bytes_ptr(x_feedbackData);
  if (bytes_ptr)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(self->_x_feedbackData), 0);
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v7, 0);
      objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v4, *MEMORY[0x24BDD0E88]);
      bytes_ptr = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_5:
    bytes_ptr = 0;
  }
LABEL_6:

  return bytes_ptr;
}

- (void)sendReply:(id)a3
{
  id v5;
  void *v6;
  OS_os_transaction *v7;
  OS_xpc_object *x_reply;
  id v9;
  OS_os_transaction *replyTransaction;
  id v11;

  v5 = a3;
  v11 = v5;
  if (self->_x_reply && self->_x_reply_connection)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v5, 200, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    if (objc_msgSend(v6, "length"))
    {
      x_reply = self->_x_reply;
      v9 = objc_retainAutorelease(v6);
      xpc_dictionary_set_data(x_reply, "kDKMessageInfoKey", (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    }
    xpc_connection_send_message(self->_x_reply_connection, self->_x_reply);
    SPTransactionDone(self->_replyTransaction);
    replyTransaction = self->_replyTransaction;
    self->_replyTransaction = 0;

  }
  else
  {
    v7 = self->_replyTransaction;
    if (v7)
    {
      SPTransactionDone(v7);
      v6 = self->_replyTransaction;
      self->_replyTransaction = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SPXPCConnection.m"), 650, CFSTR("Trying to send reply where one isn't expected"));
    }
  }

}

- (BOOL)needsReply
{
  return self->_x_reply && self->_x_reply_connection != 0;
}

- (void)_initWithXPCMessage:onConnection:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_0(&dword_213202000, MEMORY[0x24BDACB70], v0, "Error deserializing plist %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

@end
