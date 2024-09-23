@implementation TraceRouteRequestBuilder

- (TraceRouteRequestBuilder)initWithTraceURL:(id)a3
{
  id v5;
  TraceRouteRequestBuilder *v6;
  TraceRouteRequestBuilder *v7;
  uint64_t Log;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  id v13;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TraceRouteRequestBuilder;
  v6 = -[TraceRouteRequestBuilder init](&v11, "init");
  if (!v6)
    goto LABEL_4;
  if ((objc_msgSend(v5, "isFileURL") & 1) != 0)
  {
    objc_storeStrong((id *)&v6->_traceURL, a3);
LABEL_4:
    v7 = v6;
    goto LABEL_8;
  }
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "DirectionsRequestBuilding");
  v9 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "TraceRouteRequestBuilder is expecting a file URL, got %{public}@", buf, 0xCu);
  }

  v7 = 0;
LABEL_8:

  return v7;
}

- (id)buildDirectionsRequestDetails
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)MNDirectionsRequestDetails);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TraceRouteRequestBuilder traceURL](self, "traceURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v6 = objc_msgSend(v3, "initWithTracePath:", v5);

  return v6;
}

- (NSURL)traceURL
{
  return self->_traceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceURL, 0);
}

@end
