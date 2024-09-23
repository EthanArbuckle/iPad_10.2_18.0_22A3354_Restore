void _RBSXPCEncodeObjectForKey(void *a1, void *a2, void *a3)
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  id *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  xpc_object_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  const char *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_class *aClass;
  id v45;
  void *context;
  id v47;
  _QWORD v48[4];
  _QWORD *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD *v53;
  _QWORD v54[4];
  id v55;
  _QWORD *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v47 = a3;
  context = (void *)MEMORY[0x194018E3C]();
  aClass = (objc_class *)objc_opt_class();
  if (objc_msgSend(v6, "RBSIsXPCObject"))
  {
    v7 = (void *)v5[3];
    if (v47)
    {
      if (!v7)
        v7 = (void *)v5[1];
      v8 = v7;
      xpc_dictionary_set_value(v8, (const char *)objc_msgSend(objc_retainAutorelease(v47), "UTF8String"), v6);

    }
    else
    {
      if (!v7)
        v7 = (void *)v5[1];
      v17 = v7;
      xpc_array_append_value(v17, v6);

    }
    goto LABEL_42;
  }
  if ((_NSIsNSArray() & 1) != 0 || (_NSIsNSSet() & 1) != 0 || _NSIsNSOrderedSet())
  {
    v9 = v5;
    v10 = v47;
    v11 = v6;
    v12 = v9[3];
    if (!v12)
      v12 = v9[1];
    v13 = v12;
    v14 = xpc_array_create(0, 0);
    v45 = v10;
    objc_storeStrong(v9 + 3, v14);
    if (v10)
    {
      if (v13 && MEMORY[0x194019424](v13) == MEMORY[0x1E0C812F8])
        goto LABEL_22;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSXPCEncodeCollectionWithKey(RBSXPCCoder *__strong, NSString *__strong, __strong id<NSFastEnumeration>)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("RBSXPCCoder.m"), 269, &stru_1E2D183D0);
    }
    else
    {
      if (v13 && MEMORY[0x194019424](v13) == MEMORY[0x1E0C812C8])
        goto LABEL_22;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSXPCEncodeCollectionWithKey(RBSXPCCoder *__strong, NSString *__strong, __strong id<NSFastEnumeration>)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("RBSXPCCoder.m"), 268, &stru_1E2D183D0);
    }

LABEL_22:
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSXPCEncodeCollectionWithKey(RBSXPCCoder *__strong, NSString *__strong, __strong id<NSFastEnumeration>)");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("RBSXPCCoder.m"), 270, &stru_1E2D183D0);

    }
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v18 = v11;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v58 != v20)
            objc_enumerationMutation(v18);
          _RBSXPCEncodeObjectForKey(v9, *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i), 0);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      }
      while (v19);
    }

    if (v14)
    {
      if (v45)
      {
        v22 = (const char *)objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
        v23 = v13;
        v24 = v14;
        if (v22)
        {
          if (v13)
          {
            v25 = v24;
            if (MEMORY[0x194019424]() == MEMORY[0x1E0C812C8])
              xpc_dictionary_set_value(v23, v22, v25);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void RBSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("RBSXPCUtilities_Project.h"), 123, CFSTR("key must not be nil"));

        }
      }
      else
      {
        v26 = v13;
        v27 = v14;
        if (v13)
        {
          v28 = v27;
          if (MEMORY[0x194019424]() == MEMORY[0x1E0C812C8])
            xpc_array_append_value(v26, v28);
        }
      }

    }
    v29 = _BSXPCPopEncodingContext(v9, v13);

    goto LABEL_42;
  }
  if (_NSIsNSDictionary())
  {
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = ___RBSXPCEncodeObjectForKey_block_invoke;
    v54[3] = &unk_1E2D17108;
    v55 = v6;
    v56 = v5;
    _BSXPCEncodeDictionaryWithKey(v56, v47, v54);

    v30 = v55;
LABEL_47:

    goto LABEL_42;
  }
  if (objc_msgSend(v6, "supportsRBSXPCSecureCoding"))
  {
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = ___RBSXPCEncodeObjectForKey_block_invoke_2;
    v51[3] = &unk_1E2D17108;
    v52 = v6;
    v53 = v5;
    _BSXPCEncodeDictionaryWithKey(v53, v47, v51);

    v30 = v52;
    goto LABEL_47;
  }
  if (-[objc_class supportsSecureCoding](aClass, "supportsSecureCoding"))
  {
    v31 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v31)
    {
      v32 = (void *)v5[3];
      if (v47)
      {
        if (!v32)
          v32 = (void *)v5[1];
        v33 = v32;
        xpc_dictionary_set_value(v33, (const char *)objc_msgSend(objc_retainAutorelease(v47), "UTF8String"), v31);
      }
      else
      {
        if (!v32)
          v32 = (void *)v5[1];
        v33 = v32;
        xpc_array_append_value(v33, v31);
      }
    }
    else
    {
      if (!v5[4])
      {
        v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
        v39 = (void *)v5[4];
        v5[4] = v38;

      }
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = ___RBSXPCEncodeObjectForKey_block_invoke_3;
      v48[3] = &unk_1E2D17108;
      v49 = v5;
      v50 = v6;
      _BSXPCEncodeDictionaryWithKey(v49, v47, v48);

      v33 = v49;
    }

  }
  else
  {
    v34 = (void *)MEMORY[0x1E0C99DA0];
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(aClass);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ could not encode object %@ because it supports neither RBSXPC[Secure]Coding nor NSSecureCoding."), v36, v37);

  }
LABEL_42:
  objc_autoreleasePoolPop(context);

}

void sub_190CD808C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, Class aClass, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint8_t buf,int a42,int a43,__int16 a44,int a45,__int16 a46,__int16 a47,uint64_t a48)
{
  __break(1u);
}

void sub_190CD8214(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x190CD81E4);
  }
  JUMPOUT(0x190CD822CLL);
}

