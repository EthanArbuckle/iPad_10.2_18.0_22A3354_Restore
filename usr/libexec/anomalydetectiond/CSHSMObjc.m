@implementation CSHSMObjc

- (BOOL)isIn:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_retainBlock(self->_state);
  if (v5)
  {
    while (v5 != v4)
    {
      v6 = (*((uint64_t (**)(id, uint64_t, _QWORD, _QWORD))v5 + 2))(v5, 2, 0, 0);
      v7 = objc_claimAutoreleasedReturnValue(v6);

      v5 = (id)v7;
      if (!v7)
        goto LABEL_6;
    }

    LOBYTE(v5) = 1;
  }
LABEL_6:

  return (char)v5;
}

- (CSHSMObjc)initWithCategory:(id)a3 state:(id)a4
{
  id v7;
  id v8;
  CSHSMObjc *v9;
  CSHSMObjc *v10;
  id v11;
  id v12;
  id state;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CSHSMObjc;
  v9 = -[CSHSMObjc init](&v21, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    v11 = objc_retainBlock(v8);
    if (v11)
    {
      do
      {
        v12 = objc_retainBlock(v11);
        state = v10->_state;
        v10->_state = v12;

        v14 = v10->_category;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (*((uint64_t (**)(void))v10->_state + 2))();
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          *(_DWORD *)buf = 138412290;
          v23 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "initial, enter(%@)", buf, 0xCu);

        }
        v17 = (id)(*((uint64_t (**)(void))v10->_state + 2))();
        v18 = (*((uint64_t (**)(id, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, 0, 0, 0);
        v19 = objc_claimAutoreleasedReturnValue(v18);

        v11 = (id)v19;
      }
      while (v19);
    }
  }

  return v10;
}

- (void)signal:(unint64_t)a3 data:(const void *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *i;
  uint64_t v32;
  OS_os_log *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t (**v39)(_QWORD, _QWORD, _QWORD, _QWORD);
  OS_os_log *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  id state;
  id v46;
  id v47;
  void *v48;
  uint64_t (**v49)(_QWORD, _QWORD, _QWORD, _QWORD);
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  unint64_t v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];

  v7 = objc_retainBlock(self->_state);
  if (v7)
  {
    while (1)
    {
      v49 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))v7;
      v8 = (*((uint64_t (**)(id, uint64_t, unint64_t, _QWORD))v7 + 2))(v7, 3, a3, 0);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)v9;
      if (v9)
        break;
      v11 = v49[2](v49, 2, 0, 0);
      v12 = objc_claimAutoreleasedReturnValue(v11);

      v7 = (id)v12;
      if (!v12)
        return;
    }
    v13 = v49;
    if ((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))v9 == v49)
    {
      v46 = (id)((uint64_t (**)(_QWORD, uint64_t, unint64_t, const void *))v49)[2](v49, 5, a3, a4);
    }
    else
    {
      v47 = (id)v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v14));
      v15 = objc_retainBlock(self->_state);
      if (v15)
      {
        v16 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))v15;
        do
        {
          v17 = objc_retainBlock(v16);
          objc_msgSend(v14, "addObject:", v17);

          v18 = v16[2](v16, 2, 0, 0);
          v19 = objc_claimAutoreleasedReturnValue(v18);

          v16 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))v19;
        }
        while (v19);
      }
      v20 = objc_retainBlock(v10);
      if (v20)
      {
        v21 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))v20;
        do
        {
          v22 = objc_retainBlock(v21);
          objc_msgSend(v48, "addObject:", v22);

          v23 = v21[2](v21, 2, 0, 0);
          v24 = objc_claimAutoreleasedReturnValue(v23);

          v21 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))v24;
        }
        while (v24);
      }
      while (1)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
        if (!v28)
          break;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "lastObject"));

        if (!v25)
          break;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "lastObject"));

        if (v26 != v27)
          break;
        objc_msgSend(v14, "removeLastObject");
        objc_msgSend(v48, "removeLastObject");
      }
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      obj = v14;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(_QWORD *)v52 != v30)
              objc_enumerationMutation(obj);
            v32 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
            v33 = self->_category;
            if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_INFO))
            {
              v34 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v32 + 16))(v32, 1, 0, 0);
              v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
              *(_DWORD *)buf = 134218242;
              v56 = a3;
              v57 = 2112;
              v58 = v35;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v33, OS_LOG_TYPE_INFO, "event %llu, exit(%@)", buf, 0x16u);

            }
            v36 = (id)(*(uint64_t (**)(uint64_t, uint64_t, unint64_t, const void *))(v32 + 16))(v32, 6, a3, a4);
          }
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        }
        while (v29);
      }

      v37 = (id)((uint64_t (**)(_QWORD, uint64_t, unint64_t, const void *))v49)[2](v49, 5, a3, a4);
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "reverseObjectEnumerator"));
      while (1)
      {
        v39 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "nextObject"));
        if (!v39)
          break;
        v40 = self->_category;
        if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_INFO))
        {
          v41 = v39[2](v39, 1, 0, 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          *(_DWORD *)buf = 134218242;
          v56 = a3;
          v57 = 2112;
          v58 = v42;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v40, OS_LOG_TYPE_INFO, "event %llu, enter(%@)", buf, 0x16u);

        }
        v43 = (id)((uint64_t (**)(_QWORD, uint64_t, unint64_t, const void *))v39)[2](v39, 4, a3, a4);

      }
      v44 = objc_retainBlock(v47);
      state = self->_state;
      self->_state = v44;

      v13 = v47;
    }

  }
}

- (id)state
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (OS_os_log)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong(&self->_state, 0);
}

@end
