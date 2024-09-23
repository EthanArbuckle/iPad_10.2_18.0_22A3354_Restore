@implementation DataStreamPendingRequest

- (DataStreamPendingRequest)initWithIdentifier:(id)a3 protocol:(id)a4 topic:(id)a5 payload:(id)a6 callback:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  DataStreamPendingRequest *v17;
  DataStreamPendingRequest *v18;
  id v19;
  id callback;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)DataStreamPendingRequest;
  v17 = -[DataStreamPendingRequest init](&v23, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_protocol, a4);
    objc_storeStrong((id *)&v18->_topic, a5);
    objc_storeStrong((id *)&v18->_identifier, a3);
    v19 = objc_retainBlock(v16);
    callback = v18->_callback;
    v18->_callback = v19;

    objc_storeStrong((id *)&v18->_payload, a6);
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  DataStreamPendingRequest *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v6 = objc_opt_class(DataStreamPendingRequest, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (DataStreamPendingRequest *)v4;
    if (self == v7)
    {
      v10 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamPendingRequest identifier](self, "identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamPendingRequest identifier](v7, "identifier"));
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)matchesResponseHeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamPendingRequest topic](self, "topic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("response")));
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamPendingRequest identifier](self, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id")));
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamPendingRequest protocol](self, "protocol"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("protocol")));
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamPendingRequest identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (id)callback
{
  return self->_callback;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
