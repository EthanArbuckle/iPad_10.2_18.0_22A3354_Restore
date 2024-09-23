@implementation CRRIK

- (CRRIK)init
{
  CRRIK *v2;
  CRRIK *v3;
  CRRIK *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRRIK;
  v2 = -[CRRIK init](&v6, "init");
  v3 = v2;
  if (v2 && !-[CRRIK create](v2, "create"))
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (CRRIK)initWithKeyBlob:(id)a3
{
  id v4;
  CRRIK *v5;
  CRRIK *v6;
  CRRIK *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRRIK;
  v5 = -[CRRIK init](&v9, "init");
  v6 = v5;
  if (v5 && !-[CRRIK createWithKeyBlob:](v5, "createWithKeyBlob:", v4))
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (id)keyBlob
{
  aks_ref_key_s *v3;
  uint64_t v4;
  uint64_t v6;

  v3 = -[CRRIK rk](self, "rk");
  if (v3)
  {
    v6 = 0;
    v4 = sub_10000F1C0((uint64_t *)-[CRRIK rk](self, "rk"), &v6);
    v3 = 0;
    if (v4)
    {
      if (v6)
        v3 = (aks_ref_key_s *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:"));
    }
  }
  return v3;
}

- (id)pubKeyBlob
{
  aks_ref_key_s *v3;
  uint64_t v4;
  uint64_t v6;

  v3 = -[CRRIK rk](self, "rk");
  if (v3)
  {
    v6 = 0;
    v4 = sub_10000EFF0((uint64_t *)-[CRRIK rk](self, "rk"), &v6);
    v3 = 0;
    if (v4)
    {
      if (v6)
        v3 = (aks_ref_key_s *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:"));
    }
  }
  return v3;
}

- (id)attestationBlob
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  NSObject *v8;
  size_t v9;
  void *v10;

  if (!-[CRRIK rk](self, "rk"))
    return 0;
  v9 = 0;
  v10 = 0;
  if (!sub_10000F1CC((uint64_t)-[CRRIK rk](self, "rk"), 0, 0, &v10, &v9) && v10 && v9)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:"));
    v4 = v10;
    v5 = (void *)v3;
    if (!v10)
      return v5;
  }
  else
  {
    v7 = handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10003665C();

    v3 = 0;
    v5 = 0;
    v4 = v10;
    if (!v10)
      return v5;
  }
  free(v4);
  v5 = (void *)v3;
  return v5;
}

- (id)sign:(id)a3
{
  id v4;
  aks_ref_key_s *v5;
  void *v6;
  aks_ref_key_s *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  size_t v23;
  void *v24;

  v4 = a3;
  v5 = -[CRRIK rk](self, "rk");
  v6 = 0;
  if (v4 && v5)
  {
    v23 = 0;
    v24 = 0;
    v22 = 0;
    v7 = -[CRRIK rk](self, "rk");
    v8 = objc_retainAutorelease(v4);
    if (!sub_10000EC0C((uint64_t)v7, 0, 0, (uint64_t)objc_msgSend(v8, "bytes"), (uint64_t)objc_msgSend(v8, "length"), &v24, &v23)&& v24&& v23)
    {
      v9 = ccder_decode_tl(4, &v22, v24, (char *)v24 + v23);
      if (v9 && v22)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v9));
        if (v24)
          free(v24);
LABEL_19:
        v24 = 0;
        goto LABEL_20;
      }
      v12 = handleForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10003671C(v13, v14, v15, v16, v17, v18, v19, v20);

    }
    else
    {
      v10 = handleForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1000366BC();

    }
    if (v24)
      free(v24);
    v6 = 0;
    goto LABEL_19;
  }
LABEL_20:

  return v6;
}

- (BOOL)verify:(id)a3 signature:(id)a4
{
  id v6;
  id v7;
  aks_ref_key_s *v8;
  BOOL v9;
  aks_ref_key_s *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;

  v6 = a3;
  v7 = a4;
  v8 = -[CRRIK rk](self, "rk");
  v9 = 0;
  if (v7 && v6 && v8)
  {
    v10 = -[CRRIK rk](self, "rk");
    v11 = objc_retainAutorelease(v6);
    v12 = objc_msgSend(v11, "bytes");
    v13 = objc_msgSend(v11, "length");
    v14 = objc_retainAutorelease(v7);
    if (sub_10000ED8C((uint64_t *)v10, 0, 0, (uint64_t)v12, (uint64_t)v13, (uint64_t)objc_msgSend(v14, "bytes"), (uint64_t)objc_msgSend(v14, "length")))
    {
      v15 = handleForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10003674C();

      v9 = 0;
    }
    else
    {
      v9 = 1;
    }
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[CRRIK purge](self, "purge");
  v3.receiver = self;
  v3.super_class = (Class)CRRIK;
  -[CRRIK dealloc](&v3, "dealloc");
}

- (BOOL)create
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  void **v6;
  void **v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t v32[8];
  uint64_t v33;
  void *v34;
  void **v35;
  uint64_t v36;
  aks_ref_key_s *v37;

  v36 = 1;
  v37 = 0;
  v34 = 0;
  v35 = 0;
  v33 = 0;
  v3 = (void *)MGCopyAnswer(CFSTR("HasPKA"), 0);
  if (!v3 || (v4 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v3, v4) & 1) == 0))
  {
    v10 = handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000367AC(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_12;
  }
  if (objc_msgSend(v3, "BOOLValue"))
    v5 = 5;
  else
    v5 = 4;
  v6 = (void **)sub_10000E204(0, 0);
  v35 = v6;
  if (!v6)
  {
    v21 = handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000367DC(v11, v22, v23, v24, v25, v26, v27, v28);
LABEL_12:

    v19 = 0;
    goto LABEL_13;
  }
  v7 = v6;
  if (sub_10000E404(v6, 9, &v36))
  {
    v8 = handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000368CC();
  }
  else if (sub_10000E478(v7, &v34, (size_t *)&v33))
  {
    v29 = handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10003686C();
  }
  else
  {
    if (!sub_10000E4D8(-1, 13, v5, (uint64_t)v34, v33, (void ***)&v37))
    {
      self->_rk = v37;
      v37 = 0;
      v31 = handleForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "RIK created successfully", v32, 2u);
      }
      v19 = 1;
      goto LABEL_27;
    }
    v30 = handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10003680C();
  }
  v19 = 0;
LABEL_27:

  sub_10000E47C(&v35);
LABEL_13:
  if (v34)
    free(v34);
  if (v37)
    sub_10000E704((uint64_t *)&v37);

  return v19;
}

- (BOOL)createWithKeyBlob:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t v13[8];
  aks_ref_key_s *v14;

  v4 = a3;
  v5 = v4;
  v14 = 0;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = sub_10000E7B4(-1, objc_msgSend(v6, "bytes"), (size_t)objc_msgSend(v6, "length"), (uint64_t *)&v14);
    v8 = v7 == 0;
    if (v7)
    {
      v9 = handleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10003692C();
    }
    else
    {
      self->_rk = v14;
      v14 = 0;
      v11 = handleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "RIK created successfully", v13, 2u);
      }
    }

    if (v14)
      sub_10000E704((uint64_t *)&v14);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)purge
{
  if (-[CRRIK rk](self, "rk"))
  {
    sub_10000E704((uint64_t *)&self->_rk);
    -[CRRIK setRk:](self, "setRk:", 0);
  }
}

- (aks_ref_key_s)rk
{
  return self->_rk;
}

- (void)setRk:(aks_ref_key_s *)a3
{
  self->_rk = a3;
}

@end
