@implementation PDControllerType5

+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithAddress:userClient:", v4, v6);

  return v7;
}

+ (id)createForDecode
{
  return 0;
}

- (PDControllerType5)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDControllerType5;
  return -[PDControllerType4 initWithAddress:userClient:](&v5, "initWithAddress:userClient:", a3, a4);
}

- (id)registerFormatter8ByteVersionWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", a3, a4));
  objc_msgSend(v7, "addObjectsFromArray:", v8);
  if (a4 == 8)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llX.%llX.%llX.%lld.%02lld"), *(_QWORD *)a3 >> 20, (*(_QWORD *)a3 >> 8) & 0xFFFLL, *(_QWORD *)a3, BYTE4(*(_QWORD *)a3), ((unsigned __int16)WORD2(*(_QWORD *)a3) >> 8));
  }
  else if (a4 == 4)
  {
    objc_msgSend(v7, "addObject:", CFSTR("Warning: Unexpected 4-byte version register"));
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%X.%X.%X (Unknown Customer Version)"), *(_DWORD *)a3 >> 20, (*(_DWORD *)a3 >> 8) & 0xFFF, *(_DWORD *)a3, v14, v15);
  }
  else
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: Unexpected length %lld"), a4, v12, v13, v14, v15);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v7, "addObject:", v10);

  return v7;
}

- (int)printTBRrIfIntelRetimerPresent
{
  int result;
  __int16 v5;
  char v6;
  unint64_t v7;
  _BYTE v8[5];
  char v9;

  v7 = 0;
  result = -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v8, 64, 42, &v7);
  if (!result)
  {
    result = -536870160;
    if (v7 >= 8)
    {
      if ((v9 & 0xF) != 0 && (v9 & 0xF) != 14)
      {
        v6 = 4;
        v5 = 48;
        return -[PDController printCommand:withWriteData:withWriteLength:](self, "printCommand:withWriteData:withWriteLength:", 1413632626, &v5, 3);
      }
    }
    else
    {
      return -536870212;
    }
  }
  return result;
}

- (int)printAllDPMrSubcommands
{
  char *v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int16 v17;
  void *v18;
  void *v19;
  id obj;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];

  v27 = 0;
  v3 = (char *)malloc_type_malloc(0x40uLL, 0x9AE08903uLL);
  if (v3)
  {
    v4 = v3;
    -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v3, 64, 42, &v27);
    v22 = *(unsigned __int16 *)(v4 + 5);
    free(v4);
  }
  else
  {
    v22 = 0;
  }
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("mask")));
        v13 = objc_msgSend(v12, "unsignedIntegerValue");

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v9));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("match")));
        v17 = (unsigned __int16)objc_msgSend(v16, "unsignedIntegerValue");

        if ((v22 & v13) == v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v9));
          -[PDControllerType4 printDPMrSubCommand:withDeviceConfig:](self, "printDPMrSubCommand:withDeviceConfig:", v9, v19);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  return 0;
}

- (id)registerFormatterGenericWithBuffer:(void *)a3 andLength:(unint64_t)a4 andConfig:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  unsigned int v29;
  void *v30;
  unint64_t v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  void *v38;
  unsigned int v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  unsigned int v45;
  void *v46;
  NSString *v47;
  void *v48;
  void *v49;
  uint64_t (**v50)(_QWORD, _QWORD);
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  __CFString *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  float v61;
  void *v62;
  float v63;
  float v64;
  void *v65;
  id v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  PDControllerType5 *v72;
  void *v73;
  char *v74;
  unint64_t v75;
  id obj;
  uint64_t v77;
  unint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v72 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", a3, a4));
  objc_msgSend(v9, "addObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("length")));
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  if ((unint64_t)v12 <= a4)
  {
    v75 = a4;
    if ((unint64_t)v12 < a4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld > %lu, register may not be decoded correctly"), a4, v12));
      objc_msgSend(v9, "addObject:", v14);

    }
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v71 = v8;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fields")));
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
    if (!v15)
    {
LABEL_66:

      v8 = v71;
      goto LABEL_67;
    }
    v16 = v15;
    v77 = *(_QWORD *)v80;
    v17 = CFSTR("%02X");
    v73 = v9;
    v74 = (char *)a3;
LABEL_7:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v80 != v77)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v18);
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("bit_length")));
      if (v20)
      {
        v21 = (void *)v20;
        v22 = v17;
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("byte_offset")));
        if (v23)
        {
          v24 = (void *)v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("name")));

          v17 = v22;
          if (v25)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("bit_length")));
            v27 = objc_msgSend(v26, "unsignedCharValue");

            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("byte_offset")));
            v29 = objc_msgSend(v28, "unsignedCharValue");

            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("name")));
            if (v29 >= v75)
            {
              v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error, byte offset too large (%x)"), v29, v68, v69, v70);
LABEL_22:
              v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
              objc_msgSend(v9, "addObject:", v33);
            }
            else
            {
              if (v27 < 0x21)
              {
                v78 = *(_QWORD *)&v74[v29];
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("bit_shift")));

                if (v34)
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("bit_shift")));
                  v36 = objc_msgSend(v35, "unsignedIntegerValue");
                  v78 >>= v36;

                }
                v78 &= ~(-1 << (char)v27);
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("show_only_when_nonzero")));

                if (!v37
                  || (v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("show_only_when_nonzero"))),
                      v39 = objc_msgSend(v38, "BOOLValue"),
                      v40 = v78,
                      v38,
                      !v39)
                  || v40)
                {
                  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("values")));

                  if (v41)
                  {
                    v42 = v78;
                    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("values")));
                    v44 = objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:value:table:](v72, "stringForTitle:value:table:", v30, v42, v43));
                  }
                  else
                  {
                    if (v27 > 4)
                    {
                      if (v27 > 8)
                      {
                        if (v27 > 0x10)
                        {
                          if (v27 > 0x18)
                            v47 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08llX"), v78);
                          else
                            v47 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%06X"), v78);
                        }
                        else
                        {
                          v47 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%04X"), (unsigned __int16)v78);
                        }
                      }
                      else
                      {
                        v47 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), v78);
                      }
                    }
                    else
                    {
                      v47 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%X"), v78);
                    }
                    v43 = (void *)objc_claimAutoreleasedReturnValue(v47);
                    v44 = objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v72, "stringForTitle:valueString:", v30, v43));
                  }
                  v48 = (void *)v44;

                  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("formatter")));
                  if (v49)
                  {
                    objc_msgSend(v73, "addObject:", v48);
                    v50 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("formatter")));
                    v51 = ((uint64_t (**)(_QWORD, unint64_t *))v50)[2](v50, &v78);
                    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
                    objc_msgSend(v73, "addObjectsFromArray:", v52);

                    goto LABEL_63;
                  }
                  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("unit")));

                  if (v53)
                  {
                    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("signed")));

                    if (v54)
                    {
                      if ((_DWORD)v27 == 16)
                      {
                        v55 = (__int16)v78;
LABEL_55:
                        v61 = (float)v55;
                      }
                      else
                      {
                        if ((_DWORD)v27 == 8)
                        {
                          v55 = (char)v78;
                          goto LABEL_55;
                        }
                        v61 = (float)(int)v78;
                      }
                    }
                    else
                    {
                      v61 = (float)v78;
                    }
                    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("unit")));
                    objc_msgSend(v62, "floatValue");
                    v64 = v63;

                    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("unit_str")));
                    if (v65)
                      v57 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("unit_str")));
                    else
                      v57 = &stru_1000186C8;

                    v60 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [%0.3f %@]"), v48, (float)(v64 * v61), v57));
