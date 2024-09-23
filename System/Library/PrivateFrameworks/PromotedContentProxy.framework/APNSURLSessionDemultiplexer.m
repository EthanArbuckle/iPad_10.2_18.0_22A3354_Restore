@implementation APNSURLSessionDemultiplexer

- (APNSURLSessionDemultiplexer)initWithConfiguration:(id)a3 forIdentifier:(id)a4 withMaximumRequestCount:(int64_t)a5 delegateQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  objc_super v38;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v38.receiver = self;
  v38.super_class = (Class)APNSURLSessionDemultiplexer;
  v13 = -[APNSURLSessionDemultiplexer init](&v38, sel_init);
  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x24BDFD4C0]);
    v18 = objc_msgSend_initWithOptions_(v14, v15, 1, v16, v17);
    v19 = (void *)*((_QWORD *)v13 + 9);
    *((_QWORD *)v13 + 9) = v18;

    v24 = objc_msgSend_copy(v10, v20, v21, v22, v23);
    v25 = (void *)*((_QWORD *)v13 + 5);
    *((_QWORD *)v13 + 5) = v24;

    v30 = objc_msgSend_copy(v11, v26, v27, v28, v29);
    v31 = (void *)*((_QWORD *)v13 + 3);
    *((_QWORD *)v13 + 3) = v30;

    v32 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v33 = (void *)*((_QWORD *)v13 + 4);
    *((_QWORD *)v13 + 4) = v32;

    atomic_store(0, (unint64_t *)v13 + 1);
    *((_BYTE *)v13 + 16) = 0;
    *((_QWORD *)v13 + 7) = a5;
    objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(MEMORY[0x24BDB74B0], v34, *((_QWORD *)v13 + 5), (uint64_t)v13, (uint64_t)v12);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)*((_QWORD *)v13 + 6);
    *((_QWORD *)v13 + 6) = v35;

  }
  return (APNSURLSessionDemultiplexer *)v13;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend_invalidateAndCancel(self->_session, a2, v2, v3, v4);
  v6.receiver = self;
  v6.super_class = (Class)APNSURLSessionDemultiplexer;
  -[APNSURLSessionDemultiplexer dealloc](&v6, sel_dealloc);
}

- (int64_t)requestCount
{
  return atomic_load((unint64_t *)&self->_requestCount);
}

- (id)dataTaskWithRequest:(id)a3 delegate:(id)a4 modes:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t *p_requestCount;
  unint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  APNSURLSessionTaskInfo *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSString *identifier;
  uint64_t v92;
  uint8_t buf[4];
  const char *v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  NSString *v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend_sessionMarkedInvalid(self, v11, v12, v13, v14))
  {
    APLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136642819;
      v94 = "-[APNSURLSessionDemultiplexer dataTaskWithRequest:delegate:modes:]";
      v20 = "%{sensitive}s -- The current session is already marked for invalidation. No further requests possible.";
      v21 = v19;
      v22 = 12;
LABEL_4:
      _os_log_impl(&dword_22ACB2000, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
    }
  }
  else
  {
    if (objc_msgSend_maximumRequestCount(self, v15, v16, v17, v18) < 1
      || (v28 = objc_msgSend_requestCount(self, v24, v25, v26, v27),
          v28 < objc_msgSend_maximumRequestCount(self, v29, v30, v31, v32)))
    {
      p_requestCount = &self->_requestCount;
      do
        v34 = __ldaxr((unint64_t *)p_requestCount);
      while (__stlxr(v34 + 1, (unint64_t *)p_requestCount));
      if (!objc_msgSend_count(v10, v24, v25, v26, v27))
      {
        v92 = *MEMORY[0x24BDBCA90];
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v35, (uint64_t)&v92, 1, v38);
        v39 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v39;
      }
      objc_msgSend_session(self, v35, v36, v37, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataTaskWithRequest_(v40, v41, (uint64_t)v8, v42, v43);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = [APNSURLSessionTaskInfo alloc];
      v19 = objc_msgSend_initWithTask_delegate_modes_(v44, v45, (uint64_t)v23, (uint64_t)v9, (uint64_t)v10);
      objc_msgSend_lock(self, v46, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lock(v50, v51, v52, v53, v54);
      objc_msgSend_taskInfoByTaskIdentifier(self, v55, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)MEMORY[0x24BDD16E0];
      v65 = objc_msgSend_taskIdentifier(v23, v61, v62, v63, v64);
      objc_msgSend_numberWithUnsignedInteger_(v60, v66, v65, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v59, v70, (uint64_t)v19, (uint64_t)v69, v71);

      objc_msgSend_unlock(v50, v72, v73, v74, v75);
      goto LABEL_13;
    }
    v77 = objc_msgSend_requestCount(self, v24, v25, v26, v27);
    if (v77 != objc_msgSend_maximumRequestCount(self, v78, v79, v80, v81))
    {
      v23 = 0;
      goto LABEL_14;
    }
    objc_msgSend_invalidateSession(self, v82, v83, v84, v85);
    APLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v90 = objc_msgSend_maximumRequestCount(self, v86, v87, v88, v89);
      identifier = self->_identifier;
      *(_DWORD *)buf = 136643331;
      v94 = "-[APNSURLSessionDemultiplexer dataTaskWithRequest:delegate:modes:]";
      v95 = 2048;
      v96 = v90;
      v97 = 2112;
      v98 = identifier;
      v20 = "%{sensitive}s -- Maximum request count reached: %ld for creative: %@. Session will be invalidated.";
      v21 = v19;
      v22 = 32;
      goto LABEL_4;
    }
  }
  v23 = 0;
