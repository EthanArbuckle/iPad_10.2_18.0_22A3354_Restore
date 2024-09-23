@implementation SDLogAgentContainer

+ (id)containerAtLocation:(id)a3 forTaskType:(int)a4 withTimeout:(double)a5 withDelegate:(id)a6 withMsgContents:(id)a7 withReplyBlock:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  SDLogAgentContainer *v21;
  __CFString *v22;
  void *v23;

  v13 = a3;
  v14 = a7;
  v15 = a8;
  v16 = a6;
  v17 = sub_1000453A4(a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = sub_10002768C(v13, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v21 = -[SDContainer initWithName:andDestination:withDelegate:]([SDLogAgentContainer alloc], "initWithName:andDestination:withDelegate:", v20, 0, v16);
  if (v21)
  {
    -[SDTaskContainer setTimeout:](v21, "setTimeout:", a5);
    -[SDLogAgentContainer setTaskType:](v21, "setTaskType:", a4);
    v22 = sub_1000453A4(a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[SDLogAgentContainer setTaskName:](v21, "setTaskName:", v23);

    -[SDLogAgentContainer setOutputDir:](v21, "setOutputDir:", v13);
    -[SDLogAgentContainer setMsgContents:](v21, "setMsgContents:", v14);
    -[SDLogAgentContainer setReplyBlock:](v21, "setReplyBlock:", v15);
    -[SDLogAgentContainer setReply:](v21, "setReply:", 0);
  }

  return v21;
}

- (id)helperRepliedHandler
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100044768;
  v3[3] = &unk_100099990;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (BOOL)sendHelperMessage
{
  void *v3;
  _xpc_connection_s *v4;
  void *v5;
  void *v6;
  xpc_object_t v7;
  unsigned __int8 v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  _xpc_connection_s *v33;
  NSObject *v34;
  void *v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  objc_msgSend(v3, "recordHelperTaskStart");
  v4 = sub_1000247B0(&stru_100099CD0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[SDLogAgentContainer setLogAgentConnection:](self, "setLogAgentConnection:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer logAgentConnection](self, "logAgentConnection"));
  if (v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      xpc_dictionary_set_int64(v7, "taskType", -[SDLogAgentContainer taskType](self, "taskType"));
      v8 = -[SDTaskContainer runByItself](self, "runByItself");
      -[SDTaskContainer timeout](self, "timeout");
      v10 = v9;
      if ((v8 & 1) == 0)
      {
        objc_msgSend(v3, "minimumTimeBeforeTimeouts");
        v10 = v10 + v11;
      }
      xpc_dictionary_set_double(v7, "taskTimeout", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer outputDir](self, "outputDir"));

      if (v12)
      {
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer outputDir](self, "outputDir")));
        xpc_dictionary_set_string(v7, "taskOutputDir", (const char *)objc_msgSend(v13, "fileSystemRepresentation"));

      }
      else
      {
        xpc_dictionary_set_BOOL(v7, "taskNoOutputDir", 1);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer msgContents](self, "msgContents"));

      if (v18)
      {
        v37 = v3;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer msgContents](self, "msgContents"));
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v39;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v39 != v22)
                objc_enumerationMutation(v19);
              v24 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v23));
              v25 = (const char *)objc_msgSend(v24, "UTF8String");
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer msgContents](self, "msgContents"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", v24));
              xpc_dictionary_set_value(v7, v25, v27);

              v23 = (char *)v23 + 1;
            }
            while (v21 != v23);
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
          }
          while (v21);
        }

        v3 = v37;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
      xpc_dictionary_set_int64(v7, "startTimeClockNS", (int64_t)objc_msgSend(v28, "startDiagnosticTimeClockNS"));

      v29 = sub_100026BC4();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      v31 = v30;
      if ((unint64_t)&self->super.super.super.super.isa + 1 >= 2 && os_signpost_enabled(v30))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer taskName](self, "taskName"));
        *(_DWORD *)buf = 138412290;
        v43 = v32;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "Helper Task", "%@", buf, 0xCu);

      }
      v33 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer logAgentConnection](self, "logAgentConnection"));
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "taskQueue"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer helperRepliedHandler](self, "helperRepliedHandler"));
      xpc_connection_send_message_with_reply(v33, v7, v34, v35);

    }
  }
  else
  {
    v14 = sub_100026C34();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100061AD4(self);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentContainer taskName](self, "taskName"));
    objc_msgSend(v16, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("No connection with sysdiagnose_helper. Cannot execute task: %@"), v17);

    objc_msgSend(v3, "recordHelperTaskEnd");
  }

  return v6 != 0;
}

- (BOOL)_execute
{
  return -[SDLogAgentContainer sendHelperMessage](self, "sendHelperMessage");
}

- (OS_xpc_object)logAgentConnection
{
  return self->_logAgentConnection;
}

- (void)setLogAgentConnection:(id)a3
{
  objc_storeStrong((id *)&self->_logAgentConnection, a3);
}

- (unint64_t)taskType
{
  return self->_taskType;
}

- (void)setTaskType:(unint64_t)a3
{
  self->_taskType = a3;
}

- (NSString)taskName
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTaskName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSString)outputDir
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setOutputDir:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSDictionary)msgContents
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMsgContents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (id)replyBlock
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setReplyBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (OS_xpc_object)reply
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 192, 1);
}

- (void)setReply:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong(&self->_replyBlock, 0);
  objc_storeStrong((id *)&self->_msgContents, 0);
  objc_storeStrong((id *)&self->_outputDir, 0);
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_logAgentConnection, 0);
}

@end
