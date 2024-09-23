@implementation BackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BackendXPC)initWithCoder:(id)a3
{
  id v4;
  BackendXPC *v5;
  header *v6;
  header *value;
  header *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BackendXPC;
  v5 = -[BackendXPC init](&v10, "init");
  if (v5)
  {
    sub_1000B7F84(v4, &v9);
    v6 = v9;
    v9 = 0;
    value = v5->_cryptoHeader.__ptr_.__value_;
    v5->_cryptoHeader.__ptr_.__value_ = v6;
    if (value)
      operator delete();
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  header *value;
  id v5;

  v5 = a3;
  value = self->_cryptoHeader.__ptr_.__value_;
  if (value)
    objc_msgSend(v5, "encodeBytes:length:forKey:", value, 76, CFSTR("crypto_header"));

}

- (int)lock
{
  uint64_t (***v2)(_QWORD);
  void **p_lpsrc;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  int v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;
  void *lpsrc;
  std::__shared_weak_count *v18;
  uint64_t (***v19)(_QWORD);
  std::__shared_weak_count *v20;

  -[BackendXPC backend](self, "backend");
  sub_10011E808((uint64_t)&v15, &lpsrc);
  if (lpsrc
  {
    v19 = v2;
    v20 = v18;
    p_lpsrc = &lpsrc;
  }
  else
  {
    p_lpsrc = (void **)&v19;
  }
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v4 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = v16;
  if (v16)
  {
    v8 = (unint64_t *)&v16->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (v19)
    v10 = (**v19)(v19);
  else
    v10 = 0;
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v10;
}

- (NSUUID)instanceID
{
  id v3;
  uint64_t v4;
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;
  _QWORD v12[2];

  v3 = objc_alloc((Class)NSUUID);
  -[BackendXPC backend](self, "backend");
  v12[0] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 160))(v10);
  v12[1] = v4;
  v5 = objc_msgSend(v3, "initWithUUIDBytes:", v12);
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return (NSUUID *)v5;
}

- (BOOL)tryCreatingCryptoHeader
{
  unint64_t *p_shared_owners;
  unint64_t v3;
  uint64_t v5;
  std::__shared_weak_count *v6;

  -[BackendXPC getCryptoHeaderBackend](self, "getCryptoHeaderBackend");
  if (v5 && (unint64_t)(*(uint64_t (**)())(*(_QWORD *)v5 + 40))() >= 0x4C)
    operator new();
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)())v6->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return 0;
}

- (void)cryptoHeader
{
  return &self->_cryptoHeader;
}

- (id)description
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (void)replaceWithBackendXPC:(id)a3
{
  id v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _QWORD *exception;
  const std::error_category *v9;
  __int128 v10;

  v4 = a3;
  {
    exception = __cxa_allocate_exception(0x40uLL);
    *exception = &off_1001924F8;
    v9 = std::generic_category();
    exception[1] = 22;
    exception[2] = v9;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 48) = 0;
    exception[7] = "Unexpected backend replace request";
  }
  if (v4)
    objc_msgSend(v4, "backend");
  else
    v10 = 0uLL;
  sub_100015BC8((uint64_t)&self->_backend, &v10);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

}

- (id)newWithCryptoFormat:(const void *)a3
{
  return -[CryptoBackendXPC initWithFormat:baseBackendXPC:]([CryptoBackendXPC alloc], "initWithFormat:baseBackendXPC:", a3, self);
}

- (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  _BOOL4 v8;

  v8 = +[DICryptoHelper createPublicKeyHeaderWithBackendXPC:publicKeyHeader:error:](DICryptoHelper, "createPublicKeyHeaderWithBackendXPC:publicKeyHeader:error:", self, a3);
  if (v8)
    LOBYTE(v8) = +[DICryptoHelper getPrivateKeyWithHeader:privateKey:error:](DICryptoHelper, "getPrivateKeyWithHeader:privateKey:error:", a3, a4, a5);
  return v8;
}

- (keys)generateNewImageKeysWithPassphrase:(SEL)a3 privateKey:(const char *)a4 pubKeyHeader:(__SecKey *)a5 header_backend:(public_key_header *)a6
{
  uint64_t v11;
  void *v12;
  unsigned int var0;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[512];

  v11 = *(_QWORD *)a7.__ptr_;
  v12 = -[BackendXPC cryptoHeader](self, "cryptoHeader");
  if (a4)
    return (keys *)sub_100116A08(retstr, v11, v12, a4);
  var0 = a6->var0.var0.var0;
  v15 = *(_OWORD *)a6->var0.var1.var0;
  v16 = *(_OWORD *)&a6->var0.var1.var0[16];
  v17 = *(_OWORD *)&a6->var1.var0;
  memcpy(v18, &a6->var4.var1, sizeof(v18));
  return (keys *)sub_100116678(retstr, v11, v12, a5, &var0);
}

