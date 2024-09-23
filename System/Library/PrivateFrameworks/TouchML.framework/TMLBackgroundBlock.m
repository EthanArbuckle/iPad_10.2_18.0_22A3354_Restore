@implementation TMLBackgroundBlock

+ (void)initializeJSContext:(id)a3
{
  uint64_t v3;
  id v4;
  const char *v5;
  double v6;
  id v7;
  id v8;
  uint64_t block;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;

  block = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = sub_22AD1C65C;
  v12 = &unk_24F4FD280;
  v13 = a1;
  v3 = qword_255B519D8;
  v4 = a3;
  v7 = v4;
  if (v3 != -1)
  {
    dispatch_once(&qword_255B519D8, &block);
    v4 = v7;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v4, v5, v6, &unk_24F4FD2C0, CFSTR("background"), v7, block, v10, v11, v12, v13);

}

+ (id)sharedVM
{
  if (qword_255B519E8 != -1)
    dispatch_once(&qword_255B519E8, &unk_24F4FD330);
  return (id)qword_255B519E0;
}

+ (id)executeFunction:(id)a3 argument:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  void *v37;
  _QWORD v39[5];
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDDA720];
  v8 = a3;
  v9 = [v7 alloc];
  objc_msgSend_sharedVM(a1, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_initWithVirtualMachine_(v9, v13, v14, v12);

  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = sub_22AD1CB98;
  v39[3] = &unk_24F4FD350;
  v39[4] = a1;
  objc_msgSend_setExceptionHandler_(v15, v16, COERCE_DOUBLE(3221225472), v39);
  objc_msgSend_globalObject(v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v19, v20, v21, &unk_24F4FD390, CFSTR("nslog"));
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v22, v23, CFSTR("var _tmlResult=%@; _tmlResult"), v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_evaluateScript_(v15, v25, v26, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v6;
  if (!v6)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[0] = v30;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v28, v29, v40, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callWithArguments_(v27, v32, v33, v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  objc_msgSend_convertJsValue_toType_(TMLJSEnvironment, v35, v36, v34, 16);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

+ (void)handleException:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  id v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  const char *v41;
  double v42;
  const __CFString *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_objectForKeyedSubscript_(v3, v4, v5, CFSTR("stack"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_toString(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByString_(v9, v10, v11, CFSTR("\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_mutableCopy(v12, v13, v14);

  if (v15)
  {
    objc_msgSend_firstObject(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_objectForKeyedSubscript_(v3, v20, v21, CFSTR("line"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_toString(v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v19, v26, v27, CFSTR("%@:#%@"), v18, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_replaceObjectAtIndex_withObject_(v15, v29, v30, 0, v28);

  }
  v31 = objc_alloc(MEMORY[0x24BDBCE88]);
  objc_msgSend_toString(v3, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = CFSTR("stack");
  v44[0] = v15;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, v36, v44, &v43, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend_initWithName_reason_userInfo_(v31, v38, v39, CFSTR("TMLJSException"), v34, v37);

  objc_msgSend_raiseException_(TMLExceptionHandler, v41, v42, v40);
}

@end