LABEL_13:

LABEL_14:
  return v23;
}

- (void)removeTask:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;

  if (a3)
  {
    objc_msgSend_taskInfoForTask_(self, a2, (uint64_t)a3, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v47 = v6;
      objc_msgSend_lock(self, v7, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lock(v11, v12, v13, v14, v15);
      objc_msgSend_taskInfoByTaskIdentifier(self, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_task(v47, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_taskIdentifier(v26, v27, v28, v29, v30);
      objc_msgSend_numberWithUnsignedInteger_(v21, v32, v31, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectForKey_(v20, v36, (uint64_t)v35, v37, v38);

      objc_msgSend_unlock(v11, v39, v40, v41, v42);
      objc_msgSend_invalidate(v47, v43, v44, v45, v46);

      v6 = v47;
    }

  }
}

- (void)invalidateAndCancelSessionWithCompletionHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(void);

  v24 = (void (**)(void))a3;
  objc_msgSend_setSessionMarkedInvalid_(self, v4, 1, v5, v6);
  objc_msgSend_session(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_setSessionInvalidated_(self, v12, (uint64_t)v24, v13, v14);
    objc_msgSend_session(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invalidateAndCancel(v19, v20, v21, v22, v23);

  }
  else if (v24)
  {
    v24[2]();
  }

}

- (void)invalidateSession
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  objc_msgSend_setSessionMarkedInvalid_(self, a2, 1, v2, v3);
  objc_msgSend_session(self, v5, v6, v7, v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishTasksAndInvalidate(v13, v9, v10, v11, v12);

}

- (id)taskInfoForTask:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v9, v10, v11, v12, v13);
  objc_msgSend_taskInfoByTaskIdentifier(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD16E0];
  v24 = objc_msgSend_taskIdentifier(v4, v20, v21, v22, v23);

  objc_msgSend_numberWithUnsignedInteger_(v19, v25, v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v18, v29, (uint64_t)v28, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_unlock(v9, v33, v34, v35, v36);
  return v32;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(void);
  const char *v22;
  uint64_t v23;
  uint64_t v24;

  objc_msgSend_setSession_(self, a2, 0, (uint64_t)a4, v4);
  objc_msgSend_setIdentifier_(self, v6, 0, v7, v8);
  objc_msgSend_setTaskInfoByTaskIdentifier_(self, v9, 0, v10, v11);
  objc_msgSend_sessionInvalidated(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_sessionInvalidated(self, v17, v18, v19, v20);
    v21 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v21[2]();

    objc_msgSend_setSessionInvalidated_(self, v22, 0, v23, v24);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_taskInfoForTask_(self, v14, (uint64_t)v11, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_delegate(v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = sub_22ACB6CD4;
    v27[3] = &unk_24F4E18E0;
    v28 = v17;
    v29 = v10;
    v30 = v11;
    v31 = v12;
    v32 = v13;
    objc_msgSend_performBlock_(v28, v24, (uint64_t)v27, v25, v26);

  }
  else
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_taskInfoForTask_(self, v11, (uint64_t)v9, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_delegate(v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_22ACB6E30;
    v24[3] = &unk_24F4E1908;
    v25 = v14;
    v26 = v8;
    v27 = v9;
    v28 = v10;
    objc_msgSend_performBlock_(v25, v21, (uint64_t)v24, v22, v23);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
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
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_taskInfoForTask_(self, v11, (uint64_t)v9, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v19, v20, v21, v22, v23);
  objc_msgSend_taskInfoByTaskIdentifier(self, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_task(v14, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_taskIdentifier(v34, v35, v36, v37, v38);
  objc_msgSend_numberWithUnsignedInteger_(v29, v40, v39, v41, v42);
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v28, v44, v43, v45, v46);

  objc_msgSend_unlock(v19, v47, v48, v49, v50);
  objc_msgSend_delegate(v14, v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v43) = objc_opt_respondsToSelector();

  if ((v43 & 1) != 0)
  {
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = sub_22ACB701C;
    v63[3] = &unk_24F4E1908;
    v64 = v14;
    v65 = v8;
    v66 = v9;
    v67 = v10;
    objc_msgSend_performBlockAndWait_(v64, v60, (uint64_t)v63, v61, v62);

  }
  else
  {
    objc_msgSend_invalidate(v14, v56, v57, v58, v59);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend_taskInfoForTask_(self, v17, (uint64_t)v13, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_delegate(v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) != 0)
  {
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = sub_22ACB71D0;
    v30[3] = &unk_24F4E1930;
    v31 = v20;
    v32 = v12;
    v33 = v13;
    v34 = v14;
    v35 = v15;
    v36 = v16;
    objc_msgSend_performBlock_(v31, v27, (uint64_t)v30, v28, v29);

  }
  else
  {
    (*((void (**)(id, id))v16 + 2))(v16, v15);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char isKindOfClass;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  char v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  void (**v46)(id, uint64_t, _QWORD);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  objc_msgSend_failureResponse(v12, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend_failureResponse(v12, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_statusCode(v24, v25, v26, v27, v28);

    v30 = v29 != 407;
  }
  else
  {
    v30 = 1;
  }
  objc_msgSend_taskInfoForTask_(self, v20, (uint64_t)v11, v22, v23);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_delegate(v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_opt_respondsToSelector();

  if (v30 || (v37 & 1) == 0)
  {
    v13[2](v13, 1, 0);
  }
  else
  {
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = sub_22ACB73E0;
    v41[3] = &unk_24F4E18E0;
    v42 = v31;
    v43 = v10;
    v44 = v11;
    v45 = v12;
    v46 = v13;
    objc_msgSend_performBlock_(v42, v38, (uint64_t)v41, v39, v40);

  }
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSMutableDictionary)taskInfoByTaskIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTaskInfoByTaskIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSURLSessionConfiguration)configuration
{
  return (NSURLSessionConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int64_t)maximumRequestCount
{
  return self->_maximumRequestCount;
}

- (void)setMaximumRequestCount:(int64_t)a3
{
  self->_maximumRequestCount = a3;
}

- (id)sessionInvalidated
{
  return self->_sessionInvalidated;
}

- (void)setSessionInvalidated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)sessionMarkedInvalid
{
  return self->_sessionMarkedInvalid;
}

- (void)setSessionMarkedInvalid:(BOOL)a3
{
  self->_sessionMarkedInvalid = a3;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_sessionInvalidated, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_taskInfoByTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