LABEL_61:

                    v48 = (void *)v60;
                  }
                  else
                  {
                    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("formula")));

                    if (v56)
                    {
                      v57 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("formula")));
                      v58 = ((uint64_t (*)(__CFString *, unint64_t *))v57->data)(v57, &v78);
                      v59 = objc_claimAutoreleasedReturnValue(v58);
                      v60 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [%@]"), v48, v59));

                      v48 = (void *)v59;
                      goto LABEL_61;
                    }
                  }
                  objc_msgSend(v73, "addObject:", v48);
LABEL_63:

                }
                v17 = v22;
                v9 = v73;
                goto LABEL_19;
              }
              v31 = v29 + (((_DWORD)v27 + 7) >> 3);
              if (v31 > v75)
              {
                v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error, byte_offset + byte_length too large (error in field \"%@\", offset=%d, byte_length=%d actual_length=%d)"), v30, v29, ((_DWORD)v27 + 7) >> 3, v27);
                goto LABEL_22;
              }
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithUTF8String:](NSMutableString, "stringWithUTF8String:", "0x"));
              v45 = v31 - 1;
              if (v45 >= v29)
              {
                do
                  objc_msgSend(v33, "appendFormat:", v22, v74[(unsigned __int16)v45--]);
                while (v29 <= (unsigned __int16)v45);
              }
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v72, "stringForTitle:valueString:", v30, v33));
              objc_msgSend(v9, "addObject:", v46);

            }
            v17 = v22;
            goto LABEL_19;
          }
        }
        else
        {

        }
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error, illegal field %@"), v19));
      objc_msgSend(v9, "addObject:", v30);
LABEL_19:

      if ((id)++v18 == v16)
      {
        v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
        v16 = v66;
        if (!v66)
          goto LABEL_66;
        goto LABEL_7;
      }
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld < %lu"), a4, v12));
  objc_msgSend(v9, "addObject:", v13);

LABEL_67:
  return v9;
}

- (id)registerFormatterIntEventWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AA18));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AA18));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CAE8;
  }
  return v11;
}

- (id)registerFormatterIntMaskClearWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AA30));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AA30));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CB00;
  }
  return v11;
}

- (id)registerFormatterWakeEventMaskWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AA48));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AA48));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CB18;
  }
  return v11;
}

- (id)registerFormatterUSBConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AA60));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AA60));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CB30;
  }
  return v11;
}

- (id)registerFormatterIOConfig1WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AA78));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AA78));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CB48;
  }
  return v11;
}

- (id)registerFormatterIOConfig2WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AA90));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AA90));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CB60;
  }
  return v11;
}

- (id)registerFormatterPD3EMIntMaskWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AAA8));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AAA8));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CB78;
  }
  return v11;
}

- (id)registerFormatterPersParamsWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AAC0));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AAC0));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CB90;
  }
  return v11;
}

- (id)registerFormatterBootFlagsWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AAD8));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AAD8));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CBA8;
  }
  return v11;
}

- (id)registerFormatterCFVIDStatusWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AAF0));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AAF0));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CBC0;
  }
  return v11;
}

- (id)registerFormatterPowerSwitchStateWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  _UNKNOWN **v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", a3, a4));
  objc_msgSend(v7, "addObjectsFromArray:", v8);
  if (a4 == 44 || a4 == 20)
  {
    v16.receiver = self;
    v16.super_class = (Class)PDControllerType5;
    v9 = -[PDControllerType5 registerFormatterPowerSwitchStateWithBuffer:andLength:](&v16, "registerFormatterPowerSwitchStateWithBuffer:andLength:", a3, a4);
    v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v9);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", &off_10001AB08));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", &off_10001AB08));
      v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v14));

    }
    else
    {
      v10 = &off_10001CBD8;
    }
  }

  return v10;
}

- (id)registerFormatterADCResultsWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AB20));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AB20));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CBF0;
  }
  return v11;
}

