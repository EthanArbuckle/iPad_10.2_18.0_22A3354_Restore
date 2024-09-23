@implementation MusicTermsSendByEmailOperation

- (MusicTermsSendByEmailOperation)initWithEmailAddress:(id)a3
{
  id v4;
  MusicTermsSendByEmailOperation *v5;
  NSString *v6;
  NSString *emailAddress;

  v4 = a3;
  v5 = -[MusicTermsSendByEmailOperation init](self, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = v6;

  }
  return v5;
}

- (void)main
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  if (-[MusicTermsSendByEmailOperation isCancelled](self, "isCancelled"))
  {
    v3 = SSError(SSErrorDomain, 140, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)v17[5];
    v17[5] = v4;
LABEL_11:

    goto LABEL_12;
  }
  if (-[NSString length](self->_emailAddress, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicTermsSendByEmailOperation URLBagDictionary](self, "URLBagDictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("email-terms")));
    if ((_NSIsNSString() & 1) != 0)
    {
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
        v8 = v7;
        if (v7)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingQueryParameter:value:", CFSTR("e"), self->_emailAddress));
          v10 = objc_msgSend(objc_alloc((Class)NSMutableURLRequest), "initWithURL:", v9);
          objc_msgSend(v10, "setHTTPMethod:", CFSTR("GET"));
          v11 = -[MusicTermsSendByEmailOperation newLoadURLOperationWithRequest:](self, "newLoadURLOperationWithRequest:", v10);
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = __38__MusicTermsSendByEmailOperation_main__block_invoke;
          v15[3] = &unk_1339A88;
          v15[4] = &v16;
          objc_msgSend(v11, "setOutputBlock:", v15);
          -[MusicTermsSendByEmailOperation runChildOperation:](self, "runChildOperation:", v11);

LABEL_10:
          goto LABEL_11;
        }
      }
    }
    else
    {

      v6 = 0;
    }
    v12 = SSError(SSErrorDomain, 124, 0, 0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v8 = (void *)v17[5];
    v17[5] = v13;
    goto LABEL_10;
  }
LABEL_12:
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __38__MusicTermsSendByEmailOperation_main__block_invoke_2;
  v14[3] = &unk_1339AB0;
  v14[4] = self;
  v14[5] = &v16;
  -[MusicTermsSendByEmailOperation dispatchAsync:](self, "dispatchAsync:", v14);
  _Block_object_dispose(&v16, 8);

}

void __38__MusicTermsSendByEmailOperation_main__block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

void __38__MusicTermsSendByEmailOperation_main__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (id)error
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __39__MusicTermsSendByEmailOperation_error__block_invoke;
  v4[3] = &unk_1339AD8;
  v4[4] = self;
  v4[5] = &v5;
  -[MusicTermsSendByEmailOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __39__MusicTermsSendByEmailOperation_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
