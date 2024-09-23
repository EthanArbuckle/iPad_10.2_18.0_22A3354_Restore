uint64_t NWOLCopyFormattedStringIPv4Address(void *a1)
{
  id v1;
  id v2;
  int *v3;
  const char *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  int v15;
  char v16[8];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v15 = 0;
  *(_QWORD *)v16 = 0;
  v17 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    if (objc_msgSend(v2, "bytes") && objc_msgSend(v2, "length"))
    {
      if (objc_msgSend(v2, "length") == 4)
      {
        v3 = (int *)objc_msgSend(v2, "bytes");

        goto LABEL_8;
      }
      v12 = objc_alloc(MEMORY[0x24BDD1688]);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<fail decode - size> %zu != %lu"), objc_msgSend(v2, "length"), 4);
      v8 = objc_msgSend(v12, "initWithString:", v13);

    }
    else
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", CFSTR("<NULL>"));
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = objc_alloc(MEMORY[0x24BDD1688]);
    v10 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v1, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("<fail decode - data type> %@"), v7);
    v8 = objc_msgSend(v9, "initWithString:", v11);

    goto LABEL_12;
  }
  v15 = objc_msgSend(v1, "unsignedIntValue");
  v3 = &v15;
LABEL_8:
  v4 = inet_ntop(2, v3, v16, 0x10u);
  v5 = objc_alloc(MEMORY[0x24BDD1688]);
  v6 = v5;
  if (!v4)
  {
    v8 = objc_msgSend(v5, "initWithString:", CFSTR("<failed conversion>"));
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "initWithString:", v7);
LABEL_12:

LABEL_16:
  return v8;
}

uint64_t NWOLCopyFormattedStringIPv6Address(void *a1)
{
  id v1;
  id v2;
  const char *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  char v15[16];
  _WORD v16[15];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    if (objc_msgSend(v2, "bytes") && objc_msgSend(v2, "length"))
    {
      if (objc_msgSend(v2, "length") != 16)
      {
        v5 = objc_alloc(MEMORY[0x24BDD1688]);
        v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<fail decode - size> %zu != %lu"), objc_msgSend(v2, "length"), 16);
        goto LABEL_11;
      }
      *(_OWORD *)v15 = 0u;
      memset(v16, 0, sizeof(v16));
      v3 = inet_ntop(30, (const void *)objc_msgSend(v2, "bytes"), v15, 0x2Eu);
      v4 = objc_alloc(MEMORY[0x24BDD1688]);
      v5 = v4;
      if (v3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v15);
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v13 = (void *)v6;
        v11 = objc_msgSend(v5, "initWithString:", v6);

        goto LABEL_12;
      }
      v12 = CFSTR("<failed conversion>");
    }
    else
    {
      v4 = objc_alloc(MEMORY[0x24BDD1688]);
      v12 = CFSTR("<NULL>");
    }
    v11 = objc_msgSend(v4, "initWithString:", v12);
LABEL_12:

    goto LABEL_13;
  }
  v7 = objc_alloc(MEMORY[0x24BDD1688]);
  v8 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v1, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("<fail decode - data type> %@"), v9);
  v11 = objc_msgSend(v7, "initWithString:", v10);

LABEL_13:
  return v11;
}

uint64_t OSLogCopyFormattedString(const char *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  if (!strcmp(a1, "in_addr"))
  {
    v5 = 0;
LABEL_18:
    v4 = ((uint64_t (*)(void *))(&OSLogCopyFormattedString_formatters)[2 * v5 + 1])(v3);
    goto LABEL_19;
  }
  if (!strcmp(a1, "in6_addr"))
  {
    v5 = 1;
    goto LABEL_18;
  }
  if (!strcmp(a1, "sockaddr"))
  {
    v5 = 2;
    goto LABEL_18;
  }
  if (!strcmp(a1, "tcp_flags"))
  {
    v5 = 3;
    goto LABEL_18;
  }
  if (!strcmp(a1, "tcp_state"))
  {
    v5 = 4;
    goto LABEL_18;
  }
  if (!strcmp(a1, "tcp_packets"))
  {
    v5 = 5;
    goto LABEL_18;
  }
  if (!strcmp(a1, "quic_packets"))
  {
    v5 = 6;
    goto LABEL_18;
  }
  if (!strcmp(a1, "data"))
  {
    v5 = 7;
    goto LABEL_18;
  }
  v4 = 0;
LABEL_19:

  return v4;
}

