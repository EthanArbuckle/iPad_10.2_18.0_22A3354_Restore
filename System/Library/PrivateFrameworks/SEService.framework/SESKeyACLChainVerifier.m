@implementation SESKeyACLChainVerifier

+ (id)performChainAuthIfNeededForACL:(id)a3 operation:(id)a4 auth:(id)a5 seHandle:(id)a6 seid:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  _BYTE buf[12];
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v56 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x24BDC6C80], "recordFromData:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "propertyList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ckref"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      SESDefaultLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v13, "base64");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v14;
        v61 = 2112;
        v62 = v40;
        _os_log_impl(&dword_20A048000, v23, OS_LOG_TYPE_DEBUG, "Constraints for operation %@ doesn't require ckref in ACL %@", buf, 0x16u);

      }
      v36 = 0;
      goto LABEL_41;
    }
    v59 = 0;
    +[SESKeyACLChainVerifier findDesignatedKey:error:]((uint64_t)SESKeyACLChainVerifier, v20, &v59);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v59;
    v23 = v22;
    v55 = (void *)v21;
    if (!v21 || v22)
    {
      SESDefaultLogObject();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "base64");
        v42 = v15;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v43;
        _os_log_impl(&dword_20A048000, v41, OS_LOG_TYPE_ERROR, "ACL was %@", buf, 0xCu);

        v15 = v42;
      }

      if (a8)
      {
        SESEnsureError();
        v36 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = 0;
      }
      goto LABEL_40;
    }
    v24 = objc_opt_new();
    v54 = (void *)v24;
    if (!v24)
    {
      if (a8)
      {
        SESDefaultLogObject();
        v44 = v15;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a8 = (id)objc_claimAutoreleasedReturnValue();

        v15 = v44;
      }
      v23 = 0;
      v36 = 0;
      goto LABEL_39;
    }
    v25 = (void *)v24;
    *(_QWORD *)buf = 0;
    v26 = (void *)SecAccessControlCreate();
    v23 = *(NSObject **)buf;
    if (!v26 || *(_QWORD *)buf)
    {
      if (!a8)
      {
        v36 = 0;
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
        goto LABEL_42;
      }
      v53 = v26;
      SESDefaultLogObject();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError();
      v36 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = v15;
      v27 = v26;
      SecAccessControlSetConstraints();
      v58 = 0;
      v53 = v27;
      v28 = (id)objc_msgSend(v25, "evaluateAccessControl:aksOperation:options:error:", v27, v14, 0, &v58);
      v23 = v58;
      -[NSObject userInfo](v23, "userInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x24BDDA910]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = v30;
      if (-[NSObject code](v23, "code") == -1026)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          v57 = 0;
          v15 = v52;
          +[PTClassicMicro sign:designatedKey:extAuth:seHandle:seid:error:](PTClassicMicro, "sign:designatedKey:extAuth:seHandle:seid:error:", v30, v55, v52, v56, v16, &v57);
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = v57;
          v33 = (void *)v31;
          v23 = v32;
          if (!v33 || v32)
          {
            if (!a8)
            {
              v36 = 0;
              goto LABEL_36;
            }
            v50 = v33;
            SESDefaultLogObject();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            SESCreateAndLogError();
            v36 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v50 = v33;
            objc_msgSend(v25, "setCredential:type:");
            v34 = objc_opt_new();
            v35 = v25;
            v36 = (_QWORD *)v34;
            v37 = v35;
            v38 = (void *)v36[1];
            v36[1] = v37;
          }

          v33 = v50;
          v30 = v51;
LABEL_36:

          goto LABEL_37;
        }
      }
      v15 = v52;
      if (a8)
      {
        SESDefaultLogObject();
        v46 = objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        v47 = (id)objc_claimAutoreleasedReturnValue();
        v33 = (void *)v46;
        v36 = 0;
        *a8 = v47;
        goto LABEL_36;
      }
      v36 = 0;
    }
LABEL_37:

    v26 = v53;
    goto LABEL_38;
  }
  if (a8)
  {
    SESDefaultLogObject();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "asHexString");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v36 = 0;
LABEL_42:

  return v36;
}

+ (id)findDesignatedKey:(_QWORD *)a3 error:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  uint8_t buf[4];
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_opt_self();
  objc_msgSend(v4, "sha256");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subdataWithRange:", 0, 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  SESKeyGetDesignatedKeys();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }
  else
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __50__SESKeyACLChainVerifier_findDesignatedKey_error___block_invoke;
    v31[3] = &unk_24C2BCF18;
    v11 = v6;
    v32 = v11;
    objc_msgSend(v7, "find:", v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v22 = v11;
      v23 = v7;
      v24 = a3;
      v25 = v6;
      v26 = v4;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            SESDefaultLogObject();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v17;
              _os_log_impl(&dword_20A048000, v18, OS_LOG_TYPE_ERROR, "   eligible key %@", buf, 0xCu);
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        }
        while (v14);
      }

      v6 = v25;
      v4 = v26;
      v7 = v23;
      if (v24)
      {
        SESDefaultLogObject();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "asHexString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *v24 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v10;
}

uint64_t __50__SESKeyACLChainVerifier_findDesignatedKey_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "keyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToData:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSData)resolvedAuthorization
{
  return (NSData *)-[LAContext externalizedContext](self->_laContext, "externalizedContext");
}

- (void)dealloc
{
  objc_super v3;

  -[LAContext invalidate](self->_laContext, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SESKeyACLChainVerifier;
  -[SESKeyACLChainVerifier dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laContext, 0);
}

@end
