@implementation PBTextReader

- (PBTextReader)init
{
  PBTextReader *v2;
  id v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBTextReader;
  v2 = -[PBTextReader init](&v6, sel_init);
  if (v2)
  {
    v2->_whitespaceAndNewlineCharacterSet = (NSCharacterSet *)(id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v3 = objc_alloc_init(MEMORY[0x1E0CB3780]);
    objc_msgSend(v3, "addCharactersInRange:", 97, 26);
    objc_msgSend(v3, "addCharactersInRange:", 65, 26);
    objc_msgSend(v3, "addCharactersInRange:", 48, 10);
    objc_msgSend(v3, "addCharactersInString:", CFSTR("_:"));
    v2->_tagNameCharacterSet = (NSCharacterSet *)objc_msgSend(v3, "copy");
    v4 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet"), "mutableCopy");
    objc_msgSend(v4, "addCharactersInString:", CFSTR("."));
    v2->_nonHexDigitCharacterSet = (NSCharacterSet *)objc_msgSend(v4, "copy");
    v2->_objects = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_cachedObjectTypes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBTextReader;
  -[PBTextReader dealloc](&v3, sel_dealloc);
}

- (id)readMessageType:(Class)a3 fromString:(id)a4
{
  id result;
  NSString *v8;
  objc_class *v9;

  result = (id)objc_msgSend(a4, "length");
  if (result)
  {
    v8 = (NSString *)objc_msgSend(a4, "copy");
    self->_string = v8;
    self->_pos = 0;
    self->_length = -[NSString length](v8, "length");
    v9 = -[PBTextReader _readObject:]((uint64_t)self, a3);

    self->_pos = 0;
    self->_length = 0;
    self->_string = 0;
    return v9;
  }
  return result;
}

- (objc_class)_readObject:(uint64_t)a1
{
  objc_class *v2;
  uint64_t v3;
  NSString *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  uint64_t v80;
  id v81;
  _QWORD *v82;
  void *v83;
  unint64_t v84;
  int v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  id v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  void *v126[16];
  _QWORD v127[3];

  v127[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = a2;
  v3 = a1;
  if (!a2)
  {
    v5 = 0;
    while (1)
    {
      while (1)
      {
LABEL_19:
        if (*(_QWORD *)(v3 + 32) >= *(_QWORD *)(v3 + 40))
          return v2;
        v114 = 0;
        v115 = 0;
        -[PBTextReader _readTag:andType:](v3, (uint64_t *)&v115, &v114);
        v15 = v115;
        if (objc_msgSend(v115, "length"))
          break;
        v17 = 0;
LABEL_26:
        switch(v114)
        {
          case 0:
            v19 = *(_QWORD *)(v3 + 32);
            v20 = *(_QWORD *)(a1 + 40);
            v21 = 20;
            if (v19 > 20)
              v21 = v19;
            if ((unint64_t)(v20 - v19) >= 0x28)
              v22 = 40;
            else
              v22 = v20 - v19;
            v23 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v21 - 20, v22);
            v24 = v115;
            v108 = -[NSString camelCase](v115);
            v112 = v17;
            v106 = v23;
            v107 = v24;
            v101 = v19;
            v102 = v20;
            v3 = a1;
            v25 = CFSTR("read unknown tag");
            goto LABEL_33;
          case 1:
            if (!v17)
              goto LABEL_131;
            if (*(_QWORD *)(v17 + 16))
            {
              if (*(_QWORD *)(v17 + 24))
                v26 = *(_QWORD *)(v17 + 24);
              else
                v26 = *(_QWORD *)(v17 + 16);
              v27 = (void *)-[PBTextReader _readObject:](v3, v26);
              if (!v27)
              {
                v69 = *(_QWORD *)(v3 + 32);
                v70 = *(_QWORD *)(a1 + 40);
                v71 = 20;
                if (v69 > 20)
                  v71 = v69;
                if ((unint64_t)(v70 - v69) >= 0x28)
                  v72 = 40;
                else
                  v72 = v70 - v69;
                v73 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v71 - 20, v72);
                v74 = v115;
                v108 = -[NSString camelCase](v115);
                v112 = v17;
                v106 = v73;
                v107 = v74;
                v101 = v69;
                v102 = v70;
                v3 = a1;
                v25 = CFSTR("unable to parse object");
LABEL_33:
                NSLog(CFSTR("%@ (at %i/%i \"%@\") tag: %@ / %@ for property: %@"), v25, v101, v102, v106, v107, v108, v112);
                continue;
              }
              v126[0] = v27;
LABEL_43:
              objc_msgSend(*(id *)(v17 + 40), "setArgument:atIndex:", v126, 2);
              objc_msgSend(*(id *)(v17 + 40), "invokeWithTarget:", v2);
            }
            else
            {
              if (!*(_QWORD *)(v17 + 120))
              {
LABEL_131:
                v87 = *(_QWORD *)(v3 + 32);
                v88 = *(_QWORD *)(a1 + 40);
                v89 = 20;
                if (v87 > 20)
                  v89 = v87;
                if ((unint64_t)(v88 - v87) >= 0x28)
                  v90 = 40;
                else
                  v90 = v88 - v87;
                v91 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v89 - 20, v90);
                v92 = v115;
                v108 = -[NSString camelCase](v115);
                v112 = v17;
                v106 = v91;
                v107 = v92;
                v101 = v87;
                v102 = v88;
                v3 = a1;
                v25 = CFSTR("expected object/struct type");
                goto LABEL_33;
              }
              v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              while (*(_QWORD *)(v3 + 32) < *(_QWORD *)(v3 + 40))
              {
                v126[0] = 0;
                *(_QWORD *)&v121 = 0;
                -[PBTextReader _readTag:andType:](v3, (uint64_t *)v126, (uint64_t *)&v121);
                switch((uint64_t)v121)
                {
                  case 0:
                    v49 = *(_QWORD *)(v3 + 32);
                    v50 = *(_QWORD *)(a1 + 40);
                    v51 = 20;
                    if (v49 > 20)
                      v51 = v49;
                    if ((unint64_t)(v50 - v49) >= 0x28)
                      v52 = 40;
                    else
                      v52 = v50 - v49;
                    v53 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v51 - 20, v52);
                    v54 = v126[0];
                    v110 = -[NSString camelCase](v126[0]);
                    v104 = v50;
                    v3 = a1;
                    NSLog(CFSTR("%@ (at %i/%i \"%@\") tag: %@ / %@ for property: %@"), CFSTR("read unrecoginzed struct tag"), v49, v104, v53, v54, v110, v17);
                    continue;
                  case 1:
                    v55 = *(_QWORD *)(v3 + 32);
                    v56 = *(_QWORD *)(a1 + 40);
                    v57 = 20;
                    if (v55 > 20)
                      v57 = v55;
                    if ((unint64_t)(v56 - v55) >= 0x28)
                      v58 = 40;
                    else
                      v58 = v56 - v55;
                    v59 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v57 - 20, v58);
                    v60 = v126[0];
                    v111 = -[NSString camelCase](v126[0]);
                    v105 = v56;
                    v3 = a1;
                    NSLog(CFSTR("%@ (at %i/%i \"%@\") tag: %@ / %@ for property: %@"), CFSTR("unexpected nested tag"), v55, v105, v59, v60, v111, v17);
                    continue;
                  case 2:
                  case 5:
                    goto LABEL_108;
                  case 3:
                    v61 = -[PBTextReader _readString](v3);
                    goto LABEL_89;
                  case 4:
                    v61 = (void *)-[PBTextReader _readValue](v3);
                    v62 = -[PBTextReader _parseNumber:maxValue:isSigned:](v61, 0xFFFFFFFFFFFFFFFFLL, 0);
                    if (!v62)
                      v62 = -[PBTextReader _parseNumber:maxValue:isSigned:](v61, 0x7FFFFFFFFFFFFFFFuLL, 1);
                    if (v62)
                      v61 = v62;
LABEL_89:
                    v63 = v126[0];
                    if (v126[0] && v61)
                    {
                      v64 = objc_msgSend(v48, "objectForKeyedSubscript:", v126[0]);
                      if (v64
                        && ((v65 = (void *)v64, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                         || (v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]),
                             objc_msgSend(v66, "addObject:", v65),
                             objc_msgSend(v48, "setObject:forKeyedSubscript:", v66, v63),
                             (v65 = v66) != 0)))
                      {
                        objc_msgSend(v65, "addObject:", v61);
                      }
                      else
                      {
                        objc_msgSend(v48, "setObject:forKeyedSubscript:", v61, v63);
                      }
                    }
                    break;
                  default:
                    continue;
                }
              }
LABEL_108:
              if (!v48)
              {
                v93 = *(_QWORD *)(v3 + 32);
                v94 = *(_QWORD *)(a1 + 40);
                v95 = 20;
                if (v93 > 20)
                  v95 = v93;
                if ((unint64_t)(v94 - v93) >= 0x28)
                  v96 = 40;
                else
                  v96 = v94 - v93;
                v97 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v95 - 20, v96);
                v98 = v115;
                v108 = -[NSString camelCase](v115);
                v112 = v17;
                v106 = v97;
                v107 = v98;
                v101 = v93;
                v102 = v94;
                v3 = a1;
                v25 = CFSTR("unable to parse struct");
                goto LABEL_33;
              }
              if (*(_QWORD *)(v17 + 96)
                || (v75 = dlsym((void *)0xFFFFFFFFFFFFFFFELL, (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@FromDictionaryRepresentation"), *(_QWORD *)(v17 + 104)), "UTF8String")), (*(_QWORD *)(v17 + 96) = v75) != 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v127[0] = v48;
                  v48 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 1);
                }
                v123 = 0u;
                v124 = 0u;
                v121 = 0u;
                v122 = 0u;
                v76 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v121, v126, 16);
                if (v76)
                {
                  v77 = v76;
                  v78 = *(_QWORD *)v122;
                  do
                  {
                    for (i = 0; i != v77; ++i)
                    {
                      if (*(_QWORD *)v122 != v78)
                        objc_enumerationMutation(v48);
                      v80 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * i);
                      v81 = *(id *)(v17 + 120);
                      if (v81)
                        v81 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v81);
                      (*(void (**)(uint64_t, uint64_t))(v17 + 96))(v80, objc_msgSend(v81, "mutableBytes"));
                      v120 = 0;
                      v82 = (_QWORD *)objc_msgSend(v81, "bytes");
                      v120 = v82;
                      if (*(_BYTE *)(v17 + 32) == 94)
                      {
                        if (-[NSString hasPrefix:](NSStringFromSelector((SEL)objc_msgSend(*(id *)(v17 + 40), "selector", v82)), "hasPrefix:", CFSTR("set")))
                        {
                          v83 = *(void **)(v17 + 40);
                          v82 = &v120;
                          goto LABEL_125;
                        }
                        v82 = v120;
                      }
                      v83 = *(void **)(v17 + 40);
LABEL_125:
                      objc_msgSend(v83, "setArgument:atIndex:", v82, 2);
                      objc_msgSend(*(id *)(v17 + 40), "invokeWithTarget:", v2);
                    }
                    v77 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v121, v126, 16);
                  }
                  while (v77);
                }
              }
              v3 = a1;
            }
            break;
          case 2:
          case 5:
            return v2;
          case 3:
            v28 = -[PBTextReader _readString](v3);
            if (!v28)
              continue;
            v126[0] = v28;
            if (!v17)
              continue;
            goto LABEL_43;
          case 4:
            v29 = (void *)-[PBTextReader _readValue](v3);
            if (!objc_msgSend(v29, "length"))
              continue;
            if (objc_msgSend(v29, "characterAtIndex:", 0) == 48
              || (v67 = objc_msgSend(v29, "rangeOfCharacterFromSet:", objc_msgSend(*(id *)(v3 + 24), "invertedSet")), v17)
              && *(_QWORD *)(v17 + 80)
              || v67 == 0x7FFFFFFFFFFFFFFFLL
              || (v68 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v29, 0), !objc_msgSend(v68, "length")))
            {
              if (v17)
              {
                if (*(_QWORD *)(v17 + 80))
                {
                  v30 = v17;
                  v31 = v29;
LABEL_160:
                  -[_PBProperty setNumberValue:onInstance:](v30, v31, (uint64_t)v2);
                  continue;
                }
                v84 = 0;
                v85 = *(char *)(v17 + 32);
                v86 = *(_BYTE *)(v17 + 32);
                if (v85 <= 98)
                {
                  if (v85 > 80)
                  {
                    if (v85 == 81)
                    {
                      v84 = -1;
                    }
                    else if (v85 == 83)
                    {
                      v84 = 0xFFFFLL;
                    }
                  }
                  else if (v85 == 66)
                  {
                    v84 = 1;
                  }
                  else if (v85 == 73)
                  {
                    v84 = 0xFFFFFFFFLL;
                  }
                }
                else
                {
                  switch(*(_BYTE *)(v17 + 32))
                  {
                    case 'c':
                      v84 = 127;
                      break;
                    case 'd':
                    case 'f':
                      v84 = 0;
                      break;
                    case 'e':
                    case 'g':
                    case 'h':
                      break;
                    case 'i':
                      v84 = 0x7FFFFFFFLL;
                      break;
                    default:
                      if (v85 == 115)
                      {
                        v84 = 0x7FFFLL;
                      }
                      else if (v85 == 113)
                      {
                        v84 = 0x7FFFFFFFFFFFFFFFLL;
                      }
                      break;
                  }
                }
              }
              else
              {
                v84 = 0;
                v86 = 0;
              }
              v99 = -[PBTextReader _parseNumber:maxValue:isSigned:](v29, v84, ((v86 - 67) > 0x30) | ((0x1FFFFFFFEBFBEuLL >> (v86 - 67)) & 1));
              if (!v99)
                continue;
              v31 = v99;
              v30 = v17;
              goto LABEL_160;
            }
            v126[0] = v68;
            if (v17)
              goto LABEL_43;
            continue;
          default:
            continue;
        }
      }
      if (!objc_msgSend(v15, "length"))
        goto LABEL_52;
      v16 = -[NSString camelCase](v15);
      v17 = objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      if (v17)
        goto LABEL_26;
      v18 = objc_msgSend(v16, "hasSuffix:", CFSTR("s"))
          ? objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "length") - 1)
          : objc_msgSend(v16, "stringByAppendingString:", CFSTR("s"));
      v17 = objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      if (v17)
        goto LABEL_26;
      v15 = v115;
