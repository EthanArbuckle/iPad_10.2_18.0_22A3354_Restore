@implementation HerculesFareTables

+ (unsigned)getProductIDWithTicketType:(unsigned __int8)a3 withOperatorID:(unsigned __int8)a4 withRiderClass:(unsigned __int8)a5 forCity:(id)a6 withProductCategory:(char *)a7 withError:(id *)a8
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unsigned __int8 *v40;
  unsigned int *v41;
  NSObject *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  _QWORD v50[2];
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  _BYTE v57[10];
  __int16 v58;
  int v59;
  _QWORD v60[2];
  _QWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[2];
  _QWORD v65[2];
  uint64_t v66;
  _QWORD v67[3];

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v67[1] = *MEMORY[0x1E0C80C00];
  v13 = a6;
  +[AppletConfigurationData getHerculesSettings](AppletConfigurationData, "getHerculesSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("fareTables"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBase64:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "length") || (objc_msgSend(v18, "length") & 7) != 0)
    {
      ATLLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v55 = v13;
        v56 = 2112;
        *(_QWORD *)v57 = v17;
        _os_log_impl(&dword_1C3511000, v19, OS_LOG_TYPE_ERROR, "Invalid fare table for city %@ %@", buf, 0x16u);
      }

      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid fare table for city %@ %@"), v13, v17);
      v21 = (void *)v20;
      if (!a8)
        goto LABEL_32;
      v22 = *a8;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v24 = *MEMORY[0x1E0CB3388];
        v60[0] = *MEMORY[0x1E0CB2D50];
        v60[1] = v24;
        v61[0] = v20;
        v61[1] = v22;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v61;
        v27 = v60;
LABEL_25:
        v46 = 2;
LABEL_31:
        objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v48);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
LABEL_33:
        LODWORD(a8) = 0;
        goto LABEL_34;
      }
      v62 = *MEMORY[0x1E0CB2D50];
      v63 = v20;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = &v63;
      v27 = &v62;
      goto LABEL_30;
    }
    v37 = objc_retainAutorelease(v18);
    v38 = objc_msgSend(v37, "bytes");
    v39 = v38 + objc_msgSend(v37, "length");
    v18 = objc_retainAutorelease(v37);
    v40 = (unsigned __int8 *)objc_msgSend(v18, "bytes");
    if ((unint64_t)v40 >= v39)
    {
LABEL_20:
      ATLLogObject();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v55 = v13;
        v56 = 1024;
        *(_DWORD *)v57 = v12;
        *(_WORD *)&v57[4] = 1024;
        *(_DWORD *)&v57[6] = v11;
        v58 = 1024;
        v59 = v10;
        _os_log_impl(&dword_1C3511000, v42, OS_LOG_TYPE_ERROR, "No Product ID for City %@ TicketType %hhu OperatorID %hhu RiderClass %hhu", buf, 0x1Eu);
      }

      v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No Product ID for City %@ TicketType %hhu OperatorID %hhu RiderClass %hhu"), v13, v12, v11, v10);
      v21 = (void *)v43;
      if (!a8)
        goto LABEL_32;
      v44 = *a8;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v45 = *MEMORY[0x1E0CB3388];
        v50[0] = *MEMORY[0x1E0CB2D50];
        v50[1] = v45;
        v51[0] = v43;
        v51[1] = v44;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v51;
        v27 = v50;
        goto LABEL_25;
      }
      v52 = *MEMORY[0x1E0CB2D50];
      v53 = v43;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = &v53;
      v27 = &v52;
LABEL_30:
      v46 = 1;
      goto LABEL_31;
    }
    v41 = (unsigned int *)(v40 + 4);
    while (*v40 != (_DWORD)v12 || v40[1] != (_DWORD)v11 || v40[2] != (_DWORD)v10)
    {
      v40 += 8;
      v41 += 2;
      if ((unint64_t)v40 >= v39)
        goto LABEL_20;
    }
    *a7 = v40[3];
    LODWORD(a8) = bswap32(*v41);
  }
  else
  {
    ATLLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v13;
      _os_log_impl(&dword_1C3511000, v28, OS_LOG_TYPE_ERROR, "No fare table for city %@", buf, 0xCu);
    }

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No fare table for city %@"), v13);
    v18 = (id)v29;
    if (a8)
    {
      v30 = *a8;
      v31 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v32 = *MEMORY[0x1E0CB3388];
        v64[0] = *MEMORY[0x1E0CB2D50];
        v64[1] = v32;
        v65[0] = v29;
        v65[1] = v30;
        v33 = (void *)MEMORY[0x1E0C99D80];
        v34 = v65;
        v35 = v64;
        v36 = 2;
      }
      else
      {
        v66 = *MEMORY[0x1E0CB2D50];
        v67[0] = v29;
        v33 = (void *)MEMORY[0x1E0C99D80];
        v34 = v67;
        v35 = &v66;
        v36 = 1;
      }
      objc_msgSend(v33, "dictionaryWithObjects:forKeys:count:", v34, v35, v36);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v47);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_33;
    }
  }
LABEL_34:

  return a8;
}

@end
