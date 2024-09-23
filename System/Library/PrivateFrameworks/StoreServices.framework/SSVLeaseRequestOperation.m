@implementation SSVLeaseRequestOperation

- (SSVLeaseRequestOperation)initWithLeaseRequest:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SSVLeaseRequestOperation *v8;
  uint64_t v9;
  SSVPlaybackLeaseConfiguration *configuration;
  uint64_t v11;
  SSVPlaybackLeaseRequest *request;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSVLeaseRequestOperation;
  v8 = -[SSVOperation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (SSVPlaybackLeaseConfiguration *)v9;

    v11 = objc_msgSend(v6, "copy");
    request = v8->_request;
    v8->_request = (SSVPlaybackLeaseRequest *)v11;

  }
  return v8;
}

- (SSVLeaseRequestOperation)initWithLeaseRequest:(id)a3 URLBag:(id)a4
{
  id v6;
  id v7;
  SSVLeaseRequestOperation *v8;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *bagLoadSemaphore;
  uint64_t v11;
  SSVPlaybackLeaseRequest *request;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSVLeaseRequestOperation;
  v8 = -[SSVOperation init](&v14, sel_init);
  if (v8)
  {
    v9 = dispatch_semaphore_create(0);
    bagLoadSemaphore = v8->_bagLoadSemaphore;
    v8->_bagLoadSemaphore = (OS_dispatch_semaphore *)v9;

    v11 = objc_msgSend(v6, "copy");
    request = v8->_request;
    v8->_request = (SSVPlaybackLeaseRequest *)v11;

    objc_storeStrong((id *)&v8->_urlBag, a4);
  }

  return v8;
}

- (NSString)certificateURLBagKey
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
  v8 = __Block_byref_object_copy__56;
  v9 = __Block_byref_object_dispose__56;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SSVLeaseRequestOperation_certificateURLBagKey__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __48__SSVLeaseRequestOperation_certificateURLBagKey__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (SSVPlaybackLeaseRequest)leaseRequest
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
  v8 = __Block_byref_object_copy__56;
  v9 = __Block_byref_object_dispose__56;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SSVLeaseRequestOperation_leaseRequest__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SSVPlaybackLeaseRequest *)v2;
}

void __40__SSVLeaseRequestOperation_leaseRequest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)outputBlock
{
  void *v2;
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
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SSVLeaseRequestOperation_outputBlock__block_invoke;
  v4[3] = &unk_1E47B8680;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = (void *)MEMORY[0x1A8585DF0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __39__SSVLeaseRequestOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setCertificateURLBagKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SSVLeaseRequestOperation_setCertificateURLBagKey___block_invoke;
  v6[3] = &unk_1E47B8768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __52__SSVLeaseRequestOperation_setCertificateURLBagKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 312);
  *(_QWORD *)(v3 + 312) = v2;

}

- (void)setOutputBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SSVLeaseRequestOperation_setOutputBlock___block_invoke;
  v6[3] = &unk_1E47B8AC0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __43__SSVLeaseRequestOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 328);
  *(_QWORD *)(v3 + 328) = v2;

}

- (void)cancel
{
  objc_super v3;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_bagLoadSemaphore);
  v3.receiver = self;
  v3.super_class = (Class)SSVLeaseRequestOperation;
  -[SSVOperation cancel](&v3, sel_cancel);
}