uint64_t NWOLCopyFormattedStringSockaddr(void *a1)
{
  id v1;
  id v2;
  unsigned __int8 *v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  const __CFString *v16;
  unint64_t v17;
  id v18;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  int v29;
  id v30;
  void *v31;
  uint64_t v32;
  unsigned __int8 *v33;
  uint64_t v34;
  unint64_t v35;
  const __CFString *v36;
  int v37;
  int v38;
  const __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44[6];
  char v45[70];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    v3 = (unsigned __int8 *)objc_msgSend(v2, "bytes");
    v4 = objc_msgSend(v2, "length");
    if (v3 && (v5 = v4) != 0)
    {
      if (v4 > 1)
      {
        v17 = *v3;
        if (v4 >= v17)
        {
          switch(v3[1])
          {
            case 1u:
              v20 = objc_alloc(MEMORY[0x24BDD1688]);
              v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("AF_UNIX:\"%.*s\""), *v3 - 2, v3 + 2, v41, v42, v43);
              goto LABEL_25;
            case 2u:
              if (v17 <= 0xF)
              {
                v20 = objc_alloc(MEMORY[0x24BDD1688]);
                v22 = objc_alloc(MEMORY[0x24BDD17C8]);
                v23 = *v3;
                v24 = 16;
                goto LABEL_24;
              }
              v28 = getnameinfo((const sockaddr *)v3, v17, v45, 0x10u, v44, 6u, 10);
              if (v28)
                goto LABEL_42;
              v29 = *((unsigned __int16 *)v3 + 1);
              v6 = objc_alloc(MEMORY[0x24BDD1688]);
              v30 = objc_alloc(MEMORY[0x24BDD17C8]);
              if (!v29)
                goto LABEL_51;
              v7 = objc_msgSend(v30, "initWithFormat:", CFSTR("%s:%s"), v45, v44);
              goto LABEL_6;
            case 0x12u:
              v25 = v3[5];
              v26 = v3[6];
              if (v25 + v26 + (unint64_t)v3[7] + 8 > v17)
              {
                v20 = objc_alloc(MEMORY[0x24BDD1688]);
                v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<fail decode - size> %d < %zu + %d + %d + %d"), *v3, 8, v3[5], v3[6], v3[7]);
                goto LABEL_25;
              }
              if (!(v26 | v25) && !*((_WORD *)v3 + 1))
              {
                v15 = objc_alloc(MEMORY[0x24BDD1688]);
                v16 = CFSTR("<fail decode - no information>");
                goto LABEL_9;
              }
              objc_msgSend(MEMORY[0x24BDD16A8], "string");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = v31;
              v32 = v3[5];
              if (v3[6])
              {
                v33 = &v3[v32];
                objc_msgSend(v31, "appendFormat:", CFSTR("%x"), v3[v32 + 8]);
                if (v3[6] >= 2u)
                {
                  v34 = 9;
                  do
                  {
                    objc_msgSend(v8, "appendFormat:", CFSTR(":%x"), v33[v34]);
                    v35 = v34 - 7;
                    ++v34;
                  }
                  while (v35 < v3[6]);
                }
                LODWORD(v32) = v3[5];
              }
              if ((_DWORD)v32)
              {
                if (objc_msgSend(v8, "length"))
                  v36 = CFSTR("%%%.*s");
                else
                  v36 = CFSTR("%.*s");
                objc_msgSend(v8, "appendFormat:", v36, v3[5], v3 + 8);
              }
              else if (*((_WORD *)v3 + 1))
              {
                if (objc_msgSend(v8, "length"))
                  v39 = CFSTR("%%%d");
                else
                  v39 = CFSTR("%d");
                objc_msgSend(v8, "appendFormat:", v39, *((unsigned __int16 *)v3 + 1), v40);
              }
              v9 = objc_alloc(MEMORY[0x24BDD1688]);
              goto LABEL_12;
            case 0x1Eu:
              if (v17 > 0x1B)
              {
                v28 = getnameinfo((const sockaddr *)v3, v17, v45, 0x46u, v44, 6u, 10);
                if (v28)
                {
LABEL_42:
                  v37 = v28;
                  v6 = objc_alloc(MEMORY[0x24BDD1688]);
                  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<failed conversion> %s"), gai_strerror(v37), v40);
                }
                else
                {
                  v38 = *((unsigned __int16 *)v3 + 1);
                  v6 = objc_alloc(MEMORY[0x24BDD1688]);
                  v30 = objc_alloc(MEMORY[0x24BDD17C8]);
                  if (v38)
                    v7 = objc_msgSend(v30, "initWithFormat:", CFSTR("%s.%s"), v45, v44);
                  else
LABEL_51:
                    v7 = objc_msgSend(v30, "initWithFormat:", CFSTR("%s"), v45, v40);
                }
                goto LABEL_6;
              }
              v20 = objc_alloc(MEMORY[0x24BDD1688]);
              v22 = objc_alloc(MEMORY[0x24BDD17C8]);
              v23 = *v3;
              v24 = 28;
LABEL_24:
              v21 = objc_msgSend(v22, "initWithFormat:", CFSTR("<fail decode - size> %d < %lu"), v23, v24, v41, v42, v43);
LABEL_25:
              v27 = (void *)v21;
              v14 = objc_msgSend(v20, "initWithString:", v21);

              break;
            default:
              v20 = objc_alloc(MEMORY[0x24BDD1688]);
              v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<fail decode - address family> %d"), v3[1], v40, v41, v42, v43);
              goto LABEL_25;
          }
          goto LABEL_13;
        }
        v18 = objc_alloc(MEMORY[0x24BDD1688]);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<fail decode - size> %d > %zu"), *v3, v5);
        v9 = v18;
      }
      else
      {
        v6 = objc_alloc(MEMORY[0x24BDD1688]);
        v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<fail decode - size> %zu < %lu"), 1, 2);
LABEL_6:
        v8 = (void *)v7;
        v9 = v6;
      }
LABEL_12:
      v14 = objc_msgSend(v9, "initWithString:", v8);

    }
    else
    {
      v15 = objc_alloc(MEMORY[0x24BDD1688]);
      v16 = CFSTR("<NULL>");
LABEL_9:
      v14 = objc_msgSend(v15, "initWithString:", v16);
    }
