@implementation TMLJSEnvironment

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (id)sharedVM
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AD2D514;
  block[3] = &unk_24F4FD280;
  block[4] = a1;
  if (qword_255B51AC8 != -1)
    dispatch_once(&qword_255B51AC8, block);
  return (id)qword_255B51AC0;
}

+ (void)applicationDidReceiveMemoryWarningNotification:(id)a3
{
  ((void (*)(id, char *))MEMORY[0x24BEDD108])(a1, sel_forceGC);
}

+ (id)protoJSContext
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  double v12;

  if (!qword_255B51AB0)
  {
    v3 = objc_alloc(MEMORY[0x24BDDA720]);
    objc_msgSend_sharedVM(a1, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_initWithVirtualMachine_(v3, v7, v8, v6);
    v10 = (void *)qword_255B51AB0;
    qword_255B51AB0 = v9;

    objc_msgSend_initializeJSContext_(a1, v11, v12, qword_255B51AB0);
  }
  return (id)qword_255B51AB0;
}

+ (id)createJSContextWithRuntimeContext:(id)a3
{
  uint64_t v3;
  double v4;

  v3 = objc_opt_class();
  return (id)MEMORY[0x24BEDD108](v3, sel_protoJSContext, v4);
}

+ (void)runInContext:(id)a3 block:(id)a4
{
  void (**v6)(_QWORD);
  const char *v7;
  double v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (objc_msgSend_valid(v11, v7, v8))
  {
    v9 = (id)qword_255B51AA0;
    objc_storeStrong((id *)&qword_255B51AA0, a3);
    v6[2](v6);
    v10 = (void *)qword_255B51AA0;
    qword_255B51AA0 = (uint64_t)v9;

  }
}

+ (id)currentContext
{
  return (id)qword_255B51AA0;
}

+ (void)setCurrentContext:(id)a3
{
  objc_storeStrong((id *)&qword_255B51AA0, a3);
}

+ (id)validCurrentContext
{
  return (id)qword_255B51AA0;
}

+ (void)forceGC
{
  double v2;
  const char *v4;
  double v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const OpaqueJSContext *v15;
  const char *v16;
  double v17;
  id v18;

  v18 = (id)objc_msgSend_copy((void *)qword_255B51AD0, a2, v2);
  objc_msgSend_removeAllObjects((void *)qword_255B51AD0, v4, v5);
  v6 = objc_alloc(MEMORY[0x24BDDA720]);
  objc_msgSend_sharedVM(a1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithVirtualMachine_(v6, v10, v11, v9);

  v15 = (const OpaqueJSContext *)objc_msgSend_JSGlobalContextRef(v12, v13, v14);
  JSGarbageCollect(v15);
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v18, v16, v17, 2, &unk_24F4FE1E8);

}

+ (void)addGCCallback:(id)a3
{
  void *v3;
  const char *v4;
  double v5;
  id v6;

  v3 = (void *)qword_255B51AD0;
  v6 = (id)MEMORY[0x22E2E7E44](a3, a2);
  objc_msgSend_addObject_(v3, v4, v5, v6);

}

+ (void)requireModule:(id)a3 forJSContext:(id)a4
{
  const char *v5;
  id v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if ((id)qword_255B51AB0 != v6 || (objc_msgSend_containsObject_((void *)qword_255B51AB8, v5, v7, v19) & 1) == 0)
  {
    objc_msgSend_requireModule_(TMLRuntime, v5, v7, v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_globalObject(v6, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_initializeJSContext_(v8, v12, v13, v11);

      if ((id)qword_255B51AB0 == v6)
      {
        v16 = (void *)qword_255B51AB8;
        if (!qword_255B51AB8)
        {
          objc_msgSend_set(MEMORY[0x24BDBCEF0], v14, v15);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)qword_255B51AB8;
          qword_255B51AB8 = v17;

          v16 = (void *)qword_255B51AB8;
        }
        objc_msgSend_addObject_(v16, v14, v15, v19);
      }
    }

  }
}

