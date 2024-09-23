@implementation AMSBagValue

- (void)jsa_valueWithCompletion:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[AMSBagValue isLoaded](self, "isLoaded")
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(+[JSANetwork sharedInstance](JSANetwork, "sharedInstance")),
        v5 = objc_msgSend(v4, "isReachable"),
        v4,
        (v5 & 1) != 0))
  {
    -[AMSBagValue valueWithCompletion:](self, "valueWithCompletion:", v9);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSBagValue _errorForAirplaneMode](self, "_errorForAirplaneMode"));
    v7 = objc_retainBlock(v9);
    v8 = v7;
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v6);

  }
}

- (id)jsa_valueWithError:(id *)a3
{
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v9;

  if (-[AMSBagValue isLoaded](self, "isLoaded")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[JSANetwork sharedInstance](JSANetwork, "sharedInstance")),
        v6 = objc_msgSend(v5, "isReachable"),
        v5,
        (v6 & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSBagValue valueWithError:](self, "valueWithError:", a3));
  }
  else if (a3)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[AMSBagValue _errorForAirplaneMode](self, "_errorForAirplaneMode"));
    v7 = 0;
    *a3 = v9;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_errorForAirplaneMode
{
  const __CFString *v3;
  void *v4;
  void *v5;

  if ((objc_opt_respondsToSelector(self, "key") & 1) != 0)
    v3 = (const __CFString *)-[AMSBagValue performSelector:](self, "performSelector:", "key");
  else
    v3 = CFSTR("(unknown key)");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to load bag value for %@ given there's no cache and device is offline"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError bu_errorWithDomain:code:alertTitle:alertMessage:](NSError, "bu_errorWithDomain:code:alertTitle:alertMessage:", CFSTR("JSAErrorDomain"), 110, CFSTR("Attempted to load bag with no network"), v4));

  return v5;
}

@end