LABEL_13:

    goto LABEL_14;
  }
  v10 = objc_alloc(MEMORY[0x24BDD1688]);
  v11 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v1, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("<fail decode - data type> %@"), v12);
  v14 = objc_msgSend(v10, "initWithString:", v13);

LABEL_14:
  return v14;
}

uint64_t NWOLCopyFormattedStringTCPFlags(void *a1)
{
  id v1;
  char v2;
  id v3;
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  char __str[9];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_msgSend(v1, "unsignedCharValue");
    v3 = objc_alloc(MEMORY[0x24BDD1688]);
    v4 = objc_alloc(MEMORY[0x24BDD17C8]);
    v5 = "F";
    v6 = "";
    if ((v2 & 1) == 0)
      v5 = "";
    v7 = "S";
    if ((v2 & 2) == 0)
      v7 = "";
    v8 = "R";
    if ((v2 & 4) == 0)
      v8 = "";
    v9 = "P";
    if ((v2 & 8) == 0)
      v9 = "";
    v10 = ".";
    if ((v2 & 0x10) == 0)
      v10 = "";
    v11 = "U";
    if ((v2 & 0x20) == 0)
      v11 = "";
    v12 = "E";
    if ((v2 & 0x40) == 0)
      v12 = "";
    if (v2 < 0)
      v6 = "C";
    snprintf(__str, 9uLL, "%s%s%s%s%s%s%s%s", v5, v7, v8, v9, v10, v11, v12, v6);
    v13 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("[%s]"), __str);
    v14 = objc_msgSend(v3, "initWithString:", v13);

  }
  else
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", CFSTR("<failed conversion>"));
  }

  return v14;
}

uint64_t NWOLCopyFormattedStringTCPState(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_msgSend(v1, "intValue");
    v3 = objc_alloc(MEMORY[0x24BDD1688]);
    if (v2 < 0xB)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", tcpstates[v2]);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%d"), v2);
    }
    v6 = (void *)v4;
    v5 = objc_msgSend(v3, "initWithString:", v4);

  }
  else
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", CFSTR("<failed conversion>"));
  }

  return v5;
}

uint64_t NWOLCopyFormattedStringTCPPackets(void *a1)
{
  id v1;
  id v2;
  unsigned __int8 *v3;
  id v4;
  const __CFString *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    v15 = 0;
    v3 = (unsigned __int8 *)objc_msgSend(v2, "bytes");
    if (objc_msgSend(v2, "length"))
    {
      if (*v3 != 1)
      {
        v7 = objc_alloc(MEMORY[0x24BDD1688]);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unsupported verison: %u"), *v3);
        v6 = objc_msgSend(v7, "initWithString:", v8);

        goto LABEL_11;
      }
      nw_log_ring_parse();
      v4 = objc_alloc(MEMORY[0x24BDD1688]);
      if (v11[5])
        v5 = (const __CFString *)v11[5];
      else
        v5 = &stru_24C33F138;
    }
    else
    {
      v4 = objc_alloc(MEMORY[0x24BDD1688]);
      v5 = CFSTR("<failed conversion>");
    }
    v6 = objc_msgSend(v4, "initWithString:", v5);
LABEL_11:
    _Block_object_dispose(&v10, 8);

    goto LABEL_12;
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", CFSTR("<failed conversion>"));
LABEL_12:

  return v6;
}