- (BOOL)newUnlockBackendXPCValidateArgsWithPassphrase:(const char *)a3 certificate:(id)a4 isNewImage:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  unint64_t v9;
  void *v10;
  const __CFString *v11;
  unsigned __int8 v12;
  BOOL v13;

  v7 = a5;
  v9 = (unint64_t)a4;
  v10 = (void *)v9;
  if ((unint64_t)a3 | v9)
  {
    if (!v9)
    {
      if (!a3 || !*a3)
      {
        v11 = CFSTR("Passphrase cannot be empty");
        goto LABEL_11;
      }
      if (strnlen(a3, 0x101uLL) >= 0x101)
      {
        v11 = CFSTR("Passphrase is too long");
LABEL_11:
        v12 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, v11, a6);
        goto LABEL_12;
      }
    }
  }
  else if (v7)
  {
    v12 = +[DIError failWithOSStatus:description:error:](DIError, "failWithOSStatus:description:error:", 22, CFSTR("Certificate cannot be empty"), a6);
LABEL_12:
    v13 = v12;
    goto LABEL_13;
  }
  v13 = 1;
LABEL_13:

  return v13;
}

- (shared_ptr<crypto::format>)makeCryptoFormatWithIsNewImage:(BOOL)a3 pass:(const char *)a4 certificate:(id)a5 error:(id *)a6
{
  _QWORD *v6;
  _BOOL4 v9;
  _QWORD *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  format *v25;
  __shared_weak_count *v26;
  _QWORD *exception;
  const std::error_category *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *__p;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  const char *v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[512];
  _BYTE v49[20];
  __int128 v50;
  __int128 v51;
  _BYTE v52[516];
  shared_ptr<crypto::format> result;

  v9 = a3;
  v11 = v6;
  v43 = a4;
  v12 = a5;
  -[BackendXPC getCryptoHeaderBackend](self, "getCryptoHeaderBackend");
  if (!v41)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    *exception = &off_1001924F8;
    v28 = std::generic_category();
    exception[1] = 4294967291;
    exception[2] = v28;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 48) = 0;
    exception[7] = "Failed opening the crypto header backend";
  }
  v39 = 0;
  v40 = 0;
  if (!v9)
  {
    v49[0] = 0;
    v52[512] = 0;
    v38 = 0;
    if (a4)
    {
      sub_100116A08(&v29, v41, -[BackendXPC cryptoHeader](self, "cryptoHeader"), a4);
      sub_10005AAD0(&v36);
      v14 = v36;
      v15 = v37;
      v36 = 0;
      v37 = 0;
      v39 = v14;
      v40 = v15;
      if (__p)
      {
        v35 = __p;
        operator delete(__p);
      }
      v16 = v33;
      v33 = 0;
      if (v16)
        operator delete();
      if (v31)
      {
        v32 = v31;
        operator delete(v31);
      }
      if (v29)
      {
        v30 = v29;
        operator delete(v29);
      }
      goto LABEL_25;
    }
    if (-[BackendXPC getPrivateKeyWithHeader:privateKey:error:](self, "getPrivateKeyWithHeader:privateKey:error:", v49, &v38, a6))
    {
      v17 = v38;
      v18 = v41;
      v19 = -[BackendXPC cryptoHeader](self, "cryptoHeader");
      v44 = *(_DWORD *)v49;
      v45 = *(_OWORD *)&v49[4];
      v46 = v50;
      v47 = v51;
      memcpy(v48, v52, sizeof(v48));
      sub_100116678(&v29, v18, v19, v38, &v44);
      sub_10005AAD0(&v36);
      v14 = v36;
      v15 = v37;
      v36 = 0;
      v37 = 0;
      v39 = v14;
      v40 = v15;
      if (__p)
      {
        v35 = __p;
        operator delete(__p);
      }
      v20 = v33;
      v33 = 0;
      if (v20)
        operator delete();
      if (v31)
      {
        v32 = v31;
        operator delete(v31);
      }
      if (v29)
      {
        v30 = v29;
        operator delete(v29);
      }

      goto LABEL_25;
    }
LABEL_27:
    *v11 = 0;
    v11[1] = 0;
    goto LABEL_28;
  }
  v29 = 0;
  if (!+[DICryptoHelper getPublicKeyWithCertificate:key:error:](DICryptoHelper, "getPublicKeyWithCertificate:key:error:", v12, &v29, a6))goto LABEL_27;
  v13 = v29;
  if (!((unint64_t)a4 | (unint64_t)v29))
  {
    v21 = +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, CFSTR("No passphrase or certificate was supplied."), a6);
    goto LABEL_27;
  }
  -[BackendXPC cryptoHeader](self, "cryptoHeader");
  sub_1000BD8F0(v49);
  v14 = *(_QWORD *)v49;
  v15 = *(_QWORD *)&v49[8];

LABEL_25:
  *v11 = v14;
  v11[1] = v15;
  v39 = 0;
  v40 = 0;
