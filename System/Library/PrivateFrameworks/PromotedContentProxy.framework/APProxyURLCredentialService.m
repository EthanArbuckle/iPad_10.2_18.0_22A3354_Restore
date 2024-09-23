@implementation APProxyURLCredentialService

- (APProxyURLCredentialService)init
{
  APProxyURLCredentialService *v2;
  APMescalSigning *v3;
  APMescalSigning *mescalSigningObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APProxyURLCredentialService;
  v2 = -[APProxyURLCredentialService init](&v6, sel_init);
  if (v2)
  {
    v3 = (APMescalSigning *)objc_alloc_init(MEMORY[0x24BE022B0]);
    mescalSigningObject = v2->_mescalSigningObject;
    v2->_mescalSigningObject = v3;

  }
  return v2;
}

- (id)signedCredentialForRequest:(id)a3 withPersistence:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;

  v6 = a3;
  objc_msgSend_URL(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForHTTPHeaderField_(v6, v12, (uint64_t)CFSTR("user-agent"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signedCredentialForUrl_userAgent_request_withPersistence_(self, v16, (uint64_t)v11, (uint64_t)v15, (uint64_t)v6, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)signedCredentialForUrl:(id)a3 userAgent:(id)a4 withPersistence:(unint64_t)a5
{
  return (id)objc_msgSend_signedCredentialForUrl_userAgent_request_withPersistence_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, a5);
}

- (id)signedCredentialForUrl:(id)a3 userAgent:(id)a4 request:(id)a5 withPersistence:(unint64_t)a6
{
  return (id)MEMORY[0x24BEDD108](self, sel__signedCredentialForUrl_userAgent_withPersistence_, a3, a4, a6);
}

- (id)_signedCredentialForUrl:(id)a3 userAgent:(id)a4 withPersistence:(unint64_t)a5
{
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  NSObject *v62;
  uint8_t buf[16];

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a4;
  objc_msgSend_absoluteString(a3, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(MEMORY[0x24BDBCE60], v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSince1970(v19, v20, v21, v22, v23);
  objc_msgSend_stringWithFormat_(v8, v24, (uint64_t)CFSTR("%@_*##*_%@_*##*_%f"), v25, v26, v9, v14, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sha256hash(v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend_dataUsingEncoding_(v33, v34, 4, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v37;
    if (v37)
    {
      objc_msgSend_base64EncodedStringWithOptions_(v37, v38, 0, v39, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v42, v43, v44, v45, v46))
      {
        objc_msgSend_mescalSigningObject(self, v47, v48, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_signatureForData_(v51, v52, (uint64_t)v41, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_length(v55, v56, v57, v58, v59))
        {
          objc_msgSend_credentialWithUser_password_persistence_(MEMORY[0x24BDB7480], v60, (uint64_t)v42, (uint64_t)v55, a5);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          APLogForCategory();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22ACB2000, v62, OS_LOG_TYPE_ERROR, "Failed to get a signature for proxy authentication.", buf, 2u);
          }

          v61 = 0;
        }

      }
      else
      {
        v61 = 0;
      }

    }
    else
    {
      v61 = 0;
    }

  }
  else
  {
    v61 = 0;
  }

  return v61;
}

- (APMescalSigning)mescalSigningObject
{
  return self->_mescalSigningObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mescalSigningObject, 0);
}

@end
