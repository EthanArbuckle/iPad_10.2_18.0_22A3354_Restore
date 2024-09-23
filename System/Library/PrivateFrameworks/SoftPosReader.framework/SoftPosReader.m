void sub_21596A5CC(void *a1, uint64_t a2, __int128 *a3, void *a4)
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v5 = (void *)MEMORY[0x24BDD1518];
  v15 = *a3;
  LODWORD(v16) = *((_DWORD *)a3 + 4);
  v6 = a4;
  objc_msgSend_decimalNumberWithDecimal_(v5, v7, (uint64_t)&v15, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(a1, v12, (uint64_t)v11, (uint64_t)v6, v13, v14, v15, v16);

}

void sub_21596A644(void *a1@<X0>, void *a2@<X2>, uint64_t a3@<X8>)
{
  id v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a1, v7, v6, (uint64_t)v5, v8, v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v15 = v16;
  if (v16
    || (objc_msgSend_notANumber(MEMORY[0x24BDD1518], v10, v11, v12, v13, v14),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = v15;
    objc_msgSend_decimalValue(v15, v10, v11, v12, v13, v14);

  }
  else
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_DWORD *)(a3 + 16) = 0;
  }
}

void sub_21596A7A8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  void *v7;
  _QWORD v8[15];
  _QWORD v9[16];

  v9[15] = *MEMORY[0x24BDAC8D0];
  v8[0] = &unk_24D3D4820;
  v8[1] = &unk_24D3D4838;
  v9[0] = CFSTR("Applet select failed");
  v9[1] = CFSTR("Attestation failed");
  v8[2] = &unk_24D3D4850;
  v8[3] = &unk_24D3D4868;
  v9[2] = CFSTR("Bad applet response");
  v9[3] = CFSTR("PIN length exceeded");
  v8[4] = &unk_24D3D4880;
  v8[5] = &unk_24D3D4898;
  v9[4] = CFSTR("Remove from empty buffer");
  v9[5] = CFSTR("Add digit failed");
  v8[6] = &unk_24D3D48B0;
  v8[7] = &unk_24D3D48C8;
  v9[6] = CFSTR("Digit out of range");
  v9[7] = CFSTR("Too few digits");
  v8[8] = &unk_24D3D48E0;
  v8[9] = &unk_24D3D48F8;
  v9[8] = CFSTR("Invalid key algorithm");
  v9[9] = CFSTR("Invalid format");
  v8[10] = &unk_24D3D4910;
  v8[11] = &unk_24D3D4928;
  v9[10] = CFSTR("Internal error");
  v9[11] = CFSTR("Key creation failed");
  v8[12] = &unk_24D3D4940;
  v8[13] = &unk_24D3D4958;
  v9[12] = CFSTR("Signature verification failed");
  v9[13] = CFSTR("XPC service disconnected");
  v8[14] = &unk_24D3D4970;
  v9[14] = CFSTR("XPC service unavailable");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v9, (uint64_t)v8, 15, a6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_254DEDF38;
  qword_254DEDF38 = v6;

}

BOOL SPRHTTPStatusIsSuccess(uint64_t a1)
{
  return (unint64_t)(a1 - 200) < 0x64;
}

BOOL SPRHTTPStatusIsClientError(uint64_t a1)
{
  return (unint64_t)(a1 - 400) < 0x64;
}

BOOL SPRHTTPStatusIsServerError(uint64_t a1)
{
  return (unint64_t)(a1 - 500) < 0x64;
}

id sub_21596E204(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  v11 = objc_msgSend_count(v3, v6, v7, v8, v9, v10);
  objc_msgSend_arrayWithCapacity_(v5, v12, v11, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v3, v17, v18, v19, v20, v21))
  {
    v22 = 0;
    do
    {
      v23 = (void *)objc_opt_new();
      objc_msgSend_objectAtIndexedSubscript_(v3, v24, v22, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setMerchantId_(v23, v29, (uint64_t)v28, v30, v31, v32);

      if (v22 < objc_msgSend_count(v4, v33, v34, v35, v36, v37))
      {
        v42 = (void *)MEMORY[0x24BDBCF48];
        v43 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_objectAtIndexedSubscript_(v4, v38, v22, v39, v40, v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v43, v45, (uint64_t)CFSTR("%@"), v46, v47, v48, v44);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_URLWithString_(v42, v50, (uint64_t)v49, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setVasUrl_(v23, v55, (uint64_t)v54, v56, v57, v58);

      }
      objc_msgSend_setVasTerminalProtocol_(v23, v38, 0x24D3D49A0, v39, v40, v41);
      objc_msgSend_addObject_(v16, v59, (uint64_t)v23, v60, v61, v62);

      ++v22;
    }
    while (v22 < objc_msgSend_count(v3, v63, v64, v65, v66, v67));
  }

  return v16;
}

uint64_t sub_21596ECF4(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v8;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], (const char *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return 0;
}

uint64_t sub_21596EE34(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v8;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], (const char *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return 0;
}

void sub_21596F68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21596F6B0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21596F6C0(uint64_t a1)
{

}

void sub_21596F6C8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_21596F6D8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  SPRPINCrypto *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7 && v8)
  {
    v10 = [SPRPINCrypto alloc];
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v11 + 40);
    v14 = objc_msgSend_initWithAttestationData_casdCertificate_error_(v10, v12, (uint64_t)v7, (uint64_t)v8, (uint64_t)&obj, v13);
    objc_storeStrong((id *)(v11 + 40), obj);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }

}

