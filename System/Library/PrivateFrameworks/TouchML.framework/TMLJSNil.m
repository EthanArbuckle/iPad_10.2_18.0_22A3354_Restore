@implementation TMLJSNil

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AD78288;
  block[3] = &unk_24F4FD280;
  block[4] = a1;
  if (qword_255B51D18 != -1)
    dispatch_once(&qword_255B51D18, block);
  return (id)qword_255B51D10;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  double v3;

  objc_msgSend_sharedInstance(a1, a2, v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (TMLJSNil)init
{
  char *v2;
  TMLJSNil *v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TMLJSNil;
  v2 = -[TMLJSNil init](&v9, sel_init);
  v3 = (TMLJSNil *)v2;
  if (v2)
  {
    v4 = (_OWORD *)MEMORY[0x24BDDA880];
    v5 = *(_OWORD *)(MEMORY[0x24BDDA880] + 16);
    *((_OWORD *)v2 + 1) = *MEMORY[0x24BDDA880];
    *((_OWORD *)v2 + 2) = v5;
    v6 = v4[3];
    *((_OWORD *)v2 + 3) = v4[2];
    *((_OWORD *)v2 + 4) = v6;
    v7 = v4[5];
    *((_OWORD *)v2 + 5) = v4[4];
    *((_OWORD *)v2 + 6) = v7;
    *((_DWORD *)v2 + 5) = 2;
    *((_QWORD *)v2 + 3) = "Nil";
    *((_QWORD *)v2 + 4) = 0;
    *((_QWORD *)v2 + 7) = nullsub_5;
    *((_QWORD *)v2 + 8) = nullsub_6;
    *((_QWORD *)v2 + 9) = sub_22AD783E0;
    *((_QWORD *)v2 + 10) = sub_22AD78404;
    *((_QWORD *)v2 + 11) = sub_22AD7840C;
    *((_QWORD *)v2 + 14) = sub_22AD78418;
    *((_QWORD *)v2 + 15) = j__JSValueMakeUndefined;
    *((_QWORD *)v2 + 16) = sub_22AD78420;
    *((_QWORD *)v2 + 17) = sub_22AD78428;
    *((_QWORD *)v2 + 1) = JSClassCreate((const JSClassDefinition *)(v2 + 16));
  }
  return v3;
}

+ (id)jsValueInContext:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;

  v4 = a3;
  objc_msgSend_sharedInstance(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_jsValueInContext_(v7, v8, v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)unwrap:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  id v8;

  v4 = a3;
  if (objc_msgSend_isNil_(a1, v5, v6, v4))
    v7 = 0;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

+ (BOOL)isNil:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_objectForKey_(v3, v4, v5, CFSTR("$__tml_nil__$"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)jsValueInContext:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const OpaqueJSContext *v11;
  JSObjectRef v12;
  const char *v13;
  double v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  id v24;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, v6, CFSTR("Nil"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (!v7 || objc_msgSend_isUndefined(v7, v8, v9))
  {
    v11 = (const OpaqueJSContext *)objc_msgSend_JSGlobalContextRef(v4, v8, v9);
    v12 = JSObjectMake(v11, self->_jsClassRef, 0);
    objc_msgSend_valueWithJSValueRef_inContext_(MEMORY[0x24BDDA730], v13, v14, v12, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *MEMORY[0x24BDDA608];
    v26[0] = *MEMORY[0x24BDDA5E8];
    v26[1] = v16;
    v27[0] = MEMORY[0x24BDBD1C8];
    v27[1] = MEMORY[0x24BDBD1C0];
    v26[2] = *MEMORY[0x24BDDA600];
    v27[2] = CFSTR("$__tml_nil__$");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v17, v18, v27, v26, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defineProperty_descriptor_(v15, v20, v21, CFSTR("$__tml_nil__$"), v19);

    objc_msgSend_setObject_forKeyedSubscript_(v4, v22, v23, v15, CFSTR("Nil"));
    v10 = v15;
  }
  v24 = v10;

  return v24;
}

@end
