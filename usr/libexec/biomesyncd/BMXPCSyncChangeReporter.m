@implementation BMXPCSyncChangeReporter

- (BMXPCSyncChangeReporter)init
{
  BMXPCSyncChangeReporter *v2;
  GDXPCCoordinationService *v3;
  GDXPCCoordinationService *coordinationService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BMXPCSyncChangeReporter;
  v2 = -[BMXPCSyncChangeReporter init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(GDXPCCoordinationService);
    coordinationService = v2->_coordinationService;
    v2->_coordinationService = v3;

  }
  return v2;
}

- (id)streamRemoteIdentifierForStreamName:(id)a3 deviceIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@:remotes:%@"), v6, v5);

  return v7;
}

- (BOOL)streamUpdatedForStreamName:(id)a3 deviceIdentifier:(id)a4 error:(id *)a5
{
  void *v7;
  GDXPCCoordinationService *coordinationService;
  unsigned __int8 v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v15;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMXPCSyncChangeReporter streamRemoteIdentifierForStreamName:deviceIdentifier:](self, "streamRemoteIdentifierForStreamName:deviceIdentifier:", a3, a4));
  coordinationService = self->_coordinationService;
  v15 = 0;
  v9 = -[GDXPCCoordinationService streamUpdatedWithStreamName:isDelete:error:](coordinationService, "streamUpdatedWithStreamName:isDelete:error:", v7, 0, &v15);
  v10 = v15;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v10);
    v12 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000415F0();

  }
  return v9;
}

- (BOOL)userDeletesForStreamName:(id)a3 deviceIdentifier:(id)a4 error:(id *)a5
{
  void *v7;
  GDXPCCoordinationService *coordinationService;
  unsigned __int8 v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v15;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMXPCSyncChangeReporter streamRemoteIdentifierForStreamName:deviceIdentifier:](self, "streamRemoteIdentifierForStreamName:deviceIdentifier:", a3, a4));
  coordinationService = self->_coordinationService;
  v15 = 0;
  v9 = -[GDXPCCoordinationService streamUpdatedWithStreamName:isDelete:error:](coordinationService, "streamUpdatedWithStreamName:isDelete:error:", v7, 1, &v15);
  v10 = v15;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v10);
    v12 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100041654();

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinationService, 0);
}

@end