void sub_21596FA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_21596FA9C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_21596FAAC(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void sub_21596FC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21596FC24(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_21596FC34(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void sub_21596FDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21596FDE4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_21596FDF4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_21596FEF4(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  v3 = a2;
  objc_msgSend_xpcClient(SPRLogger, v4, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_215998708(a1, (uint64_t)v3, v9);

}

void sub_2159700B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2159700D4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_2159700E4(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void sub_215970258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21597027C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_21597028C(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

id sub_2159702C4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v7 = (void *)MEMORY[0x24BDD16A8];
  v8 = objc_msgSend_length(a1, a2, a3, a4, a5, a6);
  objc_msgSend_stringWithCapacity_(v7, v9, 2 * v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(a1, v14, v15, v16, v17, v18))
  {
    v19 = 0;
    do
    {
      v20 = objc_retainAutorelease(a1);
      v26 = objc_msgSend_bytes(v20, v21, v22, v23, v24, v25);
      objc_msgSend_appendFormat_(v13, v27, (uint64_t)CFSTR("%02X"), v28, v29, v30, *(unsigned __int8 *)(v26 + v19++));
    }
    while (v19 < objc_msgSend_length(v20, v31, v32, v33, v34, v35));
  }
  return v13;
}

id sub_21597036C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  char __str[2];
  char v59;

  v3 = objc_retainAutorelease(a3);
  v9 = objc_msgSend_UTF8String(v3, v4, v5, v6, v7, v8);
  v15 = 0;
  if (v3)
  {
    v16 = v9;
    if (v9)
    {
      if ((objc_msgSend_length(v3, v10, v11, v12, v13, v14) & 1) != 0)
      {
LABEL_16:
        v15 = 0;
        goto LABEL_17;
      }
      if (objc_msgSend_length(v3, v17, v18, v19, v20, v21))
      {
        v59 = 0;
        v27 = objc_msgSend_length(v3, v22, v23, v24, v25, v26);
        v28 = malloc_type_malloc(v27 >> 1, 0xE07566B0uLL);
        v34 = objc_msgSend_length(v3, v29, v30, v31, v32, v33);
        bzero(v28, v34 >> 1);
        if (objc_msgSend_length(v3, v35, v36, v37, v38, v39))
        {
          v45 = 0;
          v46 = MEMORY[0x24BDAC740];
          while (1)
          {
            *(_WORD *)__str = *(_WORD *)(v16 + v45);
            if (__str[0] < 0
              || (*(_DWORD *)(v46 + 4 * __str[0] + 60) & 0x10000) == 0
              || *(__int16 *)__str < 0
              || (*(_DWORD *)(v46 + ((4 * __str[1]) & 0x3FFFFFFFCLL) + 60) & 0x10000) == 0)
            {
              break;
            }
            *((_BYTE *)v28 + (v45 >> 1)) = strtoul(__str, 0, 16);
            v45 += 2;
            if (v45 >= objc_msgSend_length(v3, v47, v48, v49, v50, v51))
              goto LABEL_12;
          }
          free(v28);
          goto LABEL_16;
        }
LABEL_12:
        v52 = (void *)MEMORY[0x24BDBCE50];
        v53 = objc_msgSend_length(v3, v40, v41, v42, v43, v44);
        objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v52, v54, (uint64_t)v28, v53 >> 1, 1, v55);
        v56 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v22, 0, 0, v25, v26);
        v56 = objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)v56;
    }
  }
LABEL_17:

  return v15;
}

uint64_t sub_215970F38(void *a1, const char *a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  objc_msgSend_objectForKey_(a1, a2, a3, (uint64_t)a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v7;
  if (v7)
  {
    objc_opt_class();
    LOBYTE(v7) = objc_opt_isKindOfClass();
  }
  if (a4)
    *a4 = v7 & 1;
  if ((v7 & 1) != 0)
    v14 = objc_msgSend_BOOLValue(v13, v8, v9, v10, v11, v12);
  else
    v14 = 0;

  return v14;
}

uint64_t sub_215970FA8(void *a1, const char *a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  objc_msgSend_objectForKey_(a1, a2, a3, (uint64_t)a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v7;
  if (v7)
  {
    objc_opt_class();
    LOBYTE(v7) = objc_opt_isKindOfClass();
  }
  if (a4)
    *a4 = v7 & 1;
  if ((v7 & 1) != 0)
    v14 = objc_msgSend_integerValue(v13, v8, v9, v10, v11, v12);
  else
    v14 = 0;

  return v14;
}

void sub_215971018(void *a1@<X0>, const char *a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  objc_msgSend_objectForKey_(a1, a2, a3, (uint64_t)a4, a5, a6);
  v9 = objc_claimAutoreleasedReturnValue();
  v16 = (id)v9;
  if (v9)
  {
    objc_opt_class();
    LOBYTE(v9) = objc_opt_isKindOfClass();
  }
  if (a4)
    *a4 = v9 & 1;
  if ((v9 & 1) != 0)
  {
    v15 = v16;
    if (!v16)
    {
      *(_QWORD *)a7 = 0;
      *(_QWORD *)(a7 + 8) = 0;
      *(_DWORD *)(a7 + 16) = 0;
      goto LABEL_11;
    }
    objc_msgSend_decimalValue(v16, v10, v11, v12, v13, v14);
  }
  else
  {
    *(_QWORD *)a7 = 0;
    *(_QWORD *)(a7 + 8) = 0;
    *(_DWORD *)(a7 + 16) = 0;
  }
  v15 = v16;
LABEL_11:

}

double sub_2159710A8(void *a1, const char *a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;

  objc_msgSend_objectForKey_(a1, a2, a3, (uint64_t)a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v7;
  if (v7)
  {
    objc_opt_class();
    LOBYTE(v7) = objc_opt_isKindOfClass();
  }
  if (a4)
    *a4 = v7 & 1;
  v14 = 0.0;
  if ((v7 & 1) != 0)
  {
    objc_msgSend_doubleValue(v13, v8, v9, v10, v11, v12);
    v14 = v15;
  }

  return v14;
}

uint64_t sub_21597111C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = MEMORY[0x24BDD17C8];
  v7 = objc_msgSend_BOOLValue(a1, a2, a3, a4, a5, a6);
  return MEMORY[0x24BEDD108](v6, sel_stringWithBool_, v7, v8, v9, v10);
}

__CFString *sub_215971148(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
    return CFSTR("true");
  else
    return CFSTR("false");
}

void sub_2159711D8(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = objc_opt_class();
  objc_msgSend_bundleForClass_(v2, v4, v3, v5, v6, v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_initWithBundle_timestamp_(v1, v8, (uint64_t)v13, (uint64_t)CFSTR("Wed Dec 31 16:00:00 1969"), v9, v10);
  v12 = (void *)qword_253F0F458;
  qword_253F0F458 = v11;

}

void sub_215971888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2159718AC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2159718BC(uint64_t a1)
{

}

void sub_2159718C4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_2159718D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_215971ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_215971AE0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215971AF0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_215971C78(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_215971D10;
  v7[3] = &unk_24D3CCE00;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t sub_215971D10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void sub_215971D24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_215971DE8;
  block[3] = &unk_24D3CCE50;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t sub_215971DE8(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_215971F3C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_215971FD4;
  v7[3] = &unk_24D3CCEA0;
  v8 = v4;
  v9 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t sub_215971FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_onFailureWithError_, *(_QWORD *)(a1 + 40), a4, a5, a6);
}

void sub_215971FE0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2159720A4;
  block[3] = &unk_24D3CCEF0;
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

_QWORD *sub_2159720A4(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  v6 = result[4];
  if (v6)
    return (_QWORD *)MEMORY[0x24BEDD108](result[5], sel_onSuccessWithInstallData_, v6, a4, a5, a6);
  v7 = result[6];
  if (v7)
    return (_QWORD *)MEMORY[0x24BEDD108](result[5], sel_onFailureWithError_, v7, a4, a5, a6);
  return result;
}

void sub_21597224C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_215972270(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215972280(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

const __CFString *SPRTransactionTypeCopyDescription(int a1)
{
  if (a1 > 22)
  {
    switch(a1)
    {
      case 23:
        return CFSTR("pre-authorization completion");
      case 32:
        return CFSTR("refund");
      case 34:
        return CFSTR("purchase correction");
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        return CFSTR("purchase");
      case 2:
        return CFSTR("refund correction");
      case 3:
        return CFSTR("pre-authorization");
    }
  }
  return CFSTR("invalid");
}

void sub_2159725F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_215972618(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_215972628(uint64_t a1)
{

}

void sub_215972630(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215972640(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void spr_releaseCFObject(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

void sub_2159727EC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_215972884;
  v7[3] = &unk_24D3CCE00;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t sub_215972884(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void sub_215972898(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21597295C;
  block[3] = &unk_24D3CCE50;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t sub_21597295C(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_215972AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_215972AC4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_215972AD4(uint64_t a1)
{

}

void sub_215972ADC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215972AEC(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void sub_215972BE4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_215972C7C;
  v7[3] = &unk_24D3CCE00;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t sub_215972C7C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void sub_215972C90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_215972D54;
  block[3] = &unk_24D3CCE50;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t sub_215972D54(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_215972EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215972EC8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215972ED8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

const __CFString *SPRReaderModeCopyDescription(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("invalid");
  else
    return off_24D3CD0A8[a1];
}

void sub_215973574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21597358C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21597359C(uint64_t a1)
{

}

void sub_2159735A4(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  v3 = a2;
  objc_msgSend_xpcClient(SPRLogger, v4, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_215998790(a1, (uint64_t)v3, v9);

}

void sub_21597360C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_2159736A4(uint64_t a1)
{
  SPRProvider *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  v2 = [SPRProvider alloc];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_215973728;
  v10[3] = &unk_24D3CD120;
  v10[4] = *(_QWORD *)(a1 + 32);
  v7 = objc_msgSend_initWithConnector_(v2, v3, (uint64_t)v10, v4, v5, v6);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

}

id sub_215973728(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_21597358C;
  v29 = sub_21597359C;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_21597358C;
  v23 = sub_21597359C;
  v24 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_215973884;
  v18[3] = &unk_24D3CCCC0;
  v18[4] = &v25;
  objc_msgSend_syncProxyWithErrorHandler_(v8, a2, (uint64_t)v18, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = sub_215973894;
  v17[3] = &unk_24D3CD0F8;
  v17[4] = &v19;
  objc_msgSend_providerProxyWithReply_(v9, v10, (uint64_t)v17, v11, v12, v13);

  if (a2)
  {
    v14 = (void *)v26[5];
    if (v14)
      *(_QWORD *)a2 = objc_retainAutorelease(v14);
  }
  v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_215973860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_215973884(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215973894(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215973A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_215973A9C(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[7];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_21597358C;
  v35 = sub_21597359C;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_21597358C;
  v29 = sub_21597359C;
  v30 = 0;
  objc_msgSend_shared(SPRServiceClient, a2, a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_215973C30;
  v24[3] = &unk_24D3CCCC0;
  v24[4] = &v31;
  objc_msgSend_syncProxyWithErrorHandler_(v8, v10, (uint64_t)v24, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(*(_QWORD *)(v15 + 8) + 40);
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = sub_215973C40;
  v23[3] = &unk_24D3CD170;
  v23[4] = &v25;
  v23[5] = v15;
  v23[6] = &v31;
  objc_msgSend_primerProxyWithConfiguration_reply_(v14, v17, v16, (uint64_t)v23, v18, v19);

  if (a2)
  {
    v20 = (void *)v32[5];
    if (v20)
      *(_QWORD *)a2 = objc_retainAutorelease(v20);
  }
  v21 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v21;
}

void sub_215973C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215973C30(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215973C40(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  if (v8)
  {
    v30 = v10;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = v9;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v31, (uint64_t)v35, 16, v13);
    if (v14)
    {
      v19 = v14;
      v20 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v11);
          v22 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v23 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
          objc_msgSend_objectForKeyedSubscript_(v11, v15, v22, v16, v17, v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setValue_forKey_(v23, v25, (uint64_t)v24, v22, v26, v27);

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v15, (uint64_t)&v31, (uint64_t)v35, 16, v18);
      }
      while (v19);
    }

    v10 = v30;
  }
  v28 = *(_QWORD *)(a1[6] + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v10;

}

id sub_215973FE0(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_21597358C;
  v29 = sub_21597359C;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_21597358C;
  v23 = sub_21597359C;
  v24 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_215974144;
  v18[3] = &unk_24D3CCCC0;
  v18[4] = &v25;
  objc_msgSend_syncProxyWithErrorHandler_(v8, a2, (uint64_t)v18, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = sub_215974154;
  v17[3] = &unk_24D3CD1C0;
  v17[4] = &v19;
  v17[5] = &v25;
  objc_msgSend_secureChannelProxyWithReply_(v9, v10, (uint64_t)v17, v11, v12, v13);

  if (a2)
  {
    v14 = (void *)v26[5];
    if (v14)
      *(_QWORD *)a2 = objc_retainAutorelease(v14);
  }
  v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_215974120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215974144(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215974154(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

id sub_2159742D0(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_215974434;
  v29 = sub_215974444;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_215974434;
  v23 = sub_215974444;
  v24 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_21597444C;
  v18[3] = &unk_24D3CCCC0;
  v18[4] = &v25;
  objc_msgSend_syncProxyWithErrorHandler_(v8, a2, (uint64_t)v18, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = sub_21597445C;
  v17[3] = &unk_24D3CD210;
  v17[4] = &v19;
  v17[5] = &v25;
  objc_msgSend_configuratorProxyWithReply_(v9, v10, (uint64_t)v17, v11, v12, v13);

  if (a2)
  {
    v14 = (void *)v26[5];
    if (v14)
      *(_QWORD *)a2 = objc_retainAutorelease(v14);
  }
  v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_215974410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_215974434(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_215974444(uint64_t a1)
{

}

void sub_21597444C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_21597445C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

id sub_215974558(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_215974434;
  v29 = sub_215974444;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_215974434;
  v23 = sub_215974444;
  v24 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_2159746BC;
  v18[3] = &unk_24D3CCCC0;
  v18[4] = &v25;
  objc_msgSend_syncProxyWithErrorHandler_(v8, a2, (uint64_t)v18, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = sub_2159746CC;
  v17[3] = &unk_24D3CD260;
  v17[4] = &v19;
  v17[5] = &v25;
  objc_msgSend_monitorProxyWithReply_(v9, v10, (uint64_t)v17, v11, v12, v13);

  if (a2)
  {
    v14 = (void *)v26[5];
    if (v14)
      *(_QWORD *)a2 = objc_retainAutorelease(v14);
  }
  v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_215974698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2159746BC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_2159746CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

id sub_2159747C8(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_215974434;
  v29 = sub_215974444;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_215974434;
  v23 = sub_215974444;
  v24 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_21597492C;
  v18[3] = &unk_24D3CCCC0;
  v18[4] = &v25;
  objc_msgSend_syncProxyWithErrorHandler_(v8, a2, (uint64_t)v18, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = sub_21597493C;
  v17[3] = &unk_24D3CD2B0;
  v17[4] = &v19;
  v17[5] = &v25;
  objc_msgSend_readerProxyWithReply_(v9, v10, (uint64_t)v17, v11, v12, v13);

  if (a2)
  {
    v14 = (void *)v26[5];
    if (v14)
      *(_QWORD *)a2 = objc_retainAutorelease(v14);
  }
  v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_215974908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21597492C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_21597493C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

id sub_215974A38(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_215974434;
  v29 = sub_215974444;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_215974434;
  v23 = sub_215974444;
  v24 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_215974B9C;
  v18[3] = &unk_24D3CCCC0;
  v18[4] = &v25;
  objc_msgSend_syncProxyWithErrorHandler_(v8, a2, (uint64_t)v18, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = sub_215974BAC;
  v17[3] = &unk_24D3CD300;
  v17[4] = &v19;
  v17[5] = &v25;
  objc_msgSend_pinControllerProxyWithReply_(v9, v10, (uint64_t)v17, v11, v12, v13);

  if (a2)
  {
    v14 = (void *)v26[5];
    if (v14)
      *(_QWORD *)a2 = objc_retainAutorelease(v14);
  }
  v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_215974B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215974B9C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215974BAC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

id sub_215974CA8(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_215974434;
  v29 = sub_215974444;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_215974434;
  v23 = sub_215974444;
  v24 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_215974E0C;
  v18[3] = &unk_24D3CCCC0;
  v18[4] = &v19;
  objc_msgSend_syncProxyWithErrorHandler_(v8, a2, (uint64_t)v18, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = sub_215974E1C;
  v17[3] = &unk_24D3CD350;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend_oasisReaderProxyWithReply_(v9, v10, (uint64_t)v17, v11, v12, v13);

  if (a2)
  {
    v14 = (void *)v20[5];
    if (v14)
      *(_QWORD *)a2 = objc_retainAutorelease(v14);
  }
  v15 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_215974DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215974E0C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215974E1C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_21597507C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2159750A0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2159750B0(uint64_t a1)
{

}

void sub_2159750B8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_2159750C8(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void sub_215975210(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2159752A8;
  v7[3] = &unk_24D3CCEA0;
  v8 = v4;
  v9 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t sub_2159752A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_onFailureWithError_, *(_QWORD *)(a1 + 40), a4, a5, a6);
}

void sub_2159752B4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_215975378;
  block[3] = &unk_24D3CCEF0;
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

_QWORD *sub_215975378(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  v6 = result[4];
  if (v6)
    return (_QWORD *)MEMORY[0x24BEDD108](result[5], sel_onSuccessWithTransactionData_, v6, a4, a5, a6);
  v7 = result[6];
  if (v7)
    return (_QWORD *)MEMORY[0x24BEDD108](result[5], sel_onFailureWithError_, v7, a4, a5, a6);
  return result;
}

void sub_2159754A0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_215975538;
  v7[3] = &unk_24D3CCE00;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t sub_215975538(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void sub_21597554C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_215975610;
  block[3] = &unk_24D3CCE50;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t sub_215975610(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_215975754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_215975778(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215975788(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void sub_21597591C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_215975940(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215975950(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_215975B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_215975BBC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215975BCC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_215975DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215975DEC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215975DFC(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void sub_215975FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_215976004(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215976014(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_215976204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215976228(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215976238(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void sub_21597636C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215976384(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  v2 = a2;
  objc_msgSend_xpcClient(SPRLogger, v3, v4, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_215998818();

}

void sub_2159763EC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_2159764B0(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  v2 = a2;
  objc_msgSend_xpcClient(SPRLogger, v3, v4, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_21599887C();

}

void sub_215976518(uint64_t a1, void *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;

  v7 = a2;
  if (v7)
  {
    objc_msgSend_xpcClient(SPRLogger, v2, v3, v4, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_2159988E0();

  }
}

void sub_215976704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_215976728(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215976738(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void sub_215976770(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_21597697C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2159769A0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2159769B0(uint64_t a1)
{

}

void sub_2159769B8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_2159769C8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_215976C24()
{
  SPRServiceClient *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = [SPRServiceClient alloc];
  v5 = objc_msgSend_initWithConnector_(v0, v1, (uint64_t)&unk_24D3CD480, v2, v3, v4);
  v6 = (void *)qword_254DEDF48;
  qword_254DEDF48 = v5;

}

id sub_215976C58()
{
  id v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v0 = objc_alloc(MEMORY[0x24BDD1988]);
  objc_msgSend_machServiceName(SPRServiceXPC, v1, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithMachServiceName_options_(v0, v7, (uint64_t)v6, 4096, v8, v9);

  objc_msgSend_interface(SPRServiceXPC, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_(v10, v17, (uint64_t)v16, v18, v19, v20);

  objc_msgSend_resume(v10, v21, v22, v23, v24, v25);
  return v10;
}

void sub_215976DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_215976DC0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_215976DD0(uint64_t a1)
{

}

void sub_215976DD8(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  v2 = a2;
  objc_msgSend_xpcClient(SPRLogger, v3, v4, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_215998944((uint64_t)v2, v8);

}

void sub_215976E30(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_215976ED4(uint64_t a1)
{
  SPRPrimer *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  v2 = [SPRPrimer alloc];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_215976F58;
  v10[3] = &unk_24D3CD120;
  v10[4] = *(_QWORD *)(a1 + 32);
  v7 = objc_msgSend_initWithConnector_(v2, v3, (uint64_t)v10, v4, v5, v6);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

}

id sub_215976F58(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_215976DC0;
  v29 = sub_215976DD0;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_215976DC0;
  v23 = sub_215976DD0;
  v24 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_2159770B4;
  v18[3] = &unk_24D3CCCC0;
  v18[4] = &v25;
  objc_msgSend_syncProxyWithErrorHandler_(v8, a2, (uint64_t)v18, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = sub_2159770C4;
  v17[3] = &unk_24D3CD510;
  v17[4] = &v19;
  objc_msgSend_sharedPrimerProxyWithReply_(v9, v10, (uint64_t)v17, v11, v12, v13);

  if (a2)
  {
    v14 = (void *)v26[5];
    if (v14)
      *(_QWORD *)a2 = objc_retainAutorelease(v14);
  }
  v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_215977090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2159770B4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_2159770C4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_2159774F4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend_setWithObjects_(v0, v6, v1, v7, v8, v9, v2, v3, v4, v5, 0);
  v96 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend_setWithObjects_(v10, v13, v11, v14, v15, v16, v12, 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v17, (uint64_t)&unk_254DF40B0, v18, v19, v20);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v21, (uint64_t)&unk_254DF6B40, v22, v23, v24);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v93, v25, (uint64_t)v95, (uint64_t)sel_installWithToken_force_delegate_reply_, 2, 0);
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v26, (uint64_t)&unk_254DF6BA0, v27, v28, v29);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v30, (uint64_t)&unk_254DF41A8, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v35, (uint64_t)&unk_254DF6C00, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v39, v40, (uint64_t)v34, (uint64_t)sel_readCardWithParameter_delegate_reply_, 1, 0);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v39, v41, (uint64_t)v34, (uint64_t)sel_cancelReadWithCallback_reply_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v39, v42, (uint64_t)v94, (uint64_t)sel_getStoreAndForwardResultsBlobWithTrxHashes_sessionId_activationId_mid_partnerId_virtualTerminalId_reply_, 0, 0);
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v43, (uint64_t)&unk_254DF6C60, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v48, (uint64_t)&unk_254DF6D08, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v53, (uint64_t)&unk_254DF6D68, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v57, v58, (uint64_t)v52, (uint64_t)sel_provisionCardWithParameters_delegate_reply_, 1, 0);
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v59, (uint64_t)&unk_254DF6DC8, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v63, v64, (uint64_t)v93, (uint64_t)sel_configuratorProxyWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v63, v65, (uint64_t)v92, (uint64_t)sel_monitorProxyWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v63, v66, (uint64_t)v39, (uint64_t)sel_readerProxyWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v63, v67, (uint64_t)v47, (uint64_t)sel_pinControllerProxyWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v63, v68, (uint64_t)v57, (uint64_t)sel_oasisReaderProxyWithReply_, 0, 1);
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v69, (uint64_t)&unk_254DF6E28, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v74, (uint64_t)&unk_254DF6E88, v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v78, v79, (uint64_t)v96, (uint64_t)sel_copyConfigurationWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v78, v80, (uint64_t)v63, (uint64_t)sel_providerProxyWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v78, v81, (uint64_t)v73, (uint64_t)sel_secureChannelProxyWithReply_, 0, 1);
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v82, (uint64_t)&unk_254DF6EE8, v83, v84, v85);
  v86 = objc_claimAutoreleasedReturnValue();
  v87 = (void *)qword_254DEDF58;
  qword_254DEDF58 = v86;

  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_((void *)qword_254DEDF58, v88, (uint64_t)v78, (uint64_t)sel_sharedPrimerProxyWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_((void *)qword_254DEDF58, v89, (uint64_t)v78, (uint64_t)sel_primerProxyWithConfiguration_reply_, 0, 1);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_((void *)qword_254DEDF58, v90, (uint64_t)v96, (uint64_t)sel_primerProxyWithConfiguration_reply_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_((void *)qword_254DEDF58, v91, (uint64_t)v96, (uint64_t)sel_primerProxyWithConfiguration_reply_, 1, 1);

}

void sub_215977BD8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  os_log_t v12;
  void *v13;
  id v14;

  objc_msgSend_subsystem(*(void **)(a1 + 32), a2, a3, a4, a5, a6);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend_UTF8String(v14, v6, v7, v8, v9, v10);
  v12 = os_log_create(v11, "pin_crypto");
  v13 = (void *)qword_254DEDF68;
  qword_254DEDF68 = (uint64_t)v12;

}

void sub_215977C9C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  os_log_t v12;
  void *v13;
  id v14;

  objc_msgSend_subsystem(*(void **)(a1 + 32), a2, a3, a4, a5, a6);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend_UTF8String(v14, v6, v7, v8, v9, v10);
  v12 = os_log_create(v11, "xpc_client");
  v13 = (void *)qword_254DEDF78;
  qword_254DEDF78 = (uint64_t)v12;

}

void sub_215978D94(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend_mapXPCConnectionError_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

void sub_215978E84(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend_mapXPCConnectionError_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

void sub_215979054(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215979224(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21597929C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2159792F0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_2159793B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), sel_onUpdateWithEvent_, *(_QWORD *)(a1 + 40), a4, a5, a6);
}

uint64_t sub_215979420(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1[4] + 8), sel_onUpdateWithEvent_progress_, a1[5], a1[6], a5, a6);
}

uint64_t sub_2159794B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), sel_onSuccessWithInstallData_, *(_QWORD *)(a1 + 40), a4, a5, a6);
}

uint64_t sub_215979538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), sel_onFailureWithError_, *(_QWORD *)(a1 + 40), a4, a5, a6);
}

uint64_t sub_215979648(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1[4] + 8), sel_onUpdateWithEvent_mode_, a1[5], a1[6], a5, a6);
}

uint64_t sub_2159796D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), sel_onSuccessWithTransactionData_, *(_QWORD *)(a1 + 40), a4, a5, a6);
}

uint64_t sub_215979760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), sel_onFailureWithError_, *(_QWORD *)(a1 + 40), a4, a5, a6);
}

uint64_t SPRTransactionOutcomeStatus.description.getter(int a1)
{
  unint64_t v1;
  uint64_t result;
  unsigned int v3;

  HIDWORD(v1) = a1;
  LODWORD(v1) = (a1 << 24) + 0x10000000;
  result = 0;
  switch((v1 >> 28))
  {
    case 0u:
      v3 = 544501582;
      goto LABEL_8;
    case 1u:
      return result;
    case 2u:
      result = 0x6465766F72707041;
      break;
    case 3u:
      result = 0x64656E696C636544;
      break;
    case 4u:
      result = 0x5220656E696C6E4FLL;
      break;
    case 5u:
      v3 = 543452741;
LABEL_8:
      result = v3 | 0x6C70704100000000;
      break;
    case 6u:
      result = 0x4E207463656C6553;
      break;
    case 7u:
      result = 0xD000000000000015;
      break;
    case 8u:
      result = 0x6961674120797254;
      break;
    default:
      type metadata accessor for SPRTransactionOutcomeStatus(0);
      result = sub_215999220();
      __break(1u);
      break;
  }
  return result;
}

void type metadata accessor for SPRTransactionOutcomeStatus(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDA50);
}

uint64_t sub_215979B44()
{
  unsigned __int8 *v0;

  return SPRTransactionOutcomeStatus.description.getter(*v0);
}

void type metadata accessor for SPRVASTerminalProtocol(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DED9E8);
}

void type metadata accessor for ORProvisionEvent(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DED9F0);
}

void type metadata accessor for SPRPaymentApplicationType(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DED9F8);
}

void type metadata accessor for SPRTransactionMessage(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDA00);
}

void type metadata accessor for SPRReaderMode(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDA08);
}

void type metadata accessor for SPRTransactionType(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDA10);
}

void type metadata accessor for SPRCardEffectiveState(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDA18);
}

void type metadata accessor for SPRCardExpirationState(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDA20);
}

void type metadata accessor for SPRInstallEvent(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDA28);
}

void type metadata accessor for SPRPayAppletStatus(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDA30);
}

void type metadata accessor for SPRReadEvent(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDA38);
}

void type metadata accessor for SPRTransactionCVMType(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDA40);
}

void type metadata accessor for SPRHTTPError(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDA48);
}

id sub_215979C50()
{
  id *v0;

  return *v0;
}

uint64_t sub_215979C58@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_215979C60()
{
  sub_21597A388(&qword_254DEDAF8, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC0C);
  return sub_215999250();
}

uint64_t sub_215979CA0()
{
  sub_21597A388(&qword_254DEDAF8, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC0C);
  return sub_215999244();
}

uint64_t sub_215979CE4()
{
  sub_21597A388(&qword_254DEDB28, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC7C);
  return sub_215998BCC();
}

uint64_t sub_215979D24(uint64_t a1)
{
  MEMORY[0x2199E9BE4](&unk_21599BC50, a1);
  return sub_215998D4C();
}

uint64_t sub_215979D60()
{
  MEMORY[0x2199E9BE4](&unk_21599BC50);
  return sub_215998D40();
}

uint64_t sub_215979DA8(uint64_t a1, uint64_t a2)
{
  sub_2159992A4();
  MEMORY[0x2199E9BE4](&unk_21599BC50, a2);
  sub_215998D40();
  return sub_2159992C8();
}

id sub_215979E00(void *a1, id *a2)
{

  *a2 = a1;
  return a1;
}

uint64_t sub_215979E38(void *a1, id *a2)
{
  id v4;

  *a2 = a1;
  v4 = a1;
  return 1;
}

id sub_215979E6C@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_215979E7C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id sub_215979E88@<X0>(void **a1@<X8>)
{
  void **v1;
  void *v2;

  v2 = *v1;
  *a1 = *v1;
  return v2;
}

uint64_t sub_215979E94()
{
  return sub_215998E30();
}

uint64_t sub_215979EA4()
{
  sub_21597A388(&qword_254DEDAB0, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B950);
  return sub_215998C14();
}

uint64_t sub_215979EE4()
{
  sub_21597A388(&qword_254DEDAB0, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B950);
  return sub_215998BE4();
}

uint64_t sub_215979F24(void *a1)
{
  id v2;

  sub_21597A388(&qword_254DEDAB0, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B950);
  v2 = a1;
  return sub_215998BD8();
}

uint64_t sub_215979F88()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_215999034();

  return v2;
}

uint64_t sub_215979FBC()
{
  sub_21597A388(&qword_254DEDAB0, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B950);
  return sub_215998BFC();
}

_QWORD *sub_21597A010@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_21597A020(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_21597A02C()
{
  return sub_215998E30();
}

uint64_t sub_21597A03C()
{
  sub_21597A388(&qword_254DEDB28, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC7C);
  return sub_215998C14();
}

uint64_t sub_21597A07C()
{
  sub_21597A388(&qword_254DEDB28, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC7C);
  return sub_215998BE4();
}

uint64_t sub_21597A0BC(void *a1)
{
  id v2;

  sub_21597A388(&qword_254DEDB28, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC7C);
  v2 = a1;
  return sub_215998BD8();
}

uint64_t sub_21597A120()
{
  sub_21597A388(&qword_254DEDB28, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC7C);
  return sub_215998BFC();
}

uint64_t sub_21597A170()
{
  sub_2159992A4();
  sub_215998DD0();
  return sub_2159992C8();
}

uint64_t sub_21597A1CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2199E9BE4](&unk_21599BC50, a3);
  return sub_215998D34();
}

uint64_t sub_21597A218()
{
  sub_21597A388(&qword_254DEDA78, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B824);
  return sub_215999250();
}

uint64_t sub_21597A258()
{
  sub_21597A388(&qword_254DEDA78, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B824);
  return sub_215999244();
}

uint64_t sub_21597A298()
{
  sub_21597A388(&qword_254DEDAB0, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B950);
  return sub_215998BCC();
}

uint64_t sub_21597A2D8()
{
  sub_21597A388(&qword_254DEDAB0, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B950);
  return sub_215998BF0();
}

uint64_t sub_21597A330()
{
  return sub_21597A388(&qword_254DEDA58, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B73C);
}

uint64_t sub_21597A35C()
{
  return sub_21597A388(&qword_254DEDA60, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B768);
}

uint64_t sub_21597A388(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199E9BE4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_21597A3C8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21597A3DC()
{
  sub_21597A388(&qword_254DEDB28, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC7C);
  return sub_215998BF0();
}

uint64_t sub_21597A434()
{
  sub_21597A388(&qword_254DEDAB8, (uint64_t (*)(uint64_t))type metadata accessor for SPRVASTerminalProtocol, (uint64_t)&unk_21599B8D0);
  return sub_2159991D8();
}

uint64_t sub_21597A484()
{
  return sub_21597A388(&qword_254DEDA68, (uint64_t (*)(uint64_t))type metadata accessor for SPRVASTerminalProtocol, (uint64_t)&unk_21599B894);
}

uint64_t sub_21597A4B0()
{
  return sub_21597A388(&qword_254DEDA70, (uint64_t (*)(uint64_t))type metadata accessor for SPRVASTerminalProtocol, (uint64_t)&unk_21599B868);
}

uint64_t sub_21597A4DC()
{
  return sub_21597A388(&qword_254DEDA78, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B824);
}

uint64_t sub_21597A508()
{
  return sub_21597A388(&qword_254DEDA80, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B7F0);
}

uint64_t sub_21597A534()
{
  return sub_21597A388(&qword_254DEDA88, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B7AC);
}

uint64_t sub_21597A560()
{
  return sub_21597A388(&qword_254DEDA90, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_21599B9F8);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDAD8);
}

uint64_t sub_21597A5A0()
{
  return sub_21597A388(&qword_254DEDA98, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_21599B9BC);
}

unint64_t sub_21597A5D0()
{
  unint64_t result;

  result = qword_254DEDAA0;
  if (!qword_254DEDAA0)
  {
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_254DEDAA0);
  }
  return result;
}

uint64_t sub_21597A614()
{
  return sub_21597A388(&qword_254DEDAA8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_21599BA34);
}

uint64_t sub_21597A640()
{
  return sub_21597A388(&qword_254DEDAB0, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B950);
}

void type metadata accessor for CFError(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDAC0);
}

void type metadata accessor for SecurityError(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDAC8);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDAD0);
}

uint64_t sub_21597A6A8()
{
  return sub_21597A388(&qword_254DEDAE0, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BB24);
}

uint64_t sub_21597A6D4()
{
  return sub_21597A388(&qword_254DEDAE8, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BB50);
}

uint64_t sub_21597A700()
{
  return sub_21597A388(&qword_254DEDAF0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21599BD8C);
}

uint64_t sub_21597A72C()
{
  return sub_21597A388(&qword_254DEDAF8, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC0C);
}

uint64_t sub_21597A758()
{
  return sub_21597A388(&qword_254DEDB00, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BBD8);
}

uint64_t sub_21597A784()
{
  return sub_21597A388(&qword_254DEDB08, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BB94);
}

uint64_t sub_21597A7B0()
{
  return sub_21597A388(&qword_254DEDB10, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_21599BD24);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
  sub_21597A7F0(a1, &qword_254DEDB38);
}

void sub_21597A7F0(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_21597A834()
{
  return sub_21597A388(&qword_254DEDB18, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_21599BCE8);
}

uint64_t sub_21597A860()
{
  return sub_21597A388(&qword_254DEDB20, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_21599BD60);
}

uint64_t sub_21597A88C()
{
  return sub_21597A388(&qword_254DEDB28, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC7C);
}

uint64_t sub_21597A8B8()
{
  return sub_21597A388(&qword_254DEDB30, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21599BAF8);
}

id related decl 'e' for SPRHTTPErrorCode.init(_:serverCode:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char isUniquelyReferenced_nonNull_native;
  id v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  sub_21597ABB8(MEMORY[0x24BEE4AF8]);
  if (a5 >> 60 != 15)
  {
    sub_21597B9F4(a4, a5);
    swift_bridgeObjectRelease();
    v10 = (void *)objc_opt_self();
    v11 = (void *)sub_215998CBC();
    *(_QWORD *)&v24 = 0;
    v12 = objc_msgSend(v10, sel_JSONObjectWithData_options_error_, v11, 0, &v24);

    v13 = (id)v24;
    if (v12)
    {
      sub_2159990F4();
      swift_unknownObjectRelease();
    }
    else
    {
      v14 = v13;
      v15 = (void *)sub_215998C38();

      swift_willThrow();
      v24 = 0u;
      v25 = 0u;
    }
    sub_21597C088((uint64_t)&v24, (uint64_t)&v22, &qword_254DEDB40);
    if (v23)
    {
      sub_21597BA38(&qword_254DEDB48);
      if (swift_dynamicCast())
        goto LABEL_10;
    }
    else
    {
      sub_21597BA78((uint64_t)&v22);
    }
    sub_21597ABB8(MEMORY[0x24BEE4AF8]);
LABEL_10:
    sub_21597ACEC(a4, a5);
    sub_21597BA78((uint64_t)&v24);
  }
  if (a3)
  {
    *((_QWORD *)&v25 + 1) = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v24 = a2;
    *((_QWORD *)&v24 + 1) = a3;
    sub_21597AD44(&v24, &v22);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_21597B8C4(&v22, 1701080931, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  sub_215998E30();
  v17 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v18 = (void *)sub_215998E24();
  swift_bridgeObjectRelease();
  v19 = (void *)sub_215998DB8();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, a1, v19);

  sub_21597ACEC(a4, a5);
  return v20;
}

unint64_t sub_21597ABB8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_21597BA38(&qword_254DEDB80);
  v2 = sub_2159991B4();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21597C088(v6, (uint64_t)&v15, &qword_254DEDB88);
    v7 = v15;
    v8 = v16;
    result = sub_21597B420(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21597AD44(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_21597ACEC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21597AD00(a1, a2);
  return a1;
}

uint64_t sub_21597AD00(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

_OWORD *sub_21597AD44(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_21597AD54(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_21597BA38(&qword_254DEDB70);
  v2 = sub_2159991B4();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21597C088(v6, (uint64_t)&v13, &qword_254DEDB78);
    v7 = v13;
    result = sub_21597B484(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_21597AD44(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21597AE80(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_21597BA38(&qword_254DEDB60);
  v2 = (_QWORD *)sub_2159991B4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = (void *)*(v4 - 1);
    v6 = *v4;
    v7 = v5;
    result = sub_21597B50C(v5);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v5;
    *(_QWORD *)(v2[7] + v10) = v6;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 2;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t related decl 'e' for SPRHTTPErrorCode.serverCode.getter(uint64_t a1)
{
  return sub_21597AFA0(a1, 1701080931, 0xE400000000000000);
}

uint64_t related decl 'e' for SPRHTTPErrorCode.serverReason.getter(uint64_t a1)
{
  return sub_21597AFA0(a1, 0x6E6F73616572, 0xE600000000000000);
}

uint64_t sub_21597AFA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  *(_QWORD *)&v10 = a1;
  type metadata accessor for SPRHTTPError(0);
  sub_21597A388(&qword_254DEDAB0, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B950);
  v5 = sub_215998C08();
  if (*(_QWORD *)(v5 + 16) && (v6 = sub_21597B420(a2, a3), (v7 & 1) != 0))
  {
    sub_21597BAB8(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)&v10);
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v11 + 1))
  {
    if (swift_dynamicCast())
      return v9;
    else
      return 0;
  }
  else
  {
    sub_21597BA78((uint64_t)&v10);
    return 0;
  }
}

uint64_t related decl 'e' for SPRHTTPErrorCode.atsFailureCodes.getter(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  *(_QWORD *)&v6 = a1;
  type metadata accessor for SPRHTTPError(0);
  sub_21597A388(&qword_254DEDAB0, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B950);
  v1 = sub_215998C08();
  if (*(_QWORD *)(v1 + 16) && (v2 = sub_21597B420(0x436572756C696166, 0xEC0000007365646FLL), (v3 & 1) != 0))
  {
    sub_21597BAB8(*(_QWORD *)(v1 + 56) + 32 * v2, (uint64_t)&v6);
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v7 + 1))
  {
    sub_21597BA38(&qword_254DEDB50);
    if (swift_dynamicCast())
      return v5;
    else
      return 0;
  }
  else
  {
    sub_21597BA78((uint64_t)&v6);
    return 0;
  }
}

uint64_t related decl 'e' for SPRHTTPErrorCode.atsBanExpirationTime.getter(uint64_t a1)
{
  return sub_21597AFA0(a1, 0xD000000000000011, 0x800000021599E150);
}

uint64_t related decl 'e' for SPRHTTPErrorCode.isClientError.getter(uint64_t a1)
{
  return sub_21597B1D0(a1, (uint64_t (*)(uint64_t))SPRHTTPStatusIsClientError);
}

uint64_t related decl 'e' for SPRHTTPErrorCode.isServerError.getter(uint64_t a1)
{
  return sub_21597B1D0(a1, (uint64_t (*)(uint64_t))SPRHTTPStatusIsServerError);
}

uint64_t sub_21597B1D0(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;

  type metadata accessor for SPRHTTPError(0);
  sub_21597A388(&qword_254DEDAB0, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B950);
  v3 = sub_215998C14();
  return a2(v3);
}

uint64_t related decl 'e' for SPRHTTPErrorCode.isTimeTokenError.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  char v8;

  type metadata accessor for SPRHTTPError(0);
  sub_21597A388(&qword_254DEDAB0, (uint64_t (*)(uint64_t))type metadata accessor for SPRHTTPError, (uint64_t)&unk_21599B950);
  v2 = sub_215998C14();
  if (SPRHTTPStatusIsClientError(v2) && (v3 = related decl 'e' for SPRHTTPErrorCode.serverCode.getter(a1), v4))
  {
    v5 = v3;
    v6 = v4;
    sub_21597BA38(&qword_254DEDB58);
    inited = swift_initStackObject();
    *(_QWORD *)(inited + 32) = 0x313034342D474144;
    *(_OWORD *)(inited + 16) = xmmword_21599BDF0;
    *(_QWORD *)(inited + 40) = 0xE800000000000000;
    *(_QWORD *)(inited + 48) = 0x333034342D474144;
    *(_QWORD *)(inited + 56) = 0xE800000000000000;
    v8 = sub_21597B35C(v5, v6, (_QWORD *)inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_21597B35C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_215999208();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_215999208() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

unint64_t sub_21597B420(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2159992A4();
  sub_215998EA8();
  v4 = sub_2159992C8();
  return sub_21597BB5C(a1, a2, v4);
}

unint64_t sub_21597B484(uint64_t a1)
{
  uint64_t v2;

  sub_2159992A4();
  type metadata accessor for CFString(0);
  sub_21597A388(&qword_254DEDB68, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21599BC50);
  sub_215998D40();
  v2 = sub_2159992C8();
  return sub_21597BC3C(a1, v2);
}

unint64_t sub_21597B50C(void *a1)
{
  id v2;
  uint64_t v3;

  sub_2159992A4();
  sub_2159992BC();
  if (a1)
  {
    type metadata accessor for CFString(0);
    sub_21597A388(&qword_254DEDB68, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21599BC50);
    v2 = a1;
    sub_215998D40();

  }
  v3 = sub_2159992C8();
  return sub_21597BD7C((uint64_t)a1, v3);
}

uint64_t sub_21597B5C8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  sub_21597BA38(&qword_254DEDB80);
  v6 = sub_2159991A8();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_21597AD44(v24, v35);
      }
      else
      {
        sub_21597BAB8((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_2159992A4();
      sub_215998EA8();
      result = sub_2159992C8();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_21597AD44(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_21597B8C4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_21597B420(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        sub_21597C068((uint64_t)v19);
        return sub_21597AD44(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_21597BE84();
      goto LABEL_7;
    }
    sub_21597B5C8(v15, a4 & 1);
    v21 = sub_21597B420(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_21597BAF4(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_215999238();
  __break(1u);
  return result;
}

uint64_t sub_21597B9F4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_21597BA38(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199E9BCC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21597BA78(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21597BA38(&qword_254DEDB40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21597BAB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_21597BAF4(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_21597AD44(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_21597BB5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_215999208() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_215999208() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_21597BC3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for CFString(0);
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    sub_21597A388(&qword_254DEDB68, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21599BC50);
    v7 = v6;
    v8 = sub_215998D34();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = sub_215998D34();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_21597BD7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = v2;
    v8 = ~v4;
    do
    {
      v9 = *(void **)(*(_QWORD *)(v6 + 48) + 8 * v5);
      if (v9)
      {
        if (a1)
        {
          type metadata accessor for CFString(0);
          sub_21597A388(&qword_254DEDB68, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21599BC50);
          v10 = v9;
          v11 = sub_215998D34();

          if ((v11 & 1) != 0)
            return v5;
        }
      }
      else if (!a1)
      {
        return v5;
      }
      v5 = (v5 + 1) & v8;
    }
    while (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

void *sub_21597BE84()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  sub_21597BA38(&qword_254DEDB80);
  v2 = *v0;
  v3 = sub_21599919C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_21597BAB8(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_21597AD44(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_21597C068(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21597C088(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_21597BA38(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t SPRTransactionCVMType.description.getter(unsigned __int8 a1)
{
  uint64_t result;

  result = 0xD000000000000010;
  if (a1 > 0x2Fu)
  {
    switch(a1)
    {
      case 0x30u:
        return 0xD00000000000001ALL;
      case 0xF0u:
        return 0x6C70704120746F4ELL;
      case 0xFFu:
        return 0;
    }
    goto LABEL_14;
  }
  if (!a1)
    return 0x4D5643206F4ELL;
  if (a1 != 16)
  {
    if (a1 == 32)
      return 0x5020656E696C6E4FLL;
LABEL_14:
    type metadata accessor for SPRTransactionCVMType(0);
    result = sub_215999220();
    __break(1u);
  }
  return result;
}

uint64_t sub_21597C1CC()
{
  unsigned __int8 *v0;

  return SPRTransactionCVMType.description.getter(*v0);
}

const __CFString *SPRTransactionType.description.getter(unsigned __int8 a1)
{
  const __CFString *result;
  __CFString *v2;
  uint64_t v3;

  result = (id)SPRTransactionTypeCopyDescription(a1);
  if (result)
  {
    v2 = (__CFString *)result;
    v3 = sub_215998E30();

    return (const __CFString *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

const __CFString *sub_21597C228()
{
  unsigned __int8 *v0;
  const __CFString *result;
  __CFString *v2;
  uint64_t v3;

  result = (id)SPRTransactionTypeCopyDescription(*v0);
  if (result)
  {
    v2 = (__CFString *)result;
    v3 = sub_215998E30();

    return (const __CFString *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

const __CFString *SPRReaderMode.description.getter(unint64_t a1)
{
  const __CFString *result;
  __CFString *v2;
  uint64_t v3;

  result = (id)SPRReaderModeCopyDescription(a1);
  if (result)
  {
    v2 = (__CFString *)result;
    v3 = sub_215998E30();

    return (const __CFString *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

const __CFString *sub_21597C2CC()
{
  unint64_t *v0;
  const __CFString *result;
  __CFString *v2;
  uint64_t v3;

  result = (id)SPRReaderModeCopyDescription(*v0);
  if (result)
  {
    v2 = (__CFString *)result;
    v3 = sub_215998E30();

    return (const __CFString *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21597C320()
{
  uint64_t v0;

  v0 = sub_215998D70();
  sub_21597E4E0(v0, qword_254DEDB90);
  sub_21597D34C(v0, (uint64_t)qword_254DEDB90);
  return sub_215998D64();
}

void (*sub_21597C398(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4))(uint64_t a1)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  os_log_t v28;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  NSObject *v56;
  void *v57;
  id v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  id v62;
  unint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  os_log_t log;
  os_log_t loga;
  id v70;

  v6 = v5;
  v7 = v4;
  if (qword_254DED9E0 != -1)
    swift_once();
  v12 = sub_215998D70();
  sub_21597D34C(v12, (uint64_t)qword_254DEDB90);
  sub_21597B9F4(a1, a2);
  sub_21597B9F4(a3, a4);
  sub_21597B9F4(a1, a2);
  sub_21597B9F4(a3, a4);
  v13 = sub_215998D58();
  v14 = sub_215999010();
  v15 = (void (*)(uint64_t))v14;
  if (os_log_type_enabled(v13, v14))
  {
    v16 = swift_slowAlloc();
    v64 = (id)swift_slowAlloc();
    v70 = v64;
    *(_DWORD *)v16 = 136315394;
    sub_215987D00(a1, a2);
    sub_21597D634(v17, v18, (uint64_t *)&v70);
    sub_215999088();
    swift_bridgeObjectRelease();
    sub_21597AD00(a1, a2);
    sub_21597AD00(a1, a2);
    *(_WORD *)(v16 + 12) = 2080;
    sub_215987D00(a3, a4);
    sub_21597D634(v19, v20, (uint64_t *)&v70);
    sub_215999088();
    v6 = v5;
    swift_bridgeObjectRelease();
    sub_21597AD00(a3, a4);
    sub_21597AD00(a3, a4);
    _os_log_impl(&dword_215968000, v13, (os_log_type_t)v15, "SPRPINCrypto.init(attestationData: %s, casdCertificate: %s)", (uint8_t *)v16, 0x16u);
    v15 = (void (*)(uint64_t))v64;
    swift_arrayDestroy();
    MEMORY[0x2199E9C5C](v64, -1, -1);
    MEMORY[0x2199E9C5C](v16, -1, -1);

  }
  else
  {
    sub_21597AD00(a1, a2);
    sub_21597AD00(a1, a2);
    sub_21597AD00(a3, a4);
    sub_21597AD00(a3, a4);

  }
  v21 = objc_allocWithZone((Class)SPRKeyAttestationInfo);
  sub_21597B9F4(a1, a2);
  v22 = sub_21597DC74();
  if (!v6)
  {
    v23 = v22;
    sub_21597AD00(a1, a2);
    type metadata accessor for TLV();
    v70 = sub_21598ADA0(a3, a4);
    sub_21599303C();
    v66 = a3;
    sub_21597BA38(&qword_254DEDBC8);
    loga = (os_log_t)a4;
    sub_21597E520();
    v30 = sub_21598D9BC();
    swift_bridgeObjectRelease();
    if (v30)
    {
      v31 = sub_215993050();
      v32 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v30 + 200))(*v31);
      if (v32)
      {
        v67 = v7;
        v33 = (*(uint64_t (**)(void))(*(_QWORD *)v32 + 144))();
        v35 = v34;
        swift_release();
        sub_21597B9F4(v33, v35);
        sub_21597B9F4(v33, v35);
        v36 = sub_215998D58();
        v37 = sub_215999010();
        v63 = v35;
        v65 = v33;
        if (os_log_type_enabled(v36, v37))
        {
          v38 = v33;
          v39 = (uint8_t *)swift_slowAlloc();
          v62 = (id)swift_slowAlloc();
          v70 = v62;
          *(_DWORD *)v39 = 136315138;
          sub_215987D00(v38, v35);
          sub_21597D634(v40, v41, (uint64_t *)&v70);
          sub_215999088();
          swift_bridgeObjectRelease();
          sub_21597AD00(v38, v35);
          sub_21597AD00(v38, v35);
          _os_log_impl(&dword_215968000, v36, v37, "casdPublicKeyData: %s", v39, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2199E9C5C](v62, -1, -1);
          MEMORY[0x2199E9C5C](v39, -1, -1);
        }
        else
        {
          sub_21597AD00(v33, v35);
          sub_21597AD00(v33, v35);
        }

        v42 = -[NSObject signature](v23, sel_signature);
        v43 = sub_215998CD4();
        v45 = v44;

        v46 = -[NSObject request](v23, sel_request);
        v47 = objc_msgSend(v46, sel_derRepresentation);

        v48 = sub_215998CD4();
        v50 = v49;

        sub_21597DD30();
        sub_21597AD00(v48, v50);
        sub_21597AD00(v43, v45);
        v51 = -[NSObject request](v23, sel_request);
        v52 = objc_msgSend(v51, sel_publicKeyInfo);

        v53 = sub_215998CD4();
        v55 = v54;

        v56 = sub_215998CBC();
        sub_21597AD00(v53, v55);
        v57 = (void *)SecKeyCreateFromSubjectPublicKeyInfoData();
        if (v57)
        {
          v58 = v57;
          v15 = (void (*)(uint64_t))objc_msgSend(v67, sel_initWithPeerPublicKey_, v58);
          sub_21597AD00(v66, (unint64_t)loga);
          sub_21597AD00(a1, a2);
          swift_release();
          sub_21597AD00(v65, v63);

          return v15;
        }
        v59 = sub_215998D58();
        v60 = sub_21599901C();
        if (os_log_type_enabled(v59, v60))
        {
          v61 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v61 = 0;
          _os_log_impl(&dword_215968000, v59, v60, "SecKeyCreateFromSubjectPublicKeyInfoData on attestationInfo.request.publicKeyInfo failed", v61, 2u);
          MEMORY[0x2199E9C5C](v61, -1, -1);
        }

        type metadata accessor for SecurityError(0);
        v15 = type metadata accessor for SecurityError;
        sub_21597D364(MEMORY[0x24BEE4AF8]);
        sub_21597A388(&qword_254DEDB28, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC7C);
        sub_215998C20();
        swift_willThrow();
        sub_21597AD00(v66, (unint64_t)loga);
        sub_21597AD00(a1, a2);
        swift_release();
        sub_21597AD00(v65, v63);

        v28 = v56;
        goto LABEL_12;
      }
      swift_release();
    }
    log = v23;
    v24 = a3;
    v25 = sub_215998D58();
    v26 = sub_21599901C();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_215968000, v25, v26, "CASD certificate has unexpected format", v27, 2u);
      MEMORY[0x2199E9C5C](v27, -1, -1);
    }

    type metadata accessor for SecurityError(0);
    v15 = type metadata accessor for SecurityError;
    sub_21597D364(MEMORY[0x24BEE4AF8]);
    sub_21597A388(&qword_254DEDB28, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC7C);
    sub_215998C20();
    swift_willThrow();
    sub_21597AD00(v24, a4);
    sub_21597AD00(a1, a2);
    v28 = log;
LABEL_12:

    goto LABEL_13;
  }
  sub_21597AD00(a1, a2);
  sub_21597AD00(a3, a4);
  sub_21597AD00(a1, a2);
LABEL_13:
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v15;
}

void sub_21597CDC8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  unint64_t v6;
  uint64_t inited;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t EncryptedDataWithParameters;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v1 = v0;
  v17 = *MEMORY[0x24BDAC8D0];
  if (qword_254DED9E0 != -1)
    swift_once();
  v2 = sub_215998D70();
  sub_21597D34C(v2, (uint64_t)qword_254DEDB90);
  v3 = sub_215998D58();
  v4 = sub_215999010();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_215968000, v3, v4, "SPRPINCrypto.encryptDigit(_:)", v5, 2u);
    MEMORY[0x2199E9C5C](v5, -1, -1);
  }

  v15 = sub_21597E338(16);
  v16 = v6;
  sub_215998CA4();
  sub_215998CA4();
  sub_21597BA38(&qword_254DEDBA8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21599BEA0;
  v8 = (void *)*MEMORY[0x24BDE9380];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDE9380];
  *(_QWORD *)(inited + 40) = 128;
  v9 = v8;
  sub_21597AE80(inited);
  v14 = 0;
  v10 = objc_msgSend(v1, sel_peerPublicKey);
  sub_21597B9F4(v15, v16);
  v11 = (void *)sub_215998CBC();
  sub_21597AD00(v15, v16);
  sub_21597BA38(&qword_254DEDBB0);
  sub_21597E3D4();
  v12 = (void *)sub_215998DB8();
  swift_bridgeObjectRelease();
  EncryptedDataWithParameters = SecKeyCreateEncryptedDataWithParameters();

  if (EncryptedDataWithParameters)
    __asm { BR              X10 }
  __break(1u);
  JUMPOUT(0x21597D280);
}

uint64_t sub_21597D34C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_21597D364(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_21597BA38(&qword_254DEDB80);
  v2 = sub_2159991B4();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21597E498(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_21597D48C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21597AD44(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21597D48C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2159992A4();
  sub_215998EA8();
  v4 = sub_2159992C8();
  return sub_21597D4F0(a1, a2, v4);
}

unint64_t sub_21597D4F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_215999208() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_215999208() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_215999208() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_21597D634(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21597D704(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21597BAB8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_21597BAB8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_21597C068((uint64_t)v12);
  return v7;
}

uint64_t sub_21597D704(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_215999094();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21597D8BC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_215999130();
  if (!v8)
  {
    sub_215999184();
    __break(1u);
LABEL_17:
    result = sub_2159991C0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_21597D8BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21597D950(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21597DB28(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21597DB28(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21597D950(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_21597DAC4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_215999118();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_215999184();
      __break(1u);
LABEL_10:
      v2 = sub_215998EF0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2159991C0();
    __break(1u);
LABEL_14:
    result = sub_215999184();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21597DAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_21597BA38(&qword_254DEDBC0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21597DB28(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_21597BA38(&qword_254DEDBC0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2159991C0();
  __break(1u);
  return result;
}

id sub_21597DC74()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_215998CBC();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithDERRepresentation_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_215998C38();

    swift_willThrow();
  }
  return v2;
}

void sub_21597DD30()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t inited;
  void **v5;
  void *v6;
  void *v7;
  void **v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const __CFData *v18;
  const __CFDictionary *v19;
  __SecKey *v20;
  const __CFString *v21;
  const __CFData *v22;
  const __CFData *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  __SecKey *v28;
  uint64_t v29;
  unint64_t v30;
  __CFError *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  __CFError *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  CFErrorRef error[22];

  error[20] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  if (qword_254DED9E0 != -1)
    swift_once();
  v0 = sub_215998D70();
  sub_21597D34C(v0, (uint64_t)qword_254DEDB90);
  v1 = sub_215998D58();
  v2 = sub_215999010();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_215968000, v1, v2, "SPRPINCrypto.verify(signature:request:key:)", v3, 2u);
    MEMORY[0x2199E9C5C](v3, -1, -1);
  }

  sub_21597BA38(&qword_254DEDBD8);
  inited = swift_initStackObject();
  v5 = (void **)MEMORY[0x24BDE9050];
  *(_OWORD *)(inited + 16) = xmmword_21599BEB0;
  v6 = *v5;
  *(_QWORD *)(inited + 32) = *v5;
  v7 = (void *)*MEMORY[0x24BDE9058];
  type metadata accessor for CFString(0);
  v8 = (void **)MEMORY[0x24BDE9028];
  *(_QWORD *)(inited + 40) = v7;
  v9 = *v8;
  *(_QWORD *)(inited + 64) = v10;
  *(_QWORD *)(inited + 72) = v9;
  v11 = (void *)*MEMORY[0x24BDE9038];
  *(_QWORD *)(inited + 80) = *MEMORY[0x24BDE9038];
  v12 = (void *)*MEMORY[0x24BDE9048];
  *(_QWORD *)(inited + 104) = v10;
  *(_QWORD *)(inited + 112) = v12;
  *(_QWORD *)(inited + 144) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 120) = 256;
  v13 = v6;
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v12;
  sub_21597AD54(inited);
  error[0] = 0;
  v18 = (const __CFData *)sub_215998CBC();
  sub_21597A388(&qword_254DEDAF0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21599BD8C);
  v19 = (const __CFDictionary *)sub_215998DB8();
  swift_bridgeObjectRelease();
  v20 = SecKeyCreateWithData(v18, v19, error);

  if (v20)
  {
    v21 = (const __CFString *)*MEMORY[0x24BDE92D0];
    v22 = (const __CFData *)sub_215998CBC();
    v23 = (const __CFData *)sub_215998CBC();
    LODWORD(v21) = SecKeyVerifySignature(v20, v21, v22, v23, error);

    if ((_DWORD)v21)
    {

      return;
    }
    if (error[0])
    {
      v31 = error[0];
      v32 = sub_215998D58();
      v33 = sub_21599901C();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        v35 = swift_slowAlloc();
        v39 = v35;
        *(_DWORD *)v34 = 136315138;
        type metadata accessor for CFError(0);
        v36 = v31;
        v37 = sub_215998E78();
        sub_21597D634(v37, v38, &v39);
        sub_215999088();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_215968000, v32, v33, "SecKeyVerifySignature error: %s", v34, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199E9C5C](v35, -1, -1);
        MEMORY[0x2199E9C5C](v34, -1, -1);

      }
      else
      {

      }
      type metadata accessor for SecurityError(0);
      sub_21597D364(MEMORY[0x24BEE4AF8]);
      sub_21597A388(&qword_254DEDB28, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC7C);
      sub_215998C20();
      swift_willThrow();

LABEL_18:
      return;
    }
  }
  else
  {
    if (error[0])
    {
      v20 = error[0];
      v24 = sub_215998D58();
      v25 = sub_21599901C();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        v27 = swift_slowAlloc();
        v39 = v27;
        *(_DWORD *)v26 = 136315138;
        type metadata accessor for CFError(0);
        v28 = v20;
        v29 = sub_215998E78();
        sub_21597D634(v29, v30, &v39);
        sub_215999088();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_215968000, v24, v25, "SecKeyCreateWithData error: %s", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199E9C5C](v27, -1, -1);
        MEMORY[0x2199E9C5C](v26, -1, -1);

      }
      else
      {

      }
      type metadata accessor for SecurityError(0);
      sub_21597D364(MEMORY[0x24BEE4AF8]);
      sub_21597A388(&qword_254DEDB28, (uint64_t (*)(uint64_t))type metadata accessor for SecurityError, (uint64_t)&unk_21599BC7C);
      sub_215998C20();
      swift_willThrow();
      goto LABEL_18;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_21597E338(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_215998BB4();
      swift_allocObject();
      sub_215998B84();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_215998C68();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

unint64_t sub_21597E3D4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254DEDBB8;
  if (!qword_254DEDBB8)
  {
    v1 = sub_21597E450(&qword_254DEDBB0);
    v2 = sub_21597A388(&qword_254DEDAF0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21599BD8C);
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BEE4AB0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254DEDBB8);
  }
  return result;
}

uint64_t sub_21597E450(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199E9BD8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21597E498(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21597BA38(&qword_254DEDB88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_21597E4E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_21597E520()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DEDBD0;
  if (!qword_254DEDBD0)
  {
    v1 = sub_21597E450(&qword_254DEDBC8);
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254DEDBD0);
  }
  return result;
}

unint64_t SPRTransactionMessage.description.getter(unint64_t result)
{
  result = result;
  switch((char)result)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 4:
    case 5:
    case 8:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 17:
    case 18:
    case 19:
    case 31:
      goto LABEL_4;
    case 3:
    case 26:
      result = 0x4445564F52505041;
      break;
    case 6:
      result = 0x5252452044524143;
      break;
    case 7:
      result = 0x44454E494C434544;
      break;
    case 9:
      result = 0xD000000000000015;
      break;
    case 15:
      result = 0xD000000000000010;
      break;
    case 16:
    case 28:
      result = 0xD000000000000012;
      break;
    case 20:
      result = 0x656D6F636C6557;
      break;
    case 21:
      result = 0x20746E6573657250;
      break;
    case 22:
      result = 0x69737365636F7250;
      break;
    case 23:
      result = 0x4145522044524143;
      break;
    case 24:
      result = 0xD00000000000001BLL;
      break;
    case 25:
      result = 0xD00000000000001CLL;
      break;
    case 27:
      result = 0xD000000000000019;
      break;
    case 29:
      result = 0x4320545245534E49;
      break;
    case 30:
      result = 0x4944205241454C43;
      break;
    case 32:
      result = 0x4E4F485020454553;
      break;
    case 33:
      result = 0x4941474120595254;
      break;
    default:
      if (result == 255)
        result = 4271950;
      else
LABEL_4:
        result = 0x206E776F6E6B6E55;
      break;
  }
  return result;
}

unint64_t sub_21597E7D4()
{
  unsigned __int8 *v0;

  return SPRTransactionMessage.description.getter(*v0);
}

uint64_t SPRPaymentApplicationType.description.getter(uint64_t result)
{
  result = result;
  switch((char)result)
  {
    case 0:
      return result;
    case 2:
      result = 0x616372657473616DLL;
      break;
    case 3:
      result = 1634953590;
      break;
    case 4:
      result = 2019913057;
      break;
    case 5:
      result = 6447978;
      break;
    case 6:
      result = 0x7265766F63736964;
      break;
    case 13:
      result = 0x736F70746665;
      break;
    case 14:
      result = 0x73726568746FLL;
      break;
    case 15:
      result = 0x63617265746E69;
      break;
    default:
      result = 0x6E676F6365726E75;
      break;
  }
  return result;
}

uint64_t sub_21597E8CC()
{
  unsigned __int8 *v0;

  return SPRPaymentApplicationType.description.getter(*v0);
}

uint64_t SPRReadEvent.description.getter(uint64_t a1)
{
  uint64_t result;

  result = 0xD000000000000013;
  switch(a1)
  {
    case 0:
      result = 0x7964616572;
      break;
    case 1:
      result = 0x6465746365746564;
      break;
    case 2:
      result = 0x656C6C65636E6163;
      break;
    case 3:
      result = 0x6465736F6C63;
      break;
    case 4:
      result = 0x6465766F6D6572;
      break;
    case 5:
      result = 0x7261655464726163;
      break;
    case 6:
      result = 0x6E69616741797274;
      break;
    case 7:
      result = 0x726143726568746FLL;
      break;
    case 8:
      result = 0x656E6F6850656573;
      break;
    case 9:
      return result;
    case 10:
      result = 0x6F72724564726163;
      break;
    default:
      type metadata accessor for SPRReadEvent(0);
      result = sub_215999220();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_21597EA38()
{
  uint64_t *v0;

  return SPRReadEvent.description.getter(*v0);
}

uint64_t ORProvisionEvent.description.getter(uint64_t a1)
{
  uint64_t result;

  result = 0;
  switch(a1)
  {
    case 0:
      result = 0x7964616572;
      break;
    case 1:
      result = 0x6465746365746564;
      break;
    case 2:
      result = 0x656C6C65636E6163;
      break;
    case 3:
      result = 0x6465736F6C63;
      break;
    case 4:
      result = 0x614365766F6D6572;
      break;
    case 5:
      result = 0x7261655464726163;
      break;
    case 9:
      result = 0x6574656C706D6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21597EB14()
{
  uint64_t *v0;

  return ORProvisionEvent.description.getter(*v0);
}

unint64_t SPRMonitorEvent.eventString.getter(unsigned __int16 a1)
{
  int v1;
  unint64_t result;

  v1 = a1 - 13;
  result = 0xD000000000000017;
  switch(v1)
  {
    case 0:
      return result;
    case 2:
      result = 0xD000000000000013;
      break;
    case 5:
      result = 0x5F45524150455250;
      break;
    case 6:
      result = 0xD000000000000015;
      break;
    case 7:
      result = 0xD000000000000013;
      break;
    case 8:
      result = 0xD000000000000015;
      break;
    case 10:
      result = 0xD00000000000001ALL;
      break;
    case 14:
      result = 0xD000000000000021;
      break;
    case 15:
      result = 0xD000000000000020;
      break;
    case 16:
      result = 0xD000000000000025;
      break;
    case 19:
      result = 0x415F524544414552;
      break;
    case 20:
      result = 0x495F524544414552;
      break;
    case 21:
      result = 0x524154535F43464ELL;
      break;
    case 22:
      result = 0x444145525F43464ELL;
      break;
    case 23:
      result = 0x534F4C435F43464ELL;
      break;
    case 24:
      result = 0xD000000000000016;
      break;
    case 25:
      result = 0xD000000000000016;
      break;
    case 26:
      result = 0xD000000000000016;
      break;
    case 27:
      result = 0xD00000000000001ELL;
      break;
    case 28:
      result = 0xD000000000000014;
      break;
    case 29:
      result = 0x53554C465F474F4CLL;
      break;
    case 30:
    case 37:
    case 40:
    case 42:
      result = 0xD000000000000012;
      break;
    case 31:
      result = 0x435F48544C414548;
      break;
    case 32:
      result = 0xD00000000000001ELL;
      break;
    case 33:
      result = 0xD000000000000018;
      break;
    case 34:
      result = 0xD000000000000017;
      break;
    case 35:
      result = 0xD000000000000015;
      break;
    case 36:
      result = 0xD000000000000015;
      break;
    case 38:
      result = 0xD000000000000014;
      break;
    case 41:
      result = 0xD000000000000010;
      break;
    default:
      result = 0xD000000000000018;
      break;
  }
  return result;
}

uint64_t static SPRMonitorEvent.getEventFromString(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 == 0xD000000000000017 && a2 == 0x800000021599E8C0 || (sub_215999208() & 1) != 0)
    return 13;
  if (a1 == 0xD000000000000013 && a2 == 0x800000021599E8A0 || (sub_215999208() & 1) != 0)
    return 15;
  if (a1 == 0x5F45524150455250 && a2 == 0xEE00524544414552 || (sub_215999208() & 1) != 0)
    return 18;
  if (a1 == 0xD000000000000015 && a2 == 0x800000021599E880 || (sub_215999208() & 1) != 0)
    return 19;
  if (a1 == 0xD000000000000013 && a2 == 0x800000021599E860 || (sub_215999208() & 1) != 0)
    return 20;
  if (a1 == 0xD000000000000015 && a2 == 0x800000021599E840 || (sub_215999208() & 1) != 0)
    return 21;
  if (a1 == 0xD00000000000001ALL && a2 == 0x800000021599E820 || (sub_215999208() & 1) != 0)
    return 23;
  if (a1 == 0xD000000000000021 && a2 == 0x800000021599E7F0 || (sub_215999208() & 1) != 0)
    return 27;
  if (a1 == 0xD000000000000020 && a2 == 0x800000021599E7C0 || (sub_215999208() & 1) != 0)
    return 28;
  if (a1 == 0xD000000000000025 && a2 == 0x800000021599E790 || (sub_215999208() & 1) != 0)
    return 29;
  if (a1 == 0x415F524544414552 && a2 == 0xED00004556495443 || (sub_215999208() & 1) != 0)
    return 32;
  if (a1 == 0x495F524544414552 && a2 == 0xEF4556495443414ELL || (sub_215999208() & 1) != 0)
    return 33;
  if (a1 == 0x524154535F43464ELL && a2 == 0xE900000000000054 || (sub_215999208() & 1) != 0)
    return 34;
  if (a1 == 0x444145525F43464ELL && a2 == 0xE800000000000000 || (sub_215999208() & 1) != 0)
    return 35;
  if (a1 == 0x534F4C435F43464ELL && a2 == 0xE900000000000045 || (sub_215999208() & 1) != 0)
    return 36;
  if (a1 == 0xD000000000000016 && a2 == 0x800000021599E770 || (sub_215999208() & 1) != 0)
    return 37;
  if (a1 == 0xD000000000000016 && a2 == 0x800000021599E750 || (sub_215999208() & 1) != 0)
    return 38;
  if (a1 == 0xD000000000000016 && a2 == 0x800000021599E730 || (sub_215999208() & 1) != 0)
    return 39;
  if (a1 == 0xD00000000000001ELL && a2 == 0x800000021599E710 || (sub_215999208() & 1) != 0)
    return 40;
  if (a1 == 0xD000000000000014 && a2 == 0x800000021599E6F0 || (sub_215999208() & 1) != 0)
    return 41;
  if (a1 == 0x53554C465F474F4CLL && a2 == 0xE900000000000048 || (sub_215999208() & 1) != 0)
    return 42;
  if (a1 == 0xD000000000000012 && a2 == 0x800000021599E6D0 || (sub_215999208() & 1) != 0)
    return 43;
  if (a1 == 0x435F48544C414548 && a2 == 0xEC0000004B434548 || (sub_215999208() & 1) != 0)
    return 44;
  if (a1 == 0xD00000000000001ELL && a2 == 0x800000021599E6B0 || (sub_215999208() & 1) != 0)
    return 45;
  if (a1 == 0xD000000000000018 && a2 == 0x800000021599E690 || (sub_215999208() & 1) != 0)
    return 46;
  if (a1 == 0xD000000000000017 && a2 == 0x800000021599E670 || (sub_215999208() & 1) != 0)
    return 47;
  if (a1 == 0xD000000000000015 && a2 == 0x800000021599E650 || (sub_215999208() & 1) != 0)
    return 48;
  if (a1 == 0xD000000000000015 && a2 == 0x800000021599E630 || (sub_215999208() & 1) != 0)
    return 49;
  if (a1 == 0xD000000000000012 && a2 == 0x800000021599E610 || (sub_215999208() & 1) != 0)
    return 50;
  if (a1 == 0xD000000000000014 && a2 == 0x800000021599E5F0 || (sub_215999208() & 1) != 0)
    return 51;
  if (a1 == 0xD000000000000012 && a2 == 0x800000021599E5D0 || (sub_215999208() & 1) != 0)
    return 53;
  if (a1 == 0xD000000000000010 && a2 == 0x800000021599E5B0 || (sub_215999208() & 1) != 0)
    return 54;
  v4 = 55;
  if (a1 != 0xD000000000000012 || a2 != 0x800000021599E590)
  {
    if ((sub_215999208() & 1) != 0)
      return 55;
    else
      return 44;
  }
  return v4;
}

uint64_t SPRPayAppletStatus.description.getter(uint64_t result)
{
  result = result;
  switch((char)result)
  {
    case 0:
      return result;
    case 6:
      result = 0xD000000000000014;
      break;
    case 7:
    case 30:
      result = 0xD000000000000011;
      break;
    case 21:
      result = 0x432065766F6D6552;
      break;
    case 29:
      result = 0x656C7069746C754DLL;
      break;
    default:
      type metadata accessor for SPRPayAppletStatus(0);
      result = sub_215999220();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_21597F96C()
{
  unsigned __int8 *v0;

  return SPRPayAppletStatus.description.getter(*v0);
}

uint64_t SPRInstallEvent.description.getter(unint64_t a1)
{
  uint64_t result;

  if (a1 < 4)
    return *(_QWORD *)&aCheckingcreati[8 * a1];
  type metadata accessor for SPRInstallEvent(0);
  result = sub_215999220();
  __break(1u);
  return result;
}

uint64_t sub_21597F9E0()
{
  unint64_t *v0;

  return SPRInstallEvent.description.getter(*v0);
}

uint64_t SPRCardExpirationState.description.getter(uint64_t result)
{
  result = result;
  switch((char)result)
  {
    case 0:
      return result;
    case 1:
      result = 0x7269707845746F6ELL;
      break;
    case 2:
      result = 0x64657269707865;
      break;
    case 4:
      result = 0x64696C61766E69;
      break;
    case 8:
      result = 0x6E776F6E6B6E75;
      break;
    default:
      type metadata accessor for SPRCardExpirationState(0);
      result = sub_215999220();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_21597FAB4()
{
  unsigned __int8 *v0;

  return SPRCardExpirationState.description.getter(*v0);
}

uint64_t SymmetricKey.description.getter()
{
  return 0x676E6968746F6ELL;
}

uint64_t sub_21597FAD4()
{
  return SymmetricKey.description.getter();
}

uint64_t SPRVASTerminalProtocol.description.getter(void *a1)
{
  void *v2;
  id v3;
  char v4;
  id v6;
  void *v7;
  char v8;

  sub_21597FC40();
  v2 = &unk_24D3D49A0;
  v3 = a1;
  v4 = sub_215999028();

  if ((v4 & 1) != 0)
    return 0x6C6F636F746F7270;
  v6 = v3;
  v7 = &unk_24D3D4988;
  v8 = sub_215999028();

  if ((v8 & 1) != 0)
    return 0x6E4F70556E676973;
  else
    return 0x64696C61766E69;
}

uint64_t sub_21597FBD8()
{
  void **v0;

  return SPRVASTerminalProtocol.description.getter(*v0);
}

uint64_t sub_21597FBE0(void **a1, void **a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  v2 = *a1;
  v3 = *a2;
  sub_21597FC40();
  v4 = v2;
  v5 = v3;
  v6 = sub_215999028();

  return v6 & 1;
}

unint64_t sub_21597FC40()
{
  unint64_t result;

  result = qword_254DEDBE0;
  if (!qword_254DEDBE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254DEDBE0);
  }
  return result;
}

uint64_t SPRCardEffectiveState.description.getter(uint64_t result)
{
  if (result <= 0x1Fu)
  {
    if (!(_BYTE)result)
      return result;
    if (result == 16)
      return 0x657669746361;
  }
  else
  {
    switch(result)
    {
      case 0x20u:
        return 0x6576697463616E69;
      case 0x40u:
        return 0x64696C61766E69;
      case 0x80u:
        return 0x6E776F6E6B6E75;
    }
  }
  type metadata accessor for SPRCardEffectiveState(0);
  result = sub_215999220();
  __break(1u);
  return result;
}

uint64_t sub_21597FD4C()
{
  unsigned __int8 *v0;

  return SPRCardEffectiveState.description.getter(*v0);
}

uint64_t sub_21597FD54(int a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v10;
  unsigned int v11;

  v11 = 0;
  v10 = 0;
  sub_2159801EC();
  if (byte_254DEF3A8)
  {
    v2 = sub_21597FF18(&v11);
    if ((_DWORD)v2)
    {
      v3 = v2;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_21598237C();
    }
    else
    {
      v3 = 0;
      switch(a1)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 8:
        case 9:
        case 10:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
          return v3;
        case 7:
        case 11:
        case 15:
        case 26:
        case 27:
        case 28:
          v4 = HIWORD(v11);
          goto LABEL_8;
        case 12:
        case 25:
          v5 = v11 > 1;
          goto LABEL_26;
        case 13:
        case 14:
          v5 = v11 > 2;
          goto LABEL_26;
        case 16:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
          v4 = v11 >> 18;
          goto LABEL_8;
        case 17:
        case 40:
          v6 = v11;
          v7 = 393215;
          goto LABEL_25;
        case 29:
        case 30:
        case 31:
          v4 = v11 >> 17;
          goto LABEL_8;
        case 32:
        case 45:
        case 46:
        case 47:
        case 48:
          v4 = v11 >> 19;
LABEL_8:
          if (v4)
            return 0;
          else
            return 4294967279;
        case 33:
          v6 = v11;
          v7 = 655359;
          goto LABEL_25;
        case 34:
          v8 = sub_215980064(&v10);
          if ((_DWORD)v8)
          {
            v3 = v8;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              sub_2159822EC();
          }
          else if ((v10 & 1) != 0)
          {
            return 0;
          }
          else
          {
            return 4294967279;
          }
          return v3;
        case 41:
        case 42:
          v5 = HIWORD(v11) > 4u;
          goto LABEL_26;
        case 43:
        case 44:
          v6 = v11;
          v7 = 458751;
          goto LABEL_25;
        case 49:
          v6 = v11;
          v7 = 589823;
LABEL_25:
          v5 = v6 > v7;
LABEL_26:
          if (v5)
            v3 = 0;
          else
            v3 = 4294967279;
          break;
        default:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            sub_21598225C();
          return 4294967279;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_2159821CC();
    return 4294967279;
  }
  return v3;
}

uint64_t sub_21597FF18(_DWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  size_t outputStructCnt;
  unsigned int outputStruct;
  uint64_t inputStruct;

  if (dword_254DEF390)
  {
    v2 = 0;
    goto LABEL_10;
  }
  inputStruct = 0x153534563;
  outputStruct = 0;
  v3 = sub_2159801EC();
  if ((_DWORD)v3)
  {
    v2 = v3;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_2159825BC();
  }
  else
  {
    outputStructCnt = 4;
    v4 = IOConnectCallStructMethod(dword_254DEF394, 0, &inputStruct, 8uLL, &outputStruct, &outputStructCnt);
    if (!(_DWORD)v4)
    {
      if (outputStructCnt == 4)
      {
        v5 = outputStruct;
        if (outputStruct)
        {
          v2 = 0;
          if (outputStruct >= 0xA0000)
            v5 = 655360;
          dword_254DEF390 = v5;
          goto LABEL_10;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          sub_21598240C();
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        sub_21598249C();
      }
      v2 = 4294967290;
      goto LABEL_10;
    }
    v2 = v4;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21598252C();
  }
LABEL_10:
  if (a1)
    *a1 = dword_254DEF390;
  return v2;
}

uint64_t sub_215980064(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  size_t v7;
  uint64_t outputStruct;
  uint64_t inputStruct;
  unsigned int v10;

  if (a1)
  {
    if ((byte_254DEF3B8 & 1) != 0)
    {
LABEL_10:
      v5 = 0;
      *a1 = qword_254DEF3B0;
      return v5;
    }
    v10 = 0;
    v2 = sub_21597FF18(&v10);
    if ((_DWORD)v2)
    {
      v5 = v2;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_21598288C();
    }
    else
    {
      if (v10 < 0x30000)
      {
LABEL_9:
        byte_254DEF3B8 = 1;
        goto LABEL_10;
      }
      outputStruct = 0;
      inputStruct = 0x1E53534563;
      v3 = sub_2159801EC();
      if ((_DWORD)v3)
      {
        v5 = v3;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          sub_2159827FC();
      }
      else
      {
        v7 = 8;
        v4 = IOConnectCallStructMethod(dword_254DEF394, 0, &inputStruct, 8uLL, &outputStruct, &v7);
        if ((_DWORD)v4)
        {
          v5 = v4;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            sub_21598276C();
        }
        else
        {
          if (v7 == 8)
          {
            qword_254DEF3B0 = outputStruct;
            goto LABEL_9;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            sub_2159826DC();
          return 4294967290;
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21598264C();
    return 4294967292;
  }
  return v5;
}

uint64_t sub_2159801EC()
{
  uint64_t v0;
  mach_port_t v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  uint64_t v5;
  IONotificationPort *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  size_t v17;
  _QWORD v18[2];
  int v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if ((byte_254DEF3B9 & 1) == 0)
  {
    if (qword_254DEF3D0 != -1)
      dispatch_once(&qword_254DEF3D0, &unk_24D3CD8A8);
    if ((byte_254DEF3CC & 1) != 0 || byte_254DEFC10)
    {
      byte_254DEF3A8 = 1;
    }
    else
    {
      if (qword_254DEF3E0 != -1)
        dispatch_once(&qword_254DEF3E0, &unk_24D3CD8C8);
      byte_254DEF3A8 = byte_254DEF3D8;
      if (!byte_254DEF3D8)
      {
        byte_254DEF3B9 = 1;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          sub_215982B5C();
        goto LABEL_13;
      }
    }
    v1 = *MEMORY[0x24BDD8B20];
    v2 = IOServiceMatching("AppleSSE");
    MatchingService = IOServiceGetMatchingService(v1, v2);
    if (!MatchingService)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_21598291C();
      v0 = 4294967276;
      goto LABEL_14;
    }
    v4 = MatchingService;
    v5 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)&dword_254DEF394);
    if ((_DWORD)v5)
    {
      v0 = v5;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_215982ACC();
      IOObjectRelease(v4);
      goto LABEL_14;
    }
    v6 = IONotificationPortCreate(v1);
    qword_254DEF3C0 = (uint64_t)v6;
    if (v6)
      goto LABEL_24;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_215982A3C();
    v6 = (IONotificationPort *)qword_254DEF3C0;
    if (qword_254DEF3C0)
    {
LABEL_24:
      v7 = dispatch_get_global_queue(21, 0);
      IONotificationPortSetDispatchQueue(v6, v7);

      if (IOServiceAddInterestNotification((IONotificationPortRef)qword_254DEF3C0, v4, "IOGeneralInterest", (IOServiceInterestCallback)sub_215981894, 0, (io_object_t *)&dword_254DEF3C8)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        sub_2159829AC();
      }
    }
    if (qword_254DEF3E0 != -1)
      dispatch_once(&qword_254DEF3E0, &unk_24D3CD8C8);
    if (byte_254DEF3D9)
    {
      if (qword_254DEF3D0 != -1)
        dispatch_once(&qword_254DEF3D0, &unk_24D3CD8A8);
      if ((byte_254DEF3CC & 1) == 0)
      {
        qword_254DEF3E8 = (uint64_t)fopen("/var/mobile/Library/Logs/AppleSSE.log", "a");
        if (qword_254DEF3E8)
        {
          if (MEMORY[0x2199E9704]() < 1)
            chmod("/var/mobile/Library/Logs/AppleSSE.log", 0x1B6u);
          else
            fputs("\n", (FILE *)qword_254DEF3E8);
          v18[1] = 0;
          *(_QWORD *)v19 = 0x4100000001;
          v17 = 16;
          v18[0] = 0;
          sysctl(v19, 2u, v18, &v17, 0, 0);
          sub_215981BB8("AppleSSE Log Starts - System Version %s", v8, v9, v10, v11, v12, v13, v14, (char)v18);
          sub_215981CA0(0, 0);
        }
      }
    }
    byte_254DEF3B9 = 1;
    v15 = dispatch_get_global_queue(21, 0);
    dispatch_async(v15, &unk_24D3CCAF8);

    IOObjectRelease(v4);
    return 0;
  }
  if (byte_254DEF3A8)
    return 0;
LABEL_13:
  v0 = 4294967279;
LABEL_14:
  if (dword_254DEF3C8)
  {
    IOObjectRelease(dword_254DEF3C8);
    dword_254DEF3C8 = 0;
  }
  if (qword_254DEF3C0)
  {
    IONotificationPortDestroy((IONotificationPortRef)qword_254DEF3C0);
    qword_254DEF3C0 = 0;
  }
  if (dword_254DEF394)
  {
    IOServiceClose(dword_254DEF394);
    dword_254DEF394 = 0;
  }
  return v0;
}

uint64_t sub_2159805F8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)a2 || (_DWORD)a3)
  {
    if (qword_254DEF3E8)
    {
      sub_215981BB8("%s() -> %d", a2, a3, a4, a5, a6, a7, a8, result);
      return sub_215981CA0(a4, a5);
    }
  }
  return result;
}

uint64_t sub_21598065C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_254DEF3F8 != -1)
    dispatch_once(&qword_254DEF3F8, &unk_24D3CD908);
  if (qword_254DEF3F0)
    return MEMORY[0x24BEDD108](qword_254DEF3F0, sel_prepare, a3, a4, a5, a6);
  else
    return 4294967290;
}

uint64_t sub_2159806AC(const char *a1, const char *a2, _QWORD *a3, _DWORD *a4, uint64_t a5, uint64_t a6)
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  int v14;
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v13 = (id)objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, (uint64_t)a3, (uint64_t)a4, a5, a6);
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_215982BEC();
    goto LABEL_32;
  }
  if (!a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_215982C7C();
    goto LABEL_32;
  }
  if (a1 > a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_215982D0C();
    goto LABEL_32;
  }
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_215982D9C();
    goto LABEL_32;
  }
  if (!a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_215982E2C();
LABEL_32:
    v25 = 4294967292;
    goto LABEL_16;
  }
  if (a1 < a2)
  {
    if ((unint64_t)(a2 - a1) <= 3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_215982EBC();
LABEL_21:
      v25 = 4294967290;
      goto LABEL_16;
    }
    v14 = *(_DWORD *)a1;
    if (*(_DWORD *)a1)
    {
      v15 = 0;
      v16 = a1 + 4;
      while ((unint64_t)(a2 - v16) > 3)
      {
        v19 = *(_DWORD *)v16;
        v17 = (uint64_t)(v16 + 4);
        v18 = v19;
        if ((uint64_t)&a2[-v17] < v19)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            sub_215982FDC();
          goto LABEL_21;
        }
        v20 = (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v10, v17, v18, v11, v12);
        objc_msgSend_addObject_(v13, v21, (uint64_t)v20, v22, v23, v24);

        v16 = (const char *)(v17 + v18);
        v15 += v18 + 4;
        if (!--v14)
          goto LABEL_15;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_215982F4C();
      goto LABEL_21;
    }
  }
  v15 = 0;
LABEL_15:
  v25 = 0;
  *a3 = v13;
  *a4 = v15;
LABEL_16:

  return v25;
}

uint64_t sub_2159808C4(const __CFData *a1, CFDataRef *a2)
{
  uint64_t v4;
  uint64_t v5;
  CFDataRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t outputStructCnt;
  _OWORD outputStruct[16];
  int v14;
  _DWORD inputStruct[8];
  uint64_t v16;
  uint64_t v17;
  CFRange v18;

  v17 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  memset(inputStruct, 0, sizeof(inputStruct));
  v14 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  outputStructCnt = 0;
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21598306C();
    goto LABEL_19;
  }
  if (!a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_2159830FC();
    goto LABEL_19;
  }
  v4 = sub_2159801EC();
  if ((_DWORD)v4)
  {
    v10 = v4;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21598345C();
    goto LABEL_10;
  }
  inputStruct[0] = 1397966179;
  LOWORD(inputStruct[1]) = 16;
  if ((unint64_t)CFDataGetLength(a1) >= 0x19)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21598318C();
LABEL_19:
    v10 = 4294967292;
    goto LABEL_10;
  }
  v18.length = CFDataGetLength(a1);
  v18.location = 0;
  CFDataGetBytes(a1, v18, (UInt8 *)&inputStruct[2]);
  v16 = 0;
  outputStructCnt = 260;
  v5 = IOConnectCallStructMethod(dword_254DEF394, 0, inputStruct, 0x28uLL, outputStruct, &outputStructCnt);
  if (!(_DWORD)v5)
  {
    if (outputStructCnt <= 3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_21598321C();
    }
    else
    {
      if (outputStructCnt == LODWORD(outputStruct[0]) + 4)
      {
        v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)outputStruct + 4, LODWORD(outputStruct[0]));
        if (v6)
        {
          v10 = 0;
          *a2 = v6;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            sub_2159832AC();
          v10 = 4294967291;
        }
        goto LABEL_10;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        sub_21598333C();
    }
    v10 = 4294967290;
    goto LABEL_10;
  }
  v10 = v5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    sub_2159833CC();
LABEL_10:
  sub_2159805F8((uint64_t)"SSEGetSignedDeviceData", v10, 0, 0, (uint64_t)&inputStruct[2], v7, v8, v9);
  return v10;
}

uint64_t sub_215980B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_254DEF3F8 != -1)
    dispatch_once(&qword_254DEF3F8, &unk_24D3CD908);
  if (qword_254DEF3F0)
    return MEMORY[0x24BEDD108](qword_254DEF3F0, sel_issueNewCertificate, a3, a4, a5, a6);
  else
    return 4294967290;
}

void sub_215981894(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  NSObject *v5;
  NSObject *v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  if (a3 == -469794813)
  {
    v5 = (id)qword_254DEF3A0;
    v6 = v5;
    if (!v5)
      v6 = dispatch_get_global_queue(21, 0);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_215981B98;
    v9[3] = &unk_24D3CCD88;
    v9[4] = a4;
    v7 = v9;
    goto LABEL_10;
  }
  if (a3 == -469794814)
  {
    if (!byte_254DEFC11)
    {
      v8 = dispatch_get_global_queue(21, 0);
      dispatch_async(v8, &unk_24D3CD8E8);

    }
    goto LABEL_14;
  }
  if (a3 != -469794815)
  {
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  v5 = (id)qword_254DEF398;
  v6 = v5;
  if (!v5)
    v6 = dispatch_get_global_queue(21, 0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_215981B74;
  v10[3] = &unk_24D3CCD88;
  v10[4] = a4;
  v7 = v10;
LABEL_10:
  dispatch_async(v6, v7);
  if (!v5)

LABEL_15:
}

const char *sub_215981A1C()
{
  const char *result;
  char *__lasts;
  size_t v2;
  char __str[1024];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 1024;
  result = (const char *)sysctlbyname("kern.bootargs", __str, &v2, 0, 0);
  if (!(_DWORD)result)
  {
    __lasts = 0;
    result = strtok_r(__str, " \t", &__lasts);
    if (result)
    {
      while (1)
      {
        result = (const char *)strcmp(result, "rd=md0");
        if (!(_DWORD)result)
          break;
        result = strtok_r(0, " \t", &__lasts);
        if (!result)
          return result;
      }
      byte_254DEF3CC = 1;
    }
  }
  return result;
}

void *sub_215981AF8()
{
  void *result;
  void *v1;
  uint64_t (*v2)(const __CFString *);
  uint64_t (*v3)(const __CFString *);

  result = dlopen("/usr/lib/libMobileGestalt.dylib", 1);
  if (result)
  {
    v1 = result;
    v2 = (uint64_t (*)(const __CFString *))dlsym(result, "MGGetBoolAnswer");
    if (v2)
    {
      v3 = v2;
      byte_254DEF3D8 = v2(CFSTR("0dnM19zBqLw5ZPhIo4GEkg"));
      byte_254DEF3D9 = v3(CFSTR("InternalBuild"));
    }
    return (void *)dlclose(v1);
  }
  return result;
}

uint64_t sub_215981B74()
{
  uint64_t result;

  result = qword_254DEF380;
  if (qword_254DEF380)
    return (*(uint64_t (**)(void))(qword_254DEF380 + 16))();
  return result;
}

uint64_t sub_215981B98()
{
  uint64_t result;

  result = qword_254DEF388;
  if (qword_254DEF388)
    return (*(uint64_t (**)(void))(qword_254DEF388 + 16))();
  return result;
}

const char *sub_215981BB8(const char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *v9;
  tm *v10;
  FILE *v11;
  const char *v12;
  time_t v13;
  char v14[16];
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (qword_254DEF3E8)
  {
    v9 = result;
    *(_OWORD *)v14 = 0u;
    v15 = 0u;
    v13 = time(0);
    v10 = localtime(&v13);
    strftime(v14, 0x20uLL, "%F %T (%z)", v10);
    v11 = (FILE *)qword_254DEF3E8;
    v12 = getprogname();
    fprintf(v11, "%s [%s]: ", v14, v12);
    vfprintf((FILE *)qword_254DEF3E8, v9, &a9);
    fputs("\n", (FILE *)qword_254DEF3E8);
    return (const char *)fflush((FILE *)qword_254DEF3E8);
  }
  return result;
}

uint64_t sub_215981CA0(uint64_t result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t i;
  size_t outputStructCnt;
  __int128 outputStruct;
  __int128 v7;
  __int128 v8;
  uint64_t inputStruct;

  if (qword_254DEF3E8)
  {
    v3 = (_DWORD *)result;
    inputStruct = 0x953534563;
    v7 = 0u;
    v8 = 0u;
    outputStruct = 0u;
    outputStructCnt = 48;
    result = IOConnectCallStructMethod(dword_254DEF394, 0, &inputStruct, 8uLL, &outputStruct, &outputStructCnt);
    if (!(_DWORD)result)
    {
      if (v3)
        fprintf((FILE *)qword_254DEF3E8, "\tuserID        = %u\n", *v3);
      if (a2)
      {
        fwrite("\tseid          = ", 0x11uLL, 1uLL, (FILE *)qword_254DEF3E8);
        for (i = 0; i != 24; ++i)
          fprintf((FILE *)qword_254DEF3E8, "%02x", *(unsigned __int8 *)(a2 + i));
        fputs("\n", (FILE *)qword_254DEF3E8);
      }
      fprintf((FILE *)qword_254DEF3E8, "\tsseKey hash   = %016llx\n", (_QWORD)outputStruct);
      fprintf((FILE *)qword_254DEF3E8, "\tauthRand hash = %016llx\n", *((_QWORD *)&outputStruct + 1));
      fprintf((FILE *)qword_254DEF3E8, "\tsubcounter    = %llu\n", (_QWORD)v7);
      fprintf((FILE *)qword_254DEF3E8, "\tentropy hash  = %016llx\n", *((_QWORD *)&v7 + 1));
      fprintf((FILE *)qword_254DEF3E8, "\tkeybag hash   = %016llx\n", (_QWORD)v8);
      fprintf((FILE *)qword_254DEF3E8, "\tnoPasscodeCnt = %u\n", DWORD2(v8));
      return fflush((FILE *)qword_254DEF3E8);
    }
  }
  return result;
}

void sub_215981E30()
{
  Class Class;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (qword_254DEF3D0 != -1)
    dispatch_once(&qword_254DEF3D0, &unk_24D3CD8A8);
  if ((byte_254DEF3CC & 1) == 0)
  {
    sub_2159801EC();
    if (byte_254DEF3A8)
    {
      if (qword_254DEF408[0] != -1)
        dispatch_once(qword_254DEF408, &unk_24D3CCB18);
      if (byte_254DEF400 == 1)
      {
        if (dlopen("/usr/lib/libAppleSSEExt.dylib", 1))
        {
          Class = objc_getClass("BAASupport");
          qword_254DEF3F0 = (uint64_t)Class;
          if (!Class)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              sub_21598489C();
            Class = (Class)qword_254DEF3F0;
          }
          v1 = objc_opt_class();
          objc_msgSend_setDelegate_(Class, v2, v1, v3, v4, v5);
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          sub_21598480C();
        }
      }
    }
  }
}

void sub_215981F50(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int isEqualToString;
  void *v18;
  void *v19;
  uint64_t (*v20)(_QWORD);
  uint64_t v21;
  const void *v22;
  uint64_t (*v23)(const void *, const __CFString *, _QWORD);
  uint64_t (*v24)(const void *, const __CFString *, _QWORD);
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _DWORD v37[2];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = (id)objc_msgSend_processInfo(MEMORY[0x24BDD1760], a2, a3, a4, a5, a6);
  v12 = (id)objc_msgSend_processName(v6, v7, v8, v9, v10, v11);
  isEqualToString = objc_msgSend_isEqualToString_(v12, v13, (uint64_t)CFSTR("nfcd"), v14, v15, v16);

  if (isEqualToString)
  {
    byte_254DEF400 = 1;
  }
  else
  {
    v18 = dlopen("/System/Library/Frameworks/Security.framework/Security", 1);
    if (v18)
    {
      v19 = v18;
      v20 = (uint64_t (*)(_QWORD))dlsym(v18, "SecTaskCreateFromSelf");
      if (v20)
      {
        v21 = v20(*MEMORY[0x24BDBD240]);
        if (v21)
        {
          v22 = (const void *)v21;
          v23 = (uint64_t (*)(const void *, const __CFString *, _QWORD))dlsym(v19, "SecTaskCopyValueForEntitlement");
          if (v23)
          {
            v24 = v23;
            v25 = (void *)v23(v22, CFSTR("com.apple.private.applesse.allow"), 0);
            v26 = (void *)v24(v22, CFSTR("com.apple.private.applesse.baa"), 0);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend_BOOLValue(v25, v27, v28, v29, v30, v31))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (objc_msgSend_BOOLValue(v26, v32, v33, v34, v35, v36))
                    byte_254DEF400 = 1;
                }
              }
            }

          }
          CFRelease(v22);
        }
      }
      dlclose(v19);
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v37[0] = 67109120;
    v37[1] = byte_254DEF400;
    _os_log_impl(&dword_215968000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "isEntitledForBAA(): entitled = %u", (uint8_t *)v37, 8u);
  }
}

void sub_215982180(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

void sub_2159821CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598225C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159822EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598237C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598240C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598249C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598252C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159825BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598264C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159826DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598276C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159827FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598288C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598291C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159829AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215982A3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215982ACC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215982B5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215982BEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215982C7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215982D0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215982D9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215982E2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215982EBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215982F4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215982FDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598306C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159830FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598318C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598321C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159832AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598333C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159833CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598345C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159834EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598357C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598360C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598369C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598372C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159837BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598384C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159838DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598396C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159839FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215983A8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215983B1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215983BAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215983C3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215983CCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215983D5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215983DEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215983E7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215983F0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_215983F9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598402C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159840BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598414C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159841DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598426C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159842FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598438C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598441C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159844AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598453C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159845CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598465C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_2159846EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598477C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_2159821A4();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598480C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

void sub_21598489C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_215982160();
  sub_215982190();
  sub_215982180(&dword_215968000, MEMORY[0x24BDACB70], v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_2159821C4();
}

uint64_t sub_21598492C(uint64_t a1, unint64_t *a2)
{
  return sub_215984934(a1, a2, 0);
}

uint64_t sub_215984934(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t sub_215984B24(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v10;

  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(result + 8))
    return 3;
  v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  v4 = *(_QWORD *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      v6 = *(_QWORD *)result;
      v7 = *(_QWORD *)result + v4;
      v8 = (unsigned __int8 *)(*(_QWORD *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3)
    return 3;
  else
    return 0;
}

uint64_t sub_215984BE4(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  result = sub_215984C64(a1, v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t sub_215984C64(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t sub_215984CCC(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  memset(v8, 170, 24);
  result = sub_215984934(a1, v8, 0);
  if (!(_DWORD)result)
  {
    v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t sub_215984D84(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = sub_215984934((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t sub_215984E40(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  memset(v12, 170, 24);
  result = sub_215984934(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return sub_215984F08(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t sub_215984F08(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = sub_215984D84(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}

uint64_t sub_2159851D8(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return sub_215984E40(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

unint64_t *sub_2159851F8(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return (unint64_t *)sub_215984F08(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

uint64_t sub_215985218(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  memset(v4, 170, 24);
  result = sub_215984934(a1, v4, 0);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL)
      return sub_2159852B4(&v4[1], a2);
    else
      return 2;
  }
  return result;
}

uint64_t sub_2159852B4(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  char v7;
  unint64_t v8[3];
  unint64_t v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  v4 = v2 + v3;
  if (v2 > v4)
    goto LABEL_13;
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  v7 = 0;
  while (1)
  {
    LODWORD(result) = sub_215984D84(v9, v8);
    if ((_DWORD)result)
      break;
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result)
      break;
    if (v7)
      return 0;
  }
  if (result <= 1)
    return 0;
  else
    return result;
}

unint64_t sub_21598537C(unint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;

  if (result >= 0x80)
  {
    v5 = 0;
    v6 = result;
    do
    {
      --v5;
      v7 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v7);
    v8 = -v5;
    v9 = 7;
    if (-v5 < a3 && v8 <= 0x7E)
    {
      if (*a4)
      {
        v4 = 1 - v5;
        *(_BYTE *)a2 = -(char)v5 | 0x80;
        if (v8 < ~a2)
        {
          v10 = (_BYTE *)(a2 - v5);
          if (a2 - v5 != -2)
          {
            v11 = (_BYTE *)(a2 + *a4);
            while (v10 != (_BYTE *)-1)
            {
              if (v10 >= v11 || (unint64_t)v10 < a2)
                goto LABEL_23;
              *v10-- = result;
              v7 = result > 0xFF;
              result >>= 8;
              if (!v7)
              {
                if (v8 >= *a4)
                  goto LABEL_23;
                goto LABEL_19;
              }
            }
          }
        }
        __break(0x5513u);
      }
      goto LABEL_23;
    }
    return v9;
  }
  if (!a3)
    return 7;
  if (*a4)
  {
    *(_BYTE *)a2 = result;
    if (*a4)
    {
      v4 = 1;
LABEL_19:
      v9 = 0;
      *a4 = v4;
      return v9;
    }
  }
LABEL_23:
  __break(0x5519u);
  return result;
}

unint64_t sub_215985470(unint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  uint64_t v8;

  v2 = result & 0x1FFFFFFFFFFFFFFFLL;
  v3 = 1;
  if ((result & 0x1FFFFFFFFFFFFFFFLL) >= 0x1F)
  {
    do
    {
      ++v3;
      v4 = v2 > 0x7F;
      v2 >>= 7;
    }
    while (v4);
  }
  v5 = 1;
  if (a2 >= 0x80)
  {
    v6 = a2;
    do
    {
      ++v5;
      v4 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v4);
  }
  v7 = __CFADD__(v3, v5);
  v8 = v3 + v5;
  if (v7 || (result = v8 + a2, __CFADD__(v8, a2)))
    __break(0x5500u);
  return result;
}

uint64_t sub_2159854D0(unint64_t a1, unint64_t a2, const void *a3, unint64_t a4, unint64_t *a5)
{
  return sub_2159854DC(a1, a2, a3, a4, *a5, a5);
}

uint64_t sub_2159854DC(unint64_t a1, unint64_t a2, const void *a3, unint64_t a4, unint64_t a5, unint64_t *a6)
{
  unint64_t v12;
  unint64_t v13;
  uint64_t result;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v12 = *a6;
  v13 = sub_215985470(a1, a2);
  if (v13 > a5)
    return 7;
  v15 = v13;
  if (v13 > *a6)
    goto LABEL_20;
  *a6 = v13;
  v22[0] = v13;
  if (v13 > v12)
    goto LABEL_20;
  result = sub_215985644(a1, a4, (unint64_t *)v22);
  if ((_DWORD)result)
    return result;
  v16 = v22[0];
  if (__CFADD__(a4, v22[0]))
  {
LABEL_21:
    __break(0x5513u);
    goto LABEL_22;
  }
  v17 = v15 >= v22[0];
  v18 = v15 - v22[0];
  if (!v17)
    goto LABEL_22;
  v19 = a4 + v12;
  v20 = a4 + v22[0];
  v22[0] = v18;
  if (a4 + v16 > a4 + v12 || v20 < a4 || v18 > v19 - v20)
LABEL_20:
    __break(0x5519u);
  result = sub_21598537C(a2, v20, v18, v22);
  if ((_DWORD)result)
    return result;
  if (__CFADD__(v20, v22[0]))
    goto LABEL_21;
  if (v18 < v22[0])
  {
LABEL_22:
    __break(0x5515u);
    return result;
  }
  v21 = (void *)(v20 + v22[0]);
  if (v19 < v20 + v22[0] || (unint64_t)v21 < a4 || v19 - (v20 + v22[0]) < a2)
    goto LABEL_20;
  memmove(v21, a3, a2);
  return 0;
}

uint64_t sub_215985644(uint64_t result, unint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  unint64_t v11;

  v3 = result & 0x1FFFFFFFFFFFFFFFLL;
  if ((result & 0x1FFFFFFFFFFFFFFFuLL) < 0x1F)
  {
    if (*a3)
    {
      *(_BYTE *)a2 = HIBYTE(result) & 0xE0 | result;
      v8 = 1;
      goto LABEL_17;
    }
    return 7;
  }
  v4 = 0;
  v5 = result & 0x1FFFFFFFFFFFFFFFLL;
  do
  {
    ++v4;
    v6 = v5 > 0x7F;
    v5 >>= 7;
  }
  while (v6);
  v7 = *a3;
  if (v4 >= *a3)
    return 7;
  if (v4 >= ~a2 || (*(_BYTE *)a2 = HIBYTE(result) | 0x1F, a2 + v4 == -2))
  {
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }
  if (a2 + v4 >= a2)
  {
    v8 = v4 + 1;
    *(_BYTE *)(a2 + v4) = result & 0x7F;
    if (v3 >= 0x80)
    {
      v9 = (_BYTE *)(a2 + v4 - 1);
      v10 = (_BYTE *)(a2 + v7);
      while (v9 != (_BYTE *)-2)
      {
        if (v9 >= v10 || (unint64_t)v9 < a2)
          goto LABEL_21;
        v11 = v3 >> 14;
        v3 >>= 7;
        *v9-- = v3 | 0x80;
        if (!v11)
          goto LABEL_17;
      }
      goto LABEL_20;
    }
LABEL_17:
    if (v8 <= *a3)
    {
      result = 0;
      *a3 = v8;
      return result;
    }
  }
LABEL_21:
  __break(0x5519u);
  return result;
}

uint64_t sub_215985738(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t *a8)
{
  unint64_t v8;
  unint64_t v11;
  uint64_t result;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  const void **v27;
  __int16 v28;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  size_t v36;
  unint64_t v37;
  size_t v39;
  BOOL v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v44;
  unint64_t v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v8 = ~a6;
  if (~a6 < a7)
    goto LABEL_73;
  v11 = *a8;
  v44 = a7;
  v45[0] = 0;
  if (v11 < a7)
    goto LABEL_74;
  result = sub_215985644(a1, a6, &v44);
  if ((_DWORD)result)
    return result;
  if (v44 > v8)
    goto LABEL_73;
  v17 = a7 - v44;
  if (a7 < v44)
    goto LABEL_75;
  v18 = a6 + a7;
  v19 = a6 + v44;
  if (a6 + v44 < v18)
  {
    result = sub_215985B08(a2, a3, a4, a5, v45);
    if ((_DWORD)result)
      return result;
    v44 = v17;
    if (v19 > a6 + v11 || v19 < a6 || v17 > a6 + v11 - v19)
      goto LABEL_74;
    v42 = a6 + v11;
    v20 = v45[0];
    result = sub_21598537C(v45[0], v19, v17, (uint64_t *)&v44);
    if ((_DWORD)result)
      return result;
    v21 = v42;
    if (__CFADD__(v19, v44))
    {
LABEL_73:
      __break(0x5513u);
      goto LABEL_74;
    }
    v22 = v17 - v44;
    if (v17 >= v44)
    {
      v23 = (_BYTE *)(v19 + v44);
      if (!__CFADD__(v19 + v44, v20))
      {
        if ((unint64_t)&v23[v20] > v18)
          return 7;
        if (a4)
        {
          v24 = 0;
          v25 = a2 + a3;
          v41 = 24 * a4;
          while (1)
          {
            if (v24 > ~a5)
              goto LABEL_73;
            v26 = *(_QWORD *)(a5 + v24);
            if (v26 > ~a2)
              goto LABEL_73;
            v27 = (const void **)(a2 + v26);
            v28 = *(_WORD *)(a5 + v24 + 16);
            if ((v28 & 0x200) != 0)
              break;
            if ((v28 & 1) == 0)
              goto LABEL_29;
            if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25)
              goto LABEL_74;
            if (v27[1])
            {
LABEL_29:
              v44 = v22;
              if ((unint64_t)v23 > v21 || (unint64_t)v23 < a6 || v22 > v21 - (unint64_t)v23)
                goto LABEL_74;
              result = sub_215985644(*(_QWORD *)(a5 + v24 + 8), (unint64_t)v23, &v44);
              if ((_DWORD)result)
                return result;
              if (__CFADD__(v23, v44))
                goto LABEL_73;
              v30 = v22 - v44;
              if (v22 < v44)
                goto LABEL_75;
              if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25)
                goto LABEL_74;
              v31 = (unint64_t)v27[1];
              v45[0] = v31;
              v32 = 1;
              if ((v28 & 0x100) != 0 && v31 && *(char *)*v27 < 0)
              {
                v32 = 0;
                v45[0] = ++v31;
              }
              v33 = (unint64_t)&v23[v44];
              v44 = v30;
              if (v33 > v42 || v33 < a6 || v30 > v42 - v33)
                goto LABEL_74;
              result = sub_21598537C(v31, v33, v30, (uint64_t *)&v44);
              if ((_DWORD)result)
                return result;
              v34 = v44;
              if (__CFADD__(v33, v44))
                goto LABEL_73;
              v35 = v30 - v44;
              if (v30 < v44)
                goto LABEL_75;
              v23 = (_BYTE *)(v33 + v44);
              if ((v32 & 1) == 0)
              {
                if (v23 == (_BYTE *)-1)
                  goto LABEL_73;
                if ((unint64_t)v23 >= v42 || (unint64_t)v23 < a6)
                  goto LABEL_74;
                *v23 = 0;
                --v35;
                if (v30 == v34)
                  goto LABEL_75;
                ++v23;
              }
              if ((unint64_t)v23 > v42)
                goto LABEL_74;
              if ((unint64_t)v23 < a6)
                goto LABEL_74;
              v36 = (size_t)v27[1];
              if (v36 > v42 - (unint64_t)v23)
                goto LABEL_74;
              result = (uint64_t)memmove(v23, *v27, v36);
              v21 = v42;
              v37 = (unint64_t)v27[1];
              if (__CFADD__(v23, v37))
                goto LABEL_73;
              v22 = v35 - v37;
              if (v35 < v37)
                goto LABEL_75;
              goto LABEL_69;
            }
LABEL_70:
            v24 += 24;
            if (v41 == v24)
              goto LABEL_71;
          }
          if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25)
            goto LABEL_74;
          if ((unint64_t)v23 > v21)
            goto LABEL_74;
          if ((unint64_t)v23 < a6)
            goto LABEL_74;
          v39 = (size_t)v27[1];
          if (v39 > v21 - (unint64_t)v23)
            goto LABEL_74;
          result = (uint64_t)memmove(v23, *v27, v39);
          v21 = v42;
          v37 = (unint64_t)v27[1];
          if (__CFADD__(v23, v37))
            goto LABEL_73;
          v40 = v22 >= v37;
          v22 -= v37;
          if (!v40)
            goto LABEL_75;
LABEL_69:
          v23 += v37;
          goto LABEL_70;
        }
LABEL_71:
        if ((unint64_t)&v23[-a6] <= *a8)
        {
          result = 0;
          *a8 = (unint64_t)&v23[-a6];
          return result;
        }
LABEL_74:
        __break(0x5519u);
      }
      goto LABEL_73;
    }
LABEL_75:
    __break(0x5515u);
    return result;
  }
  return 7;
}

unint64_t sub_215985B08(unint64_t result, unint64_t a2, int a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unsigned __int8 **v10;
  __int16 v11;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned __int8 *v20;
  unint64_t v21;
  uint64_t v22;

  v5 = 0;
  if (!a3)
  {
LABEL_38:
    result = 0;
LABEL_40:
    *a5 = v5;
    return result;
  }
  v6 = 0;
  v7 = result + a2;
  while (24 * (unint64_t)v6 <= ~a4)
  {
    v8 = *(_QWORD *)(a4 + 24 * v6);
    v9 = v8 > 0xFFFFFFFFFFFFFFEFLL || v8 + 16 > a2;
    if (v9)
    {
      v5 = 0;
      result = 7;
      goto LABEL_40;
    }
    if (v8 > ~result)
      break;
    v10 = (unsigned __int8 **)(result + v8);
    v11 = *(_WORD *)(a4 + 24 * v6 + 16);
    if ((v11 & 0x200) == 0)
    {
      if ((v11 & 1) != 0)
      {
        if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7)
          goto LABEL_43;
        if (!v10[1])
          goto LABEL_37;
      }
      v13 = *(_QWORD *)(a4 + 24 * v6 + 8) & 0x1FFFFFFFFFFFFFFFLL;
      v14 = 1;
      if (v13 >= 0x1F)
      {
        do
        {
          ++v14;
          v9 = v13 > 0x7F;
          v13 >>= 7;
        }
        while (v9);
      }
      v15 = __CFADD__(v5, v14);
      v16 = v5 + v14;
      if (v15)
        goto LABEL_42;
      if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7)
        goto LABEL_43;
      v17 = (unint64_t)v10[1];
      if ((*(_WORD *)(a4 + 24 * v6 + 16) & 0x100) != 0)
      {
        if (v17)
        {
          v17 += (unint64_t)**v10 >> 7;
          goto LABEL_24;
        }
LABEL_25:
        v18 = 1;
      }
      else
      {
LABEL_24:
        if (v17 < 0x80)
          goto LABEL_25;
        v18 = 1;
        v21 = v17;
        do
        {
          ++v18;
          v9 = v21 > 0xFF;
          v21 >>= 8;
        }
        while (v9);
      }
      v15 = __CFADD__(v16, v18);
      v22 = v16 + v18;
      if (v15)
        goto LABEL_42;
      v15 = __CFADD__(v22, v17);
      v5 = v22 + v17;
      if (v15)
        goto LABEL_42;
      goto LABEL_37;
    }
    if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7)
      goto LABEL_43;
    v20 = v10[1];
    v15 = __CFADD__(v5, v20);
    v5 += (uint64_t)v20;
    if (v15)
      goto LABEL_42;
LABEL_37:
    if (++v6 == a3)
      goto LABEL_38;
  }
  __break(0x5513u);
LABEL_42:
  __break(0x5500u);
LABEL_43:
  __break(0x5519u);
  return result;
}

uint64_t sub_215985C74(uint64_t result, unint64_t a2, unsigned int a3, uint64_t a4, unint64_t a5, unint64_t *a6)
{
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) >= a2)
    return sub_215985738(result, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, a5, *a6, a6);
  __break(0x5519u);
  return result;
}

unint64_t sub_215985CA4(uint64_t a1, unint64_t a2, unint64_t a3, int a4, uint64_t a5, uint64_t *a6)
{
  unint64_t result;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v17[0] = 0;
  result = sub_215985B08(a2, a3, a4, a5, v17);
  if (!(_DWORD)result)
  {
    v9 = a1 & 0x1FFFFFFFFFFFFFFFLL;
    v10 = 1;
    if ((a1 & 0x1FFFFFFFFFFFFFFFuLL) >= 0x1F)
    {
      do
      {
        ++v10;
        v11 = v9 > 0x7F;
        v9 >>= 7;
      }
      while (v11);
    }
    v12 = 1;
    if (v17[0] >= 0x80uLL)
    {
      v13 = v17[0];
      do
      {
        ++v12;
        v11 = v13 > 0xFF;
        v13 >>= 8;
      }
      while (v11);
    }
    v14 = __CFADD__(v10, v12);
    v15 = v10 + v12;
    if (v14 || (v14 = __CFADD__(v15, v17[0]), v16 = v15 + v17[0], v14))
    {
      __break(0x5500u);
    }
    else
    {
      result = 0;
      *a6 = v16;
    }
  }
  return result;
}

uint64_t sub_215985D84(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) < a2)
    __break(0x5519u);
  if (sub_215985CA4(a1, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, v5))
    return 0;
  else
    return v5[0];
}

BOOL sub_215985E00(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  size_t v4;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 8);
    return v4 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

uint64_t sub_215985E4C(uint64_t a1, unint64_t a2)
{
  sub_21597B9F4(a1, a2);
  return a1;
}

uint64_t sub_215985E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t sub_215985E80()
{
  return 0;
}

uint64_t sub_215985E90(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  sub_21597BA38(&qword_254DEDBC0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_21599BEA0;
  *(_BYTE *)(v6 + 32) = a3;
  v7 = sub_2159877F0(v6);
  v9 = v8;
  swift_bridgeObjectRelease();
  sub_21597B9F4(a1, a2);
  sub_21597B9F4(v7, v9);
  sub_215986890(a1, a2);
  sub_21597AD00(a1, a2);
  sub_21597AD00(v7, v9);
  return v7;
}

void sub_215985F54(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[3] = MEMORY[0x24BDCDDE8];
  v3[4] = MEMORY[0x24BDCDDC8];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_215985FB8 + dword_2159861EC[sub_215987AE8(v3, MEMORY[0x24BDCDDE8])[1] >> 62];
  __asm { BR              X10 }
}

uint64_t sub_215985FC8()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int16 v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v6 = v2;
  v7 = v3;
  v8 = BYTE2(v3);
  v9 = BYTE3(v3);
  v10 = BYTE4(v3);
  v11 = BYTE5(v3);
  sub_21597B9F4(v1, v0);
  sub_2159966F8(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  sub_21597AD00(v1, v0);
  v4 = v12;
  sub_21597C068((uint64_t)&v13);
  return v4;
}

uint64_t sub_2159861FC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  v8[3] = MEMORY[0x24BEE0F88];
  v8[4] = MEMORY[0x24BDCFB90];
  v8[0] = a1;
  v8[1] = a2;
  v2 = sub_215987AE8(v8, MEMORY[0x24BEE0F88]);
  v3 = (_BYTE *)*v2;
  if (*v2 && (v4 = (_BYTE *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      v6 = sub_2159967A8(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      v6 = sub_215996868((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      v6 = sub_2159968E0((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    v6 = 0;
  }
  sub_21597C068((uint64_t)v8);
  return v6;
}

uint64_t sub_2159862B4(uint64_t a1)
{
  uint64_t v1;
  __n128 v2;
  __n128 v3;
  __int128 v6;
  __int128 v7[2];
  uint64_t v8;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v6 = a1;
  swift_bridgeObjectRetain();
  sub_21597BA38(&qword_254DEDD28);
  sub_21597BA38(&qword_254DEDD30);
  if (!swift_dynamicCast())
  {
    v8 = 0;
    memset(v7, 0, sizeof(v7));
    sub_215987C6C((uint64_t)v7, &qword_254DEDD38);
    *(_QWORD *)&v7[0] = sub_21597E338(*(_QWORD *)(a1 + 16));
    *((_QWORD *)&v7[0] + 1) = v1;
    MEMORY[0x24BDAC7A8](v2, v3);
    sub_215986E6C();
    __asm { BR              X12 }
  }
  sub_215987AD0(v7, (uint64_t)v9);
  sub_215987AE8(v9, v9[3]);
  sub_215998BC0();
  swift_bridgeObjectRelease();
  v7[0] = v6;
  sub_21597C068((uint64_t)v9);
  return *(_QWORD *)&v7[0];
}

void sub_2159865E0(uint64_t *a1)
{
  sub_21598769C(*a1, a1[1]);
}

unint64_t sub_2159865FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = sub_21597BA38(&qword_254DEDD18);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_21597BA38(&qword_254DEDD20);
  v6 = sub_2159991B4();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_215987A50(v12, (uint64_t)v5);
    result = sub_215987268((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_21599916C();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    result = (unint64_t)sub_21597AD44(v9, (_OWORD *)(v7[7] + 32 * v16));
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_215986790()
{
  return 0;
}

uint64_t sub_215986798()
{
  return 1;
}

uint64_t sub_2159867A0()
{
  return 2;
}

uint64_t sub_2159867A8()
{
  return 3;
}

uint64_t sub_2159867B0()
{
  return 4;
}

uint64_t sub_2159867B8()
{
  return 6;
}

uint64_t sub_2159867C0()
{
  return 12;
}

uint64_t sub_2159867C8()
{
  return 5;
}

uint64_t sub_2159867D0()
{
  sub_215998B24();
  sub_21597A388(&qword_254DEDD00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB2A8], MEMORY[0x24BDCB2C8]);
  sub_21597BA38(&qword_254DEDD08);
  sub_215987CA8(&qword_254DEDD10, &qword_254DEDD08, MEMORY[0x24BEE12C8]);
  return sub_215999100();
}

unint64_t sub_215986884()
{
  return sub_2159865FC(MEMORY[0x24BEE4AF8]);
}

void sub_215986890(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[3] = MEMORY[0x24BDCDDE8];
  v3[4] = MEMORY[0x24BDCDDC8];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_2159868F4 + *((int *)qword_215986A98 + (sub_215987AE8(v3, MEMORY[0x24BDCDDE8])[1] >> 62));
  __asm { BR              X10 }
}

uint64_t sub_215986904()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v3;

  sub_21597B9F4(v1, v0);
  sub_215998C8C();
  return sub_21597C068((uint64_t)&v3);
}

uint64_t sub_215986AA8()
{
  __n128 v1;
  __n128 v2;
  __int128 v4[2];
  uint64_t v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  swift_bridgeObjectRetain();
  sub_21597BA38(&qword_254DEDD28);
  sub_21597BA38(&qword_254DEDD30);
  if (!swift_dynamicCast())
  {
    v5 = 0;
    memset(v4, 0, sizeof(v4));
    sub_215987C6C((uint64_t)v4, &qword_254DEDD38);
    __asm { BR              X12 }
  }
  sub_215987AD0(v4, (uint64_t)v6);
  sub_215987AE8(v6, v6[3]);
  MEMORY[0x24BDAC7A8](v1, v2);
  sub_215998BC0();
  return sub_21597C068((uint64_t)v6);
}

void sub_215986E6C()
{
  __asm { BR              X11 }
}

_QWORD *sub_215986ECC@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_QWORD *sub_215987158(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_2159871BC(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_215998B78();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_215998B9C();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_215998B90();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

unint64_t sub_215987268(uint64_t a1)
{
  uint64_t v2;

  sub_21599916C();
  v2 = sub_215998DC4();
  return sub_2159872B8(a1, v2);
}

unint64_t sub_2159872B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_21599916C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      v14 = sub_215998E18();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_2159873E0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_215998B78();
  if (!result || (result = sub_215998B9C(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_215998B90();
      return sub_215998C8C();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

_QWORD *sub_215987470(_QWORD *result, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int8x16_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int8x16_t *v14;
  int8x16_t v15;
  int8x16_t v16;
  _BYTE *v17;
  unint64_t v18;

  v4 = *(_QWORD *)(a4 + 16);
  if (!a2)
  {
    v5 = *(_QWORD *)(a4 + 16);
    v4 = 0;
LABEL_30:
    *result = a4;
    result[1] = v5;
    return (_QWORD *)v4;
  }
  if (!a3)
  {
    v5 = *(_QWORD *)(a4 + 16);
LABEL_29:
    v4 = a3;
    goto LABEL_30;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (!v4)
    {
LABEL_31:
      v5 = 0;
      goto LABEL_30;
    }
    v5 = v4 - 1;
    *a2 = *(_BYTE *)(a4 + v4 - 1 + 32);
    v6 = a3 - 1;
    if (a3 != 1)
    {
      v7 = a3 - 2;
      if (a3 - 2 >= v5)
        v8 = v4 - 1;
      else
        v8 = a3 - 2;
      if (v8 >= v6)
        v8 = a3 - 1;
      v9 = v8 + 1;
      if (v9 <= 0x10)
        goto LABEL_18;
      v10 = (int8x16_t *)(a2 + 1);
      if (v7 >= v5)
        v7 = v4 - 1;
      if (v7 < v6)
        v6 = v7;
      if ((unint64_t)v10 >= v4 + a4 + 31 || v4 - v6 + a4 + 30 >= (unint64_t)&a2[v6 + 2])
      {
        v12 = v9 & 0xF;
        if ((v9 & 0xF) == 0)
          v12 = 16;
        v13 = v9 - v12;
        v11 = v13 + 1;
        v5 -= v13;
        a2 += v13;
        v14 = (int8x16_t *)(v4 + a4 + 15);
        do
        {
          v15 = *v14--;
          v16 = vrev64q_s8(v15);
          *v10++ = vextq_s8(v16, v16, 8uLL);
          v13 -= 16;
        }
        while (v13);
      }
      else
      {
LABEL_18:
        v11 = 1;
      }
      v17 = a2 + 1;
      v18 = v5;
      while (a3 != v11)
      {
        if (!v18)
          goto LABEL_31;
        ++v11;
        v5 = v18 - 1;
        *v17++ = *(_BYTE *)(a4 + 31 + v18--);
        if (a3 == v11)
          goto LABEL_29;
      }
      __break(1u);
      goto LABEL_33;
    }
    goto LABEL_29;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_2159875A4(uint64_t a1, unint64_t a2)
{
  __int16 v4;
  __int16 v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  unint64_t v10;

  sub_21597B9F4(a1, a2);
  sub_215988A4C(a1, a2);
  v5 = v4;
  sub_21597AD00(a1, a2);
  if ((v5 & 0x100) != 0)
  {
    v6 = a1;
    v7 = a2;
  }
  else
  {
    sub_2159917F0(1, a1, a2);
    v6 = v9;
    v7 = v10;
    if (v5 <= 7u)
      __asm { BR              X10 }
  }
  sub_21597AD00(v6, v7);
  return 0;
}

void sub_215987668(uint64_t a1)
{
  char v1;

  if ((int)a1 == a1 >> 32 && v1 != 0)
    JUMPOUT(0x215987640);
  JUMPOUT(0x215987650);
}

void sub_21598769C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_2159876EC()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_215987720 + *((int *)qword_2159877E0 + (v0 >> 62))))();
}

BOOL sub_215987730@<W0>(uint64_t a1@<X8>)
{
  char v1;
  char v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (a1 == BYTE6(v3) && (a1 < 1 || (sub_21597B9F4(v4, v3), sub_21598F6EC(v6, v5), (v7 & 1) != 0)))
    return v2 == v1;
  else
    return 0;
}

uint64_t sub_2159877F0(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v9 = sub_21597BA38(&qword_254DEDD48);
  v10 = sub_215987CA8(&qword_254DEDD50, &qword_254DEDD48, MEMORY[0x24BDCFBE0]);
  v8[0] = a1;
  v2 = sub_215987AE8(v8, v9);
  v3 = (_BYTE *)(*v2 + 32);
  v4 = &v3[*(_QWORD *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_2159966F8(v3, v4, &v7);
  v5 = v7;
  sub_21597C068((uint64_t)v8);
  return v5;
}

uint64_t destroy for BitString(uint64_t a1)
{
  return sub_21597AD00(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t _s7SPRBase9BitStringVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_21597B9F4(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithCopy for BitString(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_21597B9F4(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  sub_21597AD00(v6, v7);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for BitString(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BitString(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_21597AD00(v4, v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for BitString(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for BitString(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BitString()
{
  return &type metadata for BitString;
}

uint64_t sub_215987A50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21597BA38(&qword_254DEDD18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_215987A98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = sub_215987B24(a1, a2, *(_QWORD *)(v3 + 16), **(_QWORD **)(v3 + 32));
  if (!v4)
  {
    *a3 = result;
    a3[1] = v7;
    a3[2] = v8;
  }
  return result;
}

uint64_t sub_215987AD0(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_QWORD *sub_215987AE8(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_215987B0C()
{
  return sub_2159944F4();
}

uint64_t sub_215987B24(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  if (!result)
  {
    v4 = a4;
    goto LABEL_5;
  }
  if (!__OFSUB__(a2 - result, a3))
  {
    sub_215987470(&v5, (_BYTE *)(result + a3), a2 - result - a3, a4);
    v4 = v5;
LABEL_5:
    swift_bridgeObjectRetain();
    return v4;
  }
  __break(1u);
  return result;
}

_QWORD *sub_215987BAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;

  v9 = **(_QWORD **)(v3 + 16);
  v8[2] = &v9;
  result = sub_215987158((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_215987C08, (uint64_t)v8, a1, a2);
  *a3 = result;
  a3[1] = v6;
  a3[2] = v7;
  return result;
}

uint64_t sub_215987C08@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[2];

  v5 = sub_215987470(v8, a1, a2, **(_QWORD **)(v3 + 16));
  v6 = v8[1];
  *a3 = v8[0];
  a3[1] = v6;
  a3[2] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_215987C6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_21597BA38(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_215987CA8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_21597E450(a2);
    result = MEMORY[0x2199E9BE4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_215987CEC()
{
  off_254DEDD58 = &unk_24D3CC490;
}

void sub_215987D00(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_215987D30(uint64_t a1, uint64_t a2)
{
  if (BYTE6(a2) + 0x4000000000000000 < 0)
  {
    __break(1u);
    JUMPOUT(0x215987DB0);
  }
  MEMORY[0x24BDAC7A8]();
  return sub_215998E9C();
}

void sub_215987DC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_215998D1C();
  MEMORY[0x24BDAC7A8]();
  __asm { BR              X10 }
}

uint64_t sub_215987E4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  unsigned __int8 v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  BOOL v12;

  sub_21597B9F4(v4, v3);
  sub_215998D28();
  v6 = 0;
  while (1)
  {
    v7 = sub_215998D10();
    if ((v7 & 0x100) != 0)
      break;
    v8 = v7;
    if (qword_254DEDCA8 != -1)
      swift_once();
    v9 = v8 >> 4;
    v10 = *((_QWORD *)off_254DEDD58 + 2);
    if (v10 <= v9)
    {
      __break(1u);
LABEL_12:
      __break(1u);
LABEL_13:
      __break(1u);
      JUMPOUT(0x215987F40);
    }
    v11 = (char *)off_254DEDD58 + 32;
    *(_BYTE *)(v1 + v6) = *((_BYTE *)off_254DEDD58 + v9 + 32);
    if (v10 <= (v8 & 0xFu))
      goto LABEL_12;
    *(_BYTE *)(v1 + v6 + 1) = v11[v8 & 0xF];
    v12 = __OFADD__(v6, 2);
    v6 += 2;
    if (v12)
      goto LABEL_13;
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v2);
  return v6;
}

void sub_215987F50(uint64_t a1, uint64_t a2)
{
  sub_215998D1C();
  MEMORY[0x24BDAC7A8]();
  __asm { BR              X10 }
}

char *sub_215987FCC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;

  sub_21597B9F4(v3, v2);
  sub_21597B9F4(v3, v2);
  sub_215998D28();
  sub_21597AD00(v3, v2);
  sub_2159889B8();
  sub_21599907C();
  if ((*(_BYTE *)(v5 - 65) & 1) != 0)
  {
    v6 = (char *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      v8 = *(unsigned __int8 *)(v5 - 66);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v6 = sub_21598835C(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
      v10 = *((_QWORD *)v6 + 2);
      v9 = *((_QWORD *)v6 + 3);
      v11 = v9 >> 1;
      v12 = v10 + 1;
      if (v9 >> 1 <= v10)
      {
        v6 = sub_21598835C((char *)(v9 > 1), v10 + 1, 1, v6);
        v9 = *((_QWORD *)v6 + 3);
        v11 = v9 >> 1;
      }
      *((_QWORD *)v6 + 2) = v12;
      v6[v10 + 32] = v8 >> 4;
      v13 = v10 + 2;
      if (v11 < v13)
        v6 = sub_21598835C((char *)(v9 > 1), v13, 1, v6);
      *((_QWORD *)v6 + 2) = v13;
      v6[v12 + 32] = v8 & 0xF;
      sub_21599907C();
    }
    while (*(_BYTE *)(v5 - 65) != 1);
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v0);
  return v6;
}

uint64_t sub_215988148(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 < 2)
  {
    v7 = 0;
    v8 = 0xC000000000000000;
    if (!v2)
      goto LABEL_12;
LABEL_10:
    if (v2 != 1)
LABEL_11:
      __asm { BR              X13 }
    goto LABEL_12;
  }
  if (v2 <= 0x1D)
  {
    v8 = 0;
    goto LABEL_11;
  }
  sub_215998BB4();
  swift_allocObject();
  v3 = sub_215998BA8();
  if (v2 > 0xFFFFFFFD)
  {
    sub_215998C68();
    v4 = swift_allocObject();
    v5 = v3 | 0x8000000000000000;
    *(_QWORD *)(v4 + 16) = 0;
    *(_QWORD *)(v4 + 24) = 0;
  }
  else
  {
    v4 = 0;
    v5 = v3 | 0x4000000000000000;
  }
  v2 = *(_QWORD *)(a1 + 16);
  v7 = v4;
  v8 = v5;
  if (v2)
    goto LABEL_10;
LABEL_12:
  swift_bridgeObjectRelease();
  return v7;
}

char *sub_21598835C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_21597BA38(&qword_254DEDBC0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_215988444(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_215988450(a1, a2, a3, a4, &qword_254DEDD70);
}

char *sub_215988450(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    sub_21597BA38(a5);
    v11 = (char *)swift_allocObject();
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9])
      memmove(v14, v15, 8 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_215988544(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_21597BA38(&qword_254DEDD78);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_215988644(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result < 15)
    {
      return 0;
    }
    else
    {
      sub_215998BB4();
      swift_allocObject();
      sub_215998BA8();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_215998C68();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = 0;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_2159886D8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v13;
  unint64_t v14;

  if (sub_215998EB4() < 1 || (sub_215998EB4() & 1) != 0)
    goto LABEL_11;
  swift_bridgeObjectRetain();
  v0 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    sub_215998EE4();
    if (!v1)
      break;
    v2 = sub_215998DDC();
    v4 = v3;
    swift_bridgeObjectRelease();
    if ((v4 & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v0 = sub_215988450(0, *((_QWORD *)v0 + 2) + 1, 1, v0, &qword_254DEDD80);
      v6 = *((_QWORD *)v0 + 2);
      v5 = *((_QWORD *)v0 + 3);
      if (v6 >= v5 >> 1)
        v0 = sub_215988450((char *)(v5 > 1), v6 + 1, 1, v0, &qword_254DEDD80);
      *((_QWORD *)v0 + 2) = v6 + 1;
      *(_QWORD *)&v0[8 * v6 + 32] = v2;
    }
  }
  swift_bridgeObjectRelease();
  v9 = *((_QWORD *)v0 + 2);
  v10 = sub_215998EB4();
  swift_bridgeObjectRelease();
  if (v9 != v10)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v11 = sub_215988644(v9 >> 1);
    if (v9)
    {
      v13 = *((_QWORD *)v0 + 2);
      if (v13)
      {
        if (v13 > 1)
        {
          v14 = *((_QWORD *)v0 + 5) | (16 * *((_QWORD *)v0 + 4));
          if ((v14 & 0x8000000000000000) == 0)
          {
            if (v14 <= 0xFF)
              __asm { BR              X11 }
LABEL_25:
            __break(1u);
          }
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_24;
    }
    v7 = v11;
    swift_bridgeObjectRelease();
  }
  return v7;
}

void sub_2159889A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_215987DC8(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

unint64_t sub_2159889B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DEDD40;
  if (!qword_254DEDD40)
  {
    v1 = sub_215998D1C();
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BDCDD80], v1);
    atomic_store(result, (unint64_t *)&qword_254DEDD40);
  }
  return result;
}

unint64_t sub_215988A00()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DEDD68;
  if (!qword_254DEDD68)
  {
    v1 = sub_21597E450(&qword_254DEDD60);
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BDD06A0], v1);
    atomic_store(result, (unint64_t *)&qword_254DEDD68);
  }
  return result;
}

void sub_215988A4C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X12 }
}

uint64_t sub_215988A94(unsigned __int8 a1, uint64_t a2)
{
  unsigned __int8 v2;

  if ((a2 & 0xFF000000000000) != 0)
    v2 = a1;
  else
    v2 = 0;
  return v2 | (((a2 & 0xFF000000000000) == 0) << 8);
}

uint64_t sub_215988B94(uint64_t a1, unint64_t a2)
{
  unsigned int v4;
  unsigned int v5;

  sub_21597B9F4(a1, a2);
  sub_215988A4C(a1, a2);
  v5 = v4;
  sub_21597AD00(a1, a2);
  if ((v5 & 0x100) != 0)
    return 0;
  else
    return v5;
}

void sub_215988BE4(char a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;

  sub_21597B9F4(a2, a3);
  sub_215985F54(a2, a3);
  v7 = v6 >> 62;
  if ((a1 & 1) == 0)
    __asm { BR              X10 }
  __asm { BR              X10 }
}

void sub_215988CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int16 a11, char a12, char a13, char a14, char a15)
{
  uint64_t v15;
  uint64_t v16;

  a10 = v16;
  a11 = v15;
  a12 = BYTE2(v15);
  a13 = BYTE3(v15);
  a14 = BYTE4(v15);
  a15 = BYTE5(v15);
  sub_215988F04((unsigned __int16 *)&a10);
  JUMPOUT(0x215988E7CLL);
}

uint64_t sub_215988EFC(unsigned __int16 *a1)
{
  return *a1;
}

uint64_t sub_215988F04(unsigned __int16 *a1)
{
  return bswap32(*a1) >> 16;
}

void sub_215988F14(char a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;

  sub_21597B9F4(a2, a3);
  sub_215985F54(a2, a3);
  v7 = v6 >> 62;
  if ((a1 & 1) == 0)
    __asm { BR              X10 }
  __asm { BR              X10 }
}

void sub_215989010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned int a10, char a11, char a12, char a13, char a14, __int16 a15, char a16, char a17, char a18, char a19)
{
  uint64_t v19;
  uint64_t v20;

  LOWORD(a10) = v20;
  BYTE2(a10) = BYTE2(v20);
  HIBYTE(a10) = BYTE3(v20);
  a11 = BYTE4(v20);
  a12 = BYTE5(v20);
  a13 = BYTE6(v20);
  a14 = HIBYTE(v20);
  a15 = v19;
  a16 = BYTE2(v19);
  a17 = BYTE3(v19);
  a18 = BYTE4(v19);
  a19 = BYTE5(v19);
  sub_215989260(&a10);
  JUMPOUT(0x2159891D8);
}

uint64_t sub_215989258(unsigned int *a1)
{
  return *a1;
}

uint64_t sub_215989260(unsigned int *a1)
{
  return bswap32(*a1);
}

void sub_21598926C(char a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;

  sub_21597B9F4(a2, a3);
  sub_215985F54(a2, a3);
  v7 = v6 >> 62;
  if ((a1 & 1) == 0)
    __asm { BR              X10 }
  __asm { BR              X10 }
}

void sub_215989368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, __int16 a11, char a12, char a13, char a14, char a15)
{
  uint64_t v15;
  unint64_t v16;

  a10 = v16;
  a11 = v15;
  a12 = BYTE2(v15);
  a13 = BYTE3(v15);
  a14 = BYTE4(v15);
  a15 = BYTE5(v15);
  sub_2159895B8(&a10);
  JUMPOUT(0x215989530);
}

uint64_t sub_2159895B0(uint64_t a1)
{
  return *(_QWORD *)a1;
}

unint64_t sub_2159895B8(unint64_t *a1)
{
  return bswap64(*a1);
}

BOOL sub_2159895C4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2159895D4()
{
  return sub_2159992B0();
}

uint64_t sub_2159895F8()
{
  sub_2159992A4();
  sub_2159992B0();
  return sub_2159992C8();
}

BOOL sub_21598963C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_215989654()
{
  sub_2159992A4();
  sub_2159992B0();
  return sub_2159992C8();
}

uint64_t sub_215989698()
{
  return sub_2159992B0();
}

uint64_t sub_2159896C0()
{
  sub_2159992A4();
  sub_2159992B0();
  return sub_2159992C8();
}

uint64_t sub_215989700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000) == 0)
    __asm { BR              X10 }
  return 0;
}

uint64_t sub_2159897AC(uint64_t result)
{
  if ((result & 0x8000000000000000) == 0)
    __asm { BR              X12 }
  return result;
}

void sub_215989978(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2159899E0()
{
  return sub_215998C80();
}

unint64_t sub_215989B78()
{
  unint64_t result;

  result = qword_254DEDD88;
  if (!qword_254DEDD88)
  {
    result = MEMORY[0x2199E9BE4](&unk_21599C278, &_s10EndiannessON);
    atomic_store(result, (unint64_t *)&qword_254DEDD88);
  }
  return result;
}

_BYTE *_s10EndiannessOwCP(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s10EndiannessOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s10EndiannessOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_215989CA8 + 4 * byte_21599C271[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_215989CDC + 4 * byte_21599C26C[v4]))();
}

uint64_t sub_215989CDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_215989CE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x215989CECLL);
  return result;
}

uint64_t sub_215989CF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x215989D00);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_215989D04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_215989D0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_215989D18(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_215989D20(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *_s10EndiannessOMa()
{
  return &_s10EndiannessON;
}

uint64_t sub_215989D3C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_215998B78();
  if (!result || (result = sub_215998B9C(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_215998B90();
      return sub_215998C80();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_215989DE0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

_QWORD *sub_215989DE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;

  type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

uint64_t type metadata accessor for TLV()
{
  return objc_opt_self();
}

_QWORD *sub_215989E4C(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = 0x2000000000000000;
  return result;
}

void sub_215989E88(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  id v11;
  char v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  _QWORD *v19;

  v5 = objc_allocWithZone(MEMORY[0x24BDBCE90]);
  v6 = (void *)sub_215998CBC();
  v7 = objc_msgSend(v5, sel_initWithData_, v6);

  objc_msgSend(v7, sel_open);
  v8 = sub_21598A03C();
  if (v2)
    goto LABEL_6;
  if ((v9 & 1) != 0
    || (v10 = v8, v11 = sub_21598A1AC(), (v12 & 1) != 0)
    || (v13 = sub_2159905FC((uint64_t)v11), v15 = v14, v14 >> 60 == 15))
  {
    sub_21598A168();
    swift_allocError();
    *v16 = 0;
    swift_willThrow();
LABEL_6:
    sub_21597AD00(a1, a2);
LABEL_7:

    return;
  }
  v17 = (uint64_t)v13;
  if ((sub_21598A324() & 0x100) == 0)
  {
    sub_21598A168();
    swift_allocError();
    *v18 = 1;
    swift_willThrow();
    sub_21597AD00(a1, a2);
    sub_21597ACEC(v17, v15);
    goto LABEL_7;
  }
  objc_msgSend(v7, sel_close);
  sub_21597AD00(a1, a2);

  type metadata accessor for TLV();
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v10;
  v19[3] = v17;
  v19[4] = v15;
}

uint64_t sub_21598A03C()
{
  void *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  id v4;
  _BYTE *v5;
  unsigned __int8 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = sub_21598A324();
  if (!v1)
  {
    if ((result & 0x100) != 0)
      return 0;
    v3 = result;
    if ((~(_DWORD)result & 0x1F) != 0)
    {
      return result;
    }
    else
    {
      while (1)
      {
        v6 = 0;
        v4 = objc_msgSend(v0, sel_read_maxLength_, &v6, 1);
        if (v4 != (id)1)
          break;
        result = v6 | (unint64_t)(v3 << 8);
        v3 = result;
        if (((char)v6 & 0x80000000) == 0)
          return result;
      }
      if (v4 != (id)-1)
      {
        sub_21598A168();
        swift_allocError();
        *v5 = 0;
        return swift_willThrow();
      }
      result = (uint64_t)objc_msgSend(v0, sel_streamError);
      if (result)
        return swift_willThrow();
      __break(1u);
    }
  }
  return result;
}

unint64_t sub_21598A168()
{
  unint64_t result;

  result = qword_254DEDD90;
  if (!qword_254DEDD90)
  {
    result = MEMORY[0x2199E9BE4](&unk_21599C450, &type metadata for TLVError);
    atomic_store(result, (unint64_t *)&qword_254DEDD90);
  }
  return result;
}

id sub_21598A1AC()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  __int16 v3;
  unsigned int v4;
  id result;
  _BYTE *v6;
  unsigned int v7;
  id v8;
  _BYTE *v9;
  unsigned __int8 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = sub_21598A324();
  if (v1)
    return (id)v2;
  if ((v3 & 0x100) != 0)
    return 0;
  v4 = v3;
  if ((v3 & 0x80) == 0)
    return (id)v3;
  if (v3 == 128)
  {
    sub_21598A168();
    swift_allocError();
    *v6 = 2;
LABEL_18:
    swift_willThrow();
    return (id)v2;
  }
  v2 = 0;
  v7 = 128;
  while (1)
  {
    if (v7 >= v4)
      __break(1u);
    v10 = 0;
    v8 = objc_msgSend(v0, sel_read_maxLength_, &v10, 1);
    if (v8 != (id)1)
      break;
    ++v7;
    v2 = v10 | (v2 << 8);
    if (v7 == v4)
      return (id)v2;
  }
  if (v8 != (id)-1)
  {
    sub_21598A168();
    swift_allocError();
    *v9 = 0;
    goto LABEL_18;
  }
  result = objc_msgSend(v0, sel_streamError);
  if (result)
    goto LABEL_18;
  __break(1u);
  return result;
}

uint64_t sub_21598A324()
{
  void *v0;
  id v1;
  uint64_t result;
  unsigned __int8 v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v1 = objc_msgSend(v0, sel_read_maxLength_, &v3, 1);
  if (v1 == (id)1)
    return v3;
  if (v1 != (id)-1)
    return 256;
  result = (uint64_t)objc_msgSend(v0, sel_streamError);
  if (result)
    return swift_willThrow();
  __break(1u);
  return result;
}

uint64_t sub_21598A3F0()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  if ((v2 & 0x2000000000000000) == 0)
    __asm { BR              X10 }
  if (v1 >> 62)
  {
LABEL_31:
    sub_21598A6C8(v1, v2);
    swift_bridgeObjectRetain();
    v3 = sub_215999190();
    if (v3)
      goto LABEL_5;
LABEL_32:
    sub_21598A6D4(v1, v2);
    sub_21598A6D4(v1, v2);
    return 0;
  }
  v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_21598A6C8(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  swift_bridgeObjectRetain();
  if (!v3)
    goto LABEL_32;
LABEL_5:
  if (v3 < 1)
  {
    __break(1u);
    JUMPOUT(0x21598A650);
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
    v4 = 0;
    v5 = 0;
    while (1)
    {
      v6 = MEMORY[0x2199E9320](v4, v1);
      v7 = sub_21598A3F0(v6);
      v8 = *(_QWORD *)(v6 + 16);
      swift_unknownObjectRelease();
      if (v8)
      {
        v9 = 8 - (__clz(v8) >> 3);
        if (v7 <= 127)
        {
          v10 = 1;
          goto LABEL_13;
        }
      }
      else
      {
        v10 = 1;
        v9 = 1;
        if (v7 < 128)
          goto LABEL_13;
      }
      v10 = 9 - (__clz(v7) >> 3);
LABEL_13:
      v11 = v9 + v10;
      v12 = __OFADD__(v11, v7);
      v13 = v11 + v7;
      if (v12)
      {
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      v12 = __OFADD__(v5, v13);
      v5 += v13;
      if (v12)
        goto LABEL_28;
      if (v3 == ++v4)
        goto LABEL_26;
    }
  }
  v5 = 0;
  v14 = (uint64_t *)(v1 + 32);
  do
  {
    v15 = *v14;
    v16 = swift_retain();
    v17 = sub_21598A3F0(v16);
    v18 = *(_QWORD *)(v15 + 16);
    swift_release();
    if (v18)
    {
      v19 = 8 - (__clz(v18) >> 3);
      if (v17 <= 127)
      {
        v20 = 1;
        goto LABEL_23;
      }
    }
    else
    {
      v20 = 1;
      v19 = 1;
      if (v17 < 128)
        goto LABEL_23;
    }
    v20 = 9 - (__clz(v17) >> 3);
LABEL_23:
    v21 = v19 + v20;
    v12 = __OFADD__(v21, v17);
    v22 = v21 + v17;
    if (v12)
      goto LABEL_29;
    v12 = __OFADD__(v5, v22);
    v5 += v22;
    if (v12)
    {
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    ++v14;
    --v3;
  }
  while (v3);
LABEL_26:
  sub_21598A6D4(v1, v2);
  sub_21598A6D4(v1, v2);
  return v5;
}

unint64_t sub_21598A664()
{
  uint64_t v0;
  int64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t result;

  v1 = sub_21598A3F0();
  v2 = *(_QWORD *)(v0 + 16);
  if (v2)
  {
    v3 = 8 - (__clz(v2) >> 3);
    if (v1 < 128)
    {
      v4 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    v3 = 1;
    v4 = 1;
    if (v1 < 128)
      goto LABEL_6;
  }
  v4 = 9 - (__clz(v1) >> 3);
LABEL_6:
  v5 = v3 + v4;
  v6 = __OFADD__(v5, v1);
  result = v5 + v1;
  if (v6)
    __break(1u);
  return result;
}

uint64_t sub_21598A6C8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0)
    return swift_bridgeObjectRetain();
  else
    return sub_21597B9F4(a1, a2);
}

uint64_t sub_21598A6D4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0)
    return swift_bridgeObjectRelease();
  else
    return sub_21597AD00(a1, a2);
}

uint64_t sub_21598A6E0()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  __int128 v13;
  __int128 v14;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  if ((v2 & 0x2000000000000000) == 0)
  {
    sub_21597B9F4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    return v1;
  }
  v3 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v4 = objc_msgSend(v3, sel_outputStreamToMemory);
  objc_msgSend(v4, sel_open);
  if (v1 >> 62)
    goto LABEL_16;
  v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
LABEL_5:
    v6 = 4;
    do
    {
      v7 = v6 - 4;
      if ((v1 & 0xC000000000000001) != 0)
      {
        v8 = (unint64_t *)MEMORY[0x2199E9320](v6 - 4, v1);
        v9 = __OFADD__(v7, 1);
        v10 = v6 - 3;
        if (v9)
          goto LABEL_15;
      }
      else
      {
        v8 = *(unint64_t **)(v1 + 8 * v6);
        swift_retain();
        v9 = __OFADD__(v7, 1);
        v10 = v6 - 3;
        if (v9)
        {
LABEL_15:
          __break(1u);
LABEL_16:
          swift_bridgeObjectRetain();
          v5 = sub_215999190();
          sub_21598A6D4(v1, v2);
          if (!v5)
            break;
          goto LABEL_5;
        }
      }
      sub_21598A8E0(v8);
      swift_release();
      ++v6;
    }
    while (v10 != v5);
  }
  sub_21598A6D4(v1, v2);
  objc_msgSend(v4, sel_close);
  if (objc_msgSend(v4, sel_propertyForKey_, *MEMORY[0x24BDBCB88]))
  {
    sub_2159990F4();

    swift_unknownObjectRelease();
    sub_21597AD44(&v13, &v14);
    swift_dynamicCast();
    return v12;
  }
  __break(1u);
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_21598A8E0(unint64_t *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  result = sub_21598E5DC(a1[2]);
  if (!v1)
  {
    v4 = sub_21598A3F0();
    sub_21598E988(v4);
    v6 = a1[3];
    v5 = a1[4];
    if ((v5 & 0x2000000000000000) == 0)
    {
      sub_21597B9F4(v6, v5);
      sub_21598EE14(v6, v5);
      goto LABEL_16;
    }
    if (v6 >> 62)
      goto LABEL_15;
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v7; v7 = sub_215999190())
    {
      v13 = v5;
      for (i = 4; ; ++i)
      {
        v9 = i - 4;
        if ((v6 & 0xC000000000000001) == 0)
          break;
        v10 = MEMORY[0x2199E9320](i - 4, v6);
        v5 = i - 3;
        if (__OFADD__(v9, 1))
          goto LABEL_14;
LABEL_12:
        sub_21598A8E0(v10);
        swift_release();
        if (v5 == v7)
        {
          v11 = v6;
          v12 = v13;
          return sub_21598A6D4(v11, v12);
        }
      }
      v10 = *(_QWORD *)(v6 + 8 * i);
      swift_retain();
      v5 = i - 3;
      if (!__OFADD__(v9, 1))
        goto LABEL_12;
LABEL_14:
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
    }
LABEL_16:
    v11 = v6;
    v12 = v5;
    return sub_21598A6D4(v11, v12);
  }
  return result;
}

uint64_t sub_21598AA60(unint64_t *a1)
{
  uint64_t v1;
  uint64_t result;
  int64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  result = sub_21598E7B4(a1[2]);
  if (!v1)
  {
    v4 = sub_21598A3F0();
    sub_21598EA44(v4);
    v6 = a1[3];
    v5 = a1[4];
    if ((v5 & 0x2000000000000000) == 0)
    {
      swift_beginAccess();
      sub_21597B9F4(v6, v5);
      sub_215986890(v6, v5);
      swift_endAccess();
      goto LABEL_16;
    }
    if (v6 >> 62)
      goto LABEL_15;
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v7; v7 = sub_215999190())
    {
      v13 = v5;
      for (i = 4; ; ++i)
      {
        v9 = i - 4;
        if ((v6 & 0xC000000000000001) == 0)
          break;
        v10 = MEMORY[0x2199E9320](i - 4, v6);
        v5 = i - 3;
        if (__OFADD__(v9, 1))
          goto LABEL_14;
LABEL_12:
        sub_21598AA60(v10);
        swift_release();
        if (v5 == v7)
        {
          v11 = v6;
          v12 = v13;
          return sub_21598A6D4(v11, v12);
        }
      }
      v10 = *(_QWORD *)(v6 + 8 * i);
      swift_retain();
      v5 = i - 3;
      if (!__OFADD__(v9, 1))
        goto LABEL_12;
LABEL_14:
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
    }
LABEL_16:
    v11 = v6;
    v12 = v5;
    return sub_21598A6D4(v11, v12);
  }
  return result;
}

void sub_21598ABFC()
{
  sub_21598A6E0();
  __asm { BR              X11 }
}

uint64_t sub_21598AC3C(__n128 a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (BYTE6(v2) + 0x4000000000000000 < 0)
  {
    __break(1u);
    JUMPOUT(0x21598ACD8);
  }
  MEMORY[0x24BDAC7A8](a1, a2);
  v4 = sub_215998E9C();
  sub_21597AD00(v3, v2);
  return v4;
}

id sub_21598ACF0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  id v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_21598A6C8(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    v3 = sub_21598FD84(v1, v2);
    sub_21598A6D4(v1, v2);
    v4 = *(_QWORD *)(v0 + 24);
    v5 = *(_QWORD *)(v0 + 32);
    *(_QWORD *)(v0 + 24) = v3;
    *(_QWORD *)(v0 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_21598A6D4(v4, v5);
    return v3;
  }
  return (id)v1;
}

id sub_21598ADA0(uint64_t a1, unint64_t a2)
{
  return sub_21598FD84(a1, a2);
}

uint64_t sub_21598ADB4()
{
  unint64_t *v0;
  unint64_t *v1;
  int64_t v2;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = v0;
  v2 = sub_21598A664();
  type metadata accessor for DERMemoryWriter();
  inited = swift_initStackObject();
  if (v2)
  {
    if (v2 <= 14)
    {
      v5 = 0;
      v6 = 0;
    }
    else
    {
      sub_215998BB4();
      swift_allocObject();
      v4 = sub_215998BA8();
      if ((unint64_t)v2 > 0x7FFFFFFE)
      {
        sub_215998C68();
        v5 = swift_allocObject();
        v6 = v4 | 0x8000000000000000;
        *(_QWORD *)(v5 + 16) = 0;
        *(_QWORD *)(v5 + 24) = 0;
      }
      else
      {
        v5 = 0;
        v6 = v4 | 0x4000000000000000;
      }
    }
  }
  else
  {
    v5 = 0;
    v6 = 0xC000000000000000;
  }
  *(_QWORD *)(inited + 16) = v5;
  *(_QWORD *)(inited + 24) = v6;
  sub_21598AA60(v1);
  swift_beginAccess();
  return *(_QWORD *)(inited + 16);
}

id sub_21598AED0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  id v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_21598A6C8(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    v3 = sub_21598FD84(v1, v2);
    sub_21598A6D4(v1, v2);
    v4 = *(_QWORD *)(v0 + 24);
    v5 = *(_QWORD *)(v0 + 32);
    *(_QWORD *)(v0 + 24) = v3;
    *(_QWORD *)(v0 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_21598A6D4(v4, v5);
    return v3;
  }
  return (id)v1;
}

uint64_t sub_21598AF84(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  unint64_t v8;

  sub_2159992B0();
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  if ((v4 & 0x2000000000000000) == 0)
  {
    sub_21597B9F4(v3, v4);
    sub_215998CE0();
    return sub_21598A6D4(v3, v4);
  }
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_215999190();
    v5 = result;
    if (!result)
      return sub_21598A6D4(v3, v4);
  }
  else
  {
    v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v5)
      return sub_21598A6D4(v3, v4);
  }
  if (v5 >= 1)
  {
    if ((v3 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v5; ++i)
      {
        MEMORY[0x2199E9320](i, v3);
        sub_21598AF84(a1);
        swift_unknownObjectRelease();
      }
    }
    else
    {
      v8 = v3 + 32;
      do
      {
        v8 += 8;
        swift_retain();
        sub_21598AF84(a1);
        swift_release();
        --v5;
      }
      while (v5);
    }
    return sub_21598A6D4(v3, v4);
  }
  __break(1u);
  return result;
}

uint64_t sub_21598B0A0()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
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
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  if ((v3 & 0x2000000000000000) == 0)
  {
    sub_21597B9F4(v2, v3);
    sub_21599910C();
    swift_bridgeObjectRelease();
    v4 = v0[2];
    sub_21597BA38(&qword_254DEDDA0);
    v5 = swift_allocObject();
    v6 = MEMORY[0x24BEE1E88];
    *(_OWORD *)(v5 + 16) = xmmword_21599BEA0;
    v7 = MEMORY[0x24BEE1ED8];
    *(_QWORD *)(v5 + 56) = v6;
    *(_QWORD *)(v5 + 64) = v7;
    *(_QWORD *)(v5 + 32) = v4;
    sub_215998E54();
    sub_215998ED8();
    swift_bridgeObjectRelease();
    sub_215998ED8();
    __asm { BR              X10 }
  }
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_215999190();
    if (v8)
      goto LABEL_5;
LABEL_15:
    sub_21598A6D4(v2, v3);
    goto LABEL_16;
  }
  v8 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v8)
    goto LABEL_15;
LABEL_5:
  v22 = MEMORY[0x24BEE4AF8];
  sub_21598F9D8(0, v8 & ~(v8 >> 63), 0);
  if (v8 < 0)
  {
    __break(1u);
    JUMPOUT(0x21598B54CLL);
  }
  v9 = 0;
  do
  {
    if ((v2 & 0xC000000000000001) != 0)
      v10 = MEMORY[0x2199E9320](v9, v2);
    else
      v10 = swift_retain();
    v11 = sub_21598B0A0(v10);
    v13 = v12;
    swift_release();
    v15 = *(_QWORD *)(v22 + 16);
    v14 = *(_QWORD *)(v22 + 24);
    if (v15 >= v14 >> 1)
      sub_21598F9D8((char *)(v14 > 1), v15 + 1, 1);
    ++v9;
    *(_QWORD *)(v22 + 16) = v15 + 1;
    v16 = v22 + 16 * v15;
    *(_QWORD *)(v16 + 32) = v11;
    *(_QWORD *)(v16 + 40) = v13;
  }
  while (v8 != v9);
  sub_21598A6D4(v2, v3);
  v1 = v0;
LABEL_16:
  sub_21597BA38(&qword_254DEDB50);
  sub_215990048();
  sub_215998DE8();
  swift_bridgeObjectRelease();
  sub_21599910C();
  swift_bridgeObjectRelease();
  v17 = v1[2];
  sub_21597BA38(&qword_254DEDDA0);
  v18 = swift_allocObject();
  v19 = MEMORY[0x24BEE1E88];
  *(_OWORD *)(v18 + 16) = xmmword_21599BEA0;
  v20 = MEMORY[0x24BEE1ED8];
  *(_QWORD *)(v18 + 56) = v19;
  *(_QWORD *)(v18 + 64) = v20;
  *(_QWORD *)(v18 + 32) = v17;
  sub_215998E54();
  sub_215998ED8();
  swift_bridgeObjectRelease();
  sub_215998ED8();
  sub_215998ED8();
  swift_bridgeObjectRelease();
  sub_215998ED8();
  return 0x203A676174207BLL;
}

uint64_t sub_21598B57C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  char v9;

  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v2 = sub_21598A6E0();
  v4 = v3;
  v5 = sub_21598A6E0();
  v7 = v6;
  sub_21598FC3C(v2, v4);
  v9 = v8;
  sub_21597AD00(v5, v7);
  sub_21597AD00(v2, v4);
  return v9 & 1;
}

uint64_t sub_21598B614(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  if ((v4 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    if (v3 >> 62)
      goto LABEL_17;
  }
  else
  {
    sub_21598A6C8(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
    v5 = (unint64_t)sub_21598FD84(v3, v4);
    sub_21598A6D4(v3, v4);
    v11 = *(_QWORD *)(v1 + 24);
    v12 = *(_QWORD *)(v1 + 32);
    *(_QWORD *)(v1 + 24) = v5;
    *(_QWORD *)(v1 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_21598A6D4(v11, v12);
    v3 = v5;
    if (v5 >> 62)
    {
LABEL_17:
      swift_bridgeObjectRetain();
      v6 = sub_215999190();
      if (!v6)
        goto LABEL_23;
      goto LABEL_5;
    }
  }
  v6 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
  {
LABEL_23:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_5:
  v7 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_28;
  v8 = *(_QWORD *)(v3 + 32);
  swift_retain();
  while (*(_QWORD *)(v8 + 16) != a1)
  {
    swift_release();
    if (v6 == 1)
      goto LABEL_23;
    if (v7)
    {
      v7 = 1;
      while (1)
      {
        v9 = MEMORY[0x2199E9320](v7, v3);
        v10 = v7 + 1;
        if (__OFADD__(v7, 1))
          break;
        v8 = v9;
        if (*(_QWORD *)(v9 + 16) == a1)
          goto LABEL_8;
        swift_unknownObjectRelease();
        ++v7;
        if (v10 == v6)
          goto LABEL_23;
      }
      __break(1u);
    }
    else
    {
      v13 = 5;
      while (1)
      {
        v14 = v13 - 3;
        if (__OFADD__(v13 - 4, 1))
          break;
        v8 = *(_QWORD *)(v3 + 8 * v13);
        if (*(_QWORD *)(v8 + 16) == a1)
        {
          swift_retain();
          goto LABEL_8;
        }
        ++v13;
        if (v14 == v6)
          goto LABEL_23;
      }
    }
    __break(1u);
LABEL_28:
    v8 = MEMORY[0x2199E9320](0, v3);
  }
LABEL_8:
  swift_bridgeObjectRelease_n();
  return v8;
}

uint64_t sub_21598B800(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t i;
  uint64_t j;
  uint64_t v12;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  if ((v4 & 0x2000000000000000) != 0)
  {
    result = swift_bridgeObjectRetain();
  }
  else
  {
    sub_21598A6C8(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
    v5 = sub_21598FD84(v3, v4);
    sub_21598A6D4(v3, v4);
    v6 = *(_QWORD *)(v1 + 24);
    v7 = *(_QWORD *)(v1 + 32);
    *(_QWORD *)(v1 + 24) = v5;
    *(_QWORD *)(v1 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    result = sub_21598A6D4(v6, v7);
    v3 = (unint64_t)v5;
  }
  v12 = MEMORY[0x24BEE4AF8];
  if (!(v3 >> 62))
  {
    v9 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v9)
      goto LABEL_6;
LABEL_18:
    swift_bridgeObjectRelease();
    return v12;
  }
  swift_bridgeObjectRetain();
  v9 = sub_215999190();
  result = swift_bridgeObjectRelease();
  if (!v9)
    goto LABEL_18;
LABEL_6:
  if (v9 >= 1)
  {
    if ((v3 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)(MEMORY[0x2199E9320](i, v3) + 16) == a1)
        {
          sub_21599913C();
          sub_215999154();
          sub_215999160();
          sub_215999148();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)(*(_QWORD *)(v3 + 8 * j + 32) + 16) == a1)
        {
          swift_retain();
          sub_21599913C();
          sub_215999154();
          sub_215999160();
          sub_215999148();
        }
      }
    }
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

_QWORD *sub_21598B9FC(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;

  sub_21597BA38(&qword_254DEDBC0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21599BEA0;
  *(_BYTE *)(v4 + 32) = a2;
  v5 = sub_2159877F0(v4);
  v7 = v6;
  swift_bridgeObjectRelease();
  type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = v5;
  result[4] = v7;
  return result;
}

_QWORD *sub_21598BA7C(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  __int16 v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = bswap32(a2) >> 16;
  v3 = sub_2159861FC((uint64_t)&v7, (uint64_t)&v8);
  v5 = v4;
  type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

_QWORD *sub_21598BB10(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = bswap32(a2);
  v3 = sub_2159861FC((uint64_t)&v7, (uint64_t)&v8);
  v5 = v4;
  type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

_QWORD *sub_21598BBA0(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = bswap64(a2);
  v3 = sub_2159861FC((uint64_t)&v7, (uint64_t)&v8);
  v5 = v4;
  type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

uint64_t sub_21598BC30()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  __int16 v3;
  __int16 v4;

  v0 = sub_21598A6E0();
  v2 = v1;
  sub_215988A4C(v0, v1);
  v4 = v3;
  sub_21597AD00(v0, v2);
  return v4 & 0x1FF;
}

void sub_21598BC7C()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  if ((v2 & 0x2000000000000000) == 0)
  {
    sub_21597B9F4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    goto LABEL_14;
  }
  v3 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v4 = objc_msgSend(v3, sel_outputStreamToMemory);
  objc_msgSend(v4, sel_open);
  if (v1 >> 62)
    goto LABEL_16;
  v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
  {
LABEL_12:
    sub_21598A6D4(v1, v2);
    objc_msgSend(v4, sel_close);
    if (!objc_msgSend(v4, sel_propertyForKey_, *MEMORY[0x24BDBCB88]))
    {
      __break(1u);
      swift_unexpectedError();
      __break(1u);
      JUMPOUT(0x21598BF44);
    }
    sub_2159990F4();

    swift_unknownObjectRelease();
    sub_21597AD44(&v12, &v13);
    swift_dynamicCast();
    v2 = v11;
LABEL_14:
    __asm { BR              X10 }
  }
LABEL_5:
  v6 = 4;
  while (1)
  {
    v7 = v6 - 4;
    if ((v1 & 0xC000000000000001) != 0)
    {
      v8 = (unint64_t *)MEMORY[0x2199E9320](v6 - 4, v1);
      v9 = __OFADD__(v7, 1);
      v10 = v6 - 3;
      if (v9)
        goto LABEL_15;
    }
    else
    {
      v8 = *(unint64_t **)(v1 + 8 * v6);
      swift_retain();
      v9 = __OFADD__(v7, 1);
      v10 = v6 - 3;
      if (v9)
      {
LABEL_15:
        __break(1u);
LABEL_16:
        swift_bridgeObjectRetain();
        v5 = sub_215999190();
        sub_21598A6D4(v1, v2);
        if (!v5)
          goto LABEL_12;
        goto LABEL_5;
      }
    }
    sub_21598A8E0(v8);
    swift_release();
    ++v6;
    if (v10 == v5)
      goto LABEL_12;
  }
}

void sub_21598BF54()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  if ((v2 & 0x2000000000000000) == 0)
  {
    sub_21597B9F4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    goto LABEL_14;
  }
  v3 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v4 = objc_msgSend(v3, sel_outputStreamToMemory);
  objc_msgSend(v4, sel_open);
  if (v1 >> 62)
    goto LABEL_16;
  v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
  {
LABEL_12:
    sub_21598A6D4(v1, v2);
    objc_msgSend(v4, sel_close);
    if (!objc_msgSend(v4, sel_propertyForKey_, *MEMORY[0x24BDBCB88]))
    {
      __break(1u);
      swift_unexpectedError();
      __break(1u);
      JUMPOUT(0x21598C224);
    }
    sub_2159990F4();

    swift_unknownObjectRelease();
    sub_21597AD44(&v12, &v13);
    swift_dynamicCast();
    v2 = v11;
LABEL_14:
    __asm { BR              X10 }
  }
LABEL_5:
  v6 = 4;
  while (1)
  {
    v7 = v6 - 4;
    if ((v1 & 0xC000000000000001) != 0)
    {
      v8 = (unint64_t *)MEMORY[0x2199E9320](v6 - 4, v1);
      v9 = __OFADD__(v7, 1);
      v10 = v6 - 3;
      if (v9)
        goto LABEL_15;
    }
    else
    {
      v8 = *(unint64_t **)(v1 + 8 * v6);
      swift_retain();
      v9 = __OFADD__(v7, 1);
      v10 = v6 - 3;
      if (v9)
      {
LABEL_15:
        __break(1u);
LABEL_16:
        swift_bridgeObjectRetain();
        v5 = sub_215999190();
        sub_21598A6D4(v1, v2);
        if (!v5)
          goto LABEL_12;
        goto LABEL_5;
      }
    }
    sub_21598A8E0(v8);
    swift_release();
    ++v6;
    if (v10 == v5)
      goto LABEL_12;
  }
}

void sub_21598C234()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  if ((v2 & 0x2000000000000000) == 0)
  {
    sub_21597B9F4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    goto LABEL_14;
  }
  v3 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v4 = objc_msgSend(v3, sel_outputStreamToMemory);
  objc_msgSend(v4, sel_open);
  if (v1 >> 62)
    goto LABEL_16;
  v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
  {
LABEL_12:
    sub_21598A6D4(v1, v2);
    objc_msgSend(v4, sel_close);
    if (!objc_msgSend(v4, sel_propertyForKey_, *MEMORY[0x24BDBCB88]))
    {
      __break(1u);
      swift_unexpectedError();
      __break(1u);
      JUMPOUT(0x21598C4F8);
    }
    sub_2159990F4();

    swift_unknownObjectRelease();
    sub_21597AD44(&v12, &v13);
    swift_dynamicCast();
    v2 = v11;
LABEL_14:
    __asm { BR              X10 }
  }
LABEL_5:
  v6 = 4;
  while (1)
  {
    v7 = v6 - 4;
    if ((v1 & 0xC000000000000001) != 0)
    {
      v8 = (unint64_t *)MEMORY[0x2199E9320](v6 - 4, v1);
      v9 = __OFADD__(v7, 1);
      v10 = v6 - 3;
      if (v9)
        goto LABEL_15;
    }
    else
    {
      v8 = *(unint64_t **)(v1 + 8 * v6);
      swift_retain();
      v9 = __OFADD__(v7, 1);
      v10 = v6 - 3;
      if (v9)
      {
LABEL_15:
        __break(1u);
LABEL_16:
        swift_bridgeObjectRetain();
        v5 = sub_215999190();
        sub_21598A6D4(v1, v2);
        if (!v5)
          goto LABEL_12;
        goto LABEL_5;
      }
    }
    sub_21598A8E0(v8);
    swift_release();
    ++v6;
    if (v10 == v5)
      goto LABEL_12;
  }
}

uint64_t sub_21598C508()
{
  uint64_t result;

  type metadata accessor for TLV();
  result = swift_initStaticObject();
  qword_254DEFC18 = result;
  return result;
}

uint64_t *sub_21598C530()
{
  if (qword_254DEDCB0 != -1)
    swift_once();
  return &qword_254DEFC18;
}

uint64_t sub_21598C570()
{
  type metadata accessor for TLV();
  return swift_initStaticObject();
}

_QWORD *sub_21598C58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  __n128 v7;
  __n128 v8;
  __n128 v9;
  uint64_t v10;
  __n128 v11;
  __n128 v12;
  uint64_t v13;
  __n128 v14;
  __n128 v15;
  uint64_t v16;
  __n128 v17;
  __n128 v18;
  uint64_t v19;
  __n128 v20;
  __n128 v21;
  uint64_t v22;
  char *v23;
  __n128 v24;
  __n128 v25;
  uint64_t v26;
  char *v27;
  __n128 v28;
  __n128 v29;
  uint64_t v30;
  char *v31;
  __n128 v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  char *v45;
  char *v46;
  unint64_t v47;
  char *v48;
  void (*v49)(unint64_t, uint64_t);
  int64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char v56;
  unsigned int v57;
  char *v58;
  char v59;
  unint64_t v60;
  unint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *result;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  void (*v70)(char *, uint64_t, uint64_t);
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  uint64_t AssociatedConformanceWitness;
  uint64_t v77;
  uint64_t AssociatedTypeWitness;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;

  v67 = a1;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 8) + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9.n128_f64[0] = MEMORY[0x24BDAC7A8](v7, v8);
  v74 = (char *)&v67 - v10;
  v79 = *(_QWORD *)(a3 - 8);
  v12.n128_f64[0] = MEMORY[0x24BDAC7A8](v9, v11);
  v69 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.n128_f64[0] = MEMORY[0x24BDAC7A8](v12, v14);
  v72 = (char *)&v67 - v16;
  v18.n128_f64[0] = MEMORY[0x24BDAC7A8](v15, v17);
  v73 = (char *)&v67 - v19;
  v21.n128_f64[0] = MEMORY[0x24BDAC7A8](v18, v20);
  v23 = (char *)&v67 - v22;
  v25.n128_f64[0] = MEMORY[0x24BDAC7A8](v21, v24);
  v27 = (char *)&v67 - v26;
  v29.n128_f64[0] = MEMORY[0x24BDAC7A8](v25, v28);
  v31 = (char *)&v67 - v30;
  MEMORY[0x24BDAC7A8](v29, v32);
  v75 = (char *)&v67 - v33;
  v34 = sub_2159990E8();
  v68 = a2;
  v77 = v6;
  v80 = v31;
  if ((v34 & 1) == 0)
  {
    v36 = sub_2159990E8();
    v37 = sub_2159990DC();
    if ((v36 & 1) == 0)
    {
      if (v37 < 64)
      {
        v39 = v79;
        v38 = v80;
        (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v80, a2, a3);
        sub_2159990D0();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v38, a3);
      }
      goto LABEL_12;
    }
    if (v37 <= 64)
    {
      swift_getAssociatedConformanceWitness();
      sub_21599922C();
      sub_2159991FC();
      v40 = sub_215998E00();
      v41 = a2;
      v42 = v79;
      v43 = *(void (**)(char *, uint64_t))(v79 + 8);
      v43(v31, a3);
      (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v27, v41, a3);
      if ((v40 & 1) == 0)
        sub_2159990D0();
      v43(v27, a3);
      a2 = v68;
      goto LABEL_12;
    }
    goto LABEL_6;
  }
  if (sub_2159990DC() >= 64)
  {
LABEL_6:
    v82 = 0;
    sub_215990094();
    sub_2159990AC();
    sub_215998E00();
    (*(void (**)(char *, uint64_t))(v79 + 8))(v31, a3);
    goto LABEL_12;
  }
  v35 = v79;
  (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v31, a2, a3);
  sub_2159990D0();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v31, a3);
LABEL_12:
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_21599922C();
  sub_2159991FC();
  v70 = *(void (**)(char *, uint64_t, uint64_t))(v79 + 16);
  v70(v23, a2, a3);
  v44 = (char *)MEMORY[0x24BEE4AF8];
  v71 = v23;
  v45 = v73;
  do
  {
    v81 = v44;
    v46 = v74;
    v44 = (char *)AssociatedConformanceWitness;
    sub_21599922C();
    v47 = (unint64_t)v80;
    sub_2159991FC();
    v48 = v46;
    sub_2159990B8();
    v49 = *(void (**)(unint64_t, uint64_t))(v79 + 8);
    v49(v47, a3);
    if ((sub_2159990E8() & 1) != 0)
    {
      sub_21599922C();
      sub_2159991FC();
      v50 = sub_215998E0C();
      v49(v47, a3);
      if ((v50 & 1) == 0)
      {
        __break(1u);
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
    }
    if (sub_2159990DC() >= 8)
    {
      v70(v72, (uint64_t)v45, a3);
      LOBYTE(v82) = -1;
      v52 = sub_2159990E8();
      v53 = sub_2159990DC();
      if ((v52 & 1) != 0)
      {
        v47 = (unint64_t)v80;
        if (v53 > 8)
        {
          sub_2159900D8();
          goto LABEL_21;
        }
        sub_21599922C();
        sub_2159991FC();
        v55 = v72;
        v56 = sub_215998DF4();
        v49(v47, a3);
        v57 = v82;
        v48 = v69;
        (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v69, v55, a3);
        if ((v56 & 1) != 0)
        {
          v50 = sub_2159990D0();
          v49((unint64_t)v48, a3);
          if (v57 < v50)
            goto LABEL_40;
        }
        else
        {
          v49((unint64_t)v48, a3);
        }
      }
      else
      {
        if (v53 >= 9)
        {
          sub_2159900D8();
          v47 = (unint64_t)v80;
LABEL_21:
          sub_2159990AC();
          v54 = v72;
          v50 = sub_215998E00();
          v49(v47, a3);
          v49((unint64_t)v54, a3);
          if ((v50 & 1) != 0)
            goto LABEL_40;
          goto LABEL_29;
        }
        v58 = v72;
        v50 = sub_2159990D0();
        v49((unint64_t)v58, a3);
        v51 = v82;
        if (v82 < v50)
          goto LABEL_40;
      }
    }
LABEL_29:
    v59 = sub_2159990D0();
    v49((unint64_t)v45, a3);
    v44 = v81;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v44 = sub_21598835C(0, *((_QWORD *)v44 + 2) + 1, 1, v44);
    v61 = *((_QWORD *)v44 + 2);
    v60 = *((_QWORD *)v44 + 3);
    if (v61 >= v60 >> 1)
      v44 = sub_21598835C((char *)(v60 > 1), v61 + 1, 1, v44);
    *((_QWORD *)v44 + 2) = v61 + 1;
    v44[v61 + 32] = v59;
    v82 = 8;
    sub_215990094();
    v48 = v71;
    sub_2159990C4();
  }
  while ((sub_215998E18() & 1) == 0);
  v50 = (int64_t)v75;
  v62 = sub_2159990D0();
  v47 = *((_QWORD *)v44 + 2);
  if (!v47)
  {
LABEL_41:
    __break(1u);
LABEL_42:
    v44 = sub_21598835C((char *)(v51 > 1), v50, 1, v44);
    goto LABEL_37;
  }
  LOBYTE(v45) = v62;
  if (((v44[v47 + 31] ^ v62) & 0x80) == 0)
    goto LABEL_38;
  v51 = *((_QWORD *)v44 + 3);
  v50 = v47 + 1;
  if (v47 >= v51 >> 1)
    goto LABEL_42;
LABEL_37:
  *((_QWORD *)v44 + 2) = v50;
  v44[v47 + 32] = (char)v45;
LABEL_38:
  v63 = sub_2159862B4((uint64_t)v44);
  v65 = v64;
  v49(v68, a3);
  v49((unint64_t)v48, a3);
  v49((unint64_t)v75, a3);
  type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject();
  result[2] = v67;
  result[3] = v63;
  result[4] = v65;
  return result;
}

_QWORD *sub_21598CF18(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *result;

  sub_21597BA38(&qword_254DEDBC0);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_21599BEA0;
  *(_BYTE *)(v8 + 32) = a4;
  v9 = sub_2159877F0(v8);
  v11 = v10;
  swift_bridgeObjectRelease();
  sub_21597B9F4(a2, a3);
  sub_21597B9F4(v9, v11);
  sub_215986890(a2, a3);
  sub_21597AD00(a2, a3);
  sub_21597AD00(v9, v11);
  sub_21597AD00(a2, a3);
  type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = v9;
  result[4] = v11;
  return result;
}

_QWORD *sub_21598D00C(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;

  v3 = sub_2159970A8(a2);
  v5 = v4;
  swift_bridgeObjectRelease();
  type metadata accessor for TLV();
  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

_QWORD *sub_21598D064(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __n128 v4;
  __n128 v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *result;
  uint64_t v12;

  v2 = sub_215998E6C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215998E60();
  v8 = sub_215998E3C();
  v10 = v9;
  swift_bridgeObjectRelease();
  result = (_QWORD *)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  if (v10 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for TLV();
    result = (_QWORD *)swift_allocObject();
    result[2] = a1;
    result[3] = v8;
    result[4] = v10;
  }
  return result;
}

void sub_21598D140()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  if ((v2 & 0x2000000000000000) == 0)
  {
    sub_21597B9F4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    goto LABEL_14;
  }
  v3 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v4 = objc_msgSend(v3, sel_outputStreamToMemory);
  objc_msgSend(v4, sel_open);
  if (v1 >> 62)
    goto LABEL_16;
  v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
  {
LABEL_12:
    sub_21598A6D4(v1, v2);
    objc_msgSend(v4, sel_close);
    if (!objc_msgSend(v4, sel_propertyForKey_, *MEMORY[0x24BDBCB88]))
    {
      __break(1u);
      swift_unexpectedError();
      __break(1u);
      JUMPOUT(0x21598D3B4);
    }
    sub_2159990F4();

    swift_unknownObjectRelease();
    sub_21597AD44(&v12, &v13);
    swift_dynamicCast();
    v2 = v11;
LABEL_14:
    __asm { BR              X10 }
  }
LABEL_5:
  v6 = 4;
  while (1)
  {
    v7 = v6 - 4;
    if ((v1 & 0xC000000000000001) != 0)
    {
      v8 = (unint64_t *)MEMORY[0x2199E9320](v6 - 4, v1);
      v9 = __OFADD__(v7, 1);
      v10 = v6 - 3;
      if (v9)
        goto LABEL_15;
    }
    else
    {
      v8 = *(unint64_t **)(v1 + 8 * v6);
      swift_retain();
      v9 = __OFADD__(v7, 1);
      v10 = v6 - 3;
      if (v9)
      {
LABEL_15:
        __break(1u);
LABEL_16:
        swift_bridgeObjectRetain();
        v5 = sub_215999190();
        sub_21598A6D4(v1, v2);
        if (!v5)
          goto LABEL_12;
        goto LABEL_5;
      }
    }
    sub_21598A8E0(v8);
    swift_release();
    ++v6;
    if (v10 == v5)
      goto LABEL_12;
  }
}

uint64_t sub_21598D3C4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  __int16 v3;
  __int16 v4;

  v0 = sub_21598A6E0();
  v2 = v1;
  sub_215988A4C(v0, v1);
  v4 = v3;
  sub_21597AD00(v0, v2);
  if ((v4 & 0x100) != 0)
    return 2;
  else
    return v4 != 0;
}

uint64_t sub_21598D418()
{
  __n128 v0;
  __n128 v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  __int16 v5;
  __int16 v6;

  sub_215998D1C();
  MEMORY[0x24BDAC7A8](v0, v1);
  v2 = sub_21598A6E0();
  v4 = v3;
  sub_215988A4C(v2, v3);
  v6 = v5;
  sub_21597AD00(v2, v4);
  if ((v6 & 0x100) == 0)
  {
    sub_21598A6E0();
    __asm { BR              X10 }
  }
  return 0;
}

uint64_t sub_21598D678()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_21598A6E0();
  return sub_2159875A4(v0, v1);
}

uint64_t sub_21598D68C()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_21598A6E0();
  return sub_215998070(v0, v1);
}

uint64_t sub_21598D6A0()
{
  __n128 v0;
  __n128 v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  sub_215998E6C();
  MEMORY[0x24BDAC7A8](v0, v1);
  v2 = sub_21598A6E0();
  v4 = v3;
  sub_215998E60();
  v5 = sub_215998E48();
  sub_21597AD00(v2, v4);
  return v5;
}

uint64_t sub_21598D738()
{
  uint64_t v0;

  sub_21598A6D4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return v0;
}

uint64_t sub_21598D754()
{
  uint64_t v0;

  sub_21598A6D4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance();
}

uint64_t sub_21598D778()
{
  _BYTE v1[72];

  sub_2159992A4();
  sub_21598AF84((uint64_t)v1);
  return sub_2159992C8();
}

uint64_t sub_21598D7B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  char v9;

  if (*(_QWORD *)(*(_QWORD *)a1 + 16) != *(_QWORD *)(*(_QWORD *)a2 + 16))
    return 0;
  v2 = sub_21598A6E0();
  v4 = v3;
  v5 = sub_21598A6E0();
  v7 = v6;
  sub_21598FC3C(v2, v4);
  v9 = v8;
  sub_21597AD00(v5, v7);
  sub_21597AD00(v2, v4);
  return v9 & 1;
}

uint64_t sub_21598D84C()
{
  _BYTE v1[72];

  sub_2159992A4();
  sub_21598AF84((uint64_t)v1);
  return sub_2159992C8();
}

uint64_t sub_21598D88C(uint64_t a1)
{
  return sub_21598AF84(a1);
}

uint64_t sub_21598D8AC()
{
  _BYTE v1[72];

  sub_2159992A4();
  sub_21598AF84((uint64_t)v1);
  return sub_2159992C8();
}

uint64_t sub_21598D8E8()
{
  return sub_21598B0A0();
}

uint64_t sub_21598D908()
{
  uint64_t v1;

  sub_215998F98();
  return v1;
}

uint64_t sub_21598D964()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;

  v0 = sub_21598ADB4();
  v2 = v1;
  sub_215998CF8();
  return sub_21597AD00(v0, v2);
}

uint64_t sub_21598D9BC()
{
  uint64_t v1;

  sub_215998F80();
  return v1;
}

uint64_t sub_21598DA08(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4)
{
  uint64_t v4;
  double v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[16];
  uint64_t v12;

  v7 = MEMORY[0x24BDAC7A8](a3, a4);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, double))(v9 + 16))(&v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], v4, a2, v7);
  v12 = a1;
  return sub_215998F8C();
}

uint64_t sub_21598DAA8(uint64_t a1)
{
  uint64_t result;
  _BYTE *v3;
  uint64_t v4;

  sub_21599907C();
  result = v4;
  if (v4)
  {
    if (*(_QWORD *)(v4 + 16) == a1)
      return result;
    swift_release();
  }
  sub_21598A168();
  swift_allocError();
  *v3 = 3;
  return swift_willThrow();
}

uint64_t sub_21598DB2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = sub_21598DAA8(a1);
  if (!v1)
  {
    v3 = sub_21598A6E0();
    swift_release();
    return v3;
  }
  return result;
}

uint64_t sub_21598DB7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BYTE *v7;

  sub_21598DAA8(a1);
  if (!v1)
  {
    v3 = sub_21598A6E0();
    v5 = v4;
    sub_215988A4C(v3, v4);
    v2 = v6;
    sub_21597AD00(v3, v5);
    swift_release();
    if ((v2 & 0x100) != 0)
    {
      sub_21598A168();
      swift_allocError();
      *v7 = 4;
      swift_willThrow();
    }
  }
  return v2;
}

uint64_t sub_21598DC18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;

  sub_21598DAA8(a1);
  if (!v2)
  {
    sub_21598BC7C();
    v1 = v3;
    swift_release();
    if ((v1 & 0x10000) != 0)
    {
      sub_21598A168();
      swift_allocError();
      *v4 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

uint64_t sub_21598DC98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;

  sub_21598DAA8(a1);
  if (!v2)
  {
    sub_21598BF54();
    v1 = v3;
    swift_release();
    if ((v1 & 0x100000000) != 0)
    {
      sub_21598A168();
      swift_allocError();
      *v4 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

uint64_t sub_21598DD18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21598DF88(a1, a2, a3, (uint64_t (*)(void))sub_21598C234);
}

char *sub_21598DD34(uint64_t a1)
{
  uint64_t v1;
  __n128 v3;
  __n128 v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v13;
  uint64_t v14;

  sub_215998E6C();
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21598DAA8(a1);
  if (!v1)
  {
    v7 = sub_21598A6E0();
    v9 = v8;
    sub_215998E60();
    v6 = (char *)sub_215998E48();
    v11 = v10;
    sub_21597AD00(v7, v9);
    swift_release();
    if (!v11)
    {
      sub_21598A168();
      swift_allocError();
      *v13 = 4;
      swift_willThrow();
    }
  }
  return v6;
}

uint64_t sub_21598DE4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  char v3;
  char v4;
  _BYTE *v5;

  result = sub_21598DAA8(a1);
  if (!v1)
  {
    sub_21598D140();
    v4 = v3;
    result = swift_release();
    if ((v4 & 1) == 0)
    {
      sub_21598A168();
      swift_allocError();
      *v5 = 4;
      return swift_willThrow();
    }
  }
  return result;
}

BOOL sub_21598DEC4(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  __int16 v6;
  __int16 v7;
  _BYTE *v8;

  sub_21598DAA8(a1);
  if (!v1)
  {
    v3 = sub_21598A6E0();
    v5 = v4;
    sub_215988A4C(v3, v4);
    v7 = v6;
    sub_21597AD00(v3, v5);
    swift_release();
    if ((v7 & 0x100) != 0)
    {
      sub_21598A168();
      swift_allocError();
      *v8 = 4;
      swift_willThrow();
    }
    else
    {
      return v7 != 0;
    }
  }
  return v2;
}

uint64_t sub_21598DF6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21598DF88(a1, a2, a3, sub_21598D418);
}

uint64_t sub_21598DF88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t v5;
  char v7;
  char v8;
  _BYTE *v9;

  sub_21598DAA8(a1);
  if (!v5)
  {
    v4 = a4();
    v8 = v7;
    swift_release();
    if ((v8 & 1) != 0)
    {
      sub_21598A168();
      swift_allocError();
      *v9 = 4;
      swift_willThrow();
    }
  }
  return v4;
}

uint64_t sub_21598E010(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE *v7;

  sub_21598DAA8(a1);
  if (!v2)
  {
    v3 = sub_21598A6E0();
    v1 = sub_2159875A4(v3, v4);
    v6 = v5;
    swift_release();
    if (v6 >> 60 == 15)
    {
      sub_21598A168();
      swift_allocError();
      *v7 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

uint64_t sub_21598E0B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  _BYTE *v5;

  sub_21598DAA8(a1);
  if (!v2)
  {
    v1 = sub_21598A6E0();
    v4 = v3;
    swift_release();
    if (v4 >> 60 == 15)
    {
      sub_21598A168();
      swift_allocError();
      *v5 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

uint64_t sub_21598E144(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _BYTE *v6;

  sub_21598DAA8(a1);
  if (!v1)
  {
    v3 = sub_21598A6E0();
    v2 = sub_215998070(v3, v4);
    swift_release();
    if (!v2)
    {
      sub_21598A168();
      swift_allocError();
      *v6 = 4;
      swift_willThrow();
    }
  }
  return v2;
}

uint64_t sub_21598E1CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  unint64_t v8;

  v3 = sub_21598DAA8(a1);
  if (!v1)
  {
    v4 = v3;
    v2 = *(_QWORD *)(v3 + 24);
    v5 = *(_QWORD *)(v3 + 32);
    if ((v5 & 0x2000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_21597B9F4(*(_QWORD *)(v3 + 24), v5);
      v6 = sub_21598FD84(v2, v5);
      sub_21598A6D4(v2, v5);
      v7 = *(_QWORD *)(v4 + 24);
      v8 = *(_QWORD *)(v4 + 32);
      *(_QWORD *)(v4 + 24) = v6;
      *(_QWORD *)(v4 + 32) = 0x2000000000000000;
      swift_bridgeObjectRetain();
      sub_21598A6D4(v7, v8);
      v2 = (uint64_t)v6;
    }
    swift_release();
  }
  return v2;
}

uint64_t sub_21598E2A8(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 24);
  v1 = *(_QWORD *)(a1 + 32);
  if ((v1 & 0x2000000000000000) == 0)
    __asm { BR              X10 }
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_215999190();
    if (!v3)
      return sub_21598A6D4(v2, v1);
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v3)
      return sub_21598A6D4(v2, v1);
  }
  if (v3 < 1)
  {
    __break(1u);
    JUMPOUT(0x21598E5C4);
  }
  for (i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0)
    {
      v5 = MEMORY[0x2199E9320](i, v2);
    }
    else
    {
      v5 = *(_QWORD *)(v2 + 8 * i + 32);
      swift_retain();
    }
    ((void (*)(uint64_t))sub_21598E2A8)(v5);
    swift_release();
  }
  return sub_21598A6D4(v2, v1);
}

uint64_t sub_21598E5DC(unint64_t a1)
{
  void *v1;
  __n128 v3;
  __n128 v4;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  __n128 v8;
  double v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  sub_215998B0C();
  MEMORY[0x24BDAC7A8](v3, v4);
  v5 = sub_215998B18();
  v6 = *(_QWORD *)(v5 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7, v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v17 = bswap64(a1);
    v12 = sub_215991764(__clz(a1) >> 3, (uint64_t)&v17, (uint64_t)&v18);
    return (uint64_t)sub_21598F20C(v12, v13, v14, v15);
  }
  LOBYTE(v17) = 0;
  result = (uint64_t)objc_msgSend(v1, sel_write_maxLength_, &v17, 1, v9);
  if (result < 0)
  {
    result = (uint64_t)objc_msgSend(v1, sel_streamError);
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    if (result == 1)
      return result;
    sub_215998B00();
    sub_21597D364(MEMORY[0x24BEE4AF8]);
    sub_2159901CC((unint64_t *)&qword_254DEDDD8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAEE8], MEMORY[0x24BDCAEE0]);
    sub_215998C20();
    sub_215998AF4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  return swift_willThrow();
}

uint64_t sub_21598E7B4(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  __n128 v10;
  __n128 v11;
  _OWORD *v12;
  __int128 v13;
  unint64_t v15;
  _OWORD v16[2];
  _QWORD v17[3];
  uint64_t v18;
  unint64_t v19;
  char v20;
  _BYTE v21[31];

  *(_QWORD *)&v21[23] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v15 = bswap64(a1);
    v1 = sub_215991764(__clz(a1) >> 3, (uint64_t)&v15, (uint64_t)v16);
    v3 = v2;
    v5 = v4;
    v7 = v6;
    swift_beginAccess();
    v8 = sub_21597BA38(&qword_254DEDDC8);
    v18 = v8;
    v19 = sub_215990160();
    v9 = (_QWORD *)swift_allocObject();
    v17[0] = v9;
    v9[2] = v1;
    v9[3] = v3;
    v9[4] = v5;
    v9[5] = v7;
    sub_215987AE8(v17, v8);
    MEMORY[0x24BDAC7A8](v10, v11);
    v13 = v12[1];
    v16[0] = *v12;
    v16[1] = v13;
    sub_215999298();
    sub_21597C068((uint64_t)v17);
  }
  else
  {
    v20 = 0;
    swift_beginAccess();
    v18 = MEMORY[0x24BEE0F88];
    v19 = MEMORY[0x24BDCFB90];
    v17[0] = &v20;
    v17[1] = v21;
    sub_215987AE8(v17, MEMORY[0x24BEE0F88]);
    sub_215998C8C();
    sub_21597C068((uint64_t)v17);
  }
  return swift_endAccess();
}

char *sub_21598E988(uint64_t a1)
{
  uint64_t v1;
  char *result;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1 > 127)
  {
    v4 = __clz(a1) >> 3;
    result = (char *)sub_21598EC6C(-120 - v4);
    if (!v1)
    {
      v9 = bswap64(a1);
      v5 = sub_215991764(v4, (uint64_t)&v9, (uint64_t)&v10);
      return sub_21598F20C(v5, v6, v7, v8);
    }
  }
  else
  {
    if (a1 < 0)
      __break(1u);
    return (char *)sub_21598EC6C(a1);
  }
  return result;
}

uint64_t sub_21598EA44(int64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  __n128 v12;
  __n128 v13;
  _OWORD *v14;
  __int128 v15;
  unint64_t v17;
  _OWORD v18[2];
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  _BYTE v24[31];

  *(_QWORD *)&v24[23] = *MEMORY[0x24BDAC8D0];
  if (a1 > 127)
  {
    v2 = __clz(a1) >> 3;
    LOBYTE(v18[0]) = -120 - v2;
    swift_beginAccess();
    v21 = MEMORY[0x24BEE0F88];
    v22 = MEMORY[0x24BDCFB90];
    v19 = (char *)v18;
    v20 = (char *)v18 + 1;
    sub_215987AE8(&v19, MEMORY[0x24BEE0F88]);
    sub_215998C8C();
    sub_21597C068((uint64_t)&v19);
    v17 = bswap64(a1);
    v3 = sub_215991764(v2, (uint64_t)&v17, (uint64_t)v18);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v10 = sub_21597BA38(&qword_254DEDDC8);
    v21 = v10;
    v22 = sub_215990160();
    v11 = (char *)swift_allocObject();
    v19 = v11;
    *((_QWORD *)v11 + 2) = v3;
    *((_QWORD *)v11 + 3) = v5;
    *((_QWORD *)v11 + 4) = v7;
    *((_QWORD *)v11 + 5) = v9;
    sub_215987AE8(&v19, v10);
    MEMORY[0x24BDAC7A8](v12, v13);
    v15 = v14[1];
    v18[0] = *v14;
    v18[1] = v15;
    sub_215999298();
    sub_21597C068((uint64_t)&v19);
  }
  else
  {
    if (a1 < 0)
      __break(1u);
    v23 = a1;
    swift_beginAccess();
    v21 = MEMORY[0x24BEE0F88];
    v22 = MEMORY[0x24BDCFB90];
    v19 = &v23;
    v20 = v24;
    sub_215987AE8(&v19, MEMORY[0x24BEE0F88]);
    sub_215998C8C();
    sub_21597C068((uint64_t)&v19);
  }
  return swift_endAccess();
}

uint64_t sub_21598EC6C(char a1)
{
  void *v1;
  __n128 v3;
  __n128 v4;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  __n128 v8;
  double v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sub_215998B0C();
  MEMORY[0x24BDAC7A8](v3, v4);
  v5 = sub_215998B18();
  v6 = *(_QWORD *)(v5 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7, v8);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  HIBYTE(v13) = a1;
  result = (uint64_t)objc_msgSend(v1, sel_write_maxLength_, (char *)&v13 + 7, 1, v9);
  if (result < 0)
  {
    result = (uint64_t)objc_msgSend(v1, sel_streamError);
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    if (result == 1)
      return result;
    sub_215998B00();
    sub_21597D364(MEMORY[0x24BEE4AF8]);
    sub_2159901CC((unint64_t *)&qword_254DEDDD8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAEE8], MEMORY[0x24BDCAEE0]);
    sub_215998C20();
    sub_215998AF4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  return swift_willThrow();
}

void sub_21598EE14(uint64_t a1, unint64_t a2)
{
  __n128 v3;
  __n128 v4;
  uint64_t v5;
  char *v6;
  __n128 v7;
  __n128 v8;
  char *v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x24BDAC8D0];
  sub_215998B0C();
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215998B18();
  MEMORY[0x24BDAC7A8](v7, v8);
  v9 = (char *)&loc_21598EEC8 + dword_21598F1FC[a2 >> 62];
  v10[2] = v6;
  __asm { BR              X10 }
}

uint64_t sub_21598EEDC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t result;

  *(_QWORD *)(v26 - 104) = v23;
  *(_WORD *)(v26 - 96) = v24;
  *(_BYTE *)(v26 - 94) = BYTE2(v24);
  *(_BYTE *)(v26 - 93) = BYTE3(v24);
  *(_BYTE *)(v26 - 92) = BYTE4(v24);
  *(_BYTE *)(v26 - 91) = BYTE5(v24);
  v27 = (unint64_t)objc_msgSend(v20, sel_write_maxLength_, v26 - 104, BYTE6(v24));
  if ((v27 & 0x8000000000000000) != 0)
  {
    if (!objc_msgSend(v20, sel_streamError))
    {
      __break(1u);
      JUMPOUT(0x21598F1D4);
    }
    swift_willThrow();
    return sub_21597AD00(v23, v24);
  }
  else
  {
    v28 = v27;
    result = sub_21597AD00(v23, v24);
    if (v28 != BYTE6(v24))
    {
      sub_215998B00();
      sub_21597D364(MEMORY[0x24BEE4AF8]);
      sub_2159901CC((unint64_t *)&qword_254DEDDD8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAEE8], MEMORY[0x24BDCAEE0]);
      sub_215998C20();
      sub_215998AF4();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v22, v21);
      return swift_willThrow();
    }
  }
  return result;
}

char *sub_21598F20C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  __n128 *v16;
  __int128 v17;
  __int128 v18;
  char *result;
  BOOL v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v5 = v4;
  sub_215998B0C();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v25 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_215998B18();
  v26 = *(_QWORD *)(v11 - 8);
  v27 = v11;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v24 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = a1;
  v29 = a2;
  *(_QWORD *)&v33 = a1;
  *((_QWORD *)&v33 + 1) = a2;
  v30 = a3;
  v31 = a4;
  *(_QWORD *)&v34 = a3;
  *((_QWORD *)&v34 + 1) = a4;
  sub_21597BA38(&qword_254DEDDC8);
  sub_21599020C();
  v13 = sub_21599928C();
  v14 = *(_QWORD *)(v13 + 16);
  v32 = v13;
  v15 = 0;
  if (v14)
  {
    v16 = (__n128 *)(v13 + 48);
    while (1)
    {
      *(double *)&v17 = MEMORY[0x24BDAC7A8](v16[-1], *v16);
      *(&v23 - 2) = (uint64_t)v5;
      v33 = v17;
      v34 = v18;
      result = (char *)sub_215999298();
      if (v35 < 0)
        break;
      v20 = __OFADD__(v15, v35);
      v15 += v35;
      if (v20)
      {
        __break(1u);
        goto LABEL_12;
      }
      v16 += 2;
      if (!--v14)
        goto LABEL_6;
    }
    result = (char *)objc_msgSend(v5, sel_streamError);
    if (result)
    {
      swift_willThrow();
      return (char *)swift_bridgeObjectRelease();
    }
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    result = (char *)sub_21599241C(v28, v29, v30, v31);
    if (v15 != result)
    {
      sub_215998B00();
      sub_21597D364(MEMORY[0x24BEE4AF8]);
      sub_2159901CC((unint64_t *)&qword_254DEDDD8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAEE8], MEMORY[0x24BDCAEE0]);
      v21 = v24;
      v22 = v27;
      sub_215998C20();
      sub_215998AF4();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v21, v22);
      return (char *)swift_willThrow();
    }
  }
  return result;
}

void sub_21598F484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_21598F4E4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x21598F6C8);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_21598F6EC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21598F748()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_21598F484((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_21597AD00(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_21598F910(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_215998B78();
  if (!result || (result = sub_215998B9C(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_215998B90();
      sub_215998DAC();
      sub_2159901CC(&qword_254DEDDB8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
      return sub_215998D7C();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

char *sub_21598F9D8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21598F9F4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_21598F9F4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_21597BA38(&qword_254DEDB58);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_21598FAF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_215998B78();
  v11 = result;
  if (result)
  {
    result = sub_215998B9C();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_215998B90();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_21598F484(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

char *sub_21598FBA8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  char *result;
  char *v8;
  BOOL v9;
  uint64_t v10;
  id v11;

  result = (char *)sub_215998B78();
  v8 = result;
  if (result)
  {
    result = (char *)sub_215998B9C();
    if (__OFSUB__(a1, result))
    {
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
    v8 += a1 - (_QWORD)result;
  }
  v9 = __OFSUB__(a2, a1);
  v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  result = (char *)sub_215998B90();
  if (!v8)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if ((uint64_t)result >= v10)
    v11 = (id)v10;
  else
    v11 = result;
  return (char *)objc_msgSend(a4, sel_write_maxLength_, v8, v11);
}

void sub_21598FC3C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_21598FC80()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_21598FCB4 + dword_21598FD74[v0 >> 62]))();
}

uint64_t sub_21598FCC4@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_21597B9F4(v2, v1);
      sub_21598F6EC(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

id sub_21598FD84(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  id v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  id v12;
  char v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  id result;
  _BYTE *v21;
  unsigned __int8 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v23 = MEMORY[0x24BEE4AF8];
  v5 = objc_allocWithZone(MEMORY[0x24BDBCE90]);
  sub_21597B9F4(a1, a2);
  v6 = (void *)sub_215998CBC();
  v7 = objc_msgSend(v5, sel_initWithData_, v6);
  sub_21597AD00(a1, a2);

  objc_msgSend(v7, sel_open);
  while (1)
  {
    v22 = 0;
    v8 = objc_msgSend(v7, sel_read_maxLength_, &v22, 1);
    if (v8 != (id)1)
    {
      if (v8 == (id)-1)
      {
        if (objc_msgSend(v7, sel_streamError))
          goto LABEL_18;
        __break(1u);
      }
      objc_msgSend(v7, sel_close);

      return (id)v23;
    }
    v9 = v22;
    if ((~v22 & 0x1F) == 0)
      break;
    v11 = v22;
LABEL_8:
    v12 = sub_21598A1AC();
    if (v2)
      goto LABEL_19;
    if ((v13 & 1) != 0)
      goto LABEL_17;
    v14 = sub_2159905FC((uint64_t)v12);
    v16 = v15;
    if (v15 >> 60 == 15)
      goto LABEL_17;
    v17 = v14;
    type metadata accessor for TLV();
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = v11;
    v18[3] = v17;
    v18[4] = v16;
    v19 = swift_retain();
    MEMORY[0x2199E91AC](v19);
    if (*(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_215998FC8();
    sub_215998FE0();
    sub_215998FBC();
    swift_release();
  }
  while (1)
  {
    v22 = 0;
    v10 = objc_msgSend(v7, sel_read_maxLength_, &v22, 1);
    if (v10 != (id)1)
      break;
    v11 = v22 | (v9 << 8);
    v9 = v11;
    if (((char)v22 & 0x80000000) == 0)
      goto LABEL_8;
  }
  if (v10 != (id)-1)
  {
LABEL_17:
    sub_21598A168();
    swift_allocError();
    *v21 = 0;
LABEL_18:
    swift_willThrow();
LABEL_19:

    return (id)swift_bridgeObjectRelease();
  }
  result = objc_msgSend(v7, sel_streamError);
  if (result)
    goto LABEL_18;
  __break(1u);
  return result;
}

unint64_t sub_215990048()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DEDD98;
  if (!qword_254DEDD98)
  {
    v1 = sub_21597E450(&qword_254DEDB50);
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_254DEDD98);
  }
  return result;
}

unint64_t sub_215990094()
{
  unint64_t result;

  result = qword_254DEDDA8;
  if (!qword_254DEDDA8)
  {
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_254DEDDA8);
  }
  return result;
}

unint64_t sub_2159900D8()
{
  unint64_t result;

  result = qword_254DEDDB0;
  if (!qword_254DEDDB0)
  {
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BEE4298], MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_254DEDDB0);
  }
  return result;
}

BOOL sub_21599011C(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(*(_QWORD *)a1 + 16) == *(_QWORD *)(v1 + 16);
}

uint64_t sub_215990134(uint64_t a1, uint64_t a2)
{
  return sub_2159901CC(&qword_254DEDDC0, a2, (uint64_t (*)(uint64_t))type metadata accessor for TLV, (uint64_t)&unk_21599C308);
}

unint64_t sub_215990160()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254DEDDD0;
  if (!qword_254DEDDD0)
  {
    v1 = sub_21597E450(&qword_254DEDDC8);
    v2 = MEMORY[0x24BDCFB90];
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BDD0790], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254DEDDD0);
  }
  return result;
}

uint64_t sub_2159901BC()
{
  return swift_deallocObject();
}

uint64_t sub_2159901CC(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x2199E9BE4](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21599020C()
{
  unint64_t result;

  result = qword_254DEDDE0;
  if (!qword_254DEDDE0)
  {
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BDCFB88], MEMORY[0x24BEE0F88]);
    atomic_store(result, (unint64_t *)&qword_254DEDDE0);
  }
  return result;
}

id sub_215990250@<X0>(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_215993DE4(*(id *)(v3 + 16), a1, a2, a3);
}

uint64_t sub_215990268()
{
  return sub_215987B0C();
}

BOOL sub_21599027C(uint64_t a1)
{
  return sub_21599011C(a1);
}

void sub_215990294(uint64_t a1, uint64_t a2)
{
  sub_2159889A0(a1, a2);
}

_QWORD *sub_2159902A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *(*v5)(uint64_t *__return_ptr, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v6;
  unint64_t v7;
  _QWORD *result;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;

  v5 = *(_QWORD *(**)(uint64_t *__return_ptr, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(a2 + 8);
  v6 = sub_2159903EC();
  v7 = sub_215990430();
  result = v5((uint64_t *)((char *)&v12 + 2), MEMORY[0x24BEE4260], MEMORY[0x24BEE4260], v6, v7, a1, a2);
  if (!v2)
  {
    if ((v12 & 0x1000000) != 0)
    {
      return 0;
    }
    else
    {
      v9 = BYTE2(v12);
      if ((~BYTE2(v12) & 0x1F) != 0)
      {
        return (_QWORD *)BYTE2(v12);
      }
      else
      {
        v10 = MEMORY[0x24BEE4260];
        while (1)
        {
          v5(&v12, v10, v10, v6, v7, a1, a2);
          if ((v12 & 0x100) != 0)
            break;
          result = (_QWORD *)(v12 | (v9 << 8));
          v9 = (unint64_t)result;
          if (((char)v12 & 0x80000000) == 0)
            return result;
        }
        sub_21598A168();
        swift_allocError();
        *v11 = 0;
        return (_QWORD *)swift_willThrow();
      }
    }
  }
  return result;
}

unint64_t sub_2159903EC()
{
  unint64_t result;

  result = qword_254DEDDE8;
  if (!qword_254DEDDE8)
  {
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BEE42A0], MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_254DEDDE8);
  }
  return result;
}

unint64_t sub_215990430()
{
  unint64_t result;

  result = qword_254DEDDF0;
  if (!qword_254DEDDF0)
  {
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BEE4288], MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_254DEDDF0);
  }
  return result;
}

_QWORD *sub_215990474(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *(*v6)(uint64_t *__return_ptr, _QWORD, _QWORD, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v7;
  unint64_t v8;
  _QWORD *result;
  unsigned int v10;
  _BYTE *v11;
  unsigned int v12;
  _BYTE *v13;
  _QWORD *(*v14)(uint64_t *__return_ptr, _QWORD, _QWORD, unint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v15;

  v6 = *(_QWORD *(**)(uint64_t *__return_ptr, _QWORD, _QWORD, unint64_t, unint64_t, uint64_t, uint64_t))(a2 + 8);
  v7 = sub_2159903EC();
  v8 = sub_215990430();
  result = v6((uint64_t *)((char *)&v15 + 2), MEMORY[0x24BEE4260], MEMORY[0x24BEE4260], v7, v8, a1, a2);
  if (v2)
    return (_QWORD *)v3;
  if ((v15 & 0x1000000) != 0)
    return 0;
  v10 = BYTE2(v15);
  if ((v15 & 0x800000) == 0)
    return (_QWORD *)BYTE2(v15);
  if (BYTE2(v15) == 128)
  {
    sub_21598A168();
    swift_allocError();
    *v11 = 2;
LABEL_15:
    swift_willThrow();
    return (_QWORD *)v3;
  }
  v14 = v6;
  v3 = 0;
  v12 = 128;
  while (v12 < v10)
  {
    result = v14(&v15, MEMORY[0x24BEE4260], MEMORY[0x24BEE4260], v7, v8, a1, a2);
    if ((v15 & 0x100) != 0)
    {
      sub_21598A168();
      swift_allocError();
      *v13 = 0;
      goto LABEL_15;
    }
    ++v12;
    v3 = v15 | (v3 << 8);
    if (v12 == v10)
      return (_QWORD *)v3;
  }
  __break(1u);
  return result;
}

id sub_2159905FC(uint64_t a1)
{
  void *v1;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id result;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a1 < 1)
    return 0;
  *(_QWORD *)&v11 = 0;
  *(_QWORD *)&v10 = 0;
  v3 = objc_msgSend(v1, sel_getBuffer_length_, &v11, &v10);
  v4 = v10;
  if (!v3)
    v4 = 1000000;
  if (v4 < a1)
    return 0;
  *(_QWORD *)&v10 = sub_21597E338(a1);
  *((_QWORD *)&v10 + 1) = v5;
  sub_215990ED4((uint64_t)&v10);
  v11 = v10;
  v6 = v1;
  sub_21599113C((uint64_t)&v11);
  v8 = v7;

  if (v8 == -1)
  {
    result = objc_msgSend(v6, sel_streamError);
    if (result)
    {
      swift_willThrow();
      return (id)sub_21597AD00(v11, *((unint64_t *)&v11 + 1));
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    result = (id)v11;
    if (v8 != a1)
    {
      sub_21597AD00(v11, *((unint64_t *)&v11 + 1));
      return 0;
    }
  }
  return result;
}

id sub_215990750@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  void *v2;
  __n128 v4;
  __n128 v5;
  __n128 v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[16];
  void *v18;
  uint64_t v19;

  v15 = a2;
  v19 = *MEMORY[0x24BDAC8D0];
  swift_getAssociatedTypeWitness();
  v6.n128_f64[0] = MEMORY[0x24BDAC7A8](v4, v5);
  v7 = *(_QWORD *)(a1 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6, v9);
  swift_getAssociatedConformanceWitness();
  sub_21599922C();
  sub_2159991FC();
  v18 = v2;
  sub_215990AE8((uint64_t)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)sub_2159914BC, (uint64_t)v17, a1, MEMORY[0x24BEE4078], MEMORY[0x24BEE1768], MEMORY[0x24BEE40A8], v10);
  if (v16 == -1)
  {
    result = objc_msgSend(v2, sel_streamError);
    if (result)
    {
      swift_willThrow();
      return (id)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (v8 == v16)
    {
      v11 = v15;
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v15, (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
      v12 = 0;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
      v12 = 1;
      v11 = v15;
    }
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v11, v12, 1, a1);
  }
  return result;
}

_QWORD *sub_215990988(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *result;
  char v6;
  _QWORD *v7;
  _QWORD *v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  uint64_t v14;

  result = sub_2159902A8(a1, a2);
  if (!v2)
  {
    if ((v6 & 1) != 0)
    {
      return 0;
    }
    else
    {
      v7 = result;
      v8 = sub_215990474(a1, a2);
      if ((v9 & 1) != 0
        || (v10 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(a2 + 16))(v8, a1, a2),
            v12 = v11,
            v11 >> 60 == 15))
      {
        sub_21598A168();
        swift_allocError();
        *v13 = 0;
        return (_QWORD *)swift_willThrow();
      }
      else
      {
        v14 = v10;
        type metadata accessor for TLV();
        result = (_QWORD *)swift_allocObject();
        result[2] = v7;
        result[3] = v14;
        result[4] = v12;
      }
    }
  }
  return result;
}

uint64_t sub_215990A74()
{
  void *v0;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = 0;
  v3[0] = 0;
  if (objc_msgSend(v0, sel_getBuffer_length_, v3, &v2))
    return v2;
  else
    return 1000000;
}

uint64_t sub_215990AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, char *);
  uint64_t result;
  uint64_t v18;

  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v16(v12, v12 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64), v14);
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  return result;
}

id sub_215990B80@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_215990750(a1, a2);
}

id sub_215990BA0(uint64_t a1)
{
  return sub_2159905FC(a1);
}

uint64_t sub_215990BC0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;

  v5 = *(_QWORD *)(a1 - 8);
  result = sub_215998FF8();
  if (!v2)
  {
    if (v7 >> 60 != 15)
      __asm { BR              X10 }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, a1);
  }
  return result;
}

uint64_t sub_215990D34(__n128 a1, __n128 a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v6 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215998FA4();
  sub_215999178();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a5);
}

uint64_t sub_215990DE0()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;

  result = sub_215998FF8();
  if (!v0)
  {
    if (v2 >> 60 != 15)
      __asm { BR              X10 }
    return 0;
  }
  return result;
}

uint64_t sub_215990E94@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_215990BC0(a1, a2);
}

uint64_t sub_215990EB4()
{
  return sub_215990DE0();
}

void sub_215990ED4(uint64_t a1)
{
  __asm { BR              X13 }
}

void *sub_215990F30(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  void *result;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;

  v30 = v25;
  LOWORD(v31) = v24;
  BYTE2(v31) = BYTE2(v24);
  HIBYTE(v31) = BYTE3(v24);
  v32 = BYTE4(v24);
  v33 = BYTE5(v24);
  v34 = BYTE6(v24);
  result = memset(&v30, v27, BYTE6(v24));
  v29 = v31 | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v34 << 48);
  *v26 = v30;
  v26[1] = v29;
  return result;
}

char *sub_2159910BC(int *a1, int a2)
{
  char *result;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  size_t v11;

  result = (char *)sub_215998C50();
  v5 = *a1;
  v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  result = (char *)sub_215998B78();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v7 = result;
  result = (char *)sub_215998B9C();
  v8 = v5 - (_QWORD)result;
  if (__OFSUB__(v5, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v6 - v5;
  v10 = sub_215998B90();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  return (char *)memset(&v7[v8], a2, v11);
}

void sub_21599113C(uint64_t a1)
{
  __asm { BR              X11 }
}

id sub_215991194@<X0>(id a1@<X1>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  _QWORD *v18;
  uint64_t v19;
  id result;
  unint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;

  v22 = v19;
  LOWORD(v23) = a2;
  BYTE2(v23) = BYTE2(a2);
  HIBYTE(v23) = BYTE3(a2);
  v24 = BYTE4(a2);
  v25 = BYTE5(a2);
  v26 = BYTE6(a2);
  result = objc_msgSend(a1, sel_read_maxLength_, &v22, BYTE6(a2));
  v21 = v23 | ((unint64_t)v24 << 32) | ((unint64_t)v25 << 40) | ((unint64_t)v26 << 48);
  *v18 = v22;
  v18[1] = v21;
  return result;
}

id sub_2159914BC@<X0>(id result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  if (result)
  {
    result = objc_msgSend(*(id *)(v3 + 16), sel_read_maxLength_, result, a2 - (_QWORD)result);
    *a3 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_215991504(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4)
{
  uint64_t v4;

  return sub_215990D34(a3, a4, a1, a2, *(_QWORD *)(v4 + 16));
}

BOOL sub_215991520(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_215991530()
{
  return sub_2159992B0();
}

uint64_t sub_215991554()
{
  sub_2159992A4();
  sub_2159992B0();
  return sub_2159992C8();
}

unint64_t sub_21599159C()
{
  unint64_t result;

  result = qword_254DEDDF8;
  if (!qword_254DEDDF8)
  {
    result = MEMORY[0x2199E9BE4](&unk_21599C490, &type metadata for TLVError);
    atomic_store(result, (unint64_t *)&qword_254DEDDF8);
  }
  return result;
}

BOOL sub_2159915EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t getEnumTagSinglePayload for TLVError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TLVError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_2159916DC + 4 * byte_21599C409[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_215991710 + 4 * asc_21599C404[v4]))();
}

uint64_t sub_215991710(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_215991718(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x215991720);
  return result;
}

uint64_t sub_21599172C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x215991734);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_215991738(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_215991740(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21599174C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TLVError()
{
  return &type metadata for TLVError;
}

uint64_t sub_215991764(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (result < 0)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  v5 = a3 - a2;
  if (a2)
    v6 = a3 - a2;
  else
    v6 = 0;
  result = sub_215992394(0, result, v6, a2, a3);
  if ((v7 & 1) != 0)
  {
    result = v5;
    if (!a2)
      return 0;
  }
  else if (!a2)
  {
    v5 = 0;
  }
  if (v5 < result)
    goto LABEL_13;
  return result;
}

void sub_2159917F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000) == 0)
    __asm { BR              X9 }
  __break(1u);
  JUMPOUT(0x21599194CLL);
}

void *sub_215991980()
{
  return &unk_24D3CDAC0;
}

unint64_t sub_21599198C()
{
  return 0xD00000000000001BLL;
}

void *sub_2159919A8()
{
  return &unk_24D3CDAD0;
}

unint64_t sub_2159919B4()
{
  return 0xD000000000000019;
}

uint64_t sub_2159919D0()
{
  __SecCertificate *v0;
  CFDataRef v1;
  uint64_t v2;

  v1 = SecCertificateCopyData(v0);
  v2 = sub_215998CD4();

  return v2;
}

unint64_t sub_215991A14()
{
  __SecCertificate *v0;
  CFDataRef v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = SecCertificateCopyData(v0);
  v2 = sub_215998CD4();
  v4 = v3;

  sub_215998CC8();
  sub_215998ED8();
  swift_bridgeObjectRelease();
  sub_215998ED8();
  sub_215998ED8();
  sub_21597AD00(v2, v4);
  return 0xD00000000000001CLL;
}

uint64_t sub_215991ADC()
{
  __SecCertificate *v0;
  CFDataRef v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = SecCertificateCopyData(v0);
  v2 = sub_215998CD4();
  v4 = v3;

  sub_215995DD4(v2, v4);
  v6 = v5;
  sub_21597AD00(v2, v4);
  return v6;
}

SecKeyRef sub_215991B40()
{
  __SecCertificate *v0;

  return SecCertificateCopyKey(v0);
}

SecCertificateRef sub_215991B48()
{
  const __CFAllocator *v0;
  const __CFData *v1;
  SecCertificateRef v2;

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v1 = (const __CFData *)sub_215998CBC();
  v2 = SecCertificateCreateWithData(v0, v1);

  return v2;
}

SecCertificateRef sub_215991B8C()
{
  uint64_t v0;
  unint64_t v1;
  SecCertificateRef v2;
  uint64_t v3;
  unint64_t v4;
  const __CFAllocator *v5;
  const __CFData *v6;

  v0 = sub_215998C5C();
  if (v1 >> 60 == 15)
    return 0;
  v3 = v0;
  v4 = v1;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = (const __CFData *)sub_215998CBC();
  v2 = SecCertificateCreateWithData(v5, v6);

  sub_21597ACEC(v3, v4);
  return v2;
}

uint64_t sub_215991C08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  SecCertificateRef v46;
  uint64_t v47;
  unint64_t v48;
  const __CFAllocator *v49;
  const __CFData *v50;
  _QWORD v51[2];

  v4 = sub_215998B48();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51[0] = a1;
  v51[1] = a2;
  sub_215998B3C();
  sub_215992204();
  v10 = sub_2159990A0();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  v13 = sub_215998EB4();
  v14 = sub_215998EB4();
  result = sub_215998EB4();
  if (__OFADD__(v14, result))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v13 < v14 + result)
    goto LABEL_11;
  swift_bridgeObjectRetain();
  v16 = sub_215998EB4();
  v17 = sub_2159924EC(v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  swift_bridgeObjectRelease();
  v24 = sub_215992574(v17, v19, v21, v23, 0xD00000000000001BLL, 0x800000021599EFC0);
  swift_bridgeObjectRelease();
  if ((v24 & 1) == 0)
    goto LABEL_11;
  swift_bridgeObjectRetain();
  v25 = sub_215998EB4();
  v26 = sub_2159925E8(v25, v10, v12);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  swift_bridgeObjectRelease();
  LOBYTE(v26) = sub_215992574(v26, v28, v30, v32, 0xD000000000000019, 0x800000021599EFE0);
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0)
    goto LABEL_11;
  v33 = sub_215998EB4();
  v34 = sub_215992450(v33, v10, v12);
  swift_bridgeObjectRelease();
  result = sub_215998EB4();
  if (result < 0)
    goto LABEL_15;
  result = sub_215999064();
  if ((v35 & 1) != 0)
    v36 = v34;
  else
    v36 = result;
  if (v36 >> 14 >= v34 >> 14)
  {
    v37 = sub_215999070();
    v39 = v38;
    v41 = v40;
    v43 = v42;
    swift_bridgeObjectRelease();
    MEMORY[0x2199E9080](v37, v39, v41, v43);
    swift_bridgeObjectRelease();
    v44 = sub_215998C5C();
    if (v45 >> 60 != 15)
    {
      v47 = v44;
      v48 = v45;
      v49 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v50 = (const __CFData *)sub_215998CBC();
      v46 = SecCertificateCreateWithData(v49, v50);

      sub_21597ACEC(v47, v48);
      goto LABEL_12;
    }
LABEL_11:
    v46 = 0;
LABEL_12:
    swift_bridgeObjectRelease();
    return (uint64_t)v46;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_215991F50()
{
  uint64_t v0;
  uint64_t v1;
  __n128 v2;
  __n128 v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  const __CFAllocator *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const __CFData *v19;
  SecCertificateRef v20;
  uint64_t v21;
  uint64_t v22;
  __SecCertificate *v23;
  uint64_t v25;
  uint64_t v26;

  v0 = sub_215998B48();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_allocWithZone(MEMORY[0x24BDD17A8]);
  swift_bridgeObjectRetain();
  v7 = (void *)sub_215998E24();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_initWithString_, v7);

  sub_215998B3C();
  v9 = (void *)sub_215998B30();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v5, v0);
  objc_msgSend(v8, sel_setCharactersToBeSkipped_, v9);

  v10 = MEMORY[0x24BEE4AF8];
  v26 = MEMORY[0x24BEE4AF8];
  if ((objc_msgSend(v8, sel_isAtEnd) & 1) != 0)
  {
LABEL_2:

  }
  else
  {
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    while (1)
    {
      sub_215999040();
      v13 = v12;
      swift_bridgeObjectRelease();
      if (!v13)
        goto LABEL_14;
      sub_21599904C();
      if (!v14)
        goto LABEL_14;
      v15 = sub_215998C5C();
      if (v16 >> 60 == 15)
      {
        swift_bridgeObjectRelease();
LABEL_14:

        goto LABEL_15;
      }
      v17 = v15;
      v18 = v16;
      v19 = (const __CFData *)sub_215998CBC();
      v20 = SecCertificateCreateWithData(v11, v19);

      sub_21597ACEC(v17, v18);
      swift_bridgeObjectRelease();
      if (!v20)
        goto LABEL_14;
      sub_215999040();
      v22 = v21;
      swift_bridgeObjectRelease();
      if (!v22)
        break;
      v23 = v20;
      MEMORY[0x2199E91AC]();
      if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_215998FC8();
      sub_215998FE0();
      sub_215998FBC();

      if ((objc_msgSend(v8, sel_isAtEnd) & 1) != 0)
      {
        v10 = v26;
        goto LABEL_2;
      }
    }

LABEL_15:
    swift_bridgeObjectRelease();
    return 0;
  }
  return v10;
}

unint64_t sub_215992204()
{
  unint64_t result;

  result = qword_254DEDE00;
  if (!qword_254DEDE00)
  {
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254DEDE00);
  }
  return result;
}

uint64_t sub_215992248(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  BOOL v4;
  uint64_t v5;

  v4 = __OFADD__(a1, a2);
  v5 = a1 + a2;
  if (v4)
  {
    __break(1u);
    JUMPOUT(0x2159922A8);
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_215992260 + dword_2159922AC[a4 >> 62]))(v5);
}

uint64_t sub_2159922BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ((uint64_t (*)(void))((char *)&loc_2159922CC + dword_215992374[a4 >> 62]))();
}

uint64_t sub_2159922E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, int a3@<W8>)
{
  if (BYTE6(a2) < a1 || a1 < 0)
  {
    __break(1u);
    JUMPOUT(0x21599236CLL);
  }
  return ((uint64_t (*)(void))((char *)&loc_21599231C + dword_215992384[a3]))();
}

uint64_t sub_215992394(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v5 = a5 - a4;
  if (!a4)
    v5 = 0;
  if (result < 0 || v5 < result)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (a3 < 0 || v5 < a3)
    goto LABEL_19;
  v6 = a3 - result;
  if (a2 > 0)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2)
      goto LABEL_14;
    return 0;
  }
  if (v6 <= 0 && v6 > a2)
    return 0;
LABEL_14:
  v7 = __OFADD__(result, a2);
  result += a2;
  if (v7)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  if (result < 0 || v5 < result)
    goto LABEL_21;
  return result;
}

uint64_t sub_21599241C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = a4 - a3;
  if (!a3)
    v4 = 0;
  if (result < 0 || v4 < result)
  {
    __break(1u);
  }
  else if ((a2 & 0x8000000000000000) == 0 && v4 >= a2)
  {
    return a2 - result;
  }
  __break(1u);
  return result;
}

unint64_t sub_215992450(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_215998ECC();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_215998F50();
  }
  __break(1u);
  return result;
}

uint64_t sub_2159924EC(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_215998ECC();
    return sub_215998F50();
  }
  return result;
}

uint64_t sub_215992574(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;

  if ((a6 & 0x2000000000000000) != 0)
    v6 = HIBYTE(a6) & 0xF;
  else
    v6 = a5 & 0xFFFFFFFFFFFFLL;
  if (a3 == a5 && a4 == a6 && !(a1 >> 16) && a2 >> 16 == v6)
    return 1;
  else
    return sub_2159991E4() & 1;
}

unint64_t sub_2159925E8(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  char v4;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    result = sub_215998ECC();
    if ((v4 & 1) != 0)
      result = 15;
    if (4 * v3 >= result >> 14)
      return sub_215998F50();
  }
  __break(1u);
  return result;
}

void *sub_215992690()
{
  return &unk_21599C4F0;
}

void *sub_21599269C()
{
  return &unk_21599C4D0;
}

void *sub_2159926A8()
{
  return &unk_21599C4D8;
}

void *sub_2159926B4()
{
  return &unk_21599C4E0;
}

void *sub_2159926C0()
{
  return &unk_21599C4E8;
}

void *sub_2159926CC()
{
  return &unk_21599C4F8;
}

void *sub_2159926D8()
{
  return &unk_21599C500;
}

uint64_t sub_2159926E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_21597BA38(&qword_254DEDDA0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_21599BEA0;
  v3 = MEMORY[0x24BEE1ED8];
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE1E88];
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(v2 + 32) = a1;
  return sub_215998E54();
}

uint64_t sub_21599274C(unint64_t a1)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;

  v2 = sub_21598835C(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v3 = *((_QWORD *)v2 + 2);
  do
  {
    v4 = *((_QWORD *)v2 + 3);
    if (v3 >= v4 >> 1)
      v2 = sub_21598835C((char *)(v4 > 1), v3 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v3 + 1;
    v2[v3++ + 32] = a1;
    v5 = a1 > 0xFF;
    a1 >>= 8;
  }
  while (v5);
  return sub_2159862B4((uint64_t)v2);
}

void *sub_2159927E4()
{
  return &unk_21599C508;
}

uint64_t sub_2159927F0()
{
  return 48;
}

void *sub_2159927F8()
{
  return &unk_21599C510;
}

uint64_t sub_215992804()
{
  return 49;
}

void *sub_21599280C()
{
  return &unk_21599C518;
}

uint64_t sub_215992818()
{
  return 19;
}

void *sub_215992820()
{
  return &unk_21599C520;
}

uint64_t sub_21599282C()
{
  return 20;
}

void *sub_215992834()
{
  return &unk_21599C528;
}

uint64_t sub_215992840()
{
  return 22;
}

void *sub_215992848()
{
  return &unk_21599C530;
}

uint64_t sub_215992854()
{
  return 23;
}

void *sub_21599285C()
{
  return &unk_21599C538;
}

uint64_t sub_215992868()
{
  return 79;
}

void *sub_215992870()
{
  return &unk_21599C540;
}

uint64_t sub_21599287C()
{
  return 80;
}

void *sub_215992884()
{
  return &unk_21599C548;
}

uint64_t sub_215992890()
{
  return 24362;
}

void *sub_215992898()
{
  return &unk_21599C550;
}

uint64_t sub_2159928A4()
{
  return 24365;
}

void *sub_2159928AC()
{
  return &unk_21599C558;
}

uint64_t sub_2159928B8()
{
  return 111;
}

void *sub_2159928C0()
{
  return &unk_21599C560;
}

uint64_t sub_2159928CC()
{
  return 130;
}

void *sub_2159928D4()
{
  return &unk_21599C568;
}

uint64_t sub_2159928E0()
{
  return 149;
}

void *sub_2159928E8()
{
  return &unk_21599C570;
}

uint64_t sub_2159928F4()
{
  return 154;
}

void *sub_2159928FC()
{
  return &unk_21599C578;
}

uint64_t sub_215992908()
{
  return 156;
}

void *sub_215992910()
{
  return &unk_21599C580;
}

uint64_t sub_21599291C()
{
  return 40706;
}

void *sub_215992924()
{
  return &unk_21599C588;
}

uint64_t sub_215992930()
{
  return 40707;
}

void *sub_215992938()
{
  return &unk_21599C590;
}

uint64_t sub_215992944()
{
  return 40720;
}

void *sub_21599294C()
{
  return &unk_21599C598;
}

uint64_t sub_215992958()
{
  return 40722;
}

void *sub_215992960()
{
  return &unk_21599C5A0;
}

uint64_t sub_21599296C()
{
  return 40725;
}

void *sub_215992974()
{
  return &unk_21599C5A8;
}

uint64_t sub_215992980()
{
  return 40730;
}

void *sub_215992988()
{
  return &unk_21599C5B0;
}

uint64_t sub_215992994()
{
  return 40734;
}

void *sub_21599299C()
{
  return &unk_21599C5B8;
}

uint64_t sub_2159929A8()
{
  return 40737;
}

void *sub_2159929B0()
{
  return &unk_21599C5C0;
}

uint64_t sub_2159929BC()
{
  return 40743;
}

void *sub_2159929C4()
{
  return &unk_21599C5C8;
}

uint64_t sub_2159929D0()
{
  return 40756;
}

void *sub_2159929D8()
{
  return &unk_21599C5D0;
}

uint64_t sub_2159929E4()
{
  return 40759;
}

void *sub_2159929EC()
{
  return &unk_21599C5D8;
}

uint64_t sub_2159929F8()
{
  return 40814;
}

void *sub_215992A00()
{
  return &unk_21599C5E0;
}

uint64_t sub_215992A0C()
{
  return 40803;
}

void *sub_215992A14()
{
  return &unk_21599C5E8;
}

uint64_t sub_215992A20()
{
  return 40816;
}

void *sub_215992A28()
{
  return &unk_21599C5F0;
}

uint64_t sub_215992A34()
{
  return 40817;
}

void *sub_215992A3C()
{
  return &unk_21599C5F8;
}

uint64_t sub_215992A48()
{
  return 14647573;
}

void *sub_215992A54()
{
  return &unk_21599C600;
}

uint64_t sub_215992A60()
{
  return 14647574;
}

void *sub_215992A6C()
{
  return &unk_21599C608;
}

uint64_t sub_215992A78()
{
  return 14647593;
}

void *sub_215992A84()
{
  return &unk_21599C610;
}

void *sub_215992A90()
{
  return &unk_21599C618;
}

uint64_t sub_215992A9C()
{
  return 24352;
}

void *sub_215992AA4()
{
  return &unk_21599C620;
}

uint64_t sub_215992AB0()
{
  return 32560;
}

void *sub_215992AB8()
{
  return &unk_21599C628;
}

uint64_t sub_215992AC4()
{
  return 160;
}

void *sub_215992ACC()
{
  return &unk_21599C630;
}

uint64_t sub_215992AD8()
{
  return 161;
}

void *sub_215992AE0()
{
  return &unk_21599C638;
}

uint64_t sub_215992AEC()
{
  return 177;
}

void *sub_215992AF4()
{
  return &unk_21599C640;
}

uint64_t sub_215992B00()
{
  return 190;
}

void *sub_215992B08()
{
  return &unk_21599C648;
}

uint64_t sub_215992B14()
{
  return 48946;
}

void *sub_215992B1C()
{
  return &unk_21599C650;
}

uint64_t sub_215992B28()
{
  return 193;
}

void *sub_215992B30()
{
  return &unk_21599C658;
}

void *sub_215992B3C()
{
  return &unk_21599C660;
}

uint64_t sub_215992B48()
{
  return 194;
}

void *sub_215992B50()
{
  return &unk_21599C668;
}

uint64_t sub_215992B5C()
{
  return 196;
}

void *sub_215992B64()
{
  return &unk_21599C670;
}

uint64_t sub_215992B70()
{
  return 197;
}

void *sub_215992B78()
{
  return &unk_21599C678;
}

void *sub_215992B84()
{
  return &unk_21599C680;
}

uint64_t sub_215992B90()
{
  return 200;
}

void *sub_215992B98()
{
  return &unk_21599C688;
}

uint64_t sub_215992BA4()
{
  return 201;
}

void *sub_215992BAC()
{
  return &unk_21599C690;
}

uint64_t sub_215992BB8()
{
  return 208;
}

void *sub_215992BC0()
{
  return &unk_21599C698;
}

void *sub_215992BCC()
{
  return &unk_21599C6A0;
}

uint64_t sub_215992BD8()
{
  return 209;
}

void *sub_215992BE0()
{
  return &unk_21599C6A8;
}

void *sub_215992BEC()
{
  return &unk_21599C6B0;
}

uint64_t sub_215992BF8()
{
  return 224;
}

void *sub_215992C00()
{
  return &unk_21599C6B8;
}

uint64_t sub_215992C0C()
{
  return 57137;
}

void *sub_215992C14()
{
  return &unk_21599C6C0;
}

uint64_t sub_215992C20()
{
  return 57139;
}

void *sub_215992C28()
{
  return &unk_21599C6C8;
}

uint64_t sub_215992C34()
{
  return 14647806;
}

void *sub_215992C40()
{
  return &unk_21599C6D0;
}

uint64_t sub_215992C4C()
{
  return 14647807;
}

void *sub_215992C58()
{
  return &unk_21599C6D8;
}

uint64_t sub_215992C64()
{
  return 14647805;
}

void *sub_215992C70()
{
  return &unk_21599C6E0;
}

void *sub_215992C7C()
{
  return &unk_21599C6E8;
}

uint64_t sub_215992C88()
{
  return 195;
}

void *sub_215992C90()
{
  return &unk_21599C6F0;
}

void *sub_215992C9C()
{
  return &unk_21599C6F8;
}

uint64_t sub_215992CA8()
{
  return 203;
}

void *sub_215992CB0()
{
  return &unk_21599C700;
}

uint64_t sub_215992CBC()
{
  return 204;
}

void *sub_215992CC4()
{
  return &unk_21599C708;
}

uint64_t sub_215992CD0()
{
  return 205;
}

void *sub_215992CD8()
{
  return &unk_21599C710;
}

void *sub_215992CE4()
{
  return &unk_21599C718;
}

void *sub_215992CF0()
{
  return &unk_21599C720;
}

void *sub_215992CFC()
{
  return &unk_21599C728;
}

void *sub_215992D08()
{
  return &unk_21599C730;
}

uint64_t sub_215992D14()
{
  return 198;
}

void *sub_215992D1C()
{
  return &unk_21599C738;
}

void *sub_215992D28()
{
  return &unk_21599C740;
}

uint64_t sub_215992D34()
{
  return 210;
}

void *sub_215992D3C()
{
  return &unk_21599C748;
}

uint64_t sub_215992D48()
{
  return 239;
}

void *sub_215992D50()
{
  return &unk_21599C750;
}

void *sub_215992D5C()
{
  return &unk_21599C758;
}

void *sub_215992D68()
{
  return &unk_21599C760;
}

uint64_t sub_215992D74()
{
  return 206;
}

void *sub_215992D7C()
{
  return &unk_21599C768;
}

uint64_t sub_215992D88()
{
  return 192;
}

void *sub_215992D90()
{
  return &unk_21599C770;
}

void *sub_215992D9C()
{
  return &unk_21599C778;
}

void *sub_215992DA8()
{
  return &unk_21599C780;
}

void *sub_215992DB4()
{
  return &unk_21599C788;
}

void *sub_215992DC0()
{
  return &unk_21599C790;
}

void *sub_215992DCC()
{
  return &unk_21599C798;
}

void *sub_215992DD8()
{
  return &unk_21599C7A0;
}

void *sub_215992DE4()
{
  return &unk_21599C7A8;
}

uint64_t sub_215992DF0()
{
  return 15;
}

void *sub_215992DF8()
{
  return &unk_21599C7A9;
}

uint64_t sub_215992E04()
{
  return 240;
}

void *sub_215992E0C()
{
  return &unk_21599C7B0;
}

uint64_t sub_215992E18()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2159886D8();
  if (v1 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    qword_254DEFC20 = result;
    *(_QWORD *)algn_254DEFC28 = v1;
  }
  return result;
}

uint64_t *sub_215992E58()
{
  if (qword_254DEDCB8 != -1)
    swift_once();
  return &qword_254DEFC20;
}

uint64_t sub_215992E98()
{
  uint64_t v0;

  if (qword_254DEDCB8 != -1)
    swift_once();
  v0 = qword_254DEFC20;
  sub_21597B9F4(qword_254DEFC20, *(unint64_t *)algn_254DEFC28);
  return v0;
}

void *sub_215992EF8()
{
  return &unk_21599C7B8;
}

void *sub_215992F04()
{
  return &unk_21599C7C0;
}

void *sub_215992F10()
{
  return &unk_21599C7C8;
}

uint64_t sub_215992F1C()
{
  return 8;
}

void *sub_215992F24()
{
  return &unk_21599C7D0;
}

void *sub_215992F30()
{
  return &unk_21599C7D8;
}

void *sub_215992F3C()
{
  return &unk_21599C7E0;
}

void *sub_215992F48()
{
  return &unk_21599C7E8;
}

void *sub_215992F54()
{
  return &unk_21599C7F0;
}

void *sub_215992F60()
{
  return &unk_21599C7F8;
}

void *sub_215992F6C()
{
  return &unk_21599C800;
}

void *sub_215992F78()
{
  return &unk_21599C808;
}

void *sub_215992F84()
{
  return &unk_21599C810;
}

uint64_t sub_215992F90()
{
  return 63;
}

void *sub_215992F98()
{
  return &unk_21599C811;
}

void *sub_215992FA4()
{
  return &unk_21599C818;
}

void *sub_215992FB0()
{
  return &unk_21599C820;
}

uint64_t sub_215992FBC()
{
  return 7;
}

void *sub_215992FC4()
{
  return &unk_21599C828;
}

void *sub_215992FD0()
{
  return &unk_21599C830;
}

void *sub_215992FDC()
{
  return &unk_21599C838;
}

uint64_t sub_215992FE8()
{
  return 3;
}

void *sub_215992FF4()
{
  return &unk_21599C848;
}

uint64_t sub_215993000()
{
  return 5;
}

void *sub_21599300C()
{
  return &unk_21599C858;
}

void *sub_215993018()
{
  return &unk_21599C860;
}

void *sub_215993024()
{
  return &unk_21599C868;
}

void *sub_215993030()
{
  return &unk_21599C869;
}

void *sub_21599303C()
{
  return &unk_21599C870;
}

uint64_t sub_215993048()
{
  return 32585;
}

void *sub_215993050()
{
  return &unk_21599C878;
}

uint64_t sub_21599305C()
{
  return 176;
}

uint64_t sub_215993064(unint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;

  v2 = 64;
  if ((a2 & 1) != 0)
    v2 = 96;
  if (a1 <= 0x1F)
    return v2 | a1;
  v4 = v2 | 0x1F;
  if (a1 < 0x80)
    return a1 | (v4 << 8);
  do
  {
    v4 = a1 & 0x7F | (v4 << 8) | 0x80;
    v5 = a1 >> 7;
    v6 = a1 >= 0x4000;
    a1 >>= 7;
  }
  while (v6);
  return v5 | (v4 << 8);
}

uint64_t sub_2159930C0(unint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;

  v2 = 128;
  if ((a2 & 1) != 0)
    v2 = 160;
  if (a1 <= 0x1F)
    return v2 | a1;
  v4 = v2 | 0x1F;
  if (a1 < 0x80)
    return a1 | (v4 << 8);
  do
  {
    v4 = a1 & 0x7F | (v4 << 8) | 0x80;
    v5 = a1 >> 7;
    v6 = a1 >= 0x4000;
    a1 >>= 7;
  }
  while (v6);
  return v5 | (v4 << 8);
}

uint64_t sub_21599311C(unint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;

  v2 = 192;
  if ((a2 & 1) != 0)
    v2 = 224;
  if (a1 <= 0x1F)
    return v2 | a1;
  v4 = v2 | 0x1F;
  if (a1 < 0x80)
    return a1 | (v4 << 8);
  do
  {
    v4 = a1 & 0x7F | (v4 << 8) | 0x80;
    v5 = a1 >> 7;
    v6 = a1 >= 0x4000;
    a1 >>= 7;
  }
  while (v6);
  return v5 | (v4 << 8);
}

uint64_t sub_215993178()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_21597BA38(&qword_254DEDDA0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_21599BEA0;
  v3 = MEMORY[0x24BEE1ED8];
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE1E88];
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(v2 + 32) = v1;
  return sub_215998E54();
}

ValueMetadata *type metadata accessor for TLVTag()
{
  return &type metadata for TLVTag;
}

uint64_t sub_2159931F0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  void (*v11)(_QWORD *, _QWORD, unint64_t, uint64_t, uint64_t);
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v20[2];
  unint64_t v21;

  result = sub_215993470(a1[2], a2, a3);
  if (!v3)
  {
    v8 = sub_21598A3F0();
    sub_215993554(v8, a2, a3);
    v10 = a1[3];
    v9 = a1[4];
    if ((v9 & 0x2000000000000000) == 0)
    {
      v20[0] = a1[3];
      v20[1] = v9;
      v11 = *(void (**)(_QWORD *, _QWORD, unint64_t, uint64_t, uint64_t))(a3 + 16);
      sub_21597B9F4(v10, v9);
      v12 = sub_215993694();
      v11(v20, MEMORY[0x24BDCDDE8], v12, a2, a3);
      goto LABEL_16;
    }
    if (v10 >> 62)
      goto LABEL_15;
    v13 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v13; v13 = sub_215999190())
    {
      v18 = v9;
      v19 = v10;
      v21 = v10 & 0xC000000000000001;
      for (i = 4; ; ++i)
      {
        v15 = i - 4;
        if (!v21)
          break;
        v10 = MEMORY[0x2199E9320](i - 4, v10);
        v9 = i - 3;
        if (__OFADD__(v15, 1))
          goto LABEL_14;
LABEL_12:
        sub_2159931F0(v10, a2, a3);
        swift_release();
        v10 = v19;
        if (v9 == v13)
        {
          v16 = v19;
          v17 = v18;
          return sub_21598A6D4(v16, v17);
        }
      }
      v10 = *(_QWORD *)(v10 + 8 * i);
      swift_retain();
      v9 = i - 3;
      if (!__OFADD__(v15, 1))
        goto LABEL_12;
LABEL_14:
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
    }
LABEL_16:
    v16 = v10;
    v17 = v9;
    return sub_21598A6D4(v16, v17);
  }
  return result;
}

uint64_t sub_2159933B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = swift_allocObject();
  if (a1)
  {
    if (a1 <= 14)
    {
      v4 = 0;
      v5 = 0;
    }
    else
    {
      sub_215998BB4();
      swift_allocObject();
      v3 = sub_215998BA8();
      if ((unint64_t)a1 > 0x7FFFFFFE)
      {
        sub_215998C68();
        v4 = swift_allocObject();
        v5 = v3 | 0x8000000000000000;
        *(_QWORD *)(v4 + 16) = 0;
        *(_QWORD *)(v4 + 24) = 0;
      }
      else
      {
        v4 = 0;
        v5 = v3 | 0x4000000000000000;
      }
    }
  }
  else
  {
    v4 = 0;
    v5 = 0xC000000000000000;
  }
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)(v2 + 24) = v5;
  return v2;
}

uint64_t sub_215993470(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v7)(unint64_t *, _QWORD, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v11 = bswap64(a1);
    return sub_2159936D8((uint64_t)&v11, (uint64_t)&v12, v3, __clz(a1) >> 3, a2, a3, &v10);
  }
  else
  {
    LOBYTE(v11) = 0;
    v7 = *(uint64_t (**)(unint64_t *, _QWORD, unint64_t, unint64_t, uint64_t, uint64_t))(a3 + 8);
    v8 = sub_2159903EC();
    v9 = sub_215990430();
    return v7(&v11, MEMORY[0x24BEE4260], v8, v9, a2, a3);
  }
}

uint64_t sub_215993554(int64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v8)(unint64_t *, _QWORD, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v9;
  unint64_t v10;
  uint64_t result;
  unint64_t v12;
  uint64_t (*v13)(unint64_t *, _QWORD, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a1 > 127)
  {
    v12 = __clz(a1) >> 3;
    LOBYTE(v17) = -120 - v12;
    v13 = *(uint64_t (**)(unint64_t *, _QWORD, unint64_t, unint64_t, uint64_t, uint64_t))(a3 + 8);
    v14 = sub_2159903EC();
    v15 = sub_215990430();
    result = v13(&v17, MEMORY[0x24BEE4260], v14, v15, a2, a3);
    if (!v4)
    {
      v17 = bswap64(a1);
      return sub_2159936D8((uint64_t)&v17, (uint64_t)&v18, v3, v12, a2, a3, &v16);
    }
  }
  else
  {
    if (a1 < 0)
      __break(1u);
    LOBYTE(v17) = a1;
    v8 = *(uint64_t (**)(unint64_t *, _QWORD, unint64_t, unint64_t, uint64_t, uint64_t))(a3 + 8);
    v9 = sub_2159903EC();
    v10 = sub_215990430();
    return v8(&v17, MEMORY[0x24BEE4260], v9, v10, a2, a3);
  }
  return result;
}

unint64_t sub_215993694()
{
  unint64_t result;

  result = qword_254DEDE08;
  if (!qword_254DEDE08)
  {
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254DEDE08);
  }
  return result;
}

uint64_t sub_2159936D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *, uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  _QWORD v18[4];

  v18[0] = sub_215991764(a4, a1, a2);
  v18[1] = v11;
  v18[2] = v12;
  v18[3] = v13;
  v14 = *(uint64_t (**)(_QWORD *, uint64_t, unint64_t, uint64_t, uint64_t))(a6 + 16);
  v15 = sub_21597BA38(&qword_254DEDDC8);
  v16 = sub_21599451C();
  result = v14(v18, v15, v16, a5, a6);
  if (v7)
    *a7 = v7;
  return result;
}

