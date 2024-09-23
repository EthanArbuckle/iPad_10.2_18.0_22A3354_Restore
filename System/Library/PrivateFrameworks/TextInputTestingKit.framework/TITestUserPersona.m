@implementation TITestUserPersona

- (TITestUserPersona)initWithPersonaName:(id)a3
{
  id v4;
  TITestUserPersona *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *personaData;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *cachedKeyInfo;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TITestUserPersona;
  v5 = -[TITestUserPersona init](&v18, sel_init);
  if (v5)
  {
    __URLWithPersonaForPersonaName(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("plist"));

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      personaData = v5->_personaData;
      v5->_personaData = (NSDictionary *)v9;
    }
    else
    {
      objc_msgSend(v6, "pathExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("json"));

      if (!v12)
        goto LABEL_8;
      v13 = (void *)MEMORY[0x24BDD1608];
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "JSONObjectWithData:options:error:", v14, 0, 0);
      personaData = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v5->_personaData, personaData);
    }

LABEL_8:
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cachedKeyInfo = v5->_cachedKeyInfo;
    v5->_cachedKeyInfo = v15;

  }
  return v5;
}

- (void)updateFromKeyplane:(id)a3
{
  UIKBTree *v5;
  NSMutableDictionary *cachedKeyInfo;
  void *v7;
  NSMutableDictionary *v8;
  id v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;
  __int128 v13;
  uint64_t v14;
  id v15;
  NSDictionary *personaData;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  UIKBTree *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  NSMutableDictionary *v74;
  id v75;
  id v76;
  id v77;
  _QWORD *v78;
  _QWORD v79[4];
  UIKBTree *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  _QWORD *v91;
  _QWORD v92[6];
  __int128 v93;
  __int128 v94;

  v5 = (UIKBTree *)a3;
  if (self->_currentKeyplane != v5)
  {
    objc_storeStrong((id *)&self->_currentKeyplane, a3);
    cachedKeyInfo = self->_cachedKeyInfo;
    -[UIKBTree name](self->_currentKeyplane, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](cachedKeyInfo, "objectForKey:", v7);
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v53 = v5;
      v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v10 = self->_cachedKeyInfo;
      -[UIKBTree name](self->_currentKeyplane, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v9, v11);

      -[UIKBTree keys](v5, "keys");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v92[0] = 0;
      v92[1] = v92;
      v92[2] = 0x5012000000;
      v92[3] = __Block_byref_object_copy__750;
      v92[4] = __Block_byref_object_dispose__751;
      v92[5] = &unk_22FAD47AA;
      v13 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
      v93 = *MEMORY[0x24BDBF090];
      v94 = v13;
      v14 = MEMORY[0x24BDAC760];
      v88[0] = MEMORY[0x24BDAC760];
      v88[1] = 3221225472;
      v88[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke;
      v88[3] = &unk_24FD485D0;
      v15 = v9;
      v89 = v15;
      v52 = v12;
      v90 = v52;
      v91 = v92;
      objc_msgSend(v50, "enumerateObjectsUsingBlock:", v88);
      v82 = 0;
      v83 = &v82;
      v84 = 0x3032000000;
      v85 = __Block_byref_object_copy__30;
      v86 = __Block_byref_object_dispose__31;
      v87 = 0;
      personaData = self->_personaData;
      v79[0] = v14;
      v79[1] = 3221225472;
      v79[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_32;
      v79[3] = &unk_24FD485F8;
      v80 = v5;
      v81 = &v82;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](personaData, "enumerateKeysAndObjectsUsingBlock:", v79);
      v44 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend((id)v83[5], "objectForKey:", CFSTR("KEYGROUPS"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v17 = objc_alloc(MEMORY[0x24BDBCEF0]);
      objc_msgSend(v15, "allKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithArray:", v18);

      v20 = v14;
      v73[0] = v14;
      v73[1] = 3221225472;
      v73[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_2;
      v73[3] = &unk_24FD48670;
      v78 = v92;
      v8 = (NSMutableDictionary *)v15;
      v74 = v8;
      v21 = v19;
      v75 = v21;
      v22 = v51;
      v76 = v22;
      v23 = v44;
      v77 = v23;
      v49 = v21;
      objc_msgSend(v54, "enumerateKeysAndObjectsUsingBlock:", v73);
      if (objc_msgSend(v21, "count"))
        objc_msgSend(v23, "setObject:forKey:", v21, CFSTR("OTHERS"));
      v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v23, "allKeys", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v20;
      v71[1] = 3221225472;
      v71[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_5;
      v71[3] = &unk_24FD48698;
      v26 = v24;
      v72 = v26;
      objc_msgSend(v25, "enumerateObjectsUsingBlock:", v71);

      objc_msgSend((id)v83[5], "objectForKey:", CFSTR("AFFINES"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v20;
      v67[1] = 3221225472;
      v67[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_6;
      v67[3] = &unk_24FD486E8;
      v28 = v26;
      v68 = v28;
      v29 = v52;
      v69 = v29;
      v30 = v22;
      v70 = v30;
      v48 = v27;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v67);
      objc_msgSend((id)v83[5], "objectForKey:", CFSTR("GLOBALS"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", CFSTR("STDDEVXAXISPCT"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)v83[5], "objectForKey:", CFSTR("GLOBALS"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKey:", CFSTR("STDDEVYAXISPCT"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v28;

      v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v61[0] = v20;
      v61[1] = 3221225472;
      v61[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_2_110;
      v61[3] = &unk_24FD48710;
      v34 = v29;
      v62 = v34;
      v35 = v30;
      v63 = v35;
      v36 = v33;
      v64 = v36;
      v37 = v47;
      v65 = v37;
      v38 = v46;
      v66 = v38;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v61);
      v55[0] = v20;
      v55[1] = 3221225472;
      v55[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_118;
      v55[3] = &unk_24FD48760;
      v39 = v23;
      v56 = v39;
      v40 = v45;
      v57 = v40;
      v41 = v34;
      v58 = v41;
      v42 = v35;
      v59 = v42;
      v43 = v36;
      v60 = v43;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v55);

      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(v92, 8);

      v5 = v53;
    }
    self->_keyInfo = v8;

  }
}

- (CGPoint)userPointForKey:(id)a3
{
  NSMutableDictionary *keyInfo;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  keyInfo = self->_keyInfo;
  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](keyInfo, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "errorGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "randomPointInDistribution");
  v8 = v7;
  v10 = v9;

  objc_msgSend(v5, "rotationMatrix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "rotationMatrix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transformedPoint:", v8, v10);
    v8 = v13;
    v10 = v14;

  }
  objc_msgSend(v5, "center");
  v16 = v15;
  objc_msgSend(v5, "center");
  v18 = v10 + v17;

  v19 = v8 + v16;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (NSDictionary)personaData
{
  return self->_personaData;
}

- (void)setPersonaData:(id)a3
{
  objc_storeStrong((id *)&self->_personaData, a3);
}

- (UIKBTree)currentKeyplane
{
  return self->_currentKeyplane;
}

- (void)setCurrentKeyplane:(id)a3
{
  objc_storeStrong((id *)&self->_currentKeyplane, a3);
}

- (NSMutableDictionary)keyInfo
{
  return self->_keyInfo;
}

- (void)setKeyInfo:(id)a3
{
  self->_keyInfo = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)cachedKeyInfo
{
  return self->_cachedKeyInfo;
}

- (void)setCachedKeyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cachedKeyInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedKeyInfo, 0);
  objc_storeStrong((id *)&self->_currentKeyplane, 0);
  objc_storeStrong((id *)&self->_personaData, 0);
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  TITestUserPersonaKeyInfo *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v16 = a2;
  v5 = objc_alloc_init(TITestUserPersonaKeyInfo);
  objc_msgSend(v16, "frame");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  -[TITestUserPersonaKeyInfo setCenter:](v5, "setCenter:", MidX, CGRectGetMidY(v18));
  v11 = (void *)a1[4];
  objc_msgSend(v16, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v5, v12);

  v13 = (void *)a1[5];
  objc_msgSend(v16, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v16, v14);

  v15 = *(_QWORD *)(a1[6] + 8);
  if (a3)
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    *(CGRect *)(*(_QWORD *)(a1[6] + 8) + 48) = CGRectUnion(*(CGRect *)(v15 + 48), v19);
  }
  else
  {
    *(CGFloat *)(v15 + 48) = x;
    *(CGFloat *)(v15 + 56) = y;
    *(CGFloat *)(v15 + 64) = width;
    *(CGFloat *)(v15 + 72) = height;
  }

}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_32(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsString:", v10);

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat MidX;
  CGFloat MidY;
  id v54;
  uint64_t v55;
  void *v56;
  FILE *v57;
  FILE *v58;
  double v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  _QWORD *v64;
  uint64_t *v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  _QWORD v78[4];
  _QWORD v79[4];
  id v80;
  id v81;
  double v82;
  double v83;
  double v84;
  double v85;
  CGRect v86;
  CGRect v87;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("OTHERS")))
  {
    fwrite("Invalid key group 'OTHERS' -- keys remaining after grouping is complete will automatically go into the 'OTHERS' group\n", 0x76uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    abort();
  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v6, "objectForKey:", CFSTR("AREA"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("AREA"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectForKey:", CFSTR("RECT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectForKey:", CFSTR("OVAL"));
    v10 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v10;
    objc_msgSend(v61, "objectForKey:", CFSTR("REFKEYRECT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Missing REFKEYRECT in area key group '%s'\n", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
      abort();
    }
    if (v9 && v10)
    {
      v57 = (FILE *)*MEMORY[0x24BDAC8D8];
      objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      fprintf(v57, "Invalid area key group '%s' - both RECT and OVAL specified.\n");
    }
    else
    {
      if (v9)
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("TOPPCT"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        objc_msgSend(v9, "objectForKey:", CFSTR("LEFTPCT"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        objc_msgSend(v9, "objectForKey:", CFSTR("HEIGHTPCT"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v20 = v19;

        objc_msgSend(v9, "objectForKey:", CFSTR("WIDTHPCT"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v23 = v22 / 100.0;

        v24 = *(double **)(*(_QWORD *)(a1 + 64) + 8);
        v25 = v24[8];
        v26 = v24[9];
        v27 = v24[6] + v25 * (v17 / 100.0);
        v28 = v24[7] + v26 * (v14 / 100.0);
        v29 = v23 * v25;
        v30 = v20 / 100.0 * v26;
        v31 = MEMORY[0x24BDAC760];
        v79[0] = MEMORY[0x24BDAC760];
        v79[1] = 3221225472;
        v79[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_3;
        v79[3] = &unk_24FD48620;
        v59 = v27;
        v82 = v27;
        v83 = v28;
        v84 = v29;
        v85 = v30;
        v32 = *(void **)(a1 + 32);
        v80 = *(id *)(a1 + 40);
        v33 = v7;
        v81 = v33;
        objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v79);

        objc_msgSend(v11, "objectForKey:", CFSTR("TOPPCT"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValue");
        v36 = v35;

        objc_msgSend(v11, "objectForKey:", CFSTR("LEFTPCT"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "doubleValue");
        v39 = v38;

        objc_msgSend(v11, "objectForKey:", CFSTR("HEIGHTPCT"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "doubleValue");
        v42 = v41;

        objc_msgSend(v11, "objectForKey:", CFSTR("WIDTHPCT"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "doubleValue");
        v44 = v36 / 100.0;
        v45 = v42 / 100.0;
        v47 = v46 / 100.0;

        v48 = v59 + v29 * (v39 / 100.0);
        v49 = v28 + v30 * v44;
        v50 = v29 * v47;
        v51 = v30 * v45;
        v86.origin.x = v48;
        v86.origin.y = v49;
        v86.size.width = v50;
        v86.size.height = v51;
        MidX = CGRectGetMidX(v86);
        v87.origin.x = v48;
        v87.origin.y = v49;
        v87.size.width = v50;
        v87.size.height = v51;
        MidY = CGRectGetMidY(v87);
        v78[0] = 0;
        v78[1] = v78;
        v78[2] = 0x2020000000;
        v78[3] = 0x7FF0000000000000;
        v72 = 0;
        v73 = &v72;
        v74 = 0x3032000000;
        v75 = __Block_byref_object_copy__30;
        v76 = __Block_byref_object_dispose__31;
        v77 = 0;
        v62[0] = v31;
        v62[1] = 3221225472;
        v62[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_4;
        v62[3] = &unk_24FD48648;
        v54 = *(id *)(a1 + 32);
        v66 = v48;
        v67 = v49;
        v68 = v50;
        v69 = v51;
        v70 = MidX;
        v71 = MidY;
        v63 = v54;
        v64 = v78;
        v65 = &v72;
        objc_msgSend(v33, "enumerateObjectsUsingBlock:", v62);
        v55 = v73[5];
        if (!v55)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "No reference key found in area for key group '%s'\n", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
          abort();
        }
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v55, v5);

        _Block_object_dispose(&v72, 8);
        _Block_object_dispose(v78, 8);

        goto LABEL_10;
      }
      v58 = (FILE *)*MEMORY[0x24BDAC8D8];
      if (v10)
      {
        fwrite("NYI", 3uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      }
      else
      {
        objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
        fprintf(v58, "Invalid area key group '%s' - no RECT or OVAL specified.\n");
      }
    }
    abort();
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("NAMES"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    fwrite("NYI", 3uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    abort();
  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v7, v5);

}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_5(uint64_t a1, void *a2)
{
  TIFitAffineMLLMatrixWrapper *v3;
  id v4;

  v4 = a2;
  v3 = objc_alloc_init(TIFitAffineMLLMatrixWrapper);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, v4);

}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  void (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  void *v72;
  _QWORD *v73[6];

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Invalid AFFINES entry %s: Must match an ASSIGNMENT group.\n", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    abort();
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("VALUES"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("VALUES"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v9, "count") != 6)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "VALUES should be an array of 6 numbers in AFFINES entry %s.\n", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
      abort();
    }
    v67 = 0;
    v68 = &v67;
    v69 = 0x5812000000;
    v70 = __Block_byref_object_copy__75;
    v71 = __Block_byref_object_dispose__76;
    v72 = &unk_22FAD47AA;
    TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v73);
    v64[0] = MEMORY[0x24BDAC760];
    v64[1] = 3221225472;
    v64[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_78;
    v64[3] = &unk_24FD486C0;
    v10 = v5;
    v65 = v10;
    v66 = &v67;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v64);
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMatrix:", v68 + 6);

    _Block_object_dispose(&v67, 8);
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v73[3]);

  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("TRANS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v12;
    objc_msgSend(v6, "objectForKey:", CFSTR("ROTRAD"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("ROTDEG"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14
        || (v16 = (void *)MEMORY[0x24BDD16E0],
            objc_msgSend(v14, "doubleValue"),
            objc_msgSend(v16, "numberWithDouble:", v17 * 3.14159265 / 180.0),
            v13 = objc_claimAutoreleasedReturnValue(),
            v15,
            !v13))
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("ROTGRA"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v18, "doubleValue");
          objc_msgSend(v20, "numberWithDouble:", v21 * 3.14159265 / 200.0);
          v13 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
        }

      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("SKEWROTRAD"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)v13;
    if (!v22)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("SKEWROTDEG"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (!v23
        || (v25 = (void *)MEMORY[0x24BDD16E0],
            objc_msgSend(v23, "doubleValue"),
            objc_msgSend(v25, "numberWithDouble:", v26 * 3.14159265 / 180.0),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v24,
            !v22))
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("SKEWROTGRA"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          v29 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v27, "doubleValue");
          objc_msgSend(v29, "numberWithDouble:", v30 * 3.14159265 / 200.0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }

      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("SCALE"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "doubleValue");
    objc_msgSend(v32, "setRotation:");
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(v32, "setSkewRotation:");
    if (v12)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("XPCT"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        v35 = v33;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
        v35 = (id)objc_claimAutoreleasedReturnValue();
      }
      v36 = v35;

      objc_msgSend(v62, "objectForKey:", CFSTR("YPCT"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        v39 = v37;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
        v39 = (id)objc_claimAutoreleasedReturnValue();
      }
      v40 = v39;

      v41 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v5);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKey:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "frame");
      v45 = v44;
      v47 = v46;

      objc_msgSend(v36, "doubleValue");
      v49 = v48;
      objc_msgSend(v40, "doubleValue");
      objc_msgSend(v32, "setXTrans:yTrans:", v45 * (v49 / 100.0), v47 * (v50 / 100.0));

      v12 = v62;
    }
    if (v31)
    {
      objc_msgSend(v31, "objectForKey:", CFSTR("XPCT"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      if (v51)
      {
        v53 = v51;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 100.0);
        v53 = (id)objc_claimAutoreleasedReturnValue();
      }
      v54 = v53;

      objc_msgSend(v31, "objectForKey:", CFSTR("YPCT"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55;
      if (v55)
      {
        v57 = v55;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 100.0);
        v57 = (id)objc_claimAutoreleasedReturnValue();
      }
      v58 = v57;

      objc_msgSend(v54, "doubleValue");
      v60 = v59;
      objc_msgSend(v58, "doubleValue");
      objc_msgSend(v32, "setXScale:yScale:", v60 / 100.0, v61 / 100.0);

      v12 = v62;
    }

  }
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_2_110(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v19[0] = CFSTR("GAUSSIAN_ERROR_STDDEV_X");
  v11 = (void *)MEMORY[0x24BDD16E0];
  v12 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "doubleValue");
  objc_msgSend(v11, "numberWithDouble:", v8 * (v13 / 100.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = CFSTR("GAUSSIAN_ERROR_STDDEV_Y");
  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 64), "doubleValue");
  objc_msgSend(v15, "numberWithDouble:", v10 * (v16 / 100.0));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = CFSTR("SCALE_ERROR_UNITS_TO_POINTS");
  v20[1] = v17;
  v20[2] = &unk_24FD5FDB8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v18, v3);

}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  TIGaussianErrorGenerator *v25;
  void *v26;
  TIGaussianErrorGenerator *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  CGRect v31;
  CGRect v32;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __40__TITestUserPersona_updateFromKeyplane___block_invoke_2_119;
  v29[3] = &unk_24FD48738;
  v28 = v5;
  v30 = v28;
  objc_msgSend(v7, "keysOfEntriesPassingTest:", v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "frame");
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;
  MidX = CGRectGetMidX(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MidY = CGRectGetMidY(v32);
  objc_msgSend(v6, "center");
  v21 = v20;
  objc_msgSend(v6, "center");
  objc_msgSend(v10, "transformedPoint:", v21 - MidX, v22 - MidY);
  objc_msgSend(v6, "setCenter:", MidX + v23, MidY + v24);
  v25 = [TIGaussianErrorGenerator alloc];
  objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[TIGaussianErrorGenerator initWithAttributes:](v25, "initWithAttributes:", v26);

  objc_msgSend(v6, "setErrorGenerator:", v27);
  objc_msgSend(v6, "setRotationMatrix:", v10);

}

uint64_t __40__TITestUserPersona_updateFromKeyplane___block_invoke_2_119(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32));
  *a4 = result;
  return result;
}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_78(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "VALUES entry %ld in AFFINES entry %s is not a number or string.\n", a3, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
    abort();
  }
  objc_msgSend(v6, "doubleValue");
  *(_QWORD *)MEMORY[0x2348A864C](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = v5;

}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  CGPoint v13;
  CGRect v14;

  v12 = a2;
  v5 = a3;
  v6 = *(double *)(a1 + 48);
  v7 = *(double *)(a1 + 56);
  v8 = *(double *)(a1 + 64);
  v9 = *(double *)(a1 + 72);
  objc_msgSend(v5, "center");
  v13.x = v10;
  v13.y = v11;
  v14.origin.x = v6;
  v14.origin.y = v7;
  v14.size.width = v8;
  v14.size.height = v9;
  if (CGRectContainsPoint(v14, v13) && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v12))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v12);
  }

}

void __40__TITestUserPersona_updateFromKeyplane___block_invoke_4(uint64_t a1, void *a2)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;
  CGPoint v12;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v6 = v5;
  v8 = v7;

  v12.x = v6;
  v12.y = v8;
  if (CGRectContainsPoint(*(CGRect *)(a1 + 56), v12))
  {
    v9 = (v8 - *(double *)(a1 + 96)) * (v8 - *(double *)(a1 + 96))
       + (v6 - *(double *)(a1 + 88)) * (v6 - *(double *)(a1 + 88));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v9 < *(double *)(v10 + 24))
    {
      *(double *)(v10 + 24) = v9;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    }
  }

}

@end
