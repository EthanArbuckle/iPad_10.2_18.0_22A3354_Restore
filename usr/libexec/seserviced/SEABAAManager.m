@implementation SEABAAManager

+ (id)sharedManager
{
  if (qword_10034BAE0 != -1)
    dispatch_once(&qword_10034BAE0, &stru_1003033C8);
  return (id)qword_10034BAD8;
}

- (id)PerformSEABAAWithAttestation:(id)a3 casdCertificate:(id)a4 nonce:(id)a5 OIDs:(id)a6 validityInterval:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  dispatch_time_t v23;
  intptr_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v41;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint8_t *v47;
  uint64_t v48;
  os_unfair_lock_s *v49;
  uint64_t v50;
  const char *v51;
  int v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint8_t buf[8];
  uint8_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  id v69;

  v41 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a3;
  v19 = SESDefaultLogObject(v17, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "", buf, 2u);
  }

  v69 = v17;
  sub_10002BF28((uint64_t)SESSignatureFixer, &v69);
  v21 = v69;

  *(_QWORD *)buf = 0;
  v64 = buf;
  v65 = 0x3032000000;
  v66 = sub_1000109E0;
  v67 = sub_1000109F0;
  v68 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = sub_1000109E0;
  v61 = sub_1000109F0;
  v62 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v48 = 0;
  v49 = (os_unfair_lock_s *)&v48;
  v50 = 0x2810000000;
  v51 = "";
  v52 = 0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000109F8;
  v42[3] = &unk_1003033F0;
  v44 = &v48;
  v45 = &v53;
  v46 = &v57;
  v47 = buf;
  v22 = dispatch_semaphore_create(0);
  v43 = v22;
  sub_100010B78((uint64_t)self, v21, v41, v14, v15, v16, v42);
  v23 = dispatch_time(0, 60000000000);
  v24 = dispatch_semaphore_wait(v22, v23);
  if (v24)
  {
    os_unfair_lock_lock(v49 + 8);
    if (!*((_BYTE *)v54 + 24))
    {
      v27 = SESDefaultLogObject(v25, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = SESCreateAndLogError(0, v28, SESErrorDomain, 2, CFSTR("Timed out waiting for SEBAA"));
      v30 = objc_claimAutoreleasedReturnValue(v29);
      v31 = (void *)v58[5];
      v58[5] = v30;

      *((_BYTE *)v54 + 24) = 1;
    }
    os_unfair_lock_unlock(v49 + 8);
  }
  if (v58[5] && SESInternalVariant(v24))
  {
    v32 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.seserviced"));
    if (objc_msgSend(v32, "BOOLForKey:", CFSTR("debug.allow.cert.failure")))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("DEAD"), "hexStringAsData"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("DEAD"), "hexStringAsData"));
      v35 = sub_100010AF4((uint64_t)SEABAAResponse, v33, v34);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      v37 = (void *)*((_QWORD *)v64 + 5);
      *((_QWORD *)v64 + 5) = v36;

      v38 = (void *)v58[5];
      v58[5] = 0;

    }
  }
  if (a8)
    *a8 = objc_retainAutorelease((id)v58[5]);
  v39 = *((id *)v64 + 5);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(buf, 8);
  return v39;
}

@end