id sub_21599377C(uint64_t a1, uint64_t a2)
{
  void *v2;
  __n128 v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  __n128 v9;
  __n128 v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  id result;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[16];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  sub_215998B0C();
  MEMORY[0x24BDAC7A8](v4, v5);
  v18 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_215998B18();
  v19 = *(_QWORD *)(v7 - 8);
  v10.n128_f64[0] = MEMORY[0x24BDAC7A8](v8, v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a2 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v10, v15);
  sub_215999178();
  v22 = v2;
  sub_215990AE8((uint64_t)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)sub_215993FB8, (uint64_t)v21, a2, MEMORY[0x24BEE4078], MEMORY[0x24BEE1768], MEMORY[0x24BEE40A8], v16);
  result = (id)(*(uint64_t (**)(char *, uint64_t))(v13 + 8))((char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  if (v20 < 0)
  {
    result = objc_msgSend(v2, sel_streamError);
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    if (v20 == v14)
      return result;
    sub_215998B00();
    sub_21597D364(MEMORY[0x24BEE4AF8]);
    sub_215994408();
    sub_215998C20();
    sub_215998AF4();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v12, v7);
  }
  return (id)swift_willThrow();
}

char *sub_21599399C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 v5;
  __n128 v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  __n128 v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  __n128 v14;
  __n128 v15;
  uint64_t v16;
  char *v17;
  __n128 v18;
  __n128 v19;
  uint64_t v20;
  char *v21;
  __n128 v22;
  __n128 v23;
  uint64_t v24;
  __n128 v25;
  __n128 v26;
  uint64_t v27;
  char *v28;
  char *v29;
  __n128 v30;
  __n128 v31;
  uint64_t v32;
  BOOL v33;
  char *result;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v42 = a1;
  sub_215998B0C();
  MEMORY[0x24BDAC7A8](v5, v6);
  v37[1] = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_215998B18();
  v38 = *(_QWORD *)(v8 - 8);
  v39 = v8;
  MEMORY[0x24BDAC7A8](v9, v10);
  v37[0] = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = a3;
  v47 = a2;
  swift_getAssociatedTypeWitness();
  v45 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedConformanceWitness() + 8) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v14, v15);
  v17 = (char *)v37 - v16;
  sub_215999058();
  MEMORY[0x24BDAC7A8](v18, v19);
  v21 = (char *)v37 - v20;
  v41 = swift_checkMetadataState();
  MEMORY[0x24BDAC7A8](v22, v23);
  v24 = swift_getAssociatedTypeWitness();
  v40 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v25, v26);
  v28 = (char *)v37 - v27;
  sub_215998B54();
  v44 = v28;
  sub_215998F5C();
  v45 = v24;
  swift_getAssociatedConformanceWitness();
  v29 = 0;
  while (1)
  {
    sub_21599907C();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v21, 1, AssociatedTypeWitness) == 1)
      goto LABEL_7;
    v30.n128_f64[0] = (*(double (**)(char *, char *, uint64_t))(v13 + 32))(v17, v21, AssociatedTypeWitness);
    MEMORY[0x24BDAC7A8](v30, v31);
    v37[-2] = v43;
    swift_getAssociatedConformanceWitness();
    sub_215998BC0();
    v32 = v48;
    if (v48 < 0)
      break;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, AssociatedTypeWitness);
    v33 = __OFADD__(v29, v32);
    v29 += v32;
    if (v33)
    {
      __break(1u);
LABEL_7:
      (*(void (**)(char *, uint64_t))(v40 + 8))(v44, v45);
      result = (char *)sub_215998FEC();
      if (v29 != result)
      {
        sub_215998B00();
        sub_21597D364(MEMORY[0x24BEE4AF8]);
        sub_215994408();
        v35 = v37[0];
        v36 = v39;
        sub_215998C20();
        sub_215998AF4();
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v35, v36);
        return (char *)swift_willThrow();
      }
      return result;
    }
  }
  result = (char *)objc_msgSend(v43, sel_streamError);
  if (result)
  {
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, AssociatedTypeWitness);
    return (char *)(*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v44, v45);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_215993DE4@<X0>(id a1@<X2>, id result@<X0>, uint64_t a3@<X1>, _QWORD *a4@<X8>)
{
  if (result)
  {
    result = objc_msgSend(a1, sel_write_maxLength_, result, a3 - (_QWORD)result);
    *a4 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_215993E30(uint64_t a1, uint64_t a2)
{
  return sub_21599377C(a1, a2);
}

char *sub_215993E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21599399C(a1, a2, a3);
}

uint64_t sub_215993E58(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  sub_21597B9F4(v2, v3);
  return sub_21597AD00(v5, v6);
}

uint64_t sub_215993EC4()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  sub_21597B9F4(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t sub_215993F10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = v1;
  if (a1)
  {
    v3 = a1;
    if (a1 <= 14)
    {
      a1 = 0;
      v5 = 0;
    }
    else
    {
      sub_215998BB4();
      swift_allocObject();
      v4 = sub_215998BA8();
      if (v3 > 0x7FFFFFFE)
      {
        sub_215998C68();
        a1 = swift_allocObject();
        v5 = v4 | 0x8000000000000000;
        *(_QWORD *)(a1 + 16) = 0;
        *(_QWORD *)(a1 + 24) = 0;
      }
      else
      {
        a1 = 0;
        v5 = v4 | 0x4000000000000000;
      }
    }
  }
  else
  {
    v5 = 0xC000000000000000;
  }
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v5;
  return v2;
}

id sub_215993FB8@<X0>(id result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  if (result)
  {
    result = objc_msgSend(*(id *)(v3 + 16), sel_write_maxLength_, result, a2 - (_QWORD)result);
    *a3 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_215994000(__n128 a1, __n128 a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215999178();
  sub_215990AE8((uint64_t)v8, (uint64_t)sub_215994450, v4, a4, MEMORY[0x24BEE4078], MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE40A8], v9);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a4);
}

uint64_t sub_2159940F8(uint64_t a1, uint64_t a2)
{
  _QWORD v5[5];

  swift_beginAccess();
  v5[3] = MEMORY[0x24BEE0F88];
  v5[4] = MEMORY[0x24BDCFB90];
  v5[0] = a1;
  v5[1] = a2;
  sub_215987AE8(v5, MEMORY[0x24BEE0F88]);
  sub_215998C8C();
  sub_21597C068((uint64_t)v5);
  return swift_endAccess();
}

uint64_t sub_215994188()
{
  swift_beginAccess();
  sub_215998CEC();
  return swift_endAccess();
}

uint64_t sub_215994208()
{
  uint64_t v0;

  sub_21597AD00(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return v0;
}

uint64_t sub_215994224()
{
  uint64_t v0;

  sub_21597AD00(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance();
}

uint64_t sub_215994248(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4)
{
  return sub_215994000(a3, a4, a1, a2);
}

uint64_t sub_21599425C()
{
  return sub_215994188();
}

uint64_t sub_215994270(__n128 a1, __n128 a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215999178();
  v14 = v4;
  v9 = sub_21597BA38(&qword_254DEDE10);
  sub_215990AE8((uint64_t)v8, (uint64_t)sub_21599446C, (uint64_t)v13, a4, v9, MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE3F20], (uint64_t)&v12);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a4);
}

uint64_t sub_215994380(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t result;

  sub_21599020C();
  result = sub_215999004();
  if (v4)
    *a4 = v4;
  return result;
}

uint64_t sub_2159943E0(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4)
{
  return sub_215994270(a3, a4, a1, a2);
}

uint64_t sub_2159943F4()
{
  return sub_215999004();
}

unint64_t sub_215994408()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DEDDD8;
  if (!qword_254DEDDD8)
  {
    v1 = sub_215998B18();
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BDCAEE0], v1);
    atomic_store(result, (unint64_t *)&qword_254DEDDD8);
  }
  return result;
}

