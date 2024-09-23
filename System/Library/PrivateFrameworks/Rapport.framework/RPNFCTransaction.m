@implementation RPNFCTransaction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNFCTransaction)initWithRole:(int64_t)a3
{
  RPNFCTransaction *v4;
  uint64_t v5;
  NSUUID *identifier;
  uint64_t v7;
  NSDate *connectionDate;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RPNFCTransaction;
  v4 = -[RPNFCTransaction init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v4->_identifier;
    v4->_identifier = (NSUUID *)v5;

    v4->_role = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = objc_claimAutoreleasedReturnValue();
    connectionDate = v4->_connectionDate;
    v4->_connectionDate = (NSDate *)v7;

    v4->_state = 0;
  }
  return v4;
}

- (void)setError:(id)a3
{
  BOOL v5;
  void *v6;
  NSError *error;
  NSError *v8;
  NSError *v9;
  NSError *v10;
  char v11;
  id v12;

  v12 = a3;
  v5 = -[RPNFCTransaction state](self, "state") == 2;
  v6 = v12;
  if (!v5)
  {
    error = self->_error;
    v8 = (NSError *)v12;
    v9 = error;
    if (v9 == v8)
    {

    }
    else
    {
      v10 = v9;
      if ((v8 == 0) != (v9 != 0))
      {
        v11 = -[NSError isEqual:](v8, "isEqual:", v9);

        v6 = v12;
        if ((v11 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_error, a3);
      -[RPNFCTransaction setState:](self, "setState:", 1);
    }
    v6 = v12;
  }
LABEL_10:

}

- (void)setTapEvent:(id)a3
{
  id v6;
  RPNearFieldTapEvent *tapEvent;
  RPNearFieldTapEvent *v8;
  char v9;
  RPNearFieldTapEvent *v10;
  void *v11;
  void *v12;
  RPNearFieldTapEvent *v13;

  v6 = a3;
  tapEvent = self->_tapEvent;
  v13 = (RPNearFieldTapEvent *)v6;
  v8 = tapEvent;
  if (v8 == v13)
  {

  }
  else
  {
    if ((v13 == 0) != (v8 != 0))
    {
      v9 = -[RPNearFieldTapEvent isEqual:](v13, "isEqual:", v8);

      v10 = v13;
      if ((v9 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

      v10 = v13;
    }
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNFCTransaction.m"), 65, CFSTR("clearing an existing tap event is not permitted:%@"), 0);

    }
    if (self->_tapEvent)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNFCTransaction.m"), 66, CFSTR("update an existing tap event is not permitted:%@"), self->_tapEvent);

    }
    objc_storeStrong((id *)&self->_tapEvent, a3);
    -[RPNFCTransaction setState:](self, "setState:", 2);
  }
  v10 = v13;
LABEL_13:

}

- (void)setRemoteAuthenticationMessage:(id)a3
{
  id v5;
  RPTransportServiceHandoverMessage *remoteAuthenticationMessage;
  RPTransportServiceHandoverMessage *v7;
  char v8;
  RPTransportServiceHandoverMessage *v9;
  RPTransportServiceHandoverMessage *v10;
  RPTransportServiceHandoverMessage *v11;
  void *v12;
  void *v13;
  RPTransportServiceHandoverMessage *v14;

  v5 = a3;
  remoteAuthenticationMessage = self->_remoteAuthenticationMessage;
  v14 = (RPTransportServiceHandoverMessage *)v5;
  v7 = remoteAuthenticationMessage;
  if (v7 == v14)
  {

    v10 = v14;
  }
  else
  {
    if ((v14 == 0) != (v7 != 0))
    {
      v8 = -[RPTransportServiceHandoverMessage isEqual:](v14, "isEqual:", v7);

      v9 = v14;
      if ((v8 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

      v9 = v14;
    }
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNFCTransaction.m"), 75, CFSTR("clearing an existing authentication message is not permitted:%@"), 0);

      v9 = v14;
    }
    if (self->_remoteAuthenticationMessage)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNFCTransaction.m"), 76, CFSTR("update an existing authentication message is not permitted:%@"), self->_remoteAuthenticationMessage);

      v9 = v14;
    }
    v11 = v9;
    v10 = self->_remoteAuthenticationMessage;
    self->_remoteAuthenticationMessage = v11;
  }

  v9 = v14;
LABEL_13:

}

- (void)setRemoteValidationMessage:(id)a3
{
  id v5;
  RPTransportServiceHandoverMessage *remoteValidationMessage;
  RPTransportServiceHandoverMessage *v7;
  char v8;
  RPTransportServiceHandoverMessage *v9;
  RPTransportServiceHandoverMessage *v10;
  RPTransportServiceHandoverMessage *v11;
  void *v12;
  void *v13;
  RPTransportServiceHandoverMessage *v14;

  v5 = a3;
  remoteValidationMessage = self->_remoteValidationMessage;
  v14 = (RPTransportServiceHandoverMessage *)v5;
  v7 = remoteValidationMessage;
  if (v7 == v14)
  {

    v10 = v14;
  }
  else
  {
    if ((v14 == 0) != (v7 != 0))
    {
      v8 = -[RPTransportServiceHandoverMessage isEqual:](v14, "isEqual:", v7);

      v9 = v14;
      if ((v8 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

      v9 = v14;
    }
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNFCTransaction.m"), 84, CFSTR("clearing an existing validation message is not permitted:%@"), 0);

      v9 = v14;
    }
    if (self->_remoteValidationMessage)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNFCTransaction.m"), 85, CFSTR("update an existing validation message is not permitted:%@"), self->_remoteValidationMessage);

      v9 = v14;
    }
    v11 = v9;
    v10 = self->_remoteValidationMessage;
    self->_remoteValidationMessage = v11;
  }

  v9 = v14;
LABEL_13:

}

- (void)setState:(int64_t)a3
{
  id v4;

  if (self->_state != a3)
  {
    self->_state = a3;
    -[RPNFCTransaction delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didChangeStateForTransaction:", self);

  }
}

- (void)setRemoteIdentity:(id)a3
{
  id v5;
  RPIdentity *remoteIdentity;
  RPIdentity *v7;
  char v8;
  RPIdentity *v9;
  RPIdentity *v10;
  RPIdentity *v11;
  void *v12;
  void *v13;
  RPIdentity *v14;

  v5 = a3;
  remoteIdentity = self->_remoteIdentity;
  v14 = (RPIdentity *)v5;
  v7 = remoteIdentity;
  if (v7 == v14)
  {

    v10 = v14;
  }
  else
  {
    if ((v14 == 0) != (v7 != 0))
    {
      v8 = -[RPIdentity isEqual:](v14, "isEqual:", v7);

      v9 = v14;
      if ((v8 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

      v9 = v14;
    }
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNFCTransaction.m"), 100, CFSTR("clearing an existing identity is not permitted:%@"), 0);

      v9 = v14;
    }
    if (self->_remoteIdentity)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNFCTransaction.m"), 101, CFSTR("update an existing identity is not permitted:%@"), self->_remoteIdentity);

      v9 = v14;
    }
    v11 = v9;
    v10 = self->_remoteIdentity;
    self->_remoteIdentity = v11;
  }

  v9 = v14;
LABEL_13:

}

- (RPNFCTransaction)initWithCoder:(id)a3
{
  id v4;
  RPNFCTransaction *v5;
  id v6;
  id v7;
  RPNFCTransaction *v8;

  v4 = a3;
  v5 = -[RPNFCTransaction init](self, "init");
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v6 = v4;
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("state")))
      v5->_state = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("state"));

    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v7 = v6;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("role")))
      v5->_role = objc_msgSend(v7, "decodeIntegerForKey:", CFSTR("role"));

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSUUID *identifier;
  int64_t state;
  NSDate *connectionDate;
  RPNearFieldTapEvent *tapEvent;
  NSError *error;
  int64_t role;
  id v11;

  v4 = a3;
  identifier = self->_identifier;
  v11 = v4;
  if (identifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", identifier, CFSTR("identifier"));
    v4 = v11;
  }
  state = self->_state;
  if (state)
  {
    objc_msgSend(v11, "encodeInteger:forKey:", state, CFSTR("state"));
    v4 = v11;
  }
  connectionDate = self->_connectionDate;
  if (connectionDate)
  {
    objc_msgSend(v11, "encodeObject:forKey:", connectionDate, CFSTR("connectionDate"));
    v4 = v11;
  }
  tapEvent = self->_tapEvent;
  if (tapEvent)
  {
    objc_msgSend(v11, "encodeObject:forKey:", tapEvent, CFSTR("tapEvent"));
    v4 = v11;
  }
  error = self->_error;
  if (error)
  {
    objc_msgSend(v11, "encodeObject:forKey:", error, CFSTR("error"));
    v4 = v11;
  }
  role = self->_role;
  if (role)
  {
    objc_msgSend(v11, "encodeInteger:forKey:", role, CFSTR("role"));
    v4 = v11;
  }

}