id _BSXPCDecodeObjectForKey(void *a1, void *a2, objc_class *a3, uint64_t *a4)
{
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v7 = a1;
  v8 = a2;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject *_BSXPCDecodeObjectForKey(RBSXPCCoder *__strong, NSString *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("RBSXPCCoder.m"), 399, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  v9 = (void *)v7[3];
  if (!v9)
    v9 = (void *)v7[1];
  v10 = v9;
  v11 = objc_retainAutorelease(v8);
  RBSXPCDictionaryGetValue(v10, (const char *)objc_msgSend(v11, "UTF8String"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _BSXPCDecodeObjectFromContext(v7, v12, v11, a3, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id RBSXPCDictionaryGetValue(void *a1, const char *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v5 = a1;
  v6 = v5;
  if (a2)
  {
    if (!v5)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "xpc_object_t  _Nullable RBSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("RBSXPCUtilities_Project.h"), 112, CFSTR("key must not be nil"));

    if (!v6)
      goto LABEL_4;
  }
  if (MEMORY[0x194019424](v6) == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v6, a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (!a3)
      goto LABEL_6;
    v12 = v11;
    v7 = v12;
    if (v12)
    {
      if (MEMORY[0x194019424](v12) == a3)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    goto LABEL_5;
  }
LABEL_4:
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (a3)
  {
LABEL_5:
    v9 = v8;

  }
LABEL_6:

  return v9;
}

id _BSXPCDecodeObjectFromContext(void *a1, void *a2, void *a3, objc_class *a4, uint64_t *a5)
{
  id *v9;
  id *v10;
  id v11;
  id v12;
  void *v13;
  void **v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  objc_class *v23;
  id v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  NSString *v49;
  objc_class *v50;
  void *v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *context;
  id v78;
  id v79;
  id v80;
  Class aClass;
  id applier;
  uint64_t v83;
  void *v84;
  void *v85;
  void **v86;
  id v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t v90;
  _QWORD v91[4];
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v79 = a2;
  v76 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject *_BSXPCDecodeObjectFromContext(RBSXPCCoder *__strong, __strong xpc_object_t, NSString *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInFunction:file:lineNumber:description:", v69, CFSTR("RBSXPCCoder.m"), 405, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expectedClass != nil"));

  }
  v10 = v9 + 3;
  v11 = v9[3];
  if (!v11)
    v11 = v9[1];
  v78 = v11;
  v12 = (id)MEMORY[0x1E0C81288];
  if (v79)
    v13 = v79;
  else
    v13 = (void *)MEMORY[0x1E0C81288];
  objc_storeStrong(v9 + 3, v13);
  context = (void *)MEMORY[0x194018E3C]();
  v14 = v9;
  aClass = a4;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(RBSXPCCoder *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInFunction:file:lineNumber:description:", v71, CFSTR("RBSXPCCoder.m"), 437, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expectedClass != nil"));

  }
  v15 = *v10;
  if (!*v10)
    v15 = v14[1];
  v16 = v15;
  v17 = v16;
  if (v16 == v12)
    goto LABEL_35;
  v18 = MEMORY[0x194019424](v16);
  NSClassFromString(CFSTR("OS_xpc_object"));
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", (id)objc_claimAutoreleasedReturnValue()) & 1) != 0)
  {
    v19 = v17;
    goto LABEL_15;
  }
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    if (a5)
    {
      if (v18 != MEMORY[0x1E0C812C8])
      {
        rbs_coder_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          _BSXPCDecodeObjectFromContext_cold_6();
        v21 = CFSTR("Invalid decoding context for collection");
LABEL_26:

LABEL_27:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v21);
LABEL_35:
        v19 = 0;
        goto LABEL_36;
      }
      v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      applier = (id)MEMORY[0x1E0C809B0];
      v83 = 3221225472;
      v84 = ___BSXPCDecodeObject_block_invoke;
      v85 = &unk_1E2D17130;
      v86 = v14;
      v88 = a5;
      v36 = v35;
      v87 = v36;
      if (xpc_array_apply(v17, &applier))
      {
        v19 = (id)objc_msgSend([aClass alloc], "initWithArray:", v36);
      }
      else
      {
        rbs_coder_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          _BSXPCDecodeObjectFromContext_cold_5();

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unable to decode array: an object within the array failed to decode"));
        v19 = 0;
      }

      goto LABEL_15;
    }
    rbs_coder_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(aClass);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      _BSXPCDecodeObjectFromContext_cold_4(v30, (uint64_t)&applier, v29);
    }

    v31 = (void *)MEMORY[0x1E0C99DA0];
    NSStringFromClass(aClass);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempted to decode a collection (%@) without specifying the class it contains"), v32);
LABEL_34:

    goto LABEL_35;
  }
  if (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()))
  {
    if (a5)
    {
      if (v18 != MEMORY[0x1E0C812F8])
      {
        rbs_coder_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          _BSXPCDecodeObjectFromContext_cold_10();
        v21 = CFSTR("Invalid decoding context for dictionary");
        goto LABEL_26;
      }
      v90 = 0;
      v91[0] = &v90;
      v91[1] = 0x3032000000;
      v91[2] = __Block_byref_object_copy_;
      v91[3] = __Block_byref_object_dispose_;
      v92 = 0;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      applier = (id)MEMORY[0x1E0C809B0];
      v83 = 3221225472;
      v84 = ___BSXPCDecodeObject_block_invoke_180;
      v85 = &unk_1E2D17158;
      v86 = v14;
      v89 = a5;
      v52 = v51;
      v87 = v52;
      v88 = &v90;
      if (xpc_dictionary_apply(v17, &applier))
      {
        v19 = (id)objc_msgSend([aClass alloc], "initWithDictionary:", v52);
      }
      else
      {
        rbs_coder_log();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          _BSXPCDecodeObjectFromContext_cold_9((uint64_t)v91, v53, v54);

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unable to decode dictionary key %@"), *(_QWORD *)(v91[0] + 40));
        v19 = 0;
      }

      _Block_object_dispose(&v90, 8);
LABEL_15:
      if (!v19)
        goto LABEL_36;
      goto LABEL_16;
    }
    if (xpc_dictionary_get_string(v17, "bsx_index"))
    {
      if (v18 != MEMORY[0x1E0C812F8])
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(RBSXPCCoder *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "handleFailureInFunction:file:lineNumber:description:", v73, CFSTR("RBSXPCCoder.m"), 596, CFSTR("RBSXPCEncodingNSSecure expects a dictionary decodingContext"));

      }
      goto LABEL_60;
    }
    goto LABEL_52;
  }
  if (v18 != MEMORY[0x1E0C812F8])
    goto LABEL_52;
  if ((-[objc_class supportsRBSXPCSecureCoding](a4, "supportsRBSXPCSecureCoding") & 1) != 0)
  {
    v49 = (NSString *)RBSCreateDeserializedStringFromXPCDictionaryWithKey(v17, "bsx_class");
    if (!v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(RBSXPCCoder *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "handleFailureInFunction:file:lineNumber:description:", v75, CFSTR("RBSXPCCoder.m"), 574, CFSTR("we already verified that this must be true"));

    }
    v50 = NSClassFromString(v49);
    if (v50)
    {
      if (aClass == v50)
      {
LABEL_102:
        v19 = (id)objc_msgSend([v50 alloc], "initWithRBSXPCCoder:", v14);

        goto LABEL_15;
      }
      if ((-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", v50) & 1) != 0)
      {
        v50 = aClass;
        goto LABEL_102;
      }
      if ((-[objc_class isSubclassOfClass:](v50, "isSubclassOfClass:", aClass) & 1) != 0)
        goto LABEL_102;
      rbs_coder_log();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(aClass);
        objc_claimAutoreleasedReturnValue();
        _BSXPCDecodeObjectFromContext_cold_12();
      }

      v67 = (void *)MEMORY[0x1E0C99DA0];
      NSStringFromClass(aClass);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Decoded class %@ is not compatible with expected class %@"), v49, v62, v76, context, v78);
    }
    else
    {
      rbs_coder_log();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(aClass);
        objc_claimAutoreleasedReturnValue();
        _BSXPCDecodeObjectFromContext_cold_11();
      }

      v61 = (void *)MEMORY[0x1E0C99DA0];
      NSStringFromClass(aClass);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unable to reify class %@ for expected class %@"), v49, v62, v76, context, v78);
    }

    v50 = 0;
    goto LABEL_102;
  }
  if (!-[objc_class supportsSecureCoding](a4, "supportsSecureCoding"))
  {
    rbs_coder_log();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(a4);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      _BSXPCDecodeObjectFromContext_cold_13(v56, (uint64_t)&applier, v55);
    }

    v57 = (void *)MEMORY[0x1E0C99DA0];
    NSStringFromClass(aClass);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("No valid encoding type could be determined for expected class: %@"), v58);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(RBSXPCCoder *__strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v59, CFSTR("RBSXPCCoder.m"), 630, CFSTR("we should not have been able to vet the class without defining the encoding"));

    goto LABEL_34;
  }
  if (xpc_dictionary_get_string(v17, "bsx_index"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", a4, a5, 0, v76, context, v78);
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_61;
    }
LABEL_60:
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &aClass, 1);
    v38 = objc_claimAutoreleasedReturnValue();
LABEL_61:
    v39 = (void *)v38;
    if (!v14[5])
    {
      RBSDeserializeDataFromXPCDictionaryWithKey(v14[1], "bsx_archive");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "length"))
      {
        v41 = v39;
        v42 = objc_alloc(MEMORY[0x1E0CB3710]);
        applier = 0;
        v43 = objc_msgSend(v42, "initForReadingFromData:error:", v40, &applier);
        v44 = applier;
        v45 = v14[5];
        v14[5] = (void *)v43;

        objc_msgSend(v14[5], "setRequiresSecureCoding:", 1);
        if (v44)
        {
          rbs_coder_log();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            _BSXPCDecodeObjectFromContext_cold_8((uint64_t)v44, v46, v47);

          v48 = v14[5];
          v14[5] = 0;

        }
      }
      else
      {
        rbs_coder_log();
        v44 = objc_claimAutoreleasedReturnValue();
        v41 = v39;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          _BSXPCDecodeObjectFromContext_cold_7();
      }

      v39 = v41;
    }
    RBSDeserializeStringFromXPCDictionaryWithKey(v17, "bsx_index");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v14[5];
    v80 = 0;
    objc_msgSend(v64, "decodeTopLevelObjectOfClasses:forKey:error:", v39, v63, &v80);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v65 = v80;
    if (v65)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Error during decoding of %@: %@"), v63, v65);

    goto LABEL_15;
  }
LABEL_52:
  v19 = (id)_CFXPCCreateCFObjectFromXPCObject();
  if (!v19 && v18 == MEMORY[0x1E0C81398])
    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", xpc_uint64_get_value(v17));
  if (!v19)
  {
    v21 = CFSTR("Invalid decoding context for <CFXPCBridge>");
    goto LABEL_27;
  }
LABEL_16:
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    rbs_coder_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(aClass);
      objc_claimAutoreleasedReturnValue();
      _BSXPCDecodeObjectFromContext_cold_2();
    }

    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(aClass);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Decoded object class %@ does not match expected class %@"), v27, v28);

  }
LABEL_36:

  objc_storeStrong(v10, v11);
  v33 = *v10;
  if (*v10 == v14[1])
  {
    *v10 = 0;

  }
  objc_autoreleasePoolPop(context);

  return v19;
}

void sub_190CD9098(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, Class aClass, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  id v21;
  NSObject *v22;

  if (a2)
  {
    if (a2 != 2)
    {
      objc_begin_catch(exception_object);
      JUMPOUT(0x190CD8598);
    }
    v21 = objc_begin_catch(exception_object);
    rbs_coder_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(aClass);
      objc_claimAutoreleasedReturnValue();
      _BSXPCDecodeObjectFromContext_cold_1();
    }

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_190CD91C8(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x190CD9158);
  }
  _Unwind_Resume(a1);
}

void sub_190CD91EC(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  JUMPOUT(0x190CD920CLL);
}

void sub_190CD9214(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_190CD9230(_Unwind_Exception *a1, int a2)
{
  if (a2)
    JUMPOUT(0x190CD923CLL);
  _Unwind_Resume(a1);
}

void sub_190CD9334(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x190CD9244);
  }
  _Unwind_Resume(a1);
}

const char *RBSCreateDeserializedStringFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3;
  void *v4;
  const char *string;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    string = xpc_dictionary_get_string(v3, a2);
    if (string)
      string = (const char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", string, 4);
  }
  else
  {
    string = 0;
  }

  return string;
}

void _BSXPCEncodeDictionaryWithKey(void *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, xpc_object_t);
  void *v7;
  id v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a1;
  v5 = a2;
  v6 = a3;
  v7 = (void *)*((_QWORD *)v25 + 3);
  if (!v7)
    v7 = (void *)*((_QWORD *)v25 + 1);
  v8 = v7;
  v9 = xpc_dictionary_create(0, 0, 0);
  objc_storeStrong((id *)v25 + 3, v9);
  if (v5)
  {
    if (!v8 || MEMORY[0x194019424](v8) != MEMORY[0x1E0C812F8])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSXPCEncodeDictionaryWithKey(RBSXPCCoder *__strong, NSString *__strong, void (^__strong)(__strong xpc_object_t))");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = v11;
      v14 = 299;
LABEL_10:
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("RBSXPCCoder.m"), v14, &stru_1E2D183D0);

    }
  }
  else if (!v8 || MEMORY[0x194019424](v8) != MEMORY[0x1E0C812C8])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BSXPCEncodeDictionaryWithKey(RBSXPCCoder *__strong, NSString *__strong, void (^__strong)(__strong xpc_object_t))");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v11;
    v14 = 298;
    goto LABEL_10;
  }
  v6[2](v6, v9);
  if (v9 && xpc_dictionary_get_count(v9))
  {
    if (v5)
    {
      v15 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      v16 = v8;
      v17 = v9;
      if (v15)
      {
        if (v8)
        {
          v18 = v17;
          if (MEMORY[0x194019424]() == MEMORY[0x1E0C812F8])
            xpc_dictionary_set_value(v16, v15, v18);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void RBSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("RBSXPCUtilities_Project.h"), 123, CFSTR("key must not be nil"));

      }
    }
    else
    {
      v19 = v8;
      v20 = v9;
      if (v8)
      {
        v21 = v20;
        if (MEMORY[0x194019424]() == MEMORY[0x1E0C812F8])
          xpc_array_append_value(v19, v21);
      }
    }

  }
  v22 = _BSXPCPopEncodingContext(v25, v8);

}