uint64_t sub_215994450(uint64_t a1, uint64_t a2)
{
  return sub_2159940F8(a1, a2);
}

uint64_t sub_21599446C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  return sub_215994380(a1, a2, *(_QWORD *)(v3 + 16), a3);
}

uint64_t sub_215994488@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  *a2 = v4;
  a2[1] = v5;
  return sub_21597B9F4(v4, v5);
}

uint64_t type metadata accessor for DERMemoryWriter()
{
  return objc_opt_self();
}

uint64_t sub_2159944F4()
{
  return sub_215998C8C();
}

unint64_t sub_21599451C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_254DEDE18[0];
  if (!qword_254DEDE18[0])
  {
    v1 = sub_21597E450(&qword_254DEDDC8);
    v2 = sub_21599020C();
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BDD0788], v1, &v2);
    atomic_store(result, qword_254DEDE18);
  }
  return result;
}

uint64_t sub_215994580@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  uint64_t v14;
  char *v15;
  __n128 v16;
  double v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v22;

  v8 = *(_QWORD *)(a3 + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13.n128_f64[0] = MEMORY[0x24BDAC7A8](v11, v12);
  v15 = (char *)&v22 - v14;
  v17 = MEMORY[0x24BDAC7A8](v13, v16);
  v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v20 + 16))(v19, v4, a2, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v15, a1, AssociatedTypeWitness);
  return sub_215994A24((uint64_t)v19, (uint64_t)v15, a2, v8, a4);
}