LABEL_52:
      v32 = v3;
      v33 = *(_QWORD *)(v3 + 32);
      v34 = *(_QWORD *)(v3 + 40);
      v35 = *(void **)(v32 + 48);
      v36 = 20;
      if (v33 > 20)
        v36 = v33;
      if ((unint64_t)(v34 - v33) >= 0x28)
        v37 = 40;
      else
        v37 = v34 - v33;
      v38 = objc_msgSend(v35, "substringWithRange:", v36 - 20, v37);
      v39 = -[NSString camelCase](v15);
      NSLog(CFSTR("%@ (at %i/%i \"%@\") tag: %@ / %@ for property: %@"), CFSTR("read unrecoginzed tag"), v33, v34, v38, v15, v39, 0);
      v40 = a1;
      switch(v114)
      {
        case 1:
          v41 = -[PBTextReader _readObject:](a1, 0);
          goto LABEL_62;
        case 2:
          return v2;
        case 3:
          v41 = (uint64_t)-[PBTextReader _readString](a1);
          goto LABEL_62;
        case 4:
          v41 = -[PBTextReader _readValue](a1);
          goto LABEL_62;
        default:
          v41 = 0;
          v40 = a1;
LABEL_62:
          v42 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("     value: %@"), v41);
          v43 = *(_QWORD *)(v40 + 32);
          v44 = *(_QWORD *)(a1 + 40);
          v45 = 20;
          if (v43 > 20)
            v45 = *(_QWORD *)(v40 + 32);
          if ((unint64_t)(v44 - v43) >= 0x28)
            v46 = 40;
          else
            v46 = v44 - v43;
          v47 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v45 - 20, v46);
          v109 = -[NSString camelCase](v15);
          v103 = v44;
          v3 = a1;
          NSLog(CFSTR("%@ (at %i/%i \"%@\") tag: %@ / %@ for property: %@"), v42, v43, v103, v47, v15, v109, 0);
          break;
      }
    }
  }
  v4 = NSStringFromClass(a2);
  v5 = (id)objc_msgSend(*(id *)(v3 + 56), "objectForKeyedSubscript:", v4);
  if (v5)
  {
LABEL_17:
    v2 = (objc_class *)objc_alloc_init(v2);
    goto LABEL_19;
  }
  v6 = +[_PBProperty getValidPropertiesForType:withCache:]((uint64_t)_PBProperty, v2, *(void **)(v3 + 64));
  if (v6)
  {
    v7 = v6;
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v116, v125, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v117;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v117 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v11);
          if (v12)
            v13 = *(_QWORD *)(v12 + 8);
          else
            v13 = 0;
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);
          ++v11;
        }
        while (v9 != v11);
        v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v116, v125, 16);
        v9 = v14;
      }
      while (v14);
    }
    v3 = a1;
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v5, v4);
    goto LABEL_17;
  }
  return 0;
}

