@implementation UMAppleKeyStoreProvider

- (BOOL)bootstrapVolumeWithMountPoint:(id)a3 user:(unsigned int)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  char v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;

  v7 = a3;
  if (a5)
    *a5 = 0;
  if (-[UMAppleKeyStoreProvider ignoreIdentityMethods](self, "ignoreIdentityMethods"))
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v8 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = sub_249998C68();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        v10 = v9;
      else
        v10 = v9 & 0xFFFFFFFE;
      if (v10)
      {
        v11 = _os_log_send_and_compose_impl();
        v12 = (void *)v11;
        if (v11)
          sub_249998C90(v11);
      }
      else
      {
        v12 = 0;
      }
      free(v12);
    }

    v13 = 1;
  }
  else
  {
    v13 = AKSVolumeBootstrapFS();
    if ((v13 & 1) == 0)
    {
      if (qword_2544B43E0 != -1)
        dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
      v14 = (id)qword_2544B43D0;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = sub_249998C68();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          v16 = v15;
        else
          v16 = v15 & 0xFFFFFFFE;
        if (v16)
        {
          v17 = _os_log_send_and_compose_impl();
          v18 = (void *)v17;
          if (v17)
            sub_249998C90(v17);
        }
        else
        {
          v18 = 0;
        }
        free(v18);
      }

      if (a5)
        *a5 = objc_retainAutorelease(0);
      CFRelease(0);
    }
  }

  return v13;
}

- (id)dataWrappingDataWithDeviceClassF:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  int v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v24;
  uint64_t v25;
  _DWORD v26[4];
  _OWORD v27[20];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a4)
    *a4 = 0;
  if ((unint64_t)objc_msgSend(v5, "length") >= 0x21)
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v7 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = sub_249998C68();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        v8 &= ~1u;
      if (v8)
      {
        v9 = v7;
        LODWORD(v27[0]) = 134217984;
        *(_QWORD *)((char *)v27 + 4) = objc_msgSend(v6, "length");
        LODWORD(v25) = 12;
        v24 = v27;
        v10 = (void *)_os_log_send_and_compose_impl();

        if (v10)
          sub_249998C90((uint64_t)v10);
      }
      else
      {
        v10 = 0;
      }
      free(v10);
    }

    if (a4)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v21 = *MEMORY[0x24BDD1128];
      v22 = 22;
LABEL_31:
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, 0, v24, v25);
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  memset(v27, 0, sizeof(v27));
  v11 = objc_retainAutorelease(v6);
  objc_msgSend(v11, "bytes");
  objc_msgSend(v11, "length");
  v12 = aks_wrap_key();
  if (v12)
  {
    v13 = v12;
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v14 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = sub_249998C68();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        v16 = v15;
      else
        v16 = v15 & 0xFFFFFFFE;
      if (v16)
      {
        v26[0] = 67109120;
        v26[1] = v13;
        LODWORD(v25) = 8;
        v24 = v26;
        v17 = _os_log_send_and_compose_impl();
        v18 = (void *)v17;
        if (v17)
          sub_249998C90(v17);
      }
      else
      {
        v18 = 0;
      }
      free(v18);
    }

    if (a4)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v21 = *MEMORY[0x24BDD1010];
      v22 = v13;
      goto LABEL_31;
    }
LABEL_32:
    v19 = 0;
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v27, 40);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v19;
}

- (id)dataUnwrappingDataWithDeviceClassF:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  int v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD *v26;
  uint64_t v27;
  _DWORD v28[4];
  _OWORD v29[16];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a4)
    *a4 = 0;
  if ((unint64_t)objc_msgSend(v5, "length") >= 0x29)
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v7 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = sub_249998C68();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        v8 &= ~1u;
      if (v8)
      {
        v9 = v7;
        LODWORD(v29[0]) = 134217984;
        *(_QWORD *)((char *)v29 + 4) = objc_msgSend(v6, "length");
        LODWORD(v27) = 12;
        v26 = v29;
        v10 = (void *)_os_log_send_and_compose_impl();

        if (v10)
          sub_249998C90((uint64_t)v10);
      }
      else
      {
        v10 = 0;
      }
      free(v10);
    }

    if (a4)
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD1128];
      v24 = 22;