uint64_t sub_215994684@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v16 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = sub_215999058();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v15 - v9;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_21599907C();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, AssociatedTypeWitness) == 1)
  {
    v12 = v2 + *(int *)(a1 + 36);
    v13 = v16;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v16, v12, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }
  else
  {
    v13 = v16;
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v16, v10, AssociatedTypeWitness);
  }
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, AssociatedTypeWitness);
}

uint64_t sub_2159947FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a5, a1, AssociatedTypeWitness);
  v12 = a5 + *(int *)(type metadata accessor for LazyPaddedSequence.Iterator(0, a3, a4, v11) + 36);
  v13 = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12, a2, v13);
}

uint64_t sub_2159948BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  __n128 v9;
  __n128 v10;
  __n128 v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  char *v17;
  __n128 v18;
  __n128 v19;
  double v20;
  uint64_t v21;
  char *v22;
  uint64_t v24;
  uint64_t v25;

  v3 = v2;
  v25 = a2;
  v6 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11.n128_f64[0] = MEMORY[0x24BDAC7A8](v9, v10);
  v13 = (char *)&v24 - v12;
  v14 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v11, v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  v20 = MEMORY[0x24BDAC7A8](v18, v19);
  v22 = (char *)&v24 - v21;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v14 + 16))(v17, v3, v6, v20);
  sub_215998F5C();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, v3 + *(int *)(a1 + 36), AssociatedTypeWitness);
  return sub_2159947FC((uint64_t)v22, (uint64_t)v13, v6, v5, v25);
}