- (id)registerFormatterMuxStateWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  if ((a4 & 0xFFFFFFFFFFFFFFFBLL) == 8)
  {
    v14.receiver = self;
    v14.super_class = (Class)PDControllerType5;
    v7 = -[PDControllerType5 registerFormatterMuxStateWithBuffer:andLength:](&v14, "registerFormatterMuxStateWithBuffer:andLength:", a3, a4);
    return (id)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AB38));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", &off_10001AB38));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v12));

      return v13;
    }
    else
    {
      return &off_10001CC08;
    }
  }
}

- (id)registerFormatterLDCMConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AB50));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AB50));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CC20;
  }
  return v11;
}

- (id)registerFormatterLDCMStatusWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AB68));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AB68));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CC38;
  }
  return v11;
}

- (id)registerFormatterFWStateConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AB80));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AB80));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CC50;
  }
  return v11;
}

- (id)registerFormatterSystemConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001AB98));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001AB98));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CC68;
  }
  return v11;
}

- (id)registerFormatterCFSOPUVDMEnumWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001ABB0));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001ABB0));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CC80;
  }
  return v11;
}

- (id)registerFormatterTXEPRSourceCapWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001ABC8));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001ABC8));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CC98;
  }
  return v11;
}

- (id)registerFormatterTBTRetimerDataWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", &off_10001ABE0));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_10001ABE0));
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:](self, "registerFormatterGenericWithBuffer:andLength:andConfig:", a3, a4, v10));

  }
  else
  {
    v11 = &off_10001CCB0;
  }
  return v11;
}

- (id)readFullVersion
{
  uint64_t *v3;
  uint64_t *v4;
  unsigned int v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  unint64_t v11;

  v11 = 0;
  v3 = (uint64_t *)malloc_type_malloc(0x40uLL, 0x391A0DB7uLL);
  if (!v3)
  {
LABEL_5:
    v6 = &stru_1000186C8;
    return v6;
  }
  v4 = v3;
  v5 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v3, 64, 15, &v11);
  v6 = &stru_1000186C8;
  if (!v5 && v11 <= 8)
  {
    v7 = *v4;
    v10 = 0;
    v9 = 0;
    if (!-[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", &v10, 1, 44, &v9))
    {
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%X.%X.%X.%d.%d"), v7 >> 20, (v7 >> 8) & 0xFFF, v7, BYTE4(v7), BYTE5(v7)));
      return v6;
    }
    goto LABEL_5;
  }
  return v6;
}

- (id)registerFormatterCFVIDConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  unint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PDControllerType5;
  v5 = -[PDControllerType5 registerFormatterCFVIDConfigWithBuffer:andLength:](&v18, "registerFormatterCFVIDConfigWithBuffer:andLength:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v6, "mutableCopy");

  if (objc_msgSend(v7, "count"))
  {
    for (i = 0; (unint64_t)objc_msgSend(v7, "count") > i; ++i)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", i));
      v10 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", i));
        v12 = objc_msgSend(v11, "containsString:", CFSTR("DFUfSetDBF"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", i));
          v14 = objc_msgSend(v13, "containsString:", CFSTR("0x1"));

          if (v14)
            v15 = CFSTR("DFUf entry sets No-VIN flag. (0x1)");
          else
            v15 = CFSTR("DFUf does not affect No-VIN flag. (0x0)");
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", CFSTR("DFUfSetNVF"), v15));
          objc_msgSend(v7, "replaceObjectAtIndex:withObject:", i, v16);

          return v7;
        }
      }
      else
      {

      }
    }
  }
  return v7;
}

