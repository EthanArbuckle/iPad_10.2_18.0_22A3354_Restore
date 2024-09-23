@implementation BCExternalURLOpenPrompter

- (BOOL)_shouldShowPromptForURL:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v3 = a3;
  v4 = UIITunesStoreResolvedURLForHTTPURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lowercaseString"));

    if (!v8)
      goto LABEL_7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL supportediBooksInternalURLSchemes](NSURL, "supportediBooksInternalURLSchemes"));
    v10 = objc_msgSend(v9, "containsObject:", v8);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL supportediBooksStoreURLSchemes](NSURL, "supportediBooksStoreURLSchemes"));
    v11 = objc_msgSend(v6, "containsObject:", v8);

    v12 = objc_msgSend(v8, "isEqualToString:", CFSTR("prefs"));
    LOBYTE(v6) = 0;
    if ((v10 & 1) == 0 && (v11 & 1) == 0 && (v12 & 1) == 0)
LABEL_7:
      LODWORD(v6) = objc_msgSend(v3, "isStoreURL") ^ 1;

  }
  return (char)v6;
}

- (id)_formattedMessageStringForURL:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc((Class)NSMutableAttributedString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));

  v6 = objc_msgSend(v4, "initWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  objc_msgSend(v6, "addAttribute:value:range:", NSForegroundColorAttributeName, v7, 0, objc_msgSend(v6, "length"));

  return v6;
}

- (void)_askUserIfShouldOpenURL:(id)a3 promptContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter delegate](self, "delegate"));
  v12 = (void *)v11;
  if (v10 && v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter promptTitle](self, "promptTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, 0, 1));

    objc_msgSend(v14, "setModalPresentationStyle:", 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter promptMessage](self, "promptMessage"));
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter promptMessage](self, "promptMessage"));
      objc_msgSend(v14, "setMessage:", v17);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter _formattedMessageStringForURL:](self, "_formattedMessageStringForURL:", v8));
      objc_msgSend(v14, "_setAttributedMessage:", v17);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter cancelButtonTitle](self, "cancelButtonTitle"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_D3400;
    v25[3] = &unk_290D08;
    v19 = v10;
    v26 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 1, v25));
    objc_msgSend(v14, "addAction:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter okButtonTitle](self, "okButtonTitle"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_D3410;
    v23[3] = &unk_290D08;
    v24 = v19;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 0, v23));
    objc_msgSend(v14, "addAction:", v22);

    objc_msgSend(v12, "presentAlertController:promptContext:", v14, v9);
  }

}

- (BCExternalURLOpenPrompter)initWithContext:(id)a3
{
  id v5;
  BCExternalURLOpenPrompter *v6;
  BCExternalURLOpenPrompter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCExternalURLOpenPrompter;
  v6 = -[BCExternalURLOpenPrompter init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (BCExternalURLOpenPrompter)init
{
  BCExternalURLOpenPrompterContext *v3;
  BCExternalURLOpenPrompter *v4;

  v3 = objc_alloc_init(BCExternalURLOpenPrompterContext);
  v4 = -[BCExternalURLOpenPrompter initWithContext:](self, "initWithContext:", v3);

  return v4;
}

- (BUBlockCallThrottler)throttler
{
  BUBlockCallThrottler *throttler;
  BUBlockCallThrottler *v4;
  BUBlockCallThrottler *v5;

  throttler = self->_throttler;
  if (!throttler)
  {
    v4 = (BUBlockCallThrottler *)objc_alloc_init((Class)BUBlockCallThrottler);
    v5 = self->_throttler;
    self->_throttler = v4;

    throttler = self->_throttler;
  }
  return throttler;
}

- (id)responseCache
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "responseCache"));

  return v3;
}

- (id)dummyCacheValue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dummyCacheValue"));

  return v3;
}

- (BOOL)maybePromptUserBeforeOpeningExternalURL:(id)a3 shouldThrottle:(BOOL)a4 promptContext:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  id v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[BCExternalURLOpenPrompter _shouldShowPromptForURL:](self, "_shouldShowPromptForURL:", v10))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter responseCache](self, "responseCache"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v10));

    if (!v14)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_113A0C;
      v23[3] = &unk_2916B0;
      v23[4] = self;
      v24 = v10;
      v25 = v11;
      v26 = v13;
      v27 = v12;
      v19 = v13;
      v20 = objc_retainBlock(v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter throttler](self, "throttler"));
      v22 = v21;
      if (v8)
        objc_msgSend(v21, "runBlockThrottled:", v20);
      else
        objc_msgSend(v21, "runBlock:", v20);

      v17 = 0;
      goto LABEL_7;
    }

  }
  v15 = objc_retainBlock(v12);
  v16 = v15;
  if (v15)
    (*((void (**)(id, uint64_t))v15 + 2))(v15, 1);

  v17 = 1;
LABEL_7:

  return v17;
}

- (BOOL)cacheResponses
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter context](self, "context"));
  v3 = objc_msgSend(v2, "cacheResponses");

  return v3;
}

- (void)setCacheResponses:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BCExternalURLOpenPrompter context](self, "context"));
  objc_msgSend(v4, "setCacheResponses:", v3);

}

- (NSString)promptTitle
{
  return self->_promptTitle;
}

- (void)setPromptTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)promptMessage
{
  return self->_promptMessage;
}

- (void)setPromptMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)okButtonTitle
{
  return self->_okButtonTitle;
}

- (void)setOkButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BCExternalURLOpenPrompterDelegate)delegate
{
  return (BCExternalURLOpenPrompterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setThrottler:(id)a3
{
  objc_storeStrong((id *)&self->_throttler, a3);
}

- (BCExternalURLOpenPrompterContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_throttler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_okButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_promptMessage, 0);
  objc_storeStrong((id *)&self->_promptTitle, 0);
}

@end
