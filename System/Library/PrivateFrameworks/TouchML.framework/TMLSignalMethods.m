@implementation TMLSignalMethods

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (void)addSignalMethod:(id)a3 forProtocol:(id)a4 toClass:(Class)a5
{
  Protocol *v7;
  const char *v8;
  double v9;
  const char *v10;
  NSString *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  const char *v20;
  double v21;
  char isOptional;
  double v23;
  objc_method_description MethodDescription;
  void *v25;
  id v26;
  id v27;
  const char *v28;
  double v29;
  uint64_t v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t i;
  id v39;
  const char *v40;
  double v41;
  uint64_t ArgumentTypeAtIndex;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  uint64_t (**v48)(_QWORD, _QWORD);
  const char *v49;
  double v50;
  void *v51;
  void (*v52)(void);
  const char *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  const char *v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  void *v64;
  const char *Name;
  const char *v66;
  double v67;
  const char *v68;
  double v69;
  void *v70;
  const char *v71;
  double v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  const char *v77;
  double v78;
  void *v79;
  const char *v80;
  double v81;
  void *v82;
  const char *v83;
  double v84;
  void *v85;
  const char *v86;
  double v87;
  id v88;
  const __CFString *v89;
  id v90;
  const __CFString *v91;
  id v92;
  const __CFString *v93;
  _QWORD v94[2];

  v94[1] = *MEMORY[0x24BDAC8D0];
  v88 = a3;
  v7 = (Protocol *)a4;
  objc_msgSend_methodSelector(v88, v8, v9);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend_methodName(v88, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameters(v88, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_methodSelectorForMethodName_parameters_(TMLMethodDescriptor, v17, v18, v13, v16);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  v19 = NSSelectorFromString(v11);
  if (!class_getInstanceMethod(a5, v19))
  {
    isOptional = objc_msgSend_isOptional(v88, v20, v21);
    MethodDescription = protocol_getMethodDescription(v7, v19, isOptional != 1, 1);
    if (MethodDescription.name)
    {
      objc_msgSend_signatureWithObjCTypes_(MEMORY[0x24BDBCEB0], MethodDescription.types, v23, MethodDescription.types);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_alloc(MEMORY[0x24BDD16A8]);
      v27 = objc_retainAutorelease(v25);
      v30 = objc_msgSend_methodReturnType(v27, v28, v29);
      v33 = (void *)objc_msgSend_initWithCString_encoding_(v26, v31, v32, v30, 1);
      v36 = objc_msgSend_numberOfArguments(v27, v34, v35);
      if (v36 >= 3)
      {
        v37 = v36;
        for (i = 2; i != v37; ++i)
        {
          v39 = objc_retainAutorelease(v27);
          ArgumentTypeAtIndex = objc_msgSend_getArgumentTypeAtIndex_(v39, v40, v41, i);
          objc_msgSend_appendFormat_(v33, v43, v44, CFSTR("%s"), ArgumentTypeAtIndex);
        }
      }
      sub_22AD6AD84();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v45, v46, v47, v33);
      v48 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        objc_msgSend_signalName(v88, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void (*)(void))((uint64_t (**)(_QWORD, void *))v48)[2](v48, v51);

        if (class_addMethod(a5, v19, v52, MethodDescription.types))
        {

          goto LABEL_11;
        }
        v74 = (void *)MEMORY[0x24BDBCE88];
        v75 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_signalName(v88, v53, v54);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_description(a5, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v75, v80, v81, CFSTR("Failed to add method for signal %@ to class %@"), v76, v79);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = CFSTR("method");
        v90 = v88;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v83, v84, &v90, &v89, 1);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_exceptionWithName_reason_userInfo_(v74, v86, v87, CFSTR("TMLRuntimeException"), v82, v85);
        v73 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
        objc_exception_throw(v73);
      }
      v55 = (void *)MEMORY[0x24BDBCE88];
      v64 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_signalName(v88, v49, v50);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      Name = protocol_getName(v7);
      objc_msgSend_stringWithFormat_(v64, v66, v67, CFSTR("Unsupported method signature for signal %@ in protocol %s"), v57, Name);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = CFSTR("method");
      v92 = v88;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v68, v69, &v92, &v91, 1);
    }
    else
    {
      v55 = (void *)MEMORY[0x24BDBCE88];
      v56 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_methodSelector(v88, MethodDescription.types, v23);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = protocol_getName(v7);
      objc_msgSend_stringWithFormat_(v56, v59, v60, CFSTR("Protocol method not found %@ in protocol %s"), v57, v58);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = CFSTR("method");
      v94[0] = v88;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v62, v63, v94, &v93, 1);
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v55, v71, v72, CFSTR("TMLRuntimeException"), v61, v70);
    v73 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
LABEL_11:

}

+ (void)verifySignalMethod:(id)a3 forProtocol:(id)a4
{
  Protocol *v5;
  const char *v6;
  double v7;
  const char *v8;
  NSString *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  const char *v18;
  double v19;
  char isOptional;
  double v21;
  objc_method_description MethodDescription;
  void *v23;
  id v24;
  id v25;
  const char *v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t i;
  id v37;
  const char *v38;
  double v39;
  uint64_t ArgumentTypeAtIndex;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  const char *Name;
  const char *v53;
  double v54;
  void *v55;
  const char *v56;
  double v57;
  void *v58;
  const char *v59;
  double v60;
  id v61;
  id v62;
  const __CFString *v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x24BDAC8D0];
  v62 = a3;
  v5 = (Protocol *)a4;
  objc_msgSend_methodSelector(v62, v6, v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend_methodName(v62, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameters(v62, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_methodSelectorForMethodName_parameters_(TMLMethodDescriptor, v15, v16, v11, v14);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  v17 = NSSelectorFromString(v9);
  isOptional = objc_msgSend_isOptional(v62, v18, v19);
  MethodDescription = protocol_getMethodDescription(v5, v17, isOptional != 1, 1);
  if (MethodDescription.name)
  {
    objc_msgSend_signatureWithObjCTypes_(MEMORY[0x24BDBCEB0], MethodDescription.types, v21, MethodDescription.types);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc(MEMORY[0x24BDD16A8]);
    v25 = objc_retainAutorelease(v23);
    v28 = objc_msgSend_methodReturnType(v25, v26, v27);
    v31 = (void *)objc_msgSend_initWithCString_encoding_(v24, v29, v30, v28, 1);
    v34 = objc_msgSend_numberOfArguments(v25, v32, v33);
    if (v34 >= 3)
    {
      v35 = v34;
      for (i = 2; i != v35; ++i)
      {
        v37 = objc_retainAutorelease(v25);
        ArgumentTypeAtIndex = objc_msgSend_getArgumentTypeAtIndex_(v37, v38, v39, i);
        objc_msgSend_appendFormat_(v31, v41, v42, CFSTR("%s"), ArgumentTypeAtIndex);
      }
    }
    sub_22AD6AD84();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v43, v44, v45, v31);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v46)
    {
      v49 = (void *)MEMORY[0x24BDBCE88];
      v50 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_signalName(v62, v47, v48);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      Name = protocol_getName(v5);
      objc_msgSend_stringWithFormat_(v50, v53, v54, CFSTR("Unsupported method signature for signal %@ in protocol %s"), v51, Name);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = CFSTR("method");
      v64[0] = v62;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v56, v57, v64, &v63, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v49, v59, v60, CFSTR("TMLRuntimeException"), v55, v58);
      v61 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v61);
    }

  }
}

@end