- (BOOL)isInitiator
{
  return self->_role == 1;
}

- (NSString)description
{
  id v3;
  void *v4;
  NSUUID *identifier;
  id v6;
  id v7;
  NSDate *connectionDate;
  id v9;
  RPNearFieldTapEvent *tapEvent;
  id v11;
  RPIdentity *remoteIdentity;
  id v13;
  RPTransportServiceHandoverMessage *remoteAuthenticationMessage;
  id v15;
  RPTransportServiceHandoverMessage *remoteValidationMessage;
  id v17;
  NSError *error;
  id v19;
  id v20;
  NSUUID *v22;
  void *v23;
  NSDate *v24;
  RPNearFieldTapEvent *v25;
  RPIdentity *v26;
  RPTransportServiceHandoverMessage *v27;
  RPTransportServiceHandoverMessage *v28;
  NSError *v29;
  void *v30;

  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
  {
    v30 = v3;
    v22 = identifier;
    NSAppendPrintF();
    v6 = v30;

    v4 = v6;
  }
  RPNearFieldTransactionStateDescription(self->_state);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v7 = v4;

  connectionDate = self->_connectionDate;
  if (connectionDate)
  {
    v24 = connectionDate;
    NSAppendPrintF();
    v9 = v7;

    v7 = v9;
  }
  tapEvent = self->_tapEvent;
  if (tapEvent)
  {
    v25 = tapEvent;
    NSAppendPrintF();
    v11 = v7;

    v7 = v11;
  }
  remoteIdentity = self->_remoteIdentity;
  if (remoteIdentity)
  {
    v26 = remoteIdentity;
    NSAppendPrintF();
    v13 = v7;

    v7 = v13;
  }
  remoteAuthenticationMessage = self->_remoteAuthenticationMessage;
  if (remoteAuthenticationMessage)
  {
    v27 = remoteAuthenticationMessage;
    NSAppendPrintF();
    v15 = v7;

    v7 = v15;
  }
  remoteValidationMessage = self->_remoteValidationMessage;
  if (remoteValidationMessage)
  {
    v28 = remoteValidationMessage;
    NSAppendPrintF();
    v17 = v7;

    v7 = v17;
  }
  error = self->_error;
  if (error)
  {
    v29 = error;
    NSAppendPrintF();
    v19 = v7;

    v7 = v19;
  }
  NSAppendPrintF();
  v20 = v7;

  return (NSString *)v20;
}