- (id)registerFormatterCFDebugConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  BOOL v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  int v63;
  int v64;
  unint64_t v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  char *v95;
  uint64_t v96;
  PDControllerType5 *v97;
  uint64_t v98;
  _QWORD v99[4];
  _QWORD v100[4];
  _QWORD v101[7];
  _QWORD v102[7];
  _QWORD v103[17];
  _QWORD v104[17];
  _QWORD v105[27];
  _QWORD v106[27];
  _QWORD v107[14];
  _QWORD v108[14];
  _QWORD v109[5];
  _QWORD v110[5];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v97 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", a3, a4));
  objc_msgSend(v7, "addObjectsFromArray:", v8);
  if (a4 < 0x41)
  {
    if (a4 != 64)
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld < 64"), a4));
      objc_msgSend(v7, "addObject:", v77);

      goto LABEL_35;
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: Unexpected length, may not be decoded properly.")));
    objc_msgSend(v7, "addObject:", v9);

  }
  v88 = v8;
  v109[0] = &off_10001ABF8;
  v109[1] = &off_10001AC10;
  v110[0] = CFSTR("Reboot Ace (equivalent to 'Gaid' 4CC). (0x00)");
  v110[1] = CFSTR("RESET_REQ. (0x01)");
  v109[2] = &off_10001AC28;
  v109[3] = &off_10001AC40;
  v110[2] = CFSTR("DFU_REQ. (0x02)");
  v110[3] = CFSTR("DBG_EN. (0x03)");
  v109[4] = &off_10001AC58;
  v110[4] = CFSTR("DFU Ace (0x04)");
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v110, v109, 5));
  v107[0] = &off_10001AC10;
  v107[1] = &off_10001AC28;
  v108[0] = CFSTR("Action. (0x01)");
  v108[1] = CFSTR("SWD. (0x02)");
  v107[2] = &off_10001AC40;
  v107[3] = &off_10001AC58;
  v108[2] = CFSTR("UART. (0x03)");
  v108[3] = CFSTR("DigitalIO. (0x04)");
  v107[4] = &off_10001AC70;
  v107[5] = &off_10001AC88;
  v108[4] = CFSTR("DCI-BSSB. (0x05)");
  v108[5] = CFSTR("USB. (0x06)");
  v107[6] = &off_10001ACA0;
  v107[7] = &off_10001ACB8;
  v108[6] = CFSTR("DCI-DbC. (0x07)");
  v108[7] = CFSTR("I2C. (0x08)");
  v107[8] = &off_10001ACD0;
  v107[9] = &off_10001ACE8;
  v108[8] = CFSTR("DisplayPort. (0x09)");
  v108[9] = CFSTR("AID. (0x0A)");
  v107[10] = &off_10001AD00;
  v107[11] = &off_10001AD18;
  v108[10] = CFSTR("AnalogIO. (0x0B)");
  v108[11] = CFSTR("2Wire-BSSB. (0x0C)");
  v107[12] = &off_10001AD30;
  v107[13] = &off_10001AD48;
  v108[12] = CFSTR("2Wire-MADI. (0x0D)");
  v108[13] = CFSTR("KIS (USB). (0x46)");
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v108, v107, 14));
  v105[0] = &off_10001ABF8;
  v105[1] = &off_10001AC10;
  v106[0] = CFSTR("Ace AUX. (0x00)");
  v106[1] = CFSTR("Ace USB_RP1. (0x01)");
  v105[2] = &off_10001AC28;
  v105[3] = &off_10001AC40;
  v106[2] = CFSTR("Ace USB_RP2. (0x02)");
  v106[3] = CFSTR("Ace USB_RP3. (0x03)");
  v105[4] = &off_10001AC58;
  v105[5] = &off_10001AC70;
  v106[4] = CFSTR("USB3 Normal Mode. (0x04)");
  v106[5] = CFSTR("Ace Internal SWD. (0x05)");
  v106[6] = CFSTR("Ace DEBUG0/1 (Analog). (0x06)");
  v106[7] = CFSTR("Ace DEBUG2/3 (Analog). (0x07)");
  v106[8] = CFSTR("Ace DEBUG4/5 (Analog). (0x08)");
  v106[9] = CFSTR("Ace DEBUG6/7 (Analog). (0x09)");
  v106[10] = CFSTR("Ace Internal UART. (0x0A)");
  v106[11] = CFSTR("Ace I2C1. (0x0B)");
  v105[12] = &off_10001AD18;
  v105[13] = &off_10001AD60;
  v106[12] = CFSTR("Ace I2C2/SPMI. (0x0C)");
  v106[13] = CFSTR("Debug MUX DCI. (0x12)");
  v105[14] = &off_10001AD78;
  v105[15] = &off_10001AA18;
  v106[14] = CFSTR("Debug MUX SWD. (0x13)");
  v106[15] = CFSTR("Debug MUX UART/DM2 USB. (0x14)");
  v105[16] = &off_10001AD90;
  v105[17] = &off_10001AA30;
  v106[16] = CFSTR("Ace Debug Serial Output. (0x15)");
  v106[17] = CFSTR("Ace DEBUG0-3 DCI. (0x16)");
  v105[18] = &off_10001ADA8;
  v105[19] = &off_10001ADC0;
  v106[18] = CFSTR("Ace DEBUG4-7 DCI. (0x17)");
  v106[19] = CFSTR("Ace DEBUG0/1 (Digital). (0x18)");
  v105[20] = &off_10001ADD8;
  v105[21] = &off_10001ADF0;
  v106[20] = CFSTR("Ace DEBUG2/3 (Digital). (0x19)");
  v106[21] = CFSTR("Ace DEBUG4/5 (Digital). (0x1A)");
  v105[22] = &off_10001AE08;
  v105[23] = &off_10001AE20;
  v106[22] = CFSTR("Ace DEBUG6/7 (Digital). (0x1B)");
  v106[23] = CFSTR("Ace DEBUG0/1 (Digital). (0x1C)");
  v105[6] = &off_10001AC88;
  v105[7] = &off_10001ACA0;
  v105[24] = &off_10001AE38;
  v105[25] = &off_10001AE50;
  v105[8] = &off_10001ACB8;
  v105[9] = &off_10001ACD0;
  v106[24] = CFSTR("Ace DEBUG2/3 (Digital). (0x1D)");
  v106[25] = CFSTR("Ace DEBUG4/5 (Digital). (0x1E)");
  v105[10] = &off_10001ACE8;
  v105[11] = &off_10001AD00;
  v105[26] = &off_10001AE68;
  v106[26] = CFSTR("Ace DEBUG6/7 (Digital). (0x1F)");
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v106, v105, 27));
  v104[0] = CFSTR("SMC. (0x01)");
  v104[1] = CFSTR("PCH/MCP. (0x02)");
  v103[0] = &off_10001AC10;
  v103[1] = &off_10001AC28;
  v104[2] = CFSTR("PDMicro1. (0x03)");
  v104[3] = CFSTR("Mojo. (0x04)");
  v103[2] = &off_10001AC40;
  v103[3] = &off_10001AC58;
  v103[4] = &off_10001AC70;
  v103[5] = &off_10001AC88;
  v104[4] = CFSTR("PMU. (0x05)");
  v104[5] = CFSTR("SoC. (0x06)");
  v103[6] = &off_10001ACA0;
  v103[7] = &off_10001ACB8;
  v104[6] = CFSTR("Baseband. (0x07)");
  v104[7] = CFSTR("SSD. (0x08)");
  v103[8] = &off_10001ACD0;
  v103[9] = &off_10001ACE8;
  v104[8] = CFSTR("PDMicro2. (0x09)");
  v104[9] = CFSTR("HID. (0x0A)");
  v103[10] = &off_10001AD00;
  v103[11] = &off_10001AD18;
  v104[10] = CFSTR("KIS. (0x0B)");
  v104[11] = CFSTR("MCU. (0x0C)");
  v103[12] = &off_10001AD30;
  v103[13] = &off_10001AE80;
  v104[12] = CFSTR("Tristar+KIS Magic. (0x0D)");
  v104[13] = CFSTR("Fan_01. (0x0E)");
  v103[14] = &off_10001AE98;
  v103[15] = &off_10001AEB0;
  v104[14] = CFSTR("Fan_23. (0x0F)");
  v104[15] = CFSTR("Camera. (0x10)");
  v103[16] = &off_10001AEC8;
  v104[16] = CFSTR("LDCM. (0x11)");
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v104, v103, 17));
  v102[0] = CFSTR("Pairs. (0x01)");
  v102[1] = CFSTR("Voltage. (0x02)");
  v101[0] = &off_10001AC10;
  v101[1] = &off_10001AC28;
  v101[2] = &off_10001AC40;
  v101[3] = &off_10001AC58;
  v102[2] = CFSTR("Clock/MHz. (0x03)");
  v102[3] = CFSTR("Clock/Multiplier. (0x04)");
  v101[4] = &off_10001AC70;
  v101[5] = &off_10001AEE0;
  v102[4] = CFSTR("Orientation. (0x05)");
  v102[5] = CFSTR("Options/[Signal]. (0x80)");
  v101[6] = &off_10001AEF8;
  v102[6] = CFSTR("Options/UART. (0x81)");
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v102, v101, 7));
  v10 = 0;
  v11 = 1;
  while (2)
  {
    v12 = 0;
    v98 = v11;
    v92 = (int)v10;
    if ((int)v10 <= 64)
      v13 = 64;
    else
      v13 = v10;
    v95 = (char *)a3 + (int)v10;
    v96 = v13 - (int)v10;
    v14 = v10 << 32;
    do
    {
      if (v96 == v12)
        goto LABEL_33;
      v15 = v95[v12];
      if (!v95[v12])
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%X (byte 0x%X)"), 0, v12 + v92 + 1));
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", CFSTR("Terminator Record"), v75));
        objc_msgSend(v7, "addObject:", v76);

        goto LABEL_32;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DC Record #%u Header"), v98));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), v15));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", v16, v17));
      objc_msgSend(v7, "addObject:", v18);

      v99[0] = &off_10001ABF8;
      v99[1] = &off_10001AC10;
      v100[0] = CFSTR("Record Invalid. (0x0)");
      v100[1] = CFSTR("Ace Internal DC Record. (0x1)");
      v99[2] = &off_10001AC28;
      v99[3] = &off_10001AC40;
      v100[2] = CFSTR("Action DC Record. (0x02)");
      v100[3] = CFSTR("Signal DC Record. (0x03)");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v100, v99, 4));
      v20 = v15 >> 6;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:value:table:](v97, "stringForTitle:value:table:", CFSTR("  DCRecordType"), v15 >> 6, v19));
      objc_msgSend(v7, "addObject:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X (byte 0x%02X)"), v15 & 0x3F, (v15 & 0x3F) + 1));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", CFSTR("  DCRecordEnd"), v22));
      objc_msgSend(v7, "addObject:", v23);

      ++v12;
      v14 += (uint64_t)&_mh_execute_header;
    }
    while ((v15 & 0x3F) == 0);
    if ((int)v92 - 1 + (int)v12 < 63)
    {
      v24 = v12 + v92;
      switch(v20)
      {
        case 2u:
          v25 = *((unsigned __int8 *)a3 + (v14 >> 32));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DC Record #%u Action DC Record"), v98));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), v25));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", v26, v27));
          objc_msgSend(v7, "addObject:", v28);

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:value:table:](v97, "stringForTitle:value:table:", CFSTR("  ActionTarget"), v25, v91));
          objc_msgSend(v7, "addObject:", v29);

          if ((int)v92 - 1 + (int)v12 < 62)
          {
            LODWORD(v30) = 0;
            v31 = 1431655766 * (int)((v15 & 0x3F) - v92 - v12);
            v32 = (BYTE4(v31) + (v31 < 0));
            v10 = v24 + 1;
            while (v32 != (_DWORD)v30)
            {
              v33 = *(_DWORD *)((char *)a3 + v10);
              v30 = (v30 + 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DC Record #%u Action EDC Record #%d"), v98, v30));
              v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%06X"), v33 & 0xFFFFFF));
              v36 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", v34, v35));
              objc_msgSend(v7, "addObject:", v36);

              v37 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:value:table:](v97, "stringForTitle:value:table:", CFSTR("  AceAction"), (v33 >> 18) & 0xF, v94));
              objc_msgSend(v7, "addObject:", v37);

              v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), BYTE1(v33)));
              v39 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", CFSTR("  ActionValue"), v38));
              objc_msgSend(v7, "addObject:", v39);

              v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), v33));
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", CFSTR("  ActionTag"), v40));
              objc_msgSend(v7, "addObject:", v41);

              v42 = v10 + 3;
              v43 = v10 < 61;
              v10 += 3;
              if (!v43)
              {
LABEL_29:
                v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: The record overflows the register buffer. Stop decoding.")));
                objc_msgSend(v7, "addObject:", v74);

                v10 = v42;
                goto LABEL_30;
              }
            }
            goto LABEL_30;
          }
          break;
        case 3u:
          v44 = *(unsigned int *)((char *)a3 + (v14 >> 32));
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DC Record #%u Signal DC Record"), v98));
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08X"), v44));
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", v45, v46));
          objc_msgSend(v7, "addObject:", v47);

          v48 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", (v44 >> 31) & 1, CFSTR("  SignalPairs_Single"), CFSTR("All specified pairs used. (0x0)"), CFSTR("Single pair used. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v48);

          v49 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", v44 >> 30, CFSTR("  SignalPairs_RX2"), CFSTR("Not used. (0x0)"), CFSTR("Used. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v49);

          v50 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", v44 >> 29, CFSTR("  SignalPairs_RX1"), CFSTR("Not used. (0x0)"), CFSTR("Used. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v50);

          v51 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", v44 >> 28, CFSTR("  SignalPairs_TX2"), CFSTR("Not used. (0x0)"), CFSTR("Used. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v51);

          v52 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", v44 >> 27, CFSTR("  SignalPairs_TX1"), CFSTR("Not used. (0x0)"), CFSTR("Used. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v52);

          v53 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", v44 >> 26, CFSTR("  SignalPairs_SBU"), CFSTR("Not used. (0x0)"), CFSTR("Used. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v53);

          v54 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", v44 >> 25, CFSTR("  SignalPairs_Mission"), CFSTR("Not used. (0x0)"), CFSTR("Used. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v54);

          v55 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", BYTE3(v44), CFSTR("  SignalPairs_Debug"), CFSTR("Not used. (0x0)"), CFSTR("Used. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v55);

          v56 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", (v44 >> 23), CFSTR("  InsertTagVoltageVDDIO"), CFSTR("Do not insert 0x02 0xVV (Voltage) tag. (0x0)"), CFSTR("Insert 0x02 0xVV (Voltage) tag after Pairs tag. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v56);

          v57 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", (v44 >> 22), CFSTR("  FirstTagBeforePairs"), CFSTR("Do not place first EDC Record before Pairs tag. (0x0)"), CFSTR("Place first EDC Record before Pairs tag. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v57);

          v58 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", (v44 >> 21), CFSTR("  InsertTagVoltage3.3V"), CFSTR("Do not insert 0x02 0x21 (Voltage: 3.3V) tag. (0x0)"), CFSTR("Insert 0x02 0x21 (Voltage: 3.3V) tag after Pairs tag. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v58);

          v59 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:value:table:](v97, "stringForTitle:value:table:", CFSTR("  AceSignal"), WORD1(v44) & 0x1F, v89));
          objc_msgSend(v7, "addObject:", v59);

          v60 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:value:table:](v97, "stringForTitle:value:table:", CFSTR("  SignalTarget"), BYTE1(v44), v91));
          objc_msgSend(v7, "addObject:", v60);

          v61 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:value:table:](v97, "stringForTitle:value:table:", CFSTR("  Signal"), v44, v90));
          objc_msgSend(v7, "addObject:", v61);

          if ((int)v92 - 1 + (int)v12 < 59)
          {
            v62 = 0;
            v63 = (v15 & 0x3F) - v92 - v12;
            v64 = v63 - 3;
            LODWORD(v65) = v63 - 2;
            if (v64 >= 0)
              v65 = v64;
            else
              v65 = v65;
            v10 = (int)v12 + (int)v92 + 4;
            v66 = (v65 >> 1);
            while (v66 != (_DWORD)v62)
            {
              v67 = *(unsigned __int16 *)((char *)a3 + v10);
              v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DC Record #%u Signal EDC Record #%d"), v98, ++v62));
              v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%04X"), v67));
              v70 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", v68, v69));
              objc_msgSend(v7, "addObject:", v70);

              v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), v67 >> 8));
              v72 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", CFSTR("  SignalValue"), v71));
              objc_msgSend(v7, "addObject:", v72);

              v73 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:value:table:](v97, "stringForTitle:value:table:", CFSTR("  SignalTag"), v67, v93));
              objc_msgSend(v7, "addObject:", v73);

              v42 = v10 + 2;
              v43 = v10 < 62;
              v10 += 2;
              if (!v43)
                goto LABEL_29;
            }
            goto LABEL_30;
          }
          break;
        case 1u:
          v79 = *((unsigned __int8 *)a3 + (v14 >> 32));
          v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DC Record #%u Internal DC Record"), v98));
          v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), v79));
          v82 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", v80, v81));
          objc_msgSend(v7, "addObject:", v82);

          v83 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", v79 >> 7, CFSTR("  OfferRESET"), CFSTR("No PortMicro Action entry for reset shall be advertised. (0x0)"), CFSTR("PortMicro Action entry for reset shall be advertised. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v83);

          v84 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", v79 >> 6, CFSTR("  OfferAceDFU"), CFSTR("No PortMicro Action entry for DFU shall be advertised. (0x0)"), CFSTR("PortMicro DFU entry for reset shall be advertised. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v84);

          v85 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", v79 >> 3, CFSTR("  OfferI2C2SPMI"), CFSTR("No PortMicro I2C/SPMI entry for I2C2 and SPMI shall be advertised. (0x0)"), CFSTR("PortMicro I2C or SPMI entry for I2C2 or SPMI shall be advertised. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v85);

          v86 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", v79 >> 2, CFSTR("  OfferI2C1"), CFSTR("No PortMicro I2C entry for I2C1 shall be advertised. (0x0)"), CFSTR("PortMicro I2C entry for I2C1 shall be advertised. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v86);

          v87 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", v79 >> 1, CFSTR("  OfferDebugSerial"), CFSTR("No PortMicro UART entry shall be advertised. (0x0)"), CFSTR("PortMicro UART entry shall be advertised. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v87);

          v75 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](v97, "decodeSingleBit:title:arg0:arg1:", v79, CFSTR("  OfferSWD"), CFSTR("No PortMicro SWD entry shall be advertised. (0x0)"), CFSTR("PortMicro SWD entry shall be advertised. (0x1)")));
          objc_msgSend(v7, "addObjectsFromArray:", v75);
          goto LABEL_32;
        default:
          v10 = v92 + v12;
