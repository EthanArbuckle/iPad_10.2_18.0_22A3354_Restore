@implementation PCSGetAppBoundaryKey

void __PCSGetAppBoundaryKey_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  int v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  void *v39;
  __CFString *v40;
  uint64_t v41;
  void *v42;
  __CFString *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  __CFString *v70;
  void *v71;
  void *v72;
  __CFString *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  id obj;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  CFTypeRef cf;
  uint64_t v94;
  void *v95;
  _QWORD v96[9];
  _QWORD v97[9];
  uint64_t v98;
  const __CFString *v99;
  _BYTE v100[32];
  uint8_t buf[4];
  int v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[6];
  _QWORD v108[6];
  _BYTE v109[128];
  _QWORD v110[8];
  _QWORD v111[8];
  uint64_t v112;
  const __CFString *v113;
  uint64_t v114;
  _QWORD v115[3];

  v1 = a1;
  v115[1] = *MEMORY[0x1E0C80C00];
  cf = 0;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", kPCSSetupDSID[0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v36 = *(_QWORD *)(v1 + 48);
    v37 = (void *)MEMORY[0x1E0CB35C8];
    v38 = kPCSErrorDomain;
    v114 = *MEMORY[0x1E0C9AFB0];
    v115[0] = CFSTR("dsid not available");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, &v114, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v39 = v37;
    v40 = v38;
    v41 = 121;
LABEL_27:
    objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, v41, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v36 + 16))(v36, 0, v11);
    goto LABEL_28;
  }
  if (!PCSCurrentPersonaMatchesDSID(v2))
  {
    v36 = *(_QWORD *)(v1 + 48);
    v42 = (void *)MEMORY[0x1E0CB35C8];
    v43 = kPCSErrorDomain;
    v112 = *MEMORY[0x1E0CB2D50];
    v113 = CFSTR("Current persona does not match chosen dsid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v39 = v42;
    v40 = v43;
    v41 = 152;
    goto LABEL_27;
  }
  v4 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), kPCSAccountBoundaryKey[0], *(_QWORD *)(v1 + 40));
  v5 = *MEMORY[0x1E0CD6CB8];
  v81 = *MEMORY[0x1E0CD6C98];
  v82 = *MEMORY[0x1E0CD68F8];
  v110[0] = *MEMORY[0x1E0CD6C98];
  v110[1] = v82;
  v83 = v5;
  v111[0] = v5;
  v111[1] = v4;
  v6 = *MEMORY[0x1E0C9AE50];
  v85 = *MEMORY[0x1E0CD6B80];
  v86 = *MEMORY[0x1E0CD6B50];
  v110[2] = *MEMORY[0x1E0CD6B80];
  v110[3] = v86;
  v111[2] = v6;
  v111[3] = v3;
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *MEMORY[0x1E0CD7018];
  v84 = *MEMORY[0x1E0CD6898];
  v110[4] = *MEMORY[0x1E0CD6898];
  v110[5] = v8;
  v111[4] = v7;
  v111[5] = v6;
  v9 = *MEMORY[0x1E0CD6F30];
  v110[6] = *MEMORY[0x1E0CD7010];
  v110[7] = v9;
  v10 = *MEMORY[0x1E0CD6F38];
  v111[6] = v6;
  v111[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, v110, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FB8;
  v13 = _PCSKeychainForwardTable(v11, &cf);
  qword_1ECED4FC0 += PCSMeasureRelativeNanoTime() - v12;
  if ((_DWORD)v13 == -25300)
  {
    objc_msgSend(*(id *)(v1 + 32), "objectForKeyedSubscript:", kPCSSetupBoundaryNoCreate[0]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "BOOLValue");

    if (!v45)
    {
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x20uLL, buf))
      {
        v52 = *(_QWORD *)(v1 + 48);
        v53 = (void *)MEMORY[0x1E0CB35C8];
        v54 = kPCSErrorDomain;
        v98 = *MEMORY[0x1E0CB2D50];
        v99 = CFSTR("out of random");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "errorWithDomain:code:userInfo:", v54, 92, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v52 + 16))(v52, 0, v56);
      }
      else
      {
        ccsha256_di();
        ccdigest();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 32);
        v57 = v6;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v100, 32);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "base64EncodedStringWithOptions:", 0);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = *MEMORY[0x1E0CD6B40];
        v96[0] = v81;
        v96[1] = v59;
        v97[0] = v83;
        v97[1] = v56;
        v60 = *MEMORY[0x1E0CD6B78];
        v96[2] = v82;
        v96[3] = v60;
        v61 = *MEMORY[0x1E0CD6BE8];
        v97[2] = v4;
        v97[3] = v61;
        v62 = *MEMORY[0x1E0CD68A0];
        v96[4] = v85;
        v96[5] = v62;
        v63 = *MEMORY[0x1E0CD68A8];
        v97[4] = v57;
        v97[5] = v63;
        v96[6] = v86;
        v96[7] = v84;
        v64 = *(_QWORD *)(v1 + 40);
        v97[6] = v3;
        v97[7] = v64;
        v96[8] = *MEMORY[0x1E0CD70D8];
        v97[8] = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 9);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)objc_msgSend(v65, "mutableCopy");

        v67 = (*(&_PCSKeychainForwardTable + 1))(v66, 0);
        v68 = *(_QWORD *)(v1 + 48);
        if ((_DWORD)v67)
        {
          v69 = (void *)MEMORY[0x1E0CB35C8];
          v79 = v11;
          v70 = kPCSErrorDomain;
          v94 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write into keychain: %d"), v67);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v71;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v70;
          v11 = v79;
          objc_msgSend(v69, "errorWithDomain:code:userInfo:", v73, 4, v72);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v68 + 16))(v68, 0, v74);

        }
        else
        {
          (*(void (**)(_QWORD, void *, _QWORD))(v68 + 16))(*(_QWORD *)(v1 + 48), v55, 0);
        }

      }
      goto LABEL_28;
    }
