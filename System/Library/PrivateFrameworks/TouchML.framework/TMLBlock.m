@implementation TMLBlock

- (TMLBlock)initWithFunction:(id)a3 argumentsEncoding:(id)a4
{
  id v6;
  id v7;
  TMLBlock *v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  id block;
  const char *v14;
  double v15;
  TMLBlock *v16;
  void *v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)TMLBlock;
  v8 = -[TMLBlock init](&v31, sel_init);
  if (v8
    && (v9 = (void *)objc_opt_class(),
        objc_msgSend_createBlockForJSFunction_argumentsEncoding_(v9, v10, v11, v6, v7),
        v12 = objc_claimAutoreleasedReturnValue(),
        block = v8->_block,
        v8->_block = (id)v12,
        block,
        !v8->_block))
  {
    v17 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v14, v15, CFSTR("Unsupported block signature <%@>"), v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v17, v22, v23, v18, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v27, v28, v29, v24);

    v16 = 0;
  }
  else
  {
    v16 = v8;
  }

  return v16;
}

- (TMLBlock)initWithFunctionWithValue:(id)a3 argumentsEncoding:(id)a4
{
  id v6;
  id v7;
  TMLBlock *v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  id block;
  const char *v14;
  double v15;
  TMLBlock *v16;
  void *v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)TMLBlock;
  v8 = -[TMLBlock init](&v31, sel_init);
  if (v8
    && (v9 = (void *)objc_opt_class(),
        objc_msgSend_createBlockWithValueForJSFunction_argumentsEncoding_(v9, v10, v11, v6, v7),
        v12 = objc_claimAutoreleasedReturnValue(),
        block = v8->_block,
        v8->_block = (id)v12,
        block,
        !v8->_block))
  {
    v17 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v14, v15, CFSTR("Unsupported block signature <%@>"), v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueWithNewErrorFromMessage_inContext_(v17, v22, v23, v18, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setException_(v27, v28, v29, v24);

    v16 = 0;
  }
  else
  {
    v16 = v8;
  }

  return v16;
}

+ (id)blockWithFunction:(id)a3
{
  double v3;

  return (id)objc_msgSend_blockWithFunction_argumentsEncoding_(a1, a2, v3, a3, &stru_24F505EA8);
}

- (void)dealloc
{
  id block;
  objc_super v4;

  block = self->_block;
  self->_block = 0;

  v4.receiver = self;
  v4.super_class = (Class)TMLBlock;
  -[TMLBlock dealloc](&v4, sel_dealloc);
}

+ (void)callBlock:(id)a3 arguments:(id)a4
{
  const char *v5;
  id v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a3;
  v6 = a4;
  if (v12)
  {
    v8 = objc_msgSend_count(v6, v5, v7);
    if (v8 == 1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v6, v9, v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v11);

    }
    else if (!v8)
    {
      ((void (*)(void))v12[2])();
    }
  }

}

- (id)blockValue
{
  return self->_block;
}