LABEL_41:
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, v24, 0, v26, v27);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  memset(v29, 0, sizeof(v29));
  v11 = objc_retainAutorelease(v6);
  objc_msgSend(v11, "bytes");
  objc_msgSend(v11, "length");
  v12 = aks_unwrap_key();
  if (v12)
  {
    v13 = v12;
    if (v12 == -536362989)
    {
      if (qword_2544B43E0 != -1)
        dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
      v14 = (id)qword_2544B43D0;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = sub_249998C68();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          v16 = v15;
        else
          v16 = v15 & 0xFFFFFFFE;
        if (v16)
        {
          LOWORD(v28[0]) = 0;
          LODWORD(v27) = 2;
          v26 = v28;
          goto LABEL_31;
        }
        goto LABEL_37;
      }
    }
    else
    {
      if (qword_2544B43E0 != -1)
        dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
      v14 = (id)qword_2544B43D0;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v18 = sub_249998C68();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          v19 = v18;
        else
          v19 = v18 & 0xFFFFFFFE;
        if (v19)
        {
          v28[0] = 67109120;
          v28[1] = v13;
          LODWORD(v27) = 8;
          v26 = v28;
LABEL_31:
          v20 = _os_log_send_and_compose_impl();
          v21 = (void *)v20;
          if (v20)
            sub_249998C90(v20);
          goto LABEL_38;
        }
LABEL_37:
        v21 = 0;
LABEL_38:
        free(v21);
      }
    }

    if (a4)
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD1010];
      v24 = v13;
      goto LABEL_41;
    }
LABEL_42:
    v17 = 0;
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v29, 32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:

  return v17;
}

- (BOOL)createIdentityWithUUID:(id)a3 passcode:(id)a4 existingSession:(unsigned int)a5 existingSessionPasscode:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  CFUUIDRef v14;
  char v15;
  NSObject *v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;

  v11 = a3;
  if (a7)
    *a7 = 0;
  v12 = a6;
  v13 = a4;
  v14 = sub_249994C3C(v11);
  sub_2499921BC(self, v13);

  sub_2499921BC(self, v12);
  v15 = AKSIdentityCreate();
  if ((v15 & 1) != 0)
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v16 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = sub_249998C68();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        v18 = v17;
      else
        v18 = v17 & 0xFFFFFFFE;
      if (v18)
      {
        v19 = _os_log_send_and_compose_impl();
        v20 = (void *)v19;
        if (v19)
          sub_249998C90(v19);
      }
      else
      {
        v20 = 0;
      }
      free(v20);
    }

  }
  else
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v21 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = sub_249998C68();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        v23 = v22;
      else
        v23 = v22 & 0xFFFFFFFE;
      if (v23)
      {
        v24 = _os_log_send_and_compose_impl();
        v25 = (void *)v24;
        if (v24)
          sub_249998C90(v24);
      }
      else
      {
        v25 = 0;
      }
      free(v25);
    }

    if (a7)
      *a7 = 0;
    else
      CFRelease(0);
  }
  CFRelease(v14);

  return v15;
}

- (BOOL)deleteIdentity:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  CFUUIDRef v7;
  char v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;

  v5 = a3;
  v6 = v5;
  if (a4)
    *a4 = 0;
  v7 = sub_249994C3C(v5);
  v8 = AKSIdentityDelete();
  if ((v8 & 1) != 0)
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v9 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = sub_249998C68();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        v11 = v10;
      else
        v11 = v10 & 0xFFFFFFFE;
      if (v11)
      {
        v12 = _os_log_send_and_compose_impl();
        v13 = (void *)v12;
        if (v12)
          sub_249998C90(v12);
      }
      else
      {
        v13 = 0;
      }
      free(v13);
    }

  }
  else
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v14 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = sub_249998C68();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        v16 = v15;
      else
        v16 = v15 & 0xFFFFFFFE;
      if (v16)
      {
        v17 = _os_log_send_and_compose_impl();
        v18 = (void *)v17;
        if (v17)
          sub_249998C90(v17);
      }
      else
      {
        v18 = 0;
      }
      free(v18);
    }

    if (a4)
      *a4 = 0;
    else
      CFRelease(0);
  }
  CFRelease(v7);

  return v8;
}