- (uint64_t)_readTag:(uint64_t *)a3 andType:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = -[PBTextReader _rangeOfCharactersInSetAtCurrentPosition:](a1, *(void **)(a1 + 8));
  if (v6 == *(_QWORD *)(a1 + 32))
    *(_QWORD *)(a1 + 32) = v6 + v7;
  result = -[PBTextReader _rangeOfCharactersInSetAtCurrentPosition:](a1, *(void **)(a1 + 16));
  v10 = result;
  if (result == *(_QWORD *)(a1 + 32) && v9 != 0)
  {
    *(_QWORD *)(a1 + 32) = result + v9;
    result = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", result, v9 - (objc_msgSend(*(id *)(a1 + 48), "characterAtIndex:", result + v9 - 1) == 58));
    *a2 = result;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    result = -[PBTextReader _rangeOfCharactersInSetAtCurrentPosition:](a1, *(void **)(a1 + 8));
    if (result == 0x7FFFFFFFFFFFFFFFLL || result == *(_QWORD *)(a1 + 32))
    {
      if (v12)
        *(_QWORD *)(a1 + 32) = result + v12;
    }
  }
  if (*(_QWORD *)(a1 + 32) >= *(_QWORD *)(a1 + 40))
  {
    v14 = 5;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 48), "characterAtIndex:");
    switch((_DWORD)result)
    {
      case '"':
        v14 = 3;
        break;
      case '}':
        v13 = 2;
        goto LABEL_21;
      case '{':
        v13 = 1;
LABEL_21:
        *a3 = v13;
        ++*(_QWORD *)(a1 + 32);
        return result;
      default:
        v14 = 4;
        break;
    }
  }
  *a3 = v14;
  return result;
}