- (void)main
{
  BOOL v3;
  id *v4;
  BOOL v5;
  SSVLoadURLOperation *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  SSVLoadURLOperation *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  int v19;
  objc_class *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  NSObject *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  int v46;
  int v47;
  NSObject *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  SSVPlaybackLeaseResponse *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  SSVPlaybackLeaseResponse *v68;
  void *v69;
  void *v70;
  SSVFairPlaySubscriptionController *v71;
  id *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  int v78;
  void *v79;
  int v80;
  int v81;
  NSObject *v82;
  void *v83;
  objc_class *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  int *v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  _QWORD v100[6];
  _QWORD v101[6];
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  id obj;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  int v114;
  void *v115;
  __int16 v116;
  uint64_t v117;
  _BYTE v118[24];
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  id v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v108 = 0;
  v109 = &v108;
  v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__56;
  v112 = __Block_byref_object_dispose__56;
  v113 = 0;
  obj = 0;
  v3 = -[SSVLeaseRequestOperation _resolveConfigurationAndURLReturningError:](self, "_resolveConfigurationAndURLReturningError:", &obj);
  objc_storeStrong(&v113, obj);
  if (!v3)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v31 = objc_msgSend(v30, "shouldLog");
    v32 = objc_msgSend(v30, "shouldLogToDisk");
    objc_msgSend(v30, "OSLogObject");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v32)
      v31 |= 2u;
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      v31 &= 2u;
    if (v31)
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v109[5];
      *(_DWORD *)v118 = 138412546;
      *(_QWORD *)&v118[4] = v36;
      *(_WORD *)&v118[12] = 2112;
      *(_QWORD *)&v118[14] = v37;
      LODWORD(v97) = 22;
      v96 = (int *)v118;
      v38 = (void *)_os_log_send_and_compose_impl();

      if (!v38)
      {
LABEL_27:

LABEL_39:
        v60 = 0;
        goto LABEL_77;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v38, 4, v118, v97);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      free(v38);
      SSFileLog(v30, CFSTR("%@"), v39, v40, v41, v42, v43, v44, (uint64_t)v34);
    }

    goto LABEL_27;
  }
  v4 = (id *)(v109 + 5);
  v106 = (id)v109[5];
  v5 = -[SSVLeaseRequestOperation _loadCertificateDataIfNecessary:](self, "_loadCertificateDataIfNecessary:", &v106);
  objc_storeStrong(v4, v106);
  if (!v5)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v45)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v46 = objc_msgSend(v45, "shouldLog");
    v47 = objc_msgSend(v45, "shouldLogToDisk");
    objc_msgSend(v45, "OSLogObject");
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v47)
      v46 |= 2u;
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      v46 &= 2u;
    if (v46)
    {
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v109[5];
      *(_DWORD *)v118 = 138412546;
      *(_QWORD *)&v118[4] = v51;
      *(_WORD *)&v118[12] = 2112;
      *(_QWORD *)&v118[14] = v52;
      LODWORD(v97) = 22;
      v96 = (int *)v118;
      v53 = (void *)_os_log_send_and_compose_impl();

      if (!v53)
      {
LABEL_38:

        goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v53, 4, v118, v97);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      free(v53);
      SSFileLog(v45, CFSTR("%@"), v54, v55, v56, v57, v58, v59, (uint64_t)v49);
    }

    goto LABEL_38;
  }
  v6 = 0;
  v102 = 0;
  v103 = &v102;
  v104 = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v105 = 0;
  *(_QWORD *)v118 = 0;
  *(_QWORD *)&v118[8] = v118;
  *(_QWORD *)&v118[16] = 0x3032000000;
  v119 = __Block_byref_object_copy__56;
  v120 = __Block_byref_object_dispose__56;
  v121 = 0;
  while (1)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB37A8]);
    -[SSVPlaybackLeaseRequest _URL](self->_request, "_URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithURL:", v9);

    objc_msgSend(v10, "setHTTPMethod:", CFSTR("POST"));
    v11 = -[SSVLoadURLOperation initWithURLRequest:]([SSVLoadURLOperation alloc], "initWithURLRequest:", v10);

    +[SSVURLDataConsumer consumer](SSVURLProtocolConsumer, "consumer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setDataConsumer:](v11, "setDataConsumer:", v12);

    -[SSVLoadURLOperation setITunesStoreRequest:](v11, "setITunesStoreRequest:", 1);
    -[SSVLoadURLOperation setMachineDataStyle:](v11, "setMachineDataStyle:", 3);
    -[SSVPlaybackLeaseConfiguration storeFrontSuffix](self->_configuration, "storeFrontSuffix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setStoreFrontSuffix:](v11, "setStoreFrontSuffix:", v13);

    v101[0] = v7;
    v101[1] = 3221225472;
    v101[2] = __32__SSVLeaseRequestOperation_main__block_invoke;
    v101[3] = &unk_1E47BE808;
    v101[4] = &v108;
    v101[5] = v118;
    -[SSVLoadURLOperation setOutputBlock:](v11, "setOutputBlock:", v101);
    v100[0] = v7;
    v100[1] = 3221225472;
    v100[2] = __32__SSVLeaseRequestOperation_main__block_invoke_2;
    v100[3] = &unk_1E47BE830;
    v100[4] = self;
    v100[5] = &v102;
    -[SSVLoadURLOperation setPrepareRequestBlock:](v11, "setPrepareRequestBlock:", v100);
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v11);
    if (!-[SSVLeaseRequestOperation _shouldRetryForError:](self, "_shouldRetryForError:", v109[5]))
      break;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog", v96, v97);
    v16 = objc_msgSend(v14, "shouldLogToDisk");
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
      v15 |= 2u;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      v19 = v15;
    else
      v19 = v15 & 2;
    if (v19)
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = 138412290;
      v115 = v21;
      LODWORD(v97) = 12;
      v96 = &v114;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, &v114, v97);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      free(v22);
      SSFileLog(v14, CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v18);
    }

