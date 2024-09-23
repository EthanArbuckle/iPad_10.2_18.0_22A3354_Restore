@implementation PCSGetBoundaryKey

void __PCSGetBoundaryKey_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  void *v37;
  __CFString *v38;
  uint64_t v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  __CFString *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  void *v89;
  void *v90;
  id obj;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  CFTypeRef cf;
  uint64_t v97;
  void *v98;
  _QWORD v99[9];
  _QWORD v100[9];
  uint64_t v101;
  const __CFString *v102;
  _BYTE v103[32];
  uint8_t buf[4];
  int v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD v110[6];
  _QWORD v111[6];
  _BYTE v112[128];
  _QWORD v113[8];
  _QWORD v114[8];
  uint64_t v115;
  const __CFString *v116;
  uint64_t v117;
  _QWORD v118[3];

  v1 = a1;
  v118[1] = *MEMORY[0x1E0C80C00];
  cf = 0;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", kPCSSetupDSID[0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v34 = *(_QWORD *)(v1 + 40);
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v36 = kPCSErrorDomain;
    v117 = *MEMORY[0x1E0C9AFB0];
    v118[0] = CFSTR("dsid not available");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, &v117, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v35;
    v38 = v36;
    v39 = 121;
LABEL_29:
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, v39, v11);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v34 + 16))(v34, 0, v42);
    goto LABEL_30;
  }
  if (!PCSCurrentPersonaMatchesDSID(v2))
  {
    v34 = *(_QWORD *)(v1 + 40);
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = kPCSErrorDomain;
    v115 = *MEMORY[0x1E0CB2D50];
    v116 = CFSTR("Current persona does not match chosen dsid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v40;
    v38 = v41;
    v39 = 152;
    goto LABEL_29;
  }
  v4 = *MEMORY[0x1E0CD6CB8];
  v5 = *MEMORY[0x1E0CD68F8];
  v82 = *MEMORY[0x1E0CD6C98];
  v113[0] = *MEMORY[0x1E0CD6C98];
  v113[1] = v5;
  v84 = v5;
  v83 = v4;
  v114[0] = v4;
  v114[1] = kPCSAccountBoundaryKey[0];
  v6 = *MEMORY[0x1E0C9AE50];
  v7 = *MEMORY[0x1E0CD6B50];
  v85 = *MEMORY[0x1E0CD6B80];
  v113[2] = *MEMORY[0x1E0CD6B80];
  v113[3] = v7;
  v114[2] = v6;
  v114[3] = v3;
  v8 = *MEMORY[0x1E0CD7018];
  v86 = *MEMORY[0x1E0CD6898];
  v113[4] = *MEMORY[0x1E0CD6898];
  v113[5] = v8;
  v114[4] = kPCSDefaultKeychainGroup[0];
  v114[5] = v6;
  v9 = *MEMORY[0x1E0CD6F30];
  v113[6] = *MEMORY[0x1E0CD7010];
  v113[7] = v9;
  v10 = *MEMORY[0x1E0CD6F38];
  v114[6] = v6;
  v114[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FB8;
  v13 = _PCSKeychainForwardTable(v11, &cf);
  qword_1ECED4FC0 += PCSMeasureRelativeNanoTime() - v12;
  if ((_DWORD)v13 != -25300)
  {
    if (!(_DWORD)v13)
    {
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      obj = (id)cf;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
      if (v14)
      {
        v15 = v14;
        v78 = v7;
        v79 = v6;
        v80 = v1;
        v81 = v11;
        v16 = 0;
        v89 = 0;
        v90 = 0;
        v88 = 0;
        v17 = *(_QWORD *)v93;
        v18 = *MEMORY[0x1E0CD68A0];
        v19 = *MEMORY[0x1E0CD68E8];
        v20 = *MEMORY[0x1E0CD6B78];
        v87 = *MEMORY[0x1E0CD6BE8];
        do
        {
          v21 = 0;
          v22 = v16;
          do
          {
            if (*(_QWORD *)v93 != v17)
              objc_enumerationMutation(obj);
            v16 = *(id *)(*((_QWORD *)&v92 + 1) + 8 * v21);

            objc_msgSend(v16, "objectForKeyedSubscript:", v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", v19);

            if (v24)
            {
              v25 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A9508000, v25, OS_LOG_TYPE_DEFAULT, "Item needs upgrading", buf, 2u);
              }
              v88 = 1;
            }
            objc_msgSend(v16, "objectForKeyedSubscript:", v20);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend(v26, "isEqualToString:", v87))
              {
                v27 = v89;
                AssignedPreferred(v89, v16);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v27 = v90;
                AssignedPreferred(v90, v16);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
              }

            }
            ++v21;
            v22 = v16;
          }
          while (v15 != v21);
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
        }
        while (v15);

        if ((v88 & 1) != 0)
        {
          v110[0] = v82;
          v110[1] = v84;
          v111[0] = v83;
          v111[1] = kPCSAccountBoundaryKey[0];
          v110[2] = v85;
          v110[3] = v18;
          v111[2] = v79;
          v111[3] = v19;
          v110[4] = v78;
          v110[5] = v86;
          v111[4] = v3;
          v111[5] = kPCSDefaultKeychainGroup[0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, v110, 6);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = v18;
          v109 = *MEMORY[0x1E0CD68A8];
          v29 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
          v30 = qword_1ECED3FF0(v28, v29);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            v105 = v30;
            _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Item upgrade resulted in: %d", buf, 8u);
          }

        }
        if (v89)
        {
          v31 = v89;
          v32 = v31;
          v1 = v80;
          v11 = v81;
          v33 = v90;
          goto LABEL_39;
        }
        v1 = v80;
        v11 = v81;
        v55 = v90;
        v56 = v87;
      }
      else
      {
        v55 = 0;
        v56 = *MEMORY[0x1E0CD6BE8];
        v20 = *MEMORY[0x1E0CD6B78];
      }
      v31 = v55;
      v57 = (void *)objc_msgSend(v31, "mutableCopy");
      objc_msgSend(v57, "setObject:forKeyedSubscript:", v56, v20);
      (*(&_PCSKeychainForwardTable + 1))(v57, 0);

      v32 = 0;
      v58 = 0;
      v59 = 0;
      v60 = 0;
      v33 = v31;
      if (!v31)
      {
LABEL_42:
        (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
        CFRelease(cf);

        goto LABEL_31;
      }
LABEL_39:
      objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v60 = 0;
      }
      v58 = v31;
      v59 = v33;
      goto LABEL_42;
    }
    goto LABEL_33;
  }
  objc_msgSend(*(id *)(v1 + 32), "objectForKeyedSubscript:", kPCSSetupBoundaryNoCreate[0]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "BOOLValue");

  if (v44)
  {
LABEL_33:
    v45 = *(_QWORD *)(v1 + 40);
    v46 = (void *)MEMORY[0x1E0CB35C8];
    v47 = kPCSErrorDomain;
    v106 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Boundary key not available: %d"), v13);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "errorWithDomain:code:userInfo:", v47, 91, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v45 + 16))(v45, 0, v50);

    goto LABEL_31;
  }
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x20uLL, buf))
  {
    v51 = *(_QWORD *)(v1 + 40);
    v52 = (void *)MEMORY[0x1E0CB35C8];
    v53 = kPCSErrorDomain;
    v101 = *MEMORY[0x1E0CB2D50];
    v102 = CFSTR("out of random");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "errorWithDomain:code:userInfo:", v53, 92, v42);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v51 + 16))(v51, 0, v54);
  }
  else
  {
    ccsha256_di();
    ccdigest();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 32);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v103, 32);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "base64EncodedStringWithOptions:", 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = *MEMORY[0x1E0CD6B40];
    v99[0] = v82;
    v99[1] = v62;
    v100[0] = v83;
    v100[1] = v54;
    v63 = v7;
    v64 = *MEMORY[0x1E0CD6B78];
    v99[2] = v84;
    v99[3] = v64;
    v65 = *MEMORY[0x1E0CD6BE8];
    v100[2] = kPCSAccountBoundaryKey[0];
    v100[3] = v65;
    v66 = *MEMORY[0x1E0CD68A0];
    v99[4] = v85;
    v99[5] = v66;
    v67 = *MEMORY[0x1E0CD68A8];
    v100[4] = v6;
    v100[5] = v67;
    v99[6] = v63;
    v99[7] = v86;
    v100[6] = v3;
    v100[7] = kPCSDefaultKeychainGroup[0];
    v99[8] = *MEMORY[0x1E0CD70D8];
    v100[8] = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 9);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v68, "mutableCopy");

    v70 = (*(&_PCSKeychainForwardTable + 1))(v69, 0);
    if ((_DWORD)v70)
    {
      v71 = *(_QWORD *)(v1 + 40);
      v72 = (void *)MEMORY[0x1E0CB35C8];
      v73 = kPCSErrorDomain;
      v97 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write into keychain: %d"), v70);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v74;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
      v75 = v3;
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "errorWithDomain:code:userInfo:", v73, 4, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v71 + 16))(v71, 0, v77);

      v3 = v75;
    }
    else
    {
      objc_msgSend(v69, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6C00], v64);
      (*(&_PCSKeychainForwardTable + 1))(v69, 0);
      (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
    }

  }
LABEL_30:

LABEL_31:
}

@end