- (id)_readString
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  if (objc_msgSend(*(id *)(a1 + 48), "characterAtIndex:", *(_QWORD *)(a1 + 32)) != 34)
    return 0;
  v2 = *(_QWORD *)(a1 + 32) + 1;
  *(_QWORD *)(a1 + 32) = v2;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  while (1)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v2 >= v4)
      break;
    v5 = objc_msgSend(*(id *)(a1 + 48), "characterAtIndex:", v2);
    if (v5 == 92)
    {
      if (v2 + 3 >= *(_QWORD *)(a1 + 40))
      {
        v6 = v2 + 1;
      }
      else
      {
        v6 = v2 + 1;
        if (objc_msgSend(*(id *)(a1 + 48), "characterAtIndex:", v2 + 1) - 48 <= 9)
          objc_msgSend(v3, "addIndexesInRange:", v2 - *(_QWORD *)(a1 + 32), 4);
      }
    }
    else
    {
      if (v5 == 34)
      {
        ++v2;
        v4 = *(_QWORD *)(a1 + 40);
        break;
      }
      v6 = v2;
    }
    v2 = v6 + 1;
  }
  if (v2 >= v4)
    return 0;
  *(_QWORD *)(a1 + 32) = v2 + 1;
  v7 = (void *)objc_msgSend(*(id *)(a1 + 48), "substringWithRange:");
  if (objc_msgSend(v3, "count"))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27__PBTextReader__readString__block_invoke;
    v10[3] = &unk_1E4FACB20;
    v10[4] = v8;
    objc_msgSend(v3, "enumerateRangesWithOptions:usingBlock:", 2, v10);
    return (id)objc_msgSend(v8, "copy");
  }
  return v7;
}

