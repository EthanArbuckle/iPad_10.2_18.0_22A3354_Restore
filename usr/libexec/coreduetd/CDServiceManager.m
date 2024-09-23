@implementation CDServiceManager

+ (id)sharedInstance
{
  if (qword_100040E38 != -1)
    dispatch_once(&qword_100040E38, &stru_100038988);
  return (id)qword_100040E30;
}

- (CDServiceManager)init
{
  NSObject *v3;
  CDServiceManager *v4;
  uint64_t v5;
  CDDataMigrator *dataMigrator;
  uint64_t v7;
  CDKnowledgeDaemon *knowledgeDaemon;
  CDPeopleDaemon *v9;
  void *v10;
  CDPeopleDaemon *v11;
  CDPeopleDaemon *peopleDaemon;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _CDSpotlightItemRecorder *spotlightRecorder;
  NSObject *v21;
  objc_super v23;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost"));
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CDServiceManagerInit", " enableTelemetry=YES ", buf, 2u);
  }

  v23.receiver = self;
  v23.super_class = (Class)CDServiceManager;
  v4 = -[CDServiceManager init](&v23, "init");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[CDDataMigrator sharedInstance](CDDataMigrator, "sharedInstance"));
    dataMigrator = v4->_dataMigrator;
    v4->_dataMigrator = (CDDataMigrator *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[CDKnowledgeDaemon defaultDaemon](CDKnowledgeDaemon, "defaultDaemon"));
    knowledgeDaemon = v4->_knowledgeDaemon;
    v4->_knowledgeDaemon = (CDKnowledgeDaemon *)v7;

    v9 = [CDPeopleDaemon alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon storage](v4->_knowledgeDaemon, "storage"));
    v11 = -[CDPeopleDaemon initWithKnowledgeStore:](v9, "initWithKnowledgeStore:", v10);
    peopleDaemon = v4->_peopleDaemon;
    v4->_peopleDaemon = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemon storage](v4->_knowledgeDaemon, "storage"));
    v14 = (objc_class *)objc_opt_class(_CDSpotlightItemRecorder);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStorage storageWithShallowCopyFromStorage:clientIdentifier:](_DKKnowledgeStorage, "storageWithShallowCopyFromStorage:clientIdentifier:", v13, v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon store](v4->_peopleDaemon, "store"));
    v19 = objc_claimAutoreleasedReturnValue(+[_CDSpotlightItemRecorder spotlightItemRecorderWithInteractionRecorder:knowledgeStore:](_CDSpotlightItemRecorder, "spotlightItemRecorderWithInteractionRecorder:knowledgeStore:", v18, v17));
    spotlightRecorder = v4->_spotlightRecorder;
    v4->_spotlightRecorder = (_CDSpotlightItemRecorder *)v19;

    -[CDServiceManager setupServices](v4, "setupServices");
  }
  v21 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost"));
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CDServiceManagerInit", ", buf, 2u);
  }

  return v4;
}

- (void)setupServices
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  -[_CDSpotlightItemRecorder registerSpotlightRecorderWithServiceName:](self->_spotlightRecorder, "registerSpotlightRecorderWithServiceName:", CFSTR("com.apple.corespotlight.receiver.coreduet"));
  -[_CDSpotlightItemRecorder startIntentDeletionForContactDeletions](self->_spotlightRecorder, "startIntentDeletionForContactDeletions");
  v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v3)
    sub_1000223CC(v3, v4, v5, v6, v7, v8, v9, v10);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000389C8);
  v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v11)
    sub_100022394(v11, v12, v13, v14, v15, v16, v17, v18);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000389E8);

}

- (CDKnowledgeDaemon)knowledgeDaemon
{
  return self->_knowledgeDaemon;
}

- (CDPeopleDaemon)peopleDaemon
{
  return self->_peopleDaemon;
}

- (_CDSpotlightItemRecorder)spotlightRecorder
{
  return self->_spotlightRecorder;
}

- (CDDataMigrator)dataMigrator
{
  return self->_dataMigrator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataMigrator, 0);
  objc_storeStrong((id *)&self->_spotlightRecorder, 0);
  objc_storeStrong((id *)&self->_peopleDaemon, 0);
  objc_storeStrong((id *)&self->_knowledgeDaemon, 0);
}

@end