LABEL_30:
          v11 = v98 + 1;
          continue;
      }
    }
    break;
  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: The record overflows the register buffer. Stop decoding.")));
  objc_msgSend(v7, "addObject:", v75);
LABEL_32:

LABEL_33:
  v8 = v88;
LABEL_35:

  return v7;
}

- (id)registerFormatterSecondaryMUXInitWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  void *v13;
  unsigned __int8 v14;
  int v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  int v53;
  unsigned int v54;
  int v55;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", a3, a4));
  objc_msgSend(v7, "addObjectsFromArray:", v8);
  if (a4 < 0x41)
  {
    if (a4 != 64)
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld < 64"), a4));
      objc_msgSend(v7, "addObject:", v16);
      goto LABEL_16;
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: Unexpected length, may not be decoded properly.")));
    objc_msgSend(v7, "addObject:", v9);

  }
  v52 = v8;
  v10 = *((unsigned __int8 *)a3 + 1);
  v55 = v10 & 0x40;
  v11 = v10 & 0x20;
  v12 = (v10 >> 6) & 1;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("if ( I2CDataMux != 01110b)")));
  objc_msgSend(v7, "addObject:", v13);

  v14 = 0;
  v53 = 62 - (v12 + (v11 >> 5));
  v54 = v11;
  v15 = 2;
  v16 = &stru_1000186C8;
  do
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  Initialization Record %d"), v14));
    objc_msgSend(v7, "addObject:", v17);

    v18 = v15;
    v19 = *((unsigned __int8 *)a3 + v15);
    if (v54)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%04X"), v19 | (*((unsigned __int8 *)a3 + v15 + 1) << 8)));
      v21 = 2;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), v19));
      v21 = 1;
    }
    v22 = v14;

    v23 = v18 + v21;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    SecondaryMUXInit%dSubaddr"), v22));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", v24, v20));
    objc_msgSend(v7, "addObject:", v25);

    v26 = *((unsigned __int8 *)a3 + v23);
    if (v55)
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%04X"), v26 | (*((unsigned __int8 *)a3 + (int)v23 + 1) << 8)));
      v27 = 2;
    }
    else
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), v26));
      v27 = 1;
    }

    v15 = v23 + v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    SecondaryMUXInit%dData"), v22));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", v28, v16));
    objc_msgSend(v7, "addObject:", v29);

    v14 = v22 + 1;
  }
  while (v15 <= v53);
  v30 = *((unsigned __int8 *)a3 + 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](self, "decodeSingleBit:title:arg0:arg1:", v30 >> 7, CFSTR("  SecondaryMUXInitEveryConnect"), CFSTR("Initialization only needs to be performed once. (0x0)"), CFSTR("Initialization must be performed every time the MUX is 'activated'. (0x1)")));
  objc_msgSend(v7, "addObjectsFromArray:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](self, "decodeSingleBit:title:arg0:arg1:", v30 >> 6, CFSTR("  SecondaryMUXData16bit"), CFSTR("Data Records are 1 byte each. (0x0)"), CFSTR("Data Records are 2 bytes each. (0x1)")));
  objc_msgSend(v7, "addObjectsFromArray:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](self, "decodeSingleBit:title:arg0:arg1:", v30 >> 5, CFSTR("  SecondaryMUXSubaddr16bit"), CFSTR("Subaddress Records are 1 byte each. (0x0)"), CFSTR("Subaddress Records are 2 bytes each. (0x1)")));
  objc_msgSend(v7, "addObjectsFromArray:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), v30 & 0x1F));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", CFSTR("  SecondaryMUXNumEntries"), v34));
  objc_msgSend(v7, "addObject:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("if ( I2CDataMux == 01110b)")));
  objc_msgSend(v7, "addObject:", v36);

  for (i = 63; i != 1; --i)
  {
    v38 = *((unsigned __int8 *)a3 + i);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  SecondaryMUXInitByte%d"), i - 2));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), v38));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", v39, v40));
    objc_msgSend(v7, "addObject:", v41);

  }
  v42 = *((unsigned __int8 *)a3 + 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](self, "decodeSingleBit:title:arg0:arg1:", v42 >> 7, CFSTR("  SecondaryMUXInitEveryConnect"), CFSTR("Initialization only needs to be performed once. (0x0)"), CFSTR("Initialization must be performed every time the MUX is 'activated'. (0x1)")));
  objc_msgSend(v7, "addObjectsFromArray:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](self, "decodeSingleBit:title:arg0:arg1:", v42 >> 6, CFSTR("  SecondaryMUXUseStringTable"), CFSTR("SecondaryMUXNumBytes contains the number of SecondaryMUXInitByte bytes. (0x0)"), CFSTR("SecondaryMUXNumBytes contains an index to the String Table. (0x1)")));
  objc_msgSend(v7, "addObjectsFromArray:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), v42 & 0x3F));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", CFSTR("  SecondaryMUXNumEntries"), v45));
  objc_msgSend(v7, "addObject:", v46);

  v47 = *(unsigned __int8 *)a3;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("I2C addr = 0x%02X"), v47 >> 1));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", CFSTR("SecondaryMUXAddr"), v48));
  objc_msgSend(v7, "addObject:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 decodeSingleBit:title:arg0:arg1:](self, "decodeSingleBit:title:arg0:arg1:", v47, CFSTR("SecondaryMUXValid"), CFSTR("Register Invalid. (0x0)"), CFSTR("Register Valid. (0x1)")));
  objc_msgSend(v7, "addObjectsFromArray:", v50);

  v8 = v52;
LABEL_16:

  return v7;
}