- (uint64_t)_readValue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = -[PBTextReader _rangeOfCharactersInSetAtCurrentPosition:](a1, (void *)objc_msgSend(*(id *)(a1 + 8), "invertedSet"));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40) - v4;
  }
  else
  {
    v4 = v2;
  }
  *(_QWORD *)(a1 + 32) = v4 + v3;
  return objc_msgSend(*(id *)(a1 + 48), "substringWithRange:");
}

- (void)_parseNumber:(void *)a1 maxValue:(unint64_t)a2 isSigned:(int)a3
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  double v13;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a1);
  if (objc_msgSend(a1, "characterAtIndex:", 0) == 48)
  {
    if (objc_msgSend(a1, "length") == 1)
      return &unk_1E4FB0060;
    v8 = objc_msgSend(a1, "characterAtIndex:", 1);
    if (v8 != 46)
    {
      if (v8 == 120 || v8 == 88)
      {
        v13 = 0.0;
        v7 = 0;
        if (!objc_msgSend(v6, "scanHexLongLong:", &v13))
          goto LABEL_11;
        v9 = (void *)MEMORY[0x1E0CB37E8];
        v10 = *(_QWORD *)&v13;
      }
      else
      {
        v10 = strtoull((const char *)objc_msgSend(a1, "UTF8String"), 0, 8);
        v9 = (void *)MEMORY[0x1E0CB37E8];
      }
      v7 = (void *)objc_msgSend(v9, "numberWithUnsignedLongLong:", v10);
LABEL_11:
      if (v7)
        goto LABEL_25;
    }
  }
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("true")) & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C9AAB0];
  }
  else
  {
    if ((objc_msgSend(a1, "isEqualToString:", CFSTR("false")) & 1) == 0)
    {
      if (objc_msgSend(a1, "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a3)
        {
          v13 = 0.0;
          v7 = 0;
          if (!objc_msgSend(v6, "scanLongLong:", &v13))
            goto LABEL_25;
          v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)&v13);
        }
        else
        {
          v13 = 0.0;
          v7 = 0;
          if (!objc_msgSend(v6, "scanUnsignedLongLong:", &v13))
            goto LABEL_25;
          v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&v13);
        }
      }
      else
      {
        v13 = 0.0;
        v7 = 0;
        if (!objc_msgSend(v6, "scanDouble:", &v13))
          goto LABEL_25;
        v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
      }
      v7 = (void *)v11;
      goto LABEL_25;
    }
    v7 = (void *)MEMORY[0x1E0C9AAA0];
  }
LABEL_25:
  if (a2 && objc_msgSend(v7, "unsignedLongLongValue") > a2)
    return 0;
  return v7;
}

- (uint64_t)_rangeOfCharactersInSetAtCurrentPosition:(uint64_t)a1
{
  uint64_t v4;

  v4 = objc_msgSend(*(id *)(a1 + 48), "rangeOfCharacterFromSet:options:range:", a2, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) - *(_QWORD *)(a1 + 32));
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(*(id *)(a1 + 48), "rangeOfCharacterFromSet:options:range:", objc_msgSend(a2, "invertedSet"), 0, v4, *(_QWORD *)(a1 + 40) - v4);
  return v4;
}

uint64_t __27__PBTextReader__readString__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  char v11;

  v6 = a3 >> 2;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", a3 >> 2);
  if (a3 >= 4)
  {
    v8 = a2 + 1;
    if (v6 <= 1)
      v6 = 1;
    do
    {
      v9 = (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v8, 3), "UTF8String");
      v11 = 0;
      v11 = strtol(v9, 0, 8);
      objc_msgSend(v7, "appendBytes:length:", &v11, 1);
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  return objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a2, a3, (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4));
}

@end