- (BOOL)isIdentityLoadedIntoSession:(unsigned int)a3
{
  int system;
  int v4;
  NSObject *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;

  system = aks_get_system();
  v4 = system;
  if (system)
  {
    if (system == -536870160)
    {
      if (qword_2544B43E0 != -1)
        dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
      v5 = (id)qword_2544B43D0;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = sub_249998C68();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          v7 = v6;
        else
          v7 = v6 & 0xFFFFFFFE;
        if (v7)
        {
LABEL_26:
          v12 = _os_log_send_and_compose_impl();
          v13 = (void *)v12;
          if (v12)
            sub_249998C90(v12);
          goto LABEL_29;
        }
LABEL_28:
        v13 = 0;
LABEL_29:
        free(v13);
      }
    }
    else
    {
      if (qword_2544B43E0 != -1)
        dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
      v5 = (id)qword_2544B43D0;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v10 = sub_249998C68();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          v11 = v10;
        else
          v11 = v10 & 0xFFFFFFFE;
        if (v11)
          goto LABEL_26;
        goto LABEL_28;
      }
    }
  }
  else
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v5 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = sub_249998C68();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if (v9)
        goto LABEL_26;
      goto LABEL_28;
    }
  }

  return v4 == 0;
}

- (BOOL)loadIdentity:(id)a3 intoSession:(unsigned int)a4 error:(id *)a5
{
  id v6;
  void *v7;
  CFUUIDRef v8;
  char v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;

  v6 = a3;
  v7 = v6;
  if (a5)
    *a5 = 0;
  v8 = sub_249994C3C(v6);
  v9 = AKSIdentityLoad();
  if ((v9 & 1) != 0)
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v10 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = sub_249998C68();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v12 = v11;
      else
        v12 = v11 & 0xFFFFFFFE;
      if (v12)
      {
        v13 = _os_log_send_and_compose_impl();
        v14 = (void *)v13;
        if (v13)
          sub_249998C90(v13);
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }

  }
  else
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v15 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = sub_249998C68();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if (v17)
      {
        v18 = _os_log_send_and_compose_impl();
        v19 = (void *)v18;
        if (v18)
          sub_249998C90(v18);
      }
      else
      {
        v19 = 0;
      }
      free(v19);
    }

    if (a5)
      *a5 = 0;
    else
      CFRelease(0);
  }
  CFRelease(v8);

  return v9;
}

- (BOOL)unloadIdentityFromSession:(unsigned int)a3 error:(id *)a4
{
  char v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;

  if (a4)
    *a4 = 0;
  v5 = AKSIdentityUnload();
  if ((v5 & 1) != 0)
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v6 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = sub_249998C68();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        v8 = v7;
      else
        v8 = v7 & 0xFFFFFFFE;
      if (v8)
      {
        v9 = _os_log_send_and_compose_impl();
        v10 = (void *)v9;
        if (v9)
          sub_249998C90(v9);
      }
      else
      {
        v10 = 0;
      }
      free(v10);
    }

  }
  else
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v11 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = sub_249998C68();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        v13 = v12;
      else
        v13 = v12 & 0xFFFFFFFE;
      if (v13)
      {
        v14 = _os_log_send_and_compose_impl();
        v15 = (void *)v14;
        if (v14)
          sub_249998C90(v14);
      }
      else
      {
        v15 = 0;
      }
      free(v15);
    }

    if (a4)
      *a4 = 0;
    else
      CFRelease(0);
  }
  return v5;
}

