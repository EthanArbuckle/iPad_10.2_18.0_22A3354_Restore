@implementation YNHF5E1zsUQomY0e

- (YNHF5E1zsUQomY0e)initWithtaDFBApmLBObrNlM:(_KUwyEjpVZR65eUyl *)a3 itCyNcNHxjurvzrS:(id)a4
{
  id v7;
  YNHF5E1zsUQomY0e *v8;
  YNHF5E1zsUQomY0e *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)YNHF5E1zsUQomY0e;
  v8 = -[YNHF5E1zsUQomY0e init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_LvlWuLAGTFjI8z1M = a3;
    objc_storeStrong((id *)&v8->_fubP36M2a0RaVUtL, a4);
  }

  return v9;
}

- (void)nQ82YhFf5OQDL4Qk:(id)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 TWWnmIjkBlMfHmma:(id)a6
{
  void (**v10)(id, _QWORD);
  id v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  void *v18;
  _QWORD block[5];
  id v20;
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  _eipjLVDiD7LNwlPc *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v10 = (void (**)(id, _QWORD))a3;
  v11 = a6;
  if (qword_100511608 != -1)
    dispatch_once(&qword_100511608, &stru_1004CF268);
  v12 = dispatch_semaphore_create(0);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_10002C30C;
  v34 = sub_10002C31C;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v13 = qword_100511610;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C324;
  block[3] = &unk_1004CF290;
  v22 = &v30;
  block[4] = self;
  v24 = a4;
  v25 = a5;
  v14 = v11;
  v20 = v14;
  v23 = &v26;
  v15 = v12;
  v21 = v15;
  dispatch_async(v13, block);
  v16 = dispatch_time(0, 1000000 * self->_LvlWuLAGTFjI8z1M->var3);
  if (dispatch_semaphore_wait(v15, v16) && !*((_BYTE *)v27 + 24))
  {
    v17 = objc_claimAutoreleasedReturnValue(+[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:](eTBtehykeBvfpeTP, "hKjCyPlJs74k9vMV:", 200));
    v18 = (void *)v31[5];
    v31[5] = v17;

  }
  v10[2](v10, v31[5]);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

}

- (_KUwyEjpVZR65eUyl)LvlWuLAGTFjI8z1M
{
  return self->_LvlWuLAGTFjI8z1M;
}

- (void)setLvlWuLAGTFjI8z1M:(_KUwyEjpVZR65eUyl *)a3
{
  self->_LvlWuLAGTFjI8z1M = a3;
}

- (eTBtehykeBvfpeTP)fubP36M2a0RaVUtL
{
  return (eTBtehykeBvfpeTP *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFubP36M2a0RaVUtL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fubP36M2a0RaVUtL, 0);
}

@end
