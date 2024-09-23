@implementation PBTextWriter

- (PBTextWriter)init
{
  PBTextWriter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBTextWriter;
  v2 = -[PBTextWriter init](&v4, sel_init);
  if (v2)
  {
    v2->_dest = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v2->_newlinesPrinted = 1;
    v2->_cachedObjectTypes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBTextWriter;
  -[PBTextWriter dealloc](&v3, sel_dealloc);
}

- (id)string
{
  return (id)-[NSMutableString copy](self->_dest, "copy");
}

- (void)reset
{

  self->_dest = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  self->_newlinesPrinted = 1;
}

- (BOOL)write:(id)a3
{
  if (!a3)
    return 0;
  if (self)
  {
    if (!self->_newlinesPrinted)
    {
      -[NSMutableString appendString:](self->_dest, "appendString:", CFSTR("\n"));
      self->_newlinesPrinted = 1;
    }
  }
  return -[PBTextWriter _write:]((uint64_t)self, (uint64_t)a3);
}

- (uint64_t)_write:(uint64_t)a1
{
  BOOL v2;
  int v3;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  char *v18;
  void *v19;
  int v20;
  double v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  double v35;
  uint64_t v36;
  double v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t ii;
  uint64_t v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t n;
  uint64_t k;
  void *v52;
  double v53;
  uint64_t i4;
  uint64_t m;
  uint64_t j;
  uint64_t jj;
  double v58;
  uint64_t kk;
  uint64_t mm;
  uint64_t nn;
  uint64_t i1;
  uint64_t i2;
  uint64_t i3;
  uint64_t v66;
  uint64_t v67;
  unsigned int v68;
  id obj;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  double v74;
  double v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (a1)
    v2 = a2 == 0;
  else
    v2 = 1;
  v3 = !v2;
  v68 = v3;
  if (!v2)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = +[_PBProperty getValidPropertiesForType:withCache:]((uint64_t)_PBProperty, v6, *(void **)(a1 + 32));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    if (v8)
    {
      v13 = v8;
      v14 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v71 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
          if (v16)
          {
            v17 = *(void **)(v16 + 56);
            if (v17)
            {
              v18 = (char *)objc_msgSend((id)objc_msgSend(*(id *)(v16 + 56), "methodSignature"), "methodReturnType");
              v19 = 0;
              v20 = *v18;
              if (v20 <= 80)
              {
                if (v20 > 72)
                {
                  if (v20 == 73)
                  {
                    LODWORD(v75) = 0;
                    objc_msgSend(v17, "invokeWithTarget:", a2);
                    objc_msgSend(v17, "getReturnValue:", &v75);
                    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v75));
                  }
                  else if (v20 == 76)
                  {
                    v75 = 0.0;
                    objc_msgSend(v17, "invokeWithTarget:", a2);
                    objc_msgSend(v17, "getReturnValue:", &v75);
                    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)&v75);
                  }
                }
                else if (v20 == 66)
                {
                  LOBYTE(v75) = 0;
                  objc_msgSend(v17, "invokeWithTarget:", a2);
                  objc_msgSend(v17, "getReturnValue:", &v75);
                  v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", LOBYTE(v75));
                }
                else if (v20 == 67)
                {
                  LOBYTE(v75) = 0;
                  objc_msgSend(v17, "invokeWithTarget:", a2);
                  objc_msgSend(v17, "getReturnValue:", &v75);
                  v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", LOBYTE(v75));
                }
              }
              else
              {
                switch(v20)
                {
                  case 'c':
                    LOBYTE(v75) = 0;
                    objc_msgSend(v17, "invokeWithTarget:", a2);
                    objc_msgSend(v17, "getReturnValue:", &v75);
                    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", SLOBYTE(v75));
                    break;
                  case 'd':
                    v75 = 0.0;
                    objc_msgSend(v17, "invokeWithTarget:", a2);
                    objc_msgSend(v17, "getReturnValue:", &v75);
                    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v75);
                    break;
                  case 'e':
                  case 'g':
                  case 'h':
                  case 'j':
                  case 'k':
                  case 'm':
                  case 'n':
                  case 'o':
                  case 'p':
                  case 'r':
                    break;
                  case 'f':
                    LODWORD(v75) = 0;
                    objc_msgSend(v17, "invokeWithTarget:", a2);
                    objc_msgSend(v17, "getReturnValue:", &v75);
                    LODWORD(v21) = LODWORD(v75);
                    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
                    break;
                  case 'i':
                    LODWORD(v75) = 0;
                    objc_msgSend(v17, "invokeWithTarget:", a2);
                    objc_msgSend(v17, "getReturnValue:", &v75);
                    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(v75));
                    break;
                  case 'l':
                    v75 = 0.0;
                    objc_msgSend(v17, "invokeWithTarget:", a2);
                    objc_msgSend(v17, "getReturnValue:", &v75);
                    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)&v75);
                    break;
                  case 'q':
                    v75 = 0.0;
                    objc_msgSend(v17, "invokeWithTarget:", a2);
                    objc_msgSend(v17, "getReturnValue:", &v75);
                    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)&v75);
                    break;
                  case 's':
                    LOWORD(v75) = 0;
                    objc_msgSend(v17, "invokeWithTarget:", a2);
                    objc_msgSend(v17, "getReturnValue:", &v75);
                    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", SLOWORD(v75));
                    break;
                  default:
                    if (v20 == 81)
                    {
                      v75 = 0.0;
                      objc_msgSend(v17, "invokeWithTarget:", a2);
                      objc_msgSend(v17, "getReturnValue:", &v75);
                      v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&v75);
                    }
                    else if (v20 == 83)
                    {
                      LOWORD(v75) = 0;
                      objc_msgSend(v17, "invokeWithTarget:", a2);
                      objc_msgSend(v17, "getReturnValue:", &v75);
                      v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", LOWORD(v75));
                    }
                    break;
                }
              }
              if (objc_msgSend(v19, "BOOLValue"))
              {
LABEL_41:
                v22 = *(unsigned __int8 *)(v16 + 32);
                if (v22 == 64)
                {
                  if ((objc_msgSend(*(id *)(v16 + 16), "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
                  {
                    -[PBTextWriter _printLine:format:](a1, 0, (uint64_t)CFSTR("%@: {"), v23, v9, v10, v11, v12, *(_QWORD *)(v16 + 8));
                    ++*(_QWORD *)(a1 + 16);
                    v75 = 0.0;
                    objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                    objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                    -[PBTextWriter _write:](a1, *(_QWORD *)&v75);
                    --*(_QWORD *)(a1 + 16);
                    -[PBTextWriter _printLine:format:](a1, 0, (uint64_t)CFSTR("}"), v24, v25, v26, v27, v28, v67);
                    continue;
                  }
                  v22 = *(unsigned __int8 *)(v16 + 32);
                }
                if (v22 != 123)
                {
                  if (v22 == 94)
                  {
                    if (*(_BYTE *)(v16 + 33) == 123)
                      goto LABEL_48;
                    v41 = -[_PBProperty getCountOfRepeatedValuesFromInstance:](v16, a2);
                    if (v41)
                    {
                      v42 = v41;
                      v37 = 0.0;
                      v43 = *(char *)(v16 + 33);
                      if (v43 <= 80)
                      {
                        if (v43 > 72)
                        {
                          if (v43 == 73)
                          {
                            v75 = 0.0;
                            objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                            objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                            v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                            for (j = 0; j != v42; ++j)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)&v75 + 4 * j)));
                          }
                          else if (v43 == 76)
                          {
                            v75 = 0.0;
                            objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                            objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                            v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                            for (k = 0; k != v42; ++k)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(*(_QWORD *)&v75 + 8 * k)));
                          }
                        }
                        else if (v43 == 66)
                        {
                          v75 = 0.0;
                          objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                          objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                          v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                          for (m = 0; m != v42; ++m)
                            objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)&v75 + m)));
                        }
                        else if (v43 == 67)
                        {
                          v75 = 0.0;
                          objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                          objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                          v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                          for (n = 0; n != v42; ++n)
                            objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(*(_QWORD *)&v75 + n)));
                        }
                      }
                      else
                      {
                        switch(*(_BYTE *)(v16 + 33))
                        {
                          case 'c':
                            v75 = 0.0;
                            objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                            objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                            v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                            for (ii = 0; ii != v42; ++ii)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", *(char *)(*(_QWORD *)&v75 + ii)));
                            break;
                          case 'd':
                            v75 = 0.0;
                            objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                            objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                            v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                            for (jj = 0; jj != v42; ++jj)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)&v75 + 8 * jj)));
                            break;
                          case 'e':
                          case 'g':
                          case 'h':
                          case 'j':
                          case 'k':
                          case 'm':
                          case 'n':
                          case 'o':
                          case 'p':
                          case 'r':
                            break;
                          case 'f':
                            v75 = 0.0;
                            objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                            objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                            v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                            for (kk = 0; kk != v42; ++kk)
                            {
                              LODWORD(v58) = *(_DWORD *)(*(_QWORD *)&v75 + 4 * kk);
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58));
                            }
                            break;
                          case 'i':
                            v75 = 0.0;
                            objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                            objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                            v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                            for (mm = 0; mm != v42; ++mm)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)&v75 + 4 * mm)));
                            break;
                          case 'l':
                            v75 = 0.0;
                            objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                            objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                            v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                            for (nn = 0; nn != v42; ++nn)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)(*(_QWORD *)&v75 + 8 * nn)));
                            break;
                          case 'q':
                            v75 = 0.0;
                            objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                            objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                            v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                            for (i1 = 0; i1 != v42; ++i1)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)&v75 + 8 * i1)));
                            break;
                          case 's':
                            v75 = 0.0;
                            objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                            objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                            v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                            for (i2 = 0; i2 != v42; ++i2)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)(*(_QWORD *)&v75 + 2 * i2)));
                            break;
                          default:
                            if (v43 == 81)
                            {
                              v75 = 0.0;
                              objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                              objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                              v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                              for (i3 = 0; i3 != v42; ++i3)
                                objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)&v75 + 8 * i3)));
                            }
                            else if (v43 == 83)
                            {
                              v75 = 0.0;
                              objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                              objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                              v37 = COERCE_DOUBLE((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v42));
                              for (i4 = 0; i4 != v42; ++i4)
                                objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(*(_QWORD *)&v75 + 2 * i4)));
                            }
                            break;
                        }
                      }