- (BOOL)unlockIdentityInSession:(unsigned int)a3 passcode:(id)a4 error:(id *)a5
{
  id v6;
  int v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;

  if (a5)
    *a5 = 0;
  sub_2499921BC(self, a4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "bytes");
  objc_msgSend(v6, "length");
  v7 = aks_unlock_device();
  if (v7)
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v8 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = sub_249998C68();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        v10 = v9;
      else
        v10 = v9 & 0xFFFFFFFE;
      if (v10)
      {
        v11 = _os_log_send_and_compose_impl();
        v12 = (void *)v11;
        if (v11)
          sub_249998C90(v11);
      }
      else
      {
        v12 = 0;
      }
      free(v12);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v7, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v13 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = sub_249998C68();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if (v15)
      {
        v16 = _os_log_send_and_compose_impl();
        v17 = (void *)v16;
        if (v16)
          sub_249998C90(v16);
      }
      else
      {
        v17 = 0;
      }
      free(v17);
    }

  }
  return v7 == 0;
}

- (BOOL)loginIdentity:(id)a3 intoSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  CFUUIDRef v11;
  char v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;

  v9 = a3;
  if (a6)
    *a6 = 0;
  v10 = a5;
  v11 = sub_249994C3C(v9);
  sub_2499921BC(self, v10);

  v12 = AKSIdentityLogin();
  if ((v12 & 1) != 0)
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v13 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = sub_249998C68();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if (v15)
      {
        v16 = _os_log_send_and_compose_impl();
        v17 = (void *)v16;
        if (v16)
          sub_249998C90(v16);
      }
      else
      {
        v17 = 0;
      }
      free(v17);
    }

  }
  else
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v18 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_249998C68();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        v20 = v19;
      else
        v20 = v19 & 0xFFFFFFFE;
      if (v20)
      {
        v21 = _os_log_send_and_compose_impl();
        v22 = (void *)v21;
        if (v21)
          sub_249998C90(v21);
      }
      else
      {
        v22 = 0;
      }
      free(v22);
    }

    if (a6)
      *a6 = 0;
    else
      CFRelease(0);
  }
  CFRelease(v11);

  return v12;
}

- (BOOL)addPersonaWithUUID:(id)a3 toSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  CFUUIDRef v11;
  char v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;

  v9 = a3;
  if (a6)
    *a6 = 0;
  v10 = a5;
  v11 = sub_249994C3C(v9);
  sub_2499921BC(self, v10);

  v12 = AKSIdentityAddPersona();
  if ((v12 & 1) != 0)
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v13 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = sub_249998C68();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if (v15)
      {
        v16 = _os_log_send_and_compose_impl();
        v17 = (void *)v16;
        if (v16)
          sub_249998C90(v16);
      }
      else
      {
        v17 = 0;
      }
      free(v17);
    }

  }
  else
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v18 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_249998C68();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        v20 = v19;
      else
        v20 = v19 & 0xFFFFFFFE;
      if (v20)
      {
        v21 = _os_log_send_and_compose_impl();
        v22 = (void *)v21;
        if (v21)
          sub_249998C90(v21);
      }
      else
      {
        v22 = 0;
      }
      free(v22);
    }

    if (a6)
      *a6 = 0;
    else
      CFRelease(0);
  }
  CFRelease(v11);

  return v12;
}

- (BOOL)deletePersonaWithUUID:(id)a3 fromSession:(unsigned int)a4 error:(id *)a5
{
  id v6;
  void *v7;
  CFUUIDRef v8;
  char v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;

  v6 = a3;
  v7 = v6;
  if (a5)
    *a5 = 0;
  v8 = sub_249994C3C(v6);
  v9 = AKSIdentityDeletePersona();
  if ((v9 & 1) != 0)
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v10 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = sub_249998C68();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v12 = v11;
      else
        v12 = v11 & 0xFFFFFFFE;
      if (v12)
      {
        v13 = _os_log_send_and_compose_impl();
        v14 = (void *)v13;
        if (v13)
          sub_249998C90(v13);
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }

  }
  else
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v15 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = sub_249998C68();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if (v17)
      {
        v18 = _os_log_send_and_compose_impl();
        v19 = (void *)v18;
        if (v18)
          sub_249998C90(v18);
      }
      else
      {
        v19 = 0;
      }
      free(v19);
    }

    if (a5)
      *a5 = 0;
    else
      CFRelease(0);
  }
  CFRelease(v8);

  return v9;
}

