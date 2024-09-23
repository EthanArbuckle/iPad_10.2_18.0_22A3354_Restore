@implementation _RWIAutomaticInspectionSession

- (_RWIAutomaticInspectionSession)initWithPageId:(id)a3 applicationIdentifier:(id)a4 applicationPID:(int)a5 debuggers:(id)a6
{
  id v10;
  id v11;
  id v12;
  _RWIAutomaticInspectionSession *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSArray *debuggers;
  uint64_t v20;
  NSNumber *pageId;
  uint64_t v22;
  NSString *applicationIdentifier;
  _RWIAutomaticInspectionSession *v24;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_RWIAutomaticInspectionSession;
  v13 = -[_RWIAutomaticInspectionSession init](&v26, sel_init);
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    debuggers = v13->_debuggers;
    v13->_debuggers = (NSArray *)v18;

    v20 = objc_msgSend(v10, "copy");
    pageId = v13->_pageId;
    v13->_pageId = (NSNumber *)v20;

    v22 = objc_msgSend(v11, "copy");
    applicationIdentifier = v13->_applicationIdentifier;
    v13->_applicationIdentifier = (NSString *)v22;

    v13->_applicationPID = a5;
    v13->_currentDebuggerIndex = 0;
    v24 = v13;
  }

  return v13;
}

- (void)start
{
  NSObject *v3;
  NSNumber *pageId;
  NSString *applicationIdentifier;
  NSString *identifier;
  int v7;
  int v8;
  NSString *v9;
  __int16 v10;
  NSNumber *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  RWIDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pageId = self->_pageId;
    applicationIdentifier = self->_applicationIdentifier;
    identifier = self->_identifier;
    v7 = -[NSArray count](self->_debuggers, "count");
    v8 = 138544130;
    v9 = identifier;
    v10 = 2114;
    v11 = pageId;
    v12 = 2114;
    v13 = applicationIdentifier;
    v14 = 1024;
    v15 = v7;
    _os_log_impl(&dword_21AD49000, v3, OS_LOG_TYPE_DEFAULT, "Automatic Inspection Candidate START : Session (%{public}@) PageId (%{public}@) Application (%{public}@) Debuggers (%u)", (uint8_t *)&v8, 0x26u);
  }

  -[_RWIAutomaticInspectionSession _sendQuery](self, "_sendQuery");
}

- (BOOL)receivedRejectResponse
{
  unint64_t currentDebuggerIndex;
  NSUInteger v4;
  NSObject *v5;
  _BOOL4 v6;
  NSString *identifier;
  NSString *v8;
  int v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  currentDebuggerIndex = self->_currentDebuggerIndex;
  v4 = -[NSArray count](self->_debuggers, "count") - 1;
  RWIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (currentDebuggerIndex == v4)
  {
    if (v6)
    {
      identifier = self->_identifier;
      v10 = 138543362;
      v11 = identifier;
      _os_log_impl(&dword_21AD49000, v5, OS_LOG_TYPE_DEFAULT, "Automatic Inspection Candidate REJECT : Final Rejection Session (%{public}@)", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    if (v6)
    {
      v8 = self->_identifier;
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_21AD49000, v5, OS_LOG_TYPE_DEFAULT, "Automatic Inspection Candidate REJECT : Continuing Session (%{public}@)", (uint8_t *)&v10, 0xCu);
    }

    ++self->_currentDebuggerIndex;
    -[_RWIAutomaticInspectionSession _sendQuery](self, "_sendQuery");
  }
  return currentDebuggerIndex == v4;
}

- (void)_sendQuery
{
  void *v3;
  void *v4;
  _QWORD v5[3];
  __int128 v6;
  NSString *identifier;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[NSArray objectAtIndex:](self->_debuggers, "objectAtIndex:", self->_currentDebuggerIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&self->_pageId;
  v5[0] = CFSTR("WIRPageIdentifierKey");
  v5[1] = CFSTR("WIRApplicationIdentifierKey");
  v5[2] = CFSTR("WIRAutomaticInspectionSessionIdentifierKey");
  identifier = self->_identifier;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v6, v5, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_rpc_reportAutomaticInspectionCandidate:", v4);

}

- (BOOL)matchesPageId:(id)a3 applicationIdentifier:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a4;
  if (-[NSNumber isEqualToNumber:](self->_pageId, "isEqualToNumber:", a3))
    v7 = -[NSString isEqualToString:](self->_applicationIdentifier, "isEqualToString:", v6);
  else
    v7 = 0;

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)debuggers
{
  return self->_debuggers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_pageId, 0);
  objc_storeStrong((id *)&self->_debuggers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