void sub_190CD99B4()
{
  __break(1u);
}

void sub_190CD99FC()
{
  objc_end_catch();
  JUMPOUT(0x190CD99CCLL);
}

void sub_190CD9A0C()
{
  char v0;

  if ((v0 & 1) != 0)
    JUMPOUT(0x190CD9A14);
  JUMPOUT(0x190CD9A18);
}

id _BSXPCPopEncodingContext(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  v5 = (void *)*((_QWORD *)v3 + 3);
  if (!v5)
    v5 = (void *)*((_QWORD *)v3 + 1);
  v6 = v5;
  objc_storeStrong((id *)v3 + 3, a2);
  v7 = (void *)*((_QWORD *)v3 + 3);
  if (v7 == *((void **)v3 + 1))
  {
    *((_QWORD *)v3 + 3) = 0;

  }
  return v6;
}

void RBSSerializeStringToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5;
  xpc_object_t xdict;

  if (a1 && a2)
  {
    if (a3)
    {
      v5 = objc_retainAutorelease(a1);
      xdict = a2;
      xpc_dictionary_set_string(xdict, a3, (const char *)objc_msgSend(v5, "UTF8String"));

    }
  }
}

uint64_t RBSAtomicGetFlag(unsigned int *a1)
{
  unsigned int v1;
  uint64_t v2;

  if (!a1)
    RBSAtomicGetFlag_cold_1();
  while (1)
  {
    v1 = __ldxr(a1);
    if (v1 != 1)
      break;
    v2 = 1;
    if (!__stxr(1u, a1))
      return v2;
  }
  v2 = 0;
  __clrex();
  return v2;
}

id rbs_process_log()
{
  if (rbs_process_log_onceToken != -1)
    dispatch_once(&rbs_process_log_onceToken, &__block_literal_global_17);
  return (id)rbs_process_log___logger;
}

const char *RBSDeserializeStringFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return (id)RBSCreateDeserializedStringFromXPCDictionaryWithKey(a1, a2);
}

const void *RBSDeserializeDataFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return (id)RBSCreateDeserializedDataFromXPCDictionaryWithKey(a1, a2);
}

__n128 RBSInvalidRealAuditToken@<Q0>(__n128 *a1@<X8>)
{
  __n128 result;

  result.n128_u64[0] = -1;
  result.n128_u64[1] = -1;
  *a1 = result;
  a1[1] = result;
  return result;
}

id RBSXPCUnpackObject(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_5;
  v3 = MEMORY[0x194019424](v1);
  v4 = MEMORY[0x1E0C812F8];
  if (v3 != MEMORY[0x1E0C812F8])
  {

    goto LABEL_4;
  }
  xpc_dictionary_get_value(v2, "@");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_4:
    v5 = v2;
    if (MEMORY[0x194019424]() == v4)
    {
      xpc_dictionary_get_value(v5, "*");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_5:
    v6 = 0;
LABEL_9:
    v7 = v2;
    goto LABEL_10;
  }
  v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
LABEL_10:

  return v6;
}

void sub_190CDDE08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id rbs_monitor_log()
{
  if (rbs_monitor_log_onceToken != -1)
    dispatch_once(&rbs_monitor_log_onceToken, &__block_literal_global_13);
  return (id)rbs_monitor_log___logger;
}

BOOL RBSTaskStateIsRunning(int a1)
{
  return a1 == 4 || (a1 & 0xFE) == 2;
}

void sub_190CDEF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void RBSDispatchAsyncWithQoS(void *a1, dispatch_qos_class_t a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  NSObject *queue;

  queue = a1;
  if (a2)
  {
    v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, a2, 0, a3);
    dispatch_async(queue, v5);

    v6 = v5;
  }
  else
  {
    dispatch_async(queue, a3);
    v6 = queue;
  }

}

const __CFString *NSStringFromRBSTaskState(unsigned int a1)
{
  if (a1 > 4)
    return CFSTR("(unknown)");
  else
    return off_1E2D17930[(char)a1];
}

BOOL RBSRealAuditTokenValid(_OWORD *a1)
{
  __int128 v1;
  audit_token_t v3;

  v1 = a1[1];
  *(_OWORD *)v3.val = *a1;
  *(_OWORD *)&v3.val[4] = v1;
  return audit_token_to_pid(&v3) != -1;
}

double RBSMachAbsoluteTime()
{
  unint64_t v0;
  unint64_t v1;
  mach_timebase_info info;

  if (*(double *)&RBSMachAbsoluteTime___TimeScale == 0.0)
  {
    info = 0;
    if (!mach_timebase_info(&info))
    {
      LODWORD(v0) = info.numer;
      LODWORD(v1) = info.denom;
      *(double *)&RBSMachAbsoluteTime___TimeScale = (double)v0 / (double)v1 / 1000000000.0;
    }
  }
  return *(double *)&RBSMachAbsoluteTime___TimeScale * (double)mach_absolute_time();
}

uint64_t RBSAtomicSetFlag(unsigned int a1, unsigned int *a2)
{
  unsigned int v2;
  uint64_t result;

  if (!a2)
    RBSAtomicSetFlag_cold_1();
  while (1)
  {
    v2 = __ldxr(a2);
    if (v2 != (a1 ^ 1))
      break;
    if (!__stxr(a1, a2))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

void sub_190CE39B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 216), 8);
  _Unwind_Resume(a1);
}

id rbs_message_log()
{
  if (rbs_message_log_onceToken != -1)
    dispatch_once(&rbs_message_log_onceToken, &__block_literal_global_37);
  return (id)rbs_message_log___logger;
}

id rbs_sp_assertion_log()
{
  if (rbs_sp_assertion_log_onceToken != -1)
    dispatch_once(&rbs_sp_assertion_log_onceToken, &__block_literal_global_41);
  return (id)rbs_sp_assertion_log___logger;
}

void sub_190CE473C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id rbs_ttl_log()
{
  if (rbs_ttl_log_onceToken != -1)
    dispatch_once(&rbs_ttl_log_onceToken, &__block_literal_global_35);
  return (id)rbs_ttl_log___logger;
}

const __CFString *NSStringFromRBSMemoryLimitStrength(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E2D17828[(char)a1];
}

const __CFString *NSStringFromRBSDurationEndPolicy(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(invalid end policy)");
  else
    return off_1E2D174C8[a1];
}

id rbs_connection_log()
{
  if (rbs_connection_log_onceToken != -1)
    dispatch_once(&rbs_connection_log_onceToken, &__block_literal_global_5);
  return (id)rbs_connection_log___logger;
}

void sub_190CE5E64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id rbs_assertion_log()
{
  if (rbs_assertion_log_onceToken != -1)
    dispatch_once(&rbs_assertion_log_onceToken, &__block_literal_global_3);
  return (id)rbs_assertion_log___logger;
}

uint64_t RBSSandboxCanAccessMachService()
{
  if (RBSSandboxCanAccessMachService_onceToken != -1)
    dispatch_once(&RBSSandboxCanAccessMachService_onceToken, &__block_literal_global_4);
  return RBSSandboxCanAccessMachService_canAccess;
}

const __CFString *NSStringFromRBSRole(unsigned int a1)
{
  if (a1 > 7)
    return CFSTR("(undefined)");
  else
    return off_1E2D17978[(char)a1];
}

const void *RBSCreateDeserializedDataFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3;
  void *v4;
  const void *data;
  id v6;
  size_t length;

  v3 = a1;
  v4 = v3;
  length = 0;
  if (v3)
  {
    data = xpc_dictionary_get_data(v3, a2, &length);
    if (data)
    {
      v6 = objc_alloc(MEMORY[0x1E0C99D50]);
      data = (const void *)objc_msgSend(v6, "initWithBytes:length:", data, length);
    }
  }
  else
  {
    data = 0;
  }

  return data;
}

void sub_190CEC4B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromRBSAcquisitionCompletionPolicy(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("(unknown)");
  if (!a1)
    v1 = CFSTR("AfterValidation");
  if (a1 == 1)
    return CFSTR("AfterApplication");
  else
    return v1;
}

BOOL _RBSSandboxCanGetMachTaskName(int a1)
{
  if (getpid() == a1)
    return 1;
  if (_RBSSandboxCanGetMachTaskName_onceToken != -1)
    dispatch_once(&_RBSSandboxCanGetMachTaskName_onceToken, &__block_literal_global_9);
  return _RBSSandboxCanGetMachTaskName_allowed != 0;
}

id RBSXPCPackObject(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  char isKindOfClass;
  xpc_object_t v5;
  xpc_object_t v7;
  xpc_object_t values;

  v1 = a1;
  values = v1;
  if (!v1)
    goto LABEL_8;
  v2 = _RBSIsXPCObject_onceToken;
  v3 = v1;
  if (v2 != -1)
    dispatch_once(&_RBSIsXPCObject_onceToken, &__block_literal_global_12);
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v7 = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject();
    if (v7)
    {
      v5 = xpc_dictionary_create((const char *const *)RBSEncodedCFTypeKey, &v7, 1uLL);

      goto LABEL_9;
    }
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  v5 = xpc_dictionary_create((const char *const *)RBSEncodedXPCTypeKey, &values, 1uLL);
LABEL_9:

  return v5;
}

id rbs_general_log()
{
  if (rbs_general_log_onceToken != -1)
    dispatch_once(&rbs_general_log_onceToken, &__block_literal_global_7);
  return (id)rbs_general_log___logger;
}

