@implementation STUFetchBooksOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchBooksOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchBooksRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D2AC0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = objc_msgSend(v6, "isValidWithError:", a4);
LABEL_7:

  return v8;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUFetchBooksOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000078B4;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)runWithRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)CRKFetchBooksFromBooksServiceOperation), "initWithRequest:", v4);

  -[STUFetchBooksOperation setInternalOperation:](self, "setInternalOperation:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchBooksOperation internalOperation](self, "internalOperation"));
  objc_msgSend(v6, "addTarget:selector:forOperationEvents:", self, "fetchBooksOperationDidFinish:", 6);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchBooksOperation internalOperation](self, "internalOperation"));
  objc_msgSend(v8, "addOperation:", v7);

}

- (void)fetchBooksOperationDidFinish:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

    -[STUFetchBooksOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resultObject"));

    -[STUFetchBooksOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v6);
  }

}

- (CATOperation)internalOperation
{
  return self->_internalOperation;
}

- (void)setInternalOperation:(id)a3
{
  objc_storeStrong((id *)&self->_internalOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalOperation, 0);
}

@end