LABEL_28:
  v22 = v42;
  if (v42)
  {
    p_shared_owners = (unint64_t *)&v42->__shared_owners_;
    do
      v24 = __ldaxr(p_shared_owners);
    while (__stlxr(v24 - 1, p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

  result.var1 = v26;
  result.var0 = v25;
  return result;
}

- (id)newUnlockedBackendXPCWithPassphrase:(const char *)a3 certificate:(id)a4 isNewImage:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  v7 = a5;
  v10 = a4;
  if (-[BackendXPC newUnlockBackendXPCValidateArgsWithPassphrase:certificate:isNewImage:error:](self, "newUnlockBackendXPCValidateArgsWithPassphrase:certificate:isNewImage:error:", a3, v10, v7, a6))
  {
    -[BackendXPC makeCryptoFormatWithIsNewImage:pass:certificate:error:](self, "makeCryptoFormatWithIsNewImage:pass:certificate:error:", v7, a3, v10, a6);
    if (v16)
      v11 = -[BackendXPC newWithCryptoFormat:](self, "newWithCryptoFormat:", &v16);
    else
      v11 = 0;
    v12 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isUnlocked
{
  return 0;
}

+ (id)newFileBackendWithURL:(id)a3 fileOpenFlags:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  __objc2_class **v17;
  void *v18;
  const char *v20;
  int v21;
  uint64_t v22;
  stat v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  dev_t st_dev;
  __int16 v30;
  __darwin_ino64_t st_ino;
  __int16 v32;
  int st_mode;
  __int16 v34;
  uid_t st_uid;
  __int16 v36;
  gid_t st_gid;
  __int16 v38;
  off_t st_size;
  __int16 v40;
  blkcnt_t st_blocks;

  v6 = *(_QWORD *)&a4;
  v7 = objc_retainAutorelease(a3);
  if (stat((const char *)objc_msgSend(v7, "fileSystemRepresentation"), &v23))
  {
    v8 = +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", *__error(), CFSTR("stat failed"), a5);
    v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  }
  else
  {
    v10 = *__error();
    if (sub_1000BF0BC())
    {
      v22 = 0;
      v11 = sub_1000BF044();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        v13 = 3;
      else
        v13 = 2;
      v25 = 56;
      v26 = 2080;
      *(_DWORD *)buf = 68159746;
      v27 = "+[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]";
      v28 = 1024;
      st_dev = v23.st_dev;
      v30 = 2048;
      st_ino = v23.st_ino;
      v32 = 1024;
      st_mode = v23.st_mode;
      v34 = 1024;
      st_uid = v23.st_uid;
      v36 = 1024;
      st_gid = v23.st_gid;
      v38 = 2048;
      st_size = v23.st_size;
      v40 = 2048;
      st_blocks = v23.st_blocks;
      LODWORD(v20) = 72;
      v14 = (char *)_os_log_send_and_compose_impl(v13, &v22, 0, 0, &_mh_execute_header, v12, 0, "%.*s: Image file stat: dev(0x%x), inode(%lld), mode(%o), uid(%d), gid(%d), size(%lld), blocks(%lld)", (int)buf, v20, v21);

      if (v14)
      {
        fprintf(__stderrp, "%s\n", v14);
        free(v14);
      }
    }
    else
    {
      v15 = sub_1000BF044();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 56;
        v26 = 2080;
        *(_DWORD *)buf = 68159746;
        v27 = "+[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]";
        v28 = 1024;
        st_dev = v23.st_dev;
        v30 = 2048;
        st_ino = v23.st_ino;
        v32 = 1024;
        st_mode = v23.st_mode;
        v34 = 1024;
        st_uid = v23.st_uid;
        v36 = 1024;
        st_gid = v23.st_gid;
        v38 = 2048;
        st_size = v23.st_size;
        v40 = 2048;
        st_blocks = v23.st_blocks;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%.*s: Image file stat: dev(0x%x), inode(%lld), mode(%o), uid(%d), gid(%d), size(%lld), blocks(%lld)", buf, 0x48u);
      }

    }
    *__error() = v10;
    if ((v23.st_mode & 0xF000) == 0x4000)
      v17 = &off_10016C740;
    else
      v17 = &off_10016C5E8;
    v9 = objc_msgSend(objc_alloc(*v17), "initWithURL:fileOpenFlags:", v7, v6);
  }
  v18 = v9;

  return v18;
}

- (shared_ptr<Backend>)backend
{
  Backend **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<Backend> result;

  cntrl = self->_backend.__cntrl_;
  *v2 = self->_backend.__ptr_;
  v2[1] = (Backend *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Backend *)self;
  return result;
}

- (void)setBackend:(shared_ptr<Backend>)a3
{
  sub_100027CB4(&self->_backend.__ptr_, (uint64_t *)a3.__ptr_);
}

- (void).cxx_destruct
{
  header *value;

  sub_100012168((uint64_t)&self->_backend);
  value = self->_cryptoHeader.__ptr_.__value_;
  self->_cryptoHeader.__ptr_.__value_ = 0;
  if (value)
    operator delete();
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