id RBSEndowmentEncode(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  xpc_object_t v6;
  size_t count;
  xpc_object_t v8;
  size_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  unsigned __int8 uuid[8];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = 0;
    v3 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(_QWORD *)uuid = 0;
      v15 = 0;
      objc_msgSend(v1, "getUUIDBytes:", uuid);
      v2 = xpc_uuid_create(uuid);
      v3 = 2;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v1, "_endpoint");
        v2 = (id)objc_claimAutoreleasedReturnValue();
        v3 = 3;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v2 = (id)_CFXPCCreateXPCObjectFromCFObject();
          v3 = 4;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v6 = xpc_array_create(0, 0);
            v12[0] = MEMORY[0x1E0C809B0];
            v12[1] = 3221225472;
            v12[2] = __RBSEndowmentEncode_block_invoke;
            v12[3] = &unk_1E2D17870;
            v2 = v6;
            v13 = v2;
            objc_msgSend(v1, "enumerateObjectsUsingBlock:", v12);
            count = xpc_array_get_count(v2);
            if (count != objc_msgSend(v1, "count"))
            {

              v2 = 0;
            }

            v3 = 5;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v8 = xpc_dictionary_create(0, 0, 0);
              v10[0] = MEMORY[0x1E0C809B0];
              v10[1] = 3221225472;
              v10[2] = __RBSEndowmentEncode_block_invoke_2;
              v10[3] = &unk_1E2D17898;
              v2 = v8;
              v11 = v2;
              objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v10);
              v9 = xpc_dictionary_get_count(v2);
              if (v9 != objc_msgSend(v1, "count"))
              {

                v2 = 0;
              }

              v3 = 6;
            }
            else
            {
              v3 = 0;
              v2 = 0;
            }
          }
        }
      }
    }
  }
  _RBSEndowmentWrapType(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _RBSEndowmentWrapType(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  uint64_t i;
  xpc_object_t objects[3];

  objects[2] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (a2 - 4 >= 3)
  {
    if (a2 - 2 < 2)
    {
      v5 = v3;
LABEL_10:
      v6 = v5;
      goto LABEL_12;
    }
    if (a2 == 1)
    {
      v5 = xpc_null_create();
      goto LABEL_10;
    }
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  if (!v3)
    goto LABEL_11;
  objects[0] = xpc_uint64_create(a2);
  objects[1] = v4;
  v6 = xpc_array_create(objects, 2uLL);
  for (i = 1; i != -1; --i)

LABEL_12:
  return v6;
}

BOOL RBSAcquisitionCompletionPolicyIsValid(unint64_t a1)
{
  return a1 < 2;
}

id RBSBundleIDForPID(int a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const char *string;
  void *v7;
  __CFBundle *v8;
  __CFBundle *v9;

  if (getpid() != a1)
  {
    RBSExecutablePathForPID();
    v1 = (id)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      v2 = 0;
      goto LABEL_17;
    }
    v3 = (void *)MEMORY[0x194018E3C]();
    v1 = objc_retainAutorelease(v1);
    objc_msgSend(v1, "UTF8String");
    v4 = (void *)xpc_bundle_create();
    if (v4)
    {
      xpc_bundle_get_info_dictionary();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5
        && (string = xpc_dictionary_get_string(v5, (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0C9AE78]), "UTF8String"))) != 0)
      {
        v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);

        if (v2)
        {
LABEL_16:

          objc_autoreleasePoolPop(v3);
          goto LABEL_17;
        }
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (v8 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle()) != 0)
    {
      v9 = v8;
      CFBundleGetIdentifier(v8);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v9);
    }
    else
    {
      v2 = 0;
    }

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v2;
}

BOOL RBSPIDExists(int a1)
{
  _OWORD v3[4];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (getpid() == a1)
    return 1;
  if (a1 < 1)
    return 0;
  memset(v3, 0, sizeof(v3));
  return _RBShortBSDProcessInfoForPID(a1, v3);
}

BOOL _RBShortBSDProcessInfoForPID(int a1, void *a2)
{
  _BOOL8 result;
  NSObject *v5;

  result = 0;
  if (a1 >= 1)
  {
    if (a2)
    {
      result = RBSandboxCanGetProcessInfo(a1);
      if (result)
      {
        if (proc_pidinfo(a1, 13, 0, a2, 64) == 64)
        {
          return 1;
        }
        else
        {
          if (*__error() != 3)
          {
            rbs_general_log();
            v5 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
              _RBShortBSDProcessInfoForPID_cold_1(a1, v5);

          }
          return 0;
        }
      }
    }
  }
  return result;
}

id RBSExecutablePathForPID()
{
  int v0;
  int v1;
  int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _BYTE buffer[4096];
  uint64_t v8;

  v0 = MEMORY[0x1E0C80A78]();
  v1 = v0;
  v8 = *MEMORY[0x1E0C80C00];
  if (v0 >= 1 && RBSandboxCanGetProcessInfo(v0))
  {
    v2 = proc_pidpath(v1, buffer, 0x1000u);
    if (v2 < 1)
    {
      rbs_general_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        RBSExecutablePathForPID_cold_2();
      v4 = 0;
    }
    else
    {
      v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v2, 4);
      -[NSObject stringByStandardizingPath](v3, "stringByStandardizingPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v4;
  }
  else
  {
    rbs_general_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      RBSExecutablePathForPID_cold_1(v1);

    return 0;
  }
}

BOOL RBSandboxCanGetProcessInfo(int a1)
{
  if (getpid() == a1)
    return 1;
  if (RBSandboxCanGetProcessInfo_onceToken != -1)
    dispatch_once(&RBSandboxCanGetProcessInfo_onceToken, &__block_literal_global_2);
  return RBSandboxCanGetProcessInfo_allowed != 0;
}

id rbs_sp_state_log()
{
  if (rbs_sp_state_log_onceToken != -1)
    dispatch_once(&rbs_sp_state_log_onceToken, &__block_literal_global_43);
  return (id)rbs_sp_state_log___logger;
}

const __CFString *NSStringFromRBSDurationStartPolicy(uint64_t a1)
{
  const __CFString *result;

  if (a1 > 100)
  {
    switch(a1)
    {
      case 'g':
        return CFSTR("Delayed-Fixed");
      case 'f':
        return CFSTR("Delayed-Relative");
      case 'e':
        return CFSTR("Relative");
      default:
        return CFSTR("(invalid start policy)");
    }
  }
  else
  {
    result = CFSTR("Unspecified");
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("Fixed");
        break;
      case 2:
        result = CFSTR("Proc-Start-Relative");
        break;
      case 3:
        result = CFSTR("After-Originator-Exit");
        break;
      default:
        return CFSTR("(invalid start policy)");
    }
  }
  return result;
}

id rbs_state_log()
{
  if (rbs_state_log_onceToken != -1)
    dispatch_once(&rbs_state_log_onceToken, &__block_literal_global_21);
  return (id)rbs_state_log___logger;
}

BOOL RBSDebugStateIsDebugging(char a1)
{
  return (a1 & 0xFE) == 2;
}

uint64_t RBSDarwinRoleFromRBSRole(unsigned int a1)
{
  if (a1 > 7)
    return 3;
  else
    return dword_190D180C8[(char)a1];
}

const __CFString *NSStringFromRBSLegacyReason(uint64_t a1)
{
  const __CFString *result;

  if (a1 > 9999)
  {
    if (a1 > 49999)
    {
      if (a1 <= 50003)
      {
        if (a1 == 50000)
          return CFSTR("FinishTaskAfterBackgroundContentFetching");
        if (a1 == 50003)
          return CFSTR("FinishTaskAfterNotificationAction");
      }
      else
      {
        switch(a1)
        {
          case 50004:
            return CFSTR("FinishTaskAfterWatchConnectivity");
          case 60000:
            return CFSTR("Domain");
          case 60001:
            return CFSTR("Custom");
        }
      }
      return &stru_1E2D183D0;
    }
    else
    {
      switch(a1)
      {
        case 10000:
          result = CFSTR("Resume");
          break;
        case 10002:
          result = CFSTR("TransientWakeup");
          break;
        case 10004:
          result = CFSTR("FinishTaskUnbounded");
          break;
        case 10005:
          result = CFSTR("Continuous");
          break;
        case 10006:
          result = CFSTR("BackgroundContentFetching");
          break;
        case 10007:
          result = CFSTR("NotificationAction");
          break;
        case 10008:
          result = CFSTR("PIP");
          break;
        default:
          return &stru_1E2D183D0;
      }
    }
  }
  else
  {
    result = CFSTR("None");
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("MediaPlayback");
        break;
      case 2:
        result = CFSTR("Location");
        break;
      case 3:
        result = CFSTR("ExternalAccessory");
        break;
      case 4:
        result = CFSTR("FinishTask");
        break;
      case 5:
        result = CFSTR("Bluetooth");
        break;
      case 7:
        result = CFSTR("BackgroundUI");
        break;
      case 8:
        result = CFSTR("InterAppAudioStreaming");
        break;
      case 9:
        result = CFSTR("ViewService");
        break;
      case 10:
        result = CFSTR("NewsstandDownload");
        break;
      case 12:
        result = CFSTR("VoIP");
        break;
      case 13:
        result = CFSTR("Extension");
        break;
      case 16:
        result = CFSTR("WatchConnectivity");
        break;
      case 18:
        result = CFSTR("ComplicationUpdate");
        break;
      case 19:
        result = CFSTR("WorkoutProcessing");
        break;
      case 20:
        result = CFSTR("ComplicationPushUpdate");
        break;
      case 21:
        result = CFSTR("BackgroundLocationProcessing");
        break;
      case 23:
        result = CFSTR("AudioRecording");
        break;
      default:
        return &stru_1E2D183D0;
    }
  }
  return result;
}