LABEL_156:
                      v45 = a1;
                      v46 = v37;
                      v47 = v16;
                      v48 = 0;
LABEL_157:
                      -[PBTextWriter _writeResult:forProperty:bracePrefix:](v45, *(void **)&v46, v47, v48, v9, v10, v11, v12, v66);
                      continue;
                    }
LABEL_85:
                    v37 = 0.0;
                    goto LABEL_156;
                  }
                  v36 = ((char)v22 - 64);
                  if (v36 > 0x33)
                    continue;
                  if (((1 << (v22 - 64)) & 0xA1258000A120CLL) != 0)
                  {
                    v37 = 0.0;
                    if ((char)v22 > 80)
                    {
                      switch((char)v22)
                      {
                        case 'c':
                          LOBYTE(v74) = 0;
                          objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                          objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v74);
                          v38 = *(void **)(v16 + 72);
                          if (v38)
                            goto LABEL_117;
                          *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", SLOBYTE(v74)));
                          goto LABEL_155;
                        case 'd':
                          v75 = 0.0;
                          objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                          objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                          v49 = *(void **)(v16 + 72);
                          if (v49)
                            goto LABEL_120;
                          *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v75));
                          goto LABEL_155;
                        case 'e':
                        case 'g':
                        case 'h':
                        case 'j':
                        case 'k':
                        case 'm':
                        case 'n':
                        case 'o':
                        case 'p':
                        case 'r':
                          goto LABEL_156;
                        case 'f':
                          LODWORD(v74) = 0;
                          objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                          objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v74);
                          v38 = *(void **)(v16 + 72);
                          if (v38)
                            goto LABEL_117;
                          LODWORD(v53) = LODWORD(v74);
                          *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53));
                          goto LABEL_155;
                        case 'i':
                          LODWORD(v74) = 0;
                          objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                          objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v74);
                          v38 = *(void **)(v16 + 72);
                          if (v38)
                            goto LABEL_117;
                          *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(v74)));
                          goto LABEL_155;
                        case 'l':
                          v75 = 0.0;
                          objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                          objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                          v49 = *(void **)(v16 + 72);
                          if (v49)
                            goto LABEL_120;
                          *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)&v75));
                          goto LABEL_155;
                        case 'q':
                          v75 = 0.0;
                          objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                          objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                          v49 = *(void **)(v16 + 72);
                          if (v49)
                            goto LABEL_120;
                          *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)&v75));
                          goto LABEL_155;
                        case 's':
                          LOWORD(v74) = 0;
                          objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                          objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v74);
                          v38 = *(void **)(v16 + 72);
                          if (v38)
                            goto LABEL_117;
                          *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", SLOWORD(v74)));
                          goto LABEL_155;
                        default:
                          if ((char)v22 != 81)
                          {
                            if ((char)v22 != 83)
                              goto LABEL_156;
                            LOWORD(v74) = 0;
                            objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                            objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v74);
                            v38 = *(void **)(v16 + 72);
                            if (!v38)
                            {
                              *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", LOWORD(v74)));
                              goto LABEL_155;
                            }
                            goto LABEL_117;
                          }
                          v75 = 0.0;
                          objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                          objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                          v49 = *(void **)(v16 + 72);
                          if (v49)
                            goto LABEL_120;
                          *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&v75));
                          break;
                      }
                      goto LABEL_155;
                    }
                    if ((char)v22 > 72)
                    {
                      if ((char)v22 != 73)
                      {
                        if ((char)v22 != 76)
                          goto LABEL_156;
                        v75 = 0.0;
                        objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                        objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                        v49 = *(void **)(v16 + 72);
                        if (v49)
                        {
LABEL_120:
                          objc_msgSend(v49, "setArgument:atIndex:", &v75, 2);
                          objc_msgSend(*(id *)(v16 + 72), "invokeWithTarget:", a2);
                          v74 = 0.0;
                          objc_msgSend(*(id *)(v16 + 72), "getReturnValue:", &v74);
                          v37 = v74;
                          goto LABEL_156;
                        }
                        *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)&v75));
                        goto LABEL_155;
                      }
                      LODWORD(v74) = 0;
                      objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                      objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v74);
                      v38 = *(void **)(v16 + 72);
                      if (!v38)
                      {
                        *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v74)));
                        goto LABEL_155;
                      }
                    }
                    else if ((char)v22 == 66)
                    {
                      LOBYTE(v74) = 0;
                      objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                      objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v74);
                      v38 = *(void **)(v16 + 72);
                      if (!v38)
                      {
                        *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", LOBYTE(v74)));
                        goto LABEL_155;
                      }
                    }
                    else
                    {
                      if ((char)v22 != 67)
                        goto LABEL_156;
                      LOBYTE(v74) = 0;
                      objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                      objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v74);
                      v38 = *(void **)(v16 + 72);
                      if (!v38)
                      {
                        *(double *)&v39 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", LOBYTE(v74)));
LABEL_155:
                        v37 = *(double *)&v39;
                        goto LABEL_156;
                      }
                    }