- (BOOL)mapVolume:(id)a3 toSession:(unsigned int)a4 withPersona:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  CFUUIDRef v16;
  char v17;
  NSObject *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;

  v9 = a3;
  v10 = a5;
  if (a6)
    *a6 = 0;
  if (-[UMAppleKeyStoreProvider ignoreIdentityMethods](self, "ignoreIdentityMethods"))
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v11 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = sub_249998C68();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        v13 = v12;
      else
        v13 = v12 & 0xFFFFFFFE;
      if (v13)
      {
        v14 = _os_log_send_and_compose_impl();
        v15 = (void *)v14;
        if (v14)
          sub_249998C90(v14);
      }
      else
      {
        v15 = 0;
      }
      free(v15);
    }

    v17 = 1;
    goto LABEL_44;
  }
  v16 = sub_249994C3C(v10);
  v17 = AKSVolumeMap();
  if ((v17 & 1) == 0)
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v23 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = sub_249998C68();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        v25 = v24;
      else
        v25 = v24 & 0xFFFFFFFE;
      if (v25)
      {
        v26 = _os_log_send_and_compose_impl();
        v27 = (void *)v26;
        if (v26)
          sub_249998C90(v26);
      }
      else
      {
        v27 = 0;
      }
      free(v27);
    }

    if (a6)
    {
      *a6 = 0;
      if (!v10)
        goto LABEL_44;
    }
    else
    {
      CFRelease(0);
      if (!v10)
        goto LABEL_44;
    }
LABEL_43:
    CFRelease(v16);
    goto LABEL_44;
  }
  if (qword_2544B43E0 != -1)
    dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
  v18 = (id)qword_2544B43D0;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = sub_249998C68();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      v20 = v19;
    else
      v20 = v19 & 0xFFFFFFFE;
    if (v20)
    {
      v21 = _os_log_send_and_compose_impl();
      v22 = (void *)v21;
      if (v21)
        sub_249998C90(v21);
    }
    else
    {
      v22 = 0;
    }
    free(v22);
  }

  if (v10)
    goto LABEL_43;
LABEL_44:

  return v17;
}

- (BOOL)unmapVolume:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  char v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;

  v6 = a3;
  if (a4)
    *a4 = 0;
  if (-[UMAppleKeyStoreProvider ignoreIdentityMethods](self, "ignoreIdentityMethods"))
  {
    if (qword_2544B43E0 != -1)
      dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
    v7 = (id)qword_2544B43D0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = sub_249998C68();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        v9 = v8;
      else
        v9 = v8 & 0xFFFFFFFE;
      if (v9)
      {
        v10 = _os_log_send_and_compose_impl();
        v11 = (void *)v10;
        if (v10)
          sub_249998C90(v10);
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    v12 = 1;
  }
  else
  {
    v12 = AKSVolumeUnmap();
    if ((v12 & 1) != 0)
    {
      if (qword_2544B43E0 != -1)
        dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
      v13 = (id)qword_2544B43D0;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = sub_249998C68();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          v15 = v14;
        else
          v15 = v14 & 0xFFFFFFFE;
        if (v15)
        {
          v16 = _os_log_send_and_compose_impl();
          v17 = (void *)v16;
          if (v16)
            sub_249998C90(v16);
        }
        else
        {
          v17 = 0;
        }
        free(v17);
      }

    }
    else
    {
      if (qword_2544B43E0 != -1)
        dispatch_once(&qword_2544B43E0, &unk_251AD47F8);
      v18 = (id)qword_2544B43D0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = sub_249998C68();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          v20 = v19;
        else
          v20 = v19 & 0xFFFFFFFE;
        if (v20)
        {
          v21 = _os_log_send_and_compose_impl();
          v22 = (void *)v21;
          if (v21)
            sub_249998C90(v21);
        }
        else
        {
          v22 = 0;
        }
        free(v22);
      }

      if (a4)
        *a4 = 0;
      else
        CFRelease(0);
    }
  }

  return v12;
}

- (BOOL)ignoreIdentityMethods
{
  return self->_ignoreIdentityMethods;
}

- (void)setIgnoreIdentityMethods:(BOOL)a3
{
  self->_ignoreIdentityMethods = a3;
}

@end