id NSStringFromRBSLegacyFlags(char a1)
{
  id v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = CFSTR(" AllowIdleSleep");
  v4 = &stru_1E2D183D0;
  if ((a1 & 4) == 0)
    v3 = &stru_1E2D183D0;
  v5 = CFSTR(" AllowSuspendOnSleep");
  if ((a1 & 0x10) == 0)
    v5 = &stru_1E2D183D0;
  v6 = CFSTR(" PreventTaskSuspend");
  if ((a1 & 1) == 0)
    v6 = &stru_1E2D183D0;
  v7 = CFSTR(" PreventTaskThrottleDown");
  if ((a1 & 2) == 0)
    v7 = &stru_1E2D183D0;
  v8 = CFSTR(" PreventThrottleDownUI");
  if ((a1 & 0x20) == 0)
    v8 = &stru_1E2D183D0;
  if ((a1 & 8) != 0)
    v4 = CFSTR(" WantsForegroundResourcePriority");
  return (id)objc_msgSend(v2, "initWithFormat:", CFSTR("(%@%@%@%@%@%@)"), v3, v5, v6, v7, v8, v4);
}

id RBSExtensionPointFromBundleDict(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NSExtensionPointIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("EXAppExtensionAttributes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EXExtensionPointIdentifier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

const __CFString *NSStringFromRBSTerminationResistance(int a1)
{
  if (a1 > 29)
  {
    switch(a1)
    {
      case 30:
        return CFSTR("NonInteractive");
      case 40:
        return CFSTR("Interactive");
      case 50:
        return CFSTR("Absolute");
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        return CFSTR("(unknown)");
      case 10:
        return CFSTR("NotRunning");
      case 20:
        return CFSTR("None");
    }
  }
  return CFSTR("(undefined)");
}

const __CFString *NSStringFromRBSDebugState(unsigned int a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_1E2D17958[(char)a1];
}

id RBSStringForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  RBObjectOfClassForKey(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id RBObjectOfClassForKey(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

id rbs_job_log()
{
  if (rbs_job_log_onceToken != -1)
    dispatch_once(&rbs_job_log_onceToken, &__block_literal_global_9_0);
  return (id)rbs_job_log___logger;
}

void RBSSerializeDoubleToXPCDictionaryWithKey(xpc_object_t xdict, const char *key, double value)
{
  if (xdict)
  {
    if (key)
      xpc_dictionary_set_double(xdict, key, value);
  }
}

BOOL RBSAuditTokenRepresentsPlatformBinary(_OWORD *a1)
{
  __int128 v2;
  __SecTask *v3;
  uint32_t CodeSignStatus;
  NSObject *v5;
  audit_token_t v7;

  v2 = a1[1];
  *(_OWORD *)v7.val = *a1;
  *(_OWORD *)&v7.val[4] = v2;
  v3 = SecTaskCreateWithAuditToken(0, &v7);
  CodeSignStatus = SecTaskGetCodeSignStatus(v3);
  if (v3)
  {
    CFRelease(v3);
  }
  else
  {
    rbs_general_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      RBSAuditTokenRepresentsPlatformBinary_cold_1(a1, v5);

  }
  return (CodeSignStatus & 0xC000001) == 67108865;
}

void __rbs_process_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "process");
  v1 = (void *)rbs_process_log___logger;
  rbs_process_log___logger = (uint64_t)v0;

}

void __rbs_connection_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "connection");
  v1 = (void *)rbs_connection_log___logger;
  rbs_connection_log___logger = (uint64_t)v0;

}

void __rbs_assertion_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "assertion");
  v1 = (void *)rbs_assertion_log___logger;
  rbs_assertion_log___logger = (uint64_t)v0;

}

id rbs_job_oversize_log()
{
  if (rbs_job_oversize_log_onceToken != -1)
    dispatch_once(&rbs_job_oversize_log_onceToken, &__block_literal_global_11);
  return (id)rbs_job_oversize_log___logger;
}

id rbs_power_log()
{
  if (rbs_power_log_onceToken != -1)
    dispatch_once(&rbs_power_log_onceToken, &__block_literal_global_15);
  return (id)rbs_power_log___logger;
}

void __rbs_message_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "message");
  v1 = (void *)rbs_message_log___logger;
  rbs_message_log___logger = (uint64_t)v0;

}

void __rbs_general_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "general");
  v1 = (void *)rbs_general_log___logger;
  rbs_general_log___logger = (uint64_t)v0;

}

double RBSDeserializeDoubleFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  double value;
  uint64_t v3;
  void *v4;

  value = 0.0;
  if (a1 && a2)
  {
    xpc_dictionary_get_value(a1, a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3 && MEMORY[0x194019424](v3) == MEMORY[0x1E0C81300])
      value = xpc_double_get_value(v4);

  }
  return value;
}

void __rbs_monitor_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "monitor");
  v1 = (void *)rbs_monitor_log___logger;
  rbs_monitor_log___logger = (uint64_t)v0;

}

void sub_190CF3F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id RBSServiceInitialize(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v7;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __RBSServiceInitialize_block_invoke;
  block[3] = &unk_1E2D17490;
  v7 = v1;
  v2 = RBSServiceInitialize_onceToken;
  v3 = v1;
  if (v2 != -1)
    dispatch_once(&RBSServiceInitialize_onceToken, block);
  v4 = (id)RBSServiceInitialize___sharedInstance;

  return v4;
}

const __CFString *NSStringFromRBSCPUMaximumUsageViolationPolicy(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(undefined)");
  else
    return off_1E2D16CD8[a1];
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void OUTLINED_FUNCTION_1_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

id rbs_shim_log()
{
  if (rbs_shim_log_onceToken != -1)
    dispatch_once(&rbs_shim_log_onceToken, &__block_literal_global_25);
  return (id)rbs_shim_log___logger;
}

void __rbs_shim_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "shim");
  v1 = (void *)rbs_shim_log___logger;
  rbs_shim_log___logger = (uint64_t)v0;

}

void RBSSerializeCFValueToXPCDictionaryWithKey(uint64_t a1, void *a2, const char *a3)
{
  id v5;
  void *v6;
  xpc_object_t xdict;

  v5 = a2;
  if (a1 && v5 && a3)
  {
    xdict = v5;
    v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v6)
      xpc_dictionary_set_value(xdict, a3, v6);

    v5 = xdict;
  }

}

uint64_t RBSCreateDeserializedCFValueFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  if (!a2)
    return 0;
  xpc_dictionary_get_value(a1, a2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0;
  v3 = (void *)v2;
  v4 = _CFXPCCreateCFObjectFromXPCObject();

  return v4;
}

id RBSDeserializeCFValueFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return (id)RBSCreateDeserializedCFValueFromXPCDictionaryWithKey(a1, a2);
}

void RBSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = a1;
  v6 = a2;
  if (v5)
  {
    if ((objc_msgSend((id)objc_opt_class(), "supportsSecureCoding") & 1) != 0)
    {
      if (!v6)
        goto LABEL_10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void RBSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey(NSObject<NSSecureCoding> *__strong, __strong xpc_object_t, const char *)");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("RBSXPCSerialization.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!object || [[object class] supportsSecureCoding]"));

      if (!v6)
        goto LABEL_10;
    }
    v7 = MEMORY[0x194019424](v6);
    if (a3 && v7 == MEMORY[0x1E0C812F8])
    {
      v8 = (void *)MEMORY[0x194018E3C]();
      v14 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v14 && objc_msgSend(v9, "length"))
      {
        v11 = objc_retainAutorelease(v10);
        xpc_dictionary_set_data(v6, a3, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
      }

      objc_autoreleasePoolPop(v8);
    }
  }
LABEL_10:

}