LABEL_16:
    v29 = (void *)v109[5];
    v109[5] = 0;

    v6 = v11;
  }

  -[SSVLoadURLOperation URLResponse](v11, "URLResponse");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)&v118[8] + 40), "objectForKey:", CFSTR("failureType"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      v63 = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(*(_QWORD *)&v118[8] + 40), "objectForKey:", CFSTR("dialog"));
      v64 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend((id)v63, "setObject:forKey:", v64, CFSTR("SSVPlaybackResponseErrorUserInfoKeyDialogDictionary"));
      if (!objc_msgSend((id)v63, "count", v96, v97))
      {

        v63 = 0;
      }
      v65 = (void *)MEMORY[0x1E0CB35C8];
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v66 = objc_msgSend(v62, "integerValue");
      else
        v66 = 0;
      objc_msgSend(v65, "errorWithDomain:code:userInfo:", CFSTR("SSServerErrorDomain"), v66, v63);
      v73 = objc_claimAutoreleasedReturnValue();
      v60 = 0;
      v71 = (SSVFairPlaySubscriptionController *)v109[5];
      v109[5] = v73;
LABEL_56:

      goto LABEL_57;
    }
    v68 = [SSVPlaybackLeaseResponse alloc];
    v60 = -[SSVPlaybackResponse initWithDictionary:URLResponse:](v68, "initWithDictionary:URLResponse:", *(_QWORD *)(*(_QWORD *)&v118[8] + 40), v61);
    -[SSVPlaybackLeaseConfiguration pastisKeyServerURL](self->_configuration, "pastisKeyServerURL");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPlaybackResponse setFallbackStreamingKeyServerURL:](v60, "setFallbackStreamingKeyServerURL:", v69);

    -[SSVPlaybackLeaseConfiguration pastisCertificateURL](self->_configuration, "pastisCertificateURL");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVPlaybackResponse setFallbackStreamingKeyCertificateURL:](v60, "setFallbackStreamingKeyCertificateURL:", v70);

    if (!-[SSVPlaybackLeaseRequest _leaseType](self->_request, "_leaseType"))
    {
      -[SSVPlaybackLeaseResponse leaseInfoData](v60, "leaseInfoData");
      v63 = objc_claimAutoreleasedReturnValue();
      -[SSVPlaybackLeaseResponse subscriptionKeyBagData](v60, "subscriptionKeyBagData");
      v64 = objc_claimAutoreleasedReturnValue();
      if (v63 | v64)
      {
        v71 = objc_alloc_init(SSVFairPlaySubscriptionController);
        v72 = (id *)(v109 + 5);
        v99 = (id)v109[5];
        -[SSVFairPlaySubscriptionController importSubscriptionKeyBagData:leaseInfoData:returningError:](v71, "importSubscriptionKeyBagData:leaseInfoData:returningError:", v64, v63, &v99);
        objc_storeStrong(v72, v99);
        goto LABEL_56;
      }
LABEL_57:

    }