+ (void)addToDefaultModules:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = (void *)qword_255B51AB0;
  qword_255B51AB0 = 0;
  v4 = a3;

  v5 = (void *)objc_opt_class();
  objc_msgSend_defaultModules(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v11, v12, v13, v4);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_orderedSetWithArray_(MEMORY[0x24BDBCF00], v14, v15, v18);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)qword_255B51AA8;
  qword_255B51AA8 = v16;

}

+ (id)defaultModules
{
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)qword_255B51AA8;
  if (!qword_255B51AA8)
  {
    objc_msgSend_orderedSetWithObjects_(MEMORY[0x24BDBCF00], a2, v2, CFSTR("Foundation"), CFSTR("CoreGraphics"), CFSTR("UIKit"), 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_255B51AA8;
    qword_255B51AA8 = v4;

    v3 = (void *)qword_255B51AA8;
  }
  return v3;
}

+ (void)initializeJSContext:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  const char *v50;
  double v51;
  const char *v52;
  double v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_setExceptionHandler_(v3, v4, v5, &unk_24F4FE228);
  objc_msgSend_initializeJSContext_(TMLContext, v6, v7, v3);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v8 = (void *)objc_opt_class();
  objc_msgSend_defaultModules(v8, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, v13, &v54, v58, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v55;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v55 != v16)
          objc_enumerationMutation(v11);
        v18 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v17);
        v19 = (void *)objc_opt_class();
        objc_msgSend_requireModule_forJSContext_(v19, v20, v21, v18, v3);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v22, v23, &v54, v58, 16);
    }
    while (v15);
  }

  objc_msgSend_globalObject(v3, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_jsValueInContext_(TMLJSNil, v27, v28, v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v26, v30, v31, v29, CFSTR("Nil"));
  objc_msgSend_setObject_forKeyedSubscript_(v26, v32, v33, v29, CFSTR("nil"));

  objc_msgSend_valueWithBool_inContext_(MEMORY[0x24BDDA730], v34, v35, 0, v3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v26, v37, v38, v36, CFSTR("NO"));

  objc_msgSend_valueWithBool_inContext_(MEMORY[0x24BDDA730], v39, v40, 1, v3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v26, v42, v43, v41, CFSTR("YES"));

  objc_msgSend_setObject_forKeyedSubscript_(v26, v44, v45, &unk_24F4FE268, CFSTR("object"));
  objc_msgSend_setObject_forKeyedSubscript_(v26, v46, v47, &unk_24F4FE268, CFSTR("value"));
  objc_msgSend_setObject_forKeyedSubscript_(v26, v48, v49, &unk_24F4FE2A8, CFSTR("isNil"));
  objc_msgSend_setObject_forKeyedSubscript_(v26, v50, v51, &unk_24F4FE2C8, CFSTR("isEmpty"));
  objc_msgSend_setObject_forKeyedSubscript_(v26, v52, v53, &unk_24F4FE308, CFSTR("safearray"));

}

