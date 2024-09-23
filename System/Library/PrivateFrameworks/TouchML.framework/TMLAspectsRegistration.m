@implementation TMLAspectsRegistration

+ (id)shared
{
  if (qword_255B519C0 != -1)
    dispatch_once(&qword_255B519C0, &unk_24F4FD0F8);
  return (id)qword_255B519B8;
}

- (TMLAspectsRegistration)init
{
  const char *v2;
  TMLAspectsRegistration *v3;
  double v4;
  uint64_t v5;
  NSMapTable *registeredAspects;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TMLAspectsRegistration;
  v3 = -[TMLAspectsRegistration init](&v8, sel_init);
  if (v3)
  {
    objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x24BDD1650], v2, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    registeredAspects = v3->_registeredAspects;
    v3->_registeredAspects = (NSMapTable *)v5;

  }
  return v3;
}

- (id)storageForKey:(id)a3 createIfMissing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  void *v10;
  double v11;
  BOOL v12;
  const char *v13;
  double v14;

  v4 = a4;
  v6 = a3;
  objc_msgSend_objectForKey_(self->_registeredAspects, v7, v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v12 = 1;
  else
    v12 = !v4;
  if (!v12)
  {
    objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v9, v11, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(self->_registeredAspects, v13, v14, v10, v6);
  }

  return v10;
}

- (void)registerAspect:(id)a3 withKey:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  id v14;

  v6 = a3;
  objc_msgSend_storageForKey_createIfMissing_(self, v7, v8, a4, 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weakReferenceWithObject_(TMLWeakReferenceObject, v9, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(v14, v12, v13, v11);
}

- (void)unregisterAspect:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;
  BOOL v24;
  TMLAspectsRegistration *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_storageForKey_createIfMissing_(self, v8, v9, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, 0.0, &v26, v30, 16);
  if (!v12)
    goto LABEL_17;
  v15 = v12;
  v25 = self;
  v16 = 0;
  v17 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v27 != v17)
        objc_enumerationMutation(v10);
      v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend_object(v19, v13, v14);
      v20 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v20;
      if (v20)
        v24 = v20 == (_QWORD)v6;
      else
        v24 = 1;
      if (!v24)
      {
        if (!v16)
        {
          objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v21, v22, 3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_addObject_(v16, v21, v22, v19);
      }

    }
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, v14, &v26, v30, 16);
  }
  while (v15);
  self = v25;
  if (v16)
  {
    objc_msgSend_setObject_forKey_(v25->_registeredAspects, v13, v14, v16, v7);

  }
  else
  {
LABEL_17:
    objc_msgSend_removeObjectForKey_(self->_registeredAspects, v13, v14, v7);
  }

}

- (id)strongAspectsFromArray:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  id v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  id v18;
  _QWORD v20[4];
  id v21;

  v3 = a3;
  if (objc_msgSend_count(v3, v4, v5))
  {
    v8 = (void *)MEMORY[0x24BDBCEB8];
    v9 = objc_msgSend_count(v3, v6, v7);
    objc_msgSend_arrayWithCapacity_(v8, v10, v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_22AD1B958;
    v20[3] = &unk_24F4FD120;
    v21 = v12;
    v13 = v12;
    objc_msgSend_enumerateObjectsUsingBlock_(v3, v14, v15, v20);
    objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v16, v17, v13);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v3;
  }

  return v18;
}

- (id)aspectsWithKey:(id)a3
{
  double v3;

  return (id)objc_msgSend_objectForKey_(self->_registeredAspects, a2, v3, a3);
}