LABEL_30:
    v46 = *(_QWORD *)(v1 + 48);
    v47 = (void *)MEMORY[0x1E0CB35C8];
    v48 = kPCSErrorDomain;
    v103 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Boundary key not available: %d"), v13);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "errorWithDomain:code:userInfo:", v48, 91, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v46 + 16))(v46, 0, v51);

    goto LABEL_28;
  }
  if ((_DWORD)v13)
    goto LABEL_30;
  v80 = v4;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = (id)cf;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
  if (v14)
  {
    v15 = v14;
    v75 = v6;
    v76 = v1;
    v77 = v3;
    v78 = v11;
    v16 = 0;
    v17 = 0;
    v87 = 0;
    v18 = *(_QWORD *)v90;
    v19 = *MEMORY[0x1E0CD68A0];
    v20 = *MEMORY[0x1E0CD68E8];
    v21 = *MEMORY[0x1E0CD6B78];
    do
    {
      v22 = 0;
      v23 = v16;
      do
      {
        if (*(_QWORD *)v90 != v18)
          objc_enumerationMutation(obj);
        v16 = *(id *)(*((_QWORD *)&v89 + 1) + 8 * v22);

        objc_msgSend(v16, "objectForKeyedSubscript:", v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", v20);

        if (v25)
        {
          v26 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A9508000, v26, OS_LOG_TYPE_DEFAULT, "Item needs upgrading", buf, 2u);
          }
          v87 = 1;
        }
        objc_msgSend(v16, "objectForKeyedSubscript:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          AssignedPreferred(v17, v16);
          v28 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v28;
        }

        ++v22;
        v23 = v16;
      }
      while (v15 != v22);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
    }
    while (v15);

    v1 = v76;
    v3 = v77;
    v4 = v80;
    if ((v87 & 1) != 0)
    {
      v107[0] = v81;
      v107[1] = v82;
      v108[0] = v83;
      v108[1] = v80;
      v107[2] = v85;
      v107[3] = v19;
      v108[2] = v75;
      v108[3] = v20;
      v107[4] = v86;
      v107[5] = v84;
      v29 = *(_QWORD *)(v76 + 40);
      v108[4] = v77;
      v108[5] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v19;
      v106 = *MEMORY[0x1E0CD68A8];
      v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
      v32 = qword_1ECED3FF0(v30, v31);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v102 = v32;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Item upgrade resulted in: %d", buf, 8u);
      }

    }
    v33 = v17;
    v34 = v33;
    if (v33)
    {
      objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v11 = v78;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v35 = 0;
      }
    }
    else
    {
      v35 = 0;
      v11 = v78;
    }
  }
  else
  {
    v34 = 0;
    v35 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
  CFRelease(cf);

LABEL_28:
}

@end
