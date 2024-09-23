@implementation CRLDocumentModelEnumerator

- (CRLDocumentModelEnumerator)initWithRootModelObject:(id)a3 filter:(id)a4
{
  return -[CRLDocumentModelEnumerator initWithRootModelObject:flags:filter:](self, "initWithRootModelObject:flags:filter:", a3, 0, a4);
}

- (CRLDocumentModelEnumerator)initWithRootModelObject:(id)a3 flags:(unint64_t)a4 filter:(id)a5
{
  id v9;
  id v10;
  CRLDocumentModelEnumerator *v11;
  CRLDocumentModelEnumerator *v12;
  id v13;
  id filter;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CRLDocumentModelEnumerator;
  v11 = -[CRLDocumentModelEnumerator init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_root, a3);
    v13 = objc_retainBlock(v10);
    filter = v12->_filter;
    v12->_filter = v13;

    v12->_flags = a4;
  }

  return v12;
}

- (CRLDocumentModelEnumerator)initWithEnumerator:(id)a3 filter:(id)a4
{
  return -[CRLDocumentModelEnumerator initWithEnumerator:flags:filter:](self, "initWithEnumerator:flags:filter:", a3, 0, a4);
}

- (CRLDocumentModelEnumerator)initWithEnumerator:(id)a3 flags:(unint64_t)a4 filter:(id)a5
{
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  CRLDocumentModelEnumerator *v15;
  uint64_t v16;
  NSMutableArray *enumeratorStack;
  id v18;
  id filter;
  objc_super v21;

  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012450A0);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0D540(v10, v11);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012450C0);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDocumentModelEnumerator initWithEnumerator:flags:filter:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDocumentModelEnumerator.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 67, 0, "invalid nil value for '%{public}s'", "enumerator");

  }
  v21.receiver = self;
  v21.super_class = (Class)CRLDocumentModelEnumerator;
  v15 = -[CRLDocumentModelEnumerator init](&v21, "init");
  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v8));
    enumeratorStack = v15->_enumeratorStack;
    v15->_enumeratorStack = (NSMutableArray *)v16;

    v18 = objc_retainBlock(v9);
    filter = v15->_filter;
    v15->_filter = v18;

    v15->_flags = a4;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CRLDocumentModelEnumerator;
  -[CRLDocumentModelEnumerator dealloc](&v2, "dealloc");
}

- (BOOL)isEnumeratingForUserSearch
{
  return self->_flags & 1;
}

- (id)nextObject
{
  unsigned int (**v2)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *i;
  _BOOL4 stop;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t (**v23)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v24;
  void *v25;
  void *v26;
  char v28;
  char v29;

  if (!self->_enumeratorStack)
  {
    v29 = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator filter](self, "filter"));
    if (!v6
      || (v2 = (unsigned int (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator filter](self, "filter")), v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator root](self, "root")), ((unsigned int (**)(_QWORD, void *, BOOL *, char *))v2)[2](v2, v3, &self->_stop, &v29)))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator root](self, "root"));
      if (!v6)
        goto LABEL_8;
    }
    else
    {
      v5 = 0;
    }

LABEL_8:
    if (v29)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator root](self, "root"));
      v8 = objc_opt_respondsToSelector(v7, "childEnumeratorForUserFlags:");

      if ((v8 & 1) != 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator root](self, "root"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childEnumeratorForUserFlags:", self->_flags));
      }
      else if (-[CRLDocumentModelEnumerator isEnumeratingForUserSearch](self, "isEnumeratingForUserSearch")
             && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator root](self, "root")),
                 v12 = objc_opt_respondsToSelector(v11, "childEnumeratorForUserSearch"),
                 v11,
                 (v12 & 1) != 0))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator root](self, "root"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childEnumeratorForUserSearch"));
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator root](self, "root"));
        v14 = objc_opt_respondsToSelector(v13, "childEnumerator");

        if ((v14 & 1) == 0)
          goto LABEL_17;
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator root](self, "root"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childEnumerator"));
      }
      v15 = (void *)v10;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v10));

      if (v16)
      {
LABEL_18:
        -[CRLDocumentModelEnumerator setEnumeratorStack:](self, "setEnumeratorStack:", v16);

        goto LABEL_19;
      }
    }
LABEL_17:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    goto LABEL_18;
  }
  v5 = 0;
LABEL_19:
  for (i = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator enumeratorStack](self, "enumeratorStack"));
        objc_msgSend(i, "count") && !v5;
        i = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator enumeratorStack](self, "enumeratorStack")))
  {
    stop = self->_stop;

    if (stop)
    {
      v5 = 0;
      return v5;
    }
    v28 = 1;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator enumeratorStack](self, "enumeratorStack"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "nextObject"));

    if (!v5)
    {
      v21 = (id)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator enumeratorStack](self, "enumeratorStack"));
      objc_msgSend(v21, "removeLastObject");
      goto LABEL_38;
    }
    v21 = v5;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator filter](self, "filter"));
    v5 = v21;
    if (v22)
    {
      v23 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator filter](self, "filter"));
      v5 = v21;
      if ((((uint64_t (**)(_QWORD, id, BOOL *, char *))v23)[2](v23, v21, &self->_stop, &v28) & 1) == 0)
      {

        v5 = 0;
      }

    }
    if (!v28)
      goto LABEL_38;
    if ((objc_opt_respondsToSelector(v21, "childEnumeratorForUserFlags:") & 1) != 0)
    {
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "childEnumeratorForUserFlags:", self->_flags));
    }
    else if (-[CRLDocumentModelEnumerator isEnumeratingForUserSearch](self, "isEnumeratingForUserSearch")
           && (objc_opt_respondsToSelector(v21, "childEnumeratorForUserSearch") & 1) != 0)
    {
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "childEnumeratorForUserSearch"));
    }
    else
    {
      if ((objc_opt_respondsToSelector(v21, "childEnumerator") & 1) == 0)
      {
        v25 = 0;
        goto LABEL_37;
      }
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "childEnumerator"));
    }
    v25 = (void *)v24;
LABEL_37:
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator enumeratorStack](self, "enumeratorStack"));
    objc_msgSend(v26, "crl_addNonNilObject:", v25);

LABEL_38:
  }

  return v5;
}

- (void)enumerateUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  v8 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator nextObject](self, "nextObject"));
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v7 = v6;
      v4[2](v4, v6, &v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDocumentModelEnumerator nextObject](self, "nextObject"));

    }
    while (v6 && !v8);

  }
}

- (void)addFilter:(id)a3
{
  id v4;
  id filter;
  id v6;
  _QWORD *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  filter = self->_filter;
  if (filter)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100211160;
    v11[3] = &unk_1012450E8;
    v12 = objc_retainBlock(filter);
    v13 = v4;
    v6 = v12;
    v7 = objc_retainBlock(v11);
    v8 = self->_filter;
    self->_filter = v7;

  }
  else
  {
    v9 = objc_retainBlock(v4);
    v10 = self->_filter;
    self->_filter = v9;

  }
}

- (CRLModel)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
  objc_storeStrong((id *)&self->_root, a3);
}

- (NSMutableArray)enumeratorStack
{
  return self->_enumeratorStack;
}

- (void)setEnumeratorStack:(id)a3
{
  objc_storeStrong((id *)&self->_enumeratorStack, a3);
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_enumeratorStack, 0);
  objc_storeStrong((id *)&self->_root, 0);
}

@end