uint64_t RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const void *bytes_ptr;
  void *v12;
  id v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v5 = a2;
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject<NSSecureCoding> *RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(__unsafe_unretained Class, __strong xpc_object_t, const char *)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("RBSXPCSerialization.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("class != nil"));

  }
  if ((objc_msgSend(a1, "supportsSecureCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject<NSSecureCoding> *RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(__unsafe_unretained Class, __strong xpc_object_t, const char *)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("RBSXPCSerialization.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[class supportsSecureCoding]"));

  }
  v6 = 0;
  if (v5 && a3)
  {
    xpc_dictionary_get_value(v5, a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7 && MEMORY[0x194019424](v7) == MEMORY[0x1E0C812E8])
    {
      v9 = (void *)MEMORY[0x194018E3C]();
      v10 = (void *)MEMORY[0x1E0C99D50];
      bytes_ptr = xpc_data_get_bytes_ptr(v8);
      objc_msgSend(v10, "dataWithBytes:length:", bytes_ptr, xpc_data_get_length(v8));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, v12, &v20);
      v6 = objc_claimAutoreleasedReturnValue();
      v13 = v20;
      if (v13)
      {
        rbs_coder_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey_cold_1((objc_class *)a1, (uint64_t)v13, v14);

      }
      objc_autoreleasePoolPop(v9);
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

id RBSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  return (id)RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(a1, a2, a3);
}

void RBSSerializeDataToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5;
  id v6;
  const void *v7;
  size_t v8;
  xpc_object_t xdict;

  if (a1 && a2)
  {
    if (a3)
    {
      v5 = objc_retainAutorelease(a1);
      xdict = a2;
      v6 = v5;
      v7 = (const void *)objc_msgSend(v6, "bytes");
      v8 = objc_msgSend(v6, "length");

      xpc_dictionary_set_data(xdict, a3, v7, v8);
    }
  }
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id RBSExecutablePathForBundlePath(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  RBSSystemRootDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", v3);
  objc_msgSend(v4, "executablePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id RBSSystemRootDirectory()
{
  if (RBSSystemRootDirectory_onceToken != -1)
    dispatch_once(&RBSSystemRootDirectory_onceToken, &__block_literal_global_9);
  return (id)RBSSystemRootDirectory___SystemRootDirectory;
}

id RBSPathForSystemDirectory(NSSearchPathDirectory a1)
{
  return _RBSearchPathForDirectoryInDomain(a1, 8uLL);
}

id _RBSearchPathForDirectoryInDomain(NSSearchPathDirectory a1, NSSearchPathDomainMask domainMask)
{
  char v2;
  uint8x8_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = domainMask;
  v3 = (uint8x8_t)vcnt_s8((int8x8_t)domainMask);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] == 1)
  {
    NSSearchPathForDirectoriesInDomains(a1, domainMask, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if ((v2 & 1) != 0)
        RBSCurrentUserDirectory();
      else
        RBSSystemRootDirectory();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "hasPrefix:", v7) & 1) != 0)
      {
        v6 = v5;
      }
      else
      {
        objc_msgSend(v7, "stringByAppendingPathComponent:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByStandardizingPath");
        v6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

id RBSPathForCurrentUserDirectory(NSSearchPathDirectory a1)
{
  return _RBSearchPathForDirectoryInDomain(a1, 1uLL);
}

id RBSCurrentUserDirectory()
{
  if (RBSCurrentUserDirectory___once != -1)
    dispatch_once(&RBSCurrentUserDirectory___once, &__block_literal_global_8);
  return (id)RBSCurrentUserDirectory___userDirectory;
}

id RBSNumberForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  RBObjectOfClassForKey(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id RBSURLForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  RBObjectOfClassForKey(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id RBSArrayForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  RBObjectOfClassForKey(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id RBSDictionaryForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  RBObjectOfClassForKey(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t RBSBoolForKey(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

uint64_t RBSPIDIsBeingDebugged(int a1)
{
  BOOL v1;
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1 < 1)
    return 0;
  v4 = 0u;
  v5 = 0u;
  memset(v3, 0, sizeof(v3));
  v1 = _RBShortBSDProcessInfoForPID(a1, v3);
  return *(_DWORD *)&v1 & ((v4 & 2) >> 1);
}

void RBSDispatchQueueAssert(void *a1)
{
  NSObject *v1;
  void *v2;
  NSObject *v3;

  v1 = a1;
  v3 = v1;
  if (v1 == MEMORY[0x1E0C80D38])
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    {
      v2 = (void *)MEMORY[0x1E0C80D38];
      dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);

    }
  }
  else
  {
    dispatch_assert_queue_V2(v1);
  }

}

BOOL RBSIsBinaryCatalystOriOS(int a1)
{
  NSObject *v3;
  uint64_t v4;
  int buffer;

  buffer = 0;
  if (proc_pidinfo(a1, 30, 0, &buffer, 4) == 4)
    return (buffer & 0xFFFFFFFB) == 2;
  rbs_general_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    RBSIsBinaryCatalystOriOS_cold_1(a1, v3, v4);

  return 0;
}

id RBSContainedExtensionBundleIDs(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v1, 0, 0);
  rbs_general_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(v3, "applicationExtensionRecords");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v21 = objc_msgSend(v6, "count");
      v22 = 2112;
      v23 = v1;
      _os_log_impl(&dword_190CD6000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu extensions contained in %@", buf, 0x16u);

    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "applicationExtensionRecords", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          rbs_general_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            RBSContainedExtensionBundleIDs_cold_1(buf, v11, &v21, v12);

          objc_msgSend(v11, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v13);

        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
  }
  else if (v5)
  {
    *(_DWORD *)buf = 138412290;
    v21 = (uint64_t)v1;
    _os_log_impl(&dword_190CD6000, v4, OS_LOG_TYPE_DEFAULT, "failed to get LSApplicationRecord for %@ - probably OK", buf, 0xCu);
  }

  return v2;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t OUTLINED_FUNCTION_0_2(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

id rbs_best_effort_networking_log()
{
  if (rbs_best_effort_networking_log_onceToken != -1)
    dispatch_once(&rbs_best_effort_networking_log_onceToken, &__block_literal_global_3);
  return (id)rbs_best_effort_networking_log___logger;
}

void __rbs_best_effort_networking_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "best_effort_networking");
  v1 = (void *)rbs_best_effort_networking_log___logger;
  rbs_best_effort_networking_log___logger = (uint64_t)v0;

}

void __rbs_job_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "job");
  v1 = (void *)rbs_job_log___logger;
  rbs_job_log___logger = (uint64_t)v0;

}

void __rbs_job_oversize_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "job_oversize");
  v1 = (void *)rbs_job_oversize_log___logger;
  rbs_job_oversize_log___logger = (uint64_t)v0;

}

void __rbs_power_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "power");
  v1 = (void *)rbs_power_log___logger;
  rbs_power_log___logger = (uint64_t)v0;

}

id rbs_resource_log()
{
  if (rbs_resource_log_onceToken != -1)
    dispatch_once(&rbs_resource_log_onceToken, &__block_literal_global_19);
  return (id)rbs_resource_log___logger;
}

void __rbs_resource_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "resource");
  v1 = (void *)rbs_resource_log___logger;
  rbs_resource_log___logger = (uint64_t)v0;

}

void __rbs_state_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "state");
  v1 = (void *)rbs_state_log___logger;
  rbs_state_log___logger = (uint64_t)v0;

}

id rbs_system_log()
{
  if (rbs_system_log_onceToken != -1)
    dispatch_once(&rbs_system_log_onceToken, &__block_literal_global_23);
  return (id)rbs_system_log___logger;
}

void __rbs_system_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "system");
  v1 = (void *)rbs_system_log___logger;
  rbs_system_log___logger = (uint64_t)v0;

}

id rbs_test_log()
{
  if (rbs_test_log_onceToken != -1)
    dispatch_once(&rbs_test_log_onceToken, &__block_literal_global_27);
  return (id)rbs_test_log___logger;
}

void __rbs_test_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "test");
  v1 = (void *)rbs_test_log___logger;
  rbs_test_log___logger = (uint64_t)v0;

}

id rbs_coder_log()
{
  if (rbs_coder_log_onceToken != -1)
    dispatch_once(&rbs_coder_log_onceToken, &__block_literal_global_29);
  return (id)rbs_coder_log___logger;
}

void __rbs_coder_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "coder");
  v1 = (void *)rbs_coder_log___logger;
  rbs_coder_log___logger = (uint64_t)v0;

}

id rbs_adapter_log()
{
  if (rbs_adapter_log_onceToken != -1)
    dispatch_once(&rbs_adapter_log_onceToken, &__block_literal_global_31);
  return (id)rbs_adapter_log___logger;
}

void __rbs_adapter_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "adapter");
  v1 = (void *)rbs_adapter_log___logger;
  rbs_adapter_log___logger = (uint64_t)v0;

}

id rbs_jetsam_log()
{
  if (rbs_jetsam_log_onceToken != -1)
    dispatch_once(&rbs_jetsam_log_onceToken, &__block_literal_global_33);
  return (id)rbs_jetsam_log___logger;
}

void __rbs_jetsam_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "jetsam");
  v1 = (void *)rbs_jetsam_log___logger;
  rbs_jetsam_log___logger = (uint64_t)v0;

}

void __rbs_ttl_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "ttl");
  v1 = (void *)rbs_ttl_log___logger;
  rbs_ttl_log___logger = (uint64_t)v0;

}

id rbs_sp_telemetry_log()
{
  if (rbs_sp_telemetry_log_onceToken != -1)
    dispatch_once(&rbs_sp_telemetry_log_onceToken, &__block_literal_global_39);
  return (id)rbs_sp_telemetry_log___logger;
}

void __rbs_sp_telemetry_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "sp_telemetry");
  v1 = (void *)rbs_sp_telemetry_log___logger;
  rbs_sp_telemetry_log___logger = (uint64_t)v0;

}

void __rbs_sp_assertion_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "sp_assertion");
  v1 = (void *)rbs_sp_assertion_log___logger;
  rbs_sp_assertion_log___logger = (uint64_t)v0;

}

void __rbs_sp_state_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "sp_state");
  v1 = (void *)rbs_sp_state_log___logger;
  rbs_sp_state_log___logger = (uint64_t)v0;

}

id rbs_sp_therm_log()
{
  if (rbs_sp_therm_log_onceToken != -1)
    dispatch_once(&rbs_sp_therm_log_onceToken, &__block_literal_global_45);
  return (id)rbs_sp_therm_log___logger;
}

void __rbs_sp_therm_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.runningboard", "sp_therm");
  v1 = (void *)rbs_sp_therm_log___logger;
  rbs_sp_therm_log___logger = (uint64_t)v0;

}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_190CFEACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return NSRequestConcreteImplementation();
}

