@implementation TMLUIControlState

+ (BOOL)isControlStateClass:(id)a3
{
  double v3;
  void *v4;
  const char *v5;
  double v6;
  char isEqualToString;

  objc_msgSend_className(a3, a2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v4, v5, v6, CFSTR("UIControlState"));

  return isEqualToString;
}

+ (void)registerControlState:(id)a3 forClass:(Class)a4
{
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  id v19;
  const char *v20;
  double v21;
  const char *v22;
  objc_class *ClassPair;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[6];

  v29 = a3;
  objc_msgSend_properties(v29, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = sub_22AD74E28;
  v31[3] = &unk_24F501388;
  v31[4] = a1;
  v31[5] = a4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v8, v10, v11, v31);

  v12 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass(a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_className(v29, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v12, v17, v18, CFSTR("%@_%@"), v13, v16);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = (const char *)objc_msgSend_UTF8String(v19, v20, v21);

  if (!objc_getClass(v22))
  {
    ClassPair = objc_allocateClassPair((Class)a1, v22, 0);
    objc_msgSend_properties(v29, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v9;
    v30[1] = 3221225472;
    v30[2] = sub_22AD74F7C;
    v30[3] = &unk_24F503D38;
    v30[4] = ClassPair;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v26, v27, v28, v30);

    objc_registerClassPair(ClassPair);
  }

}

+ (void)verifyStateProperty:(id)a3 withClass:(Class)a4
{
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  void *v10;
  const char *v11;
  double v12;
  NSString *v13;
  const char *v14;
  objc_method *InstanceMethod;
  const char *v16;
  double v17;
  char *v18;
  const char *v19;
  double v20;
  const char *v21;
  id v22;
  size_t v23;
  const char *v24;
  double v25;
  __CFString *v26;
  const char *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
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
  void *v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  NSString *v52;
  const char *v53;
  const char *v54;
  double v55;
  uint64_t v56;
  const char *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  const char *v62;
  double v63;
  void *v64;
  const char *v65;
  double v66;
  void *v67;
  const char *v68;
  double v69;
  id v70;
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
  const char *v85;
  double v86;
  void *v87;
  const char *v88;
  double v89;
  void *v90;
  const char *v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  const char *v96;
  double v97;
  void *v98;
  const char *v99;
  double v100;
  void *v101;
  const char *v102;
  double v103;
  void *v104;
  const char *v105;
  double v106;
  void *v107;
  const char *v108;
  double v109;
  id v110;
  id v111;
  const __CFString *v112;
  id v113;
  const __CFString *v114;
  id v115;
  const __CFString *v116;
  id v117;
  const __CFString *v118;
  _QWORD v119[2];

  v119[1] = *MEMORY[0x24BDAC8D0];
  v111 = a3;
  if (!objc_msgSend_type(v111, v5, v6))
  {
    v59 = (void *)MEMORY[0x24BDBCE88];
    v60 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_description(v111, v7, v8);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v60, v62, v63, CFSTR("Cannot register property of unsupported type %@"), v61);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = CFSTR("property");
    v119[0] = v111;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v65, v66, v119, &v118, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v59, v68, v69, CFSTR("TMLRuntimeException"), v64, v67);
    v70 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v70);
  }
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_propertyName(v111, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v9, v11, v12, CFSTR("%@ForState:"), v10);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  v14 = NSSelectorFromString(v13);
  InstanceMethod = class_getInstanceMethod(a4, v14);
  if (!InstanceMethod)
  {
    v71 = (void *)MEMORY[0x24BDBCE88];
    v72 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_description(a4, v16, v17);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v72, v74, v75, CFSTR("Method %@ not found in class %@"), v13, v73);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = CFSTR("property");
    v117 = v111;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v77, v78, &v117, &v116, 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v71, v80, v81, CFSTR("TMLRuntimeException"), v76, v79);
    v82 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  v18 = method_copyReturnType(InstanceMethod);
  if (v18)
  {
    v21 = v18;
    v22 = objc_alloc(MEMORY[0x24BDD17C8]);
    v23 = strlen(v21);
    v26 = (__CFString *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v22, v24, v25, v21, v23, 1, 1);
    v29 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v27, v28, v26);
  }
  else
  {
    v26 = CFSTR(" ");
    v29 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v19, v20, CFSTR(" "));
  }
  v30 = v29;

  v31 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_propertyName(v111, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v34, v35, v36, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_capitalizedString(v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_propertyName(v111, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringFromIndex_(v43, v44, v45, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v31, v47, v48, CFSTR("%@%@"), v40, v46);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v31, v50, v51, CFSTR("set%@:forState:"), v49);
  v52 = (NSString *)objc_claimAutoreleasedReturnValue();

  v53 = NSSelectorFromString(v52);
  if (!class_getInstanceMethod(a4, v53))
  {
    v83 = (void *)MEMORY[0x24BDBCE88];
    v84 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_description(a4, v54, v55);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v84, v85, v86, CFSTR("Method %@ not found in class %@"), v52, v73);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = CFSTR("property");
    v115 = v111;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v88, v89, &v115, &v114, 1);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v83, v91, v92, CFSTR("TMLRuntimeException"), v87, v90);
    v82 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
    objc_exception_throw(v82);
  }
  v56 = objc_msgSend_type(v111, v54, v55);
  if (v56 != v30
    && (v30 != 4 || v56 != 3)
    && (v30 != 3 || v56 != 4)
    && (v30 != 5 || v56 != 7)
    && (v30 != 16 || (unint64_t)objc_msgSend_type(v111, v57, v58) <= 0xF))
  {
    v93 = (void *)MEMORY[0x24BDBCE88];
    v94 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_typeNameForType_(TMLTypeRegistry, v57, v58, v30);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v111, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_propertyName(v111, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v94, v102, v103, CFSTR("Runtime type mismatch %@ vs %@ for %@"), v95, v98, v101);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = CFSTR("property");
    v113 = v111;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v105, v106, &v113, &v112, 1);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v93, v108, v109, CFSTR("TMLRuntimeException"), v104, v107);
    v110 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v110);
  }

}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

@end