LABEL_58:

  }
  else
  {
    if (!v109[5])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
      v67 = objc_claimAutoreleasedReturnValue();
      v60 = 0;
      v62 = (void *)v109[5];
      v109[5] = v67;
      goto LABEL_58;
    }
    v60 = 0;
  }
  if (v103[3])
  {
    -[SSVPlaybackLeaseResponse leaseInfoData](v60, "leaseInfoData");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (v74)
    {
      v98 = 0;
      v76 = v103[3];
      v77 = objc_retainAutorelease(v74);
      v78 = C956s6fM(v76, objc_msgSend(v77, "bytes"), objc_msgSend(v77, "length"), (uint64_t)&v98);
      if (v78)
      {
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v79)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v80 = objc_msgSend(v79, "shouldLog", v96);
        v81 = objc_msgSend(v79, "shouldLogToDisk");
        objc_msgSend(v79, "OSLogObject");
        v82 = objc_claimAutoreleasedReturnValue();
        v83 = v82;
        if (v81)
          v80 |= 2u;
        if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          v80 &= 2u;
        if (v80)
        {
          v84 = (objc_class *)objc_opt_class();
          NSStringFromClass(v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = 138412546;
          v115 = v85;
          v116 = 2048;
          v117 = v78;
          LODWORD(v97) = 22;
          v96 = &v114;
          v86 = (void *)_os_log_send_and_compose_impl();

          if (v86)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v86, 4, &v114, v97);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            free(v86);
            SSFileLog(v79, CFSTR("%@"), v87, v88, v89, v90, v91, v92, (uint64_t)v83);
            goto LABEL_71;
          }
        }
        else
        {
LABEL_71:

        }
      }
      if (v98)
        N8pdwAfn(v98);
    }
    JE2f6WCx(v103[3]);

  }
  _Block_object_dispose(v118, 8);

  _Block_object_dispose(&v102, 8);
LABEL_77:
  -[SSVPlaybackLeaseRequest _certificateData](self->_request, "_certificateData", v96);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPlaybackLeaseResponse setCertificateData:](v60, "setCertificateData:", v93);

  -[SSVPlaybackLeaseResponse setKDMovieIdentifier:](v60, "setKDMovieIdentifier:", -[SSVPlaybackLeaseRequest _KDMovieIdentifier](self->_request, "_KDMovieIdentifier"));
  -[SSVLeaseRequestOperation outputBlock](self, "outputBlock");
  v94 = objc_claimAutoreleasedReturnValue();
  v95 = (void *)v94;
  if (v94)
    (*(void (**)(uint64_t, SSVPlaybackLeaseResponse *, uint64_t))(v94 + 16))(v94, v60, v109[5]);

  _Block_object_dispose(&v108, 8);
}

void __32__SSVLeaseRequestOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __32__SSVLeaseRequestOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  double v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  int *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  int v29;
  void *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344);
  v5 = 30.0;
  if (v4 <= 2)
    v5 = dbl_1A27A0F90[v4];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    v8 &= 2u;
  if (v8)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138412546;
    v30 = v11;
    v31 = 2048;
    v32 = v5;
    LODWORD(v26) = 22;
    v25 = &v29;
    v12 = (void *)_os_log_send_and_compose_impl();

    if (!v12)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v29, v26);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog(v6, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v9);
  }

LABEL_14:
  objc_msgSend(v3, "setTimeoutInterval:", v5);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(_QWORD *)(v19 + 24);
  if (v20)
  {
    JE2f6WCx(v20);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  v21 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "_copyBodyDictionaryWithFairPlaySession:", v19 + 24, v25);
  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v21, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHTTPBody:", v22);

    objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "HTTPHeaderFields");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __32__SSVLeaseRequestOperation_main__block_invoke_18;
  v27[3] = &unk_1E47BA5D8;
  v28 = v3;
  v24 = v3;
  objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v27);

}

uint64_t __32__SSVLeaseRequestOperation_main__block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (BOOL)_loadCertificateDataIfNecessary:(id *)a3
{
  void *v5;
  int v6;
  SSVLeaseCertificateRequestOperation *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__56;
  v16 = __Block_byref_object_dispose__56;
  v17 = 0;
  -[SSVPlaybackLeaseRequest _certificateData](self->_request, "_certificateData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
    *((_BYTE *)v19 + 24) = 1;
  }
  else
  {
    v7 = -[SSVLeaseCertificateRequestOperation initWithConfiguration:]([SSVLeaseCertificateRequestOperation alloc], "initWithConfiguration:", self->_configuration);
    -[SSVLeaseRequestOperation certificateURLBagKey](self, "certificateURLBagKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLeaseCertificateRequestOperation setCertificateURLBagKey:](v7, "setCertificateURLBagKey:", v8);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__SSVLeaseRequestOperation__loadCertificateDataIfNecessary___block_invoke;
    v11[3] = &unk_1E47BE858;
    v11[5] = &v12;
    v11[6] = &v18;
    v11[4] = self;
    -[SSVLeaseCertificateRequestOperation setOutputBlock:](v7, "setOutputBlock:", v11);
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v7);

    v6 = *((unsigned __int8 *)v19 + 24);
    if (a3 && !*((_BYTE *)v19 + 24))
    {
      *a3 = objc_retainAutorelease((id)v13[5]);
      v6 = *((unsigned __int8 *)v19 + 24);
    }
  }
  v9 = v6 != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

void __60__SSVLeaseRequestOperation__loadCertificateDataIfNecessary___block_invoke(_QWORD *a1, void *a2, id obj)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
  v6 = obj;
  v7 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v7 != 0;
  objc_msgSend(*(id *)(a1[4] + 336), "_setCertificateData:", v7);

}

