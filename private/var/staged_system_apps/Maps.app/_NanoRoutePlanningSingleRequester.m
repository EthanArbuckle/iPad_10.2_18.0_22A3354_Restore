@implementation _NanoRoutePlanningSingleRequester

- (void)processRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id completionHandler;
  NanoRoutePlanningSession *v8;
  NanoRoutePlanningSession *session;
  NanoRoutePlanningSession *v10;
  id v11;

  v11 = a3;
  v6 = objc_msgSend(a4, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v6;

  v8 = objc_alloc_init(NanoRoutePlanningSession);
  session = self->_session;
  self->_session = v8;
  v10 = v8;

  -[NanoRoutePlanningSession setShouldBroadcast:](v10, "setShouldBroadcast:", 0);
  -[NanoRoutePlanningSession registerObserver:](v10, "registerObserver:", self);
  -[NanoRoutePlanningSession processRequest:](v10, "processRequest:", v11);

}

- (void)routePlanningSession:(id)a3 didUpdateWithResponse:(id)a4
{
  id v5;

  v5 = a3;
  if (objc_msgSend(a4, "hasReceivedAllExpectedRoutes"))
    objc_msgSend(v5, "invalidate");

}

- (void)routePlanningSession:(id)a3 didFailWithResponse:(id)a4
{
  objc_msgSend(a3, "invalidate");
}

- (void)routePlanningSessionDidInvalidate:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, id, void *);
  id completionHandler;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "response"));

  v6 = (void (**)(id, id, void *))objc_retainBlock(self->_completionHandler);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  v6[2](v6, v8, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