+ (id)convertTmlValue:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  uint64_t v6;
  const char *v7;
  double v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  void *v13;
  TMLSize *v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  id v19;
  TMLRect *v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  TMLPoint *v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  const char *v30;
  TMLAffineTransform *v31;
  double v32;
  double v33;
  const char *v34;
  TMLTransform3D *v35;
  double v36;
  double v37;
  TMLInsets *v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  TMLRange *v43;
  const char *v44;
  double v45;
  uint64_t v46;
  const char *v47;
  double v48;
  TMLAttributedString *v49;
  const char *v50;
  double v51;
  TMLFont *v52;
  const char *v53;
  double v54;
  TMLVector *v55;
  const char *v56;
  TMLOffset *v57;
  const char *v58;
  double v59;
  const char *v60;
  double v61;
  TMLDirectionalEdgeInsets *v62;
  const char *v63;
  double v64;
  const char *v65;
  double v66;
  void *v67;
  const char *v68;
  double v69;
  void *v71;
  void *v72;
  void *v73;
  const char *v74;
  double v75;
  void *v76;
  const char *v77;
  double v78;
  void *v79;
  const char *v80;
  double v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  const char *v86;
  double v87;
  void *v88;
  const char *v89;
  double v90;
  id v91;
  _OWORD v92[8];
  _OWORD v93[3];
  double v94;
  double v95;
  const __CFString *v96;
  _QWORD v97[2];

  v97[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v6 = objc_msgSend_valueType(v3, v4, v5);
  objc_msgSend_value(v3, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v9;
  v13 = 0;
  switch(v6)
  {
    case 1:
      goto LABEL_37;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_27;
      v13 = 0;
      goto LABEL_37;
    case 8:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      v14 = [TMLSize alloc];
      objc_msgSend_CGSizeValue(v12, v15, v16);
      v19 = (id)objc_msgSend_initWithSize_(v14, v17, v18);
      goto LABEL_28;
    case 9:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      v20 = [TMLRect alloc];
      objc_msgSend_CGRectValue(v12, v21, v22);
      v19 = (id)objc_msgSend_initWithRect_(v20, v23, v24);
      goto LABEL_28;
    case 10:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      v25 = [TMLPoint alloc];
      objc_msgSend_CGPointValue(v12, v26, v27);
      v19 = (id)objc_msgSend_initWithPoint_(v25, v28, v29);
      goto LABEL_28;
    case 11:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      v31 = [TMLAffineTransform alloc];
      if (v12)
      {
        objc_msgSend_CGAffineTransformValue(v12, v30, v32);
      }
      else
      {
        v33 = 0.0;
        memset(v93, 0, sizeof(v93));
      }
      v19 = (id)objc_msgSend_initWithAffineTransform_(v31, v30, v33, v93);
      goto LABEL_28;
    case 12:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      v35 = [TMLTransform3D alloc];
      if (v12)
      {
        objc_msgSend_CATransform3DValue(v12, v34, v36);
      }
      else
      {
        v37 = 0.0;
        memset(v92, 0, sizeof(v92));
      }
      v19 = (id)objc_msgSend_initWithTransform3D_(v35, v34, v37, v92);
      goto LABEL_28;
    case 13:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      v38 = [TMLInsets alloc];
      objc_msgSend_UIEdgeInsetsValue(v12, v39, v40);
      v19 = (id)objc_msgSend_initWithInsets_(v38, v41, v42);
      goto LABEL_28;
    case 14:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      v43 = [TMLRange alloc];
      v46 = objc_msgSend_rangeValue(v12, v44, v45);
      v19 = (id)objc_msgSend_initWithRange_(v43, v47, v48, v46, v47);
      goto LABEL_28;
    case 15:
      goto LABEL_27;
    case 16:
      if (!v9)
        goto LABEL_36;
      goto LABEL_27;
    case 17:
    case 19:
    case 20:
    case 21:
    case 23:
    case 24:
    case 27:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
LABEL_27:
      v19 = v12;
      goto LABEL_28;
    case 18:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      v49 = [TMLAttributedString alloc];
      v19 = (id)objc_msgSend_initWithAttributedString_(v49, v50, v51, v12);
      goto LABEL_28;
    case 22:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      v52 = [TMLFont alloc];
      v19 = (id)objc_msgSend_initWithFont_(v52, v53, v54, v12);
      goto LABEL_28;
    case 25:
      goto LABEL_35;
    case 28:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      v94 = 0.0;
      v95 = 0.0;
      objc_msgSend_getValue_(v12, v10, v11, &v94);
      v55 = [TMLVector alloc];
      v19 = (id)objc_msgSend_initWithVector_(v55, v56, v94, v95);
      goto LABEL_28;
    case 29:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      v57 = [TMLOffset alloc];
      objc_msgSend_UIOffsetValue(v12, v58, v59);
      v19 = (id)objc_msgSend_initWithOffset_(v57, v60, v61);
      goto LABEL_28;
    case 30:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v62 = [TMLDirectionalEdgeInsets alloc];
        objc_msgSend_directionalEdgeInsetsValue(v12, v63, v64);
        v19 = (id)objc_msgSend_initWithDirectionalEdgeInsets_(v62, v65, v66);
LABEL_28:
        v13 = v19;
      }
      else
      {
LABEL_35:
        if (v12)
        {
          v71 = (void *)MEMORY[0x24BDBCE88];
          v72 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_typeNameForType_(TMLTypeRegistry, v10, v11, v6);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v72, v74, v75, CFSTR("Value conversion failed for type '%@'"), v73);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = CFSTR("value");
          v97[0] = v12;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v77, v78, v97, &v96, 1);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_exceptionWithName_reason_userInfo_(v71, v80, v81, CFSTR("TMLRuntimeException"), v76, v79);
          v82 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v82);
        }
