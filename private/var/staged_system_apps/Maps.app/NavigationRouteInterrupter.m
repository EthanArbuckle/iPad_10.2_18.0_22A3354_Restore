@implementation NavigationRouteInterrupter

- (NavigationRouteInterrupter)initWithSuggestionsEngine:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  NavigationRouteInterrupter *v9;
  NavigationRouteInterrupter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NavigationRouteInterrupter;
  v9 = -[NavigationRouteInterrupter init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestionsEngine, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)interruptHistoryEntryRoute:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(_QWORD);
  id v17;
  id v18;
  id location;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = sub_100431C0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteInterrupter suggestionsEngine](self, "suggestionsEngine"));
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "NavigationRouteInterrupter: Will interrupt route with history entry: %@, hinting refresh on engine: %@.", buf, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteInterrupter suggestionsEngine](self, "suggestionsEngine"));
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v6);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1008EA1E4;
    v14[3] = &unk_1011DB5D8;
    objc_copyWeak(&v17, (id *)buf);
    objc_copyWeak(&v18, &location);
    v16 = v7;
    v13 = v12;
    v15 = v13;
    objc_msgSend(v6, "setNavigationInterrupted:completion:", 1, v14);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "NavigationRouteInterrupter: Failed to interrupt route because history entry was nil.", buf, 2u);
    }

    if (v7)
      v7[2](v7);
  }

}

- (void)cancelInterruptionOnHistoryEntryRoute:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(_QWORD);
  id v20;
  id v21;
  id location;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    v8 = objc_msgSend(v6, "isNavigationInterrupted");
    v9 = sub_100431C0C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if ((v8 & 1) != 0)
    {
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteInterrupter suggestionsEngine](self, "suggestionsEngine"));
        *(_DWORD *)buf = 138412546;
        v24 = v6;
        v25 = 2112;
        v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "NavigationRouteInterrupter: Will cancel route interruption on history entry: %@, hinting refresh on engine: %@.", buf, 0x16u);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteInterrupter suggestionsEngine](self, "suggestionsEngine"));
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v6);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1008EA790;
      v17[3] = &unk_1011DB5D8;
      objc_copyWeak(&v20, (id *)buf);
      objc_copyWeak(&v21, &location);
      v19 = v7;
      v14 = v13;
      v18 = v14;
      objc_msgSend(v6, "setNavigationInterrupted:completion:", 0, v17);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

      goto LABEL_14;
    }
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "NavigationRouteInterrupter: Skipping interruption because the route isn't paused.", buf, 2u);
    }

    if (v7)
LABEL_13:
      v7[2](v7);
  }
  else
  {
    v15 = sub_100431C0C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "NavigationRouteInterrupter: Failed to cancel interruption because history entry was nil.", buf, 2u);
    }

    if (v7)
      goto LABEL_13;
  }
LABEL_14:

}

- (NavigationRouteInterruptingDelegate)delegate
{
  return (NavigationRouteInterruptingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MapsSuggestionsEngine)suggestionsEngine
{
  return self->_suggestionsEngine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsEngine, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