uint64_t sub_215994A24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(a5, a1);
  v10 = a5 + *(int *)(type metadata accessor for LazyPaddedSequence(0, a3, a4, v9) + 36);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(v10, a2, AssociatedTypeWitness);
}

void sub_215994AB4()
{
  JUMPOUT(0x2199E9BE4);
}

void sub_215994AC8()
{
  JUMPOUT(0x2199E9BE4);
}

uint64_t sub_215994AD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_2159948BC(a1, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v2, a1);
}

uint64_t sub_215994B08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = sub_215995DA4(v2, a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v2, a1);
  return v4;
}

uint64_t sub_215994B5C()
{
  return sub_215998F74();
}

uint64_t sub_215994B7C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_215994B84()
{
  uint64_t AssociatedTypeWitness;
  unint64_t v1;
  unint64_t v2;

  AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return AssociatedTypeWitness;
}

uint64_t *sub_215994C2C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v7 + v10;
  v12 = (*(_BYTE *)(v6 + 80) | *(_BYTE *)(v9 + 80));
  if (v12 > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0
    || (v11 & (unint64_t)~v10) + *(_QWORD *)(v9 + 64) > 0x18)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v12 + 16) & ~v12));
    swift_retain();
  }
  else
  {
    v16 = AssociatedTypeWitness;
    v17 = ~v10;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v11) & v17, ((unint64_t)a2 + v11) & v17, v16);
  }
  return a1;
}