- (void)buildRegDecodes
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005B48;
  v6[3] = &unk_1000182C8;
  objc_copyWeak(&v7, &location);
  v3 = objc_retainBlock(v6);
  v4 = *(NSDictionary **)((char *)&self->super._dpmrConfigs + 2);
  *(NSDictionary **)((char *)&self->super._dpmrConfigs + 2) = v3;

  v5 = *(id *)((char *)&self->_policy_handler + 2);
  *(id *)((char *)&self->_policy_handler + 2) = &stru_100018308;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setDPMrConfigs
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)PDControllerType5;
  -[PDControllerType4 setDPMrConfigs](&v46, "setDPMrConfigs");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v3));

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LRD1")));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LRD1")));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mask")));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LRD1")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("match")));

      if (!v11)
        goto LABEL_6;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LRD1")));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v12));

      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_10001AF10, CFSTR("mask"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_10001AF28, CFSTR("match"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v6));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("LRD1"));
    }

  }
LABEL_6:
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DPM1")));
  if (!v13)
    goto LABEL_11;
  v14 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DPM1")));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("mask")));
  if (v16)
  {
    v17 = (void *)v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DPM1")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("match")));

    if (!v19)
      goto LABEL_11;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DPM1")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v20));

    objc_msgSend(v14, "setObject:forKeyedSubscript:", &off_10001AE98, CFSTR("mask"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &off_10001AC28, CFSTR("match"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v14));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("DPM1"));
  }