LABEL_117:
                    objc_msgSend(v38, "setArgument:atIndex:", &v74, 2);
                    objc_msgSend(*(id *)(v16 + 72), "invokeWithTarget:", a2);
                    v75 = 0.0;
                    v52 = *(void **)(v16 + 72);
                  }
                  else
                  {
                    if ((char)v22 != 64)
                    {
                      if (v36 != 30)
                        continue;
                      goto LABEL_85;
                    }
                    v75 = 0.0;
                    objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                    v52 = *(void **)(v16 + 48);
                  }
                  objc_msgSend(v52, "getReturnValue:", &v75);
                  v37 = v75;
                  goto LABEL_156;
                }
LABEL_48:
                v29 = objc_msgSend(*(id *)(v16 + 8), "hasSuffix:", CFSTR("s"));
                v30 = *(void **)(v16 + 8);
                if (v29)
                  v30 = (void *)objc_msgSend(v30, "substringToIndex:", objc_msgSend(*(id *)(v16 + 8), "length") - 1);
                if (!*(_QWORD *)(v16 + 88))
                {
                  v66 = *(_QWORD *)(v16 + 104);
                  v31 = dlsym((void *)0xFFFFFFFFFFFFFFFELL, (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@DictionaryRepresentation")), "UTF8String"));
                  *(_QWORD *)(v16 + 88) = v31;
                  if (!v31)
                    goto LABEL_72;
                }
                if (*(_BYTE *)(v16 + 32) != 94)
                {
                  v40 = *(id *)(v16 + 120);
                  if (v40)
                    v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v40);
                  objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                  objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", objc_msgSend(v40, "mutableBytes"));
                  v34 = (id)(*(uint64_t (**)(uint64_t))(v16 + 88))(objc_msgSend(v40, "bytes"));
                  goto LABEL_73;
                }
                v32 = -[_PBProperty getCountOfRepeatedValuesFromInstance:](v16, a2);
                if (v32)
                {
                  v33 = v32;
                  v75 = 0.0;
                  objc_msgSend(*(id *)(v16 + 48), "invokeWithTarget:", a2);
                  objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", &v75);
                  v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v33);
                  v35 = v75;
                  do
                  {
                    objc_msgSend(v34, "addObject:", (*(uint64_t (**)(double))(v16 + 88))(COERCE_DOUBLE(*(_QWORD *)&v35)));
                    *(_QWORD *)&v35 = *(_QWORD *)&v75 + *(_QWORD *)(v16 + 120);
                    v75 = v35;
                    --v33;
                  }
                  while (v33);
                }
                else
                {
LABEL_72:
                  v34 = 0;
                }