uint64_t sub_215994D20(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(uint64_t, _QWORD))(v3 + 8))(a1, *(_QWORD *)(a2 + 16));
  v4 = *(_QWORD *)(v3 + 64) + a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))((v4 + *(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80), AssociatedTypeWitness);
}

uint64_t sub_215994D9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(a1, a2, *(_QWORD *)(a3 + 16));
  v6 = *(_QWORD *)(v5 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_215994E34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 24))(a1, a2, *(_QWORD *)(a3 + 16));
  v6 = *(_QWORD *)(v5 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_215994ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 32))(a1, a2, *(_QWORD *)(a3 + 16));
  v6 = *(_QWORD *)(v5 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_215994F64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 40))(a1, a2, *(_QWORD *)(a3 + 16));
  v6 = *(_QWORD *)(v5 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_215994FFC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v7)
    v11 = v7;
  else
    v11 = *(_DWORD *)(v9 + 84);
  if (!a2)
    return 0;
  v12 = *(unsigned __int8 *)(v9 + 80);
  v13 = *(_QWORD *)(v6 + 64) + v12;
  if (a2 <= v11)
    goto LABEL_23;
  v14 = (v13 & ~v12) + *(_QWORD *)(v9 + 64);
  v15 = 8 * v14;
  if (v14 <= 3)
  {
    v17 = ((a2 - v11 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      v16 = *(_DWORD *)(a1 + v14);
      if (!v16)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      v16 = *(unsigned __int16 *)(a1 + v14);
      if (!*(_WORD *)(a1 + v14))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_23:
      if (v11)
      {
        if (v7 >= v10)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, v7, v5);
        else
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))((v13 + a1) & ~v12, v10, AssociatedTypeWitness);
      }
      return 0;
    }
  }
  v16 = *(unsigned __int8 *)(a1 + v14);
  if (!*(_BYTE *)(a1 + v14))
    goto LABEL_23;
