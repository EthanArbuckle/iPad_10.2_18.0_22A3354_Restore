@implementation TraceRouteRequestBuilderFactory

- (TraceRouteRequestBuilderFactory)initWithTraceURL:(id)a3
{
  id v4;
  TraceRouteRequestBuilderFactory *v5;
  TraceRouteRequestBuilder *v6;
  TraceRouteRequestBuilder *builder;
  TraceRouteRequestBuilderFactory *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TraceRouteRequestBuilderFactory;
  v5 = -[TraceRouteRequestBuilderFactory init](&v10, "init");
  if (v5
    && (v6 = -[TraceRouteRequestBuilder initWithTraceURL:]([TraceRouteRequestBuilder alloc], "initWithTraceURL:", v4), builder = v5->_builder, v5->_builder = v6, builder, !v5->_builder))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)makeRouteRequestBuilder
{
  return self->_builder;
}

- (NSURL)traceURL
{
  return self->_traceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceURL, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