LABEL_73:
                v45 = a1;
                v46 = *(double *)&v34;
                v47 = v16;
                v48 = (uint64_t)v30;
                goto LABEL_157;
              }
            }
            else if (!*(_QWORD *)(v16 + 64)
                   || -[_PBProperty getCountOfRepeatedValuesFromInstance:](*(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i), a2))
            {
              goto LABEL_41;
            }
          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      }
      while (v13);
    }
  }
  return v68;
}

- (uint64_t)_printLine:(uint64_t)a3 format:(uint64_t)a4
{
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = result;
    *(_BYTE *)(result + 8) = 0;
    v22 = &a9;
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a3, &a9);
    v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (*(uint64_t *)(v9 + 16) >= 1)
    {
      v12 = 0;
      do
      {
        objc_msgSend(v11, "appendString:", CFSTR("    "));
        ++v12;
      }
      while (*(_QWORD *)(v9 + 16) > v12);
    }
    v13 = (void *)objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    result = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (result)
    {
      v14 = result;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16);
          objc_msgSend(*(id *)(v9 + 24), "appendString:", v11);
          objc_msgSend(*(id *)(v9 + 24), "appendString:", v17);
          objc_msgSend(*(id *)(v9 + 24), "appendString:", CFSTR("\n"));
          ++v16;
        }
        while (v14 != v16);
        result = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        v14 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_writeResult:(uint64_t)a3 forProperty:(uint64_t)a4 bracePrefix:(uint64_t)a5
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char isKindOfClass;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return result;
  v12 = result;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3)
    {
      v18 = *(_QWORD *)(a3 + 8);
      if (*(_BYTE *)(a3 + 32) == 64)
        return -[PBTextWriter _printLine:format:](v12, 0, (uint64_t)CFSTR("%@: \"%@\"), v13, v14, v15, v16, v17, *(_QWORD *)(a3 + 8));
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!a4)
      {
        v35 = MEMORY[0x1E0C809B0];
        v36 = 3221225472;
        v37 = __53__PBTextWriter__writeResult_forProperty_bracePrefix___block_invoke;
        v38 = &unk_1E4FACAF8;
        v39 = v12;
        return objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", &v35);
      }
      -[PBTextWriter _printLine:format:](v12, 0, (uint64_t)CFSTR("%@ {"), v22, v23, v24, v25, v26, a4);
      v27 = MEMORY[0x1E0C809B0];
      ++*(_QWORD *)(v12 + 16);
      v35 = v27;
      v36 = 3221225472;
      v37 = __53__PBTextWriter__writeResult_forProperty_bracePrefix___block_invoke;
      v38 = &unk_1E4FACAF8;
      v39 = v12;
      objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", &v35);
LABEL_25:
      --*(_QWORD *)(v12 + 16);
      return -[PBTextWriter _printLine:format:](v12, 0, (uint64_t)CFSTR("}"), v28, v29, v30, v31, v32, a9);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a3)
        a3 = *(_QWORD *)(a3 + 8);
      v34 = a3;
      objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
      return -[PBTextWriter _printLine:format:](v12, 0, (uint64_t)CFSTR("%@: %@"), v13, v14, v15, v16, v17, v34);
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (a3)
    {
      v18 = *(_QWORD *)(a3 + 8);
      if ((isKindOfClass & 1) != 0)
      {
LABEL_24:
        -[PBTextWriter _printLine:format:](v12, 0, (uint64_t)CFSTR("%@: {"), v13, v14, v15, v16, v17, v18);
        ++*(_QWORD *)(v12 + 16);
        -[PBTextWriter _write:](v12, a2);
        goto LABEL_25;
      }
    }
    else
    {
      v18 = 0;
      if ((isKindOfClass & 1) != 0)
        goto LABEL_24;
    }
LABEL_28:
    v34 = v18;
    return -[PBTextWriter _printLine:format:](v12, 0, (uint64_t)CFSTR("%@: %@"), v13, v14, v15, v16, v17, v34);
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (result)
  {
    v19 = result;
    v20 = *(_QWORD *)v41;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(a2);
        -[PBTextWriter _writeResult:forProperty:bracePrefix:](v12, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v21++), a3, a4);
      }
      while (v19 != v21);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      v19 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __53__PBTextWriter__writeResult_forProperty_bracePrefix___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = CFSTR("%@: \"%@\");
  else
    v9 = CFSTR("%@: %@");
  return -[PBTextWriter _printLine:format:](*(_QWORD *)(a1 + 32), 0, (uint64_t)v9, v4, v5, v6, v7, v8, a2);
}

@end