void sub_20A95B03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t NWOLCopyFormattedStringQUICPackets(void *a1)
{
  id v1;
  id v2;
  _BYTE *v3;
  id v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    v16 = 0;
    v3 = (_BYTE *)objc_msgSend(v2, "bytes");
    if (objc_msgSend(v2, "length"))
    {
      v9 = MEMORY[0x24BDAC760];
      LOBYTE(v10) = *v3;
      nw_log_ring_parse();
      v4 = objc_alloc(MEMORY[0x24BDD1688]);
      if (v12[5])
        v5 = (const __CFString *)v12[5];
      else
        v5 = &stru_24C33F138;
      v6 = objc_msgSend(v4, "initWithString:", v5, v9, 3221225472, __NWOLCopyFormattedStringQUICPackets_block_invoke, &unk_24C33EDD0, &v11, v10);
    }
    else
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", CFSTR("<failed conversion>"));
    }
    v7 = v6;
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", CFSTR("<failed conversion>"));
  }

  return v7;
}

void sub_20A95B1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t NWOLCopyFormattedStringData(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  __int128 v4;
  unint64_t v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  unsigned __int8 *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;
  char v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v25;
  uint64_t v26;
  _QWORD v27[2];
  char v28;
  __int128 v29;
  _BYTE v30[31];
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    if (objc_msgSend(v2, "bytes") && objc_msgSend(v2, "length"))
    {
      v26 = objc_msgSend(v2, "bytes");
      v27[0] = 0;
      v27[1] = 0;
      v28 = 0;
      v25 = v2;
      v3 = objc_msgSend(v2, "length");
      *(_QWORD *)&v4 = 0x2020202020202020;
      *((_QWORD *)&v4 + 1) = 0x2020202020202020;
      v29 = v4;
      *(_OWORD *)v30 = v4;
      *(_OWORD *)&v30[15] = v4;
      v31 = 0;
      if (v3)
      {
        v5 = v3;
        v6 = 0;
        v7 = &stru_24C33F138;
        do
        {
          if (v5 - v6 >= 0x10)
            v9 = 16;
          else
            v9 = v5 - v6;
          if (!(_DWORD)v9)
            goto LABEL_6;
          v10 = 3 * (v9 - 1);
          v11 = (char *)&v29 + 1;
          v12 = (unsigned __int8 *)(v26 + v6);
          v13 = (char *)v27;
          v14 = v9;
          do
          {
            v16 = *v12++;
            v15 = v16;
            if (v16 - 32 >= 0x5F)
              v17 = 46;
            else
              v17 = v15;
            v18 = NWOLCopyFormattedStringData_hexChars[v15 >> 4];
            *v13 = v17;
            *(v11 - 1) = v18;
            *v11 = NWOLCopyFormattedStringData_hexChars[v15 & 0xF];
            if (!v10)
              *((_BYTE *)v27 + (v9 - 1) + 1) = 0;
            v10 -= 3;
            v11 += 3;
            ++v13;
            --v14;
          }
          while (v14);
          if (v9 <= 0xF)
LABEL_6:
            memset(&v30[3 * v9 - 16], 32, 3 * (16 - v9) - 1);
          v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@%4zu   %s   %s\n"), v7, v6, &v29, v27);

          v6 += v9;
          v7 = v8;
        }
        while (v6 < v5);
      }
      else
      {
        v8 = &stru_24C33F138;
      }
      v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v8);

      v2 = v25;
    }
    else
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", CFSTR("<NULL>"));
    }

  }
  else
  {
    v19 = objc_alloc(MEMORY[0x24BDD1688]);
    v20 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v1, "description");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("<fail decode - data type> %@"), v21);
    v23 = objc_msgSend(v19, "initWithString:", v22);

  }
  return v23;
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

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x24BDAE598](*(_QWORD *)&a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x24BDAE6A0](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint64_t nw_log_delta_to_ms()
{
  return MEMORY[0x24BDE14B0]();
}

uint64_t nw_log_ring_parse()
{
  return MEMORY[0x24BDE14D0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

uint64_t quic_shorthand_describe_entry()
{
  return MEMORY[0x24BEDDC58]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

