void *NAAP()
{
  Class v0;
  Class v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  size_t v17;
  size_t v18;
  int v19;
  void *v20;
  uint64_t v21;
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
  int v33;
  Class v34;
  uint64_t v35;
  void *v36;

  v0 = NSClassFromString(CFSTR("NFSecureElement"));
  if (v0)
  {
    v1 = v0;
    if (off_255D65D18())
    {
      v2 = (void *)-[objc_class sharedHardwareManager](off_255D65D18(), "sharedHardwareManager");
      v3 = objc_msgSend(v2, "getHwSupport");
      if ((_DWORD)v3 == 2)
      {
LABEL_15:
        v15 = (void *)objc_msgSend((id)-[objc_class embeddedSecureElement](v1, "embeddedSecureElement"), "serialNumber");
        if (v15)
        {
          v16 = (void *)objc_msgSend(v15, "UTF8String");
          if (v16)
            goto LABEL_17;
          goto LABEL_45;
        }
        NSLog(CFSTR("Error: Failed to retrieve seid from cache."));
        return 0;
      }
      if ((_DWORD)v3 != 4)
      {
        NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 1, v3);
        usleep(0xF4240u);
        v4 = objc_msgSend(v2, "queryHardwareSupport:", 0);
        NSLog(CFSTR("Info: new state --> %d\n"), v4);
        if ((_DWORD)v4 == 2)
          goto LABEL_15;
        NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 2, v4);
        usleep(0xF4240u);
        v5 = objc_msgSend(v2, "queryHardwareSupport:", 0);
        NSLog(CFSTR("Info: new state --> %d\n"), v5);
        if ((_DWORD)v5 == 2)
          goto LABEL_15;
        NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 3, v5);
        usleep(0xF4240u);
        v6 = objc_msgSend(v2, "queryHardwareSupport:", 0);
        NSLog(CFSTR("Info: new state --> %d\n"), v6);
        if ((_DWORD)v6 == 2)
          goto LABEL_15;
        NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 4, v6);
        usleep(0xF4240u);
        v7 = objc_msgSend(v2, "queryHardwareSupport:", 0);
        NSLog(CFSTR("Info: new state --> %d\n"), v7);
        if ((_DWORD)v7 == 2)
          goto LABEL_15;
        NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 5, v7);
        usleep(0xF4240u);
        v8 = objc_msgSend(v2, "queryHardwareSupport:", 0);
        NSLog(CFSTR("Info: new state --> %d\n"), v8);
        if ((_DWORD)v8 == 2)
          goto LABEL_15;
        NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 6, v8);
        usleep(0xF4240u);
        v9 = objc_msgSend(v2, "queryHardwareSupport:", 0);
        NSLog(CFSTR("Info: new state --> %d\n"), v9);
        if ((_DWORD)v9 == 2)
          goto LABEL_15;
        NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 7, v9);
        usleep(0xF4240u);
        v10 = objc_msgSend(v2, "queryHardwareSupport:", 0);
        NSLog(CFSTR("Info: new state --> %d\n"), v10);
        if ((_DWORD)v10 == 2)
          goto LABEL_15;
        NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 8, v10);
        usleep(0xF4240u);
        v11 = objc_msgSend(v2, "queryHardwareSupport:", 0);
        NSLog(CFSTR("Info: new state --> %d\n"), v11);
        if ((_DWORD)v11 == 2)
          goto LABEL_15;
        NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 9, v11);
        usleep(0xF4240u);
        v12 = objc_msgSend(v2, "queryHardwareSupport:", 0);
        NSLog(CFSTR("Info: new state --> %d\n"), v12);
        if ((_DWORD)v12 == 2)
          goto LABEL_15;
        NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 10, v12);
        usleep(0xF4240u);
        v13 = objc_msgSend(v2, "queryHardwareSupport:", 0);
        v14 = v13;
        NSLog(CFSTR("Info: new state --> %d\n"), v13);
        if (v14 == 2)
          goto LABEL_15;
LABEL_51:
        NSLog(CFSTR("Error: Hardware still not in a valid state, bailing out\n"));
        return 0;
      }
LABEL_26:
      NSLog(CFSTR("Error: HWState returns UnSupported, bailing out\n"));
      return 0;
    }
LABEL_27:
    NSLog(CFSTR("Error: Can't get softlinked NFHM class\n"));
    return 0;
  }
  v16 = dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 1);
  if (!v16)
  {
    NSLog(CFSTR("Error: Failed to open NearField framework."));
    return v16;
  }
  if (!off_255D65D18())
    goto LABEL_27;
  v20 = (void *)-[objc_class sharedHardwareManager](off_255D65D18(), "sharedHardwareManager");
  v21 = objc_msgSend(v20, "getHwSupport");
  if ((_DWORD)v21 != 2)
  {
    if ((_DWORD)v21 == 4)
      goto LABEL_26;
    NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 1, v21);
    usleep(0xF4240u);
    v23 = objc_msgSend(v20, "queryHardwareSupport:", 0);
    NSLog(CFSTR("Info: new state --> %d\n"), v23);
    if ((_DWORD)v23 != 2)
    {
      NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 2, v23);
      usleep(0xF4240u);
      v24 = objc_msgSend(v20, "queryHardwareSupport:", 0);
      NSLog(CFSTR("Info: new state --> %d\n"), v24);
      if ((_DWORD)v24 != 2)
      {
        NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 3, v24);
        usleep(0xF4240u);
        v25 = objc_msgSend(v20, "queryHardwareSupport:", 0);
        NSLog(CFSTR("Info: new state --> %d\n"), v25);
        if ((_DWORD)v25 != 2)
        {
          NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 4, v25);
          usleep(0xF4240u);
          v26 = objc_msgSend(v20, "queryHardwareSupport:", 0);
          NSLog(CFSTR("Info: new state --> %d\n"), v26);
          if ((_DWORD)v26 != 2)
          {
            NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 5, v26);
            usleep(0xF4240u);
            v27 = objc_msgSend(v20, "queryHardwareSupport:", 0);
            NSLog(CFSTR("Info: new state --> %d\n"), v27);
            if ((_DWORD)v27 != 2)
            {
              NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 6, v27);
              usleep(0xF4240u);
              v28 = objc_msgSend(v20, "queryHardwareSupport:", 0);
              NSLog(CFSTR("Info: new state --> %d\n"), v28);
              if ((_DWORD)v28 != 2)
              {
                NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 7, v28);
                usleep(0xF4240u);
                v29 = objc_msgSend(v20, "queryHardwareSupport:", 0);
                NSLog(CFSTR("Info: new state --> %d\n"), v29);
                if ((_DWORD)v29 != 2)
                {
                  NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 8, v29);
                  usleep(0xF4240u);
                  v30 = objc_msgSend(v20, "queryHardwareSupport:", 0);
                  NSLog(CFSTR("Info: new state --> %d\n"), v30);
                  if ((_DWORD)v30 != 2)
                  {
                    NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 9, v30);
                    usleep(0xF4240u);
                    v31 = objc_msgSend(v20, "queryHardwareSupport:", 0);
                    NSLog(CFSTR("Info: new state --> %d\n"), v31);
                    if ((_DWORD)v31 != 2)
                    {
                      NSLog(CFSTR("Info: Attempt %d state %d is not yet ready, sleeping a bit\n"), 10, v31);
                      usleep(0xF4240u);
                      v32 = objc_msgSend(v20, "queryHardwareSupport:", 0);
                      v33 = v32;
                      NSLog(CFSTR("Info: new state --> %d\n"), v32);
                      if (v33 != 2)
                        goto LABEL_51;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v34 = NSClassFromString(CFSTR("NFSecureElement"));
  if (v34)
  {
    v35 = objc_msgSend((id)-[objc_class embeddedSecureElement](v34, "embeddedSecureElement"), "serialNumber");
    if (v35)
    {
      v36 = (void *)v35;
      dlclose(v16);
      v16 = (void *)objc_msgSend(v36, "UTF8String");
      if (v16)
      {
LABEL_17:
        v17 = strlen((const char *)v16);
        if (v17)
        {
          v18 = 0;
          v19 = 1;
          while (*((_BYTE *)v16 + v18) == 48)
          {
            v18 = v19++;
            if (v17 <= v18)
              goto LABEL_46;
          }
          return v16;
        }
        goto LABEL_46;
      }
LABEL_45:
      NSLog(CFSTR("Error: SEID UTF8String conversion is NULL."));
LABEL_46:
      NSLog(CFSTR("Error: SEID retrieved is all zeros."));
      return v16;
    }
    NSLog(CFSTR("Error: Failed to retrieve seid."));
  }
  else
  {
    NSLog(CFSTR("Error: Failed to find NFSecureElement class."));
  }
  dlclose(v16);
  return 0;
}

Class sub_22D1E8E5C()
{
  Class result;

  if (qword_255D66FB0 != -1)
    dispatch_once(&qword_255D66FB0, &unk_24F86A870);
  result = objc_getClass("NFHardwareManager");
  qword_255D66FA8 = (uint64_t)result;
  off_255D65D18 = sub_22D1E8EB8;
  return result;
}

uint64_t sub_22D1E8EB8()
{
  return qword_255D66FA8;
}

void *sub_22D1E8EC4()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 2);
  qword_255D66FA0 = (uint64_t)result;
  return result;
}

void vsPHbdGf()
{
  unint64_t v0;
  _BYTE v1[5456];
  uint64_t v2;

  MEMORY[0x24BDAC7A8]();
  v2 = *MEMORY[0x24BDAC8D0];
  v0 = (unint64_t)&v1[qword_255D66740 - qword_255D66750];
  qword_255D66750 = 1435369301 * v0 - 0x3FCCDB3BD4E106A1;
  qword_255D66740 = 1435369301 * (v0 ^ 0x3FCCDB3BD4E106A1);
  __asm { BR              X8 }
}

#error "22D1E92FC: call analysis failed (funcsize=131)"

uint64_t sub_22D1E9300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  LODWORD(STACK[0x25C]) = a7;
  *(_QWORD *)(a3 + 368) = 0x4666B108DF6E01D7;
  LODWORD(STACK[0x408]) = dword_255D666E8 - 266572532;
  v11 = dword_255D66728;
  v9[12] = *(_QWORD *)(a1 + 8 * (v7 + 1771230046));
  LODWORD(STACK[0x5D0]) = v7 + 1621942387;
  LODWORD(STACK[0x5E0]) = 0;
  v9[14] = v11;
  LODWORD(STACK[0x5E4]) = (v7 + 1621942387) & 0xF79F7D90;
  LODWORD(STACK[0x5E8]) = v7 + 1621942417;
  v9[17] = a2;
  *(_QWORD *)(a3 + 448) = &STACK[0x5C8];
  *(_DWORD *)(v10 - 192) = 1431737413 * ((((2 * v8) | 0xE8EB0088) - v8 - 1953857604) ^ 0xCA2B1F56) + 40706419 + v7;
  sub_22D219DEC(v10 - 200);
  return ((uint64_t (*)(void))qword_24F86A890[*(int *)(v10 - 188)])();
}

uint64_t sub_22D1E93F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43,uint64_t a44,uint64_t a45,uint64_t a46,size_t size)
{
  uint64_t v47;
  uint32_t v48;
  int v49;

  STACK[0x280] = (unint64_t)malloc_type_malloc(size, 0xC5732911uLL);
  v48 = arc4random();
  LODWORD(xmmword_255D65D28) = v48 + 257242056 - ((2 * v48) & 0x1EAA6790);
  v49 = ((1812433253 * (xmmword_255D65D28 ^ (xmmword_255D65D28 >> 30) ^ a43)) ^ 0x2EAFAFDB)
      + ((1477382858 * (xmmword_255D65D28 ^ (xmmword_255D65D28 >> 30) ^ a43)) & 0x5D5F5FB6);
  *(_DWORD *)(v47 + 4) = v49 - 2 * ((v49 + 1632653350) & 0xF5533CA ^ ((_BYTE)v49 - 106) & 2) - 526023698;
  return ((uint64_t (*)(void))sub_22D1E9500)();
}

void sub_22D1E9500()
{
  JUMPOUT(0x22D1E9490);
}

uint64_t sub_22D1E951C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  char v9;
  uint64_t v10;
  char v11;

  *(_BYTE *)(v10 + (a7 - 1306124919)) = (((v8 ^ a5) >> (v9 + 33))
                                                     - (((v8 ^ a5) >> (v9 + 33) << (((v7 + v11) & 0xAF ^ 0x6D)
                                                                                  + (v7 ^ 0x9D))) & 0x9A)
                                                     + 77) ^ 0x2E;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((824
                                          * (a7
                                           - ((((v8 ^ a5) >> (v9 + 33))
                                                              - (((v8 ^ a5) >> (v9 + 33) << (((v7 + v11) & 0xAF ^ 0x6D)
                                                                                           + (v7 ^ 0x9D))) & 0x9A)
                                                              + 77) != 0x2E) == a4)) ^ v7))
                            - 8))();
}

void sub_22D1EA464()
{
  JUMPOUT(0x22D1E92C4);
}

uint64_t sub_22D1EA46C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  unint64_t v9;

  v6 = 19 * ((v4 + 23) ^ 0x966D2D4B);
  v7 = v3 - 1771229877;
  v8 = *(_QWORD *)(a1 + 8 * (v3 - 1771229676));
  v9 = 591644117
     * ((((v5 - 200) | 0xB2C8AEF4238A5EE6) - (v5 - 200) + ((v5 - 200) & 0x4D37510BDC75A118)) ^ 0x56D38E3DB88F14A1);
  LODWORD(STACK[0x26C]) = -1771229877;
  *(_DWORD *)(v5 - 176) = 1601233193 - v9;
  *(_QWORD *)(a3 + 464) = &unk_255D66738;
  *(_QWORD *)(a3 + 448) = v8 - v9;
  sub_22D227BBC(v5 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[((*(_DWORD *)(v5 - 192) != 0) * (v6 ^ 0x31C)) ^ (v7 + 780)] - 8))();
}

uint64_t sub_22D1EA5FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  unint64_t *v7;

  v6 = ((v5 - 671) ^ 0xFFFFFFFF8D504A16) + a1;
  v7 = &STACK[0x2270] + 3 * (v6 ^ 0x25F75FB7D773DE7DLL) + 3 * ((2 * v6) & 0x4BEEBF6FAEE7BCFALL) + 0xE19E0D879A46489;
  *(_DWORD *)v7 = v4 + 74;
  *(&STACK[0x2270] + 3 * v6 + 1) = 0;
  *((_DWORD *)v7 + 4) = v2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((1994 * (a1 + 1 == v3 + 12)) ^ v5)) - 8))();
}

uint64_t sub_22D1EA69C()
{
  unint64_t v0;
  uint64_t v1;
  int v2;
  char *v3;
  unint64_t v4;
  CFStringEncoding SystemEncoding;
  _BOOL4 v6;

  LODWORD(STACK[0x25C]) = v2;
  *(_QWORD *)(v1 + 40) = 0x5A72C1CEA1245FC3;
  LODWORD(STACK[0x368]) = 417814468;
  v3 = off_255D65D20;
  LOBYTE(STACK[0x196A]) = *off_255D65D20 - 70;
  LOBYTE(STACK[0x196B]) = v3[1] - 70;
  LOBYTE(STACK[0x196C]) = v3[2] - 70;
  LOBYTE(STACK[0x196D]) = v3[3] - 70;
  LOBYTE(STACK[0x196E]) = v3[4] - 70;
  LOBYTE(STACK[0x196F]) = ((v0 - 108) | 0x4B) + v3[5] + 111;
  LOBYTE(STACK[0x1970]) = v3[6] - 70;
  LOBYTE(STACK[0x1971]) = v3[7] + ((v0 + 106) ^ 0x6C);
  LOBYTE(STACK[0x1972]) = v3[8] - 70;
  LOBYTE(STACK[0x1973]) = v3[9] - 70;
  LOBYTE(STACK[0x1974]) = v3[10] - 70;
  LOBYTE(STACK[0x1975]) = v3[11] - 70;
  LOBYTE(STACK[0x1976]) = v3[12] - 70;
  LOBYTE(STACK[0x1977]) = v3[13] - 70;
  LOBYTE(STACK[0x1978]) = v3[14] - 70;
  LOBYTE(STACK[0x1979]) = v3[15] - 70;
  LOBYTE(STACK[0x197A]) = v3[16] - 70;
  LOBYTE(STACK[0x197B]) = v3[17] - 70;
  LOBYTE(STACK[0x197C]) = v3[18] - 70;
  LOBYTE(STACK[0x197D]) = v3[19] - 70;
  LOBYTE(STACK[0x197E]) = v3[20] - 70;
  LOBYTE(STACK[0x197F]) = v3[21] - 70;
  LOBYTE(STACK[0x1980]) = off_255D65D20[22] - 70;
  v4 = v0;
  SystemEncoding = CFStringGetSystemEncoding();
  v6 = CFStringCreateWithCString(0, (const char *)&STACK[0x196A], SystemEncoding) != 0;
  STACK[0x260] = v4;
  return ((uint64_t (*)(void))(qword_24F86A890[(int)((801 * v6) ^ v4)] - 8))();
}

uint64_t sub_22D1EA864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v30 = MGCopyAnswer();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_24F86A890[(14 * (v30 == 0)) ^ v29 & 0x4CB4DFFu] - (((v29 & 0x4CB4DFFu) - 1771231115) ^ 0x966D2D47)))(v30, v31, v32, v33, v34, v35, v36, v37, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_22D1EA8C8()
{
  int v0;
  const void *v1;
  uint64_t v2;

  CFRelease(v1);
  STACK[0x23F8] = qword_24F86A890[v0 + 1771230075]
                - 591644117
                * ((((2 * (v2 - 200)) | 0x8477F5200305A3F4) - (v2 - 200) + 0x3DC4056FFE7D2E06) ^ 0x2620DA599A879BBDLL);
  *(_DWORD *)(v2 - 176) = -922504226
                        - 591644117 * ((((2 * (v2 - 200)) | 0x305A3F4) - (v2 - 200) - 25350650) ^ 0x9A879BBD)
                        + v0;
  STACK[0x2408] = (unint64_t)&unk_255D66738;
  sub_22D227BBC(v2 - 200);
  return sub_22D1F0DCC();
}

uint64_t sub_22D1F0DCC()
{
  uint64_t v0;

  return v0;
}

void sub_22D1F0E20()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;

  v3 = v1[24];
  v2 = v1[25];
  v4 = v1[23];
  v1[26] = v2;
  v1[27] = v3;
  v1[28] = v4;
  LODWORD(v4) = STACK[0x61C];
  LODWORD(STACK[0x650]) = STACK[0x61C];
  LODWORD(STACK[0x654]) = v4 - 571;
  v5 = v3 + *(_QWORD *)(v0 + 1) - 0x26EE77AE983BDBA5;
  v6 = -711945521 * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ v5) & 0x7FFFFFFF);
  v7 = (v6 ^ HIWORD(v6)) * ((_DWORD)v4 - 711946128);
  LOBYTE(STACK[0x61B]) = byte_22D250CE0[v7 >> 24] ^ *(_BYTE *)(v2 + STACK[0x18F8] - 0x28C607C2CC7E7287) ^ byte_22D2508C0[(v7 >> 24) + 2] ^ byte_22D24A5A0[v7 >> 24] ^ v7 ^ (23 * (((v6 ^ HIWORD(v6)) * ((_DWORD)v4 - 711946128)) >> 24));
  v1[21] = v5;
  JUMPOUT(0x22D2128A0);
}

uint64_t sub_22D1F0F18()
{
  _QWORD *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = v0[28];
  v2 = (55 * ((unint64_t)(v1 - 0x58CB08424C0CECA7) > 7)) ^ LODWORD(STACK[0x650]);
  LODWORD(STACK[0x61C]) = STACK[0x650];
  v3 = v0[27] + 1;
  v4 = v0[26] + 1;
  v5 = (uint64_t (*)(void))(qword_24F86A890[v2] - 8);
  v0[23] = v1 + 1;
  v0[24] = v3;
  v0[25] = v4;
  return v5();
}

uint64_t sub_22D1F0F94()
{
  int v0;
  _BYTE *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  int v8;
  uint64_t (*v9)(void);

  v3 = v2[35] + 1;
  v4 = v2[34] + 1;
  v5 = v2[36];
  v6 = v5 + 1;
  v5 -= 0x4999E8FBEE168FD0;
  v7 = *v1 ^ (v5 < 0x27B6328E);
  v8 = v5 < v2[517];
  if ((v7 & 1) != 0)
    v8 = *v1;
  v9 = (uint64_t (*)(void))(qword_24F86A890[(490 * (v0 & ~v8)) ^ LODWORD(STACK[0x694])] - 4);
  LODWORD(STACK[0x65C]) = STACK[0x694];
  v2[31] = v6;
  v2[32] = v3;
  v2[33] = v4;
  LODWORD(STACK[0x818]) = STACK[0x698];
  return v9();
}

void sub_22D1F1024()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  unsigned int v3;
  unint64_t v4;

  v2 = LODWORD(STACK[0x818]) + 537958800;
  LODWORD(STACK[0x81C]) = v2;
  v3 = -711945521
     * ((v2 + 2147483615) & (*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ (*(_DWORD *)(v1 + 3440)
                                                                                            + *(_DWORD *)(v0 + 97)
                                                                                            + 1354827265)));
  v4 = -711945521 * (v3 ^ HIWORD(v3));
  LOBYTE(STACK[0x61B]) = byte_22D24A6A0[(v4 >> 24) + 3] ^ byte_22D249F90[v4 >> 24] ^ byte_22D24B8E0[(v4 >> 24) + 2] ^ v4 ^ (-39 * BYTE3(v4));
  JUMPOUT(0x22D21289CLL);
}

uint64_t sub_22D1F2408()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  CFTypeID v3;
  uint64_t v4;
  uint64_t v5;
  CFTypeID TypeID;

  v3 = CFGetTypeID(*(CFTypeRef *)(v1 + 153));
  v4 = (3 * (v0 ^ 0x36F) - 0x42027F0142808BCELL) ^ v3;
  v5 = (v3 << ((124 * (v0 ^ 0x28)) ^ 0xF1)) & 0x7BFB01FD7AFEE9F6;
  TypeID = CFDataGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((135
                                          * ((TypeID ^ 0x9010034004003322)
                                           - ((2 * TypeID) & 0xDFDFF97FF7FF99BALL)
                                           + v4
                                           + v5 != 0x4E0D843EC17FA81DLL)) ^ v0))
                            - 8))();
}

uint64_t sub_22D1F24CC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  CFTypeID v3;
  unint64_t v4;
  uint64_t v5;
  CFTypeID TypeID;

  v3 = CFGetTypeID(*(CFTypeRef *)(v1 + 153));
  v4 = v3 ^ 0xBCF7BCFCAE7F77FFLL;
  v5 = (2 * v3) & 0x79EF79F95CFEEFFELL;
  TypeID = CFNumberGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((v4
                                          + v5
                                          + (TypeID ^ 0x402816540110E8)
                                          + ((v0 - 1400833521) & 0x537F05B7)
                                          - ((TypeID << ((v0 - 55) & 0x47)) & 0xFF7FAFD357FDDE2ELL) == 0xBD37E51302808A9ELL) | v0))
                            - 12))();
}

uint64_t sub_22D1F25A8()
{
  unsigned int v0;
  uint64_t v1;
  Boolean Value;

  Value = CFNumberGetValue(*(CFNumberRef *)(v1 + 153), kCFNumberSInt64Type, &STACK[0x2F0]);
  return ((uint64_t (*)(void))(qword_24F86A890[(71 * ((((2 * Value) & 0xF7) + (Value ^ 0xFB)) == 251)) ^ v0]
                            - (4 * (v0 ^ 0x18A)
                             + 13)
                            + 245))();
}

uint64_t sub_22D1F2608()
{
  int v0;
  uint64_t v1;
  void *v2;

  LODWORD(STACK[0x2D4]) = -1084420343;
  v2 = malloc_type_malloc(8uLL, 0xD29E14C9uLL);
  *(_QWORD *)(v1 + 96) = v2;
  return ((uint64_t (*)(void))qword_24F86A890[((v2 != 0)
                                            * (((v0 - 1401651521) & 0x538B814D ^ 0xFFFFFF4C) + (v0 ^ 0x39B))) ^ v0])();
}

uint64_t sub_22D1F267C()
{
  int v0;
  uint64_t v1;
  _QWORD *v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t (*v5)(void);

  v3 = *(_BYTE **)(v1 + 96);
  *v3 = (HIBYTE(STACK[0x2F0]) - ((STACK[0x2F0] >> 55) & 0x28) - 108) ^ 0x94;
  v3[1] = ((STACK[0x2F0] >> (v0 - 63))
         - ((2 * (STACK[0x2F0] >> (v0 - 63))) & 0x68)
         - 76) ^ 0xB4;
  v3[2] = (((unsigned __int16)WORD2(STACK[0x2F0]) >> 8) - ((STACK[0x2F0] >> 39) & 0x3E) - 97) ^ 0x9F;
  v3[3] = (HIDWORD(STACK[0x2F0]) - ((STACK[0x2F0] >> 31) & 0xEE) - 9) ^ 0xF7;
  v3[4] = (HIBYTE(LODWORD(STACK[0x2F0])) - ((LODWORD(STACK[0x2F0]) >> 23) & 0xC6) - 29) ^ 0xE3;
  v3[5] = (HIWORD(LODWORD(STACK[0x2F0])) - ((LODWORD(STACK[0x2F0]) >> 15) & 0xFA) - 3) ^ 0xFD;
  v3[6] = (BYTE1(LODWORD(STACK[0x2F0])) - ((LODWORD(STACK[0x2F0]) >> 7) & 0xB6) + 91) ^ 0x5B;
  v3[7] = (LOBYTE(STACK[0x2F0]) - ((2 * LOBYTE(STACK[0x2F0])) & 8) - 124) ^ 0x84;
  v4 = sub_22D22F638(8, 0x32u, -1324549896);
  *(_QWORD *)(v1 + 40) = v4;
  v5 = (uint64_t (*)(void))(qword_24F86A890[(195 * (v4 == 0)) ^ v0] - 4);
  LODWORD(STACK[0x69C]) = v0;
  v2[39] = 0x2746CB951783EFDCLL;
  v2[40] = 0x64CE834E4EB43C9ELL;
  v2[41] = 0x83E4A4E019E4738;
  return v5();
}

uint64_t sub_22D1F2824(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  unint64_t v5;
  _BOOL4 v6;
  uint64_t (*v7)(unint64_t);

  v4 = (v3 - 2077495591) & 0x7BD413F5;
  LODWORD(STACK[0x4C4]) = v2;
  STACK[0x210] = STACK[0x16C8];
  v5 = STACK[0x1700];
  v6 = ((v4 - 2107309453) | 0x14082808) != -1771229869;
  v7 = *(uint64_t (**)(unint64_t))(a2 + 8 * ((4 * v6) | (8 * v6) | v4));
  STACK[0x240] = STACK[0x1700];
  return v7(v5);
}

uint64_t sub_22D1F2880()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  CFIndex Length;
  int v4;
  void *v5;

  Length = CFDataGetLength(*(CFDataRef *)(v1 + 153));
  v4 = Length - ((Length << ((v0 - 80) & 0x87)) & 0x67C6F84C) - 1276937178;
  LODWORD(STACK[0x18A4]) = v4 ^ 0xCBE7327;
  LODWORD(STACK[0x2D4]) = v4 ^ 0xCBE7327;
  v5 = malloc_type_malloc(v4 ^ 0xB3E37C26, 0x8DF370BBuLL);
  STACK[0x18A8] = (unint64_t)v5;
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(((v5 == 0) * (((v0 + 339999268) & 0xEBBC05FE) - 175)) ^ v0)))();
}

uint64_t sub_22D1F293C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  CFRange v8;

  v5 = (_QWORD *)(v3[420] + v3[419] - 0x7F86AFCB40856E2);
  v8.length = (v1 ^ 0x3D3FE2BBEFFFBFBBLL) - 0x3D3FE2BBEFFFBFBBLL + ((v1 << ((v0 + 58) ^ 0x27u)) & 0x1DFFF7F76);
  *v5 = 0;
  v5[1] = v8.length;
  v8.location = 0;
  CFDataGetBytes(*(CFDataRef *)(v2 + 153), v8, *(UInt8 **)(v4 + 520));
  v6 = sub_22D22F638(v1, 0x32u, 2049918501);
  v3[452] = v6;
  return ((uint64_t (*)(void))(qword_24F86A890[(21 * (v6 != 0)) ^ v0] - 12))();
}

uint64_t sub_22D1F2A04(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t (*v8)(void);

  v7 = (v4 ^ 0x3DFE5FFF7FFF37FFLL) - 0x3DFE5FFEE9F01036 + (v2 & 0xFFFE6FFE);
  *(_QWORD *)(v6 + 296) = v7;
  *(_BYTE *)(v6 + 311) = v7 < 0x960F27C9;
  v8 = (uint64_t (*)(void))(*(_QWORD *)(a2
                                     + 8
                                     * ((22 * (((19 * (v3 ^ 0xEE) + 1) ^ (v7 == 2517575625)) & 1)) ^ v3))
                         - 12);
  LODWORD(STACK[0x964]) = v3;
  v5[128] = 0x97D3CB912C51DBLL;
  v5[129] = 0x3CCAC7EAD325308FLL;
  v5[130] = 0x32F37C80C25F3A11;
  return v8();
}

uint64_t sub_22D1F2AD0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  __int16 v5;

  LODWORD(STACK[0x4B4]) = v2;
  v5 = LOWORD(STACK[0x18A4]) ^ (((v3 - 17706) & 0x47D3) - 29855);
  STACK[0x210] = *(_QWORD *)(v4 + 3616);
  return (*(uint64_t (**)(void))(a2
                              + 8
                              * (int)((467
                                     * ((unsigned __int16)(v5 ^ (((((v3 - 17706) & 0x47D3) + 8505) | 0x942) + 21477)) > 1u)) ^ (v3 + 1305131734) & 0xB23547D3)))();
}

void sub_22D1F2B18()
{
  uint64_t v0;
  uint64_t v1;

  CFRelease(*(CFTypeRef *)(v0 + 153));
  CFRelease(*(CFTypeRef *)(v1 + 3784));
  JUMPOUT(0x22D1F091CLL);
}

uint64_t sub_22D1F2B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  STACK[0x19B0] = 0xF0ACA68A69A41655;
  LODWORD(STACK[0x534]) = dword_255D666E8 - 266572532;
  v9 = *(unsigned int *)(v6 + 1832);
  v7[12] = *(_QWORD *)(a2 + 8 * (v5 + 1771230046));
  LODWORD(STACK[0x5D0]) = v5 - 453033923;
  LODWORD(STACK[0x5E0]) = 0;
  v7[14] = 1416753466;
  LODWORD(STACK[0x5E4]) = (v5 - 453033923) ^ 0xB;
  LODWORD(STACK[0x5E8]) = (v5 - 453033923) ^ 0xB9;
  v7[17] = v9;
  *(_QWORD *)(a5 + 448) = &STACK[0x5C8];
  *(_DWORD *)(v8 - 192) = 1431737413 * ((v8 - 200) ^ 0xBE5E9F12) + 40706419 + v5;
  sub_22D219DEC(v8 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v8 - 188)] - 12))();
}

uint64_t sub_22D1F2C2C()
{
  int v0;
  int v1;
  int v2;
  uint32_t v3;

  v2 = v1 + v0 + 314;
  STACK[0x2A0] = (unint64_t)malloc_type_malloc(STACK[0x230], 0xC5732911uLL);
  v3 = arc4random();
  LODWORD(xmmword_255D65D28) = v3 + 257242056 - ((2 * v3) & 0x1EAA6790);
  DWORD1(xmmword_255D65D28) = ((1812433253 * (xmmword_255D65D28 ^ 0xF5533C8 ^ (xmmword_255D65D28 >> 30))) ^ 0x7BFECE87)
                            + ((-670100790 * (xmmword_255D65D28 ^ 0xF5533C8 ^ (xmmword_255D65D28 >> 30))) & 0xF7FD9D0E)
                            - 1823054526
                            - ((((((1812433253
                                  * (xmmword_255D65D28 ^ 0xF5533C8 ^ (xmmword_255D65D28 >> 30))) ^ 0x7BFECE87)
                                + ((-670100790
                                  * (xmmword_255D65D28 ^ 0xF5533C8 ^ (xmmword_255D65D28 >> 30))) & 0xF7FD9D0E)
                                + 761816152) << ((v2 - 8) ^ 0x30))
                              + 221354564) & 0x1EAA6790);
  return ((uint64_t (*)(void))(qword_24F86A890[v2] - 4))();
}

void sub_22D1F2D68()
{
  JUMPOUT(0x22D1F2CF4);
}

void sub_22D1F2D84()
{
  JUMPOUT(0x22D1F2D9CLL);
}

uint64_t sub_22D1F2F7C@<X0>(int a1@<W2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, int a6@<W7>, int a7@<W8>)
{
  int v7;
  uint64_t v8;
  int v9;
  unsigned int *v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  char v15;
  unsigned int v16;

  v10 = (unsigned int *)(a3 + 4 * (v8 + a4));
  v11 = (a1 + (a7 ^ 0xEB) - 801) & v7;
  v12 = v8 + 1;
  v13 = *(_DWORD *)(a3 + 4 * (v12 + a4));
  v14 = (v13 & 0x7F58F876 ^ 0x6508E035 | v13 & 0xA70788) - 1;
  v15 = v14 ^ 0xF6;
  v16 = ((v14 & v9 ^ 0x85A00400) + (v14 ^ 0x6A5DFBF6) - ((v14 ^ 0x6A5DFBF6) & v9)) ^ 0x85F5D67A;
  *v10 = v10[397] ^ *((_DWORD *)&STACK[0x19B0] + (v13 & 1)) ^ (((v16 | v11) + a6 - 2 * (v16 & (a6 + 4) ^ v15 & 4)) >> 1) ^ 0x4130CCB4;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((1809 * (v12 == a5 + 3)) ^ a7)) - 8))();
}

uint64_t sub_22D1F3070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int v5;
  int8x16_t v6;
  int v7;
  const float *v8;
  int8x16_t v9;
  int8x16_t v10;
  int32x4_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int8x16_t v18;

  v7 = (v5 - 914634812) & 0x368437EF;
  v8 = (const float *)&dword_255D660B4;
  v9 = (int8x16_t)vld1q_dup_f32(v8);
  v10.i64[0] = 0x8000000080000000;
  v10.i64[1] = 0x8000000080000000;
  v11 = vdupq_n_s32(0x44B5852Du);
  v6.i64[0] = *(_QWORD *)&dword_255D660B8;
  v6.i32[2] = dword_255D660C0;
  v12 = vextq_s8(v9, v6, 0xCuLL);
  v13 = v6;
  v13.i32[3] = dword_255D660C4;
  v14 = (int8x16_t)vaddq_s32((int32x4_t)veorq_s8((int8x16_t)vaddq_s32((int32x4_t)vorrq_s8(v12, v10), vdupq_n_s32(0xD86F3495)), (int8x16_t)vdupq_n_s32(0xA9D4675B)), vdupq_n_s32(0xEFCACB03));
  v15 = veorq_s8(vandq_s8(v13, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x572257B8u));
  v16 = (int32x4_t)veorq_s8((int8x16_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8(v15, (int8x16_t)vdupq_n_s32(0xBB4A7AD2)), (int32x4_t)vorrq_s8(v15, (int8x16_t)v11)), v11), (int8x16_t)vdupq_n_s32(0xF3187AE2));
  v17 = (int32x4_t)vorrq_s8(veorq_s8((int8x16_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8((int8x16_t)vaddq_s32(v16, v16), (int8x16_t)vdupq_n_s32(0xC99B9A1E)), v16), vdupq_n_s32(0x1B3232F1u)), (int8x16_t)vdupq_n_s32(0xF4E8A94F)), veorq_s8(v14, (int8x16_t)vdupq_n_s32(0xE1861ED2)));
  v18.i32[0] = *(_DWORD *)(v4 + 4 * (dword_255D660B8 & 1));
  v18.i32[1] = *(_DWORD *)(v4 + 4 * (unk_255D660BC & (23 * (v7 ^ 0x2FFu) - 574)));
  v18.i32[2] = *(_DWORD *)(v4 + 4 * (dword_255D660C0 & 1));
  v18.i32[3] = *(_DWORD *)(v4 + 4 * (dword_255D660C4 & 1));
  *(int8x16_t *)&dword_255D660B4 = veorq_s8(veorq_s8(veorq_s8((int8x16_t)xmmword_255D65D28, v18), (int8x16_t)vdupq_n_s32(0x32CFDACBu)), (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vsubq_s32(v17, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v17, v17), (int8x16_t)vdupq_n_s32(0x6DAF327Au))), vdupq_n_s32(0xB6D7993D)), 1uLL));
  return (*(uint64_t (**)(void))(a4 + 8 * (v7 ^ 0x1D4u)))();
}

void sub_22D1F3244()
{
  JUMPOUT(0x22D1F3168);
}

uint64_t sub_22D1F3250@<X0>(uint64_t a1@<X3>, _DWORD *a2@<X4>, int a3@<W8>)
{
  unsigned int v3;

  v3 = ((2 * (*a2 & 0x7FFFFFFE ^ 0x4A4C358D)) | 0x80350DD0) - (*a2 & 0x7FFFFFFE ^ 0x4A4C358D);
  a2[623] = a2[396] ^ *((_DWORD *)&STACK[0x19B0] + (*a2 & 1)) ^ ((((v3 + 1072003352) ^ 0x850380AD | ((((a3 - 697324612) & 0xBFFD7F4F ^ 0x166D2D4B) & a2[623]) - 625721993) ^ 0xDAB43D76)
                                                                  - 1642239369
                                                                  - 2
                                                                  * (((v3 + 1072003352) ^ 0x850380AD) & 0x1E1D7556 ^ v3 & 2)
                                                                  + 2781) >> 1) ^ 0x26AAACFF;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((1712 * (LODWORD(STACK[0x534]) > 0x26F)) ^ a3)) - 12))();
}

uint64_t sub_22D1F3354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  LODWORD(STACK[0x534]) = 0;
  v9 = LODWORD(STACK[0x534])++;
  dword_255D666E8 = v9 + 266572533;
  v10 = (*(_DWORD *)(v5 + 1832) - 310784975);
  v7[12] = *(_QWORD *)(a4 + 8 * (v4 + 1771230040));
  v7[14] = 1105968491;
  LODWORD(STACK[0x5D0]) = 1;
  LODWORD(STACK[0x5E0]) = (v4 - 1766677867) ^ 0x2A;
  LODWORD(STACK[0x5E4]) = v4 - 1766677867;
  LODWORD(STACK[0x5E8]) = v4 - 1766677945;
  v7[17] = v10;
  *(_QWORD *)(v6 + 448) = &STACK[0x5C8];
  *(_DWORD *)(v8 - 192) = 1431737413 * ((~((v8 - 200) | 0x21A38559) + ((v8 - 200) & 0x21A38559)) ^ 0x6002E5B4)
                        + 40706419
                        + v4;
  sub_22D219DEC(v8 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v8 - 188)] - 12))();
}

uint64_t sub_22D1F359C(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;

  if (v3 >= v4)
    v8 = dword_255D66728 + 1;
  else
    v8 = 1416753466;
  dword_255D66728 = v8;
  v9 = v2 ^ (v2 >> 11);
  v10 = (((v9 << 7) ^ 0xAA6CB700) - ((2 * ((v9 << 7) ^ 0xAA6CB700)) & 0xF938500) + 130663077) & 0x9D2C5680 ^ 0x85400;
  v11 = ((((v10 | 0x4B2BA0E5) - (v10 | 0xB4D45F1A) - 1261150438) & 0x6245D405 ^ 0x20444000)
       + (((v10 | 0x4B2BA0E5) - (v10 | 0xB4D45F1A) - 1261150438) & 0x9DBA22E0 ^ 0xD2A2071)
       - 1) ^ v9;
  v12 = ((v11 << 15) ^ 0x87BD8000) - ((2 * ((v11 << 15) ^ 0x87BD8000)) & 0x8D490000) - 962269487;
  v13 = ((v12 & 0xEFC60000 ^ 0x26C00000)
       + (v12 & 0x40440000 ^ 0x501C4556)
       - ((v12 & 0xEFC60000 ^ 0x26C00000) & 0x40440000)) & 0xFFFE0000 ^ v11;
  *(_BYTE *)(v5 + (v7 - 1969214754)) = ((v13 ^ (v13 >> 18) ^ 0x79)
                                                    + 89
                                                    - ((2 * (v13 ^ (v13 >> 18) ^ 0x79)) & 0xA2)
                                                    - 8) ^ 0x1F;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a2
                                                      + 8
                                                      * ((1495
                                                        * (v7
                                                         - (((v13 ^ (v13 >> 18) ^ 0x79)
                                                                            + 89
                                                                            - ((2 * (v13 ^ (v13 >> 18) ^ 0x79)) & 0xA2)
                                                                            - 8) != 0x1F) == v6)) ^ 0x176))
                                          - 4))(3183507338);
}

void sub_22D1F372C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unint64_t v5;

  v2 = v0[56];
  v1 = v0[57];
  v3 = v0[55];
  v0[58] = v1;
  v0[59] = v2;
  v0[60] = v3;
  LODWORD(v3) = STACK[0x71C];
  LODWORD(STACK[0x750]) = STACK[0x71C];
  LODWORD(STACK[0x754]) = v3 + 33;
  v4 = -711945521
     * (((v3 + 33) ^ 0x7FFFFFD6) & (*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ (v2 + LODWORD(STACK[0x1720]) - 1723025465)));
  v5 = -711945521 * (v4 ^ HIWORD(v4));
  LOBYTE(STACK[0x61B]) = byte_22D249F90[v5 >> 24] ^ *(_BYTE *)(v1 + v0[435] - 0x471A5DFBE961F289) ^ byte_22D24A6A0[(v5 >> 24) + 3] ^ byte_22D24B8E0[(v5 >> 24) + 2] ^ v5 ^ (-39 * BYTE3(v5));
  JUMPOUT(0x22D1F0F88);
}

uint64_t sub_22D1F3834()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = v0[60];
  v2 = v0[59] + 1;
  v3 = v0[58] + 1;
  v4 = (uint64_t (*)(void))qword_24F86A890[(int)(LODWORD(STACK[0x750]) ^ 0xF4 ^ (391
                                                                              * (((v1
                                                                                 - 0x7E82A67FC906F95ALL
                                                                                 - LODWORD(STACK[0x750])) & (unint64_t)~(v1 - 0x7E82A67FC906F95ALL)) >> 63)))];
  LODWORD(STACK[0x71C]) = STACK[0x750];
  v0[55] = v1 + 1;
  v0[56] = v2;
  v0[57] = v3;
  return v4();
}

uint64_t sub_22D1F38A4@<X0>(int a1@<W0>, uint64_t a2@<X1>, unint64_t a3@<X4>, int a4@<W8>)
{
  int v4;
  int v5;
  int v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (((v4 != a1) * (a4 ^ (v6 - 186) ^ (v6 + 24))) ^ a4))
                            - ((a4 - v5 - 801) ^ a3)))();
}

uint64_t sub_22D1F38DC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, char a6, char a7, char a8)
{
  int v8;
  int v9;
  char v10;
  int v11;
  int v12;
  char v13;
  int v14;
  uint64_t v15;
  int v16;
  unsigned int v17;

  v17 = (v9 ^ a4) >> (v10 + (((v11 + v8 - 31) | a6) ^ a7));
  LOBYTE(v17) = (v17 - (a8 & (2 * v17)) - 33) ^ v13;
  *(_BYTE *)(v15 + v14 + v11 + ((v11 + v8 + 583) | 0x46u)) = v17;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * (v8 ^ v12 ^ ((((v14 - (v17 != 0) - v8) | (v8 - (v14 - (v17 != 0)))) >= 0)
                                                     * v16)))
                            - 4))();
}

uint64_t sub_22D1F4AF8@<X0>(int a1@<W0>, uint64_t a2@<X1>, unint64_t a3@<X4>, int a4@<W8>)
{
  return sub_22D1F38A4(a1, a2, a3, a4);
}

uint64_t sub_22D1F4B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t (*a23)(uint64_t),uint64_t a24)
{
  unint64_t v24;

  STACK[0x4F0] = v24;
  STACK[0x3E0] = STACK[0x2A0];
  return a23(a24);
}

uint64_t sub_22D1F4B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v8 = v7[66];
  v7[67] = v8;
  v9 = STACK[0x774];
  LODWORD(STACK[0x788]) = STACK[0x774];
  LODWORD(STACK[0x78C]) = v9 ^ 0x2A8;
  LODWORD(STACK[0x790]) = v6 + (v9 ^ 0x2A8) - 346;
  v8 -= 649823929;
  LOBYTE(STACK[0x797]) = *(_BYTE *)(v7[448] + v8);
  v10 = **(_QWORD **)(v5 + 280) + v8;
  v7[70] = v10;
  v7[64] = v10;
  v7[62] = *(_QWORD *)(a5 + 8 * (v9 + 295));
  v11 = ((v7[64] - qword_255D671D0) & 0xFFFFFFFFFFFFFFF0) + qword_255D671C8;
  v12 = (*(uint64_t (**)(_QWORD, unint64_t *, uint64_t))(qword_255D671E8
                                                                       + 32 * *(unsigned __int8 *)(v11 + 8)
                                                                       + 8))(*(_QWORD *)v11, &STACK[0x7A3], 1);
  LOBYTE(STACK[0x767]) = STACK[0x7A3];
  return ((uint64_t (*)(uint64_t))v7[62])(v12);
}

uint64_t sub_22D1F4B7C()
{
  unsigned int v0;
  unint64_t v1;

  v0 = -711945521
     * ((LODWORD(STACK[0x790]) ^ 0xE992D2B4) & (*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x7140FF14)) ^ LODWORD(STACK[0x798])));
  v1 = -711945521 * (v0 ^ HIWORD(v0));
  return ((uint64_t (*)(void))(qword_24F86A890[(2032
                                             * ((LOBYTE(STACK[0x797]) - 60) == (byte_22D24F1B0[v1 >> 24] ^ LOBYTE(STACK[0x767]) ^ byte_22D24A490[v1 >> 24] ^ byte_22D24D990[v1 >> 24] ^ v1 ^ (-61 * BYTE3(v1))))) ^ LODWORD(STACK[0x788])]
                            - 12))();
}

uint64_t sub_22D1F4C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t (*v8)(void);

  v6 = LODWORD(STACK[0x78C]) - 425044320;
  v7 = *(_QWORD *)(v5 + 536) + 1;
  v8 = (uint64_t (*)(void))(*(_QWORD *)(a5
                                     + 8
                                     * ((873
                                       * (((*(_QWORD *)(v5 + 536) == 649823941) ^ ((LODWORD(STACK[0x78C]) ^ 0x11) + v6)) & 1)) ^ LODWORD(STACK[0x78C])))
                         - 4);
  LODWORD(STACK[0x774]) = v6 & 0x1955ABF7;
  *(_QWORD *)(v5 + 528) = v7;
  return v8();
}

uint64_t sub_22D1F4CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(a5
                                        + 8
                                        * (int)((((((v5 ^ (v6 + 440)) + 55932261) & 0xFCAA8AD3) - 614)
                                               * (*(_QWORD *)STACK[0x17B8] == 0)) ^ v5 ^ (v6 + 440)))
                            - 4))();
}

uint64_t sub_22D1F4D48(unint64_t a1)
{
  char v1;
  int v2;
  uint64_t v3;
  unint64_t v4;

  v4 = sub_22D22F914(a1);
  STACK[0x3C0] = *(_QWORD *)(v3 + 3576);
  return ((uint64_t (*)(unint64_t))(2523737415
                                                   - ((v2 + 36438471) | 0x94412903)
                                                   + qword_24F86A890[((v2 - 600) * ((v1 & 1) == 0)) ^ v2]
                                                   - 4))(v4);
}

uint64_t sub_22D1F4DB0@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  char v2;
  char v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((((v2 + v3 + a2 - 75 + 116) > 5u)
                                          * ((10 * (a2 ^ 0x36E)) ^ 0x147)) ^ a2))
                            - 8))();
}

uint64_t sub_22D1F4DFC(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * ((107
                                          * ((*(char *)(*(_QWORD *)(v7 + 3320) + (v3 ^ v2)) - 48) < 0xA)) ^ (v5 + v6 + v4 - 370 + 1078)))
                            - 8))();
}

uint64_t sub_22D1F4E30(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * ((107
                                          * ((*(char *)(*(_QWORD *)(v6 + 3320) + (v3 ^ v2)) - 48) < 0xA)) ^ (v4 + v5 + 1078)))
                            - 8))();
}

uint64_t sub_22D1F4E44()
{
  int v0;
  uint64_t v1;
  unsigned int v2;
  unint64_t v3;
  uint64_t (*v4)(void);

  CFRelease(*(CFTypeRef *)(v1 + 3784));
  v2 = 2 * (v0 ^ 0x966D2D3A);
  v3 = sub_22D22F638(9, 0x32u, -833641632);
  *(_QWORD *)(v1 + 3688) = v3;
  v4 = (uint64_t (*)(void))qword_24F86A890[((v3 == 0) * ((((v0 - 467598796) & 0x8571D2FF) - 382) ^ v2)) ^ (v0 + 1771230103)];
  LODWORD(STACK[0xD14]) = v2;
  *(_QWORD *)(v1 + 1968) = 995648879;
  return v4();
}

uint64_t sub_22D1F4E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a5 + 8 * (((LODWORD(STACK[0x170C]) == 0) * (v5 - 170)) ^ v5)) - 8))();
}

uint64_t sub_22D1F4E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(a5
                                        + 8
                                        * (((*(_QWORD *)(v7 + 88) != 0) * ((v6 + v5 + 520 - 1059) ^ (v6 - 51))) ^ (v5 + 520)))
                            - 8))();
}

uint64_t sub_22D1F4EC8(unint64_t a1)
{
  int v1;
  uint64_t v2;
  char *v3;
  CFStringEncoding SystemEncoding;
  CFStringRef v5;

  sub_22D22F914(a1);
  STACK[0x2290] = *(_QWORD *)(v2 + 4128);
  *(_DWORD *)STACK[0x1710] = -1084420331;
  LODWORD(STACK[0x2288]) = -1999002469;
  v3 = off_255D66718[0];
  LOBYTE(STACK[0x2391]) = *off_255D66718[0] - 4;
  LOBYTE(STACK[0x2392]) = v3[1] - 4;
  LOBYTE(STACK[0x2393]) = v3[2] - 4;
  LOBYTE(STACK[0x2394]) = v3[3] + (((v1 ^ 0x8B) - 53) ^ 0x77);
  LOBYTE(STACK[0x2395]) = 3 * (v1 ^ 0x8B) + v3[4] - 68;
  LOBYTE(STACK[0x2396]) = v3[5] - 4;
  LOBYTE(STACK[0x2397]) = v3[6] - 4;
  LOBYTE(STACK[0x2398]) = v3[7] - 4;
  LOBYTE(STACK[0x2399]) = v3[8] - 4;
  LOBYTE(STACK[0x239A]) = v3[9] - 4;
  LOBYTE(STACK[0x239B]) = v3[10] - 4;
  LOBYTE(STACK[0x239C]) = v3[11] - 4;
  LOBYTE(STACK[0x239D]) = v3[12] - 4;
  LOBYTE(STACK[0x239E]) = v3[13] - 4;
  LOBYTE(STACK[0x239F]) = v3[14] - 4;
  LOBYTE(STACK[0x23A0]) = v3[15] - 4;
  LOBYTE(STACK[0x23A1]) = v3[16] - 4;
  LOBYTE(STACK[0x23A2]) = v3[17] - 4;
  LOBYTE(STACK[0x23A3]) = v3[18] - 4;
  LOBYTE(STACK[0x23A4]) = v3[19] - 4;
  LOBYTE(STACK[0x23A5]) = v3[20] - 4;
  LOBYTE(STACK[0x23A6]) = v3[21] - 4;
  LOBYTE(STACK[0x23A7]) = off_255D66718[0][22] - 4;
  SystemEncoding = CFStringGetSystemEncoding();
  v5 = CFStringCreateWithCString(0, (const char *)&STACK[0x2391], SystemEncoding);
  *(_QWORD *)(v2 + 4088) = v5;
  return ((uint64_t (*)(void))(qword_24F86A890[(103 * (v5 != 0)) ^ (v1 + 1771230442)] - 8))();
}

uint64_t sub_22D1F50B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  uint64_t v8;

  v8 = MGCopyAnswer();
  *(_QWORD *)(v6 + 3864) = v8;
  return (*(uint64_t (**)(void))(a5
                              + 8
                              * (int)(((((v5 - 118) ^ (v8 == 0)) & 1)
                                     * (((v5 - 20258060) & 0xE3BDFFB4) + 494344461)) ^ v5)))();
}

uint64_t sub_22D1F511C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  CFTypeID v7;
  uint64_t v8;
  uint64_t v9;
  CFTypeID TypeID;
  unint64_t v11;

  v5 = STACK[0x3C0];
  *(_QWORD *)(v2 + 177) = STACK[0x3C0];
  v6 = (char *)&STACK[0x19D0] + v5;
  *(_QWORD *)(v2 + 185) = (char *)&STACK[0x19D0] + v5;
  v5 += 64;
  *(_QWORD *)(v2 + 193) = v5;
  STACK[0x3C0] = v5;
  *(_QWORD *)(v2 + 201) = 16 * (_QWORD)v6;
  *(_QWORD *)(v2 + 209) = ((16 * (_QWORD)v6) & 0x10)
                        + 0x18F8E2C5531661AALL
                        + (((v1 + (_DWORD)v0 + 577) | 8u) ^ (((16 * (_QWORD)v6) & 0x10) << ((v0 ^ 0xF0u)
                                                                                            + 61)) ^ 0x2AA);
  v7 = CFGetTypeID(*(CFTypeRef *)(v4 + 3864));
  v8 = v7 ^ 0x3FD7B9F8ADFEA2F9;
  v9 = (2 * v7) & 0x7FAF73F15BFD45F2;
  TypeID = CFStringGetTypeID();
  v11 = v8 + (TypeID ^ 0x20480088348A443ALL) + v9 - ((2 * TypeID) & 0xBF6FFEEF96EB778ALL) + 1;
  LODWORD(v11) = (((v11 - (v0 | ((unint64_t)(v0 + 2107036492) << 32))) | ((v0 | ((unint64_t)(v0 + 2107036492) << 32))
                                                                                             - v11)) & 0x8000000000000000) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)(v0 ^ 0xE288E6A1 ^ (v11 | (2 * v11)))) - 8))();
}

uint64_t sub_22D1F524C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CFIndex Length;
  unint64_t v6;
  void *v7;

  Length = CFStringGetLength(*(CFStringRef *)(v3 + 3864));
  v6 = (((v0 + 444) - 0x832020C0821002) & (2 * Length)) + (Length ^ 0xFFBE6FEF9FBEF9BFLL);
  *(_QWORD *)(v2 + 249) = v6;
  v7 = malloc_type_malloc(v6 + 0x41901060410642, 0x9EBEB066uLL);
  STACK[0x16A0] = (unint64_t)v7;
  *(_QWORD *)(v4 + 256) = v7;
  return (*(uint64_t (**)(void))(v1 + 8 * (((v7 != 0) * (((v0 + 64) | 0x31) ^ 0x7BE)) ^ v0)))();
}

uint64_t sub_22D1F52F0()
{
  int v0;
  CFIndex v1;
  uint64_t v2;
  uint64_t v3;
  CFStringEncoding SystemEncoding;
  Boolean CString;

  SystemEncoding = CFStringGetSystemEncoding();
  CString = CFStringGetCString(*(CFStringRef *)(v3 + 3864), (char *)STACK[0x16A0], v1, SystemEncoding);
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (int)((((2 * (CString & 3) + (CString ^ 3)) != 3)
                                               * ((((v0 - 618) | 8) ^ 0x6992DB6D) + ((v0 - 9438257) & 0x96FD2DFB))) ^ v0))
                            - 4))();
}

uint64_t sub_22D1F5388()
{
  int v0;
  int v1;
  int64_t v2;
  int v3;
  unint64_t v4;

  v2 = (v1 ^ (v0 - 246) ^ 0x419010F62C2B0ALL) + STACK[0x1698];
  v3 = v2 / 2 - ((2 * (v2 / 2)) & 0xD907F8D4) + (((v1 - 14) | 0x26) ^ 0xFFFFFED0) + 1820589188;
  LODWORD(STACK[0x40C]) = v3 ^ 0xD3DEF36B;
  v4 = sub_22D22F638(v3 ^ 0x6C83FC6Au, 0x32u, -1934707656);
  STACK[0x15D0] = v4;
  return ((uint64_t (*)(void))(qword_24F86A890[(38 * (v4 != 0)) ^ v1] - 12))();
}

uint64_t sub_22D1F5468(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (v3 ^ (190 * (v4 != -1084420351))))
                            - ((((v3 + 1301865673) & 0xB2671AE7) - v2 - 232) ^ 0x966D2D43)))();
}

uint64_t sub_22D1F54C8(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;

  v6 = v2 + 665;
  v7 = v5 ^ (v4 + 896) ^ v6;
  if (v7 <= 1)
    v7 = 1;
  LODWORD(STACK[0x1794]) = v7 + 754287367;
  LODWORD(STACK[0x141C]) = 754287368;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * (((*(_BYTE *)(STACK[0x16A0]
                                                      + ((754287368 << ((v6 + 39) ^ 0xA6)) - 1508574736)) != 0)
                                          * (((v6 - 2075918206) | 0x12292949) ^ (v3 - 8))) | v6))
                            - 4))();
}

uint64_t sub_22D1F54F8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  CFTypeID v3;
  unint64_t v4;
  uint64_t v5;
  CFTypeID TypeID;

  v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 3864));
  v4 = v3 ^ 0xFCDFC5DDBFFEA8F9;
  v5 = (((v0 - 650) | 0x1C4u) - 0x64074448002AFD2) & (2 * v3);
  TypeID = CFDataGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((28
                                          * (81 * (v0 ^ 0x280u)
                                           + v4
                                           + (TypeID ^ 0x1410414014013402)
                                           + v5
                                           - ((2 * TypeID) & 0xD7DF7D7FD7FD97FALL) == 0x10F0071DD3FFE025)) ^ v0))
                            - 12))();
}

uint64_t sub_22D1F55B4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int Length;
  int v4;
  void *v5;

  Length = CFDataGetLength(*(CFDataRef *)(v2 + 3864));
  v4 = Length - ((((v0 - 399) | 0x200) + 1741092375) & (2 * Length)) - 1276937178;
  LODWORD(STACK[0x1554]) = v4 ^ 0xCBE7327;
  LODWORD(STACK[0x40C]) = v4 ^ 0xCBE7327;
  v5 = malloc_type_malloc(v4 ^ 0xB3E37C26, 0x8DF370BBuLL);
  *(_QWORD *)(v2 + 4080) = v5;
  return (*(uint64_t (**)(void))(v1 + 8 * (((v5 != 0) | (2 * (v5 != 0))) ^ v0)))();
}

uint64_t sub_22D1F5630()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  CFRange v7;

  v4 = (_QWORD *)(STACK[0x1670] + STACK[0x1658] - 0x18F8E2C5531661BALL);
  v7.length = (v1 ^ 0xEBFF7F6EBFDCBEF6)
            + ((2 * v1) & 0x17FB97DECLL)
            + ((v0 - 559) | 0x19u)
            + 0x14008091402340EBLL;
  *v4 = 0;
  v4[1] = v7.length;
  v7.location = 0;
  CFDataGetBytes(*(CFDataRef *)(v3 + 3864), v7, *(UInt8 **)(v3 + 4080));
  v5 = sub_22D22F638(v1, 0x32u, -632481085);
  *(_QWORD *)(v3 + 3624) = v5;
  return (*(uint64_t (**)(void))(v2 + 8 * ((451 * (v5 != 0)) ^ (v0 + 112))))();
}

uint64_t sub_22D1F56FC(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t (*v7)(void);

  v6 = (v4 ^ 0xFE64FFBFDEDFFFFFLL) + (v3 & 0x1BDBFFFFELL) + 0x19B0040A76723CCLL;
  *(_QWORD *)(v5 + 3416) = v6;
  *(_BYTE *)(v5 + 3427) = v6 < 0x864723CB;
  v7 = *(uint64_t (**)(void))(a2 + 8 * ((11 * ((v2 ^ (v6 == 2252809163)) & 1)) ^ v2));
  LODWORD(STACK[0x11B4]) = v2;
  *(_QWORD *)(v5 + 3152) = 0x5AD05BD220F171EALL;
  *(_QWORD *)(v5 + 3160) = 0x7A14BDABBD3CAEADLL;
  *(_QWORD *)(v5 + 3168) = 0x78C746B69B1BC625;
  return v7();
}

uint64_t sub_22D1F57B4@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  uint64_t v3;
  unsigned int v4;

  LODWORD(STACK[0x3FC]) = a2;
  v4 = (v2 + 980) ^ LODWORD(STACK[0x1554]) ^ 0xFFFF8683;
  STACK[0x230] = *(_QWORD *)(v3 + 3624);
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((1946 * ((unsigned __int16)((v2 + 968) ^ v4 ^ 0x8997) > 1u)) ^ (v2 + 980)))
                            - 4))();
}

uint64_t sub_22D1F57F0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  CFTypeID v3;
  unint64_t v4;
  uint64_t v5;
  CFTypeID TypeID;

  v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 3864));
  v4 = v3 ^ 0xBEF7FCD8AF7EFEFFLL;
  v5 = (2 * v3) & 0x7DEFF9B15EFDFDFELL;
  TypeID = CFNumberGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((114
                                          * (v4
                                           + (TypeID ^ 0x381000C81881088)
                                           + v5
                                           - ((((v0 + 1614273363) & 0x9FC823B7) - 0x702001903102347) & (2 * TypeID)) == 0xC278FCE531070F87)) ^ v0))
                            - 8))();
}

uint64_t sub_22D1F58AC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  Boolean Value;

  Value = CFNumberGetValue(*(CFNumberRef *)(v2 + 3864), kCFNumberSInt64Type, &STACK[0x2C0]);
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((784
                                * ((((2 * Value) & 0xF7) + (Value ^ 0xFB)) != (((_BYTE)v0 - 115) & 0x7D ^ 0xCE))) ^ (v0 - 358))))();
}

uint64_t sub_22D1F5910()
{
  int v0;
  uint64_t v1;
  void *v2;

  LODWORD(STACK[0x40C]) = -1084420343;
  v2 = malloc_type_malloc(8uLL, 0xD29E14C9uLL);
  STACK[0x1838] = (unint64_t)v2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)((v0 + 147744231) & 0xF7319B7E | (16
                                                                               * (((((v0 - 25) & 0x7E) + 11) ^ (v2 == 0)) & 1))))
                            - (((v0 + 147744231) & 0xF7319B7E)
                             - 486)
                            + 316))();
}

uint64_t sub_22D1F5984()
{
  int v0;
  uint64_t v1;
  _QWORD *v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t (*v5)(void);

  v3 = (_BYTE *)STACK[0x1838];
  *v3 = (HIBYTE(STACK[0x2C0]) - ((STACK[0x2C0] >> 55) & 0x40) + v0 - 38 + 2) ^ 0x20;
  v3[1] = (HIWORD(STACK[0x2C0]) - ((STACK[0x2C0] >> 47) & 0x40) + 32) ^ 0x20;
  v3[2] = (((unsigned __int16)WORD2(STACK[0x2C0]) >> 8) - ((STACK[0x2C0] >> 39) & 0x86) - 61) ^ 0xC3;
  v3[3] = (HIDWORD(STACK[0x2C0]) - ((STACK[0x2C0] >> 31) & 0xAC) - 42) ^ 0xD6;
  v3[4] = (HIBYTE(LODWORD(STACK[0x2C0])) - ((LODWORD(STACK[0x2C0]) >> 23) & 0x78) + 60) ^ 0x3C;
  v3[5] = (HIWORD(LODWORD(STACK[0x2C0])) - ((LODWORD(STACK[0x2C0]) >> 15) & 0x70) - 72) ^ 0xB8;
  v3[6] = (BYTE1(LODWORD(STACK[0x2C0])) - ((LODWORD(STACK[0x2C0]) >> 7) & 0x36) + 27) ^ 0x1B;
  v3[7] = (LOBYTE(STACK[0x2C0]) - ((2 * LOBYTE(STACK[0x2C0])) & 0x8C) - 58) ^ 0xC6;
  v4 = sub_22D22F638(8, 0x32u, 1449183640);
  v2[484] = v4;
  v5 = (uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((29 * (v4 != 0)) ^ v0)) - 4);
  LODWORD(STACK[0xC14]) = v0;
  v2[214] = 0x63452BEBFCB0EC90;
  v2[215] = 0x6970A1D5A57E9AB1;
  v2[216] = 0x1F589551E5AF29B3;
  return v5();
}

uint64_t sub_22D1F5B34@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  _BOOL4 v5;
  uint64_t (*v6)(unint64_t);

  LODWORD(STACK[0x41C]) = a2;
  STACK[0x230] = *(_QWORD *)(v3 + 3872);
  v4 = STACK[0x1838];
  v5 = (((v2 - 28) | 0x28C) ^ 0x5EC7B569) - 134287500 + (((v2 - 1771229907) ^ 0x966C4295) & 0x10) == 1455859555;
  v6 = (uint64_t (*)(unint64_t))(*(_QWORD *)(a1 + 8 * (((4 * v5) | (16 * v5)) ^ (v2 + 969))) - 4);
  STACK[0x280] = STACK[0x1838];
  return v6(v4);
}

void sub_22D1F5B84()
{
  uint64_t v0;

  CFRelease(*(CFTypeRef *)(v0 + 4088));
  JUMPOUT(0x22D1F0C24);
}

uint64_t sub_22D1F5BBC(uint64_t a1)
{
  int v1;
  char v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (v1 ^ (2
                                               * (((v1 - 98) ^ ((char)(byte_22D2508C0[*(_QWORD *)(v3 + 2080)] ^ byte_22D250CE0[*(_QWORD *)(v3 + 2072)] ^ byte_22D24A5A0[*(_QWORD *)(v3 + 2072)] ^ (LOBYTE(STACK[0xD96]) * v2) ^ LOBYTE(STACK[0xD7F]) ^ LOBYTE(STACK[0xD7E])) < (char)(7 * (v1 ^ 0xE0) + 100))) & 1))))
                            - 8))();
}

uint64_t sub_22D1F5C4C@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  uint64_t (*v2)(void);

  v2 = (uint64_t (*)(void))(*(_QWORD *)(a1
                                     + 8
                                     * ((1366
                                       * (LOBYTE(STACK[0xD97]) > ((((a2 + 37) | 0x43) + 21) & 0xFCu))) ^ a2))
                         - 8);
  LODWORD(STACK[0x7B0]) = (a2 - 2111494619) | 0x14480543;
  return v2();
}

void sub_22D1F5C94(uint64_t a1@<X0>, int a2@<W8>)
{
  int v2;
  int v3;
  uint64_t v4;
  _QWORD *v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  uint64_t v10;

  v6 = (a2 + 306520927) | 0x84280809;
  if (LOBYTE(STACK[0xD97]) >= 0x67u)
    v7 = 1415711971;
  else
    v7 = (v6 ^ 0xF1E03D9B) + LODWORD(STACK[0xD98]);
  LODWORD(STACK[0x7B0]) = v6;
  LODWORD(STACK[0x7B4]) = v7;
  LODWORD(STACK[0x7B8]) = STACK[0x7B4];
  v8 = STACK[0x7B0];
  v9 = LODWORD(STACK[0x7B0]) - v3 + 576;
  LODWORD(STACK[0x7BC]) = v9;
  v9 ^= 0x196u;
  LODWORD(STACK[0x7C0]) = v9;
  LODWORD(STACK[0x7C4]) = v2 + v8 + 540;
  v10 = **(_QWORD **)(v4 + 120)
      + ((LODWORD(STACK[0xD6C]) - 2113796587) ^ 0x3F5E7AE9)
      - 1063156457
      + ((v9 + 2126311932) & (2 * (LODWORD(STACK[0xD6C]) - 2113796587)));
  v5[76] = v10;
  v5[64] = v10;
  v5[62] = *(_QWORD *)(a1 + 8 * (v8 ^ (v3 - 1281))) - 8;
  JUMPOUT(0x22D215040);
}

uint64_t sub_22D1F5D00@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  STACK[0x200] = a1;
  v5 = ((a3 - 1017515313) & 0x3CA60BE6u) - 76;
  v6 = ((2 * (_QWORD)&STACK[0x550]) & 0xFCFB7FDD7FEF3FF8)
     - 0x7E7DBFEEBFF79FFELL
     + ((v5 + 0x7E7DBFEEBFF79EC4) ^ (unint64_t)&STACK[0x550]);
  STACK[0x230] = ((v6 % 0x25) ^ 0x7DDEEFFFDA5F7E1FLL) + 2 * ((v6 % 0x25) & 0x1F) - 0x7DDEEFFFDA5F7E0FLL;
  STACK[0x2A0] = STACK[0x4E8];
  v7 = *(_QWORD *)(v4 + 3360) + *(_QWORD *)(v4 + 3352) - 0x7F86AFCB40856E2;
  LODWORD(STACK[0x290]) = v3 - 218;
  LODWORD(STACK[0x280]) = v3 - 51;
  STACK[0x2A8] = v7;
  STACK[0x220] = v7 + 16;
  return (*(uint64_t (**)(uint64_t))(a2
                                            + 8
                                            * (int)((((v5 ^ 0x26D48C69) == 651464019)
                                                   * (v5 ^ (v3 - 218) ^ (v3 - 51))) ^ v5)))(3962027271);
}

uint64_t sub_22D1F5E70@<X0>(unsigned int a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W8>)
{
  char v4;
  int v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;

  *(_BYTE *)(v6 + (((a4 ^ 0x88D508D4) + 1375632307) ^ (a3 + 232)) + v7) = (((v5 ^ a1) >> (v4 + 54))
                                                                         - ((2 * ((v5 ^ a1) >> (v4 + 54))) & 0xA8)
                                                                         - 44) ^ 0x8B;
  v8 = (((v5 ^ a1) >> (v4 + 54)) - ((2 * ((v5 ^ a1) >> (v4 + 54))) & 0xA8) - 44) != 0x8B;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8 * ((28 * (((v7 - v8 - a4) | (a4 - (v7 - v8))) >= 0)) ^ (a3 + a4 + 389)))
                            - 4))();
}

uint64_t sub_22D1F642C(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(a2
                              + 8
                              * (((v2 + 8 == (v3 ^ 0x26D48C69) + 897878679)
                                * (v3 ^ LODWORD(STACK[0x290]) ^ LODWORD(STACK[0x280]))) ^ v3)))();
}

uint64_t sub_22D1F6470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(a4 + 48) = 0xC464F0435D6C409CLL;
  LODWORD(STACK[0x550]) = dword_255D666E8 - 266572532;
  v8 = *(unsigned int *)(v5 + 1832);
  v6[12] = *(_QWORD *)(a2 + 8 * ((v4 - 2128153733) ^ 0x1794206FLL));
  LODWORD(STACK[0x5D0]) = v4 - 2128153733;
  LODWORD(STACK[0x5E0]) = 0;
  v6[14] = 1416753466;
  LODWORD(STACK[0x5E4]) = (v4 - 2128153733) ^ 0x15;
  LODWORD(STACK[0x5E8]) = (v4 - 2128153733) ^ 0x99;
  v6[17] = v8;
  *(_QWORD *)(a4 + 448) = &STACK[0x5C8];
  *(_DWORD *)(v7 - 192) = 1431737413
                        * ((((v7 - 200) | 0xCCC43128) - (v7 - 200) + ((v7 - 200) & 0x333BCED0)) ^ 0x729AAE3A)
                        + 40706419
                        + v4;
  sub_22D219DEC(v7 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v7 - 188)] - 8))();
}

uint64_t sub_22D1F6578()
{
  int v0;
  int v1;
  int v2;
  uint32_t v3;
  unsigned int v4;
  int v5;

  v2 = v1 + v0 + 1028;
  STACK[0x2A0] = (unint64_t)malloc_type_malloc(STACK[0x230], 0xC5732911uLL);
  v3 = arc4random();
  v4 = v3 + 257242056 - ((v3 << ((v1 + v0 + 4) ^ 2)) & 0x1EAA6790);
  LODWORD(xmmword_255D65D28) = v4;
  v5 = v2 ^ 0x46;
  DWORD1(xmmword_255D65D28) = ((1812433253 * (v5 ^ v4 ^ 0xF55378D ^ (v4 >> 30))) ^ 0x6FD7FDB7)
                            + ((-670100790 * (v5 ^ v4 ^ 0xF55378D ^ (v4 >> 30))) & 0xDFAFFB6E)
                            - 1619184110
                            - ((2
                              * (((1812433253 * (v5 ^ v4 ^ 0xF55378D ^ (v4 >> 30))) ^ 0x6FD7FDB7)
                               + ((-670100790 * (v5 ^ v4 ^ 0xF55378D ^ (v4 >> 30))) & 0xDFAFFB6E))
                              - 1605368684) & 0x1EAA6790);
  return ((uint64_t (*)(void))(qword_24F86A890[v2] - 4))();
}

void sub_22D1F66A8()
{
  JUMPOUT(0x22D1F6630);
}

void sub_22D1F66C4()
{
  JUMPOUT(0x22D1F66ECLL);
}

uint64_t sub_22D1F68E4@<X0>(uint64_t a1@<X2>, uint64_t a2@<X4>, uint64_t a3@<X5>, int a4@<W6>, int a5@<W7>, int a6@<W8>)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;

  v10 = (unsigned int *)(a3 + 4 * (v6 + v9));
  v11 = ((a4 + ((a6 - 296918563) & 0x11B29B5F) + 4074) ^ v7 & 0x80000000) - 4353;
  v12 = v6 + 1;
  v13 = *(_DWORD *)(a3 + 4 * (v12 + v9));
  v14 = (((2 * (v13 & 0x7FFFFFFE ^ 0x165A0886)) | 0xE077F140) - (v13 & 0x7FFFFFFE ^ 0x165A0886) + 264505184) ^ 0x6838E2A2;
  *v10 = v10[397] ^ *((_DWORD *)&STACK[0x2268] + (v13 & 1)) ^ (((((v14 & a5) - (v14 | (a5 + 1))) ^ 0xE136335 | v11 ^ a4)
                                                              + v8
                                                              - 2
                                                              * ((((v14 & a5) - (v14 | (a5 + 1))) ^ 0xE136335) & (v8 + 7) ^ ((v14 & a5) - (v14 | (a5 + 1))) & 8)) >> 1) ^ 0x5AB2B376;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((1983 * (v12 == a1 + 3)) ^ a6)) - 8))();
}

void sub_22D1F69EC(int a1@<W8>)
{
  char v1;
  char v2;
  char v3;
  int v4;
  char v5;
  _DWORD *v6;
  int v7;
  uint32_t v8;
  uint32_t v9;

  LODWORD(STACK[0x270]) = v4;
  v5 = v1 ^ (v2 - 61);
  LODWORD(STACK[0x550]) = a1 + 1;
  gettimeofday((timeval *)STACK[0x220], 0);
  v6 = (_DWORD *)STACK[0x2A8];
  v7 = *(_DWORD *)(STACK[0x2A8] + 16) + 257242056 - ((2 * *(_DWORD *)(STACK[0x2A8] + 16)) & 0x1EAA6790);
  v6[1] = *(_DWORD *)(STACK[0x2A8] + 24) + 257242056 - ((2 * *(_DWORD *)(STACK[0x2A8] + 24)) & 0x1EAA6790);
  v6[2] = v7;
  v8 = arc4random();
  v6[3] = v8 + 257242056 - ((v8 << (v3 + v5 + 2)) & 0x1EAA6790);
  v9 = arc4random();
  *v6 = v9 + 257242056 - ((2 * v9) & 0x1EAA6790);
  JUMPOUT(0x22D1EEFC0);
}

uint64_t sub_22D1F6B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t (*a71)(unint64_t);
  unint64_t v71;

  STACK[0x480] = v71;
  STACK[0x4E8] = STACK[0x2A0];
  return a71(STACK[0x200]);
}

uint64_t sub_22D1F6B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v10 = LODWORD(STACK[0x34C])++;
  dword_255D666E8 = v10 + 266572533;
  v11 = (*(_DWORD *)(v6 + 1832) + 355226121);
  v8[12] = *(_QWORD *)(a5 + 8 * ((v5 - 1916284683) ^ 0x2434FEE5));
  LODWORD(STACK[0x5D0]) = v5 - 1916284683;
  LODWORD(STACK[0x5E0]) = 0;
  LODWORD(STACK[0x5E4]) = v5 - 1916284745;
  LODWORD(STACK[0x5E8]) = v5 - 1916284626;
  v8[14] = v11;
  v8[17] = 1771979587;
  *(_DWORD *)(v9 - 192) = 1431737413 * ((2 * ((v9 - 200) & 0x454A6338) - (v9 - 200) + 984980678) ^ 0x84EB03D4)
                        + 40706419
                        + v5;
  *(_QWORD *)(v7 + 448) = &STACK[0x5C8];
  sub_22D219DEC(v9 - 200);
  return ((uint64_t (*)(void))qword_24F86A890[*(int *)(v9 - 188)])();
}

void sub_22D1F6C10()
{
  JUMPOUT(0x22D1F111CLL);
}

void sub_22D1F6C24(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  char v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;

  v5 = STACK[0x7A4];
  LODWORD(STACK[0x7A8]) = STACK[0x7A4];
  LODWORD(STACK[0x7AC]) = (v5 - 1761657813) & 0xFF6DEF4F;
  v6 = (16 * a2 - (((a2 << ((v5 + 43) & 0x4F ^ (v3 + 3))) + 1213598560) & 0x9214D240) - 315265321) ^ 0xC90A6927 | (v2 - 908955947);
  v7 = STACK[0x16F8] + (LODWORD(STACK[0x1524]) - 655494596);
  v8 = -711945521 * ((v7 ^ *(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0))) & 0x7FFFFFFF);
  v9 = -711945521 * (v8 ^ HIWORD(v8));
  LOBYTE(STACK[0x61B]) = byte_22D251010[v9 >> 24] ^ byte_22D24C420[v9 >> 24] ^ byte_22D246E20[(v9 >> 24) + 1] ^ v9 ^ (115 * BYTE3(v9)) ^ (v6 - ((2 * v6) & 0x98) - 52) ^ 0xCC;
  v10 = *(_QWORD *)(a1 + 8 * (v5 ^ 0x4FD));
  *(_QWORD *)(v4 + 168) = v7;
  *(_QWORD *)(v4 + 160) = v10;
  JUMPOUT(0x22D2128A4);
}

uint64_t sub_22D1F6D68()
{
  return ((uint64_t (*)(void))(qword_24F86A890[(42 * (LODWORD(STACK[0x1524]) != LODWORD(STACK[0x12CC]))) ^ LODWORD(STACK[0x7A8])]
                            - 8))();
}

uint64_t sub_22D1F6DC8@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  int v3;
  uint64_t v4;

  LODWORD(STACK[0x1524]) = a2 + 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((788
                                          * (*(_BYTE *)(*(_QWORD *)(v4 + 4104)
                                                      + (2 * (a2 + 1) - 1310989192)) != 0)) ^ v2))
                            - ((((v2 - 400) | 0x423u) - v3 - 1124) ^ 0x966D2D43)))();
}

uint64_t sub_22D1F6DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;

  return (*(uint64_t (**)(void))(a5 + 8 * (int)(((((v5 + 1492244967) & 0xA70E27EF) - 668) * (a1 != 0)) | v5)))();
}

uint64_t sub_22D1F6E14(unint64_t a1)
{
  int v1;
  int v2;
  int v3;
  unsigned int v4;
  unint64_t v5;

  v4 = ((v3 - 554750632) & 0xB77DFD4B) - v1 + 337;
  v5 = sub_22D22F914(a1);
  STACK[0x3C0] = STACK[0x1868];
  return ((uint64_t (*)(unint64_t))qword_24F86A890[((v4 ^ 0x117) * v2) ^ v3])(v5);
}

uint64_t sub_22D1F6E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(a8
                                        + 8
                                        * (int)(((((v8 + 705423626) & 0xD5F41676) - 1101)
                                               * (LODWORD(STACK[0x12A4]) != 326872685)) ^ v8))
                            - 12))();
}

uint64_t sub_22D1F6EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v10;
  int v11;
  unint64_t v12;

  STACK[0x360] = STACK[0x18E0];
  v10 = STACK[0x1450];
  LODWORD(STACK[0x368]) = STACK[0x1450];
  LODWORD(STACK[0x358]) = -693384531;
  if (v10 == 417814468)
    v11 = 1251582716;
  else
    v11 = LODWORD(STACK[0x144C]) + 186771650;
  LODWORD(STACK[0x494]) = v11;
  v12 = sub_22D22F638(v11 + ((7 * (v8 ^ 0x4E5) - 1251584079) ^ (v8 - 708)), 0x32u, -502495127);
  STACK[0x2E8] = v12 + 0x222ACA0D7372C8AELL;
  return ((uint64_t (*)(void))(*(_QWORD *)(a8 + 8 * ((v12 == 0) | (8 * (v12 == 0)) | v8)) - 12))();
}

uint64_t sub_22D1F6F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;

  LODWORD(STACK[0x16E0]) = 1605696872;
  LODWORD(STACK[0x50C]) = 2075023128;
  return ((uint64_t (*)(void))(*(_QWORD *)(a5 + 8 * (v5 ^ (8 * (v5 == 1253)))) - ((v5 - 57737606) & 0x370FFBD ^ 0x311)))();
}

uint64_t sub_22D1F6F9C()
{
  int v0;
  int v1;
  unint64_t v2;

  v1 = (((v0 - 2080045259) | 0x12682141) + 1771229945) | 0x311;
  v2 = sub_22D22F914(STACK[0x380] - 0xE550F9B8A5EBC69);
  return ((uint64_t (*)(unint64_t))(qword_24F86A890[(2026
                                                                    * (((v1 - 80) ^ (STACK[0x3F0] == 0x222ACA0D7372C8AELL)) & 1)) ^ v1]
                                                   - 8))(v2);
}

uint64_t sub_22D1F6FDC@<X0>(int a1@<W0>, uint64_t a2@<X5>, int a3@<W6>, int a4@<W8>)
{
  return (*(uint64_t (**)(void))(a2
                              + 8
                              * ((243
                                * ((~((a3 ^ a4) + (a1 ^ 0x109 ^ (a4 + 192)) - ((2 * (a3 ^ a4) + 2) & 0xD1BE93D6)) & 3) == 0)) ^ a1)))();
}

uint64_t sub_22D1F7090@<X0>(int a1@<W1>, int a2@<W3>, int a3@<W6>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  int v50;
  int v51;
  unint64_t v52;
  unsigned int v53;
  unsigned int v54;
  int v55;
  unsigned int v56;
  unsigned int v57;
  int v58;
  unsigned int v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  int v63;
  int v64;
  unsigned int v65;
  unsigned int v66;
  int v67;
  unsigned int v68;
  unsigned int v69;
  int v70;
  int v71;
  unsigned int v72;
  int v73;
  int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  unint64_t v83;
  int v84;
  int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  unsigned int v90;
  unsigned int v91;
  int v92;
  unsigned int v93;
  int v94;
  unsigned int v95;
  int v96;
  int v97;
  int v98;
  unsigned int v99;
  char v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  int v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  int v111;
  int v112;
  int v113;
  unsigned int v114;
  unsigned int v115;
  unsigned int v116;
  int v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  int v125;
  unsigned int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  unsigned int v134;
  unsigned int v135;
  int v136;
  unsigned int v137;
  unsigned int v138;
  unsigned int v139;
  int v140;
  unsigned int v141;
  int v142;
  unsigned int v143;
  unsigned int v144;
  int v145;
  int v146;
  unsigned int v147;
  unsigned int v148;
  unsigned int v149;
  int v150;
  int v151;
  unsigned int v152;
  int v153;
  unsigned int v154;
  unsigned int v155;
  unsigned int v156;
  unsigned int v157;
  unsigned int v158;
  int v159;
  unsigned int v160;
  unsigned int v161;
  unsigned int v162;
  int v163;
  unsigned int v164;
  int v165;
  unsigned int v166;
  unsigned int v167;
  int v168;
  unsigned int v169;
  int v170;
  unsigned int v171;
  unsigned int v172;
  int v173;
  unsigned int v174;
  unsigned int v175;
  unsigned int v176;
  int v177;
  int v178;
  unsigned int v179;
  int v180;
  int v181;
  unsigned int v182;
  unsigned int v183;
  unsigned int v184;
  int v185;
  unsigned int v186;
  unsigned int v187;
  int v188;
  unsigned int v189;
  unsigned int v190;
  int v191;
  unsigned int v192;
  unsigned int v193;
  int v194;
  unsigned int v195;
  unsigned int v196;
  unsigned int v197;
  unsigned int v198;
  unsigned int v199;
  unsigned int v200;
  int v201;
  int v202;
  unsigned int v203;
  unsigned int v204;
  unsigned int v205;
  unsigned int v206;
  unsigned int v207;
  unsigned int v208;
  unsigned int v209;
  unsigned int v210;
  unsigned int v211;
  unsigned int v212;
  unsigned int v213;
  unsigned int v214;
  unsigned int v215;
  unsigned int v216;
  unsigned int v217;
  unsigned int v218;
  unsigned int v219;
  unsigned int v220;
  int v221;
  unsigned int v222;
  unsigned int v223;
  unsigned int v224;
  unsigned int v225;
  unsigned int v226;
  int v227;
  unsigned int v228;
  unsigned int v229;
  unsigned int v230;
  unsigned int v231;
  unsigned int v232;
  unsigned int v233;
  int v234;
  unsigned int v235;
  unsigned int v236;
  unsigned int v237;
  int v238;
  unsigned int v239;
  unsigned int v240;
  unsigned int v241;
  int v242;
  unsigned int v243;
  unsigned int v244;
  unsigned int v245;
  unsigned int v246;
  int v247;
  unsigned int v248;
  int v249;
  int v250;
  int v251;
  unsigned int v252;
  unsigned int v253;
  int v254;
  int v255;
  int v256;
  int v257;
  int v258;
  unsigned int v259;
  unsigned int v260;
  unsigned int v261;
  int v262;
  int v263;
  int v264;
  unsigned int v265;
  unsigned int v266;
  unsigned int v267;
  unsigned int v268;
  int v269;
  unsigned int v270;
  int v271;
  unsigned int v272;
  unsigned int v273;
  unsigned int v274;
  unsigned int v275;
  unsigned int v276;
  unsigned int v277;
  unsigned int v278;
  unsigned int v279;
  unsigned int v280;
  int v281;
  int v282;
  unsigned int v283;
  unsigned int v284;
  int v285;
  unsigned int v286;
  unsigned int v287;
  int v288;
  unsigned int v289;
  unsigned int v290;
  unsigned int v291;
  unsigned int v292;
  unsigned int v293;
  unsigned int v294;
  unsigned int v295;
  unsigned int v296;
  int v297;
  unsigned int v298;
  int v299;
  unsigned int v300;
  unsigned int v301;
  unsigned int v302;
  unsigned int v303;
  unsigned int v304;
  unsigned int v305;
  unsigned int v306;
  unsigned int v307;
  int v308;
  int v309;
  unsigned int v310;
  unsigned int v311;
  unsigned int v312;
  unsigned int v313;
  unsigned int v314;
  unsigned int v315;
  int v316;
  int v317;
  int v318;
  unsigned int v319;
  unsigned int v320;
  unsigned int v321;
  unsigned int v322;
  unsigned int v323;
  unsigned int v324;
  unsigned int v325;
  int v326;
  unsigned int v327;
  unsigned int v328;
  unsigned int v329;
  unsigned int v330;
  unsigned int v331;
  unsigned int v332;
  int v333;
  unsigned int v334;
  unsigned int v335;
  int v336;
  unsigned int v337;
  BOOL v338;
  unsigned int v339;
  unsigned int v340;
  unsigned int v341;
  unsigned int v342;
  unsigned int v343;
  int v344;
  unsigned int v345;
  int v346;
  int v347;
  unsigned int v348;
  int v349;
  unsigned int v350;
  unsigned int v351;
  int v352;
  int v353;
  int v354;
  int v355;
  unsigned int v356;
  unsigned int v357;
  unsigned int v358;
  unsigned int v359;
  int v360;
  unsigned int v361;
  int v362;
  unsigned int v363;
  unsigned int v364;
  unsigned int v365;
  unsigned int v366;
  unsigned int v367;
  int v368;
  unsigned int v369;
  unsigned int v370;
  unsigned int v371;
  unsigned int v372;
  unsigned int v373;
  unsigned int v374;
  unsigned int v375;
  int v376;
  int v377;
  unsigned int v378;
  unsigned int v379;
  unsigned int v380;
  unsigned int v381;
  unsigned int v382;
  unsigned int v383;
  unsigned int v384;
  unsigned int v385;
  unsigned int v386;
  unsigned int v387;
  unsigned int v388;
  unsigned int v389;
  unsigned int v390;
  int v391;
  unsigned int v392;
  unsigned int v393;
  unsigned int v394;
  unsigned int v395;
  unsigned int v396;
  unsigned int v397;
  int v398;
  void *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  unsigned int v408;
  unsigned int v409;
  unsigned int v410;

  LODWORD(STACK[0x2A0]) = v51 - 326;
  v52 = (v51 - 326) ^ 0x140u;
  STACK[0x290] = v52;
  LODWORD(v52) = (v52 + 85442059) ^ a1;
  v53 = -1302716785 * (v50 ^ 0x78B5085C) - ((1689533726 * (v50 ^ 0x78B5085C)) & 0xE5A9DDB0) - 220926248;
  v54 = v53 >> 19;
  v55 = a3 ^ a4;
  v56 = -935931213 * v55 - ((275621222 * v55) & 0x74E7F126) - 1166804845;
  v57 = -631873536 * v55 - ((-1263747072 * v55) & 0xA3D84000) + 1374434154;
  v58 = 1137827840 * (v50 ^ 0x78B5085C) - ((128172032 * (v50 ^ 0x78B5085C)) & 0x579BC000) - 1412565095;
  v59 = ((v53 >> 18) & 0x7D4 ^ 0x494) + ((v53 >> 19) & 0x17EE ^ 0xFF575DB1);
  v60 = (v58 & 0x29044000 ^ 0xD78C7F5D) - 1;
  v61 = -1781095162 * v52 - ((732776972 * v52) & 0x85831578) - 1027503428;
  v62 = ((v61 & 0xFFFFFFFE | ((((366388486 * (_DWORD)v52) & 0x5ECC9790u) - 1256936067 * (_DWORD)v52 + 1352250423) >> 31)) ^ 0x796E73CA)
      + ((2 * v61) & 0x775FF2EC ^ 0x5031068);
  LODWORD(v52) = (v59 + 11056133) | v60 ^ 0xFE883F5C;
  v63 = v52 ^ 0x24230209;
  v64 = (2 * v52) & 0xB7B9FBEC;
  LODWORD(v52) = ((-1036492576 * a2 - ((-2072985152 * a2 + 1801667456) & 0xB55D8400) - 1872731180) ^ 0x5AAEC214) & 0xFFFFFFE0 | ((-300825849 * a2 - ((472090126 * a2 + 861608476) & 0x2B1D807Au) + 1866222923) >> 27);
  LODWORD(v52) = ((2 * v52) & 0xF9FC77FE ^ 0x24) + (v52 ^ 0x7CFE3BED);
  v65 = (v57 ^ 0x51EC336A) & 0xFFFFE000 | (v56 >> 19);
  v66 = ((v54 & 0x811 ^ 0x810) - ((2 * (v54 & 0x811 ^ 0x810)) & 0x20) - 1642088778) ^ 0x9F5FB23E;
  v67 = -639062627 * v62 - 2 * ((-639062627 * v62 + 1620001954) & 0x67B5683D ^ (-639062627 * v62) & 1) - 935023394;
  v68 = (v58 & 0xD6FBA000 ^ 0x22D9E402) - ((2 * (v58 & 0xD6FBA000 ^ 0x22D9E402)) & 0x6C528800) - 1104323035;
  v69 = (v60 ^ ((v60 ^ 0x177C0A3) - 316481806 + (~(2 * (v60 ^ 0x177C0A3) + 2) | 0x25BA7FFF)) ^ 0x8412F339 ^ (v63 + v59 - v64 - ((2 * (v63 + v59 - v64) + 957047800) & 0x2F70252A) + 1950205073))
      + v59
      + 11056133;
  v70 = (((2 * v66) & 0x2801960) - v66 + 403013963) ^ 0x194585C3 | v68 ^ 0x1E3D1A27;
  v71 = -1382219776 * v62 - ((1530527744 * v62 + 155451392) & 0x73120000) - 30672179;
  v72 = ((v69 ^ 0xED7BBB95) + 310658155 + ((2 * v69) & 0xDAF7772A)) | (v70 - ((2 * v70) & 0x24143730) + 302652312) ^ 0x120A1B98;
  v73 = v72 - ((2 * v72) & 0x6EEE1286) - 1216935613;
  v74 = (v65 ^ 0xB96FEAA3) - v52 + ((2 * v65) & 0x72DFFBDA ^ 0x2A98) - v62 - 2008246044;
  v75 = v73 ^ (v74 - ((2 * v74 + 769867080) & 0x39F04A48) + 334087112) ^ 0xAB8F2C67;
  v76 = 2027185433 * v75 - ((-240596430 * v75) & 0xB87339E4) - 600204046;
  v77 = 848068608 * v75 - ((1696137216 * v75) & 0x845B0000) + 1110308554;
  v78 = ((2 * ((v77 ^ 0x422DF6CA) & 0xFFFF8000 | (v76 >> 17))) & 0xDFD7F1FC ^ 0xD038)
      + (((v77 ^ 0x422DF6CA) & 0xFFFF8000 | (v76 >> 17)) ^ 0x6FEB96E2);
  v79 = ((2 * ((v71 ^ 0xB989FACD) & 0xFFFF0000 | HIWORD(v67))) & 0xE1FF7BFC ^ 0x14B68)
      + (((v71 ^ 0xB989FACD) & 0xFFFF0000 | HIWORD(v67)) ^ 0xF0FF5A4B);
  v80 = ((-637534208 * (v73 ^ 0xB7770943) - ((-1275068416 * (v73 ^ 0xB7770943)) & 0xC8000000) - 468384961) ^ 0xE415033F) & 0xFE000000 | ((334163693 * (v73 ^ 0xB7770943) - ((131456474 * (v73 ^ 0xB7770943)) & 0x1A39B574) + 219994810) >> 7);
  v81 = ((2 * v80) & 0xEBD7FB7C ^ 0x147368) + (v80 ^ 0x75F1C40B);
  LODWORD(v52) = ((1169031168 * v52 - ((-1956904960 * v52 - 77856768) & 0xC8980000) - 503593168) ^ 0x644DC730) & 0xFFFE0000 | ((-1429003561 * (_DWORD)v52 - ((363218350 * (_DWORD)v52 + 850230702) & 0x27C7C080u) - 1925538025) >> 15);
  v82 = 1087309287 * v78 - ((-2120348722 * v78 + 564574620) & 0xD673E3CC) + 2081246900;
  HIDWORD(v83) = (v52 ^ 0x3C8FDC31) + ((2 * v52) & 0x791FF7EC ^ 0x478C) + v79 + v81 + v78 + 1315629748;
  LODWORD(v83) = (1790310283 * HIDWORD(v83) - ((-714346730 * HIDWORD(v83) - 771208856) & 0xCC6C4084) - 818264842) ^ 0x66362042;
  v84 = 1008180224 * v78 - ((942618624 * v78 + 451309568) & 0x31426000) - 434869353;
  v85 = ((2 * (v83 >> 1)) & 0x3D37DE7E) + ((v83 >> 1) ^ 0x9E9BEF3F);
  v86 = ((2 * ((v84 ^ 0x98A13397) & 0xFFFFFC00 | (v82 >> 22))) & 0xE7F3FFFE ^ 0x758)
      + (((v84 ^ 0x98A13397) & 0xFFFFFC00 | (v82 >> 22)) ^ 0xF3F9FC53);
  v87 = -1382721235 * v79 - ((1529524826 * v79 - 28272460) & 0xE60E2B82) - 231775717;
  v88 = ((((v87 ^ 0x730715C1) >> ((116 - ((v85 + 1) & 0x14)) ^ 0x74))
        - ((2 * ((v87 ^ 0x730715C1) >> ((116 - ((v85 + 1) & 0x14)) ^ 0x74))) & 0x924BFDBC)
        + 1227226846) ^ 0x4925FEDE) >> ((116 - ((v85 + 1) & 0x14)) ^ 0x60);
  v89 = 1435684864 * v79 - v85 - v86 + (v88 ^ 0x3FD76A9F) + ((2 * v88) & 0x7FAED53E) - 1417266330;
  v90 = v89 + 1347909837 + (~(2 * v89 + 1476121202) | 0xB74CE0D9);
  v91 = (((((-1342177280 * v81 + 1610612736) & 0x80000000) - 671088640 * v81 + 1953799436) ^ 0xC4749D0C) & 0xF8000000 | ((1256955867 * v81 - ((-1781055562 * v81 + 1714804972) & 0xAFD2CEA0) + 184832966) >> 5)) ^ 0x2BF4B3A;
  v92 = v91 - ((2 * v91) & 0xA23C8E) + 5316167;
  v93 = -2011374097 * v86 - ((272219102 * v86 + 1601027038) & 0x4217D988) + 281201331;
  v94 = v92 ^ 0x511E47;
  v95 = 2126547813 * (v92 ^ 0x511E47) - ((1031870154 * (v92 ^ 0x511E47)) & 0x3384BDA4) + 432168658;
  v96 = -1436147558 - ((~(v86 << 29) & 0x60000000) + (v86 << 28));
  v97 = -1421997755 * v85 - ((377229962 * v85 + 1016764938) & 0x2BBA2D3A) + 1412064162;
  v98 = 2 * (((v90 ^ 0x24598F93) & (v92 ^ 0x511E47)) - ((2 * ((v90 ^ 0x24598F93) & (v92 ^ 0x511E47))) & 0xED5521A))
      + 248861210;
  v99 = (v92 ^ 0x240891D4 ^ v90) + (v98 ^ 0x618A3CE5) - 1868525311 + ((2 * v98) & 0xDEBEDDFC ^ 0x1CAA8434);
  LOBYTE(v92) = (69 * v85 - ((-118 * v85 + 10) & 0x3A) - 94) & 0x19 ^ 3;
  v100 = (((v92 | 0x58) - (v92 | 0xA7) - 89) & 0x3A ^ 0x3A)
       + (((v92 | 0x58) - (v92 | 0xA7) - 89) ^ 0x40)
       - ((((v92 | 0x58) - (v92 | 0xA7) - 89) ^ 0x40) & 0x3A);
  v101 = -1627086208 * v85 - ((1040794880 * v85 + 1296893184) & 0xD03D7700) - 1899676081;
  v102 = ((2 * ((v96 ^ 0xBA66209A) & 0xF0000000 | (v93 >> 4))) & 0xAF5DFFEE ^ 0x4017D88)
       + (((v96 ^ 0xBA66209A) & 0xF0000000 | (v93 >> 4)) ^ 0xD5BE413B);
  v103 = ((((v97 ^ 0x95DD169D) >> (v100 ^ 0x38)) - ((2 * ((v97 ^ 0x95DD169D) >> (v100 ^ 0x38))) & 0x187C9018) + 205408268) ^ 0xC3E480C) >> (v100 ^ 0x21);
  LOBYTE(v103) = v103 - ((2 * v103) & 0x8C) + 70;
  v104 = ((v103 & 0xA3 ^ 0x182) + (v103 & 0x5C ^ 0x11) - 1) ^ 0x1D4 | v101 ^ 0x681EBBCF;
  v105 = v104 - ((2 * v104) & 0xB6C83DA2) - 614195503;
  v106 = ((-671088640 * (((2 * v99) & 0xEFD141EC) + (v99 ^ 0xF7E8A0F6)) + 1910494254) & 0xF8000000 | ((-872031717 * (((2 * v99) & 0xEFD141EC) + (v99 ^ 0xF7E8A0F6)) - ((-1744063434 * (((2 * v99) & 0xEFD141EC) + (v99 ^ 0xF7E8A0F6)) + 690951196) & 0xCAC134E6) - 101178239) >> 5)) ^ 0x32B04D3;
  v107 = v106 - ((2 * v106) & 0xA64E8616) + 1395081995;
  v108 = ((-669946720 * v94 - ((-1339893440 * v94) & 0x8100E040) + 1082159146) ^ 0x4080702A) & 0xFFFFFFE0 | (v95 >> 27);
  v109 = ((v102 + 608573413 + (v105 ^ 0xDB641ED1)) ^ 0xDFABB495)
       + ((2 * (v102 + 608573413 + (v105 ^ 0xDB641ED1))) & 0xBF57692A)
       + 542395243
       + (v107 ^ 0x5327430B);
  v110 = (v108 ^ 0xBEDEBEF5)
       + v102
       + ((2 * v108) & 0x7DBD7DEC ^ 4)
       + (((v107 ^ 0x5327430B) + (v105 ^ 0xDB641ED1)) ^ 0x8BA8002)
       - ((2 * ((v107 ^ 0x5327430B) + (v105 ^ 0xDB641ED1))) & 0xEE8AFFFA);
  v111 = v110 + 1 - 2 * ((v110 + 548913425) & 0x24D5F9CF ^ (v110 + 1) & 4) + 93174491;
  v112 = v111 ^ (v109 - ((2 * v109) & 0x10172116) + 134975627);
  v113 = v112 ^ 0xF3073B4;
  v114 = v112 ^ 0xF99EE91B;
  v115 = 2
       * (((v112 ^ 0xF99EE91B) & (v105 ^ 0xDB641ED1)) - ((2 * ((v112 ^ 0xF99EE91B) & (v105 ^ 0xDB641ED1))) & 0x680D3812))
       - 401786862;
  v116 = (v105 ^ 0x22FAF7CA ^ v112) + (v115 ^ 0x9662178C) - 2121215902 + ((2 * v115) & 0xFCDE5F3C ^ 0xD01A5024);
  LODWORD(STACK[0x280]) = v107;
  v117 = v107 ^ v112 ^ 0xF3073B4;
  v409 = v116 - ((2 * v116) & 0xB4A7DD82) - 632033599;
  v118 = -1620594873 * (v409 ^ 0xDA53EEC1) - ((1053777550 * (v409 ^ 0xDA53EEC1)) & 0x7ECFBD82) - 1083711807;
  v119 = 1586364416 * (v409 ^ 0xDA53EEC1) - ((-1122238464 * (v409 ^ 0xDA53EEC1)) & 0xC6440000) - 484304043;
  v410 = (v111 ^ 0xA4D5F9CB)
       + (v112 ^ 0x66116E4)
       + 1
       - ((2 * ((v111 ^ 0xA4D5F9CB) + (v112 ^ 0x66116E4) + 1)) & 0x16D05C3C)
       - 1956106722;
  v120 = 161990985 * (v410 ^ 0x8B682E1E) - ((323981970 * (v410 ^ 0x8B682E1E)) & 0x43B9784E) + 568114215;
  LODWORD(STACK[0x270]) = v117;
  v121 = -1220666851 * v114 - ((1853633594 * v114) & 0x9ABCCB1E) + 1298032015;
  v122 = 2083797504 * v114 - ((-127372288 * v114) & 0xA4698C00) + 1379190698;
  v123 = ((2 * ((v119 ^ 0xE3221B55) & 0xFFFE0000 | (v118 >> 15))) & 0xDFEBD17C ^ 0x2D11C)
       + (((v119 ^ 0xE3221B55) & 0xFFFE0000 | (v118 >> 15)) ^ 0xEFF49671);
  v124 = (((-1879048192 * (v410 ^ 0x8B682E1E) + 1883588905 - ((v410 ^ 0x8B682E1E) << 29)) ^ 0x70454929) & 0xF0000000 | (v120 >> 4)) ^ 0x21DCBC2;
  v125 = v124 - 2 * (v124 & 0x53F10ABD ^ (v120 >> 4) & 0x14) + 1408305833;
  v126 = (((v122 ^ 0x5234C7AA) & 0xFFFFFE00 | (v121 >> 23)) ^ 0x7FC97374)
       + ((2 * ((v122 ^ 0x5234C7AA) & 0xFFFFFE00 | (v121 >> 23))) & 0xFF92E7DC ^ 0x115)
       - v123
       + 1;
  v127 = v126 - ((2 * v126 + 1616439708) & 0x5EDDD12A) - 1617207965;
  v128 = v125 ^ 0x53F10AA9;
  v129 = 2
       * (((v127 ^ 0x2F6EE895) & (v125 ^ 0x53F10AA9))
        + 872432290
        - ((2 * ((v127 ^ 0x2F6EE895) & (v125 ^ 0x53F10AA9))) & 0x680099D4))
       + 5264;
  v130 = v129 ^ 0x17FF74AB;
  v131 = (2 * v129) & 0xFFFFDAFC ^ 0xD00112A8;
  v132 = ((1313013760 * (v117 ^ 0xA589D9A4) - ((478543872 * (v117 ^ 0xA589D9A4)) & 0x1C2E0000) + 236431014) ^ 0xE17A6A6) & 0xFFFF0000 | ((-879604157 * (v117 ^ 0xA589D9A4) - ((-1759208314 * (v117 ^ 0xA589D9A4)) & 0xDBAD0E30) + 1842775832) >> 16);
  v133 = ((2 * v132) & 0xEFAFE9DE ^ 0xC98C) + (v132 ^ 0xF7D79939);
  v134 = 105412641 * (v125 ^ 0x53F10AA9) - ((210825282 * (v125 ^ 0x53F10AA9)) & 0x11193A48) - 2004050652;
  v135 = (v125 ^ 0x7C9FE23C ^ v127) + v130 - 2147478911 + v131;
  v136 = v133 + (v135 ^ 0x3F63FF07) + ((2 * v135) & 0x7EC7FE0E) + 587058676;
  v137 = (((-1452699648 * v123 - ((1389568000 * v123 - 1840365568) & 0xF360A000) + 1121416318) ^ 0x79B0547E) & 0xFFFFF000 | ((1148884633 * v123 - ((150285618 * v123 + 976823524) & 0x4EE514F0) + 1150229738) >> 20)) ^ 0x277;
  v138 = v137 - ((2 * v137) & 0xF54A0134) + 2057633946;
  v139 = (((-1843525568 * v128 - ((607916160 * v128) & 0x915DB900) + 1219419266) ^ 0x48AEDC82) & 0xFFFFFFC0 | (v134 >> 26)) ^ 0x22;
  v140 = v139 - 2 * (v139 & 0x6B34A7F3 ^ (v134 >> 26) & 0x10) + 1798612963;
  v141 = ((1437219328 * v136 - ((-1420528640 * v136 - 447088640) & 0xE8E43400) - 417392842) ^ 0x74721B36) & 0xFFFFFE00 | ((-1851075299 * v136 - ((592816698 * v136 - 747459332) & 0xFA98F06C) + 1728433844) >> 23);
  v142 = ((2 * v141) & 0x75FBCD9E ^ 0x194) + (v141 ^ 0x3AFDE735);
  v143 = ((1999542912 * v133 - ((240989440 * v133 + 494372096) & 0x13E27100) + 413989736) ^ 0x9F138E8) & 0xFFFFFF80 | ((-387031755 * v133 - ((299678314 * v133 + 473624330) & 0x1E9ADEE4) - 43325705) >> 25);
  v144 = ((2 * v143) & 0xDBDF1F7C ^ 0xC) + (v143 ^ 0xEDEF8FB9);
  v145 = v140 ^ 0x6B34A7E3;
  v146 = 2
       * (((v138 ^ 0x7AA5009A) & (v140 ^ 0x6B34A7E3)) - ((2 * ((v138 ^ 0x7AA5009A) & (v140 ^ 0x6B34A7E3))) & 0x28CD7798))
       + 684554136;
  v147 = (v140 ^ 0x1191A779 ^ v138) + (v146 ^ 0x97370C74) + 1074103316 + ((2 * v146) & 0x7FF4F7D8 ^ 0x5190E710);
  v148 = (v147 ^ 0x577BFBD3) - v144 + ((2 * v147) & 0xAEF7F7A6) + v142;
  v149 = ((-1937194716 * v144 - ((420577864 * v144 + 335746704) & 0x2EF24070) - 1048925310) ^ 0x1779203A) & 0xFFFFFFFC | ((1663184969 * v144 - ((105144466 * v144 + 352372132) & 0x14E87928) - 1259036826) >> 30);
  v150 = v149 ^ 0x2FFF3FE7;
  v151 = (2 * v149) & 0x5FFE7FCE;
  v152 = ((642589056 * v142 - ((1285178112 * v142 + 1074909952) & 0x75A0AE00) - 623296326) ^ 0x3AD0573A) & 0xFFFFFF80 | ((-296969661 * v142 - ((10040454 * v142 + 8397734) & 0x1255702u) + 1540537684) >> 25);
  v153 = ((2 * v152) & 0x7F3FFFEE ^ 0x80) + (v152 ^ 0x3F9FFFB7);
  v154 = -1086811273 * v153 - ((1047602926 * v153 + 188374622) & 0x2C74672C) + 1540842181;
  v155 = ((-1023942422 * v145 - ((-2047884844 * v145) & 0xFDC8C72C) + 2128896919) ^ 0x7EE46397) & 0xFFFFFFFE | ((((-1023942422 * v145) & 0xE45D7488) + 511971211 * v145 + 231818683) >> 31);
  v156 = ((2 * v155) & 0xE6DFBFEE) + (v155 ^ 0xF36FDFF7);
  v157 = ((1064435712 * v148 - ((2128871424 * v148 - 185597952) & 0xD8900000) - 423544263) ^ 0xEC493A39) & 0xFFFE0000 | ((401186745 * (v148 + 2042260487) - ((802373490 * (v148 + 2042260487) + 431367770) & 0xDB74EC84) - 90863249) >> 15);
  v158 = ((2 * v157) & 0xEACB74FE ^ 0x134E8) + (v157 ^ 0x7565610B);
  v159 = v150 + v151 + v156 - v153 - v158 - 1156441062;
  v160 = -240767569 * v158 - ((-481535138 * v158 - 1062838178) & 0xC4A7CB50) - 1029237289;
  v161 = 934308085 * v156 - ((1868616170 * v156 + 272933178) & 0xC17BA17E) - 387964580;
  v162 = ((-1149239296 * v153 - 1753219072) & 0x80000000) - 574619648 * v153 - 1949991162;
  v163 = -753477760 * v158 - ((640528128 * v158 + 1395666688) & 0x7736D800) - 449608727;
  v164 = (((2048228480 * v159 - ((-198510336 * v159 - 1212903936) & 0xA965C100) - 1332926508) ^ 0xD4B2E0D4) & 0xFFFFFF80 | ((-889967879 * v159 - ((367547890 * v159 + 1064266012) & 0x2D655E72u) - 160799801) >> 25)) ^ 0x4B;
  v165 = v164 - ((2 * v164) & 0x7C30B23A) - 1105700579;
  v166 = v154 >> 10;
  v167 = (((110055424 * v156 - ((220110848 * v156 + 1242800128) & 0xE99E8000) - 1713826094) ^ 0x74CF46D2) & 0xFFFFF000 | (v161 >> 20)) ^ 0x60B;
  v168 = v167 - 2 * (v167 & 0x2F8445F ^ (v161 >> 20) & 4) - 2097658789;
  v169 = ((v162 ^ 0xC0057F06) & 0xFFC00000 | (v154 >> 10)) ^ 0x58E8C;
  v170 = v169 - 2 * (v169 & 0x131DEADF ^ v166 & 2) - 1826755875;
  v171 = ((v163 ^ 0xBB9B6C69) & 0xFFFFFF80 | (v160 >> 25)) ^ 0x31;
  v172 = v171 - ((2 * v171) & 0xFEB224DA) + 2136543853;
  v173 = v172 ^ 0x7F59126D;
  v174 = ((2 * ((v172 ^ 0x7F59126D) + (v170 ^ 0x931DEADD))) & 0x643D17AA)
       + (((v172 ^ 0x7F59126D) + (v170 ^ 0x931DEADD)) ^ 0xB21E8BD5);
  v175 = v174 - ((2 * v174 + 709208476) & 0xCEB94C14) - 58754344;
  v176 = ((2 * v165) & 0x50DD5560 ^ 0x7F32B226)
       + (v165 & 0x686EAEBC ^ 0x66A2EC)
       + (((v165 ^ 0xD676F7A1) + 1) ^ 0x7FB479F6)
       + ((2 * ((v165 ^ 0xD676F7A1) + 1)) & 0xFF68F3EC);
  v177 = (v168 ^ v172 ^ 0x6EBCBCEB ^ v170) + (v165 ^ 0x41E7A6E2) + 1;
  v178 = v177 - ((2 * v177) & 0x1FD53D36) - 1880449381;
  v179 = ((v175 ^ v165) & 0x686EAEBC ^ 0xB7BB617F)
       + ((2 * (v175 ^ v165)) & 0xD0DD1C50 ^ 0x90891C00)
       + 1366495640
       + ((v176 - ((2 * v176 + 9901230) & 0x6C4F9970) - 160213233) ^ 0x3F2945DD ^ (((2 * (v175 & 0x97915143 ^ 0x2F140428)) & 0x3D2AA040)
                                                                                 - (v175 & 0x97915143 ^ 0x2F140428)
                                                                                 - 1593143985));
  v180 = v178 ^ 0x2D6F8661 ^ (v179 - ((2 * v179) & 0x450A31F4) - 1568335622);
  v181 = v180 - ((2 * v180 + 924603718) & 0x3E7D8182) + 449637220;
  v182 = v165 ^ 0xBE18591D;
  v183 = 2
       * (((v165 ^ 0xBE18591D) & (v181 ^ 0x1F3EC0C1)) - ((2 * ((v165 ^ 0xBE18591D) & (v181 ^ 0x1F3EC0C1))) & 0x44F13C84))
       - 990823292;
  v184 = ((v182 + (v181 ^ 0x1F3EC0C1)) ^ 0xE277F3AF)
       + ((2 * (v182 + (v181 ^ 0x1F3EC0C1))) & 0xC4EFE75E)
       + (v183 ^ 0xCC775D17)
       + ((2 * v183) & 0xEEF33CD8 ^ 0x771DC7F7)
       + 1;
  LODWORD(a31) = v184 - ((2 * v184 + 704861564) & 0x423AEB1C) + 908009548;
  v185 = a31 ^ 0x211D758E;
  v186 = -1296439527 * v185 - ((1702088242 * v185) & 0x52E019FE) + 695209215;
  LODWORD(a35) = (v181 ^ 0xE0C13F3E) + v173 + 1 - ((2 * ((v181 ^ 0xE0C13F3E) + v173 + 1)) & 0x49601B3C) - 1531966050;
  LODWORD(a20) = v178;
  LODWORD(a45) = v178 ^ v181;
  v187 = v178 ^ v181 ^ 0x90D45E5A;
  LODWORD(a23) = v181 ^ 0x1F3EC0C1;
  v188 = (((-2116205836 * (a35 ^ 0xA4B00D9E) - ((62555624 * (a35 ^ 0xA4B00D9E)) & 0x2490CE58)) & 0xFFFFFFFC | ((544690365 * (a35 ^ 0xA4B00D9E) - ((1089380730 * (a35 ^ 0xA4B00D9E)) & 0x7F73A61A) + 1069142797) >> 30))
        - 1840748756) ^ 0x9248672C;
  v189 = (((-1342177280 * (v181 ^ 0x1F3EC0C1) - ((3 * (v181 ^ 0x1F3EC0C1u)) >> 1 << 30) - 489727171) ^ 0xE2CF5B3D) & 0xF0000000 | ((1360347771 * (v181 ^ 0x1F3EC0C1) - ((-1574271754 * (v181 ^ 0x1F3EC0C1)) & 0xB67D3288) + 1530829124) >> 4)) ^ 0x5B3E994;
  v190 = v189 - ((2 * v189) & 0x8A12D732) + 1158245273;
  v191 = v188 - ((2 * v188) & 0x70221706) - 1206842493;
  v192 = (~(179695744 * (v191 ^ 0xB8110B83)) | 0xF620ABFF) - 1118111680 * (v191 ^ 0xB8110B83);
  v193 = -420123679 * (v191 ^ 0xB8110B83) - ((-840247358 * (v191 ^ 0xB8110B83)) & 0xB7D05090) + 1541941320;
  v194 = (-1367751104 * v185 - ((217287808 * v185) & 0xC055700) + 100838282) ^ 0x602AB8A;
  v195 = ((v194 & 0xFFFFFFC0 | (v186 >> 26)) ^ 0xA) + (~(2 * v194) | 0xAA1DD87F);
  v196 = (-1325400064 * v187 - ((1644167168 * v187) & 0x83FFFFFF) + 1093918938) ^ 0x4133E0DA | ((-1690437711 * v187
                                                                                               - ((914091874 * v187) & 0x281E4DEE)
                                                                                               + 336537335) >> 8);
  v197 = ((2 * v196) & 0xCD593FBE ^ 0x81E0C) + (v196 ^ 0x66B890F9);
  v198 = (((v191 ^ v190) & 0xD0555A65 ^ 0x510A40)
        + ((v191 ^ v190) & 0x80400A64 ^ 0xA12A0024)
        - (((v191 ^ v190) & 0xD0555A65 ^ 0x510A40) & 0x80400A64)) ^ 0x9E628226;
  v199 = ((v198 | 0x7C478E87) - (v198 | 0x83B87178) - 2085064328) ^ 0x930E4C85 | (((v191 ^ v190) & 0x2FAAA59A ^ 0xA940209B)
                                                                                - ((2
                                                                                  * ((v191 ^ v190) & 0x2FAAA59A ^ 0xA940209B)) & 0x1B500A24)
                                                                                + 1303990130) ^ 0xC9F14FF3;
  v200 = v199 - ((2 * v199) & 0x9BDD7BE8) - 839991820;
  v195 += 720442305;
  v201 = v195 ^ 0x2AF113C0;
  v202 = 166454526 * (v195 ^ 0x2AF113C0);
  v203 = -2064256385 * (v195 ^ 0x2AF113C0) - (v202 & 0xDA402CEC) + 1830819446;
  v204 = ((2 * (v197 - 1722589151 + (v195 ^ 0xE71FAE34 ^ v200))) & 0xBE6FB7FE)
       + ((v197 - 1722589151 + (v195 ^ 0xE71FAE34 ^ v200)) ^ 0xDF37DBFF);
  v205 = 453930003 * v204 - ((907860006 * v204 + 1647456294) & 0x7B0ACAA4) - 1365344923;
  v206 = (1815720012 * v204 - ((-663527272 * v204 - 2000109416) & 0xF82A4028) - 1065779103) ^ 0xFC152015;
  v207 = ((v206 & 0xFFFFFFFC | (v205 >> 30)) ^ 2)
       - 2 * (((v206 & 0xFFFFFFFC | (v205 >> 30)) ^ 2) & 0x19B982CF ^ v206 & 4);
  v208 = ((v193 >> 26) ^ 0x16 | ((v192 - 2064668137) | 1) ^ 0x84EFAA17)
       - 2 * (((v193 >> 26) ^ 0x16 | ((v192 - 2064668137) | 1) ^ 0x84EFAA17) & 0x4DBC9DBD ^ ((v193 >> 26) ^ 0x16) & 0xC)
       - 843276879;
  v209 = (v202 - ((332909052 * v201) & 0x3D2351D0)) & 0xFFFFFFFE | (v203 >> 31);
  v210 = 2082551535 * v197 - ((-129864226 * v197 + 918383006) & 0xC0B3F7E2) + 2075701440;
  v211 = v207 - 1715895605;
  v212 = (v207 - 1715895605) ^ 0x99B982CB;
  v213 = ((2 * (v209 + 512862440)) & 0xF1DEDFEE ^ 0x310251C0) + ((v209 + 512862440) ^ 0xE67EC71F);
  v214 = -1038913808 * v197 - ((-2077827616 * v197 + 1809226208) & 0xE369CC80) - 1482673347;
  v215 = (((v214 ^ 0xF1B4E64D) & 0xFFFFFFF0 | (v210 >> 28)) ^ 6)
       - ((2 * ((v214 ^ 0xF1B4E64D) & 0xFFFFFFF0 | (v210 >> 28))) & 0x64CB0AB2);
  v216 = v213
       + 118525961
       + (v208 ^ 0x54051F7A ^ v211)
       - ((2 * (v213 + 118525961 + (v208 ^ 0x54051F7A ^ v211))) & 0x8E358F3A)
       + 1192937373;
  v215 -= 1301969575;
  v217 = (((-860618752 * v212 - ((426246144 * v212) & 0x1D600000) + 246590248) ^ 0xEB2AB28) & 0xFFFC0000 | ((1042658093 * v212 - ((2085316186 * v212) & 0x4BB3A47C) - 1512451522) >> 14)) ^ 0x29767;
  v218 = ((1115684864 * v213 - ((-2063597568 * v213 - 1392508928) & 0x99999999) + 589719244) ^ 0xCCA666CC | ((-2050956155 * v213 - ((193054986 * v213 + 1061531994) & 0x5A8738B4) + 1290171655) >> 9)) ^ 0x16A1CE;
  v219 = ((1834029632 * (v215 ^ 0xF57F42C4 ^ v216)
         - ((-626908032 * (v215 ^ 0xF57F42C4 ^ v216)) & 0x97D03700)
         + 1273502614) ^ 0x4BE81B96) & 0xFFFFFFC0 | ((1840596041 * (v215 ^ 0xF57F42C4 ^ v216)
                                                    - ((-613775214 * (v215 ^ 0xF57F42C4 ^ v216)) & 0xA4797C48)
                                                    - 767771100) >> 26);
  v220 = ((2 * v219) & 0x7FFF5FBA ^ 0x28) + (v219 ^ 0xBFFFAFE9);
  v221 = v217 - ((2 * v217) & 0x7B7BFA44) - 1111622366;
  v222 = ((v218 - ((2 * v218) & 0x20083C24) + 268705298) ^ 0xADB9E330 ^ v221) + 1073762339 + v220;
  v223 = ((-913686536 * (v215 ^ 0xB2658559) - ((-1827373072 * (v215 ^ 0xB2658559)) & 0xAEAB3690) - 682255542) ^ 0xD7559B4A) & 0xFFFFFFF8 | ((-114210817 * (v215 ^ 0xB2658559) - ((1919062014 * (v215 ^ 0xB2658559)) & 0x793AD536) + 1016949403) >> 29);
  v224 = ((2 * v223) & 0xEF2EF646 ^ 2) + (v223 ^ 0x77977B22);
  v225 = (v222 ^ 0x7F31FB9F) - v224 + ((2 * v222) & 0xFE63F73E);
  v226 = (((806940672 * v220 - ((1613881344 * v220 + 1020370944) & 0x62EF0000) + 266362466) ^ 0xB1778E62) & 0xFFFFF000 | ((1305674127 * v220 - ((463864606 * v220 + 682347802) & 0x63D0CD46) + 104746288) >> 20)) ^ 0xB1E;
  v227 = v226 - ((2 * v226) & 0x34729894) + 439962698;
  v228 = ((1657047320 * v225 - 2 * ((1657047320 * v225 + 1137809504) & 0x465E43B8 ^ (1657047320 * v225) & 8) - 1976574954) ^ 0xC65E43B6) & 0xFFFFFFF8 | ((207130915 * v225 - ((414261830 * v225 - 252418536) & 0xBFDA8616) - 664308201) >> 29);
  v229 = ((-1543503872 * (v221 ^ 0xBDBDFD22) - ((9 * (v221 ^ 0xBDBDFD22)) >> 3 << 30) - 533452365) ^ 0xE03429B3) & 0xFC000000 | ((49236329 * (v221 ^ 0xBDBDFD22) - ((98472658 * (v221 ^ 0xBDBDFD22)) & 0x71980300) + 952893824) >> 6);
  v230 = ((2 * v229) & 0xFC9FEF7E ^ 0x86600C) + (v229 ^ 0x7EACC7B9);
  v231 = (v227 ^ 0xE5C6B3B5)
       + v230
       - 2 * (((v227 ^ 0xE5C6B3B5) + v230 + 28313666) & 0x68A5622F ^ ((v227 ^ 0xE5C6B3B5) + v230) & 1)
       - 363500944;
  v232 = ((-922746880 * v224 - ((301989888 * v224 + 167772160) & 0x16000000) - 1878053065) ^ 0xB0F2F37) & 0xFF000000 | ((-116661559 * v224 - ((-233323118 * v224 + 330618634) & 0xA4556078) + 1543838657) >> 8);
  v233 = (v232 ^ 0x7FACD077) + ((2 * v232) & 0xFFFDF58E ^ 0xA45501) - v230 + 1;
  v234 = (v228 ^ 2) - 2 * ((v228 ^ 2) & 0x4CA28CBF ^ v228 & 0x19) + 1285721254;
  v235 = v227 ^ (v233 - ((2 * v233 - 56493588) & 0xE162B144) + 1862423960) ^ v234;
  v236 = ((2 * v235) & 0xBFF9FBEE ^ 0xC51308C) + (v235 ^ 0xF9D665B9);
  v237 = ((501739513 * (v234 ^ v231 ^ 0x7BF11B01)) ^ 0x7DAFB6FB)
       + ((1003479026 * (v234 ^ v231 ^ 0x7BF11B01)) & 0xFB5F6DF6)
       - v236;
  v238 = v237 - ((2 * v237 + 1309547788) & 0x58E98CE0) + 1400624374;
  v408 = (v238 ^ 0xD38B398F)
       + (v234 ^ 0x4CA28CA6)
       + 1
       - ((2 * ((v238 ^ 0xD38B398F) + (v234 ^ 0x4CA28CA6) + 1)) & 0x9EC84B36)
       - 815520357;
  LODWORD(a43) = v236 + (v238 ^ 0xD38B398F) - ((2 * (v236 + (v238 ^ 0xD38B398F)) + 1074136084) & 0x5C8A3A18) - 834134250;
  LODWORD(a27) = v227;
  LODWORD(a37) = v227 ^ v238;
  v239 = (~(833290240 * (v408 ^ 0xCF64259B)) | 0xB34BFFFF) - 1730838528 * (v408 ^ 0xCF64259B) - 1504026064;
  v240 = (((669581312 * (v227 ^ v238 ^ 0x364D8A3A) - ((1339162624 * (v227 ^ v238 ^ 0x364D8A3A)) & 0xD41C0000) - 368121267) ^ 0xEA0EEA4D) & 0xFFFF0000 | ((1654073321 * (v227 ^ v238 ^ 0x364D8A3A) - ((-986820654 * (v227 ^ v238 ^ 0x364D8A3A)) & 0xD13248BA) + 1754866781) >> 16)) ^ 0x6899;
  v241 = (((24903680 * (v238 ^ 0x2C74C670) - ((49807360 * (v238 ^ 0x2C74C670)) & 0x31400000) + 413362176) ^ 0x18A36800) & 0xFFFC0000 | ((-1954414497 * (v238 ^ 0x2C74C670) - ((386138302 * (v238 ^ 0x2C74C670)) & 0x325BD9ACu) - 1725043498) >> 14)) ^ 0x264B7;
  v242 = ((83886080 * (a43 ^ 0xAE451D0C) - ((167772160 * (a43 ^ 0xAE451D0C)) & 0x3C000000) - 1639966067) ^ 0x9E401A8D) & 0xFF000000 | ((1118063365 * (a43 ^ 0xAE451D0C) - ((88643082 * (a43 ^ 0xAE451D0C)) & 0x1F802F50) - 1883236440) >> 8);
  v243 = ((2 * v242) & 0xB6ACB5AE ^ 0xC802E) + (v242 ^ 0xDBD99AC0);
  v244 = ((2 * (v239 & 0xE71B8000 ^ 0xEE7AC424)) & 0x54348000) - (v239 & 0xE71B8000 ^ 0xEE7AC424) - 974805443;
  v245 = (1201746347 * (v408 ^ 0xCF64259B) - ((-1891474602 * (v408 ^ 0xCF64259B)) & 0x9886D0F8) - 867997572) >> 17;
  v246 = ((v244 ^ 0x8D856219 | v245 & 0xD4D) ^ 0x401) - ((2 * ((v244 ^ 0x8D856219 | v245 & 0xD4D) ^ 0x401)) & 0x25EA9C);
  v247 = ((v245 & 0x72B2 ^ 0x90) + (v245 & 0x6092 ^ 0x3A74610F) - ((v245 & 0x72B2 ^ 0x90) & 0x6092)) ^ 0x6E740FDB;
  v248 = ((v239 & 0x18E40000 ^ 0xF75FFFFF) + 893608736 + ((2 * (v239 & 0x18E40000)) | 0x957939C2)) ^ 0xCCFE0CA7;
  v249 = ((2 * v248) & 0x7C210008) - v248 - 1041344053;
  HIDWORD(v83) = (v246 + 1242446) ^ 0x12F54E;
  LODWORD(v83) = v244 ^ 0x8D000000;
  v250 = (v83 >> 24) - ((2 * (v83 >> 24)) & 0xE729D788);
  HIDWORD(v83) = v249 ^ 0x4CC98D;
  LODWORD(v83) = v249 ^ 0xCFFFFFFF;
  v251 = (v250 + 1939139524) ^ 0x7394EBC4 | ((v83 >> 24) - ((2 * (v83 >> 24)) & 0xDB184F30) + 1837901720) ^ 0x6D8C2798;
  v252 = v251 - ((2 * v251) & 0xBCE95680) + 1584704320;
  v253 = -500708777 * v243 - ((1146066094 * v243 + 1517352414) & 0x7E222CF4) - 330722967;
  HIDWORD(v83) = v252 ^ 0x3C;
  LODWORD(v83) = v252 ^ 0x9B42E300;
  v254 = (v241 - ((2 * v241) & 0x4077DD2A) + 540798613) ^ 0x275182B8;
  v255 = v240 - ((2 * v240) & 0xED4D85A) + 124415021;
  v256 = (~(2091216896 * v243 - 2018578432) | 0x7EE44FFF) + 1045608448 * v243;
  v257 = (v247 - ((2 * v247) & 0x20064564) - 1717361997) ^ 0x23BF6BC8 ^ ((v83 >> 8)
                                                                       - ((2 * (v83 >> 8)) & 0x25B2E78E)
                                                                       - 1831242809);
  v258 = (((v254 ^ v255) + 615097641 + v243) ^ 0xFBFDFD7E)
       + ((2 * ((v254 ^ v255) + 615097641 + v243)) & 0xF7FBFAFC)
       + 67240578
       + v257;
  v259 = ((2 * v258) & 0xCE3F1D7E) + (v258 ^ 0xE71F8EBF);
  v260 = (((1396588544 * v259 - ((-1501790208 * v259 + 974946304) & 0x82318000) + 1579629357) ^ 0xC118FB2D) & 0xFFFFC000 | ((-598913799 * v259 - ((-1197827598 * v259 - 2131433358) & 0xB43000A2) + 445805706) >> 18)) ^ 0x1686;
  v261 = (((-1543503872 * (v255 ^ 0x76A6C2D) - ((1207959552 * (v255 ^ 0x76A6C2D)) & 0x90000000) + 1251431010) ^ 0x4A975262) & 0xFC000000 | ((-2138815767 * (v255 ^ 0x76A6C2D) - ((17335762 * (v255 ^ 0x76A6C2D)) & 0x1CD8F78Eu) - 1905493049) >> 6)) ^ 0x239B1EF;
  v262 = v261 - ((2 * v261) & 0x7D172EDE) - 1098147985;
  v263 = ((v253 >> 20) & 0xE4E ^ 0x240) + ((v253 >> 21) ^ 0x5EFEFEDF);
  v264 = v263 - 1593769767;
  v265 = v263
       + (((v263 - 1593769767) | (v256 - 2073733739) ^ 0xC08DDD94) ^ 0x6C00001)
       - ((2 * ((v263 - 1593769767) | (v256 - 2073733739) ^ 0xC08DDD94)) & 0xF27FFFFC)
       + 1;
  v266 = ((809500672 * v257 - ((1619001344 * v257) & 0x4E800000) + 659922712) ^ 0x27559F18) & 0xFFC00000 | ((-321459007 * v257 - ((-642918014 * v257) & 0xFF7DEEBE) + 2143221599) >> 10);
  v267 = ((2 * v266) & 0xF9FB3F8A ^ 0x3B1F0A) + (v266 ^ 0xFCE27078);
  v268 = ((v256 - 2073733739) ^ (((v256 - 2073733739) ^ 0x3F72226B)
                               - ((2 * ((v256 - 2073733739) ^ 0x3F72226B) + 2) & 0x7046B000)
                               + 941841670) ^ 0x5498180B ^ (v265 - ((2 * v265 + 880935342) & 0x586D3134) + 1182243185))
       + v264;
  v269 = v260 - ((2 * v260) & 0x78C0DDE0) + 1012952816;
  v270 = (v262 ^ 0x82EBF99F ^ v269)
       - v267
       - ((2 * ((v262 ^ 0x82EBF99F ^ v269) - v267) - 100974710) & 0xE46522A4)
       - 282054377;
  v271 = v268 - ((2 * v268) & 0x6E30F2) + 3610745;
  v272 = 2
       * (((v270 ^ 0xF2329152) & (v271 ^ 0x371879)) - ((2 * ((v270 ^ 0xF2329152) & (v271 ^ 0x371879))) & 0x2CCF5CC8))
       + 751787208;
  v273 = (v271 ^ 0xF205892B ^ v270) + (v272 ^ 0xD3B087F3) + 8397334 + ((2 * v272) & 0xFEFFB674 ^ 0x589EB010) + 687;
  v274 = ((5843480 * (((2 * v273) & 0xF3A8DDEC) + (v273 ^ 0xF9D46EF6))
         - ((11686960 * (((2 * v273) & 0xF3A8DDEC) + (v273 ^ 0xF9D46EF6)) + 1287027168) & 0x56D1F130)
         - 775670389) ^ 0xAB68F89B) & 0xFFFFFFF8 | ((1074472259 * (((2 * v273) & 0xF3A8DDEC) + (v273 ^ 0xF9D46EF6))
                                                   - ((1460870 * (((2 * v273) & 0xF3A8DDEC) + (v273 ^ 0xF9D46EF6))
                                                     + 1234620220) & 0x56A2E51A)
                                                   - 803415509) >> 29);
  v275 = ((2 * v274) & 0xBF1D96BE ^ 2) + (v274 ^ 0x5F8ECB5E);
  v276 = ((423272448 * v267 - ((846544896 * v267 + 419807232) & 0x970BC000) + 1476972231) ^ 0x4B85EEC7) & 0xFFFFE000 | ((-1340552747 * v267 - ((1613861802 * v267 - 400504786) & 0xC7F63E1A) + 1477149476) >> 19);
  v277 = ((-404862976 * (v269 ^ 0x3C606EF0) - ((-809725952 * (v269 ^ 0x3C606EF0)) & 0xA0F1D000) - 797382103) ^ 0xD078EA29) & 0xFFFFF800 | ((790428617 * (v269 ^ 0x3C606EF0) - ((1580857234 * (v269 ^ 0x3C606EF0)) & 0xFC726C22) - 29805039) >> 21);
  v278 = ((2 * v277) & 0xFFF9FDC6 ^ 0xDC2) + (v277 ^ 0x7FFCF912);
  v279 = (((-1582301184 * (v271 ^ 0x371879) - ((1130364928 * (v271 ^ 0x371879)) & 0xD1200000) + 1754966192) ^ 0x689AA8B0) & 0xFFF00000 | ((502667803 * (v271 ^ 0x371879) - ((468464694 * (v271 ^ 0x371879)) & 0x1E98EDCEu) - 1890814233) >> 12)) ^ 0x8F4C7;
  v280 = ((2 * v276) & 0xF3DD6FB4 ^ 0x8B4) + (v276 ^ 0x79EEBBA5) + v278 + v275;
  HIDWORD(v83) = ~v278;
  LODWORD(v83) = 1620640691 * v278 + 568114215 - ((20055910 * v278 + 182729870) & 0x18D551BE) + 2815;
  v281 = v280 - ((2 * v280 + 218823624) & 0xAC66E84) - 1410812634;
  v282 = ((2 * (v83 >> 2)) & 0xFEFDDFF6 ^ 0x6355466) + ((v83 >> 2) ^ 0xFC6445CC);
  v283 = v279 - ((2 * v279) & 0xA9F0CC6A) + 1425565237;
  v284 = (-1207959552 * (v283 ^ 0x54F86635)) | ((-763743529 * (v283 ^ 0x54F86635)
                                               - ((83125678 * (v283 ^ 0x54F86635)) & 0x6289F52)
                                               - 2095820887) >> 5);
  v285 = ((2 * v284) & 0xFAFDDB62 ^ 0x8314062) + (v284 ^ 0xF9664FCC) + v282;
  v286 = (((470482944 * (v283 ^ 0x519B5177 ^ v281) - ((940965888 * (v283 ^ 0x519B5177 ^ v281)) & 0x21B80000) - 1864627418) ^ 0x90DC0B26) & 0xFFFF0000 | ((-642049013 * (v283 ^ 0x519B5177 ^ v281) - ((-1284098026 * (v283 ^ 0x519B5177 ^ v281)) & 0x961DAC5E) - 888220113) >> 16)) ^ 0xCB0E;
  v287 = (((-312541184 * v275 - ((1522401280 * v275 + 696123392) & 0x41B40000) + 899277458) ^ 0xA0DAE292) & 0xFFFF0000 | ((-2010583713 * v275 - ((5364414 * v275 + 29829502) & 0xA1F9EC6) - 1644993502) >> 16)) ^ 0x850F;
  v288 = v287 - ((2 * v287) & 0x5F12A506) + 797528707;
  v289 = 475398709
       * (((2 * (v282 + 8458246 + (v288 ^ 0xD076AD7C))) & 0xFFF7B776)
        + ((v282 + 8458246 + (v288 ^ 0xD076AD7C)) ^ 0xFFFBDBBB));
  v290 = v286 - ((2 * v286) & 0xA732727A) + 1402550589;
  v291 = v289 + (v290 ^ 0xAC66C6C2) - 1188787245 + 1;
  v292 = v291 ^ 0xF6CE78DF;
  v293 = (2 * v291) & 0xED9CF1BE;
  v294 = (v285 + 31778679 + (~(2 * v285 + 100943016) | 0x23A75BB)) ^ 0xD16B97A1 ^ v288;
  v295 = v294 - 1188787245 + v289;
  v296 = (((v290 ^ 0x5399393D) + v294) ^ 0x7DBFFEF1) - 2109734641 + ((2 * ((v290 ^ 0x5399393D) + v294)) & 0xFB7FFDE2);
  v297 = 2 * (((v292 + 154240801 + v293) & v296) - ((2 * ((v292 + 154240801 + v293) & v296)) & 0x246DDEB2)) - 1536303438;
  v298 = (v295 ^ 0x679FEFCF)
       + ((2 * v295) & 0xCF3FDF9E)
       + (v297 ^ 0xA8D45A1D)
       + ((2 * v297) & 0xE68CF6A0 ^ 0xBF774BDF)
       + 1;
  v299 = -260289343 * v298 - ((1626904962 * v298 + 1508084228) & 0x61264742) - 578492253;
  v300 = ((2 * ((v288 ^ 0x2F895283) + (v299 ^ 0xB09323A1))) & 0xAFCDBFD6)
       + (((v288 ^ 0x2F895283) + (v299 ^ 0xB09323A1)) ^ 0xD7E6DFEB);
  LODWORD(STACK[0x13F0]) = v113;
  LODWORD(STACK[0x13F4]) = v181;
  LODWORD(STACK[0x13FC]) = v238 ^ 0x2C74C670;
  v301 = v296 + (v299 ^ 0xB09323A1) - ((2 * (v296 + (v299 ^ 0xB09323A1))) & 0xB5660332);
  v302 = -574539943 * v300 - ((-1149079886 * v300 + 1324045466) & 0x8ADBAF22) - 320634402;
  LODWORD(STACK[0x1400]) = v299;
  LODWORD(a29) = v290 ^ v299;
  v303 = v290 ^ v299 ^ 0xE30A1A9C;
  v304 = -1013007915 * v303 - ((121467818 * v303) & 0x5555AB68) - 1431644748;
  v305 = 652943360 * v300 - ((1305886720 * v300 + 1788035072) & 0x93844000);
  v306 = 485871272 * v303 - ((971742544 * v303) & 0xBF486140);
  LODWORD(a47) = v301 - 625802855;
  v307 = (-(((v298 << 27) + 0x10000000) & 0x38000000) - 469762048 * v298 + 1696519585) ^ 0x9D1ED5A1 | (((~(-58064142 * v298 + 2090525924) | 0x5D9A2B23) + 2118451577 * v298 - 1887413023) >> 6);
  v308 = v307 ^ 0x36881100;
  v309 = (2 * v307) & 0x6F99B552 ^ 0x2899552;
  v310 = ((v305 - 16006617) ^ 0x49C22227) & 0xFFFFE000 | (v302 >> 19);
  v311 = ((2 * v310) & 0xFFF4BFF2 ^ 0x1152) + (v310 ^ 0x7FFA5754);
  v312 = ((v306 + 1604595879) ^ 0x5FA430A7) & 0xFFFFFFF8 | (v304 >> 29);
  v313 = ((2 * v312) & 0xB7DF5C7E ^ 0xA) + (v312 ^ 0xDBEFAE3A);
  v314 = (-1275068416 * ((v301 - 625802855) ^ 0xDAB30199)
        - ((1744830464 * ((v301 - 625802855) ^ 0xDAB30199)) & 0xCFFFFFFF)
        + 1714212978) ^ 0x662CD072 | ((-1206758611 * ((v301 - 625802855) ^ 0xDAB30199)
                                     - ((1881450074 * ((v301 - 625802855) ^ 0xDAB30199)) & 0x6F0C826E)
                                     - 1215938249) >> 6);
  v315 = ((2 * v314) & 0xF4FD7BEE ^ 0x4BC3208) + (v314 ^ 0x78A0A4F3);
  v316 = -1350252115 * v315 - ((50959194 * v315 + 28140074) & 0x3039986) - 363299368;
  v317 = v315 - (v313 + v311) + v308 + v309 - 814787552;
  v318 = -2067157760 * v315 - ((160651776 * v315 + 224537088) & 0x1ABEA800) + 1678797144;
  LODWORD(v52) = ((-200301568 * v313 - ((-400603136 * v313 + 1700612096) & 0xACDAC800) - 1994650663) ^ 0x566D67D9) & 0xFFFFFC00 | ((1497170921 * v313 - ((-1300625454 * v313 + 798578514) & 0xBE771780) + 1997027177) >> 22);
  LODWORD(v52) = ((2 * v52) & 0xAF41FBEE ^ 0x2E8) + (v52 ^ 0x57A0FE8B);
  v319 = (((-1590091136 * v311 - ((41043200 * v311 + 88072960) & 0x75F1900) - 833651103) ^ 0x3AF8CE1) & 0xFFFFFF80 | ((-381521339 * v311 - ((-763042678 * v311 + 1193967558) & 0xE70F7DA6) + 387776182) >> 25)) ^ 0x39;
  v320 = (((-1342177280 * v317 - ((1610612736 * v317) & 0x40000000) + 666103228) ^ 0xA7B3EDBC) & 0xF0000000 | ((1518309211 * v317 - 2 * ((1518309211 * v317 + 217771432) & 0x199E5B9F ^ (1518309211 * v317) & 5u) - 963032766) >> 4)) ^ 0x199E5B9;
  v321 = v320 - ((2 * v320) & 0xF5A16FCE) - 86984729;
  v322 = 585138875 * (v321 ^ 0xFAD0B7E7) - ((1170277750 * (v321 ^ 0xFAD0B7E7)) & 0xBB08596A) + 1568943285;
  v323 = -2101673984 * (v321 ^ 0xFAD0B7E7) - ((91619328 * (v321 ^ 0xFAD0B7E7)) & 0xBE7E0000);
  v324 = ((2 * ((v318 ^ 0x8D5F5458) & 0xFFFFFF00 | HIBYTE(v316))) & 0xE5E3D28C)
       + (((v318 ^ 0x8D5F5458) & 0xFFFFFF00 | HIBYTE(v316)) ^ 0xF2F1E947);
  v325 = ((v319 - ((2 * v319) & 0xB31DE46A) + 1502540341) ^ 0xA35E45D2 ^ v321) - v324 - 219027130;
  v326 = v52 + (v325 ^ 0xFF3EDB71) + ((2 * v325) & 0xFE7DB6E2) - 355242048;
  v327 = 1393874611 * v326 - ((-1507218074 * v326 + 45666832) & 0xB2001AAA) - 631474595;
  v328 = -1248329728 * v326 - ((1798307840 * v326 - 1870659584) & 0xBB300000) + 634919261;
  LOBYTE(v103) = ((v103 & 8 ^ 0x68) - (v103 & 8) + (v103 & 0x18 ^ 0x10)) ^ 0x78;
  LOBYTE(v326) = ((2 * v103) & 0xC0) - v103 + 26;
  v329 = (((v323 + 1597979203) ^ 0x5F3F3A43) & 0xFFFF0000 | HIWORD(v322)) ^ 0x5D84;
  v330 = v329 - 2 * (v329 & 0x16413E77 ^ HIWORD(v322) & 0x10);
  v331 = 44292883 * v324 - ((88585766 * v324 + 64330652) & 0x517702A) + 1953924579;
  v332 = ((2 * ((v328 ^ 0xDD98195D) & 0xFFF80000 | (v327 >> 13))) & 0xFBF557D6 ^ 0x51000)
       + (((v328 ^ 0xDD98195D) & 0xFFF80000 | (v327 >> 13)) ^ 0x7DF863EB);
  LODWORD(v52) = (((-2046820352 * v52 - ((201326592 * v52 + 1811939328) & 0xAC000000) - 1915999320) ^ 0xD7CC2BA8) & 0xFE000000 | ((-1084615357 * (_DWORD)v52 - ((2125736582 * (_DWORD)v52 - 1805350218) & 0xD9D6C4AC) - 1222793295) >> 7)) ^ 0xD9D6C4;
  v330 += 373374567;
  v333 = ((v52 - ((2 * v52) & 0xAFB10052) - 673677271) ^ 0xC199BE4E ^ v330)
       - v332
       + 2113580011
       - ((2 * (((v52 - ((2 * v52) & 0xAFB10052) - 673677271) ^ 0xC199BE4E ^ v330) - v332 + 2113580011)) & 0x982E143E)
       - 870905313;
  v334 = ((((v331 ^ 0x828BB815) << (v326 ^ 0x1A))
         - ((2 * ((v331 ^ 0x828BB815) << (v326 ^ 0x1A))) & 0x1A4BF96C)
         - 1926890314) ^ 0x8D25FCB6) << (v326 ^ 2);
  v335 = ((v331 >> 7) & 0x1CFFE76 ^ 0x1051670)
       + ((v331 >> 8) ^ 0x67657483)
       + (v334 ^ 0x9B99F6BB)
       + ((2 * v334) & 0x3733ED76);
  v336 = v335 - ((2 * v335 + 956044308) & 0x26D70796) + 266964437;
  v337 = (((102760448 * v332 - ((205520896 * v332 + 20971520) & 0xB8000000) + 1554716864) ^ 0x5C0B18C0) & 0xFFE00000 | ((-1155489743 * v332 - ((1983987810 * v332 + 577007626) & 0xFFACEE6E) + 285781820) >> 11)) ^ 0x1FFACE;
  v338 = (v333 ^ v336) == -545486380;
  v339 = ((-637534208 * (v333 ^ v336 ^ 0xDF7C89D4) - ((872415232 * (v333 ^ v336 ^ 0xDF7C89D4)) & 0x68000000) + 899456427) ^ 0x359C9DAB) & 0xFE000000 | ((1553902573 * (v333 ^ v336 ^ 0xDF7C89D4) - ((-1187162150 * (v333 ^ v336 ^ 0xDF7C89D4)) & 0xFF8669E4) - 3984142) >> 7);
  v340 = ((2 * v339) & 0xFCD7FEB6 ^ 0xD70C92) + (v339 ^ 0xFF947932);
  v341 = (((802160640 * (v330 ^ 0x16413E67) - ((1604321280 * (v330 ^ 0x16413E67)) & 0xBD400000) + 1588307587) ^ 0x5EABA683) & 0xFFF00000 | ((-1037212931 * (v330 ^ 0x16413E67) - ((73057786 * (v330 ^ 0x16413E67)) & 0x2F92BC7E) - 1748410817) >> 12)) ^ 0x97C95;
  v342 = v341 - ((2 * v341) & 0xC0840692) - 532544695;
  v343 = (((-1685487616 * (v336 ^ 0x136B83CB) - ((923992064 * (v336 ^ 0x136B83CB)) & 0xB1560000) + 1487618594) ^ 0x58AB4222) & 0xFFFF8000 | ((-1013762285 * (v336 ^ 0x136B83CB) - ((119959078 * (v336 ^ 0x136B83CB)) & 0x41D329C4u) - 1595304734) >> 17)) ^ 0x5074;
  v344 = v337 - ((2 * v337) & 0x5F0AC06) + 49829379;
  LODWORD(v52) = (v344 ^ 0x2F85603)
               + (((v342 ^ 0xE0420349) - v340 - 26476709) ^ 0xD7FBD2D1)
               + ((2 * ((v342 ^ 0xE0420349) - v340 - 26476709)) & 0xAFF7A5A2)
               + 967939562;
  v340 += 26476709;
  v345 = v340 + ((v343 - ((2 * v343) & 0xE784E3D4) + 1942122986) ^ v342 ^ 0x917824A0 ^ v344);
  v346 = v345 - ((2 * v345) & 0x7130ADB2) - 1197975847;
  v347 = v346 ^ 0x26299C77 ^ (-174343781 * (((2 * v52) & 0xF39FBBFA) + (v52 ^ 0xF9CFDDFD))
                            - ((725054262 * (((2 * v52) & 0xF39FBBFA) + (v52 ^ 0xF9CFDDFD)) + 1024689570) & 0x3D63955C)
                            - 1657041537);
  v348 = 698029099 * v347 - ((1396058198 * v347) & 0x8AF42A1C) + 1165628686;
  LODWORD(a39) = v344 ^ v348;
  v349 = v344 ^ v348 ^ 0x4782430D;
  LODWORD(a49) = v340 + (v348 ^ 0x457A150E) - ((2 * (v340 + (v348 ^ 0x457A150E))) & 0x84E3C6FA) + 1114760061;
  LODWORD(v52) = a49 ^ 0x4271E37D;
  v350 = -1656869415 * v52 - ((981228466 * v52) & 0x3FF9DBDA) + 536669677;
  v351 = 1541872627 * v347 - ((-1211222042 * v347) & 0x96633B30) + 1261542808;
  v352 = -1670394880 * v347 - ((954177536 * v347) & 0x68907800);
  LODWORD(v52) = -244398080 * v52 - ((48074752 * v52) & 0x1FA7C000) + 265545232;
  v353 = ((v52 & 0x6E12C000 ^ 0x9FFFFAA6) - ((2 * (v52 & 0x6E12C000 ^ 0x9FFFFAA6)) & 0x10058000) - 2043303609) ^ 0x89CFD800;
  v354 = v52 ^ 0xFD3E610;
  if (v338)
    v355 = -2048;
  else
    v355 = v353;
  v356 = (v355 & v354) - ((2 * (v355 & v354)) & 0xDB275000);
  LODWORD(a25) = v346;
  LODWORD(a41) = v346 ^ v348;
  v357 = v346 ^ v348 ^ 0xFDE243D7;
  v358 = -2139717463 * v357 - ((15532370 * v357) & 0x921A262) + 76599601;
  v359 = ((v352 - 1270334084) ^ 0xB4483D7C) & 0xFFFFFC00 | (v351 >> 22);
  v360 = v359 ^ 0x7A7E54F3;
  v361 = (2 * v359) & 0xF4FCABBE ^ 0x218;
  v362 = (v356 + 1838395042) ^ 0x6D93AEA2 | (v350 >> 21) ^ 0xFF;
  v363 = ((2 * v362) & 0xFFEDF7DC) + (v362 ^ 0xFFF6FBEE);
  v364 = (((1079279616 * v357 - ((11075584 * v357) & 0x53F20000) - 1443272651) ^ 0xA9F96835) & 0xFFFF8000 | (v358 >> 17)) ^ 0x248;
  v365 = v364 - 2 * (v364 & 0xEE41B13 ^ (v358 >> 17) & 2);
  v366 = ((-1511489536 * v349 - ((1271988224 * v349) & 0x49840000) - 1530763009) ^ 0xA4C268FF) & 0xFFFF8000 | ((-1585755183 * v349 - ((1123456930 * v349) & 0xB0B48350) - 665173592) >> 17);
  v367 = ((2 * v366) & 0xAB7279DE ^ 0x585A) + (v366 ^ 0x55B950C2);
  v365 += 249830161;
  v368 = v365 ^ 0x372FBBBA ^ (v360
                            + v361
                            + v367
                            - v363
                            - 2
                            * ((v360 + v361 + v367 - v363 + 801073440) & 0x39CBA0BB ^ (v360 + v361 + v367 - v363) & 0x10)
                            + 1770719691);
  v369 = ((322961408 * v367 - ((645922816 * v367 + 243269632) & 0xEB000000) + 2095058205) ^ 0x75A00D1D) & 0xFFC00000 | ((2045702221 * v367 - ((-203562854 * v367 - 504547270) & 0xAA13A7D4) - 973049849) >> 10);
  v370 = ((1952016048 * v368 - ((1756548448 * v368) & 0x55E9D880) + 720694345) ^ 0x2AF4EC49) & 0xFFFFFFF0 | ((1732613739 * v368 - ((1317743830 * v368) & 0x64CE7952u) + 845626537) >> 28);
  v371 = ((2 * v370) & 0xA7FFEFFC ^ 4) + (v370 ^ 0x53FFF7FD);
  v372 = (783537063 - 805306368 * v363) ^ 0x8EB3D3A7 | ((-832121027 * v363
                                                       - ((483241594 * v363 + 1601842324) & 0x7C74EF94)
                                                       - 302543340) >> 4);
  v373 = ((2 * v372) & 0xCFDDDBEA ^ 0x7C54AE8) + (v372 ^ 0xE40D4A89);
  v374 = (((-((v365 << 25) & 0x4C000000) - 2130706432 * (v365 ^ 0xEE41B11) + 647430872) ^ 0x269702D8) & 0xFF000000 | ((-1470272127 * (v365 ^ 0xEE41B11) - ((1354423042 * (v365 ^ 0xEE41B11)) & 0xB1563596) - 659875125) >> 8)) ^ 0xD8AB1A;
  v375 = ((2 * v369) & 0xDEE3BDBE ^ 0x6284A8) + (v369 ^ 0xEF449CAB) + v373 - v371;
  v376 = v374 - ((2 * v374) & 0x4FD77AB8) + 669760860;
  v377 = v376 ^ 0x27EBBD5C;
  v378 = -2131561189 * (v376 ^ 0x27EBBD5C) - ((31844918 * (v376 ^ 0x27EBBD5C)) & 0x93FF0DDC) + 1241482990;
  v379 = v376 ^ 0xABDA9C24 ^ (v375 - ((2 * v375 + 423515732) & 0x186242F0) + 147868834);
  v380 = ((496806528 * v371 - ((993613056 * v371 + 1092266496) & 0x61F6D100) - 779567625) ^ 0xB0FB68F7) & 0xFFFFFF80 | ((-1875166891 * v371 - ((544633514 * v371 + 746730836) & 0xF3AC996E) - 1877514399) >> 25);
  v381 = ((2 * v380) & 0x3BBD6F60 ^ 0x60) + (v380 ^ 0x9DDEB78C);
  v382 = ((1433600000 * v379 - ((182845440 * v379) & 0x19A40000) + 215101161) ^ 0xCD22EE9) & 0xFFFF0000 | ((-940223117 * v379 - ((-1880446234 * v379) & 0xDF92FBDE) - 272007697) >> 16);
  v383 = ((2 * v382) & 0xFEFB5CFA ^ 0x15C92) + (v382 ^ 0xFF7D41B4);
  v384 = ((254803968 * v373 - ((39845888 * v373 + 35651584) & 0x3A00000) + 149192065) ^ 0x1D47D81) & 0xFFF00000 | ((1690743027 * v373 - ((-913481242 * v373 - 1438949150) & 0xF357E50E) + 1321837304) >> 12);
  v385 = ((793882624 * v377 - ((1587765248 * v377) & 0xFA184000) + 2097947943) ^ 0x7D0C2527) & 0xFFFFF000 | (v378 >> 20);
  v386 = ((2 * v385) & 0xBFFF6F6C ^ 0x92C) + (v385 ^ 0x5FFFB329);
  v387 = (v384 ^ 0xF7FAC1C0) + v386 + ((2 * v384) & 0xEFFAB6FE ^ 0xA347E) - v381 + v383;
  v388 = ((-1214853120 * v381 - ((1865261056 * v381 + 859963392) & 0xEF6C8000) - 1856549182) ^ 0xF7B64EC2) & 0xFFFFF000 | ((-1417971347 * v381 - 2 * ((-1417971347 * v381 + 835295760) & 0x3E2A8E4F ^ (-1417971347 * v381) & 4) - 269211557) >> 20);
  v389 = ((-1296039936 * v383 - ((629145600 * v383 + 813694976) & 0x31000000) - 791053640) ^ 0x98997AB8) & 0xFFC00000 | ((335323851 * v383 - ((670647702 * v383 + 700387778) & 0x50CFFB58) + 2101839501) >> 10);
  v390 = ((2 * v388) & 0xF71FCF7C ^ 0x744)
       + (v388 ^ 0x7B8FE45C)
       + ((2 * v389) & 0x7FDDFC5E ^ 0x54305E)
       + (v389 ^ 0x3FC4E7D0);
  v391 = v390 - ((2 * v390 + 151139366) & 0x76FF8F6A) + 57800;
  v392 = ((-150994944 * v386 - ((1845493760 * v386 + 1275068416) & 0x56000000) + 290801052) ^ 0xAB55459C) & 0xFF000000 | ((-1642794761 * v386 - ((1009377774 * v386 - 341426484) & 0x9A35EDB4) - 1024584128) >> 8);
  v393 = ((2 * v392) & 0xF6BFBDCE ^ 0x9A35CC) + (v392 ^ 0x7B92C411) + v390;
  v394 = (((-1941453952 * v387 - ((412059392 * v387 + 1872425472) & 0x453A3B00) + 443192985) ^ 0xA29D1D99) & 0xFFFFFF80 | ((18386823 * (v387 - 1376431705) - ((36773646 * (v387 - 1376431705) - 560298558) & 0xF89F856C) - 342030953) >> 25)) ^ 0x7E;
  v395 = v394 - ((2 * v394) & 0xC9472852) - 459041751;
  v396 = ((2 * ((v391 ^ 0x62ADDFF9) + (v395 ^ 0xE4A39429))) & 0xB6FFF6FE)
       + (((v391 ^ 0x62ADDFF9) + (v395 ^ 0xE4A39429)) ^ 0xDB7FFB7F);
  v397 = 1101043327 * v396 - ((-2092880642 * v396 + 1602987006) & 0xFD6F1016) - 1367516662;
  v398 = (v393 - ((2 * v393 + 4355672) & 0x989500) - 915569236) ^ v395;
  LODWORD(STACK[0x13F8]) = v238;
  LODWORD(STACK[0x1404]) = v348;
  v399 = malloc(0x408uLL);
  STACK[0x2A8] = 0;
  STACK[0x5B0] = (unint64_t)v399;
  LODWORD(STACK[0x1408]) = 641693137 * (v398 ^ 0x1A5856A2 ^ v397)
                         - ((1283386274 * (v398 ^ 0x1A5856A2 ^ v397)) & 0x94171120)
                         + 1242269840;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_24F86A890[(194 * (v399 != 0)) ^ v51] - 4))(v399, v400, v401, v402, v403, v404, v405, v406, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50);
}

uint64_t sub_22D1FC2CC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,unsigned int a63)
{
  int v63;
  int v64;
  unsigned int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  unsigned int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  unsigned int v76;
  int v77;
  int v78;
  int8x16_t v79;
  int32x4_t v80;
  int v81;
  uint64_t v82;
  unsigned int v83;
  uint64_t v84;
  unsigned int v85;
  int v86;
  int v87;
  char v88;
  int v89;
  uint64_t v90;
  int8x16_t v91;
  int32x4_t v92;
  int32x4_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int32x4_t v98;
  int32x4_t v99;
  int32x4_t v100;
  unint64_t v101;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int v106;

  LODWORD(a23) = HIBYTE(a63) ^ 0x4BB2CA42;
  HIDWORD(v103) = a59 ^ LODWORD(STACK[0x280]) ^ a57;
  LODWORD(STACK[0x290]) = (v71 >> 8) ^ 0x92224114;
  LODWORD(a15) = HIBYTE(v71) ^ 0x63E62B2E;
  HIDWORD(a9) = (v72 ^ v67 ^ 0x5399393D) - 2 * ((v72 ^ v67 ^ 0x5399393D) & 0x3B3617CE ^ (v72 ^ v67) & 2) - 1154082868;
  HIDWORD(v104) = v66 + v72 - ((2 * (v66 + v72)) & 0x97DF5750) + 1273998248;
  LODWORD(a14) = HIBYTE(v65) ^ 0x52F36914;
  STACK[0x280] = a1;
  STACK[0x2A8] = a1;
  v73 = v64 ^ v63;
  LODWORD(v105) = v69 + v73 - ((2 * (v69 + v73)) & 0x5F5EAF54) + 800020394;
  HIDWORD(v105) = (v73 ^ (v68 - 1072627247)) - ((2 * (v73 ^ (v68 - 1072627247))) & 0xF1CA944C) + 2028292646;
  LODWORD(v103) = a61 ^ 0x312E1E79;
  LODWORD(a13) = (v70 ^ 0xE4EFDEA9) + v73 - ((2 * ((v70 ^ 0xE4EFDEA9) + v73)) & 0x832ABA78) - 1047175876;
  v74 = ((v103 ^ a13 ^ 0x1FC210D) - ((2 * (v103 ^ a13 ^ 0x1FC210D) + 556363234) & 0x6B8B7752) - 2040892774) ^ 0x1FC210D;
  v75 = LODWORD(STACK[0x14A4])
      + ((((v74 - ((2 * v74 + 556363234) & 0x6B8B7752) - 2040892774) ^ 0x1FC210D)
        - ((2 * ((v74 - ((2 * v74 + 556363234) & 0x6B8B7752) - 2040892774) ^ 0x1FC210D) + 556363234) & 0x6B8B7752)
        - 2040892774) ^ 0x35C5BBA9);
  v76 = (((((2 * v75) & 0x37FA67B8) + (v75 ^ 0x1BFD33DC)) & 0xFFFFFFFE)
       - ((2 * (((2 * v75) & 0x37FA67B8) + (v75 ^ 0x1BFD33DC)) + 1208326216) & 0x4A994DFC)
       - 1991281886) ^ 0xDC1F2A73;
  LODWORD(v104) = (LODWORD(STACK[0x1404]) ^ a63) >> 8;
  v77 = v104 ^ 0xBCE4FC;
  v78 = STACK[0x270];
  v79 = (int8x16_t)vdupq_n_s32(STACK[0x270]);
  LODWORD(STACK[0x270]) = 110461394 * v76 - 527804347;
  LODWORD(STACK[0x240]) = 220922788 * v76;
  LODWORD(STACK[0x230]) = 110461393 * v76 - 527804347;
  LODWORD(STACK[0x220]) = 220922786 * v76;
  LODWORD(STACK[0x210]) = 220922782 * v76;
  v106 = 110461391 * v76 - 527804347;
  v80.i64[0] = 0x100000001;
  v80.i64[1] = 0x100000001;
  LODWORD(STACK[0x200]) = 110461392 * v76;
  v81 = STACK[0x2A0];
  v82 = v106 - (STACK[0x210] & 0xC114B08A);
  v83 = 110461392 * v76 - 527804347 - ((LODWORD(STACK[0x200]) << ((LODWORD(STACK[0x2A0]) + 28) ^ 0x1C)) & 0xC114B088);
  v84 = LODWORD(STACK[0x230]) - (STACK[0x220] & 0xC114B08A);
  v85 = LODWORD(STACK[0x270]) - (STACK[0x240] & 0xC114B088);
  v86 = ((v82 ^ 0x8A5845) & v77) + 1726087241 - ((2 * ((v82 ^ 0x8A5845) & v77)) & 0x1C40092);
  v87 = ((v83 ^ 0x8A5845) & v77) + 1726087241 - ((2 * ((v83 ^ 0x8A5845) & v77)) & 0x1C40092);
  v88 = ((v84 ^ 0x45) & v77) + 73 - ((2 * ((v84 ^ 0x45) & v77)) & 0x92);
  v89 = ((v85 ^ 0x8A5845) & v77) + 1726087241 - ((2 * ((v85 ^ 0x8A5845) & v77)) & 0x1C40092);
  v90 = (4 * v86) & 0x7799DFFC ^ 0x13880124u;
  LOBYTE(v75) = ((((v106 - (STACK[0x210] & 0x8A)) ^ 0x45) + v77) ^ 0xFB)
              + ((2 * (((v106 - (STACK[0x210] & 0x8A)) ^ 0x45) + v77)) & 0xF6)
              + ((4 * v86) ^ 0xA5)
              + ((2 * v86) ^ 0x6D)
              + ((8 * v86) ^ 0xB7)
              + ((4 * v86) ^ 0x24);
  LOBYTE(v86) = (((v84 ^ 0x45) + v77) ^ 0xFB)
              + ((2 * ((v84 ^ 0x45) + v77)) & 0xF6)
              + ((4 * v88) ^ 0xA5)
              + ((2 * v88) ^ 0x6D)
              + ((8 * v88) ^ 0xB7)
              + ((4 * v88) ^ 0x24);
  v91.i32[0] = ((v75 + 1 - ((2 * (v75 + 1) + 10) & 0x78) - 63) ^ LODWORD(STACK[0x290]));
  v92.i32[0] = dword_22D24E9B0[v91.i32[0] ^ 0xCC];
  v91.i32[1] = (((((v83 ^ 0x45) + v77) ^ 0xFB)
                                + ((2 * ((v83 ^ 0x45) + v77)) & 0xF6)
                                + ((4 * v87) ^ 0xA5)
                                + ((2 * v87) ^ 0x6D)
                                + ((8 * v87) ^ 0xB7)
                                + ((4 * v87) ^ 0x24)
                                + 1
                                - ((2
                                  * ((((v83 ^ 0x45) + v77) ^ 0xFB)
                                   + ((2 * ((v83 ^ 0x45) + v77)) & 0xF6)
                                   + ((4 * v87) ^ 0xA5)
                                   + ((2 * v87) ^ 0x6D)
                                   + ((8 * v87) ^ 0xB7)
                                   + ((4 * v87) ^ 0x24)
                                   + 1)
                                  + 10) & 0x78)
                                - 63) ^ LODWORD(STACK[0x290]));
  v92.i32[1] = dword_22D24E9B0[v91.i32[1] ^ 0xCC];
  v91.i32[2] = ((v86 + 1 - ((2 * (v86 + 1) + 10) & 0x78) - 63) ^ LODWORD(STACK[0x290]));
  v92.i32[2] = dword_22D24E9B0[v91.i32[2] ^ 0xCC];
  v91.i32[3] = (((((v85 ^ 0x45) + v77) ^ 0xFB)
                                + ((2 * ((v85 ^ 0x45) + v77)) & 0xF6)
                                + ((4 * v89) ^ 0xA5)
                                + ((2 * v89) ^ 0x6D)
                                + ((8 * v89) ^ 0xB7)
                                + ((4 * v89) ^ 0x24)
                                + 1
                                - ((2
                                  * ((((v85 ^ 0x45) + v77) ^ 0xFB)
                                   + ((2 * ((v85 ^ 0x45) + v77)) & 0xF6)
                                   + ((4 * v89) ^ 0xA5)
                                   + ((2 * v89) ^ 0x6D)
                                   + ((8 * v89) ^ 0xB7)
                                   + ((4 * v89) ^ 0x24)
                                   + 1)
                                  + 10) & 0x78)
                                - 63) ^ LODWORD(STACK[0x290]));
  v92.i32[3] = dword_22D24E9B0[v91.i32[3] ^ 0xCC];
  v93 = (int32x4_t)veorq_s8(v91, (int8x16_t)vdupq_n_s32(0x188217Cu));
  v94 = vaddq_s32(vaddq_s32(v92, vdupq_n_s32(0xE421DC77)), (int32x4_t)veorq_s8((int8x16_t)vaddq_s32(vsubq_s32((int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v93, v93), (int8x16_t)vdupq_n_s32(0x1004304u)), v93), vdupq_n_s32(0xAB4A1C7D)), (int8x16_t)vdupq_n_s32(0xA9846702)));
  v95 = (int32x4_t)veorq_s8((int8x16_t)vaddq_s32(vsubq_s32(v94, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v94, v94), (int8x16_t)vdupq_n_s32(0xF602B7D2))), vdupq_n_s32(0xFB015BE9)), (int8x16_t)vdupq_n_s32(a53 ^ a55));
  v96 = vaddq_s32((int32x4_t)veorq_s8(veorq_s8(v79, (int8x16_t)vdupq_n_s32(0x3F60D816u)), (int8x16_t)v95), v80);
  v97 = vaddq_s32((int32x4_t)veorq_s8(vandq_s8((int8x16_t)vaddq_s32(v95, v95), (int8x16_t)vdupq_n_s32(0xBF7A9DBE)), (int8x16_t)vdupq_n_s32(0x8A289C9A)), (int32x4_t)veorq_s8((int8x16_t)v95, (int8x16_t)vdupq_n_s32(0x3AABB092u)));
  v98 = vaddq_s32(vaddq_s32((int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v96, v96), (int8x16_t)vdupq_n_s32(0xDCF72EBA)), (int32x4_t)veorq_s8((int8x16_t)v96, (int8x16_t)vdupq_n_s32(0xEE7B975D))), v97);
  v99 = vaddq_s32(vaddq_s32(v97, vdupq_n_s32(0xA042B121)), (int32x4_t)veorq_s8(veorq_s8(veorq_s8(v79, (int8x16_t)vdupq_n_s32((v78 ^ 0x5A76265B) - ((2 * (v78 ^ 0x5A76265B) + 2) & 0x1D51B1CCu) - 1901537049)), (int8x16_t)vdupq_n_s32(0xF8A7E7D5)), (int8x16_t)vaddq_s32(vsubq_s32(v98, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(vaddq_s32(v98, v98), vdupq_n_s32(0x638E3388u)), (int8x16_t)vdupq_n_s32(0xA70DCD2E))), vdupq_n_s32(0x854E005B))));
  v100 = vaddq_s32(vsubq_s32(v99, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v99, v99), (int8x16_t)vdupq_n_s32(0xDEDF3D92))), vdupq_n_s32(0xEF6F9EC9));
  *(_DWORD *)(STACK[0x2A8] + 4 * ((v106 - (STACK[0x210] & 0x8A)) ^ 0x45u)) = v100.i32[0];
  v101 = STACK[0x280];
  *(_DWORD *)(STACK[0x280] + 4 * (v83 & 0xFD ^ 0x45)) = v100.i32[1];
  *(_DWORD *)(v101 + 4 * (v84 ^ 0x45u)) = v100.i32[2];
  *(_DWORD *)(v101 + 4 * (v85 ^ 0x45u)) = v100.i32[3];
  return ((uint64_t (*)(_QWORD, uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_24F86A890[v81] - 12))((4 * v89) & 0x7799DFFC ^ 0x13880124u, 252, dword_22D24E9B0, 204, v84, v82, (4 * v87) & 0x7799DFFC ^ 0x13880124u, v90, a9, v103, v104, v105, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62);
}

void sub_22D1FCAE4()
{
  JUMPOUT(0x22D1FC6F4);
}

uint64_t sub_22D1FCAFC()
{
  int v0;
  void *v1;

  v1 = malloc(0x408uLL);
  STACK[0x578] = (unint64_t)v1;
  return ((uint64_t (*)(void))(qword_24F86A890[(1323 * (((v1 == 0) ^ (119 * (v0 ^ 0x1A))) & 1)) ^ v0]
                            - ((29 * (v0 ^ 0x116u)) ^ 0x133)))();
}

uint64_t sub_22D1FCB64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,int a49,uint64_t a50,int a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,int a61,uint64_t a62,unsigned int a63)
{
  int v63;
  uint64_t v64;
  unsigned int v65;
  unsigned int v66;
  char v67;
  unsigned int v68;
  char v69;
  char v70;
  char v71;
  unsigned int v72;

  v65 = ((LODWORD(STACK[0x1408]) ^ LODWORD(STACK[0x14A0]) ^ 0x23AE28A)
       - ((2 * (LODWORD(STACK[0x1408]) ^ LODWORD(STACK[0x14A0]) ^ 0x23AE28A) + 128613970) & 0x13B52C6A)
       - 1649420962) ^ 0xED414A8E;
  v66 = ((v65 - (((v65 << (v63 ^ 0x3E)) + 128613970) & 0x13B52C6A) - 1649420962) ^ 0x89DA9635) + (a61 ^ 0xC57EF8EC);
  LOBYTE(v66) = 2 * v66 + ~(_BYTE)v66;
  v67 = 2 * v66 - ((4 * v66 + 4) & 0x8C) - 55;
  LOBYTE(v66) = v66 + (v67 & 0x62 ^ 0x41) + ((2 * v67) & 0xC0 ^ 0x7F) - 80;
  v68 = ((LODWORD(STACK[0x1404]) ^ LODWORD(STACK[0x13F8]) ^ a63) >> 16) ^ 0x26782627;
  LOBYTE(v66) = ((v66 | 1) - ((2 * v66) & 0x14) + 10) ^ 0xA;
  v69 = 122 * v66;
  v70 = 61 * v66 - 108;
  v71 = (v63 ^ 0x27) + 16;
  v72 = (-1638734220
       - (((v70 - (v69 & v71)) ^ v68) ^ 0xB9 | 0x9E52E674)
       + (((v70 - (v69 & v71)) ^ v68) ^ 0xB9 | 0x61AD198B)) ^ 0xC1A84801;
  *(_DWORD *)(a1 + 4 * ((v70 - (v69 & v71)) ^ 0x94u)) = a49 ^ a51 ^ a13 ^ 0x238670C0 ^ dword_22D251610[(((2 * v72) | 0x8BA6F98E) - v72 - 1171487943) ^ 0xE5D62DEA];
  return (*(uint64_t (**)(void))(v64 + 8 * (v63 ^ 0x27 | 0x27)))();
}

void sub_22D1FCDC4()
{
  JUMPOUT(0x22D1FCD60);
}

uint64_t sub_22D1FCDD4()
{
  int v0;
  uint64_t v1;
  int v2;
  unsigned __int8 v3;
  uint64_t v4;
  void *v5;

  v2 = v0 + 559;
  v3 = v0 - 55;
  v4 = (v0 + 1753784742) & 0x97775F7D;
  v5 = malloc(0x404uLL);
  *(_QWORD *)(v1 + 32) = v5;
  return ((uint64_t (*)(void))(qword_24F86A890[(1856 * (((v5 == 0) ^ v3) & 1)) ^ v2] - v4 + 568))();
}

uint64_t sub_22D1FCE48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,uint64_t a47,int a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,int a60)
{
  int v60;
  char v61;
  int v62;
  int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  int v73;
  unsigned int v74;
  int v75;
  int v76;
  int v77;

  LODWORD(STACK[0x2A0]) = v62;
  v63 = LODWORD(STACK[0x14A0]) ^ a13;
  v64 = (((2 * v63) ^ 0xA89FF90E) - ((2 * ((2 * v63) ^ 0xA89FF90E)) & 0xEDE77D34) + 1995685530) & 0x95729B3C ^ 0x95209218;
  v65 = ((((((2 * v64) | 0xE544620E) - v64 - 1923232007) & 0xB1F37B4 ^ 0x90326B1 | (((2 * v64) | 0xE544620E)
                                                                                  - v64
                                                                                  - 1923232007) & 0xF4E0C848)
        - 1) ^ 0x6BF116A0)
      + (v63 ^ 0x567795D2);
  v66 = v65 - ((2 * v65) & 0xA89FF90E) + 1414528135;
  v67 = (((2 * v66) ^ 0xA89FF90E) - ((2 * ((2 * v66) ^ 0xA89FF90E)) & 0xEDE77D34) + 1995685530) & 0x95729B3C ^ 0x95209218;
  v68 = ((((((2 * v67) | 0xE544620E) - v67 - 1923232007) & 0xB1F37B4 ^ 0x90326B1 | (((2 * v67) | 0xE544620E)
                                                                                  - v67
                                                                                  - 1923232007) & 0xF4E0C848)
        - 1) ^ 0x6BF116A0)
      + (v66 ^ 0x567795D2);
  v69 = LODWORD(STACK[0x1728]) ^ 0xF82772AD;
  LODWORD(STACK[0x280]) = v69;
  v70 = ((v68 - ((2 * v68) & 0xA89FF90E) + 1414528135) ^ 0x544FFC87) + v69;
  v71 = (v70 ^ 0x13FF5F7F) - 335503231 + ((2 * v70) & 0x27FEBEFE);
  v72 = -354362931 * (((v71 & 0xFFFFFFFE) - ((2 * v71) & 0xBEB2B9B8) + 1599691997) ^ 0x7C5FB51A);
  v73 = ((v72 - ((v72 << (v60 - 59)) & 0xFC) + 126) ^ v61);
  v74 = ((2 * v73) ^ 0x908F7A) + 10622602 + ((2 * ((2 * v73) ^ 0x908F7A)) & 0x110 ^ 0xFFFFF3FE);
  v75 = *((_DWORD *)&unk_22D24E3A0
        + (((v73 ^ 0x4847BD) + 4736832) ^ 0x3F3EF48F)
        + ((2 * ((v73 ^ 0x4847BD) + 4736832)) & 0x21091E)
        + (v74 & 0x108E80 ^ 0x800291)
        + ((2 * v74) & 0x211500 ^ 0xFEFFFAFF)
        - 1061091487);
  v76 = 519009017 * v75 - ((1038018034 * v75 + 179602716) & 0x2325E870) - 1225967930;
  v77 = (16 * (v76 ^ (125540296 * v75 - ((16199568 * v75 + 27535584) & 0x1E4F2C0) + 197430736))) ^ 0x1608D580;
  *(_DWORD *)(a1 + 4 * ((v72 - ((v72 << (v60 - 59)) & 0xFC) + 126) ^ 0x7Eu)) = a60 ^ a48 ^ a46 ^ v76 ^ 0xB04C34BA ^ (v77 - ((2 * v77) & 0xF64F8D00) - 81279358);
  return ((uint64_t (*)(void))qword_24F86A890[v60])();
}

void sub_22D1FD1C0()
{
  JUMPOUT(0x22D1FD084);
}

uint64_t sub_22D1FD1CC()
{
  int v0;
  void *v1;

  v1 = malloc(0x408uLL);
  STACK[0x5A0] = (unint64_t)v1;
  return ((uint64_t (*)(void))(qword_24F86A890[(22 * (v1 == 0)) ^ (v0 - 305)] - (((v0 - 250) | 0x221u) ^ 0x36FLL)))();
}

uint64_t sub_22D1FD224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41,uint64_t a42,int a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57)
{
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  unsigned int v64;
  unsigned int v65;

  v59 = (v58 - 67134309) & 0x7DEF7CB7;
  v60 = ((a12 ^ 0x8D2D56F ^ LODWORD(STACK[0x149C]))
       - ((2 * (a12 ^ 0x8D2D56F ^ LODWORD(STACK[0x149C])) + 773965380) & 0x3C6FAB5E)
       + 357087441) ^ 0x4528C3B3;
  v61 = ((v60 - (((v59 ^ 0x17CEDAF2) + 2 * v60) & 0x3C6FAB5E) + 357087441) ^ 0x1E37D5AF) + LODWORD(STACK[0x14A4]);
  v62 = LODWORD(STACK[0x13F0]) ^ v57;
  LOBYTE(v61) = ((v61 & 0xFE) - ((2 * v61) & 0x18) + 13) ^ 0xF0;
  LODWORD(STACK[0x2A0]) = (v59 + 631257769) & 0x6070ABE7;
  v63 = ((-17 * v61 + 47 - ((-34 * v61) & 0x5E)) ^ v62) ^ 0x53;
  v64 = ((v63 - ((v63 << (((v59 - 87) & 0xE7) - 70)) & 0x1DC) - 929677074) & 0xC0000482 ^ 0x16000080)
      + ((v63 - ((v63 << (((v59 - 87) & 0xE7) - 70)) & 0x1DC) - 929677074) ^ 0xE8F3556F)
      - (((v63 - ((v63 << (((v59 - 87) & 0xE7) - 70)) & 0x1DC) - 929677074) ^ 0xE8F3556F) & 0x20640482);
  v65 = (((v64 ^ 0xFB989809) + 1) ^ 0x4B7BFCCE)
      + ((2 * ((v64 ^ 0xFB989809) + 1)) & 0x16F7F99C)
      + dword_22D24C530[v64 ^ 0xD601110E];
  *(_DWORD *)(a1 + 4 * ((-17 * v61 + 47 - ((-34 * v61) & 0x5E)) ^ 0x2Fu)) = a57 ^ a41 ^ a43 ^ 0xF19B6C48 ^ (v65 - ((2 * v65 - 1841152470) & 0xF6F429C2) + 1151022070);
  return ((uint64_t (*)(void))qword_24F86A890[(v59 - 2045712723) | (16 * (((2045713335 - v59) | (v59 - 2045713335)) >= 0))])();
}

void sub_22D1FD4B0()
{
  JUMPOUT(0x22D1FD404);
}

uint64_t sub_22D1FD4C4()
{
  unsigned int v0;
  void *v1;

  v0 = STACK[0x2A0];
  v1 = malloc(0x408uLL);
  STACK[0x590] = (unint64_t)v1;
  return ((uint64_t (*)(void))(qword_24F86A890[(1881 * (((v1 == 0) ^ (v0 - 70)) & 1)) ^ v0] - 4))();
}

uint64_t sub_22D1FD514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  unsigned int v13;

  v10 = (v6 & 0x80000000) - 1787732174;
  v11 = a5 + 4 * (v8 + v7);
  v12 = *(_DWORD *)(v11 + 2020);
  v13 = ((v12 & 0x7FFFFFFE ^ 0x2FD123EB) - ((2 * (v12 & 0x7FFFFFFE ^ 0x2FD123EB)) & 0xA1E076CE) - 789562521) ^ 0xF0742B44;
  *(_DWORD *)(a5 + 4 * ((v5 ^ 0x3EEu ^ v8) + v7)) = *(_DWORD *)(v11 + 3604) ^ *((_DWORD *)&STACK[0x19A0] + (v12 & 1)) ^ (((v13 | ~v10 & 0x80000000) - ((2 * v13) & 0x66C9D3B4) - 1285232166) >> 1) ^ 0x37D58494;
  return ((uint64_t (*)(void))(*(_QWORD *)(a4 + 8 * ((14 * (v7 + 1 == v9 + 3)) ^ v5)) - 4))();
}

uint64_t sub_22D1FD5F4@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, int a3@<W8>)
{
  uint64_t v3;
  int8x16_t v4;
  const float *v5;
  int8x16_t v6;
  int8x16_t v7;
  int32x4_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int32x4_t v12;
  int8x16_t v13;

  v5 = (const float *)&dword_255D660B4;
  v6 = (int8x16_t)vld1q_dup_f32(v5);
  v7.i64[0] = 0x8000000080000000;
  v7.i64[1] = 0x8000000080000000;
  v8.i64[0] = -1;
  v8.i64[1] = -1;
  v4.i64[0] = *(_QWORD *)&dword_255D660B8;
  v4.i32[2] = dword_255D660C0;
  v9 = vextq_s8(v6, v4, 0xCuLL);
  v10 = v4;
  v10.i32[3] = *(_DWORD *)(a2 + 4 * (((a3 - 183) | 0x42u) - 392) + 688);
  v11 = (int8x16_t)vaddq_s32((int32x4_t)veorq_s8(vandq_s8(v9, v7), (int8x16_t)vdupq_n_s32(0xAF5DFFFA)), vdupq_n_s32(0xB80BF936));
  v12 = (int32x4_t)veorq_s8((int8x16_t)vaddq_s32((int32x4_t)veorq_s8(vandq_s8(v10, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0xED655B93)), v8), (int8x16_t)vdupq_n_s32(0xE230685A));
  v13.i32[0] = *(_DWORD *)(v3 + 4 * (dword_255D660B8 & 1));
  v13.i32[1] = *(_DWORD *)(v3 + 4 * (unk_255D660BC & 1));
  v13.i32[2] = *(_DWORD *)(v3 + 4 * (dword_255D660C0 & 1));
  v13.i32[3] = *(_DWORD *)(v3 + 4 * (v10.i8[12] & 1));
  *(int8x16_t *)&dword_255D660B4 = veorq_s8(veorq_s8(veorq_s8((int8x16_t)xmmword_255D65D28, v13), (int8x16_t)vdupq_n_s32(0x2B2E7FDu)), (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8((int8x16_t)v12, vandq_s8(v11, v7)), (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v12, v12), (int8x16_t)vdupq_n_s32(0xB3545E10))), vdupq_n_s32(0xD9AA2F09)), 1uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * a3) - 4))();
}

void sub_22D1FD73C()
{
  JUMPOUT(0x22D1FD678);
}

uint64_t sub_22D1FD748(uint64_t a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5)
{
  int v5;
  unsigned int v6;

  v6 = ((((v5 - a3 + 672170220) & 0xD7EF7D4F ^ 0x8706A141 ^ *a5 & 0x7FFFFFFE)
       + (*a5 & 0x15BEEA9A ^ 0x4946290)
       - (((v5 - a3 + 672170220) & 0xD7EF7D4F ^ 0x8706A141 ^ *a5 & 0x7FFFFFFE) & 0x15BEEA9A)) | ((((a5[623] | 0x7FFFFFFF)
                                                                                                 + 2097618987) ^ 0xE376900B)
                                                                                               + 168534133) & 0x80000000) ^ 0xB805558;
  a5[623] = a5[396] ^ *((_DWORD *)&STACK[0x19A0] + (*a5 & 1)) ^ ((v6
                                                                  + 692530060
                                                                  - 2
                                                                  * (v6 & 0x29472B8F ^ ((((_BYTE)v5 - (_BYTE)a3 - 20) & 0x4F ^ 0x41 ^ *(_BYTE *)a5 & 0xFE)
                                                                                      + (*(_BYTE *)a5 & 0x9A ^ 0x90)
                                                                                      - ((((_BYTE)v5 - (_BYTE)a3 - 20) & 0x4F ^ 0x41 ^ *(_BYTE *)a5 & 0xFE) & 0x9A)) & 2)) >> 1) ^ 0x7AC465BF;
  return ((uint64_t (*)(void))(*(_QWORD *)(a4
                                        + 8
                                        * (((LODWORD(STACK[0x4C8]) > 0x26F) | (4 * (LODWORD(STACK[0x4C8]) > 0x26F))) ^ v5))
                            - 4))();
}

uint64_t sub_22D1FD84C@<X0>(uint64_t a1@<X3>, uint64_t a2@<X5>, int a3@<W8>)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  LODWORD(STACK[0x4C8]) = 0;
  v6 = LODWORD(STACK[0x4C8])++;
  dword_255D666E8 = v6 + 266572533;
  v7 = (*(_DWORD *)(v3 + 1832) - 1213027706);
  v4[12] = *(_QWORD *)(a1 + 8 * (a3 + 1771230042));
  LODWORD(STACK[0x5D0]) = a3 - 1104744166;
  LODWORD(STACK[0x5E0]) = 0;
  LODWORD(STACK[0x5E4]) = (a3 - 1104744166) ^ 0xB4;
  LODWORD(STACK[0x5E8]) = (a3 - 1104744166) ^ 0xC4;
  v4[14] = v7;
  v4[17] = 203725760;
  *(_DWORD *)(v5 - 192) = 1431737413
                        * ((-1244081122 - ((v5 - 200) | 0xB5D8D41E) + ((v5 - 200) | 0x4A272BE1)) ^ 0xF479B4F3)
                        + 40706419
                        + a3;
  *(_QWORD *)(a2 + 448) = &STACK[0x5C8];
  sub_22D219DEC(v5 - 200);
  return ((uint64_t (*)(void))qword_24F86A890[*(int *)(v5 - 188)])();
}

uint64_t sub_22D1FD954(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;

  if (v3 >= v4)
    v9 = *(_DWORD *)(v5 + 1832) + 1;
  else
    v9 = 1416753466;
  *(_DWORD *)(v5 + 1832) = v9;
  v10 = v2 ^ (v2 >> 11);
  v11 = (((v10 << 7) ^ 0xAA6CB700) - ((2 * ((v10 << 7) ^ 0xAA6CB700)) & 0x81AC7200) - 1059702424) & 0x9D2C5680 ^ 0x99285200;
  v12 = ((((v11 | 0x4C644662) - (v11 | 0xB39BB99D) - 1281640035) & 0xFD04A300 ^ 0xA304A115)
       + (((v11 | 0x4C644662) - (v11 | 0xB39BB99D) - 1281640035) ^ 0x5CEA4E02)
       - ((((v11 | 0x4C644662) - (v11 | 0xB39BB99D) - 1281640035) ^ 0x5CEA4E02) & 0xFF04A315)) ^ v10;
  v13 = (((v12 << 15) ^ 0x180D8000) - ((2 * ((v12 << 15) ^ 0x180D8000)) & 0xB4D60000) - 630498153) & 0xEFC60000 ^ 0x82420000;
  v14 = (((v13 - ((2 * v13) & 0x48800000) - 1270241208) ^ 0xD02B515F) - 1) ^ v12;
  *(_BYTE *)(v6 + (v8 - 1134608574)) = ((v14 ^ (v14 >> 18) ^ 0x69)
                                                    - 2
                                                    - ((2 * (v14 ^ (v14 >> 18) ^ 0x69)) & 0xA0)
                                                    - 46) ^ 0x56;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a2
                                                      + 8
                                                      * ((454
                                                        * (v8
                                                         - (((v14 ^ (v14 >> 18) ^ 0x69)
                                                                            - 2
                                                                            - ((2 * (v14 ^ (v14 >> 18) ^ 0x69)) & 0xA0)
                                                                            - 46) != 0x56) != v7)) ^ 0x2D7))
                                          - 8))(3748506916);
}

uint64_t sub_22D1FDAEC()
{
  uint32_t v0;

  STACK[0x2A8] = (unint64_t)malloc_type_malloc(STACK[0x280], 0xC5732911uLL);
  v0 = arc4random();
  LODWORD(xmmword_255D65D28) = v0 + 257242056 - ((2 * v0) & 0x1EAA6790);
  DWORD1(xmmword_255D65D28) = ((1812433253 * (xmmword_255D65D28 ^ 0xF5533C8 ^ (xmmword_255D65D28 >> 30))) ^ 0xE77BFFC9)
                            + ((-670100790 * (xmmword_255D65D28 ^ 0xF5533C8 ^ (xmmword_255D65D28 >> 30))) & 0xCEF7FF92)
                            + 668546048
                            - ((2
                              * (((1812433253 * (xmmword_255D65D28 ^ 0xF5533C8 ^ (xmmword_255D65D28 >> 30))) ^ 0xE77BFFC9)
                               + ((-670100790 * (xmmword_255D65D28 ^ 0xF5533C8 ^ (xmmword_255D65D28 >> 30))) & 0xCEF7FF92))
                              - 251133840) & 0x1EAA6790);
  return ((uint64_t (*)(void))sub_22D1FDC14)();
}

void sub_22D1FDC14()
{
  JUMPOUT(0x22D1FDBA0);
}

uint64_t sub_22D1FDC30@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  _DWORD *v7;
  _DWORD *v8;
  uint32_t v9;
  uint32_t v10;
  int v11;
  unsigned int v12;

  LODWORD(STACK[0x290]) = v3;
  v6 = (v1 + 7153855) | 0x96000142;
  LODWORD(STACK[0x400]) = a1 + 1;
  v7 = (_DWORD *)STACK[0x240];
  gettimeofday((timeval *)STACK[0x240], 0);
  v8 = (_DWORD *)STACK[0x270];
  v8[2] = *v7 + 257242056 - ((2 * *v7) & 0x1EAA6790);
  **(_DWORD **)(v4 + 3632) = v8[6] + 257242056 - ((v8[6] << (v6 ^ 0x4A)) & 0x1EAA6790);
  v9 = arc4random();
  v8[3] = v9 + 257242056 - ((2 * v9) & 0x1EAA6790);
  v10 = arc4random();
  **(_DWORD **)(v2 + 185) = v10 + 257242056 - ((2 * v10) & 0x1EAA6790);
  LODWORD(STACK[0x2A0]) = -822728716;
  v11 = (DWORD1(xmmword_255D65D28) ^ 0xEFD47528 ^ (1664525
                                                 * (xmmword_255D65D28 ^ 0xF5533C8 ^ (xmmword_255D65D28 >> 30))
                                                 - ((3329050
                                                   * (xmmword_255D65D28 ^ 0xF5533C8 ^ (xmmword_255D65D28 >> 30))) & 0xC1028DC0)
                                                 - 528398624))
      + (*(_DWORD *)STACK[0x1658] ^ 0xF5533C8);
  v12 = (v11 ^ 0x6EBEF5D9) + 1118180232 + ((2 * v11) & 0xDD7DEBB2);
  DWORD1(xmmword_255D65D28) = v12 - ((2 * v12 + 490073406) & 0x1EAA6790) + 1576020583;
  STACK[0x5C8] = qword_24F86A890[(int)(v6 + 32554563) ^ 0x1FFFFFFF985DEB2BLL];
  LODWORD(STACK[0x5E4]) = (v6 + 32554563) ^ 0x28;
  LODWORD(STACK[0x5E8]) = (v6 + 32554563) | 0x60;
  *(_DWORD *)(v5 - 192) = 1431737413
                        * ((((v5 - 200) | 0x34987F39) - (v5 - 200) + ((v5 - 200) & 0xCB6780C0)) ^ 0x8AC6E02B)
                        + 40706419
                        + v6;
  LODWORD(STACK[0x5D0]) = v6 + 32554563;
  LODWORD(STACK[0x5E0]) = 0;
  STACK[0x5D8] = 2199835310;
  STACK[0x5F0] = 2199835308;
  STACK[0x23F8] = (unint64_t)&STACK[0x5C8];
  sub_22D219DEC(v5 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v5 - 188)] - 12))();
}

uint64_t sub_22D1FDF44()
{
  uint64_t v0;
  unsigned int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((2 * (v1 >= 0x831ED2AC)) | (4 * (v1 >= 0x831ED2AC))) ^ (v2 + 1771230087)))
                            - 4))();
}

uint64_t sub_22D1FDF88()
{
  uint64_t v0;
  unsigned int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((2 * (((v1 > 0x831ED51B) ^ (v2 - 118)) & 1)) & 0xFB | (4 * (((v1 > 0x831ED51B) ^ (v2 - 118)) & 1))) ^ (v2 + 1771230087)))
                            - 4))();
}

uint64_t sub_22D1FDFDC()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;

  v7 = (v0 + 374081591) | 0x80212440;
  LODWORD(xmmword_255D65D28) = dword_255D666E4;
  STACK[0x5C8] = *(_QWORD *)(v1 + 8 * ((int)(v7 - 546889639) ^ 0x75D44D07));
  STACK[0x5D8] = 3886428017;
  LODWORD(STACK[0x5D0]) = 1;
  LODWORD(STACK[0x5E0]) = v7 - 546889682;
  LODWORD(STACK[0x5E4]) = v7 - 546889639;
  LODWORD(STACK[0x5E8]) = (v7 - 546889639) ^ 0x89;
  STACK[0x5F0] = (v2 - 1526719510);
  *(_DWORD *)(v6 - 192) = 1431737413 * ((((2 * v4) | 0xE14972FC) - v4 + 257640066) ^ 0x4EFA266C) + 40706419 + v7;
  *(_QWORD *)(v5 + 448) = v3;
  sub_22D219DEC(v6 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v6 - 188)] - 12))();
}

uint64_t sub_22D1FE0E0()
{
  uint64_t v0;
  unsigned int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((115 * (v1 >= (STACK[0x2A0] & 0x3109DA9F ^ 0xE7A62DE5))) ^ 0x1B9))
                            - 8))();
}

uint64_t sub_22D1FE154()
{
  uint64_t v0;
  int v1;
  unsigned int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (int)(((v2 <= 0xE7A62F74) * (v1 & 0xC80BC3F4 ^ 0x2E7)) ^ 0x1B9))
                            - 8))();
}

uint64_t sub_22D1FE1D4()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;

  *(_DWORD *)(*(_QWORD *)(v4 + 185) + 4 * (((v0 + 219) ^ 0xBD59EEED) + v3)) ^= 0xAD80C38 ^ *(_DWORD *)(STACK[0x2A8] + 4 * (((v0 + 219) ^ 0xBD59EEED) + v3));
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((((v0 + 219) ^ (v1 + 660) ^ (v1 - 182)) * (v5 != 68771578)) ^ (v0 + 219)))
                            - 4))();
}

void sub_22D1FE26C()
{
  JUMPOUT(0x22D1FDD94);
}

uint64_t sub_22D1FE284()
{
  int v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;

  *v1 = v1[623];
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((v0 + 14) * (v3 != 1964760376)) ^ (v0 + 378)))
                            - (v0 - 146)
                            + 90))();
}

uint64_t sub_22D1FE2D4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;

  v5 = 4 * (v2 - 1681243768);
  v6 = *(_DWORD *)(v0 + 4 * (v2 - 1681243769));
  v7 = (*(_DWORD *)(v0 + v5) ^ 0xC996D19 ^ (1566083941 * (v6 ^ 0xF5533C8 ^ (v6 >> 30))
                                          - ((45160138 * (v6 ^ 0xF5533C8 ^ (v6 >> 30))) & 0x798BDA2)
                                          + 63725265))
     - v2;
  *(_DWORD *)(v0 + v5) = v7 - ((2 * v7 + 141262064) & 0x1EAA6790) + 1938485824;
  STACK[0x5C8] = *(_QWORD *)(v1 + 8 * ((v3 - 896931825) ^ 0x60F715F9));
  STACK[0x5D8] = 2674449301;
  LODWORD(STACK[0x5D0]) = 1;
  LODWORD(STACK[0x5E0]) = v3 - 896931690;
  LODWORD(STACK[0x5E4]) = v3 - 896931825;
  LODWORD(STACK[0x5E8]) = (v3 - 896931825) ^ 0x35;
  STACK[0x5F0] = (v2 + 993205534);
  *(_DWORD *)(v4 - 192) = 1431737413 * ((((v4 - 200) | 0xCB6D12A5) - ((v4 - 200) & 0xCB6D12A5)) ^ 0x75338DB7)
                        + 40706419
                        + v3;
  STACK[0x23F8] = (unint64_t)&STACK[0x5C8];
  sub_22D219DEC(v4 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v4 - 188)] - 8))();
}

uint64_t sub_22D1FE458()
{
  uint64_t v0;
  unsigned int v1;

  return (*(uint64_t (**)(void))(v0 + 8 * ((745 * (v1 < 0x9F68DB95)) ^ 0xF0)))();
}

uint64_t sub_22D1FE4BC()
{
  uint64_t v0;
  unsigned int v1;

  return (*(uint64_t (**)(void))(v0 + 8 * ((745 * (v1 > 0x9F68DE04)) ^ 0xF0)))();
}

uint64_t sub_22D1FE538()
{
  int v0;
  int v1;
  int8x16_t v2;
  int8x16_t v3;
  int32x4_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int8x16_t v13;

  v1 = (v0 - 2078202963) | 0x124C0940;
  LODWORD(xmmword_255D65D28) = -1890241592;
  free((void *)STACK[0x2A8]);
  v2 = (int8x16_t)vld1q_dup_f32((const float *)&xmmword_255D65D28);
  v3.i64[0] = 0x8000000080000000;
  v3.i64[1] = 0x8000000080000000;
  v4 = vdupq_n_s32(0xED96D7EC);
  v5 = (int8x16_t)vdupq_n_s32(0x692AA478u);
  v6.i64[0] = *(_QWORD *)((char *)&xmmword_255D65D28 + 4);
  v6.i32[2] = HIDWORD(xmmword_255D65D28);
  v7 = vextq_s8(v2, v6, 0xCuLL);
  v8 = v6;
  v8.i32[3] = dword_255D65D38;
  v9 = (int8x16_t)vaddq_s32((int32x4_t)vandq_s8(v7, v3), v4);
  v10 = (int32x4_t)veorq_s8(vandq_s8(v8, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x2D2DC4E4u));
  v11 = (int32x4_t)veorq_s8((int8x16_t)vsubq_s32(vaddq_s32(v10, (int32x4_t)veorq_s8(vandq_s8(v8, v5), (int8x16_t)vdupq_n_s32(0x40022019u))), (int32x4_t)vandq_s8((int8x16_t)v10, v5)), (int8x16_t)vdupq_n_s32(0x4B1AA271u));
  v12 = (int32x4_t)veorq_s8((int8x16_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8((int8x16_t)vaddq_s32(v11, v11), (int8x16_t)vdupq_n_s32(0xB97DCC14)), v11), vdupq_n_s32(0xA34119F6)), (int8x16_t)vdupq_n_s32(0x5CF6172Eu));
  v13.i32[0] = *((_DWORD *)&STACK[0x1918] + (BYTE4(xmmword_255D65D28) & 1));
  v13.i32[1] = *((_DWORD *)&STACK[0x1918] + (DWORD2(xmmword_255D65D28) & (((v1 + 1771229933) | 0x202u) - 569)));
  v13.i32[2] = *((_DWORD *)&STACK[0x1918] + (BYTE12(xmmword_255D65D28) & 1));
  v13.i32[3] = *((_DWORD *)&STACK[0x1918] + (dword_255D65D38 & 1));
  xmmword_255D65D28 = (__int128)veorq_s8(veorq_s8(veorq_s8((int8x16_t)xmmword_255D6635C, v13), (int8x16_t)vdupq_n_s32(0x8C81DA0A)), (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8((int8x16_t)v12, veorq_s8(v9, (int8x16_t)v4)), (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v12, v12), (int8x16_t)vdupq_n_s32(0x7A7B7982u))), vdupq_n_s32(0xBD3DBCC1)), 1uLL));
  return ((uint64_t (*)(void))(qword_24F86A890[v1 + 1771230271] - 12))();
}

uint64_t sub_22D1FE5B8()
{
  char v0;
  int v1;
  int v2;
  unint64_t v3;
  char v4;

  v0 = STACK[0x767];
  v1 = STACK[0x7C8];
  v2 = *(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0));
  LODWORD(STACK[0x7D0]) = v2;
  v3 = -711945521 * ((-711945521 * ((v2 ^ v1) & 0x7FFFFFFF)) ^ ((-711945521 * ((v2 ^ v1) & 0x7FFFFFFFu)) >> 16));
  v4 = byte_22D251110[v3 >> 24] ^ v0 ^ byte_22D24D480[v3 >> 24] ^ byte_22D24D580[(v3 >> 24) + 2] ^ v3 ^ (-83 * BYTE3(v3));
  LOBYTE(STACK[0x7D7]) = v4;
  LODWORD(STACK[0x7D8]) = ((2 * v4) & 0xFF52E5FA) + (v4 ^ 0xFFA972FD);
  return ((uint64_t (*)(void))(qword_24F86A890[(4 * (v4 > 47)) | ((v4 > 47) << 8) | LODWORD(STACK[0x7C4])] - 8))();
}

uint64_t sub_22D1FE6BC()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)(((v0 + ((LODWORD(STACK[0x7C0]) - 1224922075) & 0xDF6FFD4F) + 34)
                                               * (LOBYTE(STACK[0x7D7]) > 0x39u)) | LODWORD(STACK[0x7C0])))
                            - (((LODWORD(STACK[0x7C0]) - 530) | 0x20u) ^ 0x1ECLL)))();
}

uint64_t sub_22D1FE710()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((1023 * (LOBYTE(STACK[0x7D7]) < 0x41u)) ^ v0))
                            - ((v0 + 1577793243) & 0xA1F4C7FE)
                            + 182))();
}

uint64_t sub_22D1FE754()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((440 * (LOBYTE(STACK[0x7D7]) < ((v0 - 1004165535) & 0xFB ^ 0x5Cu))) ^ v0))
                            - (v0 ^ (v1 + 170) ^ (unint64_t)(v2 + 8))))();
}

uint64_t sub_22D1FE7A4@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;
  _BOOL4 v5;
  uint64_t (*v6)(void);

  v3 = v1 + a1 + 316;
  v5 = LODWORD(STACK[0x7B8]) + 731771676 <= (int)(v3 ^ 0xFFFFFC84 ^ ((v1 + a1 + 65) | 0x200))
    && LODWORD(STACK[0x7D8]) - 2141811508 < 0;
  v6 = (uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((45 * v5) ^ (v1 + a1 + 540))) - 8);
  LODWORD(STACK[0x820]) = v3;
  return v6();
}

void sub_22D1FE8B0()
{
  int v0;
  uint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;

  v2 = STACK[0x820];
  LODWORD(STACK[0x824]) = STACK[0x820];
  v3 = (v2 + 7086854) | 0x9601090A;
  LODWORD(STACK[0x828]) = v3;
  LODWORD(STACK[0x82C]) = v2 + 224;
  v4 = (16 * LODWORD(STACK[0x7B8])
      - ((v2 + 224 + (v3 ^ 0xAD8F808E)) & (32 * LODWORD(STACK[0x7B8]) + 868115328))
      - 674199115) ^ 0x1DF157F5 | (v0 - 318281394);
  v5 = *(_QWORD *)(v1 + 4128) + LODWORD(STACK[0xB98]) - 1518003506;
  v6 = -711945521
     * ((-711945521 * ((v5 ^ LODWORD(STACK[0x7D0])) & 0x7FFFFFFF)) ^ ((-711945521
                                                                                   * ((v5 ^ LODWORD(STACK[0x7D0])) & 0x7FFFFFFF)) >> 16));
  LOBYTE(STACK[0x61B]) = byte_22D251110[v6 >> 24] ^ byte_22D24D480[v6 >> 24] ^ byte_22D24D580[(v6 >> 24) + 2] ^ (v4 - ((2 * v4) & 0x46) - 93) ^ v6 ^ (-83 * ((-711945521 * ((-711945521 * ((v5 ^ LODWORD(STACK[0x7D0])) & 0x7FFFFFFF)) ^ ((-711945521 * ((v5 ^ LODWORD(STACK[0x7D0])) & 0x7FFFFFFF)) >> 16))) >> 24)) ^ 0xA3;
  JUMPOUT(0x22D21289CLL);
}

void sub_22D1FE9D8()
{
  uint64_t v0;

  sub_22D22F914(*(_QWORD *)(v0 + 4128));
  JUMPOUT(0x22D1F0CA8);
}

uint64_t sub_22D1FEA0C()
{
  uint32_t v0;

  STACK[0x2A8] = (unint64_t)malloc_type_malloc(STACK[0x290], 0xC5732911uLL);
  v0 = arc4random();
  LODWORD(xmmword_255D65D28) = v0 + 257242056 - ((2 * v0) & 0x1EAA6790);
  DWORD1(xmmword_255D65D28) = ((1812433253
                              * (xmmword_255D65D28 ^ 0x18F57E20 ^ ((xmmword_255D65D28 >> 30) | 0x17A04DE8))) ^ 0xECEBF74F)
                            + ((-670100790
                              * (xmmword_255D65D28 ^ 0x18F57E20 ^ ((xmmword_255D65D28 >> 30) | 0x17A04DE8))) & 0xD9D7EE9E)
                            + 577322106
                            - ((2
                              * (((1812433253
                                 * (xmmword_255D65D28 ^ 0x18F57E20 ^ ((xmmword_255D65D28 >> 30) | 0x17A04DE8))) ^ 0xECEBF74F)
                               + ((-670100790
                                 * (xmmword_255D65D28 ^ 0x18F57E20 ^ ((xmmword_255D65D28 >> 30) | 0x17A04DE8))) & 0xD9D7EE9E))
                              + 1713901924) & 0x1EAA6790);
  return ((uint64_t (*)(void))sub_22D1FEB54)();
}

void sub_22D1FEB54()
{
  JUMPOUT(0x22D1FEAE4);
}

uint64_t sub_22D1FEB70@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  int v5;
  _DWORD *v6;
  uint32_t v7;
  uint32_t v8;
  int v9;
  unsigned int v10;

  LODWORD(STACK[0x318]) = a1 + 1;
  v4 = (int *)STACK[0x270];
  gettimeofday((timeval *)STACK[0x270], 0);
  v5 = *v4;
  v6 = (_DWORD *)STACK[0x280];
  v6[1] = *(_DWORD *)(STACK[0x280] + 24) + 257242056 - ((*(_DWORD *)(STACK[0x280] + 24) << (v1 + 82)) & 0x1EAA6790);
  v6[2] = v5 + 257242056 - ((2 * v5) & 0x1EAA6790);
  v7 = arc4random();
  v6[3] = v7 + 257242056 - ((2 * v7) & 0x1EAA6790);
  v8 = arc4random();
  **(_DWORD **)(v2 + 185) = v8 + 257242056 - ((2 * v8) & 0x1EAA6790);
  v9 = (DWORD1(xmmword_255D65D28) ^ 0x38926AF2 ^ (1664525
                                                * (xmmword_255D65D28 ^ 0xE7E0FB4 ^ ((xmmword_255D65D28 >> 30) | 0x12B3C7C))
                                                - ((3329050
                                                  * (xmmword_255D65D28 ^ 0xE7E0FB4 ^ ((xmmword_255D65D28 >> 30) | 0x12B3C7C))) & 0x6F8EB274)
                                                + 935811386))
     + (**(_DWORD **)(v2 + 185) ^ 0xF5533C8);
  v10 = (v9 ^ 0xCF6EFBFB) + 1833625554 + ((2 * v9) & 0x9EDDF7F6);
  DWORD1(xmmword_255D65D28) = v10 - ((2 * v10 + 109852774) & 0x1EAA6790) - 761573381;
  STACK[0x5C8] = qword_24F86A890[(v1 + 769851731) ^ 0x2DE302A1];
  LODWORD(STACK[0x5E0]) = (v1 + 769851731) ^ 0xF5;
  LODWORD(STACK[0x5E4]) = v1 + 769851731;
  LODWORD(STACK[0x5E8]) = (v1 + 769851731) | 0x88;
  *(_DWORD *)(v3 - 192) = 1431737413
                        * ((-769063906 - ((v3 - 200) | 0xD229041E) + ((v3 - 200) | 0x2DD6FBE1)) ^ 0x938864F3)
                        + 40706419
                        + v1
                        - 1771230052;
  LODWORD(STACK[0x5D0]) = 1;
  STACK[0x5D8] = 146105717;
  STACK[0x5F0] = 146105719;
  STACK[0x23F8] = (unint64_t)&STACK[0x5C8];
  sub_22D219DEC(v3 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v3 - 188)] - 4))();
}

uint64_t sub_22D1FEE58()
{
  uint64_t v0;
  unsigned int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((50 * (v1 < 0x8B56575)) | 0x205)) - 4))();
}

uint64_t sub_22D1FEEAC()
{
  uint64_t v0;
  int v1;
  unsigned int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8 * ((((v1 + 1771230394) ^ 0x237) * (v2 > 0x8B567E4)) ^ (v1 + 1771230394)))
                            - 4))();
}

uint64_t sub_22D1FEEF4()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unsigned int v7;

  v7 = (v0 - 160564282) & 0x9FFF2F7F;
  LODWORD(xmmword_255D65D28) = dword_255D666E4;
  STACK[0x5C8] = *(_QWORD *)(v1 + 8 * (int)(v7 + 1771230040));
  STACK[0x5D8] = 2395522656;
  LODWORD(STACK[0x5D0]) = v2;
  LODWORD(STACK[0x5E0]) = (v7 - 1285622775) ^ 0x6E;
  LODWORD(STACK[0x5E4]) = v7 - 1285622775;
  LODWORD(STACK[0x5E8]) = (v7 - 1285622775) ^ 0x3E;
  STACK[0x5F0] = (v3 + 561897103);
  STACK[0x23F8] = v4;
  *(_DWORD *)(v6 - 192) = 1431737413 * (((v5 | 0x7E8199B1) + (~v5 | 0x817E664E)) ^ 0xC0DF06A2) + 40706419 + v7;
  sub_22D219DEC(v6 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v6 - 188)] - 12))();
}

uint64_t sub_22D1FEFF0()
{
  uint64_t v0;
  unsigned int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((39 * (v1 < 0x8EC8C660)) ^ 0x25C)) - 12))();
}

uint64_t sub_22D1FF070()
{
  uint64_t v0;
  unsigned int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((39 * (v1 > 0x8EC8C663)) ^ 0x25C)) - 12))();
}

uint64_t sub_22D1FF0E0@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;

  v6 = 35 * (a1 ^ 0x27E);
  *(_DWORD *)(*(_QWORD *)(v5 + 185) + 4 * (v4 - 1833625728 + v6)) ^= 0xFA33BA4E ^ *(_DWORD *)(STACK[0x2A8] + 4 * (v4 - 1833625728 + v6));
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((114
                                          * (v3 - 1 == ((((v6 - 2111766636) | 0x144C2D08) + 53316461) ^ (v6 - v1 - 176)))) ^ v6))
                            - 8))();
}

void sub_22D1FF1A4()
{
  JUMPOUT(0x22D1FEC80);
}

uint64_t sub_22D1FF1AC@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  _DWORD *v3;
  uint64_t v4;
  int v5;

  *v3 = v3[623];
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (int)((580
                                               * (v5 + v1 + v2 + ((a1 + 2004613591) & 0x888404DD ^ 0x1F7) - 298 == 587426788)) ^ (a1 + 2004613591) & 0x888404DD))
                            - 8))();
}

uint64_t sub_22D1FF214@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;

  v5 = 4 * (v3 - 1044104017);
  v6 = *(_DWORD *)(v1 + 4 * (v3 - 1044104018));
  v7 = (*(_DWORD *)(v1 + v5) ^ 0xFBB6B4D4 ^ (1566083941 * (v6 ^ 0xF5533C8 ^ (v6 >> 30))
                                           - ((-1162799414 * (v6 ^ 0xF5533C8 ^ (v6 >> 30))) & 0xE9C70E38)
                                           - 186415332))
     - v3;
  *(_DWORD *)(v1 + v5) = v7 - ((2 * v7 + 477595298) & 0x1EAA6790) + 1301346073;
  STACK[0x5C8] = *(_QWORD *)(v2 + 8 * (a1 + 1771230040));
  STACK[0x5D8] = 2573080195;
  LODWORD(STACK[0x5D0]) = 1;
  LODWORD(STACK[0x5E0]) = a1 + 1151367270;
  LODWORD(STACK[0x5E4]) = a1 + 1151367284;
  LODWORD(STACK[0x5E8]) = (a1 + 1151367284) ^ 0x6A;
  STACK[0x5F0] = (v3 + 1528976179);
  *(_DWORD *)(v4 - 192) = 1431737413
                        * ((1794860574 - ((v4 - 200) | 0x6AFB661E) + ((v4 - 200) | 0x950499E1)) ^ 0x2B5A06F3)
                        + 40706419
                        + a1;
  STACK[0x23F8] = (unint64_t)&STACK[0x5C8];
  sub_22D219DEC(v4 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v4 - 188)] - 8))();
}

uint64_t sub_22D1FF3A0()
{
  uint64_t v0;
  unsigned int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((910 * (v1 >= 0x995E1683)) ^ 0x1A6)) - 8))();
}

uint64_t sub_22D1FF3F8()
{
  uint64_t v0;
  unsigned int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((910 * (((v1 > 0x995E18F2) ^ 0x29) & 1)) ^ 0x1A6)) - 8))();
}

uint64_t sub_22D1FF458()
{
  int v0;
  int v1;
  int v2;
  int8x16_t v3;
  int8x16_t v4;
  int32x4_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int32x4_t v9;
  int8x16_t v10;

  v2 = v0 - v1 - 299;
  LODWORD(xmmword_255D65D28) = -1890241592;
  free((void *)STACK[0x2A8]);
  v3 = (int8x16_t)vld1q_dup_f32((const float *)&xmmword_255D65D28);
  v4.i64[0] = 0x8000000080000000;
  v4.i64[1] = 0x8000000080000000;
  v5.i64[0] = 0x100000001;
  v5.i64[1] = 0x100000001;
  v6.i64[0] = *(_QWORD *)((char *)&xmmword_255D65D28 + 4);
  v6.i32[2] = HIDWORD(xmmword_255D65D28);
  v7 = vextq_s8(v3, v6, 0xCuLL);
  v8 = v6;
  v8.i32[3] = dword_255D65D38;
  v9 = (int32x4_t)veorq_s8(vorrq_s8((int8x16_t)vaddq_s32(vaddq_s32((int32x4_t)veorq_s8(vandq_s8(v8, (int8x16_t)vdupq_n_s32(0x744957BCu)), (int8x16_t)vdupq_n_s32(0x50084515u)), (int32x4_t)veorq_s8(vandq_s8(v8, (int8x16_t)vdupq_n_s32(0xBB6A842u)), (int8x16_t)vdupq_n_s32(0xB142041u))), v5), vandq_s8(v7, v4)), (int8x16_t)vdupq_n_s32(0x5449569Cu));
  v10.i32[0] = *((_DWORD *)&STACK[0x2240] + (BYTE4(xmmword_255D65D28) & 1));
  v10.i32[1] = *((_DWORD *)&STACK[0x2240] + (BYTE8(xmmword_255D65D28) & 1));
  v10.i32[2] = *((_DWORD *)&STACK[0x2240] + (BYTE12(xmmword_255D65D28) & 1));
  v10.i32[3] = *((_DWORD *)&STACK[0x2240] + (dword_255D65D38 & 1));
  xmmword_255D65D28 = (__int128)veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)((char *)&xmmword_255D65D28 + 36 * ((v2 + 1771230366) ^ 0x1D1u)- 428), v10), (int8x16_t)vdupq_n_s32(0x52E863E2u)), (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vsubq_s32(v9, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v9, v9), (int8x16_t)vdupq_n_s32(0x95E796Eu))), vdupq_n_s32(0x84AF3CB6)), 1uLL));
  return ((uint64_t (*)(void))qword_24F86A890[v2 + 1771230366])();
}

uint64_t sub_22D1FF4D4(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t (*v10)(unint64_t *);

  if (v3 <= 0x839FD557)
    v6 = *(_DWORD *)(v4 + 1832) + 1;
  else
    v6 = 1416753466;
  *(_DWORD *)(v4 + 1832) = v6;
  v7 = ((((v2 ^ (v2 >> 11)) << 7) ^ 0xAA6CB700)
      - ((2 * (((v2 ^ (v2 >> 11)) << 7) ^ 0xAA6CB700)) & 0x2619E300)
      + 319615468) & 0x9D2C5680 ^ v2 ^ (v2 >> 11);
  v8 = (((v7 << 15) ^ 0x44F70000) - ((2 * ((v7 << 15) ^ 0x44F70000)) & 0x9D30000) + 82432771) & 0xEFC60000 ^ 0x6C000000;
  v9 = (((((2 * v8) & 0x16800000) - v8 - 192010918) & 0x82420000 ^ 0x21860CD)
      + ((((2 * v8) & 0x16800000) - v8 - 192010918) & 0x7D840000 ^ 0x4040001)
      - 2) ^ v7;
  *(_BYTE *)(STACK[0x18B8] + (v5 - 1141862890)) = ((v9 ^ (v9 >> 18) ^ 0x22)
                                                               - ((2 * (v9 ^ (v9 >> 18) ^ 0x22)) & 0xE8)
                                                               - 12) ^ 0x25;
  v10 = (uint64_t (*)(unint64_t *))(*(_QWORD *)(a2
                                                               + 8
                                                               * ((28
                                                                 * (v5
                                                                  - (((v9 ^ (v9 >> 18) ^ 0x22)
                                                                                     - ((2 * (v9 ^ (v9 >> 18) ^ 0x22)) & 0xE8)
                                                                                     - 12) != 0x25) == 1141862889)) ^ 0x1CF))
                                                   - 12);
  LODWORD(STACK[0xE18]) = 561;
  return v10(&STACK[0x16A0]);
}

uint64_t sub_22D1FF4E8()
{
  int v0;
  int v1;
  _DWORD *v2;
  uint64_t v3;
  int v4;

  *v2 = v2[623];
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((v4 - 1 == ((v1 + ((v0 - 1888369626) & 0x708E3BFF) - 511) ^ 0xBCB8BB9C))
                                          * (((((v0 - 1888369626) & 0x708E3BFF) - 509) | 0x88) ^ 0x240)) ^ (v0 - 1888369626) & 0x708E3BFF))
                            - 8))();
}

uint64_t sub_22D1FF558()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;

  v5 = 4 * (v2 - 704493279);
  v6 = *(_DWORD *)(v0 + 4 * (v2 - 704493280));
  v7 = (*(_DWORD *)(v0 + v5) ^ 0x6024EFA2 ^ (1566083941 * (v6 ^ 0xCCC406C4 ^ ((v6 >> 30) | 0xC391350C))
                                           - ((-1162799414 * (v6 ^ 0xCCC406C4 ^ ((v6 >> 30) | 0xC391350C))) & 0xDEE3B8D4)
                                           + 1869732970))
     - v2;
  *(_DWORD *)(v0 + v5) = v7 - ((2 * v7 + 335244734) & 0x1EAA6790) + 961735335;
  STACK[0x5C8] = *(_QWORD *)(v1 + 8 * ((v3 - 810335862) ^ 0x66206E70));
  LODWORD(STACK[0x5D0]) = v3 - 810335862;
  LODWORD(STACK[0x5E0]) = 0;
  LODWORD(STACK[0x5E4]) = (v3 - 810335862) & 0xEF24EFDA;
  LODWORD(STACK[0x5E8]) = (v3 - 810335862) ^ 0x38;
  STACK[0x5D8] = (v2 + 1257095745);
  STACK[0x5F0] = 1961589023;
  *(_DWORD *)(v4 - 192) = 1431737413
                        * ((644274477 - ((v4 - 200) | 0x2666D92D) + ((v4 - 200) | 0xD99926D2)) ^ 0x67C7B9C0)
                        + 40706419
                        + v3;
  STACK[0x23F8] = (unint64_t)&STACK[0x5C8];
  sub_22D219DEC(v4 - 200);
  return ((uint64_t (*)(void))qword_24F86A890[*(int *)(v4 - 188)])();
}

uint64_t sub_22D1FF6F0()
{
  uint64_t v0;
  unsigned int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((50 * (v1 < 0x74EB791F)) ^ 0x1D9)) - 8))();
}

uint64_t sub_22D1FF744()
{
  uint64_t v0;
  unsigned int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((50 * (v1 > 0x74EB7B8E)) ^ 0x1D9)) - 8))();
}

uint64_t sub_22D1FF7A0()
{
  int v0;
  int v1;
  int v2;
  int8x16_t v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int32x4_t v16;
  int8x16_t v17;

  v2 = v0 ^ (v1 + 118);
  LODWORD(xmmword_255D65D28) = -1890241592;
  free((void *)STACK[0x2A8]);
  v3 = (int8x16_t)vld1q_dup_f32((const float *)&xmmword_255D65D28);
  v4 = (int8x16_t)vdupq_n_s32(0x7FFFFFFEu);
  v5 = (int8x16_t)vdupq_n_s32(0x5CE21C1Au);
  v6.i64[0] = 0x8000000080000000;
  v6.i64[1] = 0x8000000080000000;
  v7.i64[0] = 0x1300000013;
  v7.i64[1] = 0x1300000013;
  v8.i64[0] = *(_QWORD *)((char *)&xmmword_255D65D28 + 4);
  v8.i32[2] = HIDWORD(xmmword_255D65D28);
  v9 = vextq_s8(v3, v8, 0xCuLL);
  v10 = v8;
  v10.i32[3] = dword_255D65D38;
  v11 = (int8x16_t)vaddq_s32((int32x4_t)vorrq_s8(v9, v4), vdupq_n_s32(0x4559E2EEu));
  v12 = (int32x4_t)veorq_s8(vandq_s8(v10, v4), (int8x16_t)vdupq_n_s32(0x62D110BAu));
  v13 = (int32x4_t)veorq_s8((int8x16_t)vsubq_s32(vaddq_s32(v12, (int32x4_t)veorq_s8(vandq_s8(v10, v5), (int8x16_t)vdupq_n_s32(0x9C220C00))), (int32x4_t)vandq_s8((int8x16_t)v12, v5)), (int8x16_t)vdupq_n_s32(0xFCE63F68));
  v14 = (int8x16_t)vaddq_s32(vsubq_s32(v13, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v13, v13), (int8x16_t)vdupq_n_s32(0xE21A718u))), vdupq_n_s32(0x8710D38C));
  v15 = veorq_s8(v14, (int8x16_t)vdupq_n_s32(0xCA90D38C));
  v16 = (int32x4_t)veorq_s8(vandq_s8(v15, (int8x16_t)vdupq_n_s32(0xE8AF5DBu)), vandq_s8(v14, v7));
  v17 = (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8(v15, vbicq_s8(v6, v11)), vaddq_s32(v16, v16)), vdupq_n_s32(0xE8AF5C8u)), 1uLL);
  v15.i32[0] = *((_DWORD *)&STACK[0x1938] + (BYTE4(xmmword_255D65D28) & 1));
  v15.i32[1] = *((_DWORD *)&STACK[0x1938] + (BYTE8(xmmword_255D65D28) & 1));
  v15.i32[2] = *((_DWORD *)&STACK[0x1938] + (BYTE12(xmmword_255D65D28) & 1));
  v15.i32[3] = *((_DWORD *)&STACK[0x1938] + (dword_255D65D38 & 1));
  xmmword_255D65D28 = (__int128)veorq_s8(veorq_s8(veorq_s8((int8x16_t)xmmword_255D6635C, v15), (int8x16_t)vdupq_n_s32(0x3B13CCA0u)), v17);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(qword_24F86A890[(v2 + 1771230135) ^ 0x3EB] - 4))(389573935, 1558322202, 243987912);
}

uint64_t sub_22D1FF7F4(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (((97 * (v2 ^ 0x177) - 716) * (a1 != 0)) ^ v2)) - 12))();
}

uint64_t sub_22D1FF830()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  CFTypeID v3;
  unint64_t v4;
  uint64_t v5;
  CFTypeID TypeID;

  v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 384));
  v4 = v3 ^ 0xBDD5CEF9AE7E39FDLL;
  v5 = (2 * v3) & 0x7BAB9DF35CFC73FALL;
  TypeID = CFNumberGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((1822
                                          * ((v0 - 218)
                                           + v4
                                           + v5
                                           + (TypeID ^ 0x82C230D695080224)
                                           - ((2 * TypeID) & 0xFA7B9E52D5EFFBB6) == 0x4097FFD043863EA7)) ^ v0))
                            - 4))();
}

uint64_t sub_22D1FF8E0()
{
  int v0;
  Boolean Value;

  Value = CFNumberGetValue((CFNumberRef)STACK[0x1820], kCFNumberSInt64Type, &STACK[0x300]);
  return ((uint64_t (*)(void))(qword_24F86A890[(161
                                             * (((((((v0 ^ 0x39) + 45) ^ 0x2D) + 11 * (v0 ^ 0x39)) & (2 * Value))
                                                                + (Value ^ 0xBF)) != 191)) ^ v0]
                            - 4))();
}

uint64_t sub_22D1FF954()
{
  int v0;
  void *v1;

  LODWORD(STACK[0x4D0]) = -1084420343;
  v1 = malloc_type_malloc(8uLL, 0xD29E14C9uLL);
  STACK[0x18F8] = (unint64_t)v1;
  return ((uint64_t (*)(void))(qword_24F86A890[((v1 == 0)
                                             * ((((v0 - 907) | 0x217) ^ 0x750) + ((v0 + 924860188) & 0xC8DFBF96))) ^ v0]
                            - 8))();
}

uint64_t sub_22D1FF9E0()
{
  int v0;
  uint64_t v1;
  _QWORD *v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t (*v5)(void);

  v3 = (_BYTE *)STACK[0x18F8];
  *v3 = (HIBYTE(STACK[0x300]) - ((STACK[0x300] >> 55) & 0xAA) - 43) ^ 0xD5;
  v3[1] = ((STACK[0x300] >> ((v0 - 59) ^ 0x14u)) - ((2 * (STACK[0x300] >> ((v0 - 59) ^ 0x14u))) & 0x68) + 52) ^ 0x34;
  v3[2] = (((unsigned __int16)WORD2(STACK[0x300]) >> 8) - ((STACK[0x300] >> 39) & 0x2A) + 21) ^ 0x15;
  v3[3] = (HIDWORD(STACK[0x300]) - ((STACK[0x300] >> 31) & 0xC8) + 100) ^ 0x64;
  v3[4] = (HIBYTE(LODWORD(STACK[0x300])) - ((LODWORD(STACK[0x300]) >> 23) & 0x3C) - 98) ^ 0x9E;
  v3[5] = (HIWORD(LODWORD(STACK[0x300])) - ((LODWORD(STACK[0x300]) >> 15) & 0xAE) - 41) ^ 0xD7;
  v3[6] = ((~(LODWORD(STACK[0x300]) >> 7) | 0x2F) + BYTE1(LODWORD(STACK[0x300])) - 23) ^ 0xE8;
  v3[7] = (LOBYTE(STACK[0x300]) - ((2 * LOBYTE(STACK[0x300])) & 0x77) - 69) ^ 0xBB;
  v4 = sub_22D22F638(8, 0x32u, -293215619);
  *(_QWORD *)(v1 + 1) = v4;
  v5 = (uint64_t (*)(void))(qword_24F86A890[(55 * (v4 == 0)) ^ v0] - 8);
  LODWORD(STACK[0x61C]) = v0;
  v2[23] = 0x58CB08424C0CECA8;
  v2[24] = 0x26EE77AE983BDBA5;
  v2[25] = 0x28C607C2CC7E7287;
  return v5();
}

uint64_t sub_22D1FFB98@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  uint64_t v3;

  LODWORD(STACK[0x2BC]) = a2;
  STACK[0x210] = *(_QWORD *)(v3 + 1);
  return ((uint64_t (*)(unint64_t))(*(_QWORD *)(a1
                                                               + 8
                                                               * (((((v2 + 1584660297) & 0xFFDFADF6 ^ 0x2BAC7298) == 1979703284)
                                                                 * ((v2 + 1584660297) ^ 0x5E73FF02)) ^ (v2 + 1152)))
                                                   - 8))(STACK[0x18F8]);
}

void sub_22D1FFBE4()
{
  int v0;
  int v1;
  int v2;

  v2 = v1 ^ 0x4BED28A9;
  if ((v1 ^ 0x4BED28A9u) <= 1)
    v2 = 1;
  LODWORD(STACK[0x12CC]) = (v0 ^ 0x271209CF) + v2;
  JUMPOUT(0x22D1FFC20);
}

uint64_t sub_22D1FFC90@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((249
                                          * ((*(char *)(*(_QWORD *)(v5 + 4104)
                                                                    + ((v2
                                                                      - 2
                                                                      * ((((v3 + v4 + a2 - 1123 + 42) | 0xC4) - 233) & v2 ^ (v2 + 31188088) & 0x3B4A25E)
                                                                      - 1248819501) ^ 0x3B4A25Bu))
                                                          - 48) > 9)) ^ a2))
                            - 12))();
}

uint64_t sub_22D1FFD30(uint64_t a1, uint64_t a2)
{
  int v2;
  char v3;
  char v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * ((510
                                          * (((v2 - v4 + 18) ^ ((v3 - 65) < (v2 + 25))) & 1)) ^ v2))
                            - 8))();
}

uint64_t sub_22D1FFD78(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * ((11
                                          * ((((v4 + 389 - v5 - 627 - v6 + 596) ^ ((*(char *)(*(_QWORD *)(v7 + 4104) + (v3 ^ v2))
                                                                                                - 48) < 0xA)) & 1) == 0)) ^ (v4 + 248)))
                            - 4))();
}

uint64_t sub_22D1FFE30(uint64_t a1, uint64_t a2)
{
  char v2;
  int v3;
  int v4;
  int v5;

  return (*(uint64_t (**)(void))(a2
                              + 8
                              * ((((v2 + (v3 ^ 0xCA) + 33) < 6u) * (v4 + v5 + v3 - 596 + 254)) ^ v3)))();
}

uint64_t sub_22D1FFE7C@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  _BOOL4 v9;
  uint64_t (*v10)(void);

  v6 = v3 + v2 + 32;
  v7 = (v5 - 182307706) & 0x74709FFE;
  v9 = a2 + 843231323 <= (int)(v7 ^ 0xFFFFFE2F) && v6 + 1238527701 < 0;
  v10 = *(uint64_t (**)(void))(a1 + 8 * ((v4 + v5 + 794) | (2 * v9)));
  LODWORD(STACK[0x7A4]) = v7;
  return v10();
}

uint64_t sub_22D1FFF34()
{
  int v0;

  sub_22D22F914(STACK[0x16F8]);
  LODWORD(STACK[0x2B8]) = -45002;
  return ((uint64_t (*)(_QWORD))qword_24F86A890[(546
                                                         * ((unsigned __int16)((LOWORD(STACK[0x1568])
                                                                              - ((2 * LOWORD(STACK[0x1568]) - 31614) & ((v0 - 11194) ^ 0xDAA1))
                                                                              - 20519) ^ (((v0 - 8448) | 0x2100) + 16461)) > 1u)) ^ (v0 + 1771230278)])(0);
}

uint64_t sub_22D1FFF70()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t (*v5)(void);

  v3 = *(_BYTE **)(v1 + 17);
  *v3 = (HIBYTE(STACK[0x2D8]) - ((HIBYTE(STACK[0x2D8]) << (((v0 - 116) ^ 7) - 24)) & 0x2E) + 23) ^ 0x17;
  v3[1] = (HIWORD(STACK[0x2D8]) - ((STACK[0x2D8] >> 47) & 0xCE) - 25) ^ 0xE7;
  v3[2] = (((unsigned __int16)WORD2(STACK[0x2D8]) >> 8) - ((STACK[0x2D8] >> 39) & 8) + 4) ^ 4;
  v3[3] = (HIDWORD(STACK[0x2D8]) - ((STACK[0x2D8] >> 31) & 0xF8) + 124) ^ 0x7C;
  v3[4] = (HIBYTE(LODWORD(STACK[0x2D8])) - ((LODWORD(STACK[0x2D8]) >> 23) & 0x16) - 117) ^ 0x8B;
  v3[5] = (HIWORD(LODWORD(STACK[0x2D8])) - ((LODWORD(STACK[0x2D8]) >> 15) & 0xE2) - 15) ^ 0xF1;
  v3[6] = (BYTE1(LODWORD(STACK[0x2D8])) - ((LODWORD(STACK[0x2D8]) >> 7) & 0xC6) + 99) ^ 0x63;
  v3[7] = (LOBYTE(STACK[0x2D8]) - ((2 * LOBYTE(STACK[0x2D8])) & 0x90) + 72) ^ 0x48;
  v4 = sub_22D22F638(8, 0x32u, 2025981945);
  STACK[0x12D0] = v4;
  v5 = (uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((93 * (v4 == 0)) ^ (v0 - 116))) - 12);
  LODWORD(STACK[0xCD4]) = v0 - 116;
  STACK[0xCD8] = 0x491C63C96E33C555;
  STACK[0xCE0] = 0x4E945DF4516066F0;
  STACK[0xCE8] = 0x74F781778E28AFA8;
  return v5();
}

uint64_t sub_22D200124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(a5 + 664) = 0xA55E069B3C56B644;
  LODWORD(STACK[0x440]) = dword_255D666E8 - 266572532;
  v10 = *(unsigned int *)(v7 + 1832);
  v8[12] = *(_QWORD *)(a4 + 8 * ((v6 + 934397895) ^ 0x1FFFFFFFCE1EF5BBLL));
  LODWORD(STACK[0x5D0]) = v6 + 934397895;
  LODWORD(STACK[0x5E0]) = 0;
  v8[14] = 1416753466;
  LODWORD(STACK[0x5E4]) = (v6 + 934397895) ^ 0x1C;
  LODWORD(STACK[0x5E8]) = (v6 + 934397895) ^ 0x96;
  v8[17] = v10;
  *(_QWORD *)(a6 + 448) = &STACK[0x5C8];
  *(_DWORD *)(v9 - 192) = 1431737413 * ((v9 - 1523856494 - 2 * ((v9 - 200) & 0xA52BCC5A)) ^ 0x1B755348) + 40706419 + v6;
  sub_22D219DEC(v9 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v9 - 188)] - 4))();
}

uint64_t sub_22D200220()
{
  uint32_t v0;
  unsigned int v1;

  STACK[0x2A8] = (unint64_t)malloc_type_malloc(STACK[0x240], 0xC5732911uLL);
  v0 = arc4random();
  v1 = v0 + ~((2 * v0) & 0x1EAA6790) + 257242057;
  LODWORD(xmmword_255D65D28) = v1;
  DWORD1(xmmword_255D65D28) = ((1812433253 * (v1 ^ 0xF5533C8 ^ (v1 >> 30))) ^ 0xE3BD5B17)
                            + ((-670100790 * (v1 ^ 0xF5533C8 ^ (v1 >> 30))) & 0xC77AB62E)
                            + 731371698
                            - ((2
                              * (((1812433253 * (v1 ^ 0xF5533C8 ^ (v1 >> 30))) ^ 0xE3BD5B17)
                               + ((-670100790 * (v1 ^ 0xF5533C8 ^ (v1 >> 30))) & 0xC77AB62E))
                              - 1736095276) & 0x1EAA6790);
  return ((uint64_t (*)(void))sub_22D200368)();
}

void sub_22D200368()
{
  JUMPOUT(0x22D2002E8);
}

void sub_22D200384()
{
  JUMPOUT(0x22D20039CLL);
}

uint64_t sub_22D200578@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W8>)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  unsigned int v10;

  v9 = (_DWORD *)(a5 + 4 * (v7 + v8));
  v10 = ((*v9 & 0x7FFFFFFE ^ 0x62D110BA) + (*v9 & a2 ^ 0x9C220C00) - ((*v9 & 0x7FFFFFFE ^ 0x62D110BA) & a2)) ^ 0xFCE63F68;
  *(_DWORD *)(a5 + 4 * (((a6 + 766) ^ (unint64_t)(v8 + 1023)) + v7)) = v9[396] ^ *((_DWORD *)&STACK[0x1938] + (*v9 & 1)) ^ ((((v10 - ((2 * v10) & 0xE21A718) - 2028940404) ^ 0xCA90D38C | ~((v6 | 0x7FFFFFFE) + 1163518702) & 0x80000000) + a3 - 2 * (((v10 - ((2 * v10) & 0xE21A718) - 2028940404) ^ 0xCA90D38C) & (a3 + 19) ^ (v10 - ((2 * v10) & 0xE21A718) - 2028940404) & 0x13)) >> 1) ^ 0x3B13CCA0;
  return ((uint64_t (*)(void))(*(_QWORD *)(a4 + 8 * ((35 * (v7 + 1 == a1 + 3)) ^ a6)) - 4))();
}

uint64_t sub_22D200680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int8x16_t *a6)
{
  uint64_t v6;
  int v7;
  int8x16_t v8;
  uint64_t v9;
  const float *v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int8x16_t v18;

  v9 = (v7 - 704025156) & 0x29F68FCF;
  v10 = (const float *)&a6[56].i32[3];
  v11 = (int8x16_t)vld1q_dup_f32(v10);
  v12.i64[0] = 0x8000000080000000;
  v12.i64[1] = 0x8000000080000000;
  v8.i64[0] = a6[57].i64[0];
  v8.i32[2] = a6[57].i32[2];
  v13 = vextq_s8(v11, v8, 0xCuLL);
  v14 = v8;
  v14.i32[3] = a6[57].i32[3];
  v15 = (int8x16_t)vaddq_s32((int32x4_t)veorq_s8(vandq_s8(v13, v12), (int8x16_t)vdupq_n_s32(0xB5CCEE98)), vdupq_n_s32(0xCB3697AC));
  v16 = (int32x4_t)veorq_s8(vandq_s8(v14, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x1B433351u));
  v17 = (int32x4_t)veorq_s8((int8x16_t)vsubq_s32(vaddq_s32(v16, (int32x4_t)veorq_s8(vandq_s8(v14, (int8x16_t)vdupq_n_s32(0x4C9B912Eu)), (int8x16_t)vdupq_n_s32(0xC498802E))), (int32x4_t)vandq_s8((int8x16_t)v16, (int8x16_t)vdupq_n_s32(0x4C9B912Fu))), (int8x16_t)vdupq_n_s32(0xD88D91B6));
  v18.i32[0] = *(_DWORD *)(v6 + 4 * (a6[57].i32[0] & 1));
  v18.i32[1] = *(_DWORD *)(v6 + 4 * (a6[57].i32[1] & 1));
  v18.i32[2] = *(_DWORD *)(v6 + 4 * (a6[57].i32[2] & 1));
  v18.i32[3] = *(_DWORD *)(v6 + 4 * (v14.i8[12] & 1));
  *(int8x16_t *)((char *)a6 + 4 * (v9 ^ 0x16FLL)) = veorq_s8(veorq_s8(veorq_s8(*a6, v18), (int8x16_t)vdupq_n_s32(0x2A89337u)), (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8((int8x16_t)v17, veorq_s8(v15, (int8x16_t)vdupq_n_s32(0x81038644))), (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v17, v17), (int8x16_t)vdupq_n_s32(0xFBF895CC))), vdupq_n_s32(0x7DFC4AE6u)), 1uLL));
  return (*(uint64_t (**)(void))(a5 + 8 * (v9 ^ 0x58C ^ (175 * (((4 - v9) | (v9 - 4)) >= 0)))))();
}

void sub_22D200838()
{
  JUMPOUT(0x22D200760);
}

uint64_t sub_22D200848@<X0>(uint64_t a1@<X4>, _DWORD *a2@<X5>, unsigned int a3@<W8>)
{
  unsigned int v3;

  v3 = ((((2 * (*a2 & 0x7FFFFFFE ^ 0x67F17E4)) | 0x901F8EE2) - (*a2 & 0x7FFFFFFE ^ 0x67F17E4) - 1208993649) | (((a3 + 340338038) | 0x8224044B) - 376253771) & a2[623]) ^ 0x4125E35D;
  a2[623] = a2[396] ^ *((_DWORD *)&STACK[0x1938] + (*a2 & 1)) ^ ((v3 - ((2 * v3) & 0xB639F9F0) + 1528626424) >> 1) ^ 0x11D8C838;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((LODWORD(STACK[0x440]) < 0x270) | (16 * (LODWORD(STACK[0x440]) < 0x270)) | a3))
                            - 12))();
}

uint64_t sub_22D200920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v11 = LODWORD(STACK[0x440])++;
  dword_255D666E8 = v11 + 266572533;
  v12 = (*(_DWORD *)(v8 + 1832) + 1454078422);
  v9[12] = *(_QWORD *)(a5 + 8 * (v7 + 1771230042));
  LODWORD(STACK[0x5D0]) = v7 - 553187814;
  LODWORD(STACK[0x5E0]) = 0;
  LODWORD(STACK[0x5E4]) = v7 - 553187853;
  LODWORD(STACK[0x5E8]) = (v7 - 553187814) ^ 0x3C;
  v9[14] = v12;
  v9[17] = 2870831888;
  *(_DWORD *)(v10 - 192) = 1431737413 * (((~(v10 - 200) & 0x90E6B23E) - (~(v10 - 200) | 0x90E6B23F)) ^ 0x2EB82D2D)
                         + 40706419
                         + v7;
  *(_QWORD *)(a7 + 448) = &STACK[0x5C8];
  sub_22D219DEC(v10 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v10 - 188)] - 4))();
}

uint64_t sub_22D201010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;

  if (v5 >= v6)
    v9 = dword_255D66728 + 1;
  else
    v9 = 1416753466;
  dword_255D66728 = v9;
  v10 = v4 ^ (v4 >> 11);
  v11 = (((v10 << 7) ^ 0xAA6CB700) - 148527084 + (~(2 * ((v10 << 7) ^ 0xAA6CB700)) | 0x11B4AFFF)) & 0x9D2C5680 ^ 0x82C4200;
  v12 = (((2 * v11) & 0x2008500) - v11 + 2118097939) ^ 0xE4F7DC53;
  v13 = (((2 * v12) & 0x83C3AA00) - v12 + 1042164473) ^ v10;
  v14 = (((v13 << 15) ^ 0x78EB8000) - ((2 * ((v13 << 15) ^ 0x78EB8000)) & 0x95B10000) + 1255733357) & 0xEFC60000 ^ 0x42830A04;
  v15 = (-612864511 - (v14 | 0xDB786E01) + (v14 | 0x248791FE)) ^ v13;
  *(_BYTE *)(v7 + (v8 - 1710812756)) = ((v15 ^ (v15 >> 18) ^ 0xBE)
                                                    + 84
                                                    - ((2 * (v15 ^ (v15 >> 18) ^ 0xBE)) & 0x76)
                                                    - 25) ^ 0x5F;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4
                                                                        + 8
                                                                        * ((750
                                                                          * (v8
                                                                           - (((v15 ^ (v15 >> 18) ^ 0xBE)
                                                                                              + 84
                                                                                              - ((2
                                                                                                * (v15 ^ (v15 >> 18) ^ 0xBE)) & 0x76)
                                                                                              - 25) != 0x5F) == 1710812755)) ^ 0x1FC))
                                                            - 12))(440457599, 1771229876, 2523737419);
}

uint64_t sub_22D20117C(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v2 + 543) ^ (86 * (a1 == 0))))
                            - ((2 * ((v2 + 543) ^ 0x3DCu)) ^ ((v2 - 1) - 244))))();
}

uint64_t sub_22D2011BC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t (*v5)(void);

  v4 = v0 + 597;
  v5 = (uint64_t (*)(void))(*(_QWORD *)(v1
                                     + 8
                                     * ((255
                                       * ((((*(_DWORD *)(v2 + 16) - 860773958) < 0xFFFFFFF9) ^ (v0 + v0 + 85)) & 1)) ^ v0))
                         - 12);
  LODWORD(STACK[0xE34]) = v4;
  *(_QWORD *)(v3 + 2256) = 539291474;
  return v5();
}

void sub_22D201218()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  char v8;

  v2 = v1[81];
  v1[82] = v2;
  v3 = v1[80];
  v1[83] = v3;
  v1[84] = v1[79];
  v4 = STACK[0x7DC];
  LODWORD(STACK[0x810]) = STACK[0x7DC];
  LOBYTE(v2) = *(_BYTE *)(v2 + *(_QWORD *)(v0 + 169) - 0x69F2CF8653C517DALL);
  v5 = v3 + STACK[0x1850] - 0x2F165BB77C7BBE97;
  v6 = -711945521 * (((v4 - 345) ^ 0x7FFFFFFB) & (*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ v5));
  v7 = -711945521 * (v6 ^ HIWORD(v6));
  v8 = byte_22D251010[v7 >> 24];
  LODWORD(STACK[0x814]) = v4 - 345;
  LOBYTE(STACK[0x61B]) = v8 ^ v2 ^ byte_22D24C420[v7 >> 24] ^ byte_22D246E20[(v7 >> 24) + 1] ^ v7 ^ (115 * BYTE3(v7));
  v1[21] = v5;
  JUMPOUT(0x22D2128A0);
}

uint64_t sub_22D201320()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  BOOL v7;
  char v8;
  char v9;
  char v10;
  uint64_t (*v11)(void);

  v2 = v1[83] + 1;
  v3 = v1[82] + 1;
  v4 = v1[84];
  v5 = v4 + 1;
  v4 -= 0x59B9B382E198B9B7;
  v6 = v4 < 0x437CFC11;
  v7 = v4 >= *(_QWORD *)(v0 + 129);
  v8 = *(_BYTE *)(v0 + 144);
  v9 = v8 ^ v6;
  v10 = !v7;
  if ((v9 & 1) == 0)
    v8 = v10;
  v11 = (uint64_t (*)(void))(qword_24F86A890[(943 * (v8 & 1)) ^ LODWORD(STACK[0x810])] - 12);
  LODWORD(STACK[0x7DC]) = STACK[0x810];
  v1[79] = v5;
  v1[80] = v2;
  v1[81] = v3;
  return v11();
}

uint64_t sub_22D2013B8()
{
  int v0;
  int v1;
  _DWORD *v2;
  uint64_t v3;
  int v4;
  int v5;

  *v2 = v2[623];
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((v0 + 51) ^ (1941 * (v5 - 1 == v4))))
                            - ((v1 + ((v0 - 1090536316) & 0xD76D6DCB) + 446) ^ 0x1B9)))();
}

uint64_t sub_22D201418()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;

  v5 = 4 * (v2 - 311684335);
  v6 = *(_DWORD *)(v0 + 4 * (v2 - 311684336));
  v7 = (*(_DWORD *)(v0 + v5) ^ 0x54BCD075 ^ (1566083941 * (v6 ^ 0xF5533C8 ^ (v6 >> 30))
                                           - ((-1162799414 * (v6 ^ 0xF5533C8 ^ (v6 >> 30))) & 0xB7D3C77A)
                                           + 1542054845))
     - v2;
  *(_DWORD *)(v0 + v5) = v7 - ((2 * v7 + 86497758) & 0x1EAA6790) + 568926391;
  STACK[0x5C8] = *(_QWORD *)(v1 + 8 * ((v3 - 1359009162) ^ 0x456C5762));
  STACK[0x5D8] = 1523834394;
  LODWORD(STACK[0x5D0]) = 1;
  LODWORD(STACK[0x5E0]) = v3 - 1359009122;
  LODWORD(STACK[0x5E4]) = v3 - 1359009162;
  LODWORD(STACK[0x5E8]) = (v3 - 1359009162) ^ 0x18;
  STACK[0x5F0] = (v2 + 1212150060);
  *(_DWORD *)(v4 - 192) = 1431737413 * ((~((v4 - 200) | 0xA015FCAE) + ((v4 - 200) & 0xA015FCAE)) ^ 0xE1B49C43)
                        + 40706419
                        + v3;
  STACK[0x23F8] = (unint64_t)&STACK[0x5C8];
  sub_22D219DEC(v4 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v4 - 188)] - 12))();
}

uint64_t sub_22D20159C()
{
  uint64_t v0;
  unsigned int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((306 * (v1 < 0x5AD3DE1A)) ^ 0x2FB)) - 4))();
}

uint64_t sub_22D2015E8()
{
  uint64_t v0;
  unsigned int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((306 * (v1 > 0x5AD3E089)) ^ 0x2FB)) - 4))();
}

uint64_t sub_22D201660()
{
  int v0;
  int v1;
  int v2;
  int8x16_t v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int32x4_t v9;
  int32x4_t v10;
  int8x16_t v11;

  v2 = v0 - v1 - 446;
  LODWORD(xmmword_255D65D28) = -1890241592;
  free((void *)STACK[0x2A0]);
  v3 = (int8x16_t)vld1q_dup_f32((const float *)&xmmword_255D65D28);
  v4.i64[0] = 0x8000000080000000;
  v4.i64[1] = 0x8000000080000000;
  v5.i64[0] = *(_QWORD *)((char *)&xmmword_255D65D28 + 4);
  v5.i32[2] = HIDWORD(xmmword_255D65D28);
  v6 = vextq_s8(v3, v5, 0xCuLL);
  v7 = v5;
  v7.i32[3] = dword_255D65D38;
  v8 = (int8x16_t)vaddq_s32((int32x4_t)vandq_s8(v6, v4), vdupq_n_s32(0x95715F32));
  v9 = (int32x4_t)veorq_s8(vandq_s8(v7, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x2FD123EBu));
  v10 = (int32x4_t)veorq_s8((int8x16_t)vaddq_s32(vsubq_s32(v9, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v9, v9), (int8x16_t)vdupq_n_s32(0xA1E076CE))), vdupq_n_s32(0xD0F03B67)), (int8x16_t)vdupq_n_s32(0xF0742B44));
  v11.i32[0] = *((_DWORD *)&STACK[0x19A0] + (DWORD1(xmmword_255D65D28) & ((v2 + 1771230347) ^ 0x1D7)));
  v11.i32[1] = *((_DWORD *)&STACK[0x19A0] + (BYTE8(xmmword_255D65D28) & 1));
  v11.i32[2] = *((_DWORD *)&STACK[0x19A0] + (BYTE12(xmmword_255D65D28) & 1));
  v11.i32[3] = *((_DWORD *)&STACK[0x19A0] + (dword_255D65D38 & 1));
  xmmword_255D65D28 = (__int128)veorq_s8(veorq_s8(veorq_s8((int8x16_t)xmmword_255D6635C, v11), (int8x16_t)vdupq_n_s32(0x37D58494u)), (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8((int8x16_t)v10, vbicq_s8(v4, v8)), (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v10, v10), (int8x16_t)vdupq_n_s32(0x66C9D3B4u))), vdupq_n_s32(0xB364E9DA)), 1uLL));
  return ((uint64_t (*)(void))(qword_24F86A890[v2 + 1771230250] - 4))();
}

uint64_t sub_22D2016CC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  CFRange v6;

  v3 = (_QWORD *)(*(_QWORD *)(v2 + 4064) + *(_QWORD *)(v2 + 4056) - 0x7FDCEBE57FFF7AEALL);
  v6.length = (v1 ^ 0x7ED93DF71E78FFBDLL) + ((2 * v1) & 0x3CF1FF7A) - 0x7ED93DF71E78FFBDLL;
  *v3 = 0;
  v3[1] = v6.length;
  v6.location = 0;
  CFDataGetBytes((CFDataRef)STACK[0x1820], v6, *(UInt8 **)(v2 + 3952));
  v4 = sub_22D22F638(v1, 0x32u, 1083624239);
  *(_QWORD *)(v2 + 3456) = v4;
  return ((uint64_t (*)(void))qword_24F86A890[((v4 != 0) * (((v0 - 408) ^ 0x146) + 1042)) ^ v0])();
}

uint64_t sub_22D201790(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t (*v8)(void);

  v7 = (v4 ^ 0x7C7BFFB0FDF6FB7ALL) + (v3 & 0x1FBEDF6F4) - 0x7C7BFFB0AF3B18A2;
  *(_QWORD *)(v5 + 233) = v7;
  *(_BYTE *)(v5 + 248) = v7 < 0x4EBBE2D8;
  v8 = *(uint64_t (**)(void))(a2 + 8 * (((v7 == 1320936152) * (((2 * v2) ^ 0x2D6) + 136)) ^ v2));
  LODWORD(STACK[0xEEC]) = v2;
  v6[305] = 0x36556CFE40E3181DLL;
  v6[306] = 0x649B171018CD6AF8;
  v6[307] = 0x5037319D33D54494;
  return v8();
}

uint64_t sub_22D201848@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  uint64_t v3;
  int v4;
  unsigned int v5;

  v4 = (v2 + 202) | 0xA2;
  LODWORD(STACK[0x32C]) = a2;
  v5 = v4 ^ LODWORD(STACK[0x14D4]) ^ 0xFFFFC2C6;
  STACK[0x210] = *(_QWORD *)(v3 + 3456);
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (((((unsigned __int16)v5 ^ 0xCC64u) < 2) * (((v4 - 286) | 0x420) ^ 0x6B8)) | v4))
                            - ((v4 - 1771230295) ^ 0x966D2D4FLL)))();
}

uint64_t sub_22D20189C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  LODWORD(STACK[0x400]) = 0;
  v11 = LODWORD(STACK[0x400])++;
  dword_255D666E8 = v11 + 266572533;
  v12 = (*(_DWORD *)(v8 + 1832) + 791531550);
  v9[12] = *(_QWORD *)(a5 + 8 * ((v7 + 809493642) ^ 0x28E60F99));
  LODWORD(STACK[0x5D0]) = v7 + 809493642;
  LODWORD(STACK[0x5E0]) = 0;
  LODWORD(STACK[0x5E4]) = (v7 + 809493642) ^ 0x2E;
  LODWORD(STACK[0x5E8]) = v7 + 809493677;
  v9[14] = v12;
  v9[17] = 2208285016;
  *(_DWORD *)(v10 - 192) = 1431737413 * ((v10 - 200) ^ 0xBE5E9F12) + 40706419 + v7 - 1647902055;
  *(_QWORD *)(a7 + 448) = &STACK[0x5C8];
  sub_22D219DEC(v10 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v10 - 188)] - 12))();
}

void sub_22D20385C()
{
  JUMPOUT(0x22D203864);
}

uint64_t sub_22D203994()
{
  unsigned int v0;
  uint64_t v1;
  void *v2;

  v2 = NAAP();
  *(_QWORD *)(v1 + 3472) = v2;
  return ((uint64_t (*)(void))qword_24F86A890[((v2 == 0) * ((v0 + 1327426608) & 0x10E111A8 ^ 0x1A7)) ^ v0])();
}

uint64_t sub_22D2039E8(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  LODWORD(STACK[0x2370]) = -1084420351;
  STACK[0x2368] = 0;
  v4 = 591644117 * ((v3 - 200) ^ 0xE41B20C99B054A47);
  STACK[0x23F8] = *(_QWORD *)(a2 + 8 * (v2 ^ 0x1E9)) - v4;
  *(_DWORD *)(v3 - 176) = 1601233026 - v4 + (v2 ^ 0x1E9) - 26;
  STACK[0x2408] = (unint64_t)&STACK[0x6618A9C996C09729];
  v5 = sub_22D227BBC(v3 - 200);
  return ((uint64_t (*)(uint64_t))(qword_24F86A890[v2 ^ 0x1E9 ^ ((v2 ^ 0x1E9) + 99) ^ 0x20F ^ ((*(_DWORD *)(v3 - 192) == 0) * ((v2 ^ 0x1E9) + 1675))]
                                          - 12))(v5);
}

uint64_t sub_22D203A0C(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(a2
                              + 8
                              * ((2000
                                * (*(unsigned __int8 *)(*(_QWORD *)(v4 + 3472) + v3) != (((v2 - 71) | 0x20) + 8))) ^ v2)))();
}

uint64_t sub_22D203A54()
{
  int v0;
  int v1;
  uint64_t v2;
  size_t v3;
  unint64_t v4;
  unint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;

  v3 = strlen(*(const char **)(v2 + 3472));
  v4 = (v3 ^ 0x7FBED6FFF97FDEF9)
     - 0x7FBED6FFBA785FFALL
     + (((v0 - 1274591797) & 0x4BF8B9CD ^ 0xFF7DADFFF2FFBD33) & (2 * v3));
  v5 = ((v1 - 1437418227) ^ 0xA7A755E6FE73FF7ELL)
     + 0x5858AA1940937F81
     + (((uint64_t)(v1 - 1437418227) << (v0 - 39)) & 0x4F4EABCDFCE7FEFCLL);
  v6 = v4 < 0x3F077EFF;
  v7 = v4 > v5;
  if (v6 != v5 < 0x3F077EFF)
    v7 = v6;
  return ((uint64_t (*)(void))(qword_24F86A890[(1353 * v7) ^ v0] - 8))();
}

uint64_t sub_22D203B74()
{
  int v0;
  uint64_t v1;
  int v2;
  unsigned int v3;
  unint64_t v4;

  v2 = strlen(*(const char **)(v1 + 3472));
  STACK[0x16A8] = (unint64_t)&STACK[0x2368];
  STACK[0x16B0] = (unint64_t)&STACK[0x2370];
  v3 = (((2 * v2) & 0xFEB7FFFE)
      + (v2 ^ 0xFF5BFFFF)
      - (((((v0 - 104) | 1) ^ 0x14800C3) + 2 * (((2 * v2) & 0xFEB7FFFE) + (v2 ^ 0xFF5BFFFF))) & 0x3FBB264C)
      - 1602120921) >> 1;
  LODWORD(STACK[0x16BC]) = v3 ^ 0xF0B3C692;
  v4 = sub_22D22F638(v3 ^ 0x4FEEC993, 0x32u, 1643813027);
  STACK[0x16C0] = v4;
  return ((uint64_t (*)(void))(qword_24F86A890[(1003 * (v4 != 0)) ^ v0] - 8))();
}

uint64_t sub_22D203C44()
{
  int v0;
  int v1;
  int v2;

  v2 = v0 + v1 + 229;
  free((void *)STACK[0x340]);
  return ((uint64_t (*)(void))(qword_24F86A890[(310 * (LODWORD(STACK[0x2B8]) == ((v2 + 45) | 0x40) - 337)) ^ v2] - 12))();
}

uint64_t sub_22D203C60()
{
  int v0;
  uint64_t (*v1)(void);

  v0 = STACK[0xB98];
  v1 = (uint64_t (*)(void))(qword_24F86A890[(597 * (LODWORD(STACK[0xB98]) == 1518003525)) ^ LODWORD(STACK[0x824])] - 12);
  LODWORD(STACK[0xB90]) = STACK[0x828];
  LODWORD(STACK[0xB94]) = v0 + 1;
  return v1();
}

uint64_t sub_22D203CB8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X4>, int a3@<W8>)
{
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v7 = LODWORD(STACK[0x318])++;
  dword_255D666E8 = v7 + 266572533;
  v8 = (*(_DWORD *)(v3 + 1832) + 1397215863);
  v5[12] = *(_QWORD *)(a1 + 8 * (a3 + 1771230042));
  LODWORD(STACK[0x5D0]) = a3 + 1102782159;
  LODWORD(STACK[0x5E0]) = 0;
  LODWORD(STACK[0x5E4]) = (a3 + 1102782159) ^ 0x6F;
  LODWORD(STACK[0x5E8]) = a3 + 1102782355;
  v5[14] = v8;
  v5[17] = 2813969329;
  *(_DWORD *)(v6 - 192) = 1431737413 * ((v6 - 200 + v4 - 2 * ((v6 - 200) & v4)) ^ 0x5C4CCDE0) + 40706419 + a3;
  *(_QWORD *)(a2 + 448) = &STACK[0x5C8];
  sub_22D219DEC(v6 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v6 - 188)] - 8))();
}

uint64_t sub_22D203D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;

  v8 = STACK[0x2A0];
  if (v6 >= 0xA7B9C3B1)
    v9 = *(_DWORD *)(v7 + 1832) + 1;
  else
    v9 = 1416753466;
  *(_DWORD *)(v7 + 1832) = v9;
  v10 = v5 ^ (v5 >> 11);
  v11 = (((v10 << 7) ^ 0xAA6CB700) - ((2 * ((v10 << 7) ^ 0xAA6CB700)) & 0x47863100) - 1547495182) & 0x9D2C5680 ^ 0x8040000;
  v12 = (((((2 * v11) | 0xE7EABC7C) - v11 - 1945460286) & 0x82A8A2F8 ^ 0x80082020)
       + ((((2 * v11) | 0xE7EABC7C) - v11 - 1945460286) ^ 0x72E7DED9)
       - (((((2 * v11) | 0xE7EABC7C) - v11 - 1945460286) ^ 0x72E7DED9) & 0x82A8A2F8)) ^ v10;
  v13 = ((v12 << 15) ^ 0x75F88000) - ((2 * ((v12 << 15) ^ 0x75F88000)) & 0x8DBC0000) - 958507593;
  v14 = ((v13 & 0x6CC60000 ^ 0xC7A60000) - (v13 & 0x83000000)) & 0xEFC60000 ^ v12;
  *(_BYTE *)(STACK[0x18B8] + (v8 - 1541504513)) = ((v14 ^ (v14 >> 18) ^ 0xDB)
                                                               - ((2 * (v14 ^ (v14 >> 18) ^ 0xDB)) & 0x10)
                                                               + 8) ^ 0xB4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5
                                                                        + 8
                                                                        * ((1983
                                                                          * (v8
                                                                           - (((v14 ^ (v14 >> 18) ^ 0xDB)
                                                                                              - ((2
                                                                                                * (v14 ^ (v14 >> 18) ^ 0xDB)) & 0x10)
                                                                                              + 8) != 0xB4) == 1541504512)) ^ 0x3ED))
                                                            - 8))(1970934202, 1541504512, 1390412915);
}

uint64_t sub_22D203F3C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v0 + 136) = *(_QWORD *)(v5 + 3344);
  CFRelease(*(CFTypeRef *)(v4 + 153));
  CFRelease(*(CFTypeRef *)(v5 + 3784));
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(v1 ^ 0xFFFF5139 ^ (803 * (((v3 - v1) | (v1 - v3)) >= 0)))))();
}

void sub_22D203F98()
{
  JUMPOUT(0x22D203FA4);
}

void sub_22D204034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  int v7;
  char v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;

  v6 = v5[246];
  v5[247] = v6;
  v7 = STACK[0xD14];
  LODWORD(STACK[0xD2C]) = STACK[0xD14];
  v6 -= 995648879;
  v8 = byte_22D24C946[v6];
  LODWORD(STACK[0xD30]) = v7 ^ 0x273;
  v9 = v5[461] + v6;
  v10 = -711945521
      * (((v7 ^ 0x273) + 2147482990) & (*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ v9));
  v11 = -711945521 * (v10 ^ HIWORD(v10));
  LOBYTE(STACK[0x61B]) = byte_22D251010[v11 >> 24] ^ (v8 - 53) ^ byte_22D24C420[v11 >> 24] ^ byte_22D246E20[(v11 >> 24) + 1] ^ v11 ^ (115 * BYTE3(v11));
  v5[20] = *(_QWORD *)(a5 + 8 * (v7 + 1142));
  v5[21] = v9;
  JUMPOUT(0x22D2128A4);
}

uint64_t sub_22D204118()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  LODWORD(STACK[0x30C]) = -1084420343;
  v3 = malloc_type_malloc(8uLL, 0xD29E14C9uLL);
  v4 = *(_QWORD *)(v2 + 8 * ((38 * (v3 == 0)) ^ v1));
  *(_QWORD *)(v0 + 3480) = v3;
  return ((uint64_t (*)(void))(v4 - ((v1 - 70) + ((v1 - 145) ^ 0xFFFFFFFFFFFFFE39))))();
}

uint64_t sub_22D204174()
{
  int v0;
  uint64_t v1;
  _BYTE *v2;
  unint64_t v3;
  uint64_t (*v4)(void);

  v2 = (_BYTE *)STACK[0x1300];
  *v2 = (HIBYTE(STACK[0x450]) - ((STACK[0x450] >> 55) & 0xC8) + 100) ^ ((v0 ^ 0xD5) + 59);
  v2[1] = (HIWORD(STACK[0x450]) - ((STACK[0x450] >> 47) & 0x50) - 88) ^ 0xA8;
  v2[2] = (((unsigned __int16)WORD2(STACK[0x450]) >> 8) - ((STACK[0x450] >> 39) & 0xE) + 7) ^ 7;
  v2[3] = (HIDWORD(STACK[0x450]) - ((STACK[0x450] >> 31) & 0xA2) + 81) ^ 0x51;
  v2[4] = (((HIBYTE(LODWORD(STACK[0x450])) - ((LODWORD(STACK[0x450]) >> 23) & 0xEC) - 74) ^ 0x29) - 64) ^ 0x5F;
  v2[5] = (HIWORD(LODWORD(STACK[0x450])) - ((LODWORD(STACK[0x450]) >> 15) & 0xE0) - 16) ^ 0xF0;
  v2[6] = (BYTE1(LODWORD(STACK[0x450])) - ((LODWORD(STACK[0x450]) >> 7) & 0xC6) - 29) ^ 0xE3;
  v2[7] = (LOBYTE(STACK[0x450]) - ((2 * LOBYTE(STACK[0x450])) & 0x42) - 95) ^ 0xA1;
  v3 = sub_22D22F638(8, 0x32u, -1520204294);
  STACK[0x1720] = v3;
  v4 = *(uint64_t (**)(void))(v1 + 8 * ((391 * (v3 != 0)) ^ v0));
  LODWORD(STACK[0x71C]) = (v0 ^ 0xD5) - 33;
  STACK[0x720] = 0x7E82A67FC906F95BLL;
  STACK[0x728] = 0x3CE2EE6166B34839;
  STACK[0x730] = 0x471A5DFBE961F289;
  return v4();
}

uint64_t sub_22D204344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  LODWORD(STACK[0x45C]) = v4;
  v7 = *(_QWORD *)(v6 + 3480);
  STACK[0x220] = STACK[0x1720];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4
                                                              + 8
                                                              * ((1769
                                                                * (((v5 - 1217430202) & 0xDEFDAFDB ^ 0xF395C11C)
                                                                 + ((v5 + 2138880981) & 0x808345FD) != 1710812763)) ^ (v5 + 608))))(v7, 1771229876, 2523737419);
}

uint64_t sub_22D204390()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int v12;

  v9 = 4 * (v3 - 311684335);
  v10 = *(_DWORD *)(v0 + 4 * (v3 - 311684336)) ^ 0xF5533C8 ^ (*(_DWORD *)(v0
                                                                                        + 4
                                                                                        * (v3 - 311684336)) >> 30);
  v11 = (*(_DWORD *)(v0 + v9) ^ 0x90ACDD9F ^ (1664525 * v10 - ((3329050 * v10) & 0x3FF3DCAE) - 1611010473))
      + (*(_DWORD *)(STACK[0x2A8] + 4 * (v5 - 1617445560)) ^ 0xF5533C8);
  v12 = (v11 ^ 0x7EFDE94B) + v5 + ((2 * v11) & 0xFDFBD296);
  *(_DWORD *)(v0 + v9) = v12 - ((2 * v12 + 20162554) & 0x1EAA6790) + 804194245;
  STACK[0x5C8] = *(_QWORD *)(v1 + 8 * ((v4 + 851154110) ^ 0x1FFFFFFFC928C2AALL));
  LODWORD(STACK[0x5E0]) = v4 + 851154113;
  LODWORD(STACK[0x5E4]) = v4 + 851154110;
  LODWORD(STACK[0x5E8]) = v4 + 851154172;
  *(_DWORD *)(v8 - 192) = 1431737413 * (v6 ^ 0xBE5E9F12) + 40706419 + v4;
  LODWORD(STACK[0x5D0]) = v2;
  STACK[0x5D8] = 3356260830;
  STACK[0x5F0] = (v3 - 1250390800);
  STACK[0x23F8] = v7;
  sub_22D219DEC(v8 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v8 - 188)] - 4))();
}

uint64_t sub_22D204528()
{
  uint64_t v0;
  unsigned int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((116 * (v1 < v2 + v3 - 938706465)) ^ (v2 + v3 + 773))) - 8))();
}

uint64_t sub_22D204564()
{
  uint64_t v0;
  unsigned int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((((v2 + v3 + 773) ^ 0x370) * (v1 > 0xC80C7C4D)) ^ (v2 + v3 + 773)))
                            - 8))();
}

uint64_t sub_22D2045A4()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  int v7;

  v7 = (v0 - 1807414779) | 0x2282042;
  LODWORD(xmmword_255D65D28) = dword_255D666E4;
  STACK[0x5C8] = *(_QWORD *)(v1 + 8 * ((v7 + 1305126362) ^ 0x1FFFFFFFE437D386));
  STACK[0x5D8] = 2368644389;
  LODWORD(STACK[0x5D0]) = v2;
  LODWORD(STACK[0x5E0]) = (v7 + 1305126362) ^ 0x2C;
  LODWORD(STACK[0x5E4]) = v7 + 1305126362;
  LODWORD(STACK[0x5E8]) = v7 + 1305126389;
  STACK[0x5F0] = (v3 + 751198830);
  STACK[0x23F8] = v5;
  *(_DWORD *)(v6 - 192) = 1431737413 * (((v4 | 0xF19A01E8) - (v4 & 0xF19A01E8)) ^ 0x4FC49EFA) + 40706419 + v7;
  sub_22D219DEC(v6 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v6 - 188)] - 8))();
}

uint64_t sub_22D2046B0()
{
  uint64_t v0;
  unsigned int v1;
  int v2;

  v2 = v1 < (STACK[0x290] & 0xCC2627DE) - 1926323241;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (((32 * v2) | (v2 << 6)) ^ 0x12E)) - 12))();
}

uint64_t sub_22D204724()
{
  uint64_t v0;
  unsigned int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((96 * (v1 > 0x8D2EA528)) ^ 0x12E)) - 12))();
}

uint64_t sub_22D204794()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;

  v4 = (v0 - 156) | 0x109;
  *(_DWORD *)(STACK[0x2A8] + 4 * (v2 - 1617446002 + v4)) ^= 0x78E34143 ^ *(_DWORD *)(STACK[0x2A0] + 4 * (v2 - 1617446002 + v4));
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((661 * (v3 + v4 - 444 == 1741016231)) ^ v4)) - 4))();
}

uint64_t sub_22D204828()
{
  return sub_22D204390();
}

uint64_t sub_22D204840()
{
  uint64_t v0;

  return ((uint64_t (*)(void))qword_24F86A890[(596 * (*(_QWORD *)(v0 + 3328) + 1 != STACK[0x18B0])) ^ LODWORD(STACK[0x834])])();
}

uint64_t sub_22D204888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  _DWORD *v5;
  signed int v6;
  unint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD **)(a3 + 16);
  **(_QWORD **)(a3 + 8) = *(_QWORD *)(a3 + 32);
  *v5 = STACK[0x16BC];
  v6 = ((v3 ^ 0x5B) + 114781367) & 0xF92892E1;
  LODWORD(STACK[0x2360]) = -1999002479;
  v7 = 591644117 * ((v4 - 200) ^ 0xE41B20C99B054A47);
  STACK[0x23F8] = *(_QWORD *)(a2 + 8 * v6) - v7;
  *(_DWORD *)(v4 - 176) = 1601233026 - v7 + v6 - 26;
  STACK[0x2408] = (unint64_t)&STACK[0x6618A9C996C09729];
  v8 = sub_22D227BBC(v4 - 200);
  return ((uint64_t (*)(uint64_t))(qword_24F86A890[v6 ^ (v6 + 99) ^ 0x20F ^ ((*(_DWORD *)(v4 - 192) == 0)
                                                                                    * (v6 + 1675))]
                                          - 12))(v8);
}

uint64_t sub_22D2048A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;

  return (*(uint64_t (**)(void))(a5
                              + 8
                              * (int)(((((4 * (v5 ^ 0x966D2D7F) + 1492244967) & 0xA70E27EF) - 668)
                                     * (**(_QWORD **)(v6 + 81) != 0)) | (4 * (v5 ^ 0x966D2D7F)))))();
}

uint64_t sub_22D20490C@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  int v2;
  int v3;

  STACK[0x3C0] = STACK[0x1868];
  return (*(uint64_t (**)(void))(a1 + 8 * (((v2 + (a2 ^ 0x3F6) + 1771229610) * v3) ^ a2)))();
}

void sub_22D204954(char a1@<W8>)
{
  char v1;
  char v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  char v6;
  char v7;
  unsigned int v8;
  unint64_t v9;

  v4 = STACK[0x83C];
  LODWORD(STACK[0x840]) = STACK[0x83C];
  LODWORD(STACK[0x844]) = v4 + 364;
  v5 = (v4 + 34408268) | 0x94602502;
  LODWORD(STACK[0x848]) = v5;
  v6 = (v1 + 21) | (16 * a1 + 103) ^ 0x87;
  v7 = v6 - ((v5 ^ (v2 + 54)) & (2 * v6)) - 27;
  v8 = -711945521
     * (((*(_DWORD *)(v3 + 3960) + LODWORD(STACK[0x18A0]) - 937481911) ^ *(_DWORD *)(qword_255D671B8
                                                                                   + (dword_255D671C4 & 0x58B8A3F0))) & 0x7FFFFFFF);
  v9 = -711945521 * (v8 ^ HIWORD(v8));
  LOBYTE(STACK[0x61B]) = v7 ^ byte_22D251010[v9 >> 24] ^ byte_22D24C420[v9 >> 24] ^ byte_22D246E20[(v9 >> 24) + 1] ^ v9 ^ (115 * BYTE3(v9)) ^ 0xE5;
  JUMPOUT(0x22D204A6CLL);
}

uint64_t sub_22D204A78()
{
  return ((uint64_t (*)(void))qword_24F86A890[(290 * (LODWORD(STACK[0x18A0]) != LODWORD(STACK[0x13CC]))) ^ LODWORD(STACK[0x840])])();
}

void sub_22D204AC4()
{
  JUMPOUT(0x22D204ACCLL);
}

uint64_t sub_22D204B2C(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * ((50
                                          * ((*(char *)(*(_QWORD *)(v5 + 3320)
                                                                    + ((v2
                                                                      + (v3 ^ 0x7DA)
                                                                      - v4
                                                                      - 844
                                                                      - ((4 * LODWORD(STACK[0x18A0]) + 545039652) & 0x26247C94)
                                                                      + 216228754) ^ 0x13123E4Bu))
                                                          - 48) > 9)) ^ v3))
                            - 8))();
}

void sub_22D204BC8()
{
  JUMPOUT(0x22D204BD8);
}

uint64_t sub_22D204C58@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v7;
  uint64_t (*v8)(void);

  v5 = (v4 + 2104342708) & 0xEC251AFD;
  v7 = a2 + 1523331422 > (int)(v5 - 254) || v2 - 2071363375 >= 0;
  v8 = *(uint64_t (**)(void))(a1 + 8 * (((8 * v7) | (16 * v7)) ^ (v3 + v4 + 783)));
  LODWORD(STACK[0x83C]) = v5;
  return v8();
}

uint64_t sub_22D204D90()
{
  int v0;
  uint64_t v1;
  _BOOL4 v2;

  sub_22D22F914(*(_QWORD *)(v1 + 3960));
  LODWORD(STACK[0x42C]) = -45002;
  v2 = ((unsigned __int16)(((((v0 - 11595) | 0x140) + 8140) | 0x9A52) + 29165) ^ 0x2D4Au) >= ((unsigned __int16)(LOWORD(STACK[0x1258]) - (((LOWORD(STACK[0x1258]) << ((v0 - 75) ^ 1)) + 2050) & 0x9876) + 20540) ^ 0x4C3Au);
  return ((uint64_t (*)(_QWORD))qword_24F86A890[(2 * v2) | (4 * v2) | (v0 + 1771229877) | 0x140])(0);
}

uint64_t sub_22D204E10@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8 * (((v3 + ((96 * v2) ^ (v4 + 448)) + 422) * (a2 == v5 + 39)) | (96 * v2)))
                            - 8))();
}

uint64_t sub_22D204E4C()
{
  int v0;
  uint64_t v1;
  unint64_t v2;

  v2 = sub_22D22F638(20, 0x32u, -608920269);
  *(_QWORD *)(v1 + 4128) = v2;
  return ((uint64_t (*)(void))(qword_24F86A890[(1776 * (((v2 == 0) ^ (v0 + 27)) & 1)) ^ v0] - 8))();
}

uint64_t sub_22D204EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  _QWORD *v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  STACK[0x1718] = (unint64_t)&STACK[0x2290];
  LODWORD(STACK[0xB90]) = v5 & 0xBFFD3FEF;
  LODWORD(STACK[0xB94]) = 1518003506;
  v7 = STACK[0xB94];
  LODWORD(STACK[0xB98]) = STACK[0xB94];
  v8 = STACK[0xB90];
  LODWORD(STACK[0xB9C]) = LODWORD(STACK[0xB90]) ^ 0x966D2D64;
  LODWORD(STACK[0xBA0]) = 77 * (v8 ^ 0x966D2D4C);
  LODWORD(STACK[0xBA4]) = v8 + 1771230723;
  v9 = *(_QWORD *)STACK[0x1718];
  v10 = 2 * v7 + 1258960284;
  LODWORD(STACK[0xBA8]) = v10;
  v11 = v10 ^ 0x7F7A7DFE;
  v10 *= 2;
  LODWORD(STACK[0xBAC]) = v10;
  v12 = v9 + (int)(v11 - 2138734078 + (v10 & 0xFEF4FBFC));
  v6[201] = v12;
  v6[64] = v12;
  v6[62] = *(_QWORD *)(a5 + 8 * (int)(v8 ^ 0x966D29BA)) - 4;
  v13 = ((v6[64] - qword_255D671D0) & 0xFFFFFFFFFFFFFFF0) + qword_255D671C8;
  v14 = (*(uint64_t (**)(_QWORD, unint64_t *, uint64_t))(qword_255D671E8
                                                                       + 32 * *(unsigned __int8 *)(v13 + 8)
                                                                       + 8))(*(_QWORD *)v13, &STACK[0x7A3], 1);
  LOBYTE(STACK[0x767]) = STACK[0x7A3];
  return ((uint64_t (*)(uint64_t))v6[62])(v14);
}

uint64_t sub_22D2050B8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v1[97];
  v3 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x4D48DDF4)) ^ LODWORD(STACK[0x888])) & 0x7FFFFFFF);
  v4 = -711945521 * (v3 ^ HIWORD(v3));
  *(_BYTE *)(v1[464] + (LODWORD(STACK[0x884]) ^ 0xF59DD2855D6C6BB8) + v2) = byte_22D250BE0[v4 >> 24] ^ LOBYTE(STACK[0x767]) ^ byte_22D248860[v4 >> 24] ^ byte_22D24BB00[v4 >> 24] ^ v4 ^ (-97 * BYTE3(v4));
  v5 = v1[98];
  v6 = (unint64_t)(v5 - 0x3B192AC4C9FB6EB1) < *(_QWORD *)(v0 + 368);
  if (((*(_BYTE *)(v0 + 383) ^ ((unint64_t)(v5 - 0x3B192AC4C9FB6EB1) < 0xDE8E23C1)) & 1) != 0)
    v6 = *(_BYTE *)(v0 + 383);
  v7 = qword_24F86A890[(45 * (v6 & 1)) ^ LODWORD(STACK[0x880])];
  v8 = v1[96] + 1;
  LODWORD(STACK[0x84C]) = STACK[0x880];
  v1[93] = v5 + 1;
  v1[94] = v2 + 1;
  v1[95] = v8;
  return ((uint64_t (*)(void))(v7 - 8))();
}

uint64_t sub_22D2051F8()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _BOOL4 v6;

  v5 = (char *)STACK[0x1658];
  *(_DWORD *)v5 = 130;
  v5 += 4;
  *(_QWORD *)(v4 + 3632) = v5;
  sub_22D22F9F8(*(char **)(v3 + 536), v5, 0x400uLL);
  STACK[0x390] = 2052;
  v6 = IOConnectCallStructMethod(v1 - 1438895437, 0x21u, (const void *)STACK[0x1658], 0x804uLL, (void *)STACK[0x1658], &STACK[0x390]) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (int)((v6 * ((v0 - 540248765) ^ 0xDFCC788F)) ^ v0))
                            - ((v0 - 540248765) & 0xE7F3DFE8)
                            + 3351271608))();
}

void sub_22D2052A0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unint64_t v7;

  sub_22D22F9F8(*(char **)(v2 + 3632), *(char **)(v1 + 536), 0x400uLL);
  sub_22D22F9F8((char *)(STACK[0x1658] + 1028), *(char **)(v2 + 3856), 0x400uLL);
  STACK[0x3C0] = STACK[0x1650];
  *(_QWORD *)(v1 + 336) = &STACK[0x22E0];
  LODWORD(STACK[0x22E0]) = -1084421375;
  LODWORD(STACK[0x8DC]) = v0;
  *(_QWORD *)(v2 + 888) = 0x62FA08E04BE252CDLL;
  *(_QWORD *)(v2 + 896) = 0x7C24FD0DFDD35B76;
  *(_QWORD *)(v2 + 904) = 0x6681F001E1D0ABD2;
  v3 = *(_QWORD *)(v2 + 904);
  *(_QWORD *)(v2 + 912) = v3;
  v4 = *(_QWORD *)(v2 + 896);
  *(_QWORD *)(v2 + 920) = v4;
  *(_QWORD *)(v2 + 928) = *(_QWORD *)(v2 + 888);
  v5 = STACK[0x8DC];
  LODWORD(STACK[0x914]) = STACK[0x8DC];
  LODWORD(STACK[0x918]) = v5 ^ 0x175;
  v6 = -711945521
     * ((v5 ^ 0x7FFFFF45) & (*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ (v4
                                                                                            + LODWORD(STACK[0x18C8])
                                                                                            + 36480138)));
  v7 = -711945521 * (v6 ^ HIWORD(v6));
  LOBYTE(STACK[0x61B]) = byte_22D249F90[v7 >> 24] ^ *(_BYTE *)(v3 + STACK[0x18B8] - 0x6681F001E1D0ABD2) ^ byte_22D24A6A0[(v7 >> 24) + 3] ^ byte_22D24B8E0[(v7 >> 24) + 2] ^ v7 ^ (-39 * BYTE3(v7));
  JUMPOUT(0x22D204A68);
}

uint64_t sub_22D205458()
{
  int v0;
  uint64_t v1;
  _BYTE *v2;
  char *v3;
  CFStringEncoding SystemEncoding;
  CFStringRef v5;

  *(_QWORD *)(v1 + 3640) = &STACK[0x2358];
  LODWORD(STACK[0x2330]) = -1999002477;
  LODWORD(STACK[0x2358]) = -1084420351;
  *(_QWORD *)(v1 + 3648) = &STACK[0x2350];
  STACK[0x2350] = 0;
  v3 = off_255D666F0[0];
  v2[681] = *off_255D666F0[0] + ((v0 - 2) & 0xFB ^ 0xE0);
  v2[682] = v3[1] - 85;
  v2[683] = v3[2] - 85;
  v2[684] = v3[3] - 85;
  v2[685] = v3[4] - 85;
  v2[686] = v3[5] - 85;
  v2[687] = v3[6] - 85;
  v2[688] = ((v0 + 40) & 0xBF) + v3[7] + 114;
  v2[689] = v3[8] - 85;
  v2[690] = v3[9] - 85;
  v2[691] = v3[10] - 85;
  v2[692] = v3[11] - 85;
  v2[693] = v3[12] - 85;
  v2[694] = v3[13] - 85;
  v2[695] = v3[14] - 85;
  v2[696] = v3[15] - 85;
  v2[697] = v3[16] - 85;
  v2[698] = v3[17] - 85;
  v2[699] = v3[18] - 85;
  v2[700] = v3[19] - 85;
  v2[701] = v3[20] - 85;
  v2[702] = v3[21] - 85;
  v2[703] = off_255D666F0[0][22] - 85;
  SystemEncoding = CFStringGetSystemEncoding();
  v5 = CFStringCreateWithCString(0, (const char *)&STACK[0x1949], SystemEncoding);
  STACK[0x13B0] = (unint64_t)v5;
  return ((uint64_t (*)(void))(qword_24F86A890[v0 ^ ((v5 != 0) << 7)] - 4))();
}

uint64_t sub_22D205634()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  v2 = MGCopyAnswer();
  STACK[0x1780] = v2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8 * (int)(((v2 == 0) * (((v0 - 546456762) & 0xB6FF6FCB) + 1771229981)) ^ v0))
                            - ((v0 + 846439878) & 0x4D8C58EF ^ 0xEBLL)))();
}

uint64_t sub_22D2056B8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;

  CFRelease(*(CFTypeRef *)(v1 + 3656));
  LODWORD(STACK[0x135C]) = -45000;
  v4 = STACK[0x3C0];
  STACK[0x1360] = STACK[0x3C0];
  STACK[0x1368] = (unint64_t)&STACK[0x19D0] + v4;
  STACK[0x3C0] = v4 + 32;
  LODWORD(STACK[0x461]) = -706826539;
  LOWORD(STACK[0x465]) = -11312;
  LOBYTE(STACK[0x467]) = -47;
  v5 = (char *)&STACK[0x19D0] + v4;
  *((_QWORD *)v5 + 1) = 0;
  STACK[0x1370] = (unint64_t)&STACK[0x19D0] + v4 + 8;
  *((_DWORD *)v5 + 4) = 860773951;
  v6 = *(_QWORD *)(v2 + 8 * (v0 + 1771230044));
  v7 = 591644117
     * ((((v3 - 200) | 0xD7617BA6A4DD07CBLL) - (v3 - 200) + ((v3 - 200) & 0x289E84595B22F830)) ^ 0x337A5B6F3FD84D8CLL);
  *(_DWORD *)(v3 - 176) = -922504226 - v7 + v0;
  STACK[0x2408] = (unint64_t)(v5 + 0x211A3D541E10AFD6);
  STACK[0x23F8] = v6 - v7;
  sub_22D227BBC(v3 - 200);
  return ((uint64_t (*)(_QWORD))(qword_24F86A890[(v0 + 1771230044) ^ 0x1ED ^ ((*(_DWORD *)(v3 - 192) == 1415721421)
                                                                                      * (v0
                                                                                       + 1771230132
                                                                                       + (v0 ^ 0x966D2C08)
                                                                                       + 55))]
                                         - 12))(*(_QWORD *)STACK[0x1370]);
}

uint64_t sub_22D2056C8()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  CFTypeID v6;
  uint64_t v7;
  unint64_t v8;
  CFTypeID TypeID;

  v3 = STACK[0x3C0];
  v4 = (unint64_t)&STACK[0x19D0] + STACK[0x3C0];
  *(_QWORD *)(v2 + 480) = STACK[0x3C0];
  *(_QWORD *)(v2 + 488) = v4;
  STACK[0x3C0] = v3 + 64;
  v5 = 32 * (v4 & ((((v0 + 219) | 0x221) - 33) ^ v0 ^ 0x324) ^ (~(_DWORD)v4 | 0x7FFFFFFFFFFFFFELL))
     - 16 * (v4 & ((((v0 + 219) | 0x221) - 33) ^ v0 ^ 0x324))
     - 0x1E1E1970C2855470;
  *(_QWORD *)(v2 + 496) = (v5 ^ 0x1F1D1B70C2C71A16)
                        + 0x6FAB3E8D9FDE5EBCLL
                        + ((2 * v5) & 0xC1C1C91E7A7142E0 ^ 0xC1C1C91E7A7142C0);
  v6 = CFGetTypeID(*(CFTypeRef *)(v2 + 224));
  v7 = v6 ^ 0x7FDFEAFCADFE71FDLL;
  v8 = (2 * v6) & 0xFFBFD5F95BFCE3FALL;
  TypeID = CFStringGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((490
                                          * (v7
                                           + (TypeID ^ 0x82834167602003ALL)
                                           + v8
                                           - ((2 * TypeID) & 0xEFAF97D313FBFF8ALL) == 0x88081F1324007237)) ^ v0))
                            - 8))();
}

uint64_t sub_22D205814()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  CFIndex Length;
  unint64_t v5;
  void *v6;

  Length = CFStringGetLength(*(CFStringRef *)(v3 + 224));
  v5 = ((Length << (v0 + 22)) & 0xFF7EEBFF0A6F7B7ELL) + (Length ^ 0xFFBF75FF8537BDBFLL);
  STACK[0x1568] = v5;
  v6 = malloc_type_malloc((v0 - 666) + 0x408A007AC840F1 + v5, 0x9EBEB066uLL);
  STACK[0x1570] = (unint64_t)v6;
  *(_QWORD *)(v1 + 8) = v6;
  return (*(uint64_t (**)(void))(v2 + 8 * ((2018 * (v6 == 0)) ^ v0)))();
}

uint64_t sub_22D2058B8()
{
  CFIndex v0;
  int v1;
  uint64_t v2;
  CFStringEncoding SystemEncoding;
  Boolean CString;

  SystemEncoding = CFStringGetSystemEncoding();
  CString = CFStringGetCString((CFStringRef)STACK[0x1780], (char *)STACK[0x1570], v0, SystemEncoding);
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((45
                                          * ((((CString << ((v1 - 14) ^ 0x4A)) & 0xE6)
                                                             + ((v1 - 84) ^ 0x76 ^ CString)) == 115)) ^ v1))
                            - 4))();
}

uint64_t sub_22D205960()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  unint64_t v7;

  v3 = v1 + *(_QWORD *)(v2 + 4096);
  v4 = v3 + 336;
  v5 = v3 + 337;
  if (v4 >= 0)
    v5 = v4;
  v6 = (v5 >> 1) - ((2 * (v5 >> 1)) & 0x97DA5152) + 1273833641;
  LODWORD(STACK[0x564]) = (v0 - 1263359079) & 0x4B4D546D ^ v6 ^ 0xF4B023A4;
  v7 = sub_22D22F638(((v0 + 73932038) | 0x92050C40) ^ v6 ^ 0xDD8005E2, 0x32u, -192082295);
  STACK[0x16F8] = v7;
  return ((uint64_t (*)(void))qword_24F86A890[((v7 == 0) | (8 * (v7 == 0))) ^ v0])();
}

uint64_t sub_22D205A48(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;

  return (*(uint64_t (**)(void))(a2
                              + 8
                              * (v3 + 2 * (((v3 ^ (v4 == (v3 ^ (v2 - 1028) ^ 0x2930224A))) & 1) == 0))))();
}

uint64_t sub_22D205AE0()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  CFTypeID v3;
  uint64_t v4;
  uint64_t v5;
  CFTypeID TypeID;

  v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 224));
  v4 = ((v0 ^ 0x32F) - 0x32078054300D6E9) ^ v3;
  v5 = (2 * (v0 ^ 0x3B9) - 0x640F00A8601ACEELL) & (2 * v3);
  TypeID = CFDataGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((19
                                          * ((TypeID ^ 0x1052404200612E02)
                                           + v4
                                           + v5
                                           - ((2 * TypeID) & 0xDF5B7F7BFF3DA3FALL) == 0xD31C83CBD6057FDLL)) ^ v0))
                            - 12))();
}

uint64_t sub_22D205B94()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  int Length;
  int v4;
  int v5;
  void *v6;

  Length = CFDataGetLength(*(CFDataRef *)(v2 + 224));
  v4 = Length - ((2 * Length) & 0x67C6F84C) - 1276937178;
  v5 = ((v0 ^ 0x1B5) - 1) ^ v4 ^ 0xCBE7277;
  LODWORD(STACK[0x1644]) = v5;
  LODWORD(STACK[0x564]) = v5;
  v6 = malloc_type_malloc(v4 ^ 0xB3E37C26, 0x8DF370BBuLL);
  STACK[0x1648] = (unint64_t)v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((799 * (v6 != 0)) ^ v0)) - 12))();
}

uint64_t sub_22D205C24()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  CFRange v6;

  v3 = (_QWORD *)(STACK[0x1890] + STACK[0x1888] - 0x6EA83C8D9F9C1032);
  v6.length = ((2 * v1) & 0x1FDCAF6DELL) + (v1 ^ 0x6FEFB3F6FEE57B6FLL) + (v0 ^ 0x90104C09011A85C1);
  *v3 = 0;
  v3[1] = v6.length;
  v6.location = 0;
  CFDataGetBytes((CFDataRef)STACK[0x1780], v6, (UInt8 *)STACK[0x1648]);
  v4 = sub_22D22F638(v1, 0x32u, 2114404905);
  STACK[0x1850] = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (int)((13 * (v4 == 0)) ^ v0)) - ((v0 - 332) ^ 8)))();
}

uint64_t sub_22D205D08(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t (*v8)(void);

  v7 = (v4 ^ 0xBBFBF6FD67717FB1) + (v3 & 0xCEE2FF62) + 0x44040902DC0B7C60;
  *(_QWORD *)(v5 + 129) = v7;
  *(_BYTE *)(v5 + 144) = v7 < 0x437CFC11;
  v8 = (uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((943 * (v7 != 1132264465)) ^ v2)) - (((v2 - 349) | 4u) ^ 8));
  LODWORD(STACK[0x7DC]) = v2;
  v6[79] = 0x59B9B3832515B5C9;
  v6[80] = 0x2F165BB77C7BBE97;
  v6[81] = 0x69F2CF8653C517DALL;
  return v8();
}

void sub_22D205DC4()
{
  int v0;

  LODWORD(STACK[0x508]) = v0;
  JUMPOUT(0x22D205E0CLL);
}

uint64_t sub_22D205EC4@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  uint64_t v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  STACK[0x210] = v4;
  STACK[0x220] = a1;
  STACK[0x230] = v6;
  v7 = 41 * ((a3 - 45) ^ 0x175u);
  v8 = ((2 * (_QWORD)&STACK[0x4E4]) & 0xEFCFFF5FDDFFCF80)
     - 0x77E7FFAFEEFFE7C3
     + ((unint64_t)&STACK[0x4E4] ^ 0x77E7FFAFEEFFE57ALL ^ v7);
  STACK[0x270] = ((v8 % 0x25) ^ 0x3E5CA8FFE38FA7FELL)
               - 0x3E5CA8FFE38FA7EELL
               + ((2 * (v8 % 0x25)) & 0x7CLL);
  STACK[0x2A8] = STACK[0x310];
  STACK[0x240] = *(_QWORD *)(v3 + 496) + *(_QWORD *)(v3 + 488) - 0x6EA83C8D9F9C1022;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a2 + 8 * (int)v7)
                                          - ((v7 - v5 - 698) ^ 0x966D2D4FLL)))(2185141974);
}

uint64_t sub_22D206018(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  LODWORD(STACK[0x290]) = a3;
  *(_QWORD *)(a5 + 16) = 0x72177D63EB1FCDBCLL;
  LODWORD(STACK[0x4E4]) = dword_255D666E8 - 266572532;
  v9 = *(unsigned int *)(v6 + 1832);
  v7[12] = *(_QWORD *)(a2 + 8 * ((v5 - 1034051331) ^ 0x58CACEE1));
  LODWORD(STACK[0x5D0]) = v5 - 1034051331;
  LODWORD(STACK[0x5E0]) = 0;
  v7[14] = 1416753466;
  LODWORD(STACK[0x5E4]) = v5 - 1034051249;
  LODWORD(STACK[0x5E8]) = (v5 - 1034051331) ^ 0xAD;
  v7[17] = v9;
  *(_DWORD *)(v8 - 192) = 1431737413 * ((~((v8 - 200) | 0x2B3CC358) + ((v8 - 200) & 0x2B3CC358)) ^ 0x6A9DA3B5)
                        + 40706419
                        + v5;
  *(_QWORD *)(a5 + 448) = &STACK[0x5C8];
  sub_22D219DEC(v8 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v8 - 188)] - 4))();
}

uint64_t sub_22D206120()
{
  int v0;
  int v1;
  int v2;
  uint32_t v3;
  int v4;
  int v5;

  v2 = v1 + v0 + 429;
  STACK[0x2A8] = (unint64_t)malloc_type_malloc(STACK[0x270], 0xC5732911uLL);
  v3 = arc4random();
  LODWORD(xmmword_255D65D28) = v3 + (v2 ^ 0xF553264) - ((2 * v3) & 0x1EAA6790);
  v4 = xmmword_255D65D28 ^ 0xF5533C8 ^ (xmmword_255D65D28 >> 30);
  v5 = (v4 * (((v1 + v0 + 97) | 0x40A) + 1812432123)) ^ 0x6E6EE8EB;
  DWORD1(xmmword_255D65D28) = v5
                            + ((-670100790 * v4) & 0xDCDDD1D6)
                            - 1595520290
                            - ((2 * (v5 + ((-670100790 * v4) & 0xDCDDD1D6)) - 1021170132) & 0x1EAA6790);
  return ((uint64_t (*)(void))(qword_24F86A890[v2] - 4))();
}

void sub_22D206250()
{
  JUMPOUT(0x22D2061DCLL);
}

void sub_22D20626C()
{
  JUMPOUT(0x22D20628CLL);
}

uint64_t sub_22D206450@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, int a5@<W6>, int a6@<W7>, unsigned int a7@<W8>)
{
  uint64_t v7;
  int v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  v9 = (unsigned int *)(a2 + 4 * (v7 + a3));
  v10 = a6 + (v8 & 0x80000000) + 1;
  v11 = v9[1];
  v12 = (((2 * (v11 & 0x7FFFFFFE ^ 0xFDC6CE0)) | 0xF383B618) - (v11 & 0x7FFFFFFE ^ 0xFDC6CE0) + 104735988) ^ 0xF9488424;
  *v9 = v9[397] ^ *((_DWORD *)&STACK[0x2248] + (v11 & 1)) ^ (((v12 | v10 ^ a6) - ((2 * v12) & 0x79361DE0) + 1016794864) >> 1) ^ 0xF5524AC4;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((a7 + a5 + v7 - 4219485266 == a4 + 3) | a7)) - 8))();
}

uint64_t sub_22D206520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  int v8;
  int8x16_t v9;
  int v10;
  const float *v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int8x16_t v20;

  v10 = v8 ^ (a7 + 1320);
  v11 = (const float *)&dword_255D660B4;
  v12 = (int8x16_t)vld1q_dup_f32(v11);
  v13 = (int8x16_t)vdupq_n_s32(0x3AA6DBB2u);
  v14.i64[0] = 0x8000000080000000;
  v14.i64[1] = 0x8000000080000000;
  v9.i64[0] = *(_QWORD *)&dword_255D660B8;
  v9.i32[2] = dword_255D660C0;
  v15 = vextq_s8(v12, v9, 0xCuLL);
  v16 = v9;
  v16.i32[3] = *(_DWORD *)(a4 + 4 * ((v10 ^ 0x2BAu) - 707));
  v17 = vandq_s8(v15, v14);
  v18 = (int32x4_t)veorq_s8(vandq_s8(v16, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x851C814u));
  v19 = (int32x4_t)veorq_s8(vorrq_s8((int8x16_t)(*(_OWORD *)&vsubq_s32(vaddq_s32(v18, (int32x4_t)veorq_s8(vandq_s8(v16, v13), (int8x16_t)vdupq_n_s32(0x32A613A3u))), (int32x4_t)vandq_s8((int8x16_t)v18, v13)) & __PAIR128__(0xFFFFFFFEFFFFFFFELL, 0xFFFFFFFEFFFFFFFELL)), v17), (int8x16_t)vdupq_n_s32(0x3DA2206Eu));
  v20.i32[0] = *(_DWORD *)(v7 + 4 * (dword_255D660B8 & 1));
  v20.i32[1] = *(_DWORD *)(v7 + 4 * (unk_255D660BC & 1));
  v20.i32[2] = *(_DWORD *)(v7 + 4 * (dword_255D660C0 & 1));
  v20.i32[3] = *(_DWORD *)(v7 + 4 * (v16.i8[12] & 1));
  *(int8x16_t *)&dword_255D660B4 = veorq_s8(veorq_s8(veorq_s8((int8x16_t)xmmword_255D65D28, v20), (int8x16_t)vdupq_n_s32(0xB79E4BE9)), (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vsubq_s32(v19, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v19, v19), (int8x16_t)vdupq_n_s32(0x72061954u))), vdupq_n_s32(0xB9030CAB)), 1uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a3 + 8 * v10) - 4))();
}

void sub_22D20666C()
{
  JUMPOUT(0x22D2065A4);
}

uint64_t sub_22D206678@<X0>(uint64_t a1@<X2>, _DWORD *a2@<X3>, int a3@<W8>)
{
  unsigned int v3;

  v3 = (((2 * ((((a3 - 1209046603) & 0xDE7DBFEB) - 376253773) & *a2 ^ 0xEE87F40F)) & 0x5C34443C)
      - ((((a3 - 1209046603) & 0xDE7DBFEB) - 376253773) & *a2 ^ 0xEE87F40F)
      + 1374019041) ^ 0xB0371A26 | (((a3 - 679642171) & 0xBEEFADDB ^ 0x5AD8869) + (a2[623] | 0x7FFFFFFE)) & 0x80008020 ^ 0x8020;
  a2[623] = a2[396] ^ *((_DWORD *)&STACK[0x2248] + (*a2 & 1)) ^ ((v3 - ((2 * v3) & 0x94BC9D54) - 899789142) >> 1) ^ 0x8E30EAE9;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((120 * (LODWORD(STACK[0x4E4]) > 0x26F)) ^ a3)) - 12))();
}

uint64_t sub_22D206790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  LODWORD(STACK[0x4E4]) = 0;
  v8 = LODWORD(STACK[0x4E4])++;
  dword_255D666E8 = v8 + 266572533;
  v9 = (*(_DWORD *)(v4 + 1832) - 872550338);
  v6[12] = *(_QWORD *)(a3 + 8 * ((v3 + 428243621) ^ 0x1FFFFFFFAFF3A753));
  v6[14] = 544203128;
  LODWORD(STACK[0x5D0]) = 1;
  LODWORD(STACK[0x5E0]) = v3 + 428243590;
  LODWORD(STACK[0x5E4]) = v3 + 428243621;
  LODWORD(STACK[0x5E8]) = (v3 + 428243621) ^ 0x15;
  v6[17] = v9;
  *(_QWORD *)(v5 + 448) = &STACK[0x5C8];
  *(_DWORD *)(v7 - 192) = 1431737413 * ((2 * ((v7 - 200) & 0xDE1E798) - (v7 - 200) + 1914574949) ^ 0xCC408777)
                        + 40706419
                        + v3;
  sub_22D219DEC(v7 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v7 - 188)] - 4))();
}

uint64_t sub_22D2069C0(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;

  v7 = STACK[0x290];
  if (v2 >= v3)
    v8 = *(_DWORD *)(v4 + 1832) + 1;
  else
    v8 = 1416753466;
  *(_DWORD *)(v4 + 1832) = v8;
  *(_BYTE *)(v5 + (v7 - 1771787755)) = -90;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a2 + 8 * ((60 * (v7 - 1 != v6)) ^ 0x158)) - 4))(2185141974);
}

uint64_t sub_22D206AE4()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  CFTypeID v3;
  unint64_t v4;
  uint64_t v5;
  CFTypeID TypeID;

  v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 224));
  v4 = v3 ^ 0xFFFF8BDABDFF69FDLL;
  v5 = (v0 - 29 - 0xE84A84012CCDLL) & (2 * v3);
  TypeID = CFNumberGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)((870
                                               * (v4
                                                + (TypeID ^ 0x808A384FD00802E9)
                                                + v5
                                                - ((v0 ^ 0xFEEB8F605FEFFAC8) & (2 * TypeID)) == 0x8089C42A8E076CE6)) ^ v0))
                            - 12))();
}

uint64_t sub_22D206B98()
{
  int v0;
  uint64_t v1;
  Boolean Value;

  Value = CFNumberGetValue((CFNumberRef)STACK[0x1780], kCFNumberSInt64Type, &STACK[0x2D8]);
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((35
                                          * ((((Value << (v0 ^ 0x96 ^ (v0 - 53) ^ 0xC2)) & 0x7C)
                                                             + (Value ^ 0x3E)) == 62)) ^ v0))
                            - 12))();
}

uint64_t sub_22D206BFC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  LODWORD(STACK[0x564]) = -1084420343;
  v3 = malloc_type_malloc(8uLL, 0xD29E14C9uLL);
  *(_QWORD *)(v1 + 17) = v3;
  return (*(uint64_t (**)(void))(v2 + 8 * (((v3 == 0) * ((v0 + 824) ^ (v0 - 577))) ^ v0)))();
}

uint64_t sub_22D206C48@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  STACK[0x200] = v4;
  STACK[0x210] = a1;
  v5 = (a3 - 350) | 0x184u;
  v6 = ((unint64_t)&STACK[0x4C8] ^ 0x7FFF57FBAFFBAEFELL)
     - 0x7FFF57FBAFFBAEFELL
     + ((v5 ^ 0xFFFEAFF75FF75E70) & (2 * (_QWORD)&STACK[0x4C8]));
  STACK[0x240] = ((v6 % 0x25) ^ 0x9DFBFDDEF5FC6EFCLL)
               + 0x620402210A039114
               + ((2 * (v6 % 0x25)) & 0x78);
  STACK[0x2A0] = STACK[0x488];
  v7 = *(_QWORD *)(v3 + 256) + *(_QWORD *)(v3 + 264);
  STACK[0x2A8] = v7;
  STACK[0x230] = v7 + 16;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * (int)((86 * ((((_DWORD)v5 - 546460562) & 0xB6FF7D4F) == -1771229877)) ^ v5))
                            - 12))();
}

uint64_t sub_22D206E30(int a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8 * (((v3 + 8 == ((v4 - 182 + a1) & (a3 + 3460)) + 1830953329) * v5) ^ v4))
                            - 12))();
}

uint64_t sub_22D206E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  STACK[0x19A0] = 0xF76F40A66E67F079;
  LODWORD(STACK[0x4C8]) = dword_255D666E8 - 266572532;
  v9 = *(unsigned int *)(v6 + 1832);
  v7[12] = *(_QWORD *)(a2 + 8 * ((v5 - 699619382) ^ 0x6CB9D5BCLL));
  LODWORD(STACK[0x5D0]) = v5 - 699619382;
  LODWORD(STACK[0x5E0]) = 0;
  v7[14] = 1416753466;
  LODWORD(STACK[0x5E4]) = (v5 - 699619382) | 0x48;
  LODWORD(STACK[0x5E8]) = (v5 - 699619382) ^ 0x44;
  v7[17] = v9;
  *(_DWORD *)(v8 - 192) = 1431737413 * (((~(v8 - 200) & 0x55E4C474) - (~(v8 - 200) | 0x55E4C475)) ^ 0xEBBA5B67)
                        + 40706419
                        + v5;
  *(_QWORD *)(a5 + 448) = &STACK[0x5C8];
  sub_22D219DEC(v8 - 200);
  return ((uint64_t (*)(void))qword_24F86A890[*(int *)(v8 - 188)])();
}

uint64_t sub_22D206F74()
{
  int v0;
  int v1;
  int v2;
  uint32_t v3;
  unsigned int v4;

  v2 = v1 + v0 + 876;
  STACK[0x2A0] = (unint64_t)malloc_type_malloc(STACK[0x240], 0xC5732911uLL);
  v3 = arc4random();
  v4 = v3 + 257242056 + v2 - ((2 * v3) & 0x1EAA6790) - 875;
  LODWORD(xmmword_255D65D28) = v4;
  DWORD1(xmmword_255D65D28) = ((1812433253 * (v4 ^ 0xF5533C8 ^ (v4 >> 30))) ^ 0x5DDFEBB2)
                            + ((-670100790 * (v4 ^ 0xF5533C8 ^ (v4 >> 30))) & 0xBBBFD764)
                            - 1317713897
                            - ((((((1812433253 * (v4 ^ 0xF5533C8 ^ (v4 >> 30))) ^ 0x5DDFEBB2)
                                + ((-670100790 * (v4 ^ 0xF5533C8 ^ (v4 >> 30))) & 0xBBBFD764)
                                + 1034771205) << (v2 - 106))
                              + 149254804) & 0x1EAA6790);
  return ((uint64_t (*)(uint64_t))(qword_24F86A890[v2] - 8))(1034771205);
}

void sub_22D2070A8()
{
  JUMPOUT(0x22D207030);
}

void sub_22D2070C4()
{
  JUMPOUT(0x22D2070DCLL);
}

uint64_t sub_22D207260@<X0>(int a1@<W8>)
{
  char v1;
  char v2;
  int v3;
  char v4;
  _DWORD *v5;
  int v6;
  uint32_t v7;
  uint32_t v8;

  LODWORD(STACK[0x280]) = v3;
  v4 = v1 - 112;
  LODWORD(STACK[0x4C8]) = a1 + 1;
  gettimeofday((timeval *)STACK[0x230], 0);
  v5 = (_DWORD *)STACK[0x2A8];
  v6 = *(_DWORD *)(STACK[0x2A8] + 16) + 257242056 - ((*(_DWORD *)(STACK[0x2A8] + 16) << (v2 + v4 + 2)) & 0x1EAA6790);
  v5[1] = *(_DWORD *)(STACK[0x2A8] + 24) + 257242056 - ((2 * *(_DWORD *)(STACK[0x2A8] + 24)) & 0x1EAA6790);
  v5[2] = v6;
  v7 = arc4random();
  v5[3] = v7 + 257242056 - ((2 * v7) & 0x1EAA6790);
  v8 = arc4random();
  *v5 = v8 + 257242056 - ((2 * v8) & 0x1EAA6790);
  LODWORD(STACK[0x290]) = 869914991;
  return sub_22D204390();
}

uint64_t sub_22D207390()
{
  unint64_t v0;

  STACK[0x330] = v0;
  STACK[0x488] = STACK[0x2A0];
  return ((uint64_t (*)(unint64_t))STACK[0x200])(STACK[0x210]);
}

uint64_t sub_22D2073AC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int Length;
  int v4;
  int v5;
  void *v6;

  Length = CFDataGetLength(*(CFDataRef *)(v1 + 3752));
  v4 = Length - ((2 * Length) & 0x67C6F84C) - 1276937178;
  v5 = (((v0 - 943) | 0x1C4) + 213807244) ^ (v0 - 2100940920) & 0x7D39CDFF ^ v4;
  LODWORD(STACK[0x13BC]) = v5;
  LODWORD(STACK[0x30C]) = v5;
  v6 = malloc_type_malloc(v4 ^ 0xB3E37C26, 0x8DF370BBuLL);
  *(_QWORD *)(v1 + 3672) = v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((69 * (v6 != 0)) ^ v0)) - 4))();
}

uint64_t sub_22D20745C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  CFRange v6;

  v3 = (_QWORD *)(STACK[0x18D8] + STACK[0x1658] + 0x8C1E5500833E265);
  v6.length = (v1 ^ 0x66BFFFEF6FFAB7F7) + ((2 * v1) & 0xDFF56FEELL) - 0x66BFFFEF6FFAB7F7;
  *v3 = 0;
  v3[1] = v6.length;
  v6.location = 0;
  CFDataGetBytes((CFDataRef)STACK[0x1410], v6, (UInt8 *)STACK[0x13C0]);
  v4 = sub_22D22F638(v1, 0x32u, -63012239);
  STACK[0x1530] = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((v4 != 0) * ((17 * (v0 ^ 0x1D7)) ^ 0x3ED)) ^ v0)) - 4))();
}

uint64_t sub_22D207538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t (*v10)(void);

  v9 = (v7 ^ 0x535F4FFFE3EE70DDLL) + (v5 & 0x1C7DCE1BALL) - 0x535F4FFF52F1834BLL;
  *(_BYTE *)(v6 + 128) = v9 < 0x90FCED92;
  *(_QWORD *)(v6 + 113) = v9;
  v10 = (uint64_t (*)(void))(*(_QWORD *)(a4 + 8 * ((15 * (v9 != ((v4 - 465) | 0x30u) + 2432494943)) ^ v4)) - 4);
  LODWORD(STACK[0xB54]) = v4;
  v8[190] = 0x34FE6621EF738925;
  v8[191] = 0x789994560AC4A83FLL;
  v8[192] = 0x2E9FFD31F2CBD3D2;
  return v10();
}

void sub_22D207600()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;
  unint64_t v6;

  v1 = *(_QWORD *)(v0 + 1536);
  *(_QWORD *)(v0 + 1544) = v1;
  v2 = *(_QWORD *)(v0 + 1528);
  *(_QWORD *)(v0 + 1552) = v2;
  *(_QWORD *)(v0 + 1560) = *(_QWORD *)(v0 + 1520);
  v3 = STACK[0xB54];
  LODWORD(STACK[0xB88]) = STACK[0xB54];
  v4 = (v3 - 1958345309) & 0x74B9F8BB;
  LODWORD(STACK[0xB8C]) = v4;
  v5 = ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ (v2 + *(_DWORD *)(v0 + 4040) - 180660287)) & 0x7FFFFFFF)
     * (v4 - 711945572);
  v6 = -711945521 * (v5 ^ HIWORD(v5));
  LOBYTE(STACK[0x61B]) = byte_22D249F90[v6 >> 24] ^ *(_BYTE *)(v1 + *(_QWORD *)(v0 + 3672) - 0x2E9FFD31F2CBD3D2) ^ byte_22D24A6A0[(v6 >> 24) + 3] ^ byte_22D24B8E0[(v6 >> 24) + 2] ^ v6 ^ (-39 * BYTE3(v6));
  JUMPOUT(0x22D2147A8);
}

uint64_t sub_22D207714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,_QWORD *a26)
{
  int v26;
  uint64_t v27;
  size_t v28;
  void *v29;

  *(_QWORD *)(v27 + 3696) = STACK[0x2E8];
  v28 = (LODWORD(STACK[0x494]) - 1251582716);
  LODWORD(STACK[0x13E4]) = v28;
  v29 = malloc_type_malloc(v28, 0x99BD25DFuLL);
  *(_QWORD *)(v27 + 3712) = v29;
  *a26 = v29;
  return ((uint64_t (*)(void))(qword_24F86A890[((v29 != 0) * ((v26 - 395) ^ 0x1F8)) ^ v26]
                            - (((v26 + 244) | 0x40u) ^ 0x455)))();
}

uint64_t sub_22D20778C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(a5 + 8 * ((14 * (*(_QWORD *)(v6 + 3696) == 0x222ACA0D7372C8AELL)) ^ v5))
                            - ((v5 - 703) ^ (v5 - 194) ^ 0x211)))();
}

uint64_t sub_22D2077D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t (*v9)(void);

  v8 = (v6 | ((unint64_t)(v6 < 0x4A99A2FC) << 32)) + 2482274501u;
  STACK[0x1810] = v8;
  LOBYTE(STACK[0x181F]) = v8 < 0xDE8E23C1;
  v9 = (uint64_t (*)(void))(*(_QWORD *)(a5
                                     + 8
                                     * (int)((((v6 | ((unint64_t)(v6 < 0x4A99A2FC) << 32)) != 1251582716)
                                            * ((v5 - 1771230788) ^ 0x966D2D66)) ^ v5))
                         - 8);
  LODWORD(STACK[0x84C]) = v5;
  v7[93] = 0x3B192AC5A8899273;
  v7[94] = 0xA622D7A34FEB90DLL;
  v7[95] = 0x7E8E3BF4983E1DA0;
  return v9();
}

uint64_t sub_22D207894@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _DWORD *a18)
{
  uint64_t v18;
  unsigned int v19;
  unint64_t v20;

  *a18 = STACK[0x13E4];
  v19 = (a1 - 458360216) & 0x84E4D9DE;
  v20 = sub_22D22F914(*(_QWORD *)(v18 + 3696) - 0x222ACA0D7372C8AELL);
  return ((uint64_t (*)(unint64_t))(qword_24F86A890[(1410
                                                                    * (((STACK[0x360] == 0x5A72C1CEA1245FC3) ^ (((v19 + 67) & 0x7F) - 10)) & 1)) ^ v19]
                                                   - 12))(v20);
}

void sub_22D20794C()
{
  JUMPOUT(0x22D207960);
}

uint64_t sub_22D2079D0@<X0>(uint64_t a1@<X8>)
{
  int v1;

  sub_22D22F914(a1 - 0x222ACA0D7372C8AELL);
  return ((uint64_t (*)(void))(qword_24F86A890[(119 * (STACK[0x2380] == 0)) ^ (v1 + 72)]
                            - ((19 * ((v1 + 72) ^ 0x3B2u)) ^ 0x371)))();
}

uint64_t sub_22D2079F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = v0[107] + 1;
  v2 = v0[108];
  v3 = (169 * ((unint64_t)(v2 - 0x5994F085FD1B1406) < 8)) ^ LODWORD(STACK[0x8D4]);
  LODWORD(STACK[0x89C]) = STACK[0x8D4];
  v4 = v0[106] + 1;
  v5 = (uint64_t (*)(void))(qword_24F86A890[v3] - 4);
  v0[103] = v2 + 1;
  v0[104] = v1;
  v0[105] = v4;
  return v5();
}

uint64_t sub_22D207A68(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(unint64_t *, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t);

  v4 = (v3 + 478) | 0x58;
  LODWORD(STACK[0x3F8]) = v2;
  v5 = STACK[0x1788];
  v6 = ((((v4 - 1233126105) & 0xDFED2DCB) + 160543406) ^ 8) + 2129656656 + ((v4 + 114074) & 0x10);
  v7 = (uint64_t (*)(unint64_t *, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(*(_QWORD *)(a2 + 8 * ((2 * ((_DWORD)v6 == 518970185)) | (4 * ((_DWORD)v6 == 518970185)) | v4)) - 4);
  STACK[0x270] = STACK[0x1788];
  return v7(&STACK[0x16A0], a2, 1235614552, 518970185, v5, v6);
}

uint64_t sub_22D207ADC(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (((a1 == 0) * (v2 - 1075)) | v2)) - 12))();
}

uint64_t sub_22D207B0C@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  int v2;
  int v3;
  const __CFAllocator *v4;
  io_registry_entry_t v5;
  CFTypeRef CFProperty;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = a2 + 1909642319 + v2 + (v3 ^ 0x48B) - 5;
  LODWORD(STACK[0x140C]) = v5;
  CFProperty = IORegistryEntryCreateCFProperty(v5, CFSTR("product-id"), v4, 0);
  STACK[0x1410] = (unint64_t)CFProperty;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (v3 | (32 * (CFProperty == 0))))
                            - ((122 * (v3 ^ 0x48Bu)) ^ 0x266)))();
}

uint64_t sub_22D207B88()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  CFTypeID v5;
  unint64_t v6;
  uint64_t v7;
  CFTypeID TypeID;

  STACK[0x3C0] = *(_QWORD *)(v1 + 193);
  v4 = (16 - LODWORD(STACK[0x1668])) & 0x10;
  STACK[0x18D8] = (v4 & 0xFFFFFFFFFFFFFFDFLL | (32 * ((v4 >> 4) & 1))) ^ (((v0 - 183) ^ 0xBEu) - 0x8C1E5500833E37ALL);
  v5 = CFGetTypeID(*(CFTypeRef *)(v2 + 3752));
  v6 = v5 ^ 0xBCDFCDD8EE7F31FFLL;
  v7 = (2 * v5) & 0x79BF9BB1DCFE63FELL;
  TypeID = CFStringGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((207
                                          * (v6
                                           + (TypeID ^ 0xB80810BA03CA4402)
                                           + v7
                                           - ((2 * TypeID) & 0x8FEFDE8BF86B77FALL) == 0x74E7DE92F2497601)) ^ v0))
                            - 8))();
}

uint64_t sub_22D207C74()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  CFIndex Length;
  unint64_t v5;
  void *v6;

  Length = CFStringGetLength(*(CFStringRef *)(v1 + 3752));
  v5 = ((Length << (109 * (v0 ^ 0xA8) - 70)) & 0xFFFDAFDF96DDFB7ELL) + (Length ^ 0xFFFED7EFCB6EFDBFLL);
  *(_QWORD *)(v3 + 208) = v5;
  v6 = malloc_type_malloc(v5 + (v0 ^ 0x12810349103E9), 0x9EBEB066uLL);
  *(_QWORD *)(v3 + 216) = v6;
  STACK[0x320] = (unint64_t)v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (int)((930 * (v6 != 0)) ^ v0)) - 12))();
}

uint64_t sub_22D207D24()
{
  CFIndex v0;
  int v1;
  uint64_t v2;
  CFStringEncoding SystemEncoding;
  Boolean CString;

  SystemEncoding = CFStringGetSystemEncoding();
  CString = CFStringGetCString((CFStringRef)STACK[0x1410], (char *)STACK[0x1778], v0, SystemEncoding);
  STACK[0x220] = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((((((2 * CString) & 0xAE) + (CString ^ 0xD7)) != (((v1 + 21) | 2) ^ 0x9C))
                                          * (v1 + 1084)) ^ v1))
                            - 4))();
}

uint64_t sub_22D207DC4(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;

  v7 = v3 + *(_QWORD *)(v6 + 208);
  v8 = v7 + 203;
  v9 = v7 + 204;
  if (v8 >= 0)
    v9 = v8;
  v10 = (v9 >> 1) - ((2 * (v9 >> 1)) & 0xE41151CE) + 1913170151;
  LODWORD(STACK[0x30C]) = v10 ^ 0xCD55A7E6;
  v11 = sub_22D22F638(v10 ^ (((a2 + a3 + v4 - 800 + 4) | 0x224u) + 1913169600), 0x32u, -183037251);
  STACK[0x220] = 0;
  *(_QWORD *)(v5 + 4008) = v11;
  return ((uint64_t (*)(void))(qword_24F86A890[((4 * (v11 == 0)) | (16 * (v11 == 0))) ^ v4] - 4))();
}

uint64_t sub_22D207E88(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))(*(_QWORD *)(a4
                                     + 8
                                     * ((140
                                       * (((v4 ^ (a3 + 33)) ^ (v5 == ((v4 - 1909295752) & 0x71CD8AFF)
                                                                                    - 1084421022)) & 1)) ^ v4))
                         - 12);
  STACK[0x220] = *(_QWORD *)(v6 + 4008);
  return v7();
}

uint64_t sub_22D207EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t (*v10)(void);

  v8 = v4 - 671;
  v9 = (v5 + v8 + 551) ^ v6;
  if (v9 <= 1)
    v9 = 1;
  LODWORD(STACK[0x16D4]) = v9 + 1301986794;
  LODWORD(STACK[0x16E4]) = 1301986795;
  v10 = (uint64_t (*)(void))(2523737415
                          - ((v8 - 2039733182) | 0x10010909u)
                          + *(_QWORD *)(a4
                                      + 8
                                      * (v8 ^ 0x1F4 ^ (979
                                                     * (((((*(_BYTE *)STACK[0x1778] - v8) | (v8 - *(_BYTE *)STACK[0x1778])) >> (((v8 - 21) & 0x77) - 92)) & 1) == 0))))
                          - 8);
  STACK[0x220] = *(_QWORD *)(v7 + 4008);
  return v10();
}

uint64_t sub_22D207F1C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  CFTypeID v3;
  unint64_t v4;
  uint64_t v5;
  CFTypeID TypeID;

  v3 = CFGetTypeID(*(CFTypeRef *)(v1 + 3752));
  v4 = v3 ^ 0xBDDFA9FFAD7FFAFFLL;
  v5 = (v3 << (((-119 * (v0 ^ 0x12) - 52) | 0x20u) + 86)) & 0x7BBF53FF5AFFF5FELL;
  TypeID = CFDataGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((14
                                          * (v4
                                           + (TypeID ^ 0x1040414005000A20)
                                           - ((2 * TypeID) & 0xDF7F7D7FF5FFEBBELL)
                                           + v5 != 0xCE1FEB3FB280051FLL)) ^ v0))
                            - 8))();
}

uint64_t sub_22D207FD4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  CFTypeID v3;
  unint64_t v4;
  unint64_t v5;
  CFTypeID TypeID;

  v3 = CFGetTypeID(*(CFTypeRef *)(v1 + 3752));
  v4 = v3 ^ 0xFEF7C8DCEE7E67F9;
  v5 = (2 * v3) & 0xFDEF91B9DCFCCFF2;
  TypeID = CFNumberGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1304
                                          * (v4
                                           + v5
                                           + (TypeID ^ 0x89B00950811041)
                                           + ((v0 - 57071564) & 0x366D767)
                                           - ((TypeID << (13 * (v0 ^ 0xEBu) - 63)) & 0xFEEC9FED5EFDDF7CLL) == 0xFF8178E63EFF7981)) ^ v0))
                            - 12))();
}

uint64_t sub_22D2080A8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  Boolean Value;

  Value = CFNumberGetValue(*(CFNumberRef *)(v1 + 3752), kCFNumberSInt64Type, &STACK[0x450]);
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((((v0 ^ 0xCD) + 111) & (2 * Value)) + (Value ^ 0xFE)) != 254)
                                * ((3 * (v0 ^ 0x32D)) ^ 0x155)) ^ v0)))();
}

void sub_22D208100()
{
  IOObjectRelease(STACK[0x140C]);
  JUMPOUT(0x22D1F0B90);
}

void sub_22D208128()
{
  JUMPOUT(0x22D208130);
}

uint64_t sub_22D2081A4(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;

  return (*(uint64_t (**)(void))(a2
                              + 8
                              * ((11
                                * ((*(char *)(STACK[0x16A0]
                                                          + ((v3
                                                            - ((4 * LODWORD(STACK[0x141C]) + 204076000) & 0xD7AA880)
                                                            + 751980080) ^ (v4
                                                                          + ((v2 - 406794215) & 0x183F2BFFu)
                                                                          - 263182795)))
                                                - 48) > 9)) ^ v2)))();
}

uint64_t sub_22D208248(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned __int8 v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (v2 | (22 * (v3 - 65 < 6))))
                            - ((v2 - v4 - 193) ^ (v5 + 652) ^ 0x294)))();
}

uint64_t sub_22D208290(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  char v4;
  int v5;

  return (*(uint64_t (**)(void))(a2
                              + 8
                              * ((63
                                * ((*(_BYTE *)(STACK[0x16A0] + (v2 ^ 0x86BD5441)) - 48) < ((v5 - v4 + 8) ^ 2u))) ^ (v3 + v5 + 478))))();
}

uint64_t sub_22D208374@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t (*v9)(void);

  v7 = v3 + v2 + 39;
  v8 = v6 ^ (v5 + 97);
  v9 = (uint64_t (*)(void))(*(_QWORD *)(a1
                                     + 8
                                     * ((100 * (((a2 + 446730678) & ((v8 ^ 0x174408F6) + v7)) >= 0)) ^ (v4 + v6 + 675)))
                         - 8);
  LODWORD(STACK[0xB14]) = v8;
  return v9();
}

void sub_22D208458()
{
  uint64_t v0;

  sub_22D22F914(*(_QWORD *)(v0 + 49));
  STACK[0x230] = *(_QWORD *)(v0 + 49);
  LODWORD(STACK[0x374]) = -45002;
  JUMPOUT(0x22D210C9CLL);
}

void sub_22D208484(int a1@<W8>)
{
  char v1;
  int v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  int v6;
  char v7;
  unsigned int v8;
  unint64_t v9;

  v4 = STACK[0xB14];
  LODWORD(STACK[0xB18]) = STACK[0xB14];
  v5 = (v4 - 1770033404) & 0xFFEDBD5F;
  LODWORD(STACK[0xB1C]) = v5;
  v6 = v5 - v2 + 896;
  LODWORD(STACK[0xB20]) = v6;
  v7 = ((a1 << (v6 ^ 0x84)) - 28) ^ 0x84 | (v1 + 17);
  v8 = -711945521
     * (((*(_DWORD *)(v3 + 49) + LODWORD(STACK[0x141C]) - 754287368) ^ *(_DWORD *)(qword_255D671B8
                                                                                 + (dword_255D671C4 & 0x58B8A3F0))) & 0x7FFFFFFF);
  v9 = -711945521 * (v8 ^ HIWORD(v8));
  LOBYTE(STACK[0x61B]) = byte_22D251110[v9 >> 24] ^ byte_22D24D480[v9 >> 24] ^ byte_22D24D580[(v9 >> 24) + 2] ^ (v7 - 2 * (v7 & 0x1F) + 31) ^ v9 ^ (-83 * BYTE3(v9)) ^ 0x1F;
  JUMPOUT(0x22D2085B0);
}

uint64_t sub_22D2085B8()
{
  int v0;
  uint64_t v1;
  char *v2;
  CFStringEncoding SystemEncoding;
  CFStringRef v4;

  LODWORD(STACK[0x2300]) = -1999002467;
  v2 = off_255D66710[0];
  LOBYTE(STACK[0x2221]) = *off_255D66710[0] - 12;
  LOBYTE(STACK[0x2222]) = v2[1] - 12;
  LOBYTE(STACK[0x2223]) = v2[2] + (((v0 + 23) | 0x80) ^ 0x6C);
  LOBYTE(STACK[0x2224]) = v2[3] - 12;
  LOBYTE(STACK[0x2225]) = v2[4] + ((-43 * (v0 ^ 2)) ^ 0x8B);
  LOBYTE(STACK[0x2226]) = v2[5] - 12;
  LOBYTE(STACK[0x2227]) = v2[6] - 12;
  LOBYTE(STACK[0x2228]) = v2[7] - 12;
  LOBYTE(STACK[0x2229]) = v2[8] - 12;
  LOBYTE(STACK[0x222A]) = v2[9] - 12;
  LOBYTE(STACK[0x222B]) = v2[10] - 12;
  LOBYTE(STACK[0x222C]) = v2[11] - 12;
  LOBYTE(STACK[0x222D]) = v2[12] - 12;
  LOBYTE(STACK[0x222E]) = v2[13] - 12;
  LOBYTE(STACK[0x222F]) = v2[14] - 12;
  LOBYTE(STACK[0x2230]) = v2[15] - 12;
  LOBYTE(STACK[0x2231]) = v2[16] - 12;
  LOBYTE(STACK[0x2232]) = v2[17] - 12;
  LOBYTE(STACK[0x2233]) = v2[18] - 12;
  LOBYTE(STACK[0x2234]) = v2[19] - 12;
  LOBYTE(STACK[0x2235]) = v2[20] - 12;
  LOBYTE(STACK[0x2236]) = v2[21] - 12;
  LOBYTE(STACK[0x2237]) = off_255D66710[0][22] - 12;
  SystemEncoding = CFStringGetSystemEncoding();
  v4 = CFStringCreateWithCString(0, (const char *)&STACK[0x2221], SystemEncoding);
  *(_QWORD *)(v1 + 3784) = v4;
  return ((uint64_t (*)(void))qword_24F86A890[(802 * (v4 != 0)) ^ v0])();
}

uint64_t sub_22D208764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  uint64_t v8;

  v8 = MGCopyAnswer();
  *(_QWORD *)(v6 + 153) = v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(a5
                                        + 8 * (int)(((v8 == 0) * (((v5 - 562041753) & 0xB7ED3F4B) + 1771229920)) ^ v5))
                            - ((v5 - 405) | 0x2BCu)
                            + 691))();
}

void sub_22D2087CC()
{
  LODWORD(STACK[0x2370]) = -1084420351;
  STACK[0x2368] = 0;
  JUMPOUT(0x22D2087FCLL);
}

uint64_t sub_22D208828()
{
  unsigned int v0;
  int v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  CFRange v9;

  v5 = (v1 + 13 * (v0 ^ 0x2E7) - 26) ^ v2;
  v6 = (_QWORD *)(STACK[0x15C8] + STACK[0x15C0] - 0x67F6E4989E32D67BLL);
  v9.length = (v5 ^ 0xF3FBFC5BFFDFD2FBLL) + ((2 * v5) & 0x1FFBFA5F6) + 0xC0403A400202D05;
  *v6 = 0;
  v6[1] = v9.length;
  v9.location = 0;
  CFDataGetBytes(*(CFDataRef *)(v4 + 440), v9, (UInt8 *)STACK[0x1680]);
  v7 = sub_22D22F638(v5, 0x32u, 352690792);
  *(_QWORD *)(v3 + 3792) = v7;
  return ((uint64_t (*)(void))(qword_24F86A890[((v7 == 0) | (8 * (v7 == 0))) ^ v0] - 4))();
}

uint64_t sub_22D208904(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t (*v8)(void);

  v7 = (v4 ^ 0xE4FE4FEAE9BFF6DBLL) + (v3 & 0x1D37FEDB6) + 0x1B01B015FBAF0F86;
  *(_QWORD *)(v5 + 57) = v7;
  *(_BYTE *)(v5 + 72) = v7 < 0xE56F0661;
  v8 = (uint64_t (*)(void))(*(_QWORD *)(a2
                                     + 8
                                     * ((502 * ((((v2 ^ 9) - 1) ^ (v7 == 3849258593)) & 1)) ^ v2 ^ 9u))
                         - 4);
  LODWORD(STACK[0x11F4]) = v2 ^ 9;
  v6[402] = 0x109BB6767018613DLL;
  v6[403] = 0x72BF9E55DB447F62;
  v6[404] = 0x1B5E0344194BBFB3;
  return v8();
}

void sub_22D2089E4(int a1@<W8>)
{
  LODWORD(STACK[0x49C]) = a1;
  JUMPOUT(0x22D208A20);
}

uint64_t sub_22D208AF8(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;

  LODWORD(STACK[0x2A8]) = 2144859646;
  LODWORD(STACK[0x290]) = v4 - 92908624;
  *(int32x4_t *)&STACK[0x270] = vdupq_n_s32(0xFD8BB338);
  STACK[0x2A0] = STACK[0x3E0];
  LODWORD(STACK[0x280]) = v2 + 60;
  *(int32x4_t *)&STACK[0x230] = vdupq_n_s32(0x6D66C13Cu);
  *(int32x4_t *)&STACK[0x240] = vdupq_n_s32(0x12993EC2u);
  *(int32x4_t *)&STACK[0x210] = vdupq_n_s32(0x2101C43u);
  *(int32x4_t *)&STACK[0x220] = vdupq_n_s32(0xE4060039);
  *(int32x4_t *)&STACK[0x200] = vdupq_n_s32(0x6D678137u);
  return sub_22D1F38A4(1594101534, a2, 0x543EBB5AuLL, (v3 + 190) | 0x12u);
}

uint64_t sub_22D208DC8(void *a1)
{
  int v1;
  int v2;

  v2 = v1 ^ (v1 + 298);
  free(a1);
  return ((uint64_t (*)(void))(qword_24F86A890[(2041 * (LODWORD(STACK[0x31C]) == 0)) ^ v2]
                            - (v2 - 623)
                            + 195))();
}

uint64_t sub_22D208E3C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  **(_DWORD **)(v2 + 608) = STACK[0x474];
  **(_QWORD **)(v2 + 616) = v1;
  STACK[0x3C0] = STACK[0x15B8];
  CFRelease(*(CFTypeRef *)(v2 + 440));
  CFRelease(*(CFTypeRef *)(v2 + 624));
  return ((uint64_t (*)(void))(qword_24F86A890[(833 * (((69 * (v0 ^ 0x33D) + 114) | 0x10) != 337)) ^ (69 * (v0 ^ 0x33D))]
                            - 8))();
}

uint64_t sub_22D208ECC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[114];
  v2 = v0[116] + 1;
  v3 = qword_24F86A890[(90 * (v0[116] == 0x62FA08E04BE256CCLL)) ^ LODWORD(STACK[0x914])];
  v4 = v0[115] + 1;
  LODWORD(STACK[0x8DC]) = STACK[0x914];
  v0[111] = v2;
  v0[112] = v4;
  v0[113] = v1 + 1;
  return ((uint64_t (*)(void))(v3 - 4))();
}

uint64_t sub_22D208F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v9 = (LODWORD(STACK[0x918]) + 212);
  *(_QWORD *)(v8 + 3984) = &STACK[0x22D8];
  *(_QWORD *)(a7 + 160) = STACK[0x18C8];
  v10 = ((unint64_t)&STACK[0x400] ^ 0x16FB7FFF3FFFAFF7)
      - 0x16FB7FFF3FFFAFF7
      + ((2 * (_QWORD)&STACK[0x400]) & 0x2DF6FFFE7FFF5FE8);
  STACK[0x280] = ((v10 % (v9 - 638)) ^ 0x35767A3F6EFF5FDFLL) + 2 * ((v10 % (v9 - 638)) & 0x1F) - 0x35767A3F6EFF5FCFLL;
  STACK[0x2A8] = STACK[0x2F8];
  v11 = *(_QWORD *)(v7 + 185);
  STACK[0x270] = v11;
  STACK[0x240] = v11 + 16;
  return (*(uint64_t (**)(void))(a2
                              + 8
                              * (int)((454
                                     * ((((((_DWORD)v9 - 671257284) & 0xBE6FBD6B) + 1771230340) ^ 0x1D0FE4CB) == 487580932)) ^ v9)))();
}

uint64_t sub_22D209124(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  int v8;

  return (*(uint64_t (**)(void))(a2
                              + 8 * ((454 * (v6 + 8 == ((((v7 - 671257284) & (a3 + 1389)) - v8 + 463) ^ a6))) ^ v7)))();
}

uint64_t sub_22D209164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  uint64_t v8;
  int v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(a1 + 632) = 0x4B17B4B5D21F046ALL;
  LODWORD(STACK[0x400]) = dword_255D666E8 - 266572532;
  v12 = *(unsigned int *)(v8 + 1832);
  v10[12] = *(_QWORD *)(a2 + 8 * (v7 + 1771230046));
  LODWORD(STACK[0x5D0]) = v7 - 708484355;
  LODWORD(STACK[0x5E0]) = 0;
  v10[14] = 1416753466;
  LODWORD(STACK[0x5E4]) = (v7 - 708484355) ^ 0x64;
  LODWORD(STACK[0x5E8]) = v7 - 708484313;
  v10[17] = v12;
  *(_QWORD *)(a7 + 448) = &STACK[0x5C8];
  *(_DWORD *)(v11 - 192) = 1431737413 * ((v11 - 200 + v9 - 2 * ((v11 - 200) & v9)) ^ 0x1DB1A4B5) + 40706419 + v7;
  sub_22D219DEC(v11 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v11 - 188)] - 12))();
}

void sub_22D209240()
{
  JUMPOUT(0x22D209258);
}

uint64_t sub_22D209428@<X0>(int a1@<W2>, uint64_t a2@<X4>, uint64_t a3@<X5>, int a4@<W8>)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  unsigned int v14;

  v9 = (unsigned int *)(a3 + 4 * (v4 + v7));
  v10 = (v5 & 0x80000000) + v6;
  v11 = v4 + 1;
  v12 = *(_DWORD *)(a3 + 4 * (v11 + v7));
  v13 = ((v12 & 0x7FFFFFFE ^ (a4 + 757973674)) + (v12 & a1 ^ 0x40022019) - ((v12 & 0x7FFFFFFE ^ (a4 + 757973674)) & a1)) ^ 0x4B1AA271;
  v14 = (((2 * v13) | 0xB97DCC14) - v13 - 1556014602) ^ 0x5CF6172E;
  *v9 = v9[397] ^ *((_DWORD *)&STACK[0x1918] + (v12 & 1)) ^ (((v14 | v10 ^ v6) - ((2 * v14) & 0x7A7B7982) - 1120027455) >> 1) ^ 0x8C81DA0A;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((1724 * (v11 == v8 + 3)) ^ a4)) - 12))();
}

uint64_t sub_22D20951C@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  uint64_t v2;
  int8x16_t v3;
  const float *v4;
  int8x16_t v5;
  int8x16_t v6;
  int32x4_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int8x16_t v16;

  v4 = (const float *)&dword_255D660B4;
  v5 = (int8x16_t)vld1q_dup_f32(v4);
  v6.i64[0] = 0x8000000080000000;
  v6.i64[1] = 0x8000000080000000;
  v7 = vdupq_n_s32(0xD8CFE261);
  v8.i64[0] = 0x200000002;
  v8.i64[1] = 0x200000002;
  v3.i64[0] = *(_QWORD *)&dword_255D660B8;
  v3.i32[2] = dword_255D660C0;
  v9 = vextq_s8(v5, v3, 0xCuLL);
  v10 = v3;
  v10.i32[3] = dword_255D660C4;
  v11 = vandq_s8(v9, v6);
  v12 = veorq_s8(vandq_s8(v10, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x37DDDD5Eu));
  v13 = (int8x16_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8(v12, (int8x16_t)vdupq_n_s32(0x27301D9Eu)), (int32x4_t)vorrq_s8(v12, (int8x16_t)v7)), v7);
  v14 = (int32x4_t)veorq_s8(vorrq_s8(v13, v11), (int8x16_t)vdupq_n_s32(0x1FB8F308u));
  v15 = (int32x4_t)veorq_s8(vandq_s8((int8x16_t)v14, (int8x16_t)vdupq_n_s32(0x338DE0Fu)), vandq_s8(v13, v8));
  v16.i32[0] = *(_DWORD *)(v2 + 4 * (dword_255D660B8 & (((a2 - 537) | 0x80) ^ 0xA0u)));
  v16.i32[1] = *(_DWORD *)(v2 + 4 * (unk_255D660BC & 1));
  v16.i32[2] = *(_DWORD *)(v2 + 4 * (dword_255D660C0 & 1));
  v16.i32[3] = *(_DWORD *)(v2 + 4 * (dword_255D660C4 & 1));
  *(int8x16_t *)&dword_255D660B4 = veorq_s8(veorq_s8(veorq_s8((int8x16_t)xmmword_255D65D28, v16), (int8x16_t)vdupq_n_s32(0xD3836B6C)), (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vsubq_s32(v14, vaddq_s32(v15, v15)), vdupq_n_s32(0x338DE0Du)), 1uLL));
  return (*(uint64_t (**)(void))(a1 + 8 * (a2 + 333)))();
}

void sub_22D20966C()
{
  JUMPOUT(0x22D2095ACLL);
}

uint64_t sub_22D209678@<X0>(int a1@<W3>, uint64_t a2@<X4>, _DWORD *a3@<X5>, int a4@<W8>)
{
  unsigned int v4;
  unsigned int v5;

  v4 = (*a3 & 0x7FFFFFFE ^ 0x5F88AB0)
     + (*a3 & 0xAFB74FC ^ 0xA03744C)
     - ((*a3 & 0x7FFFFFFE ^ 0x5F88AB0) & ((a4 - 123327983) ^ 0xF25D5E4E));
  v5 = ((v4 & 0xC3FCAE2E ^ 0xC380820A) + (v4 ^ (a1 + a4 + 1913802697)) - ((v4 ^ (a1 + a4 + 1913802697)) & 0xC3FCAE2E)) ^ 0xCBD51E1F;
  a3[623] = a3[396] ^ *((_DWORD *)&STACK[0x1918] + (*a3 & 1)) ^ (((v5 | a3[623] & 0x80000000)
                                                                  - ((2 * v5) & 0x2FBB5B36)
                                                                  + 400403867) >> 1) ^ 0xD9F1D2A7;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (a4 ^ ((LODWORD(STACK[0x400]) < 0x270) << 6))) - 8))();
}

void sub_22D20977C(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v6;
  unsigned int v7;
  unint64_t v8;

  v4 = STACK[0xE18];
  LODWORD(STACK[0xE1C]) = STACK[0xE18];
  STACK[0x338] = v2;
  STACK[0x2F8] = STACK[0x2A8];
  free((void *)STACK[0x18B8]);
  v6 = STACK[0x18D0];
  v7 = -711945521 * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ STACK[0x18D0]) & 0x7FFFFFFF);
  v8 = -711945521 * (v7 ^ HIWORD(v7));
  LOBYTE(STACK[0x61B]) = byte_22D249F90[v8 >> 24] ^ byte_22D24A6A0[(v8 >> 24) + 3] ^ byte_22D24B8E0[(v8 >> 24) + 2] ^ v8 ^ (-39 * BYTE3(v8)) ^ 0x82;
  *(_QWORD *)(v3 + 160) = *(_QWORD *)(a2 + 8 * (v4 + 789)) - 4;
  *(_QWORD *)(v3 + 168) = v6;
  JUMPOUT(0x22D2128A4);
}

uint64_t sub_22D2098CC(unint64_t a1, uint64_t a2, int a3)
{
  int v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);

  STACK[0x200] = a1;
  v6 = ((unint64_t)&STACK[0x534] ^ 0xFBB6FFCCCDEB1F9FLL)
     + 0x44900333214E061
     + (((_QWORD)&STACK[0x534] << ((v3 ^ 0x54u) - 47)) & 0xF76DFF999BD63F38);
  STACK[0x230] = ((v6 % 0x25) ^ 0x7EFF5F99F7FBBAFELL)
               - 0x7EFF5F99F7FBBAEELL
               + ((2 * (v6 % 0x25)) & 0x7CLL);
  v7 = *(_QWORD *)(v5 + 4064) + *(_QWORD *)(v5 + 4056) - 0x7FDCEBE57FFF7AEALL;
  STACK[0x2A0] = STACK[0x430];
  STACK[0x2A8] = v7;
  STACK[0x220] = v7 + 16;
  v8 = *(uint64_t (**)(uint64_t))(a2
                                         + 8
                                         * ((1672
                                           * (a3 + (v3 ^ 0x5E53AF54) - 560 + (((v3 ^ 0x5E53AF54) - 206) | 0x14) == -1771229503)) ^ v3 ^ 0x5E53AF54));
  STACK[0x240] = v4;
  return v8(3183507338);
}

uint64_t sub_22D209A28()
{
  int v0;
  uint64_t v1;

  CFRelease(*(CFTypeRef *)(v1 + 4032));
  LODWORD(STACK[0x170C]) = -45000;
  STACK[0x1710] = (unint64_t)&STACK[0x2298];
  return ((uint64_t (*)(void))(qword_24F86A890[(61
                                             * (SLODWORD(STACK[0x2298]) >= (int)((((v0 + 392) ^ 0x2D9) + 570) ^ 0xBF5D0D68))) ^ (v0 + 392) ^ 0x697]
                            - 8))();
}

uint64_t sub_22D209A50()
{
  uint64_t v0;
  int v1;
  _QWORD *v2;
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;

  v2[475] = *(_QWORD *)(v0 + 184);
  v3 = ((LODWORD(STACK[0x378]) - 1053363557) & 0xFFFFFFF0 ^ (((v1 + 1704693693) & 0x9A646DF7) + 1064810632))
     + ((2 * (LODWORD(STACK[0x378]) - 1053363557)) & 0x7EEF74A0);
  LODWORD(STACK[0x144C]) = v3;
  LODWORD(STACK[0x1450]) = v3 - 646996619;
  v4 = v3 - 1064811087;
  LODWORD(STACK[0x1454]) = v4;
  v5 = sub_22D22F638(v4, 0x32u, 948295290);
  v2[478] = v5;
  v2[479] = v5 + 0xE550F9B8A5EBC69;
  STACK[0x380] = v5 + 0xE550F9B8A5EBC69;
  return ((uint64_t (*)(void))(qword_24F86A890[(22 * (v5 != 0)) ^ v1] - 8))();
}

uint64_t sub_22D209B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  unsigned int v10;
  BOOL v11;
  uint64_t (*v12)(void);
  char v13;

  v8 = 43 * (v5 ^ 0x1DD);
  v9 = (v8 - 428) | 0x1E4;
  v10 = (v9 ^ 0xD8F52A26) + v6;
  LODWORD(STACK[0x1500]) = v10;
  v11 = v10 >= 0x17BE3925;
  v12 = *(uint64_t (**)(void))(a5 + 8 * ((49 * (v10 != 398342437)) ^ v5));
  v13 = !v11;
  *(_BYTE *)(v7 + 3999) = v13;
  LODWORD(STACK[0x940]) = v8;
  LODWORD(STACK[0x944]) = 662509689;
  *(_QWORD *)(v7 + 992) = 0;
  LODWORD(STACK[0xF54]) = v9;
  LODWORD(STACK[0xF58]) = 662509689;
  return v12();
}

void sub_22D209BA8()
{
  unsigned int v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;

  v2 = LODWORD(STACK[0xF58]);
  LODWORD(STACK[0xF5C]) = v2;
  v3 = STACK[0xF54];
  LODWORD(STACK[0xF60]) = STACK[0xF54];
  LODWORD(STACK[0xF64]) = v3 ^ 0x31;
  v4 = v2 - 662509689 + ((unint64_t)(v2 < v0) << 32);
  v1[320] = v4;
  v5 = v1[475] + v4;
  v1[321] = v5;
  v1[64] = v5 - 0x222ACA0D7372C8AELL;
  JUMPOUT(0x22D20E784);
}

void sub_22D209C18(unint64_t a1)
{
  sub_22D22F914(a1);
  JUMPOUT(0x22D1F07F8);
}

uint64_t sub_22D209CBC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  int v4;
  int v5;

  return (*(uint64_t (**)(void))(a4 + 8 * ((1532 * (v4 + 8 == a3 + (v5 ^ 0xA8) - 984708406)) ^ v5)))();
}

uint64_t sub_22D209CF8()
{
  unint64_t v0;

  STACK[0x520] = v0;
  STACK[0x420] = STACK[0x2A8];
  return ((uint64_t (*)(unint64_t))STACK[0x200])(STACK[0x210]);
}

uint64_t sub_22D209D20(void *a1, int a2, int a3)
{
  int v3;

  v3 = a2 + a3 + 428;
  free(a1);
  return ((uint64_t (*)(void))(qword_24F86A890[(((v3 - 336774716) & 0x975BFDFF ^ ((v3 - 107) | 7) ^ 0x83493D0B)
                                             * (LODWORD(STACK[0x45C]) == 0)) ^ v3]
                            - 12))();
}

uint64_t sub_22D209DCC@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v4 = (a1 + 2092353173) | 0x143;
  LODWORD(STACK[0x22C8]) = STACK[0x30C];
  *(_QWORD *)(v1 + 136) = STACK[0x220];
  STACK[0x3C0] = STACK[0x1650];
  CFRelease(*(CFTypeRef *)(v2 + 3752));
  v5 = IOObjectRelease(STACK[0x140C]);
  return ((uint64_t (*)(uint64_t))(2523737415 - ((v4 - 1753224028) & 0xFEED3F5F) + *(_QWORD *)(v3 + 8 * v4)))(v5);
}

uint64_t sub_22D209E78()
{
  int v0;
  int v1;
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  int v7;

  v1 = v0 + 56;
  v2 = (v0 + 496);
  LODWORD(STACK[0x22B8]) = -1999002471;
  STACK[0x18B8] = (unint64_t)malloc_type_malloc(0x400uLL, 0x646BE428uLL);
  STACK[0x18C0] = (unint64_t)malloc_type_malloc(0x401uLL, 0x445DE08DuLL);
  STACK[0x18C8] = sub_22D22F638(1024, 0x32u, -922922145);
  v3 = sub_22D22F638(1025, 0x32u, 1999705887);
  STACK[0x18D0] = v3;
  if (STACK[0x18B8])
    v4 = STACK[0x18C0] == 0;
  else
    v4 = 1;
  v7 = !v4 && STACK[0x18C8] != 0 && v3 != 0;
  return ((uint64_t (*)(void))(qword_24F86A890[(v7 * (((v1 - 1557285248) & 0x5CD24BED) - 791)) ^ v1] - v2 + 811))();
}

uint64_t sub_22D209F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v6 = (v5 - 776);
  v7 = ((unint64_t)&STACK[0x318] ^ 0x6DF7FFFFFDFFDEBCLL)
     - 0x6DF7FFFFFDFFDEBCLL
     + ((v6 ^ 0xDBEFFFFFFBFFBD98) & (2 * (_QWORD)&STACK[0x318]));
  STACK[0x290] = ((v7 % 0x25) ^ 0xCFAFD69B860EBCE9)
               + 0x3050296479F14327
               + ((2 * (v7 % 0x25)) & 0x52);
  STACK[0x2A8] = STACK[0x4F8];
  v8 = STACK[0x1658];
  STACK[0x280] = STACK[0x1658];
  STACK[0x270] = v8 + 16;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a5 + 8 * (int)(v6 ^ 0x361))
                                          - ((((v5 - 357) | 0x165u) - 1771230882) ^ 0x966D2D4FLL)))(1970934202);
}

uint64_t sub_22D20A144@<X0>(int a1@<W2>, uint64_t a2@<X4>, int a3@<W8>)
{
  int v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((865 * (v3 + 8 == a1)) ^ (a3 - 776)))
                            - ((v4 + ((a3 - 357) | 0x165u) - 1005) ^ 0x966D2D4FLL)))();
}

uint64_t sub_22D20A194(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  int v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  LODWORD(STACK[0x2A0]) = a4;
  *(_QWORD *)(a6 + 8) = 0x89B74D6610BFFDB9;
  LODWORD(STACK[0x318]) = dword_255D666E8 - 266572532;
  v10 = *(unsigned int *)(v7 + 1832);
  v8[12] = *(_QWORD *)(a5 + 8 * (v6 + 1771230046));
  LODWORD(STACK[0x5D0]) = v6 - 745822838;
  LODWORD(STACK[0x5E0]) = 0;
  v8[14] = 1416753466;
  LODWORD(STACK[0x5E4]) = v6 - 745822875;
  LODWORD(STACK[0x5E8]) = v6 - 745822817;
  v8[17] = v10;
  *(_QWORD *)(a6 + 448) = &STACK[0x5C8];
  *(_DWORD *)(v9 - 192) = 1431737413
                        * ((((2 * ((v9 - 200) ^ 0x1AE58C55)) | 0x11D256D4) - ((v9 - 200) ^ 0x1AE58C55) - 149498730) ^ 0xAC52382D)
                        + 40706419
                        + v6;
  sub_22D219DEC(v9 - 200);
  return ((uint64_t (*)(void))qword_24F86A890[*(int *)(v9 - 188)])();
}

void sub_22D20A288()
{
  JUMPOUT(0x22D20A2A8);
}

void sub_22D20A420()
{
  JUMPOUT(0x22D20A338);
}

uint64_t sub_22D20A428(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  int v13;

  v9 = (unsigned int *)(a4 + 4 * (v4 + v7));
  v10 = ((v5 + 1685659063) & 0x9B86E175 ^ (a3 + 310)) & v6;
  v11 = v4 + 1;
  v12 = *(_DWORD *)(a4 + 4 * (v11 + v7));
  v13 = (((v12 & 0x744957BC ^ 0x50084515) + (v12 & 0xBB6A842 ^ 0xB142041) - 2) | v10) ^ 0x5449569C;
  *v9 = v9[397] ^ *((_DWORD *)&STACK[0x2240] + (v12 & 1)) ^ ((v13 - ((2 * v13) & 0x95E796Eu) - 2068890442) >> 1) ^ 0x52E863E2;
  return (*(uint64_t (**)(void))(a2 + 8 * ((1438 * (v11 == v8 + 3)) ^ v5)))();
}

uint64_t sub_22D20A510@<X0>(uint64_t a1@<X1>, uint64_t a2@<X3>, unsigned int a3@<W8>)
{
  uint64_t v3;
  int8x16_t v4;
  const float *v5;
  int8x16_t v6;
  uint64_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int8x16_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int8x16_t v19;

  v5 = (const float *)(a2 + 908);
  v6 = (int8x16_t)vld1q_dup_f32(v5);
  v7 = 4 * a3 - 256;
  v8 = (int8x16_t)vdupq_n_s32(0x7FFFFFFEu);
  v9.i64[0] = 0x8000000080000000;
  v9.i64[1] = 0x8000000080000000;
  v10.i64[0] = 0x800000008;
  v10.i64[1] = 0x800000008;
  v4.i32[0] = *(_DWORD *)(a2 + 912);
  v4.i32[1] = *(_DWORD *)(a2 + v7);
  v4.i32[2] = *(_DWORD *)(a2 + 920);
  v11 = vextq_s8(v6, v4, 0xCuLL);
  v12 = v4;
  v12.i32[3] = *(_DWORD *)(a2 + 924);
  v13 = (int8x16_t)vaddq_s32((int32x4_t)veorq_s8((int8x16_t)vaddq_s32((int32x4_t)vorrq_s8(v11, v8), vdupq_n_s32(0xF872290A)), (int8x16_t)vdupq_n_s32(0x2705A7F0u)), vdupq_n_s32(0xB8B3E898));
  v14 = (int32x4_t)veorq_s8(vandq_s8(v12, v8), (int8x16_t)vdupq_n_s32(0x450F1B0Au));
  v15 = (int32x4_t)veorq_s8((int8x16_t)vaddq_s32(vsubq_s32(v14, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v14, v14), (int8x16_t)vdupq_n_s32(0xBF773350))), vdupq_n_s32(0xDFBB99A8)), (int8x16_t)vdupq_n_s32(0x15A999A8u));
  v16 = (int8x16_t)vaddq_s32(vsubq_s32(v15, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v15, v15), (int8x16_t)vdupq_n_s32(0x30F0116Cu))), vdupq_n_s32(0x987808B7));
  v17 = (int32x4_t)veorq_s8(vorrq_s8(v16, vandq_s8(v13, v9)), (int8x16_t)vdupq_n_s32(0x18302075u));
  v18 = (int32x4_t)veorq_s8(vandq_s8((int8x16_t)v17, (int8x16_t)vdupq_n_s32(0x411F0A1Fu)), vandq_s8(v16, v10));
  v19.i32[0] = *(_DWORD *)(v3 + 4 * (*(_DWORD *)(a2 + 912) & 1));
  v19.i32[1] = *(_DWORD *)(v3 + 4 * (*(_DWORD *)(a2 + v7) & 1));
  v19.i32[2] = *(_DWORD *)(v3 + 4 * (*(_DWORD *)(a2 + 920) & 1));
  v19.i32[3] = *(_DWORD *)(v3 + 4 * (v12.i8[12] & 1));
  *(int8x16_t *)(a2 + 908) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)a2, v19), (int8x16_t)vdupq_n_s32(0x703078B2u)), (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vsubq_s32(v17, vaddq_s32(v18, v18)), vdupq_n_s32(0xC11F0A17)), 1uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (int)a3) - 12))();
}

void sub_22D20A6C4()
{
  JUMPOUT(0x22D20A5D4);
}

uint64_t sub_22D20A6D0@<X0>(uint64_t a1@<X1>, _DWORD *a2@<X3>, int a3@<W8>)
{
  int v3;
  unsigned int v4;
  unsigned int v5;

  v4 = ((*a2 & 0x769A0668 ^ 0xA2980269 | *a2 & 0x965F996) - 1) ^ 0xAFDD05E0;
  v5 = (-1794157206 - (v4 | 0x950F556A) + (v4 | 0x6AF0AA95)) ^ 0x68E09ED5;
  a2[623] = a2[396] ^ *((_DWORD *)&STACK[0x2240] + (*a2 & 1)) ^ (((v5 | ((((a3 - 696275910) & 0xBFED7FEB ^ 0x166D2D4B) & a2[623])
                                                                         + v3) ^ v3)
                                                                  - ((2 * v5) & 0x8135E52E)
                                                                  + 1083896471) >> 1) ^ 0x30F284F2;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((a3 + 368) ^ (32 * (LODWORD(STACK[0x318]) < 0x270)))) - 12))();
}

uint64_t sub_22D20A7D8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X4>, int a3@<W8>)
{
  LODWORD(STACK[0x318]) = 0;
  return sub_22D203CB8(a1, a2, a3);
}

uint64_t sub_22D20A7E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  STACK[0x518] = v5;
  STACK[0x4F8] = STACK[0x2A8];
  *(_QWORD *)(v8 + 3856) = *(_QWORD *)(v7 + 544) + 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(a5
                                        + 8 * (((dword_255D66700 == 1438895437) * (((v6 - 288) | 0x104) - 815)) ^ v6))
                            - (v6 ^ 0x101u)
                            + 681))();
}

uint64_t sub_22D20A850()
{
  int v0;
  uint64_t v1;
  int v2;

  v2 = MEMORY[0x22E30F0C8](0, &STACK[0x354]);
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((292
                                          * (((2 * v2) & 0x76F775BE) + (((v0 ^ 0x125) - 1149520053) ^ v2) == -1149519137)) ^ v0))
                            - 8))();
}

uint64_t sub_22D20A8A8()
{
  uint64_t v0;
  int v1;
  _BOOL4 v2;

  strcpy((char *)&STACK[0x1981], "com_apple_driver_FairPlayIOKit");
  v2 = IOServiceMatching((const char *)&STACK[0x1981]) != 0;
  return ((uint64_t (*)(void))(qword_24F86A890[(1544 * v2) ^ v1] - (v0 ^ 0x39C)))();
}

uint64_t sub_22D20A93C(const __CFDictionary *a1)
{
  int v1;
  uint64_t v2;
  kern_return_t MatchingServices;

  MatchingServices = IOServiceGetMatchingServices(STACK[0x354], a1, (io_iterator_t *)&STACK[0x530]);
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((273
                                          * ((((2 * v1) ^ 0xFF97721E) & (2 * MatchingServices))
                                           + ((v1 + 139174158) & 0xF7B45FD4 ^ MatchingServices ^ 0xFFCBB82A) == -3425346)) ^ v1))
                            - 8))();
}

uint64_t sub_22D20A9B4()
{
  int v0;
  uint64_t v1;
  io_object_t v2;

  v2 = IOIteratorNext(STACK[0x530]);
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((115
                                          * ((((v0 ^ 0x29) + 12) ^ (((2 * v2) & 0xC9D3FFBE)
                                                                                   + (v2 ^ 0x64E9FFDF) == 1693056991)) & 1)) ^ v0 ^ 0x7FA))
                            - 4))();
}

uint64_t sub_22D20AA28@<X0>(int a1@<W8>)
{
  int v1;
  kern_return_t v2;

  v2 = IOServiceOpen(((v1 - 1771230476) ^ 0xD7B2D6A) + a1, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)&STACK[0x3EC]);
  return ((uint64_t (*)(void))(qword_24F86A890[(1626 * (((2 * v2) & 0xF5F76FD6) + (v2 ^ 0xFAFBB7EB) == -84166677)) ^ v1]
                            - 12))();
}

uint64_t sub_22D20AAAC()
{
  uint64_t v0;
  int v1;
  io_object_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  _BOOL4 v6;

  *(_DWORD *)(v0 + 1792) = (LODWORD(STACK[0x3EC]) ^ 0x5DCBDF4D)
                         - 134746624
                         + ((v1 ^ 0x2DFA93D1) & (2 * LODWORD(STACK[0x3EC])));
  IOObjectRelease(v2);
  v4 = (v1 + 1771230409) | 0x180;
  v5 = IOObjectRelease(STACK[0x530]);
  v6 = *(_DWORD *)(v0 + 1792) != (v4 ^ 0x55C3CED9);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * (((4 * v6) | (32 * v6)) ^ v4)) - 8))(v5);
}

void sub_22D20ACE8()
{
  uint64_t v0;

  free(*(void **)(v0 + 536));
  free(*(void **)(v0 + 544));
  sub_22D22F914(*(_QWORD *)(v0 + 552));
  sub_22D22F914(*(_QWORD *)(v0 + 560));
  JUMPOUT(0x22D1F0B00);
}

void sub_22D20AD2C()
{
  _QWORD *v0;
  unint64_t v1;
  int v2;
  unint64_t v3;
  unint64_t v4;

  v1 = LODWORD(STACK[0x920]);
  LODWORD(STACK[0x924]) = v1;
  v2 = STACK[0x91C];
  LODWORD(STACK[0x928]) = STACK[0x91C];
  LODWORD(STACK[0x92C]) = (v2 + 1751014783) & 0x97A1A1AC;
  v3 = (v1 | ((unint64_t)(v1 < 0x355585B7) << 32)) - 894797239;
  v0[121] = v3;
  v4 = v0[479] + v3;
  v0[122] = v4;
  v0[64] = v4 - 0xE550F9B8A5EBC69;
  JUMPOUT(0x22D2050ACLL);
}

void sub_22D20ADB0()
{
  uint64_t v0;
  unsigned int v1;
  int v2;

  v1 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (int)(dword_255D671C4 & 0xDF3C6E9C)) ^ LODWORD(STACK[0x938])) & 0x7FFFFFFF);
  v2 = (v1 >> (LODWORD(STACK[0x92C]) + 104)) ^ v1;
  LOBYTE(STACK[0x61B]) = byte_22D247640[*(_QWORD *)(v0 + 968) & 0xF | (16 * ((-711945521 * v2) >> 24))] ^ LOBYTE(STACK[0x767]) ^ (-49 * v2);
  JUMPOUT(0x22D21289CLL);
}

uint64_t sub_22D20AE48()
{
  int v0;
  unsigned int v1;
  char v2;
  char v3;
  uint64_t (*v4)(void);

  v0 = LODWORD(STACK[0x924]) + 1;
  v1 = LODWORD(STACK[0x924]) - 567563255;
  v2 = LOBYTE(STACK[0x18EF]) ^ (v1 < 0x138131BF);
  v3 = v1 < LODWORD(STACK[0x18E8]);
  if ((v2 & 1) != 0)
    v3 = STACK[0x18EF];
  v4 = (uint64_t (*)(void))(qword_24F86A890[(199 * (v3 & 1)) ^ LODWORD(STACK[0x928])] - 4);
  LODWORD(STACK[0x91C]) = STACK[0x928];
  LODWORD(STACK[0x920]) = v0;
  return v4();
}

uint64_t sub_22D20AEC4()
{
  uint64_t v0;
  int v1;

  v1 = LODWORD(STACK[0x308])++;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v0
                                                      + 8 * ((151 * ((v1 - 1216356585) < 0xC)) ^ 0x21F))
                                          - 4))(3210546945);
}

uint64_t sub_22D20AEFC()
{
  int v0;
  int v1;

  v1 = MGGetBoolAnswer();
  return ((uint64_t (*)(void))(qword_24F86A890[(242 * v1) ^ v0]
                            - ((v0 - 240652967) ^ 0x1C2A3DA6u)
                            - ((v0 - 240652967) & 0xE58137F)
                            + 3985495472))();
}

uint64_t sub_22D20AF5C@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t (*v6)(void);

  v5 = a1 ^ 0x27B;
  v6 = *(uint64_t (**)(void))(v2
                           + 8
                           * ((((**(_DWORD **)(v3 + 89) - 860773966) < 0xFFFFFFF1)
                             * (((a1 ^ 0x27B) - 1771230661) ^ (v1 + 12))) ^ a1));
  LODWORD(STACK[0xF7C]) = v5;
  *(_QWORD *)(v4 + 2584) = 107934521;
  return v6();
}

uint64_t sub_22D20AFC0(unint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_22D22F914(a1);
  sub_22D22F9F8(byte_22D2507B0, (char *)STACK[0x1870], 0xDuLL);
  **(_QWORD **)(v2 + 81) = 0;
  **(_DWORD **)(v2 + 89) = 860773951;
  v4 = qword_24F86A890[v1 + 1771230044];
  v5 = 591644117
     * ((2 * ((v3 - 200) & 0x462613B438D8D8C8) - (v3 - 200) - 0x462613B438D8D8CDLL) ^ 0x5DC2CC825C226D74);
  STACK[0x2408] = *(_QWORD *)(v2 + 73);
  STACK[0x23F8] = v4 - v5;
  *(_DWORD *)(v3 - 176) = -922504226 - v5 + v1;
  sub_22D227BBC(v3 - 200);
  return ((uint64_t (*)(_QWORD))(qword_24F86A890[(44
                                                          * ((((((v1 + 1771230037) | 0x400) - 976) ^ (*(_DWORD *)(v3 - 192) == 1415721421)) & 1) == 0)) ^ (v1 + 1771231058)]
                                         - 8))(**(_QWORD **)(v2 + 81));
}

uint64_t sub_22D20AFD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  char v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a4
                                        + 8
                                        * (v4 ^ 0x6C1 ^ (8
                                                       * (((-83 * (v4 ^ 0x66)) ^ ((v5 + (((v4 ^ 0xC1) + 82) & 0x9F) + 43) < 6u)) & 1))))
                            - 8))();
}

uint64_t sub_22D20B038(uint64_t a1, int a2, int a3, uint64_t a4)
{
  int v4;
  int v5;
  int v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(a4
                                        + 8
                                        * ((95
                                          * ((*(char *)(STACK[0x1778]
                                                                    + (v5 ^ v4 ^ (v6 - a2 - 866 - a3 + 658)))
                                                          - 48) < 0xA)) ^ (v6 - 306)))
                            - 4))();
}

uint64_t sub_22D20B064(uint64_t a1, int a2, int a3, uint64_t a4)
{
  int v4;
  int v5;
  int v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(a4
                                        + 8
                                        * (int)((95
                                               * ((*(char *)(STACK[0x1778]
                                                                         + (v5 ^ v4 ^ ((v6 ^ 0xC8D734DF) - a3 + 658)))
                                                               - 48) < 0xA)) ^ (a2 + (v6 ^ 0xC8D734DF) + 560)))
                            - 4))();
}

uint64_t sub_22D20B07C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  CFTypeID v3;
  unint64_t v4;
  unint64_t v5;
  CFTypeID TypeID;

  v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 440));
  v4 = v3 ^ 0xFDDDD7FBEE7F64FFLL;
  v5 = (2 * v3) & 0xFBBBAFF7DCFEC9FELL;
  TypeID = CFNumberGetTypeID();
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((141
                                * (v4
                                 + v5
                                 + ((((v0 - 566) | 0xC4u) - 0x7F764FF4AE7FF0AELL) ^ TypeID)
                                 - ((2 * TypeID) & 0xFEEC9FE95CFFDFBCLL) == 0x7E6788073FFF7520)) ^ v0)))();
}

uint64_t sub_22D20B12C()
{
  int v0;
  uint64_t v1;
  Boolean Value;

  Value = CFNumberGetValue(*(CFNumberRef *)(v1 + 440), kCFNumberSInt64Type, &STACK[0x4B8]);
  return ((uint64_t (*)(void))qword_24F86A890[v0 ^ (4
                                                 * ((((2 * Value) & 0xFC) + (Value ^ 0xFE)) != ((v0 ^ 0x7F) - 64)))])();
}

uint64_t sub_22D20B17C(uint64_t a1)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((97 * (((v1 + 1771229929) | 0x149) ^ 0x177) - 716)
                                          * (**(_QWORD **)(a1 + 472) != 0)) ^ ((v1 + 1771229929) | 0x149)))
                            - 12))();
}

uint64_t sub_22D20B1E4@<X0>(unint64_t a1@<X0>, int a2@<W8>)
{
  int v2;
  int v3;
  unint64_t v4;
  int v5;

  v3 = (a2 ^ 0x3C8) << 6;
  v4 = sub_22D22F914(a1);
  STACK[0x3C0] = STACK[0x1868];
  if (LODWORD(STACK[0x1864]) == ((v3 + 209) ^ 0x151))
    v5 = 1;
  else
    v5 = v2;
  return ((uint64_t (*)(unint64_t))(qword_24F86A890[(v5 * (v3 - 49)) | v3] - 8))(v4);
}

uint64_t sub_22D20B240()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *(char **)(v2 + 464);
  *(_QWORD *)(v1 + 73) = v4 + 0x211A3D541E10AFE6;
  sub_22D22F9F8(aDssohglvsod54, v4, 0xFuLL);
  v5 = *(_QWORD *)(v2 + 464);
  *(_QWORD *)(v5 + 24) = 0;
  v5 += 24;
  *(_QWORD *)(v1 + 81) = v5;
  *(_DWORD *)(v5 + 8) = 860773951;
  *(_QWORD *)(v1 + 89) = v5 + 8;
  v6 = 591644117 * ((((v3 - 200) | 0x8B14B09692D2CF00) - ((v3 - 200) & 0x8B14B09692D2CF00)) ^ 0x6F0F905F09D78547);
  STACK[0x23F8] = qword_24F86A890[v0 + 39] - v6;
  STACK[0x2408] = *(_QWORD *)(v1 + 73);
  *(_DWORD *)(v3 - 176) = 1601233026 - v6 + v0 + 39;
  sub_22D227BBC(v3 - 200);
  return ((uint64_t (*)(_QWORD))qword_24F86A890[((*(_DWORD *)(v3 - 192) == 1415721421) * (v0 - 117)) ^ (v0 + 39 + ((16 * (v0 + 39)) ^ 0xE30) - 626)])(**(_QWORD **)(v1 + 81));
}

uint64_t sub_22D20B354(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)(((((v2 + 677) ^ 0x227) + 1771229876 + ((v2 - 1091715880) & 0xD77F6FCB) - 322)
                                     * (a1 == 0)) ^ (v2 + 677))))();
}

uint64_t sub_22D20B3B4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  uint64_t (*v5)(void);
  uint64_t v7;
  unint64_t v8;
  int v9;

  v3 = STACK[0xE7C];
  v4 = STACK[0xE8C];
  LODWORD(STACK[0x3BC]) = STACK[0xE8C];
  v7 = v1[352] - 253853821;
  v8 = (LODWORD(STACK[0x1070]) | ((unint64_t)(LODWORD(STACK[0x1070]) < 0xF21807DuLL) << 32)) + v7;
  v9 = v4 - LODWORD(STACK[0x16E0]) + 2041613779;
  v5 = (uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (v3 + 1771229888)) - 12);
  v1[12] = *(_QWORD *)(v0 + 8 * (v3 + 1771230056));
  LODWORD(STACK[0x5D0]) = v9 + 886527166;
  v1[18] = v8;
  v1[19] = (v4 | ((unint64_t)(v4 < 0xF21807D) << 32)) + v7;
  STACK[0x23F8] = (unint64_t)&STACK[0x5C8];
  *(_DWORD *)(v2 - 192) = 1431737413 * ((v2 - 2140286675 - 2 * ((v2 - 200) & 0x806DD1F5)) ^ 0x3E334EE7) + 40706419 + v3;
  sub_22D219DEC(v2 - 200);
  return v5();
}

uint64_t sub_22D20B3C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;

  return (*(uint64_t (**)(void))(a5
                              + 8 * ((((v6 + ((v5 - 1670169213) & 0x638CBFFB) - 563) ^ (v6 - 3)) * (a1 != 0)) | v5)))();
}

uint64_t sub_22D20B410@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  int v2;
  uint64_t (*v3)(void);

  v2 = a2 + 447;
  v3 = (uint64_t (*)(void))(2523737415
                         - (a2 ^ 0x966D2F78)
                         + *(_QWORD *)(a1
                                     + 8
                                     * ((((*(_DWORD *)STACK[0x17C0] - 860773964) > 0xFFFFFFF2) * (a2 - 549)) ^ a2)));
  LODWORD(STACK[0x774]) = v2;
  STACK[0x778] = 649823929;
  return v3();
}

uint64_t sub_22D20B488()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((27 * (v2 != 0)) ^ (v0 - 1771228683))) - 4))();
}

void sub_22D20B4E0()
{
  JUMPOUT(0x22D21006CLL);
}

void sub_22D20B50C()
{
  JUMPOUT(0x22D2078A8);
}

void sub_22D20B51C()
{
  JUMPOUT(0x22D20B590);
}

void sub_22D20B630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  _QWORD *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  unint64_t v16;

  v7 = (LODWORD(STACK[0xF64]) - 437) | 0x18C;
  v8 = STACK[0xF78];
  v9 = LODWORD(STACK[0xF78]) < (v7 ^ (v5 + 350));
  LODWORD(STACK[0x940]) = v7;
  LODWORD(STACK[0x944]) = v8;
  v6[124] = v9 << 32;
  v10 = v6[124];
  v11 = LODWORD(STACK[0x944]);
  LODWORD(STACK[0x950]) = v11;
  v12 = STACK[0x940];
  LODWORD(STACK[0x954]) = STACK[0x940];
  v13 = (v12 - 378) | 0x248;
  LODWORD(STACK[0x958]) = v13;
  v14 = v6[479] + v11 + v10 - 662509689;
  v15 = -711945521 * ((v14 ^ *(_DWORD *)(qword_255D671B8 + (int)(dword_255D671C4 & 0xDF3C6E9C))) & 0x7FFFFFFF);
  v16 = -711945521 * ((v15 >> (v13 - 108)) ^ v15);
  LOBYTE(STACK[0x61B]) = byte_22D24D690[v16 >> 24] ^ byte_22D250F00[(v16 >> 24) + 1] ^ byte_22D247430[v16 >> 24] ^ v16 ^ (-43 * BYTE3(v16)) ^ 0x80;
  v6[20] = *(_QWORD *)(a5 + 8 * (v12 + 914));
  v6[21] = v14 - 0xE550F9B8A5EBC69;
  JUMPOUT(0x22D2128A4);
}

uint64_t sub_22D20B754()
{
  int v0;
  unsigned int v1;
  unsigned int v2;
  _BOOL4 v3;
  int v4;
  _BOOL4 v5;
  uint64_t (*v6)(void);

  v0 = STACK[0x950];
  v1 = LODWORD(STACK[0x950]) - 398321309;
  v2 = LODWORD(STACK[0x144C]) - 800622708;
  LODWORD(STACK[0x95C]) = v2;
  v3 = v2 < 0xFBF31DB;
  LOBYTE(STACK[0x963]) = v3;
  v4 = (v1 < 0xFBF31DB) ^ v3;
  v5 = v1 < v2;
  if (v4)
    v5 = v2 < 0xFBF31DB;
  v6 = (uint64_t (*)(void))(qword_24F86A890[(88 * v5) ^ LODWORD(STACK[0x954])] - 12);
  LODWORD(STACK[0xAFC]) = STACK[0x954];
  LODWORD(STACK[0xB00]) = v0;
  return v6();
}

uint64_t sub_22D20B7D8@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t (*v4)(void);

  STACK[0x18E0] = *(_QWORD *)(v2 + 3824) + 0x5A72C1CEA1245FC3;
  v3 = LODWORD(STACK[0x144C]) - 737577104;
  LODWORD(STACK[0x18E8]) = v3;
  LOBYTE(STACK[0x18EF]) = v3 < 0x138131BF;
  v4 = (uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((199 * (v3 != a2 + 327233347)) ^ a2)) - 4);
  LODWORD(STACK[0x91C]) = a2;
  LODWORD(STACK[0x920]) = 894797239;
  return v4();
}

uint64_t sub_22D20B860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v10 = *v9 + 7 * (((v8 + 1310981752) | 0xB1C83908) ^ 0xFFEC395F) - 801;
  LODWORD(STACK[0x59C]) = 0;
  v11 = (void *)v9[478];
  *v9 = v10;
  v9[1] = (uint64_t)v11;
  v9[10] = (uint64_t)v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(a8 + 8 * (((v11 == &unk_22D250EEF) | (4 * (v11 == &unk_22D250EEF))) ^ v8))
                            - 8))();
}

uint64_t sub_22D20B8D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  _QWORD *v12;

  v12 = (unint64_t *)((char *)&STACK[0x23B0] + v9);
  v12[3] = 0xAE763C50EE97D81CLL;
  *v12 = 0xD896B8C93368D1FDLL;
  v12[1] = 0xAE763C50EE97D81CLL;
  v12[2] = 0xD896B8C93368D1FDLL;
  *(_QWORD *)(v11 + 4016) = (char *)&STACK[0x23B0] + v9 + 16;
  return ((uint64_t (*)(void))(*(_QWORD *)(a8
                                        + 8
                                        * ((222 * (LODWORD(STACK[0x144C]) != 1064811087)) ^ ((v10 + 1296089) | 0x340)))
                            - ((((v10 + 1296089) | 0x340) ^ (v8 + 831))
                             - v8
                             + 414)
                            + 410))();
}

void sub_22D20B9AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,int a23)
{
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  unsigned __int8 *v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  unsigned int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  unsigned int v49;
  int v50;
  int v51;
  int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  int v56;
  uint64_t v57;
  unsigned int v58;
  int v59;
  int v60;
  int v61;
  unsigned __int8 *v62;
  unsigned int v63;
  uint64_t v64;
  int v65;
  unsigned int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  unsigned int v74;
  uint64_t v75;

  v26 = 9 * (v23 ^ 0x1B7);
  v27 = *(unsigned __int8 **)(v25 + 4016);
  v28 = v27[5];
  v29 = byte_22D251B10[v28 ^ 0x3E];
  v30 = byte_22D249E90[v27[2] ^ 0x1CLL];
  v31 = v26 ^ v27[9] ^ byte_22D251B10[v27[9] ^ 0xFLL] ^ 0x2B;
  LODWORD(STACK[0x59C]) = 1876086006;
  v32 = (((v31 - ((2 * v31) & 0x5E)) << 16) + 1781465088) ^ 0x6A2F0000;
  v33 = v32 - ((2 * v32) & 0x2ECC0000);
  v34 = 25 * v30 - 2 * ((25 * (_BYTE)v30 + 12) & 0x3F ^ (25 * v30) & 1) + 10;
  LODWORD(v28) = ((((v28 ^ 0xD3 ^ v29) - ((2 * (v28 ^ 0xD3 ^ v29)) & 0xCE)) << 16)
                + 1214709760) ^ 0x48670000;
  v35 = ((((v34 ^ 8) - ((2 * v34) & 0x1AA)) << 8) + 941085952) ^ 0x3817D500;
  v36 = v27[4] ^ 0x5E ^ byte_22D248760[v27[4] ^ 0x58];
  v37 = (((v36 - ((2 * v36) & 0xF0)) << 24) + 2013265920) ^ 0x78000000;
  v38 = (v37 - ((2 * v37) & 0x6A000000) - 1244367600) ^ 0xB5D47510 | (v28 - ((2 * v28) & 0x29480000) - 1801160882) ^ 0x94A4774E;
  v39 = *v27 ^ byte_22D248760[*v27 ^ 0xF4];
  v40 = ((((v39 ^ 0xC9) - ((2 * v39) & 0x40)) << 24) - 1610612736) ^ 0xA0000000;
  v41 = (v40 - ((2 * v40) & 0x40000000) + 541279055) ^ 0x2043434F | (v35 - ((2 * v35) & 0x6543D800) + 849472710) ^ 0x32A1ECC6;
  v42 = *((unsigned __int8 *)&unk_22D247540 + (v27[7] ^ 0x5ALL)) ^ 0x1A;
  LODWORD(v28) = (v38 - ((2 * v38) & 0x76DFFF6) + 62324731) ^ 0x3B6FFFB | (v42 - ((2 * v42) & 0x13C) + 2121020830) ^ 0x7E6C359E;
  v43 = byte_22D249E90[v27[6] ^ 0xC6];
  v44 = v27[12] ^ 0x59 ^ byte_22D248760[v27[12] ^ 0xCBLL];
  v45 = ((v44 - ((2 * v44) & 0xA0)) << 24) + 1342177280;
  v46 = *((unsigned __int8 *)&unk_22D247540 + (v27[15] ^ 0xC7)) ^ 0x71;
  v47 = ((v45 ^ 0x50000000) - ((2 * v45) & 0x4A000000) + 634160166) ^ 0x25CC8426 | (v46 - ((2 * v46) & 0x74) + 568564794) ^ 0x21E39C3A;
  v48 = (25 * v43 - ((a22 + 50 * v43) & 0xF4) - 58) ^ 0xE1;
  v49 = (((v48 - ((2 * v48) & 0x15A)) << 8) - 239948544) ^ 0xF1B2AD00;
  v50 = byte_22D249E90[v27[10] ^ 0x45];
  v51 = 25 * v50 - ((a23 + 50 * v50) & 0x64);
  v52 = v27[8] ^ byte_22D248760[v27[8] ^ 0x60];
  v53 = ((((v52 ^ 0x82) - 2 * (v52 & 1)) << 24) - 2130706432) ^ 0x81000000;
  v54 = (((((v51 + 126) ^ 0xE) - (v24 & (2 * ((v51 + 126) ^ 0xE)))) << 8) - 784175360) ^ 0xD1426F00;
  v55 = (v53 + 301356078 + (~(2 * v53) | 0xDDFFFFFF) + 1) ^ 0x11F6542E | (v33 - 681119395) ^ 0xD766F15D;
  v56 = (v49 - ((2 * v49) & 0x439B1E00) - 1580363942) ^ 0xA1CD8F5A | (v28 - ((2 * v28) & 0x56911986) - 1421308733) ^ 0xAB488CC3;
  LODWORD(STACK[0x1490]) = (2 * v56) & 0x8AFDF18C;
  v57 = v27[13];
  LODWORD(STACK[0x1494]) = v56 - 981534522;
  v58 = (v54 - ((2 * v54) & 0x360A4A00) - 1694161520) ^ 0x9B052590 | (v55 - ((2 * v55) & 0x3552055C) + 447283886) ^ 0x1AA902AE;
  v59 = v57 ^ 0xB9 ^ byte_22D251B10[v57 ^ 0xBF];
  v60 = (((v59 - ((2 * v59) & 0x56)) << 16) + 1747648512) ^ 0x682B0000;
  v61 = (v47 - ((2 * v47) & 0x25E38DE8) + 317834996) ^ 0x12F1C6F4;
  v62 = *(unsigned __int8 **)(v25 + 4016);
  v63 = (v60 - ((2 * v60) & 0x22D20000) - 1855338192) ^ 0x9169C930 | v61;
  v64 = v62[14];
  LODWORD(v57) = *((unsigned __int8 *)&unk_22D247540 + (v27[3] ^ 0x62));
  LODWORD(v27) = (((((25 * byte_22D249E90[v64 ^ 0xF8] - ((50 * byte_22D249E90[v64 ^ 0xF8]) & 0xF8) + 48) ^ 0x74)
                  - ((2 * ((25 * byte_22D249E90[v64 ^ 0xF8] - ((50 * byte_22D249E90[v64 ^ 0xF8]) & 0xF8) + 48) ^ 0x74)) & 0x1E0)) << 8)
                - 1596854272) ^ 0xA0D1F000;
  v65 = (v63 - ((2 * v63) & 0x6DFDAC6) + 57666915) ^ 0x36FED63;
  v66 = (v62[11] ^ 0xBDE3FE30) + 2 * (v62[11] ^ 0xCF);
  v67 = ((v57 ^ 0xEB) - ((2 * (v57 ^ 0xEB)) & 0x72) + 1866592313) ^ 0x6F41F039 | (v41
                                                                                - ((2 * v41) & 0x585AF96A)
                                                                                - 1406305099) ^ 0xAC2D7CB5;
  LODWORD(v28) = v62[1] ^ 0xDF ^ byte_22D251B10[v62[1] ^ 0xCLL];
  LODWORD(v28) = ((((_DWORD)v28 - ((2 * (_DWORD)v28) & 0x9C)) << 16) + 1817051136) ^ 0x6C4E0000;
  LODWORD(v28) = v28 - ((2 * v28) & 0x59540000) + 749385377;
  LODWORD(STACK[0x14A0]) = v28;
  LODWORD(v28) = v28 ^ 0x2CAAB6A1;
  LODWORD(STACK[0x14A4]) = v28;
  v68 = v28 | (v67 - ((2 * v67) & 0x51A577B0) + 684899288) ^ 0x28D2BBD8;
  LODWORD(STACK[0x14A8]) = (2 * v68) & 0xF04EE54C;
  LODWORD(STACK[0x14AC]) = v68 - 131632474;
  v69 = (((2 * v66 - ((4 * (_BYTE)v66 + 4) & 0x78) + 87) ^ 4) + 104) & 0x46;
  v70 = *((unsigned __int8 *)&unk_22D247540 + v66 + v69 - 2 * v69 + 1109131556);
  v71 = (v58 - ((2 * v58) & 0xF0332C52) + 2014942761) ^ 0x78199629 | ((v70 ^ 0x1A) - ((2 * v70) & 0x108) + 138015876) ^ 0x839F484;
  v72 = v71 - ((2 * v71) & 0xF8C52990) + 2086835400;
  LODWORD(STACK[0x149C]) = v72;
  LODWORD(v27) = ((_DWORD)v27 - ((2 * (_DWORD)v27) & 0x286DE600) + 1962341356) ^ 0x74F6F3EC | v65;
  LODWORD(v27) = (_DWORD)v27 - ((2 * (_DWORD)v27) & 0x362B1506) - 1693087101;
  LODWORD(STACK[0x1498]) = (_DWORD)v27;
  LODWORD(STACK[0x14B0]) = v72 ^ 0xAEE3BBB1;
  LODWORD(STACK[0x14B4]) = v27 ^ 0x7FD7264E;
  *(_QWORD *)(v25 + 3920) = *(_QWORD *)(v25 + 8);
  *(_QWORD *)(v25 + 3928) = *(_QWORD *)(v25 + 80);
  LODWORD(v27) = LODWORD(STACK[0x144C]) + 848316829;
  LODWORD(STACK[0x14CC]) = (_DWORD)v27;
  *(_BYTE *)(v25 + 3947) = v27 < 0x720803EC;
  LODWORD(STACK[0xBBC]) = v26;
  LODWORD(STACK[0xBC0]) = 881066683;
  LODWORD(STACK[0xBC4]) = 331506550;
  LODWORD(STACK[0xBC8]) = -234986538;
  LODWORD(STACK[0xBCC]) = -2003029418;
  LODWORD(STACK[0xBD0]) = -839312248;
  *(_QWORD *)(v25 + 88) = 0;
  *(_QWORD *)(v25 + 32) = 0;
  *(_QWORD *)(v25 + 40) = 0;
  *(_QWORD *)(v25 + 56) = 0;
  *(_QWORD *)(v25 + 64) = 0;
  *(_QWORD *)(v25 + 16) = 0;
  *(_QWORD *)(v25 + 24) = 0;
  LODWORD(STACK[0xBD4]) = STACK[0xBD0];
  LODWORD(STACK[0xBD8]) = STACK[0xBCC];
  LODWORD(STACK[0xBDC]) = STACK[0xBC8];
  LODWORD(STACK[0xBE0]) = STACK[0xBC4];
  v73 = STACK[0xBC0];
  LODWORD(STACK[0xBE4]) = STACK[0xBC0];
  LODWORD(v27) = STACK[0xBBC];
  LODWORD(STACK[0xBE8]) = STACK[0xBBC];
  v74 = 40 * (v27 ^ 0x166);
  LODWORD(STACK[0xBEC]) = v74;
  v75 = v73 + (v74 ^ 0xCB7BFEDD);
  *(_QWORD *)(v25 + 1672) = v75;
  *(_QWORD *)(v25 + 512) = *(_QWORD *)(v25 + 3920) + v75;
  JUMPOUT(0x22D20E784);
}

void sub_22D20C1BC(void *a1)
{
  free(a1);
  JUMPOUT(0x22D20C1DCLL);
}

uint64_t sub_22D20C210()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)STACK[0x13A0] = STACK[0x564];
  *(_QWORD *)STACK[0x13A8] = v2;
  STACK[0x3C0] = STACK[0x1880];
  CFRelease((CFTypeRef)STACK[0x1780]);
  CFRelease((CFTypeRef)STACK[0x13B0]);
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)(((v0 ^ 0x1B5) - 1771230214) ^ 0x966D2F55 ^ (((v0 ^ 0x1B5) - 297) | 0x100) ^ v0 ^ 0x1B5))
                            - 4))();
}

uint64_t sub_22D20C410(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)((((((v2 + 530124480) & 0xE066F1E7) - 423) ^ 0x1BC) * (a1 == 0)) ^ v2))
                            - 4))();
}

uint64_t sub_22D20C454@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v4 = (a1 + 625) | 0xC1u;
  v5 = (uint64_t (*)(void))(*(_QWORD *)(v1
                                     + 8
                                     * ((884 * ((*(_DWORD *)(v2 + 16) - 860773958) < 0xFFFFFFF9)) ^ a1))
                         - ((v4 - 914) ^ (a1 - 100)));
  LODWORD(STACK[0xB24]) = v4;
  *(_QWORD *)(v3 + 1472) = 1681200716;
  return v5();
}

uint64_t sub_22D20C4B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  char v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(v1 + 1472);
  *(_QWORD *)(v1 + 1480) = v2;
  v3 = STACK[0xB24];
  LODWORD(STACK[0xB3C]) = LODWORD(STACK[0xB24]) ^ 0x966D2992;
  LODWORD(STACK[0xB40]) = v3 - 518;
  v2 -= 1681200716;
  v4 = *((_BYTE *)&STACK[0x461] + v2);
  LODWORD(STACK[0xB38]) = v3;
  LOBYTE(STACK[0xB47]) = v4;
  v5 = **(_QWORD **)(v1 + 3592) + v2;
  *(_QWORD *)(v1 + 1504) = v5;
  *(_QWORD *)(v1 + 512) = v5;
  *(_QWORD *)(v1 + 496) = *(_QWORD *)(v0 + 8 * (v3 + 23)) - 4;
  v6 = ((*(_QWORD *)(v1 + 512) - qword_255D671D0) & 0xFFFFFFFFFFFFFFF0) + qword_255D671C8;
  v7 = (*(uint64_t (**)(_QWORD, unint64_t *, uint64_t))(qword_255D671E8
                                                                      + 32 * *(unsigned __int8 *)(v6 + 8)
                                                                      + 8))(*(_QWORD *)v6, &STACK[0x7A3], 1);
  LOBYTE(STACK[0x767]) = STACK[0x7A3];
  return (*(uint64_t (**)(uint64_t))(v1 + 496))(v7);
}

uint64_t sub_22D20C524(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((228 * (a1 != 0)) ^ v2)) - (v2 ^ 0x143u) - 4))();
}

uint64_t sub_22D20C554(unint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  unint64_t v5;

  v4 = v2 - 323;
  v5 = sub_22D22F914(a1);
  STACK[0x3C0] = *(_QWORD *)(v3 + 3576);
  return ((uint64_t (*)(unint64_t))(qword_24F86A890[((v1 | (((v4 - LODWORD(STACK[0x135C])) | (LODWORD(STACK[0x135C]) - v4)) >= 0))
                                                                    * ((v4 + 296) ^ 0x122)) ^ (v4 + 672)]
                                                   - ((v4 + 167) ^ 0xABLL)))(v5);
}

uint64_t sub_22D20C5B8()
{
  int v0;
  int v1;

  LODWORD(STACK[0x2348]) = -1999002480;
  v1 = MGGetBoolAnswer();
  return ((uint64_t (*)(void))(qword_24F86A890[(524 * v1) ^ v0] - (((v0 ^ 0x1E9u) + 437) ^ 0x27ELL)))();
}

uint64_t sub_22D20C6E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a5 + 8 * ((170 * (STACK[0x2368] == 0)) ^ v5))
                            - ((199 * (v5 ^ 0x126u)) ^ 0x18ALL)))();
}

void sub_22D20C724(unint64_t a1)
{
  sub_22D22F914(a1);
  STACK[0x2368] = 0;
  LODWORD(STACK[0x2370]) = -1084420351;
  JUMPOUT(0x22D1F077CLL);
}

uint64_t sub_22D20C758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(a5
                                        + 8
                                        * ((28 * (((v5 + 1 == v6 + 12) ^ (116 * (v7 ^ 0x25) - 33)) & 1)) ^ (372 * (v7 ^ 0x425))))
                            - 8))();
}

uint64_t sub_22D20C7DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(a5
                                        + 8
                                        * ((138
                                          * (*(_DWORD *)(v7 + 24 * v5 - 0x6A14051C8) != v6 + ((4 * v8) ^ 0x1274) - 744)) ^ v8))
                            - 8))();
}

uint64_t sub_22D20C824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(a5
                                        + 8 * ((28 * (((v5 + 1 == v7 + 12) ^ (v6 - 33)) & 1)) ^ v6))
                            - 8))();
}

uint64_t sub_22D20C860@<X0>(int a1@<W8>)
{
  int v1;
  unint64_t v2;

  STACK[0x1738] = (unint64_t)&STACK[0x6618A9C996C09621];
  LODWORD(STACK[0x3A4]) = a1;
  v2 = sub_22D22F638((a1 - 1053363557), 0x32u, -843709004);
  STACK[0x4D8] = v2 + 0x222ACA0D7372C8AELL;
  return ((uint64_t (*)(void))(qword_24F86A890[(1773 * (((v1 - 104) ^ (v2 == 0)) & 1)) ^ v1]
                            - (v1 ^ 0x192u)
                            + 849))();
}

uint64_t sub_22D20C90C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  unsigned int v6;
  unint64_t *v7;
  int v8;
  uint64_t (*v9)(uint64_t, unint64_t *);

  LODWORD(STACK[0x308]) = 1216356586;
  LODWORD(STACK[0x1844]) = 148479638;
  v6 = (v5 & 0xB6FDAFEB ^ 0x966D2D48) + 825;
  v7 = &STACK[0x2270] + 3 * ((181 * (v5 & 0xB6FDAFEB ^ 0x966D2D48)) ^ 0xBA6C723C150314B4) - 0xF4556B43F094401;
  v8 = *((_DWORD *)v7 + 4);
  STACK[0x1848] = (unint64_t)(v7 + 2);
  v9 = (uint64_t (*)(uint64_t, unint64_t *))(*(_QWORD *)(a5
                                                                       + 8
                                                                       * (int)((95
                                                                              * (((v6 ^ (v8 == -1084420351)) & 1) == 0)) ^ ((v5 & 0xB6FDAFEB) + 1771230946)))
                                                           - 12);
  LODWORD(STACK[0xE98]) = v6;
  return v9(3210546945, &STACK[0x16A0]);
}

uint64_t sub_22D20C96C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a5 + 8 * v5) - 8))();
}

uint64_t sub_22D20C9C4()
{
  int v0;
  uint64_t v1;
  char *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (char *)STACK[0x1368];
  STACK[0x17B0] = STACK[0x1368] + 0x211A3D541E10AFE6;
  sub_22D22F9F8(aDssohglvsod54, v2, 0xFuLL);
  v3 = STACK[0x1368];
  *(_QWORD *)(v3 + 24) = 0;
  v3 += 24;
  STACK[0x17B8] = v3;
  *(_DWORD *)(v3 + 8) = 860773951;
  v4 = qword_24F86A890[v0];
  STACK[0x17C0] = v3 + 8;
  STACK[0x2408] = STACK[0x17B0];
  STACK[0x23F8] = v4
                - 591644117
                * ((2 * ((v1 - 200) & 0x227232F5C56AA7C0) - (v1 - 200) - 0x227232F5C56AA7C5) ^ 0x3996EDC3A190127CLL);
  *(_DWORD *)(v1 - 176) = 1601233026
                        - 591644117 * ((2 * ((v1 - 200) & 0xC56AA7C0) - (v1 - 200) + 982865979) ^ 0xA190127C)
                        + v0;
  sub_22D227BBC(v1 - 200);
  return ((uint64_t (*)(_QWORD))qword_24F86A890[v0 ^ (4
                                                              * (((v0 + 6) ^ (*(_DWORD *)(v1 - 192) == v0 + 1415721254)) & 1)) ^ 0x2C7])(*(_QWORD *)STACK[0x17B8]);
}

uint64_t sub_22D20CB04(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((((a1 == 0) ^ ((v2 & 0xD7) - 88)) & 1)
                                * ((((v2 & 0x28DF35D7) + 163) | 4) - 523)) ^ v2 & 0x28DF35D7)))();
}

uint64_t sub_22D20CB48(unint64_t a1)
{
  int v1;
  int v2;
  unint64_t v3;

  v3 = sub_22D22F914(a1);
  return ((uint64_t (*)(unint64_t))(2523737415
                                                   - (v2 - 260)
                                                   + qword_24F86A890[v2 ^ (75 * v1)]
                                                   - ((v2 - 697336509) & 0xBFFDADDB)
                                                   + 296))(v3);
}

uint64_t sub_22D20CBA4(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)(((((v2 + 1456721372) & 0xA92C31BD)
                                                + 1771229876
                                                + ((v2 - 1073890340) & 0xD66F6FCB)
                                                + 595)
                                               * (a1 == 0)) ^ v2))
                            - 4))();
}

uint64_t sub_22D20CC04@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;
  uint64_t (*v3)(void);

  v2 = a1 ^ 0x32;
  v3 = (uint64_t (*)(void))(*(_QWORD *)(v1
                                     + 8
                                     * ((891
                                       * ((((a1 ^ 0x32) - 1771230148) ^ 0x5ADC8CF9u) + *(_DWORD *)STACK[0x17C0] > 0xFFFFFFF0)) ^ a1))
                         - 8);
  LODWORD(STACK[0xA9C]) = v2;
  STACK[0xAA0] = 111747140;
  return v3();
}

uint64_t sub_22D20CC74(unint64_t a1)
{
  int v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  sub_22D22F914(a1);
  sub_22D22F9F8(byte_22D2507B0, (char *)STACK[0x1368], 0xDuLL);
  v3 = STACK[0x17B0];
  *(_QWORD *)STACK[0x17B8] = 0;
  *(_DWORD *)STACK[0x17C0] = 860773951;
  v4 = qword_24F86A890[v1 + 1771230044];
  v5 = 591644117
     * ((-2 - ((~(v2 - 200) | 0xCC8E7951834DA055) + ((v2 - 200) | 0x337186AE7CB25FAALL))) ^ 0x289559981848EA12);
  STACK[0x2408] = v3;
  STACK[0x23F8] = v4 - v5;
  *(_DWORD *)(v2 - 176) = -922504226 - v5 + v1;
  sub_22D227BBC(v2 - 200);
  return ((uint64_t (*)(_QWORD))(qword_24F86A890[(1399 * (*(_DWORD *)(v2 - 192) == 1415721421)) ^ (((v1 - 90101838) & 0x6EF1AFB6 ^ 0x5F8) + v1 + 1771230044)]
                                         - 12))(*(_QWORD *)STACK[0x17B8]);
}

uint64_t sub_22D20CC7C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int Length;
  unsigned int v5;
  void *v6;

  Length = CFDataGetLength(*(CFDataRef *)(v2 + 384));
  v5 = (((v0 ^ 0x46F) + 443) ^ 0xB3E37D87) + Length - ((2 * Length) & 0x67C6F84C) - 35;
  LODWORD(STACK[0x14D4]) = v5 ^ 0xCBE7327;
  LODWORD(STACK[0x4D0]) = v5 ^ 0xCBE7327;
  v6 = malloc_type_malloc(v5 ^ 0xB3E37C26, 0x8DF370BBuLL);
  *(_QWORD *)(v3 + 3952) = v6;
  return (*(uint64_t (**)(void))(v1 + 8 * (((v6 == 0) * (34 * (v0 ^ 0x46F) - 394)) ^ v0)))();
}

void sub_22D20CD9C()
{
  JUMPOUT(0x22D20B180);
}

uint64_t sub_22D20CDA4(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * (((v2 + 8 == ((v3 + 404) ^ 0x3407AB6F)) * (v4 + v5 + v3 - 241 + 1260)) ^ v3))
                            - 12))();
}

uint64_t sub_22D20CDE8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  *a3 = 0x1407747E8D0FC4A1;
  LODWORD(STACK[0x34C]) = dword_255D666E8 - 266572532;
  v7 = *(unsigned int *)(v4 + 1832);
  v5[12] = *(_QWORD *)(a2 + 8 * (v3 + 1771230046));
  LODWORD(STACK[0x5D0]) = v3 + 1853189419;
  LODWORD(STACK[0x5E0]) = 0;
  v5[14] = 1416753466;
  LODWORD(STACK[0x5E4]) = v3 + 1853189348;
  LODWORD(STACK[0x5E8]) = v3 + 1853189358;
  v5[17] = v7;
  *(_DWORD *)(v6 - 192) = 1431737413
                        * ((1814896354 - ((v6 - 200) | 0x6C2D1EE2) + ((v6 - 200) | 0x93D2E11D)) ^ 0x2D8C7E0F)
                        + 40706419
                        + v3;
  a3[56] = &STACK[0x5C8];
  sub_22D219DEC(v6 - 200);
  return ((uint64_t (*)(void))(qword_24F86A890[*(int *)(v6 - 188)] - 8))();
}

void sub_22D20CEEC()
{
  JUMPOUT(0x22D20CF04);
}

uint64_t sub_22D20D0B4@<X0>(uint64_t a1@<X4>, int a2@<W5>, uint64_t a3@<X6>, uint64_t a4@<X7>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int *v10;
  int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;

  v10 = (unsigned int *)(a3 + 4 * (v5 + v8));
  v11 = (a2 + ((a5 - 828) | 0x40C) - 1022) & v6;
  v12 = v5 + 1;
  v13 = *(_DWORD *)(a3 + 4 * (v12 + v8));
  v14 = ((v7
        - (((v13 & 0x7FFFFFFE ^ 0xF3545DA9) - 1) ^ 0xDCC069A0 | v7)
        + (((v13 & 0x7FFFFFFE ^ 0xF3545DA9) - 1) ^ 0xDCC069A0 | 0x21AA6D1C)) | v11) ^ 0x16B6ADC;
  *v10 = v10[397] ^ *((_DWORD *)&STACK[0x2238] + (v13 & 1)) ^ ((v14 - ((v9 + 2513) & (2 * v14)) - 1129259093) >> 1) ^ 0xD357AB74;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((1819 * (v12 == a4 + 3)) ^ a5)) - 12))();
}

uint64_t sub_22D20D190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  uint64_t v8;
  int8x16_t v9;
  const float *v10;
  int8x16_t v11;
  uint64_t v12;
  int8x16_t v13;
  int32x4_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int8x16_t v21;

  v10 = (const float *)(a7 + 908);
  v11 = (int8x16_t)vld1q_dup_f32(v10);
  v12 = 4 * (v7 - 416) - 1580;
  v13.i64[0] = 0x8000000080000000;
  v13.i64[1] = 0x8000000080000000;
  v14 = vdupq_n_s32(0xF409FC38);
  v9.i32[0] = *(_DWORD *)(a7 + v12);
  v9.i32[1] = *(_DWORD *)(a7 + 916);
  v9.i32[2] = *(_DWORD *)(a7 + 920);
  v15 = vextq_s8(v11, v9, 0xCuLL);
  v16 = v9;
  v16.i32[3] = *(_DWORD *)(a7 + 924);
  v17 = (int8x16_t)vaddq_s32((int32x4_t)veorq_s8(vandq_s8(v15, v13), (int8x16_t)vdupq_n_s32(0xAB5FD777)), vdupq_n_s32(0xD885CEB1));
  v18 = veorq_s8(vandq_s8(v16, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x6305BA7Au));
  v19 = (int32x4_t)veorq_s8((int8x16_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8(v18, (int8x16_t)vdupq_n_s32(0xBF603C7u)), (int32x4_t)vorrq_s8(v18, (int8x16_t)v14)), v14), (int8x16_t)vdupq_n_s32(0x6FE60375u));
  v20 = (int32x4_t)veorq_s8(vorrq_s8((int8x16_t)vaddq_s32(vsubq_s32((int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v19, v19), (int8x16_t)vdupq_n_s32(0x32577656u)), v19), vdupq_n_s32(0x66D444D4u)), veorq_s8(v17, (int8x16_t)vdupq_n_s32(0x83E5A628))), (int8x16_t)vdupq_n_s32(0x6E94CDD4u));
  v21.i32[0] = *(_DWORD *)(v8 + 4 * (*(_DWORD *)(a7 + v12) & 1));
  v21.i32[1] = *(_DWORD *)(v8 + 4 * (*(_DWORD *)(a7 + 916) & 1));
  v21.i32[2] = *(_DWORD *)(v8 + 4 * (*(_DWORD *)(a7 + 920) & 1));
  v21.i32[3] = *(_DWORD *)(v8 + 4 * (v16.i8[12] & 1));
  *(int8x16_t *)(a7 + 908) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)a7, v21), (int8x16_t)vdupq_n_s32(0xF17248E9)), (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vsubq_s32(v20, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v20, v20), (int8x16_t)vdupq_n_s32(0xF1F63122))), vdupq_n_s32(0xF8FB1891)), 1uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a5 + 8 * v7) - 8))();
}

void sub_22D20D338()
{
  JUMPOUT(0x22D20D254);
}

uint64_t sub_22D20D344@<X0>(int a1@<W3>, uint64_t a2@<X4>, _DWORD *a3@<X6>, int a4@<W8>)
{
  int v4;
  unsigned int v5;

  v4 = (*a3 & 0x7FFFFFFE ^ 0x64D9F6F6)
     + (*a3 & 0x4C657FA4 ^ 0x8240901)
     - ((*a3 & 0x7FFFFFFE ^ 0x64D9F6F6) & ((a1 + a4 - 623) ^ ((a4 - 2094005039) | 0x480B7811) ^ 0x11332DBE));
  v5 = (v4 | a3[623] & 0x80000000) ^ 0x27E9BA9B;
  a3[623] = a3[396] ^ *((_DWORD *)&STACK[0x2238] + (*a3 & 1)) ^ ((v5 - 2 * (v5 & 0x490BC93E ^ v4 & 4) - 921974470) >> 1) ^ 0xE98A203C;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * (int)(a4 ^ 0x8C ^ (1709
                                                           * ((LODWORD(STACK[0x34C])
                                                             + (unint64_t)~a4) >> 32))))
                            - 12))();
}

uint64_t sub_22D20D444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  LODWORD(STACK[0x34C]) = 0;
  return sub_22D1F6B20(a1, a2, a3, a4, a5);
}

uint64_t sub_22D20D458(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(a4
                                        + 8
                                        * ((14
                                          * ((*(char *)(*(_QWORD *)(v6 + 216)
                                                                    + (((v5 ^ 0x413D95CA)
                                                                      + v4
                                                                      - ((v5
                                                                        - a2
                                                                        - 612
                                                                        + 4 * LODWORD(STACK[0x16E4])
                                                                        + 858249993) & 0xB8E626FC)) ^ 0xDC73137F))
                                                          - 48) < 0xA)) ^ v5))
                            - 4))();
}

void sub_22D20D4EC()
{
  JUMPOUT(0x22D20D4FCLL);
}

uint64_t sub_22D20D570@<X0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X3>, int a4@<W8>)
{
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t (*v8)(void);

  v6 = v4 + 61143675;
  v7 = v5 - a2 + 551;
  v8 = *(uint64_t (**)(void))(a3 + 8 * ((237 * ((((v7 ^ 0x13E2AD24) + a4) & (v6 + 40043998)) >= 0)) ^ (a1 + v5 + 365)));
  LODWORD(STACK[0xA8C]) = v7;
  return v8();
}

uint64_t sub_22D20D650()
{
  int v0;
  uint64_t v1;
  unsigned __int16 v2;

  sub_22D22F914(*(_QWORD *)(v1 + 4008));
  STACK[0x220] = *(_QWORD *)(v1 + 4008);
  LODWORD(STACK[0x538]) = -45002;
  v2 = LOWORD(STACK[0x1770]) - ((2 * LOWORD(STACK[0x1770]) + 1154) & 0x1F9C) + 4623;
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t))qword_24F86A890[(v0 + 1771229878) ^ 0x288 ^ (342 * (((unsigned __int16)((v2 ^ 0xFCE ^ (v0 - 11594)) & (v2 ^ 0xFCE)) >> (31 - __clz(v2 ^ 0xFCE ^ (unsigned __int16)(v0 - 11594) | ((_WORD)v0 + 13936) & 0x9ECD ^ 0x288))) & 1))])(0, 1771229876, 2523737419);
}

void sub_22D20D688(char a1@<W8>)
{
  char v1;
  uint64_t v2;
  int v3;
  char v4;
  unsigned int v5;
  unint64_t v6;

  v3 = STACK[0xA8C];
  LODWORD(STACK[0xA90]) = STACK[0xA8C];
  LODWORD(STACK[0xA94]) = v3 - 551;
  LODWORD(STACK[0xA98]) = (v3 - 2111231454) | 0x14440102;
  v4 = (v1 + ((v3 + 34) | 2) - 109) | (16 * a1 - ((32 * a1 + 96) & 0x40) + 94) ^ 0x2E;
  v5 = -711945521
     * (((*(_DWORD *)(v2 + 4008) + LODWORD(STACK[0x16E4]) - 1301986795) ^ *(_DWORD *)(qword_255D671B8
                                                                                    + (dword_255D671C4 & 0x58B8A3F0))) & 0x7FFFFFFF);
  v6 = -711945521 * (v5 ^ HIWORD(v5));
  LOBYTE(STACK[0x61B]) = byte_22D249F90[v6 >> 24] ^ byte_22D24A6A0[(v6 >> 24) + 3] ^ byte_22D24B8E0[(v6 >> 24) + 2] ^ v6 ^ (-39 * BYTE3(v6)) ^ (v4 - ((2 * v4) & 0x4C) - 90) ^ 0xA6;
  JUMPOUT(0x22D21289CLL);
}

void sub_22D20D814()
{
  JUMPOUT(0x22D20D84CLL);
}

void sub_22D20D8CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  _QWORD *v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v5 = STACK[0xE98];
  LODWORD(STACK[0xE9C]) = STACK[0xE98];
  LODWORD(STACK[0xEA0]) = v5 - v3 - 829;
  v6 = (v5 - v3 + 1082183399) & 0xBF7F2DDB;
  LODWORD(STACK[0xEA4]) = v6;
  v7 = *(_QWORD *)(a2 + 152) + 24 * v2;
  v4[296] = v7;
  LOBYTE(v7) = *(_BYTE *)(v7 - 0x6618A9C996C073B1);
  v8 = STACK[0x4D8];
  v4[297] = STACK[0x4D8];
  v9 = LODWORD(STACK[0x1844]);
  LODWORD(STACK[0xEB8]) = v9 + (v6 ^ 0xB0B04865);
  v10 = (v9 | ((unint64_t)(v9 < 0x8D99E96) << 32)) + v8;
  LODWORD(v8) = -711945521
              * (((v9 + v8 - 148479638) ^ *(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x4D48DDF4))) & 0x7FFFFFFF);
  v11 = -711945521 * (v8 ^ WORD1(v8));
  LOBYTE(STACK[0x61B]) = v7 ^ byte_22D2507C0[v11 >> 24] ^ byte_22D24CF70[(v11 >> 24) + 1] ^ byte_22D246D10[(v11 >> 24) + 2] ^ v11 ^ (-55 * BYTE3(v11)) ^ 0xDA;
  v4[21] = v10 - 0x222ACA0D7C4C6744;
  JUMPOUT(0x22D2128A0);
}

uint64_t sub_22D20DA24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;

  STACK[0x3F0] = STACK[0x4D8];
  LODWORD(STACK[0x378]) = STACK[0x3A4];
  return ((uint64_t (*)(void))(*(_QWORD *)(a5
                                        + 8
                                        * (int)((((((v5 - 1772502866) & 0x69A63FDF) + 300266666) & 0xEE1A4B9D)
                                               + ((v5 - 1772502866) & 0x69A63FDF ^ 0xFFFFFFF5)) ^ (v5 - 1772502866) & 0x69A63FDF))
                            - 8))();
}

uint64_t sub_22D20DAEC(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = sub_22D22F914(a1);
  STACK[0x2380] = 0;
  LODWORD(STACK[0x2388]) = -1084420351;
  return sub_22D20C6E0(v1, v2, v3, v4, (uint64_t)qword_24F86A890);
}

uint64_t sub_22D20DB20()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)(((((**(_QWORD **)(v2 + 280) == 0) ^ (((v0 + 60) & 0xFD) - 88)) & 1)
                                     * (((((v0 + 1978307644) & 0xF3A83FFD) + 163) | 4) - 523)) ^ (v0 + 1978307644) & 0xF3A83FFD)))();
}

void sub_22D20DB28()
{
  JUMPOUT(0x22D20DB9CLL);
}

uint64_t sub_22D20DC34(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(uint64_t, unint64_t *))(*(_QWORD *)(v2
                                                                          + 8
                                                                          * (((16 * (v3 == 0)) | (32 * (v3 == 0))) ^ (v1 - 1771229099)))
                                                              - 12))(a1, &STACK[0x16A0]);
}

void sub_22D20DC74()
{
  sub_22D22F914(STACK[0x4D8] - 0x222ACA0D7372C8AELL);
  JUMPOUT(0x22D20DA58);
}

void sub_22D20DCBC()
{
  uint64_t v0;
  int v1;

  LODWORD(STACK[0x2A0]) = v1 + 1391871257;
  LODWORD(STACK[0x290]) = v1 - 685788568;
  STACK[0x2A8] = *(_QWORD *)(v0 + 159);
  *(int32x4_t *)&STACK[0x230] = vdupq_n_s32(0x90AA2324);
  *(int32x4_t *)&STACK[0x240] = vdupq_n_s32(0x88F132AE);
  *(int32x4_t *)&STACK[0x210] = vdupq_n_s32(0xC595526E);
  *(int32x4_t *)&STACK[0x220] = vdupq_n_s32(0xA7A0E94B);
  *(int32x4_t *)&STACK[0x200] = vdupq_n_s32(0x769655F8u);
  JUMPOUT(0x22D202408);
}

uint64_t sub_22D20DF8C@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (int)(((((STACK[0x2290] == 0) ^ (a2 + 116)) & 1)
                                     * ((a2 - 1771078362) & 0xFFFDAD4F ^ 0x966D2D74)) ^ a2)))();
}

void sub_22D20DFF4(unint64_t a1)
{
  uint64_t v1;

  sub_22D22F914(a1);
  STACK[0x2290] = *(_QWORD *)(v1 + 145);
  JUMPOUT(0x22D1F4EF8);
}

uint64_t sub_22D20E038()
{
  int v0;
  uint64_t v1;
  char *v2;
  CFStringEncoding SystemEncoding;
  CFStringRef v4;

  LODWORD(STACK[0x2270]) = -1999002470;
  v2 = off_255D666F8;
  LOBYTE(STACK[0x2251]) = *off_255D666F8 + ((v0 + 47) ^ 0x5D);
  LOBYTE(STACK[0x2252]) = v2[1] - 37;
  LOBYTE(STACK[0x2253]) = v2[2] - 37;
  LOBYTE(STACK[0x2254]) = v2[3] + (v0 ^ 0x8C);
  LOBYTE(STACK[0x2255]) = v2[4] - 37;
  LOBYTE(STACK[0x2256]) = v2[5] - 37;
  LOBYTE(STACK[0x2257]) = v2[6] - 37;
  LOBYTE(STACK[0x2258]) = v2[7] - 37;
  LOBYTE(STACK[0x2259]) = v2[8] - 37;
  LOBYTE(STACK[0x225A]) = v2[9] - 37;
  LOBYTE(STACK[0x225B]) = v2[10] - 37;
  LOBYTE(STACK[0x225C]) = v2[11] - 37;
  LOBYTE(STACK[0x225D]) = v2[12] - 37;
  LOBYTE(STACK[0x225E]) = v2[13] - 37;
  LOBYTE(STACK[0x225F]) = v2[14] - 37;
  LOBYTE(STACK[0x2260]) = v2[15] - 37;
  LOBYTE(STACK[0x2261]) = v2[16] - 37;
  LOBYTE(STACK[0x2262]) = v2[17] - 37;
  LOBYTE(STACK[0x2263]) = v2[18] - 37;
  LOBYTE(STACK[0x2264]) = v2[19] - 37;
  LOBYTE(STACK[0x2265]) = v2[20] - 37;
  LOBYTE(STACK[0x2266]) = v2[21] - 37;
  LOBYTE(STACK[0x2267]) = off_255D666F8[22] - 37;
  SystemEncoding = CFStringGetSystemEncoding();
  v4 = CFStringCreateWithCString(0, (const char *)&STACK[0x2251], SystemEncoding);
  *(_QWORD *)(v1 + 4032) = v4;
  return ((uint64_t (*)(void))(qword_24F86A890[(724 * (v4 != 0)) ^ v0] - 8))();
}

uint64_t sub_22D20E1C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v7;

  v7 = MGCopyAnswer();
  STACK[0x1820] = v7;
  return (*(uint64_t (**)(void))(a5 + 8 * (((v7 != 0) * (((v5 + 231) ^ 0x23A) - 315)) ^ v5)))();
}

uint64_t sub_22D20E20C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  CFTypeID v5;
  uint64_t v6;
  uint64_t v7;
  CFTypeID TypeID;
  _BOOL4 v9;

  v4 = STACK[0x3C0];
  v3[506] = STACK[0x3C0];
  v3[507] = (char *)&STACK[0x19D0] + v4;
  STACK[0x3C0] = v4 + 64;
  v3[508] = (16 * (((unint64_t)&STACK[0x19D0] + v4) & 1)) ^ 0x7FDCEBE57FFF7AFALL;
  v5 = CFGetTypeID(*(CFTypeRef *)(v2 + 384));
  v6 = v5 ^ 0x7FD780FFBC7F70FDLL;
  v7 = (((v0 - 882694029) & 0x349CD6FF) - 0x50FE00870120E6) & (2 * v5);
  TypeID = CFStringGetTypeID();
  v9 = v6 + (TypeID ^ 0xB80810004C8E0020) + v7 - ((2 * TypeID) & 0x8FEFDFFF66E3FFBELL) == 0x37DF9100090D711DLL;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v9 | (16 * v9)) ^ v0)) - 4))();
}

uint64_t sub_22D20E2FC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  CFIndex Length;
  uint64_t v5;
  void *v6;

  v3 = v0 - 535;
  Length = CFStringGetLength(*(CFStringRef *)(v2 + 384));
  v5 = ((((v3 - 268) | 0x84u) + 0x7F3CEFDFA7BDFB30) & (2 * Length)) + (Length ^ 0x3F9E77EFD3DEFDFFLL);
  *(_QWORD *)(v2 + 160) = v5;
  v6 = malloc_type_malloc(v5 - 0x3F9E77EFD3DEFDFELL, 0x9EBEB066uLL);
  *(_QWORD *)(v2 + 168) = v6;
  STACK[0x558] = (unint64_t)v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((819 * (v6 != 0)) ^ v3)) - 12))();
}

uint64_t sub_22D20E3AC()
{
  int v0;
  CFIndex v1;
  CFStringEncoding SystemEncoding;
  Boolean CString;

  SystemEncoding = CFStringGetSystemEncoding();
  CString = CFStringGetCString((CFStringRef)STACK[0x1820], (char *)STACK[0x1748], v1, SystemEncoding);
  return ((uint64_t (*)(void))(qword_24F86A890[((((((_WORD)v0 - 9975) & 0x26B9 ^ 0xE) & 0x1FF) != (2 * (CString & 0x1F) + (CString ^ 0x9F)))
                                             * (v0 ^ 0x35D)) ^ v0]
                            - 12))();
}

uint64_t sub_22D20E438()
{
  unsigned int v0;
  uint64_t v1;
  int v2;
  unint64_t v3;

  v2 = LODWORD(STACK[0x1740]) - ((2 * LODWORD(STACK[0x1740]) + 1480721412) & 0x7EBA1E02) - 344059645;
  LODWORD(STACK[0x4D0]) = v2;
  v3 = sub_22D22F638(v2 ^ (((v0 + 281903150) ^ 0x10CD831E) - 1084421280), 0x32u, -1293645864);
  *(_QWORD *)(v1 + 504) = v3;
  return ((uint64_t (*)(void))(qword_24F86A890[(95 * (v3 == 0)) ^ v0] - ((v0 + 281903150) & 0xEF327F6F ^ 0x23)))();
}

void sub_22D20E4E8(int a1@<W8>)
{
  unint64_t v1;

  STACK[0x210] = v1;
  LODWORD(STACK[0x404]) = a1;
  JUMPOUT(0x22D20E544);
}

uint64_t sub_22D20E5A4(void *a1, uint64_t a2, int a3)
{
  int v3;

  v3 = (a3 + 1350290476) & 0x191707DE;
  free(a1);
  return ((uint64_t (*)(void))(qword_24F86A890[(LODWORD(STACK[0x2BC]) == 0) | (8 * (LODWORD(STACK[0x2BC]) == 0)) | v3]
                            - ((v3 + 304) ^ 0x28ALL)))();
}

void sub_22D20E5C8()
{
  JUMPOUT(0x22D20E5D4);
}

uint64_t sub_22D20E648@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((413 * (a2 == ((v2 - 1775698167) | 0x442C02) + ((v2 + 454) ^ 0x28EFE5D6))) ^ v2))
                            - 8))();
}

uint64_t sub_22D20E69C()
{
  int v0;
  uint64_t v1;
  unint64_t v2;

  v2 = sub_22D22F638(25, 0x32u, -50786942);
  *(_QWORD *)(v1 + 145) = v2;
  return ((uint64_t (*)(void))(qword_24F86A890[((v2 != 0) * (((v0 + 34086971) | 0x9465090A) + 1771229904)) ^ v0] - 12))();
}

void sub_22D20E704()
{
  int v0;
  int v1;
  _QWORD *v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  STACK[0x17F8] = (unint64_t)&STACK[0x2290];
  LODWORD(STACK[0x1230]) = v1;
  LODWORD(STACK[0x1234]) = 1906197969;
  v3 = STACK[0x1234];
  LODWORD(STACK[0x1238]) = STACK[0x1234];
  v4 = STACK[0x1230];
  LODWORD(STACK[0x123C]) = STACK[0x1230];
  v5 = v0 + v4;
  LODWORD(STACK[0x1240]) = v5 + 1123;
  LODWORD(STACK[0x1244]) = v5 + 1143;
  v6 = *(_QWORD *)STACK[0x17F8];
  v7 = v5 + 1123 + v3 - 1906199091;
  v2[412] = v7;
  v8 = v6 + v7;
  v2[413] = v8;
  v2[64] = v8;
  JUMPOUT(0x22D20E780);
}

uint64_t sub_22D20E794(void *a1, uint64_t a2, int a3)
{
  int v3;
  int v4;

  v4 = v3 + a3 + 343;
  free(a1);
  return ((uint64_t (*)(void))(qword_24F86A890[(LODWORD(STACK[0x32C]) == 0) | (8 * (LODWORD(STACK[0x32C]) == 0)) | v4]
                            - ((v4 + 304) ^ 0x28ALL)))();
}

void sub_22D20E7A8()
{
  free((void *)STACK[0x558]);
  JUMPOUT(0x22D20E7C0);
}

void sub_22D20E7F4()
{
  uint64_t v0;
  uint64_t v1;

  LODWORD(STACK[0x2298]) = STACK[0x4D0];
  STACK[0x2290] = STACK[0x210];
  *(_QWORD *)(v0 + 136) = *(_QWORD *)(v1 + 4048);
  CFRelease((CFTypeRef)STACK[0x1820]);
  JUMPOUT(0x22D209A34);
}

uint64_t sub_22D20E84C()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  CFTypeID v3;
  uint64_t v4;
  unint64_t v5;
  CFTypeID TypeID;

  v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 384));
  v4 = v3 ^ 0x7CD7AEFFAF7EA9F9;
  v5 = (2 * v3) & 0xF9AF5DFF5EFD53F2;
  TypeID = CFDataGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((13
                                          * (v4
                                           + (TypeID ^ 0x8042430001011422)
                                           + v5
                                           - ((TypeID << ((((v0 + 28) ^ 0x9C) + 29) ^ (v0 + 28) & 0x7F)) & 0xFF7B79FFFDFDD7BALL) != 0xFD19F1FFB07FBE1BLL)) | v0))
                            - 4))();
}

uint64_t sub_22D20E910(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t (*v7)(void);

  v5 = v2 ^ 0x36Fu;
  v6 = *(_QWORD *)(v3 + 160) - 0x3F9E77EFC62B1F43;
  *(_QWORD *)(v3 + 176) = v6;
  *(_BYTE *)(v3 + 191) = v6 < 0xDB3DEBC;
  v7 = *(uint64_t (**)(void))(a2 + 8 * ((7 * (v6 != v5 + 229891566)) ^ v2));
  LODWORD(STACK[0xC94]) = v2;
  v4[230] = 0x3081ED007F51831CLL;
  v4[231] = 0x6CA136CB00122A6FLL;
  v4[232] = 0x7975D2058432647FLL;
  LODWORD(STACK[0xE90]) = v5;
  return v7();
}

void sub_22D20E9C0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;

  v2 = v1[232];
  v1[233] = v2;
  v3 = v1[231];
  v1[234] = v3;
  v1[235] = v1[230];
  v4 = STACK[0xC94];
  LODWORD(STACK[0xCCC]) = STACK[0xC94];
  v5 = (v4 - 1624555202) & 0x60D4BBEE;
  LODWORD(STACK[0xCD0]) = v5;
  v6 = v3 + *(_QWORD *)(v0 + 504) - 0x6CA136CB00122A6FLL;
  v7 = ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ v6) & 0x7FFFFFFF) * (v5 ^ 0xD5909201);
  v8 = -711945521 * (v7 ^ HIWORD(v7));
  LOBYTE(STACK[0x61B]) = byte_22D250CE0[v8 >> 24] ^ *(_BYTE *)(v2 + *(_QWORD *)(v0 + 168) - 0x7975D2058432647FLL) ^ byte_22D2508C0[(v8 >> 24) + 2] ^ byte_22D24A5A0[v8 >> 24] ^ v8 ^ (23 * BYTE3(v8));
  v1[21] = v6;
  JUMPOUT(0x22D2128A0);
}

void sub_22D20EACC()
{
  sub_22D20E4E8(0);
}

uint64_t sub_22D20EAEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  v7 = v5 - 1405730735;
  v8 = *(_QWORD *)(v6 + 1392) + 1;
  v9 = *(uint64_t (**)(void))(a5
                           + 8
                           * ((439
                             * (((v5 ^ 0xC5A4EC3F ^ (((v8 - v5) | (unint64_t)(v5 - v8)) >> 63)) & 1) == 0)) ^ ((int)v5 - 1405731450 + (int)v5 - 1405730735)));
  LODWORD(STACK[0xACC]) = v7;
  *(_QWORD *)(v6 + 1384) = v8;
  return v9();
}

void sub_22D20EB4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v7 = v6[173];
  v6[174] = v7;
  v8 = STACK[0xACC];
  LODWORD(STACK[0xAE0]) = STACK[0xACC];
  LODWORD(STACK[0xAE4]) = v8 - 1771230330;
  LODWORD(STACK[0xAE8]) = (v8 + 1405156987) | 0x8C134;
  v7 -= 1405731175;
  LOBYTE(STACK[0xAEF]) = *(_BYTE *)(STACK[0x1870] + v7);
  v9 = **(_QWORD **)(v5 + 81) + v7;
  v6[177] = v9;
  v6[64] = v9;
  v6[62] = *(_QWORD *)(a5 + 8 * (v8 ^ 0x4D1)) - 8;
  JUMPOUT(0x22D215040);
}

uint64_t sub_22D20EC50(void *a1)
{
  int v2;
  int v3;

  v3 = v2 ^ (v2 + 100);
  free(a1);
  return ((uint64_t (*)(void))(qword_24F86A890[(310 * (LODWORD(STACK[0x508]) == ((v3 + 45) | 0x40) - 337)) ^ v3] - 12))();
}

void sub_22D20EC64()
{
  LODWORD(STACK[0x38C]) = 0;
  JUMPOUT(0x22D20ECF0);
}

uint64_t sub_22D20ED2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  int v14;
  unsigned int v15;

  v15 = (v14 - 1899167111) & 0xDAC5D0FF;
  free(a14);
  return ((uint64_t (*)(void))(qword_24F86A890[(945 * (LODWORD(STACK[0x3F8]) == 0)) ^ v15] - ((v15 + 868) ^ 0x42CLL)))();
}

uint64_t sub_22D20EDCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, CFTypeRef a17, uint64_t a18, uint64_t a19, CFTypeRef cf)
{
  int v20;
  uint64_t v21;

  LODWORD(STACK[0x2280]) = STACK[0x53C];
  *(_QWORD *)(v21 + 64) = a13;
  STACK[0x3C0] = a16;
  CFRelease(cf);
  CFRelease(a17);
  return ((uint64_t (*)(void))(qword_24F86A890[((((((v20 + 828) | 0x28) - 1872164831) | 0x6042102) ^ 0x6992D3A7)
                                             + ((((v20 + 828) | 0x28) + 1001126743) & 0xC45401D7)) ^ ((v20 + 828) | 0x28)]
                            - 4))();
}

void sub_22D20EE78(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;

  v4 = v2[130];
  v2[131] = v4;
  v5 = v2[129];
  v2[132] = v5;
  v2[133] = v2[128];
  v6 = STACK[0x964];
  LODWORD(STACK[0x99C]) = STACK[0x964];
  LODWORD(STACK[0x9A0]) = v6 ^ 0xCA;
  v7 = v5 + v2[452] - 0x3CCAC7EAD325308FLL;
  v8 = -711945521 * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ v7) & 0x7FFFFFFF);
  v9 = -711945521 * (v8 ^ HIWORD(v8));
  v10 = v9 >> ((v6 ^ 0xCAu) - 14);
  LOBYTE(STACK[0x61B]) = byte_22D249F90[v10] ^ *(_BYTE *)(v4 + *(_QWORD *)(v3 + 520) - 0x32F37C80C25F3A11) ^ byte_22D24A6A0[v10 + 3] ^ byte_22D24B8E0[v10 + 2] ^ v9 ^ (-39 * v10);
  v2[20] = *(_QWORD *)(a2 + 8 * (v6 + 1119)) - 12;
  v2[21] = v7;
  JUMPOUT(0x22D2128A4);
}

uint64_t sub_22D20EF88()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  BOOL v6;
  char v7;
  char v8;
  char v9;
  uint64_t (*v10)(void);

  v1 = v0[132] + 1;
  v2 = v0[131] + 1;
  v3 = v0[133];
  v4 = v3 + 1;
  v3 -= 0x97D3CAFB1D2A11;
  v5 = v3 < 0x960F27C9;
  v6 = v3 >= STACK[0x17C8];
  v7 = STACK[0x17D7];
  v8 = LOBYTE(STACK[0x17D7]) ^ v5;
  v9 = !v6;
  if ((v8 & 1) == 0)
    v7 = v9;
  v10 = (uint64_t (*)(void))(qword_24F86A890[(22 * (v7 & 1)) ^ LODWORD(STACK[0x99C])] - 12);
  LODWORD(STACK[0x964]) = STACK[0x99C];
  v0[128] = v4;
  v0[129] = v1;
  v0[130] = v2;
  return v10();
}

uint64_t sub_22D20F028()
{
  unint64_t v0;

  STACK[0x4A8] = v0;
  STACK[0x510] = STACK[0x2A8];
  return ((uint64_t (*)(unint64_t))STACK[0x210])(STACK[0x220]);
}

uint64_t sub_22D20F04C(void *a1)
{
  int v1;
  int v2;

  v2 = v1 ^ (v1 - 188);
  free(a1);
  return ((uint64_t (*)(void))qword_24F86A890[(986 * (LODWORD(STACK[0x41C]) == ((v2 + 60) | 0x35) - 565)) ^ v2])();
}

uint64_t sub_22D20F0E8@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v5 = v1 + 113 - a1;
  LODWORD(STACK[0x22B0]) = STACK[0x40C];
  *(_QWORD *)(v2 + 112) = STACK[0x230];
  CFRelease(*(CFTypeRef *)(v4 + 3864));
  CFRelease(*(CFTypeRef *)(v4 + 4088));
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((321 * (((v5 + 588) | 0x18) == 0x499)) ^ v5))
                            - ((v5 + 11) ^ 0x248)))();
}

uint64_t sub_22D20F16C()
{
  int v0;
  int v1;
  int v2;
  io_registry_entry_t v3;

  v2 = 583 * (v1 ^ (v0 - 889) ^ (v0 - 2));
  LODWORD(STACK[0x22A0]) = -1999002472;
  v3 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/product");
  return ((uint64_t (*)(void))(qword_24F86A890[(106 * (((2 * v3) & 0xEF7FFCCC) + (v3 ^ 0xF7BFFE66) != (v2 ^ 0xF7BFFAE8))) ^ v1]
                            - 12))();
}

void sub_22D20F28C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;
  unint64_t v6;

  v1 = *(_QWORD *)(v0 + 1104);
  *(_QWORD *)(v0 + 1112) = v1;
  v2 = *(_QWORD *)(v0 + 1096);
  *(_QWORD *)(v0 + 1120) = v2;
  *(_QWORD *)(v0 + 1128) = *(_QWORD *)(v0 + 1088);
  v3 = STACK[0x9A4];
  LODWORD(STACK[0x9D8]) = STACK[0x9A4];
  v4 = 79 * (v3 ^ 0x29F);
  LODWORD(STACK[0x9DC]) = v4;
  v5 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ (v2 + *(_DWORD *)(v0 + 3776) + 981217117)) & 0x7FFFFFFF);
  v6 = -711945521 * ((v5 >> (v4 + 114)) ^ v5);
  LOBYTE(STACK[0x61B]) = byte_22D250CE0[v6 >> 24] ^ *(_BYTE *)(v1 + *(_QWORD *)(v0 + 3848) - 0x27BFCF849EEA5946) ^ byte_22D2508C0[(v6 >> 24) + 2] ^ byte_22D24A5A0[v6 >> 24] ^ v6 ^ (23 * BYTE3(v6));
  JUMPOUT(0x22D20F390);
}

uint64_t sub_22D20F3A0()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1[139];
  v3 = v1[141];
  v4 = v3 - 0x25C7D962A09DD829 < STACK[0x1828];
  if (((LOBYTE(STACK[0x1837]) ^ ((unint64_t)(v3 - 0x25C7D962A09DD829) < 0x73192F8)) & 1) != 0)
    v4 = LOBYTE(STACK[0x1837]);
  v5 = STACK[0x9D8];
  v6 = qword_24F86A890[(41 * (v0 & ~v4)) ^ LODWORD(STACK[0x9D8])];
  v7 = v1[140] + 1;
  LODWORD(STACK[0x894]) = STACK[0x9DC];
  LODWORD(STACK[0x9A4]) = v5;
  v1[136] = v3 + 1;
  v1[137] = v7;
  v1[138] = v2 + 1;
  return ((uint64_t (*)(void))(v6 - 8))();
}

uint64_t sub_22D20F440@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8 * (int)(((a1 - 557 + ((a1 + 1306392465) & 0xB222076A) - 220) * v2) ^ a1))
                            - 4))();
}

uint64_t sub_22D20F5D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a5
                                        + 8 * (int)(((((v5 + 55932845) & 0xFCAA8AD3) - 614) * (a1 == 0)) ^ (v5 + 584)))
                            - 4))();
}

uint64_t sub_22D20F61C@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  char v2;
  uint64_t v3;

  STACK[0x3C0] = *(_QWORD *)(v3 + 3576);
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (int)(((((a2 - 1083217186) & 0xD6FDBFEB) + 1771229918) * ((v2 & 1) == 0)) ^ a2))
                            - ((8 * a2) ^ 0x1400)))();
}

uint64_t sub_22D20F680()
{
  int v0;
  int v1;
  unsigned int v2;
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v0 = LOBYTE(STACK[0x767]);
  v1 = STACK[0x9F4];
  v2 = (v1 - ((2 * v1 + 70) & 0xFFFFFFCA) + 8) ^ (LODWORD(STACK[0xA00]) + 26);
  v3 = (101 * v2) ^ 0x7D;
  v4 = (-54 * v2) & 0xFA;
  v5 = ((2 * (STACK[0x9F0] & 1 | (2 * (STACK[0x9F0] & 1)))) ^ 0xFFBF5D7B)
     + 4235909
     + (((LODWORD(STACK[0x9F0]) ^ 1) - ((2 * LODWORD(STACK[0x9F0]) + 1255375492) & 0x725914AC) - 1634317416) ^ 0xB92C8A56);
  v6 = ((2 * v5) & 0x7FBCFDFC) + (v5 ^ 0xBFDE7EFE);
  LODWORD(STACK[0xA04]) = v6 + 1521991616;
  v7 = LODWORD(STACK[0x9F8]) ^ 0x148A2F0D ^ ((~(2 * (v0 + v4 + v3 - 69)) | 0xFFFFFFC5)
                                           + (v0 + v4 + v3 - 69)
                                           + 2112378142);
  v8 = v7 - ((2 * v7 - 687666590) & 0xD2C4F420) - 723255487;
  LODWORD(STACK[0xA08]) = v8;
  v9 = qword_24F86A890[(126 * ((((v6 + 1075937538) % 3) ^ 0xABBDF6FB) + 2 * ((v6 + 1075937538) % 3) == -1413613829)) ^ LODWORD(STACK[0x9FC])];
  LODWORD(STACK[0x9E0]) = STACK[0x9FC];
  LODWORD(STACK[0x9E4]) = v8;
  LODWORD(STACK[0x9E8]) = v1 + 1;
  LODWORD(STACK[0x9EC]) = v6 + 1521991616;
  return ((uint64_t (*)(void))(v9 - 4))();
}

uint64_t sub_22D20F828()
{
  int v0;
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;

  v1 = STACK[0xA04];
  v2 = STACK[0xA08];
  v3 = (LODWORD(STACK[0xBFC]) ^ 0xE8DF49EB)
     - 1569645721
     * ((*(unsigned __int8 *)STACK[0x1518] ^ 0x67FEFF74)
      - 1746264322
      + ((*(unsigned __int8 *)STACK[0x1518] << (v0 - 74)) & 0xE8))
     + 512607717;
  v4 = ((2 * v3) & 0xE96D73F6) + (v3 ^ 0xF4B6B9FB);
  if (v4 + 189351429 >= 0xA02FD949)
    v5 = 2066751047;
  else
    v5 = 459274128;
  v6 = ((v4 - 269922699 + v5) % 0x101 + 120264730 - ((2 * ((v4 - 269922699 + v5) % 0x101)) & 0x34)) ^ (v4 + 189351429);
  v7 = (((v6 ^ 0x72B181A) + 1814431867 - 2 * ((v6 ^ 0x72B181A) & 0x6C26087F ^ v6 & 4)) ^ 0x6C26087B) + (v2 ^ 0x69627A10);
  v8 = (v7 ^ 0x7FBDCD75) + v1 + ((2 * v7) & 0xFF7B9AEA);
  v9 = v8 - ((2 * v8 - 883431526) & 0xF57AF63C) - 529961237;
  v10 = v9 ^ 0x6255C425 ^ LODWORD(STACK[0xC08]);
  v11 = v10 ^ v2;
  v12 = ((2 * (v1 - 446054078 + (v10 ^ 0x9B1C8940))) & 0xF7FBD3B2)
      + ((v1 - 446054078 + (v10 ^ 0x9B1C8940)) ^ 0x7BFDE9D9);
  v13 = ((16 * v10) ^ 0x7A1F42FF) + (v10 ^ v2 ^ 0xF27EF350) + ((32 * v10) & 0x97AFADE0 ^ 0x3812800) + 875047169;
  v14 = ((v10 >> 27) & 0xAAAAAAAA ^ 2) + ((v10 >> 28) ^ 0x3BDFCBEC) + v12 + (v13 ^ 0xFB9DF6F5);
  v15 = (v14 + ((2 * v13) & 0xF73BEDEA) - ((2 * (v14 + ((2 * v13) & 0xF73BEDEA)) + 419997338) & 0x159D7BA0) + 1465061661) ^ v9 ^ 0x6255C425;
  return ((uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD))qword_24F86A890[(v0 + 1771230467) ^ 1])((v0 + 1771230467), v15 ^ v11, 127145902, ((2 * (v12 - 2080238040 + (v15 ^ 0x896CDE3))) & 0xBD7DFDFC)+ ((v12 - 2080238040 + (v15 ^ 0x896CDE3)) ^ 0x5EBEFEFE));
}

void sub_22D20FB84()
{
  JUMPOUT(0x22D20F8F4);
}

void sub_22D20FB90(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t v9;

  v3 = v2[151];
  v2[152] = v3;
  v4 = v2[150];
  v2[153] = v4;
  v2[154] = v2[149];
  v5 = STACK[0xA0C];
  LODWORD(STACK[0xA44]) = STACK[0xA0C];
  LODWORD(STACK[0xA48]) = v5 - 348;
  v6 = v4 + STACK[0x1608] - 0x480FA10603259825;
  v7 = ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ v6) & 0x7FFFFFFF) * ((v5 - 348) ^ 0xD59092CF);
  v8 = -711945521 * (v7 ^ HIWORD(v7));
  LOBYTE(STACK[0x61B]) = byte_22D250CE0[v8 >> 24] ^ *(_BYTE *)(v3 + v2[451] - 0x758D735BA435BBF2) ^ byte_22D2508C0[(v8 >> 24) + 2] ^ byte_22D24A5A0[v8 >> 24] ^ v8 ^ (23 * BYTE3(v8));
  v9 = *(_QWORD *)(a2 + 8 * (v5 ^ 0x412)) - 12;
  v2[21] = v6;
  v2[20] = v9;
  JUMPOUT(0x22D2128A4);
}

uint64_t sub_22D20FC9C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  BOOL v7;
  int v8;
  char v9;
  int v10;
  uint64_t (*v11)(void);

  v2 = *(_QWORD *)(v1 + 1224) + 1;
  v3 = *(_QWORD *)(v1 + 1216) + 1;
  v4 = *(_QWORD *)(v1 + 1232);
  v5 = v4 + 1;
  v4 -= 0x2DCC80D0175026B4;
  v6 = v4 < 0xBBC72C8F;
  v7 = v4 >= *(_QWORD *)(v1 + 3968);
  v8 = *(unsigned __int8 *)(v1 + 3983);
  v9 = v8 ^ v6;
  v10 = !v7;
  if ((v9 & 1) == 0)
    v8 = v10;
  v11 = (uint64_t (*)(void))(qword_24F86A890[(61 * (v0 & ~v8)) ^ LODWORD(STACK[0xA44])] - 4);
  LODWORD(STACK[0xA0C]) = STACK[0xA44];
  *(_QWORD *)(v1 + 1192) = v5;
  *(_QWORD *)(v1 + 1200) = v2;
  *(_QWORD *)(v1 + 1208) = v3;
  return v11();
}

uint64_t sub_22D20FD34()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t (*v6)(void);

  v1 = 119 * (LODWORD(STACK[0xFC4]) ^ 0x340);
  LODWORD(STACK[0x59C]) = 0;
  STACK[0x2A8] = *(_QWORD *)(v0 + 72);
  v2 = (v1 - 67777098) & 0x7FAF3F1F;
  free((void *)STACK[0x2A8]);
  free((void *)STACK[0x5C0]);
  free((void *)STACK[0x5A0]);
  free((void *)STACK[0x588]);
  free((void *)STACK[0x578]);
  free((void *)STACK[0x590]);
  free((void *)STACK[0x5A8]);
  free((void *)STACK[0x580]);
  if (LODWORD(STACK[0x59C]) == v2 - 2074415127)
    v3 = 0;
  else
    v3 = -42885;
  v4 = STACK[0x568];
  v5 = (v2 + 1256791270) ^ 0xC68E2C0F;
  LODWORD(STACK[0x12A4]) = ((v2 + 1256791270) & 0x3971D7D7)
                         + ((2 * v3) & 0x6EFE90FE)
                         - 604259815
                         + ((v5 + 931131021) ^ v3);
  STACK[0x568] = v4 - 32;
  LODWORD(v4) = LODWORD(STACK[0x144C]) + 1009604040;
  LODWORD(STACK[0x12A8]) = v4;
  LOBYTE(STACK[0x12AF]) = v4 < 0x7BA51017;
  v6 = (uint64_t (*)(void))qword_24F86A890[v2 ^ 0x7BA510E5 ^ (498 * (((v2 - (_DWORD)v4) | (v4 - v2)) >> 31))];
  LODWORD(STACK[0xD34]) = v5;
  LODWORD(STACK[0xD38]) = 1198053909;
  return v6();
}

uint64_t sub_22D20FEB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t (*v9)(void);

  v7 = v5 + 417814009;
  v8 = STACK[0x368];
  LODWORD(STACK[0x15AC]) = STACK[0x368];
  v9 = (uint64_t (*)(void))(*(_QWORD *)(a5
                                     + 8
                                     * (int)(((v8 != v6) * (((v5 ^ 0xD7F1B0A0) + 1089839337) ^ (v5 + 417814009))) ^ v5))
                         - 12);
  LODWORD(STACK[0x1058]) = v7;
  return v9();
}

void sub_22D20FF00()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  char v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;

  v2 = STACK[0x1058];
  LODWORD(STACK[0x105C]) = STACK[0x1058];
  LODWORD(STACK[0x1060]) = v2 - v0 + 956;
  v3 = (v2 + 2036446597) | 0x4242002;
  LODWORD(STACK[0x1064]) = v3;
  LODWORD(STACK[0x1080]) = v2;
  LODWORD(STACK[0x1094]) = v2;
  v4 = STACK[0x358];
  v5 = STACK[0x2E8];
  *(_QWORD *)(v1 + 2848) = STACK[0x2E8];
  v6 = LODWORD(STACK[0x16E0]);
  LODWORD(STACK[0x1098]) = v6 - 184150418;
  v7 = (v6 | ((unint64_t)(v6 < 0x5FB4FD68) << 32)) + v5;
  v8 = ((v7 - 1605696872) ^ *(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x4D48DDF4))) & (v3 ^ 0xE992D2B4);
  v9 = -711945521 * ((v8 * (v2 - v0 - 711945521)) ^ ((v8 * (v2 - v0 - 711945521)) >> 16));
  LOBYTE(STACK[0x61B]) = v4 ^ byte_22D24CD70[v9 >> 24] ^ byte_22D2509D0[v9 >> 24] ^ byte_22D246C00[(v9 >> 24) + 6] ^ v9 ^ (47 * BYTE3(v9)) ^ 0xA9;
  *(_QWORD *)(v1 + 168) = v7 - 0x222ACA0DD327C616;
  JUMPOUT(0x22D210048);
}

void sub_22D2100C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  unint64_t v5;

  v1 = v0[159];
  v0[160] = v1;
  v2 = v0[158];
  v0[161] = v2;
  v0[162] = v0[157];
  v3 = STACK[0xA4C];
  LODWORD(STACK[0xA84]) = STACK[0xA4C];
  LODWORD(STACK[0xA88]) = v3 - 929;
  v4 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ (v2 + LODWORD(STACK[0x16F0]) - 19624615)) & 0x7FFFFFFF);
  v5 = (v4 ^ HIWORD(v4)) * ((v3 - 929) ^ 0xD59092DC);
  LOBYTE(STACK[0x61B]) = byte_22D249F90[v5 >> 24] ^ *(_BYTE *)(v1 + v0[433] - 0x61EB2C667CE690CELL) ^ byte_22D24A6A0[(v5 >> 24) + 3] ^ byte_22D24B8E0[(v5 >> 24) + 2] ^ v5 ^ (-39 * (((v4 ^ HIWORD(v4)) * ((v3 - 929) ^ 0xD59092DC)) >> 24));
  JUMPOUT(0x22D20F38CLL);
}

uint64_t sub_22D2101C4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = v0[161] + 1;
  v2 = v0[162];
  v3 = (13 * ((unint64_t)(v2 - 0x32A5767447D7C7FELL) < 8)) ^ LODWORD(STACK[0xA84]);
  LODWORD(STACK[0xA4C]) = STACK[0xA84];
  v4 = v0[160] + 1;
  v5 = (uint64_t (*)(void))(qword_24F86A890[v3] - 4);
  v0[157] = v2 + 1;
  v0[158] = v1;
  v0[159] = v4;
  return v5();
}

uint64_t sub_22D210234(void *a1)
{
  int v1;
  int v2;
  int v3;

  v3 = v1 + v2 + 367;
  free(a1);
  return ((uint64_t (*)(void))(qword_24F86A890[(581 * (LODWORD(STACK[0x4CC]) == 0)) ^ v3]
                            - (v3 + 273)
                            + 635))();
}

uint64_t sub_22D210248()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  unint64_t v4;
  uint64_t v5;
  CFTypeID v6;
  unint64_t v7;
  unint64_t v8;
  CFTypeID TypeID;

  v3 = v0 - 194;
  v4 = STACK[0x3C0];
  *(_QWORD *)(v1 + 25) = STACK[0x3C0];
  *(_QWORD *)(v1 + 33) = (char *)&STACK[0x19D0] + v4;
  STACK[0x3C0] = v4 + 64;
  v5 = (16 - 16 * (&STACK[0x19D0] + v4)) & 0x10;
  *(_QWORD *)(v1 + 41) = ((10 * (v3 ^ 0x44Cu) - 0x80103240148233ELL) | (2 * v5))
                       + (v5 ^ (((v3 + 1998965471) & 0x88DA31A3) + 0x6FF7E7BC9F7AF5D9));
  v6 = CFGetTypeID((CFTypeRef)STACK[0x1858]);
  v7 = v6 ^ 0xFCD7F6FAEEFF31FFLL;
  v8 = (2 * v6) & 0xF9AFEDF5DDFE63FELL;
  TypeID = CFStringGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((57
                                          * (v7
                                           + (TypeID ^ 0xA02000262DCE0012)
                                           + v8
                                           - ((2 * TypeID) & 0xBFBFFFB3A463FFDALL) != 0x9CF7F7211CCD3211)) ^ v3))
                            - 4))();
}

uint64_t sub_22D21037C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  CFTypeID v3;
  uint64_t v4;
  uint64_t v5;
  CFTypeID TypeID;

  v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 440));
  v4 = v3 ^ 0x3DF7B4DAEF7E6DFFLL;
  v5 = (2 * v3) & 0x7BEF69B5DEFCDBFELL;
  TypeID = CFDataGetTypeID();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((126
                                          * (v4
                                           + (TypeID ^ 0x440034001211B00)
                                           + v5
                                           - (((v0 ^ 0x2E3u) - 0x880068002423843) & (2 * TypeID)) == 0x4237B81AF09F88FFLL)) ^ v0))
                            - 4))();
}

uint64_t sub_22D210428()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int Length;
  unsigned int v5;
  void *v6;

  Length = CFDataGetLength(*(CFDataRef *)(v2 + 440));
  v5 = Length - ((2 * Length) & 0x67C6F84C) - 1276937144 + ((v0 - 370) ^ 0xFFFFFF11);
  LODWORD(STACK[0x167C]) = v5 ^ 0xCBE7327;
  LODWORD(STACK[0x474]) = v5 ^ 0xCBE7327;
  v6 = malloc_type_malloc((v0 - 784183884) & 0x2EBDB2EF ^ 0xB3E37EC3 ^ v5, 0x8DF370BBuLL);
  *(_QWORD *)(v3 + 225) = v6;
  return (*(uint64_t (**)(void))(v1 + 8 * ((11 * (v6 != 0)) ^ v0)))();
}

uint64_t sub_22D2104D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);

  v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(qword_24F86A890[(184
                                                                          * (LODWORD(STACK[0x16E4]) != LODWORD(STACK[0x16D4]))) ^ LODWORD(STACK[0xA90])]
                                                         - 12);
  STACK[0x220] = *(_QWORD *)(v1 + 4008);
  return v2(a1, 1771229876, 2523737419);
}

void sub_22D210530()
{
  JUMPOUT(0x22D210538);
}

uint64_t sub_22D2106C0(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v3 = (v1 - v2 - 484);
  v4 = (uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (((LOBYTE(STACK[0xD97]) > 0x40u) * ((v1 ^ 0x246) + 538)) ^ v1))
                         - (v3 ^ 0x966D2D43));
  LODWORD(STACK[0x7B0]) = v3;
  return v4();
}

uint64_t sub_22D210708()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((228 * (**(_QWORD **)(v2 + 3592) != 0)) ^ (v0 + 1771230200)))
                            - ((v0 + 1771230200) ^ 0x143u)
                            - 4))();
}

void sub_22D21075C()
{
  JUMPOUT(0x22D2048ACLL);
}

void sub_22D210768()
{
  _QWORD *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = v0[167];
  v0[168] = v1;
  v2 = STACK[0xA9C];
  LODWORD(STACK[0xAB0]) = STACK[0xA9C];
  LODWORD(STACK[0xAB4]) = (v2 - 2040190158) ^ 0x86652D7C;
  LODWORD(STACK[0xAB8]) = (v2 - 2040190158) | 0x1008010A;
  v1 -= 111747140;
  LOBYTE(STACK[0xABF]) = *(_BYTE *)(v0[448] + v1);
  v3 = *(_QWORD *)STACK[0x17B8] + v1;
  v0[171] = v3;
  v0[64] = v3;
  JUMPOUT(0x22D2050ACLL);
}

uint64_t sub_22D2107E4()
{
  unsigned int v0;
  unint64_t v1;

  v0 = -711945521
     * ((LODWORD(STACK[0xAB8]) - 376253772) & (*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x7140FF14)) ^ LODWORD(STACK[0xAC0])));
  v1 = (v0 ^ HIWORD(v0)) * (LODWORD(STACK[0xAB4]) - 711945838);
  return ((uint64_t (*)(void))(qword_24F86A890[(44
                                             * ((LOBYTE(STACK[0xABF]) - 3) == (byte_22D24F1B0[v1 >> 24] ^ LOBYTE(STACK[0x767]) ^ byte_22D24A490[v1 >> 24] ^ byte_22D24D990[v1 >> 24] ^ v1 ^ (-61 * (((v0 ^ HIWORD(v0)) * (LODWORD(STACK[0xAB4]) - 711945838)) >> 24))))) ^ LODWORD(STACK[0xAB0])]
                            - 8))();
}

uint64_t sub_22D2108C8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v3 = v0 - 46;
  v4 = *(_QWORD *)(v2 + 1344) + 1;
  v5 = (uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((112 * (*(_QWORD *)(v2 + 1344) == 111747154)) ^ v0))
                         - ((v0 - 537973602) & 0xB67DFF6F ^ 0x966D2D43));
  LODWORD(STACK[0xA9C]) = v3;
  *(_QWORD *)(v2 + 1336) = v4;
  return v5();
}

void sub_22D210930()
{
  JUMPOUT(0x22D210940);
}

uint64_t sub_22D2109A4()
{
  unsigned int v0;
  unint64_t v1;

  v0 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + ((LODWORD(STACK[0xAE8]) ^ 0x22893E60) & dword_255D671C4)) ^ LODWORD(STACK[0xAF0])) & 0x7FFFFFFF);
  v1 = -711945521 * (v0 ^ HIWORD(v0));
  return ((uint64_t (*)(void))(qword_24F86A890[(983
                                             * ((LOBYTE(STACK[0xAEF]) - 60) == (byte_22D24F1B0[v1 >> 24] ^ LOBYTE(STACK[0x767]) ^ byte_22D24A490[v1 >> 24] ^ byte_22D24D990[v1 >> 24] ^ v1 ^ (-61 * BYTE3(v1))))) ^ LODWORD(STACK[0xAE0])]
                            - 4))();
}

void sub_22D210A74()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  unint64_t v6;

  v1 = STACK[0xB00];
  LODWORD(STACK[0xB04]) = STACK[0xB00];
  v2 = STACK[0xAFC];
  LODWORD(STACK[0xB08]) = STACK[0xAFC];
  v3 = (v2 + 24416721) & 0xFE8B6EFC;
  LODWORD(STACK[0xB0C]) = v3;
  v4 = v3 + v1 - 635;
  LODWORD(STACK[0xB10]) = v4;
  v5 = -711945521
     * (((*(_DWORD *)(v0 + 3832) + v4 - 662509689) ^ *(_DWORD *)(qword_255D671B8 + (int)(dword_255D671C4 & 0xDF3C6E9C))) & 0x7FFFFFFF);
  v6 = -711945521 * (v5 ^ HIWORD(v5));
  LOBYTE(STACK[0x61B]) = byte_22D250F00[(v6 >> 24) + 1] ^ byte_22D24D690[v6 >> 24] ^ byte_22D247430[v6 >> 24] ^ v6 ^ (-43 * BYTE3(v6));
  JUMPOUT(0x22D213D54);
}

uint64_t sub_22D210B78()
{
  unsigned int v0;
  char v1;
  char v2;
  uint64_t (*v3)(void);

  v0 = LODWORD(STACK[0xB04]) - 398321308;
  v1 = LOBYTE(STACK[0x963]) ^ (v0 < 0xFBF31DB);
  v2 = v0 < LODWORD(STACK[0x95C]);
  if ((v1 & 1) != 0)
    v2 = STACK[0x963];
  v3 = (uint64_t (*)(void))(qword_24F86A890[(88 * (v2 & 1)) ^ LODWORD(STACK[0xB08])] - 12);
  LODWORD(STACK[0xAFC]) = STACK[0xB08];
  LODWORD(STACK[0xB00]) = STACK[0xB10];
  return v3();
}

uint64_t sub_22D210BF0()
{
  return ((uint64_t (*)(void))(qword_24F86A890[(505 * (LODWORD(STACK[0x141C]) == LODWORD(STACK[0x1794]))) ^ LODWORD(STACK[0xB18])]
                            - 12))();
}

uint64_t sub_22D210D7C(unint64_t a1, uint64_t a2)
{
  int v2;
  unint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  STACK[0x210] = v3;
  STACK[0x220] = a1;
  v7 = (v2 - 653) | 0xF0u;
  v8 = ((unint64_t)&STACK[0x34C] ^ 0x7F7BEB9FFCDBBEEELL)
     - 0x7F7BEB9FFCDBBEEELL
     + ((v7 ^ 0xFEF7D73FF9B77D28) & (2 * (_QWORD)&STACK[0x34C]));
  STACK[0x270] = ((v8 % 0x25) ^ 0x7BFF34F5B1B7DFF5)
               - 0x7BFF34F5B1B7DFE5
               + ((2 * (v8 % 0x25)) & 0x6ALL);
  STACK[0x2A8] = STACK[0x510];
  STACK[0x240] = *(_QWORD *)(v6 + 209) + *(_QWORD *)(v6 + 185) - 0x18F8E2C5531661AALL;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a2
                                                      + 8
                                                      * (int)((((((_DWORD)v7 + 404) ^ 0x3407AB6F) == 872917482)
                                                             * (v4 + v5 + v7 - 241 + 1260)) ^ v7))
                                          - 12))(2931746476);
}

void sub_22D210EC8(int a1@<W8>)
{
  uint64_t v1;

  LODWORD(STACK[0x350]) = a1;
  STACK[0x220] = *(_QWORD *)(v1 + 4040);
  JUMPOUT(0x22D210F0CLL);
}

uint64_t sub_22D211004(unint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t (*v11)(uint64_t);

  STACK[0x200] = v6;
  STACK[0x210] = a1;
  v9 = v5 - 168;
  v10 = ((unint64_t)&STACK[0x440] ^ 0x7DAFFBFFFFFF26EELL)
      - 0x7DAFFBFFFFFF26EELL
      + ((2 * (_QWORD)&STACK[0x440]) & 0xFB5FF7FFFFFE4DD8);
  STACK[0x240] = ((v10 % 0x25) ^ 0xFB9B8FD23DFDB7CFLL) + 0x464702DC2024841 + ((v9 ^ 0x4Au) & (2 * (v10 % 0x25)));
  STACK[0x2A8] = STACK[0x420];
  STACK[0x230] = *(_QWORD *)(a5 + 568) + *(_QWORD *)(v8 + 185) + 0x8C1E5500833E275;
  v11 = *(uint64_t (**)(uint64_t))(a4 + 8 * ((1532 * (a3 + (v9 ^ 0xA8) == -1771229369)) ^ v9));
  STACK[0x270] = v7;
  return v11(440457599);
}

uint64_t sub_22D211144()
{
  unsigned int v0;
  unint64_t v1;
  _BOOL4 v2;

  v0 = ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x7140FF14)) ^ LODWORD(STACK[0xB48])) & 0x7FFFFFFF)
     * (LODWORD(STACK[0xB3C]) ^ 0x43FDBF84);
  v1 = (unint64_t)(-711945521 * (v0 ^ HIWORD(v0))) >> (LODWORD(STACK[0xB40]) ^ 0xCBu);
  v2 = (LOBYTE(STACK[0xB47]) - 108) != (byte_22D24F1B0[v1] ^ LOBYTE(STACK[0x767]) ^ byte_22D24A490[v1] ^ byte_22D24D990[v1] ^ (-49 * (v0 ^ BYTE2(v0))) ^ (-61 * v1));
  return ((uint64_t (*)(void))(qword_24F86A890[((2 * v2) | (4 * v2)) ^ LODWORD(STACK[0xB38])] - 4))();
}

void sub_22D211228()
{
  JUMPOUT(0x22D21070CLL);
}

uint64_t sub_22D211230()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v3 = (v0 + 518);
  v4 = *(_QWORD *)(v2 + 1480) + 1;
  v5 = (uint64_t (*)(void))(*(_QWORD *)(v1 + 8
                                          * ((1611 * (v4 == (v3 ^ 0xFFFFFFFFCDC7EDD1) + (v0 ^ 0x966D2F98))) ^ v0))
                         - 4);
  LODWORD(STACK[0xB24]) = v3;
  *(_QWORD *)(v2 + 1472) = v4;
  return v5();
}

uint64_t sub_22D211284()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  BOOL v7;
  char v8;
  char v9;
  char v10;
  uint64_t (*v11)(void);

  v2 = v1[194] + 1;
  v3 = v1[193] + 1;
  v4 = v1[195];
  v5 = v4 + 1;
  v4 -= 0x34FE66215E769B92;
  v6 = v4 < 0x90FCED92;
  v7 = v4 >= *(_QWORD *)(v0 + 113);
  v8 = *(_BYTE *)(v0 + 128);
  v9 = v8 ^ v6;
  v10 = !v7;
  if ((v9 & 1) == 0)
    v8 = v10;
  v11 = (uint64_t (*)(void))(qword_24F86A890[(15 * (v8 & 1)) ^ LODWORD(STACK[0xB88])] - 4);
  LODWORD(STACK[0xB54]) = STACK[0xB88];
  v1[190] = v5;
  v1[191] = v2;
  v1[192] = v3;
  return v11();
}

uint64_t sub_22D21131C()
{
  unsigned int v0;
  unint64_t v1;
  uint64_t (*v2)(void);

  v0 = -711945521
     * ((LODWORD(STACK[0xBA0]) + 2147483108) & (*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ LODWORD(STACK[0xBB0])));
  v1 = -711945521 * (v0 ^ HIWORD(v0));
  v2 = (uint64_t (*)(void))(qword_24F86A890[LODWORD(STACK[0xBA4]) | (32
                                                                  * (LOBYTE(STACK[0x767]) == (byte_22D2508C0[(v1 >> 24) + 2] ^ byte_22D250CE0[v1 >> 24] ^ byte_22D24A5A0[v1 >> 24] ^ v1 ^ (23 * BYTE3(v1)))))]
                         - 12);
  LODWORD(STACK[0xD5C]) = STACK[0xB9C];
  return v2();
}

void sub_22D2113E4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = STACK[0xD5C];
  LODWORD(STACK[0xD60]) = STACK[0xD5C];
  LODWORD(STACK[0xD64]) = (v2 + 473) | 0x181;
  LODWORD(STACK[0xD68]) = (v2 - 1208012976) & 0xDE6DFDCB;
  v3 = **(_QWORD **)(v0 + 120);
  v4 = (STACK[0xBAC] & 0xFBFBF3D8) + (LODWORD(STACK[0xBA8]) ^ 0x7DFDF9EC);
  LODWORD(STACK[0xD6C]) = v4;
  v5 = v3 + (int)(v4 - 2113796588);
  *(_QWORD *)(v1 + 2056) = v5;
  *(_QWORD *)(v1 + 512) = v5;
  JUMPOUT(0x22D2050A8);
}

uint64_t sub_22D21146C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(void))(*(_QWORD *)(a5
                                        + 8
                                        * ((LODWORD(STACK[0x170C]) != 0) | (16 * (LODWORD(STACK[0x170C]) != 0)) | LODWORD(STACK[0x1240])))
                            - (((5 * (LODWORD(STACK[0x1240]) ^ 0x4F3) - 2111757963) | 0x144C0901u) ^ 0x966D2D43)))();
}

void sub_22D2114C8()
{
  uint64_t v0;

  sub_22D22F914(*(_QWORD *)(v0 + 145));
  JUMPOUT(0x22D1F0CA8);
}

uint64_t sub_22D2114E8@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  char *v5;
  CFStringEncoding SystemEncoding;
  CFStringRef v7;

  v4 = a1 + 408;
  LODWORD(STACK[0x2328]) = STACK[0x2D4];
  STACK[0x2320] = STACK[0x210];
  *(_QWORD *)(v1 + 136) = *(_QWORD *)(v3 + 3344);
  CFRelease(*(CFTypeRef *)(v2 + 153));
  CFRelease(*(CFTypeRef *)(v3 + 3784));
  STACK[0x1900] = (unint64_t)&STACK[0x2340];
  LODWORD(STACK[0x2318]) = -1999002478;
  LODWORD(STACK[0x2340]) = -1084420351;
  STACK[0x1908] = (unint64_t)&STACK[0x2338];
  STACK[0x2338] = 0;
  v5 = off_255D66730;
  LOBYTE(STACK[0x19B9]) = *off_255D66730 - 87;
  LOBYTE(STACK[0x19BA]) = ((v4 - 70) & 0xFD) + 106 + v5[1] + 94;
  LOBYTE(STACK[0x19BB]) = v5[2] - 87;
  LOBYTE(STACK[0x19BC]) = v5[3] - 87;
  LOBYTE(STACK[0x19BD]) = v5[4] - 87;
  LOBYTE(STACK[0x19BE]) = v5[5] - 87;
  LOBYTE(STACK[0x19BF]) = v5[6] - 87;
  LOBYTE(STACK[0x19C0]) = v5[7] - 87;
  LOBYTE(STACK[0x19C1]) = v5[8] - 87;
  LOBYTE(STACK[0x19C2]) = v5[9] - 87;
  LOBYTE(STACK[0x19C3]) = v5[10] - 87;
  LOBYTE(STACK[0x19C4]) = v5[11] - 87;
  LOBYTE(STACK[0x19C5]) = v5[12] - 87;
  LOBYTE(STACK[0x19C6]) = v5[13] - 87;
  LOBYTE(STACK[0x19C7]) = v5[14] - 87;
  LOBYTE(STACK[0x19C8]) = v5[15] - 87;
  LOBYTE(STACK[0x19C9]) = v5[16] - 87;
  LOBYTE(STACK[0x19CA]) = v5[17] - 87;
  LOBYTE(STACK[0x19CB]) = v5[18] - 87;
  LOBYTE(STACK[0x19CC]) = v5[19] - 87;
  LOBYTE(STACK[0x19CD]) = v5[20] - 87;
  LOBYTE(STACK[0x19CE]) = v5[21] - 87;
  LOBYTE(STACK[0x19CF]) = off_255D66730[22] - 87;
  SystemEncoding = CFStringGetSystemEncoding();
  v7 = CFStringCreateWithCString(0, (const char *)&STACK[0x19B9], SystemEncoding);
  STACK[0x1910] = (unint64_t)v7;
  return ((uint64_t (*)(void))(qword_24F86A890[((8 * (v7 == 0)) | (16 * (v7 == 0))) ^ v4] - 4))();
}

uint64_t sub_22D211530(void *a1)
{
  free(a1);
  return ((uint64_t (*)(void))(qword_24F86A890[(581 * (LODWORD(STACK[0x554]) == 0)) ^ 0x16E] - 4))();
}

uint64_t sub_22D211540(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  int v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (((v4 + 8 != a4) * ((v5 - 353) ^ 0x133)) ^ v5))
                            - ((v5 - v6 - 698) ^ 0x966D2D4FLL)))();
}

uint64_t sub_22D2115F0()
{
  unint64_t v0;

  STACK[0x3D8] = v0;
  STACK[0x310] = STACK[0x2A8];
  return ((uint64_t (*)(unint64_t))STACK[0x210])(STACK[0x220]);
}

void sub_22D211688()
{
  _QWORD *v0;
  int v1;
  char v2;
  uint64_t v3;
  uint64_t v4;

  v1 = LOBYTE(STACK[0x767]);
  LODWORD(STACK[0xC0C]) = v1 ^ 0x3E38F76B;
  LODWORD(STACK[0xC10]) = (2 * v1) & 0xD6;
  v2 = (LOBYTE(STACK[0xBE4]) - ((2 * LOBYTE(STACK[0xBE4]) - 118) & 0x8A) - 118) ^ 0x45;
  v3 = v0[209];
  v4 = v0[491];
  LOBYTE(STACK[0x61B]) = v1 + 54 * v2 + ((-101 * v2) ^ 0x7F) + 73;
  v0[21] = v4 + v3;
  JUMPOUT(0x22D2128A0);
}

uint64_t sub_22D211714()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  unint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  char v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  int v23;
  uint64_t v24;

  v1 = STACK[0xBE4];
  v2 = (LODWORD(STACK[0xBD4]) ^ 0x1720B614)
     - 905433537 * (LODWORD(STACK[0xBE4]) + LODWORD(STACK[0xC0C]) + LODWORD(STACK[0xC10]))
     - 1458560058;
  v3 = ((2 * v2) & 0xB93E5D9A) + (v2 ^ 0x5C9F2ECD);
  v4 = LODWORD(STACK[0xBE0]) ^ 0x69627A10;
  v5 = ((v4 + LODWORD(STACK[0xBD8]) - 1999990155 + v3) ^ 0x4148003)
     + (((v3 - 1553936077) % 0x101) ^ 0xEEFFFA2F)
     - ((2 * (v4 + LODWORD(STACK[0xBD8]) - 1999990155 + v3)) & 0xF7D6FFF8)
     + ((2 * ((v3 - 1553936077) % 0x101)) & 0x5E)
     + 1;
  v6 = v5 - ((2 * v5 + 433523610) & 0xF6767D50) + 136758389;
  v7 = v6 ^ LODWORD(STACK[0xBDC]);
  v8 = ((2 * (v4 + (v7 ^ 0x1583126E) + 1)) & 0x75DFF974) + ((v4 + (v7 ^ 0x1583126E) + 1) ^ 0xBAEFFCBA);
  v9 = ((LODWORD(STACK[0xBD8]) - 446054078) ^ 0xEA7CED91 ^ v7)
     + 1873732543
     - ((2 * ((LODWORD(STACK[0xBD8]) - 446054078) ^ 0xEA7CED91 ^ v7)) & 0xDF5DC77E);
  v10 = (-9
       - (((LOBYTE(STACK[0xBD8]) + 66) ^ 0x91 ^ v7)
        - 65
        - ((2 * ((LOBYTE(STACK[0xBD8]) + 66) ^ 0x91 ^ v7)) & 0x7E))) & 4;
  v11 = v10 | 0x55988550;
  HIDWORD(v12) = v7 ^ 0xA7CED91;
  LODWORD(v12) = v6 ^ ~LODWORD(STACK[0xBDC]);
  v13 = ((2 * (v12 >> 29)) & 0xFFF6B18E) + ((v12 >> 29) ^ 0x7FFB58C7);
  v14 = -((v13 + 1) & v10);
  v15 = -1422849376 - (v10 | 0x55988550);
  if (v14)
    v16 = v15;
  else
    v16 = v11;
  v17 = v16 + v13 - ((2 * (v16 + v13) + 1423459282) & 0xECE3F040) + 551426569;
  v18 = (v1 + 1032061234) < LODWORD(STACK[0x14CC]);
  if (((*(_BYTE *)(v0 + 3947) ^ ((v1 + 1032061234) < 0x720803EC)) & 1) != 0)
    v18 = *(_BYTE *)(v0 + 3947);
  v19 = (v6 ^ 0x92C9E5CD)
      + (((v9 & 0xFFFFFFFB ^ 0x99DF1B9B ^ v17) - v8 - 1158677318) ^ 0x5DEAFF9F)
      + ((2 * ((v9 & 0xFFFFFFFB ^ 0x99DF1B9B ^ v17) - v8 - 1158677318)) & 0xBBD5FF3E)
      - 1575681951;
  v20 = v19 - ((2 * v19) & 0xEAA9DD5A) + 1968500397;
  LODWORD(STACK[0xBFC]) = v20 ^ 0x7006C3C4;
  v21 = (((v9 ^ 0x6FAEE3BF) + (v20 ^ 0x672675D0) + 1) ^ 0x3FBFFEBE)
      - 623493120
      + ((2 * ((v9 ^ 0x6FAEE3BF) + (v20 ^ 0x672675D0) + 1)) & 0x7F7FFD7C);
  LODWORD(STACK[0xC00]) = v21;
  v22 = v8
      + 1158677318
      + (v20 ^ 0x98D98A2F)
      + 1768061456
      + (~(2 * (v8 + 1158677318 + (v20 ^ 0x98D98A2F))) | 0x2D3B0BDF)
      + 1;
  LODWORD(STACK[0xC04]) = v22;
  v23 = v6 ^ 0x72A567BE ^ v20;
  LODWORD(STACK[0xC08]) = v23;
  v24 = qword_24F86A890[LODWORD(STACK[0xBE8]) ^ (239 * (v18 & 1))];
  LODWORD(STACK[0xBBC]) = STACK[0xBE8];
  LODWORD(STACK[0xBC0]) = v1 + 1;
  LODWORD(STACK[0xBC4]) = v22;
  LODWORD(STACK[0xBC8]) = v23;
  LODWORD(STACK[0xBCC]) = v21;
  LODWORD(STACK[0xBD0]) = v20 ^ 0x7006C3C4;
  return ((uint64_t (*)(void))(v24 - 8))();
}

uint64_t sub_22D211AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v9 = STACK[0xBEC];
  v10 = LODWORD(STACK[0x14AC]) - LODWORD(STACK[0x14A8]);
  LODWORD(STACK[0x1728]) = v10;
  LODWORD(STACK[0x172C]) = v10 ^ 0xAACD8C1;
  STACK[0x1730] = v8[10];
  LODWORD(STACK[0x9E0]) = v9;
  LODWORD(STACK[0x9E4]) = STACK[0xC04];
  LODWORD(STACK[0x9E8]) = 1233037405;
  LODWORD(STACK[0x9EC]) = STACK[0xC00];
  LODWORD(STACK[0x9F0]) = STACK[0x9EC];
  v11 = STACK[0x9E8];
  LODWORD(STACK[0x9F4]) = STACK[0x9E8];
  LODWORD(STACK[0x9F8]) = STACK[0x9E4];
  v12 = STACK[0x9E0];
  LODWORD(STACK[0x9FC]) = STACK[0x9E0];
  LODWORD(STACK[0xA00]) = (v12 + 2162801) | 0x964C2942;
  v8[64] = STACK[0x1730] + (v11 - 1233037405);
  v8[62] = *(_QWORD *)(a8 + 8 * (v12 + 387)) - 12;
  v13 = ((v8[64] - qword_255D671D0) & 0xFFFFFFFFFFFFFFF0) + qword_255D671C8;
  v14 = (*(uint64_t (**)(_QWORD, unint64_t *, uint64_t))(qword_255D671E8
                                                                       + 32 * *(unsigned __int8 *)(v13 + 8)
                                                                       + 8))(*(_QWORD *)v13, &STACK[0x7A3], 1);
  LOBYTE(STACK[0x767]) = STACK[0x7A3];
  return ((uint64_t (*)(uint64_t))v8[62])(v14);
}

void sub_22D211B64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;
  unint64_t v6;

  v1 = *(_QWORD *)(v0 + 1728);
  *(_QWORD *)(v0 + 1736) = v1;
  v2 = *(_QWORD *)(v0 + 1720);
  *(_QWORD *)(v0 + 1744) = v2;
  *(_QWORD *)(v0 + 1752) = *(_QWORD *)(v0 + 1712);
  v3 = STACK[0xC14];
  LODWORD(STACK[0xC4C]) = STACK[0xC14];
  v4 = 15 * (v3 ^ 0x146);
  LODWORD(STACK[0xC50]) = v4;
  v5 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ (v2 + *(_DWORD *)(v0 + 3872) + 1518429519)) & 0x7FFFFFFF);
  v6 = -711945521 * (v5 ^ HIWORD(v5));
  LOBYTE(STACK[0x61B]) = byte_22D249F90[v6 >> (v4 - 6)] ^ *(_BYTE *)(v1
                                                                                    + STACK[0x1838]
                                                                                    - 0x1F589551E5AF29B3) ^ byte_22D24A6A0[(v6 >> (v4 - 6)) + 3] ^ byte_22D24B8E0[(v6 >> (v4 - 6)) + 2] ^ v6 ^ (-39 * (v6 >> (v4 - 6)));
  JUMPOUT(0x22D1F0F84);
}

uint64_t sub_22D211C70()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = v0[218] + 1;
  v2 = v0[219];
  v3 = (29 * ((unint64_t)(v2 - 0x63452BEBFCB0EC8FLL) < 8)) ^ LODWORD(STACK[0xC4C]);
  LODWORD(STACK[0xC14]) = STACK[0xC4C];
  v4 = v0[217] + 1;
  v5 = (uint64_t (*)(void))(qword_24F86A890[v3] - 4);
  v0[214] = v2 + 1;
  v0[215] = v1;
  v0[216] = v4;
  return v5();
}

uint64_t sub_22D211D70(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;

  return (*(uint64_t (**)(void))(a2 + 8 * ((1672 * (v3 + 8 == a3 + v4 - 560 + ((v4 - 206) | 0x14) - 1101637915)) ^ v4)))();
}

uint64_t sub_22D211DB4()
{
  unint64_t v0;

  STACK[0x2C8] = v0;
  STACK[0x430] = STACK[0x2A0];
  return sub_22D20E5A0(STACK[0x200]);
}

void sub_22D211DD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(v0 + 1792);
  *(_QWORD *)(v0 + 1800) = v1;
  v2 = *(_QWORD *)(v0 + 1784);
  *(_QWORD *)(v0 + 1808) = v2;
  *(_QWORD *)(v0 + 1816) = *(_QWORD *)(v0 + 1776);
  v3 = STACK[0xC54];
  LODWORD(STACK[0xC8C]) = STACK[0xC54];
  v4 = (v3 - 220);
  LODWORD(STACK[0xC90]) = v4;
  LOBYTE(v1) = *(_BYTE *)(v4 + v1 + *(_QWORD *)(v0 + 4120) - 0x37F2316A6C251B4ELL);
  LODWORD(v4) = -711945521
              * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ (v2
                                                                                 + *(_DWORD *)(v0 + 3768)
                                                                                 + 762062618)) & 0x7FFFFFFF);
  v5 = -711945521 * (v4 ^ WORD1(v4));
  LOBYTE(STACK[0x61B]) = byte_22D249F90[v5 >> 24] ^ v1 ^ byte_22D24A6A0[(v5 >> 24) + 3] ^ byte_22D24B8E0[(v5 >> 24) + 2] ^ v5 ^ (-39 * BYTE3(v5));
  JUMPOUT(0x22D20EF78);
}

uint64_t sub_22D211ED4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  BOOL v6;
  char v7;
  char v8;
  char v9;
  uint64_t (*v10)(void);

  v1 = v0[226] + 1;
  v2 = v0[225] + 1;
  v3 = v0[227];
  v4 = v3 + 1;
  v3 -= 0x12E4ECD39260C716;
  v5 = v3 < 0x2F209F1B;
  v6 = v3 >= STACK[0x1760];
  v7 = STACK[0x176F];
  v8 = LOBYTE(STACK[0x176F]) ^ v5;
  v9 = !v6;
  if ((v8 & 1) == 0)
    v7 = v9;
  v10 = (uint64_t (*)(void))(qword_24F86A890[(1009 * (v7 & 1)) ^ LODWORD(STACK[0xC8C])] - 12);
  LODWORD(STACK[0xC54]) = STACK[0xC8C];
  v0[222] = v4;
  v0[223] = v1;
  v0[224] = v2;
  return v10();
}

uint64_t sub_22D211F74()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  char v5;
  char v6;
  uint64_t (*v7)(void);

  v1 = v0[234] + 1;
  v2 = v0[233] + 1;
  v3 = v0[235];
  v4 = v3 + 1;
  v3 -= 0x3081ED00719DA45FLL;
  v5 = LOBYTE(STACK[0x175F]) ^ (v3 < 0xDB3DEBC);
  v6 = v3 < STACK[0x1750];
  if ((v5 & 1) != 0)
    v6 = STACK[0x175F];
  v7 = (uint64_t (*)(void))qword_24F86A890[(7 * (v6 & 1)) ^ LODWORD(STACK[0xCCC])];
  LODWORD(STACK[0xC94]) = STACK[0xCCC];
  v0[230] = v4;
  v0[231] = v1;
  v0[232] = v2;
  LODWORD(STACK[0xE90]) = STACK[0xCD0];
  return v7();
}

void sub_22D212010()
{
  uint64_t v0;
  int v1;
  unsigned int v2;
  unint64_t v3;
  char v4;

  v1 = (LODWORD(STACK[0xE90]) - 102557855) & 0x61CE7FF;
  v2 = -711945521
     * (((*(_DWORD *)(v0 + 504) + *(_DWORD *)(v0 + 160) + (v1 ^ 0x2C21022E)) ^ *(_DWORD *)(qword_255D671B8
                                                                                         + (dword_255D671C4 & 0x58B8A3F0))) & 0x7FFFFFFF);
  v3 = -711945521 * (v2 ^ HIWORD(v2));
  v4 = byte_22D250CE0[v3 >> 24];
  LODWORD(STACK[0xE94]) = v1;
  LOBYTE(STACK[0x61B]) = byte_22D2508C0[(v3 >> 24) + 2] ^ v4 ^ byte_22D24A5A0[v3 >> 24] ^ v3 ^ (23 * BYTE3(v3));
  JUMPOUT(0x22D21289CLL);
}

void sub_22D212214()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  char v8;

  v2 = v1[240];
  v1[241] = v2;
  v3 = v1[239];
  v1[242] = v3;
  v1[243] = v1[238];
  v4 = STACK[0xCD4];
  LODWORD(STACK[0xD0C]) = STACK[0xCD4];
  LOBYTE(v2) = *(_BYTE *)(v2 + *(_QWORD *)(v0 + 17) - 0x74F781778E28AFA8);
  v5 = v3 + v1[429] - 0x4E945DF4516066F0;
  v6 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + ((v4 + 1488494802) & dword_255D671C4)) ^ v5) & 0x7FFFFFFF);
  v7 = -711945521 * (v6 ^ HIWORD(v6));
  v8 = byte_22D251010[v7 >> 24];
  LODWORD(STACK[0xD10]) = v4 - 773;
  LOBYTE(STACK[0x61B]) = v8 ^ v2 ^ byte_22D24C420[v7 >> 24] ^ byte_22D246E20[(v7 >> 24) + 1] ^ v7 ^ (115 * BYTE3(v7));
  v1[21] = v5;
  JUMPOUT(0x22D2128A0);
}

uint64_t sub_22D21230C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = v0[242] + 1;
  v2 = v0[243];
  v3 = (93 * ((unint64_t)(v2 - 0x491C63C96E33C554) > 7)) ^ LODWORD(STACK[0xD0C]);
  LODWORD(STACK[0xCD4]) = STACK[0xD0C];
  v4 = v0[241] + 1;
  v5 = (uint64_t (*)(void))(qword_24F86A890[v3] - 12);
  v0[238] = v2 + 1;
  v0[239] = v1;
  v0[240] = v4;
  return v5();
}

uint64_t sub_22D21237C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = *(_QWORD *)(v0 + 1976) + 1;
  v2 = (uint64_t (*)(void))qword_24F86A890[(1140 * (*(_QWORD *)(v0 + 1976) == 995648887)) ^ LODWORD(STACK[0xD2C])];
  LODWORD(STACK[0xD14]) = STACK[0xD2C];
  *(_QWORD *)(v0 + 1968) = v1;
  return v2();
}

void sub_22D2123C0()
{
  uint64_t v0;

  LODWORD(STACK[0x2328]) = -1084420344;
  STACK[0x2320] = *(_QWORD *)(v0 + 3688);
  JUMPOUT(0x22D2123E8);
}

uint64_t sub_22D2125BC()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = MGCopyAnswer();
  *(_QWORD *)(v2 + 440) = v3;
  return ((uint64_t (*)(void))qword_24F86A890[((v3 == 0) * ((v0 - 1073792758) & 0xD66DEF5F ^ (v1 + 19))) ^ v0])();
}

uint64_t sub_22D21260C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;

  CFRelease(*(CFTypeRef *)(v1 + 624));
  LODWORD(STACK[0x1864]) = -45000;
  v3 = STACK[0x3C0];
  v4 = (char *)&STACK[0x19D0] + STACK[0x3C0];
  *(_QWORD *)(v1 + 456) = STACK[0x3C0];
  *(_QWORD *)(v1 + 464) = v4;
  STACK[0x3C0] = v3 + 32;
  LODWORD(STACK[0x3CD]) = -757355566;
  LOWORD(STACK[0x3D1]) = -12083;
  LOBYTE(STACK[0x3D3]) = -50;
  v5 = (char *)&STACK[0x19D0] + v3;
  *((_QWORD *)v5 + 1) = 0;
  *(_QWORD *)(v1 + 472) = v5 + 8;
  *((_DWORD *)v4 + 4) = 860773951;
  v6 = qword_24F86A890[v0 + 1771230044];
  v7 = 591644117
     * ((((v2 - 200) | 0x807F0AF9DFC2FD84) - (v2 - 200) + ((v2 - 200) & 0x7F80F506203D0278)) ^ 0x64642A3044C7B7C3);
  STACK[0x2408] = (unint64_t)(v4 + 0x211A3D541E10AFD6);
  *(_DWORD *)(v2 - 176) = -922504226 - v7 + v0;
  STACK[0x23F8] = v6 - v7;
  sub_22D227BBC(v2 - 200);
  return ((uint64_t (*)(_QWORD))qword_24F86A890[(v0 + 1771230605) | (2
                                                                             * (((v0 - 46) ^ (*(_DWORD *)(v2 - 192) == 1415721421)) & 1))])(**(_QWORD **)(v1 + 472));
}

void sub_22D212784()
{
  _QWORD *v0;
  uint64_t v1;
  int v2;
  unint64_t v3;
  unint64_t v4;

  v1 = LODWORD(STACK[0xD38]);
  LODWORD(STACK[0xD3C]) = v1;
  v2 = STACK[0xD34];
  LODWORD(STACK[0xD40]) = STACK[0xD34];
  LODWORD(STACK[0xD44]) = v2 + 995;
  v3 = (v1 | ((unint64_t)(v1 < v2 + 1198053667) << 32)) - 1198053909;
  v0[252] = v3;
  v4 = STACK[0x18E0] + v3;
  v0[253] = v4;
  v0[64] = v4 - 0x5A72C1CEA1245FC3;
  JUMPOUT(0x22D2050ACLL);
}

void sub_22D2127FC()
{
  uint64_t v0;
  unsigned int v1;

  v1 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x540D021C)) ^ LODWORD(STACK[0xD50])) & 0x7FFFFFFF);
  LOBYTE(STACK[0x61B]) = byte_22D24A7B0[*(_QWORD *)(v0 + 2016) & 0xF | (16 * ((-711945521 * (v1 ^ HIWORD(v1))) >> 24))] ^ LOBYTE(STACK[0x767]) ^ (-49 * (v1 ^ BYTE2(v1)));
  JUMPOUT(0x22D212898);
}

void sub_22D2128F8()
{
  uint64_t v0;

  STACK[0x220] = *(_QWORD *)(v0 + 97);
  LODWORD(STACK[0x444]) = 0;
  JUMPOUT(0x22D21294CLL);
}

void sub_22D2129C4()
{
  free((void *)STACK[0x478]);
  JUMPOUT(0x22D2129DCLL);
}

uint64_t sub_22D212A10()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  LODWORD(STACK[0x2310]) = STACK[0x3D4];
  STACK[0x2308] = STACK[0x220];
  *(_QWORD *)(v0 + 136) = STACK[0x1798];
  CFRelease((CFTypeRef)STACK[0x17D8]);
  CFRelease((CFTypeRef)STACK[0x17E8]);
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((v1 == 639) * ((v1 - 382) ^ 0x783)) ^ v1)) - 12))();
}

uint64_t sub_22D212A8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = v0[267] + 1;
  v2 = v0[268];
  v3 = (918 * ((unint64_t)(v2 - 0x6B04ECE257D54509) > 7)) ^ LODWORD(STACK[0xDD4]);
  LODWORD(STACK[0xD9C]) = STACK[0xDD4];
  v4 = v0[266] + 1;
  v5 = (uint64_t (*)(void))(qword_24F86A890[v3] - 4);
  v0[263] = v2 + 1;
  v0[264] = v1;
  v0[265] = v4;
  return v5();
}

void sub_22D212AFC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  unint64_t v4;
  unsigned int v5;
  unint64_t v6;
  char v7;
  char v8;

  v1 = v0[265];
  v0[266] = v1;
  v2 = v0[264];
  v0[267] = v2;
  v0[268] = v0[263];
  v3 = STACK[0xD9C];
  LODWORD(STACK[0xDD4]) = STACK[0xD9C];
  LOBYTE(v1) = *(_BYTE *)(v1 + v0[417] - 0x50D46882045B985ELL);
  v4 = v2 + STACK[0x18F0] - 0x50DE975A0498DCD4;
  v5 = -711945521 * ((v3 ^ 0x7FFFFE43) & (*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ v4));
  v6 = -711945521 * (v5 ^ HIWORD(v5));
  v7 = byte_22D251010[v6 >> 24];
  v8 = byte_22D24C420[v6 >> 24];
  LODWORD(STACK[0xDD8]) = v3 ^ 0x1AC;
  LOBYTE(STACK[0x61B]) = v7 ^ v1 ^ v8 ^ byte_22D246E20[(v6 >> 24) + 1] ^ v6 ^ (115 * BYTE3(v6));
  v0[21] = v4;
  JUMPOUT(0x22D2128A0);
}

uint64_t sub_22D212C04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  char v5;
  char v6;
  uint64_t (*v7)(void);

  v1 = *(_QWORD *)(v0 + 2200) + 1;
  v2 = *(_QWORD *)(v0 + 2192) + 1;
  v3 = *(_QWORD *)(v0 + 2208);
  v4 = v3 + 1;
  v3 -= 0xF6C276FAB4A4C70;
  v5 = *(_BYTE *)(v0 + 3415) ^ (v3 < 0xD617EC51);
  v6 = v3 < *(_QWORD *)(v0 + 3400);
  if ((v5 & 1) != 0)
    v6 = *(_BYTE *)(v0 + 3415);
  v7 = (uint64_t (*)(void))qword_24F86A890[(249 * (v6 & 1)) ^ LODWORD(STACK[0xE10])];
  LODWORD(STACK[0xDDC]) = STACK[0xE10];
  *(_QWORD *)(v0 + 2168) = v4;
  *(_QWORD *)(v0 + 2176) = v1;
  *(_QWORD *)(v0 + 2184) = v2;
  LODWORD(STACK[0x11AC]) = STACK[0xE14];
  return v7();
}

void sub_22D212CA0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;

  v2 = v1[273];
  v1[274] = v2;
  v3 = v1[272];
  v1[275] = v3;
  v1[276] = v1[271];
  v4 = STACK[0xDDC];
  LODWORD(STACK[0xE10]) = STACK[0xDDC];
  LODWORD(STACK[0xE14]) = v4 ^ 0xD4;
  LOBYTE(v2) = *(_BYTE *)(v2 + *(_QWORD *)(v0 + 360) - 0x4B2B4823ADEF5FDLL);
  v5 = v3 + v1[500] - 0xD42E224ADA435AALL;
  v6 = -711945521 * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ v5) & 0x7FFFFFFF);
  v7 = (v6 ^ HIWORD(v6)) * ((v4 ^ 0xD4) - 711945947);
  LOBYTE(STACK[0x61B]) = byte_22D249F90[v7 >> 24] ^ v2 ^ byte_22D24A6A0[(v7 >> 24) + 3] ^ byte_22D24B8E0[(v7 >> 24) + 2] ^ v7 ^ (-39 * (((v6 ^ HIWORD(v6)) * ((v4 ^ 0xD4) - 711945947)) >> 24));
  v1[21] = v5;
  JUMPOUT(0x22D2128A0);
}

void sub_22D212DA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v0[279] = &STACK[0x22F8];
  LODWORD(STACK[0x22F8]) = -1084421376;
  v0[280] = STACK[0x18D0] + 1;
  LODWORD(STACK[0x6DC]) = STACK[0xE1C];
  v0[47] = 0xF4D6C5245D037E7;
  v0[48] = 0x51BB5BE831E2EB8BLL;
  v0[49] = 0x478CFE26A79B44FALL;
  v2 = v0[48];
  v1 = v0[49];
  v3 = v0[47];
  v0[50] = v1;
  v0[51] = v2;
  v0[52] = v3;
  LODWORD(v3) = STACK[0x6DC];
  LODWORD(STACK[0x714]) = STACK[0x6DC];
  v4 = v3 ^ 0x348;
  LODWORD(STACK[0x718]) = v4;
  LOBYTE(v1) = *(_BYTE *)(v4 + v1 + v0[482] - 0x478CFE26A79B4673);
  LODWORD(v4) = -711945521
              * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ (v2 + *((_DWORD *)v0 + 560) - 836955019)) & 0x7FFFFFFF);
  v5 = -711945521 * (v4 ^ WORD1(v4));
  LOBYTE(STACK[0x61B]) = byte_22D249F90[v5 >> 24] ^ v1 ^ byte_22D24A6A0[(v5 >> 24) + 3] ^ byte_22D24B8E0[(v5 >> 24) + 2] ^ v5 ^ (-39 * BYTE3(v5));
  JUMPOUT(0x22D20F394);
}

void sub_22D212F18()
{
  uint64_t v0;
  unsigned int v1;
  unsigned int v2;
  unint64_t v3;

  v1 = (*(_DWORD *)STACK[0x1848] ^ 0xBF5D0F01)
     - 2 * (((*(_DWORD *)STACK[0x1848] ^ 0xBF5D0F01) + 16) & 0x37B39A5 ^ *(_DWORD *)STACK[0x1848] & 4)
     - 2089076303;
  LODWORD(STACK[0xED0]) = v1;
  LODWORD(STACK[0xED4]) = LODWORD(STACK[0x1844]) - 24220420;
  v2 = -711945521
     * (((LODWORD(STACK[0xEB8]) + *(_DWORD *)(v0 + 2376) - 800523203) ^ *(_DWORD *)(qword_255D671B8
                                                                                  + (dword_255D671C4 & 0x4D48DDF4))) & 0x7FFFFFFF);
  v3 = -711945521 * (v2 ^ HIWORD(v2));
  LOBYTE(STACK[0x61B]) = HIBYTE(v1) ^ byte_22D2507C0[v3 >> 24] ^ byte_22D24CF70[(v3 >> 24) + 1] ^ byte_22D246D10[(v3 >> 24) + 2] ^ v3 ^ (-55 * BYTE3(v3)) ^ 0x83;
  JUMPOUT(0x22D20F394);
}

void sub_22D213058()
{
  uint64_t v0;
  char v1;
  unint64_t v2;
  unsigned int v3;
  unint64_t v4;

  v1 = STACK[0xED2];
  v2 = STACK[0x4D8];
  *(_QWORD *)(v0 + 2416) = STACK[0x4D8];
  LODWORD(STACK[0xEE4]) = LODWORD(STACK[0x1844]) + 956092671;
  v3 = -711945521
     * (((LODWORD(STACK[0xED4]) + v2 - 124259216) ^ *(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x4D48DDF4))) & 0x7FFFFFFF);
  v4 = -711945521 * (v3 ^ HIWORD(v3));
  LOBYTE(STACK[0x61B]) = v1 ^ byte_22D24CD70[v4 >> 24] ^ byte_22D2509D0[v4 >> 24] ^ byte_22D246C00[(v4 >> 24) + 6] ^ v4 ^ (47 * BYTE3(v4)) ^ 0x7B;
  JUMPOUT(0x22D2147A8);
}

void sub_22D213154()
{
  uint64_t v0;
  char v1;
  unsigned int v2;
  unint64_t v3;

  v1 = STACK[0xED1];
  LODWORD(STACK[0xEE8]) = LODWORD(STACK[0x1844]) + 1973887930;
  v2 = -711945521
     * (((LODWORD(STACK[0xEE4]) + *(_DWORD *)(v0 + 2416) - 1104572306) ^ *(_DWORD *)(qword_255D671B8
                                                                                   + (dword_255D671C4 & 0x4D48DDF4))) & 0x7FFFFFFF);
  v3 = -711945521 * (v2 ^ HIWORD(v2));
  LOBYTE(STACK[0x61B]) = v1 ^ byte_22D24CD70[v3 >> 24] ^ byte_22D2509D0[v3 >> 24] ^ byte_22D246C00[(v3 >> 24) + 6] ^ v3 ^ (47 * BYTE3(v3)) ^ 0x39;
  JUMPOUT(0x22D2147A8);
}

void sub_22D213260()
{
  uint64_t v0;
  char v1;
  unsigned int v2;
  unint64_t v3;

  v1 = STACK[0xED0];
  LODWORD(STACK[0xEBC]) = LODWORD(STACK[0x1844]) + 934807538;
  v2 = -711945521
     * (((LODWORD(STACK[0xEE8]) + *(_DWORD *)(v0 + 2416) - 2122367564) ^ *(_DWORD *)(qword_255D671B8
                                                                                   + (dword_255D671C4 & 0x4D48DDF4))) & 0x7FFFFFFF);
  v3 = -711945521 * (v2 ^ HIWORD(v2));
  LOBYTE(STACK[0x61B]) = v1 ^ byte_22D24CD70[v3 >> 24] ^ byte_22D2509D0[v3 >> 24] ^ byte_22D246C00[(v3 >> 24) + 6] ^ v3 ^ (47 * BYTE3(v3)) ^ 0xA1;
  JUMPOUT(0x22D2147A8);
}

void sub_22D213360()
{
  uint64_t v0;
  char v1;
  unsigned int v2;
  unint64_t v3;

  v1 = STACK[0x1078];
  LODWORD(STACK[0x1070]) = LODWORD(STACK[0x16E0]) - 1351843046;
  v2 = -711945521
     * (((LODWORD(STACK[0x107C]) + *(_DWORD *)(v0 + 2816) - 1001379767) ^ *(_DWORD *)(qword_255D671B8
                                                                                    + (dword_255D671C4 & 0x4D48DDF4))) & 0x7FFFFFFF);
  v3 = -711945521 * (v2 ^ HIWORD(v2));
  LOBYTE(STACK[0x61B]) = v1 ^ byte_22D24CD70[v3 >> 24] ^ byte_22D2509D0[v3 >> 24] ^ byte_22D246C00[(v3 >> 24) + 6] ^ v3 ^ (47 * BYTE3(v3)) ^ 0x50;
  JUMPOUT(0x22D20F394);
}

void sub_22D2134C0()
{
  uint64_t v0;
  char v1;
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  unint64_t v5;

  v1 = STACK[0x1079];
  v2 = STACK[0x2E8];
  *(_QWORD *)(v0 + 2816) = STACK[0x2E8];
  LODWORD(STACK[0x107C]) = LODWORD(STACK[0x16E0]) - 604317101;
  v3 = (LODWORD(STACK[0x1084]) | ((unint64_t)(LODWORD(STACK[0x1084]) < 0x1ADEC4C5uLL) << 32)) + v2;
  v4 = -711945521 * (((v3 - 450806981) ^ *(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x4D48DDF4))) & 0x7FFFFFFF);
  v5 = -711945521 * (v4 ^ HIWORD(v4));
  LOBYTE(STACK[0x61B]) = v1 ^ byte_22D24CD70[v5 >> 24] ^ byte_22D2509D0[v5 >> 24] ^ byte_22D246C00[(v5 >> 24) + 6] ^ v5 ^ (47 * BYTE3(v5)) ^ 0xF1;
  *(_QWORD *)(v0 + 168) = v3 - 0x222ACA0D8E518D73;
  JUMPOUT(0x22D2128A0);
}

void sub_22D2135C8()
{
  uint64_t v0;
  char v1;
  unsigned int v2;
  unint64_t v3;

  v1 = STACK[0x107A];
  LODWORD(STACK[0x1084]) = LODWORD(STACK[0x16E0]) - 1154889888;
  v2 = -711945521
     * (((LODWORD(STACK[0x1090]) + *(_DWORD *)(v0 + 2848) - 926210706) ^ *(_DWORD *)(qword_255D671B8
                                                                                   + (dword_255D671C4 & 0x4D48DDF4))) & 0x7FFFFFFF);
  v3 = -711945521 * (v2 ^ HIWORD(v2));
  LOBYTE(STACK[0x61B]) = v1 ^ byte_22D24CD70[v3 >> 24] ^ byte_22D2509D0[v3 >> 24] ^ byte_22D246C00[(v3 >> 24) + 6] ^ v3 ^ (47 * BYTE3(v3)) ^ 0xFA;
  JUMPOUT(0x22D1F0F88);
}

void sub_22D2136CC()
{
  uint64_t v0;
  char v1;
  unint64_t v2;
  unsigned int v3;
  unint64_t v4;

  LODWORD(STACK[0x1078]) = LODWORD(STACK[0x15AC])
                         + 1578342813
                         + (~(2 * LODWORD(STACK[0x15AC]) - 835628904) | 0x120A1D5F);
  v1 = STACK[0x107B];
  LODWORD(STACK[0x1090]) = LODWORD(STACK[0x16E0]) - 679486164;
  v2 = (LODWORD(STACK[0x1098]) | ((unint64_t)(LODWORD(STACK[0x1098]) < 0x54BB13D5uLL) << 32))
     + *(_QWORD *)(v0 + 2848);
  v3 = -711945521
     * (((LODWORD(STACK[0x1098]) + *(_DWORD *)(v0 + 2848) - 1421546453) ^ *(_DWORD *)(qword_255D671B8
                                                                                    + (dword_255D671C4 & 0x4D48DDF4))) & 0x7FFFFFFF);
  v4 = -711945521 * (v3 ^ HIWORD(v3));
  LOBYTE(STACK[0x61B]) = v1 ^ byte_22D24CD70[v4 >> 24] ^ byte_22D2509D0[v4 >> 24] ^ byte_22D246C00[(v4 >> 24) + 6] ^ v4 ^ (47 * BYTE3(v4)) ^ 0x76;
  *(_QWORD *)(v0 + 168) = v2 - 0x222ACA0DC82DDC83;
  JUMPOUT(0x22D2128A0);
}

uint64_t sub_22D213808()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;
  unsigned __int8 v4;
  char v5;
  int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;

  v4 = byte_22D24E7A0[((LOBYTE(STACK[0xFDD]) ^ 0x490504E3)
                     - ((2 * (LOBYTE(STACK[0xFDD]) ^ 0x490504E3)) & 0xFFFFFFC1)
                     - 619223328) ^ 0x9212622ELL];
  v5 = ((v4 >> 1) & 0x20) - ((v4 >> 2) & 0x30) + 107;
  v6 = LODWORD(STACK[0x116C]);
  v7 = ((2 * LODWORD(STACK[0x116C])) & 0x176 ^ 0x36) + (v6 ^ 0x3EF78EE0);
  LODWORD(STACK[0x1178]) = v7;
  v8 = (((v6 ^ 0xFFFFFF2B) + 1) ^ 0x7F7DDEDC) + v7 + ((2 * ((v6 ^ 0xFFFFFF2B) + 1)) & 0xFEFBBDB8);
  LODWORD(STACK[0x117C]) = v8 - ((2 * v8 - 2095766318) & 0xC98C567E) + 642825640;
  v9 = v3[436] + LODWORD(STACK[0x1140]);
  LOBYTE(STACK[0x61B]) = v4 ^ 0xE2 ^ ((v5 ^ 0x68) - (v5 & 0x81) + (v5 & 0x88 ^ 0x84));
  v10 = qword_24F86A890[LODWORD(STACK[0x26C]) + 1771231252];
  v3[21] = v9;
  v3[20] = v10 - 4;
  v0 = v3[21];
  LOBYTE(STACK[0x65B]) = STACK[0x61B];
  v1 = (*(uint64_t (**)(void))(qword_255D671E8
                            + 32
                            * *(unsigned __int8 *)(((v0 - qword_255D671D0) & 0xFFFFFFFFFFFFFFF0) + qword_255D671C8 + 8)
                            + 16))();
  return ((uint64_t (*)(uint64_t))v3[20])(v1);
}

void sub_22D213C50()
{
  unsigned int v0;
  char v1;

  v0 = byte_22D24E7A0[(((2 * (LOBYTE(STACK[0xFE1]) ^ 0x3B)) | 0xB1B98E32)
                                      - (LOBYTE(STACK[0xFE1]) ^ 0x3B)
                                      + 656619751) ^ 0xD8DCC7CFLL];
  v1 = STACK[0xFDB];
  LOBYTE(STACK[0x1196]) = STACK[0xFDB];
  LOBYTE(STACK[0x1197]) = (v1 ^ 0x6B) - 2 * ((((v1 ^ 0x6B) & 0xFD) + 48) ^ (v1 ^ 0x6B) & 5) + 40;
  LOBYTE(STACK[0x61B]) = v0 ^ 0xED ^ (v0 >> 2) & 0x30;
  JUMPOUT(0x22D213D50);
}

void sub_22D213D5C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = LOBYTE(STACK[0x1196]);
  v2 = byte_22D251D60[v1 ^ 0x70];
  *(_QWORD *)(v0 + 3120) = LODWORD(STACK[0x1168]) ^ 0xF7;
  LOBYTE(STACK[0x61B]) = v2 ^ LOBYTE(STACK[0x1197]) ^ v1 ^ 0x91;
  JUMPOUT(0x22D1F0F88);
}

void sub_22D213DB0()
{
  _QWORD *v0;
  char v1;
  uint64_t v2;

  v1 = ((2 * LOBYTE(STACK[0x1168])) & 0xBC ^ 0x98) + (LOBYTE(STACK[0x1168]) ^ 0xB2);
  v2 = v0[436] + LODWORD(STACK[0x10E4]);
  LOBYTE(STACK[0x61B]) = byte_22D251D60[v0[390]] ^ LOBYTE(STACK[0x1168]) ^ 0xC2 ^ (v1 - ((2 * v1 - 92) & 0xB6) - 83);
  v0[21] = v2;
  JUMPOUT(0x22D2128A0);
}

void sub_22D213E48()
{
  int v0;
  unsigned int v1;

  v0 = (((2 * (LOBYTE(STACK[0xFD9]) ^ 0x21)) & 0x36) - (LOBYTE(STACK[0xFD9]) ^ 0x21) + 260776932) ^ 0xDAB6FA6;
  v1 = byte_22D24E7A0[(((2 * v0) | 0x974A5894) - v0 + 878367670) ^ 0xC985604DLL];
  LOBYTE(STACK[0x61B]) = v1 ^ 0x37 ^ (((v1 >> 2) & 0x10)
                                    + ((v1 >> 2) & 0x30 ^ 0x10)
                                    - (((v1 >> 2) & 0x30 ^ 0x10) & 0x10)
                                    - 64);
  JUMPOUT(0x22D213EF0);
}

void sub_22D213F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,char a23)
{
  uint64_t v23;
  char v24;
  uint64_t v25;

  v24 = byte_22D24D890[(((2 * (LOBYTE(STACK[0xFD4]) ^ 0x38181211)) | 0xD88CD896)
                      - (LOBYTE(STACK[0xFD4]) ^ 0x38181211)
                      + 330929077) ^ 0xD45E7EA0];
  v25 = *(_QWORD *)(v23 + 2904);
  LOBYTE(STACK[0x61B]) = (102 * v24 - ((a23 + 12 * v24) & 0x24) - 24) ^ (51 * v24 - ((102 * v24 + 86) & 0x8A) - 16);
  *(_QWORD *)(v23 + 168) = v25;
  JUMPOUT(0x22D2128A0);
}

void sub_22D213FA0()
{
  LOBYTE(STACK[0x61B]) = byte_22D248970[(((STACK[0x1164] & 0xE2 ^ 0x2D3B5821) + 0x7FFFFFFF) | STACK[0x1164] & 0x1D ^ 0x8280000C) ^ 0xAFBB5866] ^ (((2 * (LODWORD(STACK[0x1164]) ^ 0x3D) - 78) & 0xA2) - (LODWORD(STACK[0x1164]) ^ 0x3D) - 43) ^ 0xF9;
  JUMPOUT(0x22D214030);
}

void sub_22D214038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,char a23)
{
  unsigned int v23;

  v23 = (STACK[0xFE0] & 0xB9 ^ 0xD0009080)
      + (LODWORD(STACK[0xFE0]) ^ 0xD7B277B)
      - ((LODWORD(STACK[0xFE0]) ^ 0xD7B277B) & 0x1303B9);
  LOBYTE(v23) = byte_22D24D890[((v23 & 0x163B ^ 0x4191C031) + (v23 & 0x9C4 ^ 0x22981) - 1) ^ 0x4193FD37];
  LODWORD(STACK[0x11A4]) = LOBYTE(STACK[0xFD7]);
  LOBYTE(STACK[0x61B]) = (102 * v23 - ((a23 + 76 * v23) & 0x68) + 11) ^ 0xEB ^ ((~(102 * v23 + 86) | 0x2D)
                                                                              + 51 * v23
                                                                              + 21);
  JUMPOUT(0x22D214120);
}

void sub_22D214130()
{
  uint64_t v0;
  uint64_t v1;

  LOBYTE(STACK[0x11AA]) = byte_22D251D60[LODWORD(STACK[0x11A4]) ^ 0xA6];
  v1 = *(_QWORD *)(v0 + 3016);
  LOBYTE(STACK[0x61B]) = LOBYTE(STACK[0x1177]) ^ 0xDE;
  *(_QWORD *)(v0 + 168) = v1;
  JUMPOUT(0x22D2128A0);
}

void sub_22D214178()
{
  int v0;
  unsigned int v1;

  v0 = ((LODWORD(STACK[0xFD4]) >> 8) & 0xF5) - 956455681 + ((LODWORD(STACK[0xFD4]) >> 8) & 0xA ^ 9);
  v1 = byte_22D24E7A0[((v0 & 0x77 ^ 0xD4AC4807) + (v0 & 0x388 ^ 0x381) - 1) ^ 0xD4AC4AAF];
  LOBYTE(STACK[0x61B]) = v1 ^ (((2 * ((v1 >> 2) & 0x30)) | 0x5A) - ((v1 >> 2) & 0x30) + 83) & 0xF8 ^ 0x80;
  JUMPOUT(0x22D1F0F88);
}

void sub_22D214224()
{
  char v0;
  char v1;
  char v2;

  v0 = byte_22D24D890[((LOBYTE(STACK[0xFDC]) ^ 0x67) - ((2 * (LOBYTE(STACK[0xFDC]) ^ 0x67)) & 0x1BCu) + 1246) ^ 0x409];
  v1 = (~(102 * v0 + 86) | 0x13) + 51 * v0;
  v2 = ((v1 + 34) & 0xFE ^ 0x8E) - ((2 * ((v1 + 34) & 0xFE ^ 0x8E)) & 0x68) + 52;
  LOBYTE(STACK[0x61B]) = (102 * v0 - ((12 * v0 + 12) & 0x10) + 94) ^ (((-33 - v1) & 1 ^ 0x4F) + 88) ^ 5 ^ ((v2 & 0xB0) + (v2 ^ 0xFB) + (v2 | 0x4F) + 1);
  JUMPOUT(0x22D214308);
}

void sub_22D21431C()
{
  int v0;
  char v1;

  v0 = ((((2 * LODWORD(STACK[0x1170])) ^ 0x69BC)
       - 2 * (((2 * LODWORD(STACK[0x1170])) ^ 0x69BC) & 0x22222222 ^ (2 * LODWORD(STACK[0x1170])) & 2)
       + 33) & 0xB2 ^ 0xA2)
     + (LODWORD(STACK[0x1170]) ^ 0x3466);
  LOBYTE(v0) = (((2 * v0) & 0xBE) + (v0 ^ 0xDF) - ((2 * (((2 * v0) & 0xBE) + (v0 ^ 0xDF)) + 66) & 0x88) - 27) ^ byte_22D248970[((STACK[0x1170] & 0x9D ^ 0x9F9C) + (LODWORD(STACK[0x1170]) ^ 1) - ((LODWORD(STACK[0x1170]) ^ 1) & 0x9Du)) ^ 0x9F54];
  v1 = ((2 * v0) ^ 0x70) - ((2 * ((2 * v0) ^ 0x70)) & 0x5C) + 47;
  LOBYTE(STACK[0x61B]) = (((v0 ^ 0x38) - 28) ^ 0x45)
                       + ((2 * ((v0 ^ 0x38) - 28)) & 0x8A)
                       + (v1 & 0xC8 ^ 0x89)
                       + ((2 * v1) & 0x90 ^ 0xEF)
                       + 59;
  JUMPOUT(0x22D214434);
}

void sub_22D214444()
{
  uint64_t v0;

  STACK[0x210] = *(_QWORD *)(v0 + 4000);
  LODWORD(STACK[0x2E4]) = 0;
  JUMPOUT(0x22D21449CLL);
}

uint64_t sub_22D214570(void *a1)
{
  int v1;
  int v2;
  _BOOL4 v3;

  v2 = 49 * (v1 ^ (v1 + 17));
  free(a1);
  v3 = LODWORD(STACK[0x4C4]) != v2 - 470 + (v2 ^ 0xFFFF545F) + 44343;
  return ((uint64_t (*)(void))(qword_24F86A890[(v3 | (8 * v3)) ^ v2] - 4))();
}

uint64_t sub_22D214608()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  BOOL v7;
  char v8;
  char v9;
  char v10;
  uint64_t (*v11)(void);

  v2 = v1[406] + 1;
  v3 = v1[405] + 1;
  v4 = v1[407];
  v5 = v4 + 1;
  v4 -= 0x109BB6758AA95ADBLL;
  v6 = v4 < 0xE56F0661;
  v7 = v4 >= *(_QWORD *)(v0 + 57);
  v8 = *(_BYTE *)(v0 + 72);
  v9 = v8 ^ v6;
  v10 = !v7;
  if ((v9 & 1) == 0)
    v8 = v10;
  v11 = (uint64_t (*)(void))(qword_24F86A890[(502 * (v8 & 1)) ^ LODWORD(STACK[0x1228])] - 4);
  LODWORD(STACK[0x11F4]) = STACK[0x1228];
  v1[402] = v5;
  v1[403] = v2;
  v1[404] = v3;
  return v11();
}

void sub_22D2146A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  unsigned int v6;
  unint64_t v7;
  char v8;
  char v9;

  v2 = *(_QWORD *)(v1 + 3232);
  *(_QWORD *)(v1 + 3240) = v2;
  v3 = *(_QWORD *)(v1 + 3224);
  *(_QWORD *)(v1 + 3248) = v3;
  *(_QWORD *)(v1 + 3256) = *(_QWORD *)(v1 + 3216);
  v4 = STACK[0x11F4];
  LODWORD(STACK[0x1228]) = STACK[0x11F4];
  v5 = 13 * (v4 ^ 0x2EE);
  LOBYTE(v2) = *(_BYTE *)(v2 + *(_QWORD *)(v0 + 225) - 0x1B5E0344194BBFB3);
  v6 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ (v3 + *(_DWORD *)(v1 + 3792) + 616267934)) & 0x7FFFFFFF);
  v7 = (v6 ^ HIWORD(v6)) * (v5 ^ 0xD59092D5);
  v8 = byte_22D251010[v7 >> 24];
  v9 = byte_22D24C420[v7 >> 24];
  LODWORD(STACK[0x122C]) = v5;
  LOBYTE(STACK[0x61B]) = v8 ^ v2 ^ v9 ^ byte_22D246E20[(v7 >> 24) + 1] ^ v7 ^ (115 * BYTE3(v7));
  JUMPOUT(0x22D2147A0);
}

uint64_t sub_22D2147B4()
{
  uint64_t v0;
  int v1;
  unsigned int v2;
  char v3;
  char v4;
  uint64_t (*v5)(void);

  v1 = LODWORD(STACK[0xD3C]) + 1;
  v2 = LODWORD(STACK[0xD3C]) + 876361219;
  v3 = *(_BYTE *)(v0 + 3399) ^ (v2 < 0x7BA51017);
  v4 = v2 < LODWORD(STACK[0x12A8]);
  if ((v3 & 1) != 0)
    v4 = *(_BYTE *)(v0 + 3399);
  v5 = (uint64_t (*)(void))qword_24F86A890[(498 * (v4 & 1)) ^ LODWORD(STACK[0xD40])];
  LODWORD(STACK[0xD34]) = STACK[0xD40];
  LODWORD(STACK[0xD38]) = v1;
  return v5();
}

uint64_t sub_22D214824()
{
  int v0;
  uint64_t v1;
  unsigned int v2;
  int v3;
  int v4;
  char v5;
  int v6;
  uint64_t v7;

  v2 = STACK[0xE70];
  v3 = LODWORD(STACK[0xE70]) + 1;
  v4 = LODWORD(STACK[0xE74]) + 1;
  LODWORD(STACK[0xE8C]) = v4;
  v2 += 1252707372;
  v5 = *(_BYTE *)(v1 + 3387) ^ (v2 < 0x7D9644D3);
  v6 = v2 < LODWORD(STACK[0x129C]);
  if ((v5 & 1) != 0)
    v6 = *(unsigned __int8 *)(v1 + 3387);
  v7 = qword_24F86A890[(1904 * (v0 & ~v6)) ^ LODWORD(STACK[0xE78])];
  LODWORD(STACK[0xE64]) = STACK[0xE78];
  LODWORD(STACK[0xE68]) = v4;
  LODWORD(STACK[0xE6C]) = v3;
  return ((uint64_t (*)(void))(v7 - 12))();
}

uint64_t sub_22D2148AC()
{
  uint64_t v0;
  _BOOL4 v1;

  LODWORD(STACK[0x37C]) = STACK[0xEBC];
  v1 = *(_DWORD *)STACK[0x1848] != -1084420351;
  *(_QWORD *)(v0 + 2392) = STACK[0x4D8];
  return ((uint64_t (*)(void))qword_24F86A890[LODWORD(STACK[0xE9C]) ^ (175 * v1)])();
}

uint64_t sub_22D214900()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = STACK[0xEA0];
  *(_QWORD *)(v1 + 72) = v2[296] - 0x6618A9C996C073A9;
  v4 = STACK[0xEBC];
  LODWORD(STACK[0xF2C]) = v3;
  LODWORD(STACK[0xF30]) = v4;
  LODWORD(STACK[0xF34]) = 1187453116;
  v5 = STACK[0xF34];
  LODWORD(STACK[0xF38]) = STACK[0xF34];
  LODWORD(STACK[0xF3C]) = STACK[0xF30];
  v6 = STACK[0xF2C];
  LODWORD(STACK[0xF40]) = STACK[0xF2C];
  LODWORD(STACK[0xF44]) = v6 + 1771230249;
  v7 = **(_QWORD **)(v1 + 72) + (v5 - 1187453116);
  v2[316] = v7;
  v2[64] = v7;
  v2[62] = *(_QWORD *)(v0 + 8 * (int)(v6 ^ 0x966D285E));
  v8 = ((v2[64] - qword_255D671D0) & 0xFFFFFFFFFFFFFFF0) + qword_255D671C8;
  v9 = (*(uint64_t (**)(_QWORD, unint64_t *, uint64_t))(qword_255D671E8
                                                                      + 32 * *(unsigned __int8 *)(v8 + 8)
                                                                      + 8))(*(_QWORD *)v8, &STACK[0x7A3], 1);
  LOBYTE(STACK[0x767]) = STACK[0x7A3];
  return ((uint64_t (*)(uint64_t))v2[62])(v9);
}

uint64_t sub_22D214BC4()
{
  int v0;
  uint64_t v1;
  unsigned int v2;
  int v3;
  char v4;
  int v5;
  uint64_t (*v6)(void);

  v2 = STACK[0xF5C];
  v3 = LODWORD(STACK[0xF5C]) + 1;
  LODWORD(STACK[0xF78]) = v3;
  v2 -= 264167251;
  v4 = *(_BYTE *)(v1 + 3999) ^ (v2 < 0x17BE3925);
  v5 = v2 < LODWORD(STACK[0x1500]);
  if ((v4 & 1) != 0)
    v5 = *(unsigned __int8 *)(v1 + 3999);
  v6 = (uint64_t (*)(void))qword_24F86A890[(1010 * (v0 & ~v5)) ^ LODWORD(STACK[0xF60])];
  LODWORD(STACK[0xF54]) = STACK[0xF60];
  LODWORD(STACK[0xF58]) = v3;
  return v6();
}

uint64_t sub_22D214C3C()
{
  int v0;

  LODWORD(STACK[0x3BC]) = STACK[0x1070];
  v0 = STACK[0x368];
  LODWORD(STACK[0x1074]) = STACK[0x368];
  return ((uint64_t (*)(void))(qword_24F86A890[LODWORD(STACK[0x105C]) ^ 0x18E75460 ^ (13
                                                                                   * (((LODWORD(STACK[0x105C]) - v0) | (v0 - LODWORD(STACK[0x105C]))) >= 0))]
                            - 8))();
}

void sub_22D214C94()
{
  uint64_t v0;
  int v1;
  unsigned int v2;
  unint64_t v3;
  int v4;
  unint64_t v5;

  v1 = STACK[0x1060];
  *(_QWORD *)(v0 + 3368) = STACK[0x360];
  v2 = LODWORD(STACK[0x1074]) + 1689185551;
  LODWORD(STACK[0x129C]) = v2;
  *(_BYTE *)(v0 + 3387) = v2 < 0x7D9644D3;
  LODWORD(STACK[0xE64]) = v1;
  LODWORD(STACK[0xE68]) = STACK[0x1070];
  LODWORD(STACK[0xE6C]) = 854292648;
  v3 = LODWORD(STACK[0xE6C]);
  LODWORD(STACK[0xE70]) = v3;
  LODWORD(STACK[0xE74]) = STACK[0xE68];
  v4 = STACK[0xE64];
  LODWORD(STACK[0xE78]) = STACK[0xE64];
  LODWORD(STACK[0xE7C]) = v4 - 1771230833;
  v5 = (v3 | ((unint64_t)(v3 < 0x32EB78A8) << 32)) + *(_QWORD *)(v0 + 3368);
  *(_QWORD *)(v0 + 2328) = v5 - 854292648;
  *(_QWORD *)(v0 + 512) = v5 - 0x5A72C1CED40FD86BLL;
  JUMPOUT(0x22D2050ACLL);
}

void sub_22D214D68()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 512) = *(_QWORD *)(v0 + 2888);
  JUMPOUT(0x22D20E784);
}

uint64_t sub_22D214DE0()
{
  int v0;

  v0 = LODWORD(STACK[0x112C]) + 615689705 - ((2 * LODWORD(STACK[0x112C]) + 32) & 0x49655BD2) + 16;
  LODWORD(STACK[0xFE4]) = v0;
  return ((uint64_t (*)(void))(qword_24F86A890[((16 * ((v0 ^ 0x24B2ADE9u) < LODWORD(STACK[0x1454]))) | (((v0 ^ 0x24B2ADE9u) < LODWORD(STACK[0x1454])) << 6)) ^ LODWORD(STACK[0xFC0])]
                            - 12))();
}

uint64_t sub_22D214E44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t (*v5)(void);

  v1 = *(_QWORD *)(v0 + 3184) + 1;
  v2 = *(_QWORD *)(v0 + 3176) + 1;
  v3 = *(_QWORD *)(v0 + 3192);
  v4 = *(_BYTE *)(v0 + 3427);
  if (((v4 ^ ((unint64_t)(v3 - 0x5AD05BD19AAA4E1ELL) < 0x864723CB)) & 1) == 0)
    v4 = (unint64_t)(v3 - 0x5AD05BD19AAA4E1ELL) < *(_QWORD *)(v0 + 3416);
  v5 = (uint64_t (*)(void))qword_24F86A890[(11 * (v4 & 1)) ^ LODWORD(STACK[0x11EC])];
  LODWORD(STACK[0x11B4]) = STACK[0x11EC];
  *(_QWORD *)(v0 + 3152) = v3 + 1;
  *(_QWORD *)(v0 + 3160) = v1;
  *(_QWORD *)(v0 + 3168) = v2;
  return v5();
}

void sub_22D214ED8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  unint64_t v5;

  v1 = *(_QWORD *)(v0 + 3168);
  *(_QWORD *)(v0 + 3176) = v1;
  v2 = *(_QWORD *)(v0 + 3160);
  *(_QWORD *)(v0 + 3184) = v2;
  *(_QWORD *)(v0 + 3192) = *(_QWORD *)(v0 + 3152);
  v3 = STACK[0x11B4];
  LODWORD(STACK[0x11EC]) = STACK[0x11B4];
  LODWORD(STACK[0x11F0]) = v3 - 646;
  v4 = -711945521
     * (((*(_DWORD *)(v0 + 3624) + v2 + ((v3 - 646) ^ 0x42C3514C)) ^ *(_DWORD *)(qword_255D671B8
                                                                               + (dword_255D671C4 & 0x58B8A3F0))) & 0x7FFFFFFF);
  v5 = -711945521 * (v4 ^ HIWORD(v4));
  LOBYTE(STACK[0x61B]) = byte_22D249F90[v5 >> 24] ^ *(_BYTE *)(v1 + *(_QWORD *)(v0 + 4080) - 0x78C746B69B1BC625) ^ byte_22D24A6A0[(v5 >> 24) + 3] ^ byte_22D24B8E0[(v5 >> 24) + 2] ^ v5 ^ (-39 * BYTE3(v5));
  JUMPOUT(0x22D20EF78);
}

uint64_t sub_22D214FDC()
{
  int v0;
  uint64_t (*v1)(void);

  v0 = STACK[0x1238];
  v1 = (uint64_t (*)(void))qword_24F86A890[(204 * (LODWORD(STACK[0x1238]) == 1906197993)) ^ LODWORD(STACK[0x1244])];
  LODWORD(STACK[0x1230]) = STACK[0x123C];
  LODWORD(STACK[0x1234]) = v0 + 1;
  return v1();
}

void sub_22D215034()
{
  LODWORD(STACK[0x37C]) = STACK[0xF50];
  JUMPOUT(0x22D20DB34);
}

uint64_t sub_22D215094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38)
{
  unint64_t v38;
  uint64_t v39;
  _QWORD *v41;
  char v42;
  unsigned int v43;
  char v44;
  char v45;
  uint64_t v46;

  v42 = STACK[0x767];
  v43 = (STACK[0xFB0] & 0xFFFFFFF0 ^ 0x24B2ADEF)
      + 698341101
      - ((2 * (STACK[0xFB0] & 0xFFFFFFF0 ^ 0x24B2ADEF)) & 0x533FADE0);
  LODWORD(STACK[0xFE8]) = v43;
  v44 = v42 + ((-54 * (LOBYTE(STACK[0xFD0]) ^ 0x2D)) & 0xB4) + ((101 * (LOBYTE(STACK[0xFD0]) ^ 0x2D)) ^ 0xDA) + 94;
  v45 = v44 - ((2 * v44) & 0xF3) - 7;
  LOBYTE(STACK[0xFEE]) = v45;
  LOBYTE(STACK[0xFEF]) = v45 ^ 0x61;
  v46 = v41[436] + (v43 ^ 0x299FD6F3);
  v41[337] = v46;
  v41[64] = v46;
  v41[62] = qword_24F86A890[a38 + 1063];
  v38 = ((v41[64] - qword_255D671D0) & 0xFFFFFFFFFFFFFFF0) + qword_255D671C8;
  v39 = (*(uint64_t (**)(_QWORD, unint64_t *, uint64_t))(qword_255D671E8
                                                                       + 32 * *(unsigned __int8 *)(v38 + 8)
                                                                       + 8))(*(_QWORD *)v38, &STACK[0x7A3], 1);
  LOBYTE(STACK[0x767]) = STACK[0x7A3];
  return ((uint64_t (*)(uint64_t))v41[62])(v39);
}

uint64_t sub_22D2157F8()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t (*v11)(void);

  v1 = LOBYTE(STACK[0x767]);
  LOBYTE(STACK[0xD7E]) = v1;
  v2 = STACK[0xD68];
  v3 = ((*(_DWORD *)(qword_255D671B8 + ((LODWORD(STACK[0xD64]) + 1488494695) & dword_255D671C4)) ^ LODWORD(STACK[0xD70])) & 0x7FFFFFFF)
     * (LODWORD(STACK[0xD68]) ^ 0x43FDBF84);
  v4 = -711945521 * (v3 ^ HIWORD(v3));
  v5 = HIBYTE(v4);
  LOBYTE(STACK[0xD7F]) = v4;
  *(_QWORD *)(v0 + 2072) = v5;
  v6 = byte_22D251110[v5];
  v7 = byte_22D24D480[v5];
  v8 = (v5 + 2);
  *(_QWORD *)(v0 + 2080) = v8;
  LODWORD(v8) = byte_22D24D580[v8];
  LOBYTE(STACK[0xD96]) = HIBYTE(v4);
  v9 = v7 ^ v6 ^ v8 ^ (-83 * v5) ^ v4 ^ v1;
  LOBYTE(STACK[0xD97]) = v9;
  LODWORD(STACK[0xD98]) = ((2 * (char)v9) & 0xD9A9F77A) + ((char)v9 ^ 0xECD4FBBD);
  v10 = ((STACK[0xD60] & (LODWORD(STACK[0xD60]) ^ v9) | (LODWORD(STACK[0xD60]) - v9) & ~(LODWORD(STACK[0xD60]) ^ v9)) >> 7) & 1;
  v11 = (uint64_t (*)(void))(qword_24F86A890[LODWORD(STACK[0xD60]) ^ 0x1CC ^ ((4 * v10) | (16 * v10))] - 8);
  LODWORD(STACK[0x7B0]) = v2;
  LODWORD(STACK[0x7B4]) = 1415711971;
  return v11();
}

uint64_t sub_22D215940@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  char v2;
  char v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((23
                                          * ((char)(byte_22D2508C0[*(_QWORD *)(v4 + 2080)] ^ byte_22D250CE0[*(_QWORD *)(v4 + 2072)] ^ byte_22D24A5A0[*(_QWORD *)(v4 + 2072)] ^ (23 * LOBYTE(STACK[0xD96])) ^ LOBYTE(STACK[0xD7F]) ^ LOBYTE(STACK[0xD7E])) >= (char)(((a2 - v2 + 118) ^ (v3 + 93)) + 87))) ^ a2))
                            - 12))();
}

void sub_22D2159C8()
{
  int v0;
  int v1;

  v1 = LODWORD(STACK[0xD98]) + 1737298167;
  LODWORD(STACK[0x7B0]) = v0;
  LODWORD(STACK[0x7B4]) = v1;
  JUMPOUT(0x22D2159E4);
}

void sub_22D215A78()
{
  _QWORD *v0;
  char v1;
  char v2;
  unsigned int v3;
  uint64_t v4;

  v1 = STACK[0x767];
  LOBYTE(STACK[0xFFF]) = byte_22D251B10[LOBYTE(STACK[0xFEF])];
  v2 = v1 - 54 * (LOBYTE(STACK[0xFE8]) ^ 0xF3) + ((101 * (LOBYTE(STACK[0xFE8]) ^ 0xF3)) ^ 0x7F);
  v3 = (STACK[0xFB0] & 0xFFFFFFF4 ^ 0x24B2ADEB)
     - 1260260308
     - ((2 * (STACK[0xFB0] & 0xFFFFFFF4 ^ 0x24B2ADEB)) & 0x69C3E868);
  LODWORD(STACK[0x1000]) = v3;
  LOBYTE(STACK[0x1007]) = v2 + (~(2 * v2 + 114) | 0x3F) - 102;
  v4 = v0[436] + (v3 ^ 0xB4E1F43C);
  v0[340] = v4;
  v0[64] = v4;
  JUMPOUT(0x22D21654CLL);
}

void sub_22D215B30()
{
  _QWORD *v0;
  char v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;
  char v10;
  uint64_t v11;

  v1 = STACK[0x767];
  v2 = LOBYTE(STACK[0xFEE]);
  v3 = LOBYTE(STACK[0xFFF]);
  v4 = (v2 ^ v3 ^ 0x28) + 1;
  v2 ^= 0x35u;
  v5 = v2 + (v4 ^ 0xFFFFFFFB) + ((2 * v4) & 0xFFFFFFF7) + 5;
  LOBYTE(STACK[0x1013]) = byte_22D247540[LOBYTE(STACK[0x1007]) ^ 0xDDLL];
  v6 = (STACK[0xFB0] & 0xFFFFFFF3 ^ 0x24B2ADED)
     + 1197861406
     + ((2 * (STACK[0xFB0] & 0xFFFFFFF3 ^ 0x24B2ADED)) & 0x8ECBD424 ^ 0xFFFFFFE7)
     + 1;
  LODWORD(STACK[0x1014]) = v6;
  v7 = ((v5 - ((2 * v5) & 0xFFFFFF8F) + 71) ^ v3 ^ ((v3 ^ 0x1D) - ((2 * (v3 ^ 0x1D) + 2) & 0xFFFFFFDC) + 111) ^ 0xFFFFFFCB)
     + v2;
  v8 = (v7 ^ 0xBB) + ((2 * v7) & 0x76) + 69;
  v9 = (((v8 - ((2 * v8) & 0x120)) << 16) + 1452277760) ^ 0x56900000;
  LODWORD(STACK[0x1018]) = v9 - 882544292 - ((2 * v9) & 0x16CA0000);
  v10 = ((-54 * (LOBYTE(STACK[0x1000]) ^ 0x3C)) & 0xF8) + v1 + ((101 * (LOBYTE(STACK[0x1000]) ^ 0x3C)) ^ 0xFC);
  LOBYTE(STACK[0x101F]) = v10 - 2 * ((v10 + 60) & 0x4B ^ v10 & 2) - 123;
  v11 = v0[436] + (v6 ^ 0x4765EA1E);
  v0[343] = v11;
  v0[64] = v11;
  JUMPOUT(0x22D21654CLL);
}

void sub_22D215CEC()
{
  uint64_t v0;
  unsigned int v1;
  int v2;
  int v3;
  unsigned int v4;
  int v5;

  v1 = ((10 * (LOBYTE(STACK[0x1014]) ^ 0x1E)) & 0x2E)
     + LOBYTE(STACK[0x767])
     + ((101 * (LOBYTE(STACK[0x1014]) ^ 0x1E)) ^ 0xFFFFFF97);
  v2 = v1 - ((2 * v1 + 2) & 0x36) - 68;
  v3 = byte_22D248760[v2 ^ 0x7BLL];
  LOBYTE(STACK[0x102B]) = byte_22D247540[LOBYTE(STACK[0x101F]) ^ 0x99];
  v4 = (STACK[0xFB0] & 0xFFFFFFF5 ^ 0x24B2ADEB)
     + 121018413
     + ((2 * (STACK[0xFB0] & 0xFFFFFFF5 ^ 0x24B2ADEB)) & 0xE6D304A ^ 0xFFFFFFEF)
     + 1;
  LODWORD(STACK[0x102C]) = v4;
  v5 = ((((v3 ^ v2 ^ 0x99) - ((2 * (v3 ^ v2 ^ 0x99)) & 0x66666666)) << 24) + 855638016) ^ 0x33000000;
  LODWORD(STACK[0x1030]) = v5 + 1452865643 - ((2 * v5) & 0xAC000000);
  *(_QWORD *)(v0 + 512) = *(_QWORD *)(v0 + 3488) + (v4 ^ 0x736982D);
  JUMPOUT(0x22D2050ACLL);
}

void sub_22D215E10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,char a22)
{
  _QWORD *v22;
  char v23;
  char v24;
  unsigned int v25;
  char v26;
  unsigned int v27;
  unsigned __int8 v28;
  uint64_t v29;

  v23 = STACK[0x767];
  v24 = LOBYTE(STACK[0x102C]) ^ 0x2D;
  v25 = ((LOBYTE(STACK[0x1013]) ^ 0xEB) - 1279360559 - ((2 * (LOBYTE(STACK[0x1013]) ^ 0xEB)) & 0x1A2)) ^ 0xB3BE81D1 | LODWORD(STACK[0x1030]) ^ 0x5698F86B;
  LODWORD(STACK[0x1034]) = v25 + 402613626 - ((2 * v25) & 0x2FFECAF4);
  v26 = v23 + ((22 * v24) & 0x1E) + ((-101 * v24) ^ 0x8F) + ((-54 * v24) ^ 0xAB) + ((20 * v24) & 0x54) + 67;
  v27 = (STACK[0xFB0] & 0xFFFFFFFD ^ 0x24B2ADEB)
      - 724237265
      - ((2 * (STACK[0xFB0] & 0xFFFFFFFD ^ 0x24B2ADEB)) & 0xA9AA085E);
  LODWORD(STACK[0x1038]) = v27;
  v28 = byte_22D249E90[(v26 - ((2 * v26 + 54) & 0x22) - 52) ^ 0x94];
  LOBYTE(STACK[0x103F]) = 25 * v28 - ((a22 + 50 * v28) & 0x8C) + 18;
  v29 = v22[436] + (v27 ^ 0xD4D5042F);
  v22[347] = v29;
  v22[64] = v29;
  JUMPOUT(0x22D216178);
}

void sub_22D216184()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;

  v1 = LOBYTE(STACK[0x767]);
  v2 = LOBYTE(STACK[0x10BB]);
  v3 = byte_22D248760[v2 ^ 0xC3];
  v4 = LOBYTE(STACK[0x10AC]) ^ 0xFFFFFF87;
  v5 = STACK[0xFB0] & 0xFFFFFFFA ^ 0x24B2ADED;
  LODWORD(STACK[0x10C8]) = v5;
  v6 = v5 + 1305709474 - ((2 * v5) & 0x9BA71744);
  LODWORD(STACK[0x10CC]) = v6;
  LODWORD(v2) = ((((v3 ^ v2 ^ 0xD2) - ((2 * (v3 ^ v2 ^ 0xD2)) & 0x6C)) << 24) - 1241513984) ^ 0xB6000000;
  LODWORD(STACK[0x10D0]) = v2 + 1620852724 - (v2 >> 29 << 30);
  v7 = ((101 * v4) ^ 0x11) - v1 - ((-54 * v4) & 0xFFFFFFDC) + 54;
  LODWORD(v2) = (v7 ^ 0x63) + 1411570620 - ((2 * (v7 ^ 0x63)) & 0x178);
  LODWORD(STACK[0x10D4]) = v2;
  LODWORD(v2) = v2 ^ 0x5422DBBC;
  v8 = (v7 ^ 0xC0C1A2EB) - ((2 * (v7 ^ 0x40)) & 0xA8) + 1061051733 + v2;
  v9 = v8 - ((2 * v8) & 0xB2C13ABC) - 647979682;
  LODWORD(STACK[0x10D8]) = v9;
  LODWORD(STACK[0x10DC]) = ((v9 ^ 0x2A0) & v2) - ((2 * ((v9 ^ 0x2A0) & v2)) & 0x3C43B17A) + 505534682;
  *(_QWORD *)(v0 + 512) = *(_QWORD *)(v0 + 3488) + (v6 ^ 0x4DD38BA2);
  JUMPOUT(0x22D21654CLL);
}

void sub_22D216318()
{
  uint64_t v0;
  unsigned __int8 *v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  v1 = &byte_22D247540[(LODWORD(STACK[0x10D4]) ^ LODWORD(STACK[0x10D8]) ^ 0x72BDB91C)
                     - 1811922903
                     + ((2 * LODWORD(STACK[0x10DC]) - 58) ^ 0x57BC0EAD)
                     + ((2 * (2 * LODWORD(STACK[0x10DC]) - 58)) & 0x57FF7FAC ^ 0x508762A4)];
  v2 = LOBYTE(STACK[0x767])
     + ((10 * (LOBYTE(STACK[0x10CC]) ^ 0xFFFFFFA2)) & 0x3A)
     + ((101 * (LOBYTE(STACK[0x10CC]) ^ 0xFFFFFFA2)) ^ 0xFFFFFF9D);
  v3 = (v2 + 99 - ((2 * (v2 + 99)) & 0xFFFFFFC7) + 99) ^ 0x63;
  v4 = v3 - ((2 * v3 + 112) & 0xFFFFFFCC) + 30;
  v5 = ((*v1 ^ 0x71) - 1128257783 - ((2 * (*v1 ^ 0x71)) & 0x12)) ^ 0xBCC02709 | LODWORD(STACK[0x10A0]) ^ 0xB5EDB81E;
  v6 = byte_22D251B10[v4 ^ 0xB4];
  LODWORD(STACK[0x10E0]) = v5 - 1701436056 - ((2 * v5) & 0x352C4AD0);
  v7 = STACK[0xFB0] & 0xFFFFFFF7 ^ 0x24B2ADE9;
  LODWORD(STACK[0x10E4]) = v7;
  v8 = v7 + 1309622145 - ((2 * v7) & 0x9C1E7F02);
  LODWORD(STACK[0x10E8]) = v8;
  v9 = ((((((v4 ^ v6) & 0xFFFFFFFE ^ 0xFFFFFFF9) - 1) & 0xFFFFFFFE | ((v2 + 100) ^ v6) & 1) ^ 0x18)
      - 2
      * ((((((v4 ^ v6) & 0xFFFFFFFE ^ 0xFFFFFFF9) - 1) & 0xFFFFFFFE | ((v2 + 100) ^ v6) & 1) ^ 0x18) & 0x3F ^ (((v4 ^ v6) & 0xFFFFFFFE ^ 0xFFFFFFF9) - 1) & 6)
      + 57) ^ 0xC9;
  v10 = (((v9 - ((2 * v9) & 0x8A)) << 16) - 1908080640) ^ 0x8E450000;
  LODWORD(STACK[0x10EC]) = v10 - 1820719299 - ((2 * v10) & 0x26F40000);
  *(_QWORD *)(v0 + 512) = *(_QWORD *)(v0 + 3488) + (v8 ^ 0x4E0F3F81);
  JUMPOUT(0x22D216540);
}

void sub_22D216558()
{
  _QWORD *v0;
  char v1;
  unsigned int v2;
  int v3;
  int v4;
  char v5;
  char v6;
  char v7;
  unsigned int v8;
  uint64_t v9;

  v1 = STACK[0x767];
  v2 = (((2 * (STACK[0x109C] & 0x51F1 ^ 0x11A0)) & 0x2280) - (STACK[0x109C] & 0x51F1 ^ 0x11A0) + 1259063995) ^ 0xCB0BF7B9;
  v3 = ((STACK[0x109C] & 0x8802 ^ 0x803) + (STACK[0x109C] & 0x260C ^ 0x2BE63455) - 2) ^ 0x2B6632FD;
  LODWORD(STACK[0x1104]) = ((2 * v3) & 0x1191E) - v3 - 1393073360;
  v4 = STACK[0x10FC];
  v5 = v1 + ((74 * (LOBYTE(STACK[0x10F8]) ^ 0x5B)) & 0x74) + ((101 * (LOBYTE(STACK[0x10F8]) ^ 0x5B)) ^ 0xBA);
  v6 = v5 + 84;
  v7 = v5 + 84 + ~(2 * ((v5 + 94) & 0x17 ^ (v5 + 84) & 1)) + 65;
  LOBYTE(STACK[0x110A]) = v7;
  LOBYTE(STACK[0x110B]) = -(~v6 & 2) - 94;
  v8 = (((2 * (v4 & 0x2F000000 ^ 0x16319002)) & 0x14632000) - (v4 & 0x2F000000 ^ 0x16319002) - 1257758714) ^ 0xA239B004 | (v2 - ((2 * v2) & 0xE5C2) + 253457125) ^ 0x8F1B5EA7;
  LODWORD(STACK[0x110C]) = v8 + 636030608 - ((2 * v8) & 0x4BD21D20);
  LODWORD(STACK[0x1110]) = (v4 & 0x40000000 ^ 0x652348C0) + (v4 & 0xD0000000 | 0x442000) - (v4 & 0x40000000 | 0x2000);
  LOBYTE(STACK[0x1117]) = v7 ^ 0x99;
  v9 = v0[436] + (LODWORD(STACK[0x1100]) ^ 0x1EED6319u);
  v0[374] = v9;
  v0[64] = v9;
  JUMPOUT(0x22D2167C0);
}

void sub_22D2167D0()
{
  uint64_t v0;
  char v1;
  unsigned __int8 v2;
  char v3;
  unsigned int v4;
  unsigned int v5;

  v1 = STACK[0x767];
  v2 = LOBYTE(STACK[0x1123]) - ((2 * LOBYTE(STACK[0x1123]) + 118) & 0xE4) + 45;
  LOBYTE(STACK[0x113D]) = v2;
  v3 = ((-54 * (LOBYTE(STACK[0xFB0]) ^ 0xE9)) & 0xEA) + v1 + ((101 * (LOBYTE(STACK[0xFB0]) ^ 0xE9)) ^ 0xF5);
  LOBYTE(STACK[0x113E]) = byte_22D251B10[v2 ^ 0x8ELL];
  LOBYTE(STACK[0x113F]) = v3 - ((2 * v3 - 122) & 0xAA) - 104;
  v4 = STACK[0xFB0] & 0xFFFFFFF9 ^ 0x24B2ADEF;
  LODWORD(STACK[0x1140]) = v4;
  v5 = v4 + 1329911546 - ((2 * v4) & 0x9E89ADF4);
  LODWORD(STACK[0x1144]) = v5;
  *(_QWORD *)(v0 + 512) = *(_QWORD *)(v0 + 3488) + (v5 ^ 0x4F44D6FA);
  JUMPOUT(0x22D2168C0);
}

void sub_22D2168D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _QWORD *v22;
  char v23;
  int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  unsigned __int8 v31;
  uint64_t v32;

  v23 = ((74 * (LOBYTE(STACK[0x1144]) ^ 0xFA)) & 0x7E)
      + LOBYTE(STACK[0x767])
      + ((101 * (LOBYTE(STACK[0x1144]) ^ 0xFA)) ^ 0xBF);
  v24 = LOBYTE(STACK[0x113D]) ^ LOBYTE(STACK[0x113E]) ^ 0x67;
  v25 = (((v24 - ((2 * v24) & 0xE0)) << 16) - 1049624576) ^ 0xC1700000;
  v26 = byte_22D248760[LOBYTE(STACK[0x113F]) ^ 0xDDLL] ^ LOBYTE(STACK[0x113F]) ^ 0xFE;
  v27 = (((v26 - ((2 * v26) & 0xC8)) << 24) - 469762048) ^ 0xE4000000;
  v28 = (v27 + 2120666273 - (v27 >> 25 << 26)) ^ 0x7E66CCA1 | LODWORD(STACK[0x10E0]) ^ 0x9A962568;
  LODWORD(STACK[0x1148]) = v28 - ((2 * v28) & 0x14615944) + 170962082;
  v29 = (v25 + 1848927871 - ((2 * v25) & 0x5C680000)) ^ 0x6E34667F | LODWORD(STACK[0x1124]) ^ 0x696B882;
  LODWORD(STACK[0x114C]) = v29 - ((2 * v29) & 0xE32C972A) - 241808491;
  v30 = (STACK[0xFB0] & 0xFFFFFFF8 ^ 0x24B2ADEF)
      - 1579794192
      - ((2 * (STACK[0xFB0] & 0xFFFFFFF8 ^ 0x24B2ADEF)) & 0x43AC81E0);
  LODWORD(STACK[0x1150]) = v30;
  v31 = byte_22D249E90[(v23 - ((2 * v23 + 114) & 0x5A) + 38) ^ 0x74];
  LOBYTE(STACK[0x1157]) = 25 * v31 - ((a22 + 50 * v31) & 0x2E) + 99;
  v32 = v22[436] + (v30 ^ 0xA1D640F0);
  v22[382] = v32;
  v22[64] = v32;
  JUMPOUT(0x22D2050ACLL);
}

uint64_t sub_22D216AD0()
{
  unsigned int v0;
  unint64_t v1;

  v0 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x7140FF14)) ^ LODWORD(STACK[0xE58])) & 0x7FFFFFFF);
  v1 = -711945521 * (v0 ^ HIWORD(v0));
  return ((uint64_t (*)(unint64_t *))qword_24F86A890[(2010
                                                                     * (((LODWORD(STACK[0xE50]) ^ 0xDC)
                                                                                        + LOBYTE(STACK[0xE57])) != (byte_22D24F1B0[v1 >> 24] ^ LOBYTE(STACK[0x767]) ^ byte_22D24A490[v1 >> 24] ^ byte_22D24D990[v1 >> 24] ^ v1 ^ (-61 * BYTE3(v1))))) ^ LODWORD(STACK[0xE48])])(&STACK[0x16A0]);
}

uint64_t sub_22D216BA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v2 = *(_QWORD *)(v1 + 2264) + 1;
  v3 = (uint64_t (*)(void))(*(_QWORD *)(v0
                                     + 8
                                     * (int)(((*(_QWORD *)(v1 + 2264) == 539291480)
                                            * (((LODWORD(STACK[0xE4C]) - 1745895965) & 0xFE7D6DEB) + 1771230474)) ^ LODWORD(STACK[0xE4C])))
                         - 12);
  LODWORD(STACK[0xE34]) = LODWORD(STACK[0xE4C]) + 597;
  *(_QWORD *)(v1 + 2256) = v2;
  return v3();
}

void sub_22D216C10()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = v1[282];
  v1[283] = v2;
  v3 = STACK[0xE34];
  LODWORD(STACK[0xE48]) = STACK[0xE34];
  LODWORD(STACK[0xE4C]) = v3 ^ 0x2AD;
  LODWORD(STACK[0xE50]) = (v3 ^ 0x2AD) - 1771230257;
  v2 -= 539291474;
  LOBYTE(STACK[0xE57]) = *((_BYTE *)&STACK[0x3CD] + v2);
  v4 = *(_QWORD *)STACK[0x1878] + v2;
  v1[286] = v4;
  v1[64] = v4;
  v1[62] = *(_QWORD *)(v0 + 8 * (v3 ^ 0x743)) - 12;
  JUMPOUT(0x22D216C88);
}

void sub_22D216C90()
{
  uint64_t v0;
  unsigned int v1;
  unint64_t v2;
  unsigned int v3;
  unint64_t v4;

  v1 = -711945521
     * ((LODWORD(STACK[0xE7C]) - 376253772) & (*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x540D021C)) ^ LODWORD(STACK[0xE80])));
  v2 = -711945521 * (v1 ^ HIWORD(v1));
  v3 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x4D48DDF4)) ^ (LODWORD(STACK[0xE74])
                                                                        + *(_DWORD *)(v0 + 2816)
                                                                        - 253853821)) & 0x7FFFFFFF);
  v4 = -711945521 * (v3 ^ HIWORD(v3));
  LOBYTE(STACK[0x61B]) = byte_22D24B7B0[v2 >> 24] ^ LOBYTE(STACK[0x767]) ^ byte_22D24B9F0[(v2 >> 24) + 2] ^ byte_22D251A10[v2 >> 24] ^ byte_22D24CD70[v4 >> 24] ^ byte_22D2509D0[v4 >> 24] ^ v2 ^ byte_22D246C00[(v4 >> 24) + 6] ^ (41 * BYTE3(v2)) ^ v4 ^ (47 * BYTE3(v4));
  JUMPOUT(0x22D20B748);
}

void sub_22D216DF0()
{
  uint64_t v0;
  unsigned int v1;
  unint64_t v2;
  unsigned int v3;
  unint64_t v4;

  v1 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0)) ^ LODWORD(STACK[0xF48])) & 0x7FFFFFFF);
  v2 = -711945521 * (v1 ^ HIWORD(v1));
  v3 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x4D48DDF4)) ^ (LODWORD(STACK[0xF3C])
                                                                        + *(_DWORD *)(v0 + 2392)
                                                                        - 1083287171)) & 0x7FFFFFFF);
  v4 = -711945521 * (v3 ^ HIWORD(v3));
  LOBYTE(STACK[0x61B]) = byte_22D251010[v2 >> 24] ^ LOBYTE(STACK[0x767]) ^ byte_22D24C420[v2 >> 24] ^ byte_22D246E20[(v2 >> 24) + 1] ^ byte_22D24CD70[v4 >> 24] ^ byte_22D2509D0[v4 >> 24] ^ v2 ^ byte_22D246C00[(v4 >> 24) + 6] ^ (115 * BYTE3(v2)) ^ v4 ^ (47 * BYTE3(v4));
  JUMPOUT(0x22D213B54);
}

uint64_t sub_22D216F38()
{
  unsigned int v0;
  unint64_t v1;

  v0 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x7140FF14)) ^ LODWORD(STACK[0xFA0])) & 0x7FFFFFFF);
  v1 = -711945521 * (v0 ^ HIWORD(v0));
  return ((uint64_t (*)(void))(qword_24F86A890[(55
                                             * ((LOBYTE(STACK[0xF9F]) - 3) != (byte_22D24F1B0[v1 >> 24] ^ LOBYTE(STACK[0x767]) ^ byte_22D24A490[v1 >> 24] ^ byte_22D24D990[v1 >> 24] ^ v1 ^ (-61 * BYTE3(v1))))) ^ LODWORD(STACK[0xF90])]
                            - 12))();
}

uint64_t sub_22D217000()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v2 = *(_QWORD *)(v1 + 2592) + 1;
  v3 = *(uint64_t (**)(void))(v0
                           + 8
                           * (((v2 == (((LODWORD(STACK[0xF94]) + 304876436) | 0x84412040) ^ 0x9003DE03))
                             * (LODWORD(STACK[0xF94]) ^ 0x37A)) ^ LODWORD(STACK[0xF94])));
  LODWORD(STACK[0xF7C]) = LODWORD(STACK[0xF94]) ^ 0x267;
  *(_QWORD *)(v1 + 2584) = v2;
  return v3();
}

uint64_t sub_22D2170B8(unint64_t a1)
{
  char v1;
  int v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  unint64_t v5;

  v4 = (v2 ^ (v1 + 57)) - v1 + 81;
  v5 = sub_22D22F914(a1);
  return ((uint64_t (*)(unint64_t))(qword_24F86A890[(348 * ((v3 ^ v4) & 1)) ^ v2] - 8))(v5);
}

void sub_22D2170FC()
{
  LOBYTE(STACK[0x61B]) = LOBYTE(STACK[0x767]) ^ LOBYTE(STACK[0x11AB]) ^ LODWORD(STACK[0x11A4]) ^ LODWORD(STACK[0x1170]) ^ LOBYTE(STACK[0x11AA]) ^ 0x35;
  JUMPOUT(0x22D2136BCLL);
}

void sub_22D217148()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;

  v2 = *(_QWORD *)(v0 + 145) + v1[412];
  v3 = *(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x58B8A3F0));
  v4 = -711945521
     * ((-711945521 * ((v3 ^ LODWORD(STACK[0x1250])) & 0x7FFFFFFF)) ^ ((-711945521
                                                                      * ((v3 ^ LODWORD(STACK[0x1250])) & 0x7FFFFFFFu)) >> 16));
  v5 = -711945521
     * ((-711945521 * ((v3 ^ v2) & 0x7FFFFFFF)) ^ ((-711945521 * ((v3 ^ v2) & 0x7FFFFFFF)) >> 16));
  LOBYTE(STACK[0x61B]) = byte_22D251110[v4 >> 24] ^ LOBYTE(STACK[0x767]) ^ byte_22D24D480[v4 >> 24] ^ byte_22D24D580[(v4 >> 24) + 2] ^ byte_22D251110[v5 >> 24] ^ byte_22D24D480[v5 >> 24] ^ byte_22D24D580[(v5 >> 24) + 2] ^ v4 ^ v5 ^ (-83 * BYTE3(v4)) ^ (-83 * BYTE3(v5));
  v1[20] = qword_24F86A890[((85 * (qword_255D66750 ^ 0xA1 ^ qword_255D66740)) ^ byte_22D251F60[byte_22D251E60[(85 * (qword_255D66750 ^ 0xA1 ^ qword_255D66740))] ^ 0x10])
                         + 1343];
  v1[21] = v2;
  JUMPOUT(0x22D2128A4);
}

void sub_22D217294()
{
  uint64_t v0;
  unsigned int v1;
  unint64_t v2;
  unsigned int v3;
  unint64_t v4;

  v1 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + ((LODWORD(STACK[0xF64]) + 1296620573) & dword_255D671C4)) ^ LODWORD(STACK[0xF70])) & 0x7FFFFFFF);
  v2 = -711945521 * (v1 ^ HIWORD(v1));
  v3 = -711945521
     * ((*(_DWORD *)(qword_255D671B8 + (int)(dword_255D671C4 & 0xDF3C6E9C)) ^ (*(_DWORD *)(v0 + 3832)
                                                                             + *(_DWORD *)(v0 + 2560))) & 0x7FFFFFFF);
  v4 = -711945521 * (v3 ^ HIWORD(v3));
  LOBYTE(STACK[0x61B]) = byte_22D24CD70[v2 >> 24] ^ LOBYTE(STACK[0x767]) ^ byte_22D2509D0[v2 >> 24] ^ byte_22D246C00[(v2 >> 24) + 6] ^ byte_22D24D690[v4 >> 24] ^ byte_22D250F00[(v4 >> 24) + 1] ^ v2 ^ byte_22D247430[v4 >> 24] ^ (47 * BYTE3(v2)) ^ v4 ^ (-43 * BYTE3(v4));
  JUMPOUT(0x22D213C40);
}

void sub_22D2173C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,char a23)
{
  _QWORD *v23;
  char v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  unint64_t v34;
  int v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  unsigned int v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  int v56;
  int v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  unsigned int v62;
  char v63;
  char v64;
  int v65;
  unsigned int v66;
  unsigned int v67;
  int v68;
  int v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  int v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  int v82;
  int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  char v87;
  char v88;
  unsigned int v89;
  unsigned int v90;
  char v91;
  unsigned int v92;
  unsigned int v93;
  char v94;
  BOOL v95;
  int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  int v103;
  unint64_t v104;
  unsigned int v105;
  unsigned int v106;
  int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned __int8 v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  int v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  int v120;
  unsigned int v121;
  unsigned int v122;
  unsigned int v123;
  char v124;
  unsigned int v125;
  int v126;
  unsigned int v127;
  unsigned int v128;
  int v129;
  int v130;
  int v131;
  unsigned int v132;
  unsigned int v133;
  int v134;
  int v135;
  int v136;
  unsigned int v137;
  unsigned int v138;
  unsigned int v139;
  int v140;
  unsigned int v141;
  unsigned int v142;
  int v143;
  unsigned int v144;
  char v145;
  unsigned int v146;
  unsigned int v147;
  unsigned int v148;
  char v149;
  unsigned int v150;
  unsigned int v151;
  int v152;
  int v153;
  int v154;
  unint64_t v155;
  int v156;
  int v157;
  int v158;
  unsigned int v159;
  unsigned int v160;
  unsigned int v161;
  int v162;
  unsigned int v163;
  unsigned int v164;
  int v165;
  unsigned int v166;
  int v167;
  unsigned int v168;
  unsigned int v169;
  unsigned int v170;
  unsigned int v171;
  int v172;
  int v173;
  unsigned int v174;
  unsigned int v175;
  unsigned int v176;
  int v177;
  int v178;
  unsigned int v179;
  int v180;
  unsigned int v181;
  unsigned int v182;
  unsigned int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  unsigned int v195;
  unint64_t v196;
  int v197;
  int v198;
  int v199;
  int v200;
  int v201;
  int v202;
  int v203;
  int v204;
  int v205;
  unsigned int v206;
  unsigned int v207;
  unsigned int v208;
  unsigned int v209;
  unsigned int v210;
  unsigned int v211;
  unsigned int v212;
  int v213;
  int v214;
  unsigned int v215;
  unsigned int v216;
  unsigned int v217;
  unsigned int v218;
  unsigned int v219;
  unsigned int v220;
  int v221;
  unsigned int v222;
  unsigned int v223;
  unsigned int v224;
  unsigned int v225;
  unsigned int v226;
  int v227;
  unsigned int v228;
  unsigned int v229;
  int v230;
  unsigned int v231;
  unsigned int v232;
  unsigned int v233;
  int v234;
  int v235;
  unsigned int v236;
  int v237;
  unsigned int v238;
  unsigned int v239;
  int v240;
  unsigned int v241;
  unsigned int v242;
  int v243;
  unsigned int v244;
  int v245;
  unsigned int v246;
  unsigned int v247;
  unsigned int v248;
  unsigned int v249;
  unsigned int v250;
  unsigned int v251;
  unsigned int v252;
  unsigned int v253;
  unsigned int v254;
  unsigned int v255;
  unsigned int v256;
  int v257;
  unint64_t v258;
  int v259;
  int v260;
  int v261;
  int v262;
  unsigned int v263;
  int v264;
  int v265;
  unsigned int v266;
  int v267;
  int v268;
  int v269;
  int v270;
  unsigned int v271;
  int v272;
  int v273;
  int v274;
  int v275;
  int v276;
  int v277;
  int v278;
  int v279;
  int v280;
  int v281;
  unsigned int v282;
  unsigned int v283;
  unsigned int v284;

  v24 = LOBYTE(STACK[0x767])
      + ((-54 * (LOBYTE(STACK[0x1150]) ^ 0xF0)) & 0xF7)
      + ((101 * (LOBYTE(STACK[0x1150]) ^ 0xF0)) ^ 0x7B)
      - 68;
  v25 = ((((LOBYTE(STACK[0x1157]) ^ 0xFE) - ((2 * (LOBYTE(STACK[0x1157]) ^ 0xFE)) & 0xAE)) << 8) + 1834178304) ^ 0x6D535700;
  v26 = (v25 - ((2 * v25) & 0x68B89400) - 195278238) ^ 0xF45C4A62 | LODWORD(STACK[0x10F0]) ^ 0xE373A2D1;
  v27 = byte_22D247540[(v24 - ((2 * v24 + 2) & 0x2E) + 24) ^ 0x5BLL] ^ 0xEB;
  v28 = LODWORD(STACK[0x1404]) ^ LODWORD(STACK[0xFB4]) ^ (v26 - ((2 * v26) & 0x95B3F62) + 78487473) ^ (v27 - ((2 * v27) & 0xB2) - 1543601063);
  v29 = LODWORD(STACK[0xFBC]) ^ LODWORD(STACK[0x1128]) ^ LODWORD(STACK[0x1404]) ^ 0x1FF90B4B;
  v30 = STACK[0x13FC];
  v31 = (((LODWORD(STACK[0x13F8]) ^ 0xC5F2D166 ^ v28) + 1) ^ 0x747BAD7F)
      + LODWORD(STACK[0x1310])
      + ((2 * ((LODWORD(STACK[0x13F8]) ^ 0xC5F2D166 ^ v28) + 1)) & 0xE8F75AFE);
  v32 = LODWORD(STACK[0x13F8]) ^ LODWORD(STACK[0x1404]);
  v33 = (v28 ^ ((v28 ^ 0xE9861716) - ((2 * (v28 ^ 0xE9861716) + 2) & 0xEA80F76) + 122947516) ^ 0x781A1EC1 ^ (v31 - ((2 * v31) & 0xD26FE326) + 1765274003))
      + LODWORD(STACK[0x13FC]);
  HIDWORD(v34) = LODWORD(STACK[0x1148]) ^ LODWORD(STACK[0xFB8]) ^ v32;
  LODWORD(v34) = HIDWORD(v34) ^ 0x91B5D5B0;
  v35 = (v34 >> 1) - ((2 * (v34 >> 1)) & 0x415F3486) - 1599104445;
  v36 = 2 * ((v29 & v30) - ((2 * (v29 & v30)) & 0x549B29D8)) + 1419454936;
  v37 = v36 ^ 0x948F21C9;
  v38 = (2 * v36) & 0x7FD7EFDC ^ 0xD6E9BC6F;
  HIDWORD(v34) = v35 ^ LODWORD(STACK[0x1314]) ^ 0x5495D8C8;
  LODWORD(v34) = v35 ^ ~LODWORD(STACK[0x1314]);
  v39 = (v34 >> 31) - ((2 * (v34 >> 31)) & 0xBEDC4F96) + 1601054667;
  v40 = v38 + v37 + ((v30 + v29) ^ 0xFD7B1FFF) + ((2 * (v30 + v29)) & 0xFAF63FFE);
  v41 = LODWORD(STACK[0x114C]) ^ LODWORD(STACK[0xFAC]) ^ v32 ^ LODWORD(STACK[0x13F0]);
  v42 = (v33 - ((2 * v33) & 0xFC7B82EC) - 29507210) ^ LODWORD(STACK[0x13F0]);
  v43 = (v40 - ((2 * v40 + 81899490) & 0x3EAB54C0) - 507084207) ^ LODWORD(STACK[0x13F0]);
  v44 = v23[438];
  v45 = v23[439];
  v46 = v23[440];
  v47 = v23[441];
  v48 = HIBYTE(v43) ^ 0xC0;
  v49 = *(_DWORD *)(v44 + 4 * (BYTE2(v43) ^ 0xCFu));
  v50 = *(_DWORD *)(v45 + 4 * (HIBYTE(v39) ^ 0xE6)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v41) ^ 0xD4u)) ^ *(_DWORD *)(v46 + 4 * (((v40 - ((2 * v40 - 30) & 0xC0) + 81) ^ LOBYTE(STACK[0x13F0])) ^ 0x7Bu)) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v42) ^ 0xFAu));
  v51 = *(_DWORD *)(v44 + 4 * (BYTE2(v39) ^ 0xB5u)) ^ *(_DWORD *)(v45 + 4 * v48);
  v52 = *(_DWORD *)(v45 + 4 * (HIBYTE(v42) ^ 0x71)) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v41) ^ 0xD3u)) ^ *(_DWORD *)(v46 + 4 * (((v34 >> 31) - ((2 * (v34 >> 31)) & 0x96) - 53) ^ 0x4Cu)) ^ *(_DWORD *)(v47 + 4 * (((unsigned __int16)((v40 - ((2 * v40 - 20510) & 0x54C0) - 32175) ^ LOWORD(STACK[0x13F0])) >> 8) ^ 0x7Fu));
  v53 = *(_DWORD *)(v45 + 4 * (HIBYTE(v41) ^ 0xD7)) ^ v49 ^ *(_DWORD *)(v47 + 4 * (BYTE1(v39) ^ 0x8Eu)) ^ *(_DWORD *)(v46 + 4 * (v42 ^ 0x9Eu));
  v54 = v51 ^ *(_DWORD *)(v46 + 4 * ~(_BYTE)v41) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v42) ^ 2u));
  v55 = HIBYTE(v54) ^ 0x79;
  v56 = *(_DWORD *)(v45 + 4 * (HIBYTE(v53) ^ 0x4E)) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v54) ^ 0x29u));
  v57 = BYTE1(v54);
  v58 = *(_DWORD *)(v47 + 4 * (BYTE1(v53) ^ 0x13u)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v50) ^ 0x34)) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v52) ^ 0xA6u)) ^ *(_DWORD *)(v46 + 4 * (v54 ^ 0x85u));
  v59 = *(_DWORD *)(v45 + 4 * (HIBYTE(v52) ^ 0xDA)) ^ *(_DWORD *)(v47 + 4 * (v57 ^ 0x64u)) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v53) ^ 0x58u)) ^ *(_DWORD *)(v46 + 4 * (v50 ^ 0xFBu));
  v60 = *(_DWORD *)(v44 + 4 * (BYTE2(v50) ^ 0x7Cu));
  v61 = v56 ^ *(_DWORD *)(v47 + 4 * (BYTE1(v50) ^ 0xE9u)) ^ *(_DWORD *)(v46 + 4 * (v52 ^ 0xD8u));
  v62 = *(_DWORD *)(v45 + 4 * v55) ^ v60 ^ *(_DWORD *)(v47 + 4 * (BYTE1(v52) ^ 0x45u)) ^ *(_DWORD *)(v46 + 4 * (v53 ^ 0x2Du));
  if (v41 == -673983233)
    v63 = -1;
  else
    v63 = v58 ^ 0xA5;
  v64 = (v63 & (v58 ^ 0xA5)) - ((2 * (v63 & (v58 ^ 0xA5))) & 0xD2);
  v65 = *(_DWORD *)(v47 + 4 * (BYTE1(v62) ^ 0x48u));
  v66 = ((2 * (v65 & 0x9242F0B3 ^ 0x8200E002)) & 0x24044166) - (v65 & 0x9242F0B3 ^ 0x8200E002) - 370615220;
  v67 = (v66 & 0x38A2171A ^ 0x10021310) + (v66 ^ 0xE8E8C44E) - ((v66 ^ 0xE8E8C44E) & 0x3802171A);
  v68 = *(_DWORD *)(v46 + 4 * (v62 ^ 3u));
  v69 = *(_DWORD *)(v45 + 4 * (HIBYTE(v58) ^ 0xB)) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v59) ^ 0x8Fu)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v61) ^ 0x12u));
  v70 = (v68 & 0x40000000 | ((v68 & 0x40000000u) >> 30 << 31)) ^ 0x7FF9FFA7;
  v71 = (v65 & 0x6DBD0F4C ^ 0xDB80A44) + (v65 & 0x49BD0C08 ^ 0x504724A8) - ((v65 & 0x6DBD0F4C ^ 0xDB80A44) & 0x49BD0C08);
  v72 = ((2 * (v68 & 0xBFFFFFFF ^ 0xE7C86CD)) | 0x672A8BE2) - (v68 & 0xBFFFFFFF ^ 0xE7C86CD) + 1282062863;
  v73 = v70 - 291534338;
  if ((v69 & (v70 - 2147090343)) != 0)
    v73 = -292320948 - v70;
  v74 = *(_DWORD *)(v44 + 4 * (BYTE2(v61) ^ 0x65u)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v59) ^ 0xDD)) ^ v71 ^ *(_DWORD *)(v46 + 4 * ((v64 + 105) ^ 0x69u)) ^ v67;
  v75 = ((v69 ^ 0x2FBDE760)
       - 1855556005
       + v73
       - ((2 * ((v69 ^ 0x2FBDE760) - 1855556005 + v73)) & 0x203697FC)
       - 1877259266) ^ v72;
  v76 = HIBYTE(v62) ^ 0xEA;
  v77 = *(_DWORD *)(v46 + 4 * (v59 ^ 0xABu)) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v62) ^ 0xFEu)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v58) ^ 0x44u)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v61) ^ 0x9F));
  v78 = *(_DWORD *)(v46 + 4 * (v61 ^ 0x50u)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v59) ^ 0x3Fu)) ^ *(_DWORD *)(v45 + 4 * v76) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v58) ^ 0x9Bu));
  v79 = ((2 * v78) ^ 0x19647DAC) - ((2 * ((2 * v78) ^ 0x19647DAC)) & 0x3CDDEB0) - 2115571880;
  v80 = (((v78 ^ 0xCB23ED6) - 817144982) ^ 0x7D2E7FE7)
      + ((2 * ((v78 ^ 0xCB23ED6) - 817144982)) & 0xFA5CFFCE)
      + (v79 & 0x9E96B6D4 ^ 0x908284D9)
      + ((2 * v79) & 0x1D2528A8 ^ 0xFEFAF75F);
  v81 = ((((v75 ^ 0x65105130u) >> (BYTE1(v75) & 0x18 ^ 0x10))
        - ((2 * ((v75 ^ 0x65105130u) >> (BYTE1(v75) & 0x18 ^ 0x10))) & 0x579BAEEC)
        - 1412573322) ^ 0xABCDD776) >> (BYTE1(v75) & 0x18 ^ 8);
  v82 = *(_DWORD *)(v47 + 4 * (BYTE1(v77) ^ 0x13u));
  v83 = *(_DWORD *)(v44 + 4 * (BYTE2(v74) ^ 0x87u)) ^ *(_DWORD *)(v45
                                                                  + 4
                                                                  * ((v81 - ((2 * v81) & 0xF3) - 7) ^ 0xF9u));
  v84 = v82 ^ 0xEF6F9EC9;
  v85 = v84 + (v82 ^ 0xD042189F ^ v83) + 1 - ((2 * (v84 + (v82 ^ 0xD042189F ^ v83) + 1)) & 0x8F01E0B6);
  v86 = v80 + 1926061457;
  if (v80 + 1926061457 >= 0xD41D2597)
    v87 = -26;
  else
    v87 = 125;
  v88 = v80 + v87;
  v89 = v85 + 1199632475;
  if (v86 >= 0xD41D2597)
    v91 = -122;
  else
    v91 = -17;
  v90 = (v83 ^ 0x3F2D8656) - ((2 * (v83 ^ 0x3F2D8656) + 2) & 0x8BFC3EDE) + 1174282096;
  v92 = ((v83 ^ v90 ^ v89 ^ 0xC2AC969D) + v84 - ((2 * ((v83 ^ v90 ^ v89 ^ 0xC2AC969D) + v84)) & 0xF0C2DDE8) - 127832332) ^ *(_DWORD *)(v46 + 4 * (v88 + v91 + 37));
  v93 = (v92 ^ 0x4871A112) - 2 * (((v92 ^ 0x4871A112) + 1566444848) & 0x748C472B ^ (v92 ^ 0x4871A112) & 2) + 1374311513;
  if ((v92 ^ 0x4871A110) >= 0xA2A1F2D0)
  {
    v94 = -7;
  }
  else
  {
    v93 = v92 ^ 0xBCFDE63B;
    v94 = 41;
  }
  v95 = v93 == -192133335;
  v96 = *(_DWORD *)(v44 + 4 * ((BYTE2(v86) - ((v86 >> 15) & 0x9C) + 78) ^ 0x4Eu));
  v97 = ((4 * v96) ^ 0xF7094620) - ((2 * ((4 * v96) ^ 0xF7094620)) & 0x9309120) + 77088915;
  v98 = ((v97 & 0x4022080 ^ 0x1852048F) + (v97 & 0x80201900 ^ 0x801) - 2) ^ 0x5522642;
  v99 = (((2 * v98) & 0x1A046218) - v98 + 1391201985) ^ 0x4BEC2C8D | (~v96 >> 30);
  v100 = *(_DWORD *)(v45 + 4 * (HIBYTE(v77) ^ 0x25));
  v101 = (((4 * v100) ^ 0xF440A084) - 2 * (((4 * v100) ^ 0xF440A084) & 0x1E28AB3C ^ (4 * v100) & 0x20) + 505981725) & 0x84223980 ^ 0x4020980;
  v102 = (((((v101 | 0x8461E229) - (v101 | 0x7B9E1DD6) + 2073959894) & 0x48067008 ^ 0x9041041)
         + (((v101 | 0x8461E229) - (v101 | 0x7B9E1DD6) + 2073959894) & 0xB4F98BA1)
         - 1) ^ 0x84218221 | (v100 >> 30)) ^ 0x96650C8;
  v103 = (v102 - ((2 * v102) & 0xE33496E) - 2028362569) ^ (v99 - ((2 * v99) & 0x5860622) - 2101148911);
  HIDWORD(v104) = v103 ^ 1;
  LODWORD(v104) = v103 ^ 0x91CA2BF8;
  v105 = (((v100 ^ v96) & 0x1EF7719F ^ 0x2E11183 | 0xF5FFF80E)
        - ((v100 ^ v96) & 0x1EF7719F ^ 0x2E11183 | 0xA0007F1)
        + 167774193) ^ 0x95D7F00C;
  v106 = *(_DWORD *)(v46 + 4 * (v75 ^ 0x30u)) ^ *(_DWORD *)(v44
                                                                             + 4
                                                                             * (((HIWORD(v77) & 0xB4 ^ 0x94E21335)
                                                                               + (HIWORD(v77) & 0x4B)
                                                                               - 1) ^ 0x94E21381)) ^ *(_DWORD *)(v47 + 4 * ((BYTE1(v86) - ((v86 >> 7) & 8) + 4) ^ 4u)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v74) ^ 0x59));
  v107 = ((v104 >> 2) - ((2 * (v104 >> 2)) & 0x602E7954) - 1340654422) ^ 0x55131FBD | (((2 * v105) & 0xFEC4C490)
                                                                                     - v105
                                                                                     + 10329527) ^ 0x6286F5BF;
  v108 = *(_DWORD *)(v46 + 4 * (v74 ^ 0x19u)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v75) ^ 0x51u)) ^ (v107 - ((2 * v107) & 0x1B1574B0) + 227195480);
  v109 = *(_DWORD *)(v44 + 4 * (BYTE2(v75) ^ 0x10u)) ^ *(_DWORD *)(v45 + 4 * HIBYTE(v86)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v74) ^ 0xF6u)) ^ *(_DWORD *)(v46 + 4 * (v77 ^ 0x69u));
  if (v95)
    v110 = v94;
  else
    v110 = v92 ^ 0x3B;
  v111 = *(_DWORD *)(v44 + 4 * (BYTE2(v106) ^ 0x7Du)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v92) ^ 0x48)) ^ *(_DWORD *)(v46 + 4 * (v109 ^ 0x6Au)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v108) ^ 0xC7u));
  v112 = *(_DWORD *)(v45 + 4 * (HIBYTE(v106) ^ 0x25)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v109) ^ 0x5Fu)) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v108) ^ 0x22u)) ^ *(_DWORD *)(v46 + 4 * (v110 ^ 0x29u));
  v113 = *(_DWORD *)(v45 + 4 * (HIBYTE(v108) ^ 0xC1)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v92) ^ 0xA1u)) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v109) ^ 0x31u)) ^ *(_DWORD *)(v46 + 4 * (v106 ^ 0xBFu));
  v114 = *(_DWORD *)(v47 + 4 * (BYTE1(v106) ^ 0x29u)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v109) ^ 0xC3)) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v92) ^ 0x71u)) ^ *(_DWORD *)(v46 + 4 * (v108 ^ 0xF1u));
  v115 = v114 ^ ((v114 ^ 0xF34DC129) - ((2 * (v114 ^ 0xF34DC129) + 2) & 0xCB685A24) - 441176813) ^ ((v114 ^ 0x465D676E)
                                                                                                  - ((2 * (v114 ^ 0x465D676E) + 1780567184) & 0x509831AA)
                                                                                                  + 1566359325) ^ 0x414A0B11;
  v116 = v115 - ((2 * v115 + 1780567182) & 0xBC5C841A) + 322889812;
  v117 = *(_DWORD *)(v44 + 4 * (BYTE2(v112) ^ 0xE9u)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v111) ^ 0x5F)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v113) ^ 0xF9u)) ^ *(_DWORD *)(v46 + 4 * ((v115 - ((2 * v115 - 114) & 0x1A) + 84) ^ 0xDu));
  v118 = *(_DWORD *)(v44 + 4 * (BYTE2(v113) ^ 0x21u)) ^ *(_DWORD *)(v46 + 4 * (v111 ^ 0x92u)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v112) ^ 0x76)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v116) ^ 0x42u));
  v119 = BYTE2(v111) ^ 0x26;
  v120 = *(_DWORD *)(v44 + 4 * (BYTE2(v116) ^ 0x2Eu)) ^ *(_DWORD *)(v46 + 4 * (v112 ^ 0xFBu)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v113) ^ 0x76)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v111) ^ 0xD4u));
  v121 = *(_DWORD *)(v45 + 4 * (HIBYTE(v116) ^ 0x5E)) ^ *(_DWORD *)(v44 + 4 * v119) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v112) ^ 0xC3u)) ^ *(_DWORD *)(v46 + 4 * (v113 ^ 0x2Du));
  v122 = *(_DWORD *)(v45 + 4 * (HIBYTE(v118) ^ 0x6F)) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v120) ^ 0xCAu)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v121) ^ 0x7Au)) ^ *(_DWORD *)(v46 + 4 * (v117 ^ 0x48u));
  v123 = 2 * ((v122 ^ 0xEBE36236) % 0x3E02A4EC);
  v95 = (v123 & 0x3FFDFF7A) + (((v122 ^ 0xEBE36236) % 0x3E02A4EC) ^ 0x5FFEFFBD) == 1610547133;
  LOBYTE(v116) = (v118 & 0x18) - ((2 * v118) & 0x20) - 75;
  v124 = (v116 & 0x98 ^ 0x1D | v116 & 0x60) - 1;
  v125 = ((((v120 ^ 0x15CADC9Eu) >> (v124 ^ 0xAC))
         - ((2 * ((v120 ^ 0x15CADC9Eu) >> (v124 ^ 0xAC))) & 0x6B847AFE)
         - 1245561473) ^ 0xB5C23D7F) >> (v124 ^ 0xB4);
  v126 = *(_DWORD *)(v46 + 4 * (v121 ^ 0xD9u)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v120) ^ 0xDCu));
  v127 = *(_DWORD *)(v44 + 4 * (BYTE2(v121) ^ 0xDAu)) ^ *(_DWORD *)(v46 + 4 * (v118 ^ 0x65u)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v117) ^ 0xE6u)) ^ *(_DWORD *)(v45 + 4 * ((v125 - ((2 * v125) & 0xC8) - 28) ^ 0xE4u));
  v128 = *(_DWORD *)(v47 + 4 * (BYTE1(v118) ^ 0x1Bu)) ^ *(_DWORD *)(v44 + 4 * (BYTE2(v117) ^ 2u)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v121) ^ 0xA0)) ^ *(_DWORD *)(v46 + 4 * (v120 ^ 0x9Eu));
  v129 = *(_DWORD *)(v45 + 4 * (HIBYTE(v117) ^ 0x15));
  v130 = *(_DWORD *)(v44 + 4 * (BYTE2(v118) ^ 0x59u));
  v131 = *(_DWORD *)(v44 + 4 * (BYTE2(v128) ^ 0xF3u));
  v132 = v126 ^ v130 ^ v129;
  v133 = (((v122 ^ 0xEBE36236) % 0x3E02A4EC) ^ 0x3673BFDF) - 913555423 + (v123 & 0x6CE77FBE);
  v134 = *(_DWORD *)(v46 + 4 * (v127 ^ 0x7Eu)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v122) ^ 0x62u));
  v135 = *(_DWORD *)(v45 + 4 * (HIBYTE(v128) ^ 0x5E));
  v136 = v135 ^ *(_DWORD *)(v44 + 4 * (BYTE2(v132) ^ 8u));
  v137 = (v136 & 0xD146BF88 ^ 0x4411F988) - ((2 * (v136 & 0xD146BF88 ^ 0x4411F988)) & 0x80AB1E00) + 1652395892;
  v138 = (((2 * (v136 & 0x2EB94077 ^ 0x2C280073)) | 0xDE05E17C) - (v136 & 0x2EB94077 ^ 0x2C280073) - 1862463678) ^ 0x268A343C;
  v139 = ((v138 | 0x74CE8689) - (v138 | 0x8B317976) - 1959691914) ^ 0x11FE0259 | v137 ^ 0xE62E4F74;
  v140 = *(_DWORD *)(v45 + 4 * (HIBYTE(v127) ^ 0xF2));
  v141 = v134 ^ (v139 - ((2 * v139) & 0xA080EC54) - 801081814);
  v142 = v140 ^ *(_DWORD *)(v47 + 4 * (BYTE1(v132) ^ 0x47u)) ^ v131 ^ *(_DWORD *)(v46
                                                                                  + 4
                                                                                  * (v122 ^ 0x36u));
  v143 = *(_DWORD *)(v45 + 4 * (HIBYTE(v142) ^ 0xFC));
  v144 = ((2 * v143) & 0xEAFFDFEE ^ 0x6E205042)
       + (v143 & 0xFDFFFFFF ^ 0x486FC7D6)
       + (((v143 ^ 0xC0EFD7DE) + 1) ^ 0xBE377FFE)
       + ((2 * ((v143 ^ 0xC0EFD7DE) + 1)) & 0x7C6EFFFC);
  if (v95)
    v145 = v133;
  else
    v145 = 0;
  v146 = *(_DWORD *)(v44 + 4 * (BYTE2(v141) ^ 0x1Du)) ^ 0xFDC25188;
  v95 = ((v144 - 901214197) & v146) == ((2 * ((v144 - 901214197) & v146)) & 0xD72CD7EE);
  v147 = (v130 ^ ((v130 ^ 0x23DAE77) - ((2 * (v130 ^ 0x23DAE77) + 2) & 0x5F338F48) + 798607269) ^ 0x34604E54 ^ ((v129 ^ 0x3D102821) + (v130 ^ v129 ^ 0x3F2D8656) + 1 - ((2 * ((v129 ^ 0x3D102821) + (v130 ^ v129 ^ 0x3F2D8656) + 1)) & 0xCC77B0F0) - 432285576))
       + (v129 ^ 0x3D102821);
  v148 = v126 ^ (v147 - ((2 * v147) & 0xE0DD86C4) - 261176478);
  v149 = (v122 ^ 0x36) - v145;
  v150 = v128 ^ 0x71;
  v151 = BYTE1(v128) ^ 0xC4;
  v152 = *(_DWORD *)(v44 + 4 * (BYTE2(v127) ^ 0x9Bu)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v122) ^ 0xEB));
  v153 = *(_DWORD *)(v44 + 4 * (BYTE2(v122) ^ 0xE3u));
  v154 = *(_DWORD *)(v47 + 4 * (BYTE1(v127) ^ 0x80u));
  HIDWORD(v155) = v154 ^ v153 ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v148) ^ 0xB8));
  LODWORD(v155) = HIDWORD(v155) ^ 0x2FBDE760;
  v156 = (v155 >> 3) - ((2 * (v155 >> 3)) & 0xDD1663C8) - 292867612;
  v157 = *(_DWORD *)(v46 + 4 * v150);
  HIDWORD(v155) = v157 ^ 6;
  LODWORD(v155) = v157 ^ 0x230FD9B0;
  v158 = v156 ^ ((v155 >> 3) - ((2 * (v155 >> 3)) & 0xDBA26332) + 1842426265);
  HIDWORD(v155) = v158 ^ 0x2E989D1;
  LODWORD(v155) = v158 ^ 0x40000000;
  v159 = (v155 >> 29) - ((2 * (v155 >> 29)) & 0xE19845F2) + 1892426489;
  v160 = v131 ^ *(_DWORD *)(v47 + 4 * (BYTE1(v148) ^ 0xFDu)) ^ v140 ^ *(_DWORD *)(v46
                                                                                  + 4
                                                                                  * ((v149 ^ 0xE7) + ((2 * v149) & 0xCF) + 25));
  v161 = v134 ^ *(_DWORD *)(v44 + 4 * (BYTE2(v148) ^ 0xB4u)) ^ v135;
  v162 = *(_DWORD *)(v47 + 4 * v151);
  v163 = v152 ^ v162 ^ *(_DWORD *)(v46 + 4 * (v148 ^ 0x4Eu));
  v164 = BYTE2(v163) ^ 0xE7;
  LODWORD(STACK[0x2A0]) = v161 ^ 0xD9;
  v165 = *(_DWORD *)(v45 + 4 * (HIBYTE(v160) ^ 0xFC)) ^ 0x3D102821;
  v166 = *(_DWORD *)(v44 + 4 * (BYTE2(v161) ^ 0x8Fu)) ^ 0xFDC25188;
  v167 = 2 * ((v166 & v165) - ((2 * (v166 & v165)) & 0x191586CC)) + 420841164;
  v168 = ((v166 + v165) ^ 0x797FFA43)
       + ((2 * (v166 + v165)) & 0xF2FFF486)
       + (v167 ^ 0x899DC64F)
       + ((2 * v167) & 0xDEEF7EF8 ^ 0xEDD4F367)
       + 1;
  LODWORD(STACK[0x2A8]) = v168 - ((2 * v168 - 336622988) & 0xB160F152) - 827834909;
  LODWORD(STACK[0x290]) = v163 ^ 0xD6;
  v169 = (v162 ^ ((v162 ^ 0x10906136) - ((2 * (v162 ^ 0x10906136) + 2) & 0x16839C2A) - 1958621674) ^ 0x3A244AB7 ^ ((v152 ^ 0xC0D279A9) + (v152 ^ v162 ^ 0xD042189F) + 1 - ((2 * ((v152 ^ 0xC0D279A9) + (v152 ^ v162 ^ 0xD042189F) + 1)) & 0xBC1434D6) + 1577720427))
       + (v152 ^ 0xC0D279A9);
  v170 = v153 ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v132) ^ 0x88)) ^ v157 ^ v154;
  v171 = (v169 - ((2 * v169) & 0x74DD9E0A) - 1167143163) ^ *(_DWORD *)(v46
                                                                     + 4
                                                                     * (((v132 ^ 0x8E)
                                                                       + (v132 & 0xA8 ^ 0x220)
                                                                       - ((v132 ^ 0x8E) & 0xA8)) ^ 0x2A3));
  v172 = *(_DWORD *)(v44 + 4 * (BYTE2(v171) ^ 0x34u)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v170) ^ 0xE5)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v142) ^ 0xDAu)) ^ 0x2FBDE760;
  v173 = *(_DWORD *)(v46 + 4 * (v141 ^ 0x5Au)) ^ 0x230FD9B6;
  v174 = (v173 + v172) ^ 0xE6DCFF77;
  v175 = (2 * (v173 + v172)) & 0xCDB9FEEE;
  v176 = (v143 & 0xFDFFFFFF ^ 0x968E3EC9)
       + (v143 & 0x60A21253 ^ 0x60200012)
       - ((v143 & 0xFDFFFFFF ^ 0x968E3EC9) & 0x60A21253);
  v177 = 2 * ((v173 & v172) - ((2 * (v173 & v172)) & 0x22396484)) - 1573297020;
  v178 = v177 ^ 0x27304409;
  v179 = (2 * v177) & 0xF5EDBEE4 ^ 0xBB9F77FF;
  v180 = *(_DWORD *)(v44 + 4 * (BYTE2(v142) ^ 0xCEu)) ^ *(_DWORD *)(v47 + 4 * (BYTE1(v141) ^ 0x2Fu)) ^ *(_DWORD *)(v46 + 4 * (v170 ^ 0x36u)) ^ *(_DWORD *)(v45 + 4 * (HIBYTE(v171) ^ 0x97));
  v181 = v144 + 1856564610;
  v182 = -635974292 - v144;
  if (!v95)
    v181 = v182;
  v183 = v146 + 1537188489 + v181 - ((2 * (v146 + 1537188489 + v181)) & 0xA1A5C484) - 791485886;
  v184 = *(_DWORD *)(v47 + 4 * (BYTE1(v159) ^ 0x69u));
  v185 = *(_DWORD *)(v47 + 4 * (BYTE1(v160) ^ 0xDAu));
  v186 = *(_DWORD *)(v47 + 4 * (BYTE1(v163) ^ 0x64u));
  v187 = *(_DWORD *)(v47 + 4 * (BYTE1(v161) ^ 0x20u));
  v188 = *(_DWORD *)(v47 + 4 * (BYTE1(v170) ^ 0x38u));
  v189 = *(_DWORD *)(v47 + 4 * (BYTE1(v171) ^ 0x4Cu));
  v190 = *(_DWORD *)(v44 + 4 * (BYTE2(v170) ^ 0xB6u));
  v191 = *(_DWORD *)(v45 + 4 * (HIBYTE(v159) ^ 0x94));
  v192 = *(_DWORD *)(v45 + 4 * (HIBYTE(v163) ^ 2));
  v193 = *(_DWORD *)(v45 + 4 * (HIBYTE(v161) ^ 0xAE));
  v194 = *(_DWORD *)(v45 + 4 * (HIBYTE(v141) ^ 0xBE));
  v195 = v175 + v174 + v178 + v179 - ((2 * (v175 + v174 + v178 + v179) + 674480122) & 0x9F77FCEA) - 472523150;
  HIDWORD(v196) = v189 ^ 0x6F6F9EC9;
  LODWORD(v196) = ~v189;
  v197 = (v196 >> 31) - ((2 * (v196 >> 31)) & 0x4B9DE142);
  HIDWORD(v196) = v194 ^ v190 ^ 0x40D279A9;
  LODWORD(v196) = v194 ^ ~v190;
  v198 = ((v196 >> 31) - ((2 * (v196 >> 31)) & 0x3C3AD4EE) - 1642239369) ^ (v197 - 1513164639);
  v199 = v188 ^ v176 ^ *(_DWORD *)(v46 + 4 * (v171 ^ 0xB3u)) ^ v183;
  v200 = *(_DWORD *)(v46 + 4 * LODWORD(STACK[0x2A0]));
  v201 = *(_DWORD *)(v46 + 4 * (v159 ^ 0x7Fu));
  v202 = *(_DWORD *)(v46 + 4 * LODWORD(STACK[0x290]));
  v203 = *(_DWORD *)(v46 + 4 * (v160 ^ 0x7Eu));
  v204 = *(_DWORD *)(v46 + 4 * (v142 ^ 0x7Eu));
  v205 = v192 ^ *(_DWORD *)(v44 + 4 * (BYTE2(v160) ^ 0xCEu));
  v206 = ((2 * ((v201 ^ v205 ^ v187 ^ 0xF3FFC3C0) + 1401411191)) & 0xDF7FF9F4)
       + (((v201 ^ v205 ^ v187 ^ 0xF3FFC3C0) + 1401411191) ^ 0x6FBFFCFA);
  HIDWORD(v196) = v198;
  LODWORD(v196) = v198 ^ 0x3BD39AD6;
  v207 = *(_DWORD *)(v44 + 4 * v164) ^ v185 ^ v200 ^ 0xFDAA99C0 ^ v191;
  v208 = ((2 * (v207 + 1269039754)) & 0x5FF7EBEE) + ((v207 + 1269039754) ^ 0xAFFBF5F7);
  v209 = ((2 * v180) & 0x97FF7ABE ^ 0x87FF0280) + (v180 ^ 0x38007E9F);
  v210 = (v193 ^ v186 ^ v203 ^ 0xA1BE3967 ^ *(_DWORD *)(v44 + 4 * (BYTE2(v159) ^ 0x54u))) - 1947476229;
  v211 = v210 ^ 0xFFF2E7DF;
  v212 = (2 * v210) & 0xFFE5CFBE;
  v213 = ((v196 >> 1) - ((2 * (v196 >> 1)) & 0x5498E2CE) - 1437830809) ^ v204;
  v214 = v213 ^ 0x244FAF60;
  v215 = ((v211 + v212 + 858145 + v214) ^ 0x79DEDEE7)
       + ((2 * v213) ^ 0xC9C3851)
       + ((4 * v213) & 0x77F932DC ^ 0xEEC7CF7F)
       + ((2 * (v211 + v212 + 858145 + v214)) & 0xF3BDBDCE);
  v216 = (v206 - v209 - ((2 * (v206 - v209) + 947880138) & 0x36B8F4BE) - 140756284) ^ 0xE7D993F7;
  v217 = ((-441564638 * v216) & 0xE5F9BCFC) + ((-220782319 * v216) ^ 0xF2FCDE7E) + 1037001602;
  v218 = (v215 + 1 - 2 * ((v215 + 1109244553) & 0x5336B33A ^ (v215 + 1) & 2) + 357854656) ^ 0xD5DE5810;
  v219 = ((1659417479 * v218) ^ 0x6DF715FF) + ((-976132338 * v218) & 0xDBEE2BFE);
  v220 = (v208 + (v195 ^ 0x415CA69C) - ((2 * (v208 + (v195 ^ 0x415CA69C)) - 1610083308) & 0xD5E4A196) + 989223637) ^ 0xA148444F;
  v221 = (v184 ^ v202 ^ 0x1BE12668 ^ LODWORD(STACK[0x2A8])) - 1381455132;
  v222 = ((2 * v221) & 0xEFFB3F5C) + (v221 ^ 0x77FD9FAE) + (v199 ^ 0x274047C7);
  v223 = (v222 - ((2 * v222 + 268746918) & 0xE8E68A2C) - 59398807) ^ 0x4AA2D4A9;
  v224 = ((1749830113 * v223) ^ 0xFF27EEEE) + ((-795307070 * v223) & 0xFE4FDDDC);
  v225 = v217 + ((1964916222 * v220) & 0x4FFDFF9A) + ((-1165025537 * v220) ^ 0xA7FEFFCD);
  v226 = v225 + 2074866168;
  v227 = v219 + v224 - ((2 * (v219 + v224) + 633468454) & 0x2E7718D2) + 706512764;
  v228 = v225 + 657767987;
  v229 = (v227 ^ (v225 + 657767987) ^ 0x973B8C69)
       - 2 * ((v227 ^ (v225 + 657767987) ^ 0x973B8C69) & 0x2177014F ^ (v227 ^ (v225 + 657767987)) & 6)
       + 561447241;
  v230 = v219 - v226 - ((2 * (v219 - v226) + 16792460) & 0x349315E) + 1747236469;
  v231 = v217
       + ((1590614140 * v223) & 0xBDDCABB4)
       + ((795307070 * v223) ^ 0xDEEE55DB)
       + v224
       - 602695309
       + (v230 ^ 0x7E5B6750);
  v232 = v231 - ((2 * v231 + 705937290) & 0xE8EF6974) + 159487103;
  v233 = (v227 ^ ((v227 ^ 0x68C47396) - ((2 * (v227 ^ 0x68C47396) + 2) & 0xADB7C0FC) + 1457250431) ^ 0x29F5EE95 ^ ((v229 ^ 0xDE88FEB6) + v226 - ((2 * ((v229 ^ 0xDE88FEB6) + v226) + 1460770936) & 0xD02B0504) - 1818341698))
       + v228;
  v234 = v233 - ((2 * v233) & 0x685C5412) + 875440649;
  v235 = v234 ^ v227;
  v236 = 2
       * (((v232 ^ 0xF477B4BA) & (v230 ^ 0x81A498AF)) - ((2 * ((v232 ^ 0xF477B4BA) & (v230 ^ 0x81A498AF))) & 0x945DF36))
       + 155574070;
  v237 = (v230 ^ 0x75D32C15 ^ v232) + (v236 ^ 0x269224DF) - 802683881 + ((2 * v236) & 0x5FAFF7D0 ^ 0x128BB640);
  v238 = ((2 * v237) & 0xF4EFFF9E) + (v237 ^ 0x7A77FFCF);
  v239 = (v234 ^ 0x342E2A09)
       - v238
       + 2054684623
       - ((2 * ((v234 ^ 0x342E2A09) - v238 + 2054684623)) & 0x86B07498)
       - 1017628084;
  v240 = v239 ^ v232;
  v241 = v240 & 0x800 ^ 0xFDE27DDE;
  v242 = v241 + 2069737342;
  v243 = -((v241 + 35490338) & v235);
  v244 = ((v240 & 0xFFFFF7FF ^ 0x45A810D6) - ((2 * (v240 & 0xFFFFF7FF ^ 0x45A810D6)) & 0xE8CBEB86) + 1952839107) ^ 0x6E4E1E3;
  v245 = ((2 * v244) & 0x7DB3E098) - v244 - 1054470221;
  v246 = 1998756666 - v241;
  if (!v243)
    v246 = v242;
  v247 = ((v235 ^ 0xA315A660)
        - 2034247004
        + v246
        - ((2 * ((v235 ^ 0xA315A660) - 2034247004 + v246)) & 0x1F14CC16)
        + 260728331) ^ v245;
  v248 = ((2 * (v238 - 2054684623 + (v247 ^ 0xCEAAEBB8))) & 0xF3AF3B72)
       + ((v238 - 2054684623 + (v247 ^ 0xCEAAEBB8)) ^ 0x79D79DB9);
  v249 = ((2 * ((v195 ^ 0xBEA35963) + (v239 ^ 0x3CA7C5B3) + 1)) & 0x76FFFFE6)
       + (((v195 ^ 0xBEA35963) + (v239 ^ 0x3CA7C5B3) + 1) ^ 0xBB7FFFF3);
  v250 = ((2 * ((v199 ^ 0xD8BFB838) + (v247 ^ 0x31551447) + 1)) & 0xF7E6D7DE)
       + (((v199 ^ 0xD8BFB838) + (v247 ^ 0x31551447) + 1) ^ 0x7BF36BEF);
  v251 = v249 - ((2 * v249 + 10970484) & 0x28792114) + 1418740548;
  v252 = ((2 * (v209 + 872432290 + (v240 ^ 0xC8D07109))) & 0xB3FFFFFE)
       + ((v209 + 872432290 + (v240 ^ 0xC8D07109)) ^ 0x59FFFFFF);
  v253 = v250 - ((2 * v250 - 419531622) & 0xC88DE28E) + 1472605076;
  v254 = v252 - ((2 * v252 + 1861254652) & 0xDDEDEB16) - 1502661495;
  v255 = ((2 * v248 + 206619790) ^ 0x82800445)
       + ((v214 - 2044173753 + v248) ^ 0x3CFF63FF)
       + ((2 * (v214 - 2044173753 + v248)) & 0x79FEC7FE)
       - ((2 * (2 * v248 + 206619790)) & 0xFAFFF774);
  v256 = v255 - ((2 * v255 + 171981208) & 0x38B4C15C) + 1635417466;
  v257 = *(_DWORD *)(STACK[0x1348] + 4 * (HIBYTE(v251) ^ 0x14)) ^ *(_DWORD *)(STACK[0x1340]
                                                                              + 4 * (BYTE2(v254) ^ 0xF6u));
  HIDWORD(v258) = v257 ^ 0x50DD4FA;
  LODWORD(v258) = v257 ^ 0x40000000;
  v259 = (v258 >> 30) - ((2 * (v258 >> 30)) & 0x234BE86A) + 296088629;
  HIDWORD(v258) = v259 ^ 0x25F435;
  LODWORD(v258) = v259 ^ 0x11800000;
  v260 = (v258 >> 23) - ((2 * (v258 >> 23)) & 0x41E71FDE) + 552833007;
  HIDWORD(v258) = *(_DWORD *)(STACK[0x1338]
                            + 4
                            * (((unsigned __int16)(v250 - ((2 * v250 + 29850) & 0xE28E) + 11156) >> 8) ^ 0xF1u)) ^ 0x50C005E;
  LODWORD(v258) = *(_DWORD *)(STACK[0x1338]
                            + 4
                            * (((unsigned __int16)(v250 - ((2 * v250 + 29850) & 0xE28E) + 11156) >> 8) ^ 0xF1u));
  v261 = (v258 >> 30) - ((2 * (v258 >> 30)) & 0x5AEBC0EC);
  HIDWORD(v258) = v260 ^ 0xFFFFFF7F;
  LODWORD(v258) = v260 ^ 0x5F755E00;
  v261 += 762699894;
  v262 = (v258 >> 9) - ((2 * (v258 >> 9)) & 0x45F78D42) - 1560557919;
  HIDWORD(v258) = v262 ^ ~v261;
  LODWORD(v258) = v262 ^ v261 ^ 0x8F8E26D4;
  v263 = HIBYTE(v254) ^ 0xEE;
  v264 = *(_DWORD *)(STACK[0x1350] + 4 * ((v255 - ((2 * v255 - 104) & 0x5C) + 122) ^ 0xAEu)) ^ 0x85544A2E ^ ((v258 >> 2) - ((2 * (v258 >> 2)) & 0x60E79E64) - 1334587598);
  v265 = *(_DWORD *)(STACK[0x1340] + 4 * (BYTE2(v253) ^ 0x46u));
  v266 = v254 ^ 0x8B;
  v267 = *(_DWORD *)(STACK[0x1338] + 4 * (BYTE1(v256) ^ 0x60u));
  v268 = *(_DWORD *)(STACK[0x1340] + 4 * (BYTE2(v251) ^ 0x3Cu));
  v269 = *(_DWORD *)(STACK[0x1340] + 4 * (BYTE2(v256) ^ 0x5Au));
  v270 = *(_DWORD *)(STACK[0x1338] + 4 * (BYTE1(v254) ^ 0xF5u));
  v271 = ((v264 & 0x5D304724 ^ 0x5920CB8) - ((2 * (v264 & 0x5D304724 ^ 0x5920CB8)) & 0x21601008) + 313591879) ^ 0x131305FF | ((v264 & 0xA2CFB8DB ^ 0x86882857) - ((2 * (v264 & 0xA2CFB8DB ^ 0x86882857)) & 0x449F5118) - 78664532) ^ 0x7D8D2CA8;
  v272 = *(_DWORD *)(STACK[0x1348] + 4 * v263);
  v273 = *(_DWORD *)(STACK[0x1348] + 4 * (HIBYTE(v253) ^ 0xE4));
  v274 = *(_DWORD *)(STACK[0x1348] + 4 * (HIBYTE(v256) ^ 0x1C));
  v275 = *(_DWORD *)(STACK[0x1350] + 4 * (v251 ^ 0x8Au));
  v276 = STACK[0x1400];
  v277 = *(_DWORD *)(STACK[0x1350] + 4 * (v253 ^ 0x47u));
  v278 = STACK[0x1408];
  v279 = v273 ^ *(_DWORD *)(STACK[0x1350] + 4 * v266) ^ *(_DWORD *)(STACK[0x1338] + 4 * (BYTE1(v251) ^ 0x90u)) ^ LODWORD(STACK[0x1400]) ^ LODWORD(STACK[0x1408]) ^ v269;
  HIDWORD(v258) = v279 ^ 0x19CBA300;
  LODWORD(v258) = v279 ^ 0x80000000;
  v280 = STACK[0x13F4];
  LODWORD(STACK[0xFD4]) = LODWORD(STACK[0x1408]) ^ LODWORD(STACK[0x1400]) ^ LODWORD(STACK[0x13F4]) ^ (v271 - ((2 * v271) & 0x63BD22C0) + 836669792);
  v281 = LODWORD(STACK[0x1358]) ^ ((v258 >> 30) - ((2 * (v258 >> 30)) & 0x58DA82C4) - 1402125982);
  v282 = v270 ^ v268 ^ v277 ^ v276 ^ v278 ^ v280 ^ v274;
  LODWORD(STACK[0xFD8]) = v282;
  HIDWORD(v258) = v281;
  LODWORD(v258) = v281 ^ 0xCB4185C;
  LODWORD(STACK[0xFDC]) = v272 ^ v275 ^ v265 ^ v276 ^ v278 ^ v280 ^ v267;
  v283 = (v258 >> 2) - ((2 * (v258 >> 2)) & 0xCC4BD4D8) - 433722772;
  LODWORD(STACK[0xFE0]) = v283;
  LODWORD(STACK[0x1164]) = LOWORD(STACK[0xFD6]);
  LODWORD(STACK[0x1168]) = HIBYTE(v283);
  LODWORD(STACK[0x116C]) = HIWORD(v282);
  v283 >>= 16;
  LODWORD(STACK[0x1170]) = v283;
  LOBYTE(STACK[0x1177]) = v283;
  v284 = ((v282 ^ 0x30886FFD | 0x45F9E781)
        - (v282 ^ 0x30886FFD | 0xBA06187E)
        - 1174005634) ^ 0x3DB341A4;
  LOBYTE(v284) = byte_22D24D890[(((2 * v284) | 0x10BA25F8) - v284 - 140317436) ^ 0x409FDB7BLL];
  LOBYTE(STACK[0x61B]) = (102 * v284 - ((a23 + 12 * v284) & 0x28) - 21) ^ 0xBE ^ (51 * v284
                                                                                - ((102 * v284 + 86) & 0x55)
                                                                                - 43);
  JUMPOUT(0x22D213350);
}

void sub_22D219D18()
{
  LOBYTE(STACK[0x61B]) = (((LOBYTE(STACK[0x118B]) ^ 0x5C) & STACK[0x767] ^ 0xE0)
                        - ((2 * ((LOBYTE(STACK[0x118B]) ^ 0x5C) & STACK[0x767])) & 0x2A)
                        - 107) ^ 0x75;
  JUMPOUT(0x22D20F394);
}

void sub_22D219D6C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = v2[323];
  v2[324] = v3;
  v4 = STACK[0xF7C];
  LODWORD(STACK[0xF90]) = STACK[0xF7C];
  LODWORD(STACK[0xF94]) = v4 - 409;
  v5 = (v4 - 1761788833) & 0xFF6FEDDB;
  LODWORD(STACK[0xF98]) = v5;
  v6 = (v5 ^ 0xFFFFFFFF6FFC218CLL) + v3;
  LOBYTE(STACK[0xF9F]) = *(_BYTE *)(STACK[0x1870] + v6);
  v7 = **(_QWORD **)(v1 + 81) + v6;
  v2[327] = v7;
  v2[64] = v7;
  v2[62] = *(_QWORD *)(v0 + 8 * (v4 ^ 0x631)) - 12;
  JUMPOUT(0x22D215040);
}

void sub_22D219DEC(uint64_t a1)
{
  __asm { BR              X10 }
}

void sub_22D219E34(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  BOOL v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = v1 > v3;
  v5 = v1 == v3;
  v6 = v4;
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    v5 = v6;
  v7 = !v5;
  v8 = 24;
  if (!v7)
    v8 = 28;
  *(_DWORD *)(v2 + 12) = *(_DWORD *)(a1 + v8) ^ *(_DWORD *)(a1 + 32);
}

uint64_t sub_22D21A0B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(v3 + 640);
  LOBYTE(STACK[0x3B7]) = STACK[0x39B];
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 488)
                            + 32
                            * *(unsigned __int8 *)(((v4 - *(_QWORD *)(v1 + 464)) & 0xFFFFFFFFFFFFFFF0)
                                                 + *(_QWORD *)(v2 + 456)
                                                 + 8)
                            + 16))();
  return (*(uint64_t (**)(uint64_t))(v3 + 632))(v5);
}

uint64_t sub_22D21A100()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  char v4;
  int v5;
  uint64_t (*v6)(void);

  v3 = LODWORD(STACK[0x3A4]) - 698256695;
  v4 = *(_BYTE *)(v2 - 197) ^ (v3 < 0xD8197F7B);
  v5 = v3 < *(_DWORD *)(v2 - 196);
  if ((v4 & 1) != 0)
    v5 = *(unsigned __int8 *)(v2 - 197);
  v6 = (uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((19 * (v0 & ~v5)) | LODWORD(STACK[0x3A8]))) - 8);
  LODWORD(STACK[0x39C]) = STACK[0x3A8];
  LODWORD(STACK[0x3A0]) = STACK[0x3B0];
  return v6();
}

uint64_t sub_22D21A16C()
{
  _QWORD *v0;
  int v1;
  uint64_t v2;
  int v3;
  unint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;

  v3 = byte_22D24CE70[v0[165]];
  HIDWORD(v4) = v3 ^ 0xA;
  LODWORD(v4) = v3 << 24;
  v5 = (v4 >> 29) - ((2 * (v4 >> 29)) & 0x2A) + 21;
  v6 = ((v5 & 0xFE) >> 1) ^ 0xA;
  v7 = v6 + (v5 ^ 0x15);
  v8 = 2 * ((v6 & (v5 ^ 0x15)) - ((2 * (v6 & (v5 ^ 0x15))) & 0x78)) - 8;
  v9 = (v7 ^ 0x1F) + 2 * (v7 & 0x1F) + (v8 ^ 0x75) + ((2 * v8) & 0xFFFFFFE7 ^ 0x1F) + 85;
  v10 = v0[12] + LODWORD(STACK[0x46C]);
  LOBYTE(STACK[0x39B]) = v5 ^ 0x51 ^ ((v9 >> 2) - ((v9 >> 1) & 0x24) + 18);
  v0[80] = v10;
  v0[79] = *(_QWORD *)(v2 + 8 * (int)(v1 ^ 0x98DA4B27)) - 12;
  return sub_22D21A0B8();
}

void sub_22D21A9D0()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t v2;

  v1 = byte_22D250DE0[((LOBYTE(STACK[0x618]) ^ 0x73) + 10142977 - ((2 * (LOBYTE(STACK[0x618]) ^ 0x73)) & 0x174) + 185) ^ 0x9AC501];
  v2 = *(_QWORD *)(v0 + 96) + LODWORD(STACK[0x530]);
  LOBYTE(STACK[0x39B]) = v1 ^ ((v1 >> 2) & 4 | 0x5A) ^ 0xFC;
  *(_QWORD *)(v0 + 640) = v2;
  JUMPOUT(0x22D21AA40);
}

void sub_22D21AA48()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  v1 = (STACK[0x378] & 0x3A ^ 0x6040A031) + (STACK[0x378] & 0xC5) - 1;
  LOBYTE(v1) = byte_22D248640[((v1 & 0x20400089 ^ 0x910D0488) + (v1 ^ 0x28C2CA73) - ((v1 ^ 0x28C2CA73) & 0x48024A89)) ^ 0xB1CD2472];
  v2 = *(_QWORD *)(v0 + 96) + LODWORD(STACK[0x4AC]);
  LOBYTE(STACK[0x39B]) = (-37 * v1 - ((54 * v1 + 82) & 0x5A) - 106) ^ 0x40;
  *(_QWORD *)(v0 + 640) = v2;
  JUMPOUT(0x22D21AB00);
}

uint64_t sub_22D21AB0C()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  uint64_t v5;

  v3 = (HIWORD(LODWORD(STACK[0x370])) & 0xBA ^ 0x17D158B9) + (HIWORD(LODWORD(STACK[0x370])) & 0x45) - 1;
  v4 = byte_22D2506B0[((v3 & 0x8048C7 ^ 0x80000001) + (v3 ^ 0x36E478DE) - ((v3 ^ 0x36E478DE) & 0x201100C7)) ^ 0x81A4687BLL];
  v5 = v1[12] + LODWORD(STACK[0x510]);
  LOBYTE(STACK[0x39B]) = v4 ^ 0xB6 ^ (v4 >> 4) ^ (((v4 ^ 0xB6) >> 5) | 0x88) ^ 0xD2;
  v1[80] = v5;
  v1[79] = *(_QWORD *)(v2 + 8 * (v0 + 720)) - 8;
  return sub_22D21A0B8();
}

uint64_t sub_22D21AE74()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  int v3;
  char v4;
  char v5;
  uint64_t (*v6)(void);

  v2 = STACK[0x428];
  v3 = LODWORD(STACK[0x428]) + 1;
  LODWORD(STACK[0x434]) = v3;
  v2 -= 155898786;
  v4 = *(_BYTE *)(v1 - 225) ^ (v2 < 0xFC26D49D);
  v5 = v2 < *(_DWORD *)(v1 - 224);
  if ((v4 & 1) != 0)
    v5 = *(_BYTE *)(v1 - 225);
  v6 = *(uint64_t (**)(void))(v0 + 8 * (((4 * (v5 & 1)) & 0xEF | (16 * (v5 & 1))) ^ LODWORD(STACK[0x42C])));
  LODWORD(STACK[0x420]) = STACK[0x42C];
  LODWORD(STACK[0x424]) = v3;
  return v6();
}

uint64_t sub_22D21AEE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  int v19;
  uint64_t v20;
  uint64_t v21;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 + 8 * (((((LODWORD(STACK[0x430]) + 1730523467) | 0x110) - 56) * (*(_QWORD *)(v20 + 96) != (_QWORD)&unk_22D251C10)) ^ (v19 + LODWORD(STACK[0x430]) + 1108))) - 8))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19);
}

uint64_t sub_22D21AF3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54)
{
  int v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;

  v55[286] = 0xDD343E857DC629ABLL;
  v55[287] = 0x209A40AB3EA1B029;
  v55[288] = 0xDD343E857DC629ABLL;
  v55[289] = 0x209A40AB3EA1B029;
  v55[20] = v57 - 160;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 + 8 * (((((91 * (v54 ^ 0x12) - 42) ^ (a54 == -67371606)) & 1) * ((91 * (v54 ^ 0x112) - 700) ^ 0x604)) ^ (91 * (v54 ^ 0x112)))) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           v57 - 160,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43);
}

void sub_22D21B9F4(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,int a47)
{
  _QWORD *v47;
  uint64_t v48;
  int v49;
  int v50;
  uint64_t v51;

  v47[179] = v47[12];
  LOBYTE(STACK[0x6B3]) = (a47 - 1168538915) < 0xB6558087;
  LODWORD(STACK[0x6B4]) = a47 - 1168538915;
  LODWORD(STACK[0x644]) = a1 & 0xC6231F4D;
  LODWORD(STACK[0x648]) = -649787975;
  LODWORD(STACK[0x64C]) = 507185059;
  LODWORD(STACK[0x650]) = 2034382779;
  LODWORD(STACK[0x654]) = 1194936232;
  LODWORD(STACK[0x658]) = -1448043750;
  LODWORD(STACK[0x65C]) = STACK[0x658];
  LODWORD(STACK[0x660]) = STACK[0x654];
  v49 = STACK[0x650];
  LODWORD(STACK[0x664]) = STACK[0x650];
  LODWORD(STACK[0x668]) = STACK[0x64C];
  LODWORD(STACK[0x66C]) = STACK[0x648];
  v50 = STACK[0x644];
  LODWORD(STACK[0x670]) = STACK[0x644];
  LODWORD(STACK[0x674]) = v50 + 792;
  v51 = v47[179] + (v49 - 2034382779);
  v47[173] = v51;
  v47[87] = v51;
  v47[85] = *(_QWORD *)(v48 + 8 * (v50 ^ 0x41B));
  JUMPOUT(0x22D223C50);
}

uint64_t sub_22D21C550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  int v39;
  _QWORD *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v42 = malloc(0x404uLL);
  v40[71] = v42;
  *v40 = v40[57];
  v40[1] = 0;
  v43 = v40[67];
  v40[2] = v40[61];
  v40[3] = v43;
  v44 = v40[64];
  v40[5] = 0;
  v40[6] = v44;
  v40[7] = v40[69];
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 + 8 * ((1488 * (v42 != 0)) ^ v39)) - ((v39 - 805116824) & 0x2FFD1B2F) + 291))(v42, v45, v46, v47, v48, v49, v50, v51, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39);
}

uint64_t sub_22D21C5E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int a64;
  int a66;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  unint64_t v74;

  v69 = (((a64 ^ LODWORD(STACK[0x2B0]) ^ 0xBF2248DE)
        - ((2 * (a64 ^ LODWORD(STACK[0x2B0]) ^ 0xBF2248DE) + 2026669716) & 0x4B95430E)
        + 1647371473) ^ 0xA5CAA187)
      + a66;
  v70 = (((((2 * v69) & 0xFF27FBF8) + (v69 ^ 0xFF93FDFC)) & 0xFFFFFFFE)
       - ((2 * (((2 * v69) & 0xFF27FBF8) + (v69 ^ 0xFF93FDFC)) + 14156808) & 0xC6EF845C)
       - 471612365) ^ 0x60D59C2C;
  LODWORD(STACK[0x354]) = v70;
  v71 = (((v66 + 213) | 0x1F0) + 485291125) * v70
      - ((2 * (((v66 + 213) | 0x1F0) + 485291125) * v70) & 0xA4B6289C)
      + 1381700686;
  v72 = (((v71 ^ LODWORD(STACK[0x344])) & 0xF4 ^ 0x83ACB5F1) - (v71 ^ LODWORD(STACK[0x344]) | 0xFFFFFFF4) - 2) ^ 0x93A477F0;
  v73 = dword_22D249A90[(v72 - ((2 * v72) & 0x24) - 907794414) ^ 0xD9ECEA5D];
  HIDWORD(v74) = v73 ^ 0xC9C;
  LODWORD(v74) = v73 ^ 0x9D66E000;
  *(_DWORD *)(*(_QWORD *)(v67 + 568)
            + 4
            * (((((v66 - 43) | 0xF0) + 117) * v70
                               - ((2 * (((v66 - 43) | 0xF0) + 117) * v70) & 0x9C)
                               + 78) ^ 0x4Eu)) = LODWORD(STACK[0x248]) ^ LODWORD(STACK[0x268]) ^ LODWORD(STACK[0x29C]) ^ 0x54C1EEF5 ^ ((v74 >> 12) - ((2 * (v74 >> 12)) & 0x13C9A398) - 1981492788);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v68 + 8 * v66) - 8))(2477029360, 36, 3387172882, 3656182365, dword_22D249A90, 3228, 2640764928, 331981720, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41);
}

uint64_t sub_22D21C7D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  int v39;
  _QWORD *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v42 = malloc(0x404uLL);
  v40[73] = v42;
  *v40 = v40[57];
  v40[1] = 0;
  v43 = v40[67];
  v40[2] = v40[61];
  v40[3] = v43;
  v44 = v40[64];
  v40[5] = v40[71];
  v40[6] = v44;
  v40[7] = v40[69];
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 + 8 * (((v42 != 0) * ((v39 - 534) ^ (v39 - 11) ^ 0x5D7)) ^ v39)) - 4))(v42, v45, v46, v47, v48, v49, v50, v51, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39);
}

uint64_t sub_22D21C844()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  char v8;
  char v9;
  char v10;
  unsigned __int8 v11;
  int v12;
  unsigned int v13;

  v3 = 20 * (v0 ^ 0x1CA);
  v4 = (((LODWORD(STACK[0x304]) ^ 0x87F06F9C)
       - ((2 * (LODWORD(STACK[0x304]) ^ 0x87F06F9C) - 2090130962) & 0xAE046874)
       - 1732786895) ^ 0xD702343A)
     + LODWORD(STACK[0x2E4]);
  v5 = (v4 ^ 0xDFF1556B) + 537832085 + ((v4 << ((20 * (v0 ^ 0xCA)) ^ 0x91)) & 0xBFE2AAD6);
  v6 = ((v5 & 0xFFFFFFFE) - ((2 * v5) & 0xF2D87720) - 110347376) ^ 0xC3717FD7;
  LODWORD(STACK[0x364]) = v6;
  v7 = LODWORD(STACK[0x2EC]) ^ LODWORD(STACK[0x234]);
  LODWORD(STACK[0x368]) = v7;
  v8 = (((v3 - 109) ^ 0x2D) - 2 * (((v3 - 109) ^ 0x2D) & 0x72 ^ 2) - 16) & 0xA8;
  v9 = (v8 ^ 0xE) + 83 + ((2 * v8) ^ 0x40) + 82;
  v10 = ((v9 ^ 0xAF) + 81 + ((2 * v9) & 0x5E)) * v6;
  v11 = v10 - ((2 * v10) & 0xD4) + 106;
  v12 = dword_22D24DBA0[(1892409423
                       - ((v11 ^ v7) ^ 0x69 | 0x70CBE04F)
                       + ((v11 ^ v7) ^ 0x69 | 0x8F341FB0)) ^ 0x8F341F35];
  v13 = (2 * ((v12 ^ 0x9FAA0A55) * (v12 ^ 0x9FAA0A55) - ((2 * (v12 ^ 0x9FAA0A55) * (v12 ^ 0x9FAA0A55)) & 0x789FEB86))
       - 123737210) ^ 0xF89FEB86;
  *(_DWORD *)(*(_QWORD *)(v1 + 584) + 4 * (v11 ^ 0x6Au)) = LODWORD(STACK[0x284]) ^ LODWORD(STACK[0x254]) ^ LODWORD(STACK[0x2BC]) ^ v12 ^ 0xAD6B521A ^ (v13 - ((2 * v13) & 0xD5046ED0) - 360564887);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 + 8 * (v3 | 0x4E)) - 4))(4171230086, 3573837520, 3934402409);
}

void sub_22D21CAF4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;

  v1 = v0[12];
  v0[181] = v1;
  v0[182] = v1;
  v0[183] = v1;
  v0[184] = v1;
  v0[185] = v1;
  v0[186] = v1;
  v0[187] = v1;
  v0[188] = v1;
  v0[189] = v1;
  v0[190] = v1;
  v0[191] = v1;
  v0[192] = v1;
  v2 = v0[12];
  v0[193] = v2;
  v0[194] = v2;
  v0[195] = v2;
  v0[196] = v2;
  LODWORD(v2) = STACK[0x294];
  v3 = STACK[0x294];
  LODWORD(STACK[0x73C]) = STACK[0x294];
  LODWORD(STACK[0x748]) = v2;
  LODWORD(STACK[0x754]) = v2;
  LODWORD(v2) = STACK[0x234];
  v4 = STACK[0x234];
  LODWORD(STACK[0x740]) = STACK[0x234];
  LODWORD(STACK[0x74C]) = v2;
  LODWORD(STACK[0x758]) = v2;
  LODWORD(v2) = STACK[0x25C];
  LODWORD(STACK[0x738]) = STACK[0x25C];
  LODWORD(STACK[0x744]) = v2;
  LODWORD(STACK[0x750]) = v2;
  LODWORD(STACK[0x75C]) = v2;
  LODWORD(STACK[0x760]) = v3;
  LODWORD(STACK[0x764]) = v4;
  v0[203] = v0[64];
  v0[204] = v0[67];
  v0[205] = v0[71];
  v0[206] = v0[57];
  v0[207] = v0[67];
  v0[208] = v0[67];
  v0[209] = v0[71];
  v0[210] = v0[64];
  v0[211] = v0[57];
  v0[212] = v0[64];
  v0[213] = v0[67];
  v0[214] = v0[71];
  v0[215] = v0[57];
  v0[216] = v0[71];
  v0[217] = v0[57];
  v0[218] = v0[64];
  v0[219] = v0[71];
  v0[220] = v0[67];
  v0[221] = v0[64];
  v0[222] = v0[67];
  v0[223] = v0[64];
  v0[224] = v0[57];
  v0[225] = v0[71];
  v0[226] = v0[57];
  v0[227] = v0[71];
  v0[228] = v0[57];
  v0[229] = v0[67];
  v0[230] = v0[64];
  v0[231] = v0[71];
  v0[232] = v0[67];
  v0[233] = v0[57];
  v0[234] = v0[64];
  v0[235] = v0[71];
  v0[236] = v0[64];
  v0[237] = v0[67];
  v0[238] = v0[71];
  v0[239] = v0[57];
  v0[240] = v0[57];
  v0[241] = v0[67];
  v0[242] = v0[71];
  v0[243] = v0[67];
  v0[244] = v0[71];
  v0[245] = v0[57];
  v0[246] = v0[57];
  v0[247] = v0[64];
  v0[248] = v0[67];
  v0[249] = v0[64];
  v0[250] = v0[67];
  v0[251] = v0[71];
  v0[252] = v0[67];
  v0[253] = v0[71];
  v0[254] = v0[57];
  v0[255] = v0[64];
  v0[256] = v0[57];
  v0[257] = v0[71];
  v0[258] = v0[67];
  v0[259] = v0[64];
  v0[260] = v0[71];
  v0[261] = v0[57];
  v0[262] = v0[57];
  v0[263] = v0[67];
  v0[264] = v0[71];
  v0[265] = v0[64];
  v0[266] = v0[67];
  v0[267] = v0[67];
  v0[268] = v0[71];
  v0[269] = v0[64];
  v0[270] = v0[57];
  JUMPOUT(0x22D21B2B0);
}

uint64_t sub_22D21CDC4@<X0>(unsigned int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  unsigned int v32;
  int v33;
  int v34;
  _QWORD *v35;
  uint64_t v36;
  unsigned int v37;
  int v38;
  int v39;
  int v40;
  unsigned int v41;
  int v42;
  unsigned int v43;
  unsigned int v44;
  int v45;
  unsigned int v46;
  unsigned int v47;
  int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  int v67;
  unsigned int v68;
  unsigned int v69;
  int v70;
  unsigned int v71;
  int v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  int v82;
  unsigned int v83;
  int v84;
  unsigned int v85;
  int v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  int v90;
  unsigned int v91;
  int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  int v107;
  unsigned int v108;
  int v109;
  unsigned int v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  unint64_t v114;
  int v115;
  int v116;
  int v117;
  unsigned int v118;
  unsigned int v119;
  int v120;
  int v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  unsigned int v125;
  int v126;
  unsigned int v127;
  int v128;
  int v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  int v134;
  unsigned int v135;
  unsigned int v136;
  unsigned int v137;
  unsigned int v138;
  unsigned int v139;
  int v140;
  unsigned int v141;
  unsigned int v142;
  unsigned int v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  int v147;
  unsigned int v148;
  unint64_t v149;
  int v150;
  int v151;
  int v152;
  int v153;
  unsigned int v154;
  unsigned int v155;
  unsigned int v156;
  unsigned int v157;
  unsigned int v158;
  unsigned int v159;
  unsigned int v160;
  unsigned int v161;
  unsigned int v162;
  unsigned int v163;
  unsigned int v164;
  unsigned int v165;
  int v166;
  unsigned int v167;
  unsigned int v168;
  unsigned int v169;
  unsigned int v170;
  unsigned int v171;
  int v172;
  unsigned int v173;
  unsigned int v174;
  unsigned int v175;
  unsigned int v176;
  int v177;
  int v178;
  int v179;
  unsigned int v180;
  unsigned int v181;
  int v182;
  unsigned int v183;
  unsigned int v184;
  unsigned int v185;
  int v186;
  unsigned int v187;
  unsigned int v188;
  unsigned int v189;
  int v190;
  unsigned int v191;
  unsigned int v192;
  unsigned int v193;
  int v194;
  unsigned int v195;
  unsigned int v196;
  int v197;
  unsigned int v198;
  unsigned int v199;
  unsigned int v200;
  unsigned int v201;
  unsigned int v202;
  unsigned int v203;
  int v204;
  unsigned int v205;
  int v206;
  unsigned int v207;
  unsigned int v208;
  unsigned int v209;
  unsigned int v210;
  unsigned int v211;
  int v212;
  unsigned int v213;
  unsigned int v214;
  unsigned int v215;
  int v216;
  unsigned int v217;
  unsigned int v218;
  int v219;
  int v220;
  int v221;
  unsigned int v222;
  int v223;
  unsigned int v224;
  unsigned int v225;
  unsigned int v226;
  unsigned int v227;
  unsigned int v228;
  unsigned int v229;
  unsigned int v230;
  unsigned int v231;
  unsigned int v232;
  unsigned int v233;
  unsigned int v234;
  unsigned int v235;
  unsigned int v236;
  int v237;
  unsigned int v238;
  int v239;
  int v240;
  unsigned int v241;
  unsigned int v242;
  unsigned int v243;
  int v244;
  unsigned int v245;
  unsigned int v246;
  unsigned int v247;
  unsigned int v248;
  unsigned int v249;
  unsigned int v250;
  unsigned int v251;
  unsigned int v252;
  unsigned int v253;
  int v254;
  unsigned int v255;
  unsigned int v256;
  int v257;
  unsigned int v258;
  int v259;
  unsigned int v260;
  unsigned int v261;
  unsigned int v262;
  unsigned int v263;
  int v264;
  unsigned int v265;
  unsigned int v266;
  int v267;
  unsigned int v268;
  int v269;
  unsigned int v270;
  int v271;
  int v272;
  unsigned int v273;
  int v274;
  unsigned int v275;
  unsigned int v276;
  unsigned int v277;
  unsigned int v278;
  unsigned int v279;
  unint64_t v280;
  int v281;
  int v282;
  unsigned int v283;
  unsigned int v284;
  int v285;
  unsigned int v286;
  unsigned int v287;
  unsigned int v288;
  unsigned int v289;
  unsigned int v290;
  unsigned int v291;
  unsigned int v292;
  unsigned int v293;
  unsigned int v294;
  int v295;
  int v296;
  unsigned int v297;
  int v298;
  unsigned int v299;
  unsigned int v300;
  int v301;
  int v302;
  unsigned int v303;
  unsigned int v304;
  unsigned int v305;
  unsigned int v306;
  unsigned int v307;
  int v308;
  int v309;
  unsigned int v310;
  unsigned int v311;
  int v312;
  unsigned int v313;
  int v314;
  int v315;
  int v316;
  unsigned int v317;
  int v318;
  int v319;
  unsigned int v320;
  int v321;
  unsigned int v322;
  unsigned int v323;
  unsigned int v324;
  unsigned int v325;
  unsigned int v326;
  unsigned int v327;
  unsigned int v328;
  unsigned int v329;
  unsigned int v330;
  unsigned int v331;
  unsigned int v332;
  unsigned int v333;
  unsigned int v334;
  unsigned int v335;
  unsigned int v336;
  unsigned int v337;
  int v338;
  unsigned int v339;
  unsigned int v340;
  unsigned int v341;
  unsigned int v342;
  unsigned int v343;
  unsigned int v344;
  unsigned int v345;
  unsigned int v346;
  int v347;
  unsigned int v348;
  unsigned int v349;
  int v350;
  int v351;
  int v352;
  int v353;
  unsigned int v354;
  unsigned int v355;
  int v356;
  unsigned int v357;
  unsigned int v358;
  unsigned int v359;
  unsigned int v360;
  unsigned int v361;
  int v362;
  int v363;
  unsigned int v364;
  int v365;
  unsigned int v366;
  unsigned int v367;
  int v368;
  int v369;
  unsigned int v370;
  unsigned int v371;
  unsigned int v372;
  int v373;
  unsigned int v374;
  unsigned int v375;
  int v376;
  unsigned int v377;
  unsigned int v378;
  unsigned int v379;
  unsigned int v380;
  int v381;
  int v382;
  unsigned int v383;
  unsigned int v384;
  unsigned int v385;
  unsigned int v386;
  unsigned int v387;
  unsigned int v388;
  unsigned int v389;
  unsigned int v390;
  unsigned int v391;
  unsigned int v392;
  int v393;
  int v394;
  unsigned int v395;
  unsigned int v396;
  unsigned int v397;
  int v398;
  unsigned int v399;
  unsigned int v400;
  unsigned int v401;
  int v402;
  int v403;
  unsigned int v404;
  int v405;
  unsigned int v406;
  unsigned int v407;
  unsigned int v408;
  unsigned int v409;
  unsigned int v410;
  unsigned int v411;
  unsigned int v412;
  int v413;
  int v414;
  unsigned int v415;
  int v416;
  int v417;
  int v418;
  unsigned int v419;
  unsigned int v420;
  unsigned int v421;
  unsigned int v422;
  unsigned int v423;
  void *v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  unint64_t v433;

  v37 = LODWORD(STACK[0x210]) ^ 0xD5BDD704;
  v38 = STACK[0x218];
  v39 = 1637336797 * LODWORD(STACK[0x218]);
  v40 = 53448122 * LODWORD(STACK[0x218]) + 822540542;
  v433 = __PAIR64__(v32, a1);
  HIDWORD(a30) = v33;
  LODWORD(STACK[0x224]) = v32;
  LODWORD(STACK[0x228]) = a1;
  v41 = v39 - (v40 & 0x3C72D9E8) - 1766004365;
  v42 = LODWORD(STACK[0x214]) ^ 0xE78FD8E;
  LODWORD(STACK[0x22C]) = v37;
  LODWORD(a12) = 230 * (v34 ^ 0x178);
  v43 = v41 >> 17;
  v44 = (((-479297536 * v38 - ((1188888576 * v38 + 2088697856) & 0x47B40000) + 1645853220) ^ 0xA3DA3A24) & 0xFFFF8000 | (v41 >> 17)) ^ 0x4F1C;
  v45 = v44 + 962827307 - ((2 * v44) & 0x72C72856);
  v46 = v32 ^ 0xC0B6F57F;
  v47 = -2093375861 * v46 - ((108215574 * v46) & 0xB128E5F0) + 1486123768;
  v48 = 369098752 * v46 + 530319835 - ((738197504 * v46) & 0x3C000000);
  v49 = 78224713 * (v45 ^ 0x3963942B) - ((156449426 * (v45 ^ 0x3963942B)) & 0x64474554) + 841196202;
  v50 = ((-1317011456 * v42 - 1653386963 - ((587202560 * v42) & 0x3A000000)) ^ 0x9D73512D | ((v42
                                                                                            * ((v34 + 623) ^ 0x216F8746 ^ a12)
                                                                                            - ((1121913542 * v42) & 0xC2541E50)
                                                                                            + 1630146344) >> 9)) ^ 0x309507;
  v51 = ((2 * (v48 ^ 0x1F9C09DB | (v47 >> 7))) & 0x3E7B35DC ^ 0x6211C8) + ((v48 ^ 0x1F9C09DB | (v47 >> 7)) ^ 0x9F8CB20B);
  v52 = ((v50 - ((2 * v50) & 0x3180594C) + 415247526) ^ v45 ^ 0x21A3B88D) - v51 - 1623352594;
  v53 = ((1267190912 * (a1 ^ 0x74D1CA90) + 1543074729 - ((-1760585472 * (a1 ^ 0x74D1CA90)) & 0xB7F2E700)) ^ 0x5BF973A9 | ((1687621529 * (a1 ^ 0x74D1CA90) - ((-919724238 * (a1 ^ 0x74D1CA90)) & 0x9E27C43E) - 820780513) >> 25)) ^ 0x67;
  v54 = v53 + 1870504954 - ((2 * v53) & 0xDEFB47F4);
  v55 = v54 ^ (v52 - ((2 * v52) & 0x536FCA08) - 1447566076) ^ 0xC6CA46FE;
  v56 = (1709808343 * v55 - ((-875350610 * v55) & 0xE2B28F30) + 1901676440) >> 13;
  v57 = v54 ^ 0x6F7DA3FA;
  v58 = -142106043 * (v54 ^ 0x6F7DA3FA) - ((789529738 * (v54 ^ 0x6F7DA3FA)) & 0x261D9F98) + 319737804;
  v59 = v56 | (-692584448 * v55 + 2033872229 - ((-1385168896 * v55) & 0xF2700000)) ^ 0x793A6D65;
  v60 = ((2 * v59) & 0xFEFFBFDC ^ 0x71594) + (v59 ^ 0x7F7C5524);
  v61 = (v49 >> 1) ^ 0xC6ECBFAA;
  v62 = v49 & 0xBFFADDFE ^ 0x322280AA;
  v63 = 1189873353 * v60 - ((-1915220590 * v60 - 1008520124) & 0xC3F2A852) - 1008013749;
  v64 = ((1256849408 * v51 - ((-1781268480 * v51 + 753401856) & 0xE83C0000) + 177468757) ^ 0x741FF555) & 0xFFFE0000 | ((-1345542795 * v51 - ((1603881706 * v51 - 1196845452) & 0xBB3E1996) + 972281861) >> 15);
  v65 = ((2 * v64) & 0xEFBDF3DE ^ 0x1725C) + (v64 ^ 0x77DF42D1);
  v66 = -395040621 * v65 - ((-790081242 * v65 - 147175546) & 0xC6517574) - 557457795;
  v67 = -2025682640 * v65 - ((243602016 * v65 + 1940158560) & 0x57EA9A40) - 439908009;
  v68 = (-1610612736 * v57 - 537085746 + (v57 >> 1 << 31)) ^ 0xDFFCB8CE | (v58 >> 3);
  v69 = ((2 * v68) & 0xFA7F38FA ^ 0x4330F2) + (v68 ^ 0x7F5E4584);
  v70 = v62 + (v43 << 31) + v61 + v69 - v65 + v60 + 1919501695;
  v71 = 213632093 * v70 - ((427264186 * v70 + 1222065756) & 0x6192462E) - 1791704507;
  v72 = 1207959552 * v60 - (((v56 << 28) + 0x20000000) & 0x30000000) - 1437463565;
  v73 = -2001076224 * v70 - ((292814848 * v70 + 2092433408) & 0x49F00000) - 481020339;
  v74 = (v67 ^ 0x2BF54D27) & 0xFFFFFFF0 | (v66 >> 28);
  v75 = ((2 * ((v72 ^ 0x9A520BF3) & 0xF8000000 | (v63 >> 5))) & 0xFBFDDFFC ^ 0x21D9540)
      + (((v72 ^ 0x9A520BF3) & 0xF8000000 | (v63 >> 5)) ^ 0x7EF1255F);
  v76 = ((-868205248 * v69 - ((-1736410496 * v69 - 1726075008) & 0xF279E100) - 976484247) ^ 0xF93CF0A9) & 0xFFFFFFC0 | ((-1691287307 * v69 - ((912392682 * v69 + 2120513726) & 0x78742CE4) + 996954833) >> 26);
  v77 = ((2 * v76) & 0xFFF6DFE8 ^ 0x48) + (v76 ^ 0xFFFB6FDB);
  v78 = ((2 * ((v73 ^ 0xA4F8364D) & 0xFFFE0000 | (v71 >> 15))) & 0xFFCFB9FC ^ 0x8124)
      + (((v73 ^ 0xA4F8364D) & 0xFFFE0000 | (v71 >> 15)) ^ 0xFFE7BD6C);
  v79 = (v74 ^ 0x75E7F771) + ((2 * v74) & 0xEBCFEEEE ^ 0xD) + v77 - v75 - v78 + 1;
  v80 = (288332334 * v75 - ((39793756 * v75 + 73410744) & 0x1E5CB02C)) & 0xFFFFFFFE | ((((288332334 * v75 + 305140828) & 0x8CA6671E)
                                                                                      + 2003317481 * v75
                                                                                      + 815055426) >> 31);
  v81 = ((-671088640 * v77 - ((0x40000000 - 1342177280 * v77) & 0xB0000000) + 2141734137) ^ 0x5FA844F9 | ((-2047698469 * v77 - ((199570358 * v77 + 179096712) & 0x28704E22) + 965643605) >> 5)) ^ 0xA1C138;
  v82 = v81 - ((2 * v81) & 0x290D2314) + 344363402;
  v83 = (((-809759992 * v78 - ((527963664 * v78 + 460610592) & 0x11421FD0)) & 0xFFFFFFF8 | ((-101219999 * v78
                                                                                           - ((1945043650 * v78
                                                                                             + 1466862468) & 0x40D14BCE)
                                                                                           - 1944065111) >> 29))
       + 1717255672) ^ 0x8A10FED;
  v84 = v83 + 399947334 - ((2 * v83) & 0x2FAD6C8C);
  LODWORD(STACK[0x230]) = v84;
  v85 = (((-735410688 * v79 - ((676662272 * v79 + 960345088) & 0x22ED3C00) - 300582688) ^ 0x11769EE0) & 0xFFFFFE00 | ((1131025731 * v79 - ((-2032915834 * v79 - 1260609830) & 0xD9B4969C) + 1195940539) >> 23)) ^ 0xD9;
  v86 = v85 + 111270608 - ((2 * v85) & 0xD43B5A0);
  v87 = ((v80 - 1587647374) ^ 0x8F2E5816) + 1404115227 - ((2 * ((v80 - 1587647374) ^ 0x8F2E5816)) & 0xA7623236);
  v88 = (v84 ^ 0xE82949B9) + (v82 ^ 0x47378891 ^ v87) + 1;
  v89 = v86 ^ 0x6A1DAD0;
  v90 = (v86 ^ 0x6A1DAD0) + (v88 ^ 0x3E7CFE57) + ((2 * v88) & 0x7CF9FCAE) - 1048378967;
  v91 = v90 + 1203115398 - ((2 * v90) & 0x8F6C2B0C);
  v92 = (v87 ^ 0x53B1191B)
      + (v84 ^ 0x17D6B646)
      - ((2 * ((v87 ^ 0x53B1191B) + (v84 ^ 0x17D6B646))) & 0x19341E46)
      - 1936060637;
  v93 = 2 * (((v92 ^ 0xB36219E1) & (v86 ^ 0x6A1DAD0)) - ((2 * ((v92 ^ 0xB36219E1) & (v86 ^ 0x6A1DAD0))) & 0x1AD3D322))
      + 450089762;
  v94 = (v86 ^ 0x35C3C331 ^ v92) + (v93 ^ 0x452D40DC) - 1610519550 + ((2 * v93) & 0xBFFD27FC ^ 0x35A52644);
  v95 = v91 ^ 0x55274D17 ^ (v94 - ((2 * v94) & 0xC06BAC22) + 1614140945);
  v96 = v95 - ((2 * v95 - 1978234478) & 0x9D9B6B78) + 332987013;
  LODWORD(STACK[0x234]) = v96;
  LODWORD(STACK[0x238]) = HIBYTE(v96) ^ 0xDE8C6ED3;
  v97 = v89 + (v96 ^ 0xB1324A43) + 1893603134 - ((2 * (v89 + (v96 ^ 0xB1324A43) + 1)) & 0xE1BC2E7A);
  LODWORD(STACK[0x23C]) = v97;
  v98 = v96 ^ v84;
  LODWORD(STACK[0x240]) = v96 ^ v84;
  v97 ^= 0x70DE173Du;
  v99 = -1989855995 * v97 - ((315255306 * v97) & 0xBF64060C) - 541981946;
  v96 ^= 0x4ECDB5BCu;
  LODWORD(STACK[0x244]) = v96;
  v100 = (v91 ^ 0x47B61586) + v96 + 1851650380 - ((2 * ((v91 ^ 0x47B61586) + v96)) & 0xDCBBE298);
  LODWORD(STACK[0x248]) = v100;
  v101 = -620667077 * v96 - ((-1241334154 * v96) & 0x88B38C50) - 1000749528;
  v102 = 23018240 * v96 + 409327955 - ((46036480 * v96) & 0x30CBB200);
  v103 = 1954890871 * (v100 ^ 0x6E5DF14C) - ((-385185554 * (v100 ^ 0x6E5DF14C)) & 0x8C495F7C) + 1176809406;
  v104 = (1199570944 * (v98 ^ 0x591B03FA) + 819275203 - ((251658240 * (v98 ^ 0x591B03FA)) & 0x61000000)) ^ 0x30D525C3 | ((-552207217 * (v98 ^ 0x591B03FA) - ((506198302 * (v98 ^ 0x591B03FA)) & 0x10FE7CBEu) - 2004926881) >> 9);
  v105 = ((2 * v104) & 0x9F77FFF8 ^ 0x7F38) + (v104 ^ 0xCFFFC063);
  v106 = ((2 * (v102 ^ 0x1865D953 | HIBYTE(v101))) & 0xFECDFBB6 ^ 0x180)
       + ((v102 ^ 0x1865D953 | HIBYTE(v101)) ^ 0x7F66FD1F)
       - v105;
  v107 = ((-1499422720 * v97 + 254554590 - ((222380032 * v97) & 0x1E584000)) ^ 0xF2C31DE | (v99 >> 19)) ^ 0x1BF6;
  v108 = v107 - 147828724 - ((2 * v107) & 0xEE60A018);
  v109 = v108 ^ (v106 - ((2 * v106 + 11142210) & 0x14A75456) - 626480052);
  v110 = 470369577 * v105 - 2 * ((470369577 * v105 + 1057559716) & 0x334C191F ^ (470369577 * v105) & 2) - 1303040575;
  v108 ^= 0xF730500C;
  v111 = 494062539 * v108 - ((988125078 * v108) & 0x71762E16) - 1195698421;
  v112 = -770371108 * (v100 ^ 0x6E5DF14C) - 241074001 - ((-1540742216 * (v100 ^ 0x6E5DF14C)) & 0xE3430158);
  v113 = ((v112 ^ 0xF1A180AF | (v103 >> 30)) ^ 1) - 2123523330 - ((2 * (v112 ^ 0xF1A180AF | (v103 >> 30))) & 0x2DB35FC);
  HIDWORD(v114) = v109 ^ 0x163FA27;
  LODWORD(v114) = v109 ^ 0x7C000000;
  v115 = (v114 >> 25) - ((2 * (v114 >> 25)) & 0x8FE64E1A) - 940366067;
  HIDWORD(v114) = v113 ^ 0x16D9AFE;
  LODWORD(v114) = v112 ^ 0xF0000000;
  v116 = v115 ^ ((v114 >> 25) - ((2 * (v114 >> 25)) & 0x27BF7304) + 333429122);
  HIDWORD(v114) = v116 ^ 0x4D;
  LODWORD(v114) = v116 ^ 0xE92E880;
  v117 = ((v114 >> 7) - ((2 * (v114 >> 7)) & 0x37A5D3D6) - 1680676373) ^ 0x1E679507;
  v118 = (-1564475392 * v117 + 32639175 - (((3 * (_BYTE)v117) & 7) << 23)) ^ 0x1F208C7 | ((1142700683 * v117
                                                                                         - ((137917718 * v117) & 0x31CD3856u)
                                                                                         + 417766443) >> 10);
  v119 = ((2 * v118) & 0xFBDF7BEA ^ 0xC734A) + (v118 ^ 0xFDE98452);
  v120 = -1076958386 - ((v99 << 11) & 0x40000000) + 1610612736 * v108;
  HIDWORD(v114) = v113 ^ 6;
  LODWORD(v114) = (-189532815 * (v113 ^ 0x816D9AFE) + 1540634936 - ((-379065630 * (v113 ^ 0x816D9AFE)) & 0xB7A87274) + 2) ^ 0x5BD43938;
  v121 = ((2 * (v114 >> 3)) & 0xBA6F776C) + ((v114 >> 3) ^ 0xDD37BBB6);
  v122 = 45711879 * v119 - ((91423758 * v119 + 1071433882) & 0x287B70FE) + 875306188;
  v123 = 117440512 * v119 - ((234881024 * v119 - 1711276032) & 0xEA000000) + 1115100199;
  v124 = ((v110 >> 4) ^ 0xD54BBEFC) - 1879048192 * v105 + ((v110 >> 3) & 0xCFEFEDA ^ 0x4688202) + 1804649118 + v119;
  v125 = (((v120 ^ 0xBFCEEB4E | (v111 >> 3)) ^ 0x171762E1)
        - 1609132584
        - ((2 * ((v120 ^ 0xBFCEEB4E | (v111 >> 3)) ^ 0x171762E1)) & 0x402D2BB0)) ^ 0xA01695D8;
  v126 = v124 & v125 ^ 0x7BE77747;
  v127 = (2 * (v124 & v125)) & 0xF7CEEE8E;
  v128 = v124 | v125;
  v129 = v121 + (v128 ^ 0x7FBBEFFF) + v126 - 876484189;
  v130 = v127 + ((2 * v128) & 0xFF77DFFE) + v129;
  v131 = -716246237 * v125 - ((-1432492474 * v125) & 0xA60CF9E0) - 754549520;
  v132 = 341226649 * v130 - ((682453298 * v130 + 263410162) & 0x7CD259DA) - 968698394;
  v133 = ((v129 << 28) | 0xEFFFFFFC) - 939524096 * v130 + 1352775172;
  LOBYTE(v129) = (((v132 & 0x18 ^ 0xEB) - 1) ^ 0x49) - 1;
  v134 = ((v133 >> 8) ^ 0x57DD524B) + ((v133 >> 7) & 0xA00000);
  v135 = (((((v132 >> 5) ^ 0x1F34967) << (v129 ^ 0xAA))
         - 694737254
         - ((2 * (((v132 >> 5) ^ 0x1F34967) << (v129 ^ 0xAA))) & 0xAD2E4D34)) ^ 0xD697269A) << (v129 ^ 0xB2);
  v136 = (v135 - ((2 * v135) & 0x8B2E3C26) - 979952109) ^ (v132 >> 13);
  v137 = v136 & 0xF7FFFFFF;
  v138 = ((2 * v136) & 0x6F5C8FBE ^ 0x1B0C8AB4)
       + (v136 & 0xF7FFFFFF ^ 0xF238AA85)
       + (((v136 ^ 0x326912A5) + 1) ^ 0x5FB44DFF)
       + ((2 * ((v136 ^ 0x326912A5) + 1)) & 0xBF689BFE);
  v139 = v138 - 69353938;
  v140 = ((v138 + 1620929058) & (v134 - 1465250813))
       + 643701347
       - ((2 * ((v138 + 1620929058) & (v134 - 1465250813))) & 0x4CBC34B2);
  v141 = ((2 * ((v123 ^ 0xF5771427) & 0xFF000000 | (v122 >> 8))) & 0xBFFBD5F6 ^ 0x285170)
       + (((v123 ^ 0xF5771427) & 0xFF000000 | (v122 >> 8)) ^ 0xDFE9D743);
  v142 = 842006528 * v125 - 1182585795 + (~(1684013056 * v125) | 0x8CFFFFFF) + 1;
  v143 = -573220927 - (v137 ^ 0xE1B8F5B9 | 0xDDD557C1) + (v137 ^ 0xE1B8F5B9 | 0x222AA83E);
  v144 = 1093377409 * v121 - ((39271170 * v121 + 913544852) & 0x476196B6) + 1055561381;
  v145 = -1065353216 * v121 - ((-2130706432 * v121 + 1241513984) & 0xC8000000) - 1994530576;
  v146 = 983755242 - v138;
  if (v140 == 643701347)
    v146 = v139;
  v147 = (v146 + v134 - ((2 * (v146 + v134) + 450064366) & 0x790236B0) - 907357361) ^ v143;
  v148 = 1281623823 * v141 - ((-1731719650 * v141 + 1095548054) & 0xEC1797BE) - 1766708694;
  HIDWORD(v149) = v147 ^ 0x3A695F;
  LODWORD(v149) = v147 ^ 0x61000000;
  v150 = -938598912 * v141 - ((270285824 * v141 + 427371520) & 0x2EBBF400) + 1679462460;
  v151 = ((v149 >> 24) - ((2 * (v149 >> 24)) & 0xFEE0F202) + 2138077441) ^ 0xC0B2A3DA;
  v152 = ((v142 ^ 0xB9832C3D | (v131 >> 12)) ^ 0xFDF1CFB1)
       + ((2 * (v142 ^ 0xB9832C3D | (v131 >> 12))) & 0xFBF9FFAC ^ 0x18608C)
       + v141
       + 570758447
       + v151;
  v153 = v152 - ((2 * v152) & 0x79B71B28) - 1126462060;
  v154 = (((v144 >> 9) | v145 ^ 0xE41DE0F0) ^ 0x51D865)
       + 819121175
       - 2 * ((((v144 >> 9) | v145 ^ 0xE41DE0F0) ^ 0x51D865) & 0x30D2CC1F ^ (v144 >> 9) & 8);
  v155 = (v150 ^ 0x175DFA3C) & 0xFFFFFE00 | (v148 >> 23);
  v156 = 764078531 * (v154 ^ 0x30D2CC17) - ((454415238 * (v154 ^ 0x30D2CC17)) & 0x2DB86976) + 383530171;
  v157 = (-46137344 * v151 + 516402820 - ((981467136 * v151) & 0x3D800000)) ^ 0x1EC7AE84 | ((-515049483 * v151
                                                                                           - ((-1030098966 * v151) & 0xCAD746D4)
                                                                                           + 1701553002) >> 10);
  v158 = ((2 * v157) & 0xDFF67DF2 ^ 0x3235D0) + (v157 ^ 0x6FE26411);
  v159 = -2046820352 * (v154 ^ 0x30D2CC17) - 651705973 - ((201326592 * (v154 ^ 0x30D2CC17)) & 0xB0000000);
  v160 = ((-1755408896 * (v154 ^ 0x8C094183 ^ v153)
         - 1779383186
         - ((784149504 * (v154 ^ 0x8C094183 ^ v153)) & 0x2BE18800)) ^ 0x95F0C46E | ((155955019
                                                                                   * (v154 ^ 0x8C094183 ^ v153)
                                                                                   - ((311910038
                                                                                     * (v154 ^ 0x8C094183 ^ v153)) & 0x5B07612A)
                                                                                   - 1383878507) >> 23)) ^ 0x15B;
  v161 = v160 - 619436126 - ((2 * v160) & 0xB6284F44);
  v162 = (v155 ^ 0x3EDFFE13) + ((2 * v155) & 0x7DBFFFFE ^ 0x3D8) - 171098200 + v158;
  v163 = ((v159 ^ 0xD927C18B | (v156 >> 7)) ^ 0x7F84679E)
       + ((2 * (v159 ^ 0xD927C18B | (v156 >> 7))) & 0xFF53BFEE ^ 0x5330C2)
       + v162
       - 609377943
       + (v161 ^ 0xDB1427A2);
  v164 = (v163 ^ 0x7DFF5ECB)
       + ((2 * v161) ^ 0xB8384445)
       + ((4 * v161) & 0xE3DFE9FC ^ 0x9FAF7777)
       + ((2 * v163) & 0xFBFEBD96)
       + 1;
  v165 = v164 - ((2 * v164 - 404673432) & 0xE2750A72) + 1697323885;
  v166 = v161 ^ 0x478FDD45 ^ (1189195675 * v162
                            - 2 * ((1189195675 * v162 + 348910880) & 0x1C9BFAF7 ^ (1189195675 * v162) & 0x10)
                            - 1318588409);
  v167 = v165 ^ (-1269723209 * v166 - ((1755520878 * v166) & 0xDB9F0526) + 1842315923);
  v168 = 864785899 * (v167 ^ 0x9CF507AA) - 840283761 - ((1729571798 * (v167 ^ 0x9CF507AA)) & 0x9BD4931E);
  LODWORD(STACK[0x24C]) = v168;
  v169 = (v168 ^ 0xCDEA498F) + (v165 ^ 0xF13A8539);
  v170 = v169 - 849233728 - ((2 * v169) & 0x9AC37180);
  LODWORD(STACK[0x250]) = v170;
  v171 = v158 + (v168 ^ 0x3215B670) - ((2 * (v158 + (v168 ^ 0x3215B670)) + 537494032) & 0xAE81C0D8) + 1732616564;
  LODWORD(STACK[0x254]) = v171;
  v172 = v161 ^ v168;
  LODWORD(STACK[0x258]) = v172;
  v173 = (701231104 * (v172 ^ 0x16FE6E2D) - 1719024500 - ((328720384 * (v172 ^ 0x16FE6E2D)) & 0x33138000)) ^ 0x9989C48C | ((984784063 * (v172 ^ 0x16FE6E2D) - ((1969568126 * (v172 ^ 0x16FE6E2D)) & 0xE7116EA8) + 1938339668) >> 20);
  v174 = ((2 * v173) & 0xDBCDEFE ^ 0xE70) + (v173 ^ 0x86DE6847);
  v175 = (81720326 * (v171 ^ 0xD740E06C) + 1081856361 - ((163440652 * (v171 ^ 0xD740E06C)) & 0x80F7A2D0)) ^ 0x407BD169 | ((((81720326 * (v171 ^ 0xD740E06C)) & 0x8647BCA8) + 2106623485 * (v171 ^ 0xD740E06C) + 1021059499) >> 31);
  v176 = ((2 * v175) & 0xEBEFEF1E) + (v175 ^ 0x75F7F78F);
  HIDWORD(v149) = v169;
  LODWORD(v149) = (-1238516047 * (v170 ^ 0xCD61B8C0) + 1403919520 - ((1817935202 * (v170 ^ 0xCD61B8C0)) & 0xA75C3940)) ^ 0x53AE1CA0;
  v177 = v149 >> 1;
  HIDWORD(v149) = v167;
  LODWORD(v149) = (669419103 * (v167 ^ 0x9CF507AA) + 633841948 - ((1338838206 * (v167 ^ 0x9CF507AA)) & 0x4B8F523A) + 1) ^ 0x25C7A91C;
  v178 = v149 >> 1;
  v179 = ((2 * v177) & 0x3F6F33E4) + (v177 ^ 0x1FB799F2);
  v180 = v178 ^ 0xDCB79FCC;
  v181 = (2 * v178) & 0xB96F3F98;
  LOBYTE(v178) = -33 * v176 - ((-66 * v176 - 34) & 0x54) - 71;
  v182 = 911603935 * v176 - ((1823207870 * v176 + 1365484766) & 0x58132C54) - 725915495;
  v183 = 1242395727 * v179 - ((-1810175842 * v179 + 2123869348) & 0xFC811AF2) + 1032610763;
  v184 = v176 + v174 + v180 + v181 + v179 - 266998907;
  v185 = 1303741375 * v184 - ((-1687484546 * v184 - 213927646) & 0x8A78DF24) - 1092858845;
  v186 = 1442373376 * v176 - ((737263104 * v176 + 1671749120) & 0x63890400) - 476647053;
  v187 = 1985368095 * v174 - ((-324231106 * v174 + 1394450238) & 0xF00C83DA) - 1584066164;
  v188 = (-324231106 * v174 - ((1499021436 * v174 + 641416828) & 0x5436A300)) & 0xFFFFFFFE | (v187 >> 31);
  v189 = (((1795653120 * v184 - ((-703661056 * v184 + 2138194944) & 0xDCCE1400) + 773860797) ^ 0xEE670BBD) & 0xFFFFFE00 | (v185 >> 23)) ^ 0x8A;
  v190 = v189 - 1879155029 - 2 * (v189 & 0xFFE5EBB ^ (v185 >> 23) & 0x10);
  v191 = ((v186 ^ 0x31C48273) & 0xFFFFFF00 | HIBYTE(v182)) ^ 0x2C;
  v192 = (((-1171816448 * v179 - ((1951334400 * v179 + 1448214528) & 0x549A0000) + 360056195) ^ 0x2A4D0583) & 0xFFFFF800 | ((-1596504848 * v179 - 2 * ((-1596504848 * v179 + 884827424) & 0x2FE62750 ^ (-1596504848 * v179) & 0x10u) + 614698081) >> 21)) ^ 0x17F;
  v193 = (v192 + 2021473091 - ((2 * v192) & 0xF0FA7686)) ^ 0x787D3B43;
  v194 = (v193 | ~(v183 >> 17) & 0x7800) - 2 * ((v193 & 0x7F727E0A | ~(v183 >> 17) & 0x7800) ^ v193 & 2) - 9273848;
  v195 = (v191 - ((2 * v191) & 0x59CDC160) + 753328304) ^ 0xA318BE1B ^ v190;
  v196 = (((v188 - 46600002) ^ 0xAA1B5180)
        - 1774112566
        - 2 * (((v188 - 46600002) ^ 0xAA1B5180) & 0x164130DF ^ (v188 - 46600002) & 0x15)) ^ 0x964130CA;
  HIDWORD(v149) = v194 ^ 0x506;
  LODWORD(v149) = v194 ^ 0x5A3BA000;
  v197 = (v149 >> 11) - ((2 * (v149 >> 11)) & 0x7C0D206C) + 1040617526;
  v198 = 402784757 * v196 - ((805569514 * v196) & 0x44CFB490) + 577231432;
  v199 = -1261235587 * (v197 ^ 0x5FD2390D) - ((1772496122 * (v197 ^ 0x5FD2390D)) & 0xBC2104B0) + 1578140248;
  v200 = ((2 * (v195 & v196)) & 0xCD36FEF6)
       + (v195 & v196 ^ 0xE69B7F7B)
       + ((((v195 | v196) ^ 0x7FAF4555) + ((2 * (v195 | v196)) & 0xFF5E8AAA) - 2142192980 + (v197 ^ 0xA02DC6F2)) ^ 0xEDB2EBFD)
       + ((2 * (((v195 | v196) ^ 0x7FAF4555) + ((2 * (v195 | v196)) & 0xFF5E8AAA) - 2142192980 + (v197 ^ 0xA02DC6F2))) & 0xDB65D7FA);
  v201 = (-408944640 * (v190 ^ 0x8FFE5EAB) + 406276901 - ((255852544 * (v190 ^ 0x8FFE5EAB)) & 0x30400000)) ^ 0x18374B25 | ((-1877897411 * (v190 ^ 0x8FFE5EAB) - ((539172474 * (v190 ^ 0x8FFE5EAB)) & 0xCE168168) + 1728790708) >> 11);
  v202 = ((2 * v201) & 0x5FFD5F7E ^ 0x194250) + (v201 ^ 0xAFF24ED7);
  v203 = ((((v187 & 0x80000000 ^ 0x85038090) + 1663884475) ^ 0xE8305D4B) & 0x80000000 | (v198 >> 1)) ^ 0x664A17DB;
  v204 = -1499950104 * (v197 ^ 0x5FD2390D) + 960611857 - ((1295067088 * (v197 ^ 0x5FD2390D)) & 0x72838C20);
  v205 = ((-1198657776 * v200 - ((1897651744 * v200 + 660111616) & 0xB35331E0) + 1834342769) ^ 0x59A998F1) & 0xFFFFFFF0 | ((-1953964303 * v200 - 2 * ((-1953964303 * v200 + 557499400) & 0x362E0635 ^ (-1953964303 * v200) & 1) - 1754740164) >> 28);
  v206 = ((2 * v205) & 0xCCB77DC ^ 0x14) + (v205 ^ 0x665BBE5);
  v207 = ((2 * (v204 ^ 0x3941C611 | (v199 >> 29))) & 0xF7ECE96E ^ 4) + ((v204 ^ 0x3941C611 | (v199 >> 29)) ^ 0xFBF674B5);
  v208 = -1838491311 * v202 - ((617984674 * v202 + 884407074) & 0x2CCA747E) + 1354807248;
  v209 = 1698955264 * v202 - ((-897056768 * v202 - 326631424) & 0xC9380000) + 1524849747;
  v210 = (v198 & 0xEEF3F5FE ^ 0x2263D048) + v203 - v202 + v207 - v206 - 332728587;
  v211 = (((1609539571 - (v206 << 29)) ^ 0x9FEF9FF3) & 0xE0000000 | ((-1466637617 * v206
                                                                    - ((1361692062 * v206 + 1551490332) & 0x4BCF29A8u)
                                                                    - 735804574) >> 3)) ^ 0x14BCF29A;
  v212 = v211 + 25463556 - ((2 * v211) & 0x3091608);
  v213 = ((v209 ^ 0x649F5C53) & 0xFFFC0000 | (v208 >> 14)) ^ 0x25994;
  v214 = v213 + 949721533 + (~(2 * v213) | 0x8EC8CC85) + 1;
  v215 = ((1667235840 * v210 - ((-960495616 * v210 + 1300234240) & 0xFEFFFFFF) + 640095235) ^ 0x7F671403 | ((1137132315 * v210 - ((126780982 * v210 + 1545738860) & 0x40DA4006) + 1316891961) >> 11)) ^ 0x40DA4;
  v216 = v215 + 973649963 - ((2 * v215) & 0x74117056);
  v217 = (((-183808064 * v207 - ((-367616128 * v207 - 1534198912) & 0xAEFB5500) - 1446729607) ^ 0xD77DAAB9) & 0xFFFFFFC0 | ((668216639 * v207 - ((262691454 * v207 + 110245870) & 0x34F21838) - 1111349229) >> 26)) ^ 0x26;
  v218 = (v212 ^ 0x1848B04)
       + (((v214 ^ 0x389B99BD) + (v216 ^ 0xC5F747D4) + 1) ^ 0xFA7F7FFF)
       + ((2 * ((v214 ^ 0x389B99BD) + (v216 ^ 0xC5F747D4) + 1)) & 0xF4FEFFFE)
       + 1935126370;
  v219 = (v217 - ((2 * v217) & 0x4798D072) - 1546885063) ^ v214 ^ v212 ^ v216;
  v220 = v219 ^ 0x295FA511 ^ (v218 - ((2 * v218) & 0x1308CF74) - 1987811398);
  v221 = 1569695457 * v220 + 1029317385 - ((991907266 * v220) & 0x7AB44612);
  LODWORD(STACK[0x25C]) = v221;
  LOBYTE(v208) = (v178 & 8 ^ 8) - 106;
  v222 = (v221 ^ 0x3D5A2309)
       + (v216 ^ 0x3A08B82B)
       + 1597803340
       - ((2 * ((v221 ^ 0x3D5A2309) + (v216 ^ 0x3A08B82B))) & 0xBE791698);
  LODWORD(STACK[0x260]) = v222;
  v223 = v212 ^ v221;
  LODWORD(STACK[0x264]) = v212 ^ v221;
  v224 = (v221 ^ 0xC2A5DCF6) + (v219 ^ 0xA0DBC2AB) - 2054195277;
  v225 = v224 - ((2 * ((v221 ^ 0xC2A5DCF6) + (v219 ^ 0xA0DBC2AB) + 1)) & 0xB1EEF34) - 24;
  LODWORD(STACK[0x268]) = v225;
  v226 = ((((v221 ^ 0x3D5A2309u) >> (v208 ^ 0x9E))
         + 1497378123
         - ((2 * ((v221 ^ 0x3D5A2309u) >> (v208 ^ 0x9E))) & 0xB2805A96)) ^ 0x59402D4B) >> (v208 & 8);
  LODWORD(STACK[0x26C]) = v226 - ((2 * v226) & 0x47CACB30) - 1545247336;
  v227 = -601006845 * (v225 ^ 0x858F779A) - ((-1202013690 * (v225 ^ 0x858F779A)) & 0xC744418E) - 475914041;
  v228 = (((v223 ^ v222) & 0x56BDEB38 ^ 0xE9449575) - 1) ^ 0xABAD3422;
  v229 = ((v223 ^ v222) & 0xA94214C7 ^ 0x80020400) - ((2 * (v223 ^ v222)) & 0x40002106) + 579410315;
  v230 = ((v229 & 0x42C98721 ^ 0x44548220) + (v229 ^ 0xA289158B) - ((v229 ^ 0xA289158B) & 0x40418721)) ^ 0x679D8F60 | (-1942885419 - (v228 | 0x8C31EBD5) + (v228 | 0x73CE142A)) ^ 0x7387967C;
  LODWORD(STACK[0x270]) = v230 - ((2 * v230) & 0xC3481484) + 1638140482;
  LODWORD(STACK[0x274]) = LOBYTE(STACK[0x25F]) ^ 0xA89E819C;
  v231 = (-1452751222 * (v223 ^ 0x3CDEA80D) - ((1389464852 * (v223 ^ 0x3CDEA80D)) & 0x7FDA3F6C)) & 0xFFFFFFFE | ((((694732426 * (v223 ^ 0x3CDEA80D)) & 0x460BBF76) - 1421108037 * (v223 ^ 0x3CDEA80Du) + 1559896132) >> 31);
  v232 = ((-1767219200 * (v222 ^ 0x5F3C8B4C) + 1031544694 - ((760528896 * (v222 ^ 0x5F3C8B4C)) & 0x7AF80000)) ^ 0x3D7C1F76 | ((153924947 * (v222 ^ 0x5F3C8B4C) - ((307849894 * (v222 ^ 0x5F3C8B4C)) & 0x2047A2EC) - 1876700810) >> 19)) ^ 0x1204;
  v233 = v232 + 1223043658 - ((2 * v232) & 0x91CC5494);
  v234 = ((2 * (v231 - 1074978890)) & 0xBFFFCBBE ^ 0x3FDA0B2C) + ((v231 - 1074978890) ^ 0xE012FA69);
  v235 = (-872480768 * v220 + 1856774502 - ((-1744961536 * v220) & 0xDD580000)) ^ 0x6EAC2166 | ((1958857727 * v220
                                                                                               - ((-377251842 * v220) & 0xC24A61CE)
                                                                                               + 1629827303) >> 16);
  v236 = ((((v224 << 30) ^ 0x40000000) + 1806711614) & 0xC0000000 | (v227 >> 2)) ^ 0x38E88831;
  v237 = v236 + 1236021607 - 2 * (v236 & 0x49AC316F ^ (v227 >> 2) & 8);
  v238 = (v235 ^ 0x8CF53E9E) - v234 + ((2 * v235) & 0x19EABF76 ^ 0x8243) + 1;
  v239 = v238 - ((2 * v238 + 638913604) & 0x3354F57A) + 1823801567;
  v240 = v233 ^ 0x48E62A4A;
  v241 = 769450227 * (v233 ^ 0x48E62A4A) - ((1538900454 * (v233 ^ 0x48E62A4A)) & 0x645EFE24) - 1305510126;
  v242 = ((1794753344 * (v233 ^ v237 ^ 0x98E06190 ^ v239)
         + 757561439
         - ((1442023040 * (v233 ^ v237 ^ 0x98E06190 ^ v239)) & 0x5A4EF080)) ^ 0x2D27785F | ((632022797
                                                                                           * (v233 ^ v237 ^ 0x98E06190 ^ v239)
                                                                                           - ((1264045594
                                                                                             * (v233 ^ v237 ^ 0x98E06190 ^ v239)) & 0x7B34D53E)
                                                                                           - 1113953633) >> 26)) ^ 0x2F;
  v243 = v242 + 1752608654 - ((2 * v242) & 0xD0ED5F1C);
  v244 = v243 ^ 0x6876AF8E;
  v245 = 573074837 * (v243 ^ 0x6876AF8E) - ((1146149674 * (v243 ^ 0x6876AF8E)) & 0x8FD4CFE6) + 1206544371;
  v246 = ((-1526211840 * v234 - ((1242543616 * v234 + 612529664) & 0x816D3600) - 755509682) ^ 0xC0B69B4E) & 0xFFFFFF00 | ((-1482356773 * v234 - ((256511926 * v234 + 237273718) & 0xD74DF4E) + 1171042530) >> 24);
  v247 = ((2021392384 * (v237 ^ 0x49AC3167) - 532626828 - ((-252182528 * (v237 ^ 0x49AC3167)) & 0xC0800000)) ^ 0xE040C274 | ((946314783 * (v237 ^ 0x49AC3167) - ((1892629566 * (v237 ^ 0x49AC3167)) & 0x7E380574u) - 1088683334) >> 14)) ^ 0x2FC70;
  v248 = v247 + 1161294518 - ((2 * v247) & 0x8A6FE56C);
  v249 = v243 ^ ((v246 ^ 6) - ((2 * v246) & 0xDACD5D42) + 1835445921);
  v250 = 636941865 * (v248 ^ 0x4537F2B6) - ((1273883730 * (v248 ^ 0x4537F2B6)) & 0x97208D14) - 879737206;
  v251 = v245 >> 13;
  v252 = ((1887010816 * v240 + 1864846164 - ((-520945664 * v240) & 0xDE4E0000)) ^ 0x6F274B54 | (v241 >> 17)) ^ 0x5917;
  v253 = v252 + 1651897427 - ((2 * v252) & 0xC4EBE8A6);
  v254 = v253 ^ 0x6275F453;
  v255 = -151639808 * (v248 ^ 0x4537F2B6) + 1335853631 - ((-303279616 * (v248 ^ 0x4537F2B6)) & 0x9F3F0400);
  v256 = -1067541609 * (v253 ^ 0x6275F453) - ((-2135083218 * (v253 ^ 0x6275F453)) & 0xE02D4DA2) - 266950959;
  v257 = 2
       * (((v249 ^ 0x510012F) & (v253 ^ 0x6275F453)) - ((2 * ((v249 ^ 0x510012F) & (v253 ^ 0x6275F453))) & 0x27267DFC))
       - 1490649604;
  v258 = (v253 ^ 0x6765F57C ^ v249) + (v257 ^ 0x58058A13) + 14419985 + ((2 * v257) & 0xFE47EFDC ^ 0x4E44EBD8);
  v259 = (v251 | (1822949376 * v244 + 1027400879 - ((1498415104 * v244) & 0x7A700000)) ^ 0x3D3CE4AF) ^ 0x23F53;
  v260 = v259 - 761515372 - ((2 * v259) & 0xA5386528);
  v261 = -373723136 * v254 - ((326295552 * v254) & 0x28E22000) + 342956855;
  v262 = v248 ^ 0xDD7ECC4A ^ (v258 - ((2 * v258) & 0x30927DF8) - 1740030212);
  v263 = (~(2029154654 * v262) | 0xB746AE1) - 1132906321 * v262 - 96089456;
  v264 = ((v255 ^ 0x4F9F823F | HIBYTE(v250)) ^ 0xCB)
       - 1936928100
       - ((2 * ((v255 ^ 0x4F9F823F | HIBYTE(v250)) ^ 0xCB)) & 0x1919A538);
  v265 = -1358954496 * v262 + 1100837057 - ((1577058304 * v262) & 0x83FFFFFF);
  v266 = v260 ^ 0xD29C3294;
  v267 = (2 * (v251 & 0x200)) ^ 0x400 | v251 & 0x200;
  v268 = ((((793627520 * v254 - ((1587255040 * v254) & 0x8F919500) + 1204341417) & 0xF8000000 ^ 0x40000000) - 2063409959) & 0xF8000000 | (v256 >> 25)) ^ 0x80000078;
  v269 = v267 | 0x27A680E9;
  v270 = (v268 - 1215064813 - 2 * (v268 & 0x30000017 ^ (v256 >> 25) & 4)) ^ 0xB7939513 | (v261 >> 5) ^ 0xA388D9;
  v271 = v270 - ((2 * v270) & 0x15208C96) - 1970256309;
  HIDWORD(v149) = v271 ^ 0x571B895;
  LODWORD(v149) = v271;
  v272 = (v149 >> 27) - ((2 * (v149 >> 27)) & 0x28760546) + 339411619;
  v273 = ((v267 - 512) & (v272 ^ 0xE804D800)) + 255400901 - ((2 * ((v267 - 512) & (v272 ^ 0xE804D800))) & 0x1E72376C);
  v274 = 665224425 - v267;
  if (v273 == 255400901)
    v274 = v269;
  v275 = (v272 ^ 0xE804D972)
       - 665223913
       + v274
       - ((2 * ((v272 ^ 0xE804D972) - 665223913 + v274)) & 0x9924C9CC)
       + 1284662502;
  v276 = ((2 * (v260 & 0xFFFFFDFF ^ 0x699B68D3)) | 0xBDC11E0A) - (v260 & 0xFFFFFDFF ^ 0x699B68D3) - 1591774981;
  v277 = (v276 & 0xD912A82B ^ 0x89102028) + (v276 & 0x26ED57D4 ^ 0x26E45545) - 1;
  v278 = ((2 * (v265 ^ 0x419D70C1 | (v263 >> 8))) & 0xCD6F7B8E ^ 0x1640B84)
       + ((v265 ^ 0x419D70C1 | (v263 >> 8)) ^ 0xE64DF80D);
  v279 = ((2 * ((v275 ^ v277 ^ 0x681C6C8) - v278 - 424165945)) & 0xF547F7FE)
       + (((v275 ^ v277 ^ 0x681C6C8) - v278 - 424165945) ^ 0x7AA3FBFF);
  HIDWORD(v280) = v264 ^ 0x529C;
  LODWORD(v280) = v255 ^ 0x4F9F8000;
  v281 = (v280 >> 15) - ((2 * (v280 >> 15)) & 0x68B8C97E) + 878470335;
  HIDWORD(v280) = v279 + 1025;
  LODWORD(v280) = v279 - 2057567231;
  v282 = ((v280 >> 15) - ((2 * (v280 >> 15)) & 0x9A2F892E) + 1293403287) ^ v281;
  HIDWORD(v280) = v282 ^ 0x1B188;
  LODWORD(v280) = v282 ^ 0x4F0E0000;
  v283 = (-1342730706 * v278 - ((1609505884 * v278 + 2003634300) & 0x58D86DA0) + 673364751) ^ 0xAC6C36D1;
  v284 = ((((-1342730706 * v278 + 2075558974) & 0xD624F7BC) - 1476118295 * v278 + 1460814338) >> 31)
       + 2058020476
       + v283
       - ((2 * v283) & 0xF555CCF8);
  v285 = ((v280 >> 17) - ((2 * (v280 >> 17)) & 0x4C21A9F6) + 638637307) ^ 0x2EC0CFD9;
  v286 = ((1141596832 * v266 + 1966379167 - ((-2011773632 * v266) & 0xEA692100)) ^ 0x7534909F | ((1914723093 * v266
                                                                                                - ((71349802 * v266) & 0x12ACD0AE)
                                                                                                + 156657751) >> 27)) ^ 1;
  v287 = v286 - ((2 * v286) & 0x8B45D4AA) + 1168304725;
  v288 = ((-211812352 * v285 + 702841733 - ((1723858944 * v285) & 0x53C00000)) ^ 0x29E48385 | ((453773211 * v285
                                                                                              - ((907546422 * v285) & 0x7854F918u)
                                                                                              - 1138066292) >> 11)) ^ 0x17854F;
  v289 = v288 - 798284164 - ((2 * v288) & 0xA0D64CF8);
  LODWORD(STACK[0x278]) = v289;
  v290 = (-20222976 * (v264 ^ 0x8C8CD29C) - 254103883 + (~(-40445952 * (v264 ^ 0x8C8CD29C)) | 0x1E4AA7FF) + 1) ^ 0xF0DAAEB5 | ((2147463899 * (v264 ^ 0x8C8CD29C) - ((-39498 * (v264 ^ 0x8C8CD29C)) & 0xE2208B86) + 1896891843) >> 22);
  v291 = ((2 * v290) & 0xBFDE1A4A ^ 0x208) + (v290 ^ 0x5FEF0CE1) + (v287 ^ 0xBA5D15AA);
  v292 = ((v291 - ((2 * v291 + 1075963320) & 0x9CA22448) - 295566080) ^ 0x34FBF458 ^ v284) + (v289 ^ 0xD06B267C);
  v293 = v292 - 450962256 - ((2 * v292) & 0xCA3DB960);
  v294 = (v289 ^ 0x2F94D983) + (v287 ^ 0xC5B84DD6 ^ v284) + 1;
  v295 = (383327023 * (((2 * v294) & 0x7F297FF8) + (v294 ^ 0x3F94BFFC))
        - ((766654046 * (((2 * v294) & 0x7F297FF8) + (v294 ^ 0x3F94BFFC)) + 2108316024) & 0x7CE49E3E)
        + 2101836763) ^ v293;
  v296 = v295 ^ 0xAFF6607;
  LODWORD(STACK[0x27C]) = v295 ^ 0xAFF6607;
  v297 = v293 ^ 0xE51EDCB0;
  v298 = v295 ^ 0xB585355;
  v299 = (v295 ^ 0xB585355) + v297 + 1657600143 - ((2 * ((v295 ^ 0xB585355) + v297)) & 0xC599F11E);
  LODWORD(STACK[0x280]) = v299;
  v300 = (v284 ^ 0x7AAAE67C)
       + (v295 ^ 0xF4A7ACAA)
       - 1072562470
       - ((2 * ((v284 ^ 0x7AAAE67C) + (v295 ^ 0xF4A7ACAA) + 1)) & 0x8023FDB2);
  LODWORD(STACK[0x284]) = v300;
  v301 = v296 ^ v289;
  LODWORD(STACK[0x288]) = v301;
  v302 = v299 ^ 0x62CCF88F;
  v303 = 2140198595 * (v299 ^ 0x62CCF88F) - ((2132913542 * (v299 ^ 0x62CCF88F)) & 0x77EE4DDA) - 1141430547;
  v304 = v300 ^ 0xC011FED9;
  v305 = -469914611 * (v300 ^ 0xC011FED9) - ((-939829222 * (v300 ^ 0xC011FED9)) & 0xECAED5BA) - 162043171;
  v301 ^= 0xD1CC132E;
  v306 = -800319901 * v301 - ((-1600639802 * v301) & 0x800EAED2) + 1074222953;
  v307 = (136439790 * v298 - ((272879580 * v298) & 0xE96039E4)) & 0xFFFFFFFE | ((((136439790 * v298) & 0x860C8E14)
                                                                               - 68219895 * v298
                                                                               + 1022998773) >> 31);
  v308 = 436207616 * v304 + 788648438 - ((872415232 * v304) & 0x5C000000);
  v309 = (v307 + 1957698802) ^ 0x1D4EF167;
  v310 = (2 * (v307 + 1957698802)) & 0xD3FDDB2A ^ 0xC1601920;
  v311 = ((2 * (v308 ^ 0x2F01D1F6 | (v305 >> 7))) & 0xFB2FB3EC ^ 0x30911A8)
       + ((v308 ^ 0x2F01D1F6 | (v305 >> 7)) ^ 0x7C7B7723);
  v312 = (v303 >> 20) ^ 0xBBF;
  v313 = v312 | (225193984 * v302 - 196636619 + (~(450387968 * v302) | 0x1770DFFF) + 1) ^ 0xF4479035;
  v314 = v313 + 572725161 - 2 * (v313 & 0x222317B9 ^ v312 & 0x10);
  v315 = -2107591912 * v301 - 1247330638 - ((79783472 * v301) & 0x6B4E7D60);
  v316 = 2 * v311 + 80759828;
  v317 = v316 ^ 0xC4C12083;
  v318 = (2 * v316) & 0x767DBEF8;
  v319 = v314 ^ 0x222317A9;
  v320 = -1713889809 * (v314 ^ 0x222317A9) - ((867187678 * (v314 ^ 0x222317A9)) & 0x8C81C748) + 1178657700;
  v321 = v311 + v317 - v318 + v309 + v310 + 1996321424;
  v322 = ((v315 ^ 0xB5A73EB2 | (v306 >> 29)) ^ 2)
       - 1730614271
       - 2 * ((v315 ^ 0xB5A73EB2 | (v306 >> 29)) & 0x18D8EC19 ^ (v315 ^ 0xB5A73EB2) & 0x18);
  v323 = -959019311 * v311 - ((229445026 * v311 + 110662740) & 0x78718402) - 1081799637;
  v324 = -1391615488 * v311 - ((1511736320 * v311 + 824748032) & 0xF3030800) - 1844061952;
  v325 = v314 ^ v322 ^ 0x8C29D9DF ^ (v321 - ((2 * v321 + 961891012) & 0x6DA444EE) + 326944729);
  v322 ^= 0x98D8EC01;
  v326 = 239392709 * v322 - ((478785418 * v322) & 0x77CD79AA) - 1142506283;
  v327 = (-1404165120 * v325 + 643455634 - ((1486637056 * v325) & 0x4CB4B000)) ^ 0x265A5A92 | ((-500493431 * v325
                                                                                              - ((-1000986862 * v325) & 0xEC407438)
                                                                                              - 165660132) >> 22);
  v328 = ((2 * v327) & 0xFF7BBDFE ^ 0x5B0) + (v327 ^ 0x7FBDDD27);
  v329 = (v324 ^ 0xF9818500) & 0xFFFFFE00 | (v323 >> 23);
  v330 = 1810006016 * v322 + 1898326002 - ((-674955264 * v322) & 0xE24C0000);
  v331 = -1583710767 * v328 - ((53803938 * v328 + 929619362) & 0x222CE318) - 1932861347;
  v332 = -1652433168 * v319 - 502337679 - ((990100960 * v319) & 0xC41DDEE0);
  v333 = ((2 * (v330 ^ 0x712627F2 | (v326 >> 17))) & 0xFFC9BFFE ^ 0xBBE6)
       + ((v330 ^ 0x712627F2 | (v326 >> 17)) ^ 0x7FE4820C);
  v334 = ((2 * (v332 ^ 0xE20EEF71 | (v320 >> 28))) & 0x7B78FF52) + ((v332 ^ 0xE20EEF71 | (v320 >> 28)) ^ 0x3DBC7FAD);
  v335 = ((2 * v329) & 0x37DFF97E ^ 0x70) + (v329 ^ 0x1BEFFCC7) + v334 + v333 + v328;
  v336 = -990074529 * v334 - ((167334590 * v334 + 819207826) & 0x7B966BA4) - 701151973;
  v337 = 1337597952 * v328 - ((-1619771392 * v328 + 464797696) & 0xA5964000) - 526039024;
  v338 = ((2 * (v337 ^ 0x52CB2810 | (v331 >> 19))) & 0x3FFFDCFE ^ 0x444)
       + ((v337 ^ 0x52CB2810 | (v331 >> 19)) ^ 0x1FFFEC5D);
  v339 = (~(368050176 * v334 + 1955594240) | 0x91BFFFFF) + 1257766912 * v334 + 829117541;
  v340 = ((((1879048192 * v333 + 1879048192) & 0x80000000) + 939524096 * v333 + 2128051903) ^ 0x46D77EBF) & 0xF8000000 | ((-1424635961 * v333 - ((1445695374 * v333 + 1813467022) & 0x7A6ECA4A) + 860032236) >> 5);
  v341 = ((2 * v340) & 0xF7B6F41E ^ 0x3927412) + (v340 ^ 0xFA32C126);
  v342 = (-1528704193 * (v335 + 652790340) - ((1237558910 * (v335 + 652790340) - 968689068) & 0xFD7162C8) + 1641688718) >> 3;
  v343 = v341 - v338;
  v344 = -754239251 * v338 - ((-1508478502 * v338 - 287385382) & 0x819F0F90) - 1203833803;
  v345 = (((v335 << 30) - ((v335 + 652790340) << 29) + 762776644) ^ 0x6D770C44) & 0xE0000000 | v342;
  v346 = ((2 * v345) & 0x3E97FBF6 ^ 0x3E862850) + (v345 ^ 0x809CEBD7);
  v347 = v343 + v346 - ((2 * (v343 + v346) + 162589930) & 0x4A723DD0) - 1441688227;
  v348 = ((v336 >> 13) ^ 0x1EE59 | v339 ^ 0xB7235464)
       + 54666755
       - 2 * (((v336 >> 13) ^ 0x1EE59 | v339 ^ 0xB7235464) & 0x3422617 ^ ((v336 >> 13) ^ 0x1EE59) & 0x14);
  v349 = (((497025024 * v338 - ((994050048 * v338 + 457179136) & 0x96400000) + 1489197692) ^ 0xCB235A7C) & 0xFFE00000 | (v344 >> 11)) ^ 0x819F0;
  v350 = v349 + 342978841 - 2 * (v349 & 0x1471711D ^ (v344 >> 11) & 4);
  HIDWORD(v280) = v342;
  LODWORD(v280) = (1129482055 * v346 - ((-2036003186 * v346 + 1731093702) & 0xDB9A02FE) + 560215010) ^ 0x6DCD017E;
  v351 = (v280 >> 1) + 1255407796 - ((2 * (v280 >> 1)) & 0x95A80168);
  v352 = (v351 ^ 0x4AD400B4) - 703786175;
  v353 = v352 ^ 0x5CDCFFF8;
  v354 = (2 * v352) & 0xB9B9FFF0;
  v355 = ((-353370112 * (v348 ^ 0x267B38EB ^ v347) - 234637393 - ((-706740224 * (v348 ^ 0x267B38EB ^ v347)) & 0xE4000000)) ^ 0xF203B7AF | (((~(1277278 * (v348 ^ 0x267B38EB ^ v347)) | 0xFE98450D) - 2146845009 * (v348 ^ 0x267B38EB ^ v347) - 2135696006) >> 12)) ^ 0x80B3D;
  v356 = v355 - 1543764114 - ((2 * v355) & 0x47F80EDC);
  v357 = ((83886080 * (v348 ^ 0x3422603) + 1086522601 + ((5 * (v348 ^ 0x3422603)) >> 6 << 31)) ^ 0x40C304E9 | ((1847516677 * (v348 ^ 0x3422603) - ((1547549706 * (v348 ^ 0x3422603)) & 0x4EC4F90C) + 660765830) >> 8)) ^ 0x27627C;
  v358 = ((v357 - ((2 * v357) & 0x38520846) - 1675033565) ^ 0x8858753A ^ v350)
       + (((v356 ^ 0xA3FC076E) + (v351 ^ 0x4AD400B4)) ^ 0xC2002083)
       - ((2 * ((v356 ^ 0xA3FC076E) + (v351 ^ 0x4AD400B4))) & 0x7BFFBEF8)
       + 1040179069;
  v359 = ((2 * v358) & 0xEB23F8DC) + (v358 ^ 0xF591FC6E);
  v360 = (v356 ^ ((v350 ^ 0x14717119)
                + v353
                + v354
                - 1557987320
                - ((2 * ((v350 ^ 0x14717119) + v353 + v354 - 1557987320)) & 0x91EFBA98)
                - 923280052) ^ 0x6B0BDA22)
       - 174982034
       - v359;
  v361 = ((2 * v360) & 0x78F3F3FE)
       + (v360 ^ 0x3C79F9FF)
       - ((2 * (((2 * v360) & 0x78F3F3FE) + (v360 ^ 0x3C79F9FF)) - 684551160) & 0xDCFF4542)
       - 635900763;
  LODWORD(STACK[0x28C]) = v361;
  v362 = v361 ^ v356;
  LODWORD(STACK[0x290]) = v361 ^ v356;
  LODWORD(STACK[0x294]) = v361 ^ 0x21D55239;
  v363 = v361 ^ 0x21D55239 ^ v351;
  LODWORD(STACK[0x298]) = v363;
  v364 = v359 + (v361 ^ 0x8B4AAC8A) - ((2 * (v359 + (v361 ^ 0x8B4AAC8A)) + 349964070) & 0xD5D63E9E) - 178707742;
  LODWORD(STACK[0x29C]) = v364;
  v365 = v356 ^ v351;
  LODWORD(STACK[0x2A0]) = LOBYTE(STACK[0x28F]);
  v366 = v364 ^ 0xEAEB1F4F;
  v367 = -891995541 * (v364 ^ 0xEAEB1F4F) - ((363492566 * (v364 ^ 0xEAEB1F4F)) & 0x59DC5540) - 1393677664;
  HIDWORD(v280) = v364 ^ 0x2EB1F4F;
  LODWORD(v280) = v364 ^ 0xE8000000;
  v368 = (v280 >> 27) - ((2 * (v280 >> 27)) & 0xD0147D44) - 401981790;
  HIDWORD(v280) = v365 ^ 0x12807DA;
  LODWORD(v280) = v365 ^ 0xE8000000;
  v369 = ((v280 >> 27) - ((2 * (v280 >> 27)) & 0xD909C0E6) + 1820647539) ^ v368;
  HIDWORD(v280) = v369 ^ 0x12;
  LODWORD(v280) = v369 ^ 0x7E9107E0;
  LODWORD(STACK[0x2A4]) = (v280 >> 5) - ((2 * (v280 >> 5)) & 0x78906D50) + 1011365544;
  v370 = 1476395008 * v366 + 1313652044 - ((-1342177280 * v366) & 0x90000000);
  v361 ^= 0x74B55375u;
  v363 ^= 0x1FB401F8u;
  LODWORD(STACK[0x2A8]) = v363;
  v371 = ((2 * (v370 ^ 0x4E4CBD4C | (v367 >> 5))) & 0xA0BA7FFE ^ 0x8A62AA)
       + ((v370 ^ 0x4E4CBD4C | (v367 >> 5)) ^ 0xD53A4EAA);
  v372 = ((1420828672 * v363 - 1013290907 - ((-1453309952 * v363) & 0x8734C000)) ^ 0xC39A6865 | ((416982401 * v363
                                                                                                - ((833964802 * v363) & 0x87382586)
                                                                                                - 1013181757) >> 19)) ^ 0x1873;
  v373 = v372 - 1634423351 - ((2 * v372) & 0x3D295B92);
  v374 = (-483421280 * v361 - 1776021156 + (~(106899264 * v361) | 0xD3B7DD7F) + 1) ^ 0x9624115C;
  v375 = ((-1625719651 * v361 - ((1043527994 * v361) & 0xCC436F3E) - 433997921) >> 27) ^ 0x1C;
  v376 = (v375 | v374) - 1015100906 - 2 * ((v375 | v374) & 0x437ECA1F ^ v375 & 9);
  v377 = (-2107637760 * (v362 ^ 0xD749541B) + 1422719264 - ((79691776 * (v362 ^ 0xD749541B)) & 0xA9800000)) ^ 0x54CCF920 | ((1970973715 * (v362 ^ 0xD749541B) - ((720721958 * (v362 ^ 0xD749541B)) & 0x2C5F97F0) + 372231160) >> 11);
  v378 = ((2 * v377) & 0xCFDD6DFE ^ 0x509F2) + (v377 ^ 0x67EC7306);
  v379 = v373 ^ 0x9E94ADC9;
  v380 = -1054358235 * (v373 ^ 0x9E94ADC9) - ((-2108716470 * (v373 ^ 0x9E94ADC9)) & 0xC126200C) - 527233018;
  v381 = (v376 ^ 0x5DEA67DF ^ v373) - v378 - v371 + 944502526;
  v382 = 1240549696 * v379 - 1231780792 - ((333615744 * v379) & 0x6D290880);
  v383 = ((-52959136 * v378 - ((28299456 * v378 + 16158912) & 0x42A13C0) - 24096169) ^ 0x21509F7) & 0xFFFFFFE0 | ((-806961341 * v378 - ((533560966 * v378 + 801617030) & 0x3E953CB8) - 1221691233) >> 27);
  v384 = ((2 * v383) & 0xAFF57FFC ^ 0x24) + (v383 ^ 0xD7FABFED);
  v385 = ((1848891000 * (((2 * v381) & 0xDD5FFFBE) + (v381 ^ 0x6EAFFFDF))
         - ((-597185296 * (((2 * v381) & 0xDD5FFFBE) + (v381 ^ 0x6EAFFFDF)) + 1683835632) & 0xCB693640)
         + 400769183) ^ 0xE5B49B27) & 0xFFFFFFF8 | ((((-1685260898 * (((2 * v381) & 0xDD5FFFBE) + (v381 ^ 0x6EAFFFDF))
                                                     + 1284221278) & 0xF9520ED4)
                                                   + 842630449 * (((2 * v381) & 0xDD5FFFBE) + (v381 ^ 0x6EAFFFDF))
                                                   - 586079258) >> 29);
  v386 = ((2 * v385) & 0xBFDF17FE) + (v385 ^ 0xDFEF8BFF);
  v387 = v382 ^ 0xB6948448 | (v380 >> 26);
  v388 = v387 ^ 0xFBED3BFF;
  v389 = (2 * v387) & 0xF7DA778E;
  v390 = ((-280210354 * v371 - ((-560420708 * v371 - 1278891876) & 0x91DAB5F8) - 1563414709) ^ 0xC8ED5AFD) & 0xFFFFFFFE | ((((793531470 * v371 + 434295886) & 0x23806E86) + 140105177 * v371 + 21913237) >> 31);
  v391 = ((2 * v390) & 0xFBF75DDA) + (v390 ^ 0x7DFBAEED);
  v392 = -1339890971 * v384 - ((1615185354 * v384 - 1628435564) & 0xF9B0F00C) + 1280343504;
  v393 = v388 + v384 + v389 - v391 - v386 - 1652232897;
  v394 = -452984832 * v384 - ((1241513984 * v384 + 335544320) & 0x5E000000) - 109289559;
  v395 = -61479435 * v393 - ((-122958870 * v393 - 866003440) & 0xE40979C4) - 667572246;
  v396 = -1747714048 * v393 - ((799539200 * v393 + 1480589312) & 0xBCD80000) + 177026494;
  v397 = 977450077 * v391 - ((1954900154 * v391 - 219045938) & 0xF8B98CE0) + 1976931927;
  v398 = -1952448512 * v391 - ((390070272 * v391 + 968884224) & 0x2FC00000) - 1797853051;
  v399 = (((v396 ^ 0x5E6D35BE) & 0xFFFC0000 | (v395 >> 14)) ^ 0x3C812)
       + 190901698
       - ((2 * (((v396 ^ 0x5E6D35BE) & 0xFFFC0000 | (v395 >> 14)) ^ 0x3C812)) & 0x16C1DB84);
  v400 = ((2 * ((v394 ^ 0x2F7C5FA9) & 0xFF000000 | (v392 >> 8))) & 0x6BFEDB3A ^ 0x1F89030)
       + (((v394 ^ 0x2F7C5FA9) & 0xFF000000 | (v392 >> 8)) ^ 0xB503B5E5);
  v401 = ((181104526 * v386 - ((362209052 * v386 + 1685032732) & 0x6F0E99E4) - 1447095167) ^ 0xB7874CF3) & 0xFFFFFFFE | ((((181104526 * v386 + 842516366) & 0x3E88CE78) + 2056931385 * v386 + 1738519804) >> 31);
  v402 = ((2 * v401) & 0x7E64F9BE) + (v401 ^ 0x3F327CDF);
  v403 = v400 + v402 - ((2 * (v400 + v402) + 362556168) & 0x5967275C) + 931244338;
  v404 = ((v398 ^ 0x97F6F085) & 0xFFE00000 | (v397 >> 11)) ^ 0x1F8B98;
  v405 = v404 - 1168966722 - ((2 * v404) & 0x74A5F77C);
  v406 = (((250216448 * v402 - ((500432896 * v402 + 1414791168) & 0xF4080000) + 607036050) ^ 0x7A04A292) & 0xFFFE0000 | ((-1465546891 * v402 - ((290131690 * v402 + 347122218) & 0x26114F22u) + 1029766310) >> 15)) ^ 0x12611;
  v407 = v406 - ((2 * v406) & 0x85D8D818) + 1122790412;
  v408 = ((869793792 * (v399 ^ 0xB60EDC2) - 382634484 - ((1739587584 * (v399 ^ 0xB60EDC2)) & 0xD2600000)) ^ 0xE931760C | ((-442128773 * (v399 ^ 0xB60EDC2) - ((1263226102 * (v399 ^ 0xB60EDC2)) & 0x445FFFDE) - 1573912593) >> 13)) ^ 0x5117F;
  v409 = v408 - 267125220 - ((2 * v408) & 0xE027FC38);
  v410 = ((625550208 * (v405 ^ v399 ^ 0x9D8185D2 ^ v403)
         - 1200478518
         - ((1251100416 * (v405 ^ v399 ^ 0x9D8185D2 ^ v403)) & 0x70E44D00)) ^ 0xB87226CA | ((2051707463
                                                                                           * (v405 ^ v399 ^ 0x9D8185D2 ^ v403)
                                                                                           - ((1955931278
                                                                                             * (v405 ^ v399 ^ 0x9D8185D2 ^ v403)) & 0x52BEFB6C)
                                                                                           + 694123958) >> 25)) ^ 0x14;
  v411 = v410 + 2059362674 - ((2 * v410) & 0xF57EC2E4);
  v412 = ((2105540608 * (v405 ^ 0xBA52FBBE) + 1751025270 - ((-83886080 * (v405 ^ 0xBA52FBBE)) & 0xD0000000)) ^ 0x685E8676 | ((1352423675 * (v405 ^ 0xBA52FBBE) - ((-1590119946 * (v405 ^ 0xBA52FBBE)) & 0xF87CDCD8) + 2084466284) >> 9)) ^ 0x3E1F37;
  v413 = v412 - ((2 * v412) & 0x203F1CCA) - 1876980123;
  v414 = v411 ^ 0x7ABF6172;
  v415 = ((2 * ((v411 ^ 0x7ABF6172) + (v409 ^ v407 ^ 0xB2FF9210))) & 0xDBBCFDAE)
       + (((v411 ^ 0x7ABF6172) + (v409 ^ v407 ^ 0xB2FF9210)) ^ 0xEDDE7ED7);
  v416 = v409 ^ v407 ^ v413 ^ v411;
  v417 = (v415 - ((2 * v415 + 1928423022) & 0x763A9F08) + 1955988155) ^ v416;
  v418 = (2 * v417) ^ 0x69698BFD;
  v419 = (4 * v417) & 0xEDB77F54 ^ 0x3F6CE8AF;
  v420 = v417 ^ 0xB026E5D4;
  v417 ^= 0x63423283u;
  v421 = ((v420 + v417) ^ 0xFF767F7E) + v418 + v419 + ((2 * (v420 + v417)) & 0xFEECFEFC) + 1;
  v422 = ((v417 + 75806284) ^ 0xFF7E7BAF)
       + ((2 * (v417 + 75806284)) & 0xFEFCF75E)
       + 8488017
       + ((v421 - ((2 * v421 - 288718758) & 0xF5F0164A) + 1918716754) ^ 0x8507F4DB);
  v423 = v422 + 2069300191 - ((2 * v422) & 0xF6AE07BE);
  LODWORD(STACK[0x2AC]) = v416;
  LODWORD(STACK[0x2B0]) = v423;
  LODWORD(STACK[0x2B4]) = v423 ^ v416;
  LODWORD(STACK[0x2B8]) = (v423 ^ 0x7B5703DF) + v414 - ((2 * ((v423 ^ 0x7B5703DF) + v414)) & 0x9D4BB6F0) + 1319492472;
  LODWORD(STACK[0x2BC]) = (v423 ^ 0x7B5703DF)
                        + (v409 ^ 0xF013FE1C)
                        - ((2 * ((v423 ^ 0x7B5703DF) + (v409 ^ 0xF013FE1C))) & 0x6EEFE5DC)
                        + 930607854;
  v424 = malloc(0x404uLL);
  v35[54] = v424;
  *v35 = 0;
  v35[1] = 0;
  v35[2] = 0;
  v35[3] = 0;
  v35[5] = 0;
  v35[6] = 0;
  v35[7] = 0;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v36 + 8 * ((237 * (v424 == 0)) ^ v34)) - 12))(v424, v425, v426, v427, v428, v429, v430, v431, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           (v34 + 623),
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           v433,
           a32);
}

uint64_t sub_22D221B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int a66;
  uint64_t v66;
  uint64_t v67;
  unsigned int v68;
  int v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  int v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  int v81;
  unsigned int v82;
  int v83;
  int v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  int v89;
  int v90;
  int v91;
  unsigned int v92;
  unsigned int v93;
  uint64_t v94;

  v68 = LODWORD(STACK[0x24C]) ^ LODWORD(STACK[0x250]) ^ LODWORD(STACK[0x254]) ^ 0xD7CB1123;
  v69 = v68 + ((a19 - 139) ^ 0xE149A55D);
  v70 = (STACK[0x258] & 1 | (2 * (STACK[0x258] & 1)) | 0xDFB75FF4) ^ 2;
  v71 = ((v70 + 541630475) & v68) + 207142084 - ((2 * ((v70 + 541630475) & v68)) & 0x18B1797A);
  v72 = v70 + 1056898031;
  v73 = -26362919 - v70;
  if (v71 == 207142084)
    v74 = v72;
  else
    v74 = v73;
  v75 = v69 + v74 - ((2 * (v69 + v74)) & 0x84331FF4) - 1038512134;
  v76 = (((STACK[0x258] & 0xFFFFFFFE ^ 0xACAA780A)
        + (STACK[0x258] & 0x71D442C2 ^ 0x515402C1)
        - ((STACK[0x258] & 0xFFFFFFFE ^ 0xACAA780A) & 0x71D442C2)) ^ 0x106CB058)
      - 1;
  v77 = LODWORD(STACK[0x2B4]) ^ LODWORD(STACK[0x22C]);
  v78 = (v77 & 0xFFFFFFEF ^ 0x7A2C0ECD)
      + (v77 & 0x5505508F ^ 0x5015012)
      - ((v77 & 0xFFFFFFEF ^ 0x7A2C0ECD) & 0x5505508F);
  v79 = (v77 & 0x10 ^ 0xEEBEFF7E) + 2 * (v77 & 0x10);
  v80 = (1731600069 - v79 - ((1496677032 - 2 * v79) & 0x713642E0)) ^ ((v78 & 0x10F9A313 ^ 0x10F9A310)
                                                                    + (v78 ^ 0x804482F)
                                                                    - ((v78 ^ 0x804482F) & 0x10F9A313)) ^ 0xA6A4230;
  v81 = ((v80 - ((2 * v80 + 179289350) & 0xE4B2C5E) - 1535281998) ^ 0x8725962F) + a66;
  v82 = (((((2 * v81) & 0xAE379EBC) + (v81 ^ 0xD71BCF5E)) & 0xFFFFFFFE)
       - ((2 * (((2 * v81) & 0xAE379EBC) + (v81 ^ 0xD71BCF5E)) + 1372086596) & 0xE39C1DF8)
       + 447889310) ^ 0x104515C1;
  LODWORD(STACK[0x2C8]) = v82;
  v83 = STACK[0x2A0];
  v84 = LODWORD(STACK[0x2A0]) ^ 0x74;
  LODWORD(STACK[0x2CC]) = v84;
  LODWORD(STACK[0x2D0]) = v84 + 1;
  v85 = v75 ^ v76;
  LODWORD(STACK[0x2D4]) = v85;
  LODWORD(a21) = 113 * ((a19 - 139) ^ 0x14A);
  v86 = (a21 + 1508452369);
  v87 = v85 ^ LODWORD(STACK[0x278]) ^ LODWORD(STACK[0x280]) ^ LODWORD(STACK[0x284]) ^ LODWORD(STACK[0x2AC]) ^ LODWORD(STACK[0x2BC]) ^ LODWORD(STACK[0x2B8]) ^ 0x6D9E997Bu;
  v88 = -308241933 * v82 - 1360921796 - ((-616483866 * v82) & 0x5DC3F678);
  v89 = (v88 ^ ((v88 ^ 0x511E04C3) - ((2 * (v88 ^ 0x511E04C3) + 2) & 0x1357351C) - 1985242481) ^ 0xBBEF7C4 ^ ((v83 ^ 0x511E04B7 ^ v88) + v84 + 1 - (v86 & (2 * ((v83 ^ 0x511E04B7 ^ v88) + v84 + 1))) + 754226806))
      + v84;
  v90 = (v89 ^ 0x7B) + ((2 * v89) & 0xF6) + 133;
  v91 = LODWORD(STACK[0x274]) ^ LODWORD(STACK[0x238]) ^ (v90 - ((2 * v90) & 0x1E4) - 1350356750);
  v92 = (v91 ^ 0xDFADCA38)
      + (((v91 ^ 0x266E200D) + 1) ^ 0x7E8FBF0B)
      + ((2 * ((v91 ^ 0x266E200D) + 1)) & 0xFD1F7E16)
      - 2123349771;
  v93 = (v92 ^ 0x6AE7F6AA) + dword_22D24C020[v91 ^ 0xD991DF61] + ((2 * v92) & 0xD5CFED54);
  v94 = (-13 * v82 + 60 - ((-26 * v82) & 0x78)) ^ 0x3Cu;
  *(_DWORD *)(*(_QWORD *)(v66 + 432) + 4 * v94) = v87 ^ (v93
                                                                       - ((2 * v93 + 1055414470) & 0x478AC85E)
                                                                       + 1127846034);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v67 + 8 * (int)((a19 - 139) ^ 0x8D)))(v86, v94, 3587173716, 3650215777, (a19 - 139), v87, 1055414470, 1200277598, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30);
}

void sub_22D222004()
{
  JUMPOUT(0x22D221E94);
}

uint64_t sub_22D222010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  int v39;
  _QWORD *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  LODWORD(a39) = v39;
  v42 = malloc(0x408uLL);
  v40[57] = v42;
  *v40 = 0;
  v40[1] = 0;
  v40[2] = 0;
  v40[3] = 0;
  v40[5] = 0;
  v40[6] = 0;
  v40[7] = 0;
  return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 8 * (int)(((v42 == 0) * (a21 - 242 + ((a21 - 451) | 0x44) - 1855)) ^ a21)))(v42, v43, v44, v45, v46, v47, v48, v49, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39);
}

uint64_t sub_22D222070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int a64;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  uint64_t v77;
  unsigned int v78;
  __int16 v79;
  __int16 v80;
  int v81;
  int v82;
  unsigned int v83;
  uint64_t v84;
  int v85;
  int v86;
  unsigned int v87;
  int v88;
  unsigned int v89;
  unsigned int v90;
  uint64_t (*v91)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v67 = ((a64 ^ LODWORD(STACK[0x2B4]) ^ 0x3560709D)
       - 2087392903
       - ((2 * (a64 ^ LODWORD(STACK[0x2B4]) ^ 0x3560709D) + 324663822) & 0x33CFD8E4)) ^ 0x4A2B622C;
  v68 = LODWORD(STACK[0x210]) ^ 0x71903FF3;
  LODWORD(STACK[0x2E4]) = v68;
  v69 = ((v67 - 2087392903 - ((2 * v67 + 324663822) & 0x33CFD8E4)) ^ 0x19E7EC72) + v68;
  v70 = (v69 ^ 0x7DFE7BBF) - 2113829823 + ((2 * v69) & 0xFBFCF77E);
  v71 = ((v70 & 0xFFFFFFFE) + 503132670 + (~(2 * v70) | 0xC4059C07)) ^ 0x5EAAF97A;
  LODWORD(STACK[0x2E8]) = v71;
  LODWORD(a21) = LODWORD(STACK[0x294]) ^ LODWORD(STACK[0x25C]);
  LODWORD(STACK[0x2EC]) = a21;
  v72 = STACK[0x244];
  v73 = LODWORD(STACK[0x244]) + 1;
  LODWORD(STACK[0x2F0]) = v73;
  v74 = STACK[0x298];
  v75 = (v74 & 0x5BB449C ^ 0x37477265) + ((2 * v74) & 0x1668138 ^ 0x1600130) + 1;
  LODWORD(STACK[0x2F4]) = v75;
  v76 = -1654823179 * v71;
  LODWORD(a19) = (v64 - 38429536) & 0x24A63F7;
  v77 = LODWORD(STACK[0x234]) ^ 0x3458F7FAu;
  v78 = v76 - ((v76 << (a19 ^ 0xF5)) & 0xDAA13FF8) - 313483268;
  v79 = (v78 ^ a21 ^ ((LOWORD(STACK[0x234]) ^ 0xF7FA ^ v78 ^ a21)
                    + v73
                    - ((2 * ((LOWORD(STACK[0x234]) ^ 0xF7FA ^ v78 ^ a21) + v73)) & 0xE45E)
                    + 29231) ^ ((v78 ^ a21 ^ 0x4246) - ((2 * (v78 ^ a21 ^ 0x4246) + 2) & 0x5A08) + 11525) ^ 0xE292)
      + v72;
  v80 = (v79 ^ 0xFA7F) + ((2 * v79) & 0xF4FE) + 129;
  v81 = v80;
  v80 *= 2;
  v82 = dword_22D247030[(v81 + 1074036543 - (v80 & 0xEC) + 55) ^ 0x40047F3F];
  v83 = ((2 * ((v82 ^ v74) & 0xFA44BB63 ^ 0xE8042302)) & 0x700860C6)
      - ((v82 ^ v74) & 0xFA44BB63 ^ 0xE8042302)
      + 1122160524;
  v84 = (v83 & 0xEA072804 ^ 0xAA072804) + (v83 ^ 0x40680709) - ((v83 ^ 0x40680709) & 0xEA072804);
  v85 = ((2 * v82) & 0x3668928 ^ 0x1228800) + (v82 & 0x5BB449C ^ 0x7162BAF5);
  v86 = ((v81 + 923964427 - (v80 & 0x156) + 160) ^ 0x3712940B) - 925465726;
  v87 = ((2 * v86) & 0xFE9F7FDE) + (v86 ^ 0xFF4FBFEF);
  v88 = 2 * (((v85 - 1911815925) & STACK[0x2A8]) - ((2 * ((v85 - 1911815925) & STACK[0x2A8])) & 0x148619D0)) + 344332754;
  v89 = v85 + v75 + (v88 ^ 0x16870AC3) + ((2 * v88) & 0xFBFDD9DC ^ 0xD6F3EE7B);
  v90 = v89
      + v87
      + ((2 * (((v87 + 11550737) & (v89 + 1494448893)) - ((2 * ((v87 + 11550737) & (v89 + 1494448893))) & 0x774776CC))
        + 2001172172) ^ 0x674045BF)
      + ((2
        * (2 * (((v87 + 11550737) & (v89 + 1494448893)) - ((2 * ((v87 + 11550737) & (v89 + 1494448893))) & 0x774776CC))
         + 2001172172)) & 0xDFF19918 ^ 0x317F76E7)
      + 1;
  *(_DWORD *)(*(_QWORD *)(v65 + 456) + 4
                                     * ((v76 - (((_BYTE)v76 << (a19 ^ 0xF5)) & 0xF8) - 4) ^ 0xFCu)) = LODWORD(STACK[0x264]) ^ LODWORD(STACK[0x240]) ^ v84 ^ 0xEA84C0EC ^ (v90 - ((2 * v90 - 1820782794) & 0xA7EAEEF8) - 1649279209);
  v91 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 + 8 * (int)v64) - 4);
  return v91(v91, v64, 3934568684, 2001172172, v84, v77, 424992914, 11550737, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31);
}

void sub_22D222528()
{
  JUMPOUT(0x22D222230);
}

uint64_t sub_22D222530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  _QWORD *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  HIDWORD(a39) = a7;
  v41 = malloc(0x404uLL);
  v39[61] = v41;
  *v39 = v39[57];
  v39[1] = 0;
  v39[2] = 0;
  v39[3] = 0;
  v39[5] = 0;
  v39[6] = 0;
  v39[7] = 0;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 + 8 * (((v41 != 0) * (a19 ^ 0x42F)) ^ a19)) - (((_DWORD)a19 + 425674741) & 0x6A0B7FF) + 997))(v41, v42, v43, v44, v45, v46, v47, v48, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39);
}

uint64_t sub_22D2225A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int a64;
  int a67;
  int v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  int v71;
  unsigned int v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  uint64_t v80;
  unsigned int v81;
  unsigned int v82;
  int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  int v87;
  unsigned int v88;
  unsigned int v89;

  v70 = ((v67 ^ 0x82) - 850) | 0x301;
  v71 = LODWORD(STACK[0x2B0]) ^ a67;
  LODWORD(STACK[0x304]) = v71;
  v72 = ((((2 * v71) ^ 0x5AFE7C2) - 2 * (((2 * v71) ^ 0x5AFE7C2) & (v70 ^ 0x46EB6B9F) ^ (2 * v71) & 8) - 957650765) & 0xBBF8AC96 ^ 0x28980C96)
      + (v71 ^ 0x810362C);
  v73 = v72 - 2 * (v72 & 0x5702343B ^ v71 & 1) - 687721414;
  v74 = (((2 * v73) ^ 0xAE046874) - 2 * (((2 * v73) ^ 0xAE046874) & 0x46EB68BA ^ (2 * v73) & 8) - 957650765) & 0xBBF8AC96;
  v75 = (((v74 ^ 0x28980C96)
        + (v73 ^ 0x5DC5F1F7)
        - 2 * (((v74 ^ 0x28980C96) + (v73 ^ 0x5DC5F1F7)) & 0x5702343B ^ (v73 ^ 0x5DC5F1F7) & 1)
        - 687721414) ^ 0xD702343A)
      + (a64 ^ 0x45A4801B);
  v76 = (v75 ^ 0xD6FFAEE3) + 687886621 + ((2 * v75) & 0xADFF5DC6);
  v77 = ((v76 & 0xFFFFFFFE) - ((2 * v76) & 0xDD77E3B4) - 289672742) ^ 0xC34D08A1;
  LODWORD(STACK[0x308]) = v77;
  v78 = LODWORD(STACK[0x26C]) ^ 0x3941C6B3 ^ ((LODWORD(STACK[0x28C]) ^ LODWORD(STACK[0x234])) >> 8);
  LODWORD(STACK[0x30C]) = v78;
  v79 = 162634677 * v77;
  LODWORD(a21) = (v70 + 1775182450) & 0x9630DBFF;
  v80 = LODWORD(STACK[0x288]) ^ LODWORD(STACK[0x258]) ^ LODWORD(STACK[0x2B8]) ^ 0xD6734B95;
  v81 = v79 - ((v79 << ((v70 + 114) ^ 0x96)) & 0x903BE8C8) - 937560988;
  v82 = (((2 * ((v81 ^ v78) & 0xF3 ^ 0xFE58861)) | 0xA81206E8) - ((v81 ^ v78) & 0xF3 ^ 0xFE58861) - 1409876852) ^ 0x59E48FB0;
  v83 = v82 - ((2 * v82) & 0x276B015E) - 743079761;
  v84 = (1285353819 - (~(v81 ^ v78) & 4 | 0x4C9CF15B) + (~(v81 ^ v78) & 8 | 0xB3630EA4)) ^ 0x712E0B36;
  v85 = (v83 ^ ((v83 ^ 0x2E427B54) - 77096603 + (~(2 * (v83 ^ 0x2E427B54) + 2) | 0x930CD39)) ^ ((v83 ^ 0x2E427BC4)
                                                                                              - ((2 * (v83 ^ 0x2E427BC4)
                                                                                                + 290) & 0xCF459CD0)
                                                                                              - 408760583) ^ 0xCD78D3A0)
      + 144;
  v86 = ((v85 ^ 0x7D7FFFBC) - 2105540540 + ((2 * v85) & 0xFAFFFF78)) | (((2 * v84) & 0x9AF6A04E) - v84 - 1299927080) ^ 0x70C9AA46;
  v87 = dword_22D24EDB0[(v86 + 1721781315 - ((2 * v86) & 0xCD4098B0) + 21) ^ 0x66A04C43];
  v88 = ((2 * v87) ^ 0xC9B805F8) - ((2 * ((2 * v87) ^ 0xC9B805F8)) & 0xFAB66070) + 2103128121;
  v89 = (v87 ^ 0x34D8BA7B) + (v88 & 0xA009710E ^ 0x7FF48FD7) + ((2 * v88) & 0x12621C ^ 0x126010) - 1610465247;
  *(_DWORD *)(*(_QWORD *)(v68 + 488)
            + 4 * ((v79 - (((_BYTE)v79 << (a21 ^ 0x96)) & 0xC8) + 100) ^ 0x64u)) = v80 ^ (((2 * v89) & 0x1F9FFDFC) + (v89 ^ 0xFCFFEFE) - ((2 * (((2 * v89) & 0x1F9FFDFC) + (v89 ^ 0xFCFFEFE)) + 1364676836) & 0xEEB5BE3E) - 1610184815);
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 + 8 * (v70 ^ 0x53)) - 4))(a21 ^ 0x196, 2684782481, 100, 1125820728, 83, v80, 1204240, 886618747, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31);
}

void sub_22D222A38()
{
  JUMPOUT(0x22D2227D0);
}

uint64_t sub_22D222A40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  _QWORD *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v41 = malloc(0x404uLL);
  v39[64] = v41;
  *v39 = v39[57];
  v39[1] = 0;
  v39[2] = v39[61];
  v39[3] = 0;
  v39[5] = 0;
  v39[6] = 0;
  v39[7] = 0;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 + 8 * (int)(((v41 != 0) * ((a21 ^ 0xBABF1808) + 1161881851)) ^ a21)) - (a21 + 594) + 989))(v41, v42, v43, v44, v45, v46, v47, v48, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39);
}

uint64_t sub_22D222AB8@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int a65;
  uint64_t v65;
  uint64_t v66;
  int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  int v73;
  int v74;
  unint64_t v75;

  v67 = a1 | 4;
  v68 = ((LODWORD(STACK[0x304]) ^ 0xEE72A241)
       - ((2 * (LODWORD(STACK[0x304]) ^ 0xEE72A241) - 649548906) & 0xAE046874)
       - 1012495867) ^ 0xBBA7659A;
  LODWORD(STACK[0x31C]) = a65 ^ 0x4B33D29A;
  v69 = ((v68 - (((v68 << (v67 - 14)) - 649548906) & 0xAE046874) - 1012495867) ^ 0xD702343A) + (a65 ^ 0x4B33D29A);
  v70 = (v69 ^ 0x7FF377BF) - 2146662335 + ((2 * v69) & 0xFFE6EF7E);
  v71 = ((v70 & 0xFFFFFFFE) - ((2 * v70) & 0xE9817050) - 188696535) ^ 0x880B895C;
  LODWORD(STACK[0x320]) = v71;
  v72 = LODWORD(STACK[0x2A4]) ^ LODWORD(STACK[0x270]);
  LODWORD(STACK[0x324]) = v72;
  v73 = (-85 * v71 - 15 - ((86 * v71) & 0xE2));
  v74 = dword_22D24DFA0[LODWORD(STACK[0x238]) ^ LODWORD(STACK[0x274]) ^ LODWORD(STACK[0x2A0]) ^ (v67 + 585) ^ 0x7612EB7D ^ v73];
  HIDWORD(v75) = v74 ^ 0x154B0A3D;
  LODWORD(v75) = v74 ^ 0x80000000;
  *(_DWORD *)(*(_QWORD *)(v65 + 512) + 4 * (v73 ^ 0xF1u)) = v72 ^ LODWORD(STACK[0x25C]) ^ LODWORD(STACK[0x294]) ^ LODWORD(STACK[0x230]) ^ LODWORD(STACK[0x248]) ^ LODWORD(STACK[0x23C]) ^ LODWORD(STACK[0x268]) ^ 0x34C2AAB2 ^ ((v75 >> 29) - ((2 * (v75 >> 29)) & 0x4F1EED70) - 1483770184);
  return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(v66 + 8 * (v67 ^ 0x2F)))(dword_22D24DFA0, 357239357, 1327426928, 2811197112);
}

void sub_22D222CB8()
{
  JUMPOUT(0x22D222C58);
}

uint64_t sub_22D222CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  int v39;
  _QWORD *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v42 = malloc(0x408uLL);
  v40[67] = v42;
  *v40 = v40[57];
  v40[1] = 0;
  v40[2] = v40[61];
  v40[3] = 0;
  v43 = v40[64];
  v40[5] = 0;
  v40[6] = v43;
  v40[7] = 0;
  return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 8 * (((v42 == 0) * ((v39 - 662) ^ 0x147)) | v39)))(v42, v44, v45, v46, v47, v48, v49, v50, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39);
}

uint64_t sub_22D222D28()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  char v8;
  char v9;
  int v10;
  unsigned int v11;

  v3 = (v0 - 912436747) & 0x3662ADFE;
  v4 = ((LODWORD(STACK[0x304]) ^ 0xCDB64531)
      - ((2 * (LODWORD(STACK[0x304]) ^ 0xCDB64531) - 1724904454) & (v3 ^ 0xAE0469C2))
      + 597310007) ^ 0x986382EA;
  v5 = (v4 - ((2 * v4 - 1724904454) & 0xAE046874) + 597310007) ^ 0x986382EA;
  v6 = ((v5 - ((2 * v5 - 1724904454) & 0xAE046874) + 597310007) ^ 0xD702343A) + LODWORD(STACK[0x31C]);
  v7 = (((((2 * v6) & 0xFDE3693C) + (v6 ^ 0xFEF1B49E)) & 0xFFFFFFFE)
      - ((2 * (((2 * v6) & 0xFDE3693C) + (v6 ^ 0xFEF1B49E)) + 35428036) & 0xC4C26464)
      - 479232619) ^ 0xBD735E14;
  LODWORD(STACK[0x334]) = v7;
  v8 = 87 * v7 - 24;
  v9 = -82 * v7;
  v10 = dword_22D24C950[((((((v8 - (v9 & 0xD0)) ^ LODWORD(STACK[0x30C])) ^ 0x2CA2165) << (4 * (v3 ^ 0x78) - 55)) | 0xB3008238)
                       - (((v8 - (v9 & 0xD0)) ^ LODWORD(STACK[0x30C])) ^ 0x2CA2165)
                       - 1501577500) ^ 0x5B4A6037];
  v11 = v10 - ((2 * v10 + 134666840) & 0x938C3B5A) + 1305053913;
  *(_DWORD *)(*(_QWORD *)(v1 + 536) + 4 * ((v8 - (v9 & 0xD0)) ^ 0xE8u)) = LODWORD(STACK[0x260]) ^ LODWORD(STACK[0x23C]) ^ LODWORD(STACK[0x290]) ^ v11 ^ 0x28C225DC ^ (((2 * ((v11 >> 3) & 0x11EA1D5E ^ 0x1118AD14)) & 0x21F140A8) - ((v11 >> 3) & 0x11EA1D5E ^ 0x1118AD14) - 2130305622);
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v2 + 8 * (v3 ^ 0x74u)) - 4))(232, 215866890);
}

void sub_22D222F7C()
{
  JUMPOUT(0x22D222EB0);
}

uint64_t sub_22D222F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  int v39;
  _QWORD *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v42 = malloc(0x404uLL);
  v40[69] = v42;
  *v40 = v40[57];
  v40[1] = 0;
  v43 = v40[67];
  v40[2] = v40[61];
  v40[3] = v43;
  v44 = v40[64];
  v40[5] = 0;
  v40[6] = v44;
  v40[7] = 0;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 + 8 * ((108 * (v42 != 0)) ^ v39)) - 77 * ((v39 - 112235979) & 0xCFBFD79F ^ 0xC90F4500) + 993))(v42, v45, v46, v47, v48, v49, v50, v51, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39);
}

uint64_t sub_22D223018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int a66;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  char v76;
  int v77;
  int v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;

  v70 = ((a66 ^ LODWORD(STACK[0x2BC]) ^ 0x624D9618)
       - ((((a66 ^ LODWORD(STACK[0x2BC]) ^ 0x624D9618) << (v67 - v66 + 27)) + 1992274718) & 0xF0CCBB32)
       + 868628264) ^ 0xD4DCC951;
  v71 = (v70 - ((2 * v70 + 1992274718) & 0xF0CCBB32) + 868628264) ^ 0xD4DCC951;
  v72 = ((v71 - ((2 * v71 + 1992274718) & 0xF0CCBB32) + 868628264) ^ 0x78665D99) + LODWORD(STACK[0x31C]);
  v73 = (v72 ^ 0xF7FFDBF7) + 134226953 + ((2 * v72) & 0xEFFFB7EE);
  v74 = ((v73 & 0xFFFFFFFE) - ((2 * v73) & 0x430BB04) - 2112332414) ^ 0xDAD7F5E7;
  LODWORD(STACK[0x340]) = v74;
  v75 = (((LODWORD(STACK[0x25C]) ^ LODWORD(STACK[0x234])) ^ LODWORD(STACK[0x28C])) >> 16) ^ 0x80769365;
  LODWORD(STACK[0x344]) = v75;
  v76 = -105 * v74;
  v77 = ((v76 - ((v76 << ((v67 - v66 - 79) ^ 0x96)) & 0xB4) + 90) ^ v75) ^ 0x200C008;
  v78 = dword_22D251210[(((2 * v77) & 0x180C4) - v77 + 843187869) ^ 0x3042C686];
  v79 = v78 - ((2 * v78 + 1565295612) & 0x613AA42E) + 524522517;
  v80 = LODWORD(STACK[0x280]) ^ LODWORD(STACK[0x250]) ^ LODWORD(STACK[0x2B4]) ^ v79 ^ (((8 * v79) ^ 0x84EA90B8)
                                                                                     - ((2 * ((8 * v79) ^ 0x84EA90B8)) & 0x60F180C0)
                                                                                     + 813219940) ^ (((4 * v79) ^ 0xC275485C) - ((2 * ((4 * v79) ^ 0xC275485C)) & 0x34AAF990) - 1705673526);
  v81 = (v80 ^ 0xF8CF1EE6) + 1;
  v80 ^= 0x9615D02E;
  v82 = v80 + (v81 ^ 0x7EB9FCD7) + ((2 * v81) & 0xFD73F9AE) - 2126118103;
  *(_DWORD *)(*(_QWORD *)(v68 + 552)
            + 4 * ((v76 - ((v76 << ((v67 - v66 - 79) ^ 0x96)) & 0xB4) + 90) ^ 0x5Au)) = ((v82 - ((2 * v82) & 0x626836AE) + 825498455) ^ 0xCECBE4A9) + v80 - ((2 * (((v82 - ((2 * v82) & 0x626836AE) + 825498455) ^ 0xCECBE4A9) + v80)) & 0xA8CCEED4) - 731482262;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 + 8 * (v67 - v66)) - 8))(4252236206, 2518011950, 2168849193, 1650996910, 825498455, 3469468841, 2832002772, 3563485034, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33);
}

void sub_22D22331C()
{
  JUMPOUT(0x22D22319CLL);
}

uint64_t sub_22D223324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,int a47,int a48)
{
  int v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  BOOL v63;
  _BOOL4 v64;
  int v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;

  v51 = (v48 - 1230965306) & 0x495F077D;
  v70 = *(void **)(v49 + 56);
  v68 = *(void **)(v49 + 40);
  v69 = *(void **)(v49 + 48);
  v52 = *(void **)(v49 + 24);
  v53 = *(void **)(v49 + 8);
  v67 = *(void **)v49;
  free(*(void **)(v49 + 16));
  free(v52);
  free(v53);
  free(*(void **)(v49 + 432));
  free(v68);
  free(v67);
  free(v69);
  free(v70);
  v62 = (((v51 ^ 0x30C) - 950033074) ^ a48) + ((2 * a48) & 0x8EBF4EDE) + 1022884828;
  v63 = v62 == 72852299;
  v64 = v62 != 72852299;
  if (v63)
    v65 = 0;
  else
    v65 = -45011;
  LODWORD(STACK[0x380]) = v65;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, void *, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 + 8 * (int)((v64 * ((v51 - 1730523759) ^ 0x98DA4EA6)) ^ v51)) - 8))(v54, v55, v56, v57, v58, v59, v60, v61, a9, a10, a11, a12, a13, a14, a15, a16, v67, v68, v69,
           a20,
           v70,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43);
}

void sub_22D22342C(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,int a47)
{
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;

  LODWORD(STACK[0x384]) = a47 - 14357482;
  v47[9] = 102292894;
  *(_DWORD *)(v48 - 220) = a47 - 14357482;
  v47[279] = v47[12];
  LODWORD(STACK[0x474]) = a1;
  v47[109] = 102292894;
  v49 = v47[109];
  v47[110] = v49;
  v50 = STACK[0x474];
  LODWORD(STACK[0x488]) = STACK[0x474];
  LODWORD(STACK[0x48C]) = v50 ^ 0x98DA4C9F;
  v51 = (*(_DWORD *)(v48 - 220) + v49);
  v52 = v51 < 0x139C76E;
  v51 -= 20563822;
  v47[113] = v51;
  v47[87] = v47[279] + v51 + (v52 << 32);
  JUMPOUT(0x22D2234C8);
}

void sub_22D2234D4()
{
  uint64_t v0;

  sub_22D22F914(*(_QWORD *)(v0 + 96));
  JUMPOUT(0x22D2234ECLL);
}

uint64_t sub_22D223574()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  char v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;

  v3 = ((STACK[0x3E4] & 0x5021005 ^ 0x2F0568C2)
      + (LODWORD(STACK[0x3F8]) ^ 0x129787 ^ STACK[0x3E4] & 0xC592961D)
      - ((LODWORD(STACK[0x3F8]) ^ 0x129787 ^ STACK[0x3E4] & 0xC592961D) & 0x5021005)) ^ 0x610568D6;
  v4 = ((2 * v3) | 0x73421BB2) - v3 - 966856153;
  v5 = v1[91];
  v6 = (v5 + ((-92 - 2 * v5) | 5) + 43) ^ 0xFD;
  v7 = LOBYTE(STACK[0x3C7]) ^ 0x6A ^ (-113 * v6 - ((30 * v6) & 0x88) - 60);
  v8 = v7 - ((2 * v7) & 0x11111111) - 642406264;
  v9 = (((2 * v8) & 0xA) + (v8 & 0x1D ^ 0xFFFFFFF7) - 1199795525) ^ 0xA81DB33A;
  v10 = (((2 * (STACK[0x3E4] & 0x3A6D69E2 ^ 0x30452822)) & 0x24D8C244)
       - (STACK[0x3E4] & 0x3A6D69E2 ^ 0x30452822)
       + 756095193) ^ 0x9596A04F;
  v11 = v4 ^ 0xA4A19488 ^ (v9 - ((2 * v9) & 0xC241AA) - 2015249195) | (v10 - ((2 * v10) & 0xD8C56C58) + 1818408493) ^ 0xD4E16E99 ^ v8 & 0xE2;
  v12 = ((2 * v11) & 0xBFD3F7BA)
      + (v11 ^ 0x5FE9FBDD)
      - 2
      * ((((2 * v11) & 0xBFD3F7BA) + (v11 ^ 0x5FE9FBDD) + 1458836512) & 0x74D1CA9A ^ (((2 * v11) & 0xBFD3F7BA)
                                                                                    + (v11 ^ 0x5FE9FBDD)) & 0xA)
      + 1271258800;
  LODWORD(STACK[0x3FC]) = v12;
  v1[94] = ++v5;
  v13 = v0 & ~(LOBYTE(STACK[0x993]) ^ ((v5 & 1) == 0));
  v14 = *(_QWORD *)(v2 + 8 * (v13 | (32 * v13) | LODWORD(STACK[0x3F4])));
  LODWORD(STACK[0x3D4]) = STACK[0x3F4];
  v1[89] = v5;
  LODWORD(STACK[0x3E0]) = v12;
  return ((uint64_t (*)(void))(v14 - 8))();
}

uint64_t sub_22D2237B4@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57,int a58,int a59)
{
  uint64_t v59;

  LODWORD(STACK[0x20C]) = STACK[0x3FC];
  LODWORD(STACK[0x210]) = a59 - a58;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 + 8 * ((a1 - 175) ^ 0x151))
                                                                                                - 12))(485620508, 3227026225, 222374038, 1606408949, 3212817898, 3024782776, 828963042);
}

uint64_t sub_22D223B58@<X0>(uint64_t a1@<X5>, uint64_t a2@<X6>, uint64_t a3@<X7>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t (*v32)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  LODWORD(STACK[0x214]) = v28;
  LODWORD(STACK[0x218]) = v31;
  LODWORD(STACK[0x21C]) = v26;
  LODWORD(STACK[0x220]) = a4;
  v32 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 8 * ((107 * (((v27 + 122) ^ 5 ^ v26) & 1)) | v27)) - 8);
  return v32(*(_QWORD *)(v29 + 160), v32, (v27 - 134) ^ 0xC0B6F405 ^ v26, (a4 ^ 0x63 ^ (**(_BYTE **)(v29 + 160)- ((2 * **(_BYTE **)(v29 + 160)) & 0xE7)- 13)) & 1, 2171464446, a1, a2, a3, a5, a6, a7, a8, a9, a10, a11, a12, a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_22D223C9C()
{
  unint64_t v0;
  uint64_t v1;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char v9;
  unsigned int v10;
  int v11;
  unsigned __int8 v12;
  int v13;
  unint64_t v14;
  int v15;

  v9 = STACK[0x3C7];
  v10 = STACK[0x44C] & 0xFFFFFFFC ^ 0xB99F21C7;
  LODWORD(STACK[0x4A0]) = v10;
  v11 = v10 + 874643520 - ((2 * v10) & 0x68440080);
  LODWORD(STACK[0x4A4]) = v11;
  v12 = (-113 * (LOBYTE(STACK[0x470]) ^ 0x58)
       - ((32 * LOBYTE(STACK[0x470]) - 2 * (LOBYTE(STACK[0x470]) ^ 0x58)) & 0x7C)
       - 66) ^ v9;
  LOBYTE(STACK[0x4A8]) = v12;
  v13 = byte_22D24D790[v12 ^ 0xFLL];
  HIDWORD(v14) = v13 ^ 0x2D;
  LODWORD(v14) = (v13 ^ 0x40) << 24;
  v15 = (v14 >> 30) - ((2 * (v14 >> 30)) & 0x3A) - 99;
  HIDWORD(v14) = v15 ^ 1;
  LODWORD(v14) = (v15 ^ 0xFFFFFF9F) << 24;
  LOBYTE(STACK[0x4A9]) = (v14 >> 26) - ((2 * (v14 >> 26)) & 0xC7) + 99;
  LOBYTE(STACK[0x4AA]) = (v12 ^ 0x7A) - ((2 * (v12 ^ 0x7A)) & 0xF4) + 2;
  v7[87] = v7[182] + (v11 ^ 0x34220040u);
  v7[85] = *(_QWORD *)(v8 + 8 * (v3 ^ 0x64F)) - 4;
  v0 = ((v7[87] - *(_QWORD *)(v5 + 464)) & 0xFFFFFFFFFFFFFFF0) + *(_QWORD *)(v6 + 456);
  v1 = (*(uint64_t (**)(_QWORD, unint64_t *, uint64_t))(*(_QWORD *)(v4 + 488)
                                                                      + 32 * *(unsigned __int8 *)(v0 + 8)
                                                                      + 8))(*(_QWORD *)v0, &STACK[0x40F], 1);
  LOBYTE(STACK[0x3C7]) = STACK[0x40F];
  return ((uint64_t (*)(uint64_t))v7[85])(v1);
}

void sub_22D224718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _QWORD *v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  char v31;

  LOBYTE(STACK[0x5C3]) = STACK[0x3C7];
  v25 = LOBYTE(STACK[0x5B7]);
  v26 = (v25 ^ 0xB) - ((2 * (v25 ^ 0xB)) & 0x54) + 539248682;
  v27 = ((2 * (v25 ^ 0x28)) & 0x1F8) + (v25 ^ 0x4DFBF7D5);
  v28 = ((v26 ^ 0xDFDBB7D5) - ((2 * (v26 ^ 0xDFDBB7D5) + 2) & 0x624C9D52) + 824594090) ^ v26 ^ (778199768
                                                                                              - v27
                                                                                              - ((-1678249924 - 2 * v27) & 0xC0CCD574));
  LODWORD(STACK[0x5C4]) = v28;
  v29 = STACK[0x44C] & 0xFFFFFFFA ^ 0xB99F21C7;
  LODWORD(STACK[0x5C8]) = v29;
  v30 = v29 - 1845992207 + ((2 * v29) & 0x23F0C9E0 ^ 0xFFFFFFFD) + 1;
  LODWORD(STACK[0x5CC]) = v30;
  LOBYTE(v28) = byte_22D246B00[(v28 ^ 0xF1646C39) + 34];
  v31 = LOBYTE(STACK[0x5BC]) ^ 0x75;
  LOBYTE(STACK[0x5D3]) = 113 * v31;
  LOBYTE(STACK[0x5D4]) = (30 * v31) & 0x72;
  LOBYTE(STACK[0x5D5]) = -109 * v28 - ((a22 + 6 * v28) & 0x1E) + 50;
  LOBYTE(STACK[0x5D6]) = -104 * v28 - 2 * ((-104 * v28 + 16) & 0xAA ^ (-104 * v28) & 8) - 78;
  v22[87] = v22[194] + (v30 ^ 0x91F864F1);
  v22[85] = *(_QWORD *)(v24 + 8 * (int)(v23 ^ 0x98DA4BAD));
  JUMPOUT(0x22D223C50);
}

void sub_22D224938()
{
  uint64_t v0;
  char v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;

  v1 = STACK[0x3C7];
  v2 = LODWORD(STACK[0x554]) ^ 0x36E31C97 | LODWORD(STACK[0x550]) ^ 0x462CE888;
  LODWORD(STACK[0x568]) = v2 + 1347833936 - ((2 * v2) & 0xA0ACA0A0);
  v3 = LODWORD(STACK[0x520]) ^ 0xD6DF8055 | LODWORD(STACK[0x560]) ^ 0x2169D2D5;
  LODWORD(STACK[0x56C]) = v3 + 922761627 - ((2 * v3) & 0x6E007336);
  LOBYTE(STACK[0x573]) = ((~(30 * (LOBYTE(STACK[0x55C]) ^ 0xA8)) | 0x8B) - 113 * (LOBYTE(STACK[0x55C]) ^ 0xA8) - 69) ^ v1;
  v4 = STACK[0x44C] & 0xFFFFFFF7 ^ 0xB99F21CF;
  LODWORD(STACK[0x574]) = v4;
  v5 = (v4 - 1533221530 - ((2 * v4) & 0x4939CACC)) ^ 0xA49CE566;
  LODWORD(STACK[0x578]) = v5;
  *(_QWORD *)(v0 + 696) = *(_QWORD *)(v0 + 1520) + v5;
  JUMPOUT(0x22D22522CLL);
}

void sub_22D224A48()
{
  _QWORD *v0;
  int v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unint64_t v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;

  v3 = LOBYTE(STACK[0x3C7]);
  v4 = ((((LOBYTE(STACK[0x567]) ^ 0x6A) - ((2 * (LOBYTE(STACK[0x567]) ^ 0x6A)) & 0xFFFFFFFB)) << 8) + 180813056) ^ 0xAC6FD00;
  v5 = (v4 - 2123169603 - ((2 * v4) & 0x2E60000)) ^ 0x817300BD | LODWORD(STACK[0x4B8]) ^ 0xDA4DC6D8;
  LODWORD(STACK[0x57C]) = v5 + 35193976 - ((2 * v5) & 0x43208F0);
  v6 = (((v3 - ((2 * v3) & 0x98)) << 22) - 754974720) ^ 0xD3000000;
  v7 = v6 - ((2 * v6) & 0xB7800000) + 1540793387;
  v8 = 599785472 * LODWORD(STACK[0x578]) - ((125829120 * LODWORD(STACK[0x578])) & 0x3E000000) + 1596264711;
  v9 = ((v8 & 0xE000000 ^ 0xC7476715 | v8 & 0x30000000) - 1) ^ 0x9F454F92;
  v10 = v9 - ((2 * v9) & 0xB8001100) + 1569197304;
  v11 = byte_22D24D790[LOBYTE(STACK[0x573]) ^ 0x4DLL] ^ ((LOBYTE(STACK[0x573]) ^ 0xC7) - 120) ^ LOBYTE(STACK[0x573]);
  v12 = ((((v11 ^ 0x5A) - ((2 * v11) & 0x42)) << 24) + 553648128) ^ 0x21000000;
  v13 = v7 ^ 0x9F2EA9AE;
  v14 = (v7 ^ 0x7B5B722E ^ v10)
      + (v7 ^ 0x9F2EA9AE)
      - ((2 * ((v7 ^ 0x7B5B722E ^ v10) + (v7 ^ 0x9F2EA9AE))) & 0xD1C7DE48)
      + 1759768356;
  v15 = STACK[0x44C];
  v16 = STACK[0x44C] & 0xFFFFFFF8 ^ 0xB99F21C7;
  LODWORD(STACK[0x580]) = v16;
  v17 = v16 - 1706653147 + ((2 * (v16 & 0x1A468A30 ^ (v15 | 0x7FFFFFEF))) ^ 0x2B) + 1;
  LODWORD(STACK[0x584]) = v17;
  v18 = LOBYTE(STACK[0x4CE]) ^ LOBYTE(STACK[0x50F]) ^ 0x46;
  v19 = (v18 + 88050582 - ((2 * v18) & 0x12C)) ^ 0x53F8B96 | (v12 + 1853355794 - ((2 * v12) & 0xDDDDDDDD)) ^ 0x6E77F712;
  LODWORD(STACK[0x588]) = v19 + 1106958056 - ((2 * v19) & 0x83F5ADD0);
  v20 = (v10 ^ v14 ^ ((v10 ^ 0xE475DB81) - ((2 * (v10 ^ 0xE475DB81) + 2) & 0x2336A416) - 1852091892) ^ 0xE2F29951) + v13;
  v21 = ((2 * v20) & 0xFEDE9F7E) + (v20 ^ 0xFF6F4FBF);
  HIDWORD(v22) = v21 + 1093697;
  LODWORD(v22) = v21 + 9482305;
  v23 = (v22 >> 22) - ((2 * (v22 >> 22)) & 0xFE305F6A) - 15192139;
  v24 = ((2 * ((v23 ^ 0x1F2E38A6) + 32)) & 0xFD6DB5DC) + (((v23 ^ 0x1F2E38A6) + 32) ^ 0xFEB6DAEE);
  v25 = (((2 * ((2 * v23) ^ 0x6A)) & 0x2C) - ((2 * v23) ^ 0x6A) + 41) & 0x40;
  v26 = v24 + ((v25 & 0xFFFFFF7F | (((v25 >> 6) & 1) << 7)) ^ 0xD14E00A1);
  v27 = v26 - ((2 * v26 + 1609976034) & 0xAF43B06A) + 127728806;
  LODWORD(STACK[0x58C]) = v27;
  LODWORD(STACK[0x590]) = (v27 ^ 0xD7A1D835) - 2 * (((v27 ^ 0xD7A1D835) + 120) & 0x710578BF ^ v27 & 2) + 309;
  v0[87] = v0[191] + (v17 ^ 0x9A468A25);
  v0[85] = *(_QWORD *)(v2 + 8 * (int)(v1 ^ 0x98DA4BB1)) - 8;
  JUMPOUT(0x22D223C50);
}

void sub_22D224E28()
{
  _QWORD *v0;
  char v1;
  int v2;
  unsigned int v3;
  char v4;
  int v5;
  unsigned int v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v1 = ((~(30 * (LOBYTE(STACK[0x5CC]) ^ 0xF1)) | 0xD) - 113 * (LOBYTE(STACK[0x5CC]) ^ 0xF1) - 6) ^ LOBYTE(STACK[0x3C7]);
  LOBYTE(STACK[0x5D7]) = v1;
  v2 = byte_22D251C40[(LOBYTE(STACK[0x5C3]) ^ (LOBYTE(STACK[0x5D3]) + LOBYTE(STACK[0x5D4]) + 70))] ^ 0x50;
  v3 = (((v2 - ((2 * v2) & 0x174)) << 8) - 1825981952) ^ 0x9329BA00;
  LODWORD(STACK[0x5D8]) = v3 + 1483921834 - ((2 * v3) & 0x30E5B200);
  v4 = ((2 * v1) & 0x38 ^ 8) + (v1 ^ 0xBB);
  v5 = LOBYTE(STACK[0x5D5]) ^ LOBYTE(STACK[0x5D6]) ^ 0xAD;
  v6 = (v5 - 1910795734 - ((2 * v5) & 0x54)) ^ 0x8E1B922A | LODWORD(STACK[0x5AC]) ^ 0xE69CD7E7;
  LODWORD(STACK[0x5DC]) = v6 - ((2 * v6) & 0x1CFABAE2) + 243096945;
  if (((v4 + 4) & 8) != 0)
    v7 = -8;
  else
    v7 = 8;
  v8 = ((((27 - (v4 + v7)) ^ 0x54) + 1) ^ 0x7A) + v4 + ((2 * (((27 - (v4 + v7)) ^ 0x54) + 1)) & 0xF4);
  LOBYTE(STACK[0x5E3]) = v8 + (~(2 * v8 + 84) | 0x8B) + 37;
  v9 = LODWORD(STACK[0x44C]) ^ 0xB99F21C7;
  LODWORD(STACK[0x5E4]) = v9;
  v10 = v0[195] + v9;
  v0[155] = v10;
  v0[87] = v10;
  JUMPOUT(0x22D224FD0);
}

void sub_22D224FDC()
{
  int v0;
  int v1;
  _QWORD *v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;

  v5 = LOBYTE(STACK[0x3C7]);
  v6 = byte_22D250AE0[LOBYTE(STACK[0x5D7]) ^ 0xF8];
  v7 = LODWORD(STACK[0x588]) ^ 0x41FAD6E8 | LODWORD(STACK[0x5D8]) ^ 0x5872D9AA;
  LODWORD(STACK[0x5F4]) = v7 + 528436457 - ((2 * v7) & 0x3EFE99D2);
  LOBYTE(v7) = -113 * LODWORD(STACK[0x5E4]) - ((30 * LOBYTE(STACK[0x5E4])) & 0xD4) + 106;
  v8 = (v0
      + (((v6 ^ LOBYTE(STACK[0x5E3]) ^ 0x80) - ((2 * (v6 ^ LOBYTE(STACK[0x5E3]) ^ 0x80)) & 0xFFFFFF87)) << 16)
      + 1758920704) ^ 0x68C30000;
  v9 = (v8 + 296655713 - ((2 * v8) & 0x235C0000)) ^ 0x11AE9B61 | LODWORD(STACK[0x5B0]) ^ 0x1D3022DA;
  LODWORD(STACK[0x5F8]) = v9 - ((2 * v9) & 0xC37ED8BE) - 507548577;
  v10 = (STACK[0x44C] & 0xFFFFFFF2 ^ 0xB99F21CF)
      - 1530385345
      - ((2 * (STACK[0x44C] & 0xFFFFFFF2 ^ 0xB99F21CF)) & 0x4990587E);
  LODWORD(STACK[0x5FC]) = v10;
  v11 = (-39017775
       - (((v7 & 0xF0 ^ 0xAE90B4E3) - 1) ^ 0xF40C3488 | 0xFDACA2D1)
       + (((v7 & 0xF0 ^ 0xAE90B4E3) - 1) ^ 0xF40C3488 | 0x2535D2E)) ^ (v5 - ((2 * v5) & 0xA) + 1499374853);
  LODWORD(STACK[0x600]) = v11;
  LODWORD(STACK[0x604]) = v11 ^ 0x19178E4;
  v12 = v2[196] + (v10 ^ 0xA4C82C3F);
  v2[159] = v12;
  v2[87] = v12;
  v2[85] = *(_QWORD *)(v4 + 8 * (v1 + v3 + 1255)) - 8;
  JUMPOUT(0x22D223C50);
}

void sub_22D2251A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,char a23)
{
  uint64_t v23;

  LOBYTE(STACK[0x50D]) = STACK[0x3C7];
  LOBYTE(STACK[0x50E]) = -113 * (LOBYTE(STACK[0x4C8]) ^ 0xA1) - ((30 * (LOBYTE(STACK[0x4C8]) ^ 0xA1)) & 0xAC) - 42;
  LOBYTE(STACK[0x50F]) = -104 * LOBYTE(STACK[0x4CD]) - ((a23 + 48 * LOBYTE(STACK[0x4CD])) & 0x40) + 51;
  *(_QWORD *)(v23 + 696) = *(_QWORD *)(v23 + 1480) + (LODWORD(STACK[0x4C0]) ^ 0x871C7C3u);
  JUMPOUT(0x22D225228);
}

void sub_22D22523C()
{
  uint64_t v0;
  unsigned __int8 v1;
  int v2;
  unint64_t v3;
  int v4;
  unsigned int v5;
  char v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;

  v1 = (-113 * (LOBYTE(STACK[0x514]) ^ 0x68)
      - ((32 * LOBYTE(STACK[0x514]) - 2 * (LOBYTE(STACK[0x514]) ^ 0x68)) & 0x40)
      - 96) ^ LOBYTE(STACK[0x3C7]);
  v2 = LOBYTE(STACK[0x51F]) ^ LOBYTE(STACK[0x51E]);
  HIDWORD(v3) = v2 ^ 6;
  LODWORD(v3) = v2 << 24;
  v4 = byte_22D250AE0[v1 ^ 0xB7];
  v5 = ((((((v3 >> 30) - ((2 * (v3 >> 30)) & 0xBA) - 35) ^ 0xAA)
        - ((2 * (((v3 >> 30) - ((2 * (v3 >> 30)) & 0xBA) - 35) ^ 0xAA)) & 0x164)) << 16)
      + 1001521152) ^ 0x3BB20000;
  LODWORD(STACK[0x520]) = v5 - 689995691 - ((2 * v5) & 0x2DBE0000);
  v6 = (v1 ^ 0x68) + (((v1 ^ 0x4B) + 1) ^ 0x7B) + ((2 * ((v1 ^ 0x4B) + 1)) & 0xF7) - 123;
  v7 = ((2 * (STACK[0x518] & 0xA39B ^ 0x8080)) & 0x4500) - (STACK[0x518] & 0xA39B ^ 0x8080) + 719030651;
  LODWORD(STACK[0x524]) = (v7 & 0xEE92 ^ 0x207846A1) + (v7 & 0x10109) - 1;
  v8 = v4 ^ 0x91 ^ (v6 - ((2 * v6) & 0x5A) + 45);
  v9 = (((v8 - ((2 * v8) & 0x5A)) << 16) + 1881997312) ^ 0x702D0000;
  v10 = v9 - 105920179 + (~(2 * v9) | 0x8CA1FFFF);
  v11 = STACK[0x44C];
  v12 = STACK[0x44C] & 0xFFFFFFF5 ^ 0xB99F21CF;
  LODWORD(STACK[0x528]) = v12;
  v13 = v12 - 1154045120 - ((2 * v12) & 0x766D5680);
  LODWORD(STACK[0x52C]) = v13;
  v14 = v11 & 0xFFFFFFF9 ^ 0xB99F21C7;
  LODWORD(STACK[0x530]) = v14;
  LODWORD(STACK[0x534]) = v14 - 1450828874 - ((2 * v14) & 0x530C3770);
  LODWORD(STACK[0x538]) = (v10 & 0x70000 ^ 0x30000) + 2361300 - ((2 * v10) & 0x80000) + 2792;
  v15 = ((2 * (v10 & 0xF80000 ^ 0x200000)) | 0xA31570EC) - (v10 & 0xF80000 ^ 0x200000) + 779437962;
  LODWORD(STACK[0x53C]) = (v15 & 0x65F9804C ^ 0xF98000) + (v15 ^ 0xF50230FE) - ((v15 ^ 0xF50230FE) & 0x65F9804C);
  *(_QWORD *)(v0 + 696) = *(_QWORD *)(v0 + 1496) + (v13 ^ 0xBB36AB40);
  JUMPOUT(0x22D225230);
}

uint64_t sub_22D2254CC()
{
  _QWORD *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = v0[273] + v0[125];
  v4 = -711945521
     * ((LODWORD(STACK[0x4EC]) ^ 0x7FFFFD43) & (*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x4D48DDF4)) ^ LODWORD(STACK[0x500])));
  v5 = -711945521 * (v4 ^ HIWORD(v4));
  v6 = v3 - 0x224E663FBDAD3D36;
  LODWORD(v3) = -711945521 * ((*(_DWORD *)(qword_255D671B8 + (dword_255D671C4 & 0x7E4355EC)) ^ v3) & 0x7FFFFFFF);
  v7 = -711945521 * (v3 ^ WORD1(v3));
  LOBYTE(STACK[0x39B]) = byte_22D250BE0[v5 >> 24] ^ LOBYTE(STACK[0x3C7]) ^ byte_22D248860[v5 >> 24] ^ byte_22D24BB00[v5 >> 24] ^ byte_22D246F30[v7 >> 24] ^ byte_22D24E8A0[v7 >> 24] ^ v5 ^ byte_22D24DA90[(v7 >> 24) + 3] ^ (-97 * BYTE3(v5)) ^ v7 ^ (-59 * BYTE3(v7));
  v0[80] = v6;
  v0[79] = *(_QWORD *)(v2 + 8 * (int)(v1 ^ 0x98DA4BC7)) - 12;
  return sub_22D21A0B8();
}

uint64_t ZshgJnRaSlwn(uint64_t a1)
{
  return ((uint64_t (*)(void))(qword_24F86A890[(1560 * (a1 != 0)) ^ 0x2DEu] - 4))();
}

void sub_22D227BBC(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_22D227C8C()
{
  int v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(v2 + 8 * ((1074 * (*v1 != 1340105609)) ^ (v3 + v0 - 37))))();
}

uint64_t sub_22D227CC0()
{
  _DWORD *v0;
  int v1;
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = v0;
  sub_22D22E174(qword_255D671E8);
  v4 = qword_255D67220[0] + 888;
  do
  {
    v5 = *(_QWORD *)(v4 + 16);
    if ((*(_DWORD *)(v4 + 24) & 9) == 1)
      munmap(*(void **)v4, *(_QWORD *)(v4 + 8));
    v4 = v5;
  }
  while (v5);
  v6 = qword_255D67228 + 888;
  do
  {
    v7 = *(_QWORD *)(v6 + 16);
    if ((*(_DWORD *)(v6 + 24) & 9) == 1)
      munmap(*(void **)v6, *(_QWORD *)(v6 + 8));
    v6 = v7;
  }
  while (v7);
  *v3 = v1;
  result = v2;
  *(_DWORD *)(v2 + 8) = 2055059131;
  return result;
}

uint64_t sub_22D22BE70(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;

  v13 = v10 + v11;
  v14 = *(_DWORD *)(a4 + 4 * (v10 + v11));
  v15 = (((v14 ^ 0xF5533C8 ^ (v14 >> 30)) * v6) & v7) + v10 + (((v14 ^ 0xF5533C8 ^ (v14 >> 30)) * a3) ^ v5);
  *(_DWORD *)(a4 + 4 * (v13 + 1)) = v15 - ((v8 + 2 * v15) & 0x1EAA6790) + v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (((v4 > 0x26E) | (16 * (v4 > 0x26E))) ^ v12)) - 12))();
}

uint64_t sub_22D22BEE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_22D22BE70(a1, a2, a3, a4);
}

void sub_22D22BEEC(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19, int a20,int a21,int a22,int a23,int a24,int a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,_DWORD *a39,uint64_t a40,uint64_t a41,timeval *a42,_DWORD *a43,_DWORD *a44,_DWORD *a45,_DWORD *a46,uint64_t a47,uint64_t a48,int a49,int a50,int a51)
{
  int v51;
  int v52;
  uint32_t v53;
  uint32_t v54;

  v52 = a1 ^ (v51 + 1155);
  gettimeofday(a42, 0);
  *a43 = v52 + LODWORD(a42->tv_sec) - ((2 * LODWORD(a42->tv_sec)) & 0x1EAA6790) - 1343991137;
  *a45 = *a44 + 257242056 - ((2 * *a44) & 0x1EAA6790);
  v53 = arc4random();
  *a46 = v53 + 257242056 - ((2 * v53) & 0x1EAA6790);
  v54 = arc4random();
  *a39 = v54 + 257242056 - ((2 * v54) & 0x1EAA6790);
  JUMPOUT(0x22D22B198);
}

uint64_t sub_22D22C0B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,_DWORD *a42)
{
  int v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  LODWORD(STACK[0x470]) = 989763890;
  *a42 = -1544148499;
  v46 = dword_255D66728;
  STACK[0x368] = *(_QWORD *)(v43 + 8 * ((v42 - 1916289477) ^ 0x1FFFFFFFED389FCDLL));
  LODWORD(STACK[0x370]) = v42 - 1916289477;
  STACK[0x378] = v46;
  LODWORD(STACK[0x380]) = 0;
  LODWORD(STACK[0x384]) = (v42 - 1916289477) ^ 0x44;
  LODWORD(STACK[0x388]) = v42 - 1916289560;
  STACK[0x390] = v44;
  *(_QWORD *)(v45 - 112) = &STACK[0x368];
  *(_DWORD *)(v45 - 104) = 1431737413 * ((((2 * (v45 - 112)) | 0x1DFB3178) - (v45 - 112) - 251500732) ^ 0xB0A307AE)
                         + 963210645
                         + v42;
  sub_22D219DEC(v45 - 112);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_24F86A890[*(int *)(v45 - 100)] - 8))(v47, v48, v49, v50, v51, v52, v53, v54, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_22D22C1AC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19, int a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27,int a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,size_t size,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  int v52;
  uint64_t v53;

  malloc_type_malloc(size, 0xC5732911uLL);
  v53 = arc4random();
  LODWORD(xmmword_255D65D28) = v53 + 257242056 - (((a20 - v52 - 133) ^ 0x1EAA6531) & (2 * v53));
  return sub_22D22BE70(v53, (uint64_t)qword_24F86A890, 1812433253, (uint64_t)&xmmword_255D65D28);
}

uint64_t sub_22D22C280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v26 = (v23 - 1887676763) & 0x1112CA39;
  v27 = *((unsigned int *)&xmmword_255D65D28 + 2 * (v26 ^ 4u) + v25 - 1424162353);
  v28 = (v27 & 0x7FFFFFFE ^ 0x2ADB3E70)
      + (v27 & 0x5129202A ^ 0xD120000B)
      - ((v27 & 0x7FFFFFFE ^ 0x2ADB3E70) & 0x5129202A);
  v29 = (v28 ^ 0xF4A72D93 | xmmword_255D65D28 & 0x80000000)
      - 2 * ((v28 ^ 0xF4A72D93) & 0x10DDFBEA ^ v28 & 8)
      - 1864500254;
  v30 = *((unsigned int *)&STACK[0x470] + (v27 & 1));
  v31 = *((_DWORD *)&xmmword_255D65D28 + v25 - 1424160909) ^ v30;
  *((_DWORD *)&xmmword_255D65D28 + v25 - 1424161306) = v31 ^ (v29 >> 1) ^ 0x729064C3;
  v32 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 8 * ((1618 * (v25 == 1424161080)) ^ v26));
  return v32(v27, v26 ^ 4u, 1424161307, v32, v31, v30, 1361649706, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23);
}

void sub_22D22C394()
{
  JUMPOUT(0x22D22C310);
}

void sub_22D22C39C()
{
  JUMPOUT(0x22D22AD30);
}

uint64_t sub_22D22C514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v34 = sub_22D23D0BC();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))qword_24F86A890[(21 * ((int)v34 < (int)((v32 - 207919178) & 0xACF3B7E5 ^ (v32 + 198165404) & 0x94BF5BFF))) ^ (v33 + v32 + 57)])(v34, v35, v36, v37, v38, v39, v40, v41, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32);
}

uint64_t sub_22D22C5A4@<X0>(int a1@<W0>, int a2@<W8>)
{
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * (((((a2 ^ (v2 + 1001)) - v2 - 14) ^ 0x1D0) * (a1 == -536870170)) ^ a2))
                            - 4))();
}

void sub_22D22C5E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(_QWORD *)(a10 - 0x6618A9C996C073A9) = 0;
  *(_DWORD *)(a10 - 0x6618A9C996C073A1) = -1084420351;
  JUMPOUT(0x22D22C618);
}

uint64_t sub_22D22C63C(int a1)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((a1 == (v1 ^ 0x74) - 177) * (v2 + v1 + v4 + 863)) ^ v1)) - 4))();
}

_QWORD *sub_22D22C670(unint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  unsigned int *v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *result;
  uint64_t v18;
  int v19;
  unint64_t v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v45;
  int v46;
  unsigned int v47;
  int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  int v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t i;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  unint64_t v80;
  uint64_t *v81;
  unint64_t v82;
  uint64_t *v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  char *v95;
  _BOOL4 v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  int v115;
  uint64_t v116;
  _QWORD *v117;
  _QWORD *v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void **v123;
  char *v124;
  unint64_t *v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  char *v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  _BYTE *v141;
  char *v142;
  _BYTE *v143;
  unint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  _BYTE *v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  _QWORD *v160;
  _QWORD *v161;
  _QWORD *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  _BYTE *v168;
  char v169;
  char v170;
  char v171;
  char v172;
  char v173;
  char v174;
  char v175;
  _BYTE *v176;
  BOOL v177;
  char v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t *v181;
  uint64_t v182;
  unint64_t v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  int v187;
  uint64_t v188;
  unsigned int v189;
  unsigned int v190;
  unsigned int v191;
  uint64_t v192;
  int v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  unint64_t v199;
  uint64_t v200;
  unint64_t v201;
  uint64_t v202;
  int v203;
  uint64_t v204;
  unint64_t v205;
  char *v206;
  unint64_t v207;
  char *v208;
  uint64_t v209;
  char *v210;
  uint64_t v211;
  _QWORD *v212;
  _QWORD *v213;
  _QWORD *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  char *v219;
  unint64_t v220;
  uint64_t v221;
  int v222;
  uint64_t v223;
  unsigned int v224;
  unsigned int v225;
  unsigned int v226;
  uint64_t v227;
  char *v228;
  char *v229;
  uint64_t v230;
  char v231;
  char v232;
  char v233;
  char v234;
  char v235;
  char v236;
  char *v237;
  unint64_t v238;
  unint64_t v239;
  unint64_t v240;
  uint64_t v241;
  int v242;
  uint64_t v243;
  unsigned int v244;
  unsigned int v245;
  unsigned int v246;
  uint64_t v247;
  _BYTE *v248;
  unint64_t v249;
  unint64_t v250;
  unint64_t v251;
  uint64_t v252;
  uint64_t *v253;
  uint64_t *v254;
  int *v255;
  uint64_t v256;
  _BYTE *v257;
  char v258;
  unsigned int v259;
  unsigned int v260;
  uint64_t v261;
  unsigned int v262;
  unsigned int v263;
  uint64_t v264;
  uint64_t v265;
  unsigned int v266;
  unsigned int v267;
  uint64_t v268;
  uint64_t v269;
  _DWORD *v270;
  unint64_t v271;
  uint64_t v272;
  uint64_t v273;
  unint64_t v274;
  uint64_t *v275;
  uint64_t **v276;
  unint64_t v277;
  uint64_t *v278;
  char *v279;
  unint64_t v280;
  unint64_t v281;

  v1 = qword_255D66740 - qword_255D66748 - (_QWORD)&v258;
  qword_255D66748 = 1435369301 * v1 - 0x3FCCDB3BD4E106A1;
  qword_255D66740 = 1435369301 * (v1 ^ 0x3FCCDB3BD4E106A1);
  v2 = dword_255D67230++;
  v3 = qword_255D67220[v2 & 1];
  if (!v3)
    return 0;
  if ((*(_BYTE *)(v3 + 880) & 2) != 0)
  {
    v5 = (unsigned int *)(v3 + 884);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(1u, v5));
    if (v6)
    {
      v7 = 0;
      while (1)
      {
        if (!*v5)
        {
          do
            v8 = __ldaxr(v5);
          while (__stlxr(1u, v5));
          if (!v8)
            break;
        }
        if ((++v7 & 0x3F) == 0)
          sched_yield();
      }
    }
  }
  if (a1 <= 0xE0)
  {
    v9 = (a1 + 31) & 0xFFFFFFFFFFFFFFF0;
    if (a1 < 0xF)
      v9 = 32;
    v10 = v9 >> 3;
    v11 = *(unsigned int *)v3;
    v12 = v11 >> ((v9 >> 3) & 0xFE);
    if ((v12 & 3) != 0)
    {
      v13 = ((v11 >> ((v9 >> 3) & 0xFE)) & 1 | v10) ^ 1;
      v14 = v3 + 16 * v13;
      v15 = v14 + 72;
      v16 = *(_QWORD *)(v14 + 88);
      result = (_QWORD *)(v16 + 16);
      v18 = *(_QWORD *)(v16 + 16);
      if (v15 == v18)
      {
        *(_DWORD *)v3 = v11 & ~(1 << v13);
      }
      else
      {
        *(_QWORD *)(v18 + 24) = v15;
        *(_QWORD *)(v15 + 16) = v18;
      }
      *(_QWORD *)(v16 + 8) = (8 * v13) | 3;
      v35 = (uint64_t *)(v16 + 8 * v13);
LABEL_30:
      v35[1] |= 1uLL;
      *v35 = qword_255D671F0 ^ v3;
      goto LABEL_99;
    }
    if (v9 > *(_QWORD *)(v3 + 8))
    {
      if ((_DWORD)v12)
      {
        v22 = ((_DWORD)v12 << v10) & ((2 << v10) | -(2 << v10));
        v23 = (v22 - 1) & ~v22;
        v24 = (v23 >> 12) & 0x10;
        v25 = v23 >> v24;
        v26 = v24 & 0xFFFFFFF0 | (v25 >> 5) & 0xF;
        v27 = v25 >> ((v25 >> 5) & 8);
        v28 = v26 & 0xFFFFFFF8 | (v27 >> 2) & 7;
        v29 = v27 >> ((v27 >> 2) & 4);
        v30 = (v28 & 0xFFFFFFFC | (v29 >> 1) & 2 | (v29 >> ((v29 >> 1) & 2) >> 1) & 1)
            + (v29 >> ((v29 >> 1) & 2) >> (((v29 >> ((v29 >> 1) & 2)) & 2) != 0));
        v31 = v3 + 16 * v30;
        v32 = v31 + 72;
        v33 = *(_QWORD *)(v31 + 88);
        result = (_QWORD *)(v33 + 16);
        v34 = *(_QWORD *)(v33 + 16);
        if (v32 == v34)
        {
          *(_DWORD *)v3 = v11 & ~(1 << v30);
        }
        else
        {
          *(_QWORD *)(v34 + 24) = v32;
          *(_QWORD *)(v32 + 16) = v34;
        }
        v108 = 8 * v30;
        v109 = v108 - v9;
        if (v108 - v9 > 0x1F)
        {
          *(_QWORD *)(v33 + 8) = v9 | 3;
          v110 = (uint64_t *)(v33 + v9);
          *v110 = qword_255D671F0 ^ v3;
          v110[1] = v109 | 1;
          *(_QWORD *)(v33 + v108) = v109;
          v111 = *(_QWORD *)(v3 + 8);
          if (v111)
          {
            v112 = *(_QWORD *)(v3 + 32);
            v113 = v111 >> 3;
            v114 = v3 + ((2 * v111) & 0x7FFFFFFF0) + 72;
            v115 = 1 << v113;
            if ((*(_DWORD *)v3 & v115) != 0)
            {
              v116 = *(_QWORD *)(v114 + 16);
            }
            else
            {
              *(_DWORD *)v3 |= v115;
              v116 = v114;
            }
            *(_QWORD *)(v114 + 16) = v112;
            *(_QWORD *)(v116 + 24) = v112;
            *(_QWORD *)(v112 + 16) = v116;
            *(_QWORD *)(v112 + 24) = v114;
          }
          *(_QWORD *)(v3 + 8) = v109;
          *(_QWORD *)(v3 + 32) = v110;
          goto LABEL_99;
        }
        *(_QWORD *)(v33 + 8) = v108 | 3;
        v35 = (uint64_t *)(v33 + v108);
        goto LABEL_30;
      }
      v58 = *(_DWORD *)(v3 + 4);
      if (v58)
      {
        v59 = (v58 - 1) & ~v58;
        v60 = (v59 >> 12) & 0x10;
        v61 = v59 >> v60;
        v62 = v60 & 0xFFFFFFF0 | (v61 >> 5) & 0xF;
        v63 = v61 >> ((v61 >> 5) & 8);
        v64 = v62 & 0xFFFFFFF8 | (v63 >> 2) & 7;
        v65 = v63 >> ((v63 >> 2) & 4);
        v66 = *(_QWORD *)(v3
                        + 8
                        * ((v64 & 0xFFFFFFFC | (v65 >> 1) & 2 | (v65 >> ((v65 >> 1) & 2) >> 1) & 1)
                         + (v65 >> ((v65 >> 1) & 2) >> (((v65 >> ((v65 >> 1) & 2)) & 2) != 0)))
                        + 600);
        v67 = (*(_QWORD *)(v66 + 8) & 0xFFFFFFFFFFFFFFF8) - v9;
        v68 = 32;
        if (!*(_QWORD *)(v66 + 32))
          v68 = 40;
        for (i = *(_QWORD *)(v66 + v68); i; i = *(_QWORD *)(i + v70))
        {
          if ((*(_QWORD *)(i + 8) & 0xFFFFFFFFFFFFFFF8) - v9 < v67)
          {
            v67 = (*(_QWORD *)(i + 8) & 0xFFFFFFFFFFFFFFF8) - v9;
            v66 = i;
          }
          if (*(_QWORD *)(i + 32))
            v70 = 32;
          else
            v70 = 40;
        }
        v71 = *(_QWORD *)(v66 + 48);
        v72 = *(_QWORD **)(v66 + 24);
        if (v72 != (_QWORD *)v66)
        {
          v73 = *(_QWORD *)(v66 + 16);
          *(_QWORD *)(v73 + 24) = v72;
          v72[2] = v73;
          if (!v71)
            goto LABEL_226;
LABEL_186:
          v163 = v3 + 8 * *(unsigned int *)(v66 + 56);
          if (v66 == *(_QWORD *)(v163 + 600))
          {
            *(_QWORD *)(v163 + 600) = v72;
            if (!v72)
            {
              *(_DWORD *)(v3 + 4) &= ~(1 << *(_DWORD *)(v66 + 56));
              goto LABEL_226;
            }
          }
          else
          {
            v164 = 40;
            if (*(_QWORD *)(v71 + 32) == v66)
              v164 = 32;
            *(_QWORD *)(v71 + v164) = v72;
            if (!v72)
              goto LABEL_226;
          }
          v72[6] = v71;
          v165 = *(_QWORD *)(v66 + 32);
          if (v165)
          {
            v72[4] = v165;
            *(_QWORD *)(v165 + 48) = v72;
          }
          v166 = *(_QWORD *)(v66 + 40);
          if (v166)
          {
            v72[5] = v166;
            *(_QWORD *)(v166 + 48) = v72;
          }
          goto LABEL_226;
        }
        v160 = (_QWORD *)(v66 + 40);
        v161 = *(_QWORD **)(v66 + 40);
        if (v161 || (v160 = (_QWORD *)(v66 + 32), (v161 = *(_QWORD **)(v66 + 32)) != 0))
        {
          do
          {
            do
            {
              v162 = v160;
              v72 = v161;
              v160 = v161 + 5;
              v161 = (_QWORD *)v161[5];
            }
            while (v161);
            v160 = v72 + 4;
            v161 = (_QWORD *)v72[4];
          }
          while (v161);
          *v162 = 0;
          if (v71)
            goto LABEL_186;
        }
        else
        {
          v72 = 0;
          if (v71)
            goto LABEL_186;
        }
LABEL_226:
        if (v67 > 0x1F)
        {
          *(_QWORD *)(v66 + 8) = v9 | 3;
          *(_QWORD *)(v66 + v9) = qword_255D671F0 ^ v3;
          v198 = v66 + v9;
          *(_QWORD *)(v198 + 8) = v67 | 1;
          *(_QWORD *)(v198 + v67) = v67;
          v199 = *(_QWORD *)(v3 + 8);
          if (v199)
          {
            v200 = *(_QWORD *)(v3 + 32);
            v201 = v199 >> 3;
            v202 = v3 + ((2 * v199) & 0x7FFFFFFF0) + 72;
            v203 = 1 << v201;
            if ((*(_DWORD *)v3 & v203) != 0)
            {
              v204 = *(_QWORD *)(v202 + 16);
            }
            else
            {
              *(_DWORD *)v3 |= v203;
              v204 = v202;
            }
            *(_QWORD *)(v202 + 16) = v200;
            *(_QWORD *)(v204 + 24) = v200;
            *(_QWORD *)(v200 + 16) = v204;
            *(_QWORD *)(v200 + 24) = v202;
          }
          *(_QWORD *)(v3 + 8) = v67;
          *(_QWORD *)(v3 + 32) = v198;
          result = (_QWORD *)(v66 + 16);
        }
        else
        {
          v196 = v67 + v9;
          *(_QWORD *)(v66 + 8) = v196 | 3;
          v197 = (uint64_t *)(v66 + v196);
          v197[1] |= 1uLL;
          *v197 = qword_255D671F0 ^ v3;
          result = (_QWORD *)(v66 + 16);
        }
        goto LABEL_99;
      }
    }
    goto LABEL_76;
  }
  if (a1 > 0xFFFFFFFFFFFFFF7FLL)
  {
    v9 = -1;
    goto LABEL_76;
  }
  v9 = (a1 + 31) & 0xFFFFFFFFFFFFFFF0;
  v19 = *(_DWORD *)(v3 + 4);
  v270 = (_DWORD *)(v3 + 4);
  if (v19)
  {
    v20 = -(uint64_t)v9;
    if (v9 >= 0x100)
    {
      if (v9 >> 24)
      {
        v21 = 31;
      }
      else
      {
        v36 = (a1 + 31) >> 8;
        v37 = ((v36 + 1048320) >> 16) & 8;
        LODWORD(v36) = (_DWORD)v36 << v37;
        LODWORD(v36) = ((_DWORD)v36 << (((v36 + 520192) >> 16) & 4) << (((((_DWORD)v36 << (((v36 + 520192) >> 16) & 4)) + 245760) >> 16) & 2) >> 15)
                     - (((v36 + 520192) >> 16) & 4 | v37 | ((((_DWORD)v36 << (((v36 + 520192) >> 16) & 4))
                                                                                       + 245760) >> 16) & 2);
        v21 = ((v9 >> (v36 + 21)) & 1 | (2 * v36)) + 28;
      }
    }
    else
    {
      v21 = 0;
    }
    v38 = *(_QWORD *)(v3 + 8 * v21 + 600);
    if (v38)
    {
      v39 = 0;
      v40 = 0;
      v41 = 57 - (v21 >> 1);
      if (v21 == 31)
        LOBYTE(v41) = 0;
      v42 = v9 << v41;
      while (1)
      {
        v45 = (*(_QWORD *)(v38 + 8) & 0xFFFFFFFFFFFFFFF8) - v9;
        if (v45 < v20)
        {
          v20 = (*(_QWORD *)(v38 + 8) & 0xFFFFFFFFFFFFFFF8) - v9;
          v40 = v38;
          if (!v45)
            break;
        }
        v43 = *(_QWORD *)(v38 + 40);
        v38 = *(_QWORD *)(v38 + 8 * (v42 >> 63) + 32);
        if (v43 != v38 && v43 != 0)
          v39 = v43;
        v42 *= 2;
        if (!v38)
          goto LABEL_48;
      }
      v39 = v38;
      v40 = v38;
    }
    else
    {
      v39 = 0;
      v40 = 0;
LABEL_48:
      if (!(v39 | v40))
      {
        v46 = ((2 << v21) | -(2 << v21)) & v19;
        if (!v46)
          goto LABEL_76;
        v40 = 0;
        v47 = (v46 - 1) & ~v46;
        v48 = (v47 >> 12) & 0x10;
        v49 = v47 >> v48;
        v50 = v48 & 0xFFFFFFF0 | (v49 >> 5) & 0xF;
        v51 = v49 >> ((v49 >> 5) & 8);
        v52 = v50 & 0xFFFFFFF8 | (v51 >> 2) & 7;
        v53 = v51 >> ((v51 >> 2) & 4);
        v39 = *(_QWORD *)(v3
                        + 8
                        * ((v52 & 0xFFFFFFFC | (v53 >> 1) & 2 | (v53 >> ((v53 >> 1) & 2) >> 1) & 1)
                         + (v53 >> ((v53 >> 1) & 2) >> (((v53 >> ((v53 >> 1) & 2)) & 2) != 0)))
                        + 600);
      }
      if (!v39)
      {
LABEL_58:
        v271 = v20;
        v272 = v40;
        if (!v40 || v271 >= *(_QWORD *)(v3 + 8) - v9)
          goto LABEL_76;
        v273 = v272 + v9;
        v55 = *(_QWORD *)(v272 + 48);
        v56 = *(_QWORD **)(v272 + 24);
        if (v56 == (_QWORD *)v272)
        {
          v117 = (_QWORD *)(v272 + 40);
          v118 = *(_QWORD **)(v272 + 40);
          if (v118 || (v117 = (_QWORD *)(v272 + 32), (v118 = *(_QWORD **)(v272 + 32)) != 0))
          {
            do
            {
              do
              {
                v119 = v117;
                v56 = v118;
                v117 = v118 + 5;
                v118 = (_QWORD *)v118[5];
              }
              while (v118);
              v117 = v56 + 4;
              v118 = (_QWORD *)v56[4];
            }
            while (v118);
            *v119 = 0;
            if (!v55)
              goto LABEL_212;
          }
          else
          {
            v56 = 0;
            if (!v55)
              goto LABEL_212;
          }
        }
        else
        {
          v57 = *(_QWORD *)(v272 + 16);
          *(_QWORD *)(v57 + 24) = v56;
          v56[2] = v57;
          if (!v55)
            goto LABEL_212;
        }
        v120 = v272;
        v121 = v3 + 8 * *(unsigned int *)(v272 + 56);
        if (v272 == *(_QWORD *)(v121 + 600))
        {
          *(_QWORD *)(v121 + 600) = v56;
          if (!v56)
          {
            *v270 &= ~(1 << *(_DWORD *)(v120 + 56));
            goto LABEL_212;
          }
        }
        else
        {
          v122 = 40;
          if (*(_QWORD *)(v55 + 32) == v272)
            v122 = 32;
          *(_QWORD *)(v55 + v122) = v56;
          if (!v56)
          {
LABEL_212:
            if (v271 > 0x1F)
            {
              *(_QWORD *)(v272 + 8) = v9 | 3;
              v182 = v273;
              v183 = v271;
              v184 = v271 | 1;
              *(_QWORD *)v273 = qword_255D671F0 ^ v3;
              *(_QWORD *)(v182 + 8) = v184;
              *(_QWORD *)(v182 + v183) = v183;
              if (v183 > 0xFF)
              {
                v259 = 31;
                if (!(v183 >> 24))
                {
                  v189 = (((v271 >> 8) + 1048320) >> 16) & 8;
                  v190 = (v271 >> 8) << v189;
                  v191 = (v190 << (((v190 + 520192) >> 16) & 4) << ((((v190 << (((v190 + 520192) >> 16) & 4)) + 245760) >> 16) & 2) >> 15)
                       - (((v190 + 520192) >> 16) & 4 | v189 | (((v190 << (((v190 + 520192) >> 16) & 4)) + 245760) >> 16) & 2);
                  v259 = ((v271 >> (v191 + 21)) & 1 | (2 * v191)) + 28;
                }
                v260 = v259;
                v261 = v3 + 8 * v259 + 600;
                v192 = v273;
                *(_DWORD *)(v273 + 56) = v259;
                v257 = (_BYTE *)(v192 + 32);
                v193 = ((85 * ((qword_255D66740 - qword_255D66748) ^ 0xA1)) ^ byte_22D252160[byte_22D252060[(85 * ((qword_255D66740 - qword_255D66748) ^ 0xA1))] ^ 0xEA])
                     + 1092;
LABEL_220:
                v194 = qword_24F86A890[v193] - 12;
                goto LABEL_288;
              }
              v185 = v183 >> 3;
              v186 = v3 + ((2 * v183) & 0x7FFFFFFF0) + 72;
              v187 = 1 << v185;
              if ((v187 & *(_DWORD *)v3) != 0)
              {
                v188 = *(_QWORD *)(v186 + 16);
              }
              else
              {
                *(_DWORD *)v3 |= v187;
                v188 = v186;
              }
              v195 = v273;
              *(_QWORD *)(v186 + 16) = v273;
              *(_QWORD *)(v188 + 24) = v195;
              *(_QWORD *)(v195 + 16) = v188;
              *(_QWORD *)(v195 + 24) = v186;
            }
            else
            {
              v179 = v272;
              v180 = v271 + v9;
              *(_QWORD *)(v272 + 8) = v180 | 3;
              v181 = (uint64_t *)(v179 + v180);
              v181[1] |= 1uLL;
              *v181 = qword_255D671F0 ^ v3;
            }
            v81 = (uint64_t *)v272;
LABEL_98:
            result = v81 + 2;
            goto LABEL_99;
          }
        }
        v56[6] = v55;
        v150 = *(_QWORD *)(v272 + 32);
        if (v150)
        {
          v56[4] = v150;
          *(_QWORD *)(v150 + 48) = v56;
        }
        v151 = *(_QWORD *)(v272 + 40);
        if (v151)
        {
          v56[5] = v151;
          *(_QWORD *)(v151 + 48) = v56;
        }
        goto LABEL_212;
      }
    }
    do
    {
      if ((*(_QWORD *)(v39 + 8) & 0xFFFFFFFFFFFFFFF8) - v9 < v20)
      {
        v20 = (*(_QWORD *)(v39 + 8) & 0xFFFFFFFFFFFFFFF8) - v9;
        v40 = v39;
      }
      if (*(_QWORD *)(v39 + 32))
        v54 = 32;
      else
        v54 = 40;
      v39 = *(_QWORD *)(v39 + v54);
    }
    while (v39);
    goto LABEL_58;
  }
LABEL_76:
  v274 = v9;
  v74 = *(_QWORD *)(v3 + 8);
  if (v9 <= v74)
  {
    v80 = v74 - v274;
    v81 = *(uint64_t **)(v3 + 32);
    if (v74 - v274 < 0x20)
    {
      *(_QWORD *)(v3 + 8) = 0;
      *(_QWORD *)(v3 + 32) = 0;
      v81[1] = v74 | 3;
      v83 = (uint64_t *)((char *)v81 + v74);
      *(uint64_t *)((char *)v81 + v74 + 8) |= 1uLL;
    }
    else
    {
      v82 = v274;
      v83 = (uint64_t *)((char *)v81 + v274);
      *(_QWORD *)(v3 + 32) = (char *)v81 + v274;
      *(_QWORD *)(v3 + 8) = v80;
      v83[1] = v80 | 1;
      *(uint64_t *)((char *)v81 + v74) = v80;
      v81[1] = v82 | 3;
    }
    *v83 = qword_255D671F0 ^ v3;
    goto LABEL_98;
  }
  v75 = *(_QWORD *)(v3 + 16);
  v275 = (uint64_t *)(v3 + 16);
  if (v274 < v75)
  {
    v76 = v274;
    v77 = v75 - v274;
    *v275 = v77;
    v78 = *(_QWORD *)(v3 + 40);
    v79 = (uint64_t *)(v78 + v76);
    *(_QWORD *)(v3 + 40) = v78 + v76;
    v79[1] = v77 | 1;
    *(_QWORD *)(v78 + 8) = v76 | 3;
    *v79 = qword_255D671F0 ^ v3;
    result = (_QWORD *)(v78 + 16);
    goto LABEL_99;
  }
  if (v75)
  {
    if ((*(_DWORD *)(v3 + 880) & 1) != 0 && *((_QWORD *)&xmmword_255D67200 + 1) <= v274)
    {
      v84 = (qword_255D671F8 + v274 + 62) & -qword_255D671F8;
      v85 = *(_QWORD *)(v3 + 872);
      if (!v85 || (v86 = *(_QWORD *)(v3 + 856), v86 + v84 > v86) && v86 + v84 <= v85)
      {
        if (v84 > v274)
        {
          v87 = (char *)mmap(0, (qword_255D671F8 + v274 + 62) & -qword_255D671F8, 3, 4098, -1, 0);
          if (v87 != (char *)-1)
          {
            v88 = -((_DWORD)v87 + 16) & 0xFLL;
            if (((unint64_t)(v87 + 16) & 0xF) == 0)
              v88 = 0;
            v81 = (uint64_t *)&v87[v88];
            *v81 = v88;
            v81[1] = v84 - v88 - 32;
            v89 = &v87[v84 - 32];
            *(_QWORD *)v89 = qword_255D671F0 ^ v3;
            *(_OWORD *)(v89 + 8) = xmmword_22D246A40;
            v90 = *(_QWORD *)(v3 + 24);
            if (!v90 || (unint64_t)v87 < v90)
              *(_QWORD *)(v3 + 24) = v87;
            v91 = *(_QWORD *)(v3 + 856) + v84;
            *(_QWORD *)(v3 + 856) = v91;
            if (v91 > *(_QWORD *)(v3 + 864))
              *(_QWORD *)(v3 + 864) = v91;
            goto LABEL_98;
          }
        }
      }
    }
  }
  result = 0;
  v92 = (xmmword_255D67200 + v274 + 95) & -(uint64_t)xmmword_255D67200;
  if (v92 > v274)
  {
    v93 = *(_QWORD *)(v3 + 872);
    if (!v93 || (result = 0, v94 = *(_QWORD *)(v3 + 856), v94 + v92 > v94) && v94 + v92 <= v93)
    {
      v95 = (char *)mmap(0, (xmmword_255D67200 + v274 + 95) & -(uint64_t)xmmword_255D67200, 3, 4098, -1, 0);
      v96 = v95 != (char *)-1;
      if (v95 == (char *)-1)
        v97 = 0;
      else
        v97 = v92;
      if (v95 == (char *)-1)
      {
LABEL_303:
        v255 = __error();
        result = 0;
        *v255 = 12;
        goto LABEL_99;
      }
      v98 = *(_QWORD *)(v3 + 856) + v92;
      *(_QWORD *)(v3 + 856) = v98;
      if (v98 > *(_QWORD *)(v3 + 864))
        *(_QWORD *)(v3 + 864) = v98;
      v99 = *(_QWORD *)(v3 + 40);
      v276 = (uint64_t **)(v3 + 40);
      v277 = v99;
      if (v99)
      {
        v100 = *(_QWORD *)(v3 + 888);
        v101 = *(_QWORD *)(v3 + 896);
        if (v95 == (char *)(v100 + v101)
          && (*(_DWORD *)(v3 + 912) & 9) == 1
          && v277 >= v100
          && v277 < (unint64_t)v95)
        {
          *(_QWORD *)(v3 + 896) = v101 + v92;
          v102 = v275;
          v103 = *v275 + v92;
          v104 = v277;
          if (((v277 + 16) & 0xF) != 0)
            v105 = -((_DWORD)v277 + 16) & 0xFLL;
          else
            v105 = 0;
          v106 = v277 + v105;
          v107 = v103 - v105;
          *v276 = (uint64_t *)v106;
          *v102 = v107;
          *(_QWORD *)(v106 + 8) = v107 | 1;
          *(_QWORD *)(v104 + v103 + 8) = 80;
          *(_QWORD *)(v3 + 48) = qword_255D67210;
          goto LABEL_301;
        }
        v123 = (void **)(v3 + 888);
        if ((unint64_t)v95 < *(_QWORD *)(v3 + 24))
          *(_QWORD *)(v3 + 24) = v95;
        v124 = &v95[v92];
        v125 = (unint64_t *)(v3 + 888);
        if (*v123 == &v95[v92])
        {
          v125 = (unint64_t *)(v3 + 888);
          if ((*(_DWORD *)(v3 + 912) & 9) == 1)
          {
            *(_QWORD *)(v3 + 888) = v95;
            *(_QWORD *)(v3 + 896) += v92;
            if (((unint64_t)(v95 + 16) & 0xF) != 0)
              v126 = -((_DWORD)v95 + 16) & 0xFLL;
            else
              v126 = 0;
            v127 = &v95[v126];
            if (((unint64_t)(v124 + 16) & 0xF) != 0)
              v128 = -((_DWORD)v124 + 16) & 0xFLL;
            else
              v128 = 0;
            v129 = &v124[v128];
            v130 = v274;
            v278 = (uint64_t *)v127;
            v279 = &v127[v274];
            v131 = v129 - v127 - v274;
            *((_QWORD *)v127 + 1) = v274 | 3;
            *(_QWORD *)&v127[v130] = qword_255D671F0 ^ v3;
            if (v129 == (char *)*v276)
            {
              v205 = *v275 + v131;
              *v275 = v205;
              v206 = v279;
              *v276 = (uint64_t *)v279;
              *((_QWORD *)v206 + 1) = v205 | 1;
            }
            else
            {
              if (v129 != *(char **)(v3 + 32))
              {
                v132 = *((_QWORD *)v129 + 1);
                if ((v132 & 3) != 1)
                {
LABEL_261:
                  v280 = v131;
                  *((_QWORD *)v129 + 1) = v132 & 0xFFFFFFFFFFFFFFFELL;
                  v219 = v279;
                  *((_QWORD *)v279 + 1) = v131 | 1;
                  *(_QWORD *)&v219[v131] = v131;
                  if (v131 <= 0xFF)
                  {
                    v220 = v131 >> 3;
                    v221 = v3 + ((2 * v131) & 0x7FFFFFFF0) + 72;
                    v222 = 1 << v220;
                    if ((v222 & *(_DWORD *)v3) != 0)
                    {
                      v223 = *(_QWORD *)(v221 + 16);
                    }
                    else
                    {
                      *(_DWORD *)v3 |= v222;
                      v223 = v221;
                    }
                    v229 = v279;
                    *(_QWORD *)(v221 + 16) = v279;
                    *(_QWORD *)(v223 + 24) = v229;
                    *((_QWORD *)v229 + 2) = v223;
                    *((_QWORD *)v229 + 3) = v221;
                    goto LABEL_270;
                  }
                  v262 = 31;
                  if (!(v131 >> 24))
                  {
                    v224 = (((v280 >> 8) + 1048320) >> 16) & 8;
                    v225 = (v280 >> 8) << v224;
                    v226 = (v225 << (((v225 + 520192) >> 16) & 4) << ((((v225 << (((v225 + 520192) >> 16) & 4)) + 245760) >> 16) & 2) >> 15)
                         - (((v225 + 520192) >> 16) & 4 | v224 | (((v225 << (((v225 + 520192) >> 16) & 4)) + 245760) >> 16) & 2);
                    v262 = ((v280 >> (v226 + 21)) & 1 | (2 * v226)) + 28;
                  }
                  v263 = v262;
                  v227 = v3 + 8 * v262 + 600;
                  v228 = v279;
                  *((_DWORD *)v279 + 14) = v262;
                  v264 = v227;
                  v265 = v3 + 4;
                  v257 = v228 + 32;
                  v193 = ((85 * ((qword_255D66740 + qword_255D66748) ^ 0xA1)) ^ byte_22D252760[byte_22D252660[(85 * ((qword_255D66740 + qword_255D66748) ^ 0xA1))] ^ 0xAC])
                       + 1303;
                  goto LABEL_220;
                }
                v133 = v132 & 0xFFFFFFFFFFFFFFF8;
                if (v132 <= 0xFF)
                {
                  v134 = *((_QWORD *)v129 + 2);
                  v135 = *((_QWORD *)v129 + 3);
                  if (v135 == v134)
                  {
                    *(_DWORD *)v3 &= ~(1 << (v132 >> 3));
                  }
                  else
                  {
                    *(_QWORD *)(v134 + 24) = v135;
                    *(_QWORD *)(v135 + 16) = v134;
                  }
                  goto LABEL_260;
                }
                v209 = *((_QWORD *)v129 + 6);
                v210 = (char *)*((_QWORD *)v129 + 3);
                if (v210 == v129)
                {
                  v212 = v129 + 40;
                  v213 = (_QWORD *)*((_QWORD *)v129 + 5);
                  if (v213 || (v212 = v129 + 32, (v213 = (_QWORD *)*((_QWORD *)v129 + 4)) != 0))
                  {
                    do
                    {
                      do
                      {
                        v214 = v212;
                        v210 = (char *)v213;
                        v212 = v213 + 5;
                        v213 = (_QWORD *)v213[5];
                      }
                      while (v213);
                      v212 = v210 + 32;
                      v213 = (_QWORD *)*((_QWORD *)v210 + 4);
                    }
                    while (v213);
                    *v214 = 0;
                    if (!v209)
                      goto LABEL_260;
                  }
                  else
                  {
                    v210 = 0;
                    if (!v209)
                      goto LABEL_260;
                  }
                }
                else
                {
                  v211 = *((_QWORD *)v129 + 2);
                  *(_QWORD *)(v211 + 24) = v210;
                  *((_QWORD *)v210 + 2) = v211;
                  if (!v209)
                    goto LABEL_260;
                }
                v215 = v3 + 8 * *((unsigned int *)v129 + 14);
                if (v129 != *(char **)(v215 + 600))
                {
                  v216 = 40;
                  if (*(char **)(v209 + 32) == v129)
                    v216 = 32;
                  *(_QWORD *)(v209 + v216) = v210;
                  if (!v210)
                    goto LABEL_260;
                  goto LABEL_254;
                }
                *(_QWORD *)(v215 + 600) = v210;
                if (v210)
                {
LABEL_254:
                  *((_QWORD *)v210 + 6) = v209;
                  v217 = *((_QWORD *)v129 + 4);
                  if (v217)
                  {
                    *((_QWORD *)v210 + 4) = v217;
                    *(_QWORD *)(v217 + 48) = v210;
                  }
                  v218 = *((_QWORD *)v129 + 5);
                  if (v218)
                  {
                    *((_QWORD *)v210 + 5) = v218;
                    *(_QWORD *)(v218 + 48) = v210;
                  }
                  goto LABEL_260;
                }
                *(_DWORD *)(v3 + 4) &= ~(1 << *((_DWORD *)v129 + 14));
LABEL_260:
                v129 += v133;
                v131 += v133;
                v132 = *((_QWORD *)v129 + 1);
                goto LABEL_261;
              }
              v207 = *(_QWORD *)(v3 + 8) + v131;
              *(_QWORD *)(v3 + 8) = v207;
              v208 = v279;
              *(_QWORD *)(v3 + 32) = v279;
              *((_QWORD *)v208 + 1) = v207 | 1;
              *(_QWORD *)&v208[v207] = v207;
            }
LABEL_270:
            v81 = v278;
            goto LABEL_98;
          }
        }
        while (1)
        {
          v136 = *v125;
          if (*v125 <= v277)
          {
            v137 = v125[1];
            v138 = v136 + v137;
            if (v136 + v137 > v277)
              break;
          }
          v125 = (unint64_t *)v125[2];
        }
        if (((v138 - 79) & 0xF) != 0)
          v139 = (79 - (int)v138) & 0xFLL;
        else
          v139 = 0;
        v140 = v138 + v139 - 95;
        v141 = (_BYTE *)(v277 + 32);
        if (v140 >= v277 + 32)
          v142 = (char *)v140;
        else
          v142 = (char *)v277;
        v143 = v142 + 16;
        v144 = v97 - 80;
        if (((unint64_t)(v95 + 16) & 0xF) != 0)
          v145 = -((_DWORD)v95 + 16) & 0xFLL;
        else
          v145 = 0;
        v146 = &v95[v145];
        v147 = v144 - v145;
        *v276 = (uint64_t *)v146;
        *v275 = v147;
        *((_QWORD *)v146 + 1) = v147 | 1;
        *(_QWORD *)&v95[v144 + 8] = 80;
        *(_QWORD *)(v3 + 48) = qword_255D67210;
        *((_QWORD *)v142 + 1) = 51;
        *((_QWORD *)v142 + 6) = qword_255D671F0 ^ v3;
        if (((v143 ^ v123) & 7) != 0)
        {
          v148 = 0;
          do
          {
            v149 = &v143[v148 * 8];
            *v149 = v123[v148];
            v149[1] = BYTE1(v123[v148]);
            v149[2] = BYTE2(v123[v148]);
            v149[3] = BYTE3(v123[v148]);
            v149[4] = BYTE4(v123[v148]);
            v149[5] = BYTE5(v123[v148]);
            v149[6] = BYTE6(v123[v148]);
            v149[7] = HIBYTE(v123[v148++]);
          }
          while ((_DWORD)(v148 * 8) != 32);
        }
        else
        {
          v167 = -(int)v123 & 7;
          v168 = v142 + 16;
          switch((int)v167)
          {
            case 1:
              goto LABEL_206;
            case 2:
              goto LABEL_205;
            case 3:
              goto LABEL_204;
            case 4:
              goto LABEL_203;
            case 5:
              goto LABEL_202;
            case 6:
              goto LABEL_201;
            case 7:
              v169 = *(_BYTE *)v123;
              v123 = (void **)(v3 + 889);
              *v143 = v169;
              v168 = v142 + 17;
LABEL_201:
              v170 = *(_BYTE *)v123;
              v123 = (void **)((char *)v123 + 1);
              *v168++ = v170;
LABEL_202:
              v171 = *(_BYTE *)v123;
              v123 = (void **)((char *)v123 + 1);
              *v168++ = v171;
LABEL_203:
              v172 = *(_BYTE *)v123;
              v123 = (void **)((char *)v123 + 1);
              *v168++ = v172;
LABEL_204:
              v173 = *(_BYTE *)v123;
              v123 = (void **)((char *)v123 + 1);
              *v168++ = v173;
LABEL_205:
              v174 = *(_BYTE *)v123;
              v123 = (void **)((char *)v123 + 1);
              *v168++ = v174;
LABEL_206:
              v175 = *(_BYTE *)v123;
              v123 = (void **)((char *)v123 + 1);
              *v168 = v175;
              v176 = v168 + 1;
              break;
            default:
              v176 = v142 + 16;
              break;
          }
          v177 = v167 <= 0x20;
          v178 = 32 - v167;
          if (!v177)
            v178 = 0;
          v230 = v178 & 7;
          switch(v230)
          {
            case 0:
              break;
            case 1:
              goto LABEL_278;
            case 2:
              goto LABEL_277;
            case 3:
              goto LABEL_276;
            case 4:
              goto LABEL_275;
            case 5:
              goto LABEL_274;
            case 6:
              goto LABEL_273;
            case 7:
              v231 = *(_BYTE *)v123;
              v123 = (void **)((char *)v123 + 1);
              *v176++ = v231;
LABEL_273:
              v232 = *(_BYTE *)v123;
              v123 = (void **)((char *)v123 + 1);
              *v176++ = v232;
LABEL_274:
              v233 = *(_BYTE *)v123;
              v123 = (void **)((char *)v123 + 1);
              *v176++ = v233;
LABEL_275:
              v234 = *(_BYTE *)v123;
              v123 = (void **)((char *)v123 + 1);
              *v176++ = v234;
LABEL_276:
              v235 = *(_BYTE *)v123;
              v123 = (void **)((char *)v123 + 1);
              *v176++ = v235;
LABEL_277:
              v236 = *(_BYTE *)v123;
              v123 = (void **)((char *)v123 + 1);
              *v176++ = v236;
LABEL_278:
              *v176 = *(_BYTE *)v123;
              break;
            default:
              __asm { BR              X2 }
              return result;
          }
        }
        *(_QWORD *)(v3 + 888) = v95;
        *(_QWORD *)(v3 + 896) = v97;
        *(_DWORD *)(v3 + 912) = v96;
        *(_QWORD *)(v3 + 904) = v143;
        v237 = (char *)(v137 + v136);
        if (v137 + v136 <= (unint64_t)(v142 + 64))
          v237 = v142 + 64;
        memset_pattern16(v142 + 56, &unk_22D246A60, ((v237 - v142 - 57) & 0xFFFFFFFFFFFFFFF8) + 8);
        if (v142 != (char *)v277)
        {
          v238 = v277;
          v239 = (unint64_t)&v142[-v277];
          v281 = (unint64_t)&v142[-v277];
          *((_QWORD *)v142 + 1) &= ~1uLL;
          *(_QWORD *)(v238 + 8) = (unint64_t)&v142[-v238] | 1;
          *(_QWORD *)v142 = &v142[-v238];
          if ((unint64_t)&v142[-v238] > 0xFF)
          {
            v266 = 31;
            if (!(v239 >> 24))
            {
              v244 = (((v281 >> 8) + 1048320) >> 16) & 8;
              v245 = (v281 >> 8) << v244;
              v246 = (v245 << (((v245 + 520192) >> 16) & 4) << ((((v245 << (((v245 + 520192) >> 16) & 4)) + 245760) >> 16) & 2) >> 15)
                   - (((v245 + 520192) >> 16) & 4 | v244 | (((v245 << (((v245 + 520192) >> 16) & 4)) + 245760) >> 16) & 2);
              v266 = ((v281 >> (v246 + 21)) & 1 | (2 * v246)) + 28;
            }
            v267 = v266;
            v247 = v3 + 8 * v266 + 600;
            *(_DWORD *)(v277 + 56) = v266;
            v268 = v247;
            v269 = v3 + 4;
            v257 = v141;
            v194 = qword_24F86A890[((85 * ((qword_255D66740 + qword_255D66748) ^ 0xA1)) ^ byte_22D252160[byte_22D252060[(85 * ((qword_255D66740 + qword_255D66748) ^ 0xA1))] ^ 0xA0])
                                 + 1216]
                 - 8;
LABEL_288:
            v256 = v194;
            v248 = v257;
            v249 = -(int)v257 & 7;
            if (v249 > 0x10)
              LODWORD(v249) = 16;
            switch((int)v249)
            {
              case 1:
                goto LABEL_297;
              case 2:
                goto LABEL_296;
              case 3:
                goto LABEL_295;
              case 4:
                goto LABEL_294;
              case 5:
                goto LABEL_293;
              case 6:
                goto LABEL_292;
              case 7:
                *v257 = 0;
                v248 = v257 + 1;
LABEL_292:
                *v248++ = 0;
LABEL_293:
                *v248++ = 0;
LABEL_294:
                *v248++ = 0;
LABEL_295:
                *v248++ = 0;
LABEL_296:
                *v248++ = 0;
LABEL_297:
                *v248++ = 0;
                break;
              default:
                break;
            }
            switch(16 - v249)
            {
              case 0:
                __asm { BR              X8 }
                return result;
              case 1:
                goto LABEL_312;
              case 2:
                goto LABEL_311;
              case 3:
                goto LABEL_310;
              case 4:
                goto LABEL_309;
              case 5:
                goto LABEL_308;
              case 6:
                goto LABEL_307;
              case 7:
                *v248++ = 0;
LABEL_307:
                *v248++ = 0;
LABEL_308:
                *v248++ = 0;
LABEL_309:
                *v248++ = 0;
LABEL_310:
                *v248++ = 0;
LABEL_311:
                *v248++ = 0;
LABEL_312:
                *v248 = 0;
                __asm { BR              X8 }
                return result;
              default:
                __asm { BR              X15 }
                return result;
            }
          }
          v240 = v239 >> 3;
          v241 = v3 + ((2 * v239) & 0x7FFFFFFF0) + 72;
          v242 = 1 << v240;
          if ((v242 & *(_DWORD *)v3) != 0)
          {
            v243 = *(_QWORD *)(v241 + 16);
          }
          else
          {
            *(_DWORD *)v3 |= v242;
            v243 = v241;
          }
          v250 = v277;
          *(_QWORD *)(v241 + 16) = v277;
          *(_QWORD *)(v243 + 24) = v250;
          *(_QWORD *)(v250 + 16) = v243;
          *(_QWORD *)(v250 + 24) = v241;
        }
      }
      else
      {
        v152 = *(_QWORD *)(v3 + 24);
        if (!v152 || (unint64_t)v95 < v152)
          *(_QWORD *)(v3 + 24) = v95;
        *(_QWORD *)(v3 + 888) = v95;
        *(_QWORD *)(v3 + 896) = v92;
        *(_DWORD *)(v3 + 912) = v96;
        v153 = qword_255D671F0;
        *(_QWORD *)(v3 + 56) = 4095;
        *(_QWORD *)(v3 + 64) = v153;
        *(_QWORD *)(v3 + 88) = v3 + 72;
        *(_QWORD *)(v3 + 96) = v3 + 72;
        *(_QWORD *)(v3 + 112) = v3 + 88;
        *(_QWORD *)(v3 + 104) = v3 + 88;
        *(_QWORD *)(v3 + 128) = v3 + 104;
        *(_QWORD *)(v3 + 120) = v3 + 104;
        *(_QWORD *)(v3 + 136) = v3 + 120;
        *(_QWORD *)(v3 + 144) = v3 + 120;
        *(_QWORD *)(v3 + 160) = v3 + 136;
        *(_QWORD *)(v3 + 152) = v3 + 136;
        *(_QWORD *)(v3 + 176) = v3 + 152;
        *(_QWORD *)(v3 + 168) = v3 + 152;
        *(_QWORD *)(v3 + 184) = v3 + 168;
        *(_QWORD *)(v3 + 192) = v3 + 168;
        *(_QWORD *)(v3 + 208) = v3 + 184;
        *(_QWORD *)(v3 + 200) = v3 + 184;
        *(_QWORD *)(v3 + 224) = v3 + 200;
        *(_QWORD *)(v3 + 216) = v3 + 200;
        *(_QWORD *)(v3 + 232) = v3 + 216;
        *(_QWORD *)(v3 + 240) = v3 + 216;
        *(_QWORD *)(v3 + 248) = v3 + 232;
        *(_QWORD *)(v3 + 256) = v3 + 232;
        *(_QWORD *)(v3 + 264) = v3 + 248;
        *(_QWORD *)(v3 + 272) = v3 + 248;
        *(_QWORD *)(v3 + 280) = v3 + 264;
        *(_QWORD *)(v3 + 288) = v3 + 264;
        *(_QWORD *)(v3 + 296) = v3 + 280;
        *(_QWORD *)(v3 + 304) = v3 + 280;
        *(_QWORD *)(v3 + 312) = v3 + 296;
        *(_QWORD *)(v3 + 320) = v3 + 296;
        *(_QWORD *)(v3 + 328) = v3 + 312;
        *(_QWORD *)(v3 + 336) = v3 + 312;
        *(_QWORD *)(v3 + 344) = v3 + 328;
        *(_QWORD *)(v3 + 352) = v3 + 328;
        *(_QWORD *)(v3 + 360) = v3 + 344;
        *(_QWORD *)(v3 + 368) = v3 + 344;
        *(_QWORD *)(v3 + 376) = v3 + 360;
        *(_QWORD *)(v3 + 384) = v3 + 360;
        *(_QWORD *)(v3 + 392) = v3 + 376;
        *(_QWORD *)(v3 + 400) = v3 + 376;
        *(_QWORD *)(v3 + 408) = v3 + 392;
        *(_QWORD *)(v3 + 416) = v3 + 392;
        *(_QWORD *)(v3 + 424) = v3 + 408;
        *(_QWORD *)(v3 + 432) = v3 + 408;
        *(_QWORD *)(v3 + 440) = v3 + 424;
        *(_QWORD *)(v3 + 448) = v3 + 424;
        *(_QWORD *)(v3 + 456) = v3 + 440;
        *(_QWORD *)(v3 + 464) = v3 + 440;
        *(_QWORD *)(v3 + 472) = v3 + 456;
        *(_QWORD *)(v3 + 480) = v3 + 456;
        *(_QWORD *)(v3 + 488) = v3 + 472;
        *(_QWORD *)(v3 + 504) = v3 + 488;
        *(_QWORD *)(v3 + 512) = v3 + 488;
        *(_QWORD *)(v3 + 496) = v3 + 472;
        *(_QWORD *)(v3 + 528) = v3 + 504;
        *(_QWORD *)(v3 + 520) = v3 + 504;
        *(_QWORD *)(v3 + 544) = v3 + 520;
        *(_QWORD *)(v3 + 536) = v3 + 520;
        *(_QWORD *)(v3 + 560) = v3 + 536;
        *(_QWORD *)(v3 + 552) = v3 + 536;
        *(_QWORD *)(v3 + 576) = v3 + 552;
        *(_QWORD *)(v3 + 568) = v3 + 552;
        *(_QWORD *)(v3 + 592) = v3 + 568;
        *(_QWORD *)(v3 + 584) = v3 + 568;
        v154 = v3 + (*(_QWORD *)(v3 - 8) & 0xFFFFFFFFFFFFFFF8);
        v155 = v154 - 16;
        v156 = (uint64_t)&v95[v92 + 16 - v154];
        if ((v154 & 0xF) != 0)
          v157 = -(int)v154 & 0xFLL;
        else
          v157 = 0;
        v158 = (uint64_t *)(v155 + v157);
        v159 = v156 - v157 - 80;
        *v276 = v158;
        *v275 = v159;
        v158[1] = v159 | 1;
        *(_QWORD *)&v95[v92 - 72] = 80;
        *(_QWORD *)(v3 + 48) = qword_255D67210;
      }
LABEL_301:
      if (*v275 > v274)
      {
        v251 = v274;
        v252 = *v275 - v274;
        *v275 = v252;
        v253 = *v276;
        v254 = (uint64_t *)((char *)*v276 + v251);
        *v276 = v254;
        v254[1] = v252 | 1;
        v253[1] = v251 | 3;
        *v254 = qword_255D671F0 ^ v3;
        result = v253 + 2;
        goto LABEL_99;
      }
      goto LABEL_303;
    }
  }
LABEL_99:
  if ((*(_BYTE *)(v3 + 880) & 2) != 0)
    atomic_store(0, (unsigned int *)(v3 + 884));
  return result;
}

unint64_t sub_22D22E174(unint64_t result)
{
  unsigned int *v1;
  unint64_t v2;
  char *v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  unsigned int v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  _BYTE *v44;
  unsigned int v45;
  char **v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  char *v68;
  int v69;
  unint64_t v70;
  char *v71;
  char *v72;
  char **v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  size_t v78;
  size_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char v90;
  _QWORD *v91;
  _QWORD *v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  _BYTE *v102;
  unsigned int v103;
  char **v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  int v109;
  char *v110;
  int v111;
  unint64_t v112;
  char *v113;
  char *v114;
  char **v115;
  char *v116;
  uint64_t v117;

  if (!result)
    return result;
  v2 = result;
  v3 = (char *)(result - 16);
  v4 = qword_255D671F0 ^ *(_QWORD *)(result - 16 + (*(_QWORD *)(result - 8) & 0xFFFFFFFFFFFFFFF8));
  if ((*(_BYTE *)(v4 + 0x370) & 2) != 0)
  {
    v1 = (unsigned int *)(v4 + 884);
    do
      v5 = __ldaxr(v1);
    while (__stlxr(1u, v1));
    if (v5)
    {
      v6 = 0;
      while (1)
      {
        if (!*v1)
        {
          do
            v7 = __ldaxr(v1);
          while (__stlxr(1u, v1));
          if (!v7)
            break;
        }
        if ((++v6 & 0x3F) == 0)
          result = sched_yield();
      }
    }
  }
  v8 = *(_QWORD *)(v2 - 8);
  v9 = v8 & 0xFFFFFFFFFFFFFFF8;
  v10 = &v3[v8 & 0xFFFFFFFFFFFFFFF8];
  if ((v8 & 1) == 0)
  {
    v11 = *(_QWORD *)v3;
    if ((v8 & 3) == 0)
    {
      v14 = v9 + v11 + 32;
      result = munmap(&v3[-v11], v14);
      if (!(_DWORD)result)
        *(_QWORD *)(v4 + 856) -= v14;
      goto LABEL_119;
    }
    v3 -= v11;
    v9 += v11;
    if (v3 != *(char **)(v4 + 32))
    {
      if (v11 <= 0xFF)
      {
        v12 = *((_QWORD *)v3 + 2);
        v13 = *((_QWORD *)v3 + 3);
        if (v13 == v12)
        {
          *(_DWORD *)v4 &= ~(1 << (v11 >> 3));
        }
        else
        {
          *(_QWORD *)(v12 + 24) = v13;
          *(_QWORD *)(v13 + 16) = v12;
        }
        goto LABEL_42;
      }
      v15 = *((_QWORD *)v3 + 6);
      v16 = (char *)*((_QWORD *)v3 + 3);
      if (v16 == v3)
      {
        v18 = v3 + 40;
        v19 = (_QWORD *)*((_QWORD *)v3 + 5);
        if (v19 || (v18 = v3 + 32, (v19 = (_QWORD *)*((_QWORD *)v3 + 4)) != 0))
        {
          do
          {
            do
            {
              v20 = v18;
              v16 = (char *)v19;
              v18 = v19 + 5;
              v19 = (_QWORD *)v19[5];
            }
            while (v19);
            v18 = v16 + 32;
            v19 = (_QWORD *)*((_QWORD *)v16 + 4);
          }
          while (v19);
          *v20 = 0;
          if (!v15)
            goto LABEL_42;
        }
        else
        {
          v16 = 0;
          if (!v15)
            goto LABEL_42;
        }
      }
      else
      {
        v17 = *((_QWORD *)v3 + 2);
        *(_QWORD *)(v17 + 24) = v16;
        *((_QWORD *)v16 + 2) = v17;
        if (!v15)
          goto LABEL_42;
      }
      v21 = v4 + 8 * *((unsigned int *)v3 + 14);
      if (v3 == *(char **)(v21 + 600))
      {
        *(_QWORD *)(v21 + 600) = v16;
        if (!v16)
        {
          *(_DWORD *)(v4 + 4) &= ~(1 << *((_DWORD *)v3 + 14));
          goto LABEL_42;
        }
      }
      else
      {
        v22 = 40;
        if (*(char **)(v15 + 32) == v3)
          v22 = 32;
        *(_QWORD *)(v15 + v22) = v16;
        if (!v16)
          goto LABEL_42;
      }
      *((_QWORD *)v16 + 6) = v15;
      v23 = *((_QWORD *)v3 + 4);
      if (v23)
      {
        *((_QWORD *)v16 + 4) = v23;
        *(_QWORD *)(v23 + 48) = v16;
      }
      v24 = *((_QWORD *)v3 + 5);
      if (v24)
      {
        *((_QWORD *)v16 + 5) = v24;
        *(_QWORD *)(v24 + 48) = v16;
      }
      goto LABEL_42;
    }
    if ((~*((_DWORD *)v10 + 2) & 3) == 0)
    {
      *(_QWORD *)(v4 + 8) = v9;
      *((_QWORD *)v10 + 1) &= ~1uLL;
      *((_QWORD *)v3 + 1) = v9 | 1;
      *(_QWORD *)v10 = v9;
      goto LABEL_119;
    }
  }
LABEL_42:
  v25 = *((_QWORD *)v10 + 1);
  if ((v25 & 2) != 0)
  {
    *((_QWORD *)v10 + 1) = v25 & 0xFFFFFFFFFFFFFFFELL;
    *((_QWORD *)v3 + 1) = v9 | 1;
    *(_QWORD *)&v3[v9] = v9;
LABEL_49:
    if (v9 <= 0xFF)
    {
      v28 = v9 >> 3;
      v29 = v4 + ((2 * v9) & 0x7FFFFFFF0) + 72;
      v30 = 1 << v28;
      if ((*(_DWORD *)v4 & v30) != 0)
      {
        v31 = *(_QWORD *)(v29 + 16);
      }
      else
      {
        *(_DWORD *)v4 |= v30;
        v31 = v29;
      }
      *(_QWORD *)(v29 + 16) = v3;
      *(_QWORD *)(v31 + 24) = v3;
      *((_QWORD *)v3 + 2) = v31;
      *((_QWORD *)v3 + 3) = v29;
      goto LABEL_119;
    }
    if (v9 >> 24)
    {
      v32 = 31;
    }
    else
    {
      v41 = (((v9 >> 8) + 1048320) >> 16) & 8;
      v42 = (v9 >> 8) << v41;
      v43 = (v42 << (((v42 + 520192) >> 16) & 4) << ((((v42 << (((v42 + 520192) >> 16) & 4)) + 245760) >> 16) & 2) >> 15)
          - (((v42 + 520192) >> 16) & 4 | v41 | (((v42 << (((v42 + 520192) >> 16) & 4)) + 245760) >> 16) & 2);
      v32 = ((v9 >> (v43 + 21)) & 1 | (2 * v43)) + 28;
    }
    *((_DWORD *)v3 + 14) = v32;
    v44 = v3 + 32;
    v45 = -((_DWORD)v3 + 32) & 7;
    switch(v45)
    {
      case 1u:
        goto LABEL_74;
      case 2u:
        goto LABEL_73;
      case 3u:
        goto LABEL_72;
      case 4u:
        goto LABEL_71;
      case 5u:
        goto LABEL_70;
      case 6u:
        goto LABEL_69;
      case 7u:
        *v44 = 0;
        v44 = v3 + 33;
LABEL_69:
        *v44++ = 0;
LABEL_70:
        *v44++ = 0;
LABEL_71:
        *v44++ = 0;
LABEL_72:
        *v44++ = 0;
LABEL_73:
        *v44++ = 0;
LABEL_74:
        *v44++ = 0;
        break;
      default:
        break;
    }
    v46 = (char **)(v4 + 8 * v32 + 600);
    v47 = 16 - v45;
    v66 = v47;
    v65 = v47 & 7;
    switch(v66)
    {
      case 0:
        goto LABEL_130;
      case 1:
        goto LABEL_129;
      case 2:
        goto LABEL_128;
      case 3:
        goto LABEL_127;
      case 4:
        goto LABEL_126;
      case 5:
        goto LABEL_125;
      case 6:
        goto LABEL_124;
      case 7:
        *v44++ = 0;
LABEL_124:
        *v44++ = 0;
LABEL_125:
        *v44++ = 0;
LABEL_126:
        *v44++ = 0;
LABEL_127:
        *v44++ = 0;
LABEL_128:
        *v44++ = 0;
LABEL_129:
        *v44 = 0;
LABEL_130:
        v67 = *(_DWORD *)(v4 + 4);
        if ((v67 & (1 << v32)) == 0)
        {
          *(_DWORD *)(v4 + 4) = v67 | (1 << v32);
          *v46 = v3;
          *((_QWORD *)v3 + 6) = v46;
          goto LABEL_139;
        }
        v68 = *v46;
        if (v32 == 31)
          LOBYTE(v69) = 0;
        else
          v69 = 57 - (v32 >> 1);
        v70 = v9 << v69;
        while (1)
        {
          v71 = v68;
          if ((*((_QWORD *)v68 + 1) & 0xFFFFFFFFFFFFFFF8) == v9)
            break;
          v72 = &v68[8 * (v70 >> 63)];
          v74 = (char *)*((_QWORD *)v72 + 4);
          v73 = (char **)(v72 + 32);
          v68 = v74;
          v70 *= 2;
          if (!v74)
          {
            *v73 = v3;
            *((_QWORD *)v3 + 6) = v71;
LABEL_139:
            *((_QWORD *)v3 + 2) = v3;
            *((_QWORD *)v3 + 3) = v3;
            goto LABEL_141;
          }
        }
        v75 = *((_QWORD *)v68 + 2);
        *(_QWORD *)(v75 + 24) = v3;
        *((_QWORD *)v68 + 2) = v3;
        *((_QWORD *)v3 + 2) = v75;
        *((_QWORD *)v3 + 3) = v68;
        *((_QWORD *)v3 + 6) = 0;
LABEL_141:
        v76 = *(_QWORD *)(v4 + 56) - 1;
        *(_QWORD *)(v4 + 56) = v76;
        if (v76)
          goto LABEL_119;
        v49 = 0;
        break;
      default:
        __asm { BR              X16 }
        return result;
    }
LABEL_143:
    v77 = *(_QWORD *)(v4 + 904);
    if (!v77 || (*(_DWORD *)(v77 + 24) & 9) != 1)
    {
      v78 = 0;
      goto LABEL_158;
    }
    v78 = 0;
    result = *(_QWORD *)v77;
    v79 = *(_QWORD *)(v77 + 8);
    v80 = *(_QWORD *)v77 + 16;
    if ((v80 & 0xF) != 0)
      v81 = -(int)v80 & 0xFLL;
    else
      v81 = 0;
    v82 = (char *)(result + v81);
    v83 = *(_QWORD *)(result + v81 + 8);
    v84 = v83 & 0xFFFFFFFFFFFFFFF8;
    if ((v83 & 3) != 1 || result + v81 + (v83 & 0xFFFFFFFFFFFFFFF8) < result + v79 - 80)
    {
LABEL_158:
      *(_QWORD *)(v4 + 56) = 4095;
      if (v2 + v78)
        v90 = 0;
      else
        v90 = v49;
      if ((v90 & 1) != 0 && *(_QWORD *)v1 > *(_QWORD *)(v4 + 48))
        *(_QWORD *)(v4 + 48) = -1;
      goto LABEL_119;
    }
    v86 = *(_QWORD *)(v77 + 16);
    if (v82 == *(char **)(v4 + 32))
    {
      *(_QWORD *)(v4 + 32) = 0;
      *(_QWORD *)(v4 + 8) = 0;
      goto LABEL_181;
    }
    v87 = *((_QWORD *)v82 + 6);
    v88 = (char *)*((_QWORD *)v82 + 3);
    if (v88 == v82)
    {
      v91 = v82 + 40;
      v92 = (_QWORD *)*((_QWORD *)v82 + 5);
      if (v92 || (v91 = v82 + 32, (v92 = (_QWORD *)*((_QWORD *)v82 + 4)) != 0))
      {
        do
        {
          do
          {
            v93 = v91;
            v88 = (char *)v92;
            v91 = v92 + 5;
            v92 = (_QWORD *)v92[5];
          }
          while (v92);
          v91 = v88 + 32;
          v92 = (_QWORD *)*((_QWORD *)v88 + 4);
        }
        while (v92);
        *v93 = 0;
        if (!v87)
          goto LABEL_181;
      }
      else
      {
        v88 = 0;
        if (!v87)
          goto LABEL_181;
      }
    }
    else
    {
      v89 = *((_QWORD *)v82 + 2);
      *(_QWORD *)(v89 + 24) = v88;
      *((_QWORD *)v88 + 2) = v89;
      if (!v87)
        goto LABEL_181;
    }
    v94 = v4 + 8 * *((unsigned int *)v82 + 14);
    if (v82 == *(char **)(v94 + 600))
    {
      *(_QWORD *)(v94 + 600) = v88;
      if (!v88)
      {
        *(_DWORD *)(v4 + 4) &= ~(1 << *((_DWORD *)v82 + 14));
        goto LABEL_181;
      }
    }
    else
    {
      v95 = 40;
      if (*(char **)(v87 + 32) == v82)
        v95 = 32;
      *(_QWORD *)(v87 + v95) = v88;
      if (!v88)
      {
LABEL_181:
        result = munmap((void *)result, v79);
        if ((_DWORD)result)
        {
          if (v83 >= 0x100)
          {
            if (v83 >> 24)
            {
              v98 = 31;
            }
            else
            {
              v99 = (((v83 >> 8) + 1048320) >> 16) & 8;
              v100 = (v83 >> 8) << v99;
              v101 = (v100 << (((v100 + 520192) >> 16) & 4) << ((((v100 << (((v100 + 520192) >> 16) & 4)) + 245760) >> 16) & 2) >> 15)
                   - (((v100 + 520192) >> 16) & 4 | v99 | (((v100 << (((v100 + 520192) >> 16) & 4)) + 245760) >> 16) & 2);
              v98 = ((v84 >> (v101 + 21)) & 1 | (2 * v101)) + 28;
            }
          }
          else
          {
            v98 = 0;
          }
          *((_DWORD *)v82 + 14) = v98;
          v102 = v82 + 32;
          v103 = -((_DWORD)v82 + 32) & 7;
          switch(v103)
          {
            case 1u:
              goto LABEL_195;
            case 2u:
              goto LABEL_194;
            case 3u:
              goto LABEL_193;
            case 4u:
              goto LABEL_192;
            case 5u:
              goto LABEL_191;
            case 6u:
              goto LABEL_190;
            case 7u:
              *v102 = 0;
              v102 = v82 + 33;
LABEL_190:
              *v102++ = 0;
LABEL_191:
              *v102++ = 0;
LABEL_192:
              *v102++ = 0;
LABEL_193:
              *v102++ = 0;
LABEL_194:
              *v102++ = 0;
LABEL_195:
              *v102++ = 0;
              break;
            default:
              break;
          }
          v104 = (char **)(v4 + 8 * v98 + 600);
          v105 = 16 - v103;
          v107 = v105;
          v106 = v105 & 7;
          switch(v107)
          {
            case 0:
              goto LABEL_206;
            case 1:
              goto LABEL_205;
            case 2:
              goto LABEL_204;
            case 3:
              goto LABEL_203;
            case 4:
              goto LABEL_202;
            case 5:
              goto LABEL_201;
            case 6:
              goto LABEL_200;
            case 7:
              *v102++ = 0;
LABEL_200:
              *v102++ = 0;
LABEL_201:
              *v102++ = 0;
LABEL_202:
              *v102++ = 0;
LABEL_203:
              *v102++ = 0;
LABEL_204:
              *v102++ = 0;
LABEL_205:
              *v102 = 0;
LABEL_206:
              v108 = *(_DWORD *)(v4 + 4);
              v109 = 1 << v98;
              if ((v108 & (1 << v98)) == 0)
              {
                v78 = 0;
                *(_DWORD *)(v4 + 4) = v108 | v109;
                *v104 = v82;
                *((_QWORD *)v82 + 6) = v104;
                goto LABEL_215;
              }
              v110 = *v104;
              if (v98 == 31)
                LOBYTE(v111) = 0;
              else
                v111 = 57 - (v98 >> 1);
              v112 = v84 << v111;
              while (1)
              {
                v113 = v110;
                if ((*((_QWORD *)v110 + 1) & 0xFFFFFFFFFFFFFFF8) == v84)
                  break;
                v114 = &v110[8 * (v112 >> 63)];
                v116 = (char *)*((_QWORD *)v114 + 4);
                v115 = (char **)(v114 + 32);
                v110 = v116;
                v112 *= 2;
                if (!v116)
                {
                  v78 = 0;
                  *v115 = v82;
                  *((_QWORD *)v82 + 6) = v113;
LABEL_215:
                  *((_QWORD *)v82 + 2) = v82;
                  *((_QWORD *)v82 + 3) = v82;
                  goto LABEL_158;
                }
              }
              v78 = 0;
              v117 = *((_QWORD *)v110 + 2);
              *(_QWORD *)(v117 + 24) = v82;
              *((_QWORD *)v113 + 2) = v82;
              *((_QWORD *)v82 + 2) = v117;
              *((_QWORD *)v82 + 3) = v113;
              *((_QWORD *)v82 + 6) = 0;
              break;
            default:
              __asm { BR              X15 }
              return result;
          }
        }
        else
        {
          *(_QWORD *)(v4 + 856) -= v79;
          *(_QWORD *)(v4 + 904) = v86;
          v78 = v79;
        }
        goto LABEL_158;
      }
    }
    *((_QWORD *)v88 + 6) = v87;
    v96 = *((_QWORD *)v82 + 4);
    if (v96)
    {
      *((_QWORD *)v88 + 4) = v96;
      *(_QWORD *)(v96 + 48) = v88;
    }
    v97 = *((_QWORD *)v82 + 5);
    if (v97)
    {
      *((_QWORD *)v88 + 5) = v97;
      *(_QWORD *)(v97 + 48) = v88;
    }
    goto LABEL_181;
  }
  if (v10 == *(char **)(v4 + 40))
  {
    v1 = (unsigned int *)(v4 + 16);
    v33 = *(_QWORD *)(v4 + 16) + v9;
    *(_QWORD *)(v4 + 16) = v33;
    *(_QWORD *)(v4 + 40) = v3;
    *((_QWORD *)v3 + 1) = v33 | 1;
    if (v3 == *(char **)(v4 + 32))
    {
      *(_QWORD *)(v4 + 32) = 0;
      *(_QWORD *)(v4 + 8) = 0;
    }
    if (v33 <= *(_QWORD *)(v4 + 48))
      goto LABEL_119;
    v34 = *(_QWORD *)(v4 + 40);
    if (!v34)
      goto LABEL_119;
    if (*(_QWORD *)v1 >= 0x51uLL)
    {
      v2 = ((*(_QWORD *)v1 + (_QWORD)xmmword_255D67200 - 81) / (unint64_t)xmmword_255D67200 - 1)
         * xmmword_255D67200;
      v35 = v4 + 888;
      v36 = v4 + 888;
      do
      {
        if (*(_QWORD *)v36 <= v34 && *(_QWORD *)v36 + *(_QWORD *)(v36 + 8) > v34)
          break;
        v36 = *(_QWORD *)(v36 + 16);
      }
      while (v36);
      if ((*(_DWORD *)(v36 + 24) & 9) == 1)
      {
        v37 = *(_QWORD *)(v36 + 8);
        v38 = v37 - v2;
        if (v37 >= v2)
        {
          v39 = *(_QWORD *)v36;
          v40 = *(_QWORD *)v36 + v37;
          while (v35 < v39 || v35 >= v40)
          {
            v35 = *(_QWORD *)(v35 + 16);
            if (!v35)
            {
              result = munmap((void *)(v39 + v38), ((*(_QWORD *)v1 + (_QWORD)xmmword_255D67200 - 81) / (unint64_t)xmmword_255D67200 - 1)* xmmword_255D67200);
              v49 = 1;
              if (v2)
              {
                if ((_DWORD)result)
                {
                  v2 = 0;
                }
                else
                {
                  *(_QWORD *)(v36 + 8) -= v2;
                  *(_QWORD *)(v4 + 856) -= v2;
                  v60 = *(_QWORD *)(v4 + 40);
                  v61 = *(_QWORD *)(v4 + 16) - v2;
                  if (((v60 + 16) & 0xF) != 0)
                    v62 = -((_DWORD)v60 + 16) & 0xFLL;
                  else
                    v62 = 0;
                  v63 = v60 + v62;
                  v64 = v61 - v62;
                  *(_QWORD *)(v4 + 40) = v63;
                  *(_QWORD *)(v4 + 16) = v64;
                  *(_QWORD *)(v63 + 8) = v64 | 1;
                  *(_QWORD *)(v60 + v61 + 8) = 80;
                  *(_QWORD *)(v4 + 48) = qword_255D67210;
                }
              }
              goto LABEL_143;
            }
          }
        }
      }
    }
    v2 = 0;
    v49 = 1;
    goto LABEL_143;
  }
  if (v10 == *(char **)(v4 + 32))
  {
    v48 = *(_QWORD *)(v4 + 8) + v9;
    *(_QWORD *)(v4 + 8) = v48;
    *(_QWORD *)(v4 + 32) = v3;
    *((_QWORD *)v3 + 1) = v48 | 1;
    *(_QWORD *)&v3[v48] = v48;
    goto LABEL_119;
  }
  v9 += v25 & 0xFFFFFFFFFFFFFFF8;
  if (v25 <= 0xFF)
  {
    v27 = *((_QWORD *)v10 + 2);
    v26 = *((_QWORD *)v10 + 3);
    if (v26 == v27)
    {
      *(_DWORD *)v4 &= ~(1 << (v25 >> 3));
    }
    else
    {
      *(_QWORD *)(v27 + 24) = v26;
      *(_QWORD *)(v26 + 16) = v27;
    }
    goto LABEL_104;
  }
  v50 = *((_QWORD *)v10 + 6);
  v51 = (char *)*((_QWORD *)v10 + 3);
  if (v51 == v10)
  {
    v53 = v10 + 40;
    v54 = (_QWORD *)*((_QWORD *)v10 + 5);
    if (v54 || (v53 = v10 + 32, (v54 = (_QWORD *)*((_QWORD *)v10 + 4)) != 0))
    {
      do
      {
        do
        {
          v55 = v53;
          v51 = (char *)v54;
          v53 = v54 + 5;
          v54 = (_QWORD *)v54[5];
        }
        while (v54);
        v53 = v51 + 32;
        v54 = (_QWORD *)*((_QWORD *)v51 + 4);
      }
      while (v54);
      *v55 = 0;
      if (!v50)
        goto LABEL_104;
    }
    else
    {
      v51 = 0;
      if (!v50)
        goto LABEL_104;
    }
  }
  else
  {
    v52 = *((_QWORD *)v10 + 2);
    *(_QWORD *)(v52 + 24) = v51;
    *((_QWORD *)v51 + 2) = v52;
    if (!v50)
      goto LABEL_104;
  }
  v56 = v4 + 8 * *((unsigned int *)v10 + 14);
  if (v10 == *(char **)(v56 + 600))
  {
    *(_QWORD *)(v56 + 600) = v51;
    if (!v51)
    {
      *(_DWORD *)(v4 + 4) &= ~(1 << *((_DWORD *)v10 + 14));
      goto LABEL_104;
    }
    goto LABEL_99;
  }
  v57 = 40;
  if (*(char **)(v50 + 32) == v10)
    v57 = 32;
  *(_QWORD *)(v50 + v57) = v51;
  if (v51)
  {
LABEL_99:
    *((_QWORD *)v51 + 6) = v50;
    v58 = *((_QWORD *)v10 + 4);
    if (v58)
    {
      *((_QWORD *)v51 + 4) = v58;
      *(_QWORD *)(v58 + 48) = v51;
    }
    v59 = *((_QWORD *)v10 + 5);
    if (v59)
    {
      *((_QWORD *)v51 + 5) = v59;
      *(_QWORD *)(v59 + 48) = v51;
    }
  }
LABEL_104:
  *((_QWORD *)v3 + 1) = v9 | 1;
  *(_QWORD *)&v3[v9] = v9;
  if (v3 != *(char **)(v4 + 32))
    goto LABEL_49;
  *(_QWORD *)(v4 + 8) = v9;
LABEL_119:
  if ((*(_BYTE *)(v4 + 880) & 2) != 0)
    atomic_store(0, (unsigned int *)(v4 + 884));
  return result;
}

uint64_t sub_22D22ED1C(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = sub_22D22C670(0x10uLL);
  if (v2)
    v3 = 0;
  else
    v3 = 0xFFFFFFFFLL;
  *a1 = v2;
  return v3;
}

double sub_22D22ED50(uint64_t a1, __int128 *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  __int128 *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  if (a3)
  {
    if (a3 < 8
      || a3 - 1 > 0xF
      || (~(_DWORD)a4 & 0xFu) < (((_BYTE)a3 - 1) & 0xFu)
      || (unint64_t)a2 - a1 - (a4 & 0xF) < 0x20)
    {
      v4 = a4;
      v5 = a2;
      goto LABEL_4;
    }
    v6 = a3;
    if (a3 >= 0x20)
    {
      v7 = a3 & 0xFFFFFFE0;
      v8 = (__int128 *)(a1 + (a4 & 0xF));
      v9 = *v8;
      v10 = v8[1];
      *a2 = *v8;
      a2[1] = v10;
      if (v7 == a3)
        return *(double *)&v9;
      if ((a3 & 0x18) == 0)
      {
        a3 -= v7;
        v5 = (__int128 *)((char *)a2 + v7);
        v4 = a4 + v7;
        goto LABEL_4;
      }
    }
    else
    {
      v7 = 0;
    }
    v4 = a4 + (a3 & 0xFFFFFFF8);
    v5 = (__int128 *)((char *)a2 + (a3 & 0xFFFFFFF8));
    a3 -= a3 & 0xFFFFFFF8;
    v11 = (_QWORD *)((char *)a2 + v7);
    v12 = v7 + a4;
    v13 = v7 - (v6 & 0xFFFFFFF8);
    do
    {
      *(_QWORD *)&v9 = *(_QWORD *)(a1 + (v12 & 0xF));
      *v11++ = v9;
      v12 += 8;
      v13 += 8;
    }
    while (v13);
    if ((v6 & 0xFFFFFFF8) == v6)
      return *(double *)&v9;
    do
    {
LABEL_4:
      *(_BYTE *)v5 = *(_BYTE *)(a1 + (v4 & 0xF));
      v5 = (__int128 *)((char *)v5 + 1);
      ++v4;
      --a3;
    }
    while (a3);
  }
  return *(double *)&v9;
}

_QWORD *sub_22D22EE3C(_QWORD *result, char *a2, int a3, uint64_t a4)
{
  char v4;

  for (; a3; --a3)
  {
    v4 = *a2++;
    *(_BYTE *)(*result + (a4++ & 0xF)) = v4;
  }
  return result;
}

unint64_t sub_22D22EE60(unint64_t result)
{
  if (result)
    return sub_22D22E174(result);
  return result;
}

uint64_t sub_22D22EE6C(_QWORD **a1)
{
  _BYTE *v2;
  _QWORD *v3;
  _BYTE *v4;
  _QWORD *v5;
  _BYTE *v6;
  _QWORD *v7;
  _BYTE *v8;
  _QWORD *v9;
  _BYTE *v10;
  _QWORD *v11;
  _BYTE *v12;
  _QWORD *v13;
  _BYTE *v14;
  _QWORD *v15;
  _BYTE *v16;
  _QWORD *v17;
  _BYTE *v18;
  _QWORD *v19;
  _BYTE *v20;
  _QWORD *v21;
  _BYTE *v22;
  _QWORD *v23;
  _BYTE *v24;
  _QWORD *v25;
  _BYTE *v26;
  _QWORD *v27;
  _BYTE *v28;
  _QWORD *v29;
  _BYTE *v30;
  _QWORD *v31;
  _BYTE *v32;

  v2 = sub_22D22C670(0x18uLL);
  if (!v2)
    goto LABEL_18;
  v3 = v2;
  *a1 = v2;
  sub_22D22FBB8(v2, 0, 0x10uLL);
  v4 = sub_22D22C670(0x18uLL);
  if (!v4)
    goto LABEL_18;
  v5 = v4;
  *v3 = v4;
  sub_22D22FBB8(v4, 0, 0x10uLL);
  v6 = sub_22D22C670(0x18uLL);
  if (!v6)
    goto LABEL_18;
  v7 = v6;
  *v5 = v6;
  sub_22D22FBB8(v6, 0, 0x10uLL);
  v8 = sub_22D22C670(0x18uLL);
  if (!v8)
    goto LABEL_18;
  v9 = v8;
  *v7 = v8;
  sub_22D22FBB8(v8, 0, 0x10uLL);
  v10 = sub_22D22C670(0x18uLL);
  if (!v10)
    goto LABEL_18;
  v11 = v10;
  *v9 = v10;
  sub_22D22FBB8(v10, 0, 0x10uLL);
  v12 = sub_22D22C670(0x18uLL);
  if (!v12)
    goto LABEL_18;
  v13 = v12;
  *v11 = v12;
  sub_22D22FBB8(v12, 0, 0x10uLL);
  v14 = sub_22D22C670(0x18uLL);
  if (!v14)
    goto LABEL_18;
  v15 = v14;
  *v13 = v14;
  sub_22D22FBB8(v14, 0, 0x10uLL);
  v16 = sub_22D22C670(0x18uLL);
  if (!v16)
    goto LABEL_18;
  v17 = v16;
  *v15 = v16;
  sub_22D22FBB8(v16, 0, 0x10uLL);
  v18 = sub_22D22C670(0x18uLL);
  if (!v18)
    goto LABEL_18;
  v19 = v18;
  *v17 = v18;
  sub_22D22FBB8(v18, 0, 0x10uLL);
  v20 = sub_22D22C670(0x18uLL);
  if (!v20)
    goto LABEL_18;
  v21 = v20;
  *v19 = v20;
  sub_22D22FBB8(v20, 0, 0x10uLL);
  v22 = sub_22D22C670(0x18uLL);
  if (!v22)
    goto LABEL_18;
  v23 = v22;
  *v21 = v22;
  sub_22D22FBB8(v22, 0, 0x10uLL);
  v24 = sub_22D22C670(0x18uLL);
  if (!v24)
    goto LABEL_18;
  v25 = v24;
  *v23 = v24;
  sub_22D22FBB8(v24, 0, 0x10uLL);
  v26 = sub_22D22C670(0x18uLL);
  if (!v26)
    goto LABEL_18;
  v27 = v26;
  *v25 = v26;
  sub_22D22FBB8(v26, 0, 0x10uLL);
  v28 = sub_22D22C670(0x18uLL);
  if (!v28)
    goto LABEL_18;
  v29 = v28;
  *v27 = v28;
  sub_22D22FBB8(v28, 0, 0x10uLL);
  v30 = sub_22D22C670(0x18uLL);
  if (!v30)
    goto LABEL_18;
  v31 = v30;
  *v29 = v30;
  sub_22D22FBB8(v30, 0, 0x10uLL);
  v32 = sub_22D22C670(0x18uLL);
  if (v32)
  {
    *v31 = v32;
    sub_22D22FBB8(v32, 0, 0x10uLL);
    return 0;
  }
  else
  {
LABEL_18:
    sub_22D22F134(*a1);
    *a1 = 0;
    return 0xFFFFFFFFLL;
  }
}

uint64_t *sub_22D22F0A4(uint64_t *result, _BYTE *a2, int a3, uint64_t a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t *v6;
  uint64_t v7;
  BOOL v8;

  for (; a3; --a3)
  {
    v4 = result[1];
    if (v4)
      v5 = v4 == a4;
    else
      v5 = 1;
    v6 = result;
    if (!v5)
    {
      v6 = result;
      do
      {
        v6 = (uint64_t *)*v6;
        v7 = v6[1];
        if (v7)
          v8 = v7 == a4;
        else
          v8 = 1;
      }
      while (!v8);
    }
    *a2++ = *((_BYTE *)v6 + 16);
    ++a4;
  }
  return result;
}

uint64_t *sub_22D22F0F0(uint64_t *result, char *a2, int a3, uint64_t a4)
{
  char v4;
  uint64_t *v5;
  uint64_t v6;
  BOOL v7;

  for (; a3; --a3)
  {
    v4 = *a2;
    v5 = result;
    do
    {
      v5 = (uint64_t *)*v5;
      v6 = v5[1];
      if (v6)
        v7 = v6 == a4;
      else
        v7 = 1;
    }
    while (!v7);
    if (!v6)
      v5[1] = a4;
    *((_BYTE *)v5 + 16) = v4;
    ++a2;
    ++a4;
  }
  return result;
}

_QWORD *sub_22D22F134(_QWORD *result)
{
  _QWORD *v1;

  if (result)
  {
    do
    {
      v1 = (_QWORD *)*result;
      sub_22D22E174((unint64_t)result);
      result = v1;
    }
    while (v1);
  }
  return result;
}

uint64_t sub_22D22F160(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = sub_22D22C670(0x10uLL);
  if (v2)
    v3 = 0;
  else
    v3 = 0xFFFFFFFFLL;
  *a1 = v2;
  return v3;
}

uint64_t sub_22D22F194(uint64_t result, _BYTE *a2, int a3, uint64_t a4)
{
  uint64_t v4;

  if (a3)
  {
    v4 = result + a4 * (result | 1);
    do
    {
      *a2++ = *(_BYTE *)(result + (v4 & 0xF));
      v4 += result | 1;
      --a3;
    }
    while (a3);
  }
  return result;
}

_QWORD *sub_22D22F1BC(_QWORD *result, char *a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  if (a3)
  {
    v4 = *result | 1;
    v5 = *result + v4 * a4;
    do
    {
      v6 = *a2++;
      *(_BYTE *)(*result + (v5 & 0xF)) = v6;
      v5 += v4;
      --a3;
    }
    while (a3);
  }
  return result;
}

unint64_t sub_22D22F1EC(unint64_t result)
{
  if (result)
    return sub_22D22E174(result);
  return result;
}

uint64_t sub_22D22F1F8(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;
  uint64_t i;
  unint64_t *v7;
  char v8;
  int v9;
  _BYTE *v10;
  int v11;
  char v12;
  char v13;
  char v14;
  char v15;
  _QWORD *v18;
  unsigned int v19;

  v1 = a1;
  v19 = a1 ^ sub_22D22F1F8;
  v2 = sub_22D22C670(0x100uLL);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v18 = v1;
    *v1 = v2;
    v5 = (_DWORD)v2 + 2;
    for (i = 1; ; ++i)
    {
      v19 = v5 + v4 * 8 + v19 * &v19;
      v7 = &v3[v4];
      LOBYTE(v3[v4 + 1]) = v19 & 3;
      v8 = v19;
      v9 = (v5 + v4 * 8) & 3;
      v10 = sub_22D22C670(~(-2 << ((v5 + v4 * 8) & 3)));
      if (!v10)
        break;
      if (v9)
      {
        v11 = -1 << v9;
        if ((-1 << v9) >= 0xFFFFFFFE)
          v11 = -2;
        *v10 = ((v8 * v8) ^ 1) & 1;
        if (v9 != 1)
        {
          v12 = (((v8 * v8) ^ 1) * ((v8 * v8) ^ 1)) ^ 1;
          v10[1] = v12 & 1;
          v13 = (v12 * v12) ^ 1;
          v10[2] = v13 & 1;
          if (v11 != -4)
          {
            v14 = (v13 * v13) ^ 1;
            v10[3] = v14 & 1;
            v15 = (v14 * v14) ^ 1;
            v10[4] = v15 & 1;
            if (v11 != -6)
            {
              v10[5] = (v15 & 1) == 0;
              v10[6] = (v15 & 1) != 0;
            }
          }
        }
      }
      v3[v4] = v10;
      v4 += 2;
      if (v4 == 32)
        return 0;
    }
    *v7 = 0;
    v1 = v18;
    do
    {
      if (*v7)
        sub_22D22E174(*v7);
      v7 -= 2;
    }
    while (i-- > 1);
    v2 = v3;
  }
  sub_22D22E174((unint64_t)v2);
  *v1 = 0;
  return 0xFFFFFFFFLL;
}

uint64_t sub_22D22F39C(uint64_t result, _BYTE *a2, int a3, char a4)
{
  int v5;
  uint64_t v7;

  if (a3)
  {
    v5 = a3;
    v7 = result;
    do
    {
      result = sub_22D22F5AC(*(_QWORD *)(v7 + 16 * (a4 & 0xF)), 0, *(unsigned __int8 *)(v7 + 16 * (a4 & 0xF) + 8));
      *a2++ = result;
      ++a4;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t sub_22D22F3F8(uint64_t result, char *a2, int a3, char a4)
{
  int v5;
  _QWORD *v7;
  char v8;

  if (a3)
  {
    v5 = a3;
    v7 = (_QWORD *)result;
    do
    {
      v8 = *a2++;
      result = sub_22D22F500(*(_QWORD *)(*v7 + 16 * (a4 & 0xF)), 0, *(unsigned __int8 *)(*v7 + 16 * (a4 & 0xF) + 8), v8);
      ++a4;
      --v5;
    }
    while (v5);
  }
  return result;
}

unint64_t *sub_22D22F458(unint64_t *result)
{
  unint64_t *v1;

  if (result)
  {
    v1 = result;
    sub_22D22E174(*result);
    sub_22D22E174(v1[2]);
    sub_22D22E174(v1[4]);
    sub_22D22E174(v1[6]);
    sub_22D22E174(v1[8]);
    sub_22D22E174(v1[10]);
    sub_22D22E174(v1[12]);
    sub_22D22E174(v1[14]);
    sub_22D22E174(v1[16]);
    sub_22D22E174(v1[18]);
    sub_22D22E174(v1[20]);
    sub_22D22E174(v1[22]);
    sub_22D22E174(v1[24]);
    sub_22D22E174(v1[26]);
    sub_22D22E174(v1[28]);
    sub_22D22E174(v1[30]);
    return (unint64_t *)sub_22D22E174((unint64_t)v1);
  }
  return result;
}

uint64_t sub_22D22F500(uint64_t result, unsigned int a2, int a3, char a4)
{
  uint64_t v4;
  char v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  BOOL v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  int v14;
  uint64_t v15;
  char v16;

  v4 = result;
  if (a3)
  {
    v5 = &v16 ^ a2;
    v6 = v5 ^ a4;
    v7 = v5 + a4;
    if ((a4 & 1) != 0)
      v7 = v6;
    v8 = *(unsigned __int8 *)(result + a2);
    v9 = v7 ^ a4;
    if (*(_BYTE *)(result + a2))
    {
      v9 = 0;
      v10 = 0;
    }
    else
    {
      v10 = v7;
    }
    v11 = v8 == 1;
    if (v8 == 1)
      v12 = a4 - v7;
    else
      v12 = v9;
    if (v11)
      v13 = v7;
    else
      v13 = v10;
    v14 = 2 * a2;
    v15 = (a3 - 1);
    sub_22D22F500(result, (2 * a2) | 1, v15, v12);
    return sub_22D22F500(v4, (v14 + 2), v15, v13);
  }
  else
  {
    *(_BYTE *)(result + a2) = a4;
  }
  return result;
}

uint64_t sub_22D22F5AC(uint64_t a1, unsigned int a2, int a3)
{
  int v5;
  uint64_t v6;
  char v7;
  char v8;
  unsigned __int8 v9;

  if (a3)
  {
    v5 = 2 * a2;
    v6 = (a3 - 1);
    v7 = sub_22D22F5AC(a1, (2 * a2) | 1, v6);
    v8 = sub_22D22F5AC(a1, (v5 + 2), v6);
    v9 = v8 ^ v7;
    if (*(_BYTE *)(a1 + a2))
      v9 = *(_BYTE *)(a1 + a2);
    if (*(_BYTE *)(a1 + a2) == 1)
      return (v8 + v7);
    else
      return v9;
  }
  else
  {
    return *(unsigned __int8 *)(a1 + a2);
  }
}

unint64_t sub_22D22F638(uint64_t a1, unsigned int a2, int a3)
{
  unint64_t v3;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int i;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int j;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  int v30;
  unsigned int v32;
  char v33[4];

  if ((unint64_t)(a1 - 16777217) >= 0xFFFFFFFFFF000000)
  {
    v7 = (a1 >> 4) + 1;
    while (1)
    {
      v8 = sub_22D22C670(16 * v7 + 31);
      if (!v8)
        break;
      v9 = (unint64_t)v8;
      v10 = (char *)v8 + ((qword_255D671C8 - (_QWORD)v8) & 0xF);
      v11 = (unint64_t)(v10 + 16);
      v3 = ((unint64_t)&v10[-qword_255D671C8 + 16] & 0xFFFFFFFFFFFFFFF0) + qword_255D671D0;
      if (v3)
        v12 = v3 + a1 >= v3;
      else
        v12 = 0;
      if (v12)
      {
        v13 = qword_255D671E0;
        v14 = qword_255D671D8;
        if (qword_255D671E0 == qword_255D671D8)
        {
          v14 = v11 + 16 * v7 + 16;
          v13 = (unint64_t)(v10 + 16);
        }
        if (v11 <= v13)
          v13 = (unint64_t)(v10 + 16);
        qword_255D671E0 = v13;
        if (v11 + 16 * v7 + 16 >= v14)
          v15 = v11 + 16 * v7 + 16;
        else
          v15 = v14;
        qword_255D671D8 = v15;
        if (!((v15 - v13) >> 60))
        {
          v32 = v7;
          v33[0] = (qword_255D671C8 - (_BYTE)v8) & 0xF;
          v16 = qword_255D671C8 + a3 + qword_255D671D0;
          v17 = a2 / 0x21;
          v18 = a2 / 0x21 + 1;
          for (i = a3 & 0xFFFE | 1; ; i /= v21)
          {
            v20 = i <= v17 ? i : v18;
            v21 = i <= v17 ? v18 : i;
            do
            {
              v22 = v21;
              v21 = v20;
              v20 = v22 % v20;
            }
            while (v20);
            if (v21 == 1)
              break;
          }
          for (j = a3 | 1; ; j /= v25)
          {
            v24 = j >= v7 ? v7 : j;
            v25 = j <= v7 ? v7 : j;
            do
            {
              v26 = v25;
              v25 = v24;
              v24 = v26 % v24;
            }
            while (v24);
            if (v25 == 1)
              break;
          }
          v27 = (qword_255D671C8 + a3 + qword_255D671D0);
          v10[8] = v27 % v18;
          if (((*(uint64_t (**)(char *))(qword_255D671E8 + 32 * (v16 % v18)))(v10) & 0x80000000) == 0)
          {
            if (!v32)
            {
LABEL_44:
              (*(void (**)(char *, unsigned int *, uint64_t, uint64_t))(qword_255D671E8
                                                                               + 32 * v10[8]
                                                                               + 16))(v10, &v32, 4, 16);
              (*(void (**)(char *, char *, uint64_t, uint64_t))(qword_255D671E8
                                                                       + 32 * v10[8]
                                                                       + 16))(v10, v33, 1, 20);
              return v3;
            }
            v28 = 0;
            v29 = j % v32;
            while (1)
            {
              v27 = (v27 + i) % v18;
              *(_BYTE *)(v11 + 16 * v29 + 8) = v27;
              if (((*(uint64_t (**)(void))(qword_255D671E8 + 32 * v27))() & 0x80000000) != 0)
                break;
              v29 = (v29 + j) % v32;
              if (++v28 >= v32)
                goto LABEL_44;
            }
            if (v28)
            {
              v30 = -v28;
              do
              {
                v29 = (v29 - j) % v32;
                (*(void (**)(_QWORD))(qword_255D671E8 + 32 * *(unsigned __int8 *)(v11 + 16 * v29 + 8) + 24))(*(_QWORD *)(v11 + 16 * v29));
                v12 = __CFADD__(v30++, 1);
              }
              while (!v12);
            }
          }
        }
        if (v10)
          sub_22D22E174(v9);
        return 0;
      }
    }
  }
  return 0;
}

unint64_t sub_22D22F914(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  int v5;
  _BYTE v6[4];

  if (result)
  {
    v1 = ((result - qword_255D671D0) & 0xFFFFFFFFFFFFFFF0) + qword_255D671C8;
    v2 = v1 - 16;
    (*(void (**)(_QWORD, int *, uint64_t, uint64_t))(qword_255D671E8 + 32 * *(unsigned __int8 *)(v1 - 8) + 8))(*(_QWORD *)(v1 - 16), &v5, 4, 16);
    (*(void (**)(_QWORD, _BYTE *, uint64_t, uint64_t))(qword_255D671E8 + 32 * *(unsigned __int8 *)(v1 - 8) + 8))(*(_QWORD *)(v1 - 16), v6, 1, 20);
    if ((v5 & 0x80000000) == 0)
    {
      v3 = (unsigned __int8 *)(v1 - 8);
      v4 = -1;
      do
      {
        (*(void (**)(_QWORD))(qword_255D671E8 + 32 * *v3 + 24))(*((_QWORD *)v3 - 1));
        ++v4;
        v3 += 16;
      }
      while (v4 < v5);
    }
    return sub_22D22E174(v2 - v6[0]);
  }
  return result;
}

char *sub_22D22F9F8(char *result, char *a2, unint64_t a3)
{
  unint64_t v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  BOOL v11;
  char v12;
  unint64_t v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;

  if (((a2 ^ result) & 7) != 0)
  {
    if ((a3 + 7) >= 8)
      return (char *)((uint64_t (*)(void))((char *)&loc_22D22FACC + 4 * byte_22D246AC4[a3 & 7]))();
  }
  else
  {
    v3 = -(int)result & 7;
    switch((int)v3)
    {
      case 1:
        goto LABEL_11;
      case 2:
        goto LABEL_10;
      case 3:
        goto LABEL_9;
      case 4:
        goto LABEL_8;
      case 5:
        goto LABEL_7;
      case 6:
        goto LABEL_6;
      case 7:
        v4 = *result++;
        *a2++ = v4;
LABEL_6:
        v5 = *result++;
        *a2++ = v5;
LABEL_7:
        v6 = *result++;
        *a2++ = v6;
LABEL_8:
        v7 = *result++;
        *a2++ = v7;
LABEL_9:
        v8 = *result++;
        *a2++ = v8;
LABEL_10:
        v9 = *result++;
        *a2++ = v9;
LABEL_11:
        v10 = *result++;
        *a2++ = v10;
        break;
      default:
        break;
    }
    v11 = a3 >= v3;
    v12 = a3 - v3;
    if (!v11)
      v12 = 0;
    v13 = v12 & 7;
    switch(v13)
    {
      case 0uLL:
        return result;
      case 1uLL:
        goto LABEL_24;
      case 2uLL:
        goto LABEL_23;
      case 3uLL:
        goto LABEL_22;
      case 4uLL:
        goto LABEL_21;
      case 5uLL:
        goto LABEL_20;
      case 6uLL:
        goto LABEL_19;
      case 7uLL:
        v14 = *result++;
        *a2++ = v14;
LABEL_19:
        v15 = *result++;
        *a2++ = v15;
LABEL_20:
        v16 = *result++;
        *a2++ = v16;
LABEL_21:
        v17 = *result++;
        *a2++ = v17;
LABEL_22:
        v18 = *result++;
        *a2++ = v18;
LABEL_23:
        v19 = *result++;
        *a2++ = v19;
LABEL_24:
        *a2 = *result;
        break;
      default:
        result = (char *)((uint64_t (*)(void))((char *)&loc_22D22FB18 + 4 * byte_22D246AD3[(v13 >> 3) & 7]))();
        break;
    }
  }
  return result;
}

_BYTE *sub_22D22FBB8(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -(int)result & 7;
  if (v3 > a3)
    LODWORD(v3) = a3;
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  v4 = a3 - v3;
  v6 = v4;
  v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *result = a2;
      break;
    default:
      result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_22D22FC48 + 4 * byte_22D246AEA[(v5 >> 3) & 7]))();
      break;
  }
  return result;
}

uint64_t sub_22D22FCAC(char a1, unsigned int a2)
{
  return byte_22D251F60[(byte_22D251E60[a2] ^ a1)] ^ a2;
}

uint64_t sub_22D22FCD8(unsigned int a1)
{
  return byte_22D251F60[byte_22D251E60[a1] ^ 0xAF] ^ a1;
}

uint64_t sub_22D22FD04(char a1, unsigned int a2)
{
  return byte_22D252160[(byte_22D252060[a2] ^ a1)] ^ a2;
}

uint64_t sub_22D22FD30(unsigned int a1)
{
  return byte_22D252160[byte_22D252060[a1] ^ 0x16] ^ a1;
}

uint64_t sub_22D22FD5C(char a1, unsigned int a2)
{
  return byte_22D252360[(byte_22D252260[a2] ^ a1)] ^ a2;
}

uint64_t sub_22D22FD88(unsigned int a1)
{
  return byte_22D252360[byte_22D252260[a1] ^ 0x7D] ^ a1;
}

uint64_t sub_22D22FDB4(char a1, unsigned int a2)
{
  return byte_22D252560[(byte_22D252460[a2] ^ a1)] ^ a2;
}

uint64_t sub_22D22FDE0(unsigned int a1)
{
  return byte_22D252560[byte_22D252460[a1] ^ 0x7C] ^ a1;
}

uint64_t sub_22D22FE08(char a1, unsigned int a2)
{
  return byte_22D252760[(byte_22D252660[a2] ^ a1)] ^ a2;
}

uint64_t sub_22D22FE34(unsigned int a1)
{
  return byte_22D252760[byte_22D252660[a1] ^ 0x8D] ^ a1;
}

uint64_t sub_22D22FE60(char a1, unsigned int a2)
{
  return byte_22D252960[(byte_22D252860[a2] ^ a1)] ^ a2;
}

uint64_t sub_22D22FE8C(unsigned int a1)
{
  return byte_22D252960[byte_22D252860[a1] ^ 0xFD] ^ a1;
}

uint64_t sub_22D22FEB8(unsigned int a1)
{
  return byte_22D252760[byte_22D252660[a1] ^ 0xB9] ^ a1;
}

uint64_t sub_22D22FEE4(unsigned int a1)
{
  return byte_22D252160[byte_22D252060[a1] ^ 0xF9] ^ a1;
}

uint64_t sub_22D22FF10(unsigned int a1)
{
  return byte_22D252560[byte_22D252460[a1] ^ 0xBD] ^ a1;
}

uint64_t sub_22D22FF3C(unsigned int a1)
{
  return byte_22D251F60[byte_22D251E60[a1] ^ 0xB5] ^ a1;
}

uint64_t sub_22D22FF68(unsigned int a1)
{
  return byte_22D252160[byte_22D252060[a1] ^ 0xEA] ^ a1;
}

uint64_t sub_22D22FF94(unsigned int a1)
{
  return byte_22D252760[byte_22D252660[a1] ^ 0xAC] ^ a1;
}

uint64_t sub_22D22FFC0(unsigned int a1)
{
  return byte_22D252160[byte_22D252060[a1] ^ 0xA0] ^ a1;
}

uint64_t sub_22D22FFEC(unsigned int a1)
{
  return byte_22D252160[byte_22D252060[a1] ^ 0xDC] ^ a1;
}

uint64_t sub_22D230018(unsigned int a1)
{
  return byte_22D252360[byte_22D252260[a1] ^ 0x84] ^ a1;
}

uint64_t sub_22D230044(unsigned int a1)
{
  return byte_22D251F60[byte_22D251E60[a1] ^ 0xD7] ^ a1;
}

uint64_t sub_22D230070(unsigned int a1)
{
  return byte_22D251F60[byte_22D251E60[a1] ^ 0x10] ^ a1;
}

uint64_t sub_22D230098()
{
  uint64_t v0;

  v0 = ccrng();
  sub_22D23FA5C(v0 != 0, 22, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  sub_22D23FA5C(0, 23, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  return v0;
}

uint64_t sub_22D230104(uint64_t a1, unsigned int a2)
{
  unsigned int (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  _BOOL8 v6;

  v4 = *(unsigned int (**)(uint64_t, _QWORD, uint64_t))sub_22D2438B8();
  v5 = sub_22D2438B8();
  v6 = v4(v5, a2, a1) == 0;
  return sub_22D23FA5C(v6, 31, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
}

uint64_t sub_22D230158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unint64_t a6, _QWORD *a7, unint64_t *a8)
{
  size_t v14;
  size_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t *v37;
  unint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _OWORD __s[4];
  uint64_t v43;

  v39 = a1;
  v40 = a3;
  v43 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  ccaes_cbc_encrypt_mode();
  MEMORY[0x24BDAC7A8]();
  v41 = (char *)&v34 - v14;
  bzero((char *)&v34 - v14, v14);
  MEMORY[0x24BDAC7A8]();
  bzero((char *)&v34 - v15, v15);
  v16 = 0xFFFFFFFFLL;
  if (HIDWORD(a6) || (a6 - 40) < 0xFFFFFFE0)
    goto LABEL_30;
  v37 = &v34;
  v38 = a8;
  v36 = a7;
  if (!a4)
  {
    v18 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v18 || !a8 || *a8 < a6 + 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_31;
    }
    v35 = a6 + 8;
    cccbc_init();
    goto LABEL_15;
  }
  if (a8)
  {
    v17 = *v38;
    v35 = a6 + 8;
    if (v17 >= a6 + 8)
    {
LABEL_15:
      v19 = 0;
      v20 = a6 >> 3;
      if (a6 >> 3 <= 1)
        v21 = 1;
      else
        v21 = v20;
      do
      {
        v22 = *a5++;
        *((_QWORD *)&__s[v19++] + 1) = v22;
      }
      while (v21 != v19);
      v23 = 0;
      *(_QWORD *)&__s[0] = v40;
      v24 = 1;
      v39 = v20;
      do
      {
        v40 = v23;
        v25 = 0;
        v26 = (uint64_t *)__s;
        do
        {
          if (a4)
          {
            if ((a4(1, &unk_255D67290, v26, v26, 16) & 1) == 0)
              goto LABEL_6;
          }
          else
          {
            cccbc_clear_iv();
            sub_22D24043C();
          }
          v27 = *v26;
          v26 += 2;
          v28 = v27 ^ bswap64(v24 + v25++);
          *(_QWORD *)&__s[v25 % v20] = v28;
        }
        while (v21 != v25);
        v23 = v40 + 1;
        v24 += v39;
      }
      while (v40 != 5);
      v29 = v36;
      *v36 = *(_QWORD *)&__s[0];
      v30 = v29 + 1;
      v31 = (uint64_t *)__s + 1;
      do
      {
        v32 = *v31;
        v31 += 2;
        *v30++ = v32;
        --v21;
      }
      while (v21);
      v16 = 0;
      *v38 = v35 & 0xFFFFFFF8;
LABEL_30:
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      if (a4)
        return v16;
LABEL_31:
      cc_clear();
      return v16;
    }
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t sub_22D230464(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unsigned int a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v9;
  unint64_t v11;

  v11 = *a8;
  v9 = sub_22D230158(a1, a2, a3, a4, a5, a6, a7, &v11);
  sub_22D23FA5C(HIDWORD(v11) == 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t sub_22D2304CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t), _QWORD *a5, unint64_t a6, _QWORD *a7, _QWORD *a8)
{
  size_t v14;
  size_t v15;
  uint64_t v16;
  unsigned int v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  unint64_t *v26;
  int v27;
  unsigned int v28;
  BOOL v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t *v38;
  _QWORD *v39;
  unint64_t *v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  char *v44;
  _OWORD __s[4];
  uint64_t v46;

  v43 = a5;
  v41 = a1;
  v46 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  ccaes_cbc_decrypt_mode();
  MEMORY[0x24BDAC7A8]();
  v44 = (char *)&v35 - v14;
  bzero((char *)&v35 - v14, v14);
  MEMORY[0x24BDAC7A8]();
  bzero((char *)&v35 - v15, v15);
  v16 = 0xFFFFFFFFLL;
  if (HIDWORD(a6))
    goto LABEL_33;
  v37 = a3;
  v17 = a6 >> 3;
  if ((a6 >> 3) - 6 < 0xFFFFFFFC)
    goto LABEL_33;
  v38 = &v35;
  v39 = a8;
  v36 = a7;
  v42 = a6;
  if (!a4)
  {
    v18 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v18 || !a8 || *a8 < a6 - 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_34;
    }
    cccbc_init();
    goto LABEL_15;
  }
  if (a8 && *v39 >= v42 - 8)
  {
LABEL_15:
    *(_QWORD *)&__s[0] = *v43;
    v19 = v17 - 1;
    if (v17 != 1)
    {
      v20 = (_QWORD *)__s + 1;
      v21 = v43 + 1;
      v22 = v17 - 1;
      do
      {
        v23 = *v21++;
        *v20 = v23;
        v20 += 2;
        --v22;
      }
      while (v22);
    }
    v24 = 6 * v17 - 6;
    LODWORD(v41) = 1 - v17;
    v25 = 5;
    v40 = (unint64_t *)&__s[v17 - 2];
    do
    {
      LODWORD(v43) = v25;
      if (v42 >= 0x10)
      {
        v26 = v40;
        v27 = v19;
        v28 = v24;
        do
        {
          *v26 = *(_QWORD *)&__s[v27 % v19] ^ bswap64(v28);
          if (a4)
          {
            if ((a4(0, &unk_255D67290, v26, v26, 16) & 1) == 0)
              goto LABEL_6;
          }
          else
          {
            cccbc_clear_iv();
            sub_22D24043C();
          }
          --v28;
          v26 -= 2;
          v29 = __OFSUB__(v27--, 1);
        }
        while (!((v27 < 0) ^ v29 | (v27 == 0)));
      }
      v25 = (_DWORD)v43 - 1;
      v24 += v41;
    }
    while ((_DWORD)v43);
    if (*(_QWORD *)&__s[0] == v37)
    {
      v30 = v36;
      if ((_DWORD)v19)
      {
        v31 = (uint64_t *)__s + 1;
        v32 = v19;
        do
        {
          v33 = *v31;
          v31 += 2;
          *v30++ = v33;
          --v32;
        }
        while (v32);
      }
      v16 = 0;
      *v39 = (8 * v19);
    }
    else
    {
      v16 = 0xFFFFFFFFLL;
    }
LABEL_33:
    memset_s(__s, 0x40uLL, 0, 0x40uLL);
    if (a4)
      return v16;
LABEL_34:
    cc_clear();
    return v16;
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t sub_22D230828(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t), _QWORD *a5, unsigned int a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v9;
  uint64_t v11;

  v11 = *a8;
  v9 = sub_22D2304CC(a1, a2, a3, a4, a5, a6, a7, &v11);
  sub_22D23FA5C(HIDWORD(v11) == 0, 261, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t sub_22D230890(unsigned int a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  int v5;

  v2 = a1 + 15;
  v3 = v2 << 31 >> 31;
  v4 = v3 != v2 || v3 < 0;
  v5 = v4;
  if (!v4)
    *a2 = v3 & 0xFFFFFFF8;
  return v5 ^ 1u;
}

uint64_t sub_22D2308BC(unint64_t a1, unint64_t *a2)
{
  uint64_t v2;
  BOOL v3;
  int v4;

  v2 = a1 >= 0xFFFFFFFFFFFFFFF1;
  v3 = v2 << 63 >> 63 != v2 || v2 << 63 >> 63 == -1;
  v4 = v3;
  if (!v3)
    *a2 = (a1 + 15) & 0xFFFFFFFFFFFFFFF8;
  return v4 ^ 1u;
}

BOOL sub_22D2308EC(unsigned int a1, unsigned int *a2)
{
  unsigned int v2;
  _BOOL8 result;

  v2 = a1 - 8;
  result = a1 > 7;
  *a2 = v2;
  return result;
}

BOOL sub_22D230900(unint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  _BOOL8 result;

  v2 = a1 - 8;
  result = a1 > 7;
  *a2 = v2;
  return result;
}

uint64_t sub_22D230914()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_port_t v13;
  mach_port_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  size_t v19;
  uint64_t input[2];
  _BYTE __s[4096];
  _QWORD v22[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v22[0] = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v18 = __s;
  *((_QWORD *)&v18 + 1) = v22;
  v19 = 4096;
  v12 = 3758097090;
  if (v6 && v4)
  {
    v13 = sub_22D230B74();
    if (!v13)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_new_vek", ":", 179, "", 0, "", "");
      v12 = 3758097084;
      goto LABEL_16;
    }
    v14 = v13;
    if (!ccder_blob_encode_body_tl()
      || !sub_22D242164(&v18, v8)
      || !sub_22D242164(&v18, v10)
      || !sub_22D24227C(&v18, v11)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_14;
    }
    input[0] = *((_QWORD *)&v18 + 1);
    input[1] = (uint64_t)v22 - *((_QWORD *)&v18 + 1);
    v15 = IOConnectCallMethod(v14, 0x4Au, input, 2u, 0, 0, 0, 0, __s, &v19);
    if ((_DWORD)v15)
    {
      v12 = v15;
      goto LABEL_16;
    }
    *(_QWORD *)&v17 = __s;
    *((_QWORD *)&v17 + 1) = &__s[v19];
    if (!ccder_blob_decode_range() || !sub_22D2421D0(&v17, 0, v4))
      goto LABEL_14;
    if (!v2)
    {
      v12 = 0;
      goto LABEL_16;
    }
    v12 = 0;
    if ((sub_22D241FC8(&v17, 0, v2) & 1) == 0)
LABEL_14:
      v12 = 3758097098;
  }
LABEL_16:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v12;
}

uint64_t sub_22D230B74()
{
  uint64_t result;

  if (qword_255D67248 != -1)
    dispatch_once(&qword_255D67248, &unk_24F86EB80);
  dispatch_sync((dispatch_queue_t)qword_255D67250, &unk_24F86EB00);
  result = dword_255D67238;
  if (!dword_255D67238)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_255D67238;
  }
  return result;
}

unint64_t sub_22D230BFC(char *a1, const void *a2, size_t a3)
{
  unint64_t v3;
  int v6;
  int v7;
  ssize_t v8;
  int *v10;
  char *v11;
  int *v12;
  char *v13;

  v3 = (unint64_t)a1;
  if (a1)
  {
    v6 = open_dprotected_np(a1, 1793, 4, 0, 384);
    if (v6 == -1)
    {
      v10 = __error();
      v11 = strerror(*v10);
      syslog(3, "could not create file: %s (%s)\n", (const char *)v3, v11);
      return 0;
    }
    else
    {
      v7 = v6;
      v8 = write(v6, a2, a3);
      v3 = v8 != -1;
      if (v8 == -1)
      {
        v12 = __error();
        v13 = strerror(*v12);
        syslog(3, "failed to write restore bag to disk %s\n", v13);
      }
      close(v7);
    }
  }
  return v3;
}

const char *sub_22D230CCC(char *a1, _QWORD *a2, size_t *a3)
{
  const char *v3;
  size_t st_size;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int *v12;
  char *v13;
  stat v14;

  v3 = a1;
  memset(&v14, 0, sizeof(v14));
  if (a1)
  {
    if (!stat(a1, &v14))
    {
      st_size = v14.st_size;
      v7 = open(v3, 0);
      if (v7 == -1)
      {
        v12 = __error();
        v13 = strerror(*v12);
        syslog(3, "could not open file: %s (%s)\n", v3, v13);
      }
      else
      {
        v8 = v7;
        v9 = calloc(st_size, 1uLL);
        v3 = (const char *)(v9 != 0);
        if (!v9)
        {
LABEL_7:
          close(v8);
          return v3;
        }
        v10 = v9;
        if (read(v8, v9, st_size) == st_size)
        {
          *a2 = v10;
          *a3 = st_size;
          goto LABEL_7;
        }
        close(v8);
        free(v10);
      }
    }
    return 0;
  }
  return v3;
}

uint64_t sub_22D230DD4(unsigned int a1, const void *a2)
{
  mach_port_t v3;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v3 = sub_22D230B74();
  if (v3)
    return IOConnectCallMethod(v3, 0x6Cu, input, 1u, a2, 0x10uLL, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_delete_xart_leak", ":", 268, "", 0, "", "");
  return 3758097084;
}

char *sub_22D230EB8(char *result, uint64_t a2, uint64_t a3)
{
  FTS *v5;
  FTSENT *v6;
  FTSENT *v7;
  int fts_info;
  char *v9[3];

  v9[2] = *(char **)MEMORY[0x24BDAC8D0];
  if (result)
  {
    v9[0] = result;
    v9[1] = 0;
    result = (char *)fts_open(v9, 84, 0);
    if (result)
    {
      v5 = (FTS *)result;
      v6 = fts_read((FTS *)result);
      if (v6)
      {
        v7 = v6;
        do
        {
          fts_info = v7->fts_info;
          if (fts_info != 6)
          {
            if (fts_info == 1)
            {
              if (a2)
              {
                if (((*(uint64_t (**)(uint64_t, FTSENT *))(a2 + 16))(a2, v7) & 1) == 0)
                  fts_set(v5, v7, 4);
              }
            }
            else if (a3 && fts_info == 8)
            {
              (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v7);
            }
          }
          v7 = fts_read(v5);
        }
        while (v7);
      }
      return (char *)fts_close(v5);
    }
  }
  return result;
}

char *sub_22D230FB4(char *result, int a2)
{
  const char *v3;
  _QWORD v4[4];
  int v5;
  _QWORD v6[4];
  int v7;
  char v8[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v3 = result;
    bzero(v8, 0x400uLL);
    result = realpath_DARWIN_EXTSN(v3, v8);
    if (result)
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 0x40000000;
      v6[2] = sub_22D231090;
      v6[3] = &unk_24F86EA40;
      v7 = a2;
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 0x40000000;
      v4[2] = sub_22D231140;
      v4[3] = &unk_24F86EA60;
      v5 = a2;
      return sub_22D230EB8(v8, (uint64_t)v6, (uint64_t)v4);
    }
  }
  return result;
}

uint64_t sub_22D231090(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;

  v4 = sub_22D2310E8(*(const char **)(a2 + 48));
  v5 = *(_DWORD *)(a1 + 32);
  if (v5 == -1 || v4 == v5)
    printf(" dir: %s %i\n", *(const char **)(a2 + 48), v4);
  return 1;
}

uint64_t sub_22D2310E8(const char *a1)
{
  int v1;
  int v2;
  uint64_t v3;

  v1 = open_dprotected_np(a1, 0, 0, 1);
  if (v1 == -1)
    return 0xFFFFFFFFLL;
  v2 = v1;
  v3 = fcntl(v1, 63);
  if ((v2 & 0x80000000) == 0)
    close(v2);
  return v3;
}

uint64_t sub_22D231140(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v5;

  result = sub_22D2310E8(*(const char **)(a2 + 48));
  v5 = *(_DWORD *)(a1 + 32);
  if (v5 == -1 || (_DWORD)result == v5)
    return printf("file: %s %i\n", *(const char **)(a2 + 48), result);
  return result;
}

uint64_t sub_22D231194()
{
  io_registry_entry_t v0;
  io_object_t v1;
  CFTypeRef CFProperty;
  _BOOL4 v3;
  unsigned int v4;
  size_t __len;
  char __big[1024];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v0 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B20], "IODeviceTree:/filesystems");
  if (v0)
  {
    v1 = v0;
    CFProperty = IORegistryEntryCreateCFProperty(v0, CFSTR("e-apfs"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v3 = CFProperty != 0;
    if (CFProperty)
      CFRelease(CFProperty);
    IOObjectRelease(v1);
  }
  else
  {
    v3 = 0;
  }
  __len = 1023;
  bzero(__big, 0x400uLL);
  if ((byte_255D67240 & 1) == 0)
  {
    if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len))
      byte_255D67241 = 1;
    byte_255D67240 = 1;
  }
  v4 = byte_255D67241;
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s ioreg: %d, boot_arg: %d%s\n", "aks", "", "", "", "aks_fs_supports_enhanced_apfs", ":", 437, "", 0, "", v3, byte_255D67241, "");
  return v3 | v4;
}

uint64_t sub_22D231314(const char *a1)
{
  char __str[1024];
  char v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  bzero(v4, 0x400uLL);
  bzero(__str, 0x400uLL);
  if (realpath_DARWIN_EXTSN(a1, v4))
  {
    snprintf(__str, 0x400uLL, "%s/mobile", v4);
    sub_22D2313E4(v4, (uint64_t)&off_24F86D620, 35);
    if ((sub_22D231194() & 1) == 0)
      sub_22D2313E4(__str, (uint64_t)&off_24F86DCB0, 72);
  }
  return 0;
}

void sub_22D2313E4(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  stat v7;
  char __str[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  bzero(__str, 0x400uLL);
  memset(&v7, 0, sizeof(v7));
  if (a3)
  {
    v6 = a2 + 16;
    do
    {
      snprintf(__str, 0x400uLL, "%s%s", a1, *(const char **)(v6 - 16));
      if (stat(__str, &v7))
      {
        printf("stat failed: %s\n");
      }
      else
      {
        sub_22D2310E8(__str);
        printf("%s: mode=%o, u/g=%i:%i class=%i%s\n");
      }
      v6 += 48;
      --a3;
    }
    while (a3);
  }
}

uint64_t sub_22D231524(const char *a1)
{
  char v3[1024];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  bzero(v3, 0x400uLL);
  if (realpath_DARWIN_EXTSN(a1, v3))
    sub_22D2313E4(v3, (uint64_t)&off_24F86DCB0, 72);
  return 0;
}

const char *sub_22D2315A8()
{
  puts("shared allow list:");
  sub_22D2315FC("<var>", (uint64_t)&off_24F86D620, 35);
  puts("user allow list:");
  return sub_22D2315FC("<user>", (uint64_t)&off_24F86DCB0, 72);
}

const char *sub_22D2315FC(const char *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  const char *v4;
  const char **v5;
  const char **v6;
  char v7;

  if (a3)
  {
    v3 = a3;
    v4 = result;
    v5 = (const char **)(a2 + 16);
    v6 = (const char **)(a2 + 16);
    do
    {
      v7 = *(_BYTE *)v6;
      v6 += 6;
      if ((v7 & 1) != 0)
        result = (const char *)printf("%s%s\n", v4, *(v5 - 2));
      v5 = v6;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_22D231664()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t v11;
  mach_port_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  size_t v17;
  uint64_t input[3];
  _BYTE __s[4096];
  uint64_t v20;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v0;
  v20 = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v16 = __s;
  *((_QWORD *)&v16 + 1) = &v20;
  v17 = 4096;
  v10 = 3758097090;
  if (v4 && v2)
  {
    v11 = sub_22D230B74();
    if (v11)
    {
      v12 = v11;
      if (!ccder_blob_encode_body_tl()
        || !sub_22D242164(&v16, v6)
        || !sub_22D24227C(&v16, v9)
        || !ccder_blob_encode_tl())
      {
        goto LABEL_10;
      }
      input[0] = v8;
      input[1] = *((_QWORD *)&v16 + 1);
      input[2] = (uint64_t)&v20 - *((_QWORD *)&v16 + 1);
      v13 = IOConnectCallMethod(v12, 0x4Cu, input, 3u, 0, 0, 0, 0, __s, &v17);
      if ((_DWORD)v13)
      {
        v10 = v13;
        goto LABEL_12;
      }
      *(_QWORD *)&v15 = __s;
      *((_QWORD *)&v15 + 1) = &__s[v17];
      if (!ccder_blob_decode_range() || (v10 = 0, (sub_22D2421D0(&v15, 0, v2) & 1) == 0))
LABEL_10:
        v10 = 3758097098;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_new_kek", ":", 508, "", 0, "", "");
      v10 = 3758097084;
    }
  }
LABEL_12:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v10;
}

uint64_t sub_22D23189C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t v11;
  mach_port_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  size_t v17;
  uint64_t input[2];
  _BYTE __s[4096];
  uint64_t v20;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v0;
  v20 = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v16 = __s;
  *((_QWORD *)&v16 + 1) = &v20;
  v17 = 4096;
  v10 = 3758097090;
  if (v6 && v4)
  {
    v11 = sub_22D230B74();
    if (!v11)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_new_sibling_vek", ":", 543, "", 0, "", "");
      v10 = 3758097084;
      goto LABEL_15;
    }
    v12 = v11;
    if (!ccder_blob_encode_body_tl()
      || !sub_22D242164(&v16, v8)
      || !sub_22D24227C(&v16, v9)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_13;
    }
    input[0] = *((_QWORD *)&v16 + 1);
    input[1] = (uint64_t)&v20 - *((_QWORD *)&v16 + 1);
    v13 = IOConnectCallMethod(v12, 0x63u, input, 2u, 0, 0, 0, 0, __s, &v17);
    if ((_DWORD)v13)
    {
      v10 = v13;
      goto LABEL_15;
    }
    *(_QWORD *)&v15 = __s;
    *((_QWORD *)&v15 + 1) = &__s[v17];
    if (!ccder_blob_decode_range() || !sub_22D2421D0(&v15, 0, v4))
      goto LABEL_13;
    if (!v2)
    {
      v10 = 0;
      goto LABEL_15;
    }
    v10 = 0;
    if ((sub_22D241FC8(&v15, 0, v2) & 1) == 0)
LABEL_13:
      v10 = 3758097098;
  }
LABEL_15:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v10;
}

uint64_t sub_22D231AE8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_port_t v13;
  mach_port_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  size_t v19;
  uint64_t input[2];
  _BYTE __s[4096];
  _QWORD v22[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v22[0] = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v18 = __s;
  *((_QWORD *)&v18 + 1) = v22;
  v19 = 4096;
  v12 = 3758097090;
  if (v8 && v6 && v4 && v2)
  {
    v13 = sub_22D230B74();
    if (v13)
    {
      v14 = v13;
      if (!sub_22D242164(&v18, v4)
        || !ccder_blob_encode_body_tl()
        || !sub_22D242164(&v18, v8)
        || !sub_22D242164(&v18, v10)
        || !sub_22D24227C(&v18, v11)
        || !ccder_blob_encode_tl())
      {
        goto LABEL_14;
      }
      input[0] = *((_QWORD *)&v18 + 1);
      input[1] = (uint64_t)v22 - *((_QWORD *)&v18 + 1);
      v15 = IOConnectCallMethod(v14, 0x4Du, input, 2u, 0, 0, 0, 0, __s, &v19);
      if ((_DWORD)v15)
      {
        v12 = v15;
        goto LABEL_16;
      }
      *(_QWORD *)&v17 = __s;
      *((_QWORD *)&v17 + 1) = &__s[v19];
      if (!ccder_blob_decode_range() || (v12 = 0, (sub_22D2421D0(&v17, 0, v2) & 1) == 0))
LABEL_14:
        v12 = 3758097098;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_rewrap_kek", ":", 582, "", 0, "", "");
      v12 = 3758097084;
    }
  }
LABEL_16:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v12;
}

uint64_t sub_22D231D44()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  mach_port_t v14;
  mach_port_t v15;
  uint64_t v16;
  uint64_t *v18;
  __int128 v19;
  __int128 v20;
  size_t v21;
  uint64_t input[4];
  _BYTE __s[4096];
  _QWORD v24[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v18 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v0;
  v24[0] = *MEMORY[0x24BDAC8D0];
  v13 = 3758097098;
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v20 = __s;
  *((_QWORD *)&v20 + 1) = v24;
  v21 = 4096;
  v14 = sub_22D230B74();
  if (!v14)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_set_protection", ":", 616, "", 0, "", "");
    v13 = 3758097084;
    goto LABEL_14;
  }
  v15 = v14;
  if (sub_22D242164(&v20, v3)
    && sub_22D242164(&v20, v5)
    && sub_22D242164(&v20, v7)
    && sub_22D24227C(&v20, v12)
    && ccder_blob_encode_tl())
  {
    input[0] = v11;
    input[1] = v9;
    input[2] = *((_QWORD *)&v20 + 1);
    input[3] = (uint64_t)v24 - *((_QWORD *)&v20 + 1);
    v16 = IOConnectCallMethod(v15, 0x54u, input, 4u, 0, 0, 0, 0, __s, &v21);
    if ((_DWORD)v16)
    {
      v13 = v16;
      goto LABEL_14;
    }
    *(_QWORD *)&v19 = __s;
    *((_QWORD *)&v19 + 1) = &__s[v21];
    if (!v21)
      goto LABEL_13;
    if (!ccder_blob_decode_range())
      goto LABEL_14;
    if (!v18)
    {
LABEL_13:
      v13 = 0;
      goto LABEL_14;
    }
    v13 = 0;
    if ((sub_22D2421D0(&v19, 0, v18) & 1) == 0)
      v13 = 3758097098;
  }
LABEL_14:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v13;
}

uint64_t sub_22D231F8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  mach_port_t v14;
  mach_port_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  size_t v21;
  uint64_t input[3];
  _BYTE __s[4096];
  _QWORD v24[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = v0;
  v24[0] = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v20 = __s;
  *((_QWORD *)&v20 + 1) = v24;
  v21 = 4096;
  if (!v6)
  {
    v17 = 3758097090;
    goto LABEL_15;
  }
  v14 = sub_22D230B74();
  if (!v14)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_unwrap_vek_with_acm", ":", 653, "", 0, "", "");
    v17 = 3758097084;
    goto LABEL_15;
  }
  v15 = v14;
  if (!sub_22D242164(&v20, v4)
    || !sub_22D242164(&v20, v6)
    || !sub_22D242164(&v20, v8)
    || !sub_22D242164(&v20, v10)
    || !sub_22D24227C(&v20, v13)
    || !ccder_blob_encode_tl())
  {
    goto LABEL_13;
  }
  input[0] = *((_QWORD *)&v20 + 1);
  input[1] = (uint64_t)v24 - *((_QWORD *)&v20 + 1);
  input[2] = v12;
  v16 = IOConnectCallMethod(v15, 0x4Bu, input, 3u, 0, 0, 0, 0, __s, &v21);
  if ((_DWORD)v16)
  {
    v17 = v16;
    goto LABEL_15;
  }
  *(_QWORD *)&v19 = __s;
  *((_QWORD *)&v19 + 1) = &__s[v21];
  if (!ccder_blob_decode_range())
    goto LABEL_13;
  if (!v2)
  {
    v17 = 0;
    goto LABEL_15;
  }
  v17 = 0;
  if ((sub_22D241FC8(&v19, 0, v2) & 1) == 0)
LABEL_13:
    v17 = 3758097098;
LABEL_15:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v17;
}

uint64_t sub_22D2321F4()
{
  return sub_22D231F8C();
}

void sub_22D232200(const char *a1, char a2)
{
  char *v4;
  char *v5;
  uint64_t i;
  char *v7;
  uint64_t k;
  char *v9;
  uint64_t j;
  _QWORD v11[5];
  char v12[1024];
  statfs v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    bzero(&v13, 0x878uLL);
    bzero(v12, 0x400uLL);
    if (realpath_DARWIN_EXTSN(a1, v12))
    {
      v4 = (char *)malloc(0x818uLL);
      memset_s(v4, 0x818uLL, 0, 0x818uLL);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 0x40000000;
      v11[2] = sub_22D23246C;
      v11[3] = &unk_24F86EAC0;
      v11[4] = v4;
      sub_22D230EB8(v12, (uint64_t)&unk_24F86EAA0, (uint64_t)v11);
      if (!statfs(v12, &v13))
      {
        if ((a2 & 1) != 0)
          printf("Free Blocks:%lld blocks of size:%d\n");
        else
          printf("%lld,%d\n");
      }
      v5 = v4 + 340;
      for (i = 1; i != 5; ++i)
      {
        if ((a2 & 1) != 0)
        {
          v9 = &v4[296 * i];
          printf("%s:\n\tNum files:\t%u,\n\tNum hardlinks:\t%u,\n\tNum compressed:\t%u,\n\tTotal Size:\t%lld,\n\tMin File Size:\t%lld,\n\tMax File Size:\t%lld,\n", off_255D66758[i], *(_DWORD *)v9, *((_DWORD *)v9 + 2), *((_DWORD *)v9 + 1), *((_QWORD *)v9 + 2), *((_QWORD *)v9 + 3), *((_QWORD *)v9 + 4));
          printf("\tSize Distribution:");
          printf("%i", *((_DWORD *)v9 + 10));
          for (j = 0; j != 252; j += 4)
          {
            putchar(44);
            printf("%i", *(_DWORD *)&v5[j]);
          }
        }
        else
        {
          v7 = &v4[296 * i];
          printf("%i,%u,%u,%u,%lld,%lld,%lld,", i, *(_DWORD *)v7, *((_DWORD *)v7 + 2), *((_DWORD *)v7 + 1), *((_QWORD *)v7 + 2), *((_QWORD *)v7 + 3), *((_QWORD *)v7 + 4));
          printf("%i", *((_DWORD *)v7 + 10));
          for (k = 0; k != 252; k += 4)
          {
            putchar(44);
            printf("%i", *(_DWORD *)&v5[k]);
          }
        }
        putchar(10);
        v5 += 296;
      }
      free(v4);
    }
  }
}

uint64_t sub_22D232464()
{
  return 1;
}

uint64_t sub_22D23246C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t *v9;
  int64_t v10;
  uint64_t v11;
  int64_t *v12;
  int64_t v13;
  int64_t v14;
  BOOL v15;
  unint64_t v16;

  result = sub_22D2310E8(*(const char **)(a2 + 48));
  if ((result - 7) >= 0xFFFFFFFA)
  {
    v5 = *(_QWORD *)(a2 + 96);
    v6 = *(_QWORD *)(v5 + 96);
    v7 = *(_QWORD *)(a1 + 32);
    ++*(_DWORD *)(v7 + 296 * result);
    if (*(unsigned __int16 *)(v5 + 6) >= 2u)
      ++*(_DWORD *)(v7 + 296 * result + 8);
    if ((*(_BYTE *)(v5 + 116) & 0x20) != 0)
      ++*(_DWORD *)(v7 + 296 * result + 4);
    v8 = v7 + 296 * result;
    v10 = *(_QWORD *)(v8 + 32);
    v9 = (int64_t *)(v8 + 32);
    *(v9 - 2) += v6;
    if (v6 > v10)
      *v9 = v6;
    v11 = v7 + 296 * result;
    v14 = *(_QWORD *)(v11 + 24);
    v12 = (int64_t *)(v11 + 24);
    v13 = v14;
    if (v14)
      v15 = v6 < v13;
    else
      v15 = 1;
    if (v15)
      *v12 = v6;
    if (v6)
      v16 = v7 + 296 * result + 4 * (63 - __clz(v6));
    else
      v16 = v7 + 296 * result;
    ++*(_DWORD *)(v16 + 40);
  }
  return result;
}

uint64_t sub_22D232574(unsigned int a1, uint64_t a2)
{
  mach_port_t v2;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = 1;
  input[1] = a1;
  input[2] = a2;
  output = 0;
  outputCnt = 1;
  v2 = sub_22D230B74();
  if (v2)
    return IOConnectCallMethod(v2, 0x56u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kext_set_options", ":", 820, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23265C(unsigned int a1, uint64_t *a2)
{
  uint64_t v2;
  mach_port_t v4;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v2 = 3758097084;
  if (!a2)
    return 3758097090;
  input[0] = 0;
  input[1] = a1;
  input[2] = 0;
  output = 0;
  outputCnt = 1;
  v4 = sub_22D230B74();
  if (v4)
  {
    v2 = IOConnectCallMethod(v4, 0x56u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
    if (!(_DWORD)v2)
      *a2 = output;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kext_get_options", ":", 841, "", 0, "", "");
  }
  return v2;
}

uint64_t sub_22D232770()
{
  mach_port_t v0;

  v0 = sub_22D230B74();
  if (v0)
    return IOConnectCallMethod(v0, 0x10u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_internal_state", ":", 857, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D232814(unsigned int a1)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v2 = sub_22D230B74();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0x86u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_run_internal_test", ":", 871, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D2328F8()
{
  int v0;
  _DWORD *v1;
  _DWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  int v6;
  const void *v7;
  const void *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  mach_port_t v16;
  uint64_t v17;
  void *v18;
  size_t __count;
  uint64_t input[4];
  _BYTE __src[32768];
  uint64_t v23;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = v0;
  v23 = *MEMORY[0x24BDAC8D0];
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  v16 = sub_22D230B74();
  if (v16)
  {
    input[0] = v15;
    input[1] = v14;
    input[2] = v12;
    input[3] = v10;
    if (!v14 || (v17 = 3758097090, v4) && v2)
    {
      v17 = IOConnectCallMethod(v16, 0x36u, input, 4u, v8, v6, 0, 0, __src, &__count);
      if (!(_DWORD)v17 && v14)
      {
        v18 = calloc(__count, 1uLL);
        *v4 = v18;
        if (v18)
        {
          memcpy(v18, __src, __count);
          v17 = 0;
          *v2 = __count;
        }
        else
        {
          v17 = 3758097085;
        }
      }
    }
  }
  else
  {
    v17 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_escrow", ":", 890, "", 0, "", "");
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v17;
}

void sub_22D232AD0()
{
  if (!dword_255D67238)
    dword_255D67238 = sub_22D2335A8("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
}

uint64_t sub_22D232B0C()
{
  uint64_t result;

  if (qword_255D67248 != -1)
    dispatch_once(&qword_255D67248, &unk_24F86EB80);
  dispatch_sync((dispatch_queue_t)qword_255D67250, &unk_24F86EB40);
  result = dword_255D6723C;
  if (!dword_255D6723C)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStoreTest");
    return dword_255D6723C;
  }
  return result;
}

void sub_22D232B94()
{
  if (!dword_255D6723C)
    dword_255D6723C = sub_22D2335A8("IOService:/IOResources/AppleKeyStoreTest", "AppleKeyStoreTest");
}

uint64_t sub_22D232BD0(mach_port_t a1, const void *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v19;
  uint32_t outputCnt;
  unsigned int outputStruct[256];
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a4;
  input[1] = a3;
  output = 0;
  outputCnt = 1;
  bzero(outputStruct, 0x400uLL);
  v19 = 1024;
  v11 = IOConnectCallMethod(a1, 0xFu, input, 2u, a2, 0x10uLL, &output, &outputCnt, outputStruct, &v19);
  if ((_DWORD)v11)
    return v11;
  v17 = 3758097084;
  if (outputCnt == 1)
  {
    *a7 = output;
    if (sub_22D244330(outputStruct, v19, 3u, v12, v13, v14, v15, v16, a5))
      return 3758097084;
    else
      return 0;
  }
  return v17;
}

uint64_t sub_22D232D04(mach_port_t a1, const void *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7, uint64_t a8, uint64_t a9, _DWORD *a10, uint64_t a11, uint64_t a12, _DWORD *a13)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  size_t v26;
  uint32_t outputCnt;
  unsigned int outputStruct[256];
  uint64_t output;
  uint64_t v30;
  uint64_t v31;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a4;
  input[1] = a3;
  output = 0;
  v30 = 0;
  v31 = 0;
  outputCnt = 3;
  bzero(outputStruct, 0x400uLL);
  v26 = 1024;
  v17 = IOConnectCallMethod(a1, 0x13u, input, 2u, a2, 0x10uLL, &output, &outputCnt, outputStruct, &v26);
  if ((_DWORD)v17)
    return v17;
  v23 = 3758097084;
  if (outputCnt == 3)
  {
    v24 = v30;
    *a7 = output;
    *a10 = v24;
    *a13 = v31;
    if (sub_22D244330(outputStruct, v26, 5u, v18, v19, v20, v21, v22, a5))
      return 3758097084;
    else
      return 0;
  }
  return v23;
}

uint64_t sub_22D232E5C(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, size_t *a8)
{
  uint64_t v11;
  unsigned int inputStructCnt[3];
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 2, a4, a5, a6, (uint64_t)a7, (uint64_t)a8, a2);
  v11 = IOConnectCallMethod(a1, 0x14u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, a7, a8);
  free(*(void **)&inputStructCnt[1]);
  return v11;
}

uint64_t sub_22D232F18(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10, uint64_t a11, unsigned int a12, void *outputStruct, size_t *a14, _DWORD *a15)
{
  uint64_t v16;
  uint64_t v17;
  uint32_t outputCnt;
  unsigned int inputStructCnt[3];
  uint64_t output;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  input[1] = a6;
  input[2] = a9;
  input[3] = a12;
  output = 0;
  outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 4, a4, a5, a6, a7, a8, a2);
  v16 = IOConnectCallMethod(a1, 0x15u, input, 4u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], &output, &outputCnt, outputStruct, a14);
  if ((_DWORD)v16)
  {
    v17 = v16;
  }
  else if (outputCnt == 1)
  {
    v17 = 0;
    *a15 = output;
  }
  else
  {
    v17 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v17;
}

uint64_t sub_22D233028(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
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
  size_t outputStructCnt;
  unsigned int inputStructCnt[3];
  unsigned int outputStruct[256];
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  input[1] = a6;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(outputStruct, 0x400uLL);
  outputStructCnt = 1024;
  sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  v15 = IOConnectCallMethod(a1, 0x10u, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &outputStructCnt);
  if ((_DWORD)v15)
  {
    v21 = v15;
  }
  else if (sub_22D244330(outputStruct, outputStructCnt, 2u, v16, v17, v18, v19, v20, a7))
  {
    v21 = 3758097084;
  }
  else
  {
    v21 = 0;
  }
  free(*(void **)&inputStructCnt[1]);
  return v21;
}

uint64_t sub_22D233160(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10)
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
  size_t v25;
  unsigned int inputStructCnt[3];
  unsigned int outputStruct[256];
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  input[1] = a6;
  input[2] = a9;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(outputStruct, 0x400uLL);
  v25 = 1024;
  sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a2);
  v17 = IOConnectCallMethod(a1, 0x17u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &v25);
  if ((_DWORD)v17)
  {
    v23 = v17;
  }
  else if (sub_22D244330(outputStruct, v25, 2u, v18, v19, v20, v21, v22, a10))
  {
    v23 = 3758097084;
  }
  else
  {
    v23 = 0;
  }
  free(*(void **)&inputStructCnt[1]);
  return v23;
}

uint64_t sub_22D2332A8(mach_port_t a1, void *inputStruct, unsigned int a3)
{
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  return IOConnectCallMethod(a1, 0x11u, input, 1u, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t sub_22D233318(mach_port_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  unsigned int inputStructCnt[3];
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 1, a4, a5, a6, a7, a8, a3);
  v9 = IOConnectCallMethod(a1, 0x12u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t sub_22D2333C4()
{
  int v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  const void *v5;
  const void *v6;
  mach_port_t v7;
  size_t v8;
  uint64_t v9;
  size_t v10;
  void *v11;
  uint64_t v12;
  size_t __count;
  _BYTE __src[32768];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v0;
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  v7 = sub_22D230B74();
  if (v7)
  {
    if (v6)
      v8 = 18;
    else
      v8 = 0;
    v9 = IOConnectCallMethod(v7, 0x5Du, input, 1u, v6, v8, 0, 0, __src, &__count);
    v10 = __count;
    if ((_DWORD)v9)
    {
      v12 = v9;
    }
    else if (__count - 32769 < 0xFFFFFFFFFFFF8000)
    {
      v12 = 3758097090;
    }
    else
    {
      v11 = calloc(__count, 1uLL);
      *v4 = v11;
      v10 = __count;
      if (v11)
      {
        *v2 = __count;
        memcpy(v11, __src, v10);
        v12 = 0;
        v10 = __count;
      }
      else
      {
        v12 = 3758097085;
      }
    }
  }
  else
  {
    v12 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_internal_info_for_key", ":", 1246, "", 0, "", "");
    v10 = 0x8000;
  }
  memset_s(__src, v10, 0, v10);
  return v12;
}

dispatch_queue_t sub_22D233580()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("aks-client-queue", 0);
  qword_255D67250 = (uint64_t)result;
  return result;
}

uint64_t sub_22D2335A8(char *path, const char *a2)
{
  mach_port_t v3;
  io_service_t v4;
  task_port_t *v5;
  io_object_t v6;
  kern_return_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  v3 = *MEMORY[0x24BDD8B20];
  v4 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B20], path);
  v5 = (task_port_t *)MEMORY[0x24BDAEC58];
  if (!v4 || (v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x24BDAEC58], 0, &connect), IOObjectRelease(v6), v7))
  {
    v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  result = connect;
  if (connect)
  {
    v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t sub_22D23369C()
{
  ccder_sizeof_implicit_uint64();
  ccder_sizeof_raw_octet_string();
  ccder_sizeof_raw_octet_string();
  ccder_sizeof_implicit_uint64();
  return ccder_sizeof();
}

uint64_t sub_22D23370C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t result;
  uint64_t v6;

  v6 = a2 + a3;
  if (!ccder_blob_encode_implicit_uint64()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_implicit_uint64())
  {
    return 4294967273;
  }
  v3 = ccder_blob_encode_tl();
  result = 4294967273;
  if (v3)
  {
    if (a2 == v6)
      return 0;
    else
      return 4294967273;
  }
  return result;
}

uint64_t sub_22D2337EC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  int v4;
  uint64_t result;
  __int128 v6;

  *(_QWORD *)&v6 = a1;
  *((_QWORD *)&v6 + 1) = a1 + a2;
  if (!ccder_blob_decode_range()
    || !sub_22D2435FC(&v6, 0x8000000000000000, a3)
    || !sub_22D240E2C(&v6, 0x8000000000000001, (uint64_t)(a3 + 1), 16)
    || !sub_22D240E2C(&v6, 0x8000000000000002, (uint64_t)(a3 + 3), 40)
    || !sub_22D240E2C(&v6, 0x8000000000000003, (uint64_t)(a3 + 8), 16))
  {
    return 4294967277;
  }
  v4 = sub_22D2435FC(&v6, 0x8000000000000004, a3 + 10);
  result = 4294967277;
  if (v4)
  {
    if ((_QWORD)v6 == *((_QWORD *)&v6 + 1))
      return 0;
    else
      return 4294967277;
  }
  return result;
}

uint64_t sub_22D2338C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  int v9;
  _OWORD __s[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  v9 = 40;
  *(_QWORD *)a4 = 0;
  uuid_copy((unsigned __int8 *)(a4 + 8), (const unsigned __int8 *)(a1 + 32));
  *(_QWORD *)(a4 + 80) = 1;
  sub_22D243914(a4 + 64, 0x10u);
  ccsha256_di();
  if (j__ccpbkdf2_hmac())
  {
    v7 = 4294967286;
  }
  else
  {
    v6 = sub_22D230464((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)a1, 0x20u, (_QWORD *)(a4 + 24), &v9);
    if ((_DWORD)v6)
    {
      v7 = v6;
    }
    else if (v9 == 40)
    {
      v7 = 0;
    }
    else
    {
      v7 = 4294967286;
    }
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v7;
}

uint64_t sub_22D2339FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  int v9;
  _OWORD __s[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  v9 = 32;
  if (*(_QWORD *)a1)
  {
    v7 = 4294967284;
  }
  else
  {
    ccsha256_di();
    if (j__ccpbkdf2_hmac())
      goto LABEL_9;
    v6 = sub_22D230828((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (_QWORD *)(a1 + 24), 0x28u, (_QWORD *)a4, &v9);
    if ((_DWORD)v6)
    {
      v7 = v6;
      goto LABEL_8;
    }
    if (v9 != 32)
    {
LABEL_9:
      v7 = 4294967286;
    }
    else
    {
      cccurve25519_make_pub();
      if (uuid_compare((const unsigned __int8 *)(a1 + 8), (const unsigned __int8 *)(a4 + 32)))
        v7 = 4294967272;
      else
        v7 = 0;
    }
  }
LABEL_8:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v7;
}

uint64_t sub_22D233B34()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  mach_port_t v13;
  mach_port_t v14;
  __int128 v16;
  uint64_t input[7];
  _BYTE v18[4096];
  uint64_t v19;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v19 = *MEMORY[0x24BDAC8D0];
  v12 = 3758097098;
  bzero(v18, 0x1000uLL);
  *(_QWORD *)&v16 = v18;
  *((_QWORD *)&v16 + 1) = &v19;
  v13 = sub_22D230B74();
  if (v13)
  {
    v14 = v13;
    if (sub_22D242164(&v16, v2) && ccder_blob_encode_tl())
    {
      input[0] = v11;
      input[1] = v10;
      input[2] = v6;
      input[3] = v4;
      input[4] = v8;
      input[5] = *((_QWORD *)&v16 + 1);
      input[6] = (uint64_t)&v19 - *((_QWORD *)&v16 + 1);
      return IOConnectCallMethod(v14, 0x21u, input, 7u, 0, 0, 0, 0, 0, 0);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_create_for_bag_and_kek", ":", 50, "", 0, "", "");
    return 3758097084;
  }
  return v12;
}

uint64_t sub_22D233CDC()
{
  return sub_22D233B34();
}

uint64_t sub_22D233D0C(int a1)
{
  return sub_22D233D18(a1, 0, 0);
}

uint64_t sub_22D233D18(int a1, unsigned int a2, BOOL *a3)
{
  mach_port_t v6;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v6 = sub_22D230B74();
  if (v6)
  {
    input[0] = a1;
    input[1] = a2;
    output = 0;
    outputCnt = 1;
    result = IOConnectCallMethod(v6, 0x22u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
    if (!(_DWORD)result)
    {
      result = 0;
      if (a3)
        *a3 = output != 0;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_stash_load", ":", 77, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t sub_22D233E38(int a1, _BYTE *a2)
{
  uint64_t result;
  BOOL v4;

  v4 = 0;
  if (!a2)
    return sub_22D233D18(a1, 1u, &v4);
  *a2 = 0;
  result = sub_22D233D18(a1, 1u, &v4);
  if (!(_DWORD)result)
    *a2 = v4;
  return result;
}

uint64_t sub_22D233E90()
{
  mach_port_t v0;

  v0 = sub_22D230B74();
  if (v0)
    return IOConnectCallMethod(v0, 0x25u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_destroy", ":", 125, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D233F34(int a1)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v2 = sub_22D230B74();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0x24u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_commit", ":", 138, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D234018(int a1)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v2 = sub_22D230B74();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0x33u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_enable", ":", 154, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D2340FC(int a1)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v2 = sub_22D230B74();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0x35u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_stash_persist", ":", 170, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D2341E0(void **a1)
{
  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 != 1634431856)
    return 0xFFFFFFFFLL;
  free(a1[1]);
  free(a1);
  return 0;
}

uint64_t sub_22D234238(int a1, uint64_t a2, unint64_t a3, int a4, void ***a5)
{
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void **v14;

  v14 = 0;
  if (!a2 && a3)
    return 0xFFFFFFFFLL;
  if (sub_22D23433C(a4, &v14) || (v9 = calloc(0x20uLL, 1uLL)) == 0)
  {
    v12 = 0xFFFFFFFFLL;
  }
  else
  {
    v10 = v9;
    v11 = sub_22D23441C(v14, a2, a3, (uint64_t)v9);
    v12 = 0xFFFFFFFFLL;
    if (a3 <= 0x7FFFFFFE && !v11 && !sub_22D2344BC(a1, a2, a3, (uint64_t)v10, (uint64_t)v14))
    {
      v12 = 0;
      if (a5)
      {
        *a5 = v14;
        v14 = 0;
      }
    }
    memset_s(v10, 0x20uLL, 0, 0x20uLL);
    free(v10);
  }
  if (v14)
    sub_22D2341E0(v14);
  return v12;
}

uint64_t sub_22D23433C(int a1, _QWORD *a2)
{
  uint64_t result;
  _DWORD *v6;
  _DWORD *v7;
  void *v8;
  int v9;
  void *v10;

  if ((a1 - 1) > 2 || a2 == 0)
    return 0xFFFFFFFFLL;
  v6 = calloc(0x20uLL, 1uLL);
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = v6;
  *((_QWORD *)v6 + 2) = 20;
  v8 = calloc(0x14uLL, 1uLL);
  *((_QWORD *)v7 + 1) = v8;
  if (!v8)
  {
LABEL_19:
    free(v7);
    return 0xFFFFFFFFLL;
  }
  *v7 = 1634431856;
  v7[6] = a1;
  result = CCRandomCopyBytes();
  if ((_DWORD)result)
  {
    v10 = (void *)*((_QWORD *)v7 + 1);
    if (v10)
      free(v10);
    goto LABEL_19;
  }
  if (a1 == 3)
    v9 = 2000;
  else
    v9 = 10000000;
  if (a1 == 2)
    v9 = 1000;
  v7[1] = v9;
  *a2 = v7;
  return result;
}

uint64_t sub_22D23441C(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*a1 != 1634431856 || !a2 && a3)
    return 0xFFFFFFFFLL;
  result = 0xFFFFFFFFLL;
  if (a4 && (a1[6] - 4) >= 0xFFFFFFFD)
  {
    ccsha256_di();
    if (ccpbkdf2_hmac())
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  return result;
}

uint64_t sub_22D2344BC(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  mach_port_t v11;
  mach_port_t v12;
  void *v14;
  rsize_t __n;
  void *__s;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  __n = 0;
  __s = 0;
  v10 = 3758097090;
  v14 = 0;
  if ((a2 || !a3) && a4 && a5)
  {
    v11 = sub_22D230B74();
    if (v11)
    {
      v12 = v11;
      if (!sub_22D2415D4(&v14, (uint64_t)off_255D66B20, *(_QWORD *)(a5 + 8))
        && !sub_22D2415D4(&v14, (uint64_t)off_255D66B18, a4)
        && !sub_22D241990(&v14, (uint64_t)off_255D66B28, *(unsigned int *)(a5 + 4))
        && !sub_22D241990(&v14, (uint64_t)off_255D66B30, *(unsigned int *)(a5 + 24))
        && (a3 < 1 || !sub_22D2415D4(&v14, (uint64_t)off_255D667E8, a2))
        && !sub_22D241EB4(&v14)
        && !sub_22D241294(&v14, &__s, &__n))
      {
        input[0] = a1;
        input[1] = (uint64_t)__s;
        input[2] = __n;
        v10 = IOConnectCallMethod(v12, 0x1Eu, input, 3u, 0, 0, 0, 0, 0, 0);
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_set_prederived_configuration", ":", 218, "", 0, "", "");
      v10 = 3758097084;
    }
  }
  sub_22D240BC4(&v14);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v10;
}

uint64_t sub_22D2346E4()
{
  int v0;
  uint64_t *v1;
  uint64_t *v2;
  int v3;
  uint64_t result;
  uint64_t v5;
  mach_port_t v6;
  mach_port_t v7;
  CFMutableDictionaryRef Mutable;
  uint64_t v9;
  const void *v10;
  void *v11;
  int v12;
  size_t v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  uint64_t input;
  _BYTE outputStruct[32768];
  uint64_t v24;

  v0 = MEMORY[0x24BDAC7A8]();
  v24 = *MEMORY[0x24BDAC8D0];
  if (!v1)
    return 0;
  v2 = v1;
  v3 = v0;
  result = (uint64_t)calloc(0x20uLL, 1uLL);
  if (!result)
    return result;
  v5 = result;
  *(_DWORD *)result = 1634431856;
  v6 = sub_22D230B74();
  if (!v6)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_get_prederived_configuration", ":", 384, "", 0, "", "");
LABEL_16:
    sub_22D2341E0((void **)v5);
    return 0;
  }
  v7 = v6;
  bzero(outputStruct, 0x8000uLL);
  v13[0] = 0x8000;
  input = v3;
  if (IOConnectCallMethod(v7, 0x1Fu, &input, 1u, 0, 0, 0, 0, outputStruct, v13) || v13[0] > 0x8000)
    goto LABEL_16;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v15 = 0u;
  v17 = 0u;
  v18 = 0;
  v14 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13[1] = (size_t)off_255D66B20;
  v16 = (unint64_t)off_255D66B28;
  v19 = off_255D66B30;
  sub_22D2406B8();
  v9 = ccder_decode_tl();
  if (v9)
  {
    v10 = (const void *)v9;
    v11 = calloc(*(_QWORD *)(v5 + 16), 1uLL);
    *(_QWORD *)(v5 + 8) = v11;
    if (!v11)
    {
      v12 = 0;
      if (!Mutable)
        goto LABEL_11;
      goto LABEL_10;
    }
    memcpy(v11, v10, *(_QWORD *)(v5 + 16));
    *(_DWORD *)(v5 + 4) = sub_22D2408D0();
    *(_DWORD *)(v5 + 24) = sub_22D2408D0();
  }
  v12 = 1;
  if (Mutable)
LABEL_10:
    CFRelease(Mutable);
LABEL_11:
  if (!v12 || !*(_QWORD *)(v5 + 16))
    goto LABEL_16;
  *v2 = v5;
  return 1;
}

uint64_t sub_22D2349A4(int a1, uint64_t a2, int a3, _DWORD *a4)
{
  BOOL v4;
  BOOL v5;
  uint64_t v7;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  memset(v9, 0, sizeof(v9));
  if (a3)
    v4 = a2 == 0;
  else
    v4 = 0;
  v5 = v4 || a4 == 0;
  if (v5 || *a4 != 1634431856 || sub_22D23441C(a4, a2, a3, (uint64_t)v9))
    v7 = 0xFFFFFFFFLL;
  else
    v7 = sub_22D234A6C(a1, (uint64_t)v9, 32);
  memset_s(v9, 0x20uLL, 0, 0x20uLL);
  return v7;
}

uint64_t sub_22D234A6C(int a1, uint64_t a2, int a3)
{
  mach_port_t v6;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v6 = sub_22D230B74();
  if (v6)
  {
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    return IOConnectCallMethod(v6, 0xCu, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unlock_bag", ":", 807, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D234B68(int a1, uint64_t a2, int a3, uint64_t a4, int a5, void ***a6)
{
  void **v7;
  int v11;
  void **v12;
  int v13;
  uint64_t v14;
  void **v16;
  _OWORD v17[2];
  _OWORD __s[2];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  memset(v17, 0, sizeof(v17));
  v16 = 0;
  if (!a6)
    goto LABEL_17;
  v7 = *a6;
  if (!*a6 || *(_DWORD *)v7 != 1634431856 || !a2 && a3)
    goto LABEL_17;
  if (!a4 && a5 || sub_22D23441C(*a6, a2, a3, (uint64_t)__s))
    goto LABEL_17;
  v11 = sub_22D23433C(*((_DWORD *)v7 + 6), &v16);
  v12 = v16;
  if (v11 || (v13 = sub_22D23441C(v16, a4, a5, (uint64_t)v17), v12 = v16, v13))
  {
LABEL_15:
    if (v12)
      sub_22D2341E0(v12);
LABEL_17:
    v14 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  if (sub_22D2344BC(a1, (uint64_t)__s, 32, (uint64_t)v17, (uint64_t)v16))
  {
    v12 = v16;
    goto LABEL_15;
  }
  sub_22D2341E0(v7);
  v14 = 0;
  *a6 = v16;
LABEL_13:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v17, 0x20uLL, 0, 0x20uLL);
  return v14;
}

uint64_t sub_22D234CC8(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  return sub_22D234CE0(a1, a2, 0, 0, a3, -1, a4);
}

uint64_t sub_22D234CE0(uint64_t a1, int a2, uint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  uint64_t v14;
  mach_port_t v15;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[7];

  input[6] = *MEMORY[0x24BDAC8D0];
  v14 = 3758097084;
  v15 = sub_22D230B74();
  if (v15)
  {
    if (a7)
    {
      input[0] = a5;
      input[1] = a6;
      input[2] = a1;
      input[3] = a2;
      input[4] = a3;
      input[5] = a4;
      output = 0;
      outputCnt = 1;
      v14 = IOConnectCallMethod(v15, 2u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v14)
        *a7 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_create_bag", ":", 187, "", 0, "", "");
  }
  return v14;
}

uint64_t sub_22D234E34(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return sub_22D234CE0(a1, a2, 0, 0, 2u, a3, a4);
}

uint64_t sub_22D234E4C(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return sub_22D234CE0(a3, a4, a1, a2, 2u, a5, a6);
}

uint64_t sub_22D234E74(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return sub_22D234CE0(a1, a2, 0, 0, 0x8000002u, a3, a4);
}

uint64_t sub_22D234E90(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return sub_22D234CE0(a3, a4, a1, a2, 0x8000002u, a5, a6);
}

uint64_t sub_22D234EBC()
{
  mach_port_t v0;

  v0 = sub_22D230B74();
  if (v0)
    return IOConnectCallMethod(v0, 0x42u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_invalidate_sync_bags", ":", 544, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D234F60(const void *a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v10;
  mach_port_t v11;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  v11 = sub_22D230B74();
  if (v11)
  {
    if (a1)
    {
      input[0] = a5;
      input[1] = a3;
      input[2] = a4;
      return IOConnectCallMethod(v11, 0x43u, input, 3u, a1, a2, 0, 0, 0, 0);
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unlock_with_sync_bag", ":", 557, "", 0, "", "");
  }
  return v10;
}

uint64_t sub_22D235080(const void *a1, int a2, _DWORD *a3)
{
  uint64_t v6;
  mach_port_t v7;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  v6 = 3758097084;
  v7 = sub_22D230B74();
  if (v7)
  {
    v6 = 3758097090;
    if (a1)
    {
      if (a3)
      {
        output[0] = 0;
        outputCnt = 1;
        v6 = IOConnectCallMethod(v7, 6u, 0, 0, a1, a2, output, &outputCnt, 0, 0);
        if (!(_DWORD)v6)
          *a3 = output[0];
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_load_bag", ":", 574, "", 0, "", "");
  }
  return v6;
}

uint64_t sub_22D235198(const void *a1, int a2)
{
  uint64_t v4;
  mach_port_t v5;

  v4 = 3758097084;
  v5 = sub_22D230B74();
  if (v5)
  {
    if (a1)
      return IOConnectCallMethod(v5, 0x57u, 0, 0, a1, a2, 0, 0, 0, 0);
    return 3758097090;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_invalidate_bag", ":", 596, "", 0, "", "");
  }
  return v4;
}

uint64_t sub_22D235264(int a1)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v2 = sub_22D230B74();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unload_bag", ":", 612, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D235348(int a1)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v2 = sub_22D230B74();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0x37u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unload_session_bags", ":", 629, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D23542C()
{
  int v0;
  _DWORD *v1;
  _DWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  mach_port_t v6;
  mach_port_t v7;
  uint64_t result;
  void *v9;
  size_t __count;
  uint64_t input;
  _BYTE __src[32768];
  uint64_t v13;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = sub_22D230B74();
  if (v6)
  {
    v7 = v6;
    result = 3758097090;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input = v5;
        result = IOConnectCallMethod(v7, 3u, &input, 1u, 0, 0, 0, 0, __src, &__count);
        if (!(_DWORD)result)
        {
          v9 = calloc(__count, 1uLL);
          *v4 = v9;
          if (v9)
          {
            memcpy(v9, __src, __count);
            result = 0;
            *v2 = __count;
          }
          else
          {
            return 3758097085;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_save_bag", ":", 646, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t sub_22D2355B4(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, unsigned int a12, _DWORD *a13)
{
  mach_port_t v21;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[13];

  input[12] = *MEMORY[0x24BDAC8D0];
  v21 = sub_22D230B74();
  if (v21)
  {
    input[0] = a1;
    input[1] = a11;
    input[2] = a10;
    input[3] = a2;
    input[4] = a3;
    input[5] = a4;
    input[6] = a5;
    input[7] = a6;
    input[8] = a7;
    input[9] = a8;
    input[10] = a9;
    input[11] = a12;
    output = 0;
    outputCnt = 1;
    result = IOConnectCallMethod(v21, 0xFu, input, 0xCu, 0, 0, &output, &outputCnt, 0, 0);
    if (a13)
    {
      if (!(_DWORD)result)
        *a13 = output;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_change_secret_opts", ":", 678, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t sub_22D235724(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, _DWORD *a12)
{
  return sub_22D2355B4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12);
}

uint64_t sub_22D235748(int a1, uint64_t a2, int a3, uint64_t a4, int a5, unsigned int a6, _DWORD *a7)
{
  return sub_22D2355B4(a1, a2, a3, a4, a5, 0, 0, 0, 0, 0xFFu, a6, 0, a7);
}

uint64_t sub_22D235784(int a1, _OWORD *a2)
{
  uint64_t v4;
  mach_port_t v5;
  size_t v7;
  uint64_t input;
  __int128 outputStruct;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  v7 = 16;
  v5 = sub_22D230B74();
  if (v5)
  {
    if (a2)
    {
      outputStruct = 0uLL;
      input = a1;
      v4 = IOConnectCallMethod(v5, 0x17u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v7);
      if (!(_DWORD)v4)
        *a2 = outputStruct;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_bag_uuid", ":", 729, "", 0, "", "");
  }
  return v4;
}

uint64_t sub_22D2358A8(int a1, _QWORD *a2, size_t *a3)
{
  return sub_22D2358BC(a1, (uint64_t)&unk_22D2538B0, a2, a3);
}

uint64_t sub_22D2358BC(int a1, uint64_t a2, _QWORD *a3, size_t *a4)
{
  mach_port_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  mach_port_t v15;
  uint64_t v16;
  void *v17;
  unsigned int inputStructCnt[3];
  size_t __count;
  uint64_t input;
  _OWORD __src[2];
  __int16 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  memset(__src, 0, sizeof(__src));
  __count = 34;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  v8 = sub_22D230B74();
  if (v8)
  {
    v14 = 3758097090;
    if (a3 && a4)
    {
      v15 = v8;
      input = a1;
      sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 1, v9, v10, v11, v12, v13, a2);
      if (*(_QWORD *)&inputStructCnt[1])
      {
        v16 = IOConnectCallMethod(v15, 0x44u, &input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
        if ((_DWORD)v16)
        {
          v14 = v16;
        }
        else
        {
          v17 = calloc(__count, 1uLL);
          *a3 = v17;
          v14 = 3758097085;
          if (v17)
          {
            memcpy(v17, __src, __count);
            v14 = 0;
            *a4 = __count;
          }
        }
      }
      else
      {
        v14 = 3758097085;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_copy_volume_cookie_persona", ":", 760, "", 0, "", "");
    v14 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v14;
}

uint64_t sub_22D235A68(int a1)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v2 = sub_22D230B74();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0xDu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lock_bag", ":", 790, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D235B4C(int a1, _DWORD *a2)
{
  uint64_t v4;
  mach_port_t v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  v5 = sub_22D230B74();
  if (v5)
  {
    if (a2)
    {
      output = 0;
      input[0] = a1;
      outputCnt = 1;
      v4 = IOConnectCallMethod(v5, 7u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v4)
        *a2 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_lock_state", ":", 824, "", 0, "", "");
  }
  return v4;
}

uint64_t sub_22D235C64(const void *a1, int a2, int a3, int a4, void *a5, int *a6, _DWORD *a7)
{
  uint64_t v14;
  mach_port_t v15;
  uint64_t v16;
  size_t v18;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v14 = 3758097084;
  v15 = sub_22D230B74();
  if (v15)
  {
    v14 = 3758097090;
    if (a1 && a5 && a6)
    {
      input[0] = a4;
      input[1] = a3;
      output = 0;
      outputCnt = 1;
      v18 = *a6;
      v16 = IOConnectCallMethod(v15, 0xAu, input, 2u, a1, a2, &output, &outputCnt, a5, &v18);
      if ((_DWORD)v16)
      {
        return v16;
      }
      else
      {
        *a6 = v18;
        v14 = 0;
        if (a7)
          *a7 = output;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_wrap_key", ":", 848, "", 0, "", "");
  }
  return v14;
}

uint64_t sub_22D235DCC(const void *a1, int a2, int a3, int a4, void *a5, int *a6)
{
  uint64_t v12;
  mach_port_t v13;
  size_t v15;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v12 = 3758097084;
  v13 = sub_22D230B74();
  if (v13)
  {
    v12 = 3758097090;
    if (a1)
    {
      if (a5)
      {
        if (a6)
        {
          input[0] = a4;
          input[1] = a3;
          v15 = *a6;
          v12 = IOConnectCallMethod(v13, 0xBu, input, 2u, a1, a2, 0, 0, a5, &v15);
          if (!(_DWORD)v12)
            *a6 = v15;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unwrap_key", ":", 877, "", 0, "", "");
  }
  return v12;
}

uint64_t sub_22D235F10(const void *a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t v14;
  mach_port_t v15;
  size_t v17;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v14 = 3758097084;
  v15 = sub_22D230B74();
  if (v15)
  {
    v14 = 3758097090;
    if (a1 && a7)
    {
      input[0] = a3;
      input[1] = a4;
      input[2] = a5;
      input[3] = a6;
      v17 = 108;
      return IOConnectCallMethod(v15, 0x18u, input, 4u, a1, a2, 0, 0, a7, &v17);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_rewrap_key_for_backup", ":", 901, "", 0, "", "");
  }
  return v14;
}

uint64_t sub_22D236050(int a1, _DWORD *a2)
{
  uint64_t v4;
  mach_port_t v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  v5 = sub_22D230B74();
  if (v5)
  {
    if (a2)
    {
      output = 0;
      input[0] = a1;
      outputCnt = 1;
      v4 = IOConnectCallMethod(v5, 0xEu, input, a1 != 0, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v4)
        *a2 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_system", ":", 922, "", 0, "", "");
  }
  return v4;
}

uint64_t sub_22D23616C(int a1, int a2, uint64_t a3, int a4)
{
  mach_port_t v8;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v8 = sub_22D230B74();
  if (v8)
  {
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    input[3] = a4;
    return IOConnectCallMethod(v8, 5u, input, 4u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_system_with_passcode", ":", 950, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D236270(int a1, int a2)
{
  return sub_22D23616C(a1, a2, 0, 0);
}

uint64_t sub_22D23627C(int a1, uint64_t a2, unsigned int a3)
{
  return sub_22D23629C(a1, a2, a3);
}

uint64_t sub_22D236290(int a1, uint64_t a2, unsigned int a3)
{
  return sub_22D23629C(a1, a2, a3);
}

uint64_t sub_22D23629C(int a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6;
  mach_port_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_port_t v13;
  void *v14;
  unsigned int inputStructCnt[3];
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v6 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  v7 = sub_22D230B74();
  if (v7)
  {
    v13 = v7;
    input[0] = a1;
    input[1] = a3;
    sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 3, v8, v9, v10, v11, v12, a2);
    if (*(_QWORD *)&inputStructCnt[1])
    {
      v6 = IOConnectCallMethod(v13, 0x41u, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
      v14 = *(void **)&inputStructCnt[1];
    }
    else
    {
      v14 = 0;
      v6 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_keybag_for_volume_with_cookie_persona", ":", 987, "", 0, "", "");
    v14 = 0;
  }
  free(v14);
  return v6;
}

uint64_t sub_22D236404()
{
  uint64_t v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_port_t v17;
  uint64_t v18;
  void *v19;
  size_t __count;
  unsigned int inputStructCnt[3];
  uint64_t input[2];
  _BYTE __src[32768];
  uint64_t v25;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v0;
  v25 = *MEMORY[0x24BDAC8D0];
  v10 = 3758097085;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  v11 = sub_22D230B74();
  if (v11)
  {
    v17 = v11;
    input[0] = v8;
    input[1] = v6;
    sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 1, v12, v13, v14, v15, v16, v9);
    if (*(_QWORD *)&inputStructCnt[1])
    {
      v18 = IOConnectCallMethod(v17, 0x6Eu, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
      if ((_DWORD)v18)
      {
        v10 = v18;
      }
      else
      {
        v19 = calloc(__count, 1uLL);
        *v4 = v19;
        if (v19)
        {
          memcpy(v19, __src, __count);
          v10 = 0;
          *v2 = __count;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_enable_volume", ":", 1014, "", 0, "", "");
    v10 = 3758097084;
  }
  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t sub_22D2365B4(uint64_t a1)
{
  uint64_t v2;
  mach_port_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_port_t v9;
  char *v10;
  int v12;
  char *v13;

  v2 = 3758097084;
  v13 = 0;
  v12 = 0;
  v3 = sub_22D230B74();
  if (v3)
  {
    v9 = v3;
    sub_22D244254(&v13, (unsigned int *)&v12, 1, v4, v5, v6, v7, v8, a1);
    if (v13)
    {
      v2 = IOConnectCallMethod(v9, 0x6Fu, 0, 0, v13, v12, 0, 0, 0, 0);
      v10 = v13;
    }
    else
    {
      v10 = 0;
      v2 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_disable_volume", ":", 1044, "", 0, "", "");
    v10 = 0;
  }
  free(v10);
  return v2;
}

uint64_t sub_22D2366B8(uint64_t a1, void *a2)
{
  uint64_t v4;
  mach_port_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t v11;
  char *v12;
  size_t v14;
  int v15;
  char *v16;

  v4 = 3758097084;
  v16 = 0;
  v15 = 0;
  v14 = 16;
  v5 = sub_22D230B74();
  if (v5)
  {
    v11 = v5;
    sub_22D244254(&v16, (unsigned int *)&v15, 1, v6, v7, v8, v9, v10, a1);
    if (v16)
    {
      v4 = IOConnectCallMethod(v11, 0x70u, 0, 0, v16, v15, 0, 0, a2, &v14);
      v12 = v16;
    }
    else
    {
      v12 = 0;
      v4 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_copy_current_bag_uuid", ":", 1066, "", 0, "", "");
    v12 = 0;
  }
  free(v12);
  return v4;
}

uint64_t sub_22D2367CC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t v13;
  mach_port_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  mach_port_t v20;
  void *v21;
  size_t v23;
  unsigned int inputStructCnt[3];
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v13 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  v14 = sub_22D230B74();
  if (v14)
  {
    v20 = v14;
    v21 = 0;
    v13 = 3758097090;
    if (a2 && a7)
    {
      input[0] = a4;
      input[1] = a5;
      input[2] = a6;
      sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 2, v15, v16, v17, v18, v19, a1);
      v23 = 108;
      v13 = IOConnectCallMethod(v20, 0x71u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, a7, &v23);
      v21 = *(void **)&inputStructCnt[1];
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_rewrap_key", ":", 1087, "", 0, "", "");
    v21 = 0;
  }
  free(v21);
  return v13;
}

uint64_t sub_22D23694C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8, void *outputStruct)
{
  uint64_t v15;
  mach_port_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  mach_port_t v22;
  void *v23;
  size_t v25;
  unsigned int inputStructCnt[3];
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v15 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  v16 = sub_22D230B74();
  if (v16)
  {
    v22 = v16;
    v23 = 0;
    v15 = 3758097090;
    if (a2 && a4 && outputStruct)
    {
      input[0] = a6;
      input[1] = a7;
      input[2] = a8;
      sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 3, v17, v18, v19, v20, v21, a1);
      v25 = 108;
      v15 = IOConnectCallMethod(v22, 0x71u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, outputStruct, &v25);
      v23 = *(void **)&inputStructCnt[1];
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_backup_rewrap_ek", ":", 1113, "", 0, "", "");
    v23 = 0;
  }
  free(v23);
  return v15;
}

uint64_t sub_22D236AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[5];
  uint64_t v14;
  __int128 __s;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  __s = 0u;
  v16 = 0u;
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  v8 = sub_22D2337EC(a1, a2, v13);
  if ((_DWORD)v8)
  {
    v9 = v8;
  }
  else
  {
    v9 = sub_22D2339FC((uint64_t)v13, a3, a4, (uint64_t)&__s);
    if (!(_DWORD)v9)
    {
      v10 = v16;
      *a5 = __s;
      a5[1] = v10;
      v11 = v18;
      a5[2] = v17;
      a5[3] = v11;
    }
  }
  memset_s(v13, 0x58uLL, 0, 0x58uLL);
  memset_s(&__s, 0x40uLL, 0, 0x40uLL);
  return sub_22D23F9AC(v9);
}

uint64_t sub_22D236BCC(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v4;
  _OWORD v6[5];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  v4 = sub_22D2337EC(a1, a2, v6);
  if (!(_DWORD)v4)
    uuid_copy(a3, (const unsigned __int8 *)v6 + 8);
  memset_s(v6, 0x58uLL, 0, 0x58uLL);
  return sub_22D23F9AC(v4);
}

uint64_t sub_22D236C74(__int128 *a1, _QWORD *a2, unsigned int a3, _QWORD *a4, _QWORD *a5)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  unsigned int v10;
  int __s;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a1[1];
  v12 = *a1;
  v13 = v6;
  v7 = a1[3];
  v14 = a1[2];
  v15 = v7;
  v10 = *a5;
  __s = 1;
  v8 = sub_22D23FFD8((uint64_t)&__s, 0, 0, a2, a3, a4, &v10);
  *a5 = v10;
  memset_s(&__s, 0x44uLL, 0, 0x44uLL);
  return sub_22D23F9AC(v8);
}

uint64_t sub_22D236D30(uint64_t a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t v10;
  mach_port_t v11;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  v11 = sub_22D230B74();
  if (v11)
  {
    v10 = 3758097090;
    if (a2 && a4)
    {
      input[0] = a1;
      input[1] = 64;
      return IOConnectCallMethod(v11, 0x82u, input, 2u, a2, a3, 0, 0, a4, a5);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_unwrap_key", ":", 1193, "", 0, "", "");
  }
  return v10;
}

uint64_t sub_22D236E48(int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t v10;
  mach_port_t v11;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  v11 = sub_22D230B74();
  if (v11)
  {
    v10 = 3758097090;
    if (a2 && a4)
    {
      input[0] = a1;
      return IOConnectCallMethod(v11, 0x81u, input, 1u, a2, a3, 0, 0, a4, a5);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_wrap_key", ":", 1212, "", 0, "", "");
  }
  return v10;
}

uint64_t sub_22D236F60(int a1, _DWORD *a2)
{
  uint64_t v4;
  mach_port_t v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  v5 = sub_22D230B74();
  if (v5)
  {
    if (a2)
    {
      output = 0;
      input[0] = a1;
      outputCnt = 1;
      v4 = IOConnectCallMethod(v5, 0x83u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v4)
        *a2 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_get_handle", ":", 1231, "", 0, "", "");
  }
  return v4;
}

uint64_t sub_22D237078(int a1, unsigned __int8 *a2)
{
  uint64_t v4;
  mach_port_t v5;
  uint64_t v6;
  size_t v8;
  unsigned __int8 src[8];
  uint64_t v10;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  v5 = sub_22D230B74();
  if (v5)
  {
    if (a2)
    {
      v10 = 0;
      input[0] = a1;
      v8 = 16;
      *(_QWORD *)src = 0;
      v6 = IOConnectCallMethod(v5, 0x84u, input, 1u, 0, 0, 0, 0, src, &v8);
      if ((_DWORD)v6)
      {
        return v6;
      }
      else if (v8 == 16)
      {
        uuid_copy(a2, src);
        return 0;
      }
      else
      {
        return 3758604298;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_kc_backup_get_uuid", ":", 1253, "", 0, "", "");
  }
  return v4;
}

uint64_t sub_22D2371BC(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, _OWORD *a6)
{
  int v7;
  int v9;
  int v11;
  FILE **v12;
  FILE *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;

  if (a5)
  {
    v7 = a4;
    v9 = a2;
    *a5 = -1;
    v11 = sub_22D236AE0((uint64_t)a1, a2, a3, a4, a6);
    v12 = (FILE **)MEMORY[0x24BDAC8E8];
    v13 = (FILE *)*MEMORY[0x24BDAC8E8];
    if (!v11)
    {
      fprintf(v13, "%s%s:%s%s%s%s%u:%s%u:%s Unwrapped DER backup bag%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":", 1302, "", 0, "", "");
      v17 = 0;
      goto LABEL_9;
    }
    fprintf(v13, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unwrap backup bag as DER: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":", 1290, "", 0, "", v11, "");
    v14 = sub_22D235080(a1, v9, a5);
    if ((_DWORD)v14)
    {
      v17 = v14;
      fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to load in-kernel backup bag: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":", 1292, "", 0, "", v14, "");
    }
    else
    {
      v15 = sub_22D2346E4();
      v16 = *a5;
      if (v15)
      {
        v17 = sub_22D2349A4(v16, a3, v7, 0);
        if (!(_DWORD)v17)
          goto LABEL_9;
        fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag with prederived secret: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":");
      }
      else
      {
        v17 = sub_22D234A6C(v16, a3, v7);
        if (!(_DWORD)v17)
          goto LABEL_9;
        fprintf(*v12, "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag: 0x%08x%s\n", "aks", "", "", "", "aks_kc_backup_open_keybag", ":");
      }
    }
  }
  else
  {
    v17 = 3758097090;
  }
  if (*a5 != -1)
  {
    sub_22D235264(*a5);
    *a5 = -1;
  }
LABEL_9:
  sub_22D2341E0(0);
  return v17;
}

uint64_t sub_22D2373E8(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  mach_port_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  mach_port_t v15;
  char *v16;
  int v18;
  char *v19;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v8 = 3758097084;
  v19 = 0;
  v18 = 0;
  v9 = sub_22D230B74();
  if (v9)
  {
    v15 = v9;
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    sub_22D244254(&v19, (unsigned int *)&v18, 1, v10, v11, v12, v13, v14, a4);
    if (v19)
    {
      v8 = IOConnectCallMethod(v15, 0x60u, input, 3u, v19, v18, 0, 0, 0, 0);
      v16 = v19;
    }
    else
    {
      v16 = 0;
      v8 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_create", ":", 1324, "", 0, "", "");
    v16 = 0;
  }
  free(v16);
  return v8;
}

uint64_t sub_22D237538(int a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v10;
  mach_port_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_port_t v17;
  void *v18;
  unsigned int inputStructCnt[3];
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  v11 = sub_22D230B74();
  if (v11)
  {
    v17 = v11;
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    input[3] = a5;
    sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 1, v12, v13, v14, v15, v16, a4);
    if (*(_QWORD *)&inputStructCnt[1])
    {
      v10 = IOConnectCallMethod(v17, 0x75u, input, 4u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, 0, 0);
      v18 = *(void **)&inputStructCnt[1];
    }
    else
    {
      v18 = 0;
      v10 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_create_with_flags", ":", 1346, "", 0, "", "");
    v18 = 0;
  }
  free(v18);
  return v10;
}

uint64_t sub_22D237698()
{
  int v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  uint64_t v6;
  mach_port_t v7;
  uint64_t v8;
  void *v9;
  size_t v10;
  size_t __count;
  uint64_t input;
  _BYTE __src[8192];
  uint64_t v15;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v15 = *MEMORY[0x24BDAC8D0];
  bzero(__src, 0x2000uLL);
  __count = 0x2000;
  input = v5;
  v6 = 3758097090;
  if (v4 && v2)
  {
    v7 = sub_22D230B74();
    if (v7)
    {
      v8 = IOConnectCallMethod(v7, 0x61u, &input, 1u, 0, 0, 0, 0, __src, &__count);
      if ((_DWORD)v8)
      {
        v6 = v8;
      }
      else
      {
        if (__count)
        {
          v9 = calloc(__count, 1uLL);
          *v4 = v9;
          if (!v9)
          {
            v6 = 3758097085;
            goto LABEL_10;
          }
          memcpy(v9, __src, __count);
          v10 = __count;
        }
        else
        {
          v10 = 0;
          *v4 = 0;
        }
        v6 = 0;
        *v2 = v10;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_list", ":", 1372, "", 0, "", "");
      v6 = 3758097084;
    }
  }
LABEL_10:
  memset_s(__src, 0x2000uLL, 0, 0x2000uLL);
  return v6;
}

uint64_t sub_22D237840(int a1, uint64_t a2)
{
  uint64_t v4;
  mach_port_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_t v11;
  char *v12;
  int v14;
  char *v15;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  v15 = 0;
  v14 = 0;
  v5 = sub_22D230B74();
  if (v5)
  {
    v11 = v5;
    input[0] = a1;
    sub_22D244254(&v15, (unsigned int *)&v14, 1, v6, v7, v8, v9, v10, a2);
    if (v15)
    {
      v4 = IOConnectCallMethod(v11, 0x62u, input, 1u, v15, v14, 0, 0, 0, 0);
      v12 = v15;
    }
    else
    {
      v12 = 0;
      v4 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_keybag_persona_delete", ":", 1394, "", 0, "", "");
    v12 = 0;
  }
  free(v12);
  return v4;
}

uint64_t sub_22D23797C(int a1, uint64_t a2, int a3, unsigned int a4, void *a5, size_t *a6)
{
  uint64_t v12;
  mach_port_t v13;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v12 = 3758097084;
  v13 = sub_22D230B74();
  if (v13)
  {
    v12 = 3758097090;
    if (a5 && a6)
    {
      input[0] = a1;
      input[1] = a4;
      input[2] = a2;
      input[3] = a3;
      return IOConnectCallMethod(v13, 0x26u, input, 4u, 0, 0, 0, 0, a5, a6);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_auth_token_create", ":", 1415, "", 0, "", "");
  }
  return v12;
}

uint64_t sub_22D237AAC(int a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4)
{
  uint64_t v7;
  mach_port_t v8;
  mach_port_t v9;
  CFTypeID TypeID;
  CFTypeID v11;
  CFTypeID v12;
  CFTypeID v13;
  CFTypeID v14;
  CFTypeID v15;
  CFTypeID v16;
  CFTypeID v17;
  CFTypeID v18;
  void *v20;
  rsize_t __n;
  void *__s;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  __n = 0;
  __s = 0;
  v7 = 3758097090;
  v20 = 0;
  v8 = sub_22D230B74();
  if (v8)
  {
    v9 = v8;
    TypeID = CFNumberGetTypeID();
    if (!sub_22D237DE4(a4, CFSTR("GracePeriod"), TypeID, (uint64_t)off_255D66940, &v20))
    {
      v11 = CFNumberGetTypeID();
      if (!sub_22D237DE4(a4, CFSTR("BackOffDelay"), v11, (uint64_t)off_255D66948, &v20))
      {
        v12 = CFNumberGetTypeID();
        if (!sub_22D237DE4(a4, CFSTR("MaxUnlockAttempts"), v12, (uint64_t)off_255D66950, &v20))
        {
          v13 = CFNumberGetTypeID();
          if (!sub_22D237DE4(a4, CFSTR("EscrowPasscodePeriod"), v13, (uint64_t)off_255D66958, &v20))
          {
            v14 = CFNumberGetTypeID();
            if (!sub_22D237DE4(a4, CFSTR("EscrowTokenPeriod"), v14, (uint64_t)off_255D66960, &v20))
            {
              v15 = CFDataGetTypeID();
              if (!sub_22D237DE4(a4, CFSTR("UserUUID"), v15, (uint64_t)off_255D66B48, &v20))
              {
                v16 = CFDataGetTypeID();
                if (!sub_22D237DE4(a4, CFSTR("BindKEKToKB"), v16, (uint64_t)off_255D66B88, &v20))
                {
                  v17 = CFBooleanGetTypeID();
                  if (!sub_22D237DE4(a4, CFSTR("InactivityRebootEnabled"), v17, (uint64_t)off_255D66D60, &v20))
                  {
                    v18 = CFBooleanGetTypeID();
                    if (!sub_22D237DE4(a4, CFSTR("OnenessAutomaticMode"), v18, (uint64_t)off_255D66D68, &v20)&& !sub_22D241EB4(&v20)&& (!a2 || !sub_22D2415D4(&v20, (uint64_t)off_255D667E8, a2))&& !sub_22D241294(&v20, &__s, &__n))
                    {
                      input[0] = a1;
                      input[1] = (uint64_t)__s;
                      input[2] = __n;
                      v7 = IOConnectCallMethod(v9, 0x1Eu, input, 3u, 0, 0, 0, 0, 0, 0);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_configuration", ":", 1488, "", 0, "", "");
    v7 = 3758097084;
  }
  sub_22D240BC4(&v20);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v7;
}

uint64_t sub_22D237DE4(const __CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;
  const UInt8 *BytePtr;
  uint64_t v10;
  void *value;

  value = 0;
  result = CFDictionaryGetValueIfPresent(a1, a2, (const void **)&value);
  if ((_DWORD)result)
  {
    if (CFGetTypeID(value) == a3)
    {
      if (CFNumberGetTypeID() == a3)
      {
        v10 = 0;
        if (!CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v10)
          || sub_22D241990(a5, a4, v10))
        {
          return 0xFFFFFFFFLL;
        }
        return 0;
      }
      if (CFBooleanGetTypeID() == a3)
      {
        CFBooleanGetValue((CFBooleanRef)value);
        if (sub_22D24182C(a5, a4))
          return 0xFFFFFFFFLL;
      }
      else
      {
        if (CFDataGetTypeID() != a3)
          return 0xFFFFFFFFLL;
        BytePtr = CFDataGetBytePtr((CFDataRef)value);
        CFDataGetLength((CFDataRef)value);
        if (sub_22D2415D4(a5, a4, (uint64_t)BytePtr))
          return 0xFFFFFFFFLL;
      }
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_22D237EE8()
{
  int v0;
  __CFDictionary **v1;
  __CFDictionary **v2;
  int v3;
  uint64_t v4;
  mach_port_t v5;
  mach_port_t v6;
  uint64_t v7;
  __CFDictionary *Mutable;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFTypeID TypeID;
  CFTypeID v18;
  CFTypeID v19;
  CFTypeID v20;
  CFTypeID v21;
  CFTypeID v22;
  CFTypeID v23;
  CFTypeID v24;
  CFTypeID v25;
  CFTypeID v26;
  CFTypeID v27;
  CFTypeID v28;
  CFTypeID v29;
  CFTypeID v30;
  CFTypeID v31;
  char v32;
  const void *v33;
  const void *v34;
  const void *v35;
  const void *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __CFDictionary **v45;
  size_t v46[2];
  _QWORD v47[74];
  uint64_t input;
  _BYTE outputStruct[32768];
  uint64_t v50;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = v0;
  v50 = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  v5 = sub_22D230B74();
  if (v5)
  {
    if (v2)
    {
      v6 = v5;
      bzero(outputStruct, 0x8000uLL);
      v46[0] = 0x8000;
      input = v3;
      v7 = IOConnectCallMethod(v6, 0x1Fu, &input, 1u, 0, 0, 0, 0, outputStruct, v46);
      if ((_DWORD)v7)
      {
        return v7;
      }
      else if (v46[0] > 0x8000)
      {
        return 3758604298;
      }
      else
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        bzero(v47, 0x250uLL);
        v46[1] = (size_t)off_255D66940;
        v47[4] = off_255D66948;
        v47[9] = off_255D66950;
        v47[14] = off_255D66958;
        v47[19] = off_255D66960;
        v47[24] = off_255D66968;
        v47[29] = off_255D66B48;
        v47[34] = off_255D66B80;
        v47[39] = off_255D66B90;
        v47[44] = off_255D66B98;
        v47[49] = off_255D66BA0;
        v47[54] = off_255D66D20;
        v47[59] = off_255D66D28;
        v47[64] = off_255D66D58;
        v47[69] = off_255D66D50;
        sub_22D2406B8();
        v9 = v47[0];
        v10 = v47[5];
        v11 = v47[10];
        v12 = v47[15];
        v13 = v47[20];
        v14 = v47[25];
        v15 = v47[30];
        v45 = v2;
        v16 = v47[35];
        v38 = v47[40];
        v39 = v47[45];
        v40 = v47[50];
        v41 = v47[55];
        v42 = v47[60];
        v43 = v47[65];
        v44 = v47[70];
        TypeID = CFNumberGetTypeID();
        sub_22D238460(Mutable, CFSTR("GracePeriod"), TypeID, v9);
        v18 = CFNumberGetTypeID();
        sub_22D238460(Mutable, CFSTR("BackOffDelay"), v18, v10);
        v19 = CFNumberGetTypeID();
        sub_22D238460(Mutable, CFSTR("MaxUnlockAttempts"), v19, v11);
        v20 = CFNumberGetTypeID();
        sub_22D238460(Mutable, CFSTR("EscrowPasscodePeriod"), v20, v12);
        v21 = CFNumberGetTypeID();
        sub_22D238460(Mutable, CFSTR("EscrowTokenPeriod"), v21, v13);
        v22 = CFNumberGetTypeID();
        sub_22D238460(Mutable, CFSTR("ConfigFlags"), v22, v14);
        v23 = CFDataGetTypeID();
        sub_22D238460(Mutable, CFSTR("UserUUID"), v23, v15);
        v24 = CFDataGetTypeID();
        sub_22D238460(Mutable, CFSTR("GroupUUID"), v24, v16);
        v25 = CFNumberGetTypeID();
        sub_22D238460(Mutable, CFSTR("RecoveryIterations"), v25, v38);
        v26 = CFNumberGetTypeID();
        sub_22D238460(Mutable, CFSTR("RecoveryFlags"), v26, v39);
        v27 = CFNumberGetTypeID();
        sub_22D238460(Mutable, CFSTR("RecoveryTargetIterations"), v27, v40);
        v28 = CFBooleanGetTypeID();
        sub_22D238460(Mutable, CFSTR("MementoSupported"), v28, v41);
        v29 = CFBooleanGetTypeID();
        sub_22D238460(Mutable, CFSTR("MementoBlobExists"), v29, v42);
        v30 = CFNumberGetTypeID();
        sub_22D238460(Mutable, CFSTR("MementoPasscodeGeneration"), v30, v43);
        v31 = CFNumberGetTypeID();
        sub_22D238460(Mutable, CFSTR("PasscodeGeneration"), v31, v44);
        v32 = sub_22D2408D0();
        v33 = (const void *)*MEMORY[0x24BDBD268];
        v34 = (const void *)*MEMORY[0x24BDBD270];
        if ((v32 & 2) != 0)
          v35 = (const void *)*MEMORY[0x24BDBD270];
        else
          v35 = (const void *)*MEMORY[0x24BDBD268];
        CFDictionarySetValue(Mutable, CFSTR("InactivityRebootEnabled"), v35);
        if ((v32 & 8) != 0)
          v36 = v34;
        else
          v36 = v33;
        CFDictionarySetValue(Mutable, CFSTR("OnenessAutomaticMode"), v36);
        v4 = 0;
        *v45 = Mutable;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_configuration", ":", 1556, "", 0, "", "");
  }
  return v4;
}

void sub_22D238460(__CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  CFNumberRef v7;
  int v8;
  const void **v9;
  const UInt8 *v10;
  CFNumberRef v11;
  CFIndex valuePtr;

  if (a4)
  {
    if (CFNumberGetTypeID() == a3)
    {
      valuePtr = sub_22D2408D0();
      v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
      if (!v7)
        return;
LABEL_12:
      v11 = v7;
      CFDictionaryAddValue(a1, a2, v7);
      CFRelease(v11);
      return;
    }
    if (CFBooleanGetTypeID() == a3)
    {
      v8 = sub_22D240B6C();
      v9 = (const void **)MEMORY[0x24BDBD270];
      if (!v8)
        v9 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a1, a2, *v9);
    }
    else if (CFDataGetTypeID() == a3)
    {
      valuePtr = 0;
      v10 = (const UInt8 *)ccder_decode_tl();
      if (v10)
      {
        v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, valuePtr);
        goto LABEL_12;
      }
    }
  }
}

uint64_t sub_22D238594(int a1, unsigned int a2, uint64_t a3)
{
  mach_port_t v3;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  input[2] = a1;
  v3 = sub_22D230B74();
  if (v3)
    return IOConnectCallMethod(v3, 0x1Au, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_hold", ":", 1654, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D238674(int a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a1;
  v2 = sub_22D230B74();
  if (v2)
    return IOConnectCallMethod(v2, 0x1Bu, input, 2u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_drop", ":", 1672, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D238750(int a1, unsigned int a2)
{
  mach_port_t v4;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v4 = sub_22D230B74();
  if (v4)
  {
    input[0] = a2;
    input[1] = a1;
    return IOConnectCallMethod(v4, 0x64u, input, 2u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_promote", ":", 1687, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D23883C(int a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x91u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_oneness_heartbeat", ":", 1707, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D238914(int a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x65u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_assert_consume", ":", 1722, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D2389EC(int a1, uint64_t a2)
{
  mach_port_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  mach_port_t v10;
  uint64_t v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v14 = 0;
  v4 = sub_22D230B74();
  if (v4)
  {
    v10 = v4;
    sub_22D244254((char **)&v15, (unsigned int *)&v14, 3, v5, v6, v7, v8, v9, a2);
    input[0] = a1;
    input[1] = (uint64_t)v15;
    input[2] = v14;
    v11 = IOConnectCallMethod(v10, 0x12u, input, 3u, 0, 0, 0, 0, 0, 0);
    v12 = v15;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_recover_with_escrow_bag", ":", 1739, "", 0, "", "");
    v12 = 0;
    v11 = 3758097084;
  }
  free(v12);
  return v11;
}

uint64_t sub_22D238B4C()
{
  uint64_t v0;
  _DWORD *v1;
  _DWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  int v6;
  const void *v7;
  uint64_t v8;
  mach_port_t v9;
  uint64_t v10;
  void *v11;
  size_t __count;
  _BYTE __src[32768];
  uint64_t v15;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = (const void *)v0;
  v15 = *MEMORY[0x24BDAC8D0];
  v8 = 3758097090;
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  v9 = sub_22D230B74();
  if (v9)
  {
    if (v7 && v4 && v2)
    {
      v10 = IOConnectCallMethod(v9, 0x29u, 0, 0, v7, v6, 0, 0, __src, &__count);
      if ((_DWORD)v10)
      {
        v8 = v10;
      }
      else
      {
        v11 = calloc(__count, 1uLL);
        *v4 = v11;
        if (v11)
        {
          memcpy(v11, __src, __count);
          v8 = 0;
          *v2 = __count;
        }
        else
        {
          v8 = 3758097085;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fdr_hmac_data", ":", 1758, "", 0, "", "");
    v8 = 3758097084;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v8;
}

uint64_t sub_22D238CE8(int a1, unsigned int a2, _DWORD *a3)
{
  mach_port_t v6;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v6 = sub_22D230B74();
  if (v6)
  {
    input[0] = a1;
    input[1] = a2;
    output = 0;
    outputCnt = 1;
    result = IOConnectCallMethod(v6, 0x28u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
    if (a3)
    {
      if (!(_DWORD)result)
        *a3 = output;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_generation", ":", 1781, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t sub_22D238DFC(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v9;
  mach_port_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  mach_port_t v16;
  const char *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v9 = 3758097084;
  v21 = 0;
  v20 = 0;
  v10 = sub_22D230B74();
  if (v10)
  {
    v16 = v10;
    if (a2)
      v17 = a2;
    else
      v17 = "";
    sub_22D244254((char **)&v21, (unsigned int *)&v20, 2, v11, v12, v13, v14, v15, (uint64_t)v17);
    if (v21)
    {
      input[0] = a1;
      input[1] = a6;
      input[2] = (uint64_t)v21;
      input[3] = v20;
      v9 = IOConnectCallMethod(v16, 0x2Au, input, 4u, 0, 0, 0, 0, 0, 0);
      v18 = v21;
    }
    else
    {
      v18 = 0;
      v9 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_verify_password", ":", 1807, "", 0, "", "");
    v18 = 0;
  }
  free(v18);
  return v9;
}

uint64_t sub_22D238F84(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_22D238DFC(a1, a2, a3, a4, a5, 0);
}

uint64_t sub_22D238F8C(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_22D238DFC(a1, a2, a3, a4, a5, 1u);
}

uint64_t sub_22D238F94()
{
  if (sub_22D230B74())
    JUMPOUT(0x22E30F0B0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_register_for_notifications", ":", 1840, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23903C(int a1, int a2, _QWORD *a3, size_t *a4)
{
  uint64_t result;
  mach_port_t v7;
  void *v8;
  size_t __count;
  uint64_t input[2];
  _OWORD __src[16];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  __count = 256;
  input[0] = a1;
  input[1] = a2;
  result = 3758097090;
  if (a3 && a4)
  {
    v7 = sub_22D230B74();
    if (v7)
    {
      memset(__src, 0, sizeof(__src));
      result = IOConnectCallMethod(v7, 0x31u, input, 2u, 0, 0, 0, 0, __src, &__count);
      if (!(_DWORD)result)
      {
        if (__count > 0x100)
        {
          return 3758604298;
        }
        else
        {
          v8 = calloc(__count, 1uLL);
          *a3 = v8;
          if (v8)
          {
            memcpy(v8, __src, __count);
            result = 0;
            *a4 = __count;
          }
          else
          {
            return 3758097085;
          }
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_create_signing_key", ":", 1859, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t sub_22D2391CC()
{
  int v0;
  const void *v1;
  size_t v2;
  _QWORD *v3;
  size_t *v4;
  int v5;
  uint64_t result;
  size_t *v7;
  _QWORD *v8;
  size_t v9;
  const void *v10;
  mach_port_t v11;
  mach_port_t v12;
  void *v13;
  size_t __count;
  uint64_t input[2];
  _BYTE __src[32768];
  uint64_t v17;

  v0 = MEMORY[0x24BDAC7A8]();
  v17 = *MEMORY[0x24BDAC8D0];
  __count = 0x8000;
  input[0] = v0;
  input[1] = v5;
  result = 3758097090;
  if (v3)
  {
    v7 = v4;
    if (v4)
    {
      v8 = v3;
      v9 = v2;
      v10 = v1;
      v11 = sub_22D230B74();
      if (v11)
      {
        v12 = v11;
        bzero(__src, 0x8000uLL);
        result = IOConnectCallMethod(v12, 0x31u, input, 2u, v10, v9, 0, 0, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count > 0x8000)
          {
            return 3758604298;
          }
          else
          {
            v13 = calloc(__count, 1uLL);
            *v8 = v13;
            if (v13)
            {
              memcpy(v13, __src, __count);
              result = 0;
              *v7 = __count;
            }
            else
            {
              return 3758097085;
            }
          }
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_create_signing_key_with_params", ":", 1881, "", 0, "", "");
        return 3758097084;
      }
    }
  }
  return result;
}

uint64_t sub_22D239374()
{
  return sub_22D23938C();
}

uint64_t sub_22D23938C()
{
  int v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint32_t v5;
  uint32_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_port_t v9;
  mach_port_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  size_t v14;
  size_t __count;
  uint64_t input[3];
  _BYTE __src[15360];
  uint64_t v19;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v19 = *MEMORY[0x24BDAC8D0];
  __count = 15360;
  input[0] = v0;
  input[1] = v7;
  input[2] = v8;
  v9 = sub_22D230B74();
  if (v9)
  {
    v10 = v9;
    bzero(__src, 0x3C00uLL);
    v11 = IOConnectCallMethod(v10, v6, input, 3u, 0, 0, 0, 0, __src, &__count);
    if ((_DWORD)v11)
    {
      return v11;
    }
    else if (__count > 0x3C00)
    {
      return 3758604298;
    }
    else
    {
      v12 = 0;
      if (v4 && v2)
      {
        if (__count)
        {
          v13 = calloc(__count, 1uLL);
          *v4 = v13;
          if (!v13)
            return 3758097085;
          memcpy(v13, __src, __count);
          v14 = __count;
        }
        else
        {
          v14 = 0;
        }
        v12 = 0;
        *v2 = v14;
      }
    }
  }
  else
  {
    v12 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "remote_session_operate", ":", 2017, "", 0, "", "");
  }
  return v12;
}

uint64_t sub_22D239544(int a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, _QWORD *a8, size_t *a9)
{
  uint64_t v9;
  mach_port_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  mach_port_t v18;
  uint64_t v19;
  void *v20;
  unsigned int inputStructCnt[3];
  size_t __count;
  uint64_t input[3];
  _OWORD __src[16];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  memset(__src, 0, sizeof(__src));
  __count = 256;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  input[0] = a1;
  input[1] = a2;
  v9 = 3758097090;
  input[2] = a5;
  if (a8 && a9)
  {
    v12 = sub_22D230B74();
    if (v12)
    {
      v18 = v12;
      sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 2, v13, v14, v15, v16, v17, a3);
      if (*(_QWORD *)&inputStructCnt[1])
      {
        v19 = IOConnectCallMethod(v18, 0x32u, input, 3u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
        if ((_DWORD)v19)
        {
          v9 = v19;
        }
        else if (__count > 0x100)
        {
          v9 = 3758604298;
        }
        else
        {
          v20 = calloc(__count, 1uLL);
          *a8 = v20;
          v9 = 3758097085;
          if (v20)
          {
            memcpy(v20, __src, __count);
            v9 = 0;
            *a9 = __count;
          }
        }
      }
      else
      {
        v9 = 3758097085;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_sign_signing_key", ":", 1911, "", 0, "", "");
      v9 = 3758097084;
    }
  }
  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t sub_22D239744(int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  uint64_t v10;
  mach_port_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_port_t v17;
  uint64_t v18;
  uint32_t outputCnt;
  unsigned int inputStructCnt[3];
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v10 = 3758097084;
  input[0] = a2;
  input[1] = a1;
  output = 0;
  outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  v11 = sub_22D230B74();
  if (v11)
  {
    v17 = v11;
    sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a3);
    if (*(_QWORD *)&inputStructCnt[1])
    {
      v18 = IOConnectCallMethod(v17, 0x2Cu, input, 2u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], &output, &outputCnt, 0, 0);
      v10 = v18;
      if (a9 && !(_DWORD)v18)
        *a9 = output;
    }
    else
    {
      v10 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_remote_session", ":", 1938, "", 0, "", "");
  }
  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t sub_22D2398BC(int a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v8;
  uint64_t v11;
  void *v12;
  rsize_t __smax;
  rsize_t __n;
  uint64_t v16;
  void *v17;
  void *__s;
  __int128 v19;

  v17 = 0;
  __s = 0;
  v4 = 3758097084;
  __n = 0;
  v16 = 0;
  v5 = 3758097090;
  __smax = 0;
  if (!a3 || !a4)
    goto LABEL_12;
  v8 = -536870212;
  *(_QWORD *)&v19 = a3;
  *((_QWORD *)&v19 + 1) = a3 + a4;
  if (!(a3 + a4))
    goto LABEL_19;
  v16 = 0;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
    v8 = -536870198;
LABEL_19:
    syslog(3, "error parsing signing key: %d", v8);
    v5 = 3758097084;
LABEL_12:
    v12 = __s;
    v4 = v5;
    goto LABEL_13;
  }
  sub_22D2435FC(&v19, 0x8000000000000001, &v16);
  if (v16)
  {
    v5 = sub_22D23938C();
    if ((_DWORD)v5)
      syslog(3, "error: validating v1 local signing key failed: %d");
    goto LABEL_12;
  }
  v11 = sub_22D23903C(a1, 11, &__s, &__n);
  if ((_DWORD)v11)
  {
    v5 = v11;
    syslog(3, "error: validating (create) v0 local signing key failed: %d", v11);
    goto LABEL_12;
  }
  v12 = __s;
  if (__s && __n)
  {
    v5 = sub_22D239544(a1, a2, a3, a4, 11, (uint64_t)__s, __n, &v17, &__smax);
    if ((_DWORD)v5)
      syslog(3, "error: validating (sign) v0 local signing key failed: %d");
    goto LABEL_12;
  }
LABEL_13:
  if (v12)
  {
    memset_s(v12, __n, 0, __n);
    free(__s);
  }
  if (v17)
  {
    memset_s(v17, __smax, 0, __smax);
    free(v17);
  }
  return v4;
}

uint64_t sub_22D239A90()
{
  return sub_22D23938C();
}

uint64_t sub_22D239AA8()
{
  return sub_22D23938C();
}

uint64_t sub_22D239AC0()
{
  return sub_22D23938C();
}

uint64_t sub_22D239ADC()
{
  return sub_22D23938C();
}

uint64_t sub_22D239AF4()
{
  return sub_22D23938C();
}

uint64_t sub_22D239B0C()
{
  int v0;
  _DWORD *v1;
  _DWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  mach_port_t v6;
  mach_port_t v7;
  uint64_t result;
  void *v9;
  size_t __count;
  uint64_t input[2];
  _BYTE __src[32768];
  uint64_t v13;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = sub_22D230B74();
  if (v6)
  {
    v7 = v6;
    result = 3758097090;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input[0] = v5;
        input[1] = 0;
        result = IOConnectCallMethod(v7, 0x14u, input, 2u, 0, 0, 0, 0, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count)
          {
            v9 = calloc(__count, 1uLL);
            *v4 = v9;
            if (v9)
            {
              memcpy(v9, __src, __count);
              result = 0;
              *v2 = __count;
            }
            else
            {
              return 3758097085;
            }
          }
          else
          {
            return 3758097136;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drain_backup_keys", ":", 2072, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t sub_22D239CA4()
{
  int v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  mach_port_t v6;
  mach_port_t v7;
  uint64_t result;
  void *v9;
  size_t __count;
  uint64_t input[2];
  _BYTE __src[32768];
  uint64_t v13;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = sub_22D230B74();
  if (v6)
  {
    v7 = v6;
    result = 3758097090;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input[0] = v5;
        input[1] = 1;
        result = IOConnectCallMethod(v7, 0x14u, input, 2u, 0, 0, 0, 0, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count)
          {
            if (__ROR8__(0xEF7BDEF7BDEF7BDFLL * __count, 2) > 0x210842108421084uLL)
            {
              return 3758604298;
            }
            else
            {
              v9 = calloc(__count, 1uLL);
              *v4 = v9;
              if (v9)
              {
                memcpy(v9, __src, __count);
                result = 0;
                *v2 = __count / 0x7C;
              }
              else
              {
                return 3758097085;
              }
            }
          }
          else
          {
            return 3758097136;
          }
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drain_backup_keys_info", ":", 2100, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t sub_22D239E98(int a1)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v2 = sub_22D230B74();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0x16u, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_clear_backup_bag", ":", 2129, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D239F7C()
{
  int v0;
  _DWORD *v1;
  _DWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  mach_port_t v12;
  mach_port_t v13;
  _BYTE *outputStruct;
  size_t *p_count;
  uint64_t v16;
  uint64_t result;
  void *v18;
  size_t __count;
  uint64_t input[5];
  _BYTE __src[32768];
  uint64_t v22;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v22 = *MEMORY[0x24BDAC8D0];
  v12 = sub_22D230B74();
  if (!v12)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_backup_bag", ":", 2146, "", 0, "", "");
    return 3758097084;
  }
  v13 = v12;
  if (v4)
  {
    if (!v2)
      return 3758097090;
    outputStruct = __src;
    p_count = &__count;
    v16 = 1;
  }
  else
  {
    p_count = 0;
    outputStruct = 0;
    v16 = 0;
  }
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  input[0] = v11;
  input[1] = v10;
  input[2] = v16;
  input[3] = v8;
  input[4] = v6;
  result = IOConnectCallMethod(v13, 0x15u, input, 5u, 0, 0, 0, 0, outputStruct, p_count);
  if (v4 && !(_DWORD)result)
  {
    v18 = calloc(__count, 1uLL);
    *v4 = v18;
    if (v18)
    {
      memcpy(v18, __src, __count);
      result = 0;
      *v2 = __count;
    }
    else
    {
      return 3758097085;
    }
  }
  return result;
}

uint64_t sub_22D23A150(int a1, _DWORD *a2)
{
  uint64_t v4;
  mach_port_t v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097084;
  v5 = sub_22D230B74();
  if (v5)
  {
    if (a2)
    {
      output = 0;
      input[0] = a1;
      outputCnt = 1;
      v4 = IOConnectCallMethod(v5, 0x52u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!(_DWORD)v4)
        *a2 = output;
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_make_public_backup_bag", ":", 2178, "", 0, "", "");
  }
  return v4;
}

uint64_t sub_22D23A268()
{
  return sub_22D23938C();
}

uint64_t sub_22D23A280()
{
  return sub_22D23938C();
}

uint64_t sub_22D23A29C()
{
  return sub_22D23938C();
}

uint64_t sub_22D23A2B4()
{
  return sub_22D23A2C0();
}

uint64_t sub_22D23A2C0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint32_t v3;
  uint32_t v4;
  uint64_t v5;
  mach_port_t v6;
  mach_port_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  int v12[2];
  __int128 __s;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int v18;
  _BYTE outputStruct[4096];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v0;
  *(_QWORD *)v12 = 4096;
  v5 = 3758097084;
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  __s = 0u;
  v6 = sub_22D230B74();
  if (v6)
  {
    if (v2)
    {
      v7 = v6;
      bzero(outputStruct, 0x1000uLL);
      v8 = IOConnectCallMethod(v7, v4, input, 1u, 0, 0, 0, 0, outputStruct, (size_t *)v12);
      if ((_DWORD)v8)
      {
        return v8;
      }
      else
      {
        v5 = 0;
        if (!sub_22D242578((uint64_t)outputStruct, v12[0], (char *)&__s))
        {
          v9 = v16;
          *(_OWORD *)(v2 + 32) = v15;
          *(_OWORD *)(v2 + 48) = v9;
          *(_WORD *)(v2 + 64) = v17;
          v10 = v14;
          *(_OWORD *)v2 = __s;
          *(_OWORD *)(v2 + 16) = v10;
        }
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_get_device_state", ":", 2224, "", 0, "", "");
  }
  return v5;
}

uint64_t sub_22D23A454()
{
  return sub_22D23A2C0();
}

uint64_t sub_22D23A460()
{
  int v0;
  _DWORD *v1;
  _DWORD *v2;
  size_t v3;
  size_t v4;
  const void *v5;
  const void *v6;
  uint64_t v7;
  mach_port_t v8;
  mach_port_t v9;
  uint64_t v10;
  size_t v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t input;
  _BYTE outputStruct[4096];
  uint64_t v26;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v26 = *MEMORY[0x24BDAC8D0];
  v7 = 3758097084;
  v12[0] = 4096;
  input = v0;
  v8 = sub_22D230B74();
  if (v8)
  {
    if (v2)
    {
      v9 = v8;
      bzero(outputStruct, 0x1000uLL);
      memset_s(v2, 0x10uLL, 0, 0x10uLL);
      v10 = IOConnectCallMethod(v9, 0x39u, &input, 1u, v6, v4, 0, 0, outputStruct, v12);
      if ((_DWORD)v10)
      {
        return v10;
      }
      else
      {
        v17 = 0;
        v21 = 0u;
        v13 = 0u;
        v14 = 0u;
        v16 = 0u;
        v19 = 0u;
        v20 = 0u;
        v22 = 0u;
        v23 = 0;
        v12[1] = (size_t)off_255D66A88;
        v15 = (unint64_t)off_255D66A90;
        v18 = off_255D66A98;
        *(_QWORD *)&v21 = off_255D66AA0;
        sub_22D2406B8();
        *v2 = sub_22D2408D0();
        v2[1] = sub_22D2408D0();
        v2[2] = sub_22D2408D0();
        v7 = 0;
        v2[3] = sub_22D2408D0();
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_remote_peer_get_state", ":", 2255, "", 0, "", "");
  }
  return v7;
}

uint64_t sub_22D23A6C4(int a1, const void *a2, size_t a3)
{
  mach_port_t v5;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v5 = sub_22D230B74();
  if (v5)
    return IOConnectCallMethod(v5, 0x3Au, input, 1u, a2, a3, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_remote_peer_drop", ":", 2292, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23A7AC(int a1, int a2)
{
  mach_port_t v3;
  uint32_t v4;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v3 = sub_22D230B74();
  if (v3)
  {
    if (a2)
      v4 = 32;
    else
      v4 = 8;
    return IOConnectCallMethod(v3, v4, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lock_device", ":", 2307, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D23A89C(int a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x8Du, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lock_cx", ":", 2327, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23A974(int a1, uint64_t a2, int a3)
{
  mach_port_t v3;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  v3 = sub_22D230B74();
  if (v3)
    return IOConnectCallMethod(v3, 9u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unlock_device", ":", 2342, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23AA54()
{
  mach_port_t v0;

  v0 = sub_22D230B74();
  if (v0)
    return IOConnectCallMethod(v0, 0x13u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_obliterate_class_d", ":", 2355, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23AAF8(int a1, unsigned int a2, uint64_t a3, unsigned int a4, const void *a5, int a6)
{
  mach_port_t v12;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v12 = sub_22D230B74();
  if (v12)
  {
    input[0] = a1;
    input[1] = a2;
    input[2] = a3;
    input[3] = a4;
    return IOConnectCallMethod(v12, 0x3Fu, input, 4u, a5, a6, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_migrate_s_key", ":", 2367, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D23AC0C(int a1, uint64_t a2, uint64_t a3, unsigned int a4, const void *a5, size_t a6, _QWORD *a7, size_t *a8)
{
  mach_port_t v12;
  mach_port_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  size_t v17;
  size_t __count;
  _BYTE __src[2048];
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a4;
  input[2] = a2;
  input[3] = a3;
  __count = 2048;
  v12 = sub_22D230B74();
  if (v12)
  {
    v13 = v12;
    bzero(__src, 0x800uLL);
    v14 = IOConnectCallMethod(v13, 0x3Bu, input, 4u, a5, a6, 0, 0, __src, &__count);
    if ((_DWORD)v14)
    {
      return v14;
    }
    else if (__count > 0x800)
    {
      return 3758604298;
    }
    else
    {
      v15 = 0;
      if (a7 && a8)
      {
        if (__count)
        {
          v16 = calloc(__count, 1uLL);
          *a7 = v16;
          if (!v16)
            return 3758097085;
          memcpy(v16, __src, __count);
          v17 = __count;
        }
        else
        {
          v17 = 0;
        }
        v15 = 0;
        *a8 = v17;
      }
    }
  }
  else
  {
    v15 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_register", ":", 2388, "", 0, "", "");
  }
  return v15;
}

uint64_t sub_22D23ADB8(int a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x3Cu, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_unregister", ":", 2412, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23AE90(int a1, const void *a2, size_t a3, _QWORD *a4, size_t *a5)
{
  mach_port_t v9;
  mach_port_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  size_t v14;
  size_t __count;
  _BYTE __src[2048];
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  __count = 2048;
  v9 = sub_22D230B74();
  if (v9)
  {
    v10 = v9;
    bzero(__src, 0x800uLL);
    v11 = IOConnectCallMethod(v10, 0x3Du, input, 1u, a2, a3, 0, 0, __src, &__count);
    if ((_DWORD)v11)
    {
      return v11;
    }
    else if (__count > 0x800)
    {
      return 3758604298;
    }
    else
    {
      v12 = 0;
      if (a4 && a5)
      {
        if (__count)
        {
          v13 = calloc(__count, 1uLL);
          *a4 = v13;
          if (!v13)
            return 3758097085;
          memcpy(v13, __src, __count);
          v14 = __count;
        }
        else
        {
          v14 = 0;
        }
        v12 = 0;
        *a5 = v14;
      }
    }
  }
  else
  {
    v12 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_request_unlock", ":", 2429, "", 0, "", "");
  }
  return v12;
}

uint64_t sub_22D23B034(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, size_t *a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  mach_port_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  size_t v19;
  size_t __count;
  unsigned int inputStructCnt[3];
  _BYTE __src[2048];
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x800uLL);
  __count = 2048;
  sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  if (!*(_QWORD *)&inputStructCnt[1])
  {
    v17 = 3758097085;
    goto LABEL_12;
  }
  v15 = sub_22D230B74();
  if (!v15)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_smartcard_unlock", ":", 2460, "", 0, "", "");
    v17 = 3758097084;
    goto LABEL_12;
  }
  v16 = IOConnectCallMethod(v15, 0x3Eu, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
  if ((_DWORD)v16)
  {
    v17 = v16;
    goto LABEL_12;
  }
  if (__count > 0x800)
  {
    v17 = 3758604298;
    goto LABEL_12;
  }
  v17 = 0;
  if (a6 && a7)
  {
    if (!__count)
    {
      v19 = 0;
      goto LABEL_11;
    }
    v18 = calloc(__count, 1uLL);
    *a6 = v18;
    v17 = 3758097085;
    if (v18)
    {
      memcpy(v18, __src, __count);
      v19 = __count;
LABEL_11:
      v17 = 0;
      *a7 = v19;
    }
  }
LABEL_12:
  free(*(void **)&inputStructCnt[1]);
  return v17;
}

uint64_t sub_22D23B218(unint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    if (sub_22D23B260((uint64_t)off_255D66AB0, 0, a1, a2, a3, a4))
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  return result;
}

uint64_t sub_22D23B260(uint64_t a1, int a2, unint64_t a3, uint64_t a4, uint64_t *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = 0xFFFFFFFFLL;
  if (a6 && a3 && a4 && a5 && a3 + a4 > a3)
  {
    sub_22D2406B8();
    if (a2)
    {
      if (*a6 == 8)
      {
        v10 = sub_22D2408D0();
        result = 0;
        *a5 = v10;
        return result;
      }
      return 0xFFFFFFFFLL;
    }
    v11 = ccder_decode_tl();
    if (!v11)
      return 0xFFFFFFFFLL;
    v12 = v11;
    result = 0;
    *a5 = v12;
    *a6 = 0;
  }
  return result;
}

uint64_t sub_22D23B388(unint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    if (sub_22D23B260((uint64_t)off_255D66AE0, 0, a1, a2, a3, a4))
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  return result;
}

uint64_t sub_22D23B3D0(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 8;
  if (!a3)
    return 0xFFFFFFFFLL;
  v6 = 0;
  result = sub_22D23B260((uint64_t)off_255D66AC8, 1, a1, a2, &v6, &v5);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  *a3 = v6;
  return result;
}

uint64_t sub_22D23B43C(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v5 = 8;
  if (!a3)
    return 0xFFFFFFFFLL;
  v6 = 0;
  result = sub_22D23B260((uint64_t)off_255D66AC0, 1, a1, a2, &v6, &v5);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  *a3 = v6;
  return result;
}

uint64_t sub_22D23B4A8(int a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x47u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_fail", ":", 2589, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23B580(int a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x49u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_set_healthy", ":", 2605, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23B658(int a1, uint64_t a2, uint64_t a3)
{
  return sub_22D23B660(a1, a2, a3, 0x45u);
}

uint64_t sub_22D23B660(int a1, uint64_t a2, uint64_t a3, uint32_t a4)
{
  mach_port_t v5;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  v5 = sub_22D230B74();
  if (v5)
    return IOConnectCallMethod(v5, a4, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "__aks_se_set_secret", ":", 2621, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23B748(int a1, uint64_t a2, uint64_t a3)
{
  return sub_22D23B660(a1, a2, a3, 0x8Cu);
}

uint64_t sub_22D23B750(int a1, uint64_t a2, uint64_t a3)
{
  mach_port_t v3;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  v3 = sub_22D230B74();
  if (v3)
    return IOConnectCallMethod(v3, 0x46u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_recover", ":", 2649, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23B82C(int a1, uint64_t a2, uint64_t a3)
{
  mach_port_t v3;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  v3 = sub_22D230B74();
  if (v3)
    return IOConnectCallMethod(v3, 0x69u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_change_secret_epilogue", ":", 2665, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23B908()
{
  int v0;
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  mach_port_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  rsize_t __n[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE __s[4096];
  uint64_t input[4];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = v0;
  input[1] = v3;
  input[2] = v4;
  bzero(__s, 0x1000uLL);
  __n[0] = 4096;
  v5 = sub_22D230B74();
  if (!v5)
  {
    v8 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_get_reset_token_for_memento_secret", ":", 2683, "", 0, "", "");
    goto LABEL_10;
  }
  v6 = IOConnectCallMethod(v5, 0x48u, input, 3u, 0, 0, 0, 0, __s, __n);
  if ((_DWORD)v6)
  {
    v8 = v6;
    goto LABEL_10;
  }
  if (__n[0] - 4097 < 0xFFFFFFFFFFFFF000)
  {
    v8 = 3758604298;
    goto LABEL_10;
  }
  v15 = 0;
  v14 = 0u;
  v12 = 0u;
  v11 = 0u;
  __n[1] = (rsize_t)off_255D66B38;
  v13 = (unint64_t)off_255D66B40;
  sub_22D2406B8();
  if ((_QWORD)v11)
  {
    ccder_decode_tl();
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  if (!*((_QWORD *)&v13 + 1))
    goto LABEL_9;
  v7 = sub_22D2408D0();
  if (v7 > 0xFF)
    goto LABEL_9;
  v8 = 0;
  *v2 = v7;
LABEL_10:
  memset_s(__s, __n[0], 0, __n[0]);
  return v8;
}

uint64_t sub_22D23BB74()
{
  return sub_22D23B908();
}

uint64_t sub_22D23BB88(int a1, const void *a2, size_t a3)
{
  mach_port_t v5;
  size_t v6;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v5 = sub_22D230B74();
  if (v5)
  {
    if (a2)
      v6 = a3;
    else
      v6 = 0;
    return IOConnectCallMethod(v5, 0x58u, input, 1u, a2, v6, 0, 0, 0, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_set_nonce", ":", 2737, "", 0, "", "");
    return 3758097084;
  }
}

uint64_t sub_22D23BC74()
{
  int v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  mach_port_t v10;
  uint64_t v11;
  _BYTE *v12;
  int v13;
  void *v14;
  size_t v15;
  size_t __n;
  int __s;
  char v19;
  _BYTE v20[3];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v0;
  bzero(&__s, 0x1000uLL);
  __n = 4096;
  v9 = 3758097090;
  if (v8)
  {
    if (v6)
    {
      v9 = 3758097090;
      if (v4)
      {
        if (v2)
        {
          v10 = sub_22D230B74();
          if (v10)
          {
            v11 = IOConnectCallMethod(v10, 0x5Au, input, 1u, 0, 0, 0, 0, &__s, &__n);
            if ((_DWORD)v11)
            {
              v9 = v11;
            }
            else if (__n - 4097 < 0xFFFFFFFFFFFFF005)
            {
              v9 = 3758604298;
            }
            else
            {
              v12 = calloc(5uLL, 1uLL);
              *v4 = v12;
              if (v12)
              {
                *v2 = 5;
                v13 = __s;
                v12[4] = v19;
                *(_DWORD *)v12 = v13;
                v14 = calloc(__n - 5, 1uLL);
                *v8 = v14;
                v9 = 3758097085;
                if (v14)
                {
                  v15 = __n;
                  *v6 = __n - 5;
                  memcpy(v14, v20, v15);
                  v9 = 0;
                }
              }
              else
              {
                v9 = 3758097085;
              }
            }
          }
          else
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_get_reset_sig", ":", 2759, "", 0, "", "");
            v9 = 3758097084;
          }
        }
      }
    }
  }
  memset_s(&__s, __n, 0, __n);
  return v9;
}

uint64_t sub_22D23BE84()
{
  int v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  size_t v5;
  uint64_t v6;
  mach_port_t v7;
  uint64_t v8;
  void *v9;
  size_t __count;
  _BYTE __src[4096];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v0;
  v5 = 4096;
  bzero(__src, 0x1000uLL);
  __count = 4096;
  v6 = 3758097090;
  if (v4 && v2)
  {
    v7 = sub_22D230B74();
    if (v7)
    {
      v8 = IOConnectCallMethod(v7, 0x59u, input, 1u, 0, 0, 0, 0, __src, &__count);
      v5 = __count;
      if ((_DWORD)v8)
      {
        v6 = v8;
      }
      else if (__count - 4097 < 0xFFFFFFFFFFFFF000)
      {
        v6 = 3758604298;
      }
      else
      {
        v9 = calloc(__count, 1uLL);
        *v4 = v9;
        v5 = __count;
        if (v9)
        {
          *v2 = __count;
          memcpy(v9, __src, v5);
          v6 = 0;
          v5 = __count;
        }
        else
        {
          v6 = 3758097085;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_get_reset_pubkey", ":", 2791, "", 0, "", "");
      v5 = 4096;
      v6 = 3758097084;
    }
  }
  memset_s(__src, v5, 0, v5);
  return v6;
}

uint64_t sub_22D23C044(int a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x5Bu, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_delete_reset_token", ":", 2815, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23C11C(unsigned int a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x5Eu, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_support_in_rm", ":", 2832, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23C1F4(BOOL *a1)
{
  mach_port_t v2;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v2 = sub_22D230B74();
  if (v2)
  {
    result = IOConnectCallMethod(v2, 0x6Bu, 0, 0, 0, 0, output, &outputCnt, 0, 0);
    if (a1)
    {
      if (!(_DWORD)result)
        *a1 = output[0] != 0;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_support_in_rm_is_set", ":", 2848, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t sub_22D23C2F4()
{
  mach_port_t v0;

  v0 = sub_22D230B74();
  if (v0)
    return IOConnectCallMethod(v0, 0x5Fu, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_stage_stash", ":", 2865, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23C398()
{
  return sub_22D231D44();
}

uint64_t sub_22D23C3B8()
{
  return sub_22D231F8C();
}

uint64_t sub_22D23C3D4()
{
  uint64_t v0;
  _DWORD *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  mach_port_t v7;
  mach_port_t v8;
  uint64_t v9;
  __int128 v11;
  int v12[2];
  _BYTE __s[4096];
  uint64_t v14;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v14 = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v11 = __s;
  *((_QWORD *)&v11 + 1) = &v14;
  *(_QWORD *)v12 = 4096;
  v6 = 3758097090;
  if (v4 && v2)
  {
    v7 = sub_22D230B74();
    if (v7)
    {
      v8 = v7;
      if (sub_22D242164(&v11, v4) && sub_22D24227C(&v11, v5))
      {
        v6 = 3758097098;
        if (ccder_blob_encode_tl())
        {
          v9 = IOConnectCallMethod(v8, 0x55u, 0, 0, *((const void **)&v11 + 1), (size_t)&v14 - *((_QWORD *)&v11 + 1), 0, 0, __s, (size_t *)v12);
          if (!(_DWORD)v9)
            v9 = sub_22D242ABC((uint64_t)__s, *(uint64_t *)v12, v2);
          v6 = v9;
        }
      }
      else
      {
        v6 = 3758097098;
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_get_blob_state", ":", 2900, "", 0, "", "");
      v6 = 3758097084;
    }
  }
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v6;
}

uint64_t sub_22D23C5A8()
{
  return sub_22D23C3D4();
}

uint64_t sub_22D23C610()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  mach_port_t v6;
  mach_port_t v7;
  __int128 v9;
  uint32_t outputCnt;
  _BYTE __s[4096];
  uint64_t output;
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = v0;
  input[1] = *MEMORY[0x24BDAC8D0];
  v4 = 3758097098;
  output = 0;
  input[0] = v5;
  outputCnt = 1;
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v9 = __s;
  *((_QWORD *)&v9 + 1) = &output;
  if (v2)
  {
    v6 = sub_22D230B74();
    if (v6)
    {
      v7 = v6;
      if (sub_22D24227C(&v9, v3))
      {
        if (ccder_blob_encode_tl())
        {
          v4 = IOConnectCallMethod(v7, 0x4Eu, input, 1u, *((const void **)&v9 + 1), (size_t)&input[-1] - *((_QWORD *)&v9 + 1), &output, &outputCnt, 0, 0);
          if (!(_DWORD)v4)
            *v2 = output;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_get_size", ":", 2943, "", 0, "", "");
      v4 = 3758097084;
    }
  }
  else
  {
    v4 = 3758097090;
  }
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v4;
}

uint64_t sub_22D23C7AC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  mach_port_t v10;
  mach_port_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  size_t v16;
  _BYTE __s[4096];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = v0;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v8;
  bzero(__s, 0x1000uLL);
  *(_QWORD *)&v15 = __s;
  *((_QWORD *)&v15 + 1) = input;
  v16 = 4096;
  v9 = 3758097090;
  if (v6 && v4)
  {
    v10 = sub_22D230B74();
    if (!v10)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fv_import", ":", 2971, "", 0, "", "");
      v9 = 3758097084;
      goto LABEL_14;
    }
    v11 = v10;
    if (!ccder_blob_encode_body_tl()
      || !sub_22D242164(&v15, v6)
      || !sub_22D24227C(&v15, v7)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_12;
    }
    v12 = IOConnectCallMethod(v11, 0x4Fu, input, 1u, *((const void **)&v15 + 1), (size_t)input - *((_QWORD *)&v15 + 1), 0, 0, __s, &v16);
    if ((_DWORD)v12)
    {
      v9 = v12;
      goto LABEL_14;
    }
    *(_QWORD *)&v14 = __s;
    *((_QWORD *)&v14 + 1) = &__s[v16];
    if (!ccder_blob_decode_range())
      goto LABEL_12;
    if (!v2)
    {
      v9 = 0;
      goto LABEL_14;
    }
    v9 = 0;
    if ((sub_22D2421D0(&v14, 0, v2) & 1) == 0)
LABEL_12:
      v9 = 3758097098;
  }
LABEL_14:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v9;
}

uint64_t sub_22D23C9DC()
{
  return sub_22D23C610();
}

uint64_t sub_22D23C9EC()
{
  return sub_22D23C610();
}

uint64_t sub_22D23C9FC()
{
  return sub_22D231664();
}

uint64_t sub_22D23CA14()
{
  return sub_22D231AE8();
}

uint64_t sub_22D23CA30()
{
  return sub_22D230914();
}

uint64_t sub_22D23CA70()
{
  return sub_22D230914();
}

uint64_t sub_22D23CABC()
{
  return sub_22D231D44();
}

uint64_t sub_22D23CADC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 3758097090;
  result = sub_22D23C3D4();
  if (!(_DWORD)result)
    return 3758604312;
  return result;
}

uint64_t sub_22D23CB94()
{
  return sub_22D231D44();
}

uint64_t sub_22D23CBB4()
{
  return sub_22D231F8C();
}

uint64_t sub_22D23CBD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  _BYTE v12[4096];
  _BYTE v13[4096];
  uint64_t v14;

  MEMORY[0x24BDAC7A8]();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v14 = *MEMORY[0x24BDAC8D0];
  v8 = 3758097098;
  bzero(v13, 0x1000uLL);
  bzero(v12, 0x1000uLL);
  *(_QWORD *)&v11 = v13;
  *((_QWORD *)&v11 + 1) = &v14;
  *(_QWORD *)&v10 = v12;
  *((_QWORD *)&v10 + 1) = v13;
  if (sub_22D242164(&v11, v7)
    && sub_22D242164(&v11, v5)
    && ccder_blob_encode_tl()
    && sub_22D242164(&v10, v3)
    && sub_22D242164(&v10, v1)
    && ccder_blob_encode_tl())
  {
    return sub_22D231D44();
  }
  return v8;
}

uint64_t sub_22D23CD68()
{
  return sub_22D231D44();
}

uint64_t sub_22D23CD84()
{
  return sub_22D231D44();
}

uint64_t sub_22D23CDD4()
{
  _BYTE *v0;
  _BYTE *v1;
  _BYTE *v2;
  _BYTE *v3;
  uint64_t result;
  _BYTE v5[16384];
  uint64_t v6;

  MEMORY[0x24BDAC7A8]();
  v1 = v0;
  v3 = v2;
  v6 = *MEMORY[0x24BDAC8D0];
  bzero(v5, 0x4000uLL);
  result = sub_22D231D44();
  if (!(_DWORD)result)
  {
    if (ccder_decode_sequence_tl() && ccder_decode_tl())
    {
      __memcpy_chk();
      if (v3)
        *v3 = 0;
      if (v1)
        *v1 = 0;
      return 0;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t sub_22D23CF2C()
{
  return sub_22D231D44();
}

uint64_t sub_22D23CF4C(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = 8;
  if (a1)
    v1 = 12;
  v4 = v1;
  v2 = sub_22D231D44();
  syslog(6, "aks_fv_prot_cmd_stash_kek(%llu) = %d", v4, v2);
  return v2;
}

uint64_t sub_22D23CFC4()
{
  uint64_t v0;

  v0 = sub_22D231D44();
  syslog(6, "aks_fv_prot_cmd_stash_commit = %d", v0);
  return v0;
}

uint64_t sub_22D23D020()
{
  uint64_t v0;

  v0 = sub_22D231D44();
  syslog(6, "aks_fv_prot_cmd_stash_destroy = %d", v0);
  return v0;
}

uint64_t sub_22D23D07C()
{
  return sub_22D231F8C();
}

uint64_t sub_22D23D09C()
{
  return sub_22D231D44();
}

uint64_t sub_22D23D0BC()
{
  unsigned int v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  mach_port_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  mach_port_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  unsigned int inputStructCnt[3];
  size_t __count;
  _BYTE __src[32768];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  input[1] = *MEMORY[0x24BDAC8D0];
  v7 = 3758097084;
  input[0] = v0;
  bzero(__src, 0x8000uLL);
  __count = 0x8000;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  if (v4)
  {
    v8 = sub_22D230B74();
    if (v8)
    {
      v14 = v8;
      if (v6)
        v15 = v6;
      else
        v15 = "";
      sub_22D244254((char **)&inputStructCnt[1], inputStructCnt, 2, v9, v10, v11, v12, v13, (uint64_t)v15);
      v16 = IOConnectCallMethod(v14, 0x50u, input, 1u, *(const void **)&inputStructCnt[1], (int)inputStructCnt[0], 0, 0, __src, &__count);
      if ((_DWORD)v16)
      {
        v7 = v16;
      }
      else
      {
        v17 = calloc(__count, 1uLL);
        *v4 = v17;
        if (v17)
        {
          memcpy(v17, __src, __count);
          v7 = 0;
          *v2 = (int)__count;
        }
        else
        {
          v7 = 3758097085;
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_absinthe_collection", ":", 3220, "", 0, "", "");
    }
  }
  else
  {
    v7 = 3758097090;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  free(*(void **)&inputStructCnt[1]);
  return v7;
}

uint64_t sub_22D23D2BC(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, size_t *a7)
{
  uint64_t v7;
  mach_port_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  mach_port_t v17;
  size_t v19;
  int v20;
  char *v21;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  input[0] = a1;
  v20 = 0;
  v7 = 3758097090;
  if (a2 && a6 && a7)
  {
    v11 = sub_22D230B74();
    if (v11)
    {
      v17 = v11;
      sub_22D244254(&v21, (unsigned int *)&v20, 2, v12, v13, v14, v15, v16, a2);
      v19 = *a7;
      v7 = IOConnectCallMethod(v17, 0x51u, input, 1u, v21, v20, 0, 0, a6, &v19);
      if (!(_DWORD)v7)
        *a7 = (int)v19;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_absinthe_generate", ":", 3253, "", 0, "", "");
      v7 = 3758097084;
    }
  }
  free(v21);
  return v7;
}

uint64_t sub_22D23D444(unsigned int a1)
{
  mach_port_t v1;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = 0;
  input[1] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x53u, input, 2u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drop_auxiliary_auth_by_uid", ":", 3280, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23D51C(int a1)
{
  mach_port_t v1;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = 1;
  input[1] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x53u, input, 2u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_drop_auxiliary_auth_by_handle", ":", 3296, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23D5F8()
{
  mach_port_t v0;

  v0 = sub_22D230B74();
  if (v0)
    return IOConnectCallMethod(v0, 0x5Cu, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lower_iteration_count", ":", 3310, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23D69C(int a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x6Au, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_se_secret_drop", ":", 3326, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23D774(uint64_t a1, uint64_t a2)
{
  if (a1 && a2 && !sub_22D2333C4())
    sub_22D240938((uint64_t)off_255D66CC0);
  free(0);
  return 3758097084;
}

uint64_t sub_22D23D83C()
{
  return sub_22D2333C4();
}

uint64_t sub_22D23D84C()
{
  int v0;
  char *v1;
  char *v2;
  uint64_t v3;
  mach_port_t v4;
  uint64_t v5;
  rsize_t v6;
  rsize_t __n;
  _BYTE __s[4096];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  input[1] = *MEMORY[0x24BDAC8D0];
  v3 = 3758097090;
  input[0] = v0;
  bzero(__s, 0x1000uLL);
  __n = 4096;
  v4 = sub_22D230B74();
  if (!v4)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_internal_state", ":", 3379, "", 0, "", "");
    v3 = 3758097084;
    goto LABEL_11;
  }
  if (!v2)
  {
LABEL_11:
    v6 = 4096;
    goto LABEL_9;
  }
  v5 = IOConnectCallMethod(v4, 0x8Eu, input, 1u, 0, 0, 0, 0, __s, &__n);
  v6 = __n;
  if ((_DWORD)v5)
  {
    v3 = v5;
  }
  else if (__n - 4097 >= 0xFFFFFFFFFFFFF000)
  {
    if (sub_22D242578((uint64_t)__s, __n, v2))
      v3 = 3758097090;
    else
      v3 = 0;
    v6 = __n;
  }
LABEL_9:
  memset_s(__s, v6, 0, v6);
  return v3;
}

uint64_t sub_22D23D9C4(const void *a1, size_t a2, void *a3, size_t *a4)
{
  uint64_t result;
  mach_port_t v9;
  size_t v10;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = 266;
  result = 3758097090;
  if (a3 && a4)
  {
    v9 = sub_22D230B74();
    if (v9)
    {
      v10 = *a4;
      result = IOConnectCallMethod(v9, 0x68u, input, 1u, a1, a2, 0, 0, a3, &v10);
      if (!(_DWORD)result)
        *a4 = (int)v10;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fairplay_wrap", ":", 3405, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t sub_22D23DAE8(unsigned int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t result;
  mach_port_t v10;
  size_t v11;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = ((unint64_t)a1 << 8) | 1;
  result = 3758097090;
  if (a4 && a5)
  {
    v10 = sub_22D230B74();
    if (v10)
    {
      v11 = *a5;
      result = IOConnectCallMethod(v10, 0x68u, input, 1u, a2, a3, 0, 0, a4, &v11);
      if (!(_DWORD)result)
        *a5 = (int)v11;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_fairplay_generate_csk_internal", ":", 3429, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t sub_22D23DC14(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return sub_22D23DAE8(0, a1, a2, a3, a4);
}

uint64_t sub_22D23DC2C(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return sub_22D23DAE8(1u, a1, a2, a3, a4);
}

uint64_t sub_22D23DC44()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  size_t v5;
  size_t v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  mach_port_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  size_t v15;
  uint64_t input[2];
  _BYTE __s[16384];
  __int128 v18;
  _BYTE v19[28];
  uint64_t v20;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v0;
  v20 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  memset(v19, 0, sizeof(v19));
  bzero(__s, 0x4000uLL);
  v15 = 0x4000;
  input[0] = 1;
  input[1] = v9;
  v10 = sub_22D230B74();
  if (v10)
  {
    v11 = IOConnectCallMethod(v10, 0x87u, input, 2u, v8, v6, 0, 0, __s, &v15);
    if ((_DWORD)v11)
    {
      v13 = v11;
    }
    else
    {
      __memcpy_chk();
      *v2 = 44;
      v12 = calloc(0x2CuLL, 1uLL);
      *v4 = v12;
      if (v12)
      {
        __memcpy_chk();
        v13 = 0;
      }
      else
      {
        v13 = 3758097085;
      }
    }
  }
  else
  {
    v13 = 3758097084;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_bak_get_beacon_internal", ":", 3465, "", 0, "", "");
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  return v13;
}

uint64_t sub_22D23DE14()
{
  uint64_t v0;

  v0 = sub_22D23DC44();
  if ((_DWORD)v0)
    return v0;
  else
    return 3758604312;
}

uint64_t sub_22D23DF54()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  mach_port_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v13;
  __int128 v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  size_t v24;
  _BYTE __s[16384];
  _QWORD v26[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  int v36;
  uint64_t input[3];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = 2;
  input[1] = v0;
  v36 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  memset(v26, 0, sizeof(v26));
  bzero(__s, 0x4000uLL);
  v24 = 0x4000;
  v9 = sub_22D230B74();
  if (v9)
  {
    v10 = IOConnectCallMethod(v9, 0x87u, input, 2u, 0, 0, 0, 0, __s, &v24);
    if ((_DWORD)v10)
    {
      v11 = v10;
    }
    else
    {
      v11 = 3758097085;
      __memcpy_chk();
      v12 = calloc(0x28uLL, 1uLL);
      *v8 = v12;
      if (v12)
      {
        *v6 = 40;
        v13 = *(_OWORD *)&v26[1];
        v14 = *(_OWORD *)&v26[3];
        v12[4] = v26[5];
        *(_OWORD *)v12 = v13;
        *((_OWORD *)v12 + 1) = v14;
        v15 = calloc(0x91uLL, 1uLL);
        *v4 = v15;
        if (v15)
        {
          v11 = 0;
          *v2 = 145;
          v16 = v28;
          *v15 = v27;
          v15[1] = v16;
          v17 = v29;
          v18 = v30;
          v19 = v32;
          v15[4] = v31;
          v15[5] = v19;
          v15[2] = v17;
          v15[3] = v18;
          v20 = v33;
          v21 = v34;
          v22 = v35;
          *((_BYTE *)v15 + 144) = v36;
          v15[7] = v21;
          v15[8] = v22;
          v15[6] = v20;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_bak_get_swizzler_internal", ":", 3525, "", 0, "", "");
    v11 = 3758097084;
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  memset_s(v26, 0xC4uLL, 0, 0xC4uLL);
  return v11;
}

uint64_t sub_22D23E1A4()
{
  return sub_22D23DF54();
}

uint64_t sub_22D23E1BC(uint64_t a1)
{
  mach_port_t v2;

  v2 = sub_22D232B0C();
  if (v2)
    return IOConnectCallMethod(v2, 0xCu, 0, 0, *(const void **)a1, *(_QWORD *)(a1 + 8), 0, 0, 0, 0);
  else
    return 3758097084;
}

uint64_t sub_22D23E214()
{
  uint64_t v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  mach_port_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  size_t v8;
  size_t __count;
  _BYTE __src[16384];
  uint64_t v12;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = (_QWORD *)v0;
  v12 = *MEMORY[0x24BDAC8D0];
  bzero(__src, 0x4000uLL);
  __count = 0x4000;
  v4 = sub_22D230B74();
  if (v4)
  {
    v5 = 3758097090;
    if (v3 && v2)
    {
      v6 = IOConnectCallMethod(v4, 0x96u, 0, 0, 0, 0, 0, 0, __src, &__count);
      if ((_DWORD)v6)
      {
        v5 = v6;
      }
      else
      {
        v7 = calloc(__count, 1uLL);
        *v3 = v7;
        if (v7)
        {
          v8 = __count;
          *v2 = __count;
          memcpy(v7, __src, v8);
          v5 = 0;
        }
        else
        {
          v5 = 3758097085;
        }
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_dsme_key", ":", 3574, "", 0, "", "");
    v5 = 3758097084;
  }
  memset_s(__src, 0x4000uLL, 0, 0x4000uLL);
  return v5;
}

BOOL sub_22D23E3A0(uint64_t a1, uint64_t a2)
{
  return a2 == 4 || a2 == 32;
}

uint64_t sub_22D23E3B4()
{
  mach_port_t v0;

  v0 = sub_22D230B74();
  if (v0)
    return IOConnectCallMethod(v0, 0x73u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_prewarm_sps", ":", 3601, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23E458(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  mach_port_t v5;
  mach_port_t v6;
  size_t v7;
  uint64_t v8;
  char *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = 4294967285;
  if (a3 && a4 <= 0x30)
  {
    v4 = 3758097084;
    v5 = sub_22D230B74();
    if (v5)
    {
      v6 = v5;
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_uint64();
      ccder_sizeof_raw_octet_string();
      v7 = ccder_sizeof();
      MEMORY[0x24BDAC7A8]();
      v9 = (char *)v11 - v8;
      bzero((char *)v11 - v8, v7);
      ccder_encode_raw_octet_string();
      ccder_encode_uint64();
      ccder_encode_raw_octet_string();
      if ((char *)ccder_encode_constructed_tl() == v9)
        return IOConnectCallMethod(v6, 0x72u, 0, 0, v9, v7, 0, 0, 0, 0);
      else
        return 3758097090;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_sealed_hashes_set", ":", 3618, "", 0, "", "");
    }
  }
  return v4;
}

uint64_t sub_22D23E668(const void *a1, size_t a2)
{
  mach_port_t v4;

  v4 = sub_22D230B74();
  if (v4)
    return IOConnectCallMethod(v4, 0x90u, 0, 0, a1, a2, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_measure_and_seal_cryptex_manifest", ":", 3648, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23E71C()
{
  mach_port_t v0;

  v0 = sub_22D230B74();
  if (v0)
    return IOConnectCallMethod(v0, 0x95u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_seal_cryptex_manifest_lock", ":", 3662, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23E7C0(int a1, uint64_t a2, uint64_t a3)
{
  mach_port_t v3;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  v3 = sub_22D230B74();
  if (v3)
    return IOConnectCallMethod(v3, 0x85u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lkgp_recover", ":", 3678, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23E89C(int a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x8Au, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_memento_efface_blob", ":", 3694, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23E974()
{
  int v0;
  _BYTE *v1;
  _BYTE *v2;
  mach_port_t v3;
  uint64_t v4;
  rsize_t v5;
  uint64_t v6;
  rsize_t __n;
  _BYTE __s[4096];
  uint64_t input[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = v0;
  bzero(__s, 0x1000uLL);
  __n = 4096;
  v3 = sub_22D230B74();
  if (v3)
  {
    v4 = IOConnectCallMethod(v3, 0x8Bu, input, 1u, 0, 0, 0, 0, __s, &__n);
    v5 = __n;
    if ((_DWORD)v4)
    {
      v6 = v4;
    }
    else
    {
      v6 = 3758097090;
      if (__n - 4097 >= 0xFFFFFFFFFFFFF000)
      {
        if (sub_22D2427DC((uint64_t)__s, __n, v2))
          v6 = 3758097090;
        else
          v6 = 0;
        v5 = __n;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_memento_get_state", ":", 3712, "", 0, "", "");
    v6 = 3758097084;
    v5 = 4096;
  }
  memset_s(__s, v5, 0, v5);
  return v6;
}

uint64_t sub_22D23EAF0()
{
  mach_port_t v0;
  uint64_t input;

  v0 = sub_22D230B74();
  if (v0)
    return IOConnectCallMethod(v0, 0x89u, &input, 0, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_jcop_supports_updated_kud_policy", ":", 3732, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23EB94(uint64_t a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a1;
  v1 = sub_22D230B74();
  if (v1)
    return IOConnectCallMethod(v1, 0x97u, input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_cx_window", ":", 3748, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_22D23EC68()
{
  uint64_t v0;
  _QWORD *v1;
  mach_port_t v2;
  mach_port_t v3;
  uint64_t result;
  size_t v5;
  _QWORD outputStruct[513];

  v0 = MEMORY[0x24BDAC7A8]();
  outputStruct[512] = *MEMORY[0x24BDAC8D0];
  v5 = 4096;
  if (!v0)
    return 4294967285;
  v1 = (_QWORD *)v0;
  v2 = sub_22D230B74();
  if (v2)
  {
    v3 = v2;
    bzero(outputStruct, 0x1000uLL);
    result = IOConnectCallMethod(v3, 0x98u, 0, 0, 0, 0, 0, 0, outputStruct, &v5);
    if (!(_DWORD)result)
    {
      if (v5 == 8)
      {
        result = 0;
        *v1 = outputStruct[0];
      }
      else
      {
        return 3758604298;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_cx_window", ":", 3765, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t sub_22D23EDBC()
{
  return 0;
}

uint64_t sub_22D23EDC8()
{
  ccsha256_di();
  ccdigest();
  return 0;
}

unint64_t sub_22D23EE38(unsigned int a1)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return 1000000000 * info.denom * (unint64_t)a1 / info.numer;
}

unint64_t sub_22D23EE80(uint64_t a1)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return (unint64_t)info.numer * a1 / info.denom;
}

uint64_t sub_22D23EEBC()
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return mach_continuous_time() * info.numer / info.denom / 0x3E8;
}

__darwin_time_t sub_22D23EF0C()
{
  timeval v1;

  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec;
}

uint64_t sub_22D23EF38()
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return mach_continuous_time() * info.numer / info.denom / 0x3E8;
}

__darwin_time_t sub_22D23EF88()
{
  timeval v1;

  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec;
}

uint64_t sub_22D23EFB4(uint64_t a1)
{
  return 1000000 * a1;
}

unint64_t sub_22D23EFC4(uint64_t a1)
{
  return (a1 + 999999) / 0xF4240uLL;
}

_QWORD *sub_22D23EFDC(unsigned int a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;
  _QWORD *v6;
  size_t v7;
  void *v8;

  v2 = a1 + 1;
  v3 = v2 << 31 >> 31;
  if (v3 != v2 || v3 < 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s overflow%s\n", "aks", "", "", "", "circular_queue_init", ":", 337, "", 0, "", "");
    return 0;
  }
  else
  {
    v5 = calloc(0x20uLL, 1uLL);
    v6 = v5;
    if (v5)
    {
      v5[1] = 0;
      v7 = (v3 & 0x1FFFFFFFFLL) * a2;
      *(_DWORD *)v5 = a2;
      *((_DWORD *)v5 + 1) = v2;
      v8 = calloc(v7, 1uLL);
      v6[2] = v7;
      v6[3] = v8;
    }
  }
  return v6;
}

uint64_t sub_22D23F0B8(_DWORD *a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t result;

  v3 = a1[2];
  v2 = a1[3];
  result = v2 - v3;
  if (v2 < v3)
    return (result + a1[1]);
  return result;
}

uint64_t sub_22D23F0D4(unsigned int *a1, const void *a2)
{
  unsigned int v3;
  unsigned int v4;

  v3 = a1[3];
  v4 = (v3 + 1) % a1[1];
  memcpy((void *)(*((_QWORD *)a1 + 3) + *a1 * v3), a2, *a1);
  a1[3] = v4;
  if (v4 == a1[2])
    a1[2] = (v4 + 1) % a1[1];
  return 0;
}

uint64_t sub_22D23F13C(unsigned int *a1, void *__dst)
{
  unsigned int v2;
  uint64_t result;

  v2 = a1[2];
  if (v2 == a1[3])
    return 0xFFFFFFFFLL;
  if (__dst)
  {
    memcpy(__dst, (const void *)(*((_QWORD *)a1 + 3) + *a1 * v2), *a1);
    v2 = a1[2];
  }
  memset_s((void *)(*((_QWORD *)a1 + 3) + *a1 * v2), *a1, 0, *a1);
  result = 0;
  a1[2] = (a1[2] + 1) % a1[1];
  return result;
}

uint64_t sub_22D23F1C4(unsigned int *a1, void *__dst)
{
  unsigned int v2;

  v2 = a1[2];
  if (v2 == a1[3])
    return 0xFFFFFFFFLL;
  memcpy(__dst, (const void *)(*((_QWORD *)a1 + 3) + *a1 * v2), *a1);
  return 0;
}

uint64_t sub_22D23F208(int *a1, _QWORD *a2, unsigned int *a3)
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  char *v10;
  char *v11;
  unsigned int v12;
  unsigned int v13;
  const void *v14;
  size_t v15;
  uint64_t result;
  unsigned int v17;
  unsigned int v18;
  int v19;

  v7 = a1[2];
  v6 = a1[3];
  v8 = v6 - v7;
  if (v6 < v7)
    v8 += a1[1];
  if (!v8)
    return 0;
  v9 = *a1 * v8;
  v10 = (char *)calloc(v9, 1uLL);
  if (!v10)
    return 0xFFFFFFFFLL;
  v11 = v10;
  v12 = a1[2];
  v13 = a1[3];
  if (v13 <= v12)
  {
    if (v12 <= v13)
      goto LABEL_13;
    v17 = a1[1] - v12;
    memcpy(v10, (const void *)(*((_QWORD *)a1 + 3) + *a1 * v12), *a1 * v17);
    if (v8 <= v17)
      goto LABEL_13;
    v10 = &v11[*a1 * v17];
    v14 = (const void *)*((_QWORD *)a1 + 3);
    v15 = *a1 * (v8 - v17);
  }
  else
  {
    v14 = (const void *)(*((_QWORD *)a1 + 3) + *a1 * v12);
    v15 = *a1 * v8;
  }
  memcpy(v10, v14, v15);
LABEL_13:
  v18 = a1[1];
  v19 = *a1;
  a1[2] = (a1[2] + v8) % v18;
  memset_s(*((void **)a1 + 3), v19 * v18, 0, v19 * v18);
  result = 0;
  *a2 = v11;
  *a3 = v9;
  return result;
}

uint64_t sub_22D23F330(uint64_t a1)
{
  rsize_t v1;

  *(_QWORD *)(a1 + 8) = 0;
  v1 = (*(_DWORD *)a1 * *(_DWORD *)(a1 + 4));
  return memset_s(*(void **)(a1 + 24), v1, 0, v1);
}

void sub_22D23F350(void *a1)
{
  rsize_t v2;

  *((_QWORD *)a1 + 1) = 0;
  v2 = (*(_DWORD *)a1 * *((_DWORD *)a1 + 1));
  memset_s(*((void **)a1 + 3), v2, 0, v2);
  memset_s(*((void **)a1 + 3), *((_QWORD *)a1 + 2), 0, *((_QWORD *)a1 + 2));
  free(*((void **)a1 + 3));
  memset_s(a1, 0x20uLL, 0, 0x20uLL);
  free(a1);
}

uint64_t sub_22D23F3B8(unsigned int a1)
{
  return (a1 >> 5) & 1;
}

BOOL sub_22D23F3C0(uint8x16_t *a1)
{
  int8x16_t v1;
  int8x16_t v2;
  int8x16_t v3;

  v1 = (int8x16_t)vmovl_high_u8(*a1);
  v2 = (int8x16_t)vmovl_u8(*(uint8x8_t *)a1->i8);
  v3 = (int8x16_t)vmovl_u16((uint16x4_t)vorr_s8(vorr_s8(*(int8x8_t *)v2.i8, *(int8x8_t *)v1.i8), vorr_s8((int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL))));
  return vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)) != 0;
}

BOOL sub_22D23F404(unsigned __int8 *a1, uint64_t a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  v2 = 0;
  do
  {
    v3 = *a1++;
    v2 |= v3;
    --a2;
  }
  while (a2);
  return v2 != 0;
}

_DWORD *sub_22D23F430(_DWORD *result)
{
  if (result)
    return (_DWORD *)(*result != 0);
  return result;
}

uint64_t sub_22D23F444(char a1, int a2)
{
  return a1 & 0x1F | (32 * a2);
}

uint64_t sub_22D23F44C(unsigned int a1)
{
  return (a1 >> 6) & 1;
}

uint64_t sub_22D23F454(int a1)
{
  return a1 & 0xFFFFFFBF;
}

uint64_t sub_22D23F45C(int a1)
{
  return a1 | 0x40u;
}

uint64_t sub_22D23F464(char a1)
{
  char v1;

  v1 = a1 & 0x1F;
  if ((a1 & 0x1Fu) >= 0x14)
    v1 = -1;
  return ((a1 & 0x1Fu) < 0x14) & (0xC3FC0u >> v1);
}

uint64_t sub_22D23F48C(char a1)
{
  if ((a1 & 0x1Fu) > 0x13)
    return 0xFFFFFFFFLL;
  else
    return a1 & 0x1F;
}

uint64_t sub_22D23F49C(char a1)
{
  unsigned int v1;

  v1 = a1 & 0x1F;
  if (v1 > 0x13)
    v1 = -1;
  return (v1 < 0x12) & (0x2E03Eu >> v1);
}

uint64_t sub_22D23F4C4(char a1)
{
  return a1 & 0xF;
}

BOOL sub_22D23F4CC(int a1, int a2)
{
  return ((a2 ^ a1) & 0xF) == 0;
}

uint64_t sub_22D23F4DC()
{
  return cc_cmp_safe();
}

uint64_t sub_22D23F4F0(const char *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  const char *v4;
  FILE **v5;
  unint64_t v6;
  FILE **v7;
  uint64_t v8;
  unsigned __int8 *v9;
  char *v10;
  uint64_t v11;
  int v12;
  unint64_t v15;
  char __str[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  uint64_t v25;

  v3 = a3;
  v4 = a1;
  v25 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)__str = 0u;
  v17 = 0u;
  v5 = (FILE **)MEMORY[0x24BDAC8E8];
  if (a3 >= 0x41)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s %sdump %s (len = %zd)%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 782, "", 0, "", "", a1, a3, "", "");
    v4 = "";
  }
  else if (!a3)
  {
    return memset_s(__str, 0x81uLL, 0, 0x81uLL);
  }
  v6 = 0;
  v15 = v3;
  do
  {
    v7 = v5;
    if (v3 - v6 >= 0x40)
      v8 = 64;
    else
      v8 = v3 - v6;
    if (v8)
    {
      v9 = (unsigned __int8 *)(a2 + v6);
      v10 = __str;
      v11 = v8;
      do
      {
        v12 = *v9++;
        snprintf(v10, 3uLL, "%02x", v12);
        v10 += 2;
        --v11;
      }
      while (v11);
    }
    v5 = v7;
    fprintf(*v7, "%s%s:%s%s%s%s%u:%s%u:%s %s%s%s[%04zu,%04zu): %s%s%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 792, "", 0, "", "", v4, "", v6, v8 + v6, "", __str,
      "",
      "");
    v6 += v8;
    v3 = v15;
  }
  while (v6 < v15);
  return memset_s(__str, 0x81uLL, 0, 0x81uLL);
}

_BYTE *sub_22D23F6CC(unsigned __int8 *a1, unint64_t a2)
{
  uint64_t v2;
  char *v4;
  uint64_t v5;
  int v6;

  if (a2 >= 0x10)
    v2 = 16;
  else
    v2 = a2;
  if (v2)
  {
    v4 = byte_255D67258;
    v5 = v2;
    do
    {
      v6 = *a1++;
      snprintf(v4, 3uLL, "%02x", v6);
      v4 += 2;
      --v5;
    }
    while (v5);
  }
  byte_255D67258[2 * v2] = 0;
  return byte_255D67258;
}

uint64_t sub_22D23F75C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  _OWORD __s[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  if (a4 == 3)
  {
    ccsha256_di();
    cchmac();
    v5 = 0;
    *(_WORD *)a3 = __s[0];
    *(_BYTE *)(a3 + 2) = BYTE2(__s[0]);
  }
  else
  {
    v5 = 0xFFFFFFFFLL;
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v5;
}

uint64_t sub_22D23F824(const char *a1, uint64_t a2, uint64_t a3)
{
  __int16 v5;
  char v6;

  v6 = 0;
  v5 = 0;
  sub_22D23F75C(a2, a3, (uint64_t)&v5, 3);
  return sub_22D23F4F0(a1, (uint64_t)&v5, 3uLL);
}

char *sub_22D23F878(char *result, unint64_t a2)
{
  unint64_t v2;
  char *v3;
  char v4;

  if (a2 >= 2)
  {
    v2 = a2 >> 1;
    v3 = &result[a2 - 1];
    do
    {
      v4 = *result;
      *result++ = *v3;
      *v3-- = v4;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_22D23F8A8(unsigned __int8 *a1, unint64_t a2, _QWORD *a3, unint64_t *a4)
{
  uint64_t v5;
  unsigned __int8 *v6;
  unint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  char v16;
  char v17;
  char v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  char v22;
  char v23;

  v5 = 0xFFFFFFFFLL;
  if ((a2 & 1) == 0)
  {
    v6 = a1;
    if (a1)
    {
      if (a3 && a4)
      {
        v9 = a2 >> 1;
        v10 = calloc(a2 >> 1, 1uLL);
        if (v10)
        {
          if (a2 >= 2)
          {
            if (v9 <= 1)
              v11 = 1;
            else
              v11 = a2 >> 1;
            v12 = v10;
            do
            {
              v13 = *v6;
              v14 = v13 - 48;
              v15 = v13 - 97;
              if ((v13 - 65) >= 6)
                v16 = -1;
              else
                v16 = v13 - 55;
              v17 = v13 - 87;
              if (v15 > 5)
                v17 = v16;
              if (v14 < 0xA)
                v17 = v14;
              v18 = 16 * v17;
              v19 = v6[1];
              v20 = v19 - 48;
              v21 = v19 - 97;
              if ((v19 - 65) >= 6)
                v22 = -1;
              else
                v22 = v19 - 55;
              v23 = v19 - 87;
              if (v21 > 5)
                v23 = v22;
              if (v20 < 0xA)
                v23 = v20;
              *v12++ = v23 | v18;
              v6 += 2;
              --v11;
            }
            while (v11);
          }
          v5 = 0;
          *a3 = v10;
          *a4 = v9;
        }
        else
        {
          return 4294967279;
        }
      }
    }
  }
  return v5;
}

uint64_t sub_22D23F9AC(uint64_t result)
{
  if ((_DWORD)result == 0 || result >= 0xFFFFFFDA)
    return dword_22D2538D0[(int)result + 38];
  return result;
}

uint64_t sub_22D23F9C8(_QWORD *a1, uint64_t a2, char a3)
{
  uint64_t result;
  size_t v7;
  void *v8;
  const void *v9;

  memset_s(a1, 0x10uLL, 0, 0x10uLL);
  if ((a3 & 1) != 0)
    return 4294967285;
  if (a2 && *(_QWORD *)a2 && (v7 = *(_QWORD *)(a2 + 8)) != 0)
  {
    v8 = calloc(v7, 1uLL);
    if (v8)
    {
      *a1 = v8;
      v9 = *(const void **)a2;
      a1[1] = *(_QWORD *)(a2 + 8);
      memcpy(v8, v9, *(_QWORD *)(a2 + 8));
      return 0;
    }
    else
    {
      return 4294967279;
    }
  }
  else
  {
    result = 0;
    *a1 = 0;
    a1[1] = 0;
  }
  return result;
}

uint64_t sub_22D23FA5C(uint64_t result, int a2, const char *a3)
{
  if ((result & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s failed REQUIRE condition (%s:%d)\n%s\n", "aks", "", "", "", "REQUIRE_func", ":", 1043, "", 0, "", a3, a2, "");
    abort();
  }
  return result;
}

uint64_t sub_22D23FACC(__int128 *a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  int __s;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, sizeof(v14));
  sub_22D243914((uint64_t)v14, 0x20u);
  cccurve25519_make_pub();
  v8 = 0u;
  v9 = 0u;
  __s = 0x1000000;
  v4 = a2[1];
  v10 = *a2;
  v11 = v4;
  v5 = a1[1];
  v12 = *a1;
  v13 = v5;
  cccurve25519();
  ccsha256_di();
  ccdigest();
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  memset_s(v14, 0x20uLL, 0, 0x20uLL);
  return 0;
}

uint64_t sub_22D23FBB4(int *a1, uint64_t (*a2)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), char a3, uint64_t *a4, unsigned int a5, uint64_t a6, unsigned int *a7)
{
  uint64_t v8;
  int v14;
  unsigned int v15;
  _OWORD *v18;
  unsigned int v19;
  uint64_t (*v20)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t);
  uint64_t *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 *v26;
  _QWORD *v27;
  int v29;
  unsigned int v30;
  _OWORD __s[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  memset(__s, 0, sizeof(__s));
  v8 = 0xFFFFFFFFLL;
  if (!a6 || !a7)
    goto LABEL_40;
  if (!a1)
  {
LABEL_14:
    if (a2)
    {
      if (sub_22D230890(a5, &v30))
      {
        if (*a7 < v30)
          goto LABEL_40;
        v18 = 0;
        v19 = 0;
        v20 = a2;
        v21 = a4;
        goto LABEL_38;
      }
    }
    else
    {
      if ((a3 & 4) != 0)
      {
        if ((a5 & 0xF) != 0 || *a7 < a5)
          goto LABEL_40;
        v30 = a5;
        ccaes_cbc_encrypt_mode();
        sub_22D24042C();
LABEL_39:
        v8 = 0;
        *a7 = v30;
        goto LABEL_40;
      }
      if (sub_22D230890(a5, &v30))
      {
        if (*a7 < v30)
          goto LABEL_40;
        if ((a3 & 8) != 0)
        {
          ccsha256_di();
          cchkdf();
          v18 = __s;
        }
        else
        {
          v18 = a1 + 2;
        }
        v19 = 32;
        v20 = 0;
        v21 = a4;
LABEL_38:
        if (sub_22D230464((uint64_t)v18, v19, 0xA6A6A6A6A6A6A6A6, v20, v21, a5, (_QWORD *)a6, &v30))
          goto LABEL_40;
        goto LABEL_39;
      }
    }
    v8 = 4294967285;
    if ((a3 & 8) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
  v14 = *a1;
  if ((*a1 - 1) >= 2)
  {
    if (v14)
      goto LABEL_40;
    goto LABEL_14;
  }
  if ((a3 & 4) != 0)
    v15 = 64;
  else
    v15 = 72;
  v30 = v15;
  if (!a2 && a5 == 32 && *a7 >= v15)
  {
    if (v14 == 1)
    {
      sub_22D23FACC((__int128 *)(a1 + 9), &v32);
    }
    else
    {
      v23 = *(_OWORD *)(a1 + 5);
      v32 = *(_OWORD *)(a1 + 1);
      v33 = v23;
      v24 = *(_OWORD *)(a1 + 13);
      v34 = *(_OWORD *)(a1 + 9);
      v35 = v24;
    }
    if ((a3 & 0x80) == 0)
    {
      v25 = v33;
      *(_OWORD *)a6 = v32;
      *(_OWORD *)(a6 + 16) = v25;
      if ((a3 & 4) != 0)
      {
        ccaes_cbc_encrypt_mode();
        sub_22D24042C();
        goto LABEL_34;
      }
      v29 = 40;
      if ((a3 & 8) != 0)
      {
        ccsha256_di();
        cchkdf();
        v27 = (_QWORD *)(a6 + 32);
        v26 = __s;
      }
      else
      {
        v26 = &v34;
        v27 = (_QWORD *)(a6 + 32);
      }
      if (!sub_22D230464((uint64_t)v26, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, a4, 0x20u, v27, &v29))
      {
LABEL_34:
        v8 = 0;
        *a7 = v15;
        if ((a3 & 8) == 0)
          goto LABEL_42;
        goto LABEL_41;
      }
    }
  }
LABEL_40:
  if ((a3 & 8) != 0)
LABEL_41:
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_42:
  memset_s(&v32, 0x40uLL, 0, 0x40uLL);
  return v8;
}

uint64_t sub_22D23FF1C(__int128 *a1, uint64_t a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  int __s;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v7 = 0u;
  v3 = a1[1];
  v9 = *a1;
  v10 = v3;
  v4 = a3[1];
  v11 = *a3;
  __s = 0x1000000;
  v12 = v4;
  cccurve25519();
  ccsha256_di();
  ccdigest();
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  return 0;
}

uint64_t sub_22D23FFD8(uint64_t a1, uint64_t (*a2)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t), char a3, _QWORD *a4, unsigned int a5, _QWORD *a6, unsigned int *a7)
{
  uint64_t v8;
  _OWORD *v15;
  unsigned int v16;
  uint64_t (*v17)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t);
  _QWORD *v18;
  _OWORD *v19;
  int v21;
  unsigned int v22;
  _OWORD __s[2];
  _OWORD v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  memset(v24, 0, sizeof(v24));
  v8 = 0xFFFFFFFFLL;
  if (a4 && a5)
  {
    if (!a1)
      goto LABEL_6;
    if (*(_DWORD *)a1 != 1)
    {
      if (!*(_DWORD *)a1)
      {
LABEL_6:
        if (a5 <= 0x28)
        {
          if (a2)
          {
            if (sub_22D2308EC(a5, &v22) && *a7 >= v22)
            {
              v15 = 0;
              v16 = 0;
              v17 = a2;
              goto LABEL_30;
            }
          }
          else if ((a3 & 4) != 0)
          {
            if ((a5 & 0xF) == 0 && *a7 >= a5)
            {
              v22 = a5;
              ccaes_cbc_decrypt_mode();
              sub_22D24042C();
LABEL_31:
              v8 = 0;
              *a7 = v22;
              goto LABEL_35;
            }
          }
          else if (sub_22D2308EC(a5, &v22) && *a7 >= v22)
          {
            if ((a3 & 8) != 0)
            {
              ccsha256_di();
              cchkdf();
              v15 = v24;
            }
            else
            {
              v15 = (_OWORD *)(a1 + 8);
            }
            v16 = 32;
            v17 = 0;
LABEL_30:
            if (!sub_22D230828((uint64_t)v15, v16, 0xA6A6A6A6A6A6A6A6, v17, a4, a5, a6, &v22))
              goto LABEL_31;
            goto LABEL_40;
          }
        }
LABEL_38:
        v8 = 4294967285;
        goto LABEL_35;
      }
LABEL_22:
      v8 = 0xFFFFFFFFLL;
      goto LABEL_35;
    }
    v22 = 32;
    if (*a7 < 0x20)
      goto LABEL_38;
    memset(__s, 0, sizeof(__s));
    if ((a3 & 4) != 0)
    {
      if (a5 != 64)
        goto LABEL_38;
      sub_22D23FF1C((__int128 *)a4, a1 + 4, (__int128 *)(a1 + 36));
      ccaes_cbc_decrypt_mode();
      sub_22D24042C();
    }
    else
    {
      if (a5 != 72)
        goto LABEL_38;
      sub_22D23FF1C((__int128 *)a4, a1 + 4, (__int128 *)(a1 + 36));
      if (a3 < 0)
        goto LABEL_22;
      v21 = 32;
      if ((a3 & 8) != 0)
      {
        ccsha256_di();
        cchkdf();
        v18 = a4 + 4;
        v19 = v24;
      }
      else
      {
        v18 = a4 + 4;
        v19 = __s;
      }
      if (sub_22D230828((uint64_t)v19, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, v18, 0x28u, a6, &v21))
      {
        memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_40:
        v8 = 4294967277;
        goto LABEL_35;
      }
    }
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
    v8 = 0;
    *a7 = 32;
  }
LABEL_35:
  if ((a3 & 8) != 0)
    memset_s(v24, 0x20uLL, 0, 0x20uLL);
  return v8;
}

uint64_t sub_22D240328(uint64_t a1, _QWORD *a2, size_t *a3)
{
  size_t v5;
  void *v6;
  void *v7;
  uint64_t result;

  v5 = ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
  v6 = calloc(v5, 1uLL);
  if (!v6)
    return 4294967279;
  v7 = v6;
  ccec_export_pub();
  result = 0;
  *a2 = v7;
  *a3 = v5;
  return result;
}

unint64_t sub_22D2403A4()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

unint64_t sub_22D2403C4()
{
  return (((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
}

unint64_t sub_22D2403E8()
{
  return ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
}

unint64_t sub_22D24040C()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

uint64_t sub_22D24042C()
{
  return cccbc_one_shot();
}

uint64_t sub_22D240434()
{
  return ccecb_one_shot();
}

uint64_t sub_22D24043C()
{
  return cccbc_update();
}

BOOL sub_22D240444()
{
  return !ccec_import_pub() && ccn_read_uint() == 0;
}

uint64_t sub_22D2404BC()
{
  ccn_write_uint_padded();
  return 1;
}

uint64_t sub_22D2404F0(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  char v12;
  char v13;
  _QWORD *v14;

  if (*(_QWORD *)(a5 + 8) >= *(_QWORD *)a5)
  {
    v13 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = sub_22D2405EC(*(const void **)(*(_QWORD *)(a5 + 24) + v9), *(_QWORD *)(*(_QWORD *)(a5 + 24) + v9)+ *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a5 + 24) + v9) + 1)+ 2, a1);
      if (v11)
        break;
      ++v10;
      v9 += 40;
      if (v10 >= *(_QWORD *)a5)
        goto LABEL_10;
    }
    v14 = (_QWORD *)(*(_QWORD *)(a5 + 24) + v9);
    if (v14[1])
    {
      v12 = 0;
      *(_BYTE *)(a5 + 16) = 1;
    }
    else
    {
      ++*(_QWORD *)(a5 + 8);
      v14[1] = a3;
      v14[2] = a3 + a4;
      v14[3] = a3;
      v14[4] = a3 + a4;
      v12 = 1;
    }
LABEL_10:
    v13 = v12 | !v11;
  }
  return v13 & 1;
}

BOOL sub_22D2405D4(unsigned __int8 *a1, const void *a2)
{
  return sub_22D2405EC(a1, (uint64_t)&a1[a1[1] + 2], a2);
}

BOOL sub_22D2405EC(const void *a1, uint64_t a2, const void *a3)
{
  size_t v5;

  v5 = sub_22D240654((uint64_t)a1);
  return v5 == sub_22D240654((uint64_t)a3) && memcmp(a1, a3, v5) == 0;
}

uint64_t sub_22D240654(uint64_t a1)
{
  if (ccder_blob_decode_tag() && ccder_blob_decode_len())
    return a1 - a1;
  else
    return 0;
}

uint64_t sub_22D2406B8()
{
  uint64_t result;

  result = ccder_blob_decode_range();
  if ((_DWORD)result)
  {
    if (ccder_blob_decode_sequence_tl())
    {
      result = ccder_blob_decode_tl();
      if ((_DWORD)result)
        return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_22D24078C(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (a1)
  {
    sub_22D2406B8();
    if (a2)
    {
      if (a3)
      {
        *a2 = 0;
        *a3 = 0;
      }
    }
  }
  return 0;
}

BOOL sub_22D2407F8(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v8;

  v8 = sub_22D2405EC(*(const void **)a5, *(_QWORD *)a5 + *(unsigned __int8 *)(*(_QWORD *)a5 + 1) + 2, a1);
  if (v8)
  {
    *(_BYTE *)(a5 + 24) = 1;
    *(_QWORD *)(a5 + 8) = a3;
    *(_QWORD *)(a5 + 16) = a3 + a4;
  }
  return !v8;
}

uint64_t sub_22D240858(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
    return 0;
  if (result)
  {
    sub_22D2406B8();
    return 0;
  }
  return result;
}

uint64_t sub_22D2408D0()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t sub_22D240938(uint64_t result)
{
  if (result)
  {
    sub_22D2406B8();
    return 0;
  }
  return result;
}

double sub_22D2409D4(__int128 *a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  double result;
  __int128 v8;

  v8 = *a1;
  if (ccder_blob_decode_range())
  {
    *a4 = 0;
    *a3 = 0;
    result = *(double *)&v8;
    *a1 = v8;
  }
  return result;
}

uint64_t sub_22D240A40(uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t, _QWORD, uint64_t), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  *(_QWORD *)&v12 = a1;
  *((_QWORD *)&v12 + 1) = a2;
  v6 = ccder_blob_decode_range();
  if ((_DWORD)v6)
  {
    v11 = 0;
    v7 = v12;
    if (sub_22D240AF0(&v12, &v10, &v11))
    {
      do
      {
        v8 = v12 + v11;
        if (!a3(v7, v12 + v11 - v7, a4))
          break;
        *(_QWORD *)&v12 = v8;
        v7 = v8;
      }
      while ((sub_22D240AF0(&v12, &v10, &v11) & 1) != 0);
    }
  }
  return v6;
}

uint64_t sub_22D240AF0(__int128 *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  __int128 v7;

  v7 = *a1;
  result = ccder_blob_decode_tag();
  if ((_DWORD)result)
  {
    result = ccder_blob_decode_len();
    if ((_DWORD)result)
    {
      *a1 = v7;
      *a2 = 0;
      *a3 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t sub_22D240B6C()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t sub_22D240BC4(void **a1)
{
  void *v2;
  void *v3;

  if (!a1)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v2 = *a1;
    if (!*a1)
      break;
    v3 = (void *)*((_QWORD *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((_QWORD *)v2 + 2), 0, *((_QWORD *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t sub_22D240C3C(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD **v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *i;
  void *v6;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = (_QWORD **)a1;
  result = (uint64_t)sub_22D240CD0(a1, a2);
  if (result)
  {
    v4 = result;
    for (i = *v2; i != (_QWORD *)result; i = (_QWORD *)*i)
      v2 = (_QWORD **)i;
    *v2 = *(_QWORD **)result;
    v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(_QWORD *)(v4 + 16), 0, *(_QWORD *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

_QWORD *sub_22D240CD0(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD *v2;
  const void *v5;

  if (!a1)
    return 0;
  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    do
    {
      v5 = (const void *)v2[1];
      if (ccder_blob_decode_sequence_tl() && sub_22D2405EC(a2, (uint64_t)&a2[a2[1] + 2], v5))
        break;
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t sub_22D240D50(_QWORD *a1, unsigned __int8 *a2, int a3, _QWORD *a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;

  v8 = sub_22D240CD0(a1, a2);
  if (!v8)
    return 0;
  v9 = 1;
  if (a4)
  {
    if (a5)
    {
      v10 = v8[1] + v8[2];
      *(_QWORD *)&v15 = v8[1];
      *((_QWORD *)&v15 + 1) = v10;
      v9 = ccder_blob_decode_sequence_tl();
      if ((_DWORD)v9)
      {
        if (sub_22D240E2C(&v15, 12, 0, 0))
        {
          v11 = v15;
          if (ccder_blob_decode_tag())
          {
            if (ccder_blob_decode_len())
            {
              v13 = 0;
              v12 = v15;
              if (a3)
              {
                v13 = (v15 - v11);
                v12 = v11;
              }
              *a4 = v12;
              *a5 = v13;
            }
          }
        }
      }
    }
  }
  return v9;
}

uint64_t sub_22D240E2C(__int128 *a1, uint64_t a2, uint64_t a3, int a4)
{
  __int128 v8;

  v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0 || a3 && a4)
    return 0;
  *a1 = v8;
  return 1;
}

uint64_t sub_22D240EB8(_QWORD *a1, char *__s, void *a3, size_t a4)
{
  unsigned __int8 *v7;
  uint64_t result;
  void *__src;
  uint64_t v10;
  _BYTE v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[31];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(v18, 0, sizeof(v18));
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11[0] = 12;
  v11[1] = strlen(__s);
  v7 = (unsigned __int8 *)sub_22D240FE0((uint64_t)v11);
  result = 0xFFFFFFFFLL;
  if (a3 && v7)
  {
    __memcpy_chk();
    __src = 0;
    v10 = 0;
    if (sub_22D240D50(a1, v7, 0, &__src, &v10))
    {
      if (v10 == a4)
      {
        memcpy(a3, __src, a4);
        return 0;
      }
      else
      {
        return 4294967277;
      }
    }
    else
    {
      return 4294967293;
    }
  }
  return result;
}

uint64_t sub_22D240FE0(uint64_t a1)
{
  if ((ccder_blob_decode_tl() & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  return a1;
}

uint64_t sub_22D2410DC(_QWORD *a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v4 = sub_22D240D50(a1, a2, 1, &v7, &v8);
  v5 = v4;
  if (a3 && (_DWORD)v4)
    *a3 = sub_22D2408D0();
  return v5;
}

uint64_t sub_22D241134(_QWORD *a1, unsigned __int8 *a2, _BYTE *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v4 = sub_22D240D50(a1, a2, 1, &v7, &v8);
  v5 = v4;
  if (a3 && (_DWORD)v4)
    *a3 = sub_22D240B6C();
  return v5;
}

uint64_t sub_22D24118C(uint64_t a1)
{
  if (a1)
    return sub_22D2406B8() - 1;
  else
    return 4294967285;
}

uint64_t sub_22D2411C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unsigned __int8 *v8;
  uint64_t v9;

  v8 = (unsigned __int8 *)sub_22D240FE0(a1);
  if (v8)
  {
    v9 = (uint64_t)v8;
    if (!sub_22D240C3C(a5, v8) && !sub_22D241458(a5, v9, a3, a3 + a4))
      return 1;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", "", "", "", "_merge_dict_cb", ":", 647, "", 0, "", "");
  return 0;
}

uint64_t sub_22D241294(_QWORD *a1, _QWORD *a2, size_t *a3)
{
  uint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  rsize_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _OWORD *v15;
  size_t v16;
  char *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  char *v25;
  char *v26;

  v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        v7 = (_QWORD *)*a1;
        if (*a1)
        {
          v8 = 0;
          v9 = 0;
          v10 = 0;
          do
          {
            v10 += v7[2];
            v7 = (_QWORD *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (v11 = -v9, (v12 = calloc(-v9, 1uLL)) != 0))
          {
            v13 = v12;
            v14 = (_QWORD *)*a1;
            if (*a1)
            {
              v15 = v12;
              do
              {
                *v15++ = *(_OWORD *)(v14 + 1);
                v14 = (_QWORD *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_22D243684);
            v16 = ccder_sizeof();
            v17 = (char *)calloc(v16, 1uLL);
            v18 = v17;
            if (v17)
            {
              v25 = v17;
              v26 = &v17[v16];
              v19 = v8 - 1;
              v20 = (uint64_t)v13 - v9 - 8;
              while (!__CFADD__(v19++, 1))
              {
                v22 = v20 - 16;
                v23 = ccder_blob_encode_body();
                v20 = v22;
                if ((v23 & 1) == 0)
                  goto LABEL_16;
              }
              if (!ccder_blob_encode_tl() || v25 != v26)
              {
LABEL_16:
                v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              v3 = 0;
              *a2 = v18;
              *a3 = v16;
              v18 = 0;
            }
            else
            {
              v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t sub_22D241458(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  size_t v6;
  char *v7;
  char *v8;
  int v9;
  char *v10;
  int v11;
  char *v12;
  _QWORD *v14;
  _QWORD *v15;
  char *v16;
  char *v17;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    if (sub_22D240654(a3) <= (unint64_t)(a4 - a3))
    {
      v6 = ccder_sizeof();
      v7 = (char *)calloc(v6, 1uLL);
      if (!v7)
        return 4294967279;
      v8 = v7;
      v16 = &v7[v6];
      if (ccder_blob_encode_body())
      {
        v9 = ccder_blob_encode_body();
        v10 = v16;
        if (!v9)
          v10 = 0;
        v17 = v10;
        v11 = ccder_blob_encode_tl();
        v12 = v17;
        if (!v11)
          v12 = 0;
        if (v12 && v12 == v8)
        {
          v14 = calloc(0x18uLL, 1uLL);
          if (v14)
          {
            v15 = v14;
            result = 0;
            v15[1] = v8;
            v15[2] = v6;
            *v15 = *a1;
            *a1 = v15;
            return result;
          }
        }
      }
      memset_s(v8, v6, 0, v6);
      free(v8);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_22D2415C4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_22D241458(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t sub_22D2415D4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  size_t v5;
  char *v6;
  char *v7;
  int v8;
  char *v9;
  int v10;
  char *v11;
  BOOL v12;
  _QWORD *v13;
  _QWORD *v14;
  char *v15;
  char *v16;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    ccder_sizeof();
    v5 = ccder_sizeof();
    v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      v7 = v6;
      v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl())
        goto LABEL_19;
      v8 = ccder_blob_encode_body();
      v9 = v15;
      if (!v8)
        v9 = 0;
      v16 = v9;
      v10 = ccder_blob_encode_tl();
      v11 = v16;
      if (!v10)
        v11 = 0;
      v12 = v11 && v11 == v7;
      if (v12 && (v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v14 = v13;
        result = 0;
        v14[1] = v7;
        v14[2] = v5;
        *v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_22D241740(_QWORD *a1, char *__s, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  _BYTE v7[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[31];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, sizeof(v14));
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v8 = 0u;
  v7[0] = 12;
  v7[1] = strlen(__s);
  v5 = sub_22D240FE0((uint64_t)v7);
  result = 4294967285;
  if (a3)
  {
    if (v5)
    {
      __memcpy_chk();
      return sub_22D2415D4(a1, v5, a3);
    }
  }
  return result;
}

uint64_t sub_22D24182C(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  size_t v4;
  char *v5;
  char *v6;
  int v7;
  char *v8;
  int v9;
  char *v10;
  BOOL v11;
  _QWORD *v12;
  _QWORD *v13;
  char *v14;
  char *v15;

  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    v4 = ccder_sizeof();
    v5 = (char *)calloc(v4, 1uLL);
    if (v5)
    {
      v6 = v5;
      v14 = &v5[v4];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl())
        goto LABEL_18;
      v7 = ccder_blob_encode_body();
      v8 = v14;
      if (!v7)
        v8 = 0;
      v15 = v8;
      v9 = ccder_blob_encode_tl();
      v10 = v15;
      if (!v9)
        v10 = 0;
      v11 = v10 && v10 == v6;
      if (v11 && (v12 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v13 = v12;
        result = 0;
        v13[1] = v6;
        v13[2] = v4;
        *v13 = *a1;
        *a1 = v13;
      }
      else
      {
LABEL_18:
        memset_s(v6, v4, 0, v4);
        free(v6);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_22D241990(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int v16;
  char *v17;
  int v18;
  char *v19;
  BOOL v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  char *v24;
  _QWORD v25[2];

  v3 = a3;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    v10 = 8;
  }
  else
  {
    v6 = 9;
    v7 = 48;
    v8 = 1;
    while ((unint64_t)(v6 - 2) >= 2)
    {
      v9 = a3 >> v7;
      --v6;
      v7 -= 8;
      if ((_DWORD)v5 != v9)
      {
        v8 = v6 - 1;
        goto LABEL_8;
      }
    }
    v6 = 2;
LABEL_8:
    if ((((a3 >> (8 * v8 - 8)) ^ v5) & 0x80) != 0)
      v10 = v6;
    else
      v10 = v8;
  }
  v25[0] = 0;
  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    v12 = ccder_sizeof();
    v13 = (char *)calloc(v12, 1uLL);
    if (v13)
    {
      v14 = v13;
      v15 = v10;
      do
      {
        *((_BYTE *)v25 + v15 - 1) = v3;
        v3 >>= 8;
        --v15;
      }
      while (v15);
      v23 = &v13[v12];
      if ((ccder_blob_encode_body() & 1) == 0 || !ccder_blob_encode_tl())
        goto LABEL_30;
      v16 = ccder_blob_encode_body();
      v17 = v23;
      if (!v16)
        v17 = 0;
      v24 = v17;
      v18 = ccder_blob_encode_tl();
      v19 = v24;
      if (!v18)
        v19 = 0;
      v20 = v19 && v19 == v14;
      if (v20 && (v21 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v22 = v21;
        result = 0;
        v22[1] = v14;
        v22[2] = v12;
        *v22 = *a1;
        *a1 = v22;
      }
      else
      {
LABEL_30:
        memset_s(v14, v12, 0, v12);
        free(v14);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_22D241BA4(_QWORD *a1, uint64_t a2, char *__s)
{
  uint64_t result;
  size_t v5;
  char *v6;
  char *v7;
  int v8;
  char *v9;
  int v10;
  char *v11;
  BOOL v12;
  _QWORD *v13;
  _QWORD *v14;
  char *v15;
  char *v16;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && __s)
  {
    strlen(__s);
    ccder_sizeof();
    v5 = ccder_sizeof();
    v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      v7 = v6;
      v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl())
        goto LABEL_19;
      v8 = ccder_blob_encode_body();
      v9 = v15;
      if (!v8)
        v9 = 0;
      v16 = v9;
      v10 = ccder_blob_encode_tl();
      v11 = v16;
      if (!v10)
        v11 = 0;
      v12 = v11 && v11 == v7;
      if (v12 && (v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v14 = v13;
        result = 0;
        v14[1] = v7;
        v14[2] = v5;
        *v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_22D241D18(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  size_t v5;
  char *v7;
  int v8;
  char *v9;
  int v10;
  char *v11;
  BOOL v12;
  _QWORD *v13;
  char *v15;
  void *__s;
  rsize_t __n;
  char *v18;
  char *v19;

  v3 = 0;
  __s = 0;
  __n = 0;
  v4 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    v5 = 0;
    if (a3)
    {
      if (sub_22D241294(a3, &__s, &__n))
      {
        v3 = 0;
        v5 = 0;
      }
      else
      {
        v5 = ccder_sizeof();
        v7 = (char *)calloc(v5, 1uLL);
        v3 = v7;
        if (v7)
        {
          v15 = &v7[v5];
          if (!ccder_blob_encode_body())
            goto LABEL_23;
          v18 = v3;
          v19 = v15;
          v8 = ccder_blob_encode_body();
          v9 = v19;
          if (!v8)
            v9 = 0;
          v18 = v3;
          v19 = v9;
          v10 = ccder_blob_encode_tl();
          v11 = v19;
          if (!v10)
            v11 = 0;
          v12 = v11 && v11 == v3;
          if (v12 && (v13 = calloc(0x18uLL, 1uLL)) != 0)
          {
            v4 = 0;
            v13[1] = v3;
            v13[2] = v5;
            *v13 = *a1;
            *a1 = v13;
            v3 = 0;
          }
          else
          {
LABEL_23:
            v4 = 0xFFFFFFFFLL;
          }
        }
        else
        {
          v4 = 4294967279;
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  if (v3)
  {
    memset_s(v3, v5, 0, v5);
    free(v3);
  }
  return v4;
}

BOOL sub_22D241EB4(_QWORD *a1)
{
  return *a1 == 0;
}

uint64_t sub_22D241EC4()
{
  return ccder_sizeof();
}

uint64_t sub_22D241EDC()
{
  uint64_t v0;

  v0 = ccder_sizeof();
  return ccder_sizeof() + v0;
}

uint64_t sub_22D241F20(__int128 *a1, uint64_t a2)
{
  uint64_t result;
  __int128 v4;

  v4 = *a1;
  if (a2)
  {
    result = ccder_blob_encode_body_tl();
    if (!(_DWORD)result)
      return result;
    if ((ccder_blob_encode_body_tl() & 1) == 0)
      return 0;
  }
  else if (!ccder_blob_encode_body_tl() || (ccder_blob_encode_tl() & 1) == 0)
  {
    return 0;
  }
  *a1 = v4;
  return 1;
}

uint64_t sub_22D241FC8(__int128 *a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t result;
  int v10;
  __int128 v11;
  int *v12;
  uint64_t v13;
  __int128 v14;

  v6 = *(_QWORD *)a3;
  v5 = *(_QWORD *)(a3 + 8);
  v7 = *(_DWORD *)(a3 + 20);
  v11 = *a1;
  if (a2)
  {
    v14 = *a1;
    v12 = 0;
    v13 = 0;
    if ((ccder_blob_decode_range() & 1) == 0)
      return 0;
    v6 = (uint64_t)v12;
    v8 = v13 - (_DWORD)v12;
    v11 = v14;
  }
  else
  {
    LODWORD(v14) = v5;
    result = sub_22D2420CC(&v11, 4, v6, &v14);
    if (!(_DWORD)result)
      return result;
    v8 = v14;
  }
  v14 = v11;
  v12 = 0;
  v13 = 0;
  if ((ccder_blob_decode_range() & 1) == 0)
    return 0;
  v11 = v14;
  if ((v13 - (_DWORD)v12) > 4)
    return 0;
  v10 = *v12;
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v8;
  *(_DWORD *)(a3 + 16) = v10;
  *(_DWORD *)(a3 + 20) = v7;
  *a1 = v11;
  return 1;
}

uint64_t sub_22D2420CC(__int128 *a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  __int128 v8;

  v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0)
    return 0;
  if (a3)
  {
    if (a4)
      *a4 = 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t sub_22D242164(__int128 *a1, uint64_t a2)
{
  uint64_t result;
  __int128 v4;

  v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0)
      return 0;
  }
  else
  {
    result = ccder_blob_encode_tl();
    if (!(_DWORD)result)
      return result;
  }
  *a1 = v4;
  return 1;
}

uint64_t sub_22D2421D0(__int128 *a1, int a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unsigned int v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v6 = *a3;
  v5 = a3[1];
  v9 = *a1;
  if (a2)
  {
    v12 = *a1;
    v10 = 0;
    v11 = 0;
    result = ccder_blob_decode_range();
    if (!(_DWORD)result)
      return result;
    v6 = v10;
    v8 = v11 - v10;
    v9 = v12;
  }
  else
  {
    LODWORD(v12) = v5;
    result = sub_22D2420CC(&v9, 4, v6, &v12);
    if (!(_DWORD)result)
      return result;
    v8 = v12;
  }
  *a3 = v6;
  a3[1] = v8;
  *a1 = v9;
  return 1;
}

uint64_t sub_22D24227C(__int128 *a1, uint64_t a2)
{
  uint64_t result;
  __int128 v4;

  v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0)
      return 0;
  }
  else
  {
    result = ccder_blob_encode_tl();
    if (!(_DWORD)result)
      return result;
  }
  *a1 = v4;
  return 1;
}

uint64_t sub_22D2422EC(__int128 *a1)
{
  __int128 v3;

  v3 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0)
    return 0;
  *a1 = v3;
  return 1;
}

uint64_t sub_22D24236C(unsigned int *a1, int a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v8;
  uint64_t v10;
  size_t v11;
  void *v12;

  v12 = 0;
  if (sub_22D241990(&v12, (uint64_t)off_255D66A30, *a1)
    || sub_22D241990(&v12, (uint64_t)off_255D66A38, a1[1])
    || sub_22D241990(&v12, (uint64_t)off_255D66A40, *((_QWORD *)a1 + 1))
    || sub_22D241990(&v12, (uint64_t)off_255D66A50, a1[4])
    || sub_22D241990(&v12, (uint64_t)off_255D66A60, a1[5])
    || sub_22D241990(&v12, (uint64_t)off_255D66A78, *(_QWORD *)((char *)a1 + 26))
    || sub_22D241990(&v12, (uint64_t)off_255D66A80, *(_QWORD *)((char *)a1 + 34))
    || sub_22D241990(&v12, (uint64_t)off_255D66788, *(int *)((char *)a1 + 42))
    || sub_22D241990(&v12, (uint64_t)off_255D66950, *(unsigned int *)((char *)a1 + 46))
    || sub_22D2415D4(&v12, (uint64_t)off_255D66B48, (uint64_t)a1 + 50)
    || a2
    && (sub_22D241990(&v12, (uint64_t)off_255D66A68, *((char *)a1 + 66))
     || sub_22D241990(&v12, (uint64_t)off_255D66A70, *((char *)a1 + 67))
     || sub_22D241990(&v12, (uint64_t)off_255D66D48, *(_QWORD *)(a1 + 17))
     || sub_22D241990(&v12, (uint64_t)off_255D66D90, *(_QWORD *)(a1 + 19)))
    || (v10 = 0, v11 = 0, sub_22D241294(&v12, &v10, &v11)))
  {
    v8 = 0xFFFFFFFFLL;
  }
  else
  {
    v8 = 0;
    *a3 = v10;
    *a4 = v11;
  }
  sub_22D240BC4(&v12);
  return v8;
}

uint64_t sub_22D242578(uint64_t a1, int a2, char *__s)
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[57];
  __int128 v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  result = 0xFFFFFFFFLL;
  if (a2 && a1)
  {
    if (__s)
    {
      memset_s(__s, 0x54uLL, 0, 0x54uLL);
      bzero(v7, 0x228uLL);
      v7[4] = off_255D66A38;
      v7[9] = off_255D66A40;
      v7[14] = off_255D66A50;
      v7[19] = off_255D66A60;
      v7[24] = off_255D66A68;
      v7[29] = off_255D66A70;
      v7[34] = off_255D66A78;
      v7[39] = off_255D66A80;
      v7[44] = off_255D66788;
      v7[49] = off_255D66950;
      v7[54] = off_255D66B48;
      v9 = off_255D66D48;
      v10 = off_255D66D90;
      sub_22D2406B8();
      *(_DWORD *)__s = sub_22D2408D0();
      *((_DWORD *)__s + 1) = sub_22D2408D0();
      *((_QWORD *)__s + 1) = sub_22D2408D0();
      *((_DWORD *)__s + 4) = sub_22D2408D0();
      *((_DWORD *)__s + 5) = sub_22D2408D0();
      *(_QWORD *)(__s + 26) = sub_22D2408D0();
      *(_QWORD *)(__s + 34) = sub_22D2408D0();
      *(_DWORD *)(__s + 42) = sub_22D2408D0();
      *(_DWORD *)(__s + 46) = sub_22D2408D0();
      sub_22D240E2C(&v8, 4, (uint64_t)(__s + 50), 16);
      __s[66] = sub_22D2408D0();
      __s[67] = sub_22D2408D0();
      *(_QWORD *)(__s + 68) = sub_22D2408D0();
      v6 = sub_22D2408D0();
      result = 0;
      *(_QWORD *)(__s + 76) = v6;
    }
  }
  return result;
}

uint64_t sub_22D2427DC(uint64_t a1, int a2, _BYTE *__s)
{
  uint64_t result;
  int v6;

  result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (sub_22D2406B8())
    {
      *__s = sub_22D2408D0();
      *((_DWORD *)__s + 1) = sub_22D2408D0();
      *((_DWORD *)__s + 2) = sub_22D2408D0();
      v6 = sub_22D2408D0();
      result = 0;
      *((_DWORD *)__s + 3) = v6;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_22D242940(uint64_t a1, int a2, void *__s, void *a4, uint64_t a5)
{
  uint64_t result;
  __int128 v10[2];
  __int128 v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s && a4)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    memset_s(a4, 0x10uLL, 0, 0x10uLL);
    v12 = 0;
    v10[0] = 0u;
    v11 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10[1] = (unint64_t)off_255D66CF0;
    v13 = off_255D66828;
    sub_22D2406B8();
    if (sub_22D240E2C(v10, 4, (uint64_t)__s, 16)
      && sub_22D240E2C((__int128 *)((char *)&v11 + 8), 4, (uint64_t)a4, 16))
    {
      return sub_22D240E2C(&v15, 4, a5, 16) - 1;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_22D242ABC(uint64_t a1, uint64_t a2, _DWORD *__s)
{
  uint64_t result;
  int v6;
  int v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x58uLL, 0, 0x58uLL);
    v24 = 0u;
    v26 = 0;
    v27 = 0u;
    v28 = 0;
    v30 = 0u;
    v31 = 0u;
    v33 = 0;
    v34 = 0u;
    v35 = 0;
    v37 = 0u;
    v38 = 0u;
    v40 = 0;
    v41 = 0u;
    v42 = 0;
    v44 = 0u;
    v45 = 0u;
    v8 = 0u;
    v9 = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0;
    v23 = 0u;
    v10 = off_255D66808;
    *(_QWORD *)&v13 = off_255D66800;
    v16 = off_255D66820;
    *(_QWORD *)&v19 = off_255D66AA8;
    v22 = off_255D66A50;
    v25 = off_255D66A58;
    v29 = off_255D66950;
    v32 = off_255D66A40;
    v36 = off_255D66A48;
    v39 = off_255D66C08;
    v43 = off_255D66C70;
    sub_22D2406B8();
    *__s = sub_22D2408D0();
    if (sub_22D240E2C((__int128 *)((char *)&v8 + 8), 4, (uint64_t)(__s + 1), 16)
      && sub_22D240E2C(&v12, 4, (uint64_t)(__s + 5), 16)
      && (__s[9] = sub_22D2408D0(),
          __s[10] = sub_22D2408D0(),
          __s[11] = sub_22D2408D0(),
          __s[12] = sub_22D2408D0(),
          __s[15] = sub_22D2408D0(),
          __s[13] = sub_22D2408D0(),
          __s[14] = sub_22D2408D0(),
          sub_22D242DA0((__int128 *)((char *)&v20 + 8))))
    {
      v6 = __s[9];
      if ((v6 & 0x400) != 0)
      {
        *((_QWORD *)__s + 9) = sub_22D2408D0();
        v6 = __s[9];
      }
      if ((v6 & 0x800) != 0)
      {
        v7 = sub_22D2408D0();
        result = 0;
        __s[20] = v7;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_22D242DA0(__int128 *a1)
{
  uint64_t v2;
  __int128 v4;

  v4 = *a1;
  v2 = ccder_blob_decode_range();
  if ((v2 & 1) != 0)
    *a1 = v4;
  return v2;
}

uint64_t sub_22D242E24(int *a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v3;
  int v7;
  uint64_t v9;
  size_t v10;
  void *v11;

  v11 = 0;
  v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1 && (v7 = *a1) != 0)
    {
      if ((v7 & 1) != 0)
      {
        sub_22D241740(&v11, "persona_uuid", (uint64_t)(a1 + 1));
        v7 = *a1;
      }
      if ((v7 & 2) != 0)
        sub_22D241740(&v11, "volume_uuid", (uint64_t)(a1 + 5));
      v9 = 0;
      v10 = 0;
      if (!sub_22D241294(&v11, &v9, &v10))
      {
        v3 = 0;
        *a2 = v9;
        *a3 = v10;
      }
    }
    else
    {
      v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  sub_22D240BC4(&v11);
  return v3;
}

uint64_t sub_22D242EF8(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t v3;
  void *v6;

  v6 = 0;
  v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x24uLL, 0, 0x24uLL);
    if (sub_22D2406B8())
    {
      if (!sub_22D240EB8(&v6, "volume_uuid", __s + 20, 0x10uLL))
        *(_DWORD *)__s |= 2u;
      v3 = 0;
      if (!sub_22D240EB8(&v6, "persona_uuid", __s + 4, 0x10uLL))
        *(_DWORD *)__s |= 1u;
    }
    else
    {
      v3 = 0xFFFFFFFFLL;
    }
  }
  sub_22D240BC4(&v6);
  return v3;
}

uint64_t sub_22D242FD8(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v3;
  uint64_t v8;
  size_t v9;
  void *v10;

  v10 = 0;
  v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1)
    {
      if (!sub_22D241740(&v10, "options", a1) && !sub_22D241740(&v10, "kc", a1 + 8))
      {
        v8 = 0;
        v9 = 0;
        if (!sub_22D241294(&v10, &v8, &v9))
        {
          v3 = 0;
          *a2 = v8;
          *a3 = v9;
        }
      }
    }
    else
    {
      v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  sub_22D240BC4(&v10);
  return v3;
}

uint64_t sub_22D2430A0(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t v3;
  void *v6;

  v6 = 0;
  v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (sub_22D2406B8())
    {
      sub_22D240EB8(&v6, "options", __s, 8uLL);
      sub_22D240EB8(&v6, "kc", __s + 8, 4uLL);
      v3 = 0;
    }
    else
    {
      v3 = 0xFFFFFFFFLL;
    }
  }
  sub_22D240BC4(&v6);
  return v3;
}

uint64_t sub_22D243160(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = 0;
  v4 = *MEMORY[0x24BDAC8D0];
  if (a1 && a2)
  {
    if (off_255D66780)
      sub_22D2406B8();
    return 0;
  }
  return result;
}

uint64_t sub_22D243544(__int128 *a1, uint64_t a2, uint64_t *a3, _DWORD *a4)
{
  uint64_t result;
  __int128 v8;

  v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0)
    return 0;
  if (a3 && a4)
  {
    result = (uint64_t)calloc(0, 1uLL);
    if (!result)
      return result;
    *a3 = result;
    *a4 = 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t sub_22D2435FC(__int128 *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  __int128 v6;

  if (a3)
    *a3 = 0;
  v6 = *a1;
  result = ccder_blob_decode_range();
  if ((_DWORD)result)
  {
    if (ccn_read_uint())
    {
      return 0;
    }
    else
    {
      *a1 = v6;
      if (a3)
        *a3 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t sub_22D243684(const void **a1, void **a2)
{
  int v2;
  void *__s2;
  const void *v5;

  v5 = *a1;
  __s2 = *a2;
  if (!ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !v5
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !__s2)
  {
    return 4294967293;
  }
  v2 = memcmp(v5, __s2, 0);
  if (v2 > 0)
    return 1;
  else
    return ((v2 < 0) << 31 >> 31);
}

uint64_t sub_22D2437AC()
{
  sub_22D23FA5C(&off_24F86D588 != 0, 36, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return 4294967284;
}

uint64_t sub_22D2438B8()
{
  sub_22D23FA5C(&off_24F86D588 != 0, 62, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(sub_22D230098 != 0, 63, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return sub_22D230098();
}

uint64_t sub_22D243914(uint64_t a1, unsigned int a2)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 70, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(sub_22D230104 != 0, 71, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return sub_22D230104(a1, a2);
}

uint64_t sub_22D243988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 78, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 79, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_22D243A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 86, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 87, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_22D243B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 94, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 95, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_22D243BCC(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 106, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 107, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_22D243C98(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 115, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 116, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t sub_22D243D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 123, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 124, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5);
}

uint64_t sub_22D243E00()
{
  sub_22D23FA5C(&off_24F86D588 != 0, 131, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 132, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0]();
}

uint64_t sub_22D243E5C(uint64_t a1, uint64_t a2)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 139, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 140, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2);
}

uint64_t sub_22D243ED0(uint64_t a1)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 147, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 148, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_22D243F3C(uint64_t a1)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 155, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 156, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_22D243FA8(uint64_t a1)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 163, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 164, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_22D244014(uint64_t a1)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 172, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_22D244080(uint64_t a1)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 179, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 180, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_22D2440EC(uint64_t a1)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 187, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 188, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_22D244158(uint64_t a1)
{
  sub_22D23FA5C(&off_24F86D588 != 0, 195, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_22D23FA5C(0, 196, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_22D2441C4(int a1)
{
  return -a1 & 3;
}

char *sub_22D2441D0(_DWORD *a1, const void *a2, int a3)
{
  char *v3;
  int v5;
  size_t v6;
  int __s;

  v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    v5 = -a3;
    v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }
  else
  {
    *a1 = 0;
  }
  return v3;
}

char *sub_22D244254(char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v12;
  int v13;
  uint64_t *v14;
  char *result;
  char *v16;
  int v17;
  uint64_t v18;
  const void **v19;
  const void *v20;
  uint64_t *v21;
  const void **v22;

  v21 = &a9;
  v12 = 4;
  if (a3)
  {
    v13 = a3;
    do
    {
      v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }
    while (v13);
  }
  result = (char *)calloc(1uLL, v12);
  v16 = result;
  v22 = (const void **)&a9;
  v17 = 0;
  if (a3)
  {
    v18 = 4;
    do
    {
      v19 = v22;
      v20 = *v22;
      v22 += 2;
      result = sub_22D2441D0(&v16[v18], v20, *((_DWORD *)v19 + 2));
      v18 = result - v16;
      ++v17;
    }
    while (a3 != v17);
  }
  *(_DWORD *)v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

uint64_t sub_22D244330(unsigned int *a1, unint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v9;
  char *v11;
  void **v12;
  void *v13;
  char *v14;
  size_t v15;
  unsigned int v16;
  size_t *v17;
  void **v19;

  if (a2 < 4)
    return 0xFFFFFFFFLL;
  v9 = a3;
  if (*a1 >= a3)
  {
    v19 = (void **)&a9;
    if (!a3)
      return 0;
    v11 = (char *)(a1 + 1);
    while (1)
    {
      v12 = v19;
      v13 = *v19;
      v19 += 2;
      v16 = *(_DWORD *)v11;
      v14 = v11 + 4;
      v15 = v16;
      if (v16 > a2)
        break;
      if (v13)
      {
        v17 = (size_t *)v12[1];
        if (*v17 < v15)
          return 0xFFFFFFFFLL;
        memcpy(v13, v14, v15);
        *v17 = v15;
      }
      v11 = &v14[v15];
      if (!--v9)
        return 0;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x24BDAC2C8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x24BDBC690]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x24BDAD348]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x24BDAD350]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x24BDAD358]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x24BDAD360]();
}

uint64_t cccbc_clear_iv()
{
  return MEMORY[0x24BDAD398]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x24BDAD3A0]();
}

uint64_t cccbc_one_shot()
{
  return MEMORY[0x24BDAD3A8]();
}

uint64_t cccbc_update()
{
  return MEMORY[0x24BDAD3B8]();
}

uint64_t cccurve25519()
{
  return MEMORY[0x24BDAD3E0]();
}

uint64_t cccurve25519_make_pub()
{
  return MEMORY[0x24BDAD3F0]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x24BDAD408]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x24BDAD418]();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return MEMORY[0x24BDAD420]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x24BDAD428]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x24BDAD430]();
}

uint64_t ccder_blob_encode_body()
{
  return MEMORY[0x24BDAD440]();
}

uint64_t ccder_blob_encode_body_tl()
{
  return MEMORY[0x24BDAD448]();
}

uint64_t ccder_blob_encode_implicit_raw_octet_string()
{
  return MEMORY[0x24BDAD450]();
}

uint64_t ccder_blob_encode_implicit_uint64()
{
  return MEMORY[0x24BDAD458]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x24BDAD460]();
}

uint64_t ccder_decode_sequence_tl()
{
  return MEMORY[0x24BDAD480]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x24BDAD490]();
}

uint64_t ccder_encode_constructed_tl()
{
  return MEMORY[0x24BDAD4B0]();
}

uint64_t ccder_encode_raw_octet_string()
{
  return MEMORY[0x24BDAD4C8]();
}

uint64_t ccder_encode_uint64()
{
  return MEMORY[0x24BDAD4D8]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x24BDAD4E0]();
}

uint64_t ccder_sizeof_implicit_uint64()
{
  return MEMORY[0x24BDAD4F0]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x24BDAD510]();
}

uint64_t ccder_sizeof_uint64()
{
  return MEMORY[0x24BDAD520]();
}

uint64_t ccdigest()
{
  return MEMORY[0x24BDAD538]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x24BDAD5B0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x24BDAD5D0]();
}

uint64_t ccecb_one_shot()
{
  return MEMORY[0x24BDAD620]();
}

uint64_t cchkdf()
{
  return MEMORY[0x24BDAD690]();
}

uint64_t cchmac()
{
  return MEMORY[0x24BDAD6A8]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x24BDAD720]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x24BDAD730]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x24BDAD750]();
}

uint64_t ccrng()
{
  return MEMORY[0x24BDAD758]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x24BDAD928]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x24BDAE550](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x24BDAE558](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x24BDAE568](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x24BDAE570](a1, a2, *(_QWORD *)&a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

int sched_yield(void)
{
  return MEMORY[0x24BDAFC68]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x24BDAFF88](__big, __little, __len);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x24BDB00F0](*(_QWORD *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0308](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