LABEL_11:
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DPM2")));
  if (!v21)
    goto LABEL_16;
  v22 = (void *)v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DPM2")));
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("mask")));
  if (v24)
  {
    v25 = (void *)v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DPM2")));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("match")));

    if (!v27)
      goto LABEL_16;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DPM2")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v28));

    objc_msgSend(v22, "setObject:forKeyedSubscript:", &off_10001AE98, CFSTR("mask"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", &off_10001AC58, CFSTR("match"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v22));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("DPM2"));
  }

LABEL_16:
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eUSBA")));
  if (!v29)
    goto LABEL_21;
  v30 = (void *)v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eUSBA")));
  v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("mask")));
  if (v32)
  {
    v33 = (void *)v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eUSBA")));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("match")));

    if (!v35)
      goto LABEL_21;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eUSBA")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v36));

    objc_msgSend(v30, "setObject:forKeyedSubscript:", &off_10001AF40, CFSTR("mask"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", &off_10001AF40, CFSTR("match"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v30));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("eUSBA"));
  }

LABEL_21:
  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("USB4B")));
  if (v37)
  {
    v38 = (void *)v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("USB4B")));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("mask")));
    if (!v40)
    {
LABEL_25:

      goto LABEL_26;
    }
    v41 = (void *)v40;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("USB4B")));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("match")));

    if (v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("USB4B")));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v44));

      objc_msgSend(v38, "setObject:forKeyedSubscript:", &off_10001AE98, CFSTR("mask"));
      objc_msgSend(v38, "setObject:forKeyedSubscript:", &off_10001AE80, CFSTR("match"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v38));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("USB4B"));
      goto LABEL_25;
    }
  }