void sub_190D013BC(_Unwind_Exception *exception_object, int a2)
{
  os_unfair_lock_s *v2;
  id v3;

  if (a2)
  {
    if (a2 == 2)
    {
      v3 = objc_begin_catch(exception_object);
      objc_exception_rethrow();
    }
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __RBSDaemonDidStart(uint64_t a1, uint64_t a2)
{
  -[RBSConnection _handleDaemonDidStart](a2);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

uint64_t RBSMachPortType(mach_port_name_t name)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_port_type_t ptype;

  ptype = 0;
  if (mach_port_type(*MEMORY[0x1E0C83DA0], name, &ptype))
  {
    rbs_general_log();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      RBSMachPortType_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  return ptype;
}

BOOL RBSMachPortIsType(mach_port_name_t a1, int a2)
{
  return a1 - 1 <= 0xFFFFFFFD && (RBSMachPortType(a1) & a2) != 0;
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

id _RBSEndowmentUnwrapTypeAndDecodeWithBlock(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, uint64_t, id);
  uint64_t v5;
  void *v6;
  uint64_t value;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v5 = MEMORY[0x194019424](v3);
    if (v5 == MEMORY[0x1E0C81350])
    {
      v9 = v3;
      v8 = 1;
    }
    else if (v5 == MEMORY[0x1E0C813A0])
    {
      v9 = v3;
      v8 = 2;
    }
    else if (v5 == MEMORY[0x1E0C81308])
    {
      v9 = v3;
      v8 = 3;
    }
    else
    {
      if (v5 != MEMORY[0x1E0C812C8] || xpc_array_get_count(v3) != 2)
      {
        v9 = 0;
        v10 = 0;
LABEL_20:

        goto LABEL_21;
      }
      xpc_array_get_value(v3, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (MEMORY[0x194019424]() == MEMORY[0x1E0C81398] && (value = xpc_uint64_get_value(v6), value - 4 <= 2))
      {
        v8 = value;
        xpc_array_get_value(v3, 1uLL);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
        v9 = 0;
      }

    }
    v10 = 0;
    if (v8 && v9)
    {
      v4[2](v4, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_20;
  }
  v10 = 0;
LABEL_21:

  return v10;
}

id RBSEndowmentDecode(void *a1)
{
  return _RBSEndowmentUnwrapTypeAndDecodeWithBlock(a1, &__block_literal_global_10);
}

void ___personalPersonaString_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uid_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _BYTE count[100];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint8_t buf[4];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0DC5EF8], "personaAttributesForPersonaType:", 0);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "userPersonaUniqueString");
    v1 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = 0;
  }
  v2 = (void *)_personalPersonaString_personalPersonaString;
  _personalPersonaString_personalPersonaString = v1;

  if (_personalPersonaString_personalPersonaString)
  {
    v3 = 0x7FFFFFFF;
  }
  else
  {
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    v19 = 0u;
    v18 = 0u;
    v17 = 0u;
    v16 = 0u;
    v15 = 0u;
    v14 = 0u;
    v13 = 0u;
    memset(&count[4], 0, 96);
    *(_DWORD *)count = 2;
    if (kpersona_info())
      v3 = getuid();
    else
      v3 = HIDWORD(v28);
    v4 = malloc_type_calloc(4uLL, 4uLL, 0x100004052888210uLL);
    *(_QWORD *)count = 4;
    if ((kpersona_find_by_type() & 0x80000000) != 0)
    {
      rbs_general_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *__error();
        *(_DWORD *)buf = 67109120;
        v30 = v7;
        _os_log_impl(&dword_190CD6000, v6, OS_LOG_TYPE_DEFAULT, "RBSProcessIdentity: kpersona_find_by_type() failed: %d", buf, 8u);
      }

LABEL_14:
      v8 = 0;
    }
    else
    {
      v5 = *(_QWORD *)count;
      v11 = 0;
      while (1)
      {
        v28 = 0;
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v13 = 0u;
        memset(&count[4], 0, 96);
        *(_DWORD *)count = 2;
        if (!__PAIR64__(v3, kpersona_info()))
          break;
        if (v5 == ++v11)
          goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &count[88], *(_QWORD *)count, *(_OWORD *)&count[8], *(_OWORD *)&count[24], *(_OWORD *)&count[40], *(_OWORD *)&count[56], *(_OWORD *)&count[72]);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    free(v4);
    v9 = (void *)_personalPersonaString_personalPersonaString;
    _personalPersonaString_personalPersonaString = v8;

  }
  rbs_general_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)count = 67109378;
    *(_DWORD *)&count[4] = v3;
    *(_WORD *)&count[8] = 2114;
    *(_QWORD *)&count[10] = _personalPersonaString_personalPersonaString;
    _os_log_impl(&dword_190CD6000, v10, OS_LOG_TYPE_DEFAULT, "RBSProcessIdentity calculated session %u, persona %{public}@ for persona matching for this process", count, 0x12u);
  }

}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

const __CFString *NSStringFromRBSGPURole(unsigned int a1)
{
  if (a1 > 4)
    return CFSTR("(undefined)");
  else
    return off_1E2D179B8[(char)a1];
}

unint64_t RBSRoleFromDarwinRole(unsigned int a1)
{
  unint64_t v1;

  v1 = 0x2030504040704uLL >> (8 * a1);
  if (a1 >= 7)
    LOBYTE(v1) = 4;
  return v1 & 7;
}

BOOL RBSPreventLaunchStateIsPrevented(int a1)
{
  return a1 == 2;
}

const __CFString *NSStringFromRBSPreventLaunchState(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("(undefined)");
  else
    return off_1E2D179E0[(char)a1];
}

void RBSCaptureStateToFile(NSObject *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  uint8_t buf[4];
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  rbs_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v39 = a1;
    _os_log_impl(&dword_190CD6000, v2, OS_LOG_TYPE_DEFAULT, "RunningBoard capturing state to file %s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "fileExistsAtPath:", v5))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = v6;
      +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      objc_msgSend(v9, "captureStateForSubsystem:error:", 0, &v37);
      v10 = objc_claimAutoreleasedReturnValue();
      v6 = v37;

      if (v10)
        v11 = 1;
      else
        v11 = v7 >= 2;
      ++v7;
    }
    while (!v11);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v6;
      -[NSObject writeToFile:atomically:encoding:error:](v10, "writeToFile:atomically:encoding:error:", v12, 0, 4, &v36);
      v13 = v36;

      if (v13)
      {
        v14 = -[NSObject code](v13, "code");
        rbs_general_log();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v14 == 28)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v39 = v13;
            _os_log_impl(&dword_190CD6000, v16, OS_LOG_TYPE_DEFAULT, "RBSCaptureStateToFile writeToFile failed with expected error %{public}@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          RBSCaptureStateToFile_cold_3((uint64_t)v13, v16, v30, v31, v32, v33, v34, v35);
        }

        v6 = v13;
      }
      else
      {
        rbs_general_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v39 = a1;
          _os_log_impl(&dword_190CD6000, v6, OS_LOG_TYPE_DEFAULT, "RunningBoard successfully captured state to file %s", buf, 0xCu);
        }
      }
    }
    else
    {
      if (!v6)
        RBSCaptureStateToFile_cold_1();
      rbs_general_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        RBSCaptureStateToFile_cold_2((uint64_t)v6, v23, v24, v25, v26, v27, v28, v29);

    }
  }
  else
  {
    rbs_general_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      RBSCaptureStateToFile_cold_4((uint64_t)v5, v10, v17, v18, v19, v20, v21, v22);
  }

}

void sub_190D0D074(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

BOOL RBSXPCEqualDates(void *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = a2;
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v5 = v4;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v7 = v6;

  return vabdd_f64(v5, v7) < 0.00001;
}

__CFString *nsObjFromXPCObj(void *a1)
{
  id v1;
  const _xpc_type_s *v2;
  void *v3;
  id v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  const void *bytes_ptr;
  uint64_t v10;

  v1 = a1;
  v2 = (const _xpc_type_s *)MEMORY[0x194019424]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("(%s)"), xpc_type_get_name(v2));
  if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C812D0])
  {
    if (v1 == (id)MEMORY[0x1E0C81240])
      v6 = CFSTR("true");
    else
      v6 = CFSTR("false");
    v7 = v6;
    goto LABEL_27;
  }
  if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C81328])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", xpc_int64_get_value(v1));
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C81398])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", xpc_uint64_get_value(v1));
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C81300])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", xpc_double_get_value(v1));
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C812F0])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)xpc_date_get_value(v1) / 1000000000.0);
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C812E8])
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D50]);
    bytes_ptr = xpc_data_get_bytes_ptr(v1);
    v5 = objc_msgSend(v8, "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v1));
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C81390])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", xpc_string_get_string_ptr(v1), 4);
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C813A0])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", xpc_uuid_get_bytes(v1));
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C812F8])
  {
    dictFromXPCDict(v1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C812C8])
  {
    arrayFromXPCArray(v1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2 != (const _xpc_type_s *)MEMORY[0x1E0C81310])
    {
LABEL_30:
      v7 = v3;
      goto LABEL_31;
    }
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = objc_msgSend(v4, "initWithFormat:", CFSTR("%s"), xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x1E0C81270]));
  }
  v7 = (__CFString *)v5;
  if (!v5)
    goto LABEL_30;
LABEL_27:
  if (v2 != (const _xpc_type_s *)MEMORY[0x1E0C812F8] && v2 != (const _xpc_type_s *)MEMORY[0x1E0C812C8])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@: %@"), v3, v7);

    v7 = (__CFString *)v10;
  }
LABEL_31:

  return v7;
}

id dictFromXPCDict(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD applier[4];
  id v6;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __dictFromXPCDict_block_invoke;
  applier[3] = &unk_1E2D17908;
  v3 = v2;
  v6 = v3;
  xpc_dictionary_apply(v1, applier);

  return v3;
}

id arrayFromXPCArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD applier[4];
  id v6;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __arrayFromXPCArray_block_invoke;
  applier[3] = &unk_1E2D178E0;
  v3 = v2;
  v6 = v3;
  xpc_array_apply(v1, applier);

  return v3;
}

uint64_t __dictFromXPCDict_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;

  nsObjFromXPCObj(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  return 1;
}

uint64_t __arrayFromXPCArray_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  nsObjFromXPCObj(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a2);

  return 1;
}

id _service()
{
  if (_service_onceToken != -1)
    dispatch_once(&_service_onceToken, &__block_literal_global_14);
  return (id)__service;
}

void ___service_block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!__service)
  {
    +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)__service;
    __service = v0;

  }
}

id rbs_set_assertion_adapter_service(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;

  v1 = a1;
  v2 = (id)__service;
  v3 = (void *)__service;
  __service = (uint64_t)v1;
  v4 = v1;

  return v2;
}

id _assertionMap()
{
  if (_assertionMap_onceToken != -1)
    dispatch_once(&_assertionMap_onceToken, &__block_literal_global_1_0);
  return (id)_assertionMap_map;
}

void ___assertionMap_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_assertionMap_map;
  _assertionMap_map = (uint64_t)v0;

}

id rbs_assertion_adapter_assertion_for_id(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  _assertionMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a1);
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);

  return v4;
}

uint64_t rbs_assertion_adapter_assertion_count()
{
  void *v0;
  uint64_t v1;

  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  _assertionMap();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "count");
  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);

  return v1;
}

id _lock_nextID()
{
  id v0;

  ++_lock_nextID_counter;
  v0 = objc_alloc(MEMORY[0x1E0CB37E8]);
  return (id)objc_msgSend(v0, "initWithLongLong:", _lock_nextID_counter);
}

uint64_t rbs_acquire_domain_assertion(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = a2;
  return rbs_acquire_domain_assertion_list(a1, (uint64_t)v4, 1, a3);
}

