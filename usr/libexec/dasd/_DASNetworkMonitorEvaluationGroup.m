@implementation _DASNetworkMonitorEvaluationGroup

- (_DASNetworkMonitorEvaluationGroup)initWithEndpoint:(id)a3 parameters:(id)a4 activityID:(id)a5 callback:(id)a6 onQueue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _DASNetworkMonitorEvaluationGroup *v18;
  _DASNetworkMonitorEvaluationGroup *v19;
  id v20;
  id v21;
  uint64_t evaluator_for_endpoint;
  OS_nw_path_evaluator *evaluator;
  uint64_t v24;
  NSMutableSet *activityIDs;
  os_log_t v26;
  OS_os_log *log;
  OS_nw_path_evaluator *v28;
  _DASNetworkMonitorEvaluationGroup *v29;
  _DASNetworkMonitorEvaluationGroup *v30;
  NSObject *v31;
  _QWORD v33[4];
  _DASNetworkMonitorEvaluationGroup *v34;
  id v35;
  objc_super v36;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v36.receiver = self;
  v36.super_class = (Class)_DASNetworkMonitorEvaluationGroup;
  v18 = -[_DASNetworkMonitorEvaluationGroup init](&v36, "init");
  v19 = v18;
  if (!v18)
    goto LABEL_4;
  objc_storeStrong((id *)&v18->_endpoint, a3);
  objc_storeStrong((id *)&v19->_parameters, a4);
  v20 = objc_msgSend(v13, "copyCEndpoint");
  v21 = objc_msgSend(v14, "copyCParameters");
  evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(v20, v21);
  evaluator = v19->_evaluator;
  v19->_evaluator = (OS_nw_path_evaluator *)evaluator_for_endpoint;

  v24 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v15));
  activityIDs = v19->_activityIDs;
  v19->_activityIDs = (NSMutableSet *)v24;

  v26 = os_log_create("com.apple.duetactivityscheduler", "NetworkMonitorEvaluationGroup");
  log = v19->_log;
  v19->_log = (OS_os_log *)v26;

  v28 = v19->_evaluator;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000CD9D8;
  v33[3] = &unk_100160220;
  v35 = v16;
  v29 = v19;
  v34 = v29;
  if ((nw_path_evaluator_set_update_handler(v28, v17, v33) & 1) != 0)
  {

LABEL_4:
    v30 = v19;
    goto LABEL_8;
  }
  v31 = v19->_log;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    sub_1000EB468(v31, v29);

  v30 = 0;
LABEL_8:

  return v30;
}

- (void)startMonitoringForActivityID:(id)a3
{
  NSMutableSet *v4;
  id v5;

  v5 = a3;
  v4 = self->_activityIDs;
  objc_sync_enter(v4);
  -[NSMutableSet addObject:](self->_activityIDs, "addObject:", v5);
  objc_sync_exit(v4);

}

- (BOOL)stopMonitoringForActivityID:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;

  v4 = a3;
  v5 = self->_activityIDs;
  objc_sync_enter(v5);
  -[NSMutableSet removeObject:](self->_activityIDs, "removeObject:", v4);
  v6 = -[NSMutableSet count](self->_activityIDs, "count");
  if (!v6)
    nw_path_evaluator_cancel(self->_evaluator);
  objc_sync_exit(v5);

  return v6 == 0;
}

- (BOOL)isMonitoringActivityID:(id)a3
{
  id v4;
  NSMutableSet *v5;

  v4 = a3;
  v5 = self->_activityIDs;
  objc_sync_enter(v5);
  LOBYTE(self) = -[NSMutableSet containsObject:](self->_activityIDs, "containsObject:", v4);
  objc_sync_exit(v5);

  return (char)self;
}

