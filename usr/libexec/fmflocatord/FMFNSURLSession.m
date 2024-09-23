@implementation FMFNSURLSession

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFNSURLSession session](self, "session"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v7, v6));

  return v9;
}

- (id)dataTaskWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFNSURLSession session](self, "session"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataTaskWithRequest:", v4));

  return v6;
}

- (id)downloadTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFNSURLSession session](self, "session"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloadTaskWithRequest:completionHandler:", v7, v6));

  return v9;
}

- (void)getAllTasksWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMFNSURLSession session](self, "session"));
  objc_msgSend(v5, "getAllTasksWithCompletionHandler:", v4);

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFNSURLSession delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "URLSession:didBecomeInvalidWithError:") & 1) != 0)
    objc_msgSend(v5, "URLSession:didBecomeInvalidWithError:", self, v6);

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFNSURLSession delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v8, "URLSession:didReceiveChallenge:completionHandler:") & 1) != 0)
    objc_msgSend(v8, "URLSession:didReceiveChallenge:completionHandler:", self, v9, v7);

}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (FMFURLSessionDelegate)delegate
{
  return (FMFURLSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