uint64_t rbs_acquire_domain_assertion_list(uint64_t a1, uint64_t a2, int a3, int a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  RBSAssertion *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v30;
  id v31;

  if (a4 < 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:"), a1);
  +[RBSAcquisitionCompletionAttribute attributeWithCompletionPolicy:](RBSAcquisitionCompletionAttribute, "attributeWithCompletionPolicy:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  objc_msgSend(v7, "addObject:", v9);

  if (a3 < 1)
  {
    v16 = v8;
  }
  else
  {
    v11 = 0;
    v12 = 8 * a3;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a2 + v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", v30, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v14);

      if (v11)
        v15 = CFSTR(",%@");
      else
        v15 = CFSTR("%@");
      objc_msgSend(v8, "stringByAppendingFormat:", v15, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v11 += 8;
      v8 = v16;
    }
    while (v12 != v11);
  }
  objc_msgSend(v16, "stringByAppendingString:", CFSTR("}"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [RBSAssertion alloc];
  +[RBSAssertionDescriptor descriptorWithIdentifier:target:explanation:attributes:](RBSAssertionDescriptor, "descriptorWithIdentifier:target:explanation:attributes:", 0, v19, v18, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _service();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = -[RBSAssertion _initWithDescriptor:service:](v20, "_initWithDescriptor:service:", v21, v22);

  v31 = 0;
  LOBYTE(v22) = objc_msgSend(v23, "acquireWithError:", &v31);
  v24 = v31;
  if ((v22 & 1) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    _assertionMap();
    v25 = objc_claimAutoreleasedReturnValue();
    _lock_nextID();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v25, "setObject:forKey:", v23, v26);
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
    v27 = (void *)v30;
  }
  else
  {
    rbs_assertion_log();
    v25 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v30;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      rbs_acquire_domain_assertion_list_cold_1((uint64_t)v18, (uint64_t)v24, v25);
    v26 = &unk_1E2D2ADC0;
  }

  v17 = objc_msgSend(v26, "longLongValue");
  return v17;
}

void rbs_invalidate_domain_assertion(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  _assertionMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a1);
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v2, "removeObjectForKey:", v3);
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
    objc_msgSend(v4, "invalidate");
  }
  else
  {
    rbs_assertion_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      rbs_invalidate_domain_assertion_cold_1(a1, v5);

    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
  }

}

void sub_190D0EAE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_190D0F3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_190D0F514(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey_cold_1(objc_class *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315650;
  v7 = "RBSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey";
  v8 = 2114;
  v9 = v5;
  v10 = 2114;
  v11 = a2;
  _os_log_error_impl(&dword_190CD6000, a3, OS_LOG_TYPE_ERROR, "%s the encoded object for class %{public}@ failed to decode with error %{public}@", (uint8_t *)&v6, 0x20u);

}

void RBSAtomicGetFlag_cold_1()
{
  __assert_rtn("RBSAtomicGetFlag", "RBSUtilities.m", 29, "value && (sizeof(int32_t) == sizeof(*value))");
}

void RBSAtomicSetFlag_cold_1()
{
  __assert_rtn("RBSAtomicSetFlag", "RBSUtilities.m", 36, "value && (sizeof(int32_t) == sizeof(*value))");
}

void _RBShortBSDProcessInfoForPID_cold_1(int a1, NSObject *a2)
{
  int *v4;
  char *v5;
  _DWORD v6[2];
  __int16 v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = __error();
  v5 = strerror(*v4);
  v6[0] = 67109378;
  v6[1] = a1;
  v7 = 2082;
  v8 = v5;
  _os_log_error_impl(&dword_190CD6000, a2, OS_LOG_TYPE_ERROR, "Unable to get short BSD proc info for %d: %{public}s", (uint8_t *)v6, 0x12u);
  OUTLINED_FUNCTION_0_1();
}

void RBSExecutablePathForPID_cold_1(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  RBSandboxCanGetProcessInfo(a1);
  OUTLINED_FUNCTION_1_0(&dword_190CD6000, v1, v2, "RBSExecutablePathForPID denied for pid %d sandbox access %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_0_1();
}

void RBSExecutablePathForPID_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_1_0(&dword_190CD6000, v0, v1, "proc_pidpath failed for %d with errno %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_0_1();
}

void RBSAuditTokenRepresentsPlatformBinary_cold_1(_OWORD *a1, NSObject *a2)
{
  __int128 v3;
  pid_t v4;
  uint64_t v5;
  audit_token_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1[1];
  *(_OWORD *)v6.val = *a1;
  *(_OWORD *)&v6.val[4] = v3;
  v4 = audit_token_to_pid(&v6);
  v6.val[0] = 67109120;
  v6.val[1] = v4;
  OUTLINED_FUNCTION_2_0(&dword_190CD6000, a2, v5, "SecTaskCreateWithAuditToken failed for %d", (uint8_t *)&v6);
}

void RBSIsBinaryCatalystOriOS_cold_1(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_2_0(&dword_190CD6000, a2, a3, "Error getting platform info for pid %d", (uint8_t *)v3);
}

void RBSContainedExtensionBundleIDs_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_190CD6000, a4, OS_LOG_TYPE_DEBUG, "Adding %@ to terminate predicate", a1, 0xCu);

}

void _RBSXPCEncodeObjectForKey_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_190CD6000, "Exception thrown while encoding object of class %{public}@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_3();
}

void _BSXPCDecodeObjectFromContext_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_190CD6000, "Exception thrown while decoding class %{public}@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_3();
}

void _BSXPCDecodeObjectFromContext_cold_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6();
  v2 = (void *)v1;
  OUTLINED_FUNCTION_0_2(v1, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_190CD6000, "Decoded object class %{public}@ does not match expected class %{public}@", v5, v6);

  OUTLINED_FUNCTION_3();
}

void _BSXPCDecodeObjectFromContext_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_0(&dword_190CD6000, a3, (uint64_t)a3, "Attempted to decode a collection (%{public}@) without specifying the class it contains", (uint8_t *)a2);

  OUTLINED_FUNCTION_3();
}

void _BSXPCDecodeObjectFromContext_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, v0, v1, "Unable to decode array: an object within the array failed to decode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _BSXPCDecodeObjectFromContext_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, v0, v1, "Invalid decoding context for collection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _BSXPCDecodeObjectFromContext_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, v0, v1, "No data was decoded from which to create an NSKeyedUnarchiver", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _BSXPCDecodeObjectFromContext_cold_8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_4_0(&dword_190CD6000, a2, a3, "Unable to create NSKeyedUnarchiver for data: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void _BSXPCDecodeObjectFromContext_cold_9(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_4_0(&dword_190CD6000, a2, a3, "Unable to decode dictionary key %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_0();
}

void _BSXPCDecodeObjectFromContext_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, v0, v1, "Invalid decoding context for dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _BSXPCDecodeObjectFromContext_cold_11()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_190CD6000, "Unable to reify class %{public}@ for expected class %{public}@", v4, v5);

  OUTLINED_FUNCTION_3();
}

void _BSXPCDecodeObjectFromContext_cold_12()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_1(&dword_190CD6000, "Decoded class %{public}@ is not compatible with expected class %{public}@", v4, v5);

  OUTLINED_FUNCTION_3();
}

void _BSXPCDecodeObjectFromContext_cold_13(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_0(&dword_190CD6000, a3, (uint64_t)a3, "No valid encoding type could be determined for expected class: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_3();
}

void RBSMachPortType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, a1, a3, "Port has no valid type", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void RBSCaptureStateToFile_cold_1()
{
  __assert_rtn("RBSCaptureStateToFile", "RBSStateCapture.m", 36, "error");
}

void RBSCaptureStateToFile_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_190CD6000, a2, a3, "RBSCaptureStateToFile captureState failed with error %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void RBSCaptureStateToFile_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_190CD6000, a2, a3, "RBSCaptureStateToFile writeToFile failed with error %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void RBSCaptureStateToFile_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_190CD6000, a2, a3, "RBSCaptureStateToFile given non-existant directory %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void rbs_acquire_domain_assertion_list_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_190CD6000, log, OS_LOG_TYPE_ERROR, "Failed to acquire domain assertion %{public}@ with error %{public}@", (uint8_t *)&v3, 0x16u);
}

void rbs_invalidate_domain_assertion_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_190CD6000, a2, OS_LOG_TYPE_FAULT, "Unknown rbs_domain_assertion_id_t %llu, can not invalidate", (uint8_t *)&v2, 0xCu);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1E0CD6638](task);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1E0C99FF8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1E0C9A860]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

uint64_t _NSIsNSOrderedSet()
{
  return MEMORY[0x1E0C9A8A0]();
}

uint64_t _NSIsNSSet()
{
  return MEMORY[0x1E0C9A8A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x1E0C80FD0](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1E0C813C0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40C0](atoken);
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40D0](atoken);
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40D8](atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40E0](atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F8](atoken);
}

gid_t audit_token_to_rgid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE4100](atoken);
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE4108](atoken);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
  MEMORY[0x1E0C82FF0](workloop, frequency);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint64_t kpersona_find_by_type()
{
  return MEMORY[0x1E0C83A50]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x1E0C83A60]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1E0C83D88](*(_QWORD *)&task, *(_QWORD *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1E0C85848](*(_QWORD *)&target_tport, *(_QWORD *)&pid, tn);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x1E0C85F18]();
}

uint64_t xpc_bundle_get_error()
{
  return MEMORY[0x1E0C85F28]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x1E0C85F38]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C860E8](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1E0C86190](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1E0C861D0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x1E0C86238]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1E0C862D8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1E0C862F0]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

uint64_t xpc_endpoint_create_bs_from_port()
{
  return MEMORY[0x1E0C86400]();
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

uint64_t xpc_get_class4NSXPC()
{
  return MEMORY[0x1E0C86508]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

size_t xpc_hash(xpc_object_t object)
{
  return MEMORY[0x1E0C86538](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x1E0C865D8]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1E0C865E0]();
}

uint64_t xpc_mach_send_create_with_disposition()
{
  return MEMORY[0x1E0C865E8]();
}

uint64_t xpc_mach_send_get_right()
{
  return MEMORY[0x1E0C865F0]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1E0C867A0](type);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1E0C867E0](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