- (BOOL)_resolveConfigurationAndURLReturningError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  SSVPlaybackLeaseConfiguration *configuration;
  OS_dispatch_semaphore *bagLoadSemaphore;
  dispatch_semaphore_t v10;
  dispatch_semaphore_t v11;
  SSURLBag *urlBag;
  NSObject *v13;
  void *v14;
  SSVPlaybackLeaseConfiguration *v15;
  BOOL v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  SSVLeaseRequestOperation *v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__56;
  v32 = __Block_byref_object_dispose__56;
  v33 = 0;
  -[SSVPlaybackLeaseRequest _URLBagKey](self->_request, "_URLBagKey");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_urlBag)
  {
    if (v5)
    {
      -[SSVPlaybackLeaseRequest _URL](self->_request, "_URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        configuration = self->_configuration;

        if (configuration)
          goto LABEL_12;
      }
    }
    else if (self->_configuration)
    {
      goto LABEL_14;
    }
    bagLoadSemaphore = self->_bagLoadSemaphore;
    if (bagLoadSemaphore)
      v10 = bagLoadSemaphore;
    else
      v10 = dispatch_semaphore_create(0);
    v11 = v10;
    urlBag = self->_urlBag;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __70__SSVLeaseRequestOperation__resolveConfigurationAndURLReturningError___block_invoke;
    v23 = &unk_1E47BE880;
    v24 = v6;
    v25 = self;
    v27 = &v28;
    v13 = v11;
    v26 = v13;
    -[SSURLBag loadWithCompletionBlock:](urlBag, "loadWithCompletionBlock:", &v20);
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (!v6)
  {
    if (self->_configuration)
      goto LABEL_14;
LABEL_18:
    if (!v29[5])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 137, 0, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v29[5];
      v29[5] = v18;

    }
    v16 = 0;
    if (a3)
      goto LABEL_15;
    goto LABEL_16;
  }
LABEL_12:
  -[SSVPlaybackLeaseRequest _URL](self->_request, "_URL", v20, v21, v22, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_18;
  v15 = self->_configuration;

  if (!v15)
    goto LABEL_18;
LABEL_14:
  v16 = 1;
  if (a3)
LABEL_15:
    *a3 = objc_retainAutorelease((id)v29[5]);
LABEL_16:

  _Block_object_dispose(&v28, 8);
  return v16;
}

void __70__SSVLeaseRequestOperation__resolveConfigurationAndURLReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  SSVPlaybackLeaseConfiguration *v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (v15)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v15, "objectForKey:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 336), "_setURL:", v7);
      }
      else
      {
        SSError((uint64_t)CFSTR("SSErrorDomain"), 124, 0, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v7 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;
      }

    }
    v13 = -[SSVPlaybackLeaseConfiguration initWithURLBagDictionary:]([SSVPlaybackLeaseConfiguration alloc], "initWithURLBagDictionary:", v15);
    v14 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v14 + 320);
    *(_QWORD *)(v14 + 320) = v13;
    goto LABEL_10;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 111, 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
LABEL_10:

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (BOOL)_shouldRetryForError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t retryCount;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {

LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != -1001)
    goto LABEL_6;
  retryCount = self->_retryCount;
  if (retryCount > 1)
    goto LABEL_6;
  self->_retryCount = retryCount + 1;
  v8 = 1;
LABEL_7:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_certificateURLBagKey, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_bagKey, 0);
  objc_storeStrong((id *)&self->_bagLoadSemaphore, 0);
}

@end