+ (id)createBlockForJSFunction:(id)a3 argumentsEncoding:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  int v29;
  void *v30;
  const char *v31;
  double v32;
  int isEqualToString;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  int v39;
  void *v40;
  const char *v41;
  double v42;
  int v43;
  id v44;
  id v45;
  void *v46;
  const char *v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  void *v52;
  const char *v53;
  double v54;
  id v55;
  const char *v56;
  double v57;
  id v58;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v5 = a3;
  v6 = a4;
  objc_msgSend_currentContext(TMLJSEnvironment, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_managedValueWithValue_(MEMORY[0x24BDDA728], v10, v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend_length(v6, v13, v14))
  {
    case 1:
      if (objc_msgSend_isEqualToString_(v6, v15, v16, CFSTR("@")))
      {
        v71 = MEMORY[0x24BDAC760];
        v19 = &unk_24F4FD620;
        v20 = sub_22AD20B24;
        v21 = &v71;
        goto LABEL_19;
      }
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v17, v18, "B");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v6, v31, v32, v30);

      if (isEqualToString)
      {
        v70 = MEMORY[0x24BDAC760];
        v19 = &unk_24F4FD670;
        v20 = sub_22AD20C90;
        v21 = &v70;
        goto LABEL_19;
      }
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v34, v35, "f");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_isEqualToString_(v6, v41, v42, v40);

      if (!v43)
        goto LABEL_21;
      v69 = MEMORY[0x24BDAC760];
      v19 = &unk_24F4FD6C0;
      v20 = sub_22AD20DD4;
      v21 = &v69;
      goto LABEL_19;
    case 2:
      if (objc_msgSend_isEqualToString_(v6, v15, v16, CFSTR("@@")))
      {
        v68 = MEMORY[0x24BDAC760];
        v19 = &unk_24F4FD710;
        v20 = sub_22AD20F20;
        v21 = &v68;
        goto LABEL_19;
      }
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v24, v25, CFSTR("%s@"), "B");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_isEqualToString_(v6, v37, v38, v36);

      if (!v39)
        goto LABEL_21;
      v67 = MEMORY[0x24BDAC760];
      v19 = &unk_24F4FD760;
      v20 = sub_22AD210F4;
      v21 = &v67;
      goto LABEL_19;
    case 3:
      if (objc_msgSend_isEqualToString_(v6, v15, v16, CFSTR("@@@")))
      {
        v66 = MEMORY[0x24BDAC760];
        v19 = &unk_24F4FD7B0;
        v20 = sub_22AD21290;
        v21 = &v66;
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v22, v23, CFSTR("@%s@"), "B");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend_isEqualToString_(v6, v27, v28, v26);

        if (!v29)
          goto LABEL_21;
        v65 = MEMORY[0x24BDAC760];
        v19 = &unk_24F4FD800;
        v20 = sub_22AD214BC;
        v21 = &v65;
      }
LABEL_19:
      v21[1] = 3221225472;
      v21[2] = (uint64_t)v20;
      v21[3] = (uint64_t)v19;
      v44 = v9;
      v21[4] = (uint64_t)v44;
      v45 = v12;
      v21[5] = (uint64_t)v45;
      v46 = (void *)MEMORY[0x22E2E7E44](v21);

      if (v46)
      {
        objc_msgSend_context(v5, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_virtualMachine(v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addManagedReference_withOwner_(v52, v53, v54, v45, v44);
        v60[0] = MEMORY[0x24BDAC760];
        v60[1] = 3221225472;
        v60[2] = sub_22AD2193C;
        v60[3] = &unk_24F4FD5F8;
        v61 = v52;
        v62 = v45;
        v63 = v44;
        v55 = v52;
        objc_msgSend_runBlock_onFinalize_(TMLObjectFinalizer, v56, v57, v60, v46);
        v58 = v46;

        goto LABEL_22;
      }
LABEL_21:
      v58 = 0;
LABEL_22:

      return v58;
    case 4:
      if (!objc_msgSend_isEqualToString_(v6, v15, v16, CFSTR("@@@@")))
        goto LABEL_21;
      v64 = MEMORY[0x24BDAC760];
      v19 = &unk_24F4FD850;
      v20 = sub_22AD216B0;
      v21 = &v64;
      goto LABEL_19;
    default:
      v72 = MEMORY[0x24BDAC760];
      v19 = &unk_24F4FD5D0;
      v20 = sub_22AD20954;
      v21 = &v72;
      goto LABEL_19;
  }
}

