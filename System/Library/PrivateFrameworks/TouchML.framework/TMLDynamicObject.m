@implementation TMLDynamicObject

- (TMLDynamicObject)init
{
  TMLDynamicObject *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *properties;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TMLDynamicObject;
  v2 = -[TMLDynamicObject init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    properties = v2->_properties;
    v2->_properties = v3;

  }
  return v2;
}

+ (id)dynamicPropertyType:(id)a3
{
  return 0;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  void *v5;
  objc_class *v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  const char *v28;
  void *v29;
  double v30;
  const __CFString *v31;
  void (*v32)(void);
  void *v33;
  const char *v34;
  double v35;
  const char *v36;
  double v37;
  double (*v38)(uint64_t, SEL);
  void (*v39)(void);
  const char *v40;
  double v41;
  const char *v42;
  double v43;
  const char *v44;
  double v45;
  id v46;
  const char *v47;
  double v48;
  const char *v49;
  int isEqualToString;
  void (*v52)(void);

  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  if ((unint64_t)objc_msgSend_length(v5, v7, v8) >= 4
    && objc_msgSend_hasPrefix_(v5, v9, v10, CFSTR("set")))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = 1;
    objc_msgSend_substringWithRange_(v5, v9, v10, 3, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_length(v5, v17, v18);
    objc_msgSend_substringWithRange_(v5, v20, v21, 4, v19 - 5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v11, v23, v24, CFSTR("%@%@"), v16, v22);
    v25 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v25;
    objc_msgSend_dynamicPropertyType_(a1, v26, v27, v25);
  }
  else
  {
    v12 = 0;
    objc_msgSend_dynamicPropertyType_(a1, v9, v10, v5);
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (v12)
      v31 = CFSTR("v@:%@");
    else
      v31 = CFSTR("%@@:");
    if (v12)
      v32 = (void (*)(void))sub_22AD7BE28;
    else
      v32 = (void (*)(void))sub_22AD7BF1C;
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v28, v30, v31, v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasPrefix_(v29, v34, v35, CFSTR("{CGPoint=")))
    {
      v38 = sub_22AD7C088;
      v39 = (void (*)(void))sub_22AD7BF7C;
    }
    else if (objc_msgSend_hasPrefix_(v29, v36, v37, CFSTR("{CGSize=")))
    {
      v38 = sub_22AD7C228;
      v39 = (void (*)(void))sub_22AD7C11C;
    }
    else if (objc_msgSend_hasPrefix_(v29, v40, v41, CFSTR("{CGRect=")))
    {
      v38 = sub_22AD7C3E0;
      v39 = (void (*)(void))sub_22AD7C2BC;
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v29, v42, v43, CFSTR("f")))
      {
        isEqualToString = objc_msgSend_isEqualToString_(v29, v44, v45, CFSTR("I"));
        v52 = (void (*)(void))sub_22AD7C718;
        if (v12)
          v52 = (void (*)(void))sub_22AD7C614;
        if (isEqualToString)
          v32 = v52;
        goto LABEL_23;
      }
      v38 = sub_22AD7C594;
      v39 = (void (*)(void))sub_22AD7C490;
    }
    if (v12)
      v32 = v39;
    else
      v32 = (void (*)(void))v38;
LABEL_23:
    v46 = objc_retainAutorelease(v33);
    v49 = (const char *)objc_msgSend_UTF8String(v46, v47, v48);
    class_addMethod(v6, a3, v32, v49);

  }
  return v29 != 0;
}

- (NSMutableDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