LABEL_26:
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v4));
  -[PDControllerType4 setDpmrConfigs:](self, "setDpmrConfigs:", v45);

}

- (int)printDBStateHistory
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  char v22;
  __int16 v23;

  v3 = (unsigned __int8 *)malloc_type_malloc(0x40uLL, 0xE13577B8uLL);
  v4 = v3;
  if (v3)
  {
    *((_OWORD *)v3 + 2) = 0u;
    *((_OWORD *)v3 + 3) = 0u;
    *(_OWORD *)v3 = 0u;
    *((_OWORD *)v3 + 1) = 0u;
    v23 = 0;
    v21 = 1145197420;
    v22 = 1;
    LODWORD(v20) = 4194307;
    v5 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v21, &v22, 0, v3, 0, v20, 10);
  }
  else
  {
    v23 = 0;
    v21 = 1145197420;
    v22 = 1;
    v5 = -536870211;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v4, 18));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
  -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", CFSTR("DBSl(0)"), v7);

  if (v5)
  {
    v8 = 0;
  }
  else
  {
    v8 = v4[3] | ((v4[4] & 7) << 8);
    v9 = 1;
    do
    {
      v22 = (16 * v9) | 1;
      LODWORD(v20) = 4194307;
      v5 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v21, &v22, 0, v4, 0, v20, 10);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DBSl(%u)"), v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v4, 64));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
      -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", v10, v12);

      if (v9 > 2)
        break;
      v9 = (v9 + 1);
    }
    while (!v5);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v8)
  {
    v14 = 0;
    do
    {
      ++v14;
      if (!v5)
      {
        v22 = 1;
        v23 = v14 & 0x7FF;
        LODWORD(v20) = 4194307;
        v5 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v21, &v22, 0, v4, 0, v20, 10);
        if (!v5)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v4, 64));
          objc_msgSend(v13, "addObjectsFromArray:", v15);

          v5 = 0;
        }
      }
    }
    while (v8 != v14);
  }
  v22 = 0;
  if (v5
    || (LODWORD(v20) = 4194307,
        (v5 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v21, &v22, 0, v4, 0, v20, 10)) != 0))
  {
    if (v4)
LABEL_18:
      free(v4);
  }
  else
  {
    if (objc_msgSend(v13, "count"))
    {
      v17 = 0;
      do
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v17++));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DBSl[%03X]"), v17));
        -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", v19, v18);

      }
      while ((unint64_t)objc_msgSend(v13, "count") > v17);
    }
    v5 = 0;
    if (v4)
      goto LABEL_18;
  }

  return v5;
}

- (NSDictionary)registerConfigs
{
  return *(NSDictionary **)(&self->num_dbsl_blocks + 1);
}

- (void)setRegisterConfigs:(id)a3
{
  objc_storeStrong((id *)(&self->num_dbsl_blocks + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->num_dbsl_blocks + 1), 0);
  objc_storeStrong((id *)((char *)&self->_policy_handler + 2), 0);
  objc_storeStrong((id *)((char *)&self->super._dpmrConfigs + 2), 0);
}

@end