- (id)aspectsWithKeys:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, 0.0, &v22, v26, 16);
  if (v6)
  {
    v9 = v6;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v4);
        objc_msgSend_aspectsWithKey_(self, v7, v8, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_count(v13, v14, v15))
        {
          if (!v10)
          {
            objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v16, v17, 2);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_addObjectsFromArray_(v10, v16, v17, v13);
        }

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, v8, &v22, v26, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend_count(v10, v7, v8))
  {
    objc_msgSend_strongAspectsFromArray_(self, v18, v19, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)aspectsForObject:(id)a3 signalName:(id)a4 advice:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend_count(self->_registeredAspects, v10, v11))
  {
    objc_msgSend_metaObjects(v8, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keysForObject_withMetaObjects_signalName_advice_(TMLAspectsRegistration, v15, v16, v8, v14, v9, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_aspectsWithKeys_(self, v18, v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)keyForProtocolNamed:(id)a3 signalName:(id)a4 advice:(int)a5
{
  void *v7;
  id v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  void *v25;

  v7 = (void *)MEMORY[0x24BDD16A8];
  v8 = a4;
  v9 = a3;
  objc_msgSend_stringWithString_(v7, v10, v11, CFSTR("P"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v12, v13, v14, v9);

  objc_msgSend_appendString_(v12, v15, v16, CFSTR("."));
  objc_msgSend_appendString_(v12, v17, v18, v8);

  objc_msgSend_appendString_(v12, v19, v20, CFSTR(":"));
  if (a5)
    objc_msgSend_appendString_(v12, v21, v22, CFSTR("A"));
  else
    objc_msgSend_appendString_(v12, v21, v22, CFSTR("B"));
  objc_msgSend_stringWithString_(MEMORY[0x24BDD17C8], v23, v24, v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)keyForClassNamed:(id)a3 signalName:(id)a4 advice:(int)a5
{
  void *v7;
  id v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  void *v25;

  v7 = (void *)MEMORY[0x24BDD16A8];
  v8 = a4;
  v9 = a3;
  objc_msgSend_stringWithString_(v7, v10, v11, CFSTR("C"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v12, v13, v14, v9);

  objc_msgSend_appendString_(v12, v15, v16, CFSTR("."));
  objc_msgSend_appendString_(v12, v17, v18, v8);

  objc_msgSend_appendString_(v12, v19, v20, CFSTR(":"));
  if (a5)
    objc_msgSend_appendString_(v12, v21, v22, CFSTR("A"));
  else
    objc_msgSend_appendString_(v12, v21, v22, CFSTR("B"));
  objc_msgSend_stringWithString_(MEMORY[0x24BDD17C8], v23, v24, v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)keysForObject:(id)a3 withMetaObjects:(id)a4 signalName:(id)a5 advice:(int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  const char *v12;
  double v13;
  void *v14;
  unint64_t v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  id v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  uint64_t i;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  void *v47;
  const char *v48;
  double v49;
  void *v50;
  const char *v51;
  double v52;
  const char *v53;
  double v54;
  const char *v55;
  double v56;
  objc_class *v57;
  void *v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  void *v64;
  id v66;
  id obj;
  char v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v6 = *(_QWORD *)&a6;
  v81 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend_orderedSetWithCapacity_(MEMORY[0x24BDBCEE0], v12, v13, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0x255B4D000uLL;
  objc_msgSend_keyForClassNamed_signalName_advice_(TMLAspectsRegistration, v16, v17, CFSTR("*"), v11, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v14, v19, v20, v18);

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v21 = v10;
  v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, v23, &v75, v80, 16);
  if (!v70)
  {

LABEL_20:
    v57 = (objc_class *)objc_opt_class();
    NSStringFromClass(v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keyForClassNamed_signalName_advice_((void *)(v15 + 2240), v59, v60, v58, v11, v6);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v14, v62, v63, v61);

    goto LABEL_21;
  }
  v66 = v9;
  obj = v21;
  v68 = 0;
  v69 = *(_QWORD *)v76;
  do
  {
    for (i = 0; i != v70; ++i)
    {
      if (*(_QWORD *)v76 != v69)
        objc_enumerationMutation(obj);
      v27 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
      objc_msgSend_type(v27, v24, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v30 = (void *)objc_opt_class();
        objc_msgSend_type(v27, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_keyForClassNamed_signalName_advice_(v30, v34, v35, v33, v11, v6);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v14, v37, v38, v36);

        v68 = 1;
      }
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      objc_msgSend_implements(v27, v29, 0.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, v41, &v71, v79, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v72;
        do
        {
          for (j = 0; j != v43; ++j)
          {
            if (*(_QWORD *)v72 != v44)
              objc_enumerationMutation(v39);
            v46 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
            v47 = (void *)objc_opt_class();
            objc_msgSend_keyForProtocolNamed_signalName_advice_(v47, v48, v49, v46, v11, v6);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v14, v51, v52, v50);

          }
          v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v53, v54, &v71, v79, 16);
        }
        while (v43);
      }

    }
    v21 = obj;
    v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, v25, &v75, v80, 16);
  }
  while (v70);

  v9 = v66;
  v15 = 0x255B4D000;
  if ((v68 & 1) == 0)
    goto LABEL_20;
LABEL_21:
  objc_msgSend_array(v14, v55, v56);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredAspects, 0);
}

@end