+ (id)createBlockWithValueForJSFunction:(id)a3 argumentsEncoding:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  int v29;
  void *v30;
  const char *v31;
  double v32;
  int isEqualToString;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  int v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  int v45;
  void *v46;
  const char *v47;
  double v48;
  int v49;
  id v50;
  id v51;
  void *v52;
  const char *v53;
  double v54;
  void *v55;
  const char *v56;
  double v57;
  void *v58;
  const char *v59;
  double v60;
  id v61;
  const char *v62;
  double v63;
  id v64;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v5 = a3;
  v6 = a4;
  objc_msgSend_currentContext(TMLJSEnvironment, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_managedValueWithValue_(MEMORY[0x24BDDA728], v10, v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend_length(v6, v13, v14))
  {
    case 1:
      if (objc_msgSend_isEqualToString_(v6, v15, v16, CFSTR("@")))
      {
        v78 = MEMORY[0x24BDAC760];
        v19 = &unk_24F4FD8A0;
        v20 = sub_22AD21F40;
        v21 = &v78;
        goto LABEL_21;
      }
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v17, v18, "B");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v6, v31, v32, v30);

      if (isEqualToString)
      {
        v77 = MEMORY[0x24BDAC760];
        v19 = &unk_24F4FD8C8;
        v20 = sub_22AD22024;
        v21 = &v77;
        goto LABEL_21;
      }
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v34, v35, "f");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend_isEqualToString_(v6, v43, v44, v42);

      if (!v45)
        goto LABEL_23;
      v76 = MEMORY[0x24BDAC760];
      v19 = &unk_24F4FD8F0;
      v20 = sub_22AD220F4;
      v21 = &v76;
      goto LABEL_21;
    case 2:
      if (objc_msgSend_isEqualToString_(v6, v15, v16, CFSTR("@@")))
      {
        v75 = MEMORY[0x24BDAC760];
        v19 = &unk_24F4FD918;
        v20 = sub_22AD221C4;
        v21 = &v75;
        goto LABEL_21;
      }
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v24, v25, CFSTR("%s@"), "B");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_isEqualToString_(v6, v37, v38, v36);

      if (v39)
      {
        v74 = MEMORY[0x24BDAC760];
        v19 = &unk_24F4FD940;
        v20 = sub_22AD222F0;
        v21 = &v74;
        goto LABEL_21;
      }
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v40, v41, CFSTR("%s@"), "q");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_isEqualToString_(v6, v47, v48, v46);

      if (!v49)
        goto LABEL_23;
      v73 = MEMORY[0x24BDAC760];
      v19 = &unk_24F4FD968;
      v20 = sub_22AD223F8;
      v21 = &v73;
      goto LABEL_21;
    case 3:
      if (objc_msgSend_isEqualToString_(v6, v15, v16, CFSTR("@@@")))
      {
        v72 = MEMORY[0x24BDAC760];
        v19 = &unk_24F4FD990;
        v20 = sub_22AD22500;
        v21 = &v72;
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v22, v23, CFSTR("@%s@"), "B");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend_isEqualToString_(v6, v27, v28, v26);

        if (!v29)
          goto LABEL_23;
        v71 = MEMORY[0x24BDAC760];
        v19 = &unk_24F4FD9B8;
        v20 = sub_22AD22670;
        v21 = &v71;
      }
LABEL_21:
      v21[1] = 3221225472;
      v21[2] = (uint64_t)v20;
      v21[3] = (uint64_t)v19;
      v50 = v9;
      v21[4] = (uint64_t)v50;
      v51 = v12;
      v21[5] = (uint64_t)v51;
      v52 = (void *)MEMORY[0x22E2E7E44](v21);

      if (v52)
      {
        objc_msgSend_context(v5, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_virtualMachine(v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addManagedReference_withOwner_(v58, v59, v60, v51, v50);
        v66[0] = MEMORY[0x24BDAC760];
        v66[1] = 3221225472;
        v66[2] = sub_22AD22968;
        v66[3] = &unk_24F4FD5F8;
        v67 = v58;
        v68 = v51;
        v69 = v50;
        v61 = v58;
        objc_msgSend_runBlock_onFinalize_(TMLObjectFinalizer, v62, v63, v66, v52);
        v64 = v52;

        goto LABEL_24;
      }
LABEL_23:
      v64 = 0;
LABEL_24:

      return v64;
    case 4:
      if (!objc_msgSend_isEqualToString_(v6, v15, v16, CFSTR("@@@@")))
        goto LABEL_23;
      v70 = MEMORY[0x24BDAC760];
      v19 = &unk_24F4FD9E0;
      v20 = sub_22AD227B8;
      v21 = &v70;
      goto LABEL_21;
    default:
      v79 = MEMORY[0x24BDAC760];
      v19 = &unk_24F4FD878;
      v20 = sub_22AD21DE8;
      v21 = &v79;
      goto LABEL_21;
  }
}

+ (void)initializeJSContext:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  _QWORD v17[5];
  _QWORD v18[5];

  v4 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_22AD22A80;
  v18[3] = &unk_24F4FDA00;
  v18[4] = a1;
  v5 = a3;
  v6 = (void *)MEMORY[0x22E2E7E44](v18);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v7, v8, v6, CFSTR("block"));

  objc_msgSend_objectForKeyedSubscript_(v5, v9, v10, CFSTR("block"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v11, v12, v13, &unk_24F4FDA40, CFSTR("invoke"));

  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = sub_22AD234B4;
  v17[3] = &unk_24F4FDA00;
  v17[4] = a1;
  v14 = (void *)MEMORY[0x22E2E7E44](v17);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v15, v16, v14, CFSTR("blockWithValue"));

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