LABEL_36:
        objc_msgSend_currentContext(MEMORY[0x24BDDA720], v10, v11);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_jsValueInContext_(TMLJSNil, v68, v69, v67);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
LABEL_37:

      return v13;
    default:
      v83 = (void *)MEMORY[0x24BDBCE88];
      v84 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_typeNameForType_(TMLTypeRegistry, v10, v11, v6);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v84, v86, v87, CFSTR("Unsupported value type '%@'"), v85);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v83, v89, v90, CFSTR("TMLRuntimeException"), v88, 0);
      v91 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v91);
  }
}

+ (id)convertJsValue:(id)a3 toType:(unint64_t)a4
{
  id v5;
  const char *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  const char *v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  unsigned int v22;
  const char *v23;
  double v24;
  void *v25;
  int v26;
  const char *v27;
  double v28;
  void *v29;
  void *v30;
  const char *v31;
  double v32;
  uint64_t v33;
  const char *v34;
  double v35;
  id v36;
  uint64_t v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  uint64_t v42;
  const char *v43;
  double v44;
  const char *v45;
  double v46;
  uint64_t v47;
  const char *v48;
  double v49;
  const char *v50;
  double v51;
  uint64_t v52;
  const char *v53;
  double v54;
  const char *v55;
  double v56;
  uint64_t v57;
  const char *v58;
  double v59;
  const char *v60;
  double v61;
  uint64_t v62;
  const char *v63;
  double v64;
  const char *v65;
  double v66;
  uint64_t v67;
  const char *v68;
  double v69;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  const char *v74;
  double v75;
  const char *v76;
  double v77;
  void *v78;
  const char *v79;
  double v80;
  char isNil;
  const char *v82;
  double v83;
  uint64_t v84;
  const char *v85;
  double v86;
  const char *v87;
  double v88;
  uint64_t v89;
  const char *v90;
  double v91;
  const char *v92;
  double v93;
  uint64_t v94;
  const char *v95;
  double v96;
  const char *v97;
  double v98;
  uint64_t v99;
  const char *v100;
  double v101;
  uint64_t v102;
  const char *v103;
  double v104;
  const char *v105;
  double v106;
  uint64_t v107;
  const char *v108;
  double v109;
  const char *v110;
  double v111;
  uint64_t v112;
  const char *v113;
  double v114;
  const char *v115;
  double v116;
  void *v118;
  void *v119;
  void *v120;
  const char *v121;
  double v122;
  void *v123;
  const char *v124;
  double v125;
  id v126;

  v5 = a3;
  v8 = v5;
  v9 = 0;
  switch(a4)
  {
    case 1uLL:
      break;
    case 2uLL:
      v10 = (void *)MEMORY[0x24BDD16E0];
      v11 = objc_msgSend_toBool(v5, v6, v7);
      objc_msgSend_numberWithBool_(v10, v12, v13, v11);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 3uLL:
      v15 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_toDouble(v5, v6, v7);
      *(float *)&v16 = v16;
      objc_msgSend_numberWithFloat_(v15, v17, v16);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 4uLL:
      v18 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_toDouble(v5, v6, v7);
      objc_msgSend_numberWithDouble_(v18, v19, v20);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 5uLL:
      v21 = (void *)MEMORY[0x24BDD16E0];
      v22 = objc_msgSend_toUInt32(v5, v6, v7);
      objc_msgSend_numberWithUnsignedInteger_(v21, v23, v24, v22);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 6uLL:
      v25 = (void *)MEMORY[0x24BDD16E0];
      v26 = objc_msgSend_toInt32(v5, v6, v7);
      objc_msgSend_numberWithInteger_(v25, v27, v28, v26);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 7uLL:
      v29 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_toNumber(v5, v6, v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_unsignedLongLongValue(v30, v31, v32);
      objc_msgSend_numberWithUnsignedLongLong_(v29, v34, v35, v33);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 8uLL:
      v37 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v38, v39, v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CGSizeValue(v30, v40, v41);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 9uLL:
      v42 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v43, v44, v42);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CGRectValue(v30, v45, v46);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xAuLL:
      v47 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v48, v49, v47);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CGPointValue(v30, v50, v51);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xBuLL:
      v52 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v53, v54, v52);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CGAffineTransformValue(v30, v55, v56);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xCuLL:
      v57 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v58, v59, v57);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CATransform3DValue(v30, v60, v61);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xDuLL:
      v62 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v63, v64, v62);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UIEdgeInsetsValue(v30, v65, v66);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xEuLL:
      v67 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v68, v69, v67);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_NSRangeValue(v30, v70, v71);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xFuLL:
      objc_msgSend_toObject(v5, v6, v7);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x10uLL:
      if ((objc_msgSend_isUndefined(v5, v6, v7) & 1) != 0)
        goto LABEL_21;
      objc_msgSend_toObject(v8, v72, v73);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isNil_(TMLJSNil, v74, v75, v30) & 1) != 0)
      {
        v9 = 0;
      }
      else
      {
        v36 = v30;
LABEL_32:
        v9 = v36;
      }

      break;
    case 0x11uLL:
      if ((objc_msgSend_isUndefined(v5, v6, v7) & 1) != 0
        || (objc_msgSend_toObject(v8, v76, v77),
            v78 = (void *)objc_claimAutoreleasedReturnValue(),
            isNil = objc_msgSend_isNil_(TMLJSNil, v79, v80, v78),
            v78,
            (isNil & 1) != 0))
      {
LABEL_21:
        v9 = 0;
      }
      else
      {
        objc_msgSend_toString(v8, v82, v83);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_28:
        v9 = (void *)v14;
      }
      break;
    case 0x12uLL:
      v84 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v85, v86, v84);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_NSAttributedString(v30, v87, v88);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x13uLL:
      objc_msgSend_toArray(v5, v6, v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      sub_22AD2EB18(v30);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x14uLL:
      objc_msgSend_toDictionary(v5, v6, v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      sub_22AD2EBBC(v30);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x15uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x1BuLL:
      v99 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v100, v101, v99);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x16uLL:
      v89 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v90, v91, v89);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UIFontValue(v30, v92, v93);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x19uLL:
      v94 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v95, v96, v94);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_blockValue(v30, v97, v98);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x1CuLL:
      v102 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v103, v104, v102);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CGVectorValue(v30, v105, v106);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x1DuLL:
      v107 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v108, v109, v107);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UIOffsetValue(v30, v110, v111);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0x1EuLL:
      v112 = objc_opt_class();
      objc_msgSend_toObjectOfClass_(v8, v113, v114, v112);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_NSDirectionalEdgeInsetsValue(v30, v115, v116);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    default:
      v118 = (void *)MEMORY[0x24BDBCE88];
      v119 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_typeNameForType_(TMLTypeRegistry, v6, v7, a4);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v119, v121, v122, CFSTR("Unsupported value type '%@'"), v120);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v118, v124, v125, CFSTR("TMLRuntimeException"), v123, 0);
      v126 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v126);
  }

  return v9;
}

+ (id)normalizeValue:(id)a3 toType:(unint64_t)a4
{
  return sub_22AD2EC6C(a3, a4);
}

@end
