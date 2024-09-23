@implementation SMInitiatorSessionInitializationRequest

- (SMInitiatorSessionInitializationRequest)initWithSessionID:(id)a3 conversation:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  SMInitiatorSessionInitializationRequest *v13;
  SMInitiatorSessionInitializationRequest *v14;
  uint64_t v15;
  id handler;
  uint64_t v17;
  NSDate *startDate;
  SMInitiatorSessionInitializationRequest *v19;
  NSObject *v20;
  const char *v21;
  objc_super v23;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: sessionID";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_14;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: conversation";
    goto LABEL_13;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Invalid parameter not satisfying: handler";
      goto LABEL_13;
    }
LABEL_14:

    v19 = 0;
    goto LABEL_15;
  }
  v23.receiver = self;
  v23.super_class = (Class)SMInitiatorSessionInitializationRequest;
  v13 = -[SMInitiatorSessionInitializationRequest init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sessionID, a3);
    objc_storeStrong((id *)&v14->_conversation, a4);
    v15 = MEMORY[0x1D8232094](v12);
    handler = v14->_handler;
    v14->_handler = (id)v15;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = objc_claimAutoreleasedReturnValue();
    startDate = v14->_startDate;
    v14->_startDate = (NSDate *)v17;

  }
  self = v14;
  v19 = self;
LABEL_15:

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SMInitiatorSessionInitializationRequest sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorSessionInitializationRequest conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "receiverHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorSessionInitializationRequest startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMInitiatorSessionInitializationRequest startDate](self, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sessionID, %@, handles, %@, startDate, %@, elapsed interval, %.2f"), v5, v7, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[SMInitiatorSessionInitializationRequest sessionID](self, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SMInitiatorSessionInitializationRequest conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SMInitiatorSessionInitializationRequest startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SMInitiatorSessionInitializationRequest *v6;
  SMInitiatorSessionInitializationRequest *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = (SMInitiatorSessionInitializationRequest *)a3;
  if (self == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[SMInitiatorSessionInitializationRequest sessionID](self, "sessionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorSessionInitializationRequest sessionID](v7, "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[SMInitiatorSessionInitializationRequest sessionID](self, "sessionID");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorSessionInitializationRequest sessionID](v7, "sessionID");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[SMInitiatorSessionInitializationRequest conversation](self, "conversation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorSessionInitializationRequest conversation](v7, "conversation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[SMInitiatorSessionInitializationRequest conversation](self, "conversation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorSessionInitializationRequest conversation](v7, "conversation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[SMInitiatorSessionInitializationRequest startDate](self, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMInitiatorSessionInitializationRequest startDate](v7, "startDate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[SMInitiatorSessionInitializationRequest startDate](self, "startDate");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMInitiatorSessionInitializationRequest startDate](v7, "startDate");
        v22 = v4;
        v18 = v9;
        v19 = v8;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v17, "isEqual:", v20);

        v8 = v19;
        v9 = v18;
        v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    v10 = 0;
  }
LABEL_21:

  return v10;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (SMConversation)conversation
{
  return self->_conversation;
}

- (id)handler
{
  return self->_handler;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
