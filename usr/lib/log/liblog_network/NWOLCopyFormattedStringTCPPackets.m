@implementation NWOLCopyFormattedStringTCPPackets

BOOL __NWOLCopyFormattedStringTCPPackets_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  char v9;
  unsigned int v10;
  id v11;
  const char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v36;
  const char *v37;
  void *v38;
  uint64_t v39;
  char __str[9];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (a2 == 16)
  {
    v5 = *(_DWORD *)a3;
    v4 = *(_DWORD *)(a3 + 4);
    v6 = *(unsigned __int16 *)(a3 + 8);
    v7 = *(unsigned __int16 *)(a3 + 10);
    v8 = *(unsigned __int8 *)(a3 + 14);
    v9 = *(_BYTE *)(a3 + 15);
    v10 = nw_log_delta_to_ms();
    v11 = objc_alloc(MEMORY[0x24BDD17C8]);
    v12 = "rcv";
    if ((v9 & 1) == 0)
      v12 = "snd";
    v37 = v12;
    v38 = v11;
    v13 = v10 / 0x3E8uLL;
    v36 = v10 % 0x3E8;
    v14 = bswap32(v5);
    v39 = v7;
    v15 = (v8 & 1) + (_DWORD)v7 + ((v8 >> 1) & 1) + (_DWORD)v14;
    v16 = bswap32(v4);
    v17 = "";
    v18 = bswap32(v6) >> 16;
    if ((v8 & 1) != 0)
      v19 = "F";
    else
      v19 = "";
    v20 = "S";
    if ((v8 & 2) == 0)
      v20 = "";
    v21 = "R";
    if ((v8 & 4) == 0)
      v21 = "";
    v22 = "P";
    if ((v8 & 8) == 0)
      v22 = "";
    v23 = ".";
    if ((v8 & 0x10) == 0)
      v23 = "";
    v24 = "U";
    if ((v8 & 0x20) == 0)
      v24 = "";
    v25 = "E";
    if ((v8 & 0x40) == 0)
      v25 = "";
    v26 = "C";
    if ((v8 & 0x80u) == 0)
      v26 = "";
    snprintf(__str, 9uLL, "%s%s%s%s%s%s%s%s", v19, v20, v21, v22, v23, v24, v25, v26);
    v27 = (v9 & 6) - 2;
    if (v27 <= 4)
      v17 = (&off_24C33EDF0)[v27];
    v28 = (void *)objc_msgSend(v38, "initWithFormat:", CFSTR("\t %s %4u.%.03us seq %10u:%-10u ack %-10u win %-5u len %-4u [%s]%s"), v37, v13, v36, v14, v15, v16, v18, v39, __str, v17);
    v29 = v28;
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v30 + 40))
    {
      objc_msgSend(v28, "stringByAppendingFormat:", CFSTR("\n%@"), *(_QWORD *)(v30 + 40));
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = v31;
    }
    else
    {
      v34 = v28;
      v33 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = v34;
    }

  }
  return a2 == 16;
}

@end