LABEL_14:
  v18 = (v16 - 1) << v15;
  if (v14 > 3)
    v18 = 0;
  if ((_DWORD)v14)
  {
    if (v14 <= 3)
      v19 = v14;
    else
      v19 = 4;
    __asm { BR              X12 }
  }
  return v11 + v18 + 1;
}

void sub_2159951A8(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  size_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v9 + 84) <= v8)
    v10 = v8;
  else
    v10 = *(_DWORD *)(v9 + 84);
  v11 = ((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
      + *(_QWORD *)(v9 + 64);
  if (a3 <= v10)
  {
    v12 = 0;
  }
  else if (v11 <= 3)
  {
    v14 = ((a3 - v10 + ~(-1 << (8 * v11))) >> (8 * v11)) + 1;
    if (HIWORD(v14))
    {
      v12 = 4u;
    }
    else if (v14 >= 0x100)
    {
      v12 = 2;
    }
    else
    {
      v12 = v14 > 1;
    }
  }
  else
  {
    v12 = 1u;
  }
  if (v10 < a2)
  {
    v13 = ~v10 + a2;
    if (v11 < 4)
    {
      if ((_DWORD)v11)
      {
        v15 = v13 & ~(-1 << (8 * v11));
        bzero(a1, v11);
        if ((_DWORD)v11 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if ((_DWORD)v11 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t type metadata accessor for LazyPaddedSequence(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_215995DA8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyPaddedSequence);
}

uint64_t sub_2159953E4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_2159954A4(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v10 = v6 + v9;
  v11 = (*(_BYTE *)(v5 + 80) | *(_BYTE *)(v8 + 80));
  if (v11 > 7
    || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || ((v6 + v9) & (unint64_t)~v9) + *(_QWORD *)(v8 + 64) > 0x18)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v11 + 16) & ~v11));
    swift_retain();
  }
  else
  {
    v15 = v7;
    v16 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v10) & v16, ((unint64_t)a2 + v10) & v16, v15);
  }
  return a1;
}

uint64_t sub_2159955C0(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
  v4 = *(_QWORD *)(v3 + 64) + a1;
  v5 = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))((v4 + *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80), v5);
}

uint64_t sub_215995664(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_215995720(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_2159957DC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_215995898(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_215995954(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= v6)
    v10 = v6;
  else
    v10 = *(_DWORD *)(v8 + 84);
  if (!a2)
    return 0;
  v11 = *(unsigned __int8 *)(v8 + 80);
  v12 = *(_QWORD *)(v5 + 64) + v11;
  if (a2 <= v10)
    goto LABEL_23;
  v13 = (v12 & ~v11) + *(_QWORD *)(v8 + 64);
  v14 = 8 * v13;
  if (v13 <= 3)
  {
    v16 = ((a2 - v10 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v16))
    {
      v15 = *(_DWORD *)(a1 + v13);
      if (!v15)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v16 > 0xFF)
    {
      v15 = *(unsigned __int16 *)(a1 + v13);
      if (!*(_WORD *)(a1 + v13))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v16 < 2)
    {
LABEL_23:
      if (v10)
      {
        if (v6 >= v9)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, v6, AssociatedTypeWitness);
        else
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))((v12 + a1) & ~v11, v9, v7);
      }
      return 0;
    }
  }
  v15 = *(unsigned __int8 *)(a1 + v13);
  if (!*(_BYTE *)(a1 + v13))
    goto LABEL_23;
LABEL_14:
  v17 = (v15 - 1) << v14;
  if (v13 > 3)
    v17 = 0;
  if ((_DWORD)v13)
  {
    if (v13 <= 3)
      v18 = v13;
    else
      v18 = 4;
    __asm { BR              X12 }
  }
  return v10 + v17 + 1;
}

void sub_215995B34(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  size_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v8 + 84) <= v7)
    v9 = v7;
  else
    v9 = *(_DWORD *)(v8 + 84);
  v10 = ((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
      + *(_QWORD *)(v8 + 64);
  if (a3 <= v9)
  {
    v11 = 0;
  }
  else if (v10 <= 3)
  {
    v13 = ((a3 - v9 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v13))
    {
      v11 = 4u;
    }
    else if (v13 >= 0x100)
    {
      v11 = 2;
    }
    else
    {
      v11 = v13 > 1;
    }
  }
  else
  {
    v11 = 1u;
  }
  if (v9 < a2)
  {
    v12 = ~v9 + a2;
    if (v10 < 4)
    {
      if ((_DWORD)v10)
      {
        v14 = v12 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if ((_DWORD)v10 == 3)
        {
          *(_WORD *)a1 = v14;
          a1[2] = BYTE2(v14);
        }
        else if ((_DWORD)v10 == 2)
        {
          *(_WORD *)a1 = v14;
        }
        else
        {
          *a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t type metadata accessor for LazyPaddedSequence.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_215995DA8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyPaddedSequence.Iterator);
}

uint64_t sub_215995DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199E9BA8](a1, v6, a5);
}

void sub_215995DD4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(uint64_t);
  __n128 v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;

  sub_215998DAC();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8];
  MEMORY[0x24BDAC7A8](v4, v5);
  sub_215998DA0();
  MEMORY[0x24BDAC7A8](v6, v7);
  sub_21597A388(&qword_254DEDDB8, v3, MEMORY[0x24BDC6AE8]);
  sub_215998D94();
  __asm { BR              X10 }
}

uint64_t sub_215995ED8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  *(_QWORD *)(v7 - 128) = v5;
  *(_WORD *)(v7 - 120) = v4;
  *(_BYTE *)(v7 - 118) = BYTE2(v4);
  *(_BYTE *)(v7 - 117) = BYTE3(v4);
  *(_BYTE *)(v7 - 116) = BYTE4(v4);
  *(_BYTE *)(v7 - 115) = BYTE5(v4);
  sub_215998D7C();
  sub_21597AD00(v5, v4);
  sub_215998D88();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 160) + 8))(v3, v2);
  *(_QWORD *)(v7 - 104) = v0;
  *(_QWORD *)(v7 - 96) = sub_21597A388(&qword_254DEDF20, (uint64_t (*)(uint64_t))MEMORY[0x24BDC62F0], MEMORY[0x24BDC62D8]);
  v8 = sub_21599676C((uint64_t *)(v7 - 128));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(v8, v1, v0);
  sub_215987AE8((_QWORD *)(v7 - 128), *(_QWORD *)(v7 - 104));
  sub_215998BC0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v0);
  v9 = *(_QWORD *)(v7 - 144);
  sub_21597C068(v7 - 128);
  return v9;
}

void sub_215996138()
{
  __asm { BR              X12 }
}

void sub_215996194()
{
  uint64_t v0;

  if (BYTE6(v0))
    __asm { BR              X12 }
}

uint64_t sub_215996648(size_t a1)
{
  size_t v1;
  uint64_t v2;
  uint64_t v3;

  if ((a1 & 0x8000000000000000) == 0)
  {
    v1 = a1;
    if (a1)
    {
      v2 = sub_215998FD4();
      *(_QWORD *)(v2 + 16) = v1;
      bzero((void *)(v2 + 32), v1);
    }
    else
    {
      v2 = MEMORY[0x24BEE4AF8];
      v1 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    }
    if (!SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], v1, (void *)(v2 + 32)))
    {
      v3 = sub_2159877F0(v2);
      swift_bridgeObjectRelease();
      return v3;
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

_BYTE *sub_2159966F8@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_2159967A8(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_215996868((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_2159968E0((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t *sub_21599676C(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_2159967A8(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_215996868(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_215998BB4();
  swift_allocObject();
  result = sub_215998B6C();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_215998C68();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_2159968E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_215998BB4();
  swift_allocObject();
  result = sub_215998B6C();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_215996960(uint64_t a1, unint64_t a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  uint64_t v19;
  unint64_t v20;

  v19 = 46;
  v20 = 0xE100000000000000;
  v18[2] = &v19;
  swift_bridgeObjectRetain();
  v4 = sub_215996AA8(0x7FFFFFFFFFFFFFFFLL, 1, sub_215997020, (uint64_t)v18, a1, a2);
  v5 = v4;
  if (*((_QWORD *)v4 + 2) != 3)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return a1;
  }
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v8 = *((_QWORD *)v4 + 6);
  v9 = *((_QWORD *)v4 + 7);
  swift_bridgeObjectRetain();
  v10 = MEMORY[0x2199E9080](v6, v7, v8, v9);
  v12 = v11;
  swift_bridgeObjectRelease();
  v19 = v10;
  v20 = v12;
  result = sub_215998ED8();
  if (*((_QWORD *)v5 + 2) >= 2uLL)
  {
    v14 = *((_QWORD *)v5 + 8);
    v15 = *((_QWORD *)v5 + 9);
    v16 = *((_QWORD *)v5 + 10);
    v17 = *((_QWORD *)v5 + 11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    MEMORY[0x2199E9080](v14, v15, v16, v17);
    sub_215998ED8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v19;
  }
  __break(1u);
  return result;
}

char *sub_215996AA8(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  unint64_t v44;
  _QWORD v46[4];

  v46[3] = a4;
  if (a1 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v11 = a5;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = MEMORY[0x24BEE4AF8];
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = 15;
  v15 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v16 = HIBYTE(a6) & 0xF) : (v16 = v11 & 0xFFFFFFFFFFFFLL), !v16))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v15 = v11 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((v11 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_215996EC0(v30 | (v15 << 16), v43, a2 & 1, v14);
    swift_bridgeObjectRelease();
    v10 = *(char **)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_38;
  }
  v38 = a1;
  v39 = v14;
  v44 = 4 * v16;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v9 = 15;
  v8 = 15;
  v17 = 15;
  while (1)
  {
    v46[0] = sub_215998F38();
    v46[1] = v18;
    v19 = a3(v46);
    if (v7)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    v6 = v19;
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      break;
    v9 = sub_215998EC0();
LABEL_9:
    if (v44 == v9 >> 14)
      goto LABEL_29;
  }
  if (v8 >> 14 == v9 >> 14 && (a2 & 1) != 0)
  {
    v9 = sub_215998EC0();
    *(_QWORD *)(v43 + 16) = v9;
    v8 = v9;
    v17 = v9;
    goto LABEL_9;
  }
  if (v9 >> 14 < v8 >> 14)
  {
    __break(1u);
    goto LABEL_41;
  }
  v20 = sub_215998F50();
  v40 = v21;
  v41 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v10 = sub_215988544(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
  v27 = *((_QWORD *)v10 + 2);
  v26 = *((_QWORD *)v10 + 3);
  v6 = v27 + 1;
  if (v27 >= v26 >> 1)
    v10 = sub_215988544((char *)(v26 > 1), v27 + 1, 1, v10);
  *((_QWORD *)v10 + 2) = v6;
  v28 = &v10[32 * v27];
  *((_QWORD *)v28 + 4) = v41;
  *((_QWORD *)v28 + 5) = v23;
  *((_QWORD *)v28 + 6) = v25;
  *((_QWORD *)v28 + 7) = v40;
  *(_QWORD *)(v39 + 16) = v10;
  v29 = sub_215998EC0();
  v9 = v29;
  *(_QWORD *)(v43 + 16) = v29;
  if (*((_QWORD *)v10 + 2) != v38)
  {
    v8 = v29;
    v17 = v29;
    goto LABEL_9;
  }
  v17 = v29;
  v8 = v29;
LABEL_29:
  if (v44 == v8 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v44 >= v17 >> 14)
  {
    v6 = sub_215998F50();
    v8 = v31;
    v9 = v32;
    v11 = v33;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      goto LABEL_43;
    goto LABEL_34;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  v10 = sub_215988544(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
LABEL_34:
  v35 = *((_QWORD *)v10 + 2);
  v34 = *((_QWORD *)v10 + 3);
  if (v35 >= v34 >> 1)
    v10 = sub_215988544((char *)(v34 > 1), v35 + 1, 1, v10);
  *((_QWORD *)v10 + 2) = v35 + 1;
  v36 = &v10[32 * v35];
  *((_QWORD *)v36 + 4) = v6;
  *((_QWORD *)v36 + 5) = v8;
  *((_QWORD *)v36 + 6) = v9;
  *((_QWORD *)v36 + 7) = v11;
  *(_QWORD *)(v39 + 16) = v10;
LABEL_37:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_38:
  swift_release();
  return v10;
}

uint64_t sub_215996EC0(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  char *v18;

  v10 = *(_QWORD *)(a2 + 16) >> 14;
  v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1)
    return v11 ^ 1u;
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = a4;
  v5 = sub_215998F50();
  v6 = v12;
  v7 = v13;
  v8 = v14;
  v9 = *(char **)(v4 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    v9 = sub_215988544(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    *(_QWORD *)(v4 + 16) = v9;
  }
  v17 = *((_QWORD *)v9 + 2);
  v16 = *((_QWORD *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    v9 = sub_215988544((char *)(v16 > 1), v17 + 1, 1, v9);
    *(_QWORD *)(v4 + 16) = v9;
  }
  *((_QWORD *)v9 + 2) = v17 + 1;
  v18 = &v9[32 * v17];
  *((_QWORD *)v18 + 4) = v5;
  *((_QWORD *)v18 + 5) = v6;
  *((_QWORD *)v18 + 6) = v7;
  *((_QWORD *)v18 + 7) = v8;
  return v11 ^ 1u;
}

uint64_t sub_215996FCC(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_215999208() & 1;
}

uint64_t sub_215997020(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_215999208() & 1;
}

uint64_t sub_215997074()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_215997098()
{
  return swift_deallocObject();
}

uint64_t sub_2159970A8(_QWORD *a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  sub_21597BA38(&qword_254DEDBC0);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_21599BEA0;
  v3 = a1[2];
  if (!v3)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v5 = a1 + 4;
  v4 = a1[4];
  if (!is_mul_ok(v4, 0x28uLL))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v3 < 2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v6 = 40 * v4;
  v7 = a1[5];
  v8 = __CFADD__(v6, v7);
  v9 = v6 + v7;
  if (v8)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v9 <= 0xFF)
  {
    *(_BYTE *)(result + 32) = v9;
    v10 = sub_2159877F0(result);
    v12 = v11;
    swift_bridgeObjectRelease();
    if (v3 < 3)
      return v10;
    v13 = 2;
    swift_bridgeObjectRetain_n();
    result = sub_21597B9F4(v10, v12);
    v14 = (char *)MEMORY[0x24BEE4AF8];
    while (v13 < v3)
    {
      v15 = v5[v13];
      v16 = sub_21598835C(0, 1, 1, v14);
      v18 = *((_QWORD *)v16 + 2);
      v17 = *((_QWORD *)v16 + 3);
      if (v18 >= v17 >> 1)
        v16 = sub_21598835C((char *)(v17 > 1), v18 + 1, 1, v16);
      *((_QWORD *)v16 + 2) = v18 + 1;
      v16[v18 + 32] = v15 & 0x7F;
      if (v15 >= 0x80)
      {
        v19 = v18 + 33;
        do
        {
          v20 = *((_QWORD *)v16 + 3);
          if (v19 - 32 >= v20 >> 1)
            v16 = sub_21598835C((char *)(v20 > 1), v19 - 31, 1, v16);
          v21 = v15 >> 14;
          v15 >>= 7;
          *((_QWORD *)v16 + 2) = v19 - 31;
          v16[v19++] = v15 | 0x80;
        }
        while (v21);
      }
      ++v13;
      sub_215986AA8();
      result = swift_bridgeObjectRelease();
      if (v13 == v3)
      {
        swift_bridgeObjectRelease();
        sub_21597AD00(v10, v12);
        swift_bridgeObjectRelease();
        return v10;
      }
    }
    __break(1u);
    goto LABEL_21;
  }
LABEL_25:
  __break(1u);
  return result;
}

char *sub_2159972D8(uint64_t a1, unint64_t a2)
{
  char *v4;
  uint64_t v5;
  unint64_t *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  _QWORD v21[4];
  char v22;
  uint64_t v23;
  uint64_t v24;

  v23 = 46;
  v24 = 0xE100000000000000;
  v21[2] = &v23;
  swift_bridgeObjectRetain();
  v4 = sub_215996AA8(0x7FFFFFFFFFFFFFFFLL, 0, sub_21599827C, (uint64_t)v21, a1, a2);
  swift_bridgeObjectRelease();
  v5 = *((_QWORD *)v4 + 2);
  if (v5)
  {
    swift_bridgeObjectRetain();
    v6 = (unint64_t *)(v4 + 56);
    v7 = (char *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      v9 = *(v6 - 3);
      v8 = *(v6 - 2);
      if ((v8 ^ v9) >= 0x4000)
      {
        v11 = *(v6 - 1);
        v10 = *v6;
        if ((*v6 & 0x1000000000000000) != 0)
        {
          swift_bridgeObjectRetain();
          v13 = (uint64_t)sub_2159977D0(v9, v8, v11, v10, 10);
          v18 = v17;
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
            goto LABEL_12;
        }
        else
        {
          if ((v10 & 0x2000000000000000) != 0)
          {
            v23 = *(v6 - 1);
            v24 = v10 & 0xFFFFFFFFFFFFFFLL;
            v12 = &v23;
          }
          else if ((v11 & 0x1000000000000000) != 0)
          {
            v12 = (uint64_t *)((v10 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else
          {
            v12 = (uint64_t *)sub_215999130();
          }
          v13 = sub_215998298((uint64_t)v12, v9, v8, v11, v10, 10);
          v22 = v14 & 1;
          if ((v14 & 1) == 0)
          {
LABEL_12:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v7 = sub_215988444(0, *((_QWORD *)v7 + 2) + 1, 1, v7);
            v16 = *((_QWORD *)v7 + 2);
            v15 = *((_QWORD *)v7 + 3);
            if (v16 >= v15 >> 1)
              v7 = sub_215988444((char *)(v15 > 1), v16 + 1, 1, v7);
            *((_QWORD *)v7 + 2) = v16 + 1;
            *(_QWORD *)&v7[8 * v16 + 32] = v13;
          }
        }
      }
      v6 += 4;
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        v19 = *((_QWORD *)v4 + 2);
        goto LABEL_21;
      }
    }
  }
  v19 = 0;
  v7 = (char *)MEMORY[0x24BEE4AF8];
LABEL_21:
  swift_bridgeObjectRelease();
  if (v19 != *((_QWORD *)v7 + 2))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v7;
}

void sub_2159974EC()
{
  qword_254DEFC30 = (uint64_t)&unk_24D3CC588;
}

uint64_t *sub_215997500()
{
  if (qword_254DEDCC0 != -1)
    swift_once();
  return &qword_254DEFC30;
}

uint64_t sub_215997540()
{
  return sub_2159975CC(&qword_254DEDCC0);
}

void sub_21599755C()
{
  qword_254DEFC38 = (uint64_t)&unk_24D3CC5C8;
}

uint64_t *sub_215997570()
{
  if (qword_254DEDCC8 != -1)
    swift_once();
  return &qword_254DEFC38;
}

uint64_t sub_2159975B0()
{
  return sub_2159975CC(&qword_254DEDCC8);
}

uint64_t sub_2159975CC(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t sub_215997604(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_21598F9D8(0, v1, 0);
    v2 = 0;
    do
    {
      v3 = sub_2159991F0();
      v5 = v4;
      v7 = *(_QWORD *)(v11 + 16);
      v6 = *(_QWORD *)(v11 + 24);
      if (v7 >= v6 >> 1)
        sub_21598F9D8((char *)(v6 > 1), v7 + 1, 1);
      ++v2;
      *(_QWORD *)(v11 + 16) = v7 + 1;
      v8 = v11 + 16 * v7;
      *(_QWORD *)(v8 + 32) = v3;
      *(_QWORD *)(v8 + 40) = v5;
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  sub_21597BA38(&qword_254DEDB50);
  sub_215990048();
  v9 = sub_215998DE8();
  swift_bridgeObjectRelease();
  return v9;
}

BOOL sub_215997750(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v12;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (a1[4] != a2[4])
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = a1 + 5;
  v6 = a2 + 5;
  do
  {
    v8 = *v5++;
    v7 = v8;
    v10 = *v6++;
    v9 = v10;
    v12 = v4-- != 0;
    result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

BOOL sub_2159977C4(_QWORD **a1, _QWORD **a2)
{
  return sub_215997750(*a1, *a2);
}

unsigned __int8 *sub_2159977D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  sub_2159986C4();
  swift_bridgeObjectRetain();
  v7 = sub_215998F44();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_215997B3C();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)sub_215999130();
  }
LABEL_7:
  v13 = sub_2159978C0(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_2159978C0(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unsigned __int8 v15;
  BOOL v16;
  uint64_t v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 *v21;
  unsigned int v22;
  char v23;
  unint64_t v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unint64_t v29;
  unsigned int v30;
  char v31;
  unint64_t v32;
  unsigned __int8 v33;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  v13 = 0;
                  if (v11 < 0x61 || v11 >= v8)
                    return (unsigned __int8 *)v13;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              if (!is_mul_ok(v9, a3))
                return 0;
              v14 = v9 * a3;
              v15 = v11 + v12;
              v16 = v14 >= v15;
              v9 = v14 - v15;
              if (!v16)
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_67;
    }
    if (a2)
    {
      v26 = a3 + 48;
      v27 = a3 + 55;
      v28 = a3 + 87;
      if (a3 > 10)
      {
        v26 = 58;
      }
      else
      {
        v28 = 97;
        v27 = 65;
      }
      if (result)
      {
        v29 = 0;
        do
        {
          v30 = *result;
          if (v30 < 0x30 || v30 >= v26)
          {
            if (v30 < 0x41 || v30 >= v27)
            {
              v13 = 0;
              if (v30 < 0x61 || v30 >= v28)
                return (unsigned __int8 *)v13;
              v31 = -87;
            }
            else
            {
              v31 = -55;
            }
          }
          else
          {
            v31 = -48;
          }
          if (!is_mul_ok(v29, a3))
            return 0;
          v32 = v29 * a3;
          v33 = v30 + v31;
          v16 = __CFADD__(v32, v33);
          v29 = v32 + v33;
          if (v16)
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v29;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_67:
    __break(1u);
    return result;
  }
  v17 = a2 - 1;
  if (a2 == 1)
    return 0;
  v18 = a3 + 48;
  v19 = a3 + 55;
  v20 = a3 + 87;
  if (a3 > 10)
  {
    v18 = 58;
  }
  else
  {
    v20 = 97;
    v19 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v21 = result + 1;
  do
  {
    v22 = *v21;
    if (v22 < 0x30 || v22 >= v18)
    {
      if (v22 < 0x41 || v22 >= v19)
      {
        v13 = 0;
        if (v22 < 0x61 || v22 >= v20)
          return (unsigned __int8 *)v13;
        v23 = -87;
      }
      else
      {
        v23 = -55;
      }
    }
    else
    {
      v23 = -48;
    }
    if (!is_mul_ok(v9, a3))
      return 0;
    v24 = v9 * a3;
    v25 = v22 + v23;
    v16 = __CFADD__(v24, v25);
    v9 = v24 + v25;
    if (v16)
      return 0;
    ++v21;
    --v17;
  }
  while (v17);
  return (unsigned __int8 *)v9;
}

uint64_t sub_215997B3C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_215998F50();
  v4 = sub_215997BB8(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_215997BB8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_215997CFC(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_21597DAC4(v9, 0);
      v12 = sub_215997DE8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x2199E908C](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x2199E908CLL);
LABEL_9:
      sub_215999130();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2199E908C]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_215997CFC(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_215997FF8(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_215997FF8(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_215998F14();
  }
  __break(1u);
  return result;
}

unint64_t sub_215997DE8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_215997FF8(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_215998F20();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_215999130();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_215997FF8(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_215998EFC();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_215997FF8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_215998F2C();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2199E9104](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_215998070(uint64_t a1, unint64_t a2)
{
  __n128 v4;
  __n128 v5;
  __int16 v6;
  __int16 v7;
  uint64_t v8;

  sub_215998D1C();
  MEMORY[0x24BDAC7A8](v4, v5);
  sub_21597B9F4(a1, a2);
  sub_215988A4C(a1, a2);
  v7 = v6;
  sub_21597AD00(a1, a2);
  if ((v7 & 0x100) == 0)
  {
    sub_21597BA38(&qword_254DEDD70);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_21599BDF0;
    *(_QWORD *)(v8 + 32) = v7 / 0x28u;
    *(_QWORD *)(v8 + 40) = v7 % 0x28u;
    sub_21597B9F4(a1, a2);
    sub_2159917F0(1, a1, a2);
    __asm { BR              X10 }
  }
  sub_21597AD00(a1, a2);
  return 0;
}

uint64_t sub_21599827C(_QWORD *a1)
{
  uint64_t v1;

  return sub_215996FCC(a1, *(_QWORD **)(v1 + 16)) & 1;
}

uint64_t sub_215998298(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, int64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unint64_t v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  unsigned __int8 v31;
  BOOL v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 *v36;
  uint64_t v37;
  unsigned int v38;
  char v39;
  unint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned int v45;
  char v46;
  unint64_t v47;
  unsigned __int8 v48;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_215997FF8(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_96;
  result = sub_215998F14();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_215997FF8(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_215997FF8(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_92;
  if (v17 < a3 >> 16)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  result = sub_215998F14();
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_91;
  }
  if (v18 < v15)
  {
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v33 = a6 + 48;
        v34 = a6 + 55;
        v35 = a6 + 87;
        if (a6 > 10)
        {
          v33 = 58;
        }
        else
        {
          v35 = 97;
          v34 = 65;
        }
        if (v19)
        {
          v24 = 0;
          v36 = v19 + 1;
          v37 = result - 1;
          do
          {
            v38 = *v36;
            if (v38 < 0x30 || v38 >= v33)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                v29 = 0;
                if (v38 < 0x61 || v38 >= v35)
                  return v29;
                v39 = -87;
              }
              else
              {
                v39 = -55;
              }
            }
            else
            {
              v39 = -48;
            }
            if (!is_mul_ok(v24, a6))
              return 0;
            v40 = v24 * a6;
            v41 = v38 + v39;
            v32 = __CFADD__(v40, v41);
            v24 = v40 + v41;
            if (v32)
              return 0;
            ++v36;
            --v37;
          }
          while (v37);
          return v24;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_95;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v42 = a6 + 48;
      v43 = a6 + 55;
      v44 = a6 + 87;
      if (a6 > 10)
      {
        v42 = 58;
      }
      else
      {
        v44 = 97;
        v43 = 65;
      }
      if (v19)
      {
        v24 = 0;
        while (1)
        {
          v45 = *v19;
          if (v45 < 0x30 || v45 >= v42)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              v29 = 0;
              if (v45 < 0x61 || v45 >= v44)
                return v29;
              v46 = -87;
            }
            else
            {
              v46 = -55;
            }
          }
          else
          {
            v46 = -48;
          }
          if (!is_mul_ok(v24, a6))
            return 0;
          v47 = v24 * a6;
          v48 = v45 + v46;
          v32 = __CFADD__(v47, v48);
          v24 = v47 + v48;
          if (v32)
            return 0;
          ++v19;
          if (!--result)
            return v24;
        }
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 48;
      v22 = a6 + 55;
      v23 = a6 + 87;
      if (a6 > 10)
      {
        v21 = 58;
      }
      else
      {
        v23 = 97;
        v22 = 65;
      }
      if (v19)
      {
        v24 = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v21)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              if (v27 < 0x61 || v27 >= v23)
                return v29;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          if (!is_mul_ok(v24, a6))
            return 0;
          v30 = v24 * a6;
          v31 = v27 + v28;
          v32 = v30 >= v31;
          v24 = v30 - v31;
          if (!v32)
            return 0;
          ++v25;
          if (!--v26)
            return v24;
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for OID()
{
  return &type metadata for OID;
}

unint64_t sub_2159986C4()
{
  unint64_t result;

  result = qword_254DEDF28;
  if (!qword_254DEDF28)
  {
    result = MEMORY[0x2199E9BE4](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_254DEDF28);
  }
  return result;
}

void sub_215998708(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_215968000, log, OS_LOG_TYPE_ERROR, "[%@ cancelPINCapture]: XPC failed: %@", (uint8_t *)&v4, 0x16u);
}

void sub_215998790(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_215968000, log, OS_LOG_TYPE_ERROR, "[%@ configuration] proxy failed: %@", (uint8_t *)&v4, 0x16u);
}

void sub_215998818()
{
  uint64_t v0;
  os_log_t v1;

  sub_215976784();
  sub_215976770(&dword_215968000, v0, v1, "[%@ getCardReaderBlobWithTxnBlob:]: XPC failed: %@");
  sub_21597679C();
}

void sub_21599887C()
{
  uint64_t v0;
  os_log_t v1;

  sub_215976784();
  sub_215976770(&dword_215968000, v0, v1, "[%@ cancelReadWithCallback:]: XPC failed: %@");
  sub_21597679C();
}

void sub_2159988E0()
{
  uint64_t v0;
  os_log_t v1;

  sub_215976784();
  sub_215976770(&dword_215968000, v0, v1, "[%@ cancelReadWithCallback:] failed: %@");
  sub_21597679C();
}

void sub_215998944(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215968000, a2, OS_LOG_TYPE_ERROR, "Proxy error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_2159989B8(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_proxyDescription(a1, a2, a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = a1;
  v11 = 2112;
  v12 = v8;
  _os_log_error_impl(&dword_215968000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%@.deinit: Disconnecting from %@", (uint8_t *)&v9, 0x16u);

}

void sub_215998A64(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_2159792F0(&dword_215968000, a2, a3, "%@ unavailable", (uint8_t *)a2);

}

void sub_215998AAC(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_2159792F0(&dword_215968000, a2, a3, "%@ disconnected", (uint8_t *)a2);

}

uint64_t sub_215998AF4()
{
  return MEMORY[0x24BDCADA0]();
}

uint64_t sub_215998B00()
{
  return MEMORY[0x24BDCAE68]();
}

uint64_t sub_215998B0C()
{
  return MEMORY[0x24BDCAEB0]();
}

uint64_t sub_215998B18()
{
  return MEMORY[0x24BDCAEE8]();
}

uint64_t sub_215998B24()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_215998B30()
{
  return MEMORY[0x24BDCB6A0]();
}

uint64_t sub_215998B3C()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_215998B48()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_215998B54()
{
  return MEMORY[0x24BDCB7A8]();
}

uint64_t sub_215998B60()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_215998B6C()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_215998B78()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_215998B84()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_215998B90()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_215998B9C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_215998BA8()
{
  return MEMORY[0x24BDCBBF8]();
}

uint64_t sub_215998BB4()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_215998BC0()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_215998BCC()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_215998BD8()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_215998BE4()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_215998BF0()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_215998BFC()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_215998C08()
{
  return MEMORY[0x24BDCD2B0]();
}

uint64_t sub_215998C14()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_215998C20()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_215998C2C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_215998C38()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_215998C44()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_215998C50()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_215998C5C()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_215998C68()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_215998C74()
{
  return MEMORY[0x24BDCDC20]();
}

uint64_t sub_215998C80()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_215998C8C()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_215998C98()
{
  return MEMORY[0x24BDCDC58]();
}

uint64_t sub_215998CA4()
{
  return MEMORY[0x24BDCDC68]();
}

uint64_t sub_215998CB0()
{
  return MEMORY[0x24BDCDC80]();
}

uint64_t sub_215998CBC()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_215998CC8()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_215998CD4()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_215998CE0()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_215998CEC()
{
  return MEMORY[0x24BDCDD30]();
}

uint64_t sub_215998CF8()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_215998D04()
{
  return MEMORY[0x24BDCDD68]();
}

uint64_t sub_215998D10()
{
  return MEMORY[0x24BDCDD70]();
}

uint64_t sub_215998D1C()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_215998D28()
{
  return MEMORY[0x24BDCDD88]();
}

uint64_t sub_215998D34()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_215998D40()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_215998D4C()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_215998D58()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_215998D64()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_215998D70()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_215998D7C()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_215998D88()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_215998D94()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_215998DA0()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_215998DAC()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_215998DB8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_215998DC4()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_215998DD0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_215998DDC()
{
  return MEMORY[0x24BEE06B8]();
}

uint64_t sub_215998DE8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_215998DF4()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_215998E00()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_215998E0C()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_215998E18()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_215998E24()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_215998E30()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_215998E3C()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_215998E48()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_215998E54()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_215998E60()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_215998E6C()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_215998E78()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_215998E84()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_215998E90()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_215998E9C()
{
  return MEMORY[0x24BEE0B00]();
}

uint64_t sub_215998EA8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_215998EB4()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_215998EC0()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_215998ECC()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_215998ED8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_215998EE4()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_215998EF0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_215998EFC()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_215998F08()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_215998F14()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_215998F20()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_215998F2C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_215998F38()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_215998F44()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_215998F50()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_215998F5C()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_215998F68()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_215998F74()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_215998F80()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_215998F8C()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t sub_215998F98()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_215998FA4()
{
  return MEMORY[0x24BEE0F78]();
}

uint64_t sub_215998FB0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_215998FBC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_215998FC8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_215998FD4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_215998FE0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_215998FEC()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_215998FF8()
{
  return MEMORY[0x24BDCFE50]();
}

uint64_t sub_215999004()
{
  return MEMORY[0x24BDCFE60]();
}

uint64_t sub_215999010()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21599901C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_215999028()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_215999034()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_215999040()
{
  return MEMORY[0x24BDD0410]();
}

uint64_t sub_21599904C()
{
  return MEMORY[0x24BDD0440]();
}

uint64_t sub_215999058()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_215999064()
{
  return MEMORY[0x24BEE1DB8]();
}

uint64_t sub_215999070()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_21599907C()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_215999088()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_215999094()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2159990A0()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_2159990AC()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_2159990B8()
{
  return MEMORY[0x24BEE1FD8]();
}

uint64_t sub_2159990C4()
{
  return MEMORY[0x24BEE2040]();
}

uint64_t sub_2159990D0()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_2159990DC()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_2159990E8()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_2159990F4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_215999100()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21599910C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_215999118()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_215999124()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_215999130()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21599913C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_215999148()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_215999154()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_215999160()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21599916C()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t sub_215999178()
{
  return MEMORY[0x24BEE2DA8]();
}

uint64_t sub_215999184()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_215999190()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21599919C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2159991A8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2159991B4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2159991C0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2159991CC()
{
  return MEMORY[0x24BEE3158]();
}

uint64_t sub_2159991D8()
{
  return MEMORY[0x24BEE31B8]();
}

uint64_t sub_2159991E4()
{
  return MEMORY[0x24BEE3550]();
}

uint64_t sub_2159991F0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2159991FC()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_215999208()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_215999214()
{
  return MEMORY[0x24BEE3D38]();
}

uint64_t sub_215999220()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_21599922C()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_215999238()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_215999244()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_215999250()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_21599925C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_215999268()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_215999274()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_215999280()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21599928C()
{
  return MEMORY[0x24BDD0778]();
}

uint64_t sub_215999298()
{
  return MEMORY[0x24BDD0780]();
}

uint64_t sub_2159992A4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2159992B0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2159992BC()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2159992C8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AMFIIsDeveloperModeEnabled()
{
  return MEMORY[0x24BE086B0]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x24BDE8888](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

uint64_t SecKeyCreateEncryptedDataWithParameters()
{
  return MEMORY[0x24BDE8B08]();
}

uint64_t SecKeyCreateFromSubjectPublicKeyInfoData()
{
  return MEMORY[0x24BDE8B18]();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x24BDE8BA8](key, algorithm, signedData, signature, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x24BDAFFF8](__str, __sep, __lasts);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

uint64_t terminate_with_reason()
{
  return MEMORY[0x24BDB01F0]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0370](a1, a2, a3);
}

