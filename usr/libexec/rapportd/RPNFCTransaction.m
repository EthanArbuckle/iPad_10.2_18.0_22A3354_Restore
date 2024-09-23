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
  v4 = -[RPNFCTransaction init](&v10, "init");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    identifier = v4->_identifier;
    v4->_identifier = (NSUUID *)v5;

    v4->_role = a3;
    v7 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
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
  unsigned __int8 v11;
  id v12;

  v12 = a3;
  v5 = (id)-[RPNFCTransaction state](self, "state") == (id)2;
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
  unsigned __int8 v9;
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
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNFCTransaction.m"), 65, CFSTR("clearing an existing tap event is not permitted:%@"), 0);

    }
    if (self->_tapEvent)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
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
  unsigned __int8 v8;
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNFCTransaction.m"), 75, CFSTR("clearing an existing authentication message is not permitted:%@"), 0);

      v9 = v14;
    }
    if (self->_remoteAuthenticationMessage)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
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
  unsigned __int8 v8;
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNFCTransaction.m"), 84, CFSTR("clearing an existing validation message is not permitted:%@"), 0);

      v9 = v14;
    }
    if (self->_remoteValidationMessage)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
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
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RPNFCTransaction delegate](self, "delegate"));
    objc_msgSend(v4, "didChangeStateForTransaction:", self);

  }
}

- (void)setRemoteIdentity:(id)a3
{
  id v5;
  RPIdentity *remoteIdentity;
  RPIdentity *v7;
  unsigned __int8 v8;
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNFCTransaction.m"), 100, CFSTR("clearing an existing identity is not permitted:%@"), 0);

      v9 = v14;
    }
    if (self->_remoteIdentity)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
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
  uint64_t v5;
  uint64_t v6;
  RPNFCTransaction *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  RPNFCTransaction *v20;

  v4 = a3;
  v7 = -[RPNFCTransaction init](self, "init");
  if (v7)
  {
    v8 = objc_opt_class(NSUUID, v5, v6);
    NSDecodeObjectIfPresent(v4, CFSTR("identifier"), v8, &v7->_identifier);
    v9 = v4;
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("state")))
      v7->_state = (int64_t)objc_msgSend(v9, "decodeIntegerForKey:", CFSTR("state"));

    v12 = objc_opt_class(NSDate, v10, v11);
    NSDecodeObjectIfPresent(v9, CFSTR("connectionDate"), v12, &v7->_connectionDate);
    v15 = objc_opt_class(RPNearFieldTapEvent, v13, v14);
    NSDecodeObjectIfPresent(v9, CFSTR("tapEvent"), v15, &v7->_tapEvent);
    v18 = objc_opt_class(NSError, v16, v17);
    NSDecodeObjectIfPresent(v9, CFSTR("error"), v18, &v7->_error);
    v19 = v9;
    if (objc_msgSend(v19, "containsValueForKey:", CFSTR("role")))
      v7->_role = (int64_t)objc_msgSend(v19, "decodeIntegerForKey:", CFSTR("role"));

    v20 = v7;
  }

  return v7;
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
  NSUUID *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSDate *connectionDate;
  NSDate *v12;
  id v13;
  RPNearFieldTapEvent *tapEvent;
  RPNearFieldTapEvent *v15;
  id v16;
  RPIdentity *remoteIdentity;
  RPIdentity *v18;
  id v19;
  RPTransportServiceHandoverMessage *remoteAuthenticationMessage;
  RPTransportServiceHandoverMessage *v21;
  id v22;
  RPTransportServiceHandoverMessage *remoteValidationMessage;
  RPTransportServiceHandoverMessage *v24;
  id v25;
  NSError *error;
  NSError *v27;
  id v28;
  const __CFString *v29;
  id v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v41 = 0;
  NSAppendPrintF(&v41, "RPNFCTransaction\n");
  v3 = v41;
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
  {
    v40 = v3;
    v6 = identifier;
    NSAppendPrintF(&v40, "ID %@\n", v6);
    v7 = v40;

    v4 = v7;
  }
  v39 = v4;
  v8 = RPNearFieldTransactionStateDescription(self->_state);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  NSAppendPrintF(&v39, "State %@\n", v9);
  v10 = v39;

  connectionDate = self->_connectionDate;
  if (connectionDate)
  {
    v38 = v10;
    v12 = connectionDate;
    NSAppendPrintF(&v38, "ConnectionDate %@\n", v12);
    v13 = v38;

    v10 = v13;
  }
  tapEvent = self->_tapEvent;
  if (tapEvent)
  {
    v37 = v10;
    v15 = tapEvent;
    NSAppendPrintF(&v37, "TapEvent %@\n", v15);
    v16 = v37;

    v10 = v16;
  }
  remoteIdentity = self->_remoteIdentity;
  if (remoteIdentity)
  {
    v36 = v10;
    v18 = remoteIdentity;
    NSAppendPrintF(&v36, "RemoteIdentity %@\n", v18);
    v19 = v36;

    v10 = v19;
  }
  remoteAuthenticationMessage = self->_remoteAuthenticationMessage;
  if (remoteAuthenticationMessage)
  {
    v35 = v10;
    v21 = remoteAuthenticationMessage;
    NSAppendPrintF(&v35, "RemoteAuthenticationMessage %@\n", v21);
    v22 = v35;

    v10 = v22;
  }
  remoteValidationMessage = self->_remoteValidationMessage;
  if (remoteValidationMessage)
  {
    v34 = v10;
    v24 = remoteValidationMessage;
    NSAppendPrintF(&v34, "RemoteValidationMessage %@\n", v24);
    v25 = v34;

    v10 = v25;
  }
  error = self->_error;
  if (error)
  {
    v33 = v10;
    v27 = error;
    NSAppendPrintF(&v33, "Error %@\n", v27);
    v28 = v33;

    v10 = v28;
  }
  v32 = v10;
  if (self->_role == 1)
    v29 = CFSTR("Initiator");
  else
    v29 = CFSTR("Receiver");
  NSAppendPrintF(&v32, "Role %@\n", v29);
  v30 = v32;

  return (NSString *)v30;
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