- (BOOL)isMonitoringWithParameters:(id)a3 endpoint:(id)a4
{
  id v6;
  NWParameters *parameters;
  id v8;
  id v9;
  id v10;
  unsigned __int8 v11;

  v6 = a4;
  parameters = self->_parameters;
  v8 = a3;
  v9 = -[NWParameters copyCParameters](parameters, "copyCParameters");
  v10 = objc_msgSend(v8, "copyCParameters");

  if (nw_parameters_are_equivalent_for_path_evaluation(v9, v10))
    v11 = -[NWEndpoint isEqual:](self->_endpoint, "isEqual:", v6);
  else
    v11 = 0;

  return v11;
}

- (BOOL)isNetworkPathAvailable
{
  NSObject *v2;
  BOOL v3;

  v2 = nw_path_evaluator_copy_path(self->_evaluator, a2);
  v3 = nw_path_get_status(v2) != nw_path_status_unsatisfied;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _DASNetworkMonitorEvaluationGroup *v4;
  _DASNetworkMonitorEvaluationGroup *v5;
  NSMutableSet *v6;
  NWEndpoint *endpoint;
  void *v8;
  NWParameters *parameters;
  void *v10;
  OS_nw_path_evaluator *evaluator;
  void *v12;
  NSMutableSet *activityIDs;
  void *v14;
  unsigned __int8 v15;
  objc_super v17;

  v4 = (_DASNetworkMonitorEvaluationGroup *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)_DASNetworkMonitorEvaluationGroup;
    if (-[_DASNetworkMonitorEvaluationGroup isEqual:](&v17, "isEqual:", v4))
    {
      v5 = v4;
      v6 = self->_activityIDs;
      objc_sync_enter(v6);
      endpoint = self->_endpoint;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkMonitorEvaluationGroup endpoint](v5, "endpoint"));
      if (-[NWEndpoint isEqual:](endpoint, "isEqual:", v8))
      {
        parameters = self->_parameters;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkMonitorEvaluationGroup parameters](v5, "parameters"));
        if (-[NWParameters isEqual:](parameters, "isEqual:", v10))
        {
          evaluator = self->_evaluator;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkMonitorEvaluationGroup evaluator](v5, "evaluator"));
          if (-[OS_nw_path_evaluator isEqual:](evaluator, "isEqual:", v12))
          {
            activityIDs = self->_activityIDs;
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkMonitorEvaluationGroup activityIDs](v5, "activityIDs"));
            v15 = -[NSMutableSet isEqual:](activityIDs, "isEqual:", v14);

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

      objc_sync_exit(v6);
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  NSMutableSet *v3;
  unint64_t v4;
  id v5;
  id v6;
  unint64_t v7;

  v3 = self->_activityIDs;
  objc_sync_enter(v3);
  v4 = (unint64_t)-[NWEndpoint hash](self->_endpoint, "hash");
  v5 = -[NWParameters hash](self->_parameters, "hash");
  v6 = -[OS_nw_path_evaluator hash](self->_evaluator, "hash");
  v7 = v4 ^ (2 * (_QWORD)v5) ^ (4 * (_QWORD)v6) ^ (8 * (_QWORD)-[NSMutableSet hash](self->_activityIDs, "hash"));
  objc_sync_exit(v3);

  return v7;
}

- (id)description
{
  NSMutableSet *v3;
  NSString *v4;
  void *v5;

  v3 = self->_activityIDs;
  objc_sync_enter(v3);
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> Activity IDs: %@"), objc_opt_class(self), self, self->_activityIDs);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_exit(v3);

  return v5;
}

- (id)debugDescription
{
  NSMutableSet *v3;
  NSString *v4;
  void *v5;

  v3 = self->_activityIDs;
  objc_sync_enter(v3);
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> Endpoint: %@, Parameters: %@, Activity IDs: %@"), objc_opt_class(self), self, self->_endpoint, self->_parameters, self->_activityIDs);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_exit(v3);

  return v5;
}

- (NWEndpoint)endpoint
{
  return self->_endpoint;
}

- (NWParameters)parameters
{
  return self->_parameters;
}

- (NSMutableSet)activityIDs
{
  return self->_activityIDs;
}

- (OS_nw_path_evaluator)evaluator
{
  return self->_evaluator;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_activityIDs, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