- (RPNFCTransactionDelegate)delegate
{
  return (RPNFCTransactionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)connectionDate
{
  return self->_connectionDate;
}

- (int64_t)state
{
  return self->_state;
}

- (RPNearFieldTapEvent)tapEvent
{
  return self->_tapEvent;
}

- (RPIdentity)remoteIdentity
{
  return self->_remoteIdentity;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)role
{
  return self->_role;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (RPTransportServiceHandoverMessage)localAuthenticationMessage
{
  return self->_localAuthenticationMessage;
}

- (void)setLocalAuthenticationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_localAuthenticationMessage, a3);
}

- (RPTransportServiceHandoverMessage)localValidationMessage
{
  return self->_localValidationMessage;
}

- (void)setLocalValidationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_localValidationMessage, a3);
}

- (RPTransportServiceHandoverMessage)remoteAuthenticationMessage
{
  return self->_remoteAuthenticationMessage;
}

- (RPTransportServiceHandoverMessage)remoteValidationMessage
{
  return self->_remoteValidationMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteValidationMessage, 0);
  objc_storeStrong((id *)&self->_remoteAuthenticationMessage, 0);
  objc_storeStrong((id *)&self->_localValidationMessage, 0);
  objc_storeStrong((id *)&self->_localAuthenticationMessage, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_remoteIdentity, 0);
  objc_storeStrong((id *)&self->_tapEvent, 0);
  objc_storeStrong((id *)&self->_connectionDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
