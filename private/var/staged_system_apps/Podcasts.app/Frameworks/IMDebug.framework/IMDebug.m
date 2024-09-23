uint64_t change_file_date(const char *a1, uint64_t a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  tm v7;
  utimbuf v8;

  v4 = *(_DWORD *)(a3 + 16);
  v5 = *(_DWORD *)(a3 + 20);
  if (v5 > 0x76C)
    v5 -= 1900;
  *(_OWORD *)&v7.tm_sec = *(_OWORD *)a3;
  memset(&v7.tm_wday, 0, 32);
  v7.tm_mon = v4;
  v7.tm_year = v5;
  v7.tm_isdst = -1;
  v8.actime = mktime(&v7);
  v8.modtime = v8.actime;
  return utime(a1, &v8);
}

uint64_t mymkdir()
{
  return 0;
}

uint64_t makedir(const char *a1)
{
  int v2;
  char *v3;
  char *v4;

  v2 = strlen(a1);
  if (v2 < 1)
    return 0;
  v3 = (char *)malloc_type_malloc(v2 + 1, 0x95F0DC6AuLL);
  if (v3)
  {
    v4 = strcpy(v3, a1);
    free(v4);
    return 1;
  }
  else
  {
    puts("Error allocating memory");
    return 4294967192;
  }
}

uint64_t do_banner()
{
  puts("MiniUnz 1.01b, demo of zLib + Unz package written by Gilles Vollant");
  return puts("more info at http://www.winimage.com/zLibDll/unzip.html\n");
}

uint64_t do_help()
{
  return puts("Usage : miniunz [-e] [-x] [-v] [-l] [-o] [-p password] file.zip [file_to_extr.] [-d extractdir]\n\n  -e  Extract without pathname (junk paths)\n  -x  Extract with pathname\n  -v  list files\n  -l  list files\n  -d  directory to extract into\n  -o  overwrite files without prompting\n  -p  extract crypted file using password\n");
}

uint64_t do_list(_QWORD *a1)
{
  int GlobalInfo;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  const char *v7;
  unint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  char v20[256];

  v19 = 0uLL;
  GlobalInfo = unzGetGlobalInfo((uint64_t)a1, &v19);
  if (GlobalInfo)
    printf("error %d with zipfile in unzGetGlobalInfo \n", GlobalInfo);
  puts(" Length  Method   Size  Ratio   Date    Time   CRC-32     Name");
  puts(" ------  ------   ----  -----   ----    ----   ------     ----");
  if ((_QWORD)v19)
  {
    v3 = 0;
    do
    {
      v18 = 0;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      if (unzGetCurrentFileInfo((uint64_t)a1, (uint64_t)&v10, (uint64_t)v20, 0x100uLL, 0, 0, 0, 0))
      {
        printf("error %d with zipfile in unzGetCurrentFileInfo\n");
        return 0;
      }
      if (*((_QWORD *)&v13 + 1))
        v4 = (unint64_t)(100 * v13) / *((_QWORD *)&v13 + 1);
      else
        v4 = 0;
      if ((v11 & 1) != 0)
        v5 = 42;
      else
        v5 = 32;
      if (*((_QWORD *)&v11 + 1))
      {
        if (*((_QWORD *)&v11 + 1) == 12)
        {
          v7 = "BZip2 ";
        }
        else if (*((_QWORD *)&v11 + 1) == 8)
        {
          v6 = (v11 >> 1) & 3;
          if (v6)
          {
            if (v6 == 1)
            {
              v7 = "Defl:X";
            }
            else
            {
              v7 = "Defl:F";
              if ((v11 & 4) == 0)
                v7 = "Unkn. ";
            }
          }
          else
          {
            v7 = "Defl:N";
          }
        }
        else
        {
          v7 = "Unkn. ";
        }
      }
      else
      {
        v7 = "Stored";
      }
      printf("%7lu  %6s%c%7lu %3lu%%  %2.2lu-%2.2lu-%2.2lu  %2.2lu:%2.2lu  %8.8lx   %s\n", *((_QWORD *)&v13 + 1), v7, v5, (_QWORD)v13, v4, v18 + 1, HIDWORD(v17), HIDWORD(v18) % 0x64, DWORD2(v17), DWORD1(v17), *((_QWORD *)&v12 + 1), v20);
      ++v3;
      v8 = v19;
      if (v3 < (unint64_t)v19)
      {
        if (unzGoToNextFile(a1))
        {
          printf("error %d with zipfile in unzGoToNextFile\n");
          return 0;
        }
        v8 = v19;
      }
    }
    while (v3 < v8);
  }
  return 0;
}

uint64_t do_extract_currentfile(uint64_t a1, int *a2, _DWORD *a3, _BYTE *a4)
{
  uint64_t CurrentFileInfo;
  uint64_t v9;
  void *v10;
  void *v11;
  char *v12;
  char *i;
  int v14;
  int v15;
  const char *v16;
  uint64_t v17;
  int v18;
  FILE *v19;
  char v20;
  FILE *v21;
  uint64_t CurrentFile;
  char v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD v27[7];
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  _BYTE v33[7];

  v29 = 0;
  v28 = 0u;
  memset(v27, 0, sizeof(v27));
  CurrentFileInfo = unzGetCurrentFileInfo(a1, (uint64_t)v27, (uint64_t)&v32, 0x100uLL, 0, 0, 0, 0);
  if ((_DWORD)CurrentFileInfo)
  {
    v9 = CurrentFileInfo;
    printf("error %d with zipfile in unzGetCurrentFileInfo\n", CurrentFileInfo);
    return v9;
  }
  v10 = malloc_type_malloc(0x2000uLL, 0xC6AAB06EuLL);
  if (!v10)
  {
    puts("Error allocating memory");
    return 4294967192;
  }
  v11 = v10;
  v12 = &v32;
  for (i = v33; ; ++i)
  {
    v14 = *(i - 1);
    if (v14 != 47 && v14 != 92)
      break;
    v12 = i;
LABEL_10:
    ;
  }
  if (*(i - 1))
    goto LABEL_10;
  v15 = *a2;
  if (*v12)
  {
    if (v15)
      v16 = v12;
    else
      v16 = &v32;
    v17 = unzOpenCurrentFilePassword(a1, a4);
    v9 = v17;
    if ((_DWORD)v17)
      printf("error %d with zipfile in unzOpenCurrentFilePassword\n", v17);
    if (!(*a3 | v9))
    {
      v19 = fopen(v16, "rb");
      if (v19)
      {
        fclose(v19);
        while (1)
        {
          printf("The file %s exists. Overwrite ? [y]es, [n]o, [A]ll: ", v16);
          if (scanf("%1s", &v30) != 1)
            exit(1);
          v20 = v30;
          if (v30 - 97 < 0x1A)
            v20 = v30 - 32;
          if (v20 == 89)
            break;
          if (v20 == 78)
          {
            v18 = 1;
            goto LABEL_19;
          }
          if (v20 == 65)
          {
            v18 = 0;
            *a3 = 1;
            goto LABEL_19;
          }
        }
      }
    }
    v18 = 0;
LABEL_19:
    if (v18 | v9)
    {
LABEL_20:
      if (!(_DWORD)v9)
        goto LABEL_49;
LABEL_47:
      unzCloseCurrentFile(a1);
    }
    else
    {
      v21 = fopen(v16, "wb");
      if (!v21)
      {
        if (*a2
          || v12 == &v32
          || (v23 = *(v12 - 1), *(v12 - 1) = 0, makedir(v16), *(v12 - 1) = v23, (v21 = fopen(v16, "wb")) == 0))
        {
          printf("error opening %s\n", v16);
          goto LABEL_20;
        }
      }
      printf(" extracting: %s\n", v16);
      while (1)
      {
        CurrentFile = unzReadCurrentFile(a1, (uint64_t)v11, 0x2000u);
        v9 = CurrentFile;
        if ((CurrentFile & 0x80000000) != 0)
        {
          printf("error %d with zipfile in unzReadCurrentFile\n", CurrentFile);
          goto LABEL_46;
        }
        if (!(_DWORD)CurrentFile)
          break;
        if (fwrite(v11, CurrentFile, 1uLL, v21) != 1)
        {
          puts("error in writing extracted file");
          v9 = 0xFFFFFFFFLL;
LABEL_46:
          fclose(v21);
          goto LABEL_47;
        }
      }
      fclose(v21);
      v30 = v28;
      v31 = v29;
      change_file_date(v16, v24, (uint64_t)&v30);
LABEL_49:
      v25 = unzCloseCurrentFile(a1);
      v9 = v25;
      if ((_DWORD)v25)
        printf("error %d with zipfile in unzCloseCurrentFile\n", v25);
    }
  }
  else
  {
    if (!v15)
      printf("creating directory: %s\n", &v32);
    v9 = 0;
  }
  free(v11);
  return v9;
}

uint64_t do_extract(_QWORD *a1, int a2, int a3, _BYTE *a4)
{
  int GlobalInfo;
  unint64_t v7;
  unint64_t v8;
  int File;
  __int128 v11;
  int v12;
  int v13;

  v12 = a3;
  v13 = a2;
  v11 = 0uLL;
  GlobalInfo = unzGetGlobalInfo((uint64_t)a1, &v11);
  if (GlobalInfo)
    printf("error %d with zipfile in unzGetGlobalInfo \n", GlobalInfo);
  if ((_QWORD)v11)
  {
    v7 = 0;
    while (!do_extract_currentfile((uint64_t)a1, &v13, &v12, a4))
    {
      ++v7;
      v8 = v11;
      if (v7 < (unint64_t)v11)
      {
        File = unzGoToNextFile(a1);
        if (File)
        {
          printf("error %d with zipfile in unzGoToNextFile\n", File);
          return 0;
        }
        v8 = v11;
      }
      if (v7 >= v8)
        return 0;
    }
  }
  return 0;
}

uint64_t do_extract_onefile(uint64_t a1, char *a2, int a3, int a4, _BYTE *a5)
{
  int v9;
  int v10;

  v9 = a4;
  v10 = a3;
  if (!unzLocateFile(a1, a2, 0))
    return do_extract_currentfile(a1, &v10, &v9, a5) != 0;
  printf("file %s not found in the zipfile\n", a2);
  return 2;
}

int main(int argc, const char **argv, const char **envp)
{
  int onefile;
  const char *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  char *v11;
  char *v12;
  const char *v13;
  int v14;
  const char *v15;
  char v16;
  unsigned __int8 *v17;
  int v18;
  uint64_t v20;
  int v21;
  BOOL v22;
  const char *v23;
  int v24;
  BOOL v25;
  _QWORD *v26;
  char __dst[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  *(_OWORD *)__dst = 0u;
  puts("MiniUnz 1.01b, demo of zLib + Unz package written by Gilles Vollant");
  puts("more info at http://www.winimage.com/zLibDll/unzip.html\n");
  if (argc != 1)
  {
    if (argc < 2)
    {
      v13 = 0;
    }
    else
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 1;
      do
      {
        v15 = argv[v14];
        if (*v15 == 45)
        {
          v16 = v15[1];
          if (v16)
          {
            v17 = (unsigned __int8 *)(v15 + 2);
            do
            {
              v18 = v16 & 0xDF;
              if (v18 == 76 || v18 == 86)
                v10 = 1;
              if (v18 == 69)
                v9 = 1;
              if (v18 == 79)
                v8 = 1;
              if (v18 == 80)
              {
                v20 = v14 + 1;
                if ((int)v20 < argc)
                {
                  v11 = (char *)argv[v20];
                  ++v14;
                }
              }
              else if (v18 == 68)
              {
                v6 = argv[v14 + 1];
                v7 = 1;
              }
              v21 = *v17++;
              v16 = v21;
            }
            while (v21);
          }
        }
        else
        {
          if (v12)
            v22 = 0;
          else
            v22 = v7 == 0;
          if (v22)
            v23 = argv[v14];
          else
            v23 = v12;
          if (v22)
            v24 = 0;
          else
            v24 = v7;
          v25 = v13 == 0;
          if (v13)
            v12 = (char *)v23;
          else
            v13 = argv[v14];
          if (!v25)
            v7 = v24;
        }
        ++v14;
      }
      while (v14 < argc);
      if (v13)
      {
        strncpy(__dst, v13, 0xFFuLL);
        LOBYTE(v44) = 0;
        v26 = unzOpen((uint64_t)v13);
        if (v26 || (__strcat_chk(__dst, ".zip", 272), (v26 = unzOpen((uint64_t)__dst)) != 0))
        {
          printf("%s opened\n", __dst);
          if (v10 == 1)
          {
            do_list(v26);
          }
          else
          {
            if (v7 && chdir(v6))
            {
              printf("Error changing into %s, aborting\n", v6);
              exit(-1);
            }
            if (v12)
            {
              onefile = do_extract_onefile((uint64_t)v26, v12, v9, v8, v11);
LABEL_53:
              unzClose((uint64_t)v26);
              return onefile;
            }
            do_extract(v26, v9, v8, v11);
          }
          onefile = 0;
          goto LABEL_53;
        }
      }
    }
    printf("Cannot open %s or %s.zip\n", v13, v13);
    return 1;
  }
  puts("Usage : miniunz [-e] [-x] [-v] [-l] [-o] [-p password] file.zip [file_to_extr.] [-d extractdir]\n\n  -e  Extract without pathname (junk paths)\n  -x  Extract with pathname\n  -v  list files\n  -l  list files\n  -d  directory to extract into\n  -o  overwrite files without prompting\n  -p  extract crypted file using password\n");
  return 0;
}

void sub_614C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 192));
  _Unwind_Resume(a1);
}

void sub_6304(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t unzRepair(const char *a1, const char *a2, const char *a3, _QWORD *a4, _QWORD *a5)
{
  FILE *v9;
  FILE *v10;
  FILE *v11;
  uint64_t v12;
  FILE *v13;
  unsigned int v14;
  int v15;
  int v16;
  int8x16_t v17;
  int v18;
  int v19;
  size_t v20;
  unsigned int v21;
  size_t v22;
  unsigned int v23;
  size_t v24;
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  int8x16_t v29;
  unsigned int v30;
  unsigned int v31;
  __int16 v32;
  int v33;
  FILE *v34;
  FILE *v35;
  int v36;
  std::error_code *v37;
  int v39;
  const std::__fs::filesystem::path *__filename;
  FILE *v41;
  int v42;
  FILE *__stream;
  uint64_t v44;
  int8x16_t v45;
  __int16 v46;
  __int32 v47;
  unsigned int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int8x16_t v60;
  __int16 v61;
  char v62;
  char v63;
  char v64;
  char v65;
  char v66;
  char v67;
  char v68;
  char v69;
  char v70;
  char v71;
  uint64_t v72;
  __int16 v73;
  int v74;
  _BYTE v75[1024];
  _BYTE v76[256];
  int __ptr;
  uint64_t v78;
  __int16 v79;
  __int32 v80;
  unsigned __int8 v81;
  unsigned __int8 v82;
  unsigned __int8 v83;
  unsigned __int8 v84;
  unsigned __int8 v85;
  unsigned __int8 v86;
  unsigned __int8 v87;
  unsigned __int8 v88;
  unsigned __int8 v89;
  unsigned __int8 v90;
  unsigned __int8 v91;
  unsigned __int8 v92;

  v9 = fopen(a1, "rb");
  v10 = fopen(a2, "wb");
  v11 = fopen(a3, "wb");
  v12 = 4294967294;
  if (!v9 || !v10)
    return v12;
  v13 = v11;
  __filename = (const std::__fs::filesystem::path *)a3;
  if (fread(&__ptr, 1uLL, 0x1EuLL, v9) != 30)
  {
    v16 = 0;
    v44 = 0;
    v21 = 0;
    v30 = 0;
LABEL_30:
    v31 = 0;
    goto LABEL_42;
  }
  v14 = 0;
  v15 = 0;
  v44 = 0;
  v16 = 0;
  v17.i64[1] = -63738;
  __stream = v9;
  v41 = v13;
  while (1)
  {
    v48 = v14;
    if (__ptr != 67324752)
    {
      v31 = 0;
      v21 = v15;
      goto LABEL_41;
    }
    v17.i64[0] = v78;
    v45 = v17;
    v46 = v79;
    v47 = v80;
    v55 = v82;
    v56 = v81;
    v53 = v84;
    v54 = v83;
    v51 = v86;
    v52 = v85;
    v49 = v88;
    v50 = v87;
    v18 = v89;
    v19 = v90;
    v57 = v92;
    v58 = v91;
    v75[0] = 0;
    v76[0] = 0;
    if (fwrite(&__ptr, 1uLL, 0x1EuLL, v10) != 30)
    {
      v31 = -1;
      v21 = v15;
      goto LABEL_40;
    }
    v20 = v18 | (v19 << 8);
    v21 = v15 + 30;
    if (!(_DWORD)v20)
    {
      v31 = -2;
      goto LABEL_40;
    }
    if (fread(v76, 1uLL, v18 | (v19 << 8), v9) != v20
      || fwrite(v76, 1uLL, v18 | (v19 << 8), v10) != v20)
    {
LABEL_31:
      v31 = -1;
      goto LABEL_40;
    }
    v42 = v15;
    v22 = v58 | (v57 << 8);
    v21 += v20;
    if ((_DWORD)v22)
    {
      if (fread(v75, 1uLL, v58 | (v57 << 8), v9) != v22
        || fwrite(v75, 1uLL, v22, v10) != v22)
      {
        goto LABEL_31;
      }
      v21 += v22;
    }
    v23 = v56 | (v55 << 8) | (v54 << 16) | (v53 << 24);
    if (v23)
      v24 = v23;
    else
      v24 = v52 | (v51 << 8) | (v50 << 16) | (v49 << 24);
    if ((int)v24 < 1)
      goto LABEL_22;
    v39 = v16;
    v25 = a4;
    v26 = a5;
    v27 = malloc_type_malloc(v24, 0xD877797DuLL);
    if (!v27)
      break;
    v28 = v27;
    if ((_DWORD)v24 != fread(v27, 1uLL, v24, __stream)
      || (_DWORD)v24 != fwrite(v28, 1uLL, v24, v10))
    {
      free(v28);
      v31 = -1;
      goto LABEL_39;
    }
    v21 += v24;
    v44 += v24;
    free(v28);
    a5 = v26;
    a4 = v25;
    v16 = v39;
LABEL_22:
    v59 = 33639248;
    v29 = vqtbl1q_s8(v45, (int8x16_t)xmmword_E080);
    v29.i16[5] = v46;
    v29.i32[3] = v47;
    v29.i16[1] = v29.i16[0];
    v60 = v29;
    LOBYTE(v61) = v56;
    HIBYTE(v61) = v55;
    v62 = v54;
    v63 = v53;
    v64 = v52;
    v65 = v51;
    v66 = v50;
    v67 = v49;
    v68 = v18;
    v69 = v19;
    v70 = v58;
    v71 = v57;
    v72 = 0;
    v73 = 0;
    v74 = v42;
    v13 = v41;
    v9 = __stream;
    if (fwrite(&v59, 1uLL, 0x2EuLL, v41) != 46)
    {
      v14 = v48;
LABEL_37:
      v30 = v14;
      v31 = -1;
      goto LABEL_42;
    }
    v14 = v48 + 46;
    if (fwrite(v76, 1uLL, v20, v41) != v20)
      goto LABEL_37;
    v14 += v20;
    if ((_DWORD)v22)
    {
      if (fwrite(v75, 1uLL, v22, v41) != v22)
        goto LABEL_37;
      v14 += v22;
    }
    ++v16;
    v15 = v21;
    if (fread(&__ptr, 1uLL, 0x1EuLL, __stream) != 30)
    {
      v30 = v14;
      goto LABEL_30;
    }
  }
  v31 = -4;
LABEL_39:
  a5 = v26;
  a4 = v25;
  v9 = __stream;
  v16 = v39;
LABEL_40:
  v13 = v41;
LABEL_41:
  v30 = v48;
LABEL_42:
  v59 = 101010256;
  if (v16 >= 0xFFFF)
    v32 = -1;
  else
    v32 = v16;
  v60.i32[0] = 0;
  v60.i16[2] = v32;
  v60.i16[3] = v32;
  v60.i64[1] = __PAIR64__(v21, v30);
  v61 = 0;
  if (fwrite(&v59, 1uLL, 0x16uLL, v13) == 22)
    v12 = v31;
  else
    v12 = 0xFFFFFFFFLL;
  fclose(v13);
  if (!(_DWORD)v12)
  {
    v33 = v16;
    v34 = fopen((const char *)__filename, "rb");
    if (v34)
    {
      v35 = v34;
      while (1)
      {
        v36 = fread(&v59, 1uLL, 0x2000uLL, v35);
        if (v36 < 1)
          break;
        if (fwrite(&v59, 1uLL, v36, v10) != v36)
        {
          v12 = 0xFFFFFFFFLL;
          goto LABEL_56;
        }
      }
      v12 = 0;
LABEL_56:
      fclose(v35);
    }
    else
    {
      v12 = 0;
    }
    v16 = v33;
  }
  fclose(v9);
  fclose(v10);
  remove(__filename, v37);
  if (!(_DWORD)v12)
  {
    if (a4)
      *a4 = v16;
    if (a5)
      *a5 = v44;
  }
  return v12;
}

void sub_7234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

uint64_t unzStringFileNameCompare(const char *a1, const char *a2, unsigned int a3)
{
  int v4;
  int v5;
  int v6;
  int v7;

  if (a3 < 2)
    return strcmp(a1, a2);
  while (1)
  {
    v5 = *(unsigned __int8 *)a1++;
    v4 = v5;
    v7 = *(unsigned __int8 *)a2++;
    v6 = v7;
    if ((v4 - 97) < 0x1A)
      LOBYTE(v4) = v4 - 32;
    if ((v6 - 97) < 0x1A)
      LOBYTE(v6) = v6 - 32;
    if (!(_BYTE)v4)
      break;
    if (!(_BYTE)v6)
      return 1;
    if ((char)v4 < (char)v6)
      return 0xFFFFFFFFLL;
    if ((char)v4 > (char)v6)
      return 1;
  }
  if ((_BYTE)v6)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

_QWORD *unzOpen2(uint64_t a1, _OWORD *a2)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  _BYTE *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v19;
  unint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v33;
  int Long;
  int Short;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD __src[22];

  memset(__src, 0, 336);
  if (a2)
  {
    v3 = a2[1];
    __src[0] = *a2;
    __src[1] = v3;
    v4 = a2[3];
    __src[2] = a2[2];
    __src[3] = v4;
    v5 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))&__src[0])(*((_QWORD *)&v4 + 1), a1, 5);
  }
  else
  {
    fill_fopen_filefunc((FILE *(**)(int, char *, char))__src);
    v5 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))&__src[0])(*((_QWORD *)&__src[3] + 1), a1, 5);
  }
  v6 = (_QWORD *)v5;
  *(_QWORD *)&__src[4] = v5;
  if (v5)
  {
    if (!(*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))&__src[2])(*((_QWORD *)&__src[3] + 1), v5, 0, 2))
    {
      v7 = (*((uint64_t (**)(_QWORD, _QWORD *))&__src[1] + 1))(*((_QWORD *)&__src[3] + 1), v6);
      v8 = v7;
      v9 = v7 >= 0xFFFF ? 0xFFFFLL : v7;
      v10 = (char *)malloc_type_malloc(0x404uLL, 0x502D75B4uLL);
      if (v10)
      {
        v11 = v10;
        if (v9 >= 5)
        {
          v12 = v10 + 1;
          v13 = 4;
          do
          {
            v14 = v13 + 1024;
            v15 = v13 + 1024 >= v9 ? v9 : v13 + 1024;
            v16 = v15 >= 0x404 ? 1028 : v15;
            if ((*(uint64_t (**)(_QWORD, _QWORD *, unint64_t, _QWORD))&__src[2])(*((_QWORD *)&__src[3] + 1), v6, v8 - v15, 0)|| (*((uint64_t (**)(_QWORD, _QWORD *, _BYTE *, unint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), v6, v11, v16) != v16)
            {
              break;
            }
            if (v16 >= 4)
            {
              v17 = (v16 - 4);
              while (v11[v17] != 80 || v12[v17] != 75 || v12[v17 + 1] != 5 || v12[v17 + 2] != 6)
              {
                if (v17-- <= 0)
                  goto LABEL_28;
              }
              if (v8 - v15 + v17)
              {
                free(v11);
                v19 = v13 + 1024;
                if (v8 < v13 + 1024)
                  v19 = v8;
                if (v19 >= 0xFFFF)
                  v19 = 0xFFFFLL;
                v20 = v8 - v19 + v17;
                v37 = 1;
                goto LABEL_38;
              }
            }
LABEL_28:
            v13 = v15;
          }
          while (v9 > v14);
        }
        free(v11);
      }
    }
    v20 = 0;
    v37 = 0;
LABEL_38:
    v39 = 0;
    v40 = 0;
    v38 = 0;
    v33 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, _QWORD))&__src[2])(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v20, 0);
    Long = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v41);
    Short = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v40);
    v36 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v39);
    v21 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], (_QWORD *)&__src[4] + 1);
    v22 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v38);
    v24 = v38;
    v23 = v39;
    v25 = v40;
    v26 = *((_QWORD *)&__src[4] + 1);
    v27 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8]);
    v28 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8] + 1);
    v29 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &__src[5]);
    if (v20 < *(_QWORD *)&__src[8] + *((_QWORD *)&__src[8] + 1)
      || v29
      || v28
      || v27
      || v24 != v26
      || v23
      || v25
      || !v37
      || v22
      || v21
      || v36
      || Short
      || Long
      || v33)
    {
      (*((void (**)(_QWORD, _QWORD))&__src[2] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4]);
      return 0;
    }
    else
    {
      *((_QWORD *)&__src[5] + 1) = v20 - (*(_QWORD *)&__src[8] + *((_QWORD *)&__src[8] + 1));
      *((_QWORD *)&__src[7] + 1) = v20;
      *(_QWORD *)&__src[18] = 0;
      DWORD2(__src[18]) = 0;
      v30 = malloc_type_malloc(0x150uLL, 0x10F0040A626E916uLL);
      v6 = v30;
      if (v30)
      {
        memcpy(v30, __src, 0x150uLL);
        v31 = v6[17];
        v6[12] = 0;
        v6[13] = v31;
        v6[14] = unzlocal_GetCurrentFileInfoInternal((uint64_t)v6, (uint64_t)(v6 + 18), v6 + 35, 0, 0, 0, 0, 0, 0) == 0;
      }
    }
  }
  return v6;
}

uint64_t unzlocal_getLong(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  int v11;

  v11 = 0;
  if (unzlocal_getByte(a1, a2, &v11)
    || (v6 = v11, unzlocal_getByte(a1, a2, &v11))
    || (v7 = v11, unzlocal_getByte(a1, a2, &v11)))
  {
    v8 = 0;
    result = 0xFFFFFFFFLL;
  }
  else
  {
    v10 = v6 + (v7 << 8) + ((uint64_t)v11 << 16);
    result = unzlocal_getByte(a1, a2, &v11);
    v8 = v10 + ((uint64_t)v11 << 24);
    if ((_DWORD)result)
      v8 = 0;
  }
  *a3 = v8;
  return result;
}

uint64_t unzlocal_getShort(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int v9;

  v9 = 0;
  if (unzlocal_getByte(a1, a2, &v9))
  {
    v6 = 0;
    result = 0xFFFFFFFFLL;
  }
  else
  {
    v8 = v9;
    result = unzlocal_getByte(a1, a2, &v9);
    v6 = v8 + ((uint64_t)v9 << 8);
    if ((_DWORD)result)
      v6 = 0;
  }
  *a3 = v6;
  return result;
}

uint64_t unzGoToFirstFile(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  if (!a1)
    return 4294967194;
  v2 = a1[17];
  a1[12] = 0;
  a1[13] = v2;
  result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0, 0, 0, 0, 0, 0);
  a1[14] = (_DWORD)result == 0;
  return result;
}

_QWORD *unzOpen(uint64_t a1)
{
  return unzOpen2(a1, 0);
}

uint64_t unzClose(uint64_t a1)
{
  if (!a1)
    return 4294967194;
  if (*(_QWORD *)(a1 + 288))
    unzCloseCurrentFile(a1);
  (*(void (**)(_QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  free((void *)a1);
  return 0;
}

uint64_t unzCloseCurrentFile(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (!a1)
    return 4294967194;
  v2 = *(_QWORD *)(a1 + 288);
  if (!v2)
    return 4294967194;
  if (*(_QWORD *)(v2 + 184) || *(_DWORD *)(v2 + 280))
  {
    v3 = 0;
  }
  else if (*(_QWORD *)(v2 + 160) == *(_QWORD *)(v2 + 168))
  {
    v3 = 0;
  }
  else
  {
    v3 = 4294967191;
  }
  if (*(_QWORD *)v2)
    free(*(void **)v2);
  *(_QWORD *)v2 = 0;
  if (*(_QWORD *)(v2 + 128) == 8)
    inflateEnd((z_streamp)(v2 + 8));
  free((void *)v2);
  *(_QWORD *)(a1 + 288) = 0;
  return v3;
}

uint64_t unzGetGlobalInfo(uint64_t a1, _OWORD *a2)
{
  uint64_t result;

  if (!a1)
    return 4294967194;
  result = 0;
  *a2 = *(_OWORD *)(a1 + 72);
  return result;
}

uint64_t unzGetCurrentFileInfo(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  return unzlocal_GetCurrentFileInfoInternal(a1, a2, 0, a3, a4, a5, a6, a7, a8);
}

uint64_t unzlocal_GetCurrentFileInfoInternal(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  int v10;
  uint32x4_t v11;
  int8x16_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  int8x16_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  int Long;
  int v46;
  int v47;
  int v48;
  int Short;
  unsigned int v50;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  int8x16_t v63;
  uint64_t v64;

  if (!a1)
    return 4294967194;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88) + *(_QWORD *)(a1 + 104), 0)|| (v54 = 0, unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v54)))
  {
    v10 = -1;
  }
  else if (v54 == 33639248)
  {
    v10 = 0;
  }
  else
  {
    v10 = -103;
  }
  v50 = v10;
  v64 = 0;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v55 = 0;
  Short = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v56);
  v48 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), (_QWORD *)&v56 + 1);
  v47 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v57);
  v46 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), (_QWORD *)&v57 + 1);
  Long = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v58);
  LODWORD(v64) = ((v58 >> 21) & 0xF) - 1;
  HIDWORD(v64) = (v58 >> 25) + 1980;
  v11.i32[0] = v58;
  v12 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v58), (uint32x4_t)xmmword_E0B0);
  v12.i32[0] = vshlq_u32(v11, (uint32x4_t)xmmword_E0A0).u32[0];
  v63 = vandq_s8(v12, (int8x16_t)xmmword_E0C0);
  v13 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v58 + 1);
  v14 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v59);
  v15 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v59 + 1);
  v16 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v60);
  v17 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), (_QWORD *)&v60 + 1);
  v18 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v61);
  v19 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), (_QWORD *)&v61 + 1);
  v20 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v62);
  v21 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v62 + 1);
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v55) | v21 | v20 | v19 | v18 | v17 | v16 | v15 | v14 | v13 | Long | v46 | v47 | v48 | Short)
    v22 = 0xFFFFFFFFLL;
  else
    v22 = v50;
  v23 = v60;
  if (a4)
  {
    v25 = a7;
    v24 = a6;
    if ((_DWORD)v22)
    {
      v28 = a2;
      v27 = a3;
      v29 = a8;
    }
    else
    {
      v26 = a5;
      if ((unint64_t)v60 < a5)
      {
        *(_BYTE *)(a4 + v60) = 0;
        v26 = v23;
      }
      v22 = 0;
      if (a5)
      {
        v28 = a2;
        v27 = a3;
        v29 = a8;
        if (v23)
        {
          if ((*(uint64_t (**)(_QWORD, _QWORD))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)) == v26)
            v22 = 0;
          else
            v22 = 0xFFFFFFFFLL;
        }
      }
      else
      {
        v28 = a2;
        v27 = a3;
        v29 = a8;
      }
      v23 -= v26;
    }
  }
  else
  {
    v28 = a2;
    v27 = a3;
    v29 = a8;
    v25 = a7;
    v24 = a6;
  }
  v30 = *((_QWORD *)&v60 + 1);
  if (!v24 || (_DWORD)v22)
  {
    v33 = *((_QWORD *)&v60 + 1) + v23;
    if (!v29)
      goto LABEL_60;
    goto LABEL_46;
  }
  if (*((_QWORD *)&v60 + 1) >= v25)
    v31 = v25;
  else
    v31 = *((_QWORD *)&v60 + 1);
  if (!v23)
  {
    v22 = 0;
    if (!v25)
      goto LABEL_45;
    goto LABEL_41;
  }
  v32 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v23, 1);
  if (v32)
    v22 = 0xFFFFFFFFLL;
  else
    v22 = 0;
  if (!v32)
    v23 = 0;
  if (v25)
  {
LABEL_41:
    if (v30)
    {
      if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, unint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v24, v31) == v31)v22 = v22;
      else
        v22 = 0xFFFFFFFFLL;
    }
  }
LABEL_45:
  v33 = v30 - v31 + v23;
  if (!v29)
    goto LABEL_60;
LABEL_46:
  if (!(_DWORD)v22)
  {
    v34 = v61;
    v35 = a9;
    if ((unint64_t)v61 < a9)
    {
      *(_BYTE *)(v29 + v61) = 0;
      v35 = v34;
    }
    if (v33)
    {
      if ((*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v33, 1))
      {
        v22 = 0xFFFFFFFFLL;
      }
      else
      {
        v22 = 0;
      }
      if (!a9)
        goto LABEL_60;
LABEL_56:
      if (v34)
      {
        if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, unint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v29, v35) == v35)v22 = v22;
        else
          v22 = 0xFFFFFFFFLL;
      }
      goto LABEL_60;
    }
    v22 = 0;
    if (a9)
      goto LABEL_56;
  }
LABEL_60:
  if (v28 && !(_DWORD)v22)
  {
    v36 = v63;
    *(_OWORD *)(v28 + 96) = v62;
    *(int8x16_t *)(v28 + 112) = v36;
    *(_QWORD *)(v28 + 128) = v64;
    v37 = v59;
    *(_OWORD *)(v28 + 32) = v58;
    *(_OWORD *)(v28 + 48) = v37;
    v38 = v61;
    *(_OWORD *)(v28 + 64) = v60;
    *(_OWORD *)(v28 + 80) = v38;
    v39 = v57;
    *(_OWORD *)v28 = v56;
    *(_OWORD *)(v28 + 16) = v39;
  }
  if (v27 && !(_DWORD)v22)
    *v27 = v55;
  return v22;
}

uint64_t unzGoToNextFile(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t result;

  if (!a1)
    return 4294967194;
  if (!a1[14])
    return 4294967196;
  v2 = a1[9];
  v3 = a1[12] + 1;
  if (v2 != 0xFFFF && v3 == v2)
    return 4294967196;
  v5 = a1[26] + a1[27] + a1[28] + a1[13] + 46;
  a1[12] = v3;
  a1[13] = v5;
  result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0, 0, 0, 0, 0, 0);
  a1[14] = (_DWORD)result == 0;
  return result;
}

uint64_t unzLocateFile(uint64_t a1, char *__s, unsigned int a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  char v20[257];

  if (!a1 || strlen(__s) > 0xFF)
    return 4294967194;
  if (!*(_QWORD *)(a1 + 112))
    return 4294967196;
  v7 = *(_QWORD *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 104);
  v17 = *(_OWORD *)(a1 + 240);
  v18 = *(_OWORD *)(a1 + 256);
  v9 = *(_QWORD *)(a1 + 280);
  v19 = *(_QWORD *)(a1 + 272);
  v13 = *(_OWORD *)(a1 + 176);
  v14 = *(_OWORD *)(a1 + 192);
  v15 = *(_OWORD *)(a1 + 208);
  v16 = *(_OWORD *)(a1 + 224);
  v11 = *(_OWORD *)(a1 + 144);
  v12 = *(_OWORD *)(a1 + 160);
  v10 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = v10;
  result = unzlocal_GetCurrentFileInfoInternal(a1, a1 + 144, (_QWORD *)(a1 + 280), 0, 0, 0, 0, 0, 0);
  for (*(_QWORD *)(a1 + 112) = (_DWORD)result == 0; !(_DWORD)result; result = unzGoToNextFile((_QWORD *)a1))
  {
    result = unzlocal_GetCurrentFileInfoInternal(a1, 0, 0, (uint64_t)v20, 0x100uLL, 0, 0, 0, 0);
    if ((_DWORD)result)
      break;
    result = unzStringFileNameCompare(v20, __s, a3);
    if (!(_DWORD)result)
      return result;
  }
  *(_QWORD *)(a1 + 96) = v7;
  *(_QWORD *)(a1 + 104) = v8;
  *(_OWORD *)(a1 + 240) = v17;
  *(_OWORD *)(a1 + 256) = v18;
  *(_QWORD *)(a1 + 272) = v19;
  *(_OWORD *)(a1 + 176) = v13;
  *(_OWORD *)(a1 + 192) = v14;
  *(_OWORD *)(a1 + 208) = v15;
  *(_OWORD *)(a1 + 224) = v16;
  *(_OWORD *)(a1 + 144) = v11;
  *(_OWORD *)(a1 + 160) = v12;
  *(_QWORD *)(a1 + 280) = v9;
  return result;
}

uint64_t unzGetFilePos(int8x16_t *a1, int8x16_t *a2)
{
  uint64_t result;

  result = 4294967194;
  if (a1 && a2)
  {
    if (a1[7].i64[0])
    {
      result = 0;
      *a2 = vextq_s8(a1[6], a1[6], 8uLL);
    }
    else
    {
      return 4294967196;
    }
  }
  return result;
}

uint64_t unzGoToFilePos(int8x16_t *a1, int8x16_t *a2)
{
  uint64_t result;

  result = 4294967194;
  if (a1)
  {
    if (a2)
    {
      a1[6] = vextq_s8(*a2, *a2, 8uLL);
      result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)a1[9].i64, &a1[17].i64[1], 0, 0, 0, 0, 0, 0);
      a1[7].i64[0] = (_DWORD)result == 0;
    }
  }
  return result;
}

uint64_t unzOpenCurrentFile3(uint64_t a1, _DWORD *a2, int *a3, int a4, _BYTE *a5)
{
  int Long;
  uint64_t v11;
  int Short;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v22;
  int v23;
  char *v24;
  char *v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  const z_crc_t *crc_table;
  int v37;
  unsigned __int8 *v38;
  unint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52[2];

  if (!a1 || !*(_QWORD *)(a1 + 112))
    return 4294967194;
  if (*(_QWORD *)(a1 + 288))
    unzCloseCurrentFile(a1);
  if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88) + *(_QWORD *)(a1 + 280), 0))
  {
    return 4294967193;
  }
  v51 = 0;
  v52[0] = 0;
  v50 = 0;
  Long = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), v52);
  v11 = v52[0];
  Short = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v51);
  v13 = unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v50);
  if (unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v51))
  {
    v14 = -1;
  }
  else
  {
    if (v11 == 67324752)
      v18 = 0;
    else
      v18 = -103;
    v19 = v13 | Short | Long;
    if (v19)
      v14 = -1;
    else
      v14 = v18;
    if (!v19 && v11 == 67324752)
    {
      if (v51 == *(_QWORD *)(a1 + 168) && v51 <= 0xC && ((1 << v51) & 0x1101) != 0)
        v14 = 0;
      else
        v14 = -103;
    }
  }
  v15 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v51);
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v51))
  {
    v16 = -1;
  }
  else
  {
    if (v15)
      v16 = -1;
    else
      v16 = v14;
    if (!v16)
    {
      if (v51 == *(_QWORD *)(a1 + 184))
      {
        v16 = 0;
      }
      else if ((v50 & 8) != 0)
      {
        v16 = 0;
      }
      else
      {
        v16 = -103;
      }
    }
  }
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v51))
  {
    v16 = -1;
  }
  else if (!v16)
  {
    if (v51 == *(_QWORD *)(a1 + 192))
    {
      v16 = 0;
    }
    else if ((v50 & 8) != 0)
    {
      v16 = 0;
    }
    else
    {
      v16 = -103;
    }
  }
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), (uint64_t *)&v51))
  {
    v16 = -1;
  }
  else if (!v16)
  {
    if (v51 == *(_QWORD *)(a1 + 200))
    {
      v16 = 0;
    }
    else if ((v50 & 8) != 0)
    {
      v16 = 0;
    }
    else
    {
      v16 = -103;
    }
  }
  v49 = 0;
  if (unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v49))
  {
    v16 = -1;
    v20 = v49;
  }
  else
  {
    v20 = v49;
    if (!v16)
    {
      if (v49 == *(_QWORD *)(a1 + 208))
        v16 = 0;
      else
        v16 = -103;
    }
  }
  v48 = 0;
  if (unzlocal_getShort(a1, *(_QWORD *)(a1 + 64), &v48) || v16)
    return 4294967193;
  v22 = *(_QWORD *)(a1 + 280);
  v23 = v48;
  v24 = (char *)malloc_type_malloc(0x120uLL, 0x10B0040E43A3504uLL);
  if (!v24)
    return 4294967192;
  v25 = v24;
  v26 = malloc_type_malloc(0x4000uLL, 0x44898EB4uLL);
  *(_QWORD *)v25 = v26;
  *((_QWORD *)v25 + 17) = v20 + v22 + 30;
  *((_DWORD *)v25 + 36) = v23;
  *((_QWORD *)v25 + 19) = 0;
  *((_DWORD *)v25 + 70) = a4;
  if (!v26)
  {
    free(v25);
    return 4294967192;
  }
  *((_QWORD *)v25 + 16) = 0;
  if (a2)
    *a2 = *(_QWORD *)(a1 + 168);
  if (a3)
  {
    *a3 = 6;
    v27 = *(_QWORD *)(a1 + 160) & 6;
    switch(v27)
    {
      case 2:
        v28 = 9;
        break;
      case 6:
        v28 = 1;
        break;
      case 4:
        v28 = 2;
        break;
      default:
        goto LABEL_72;
    }
    *a3 = v28;
  }
LABEL_72:
  v29 = *(_QWORD *)(a1 + 184);
  *((_QWORD *)v25 + 20) = 0;
  *((_QWORD *)v25 + 21) = v29;
  *((_QWORD *)v25 + 33) = *(_QWORD *)(a1 + 168);
  *((_QWORD *)v25 + 32) = *(_QWORD *)(a1 + 64);
  v30 = *(_OWORD *)a1;
  v31 = *(_OWORD *)(a1 + 16);
  v32 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v25 + 14) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v25 + 15) = v32;
  *((_OWORD *)v25 + 12) = v30;
  *((_OWORD *)v25 + 13) = v31;
  *((_QWORD *)v25 + 34) = *(_QWORD *)(a1 + 88);
  *((_QWORD *)v25 + 6) = 0;
  v33 = *(_QWORD *)(a1 + 168);
  if (a4 || v33 != 12)
  {
    if (!a4 && v33 == 8)
    {
      *((_QWORD *)v25 + 1) = 0;
      *((_DWORD *)v25 + 4) = 0;
      *((_QWORD *)v25 + 10) = 0;
      *((_QWORD *)v25 + 11) = 0;
      *((_QWORD *)v25 + 9) = 0;
      v34 = inflateInit2_((z_streamp)(v25 + 8), -15, "1.2.12", 112);
      if ((_DWORD)v34)
      {
        v17 = v34;
        free(v25);
        return v17;
      }
      *((_QWORD *)v25 + 16) = 8;
    }
  }
  else
  {
    *((_DWORD *)v25 + 70) = 1;
  }
  *((_OWORD *)v25 + 11) = *(_OWORD *)(a1 + 192);
  *((_QWORD *)v25 + 15) = *(_QWORD *)(a1 + 280) + (v23 + v20) + 30;
  *((_DWORD *)v25 + 4) = 0;
  *(_QWORD *)(a1 + 288) = v25;
  *(_DWORD *)(a1 + 296) = 0;
  if (!a5)
    return 0;
  v35 = 878082192;
  crc_table = get_crc_table();
  *(_OWORD *)(a1 + 304) = xmmword_E0D0;
  *(_QWORD *)(a1 + 320) = 878082192;
  *(_QWORD *)(a1 + 328) = crc_table;
  v37 = *a5;
  if (*a5)
  {
    v38 = a5 + 1;
    v39 = 305419896;
    v40 = 591751049;
    do
    {
      v39 = crc_table[v37 ^ v39] ^ (v39 >> 8);
      v40 = 134775813 * (v40 + v39) + 1;
      *(_QWORD *)(a1 + 304) = v39;
      *(_QWORD *)(a1 + 312) = v40;
      v35 = crc_table[(v35 ^ BYTE3(v40))] ^ (v35 >> 8);
      *(_QWORD *)(a1 + 320) = v35;
      v41 = *v38++;
      v37 = v41;
    }
    while (v41);
  }
  if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 288) + 272) + *(_QWORD *)(*(_QWORD *)(a1 + 288) + 120), 0)|| (unint64_t)(*(uint64_t (**)(_QWORD, _QWORD, uint64_t *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v52, 12) < 0xC)
  {
    return 4294967192;
  }
  v42 = 0;
  v44 = *(_QWORD *)(a1 + 320);
  v43 = *(_QWORD *)(a1 + 328);
  v45 = *(_QWORD *)(a1 + 304);
  v46 = *(_QWORD *)(a1 + 312);
  do
  {
    v47 = *((_BYTE *)v52 + v42) ^ ((unsigned __int16)((v44 & 0xFFFD ^ 3) * (v44 | 2)) >> 8);
    *((_BYTE *)v52 + v42) = v47;
    v45 = *(_QWORD *)(v43 + 8 * (v47 ^ v45)) ^ (v45 >> 8);
    v46 = 134775813 * (v46 + v45) + 1;
    *(_QWORD *)(a1 + 304) = v45;
    *(_QWORD *)(a1 + 312) = v46;
    v44 = *(_QWORD *)(v43 + 8 * (v44 ^ BYTE3(v46))) ^ (v44 >> 8);
    *(_QWORD *)(a1 + 320) = v44;
    ++v42;
  }
  while (v42 != 12);
  v17 = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 288) + 120) += 12;
  *(_DWORD *)(a1 + 296) = 1;
  return v17;
}

uint64_t unzOpenCurrentFile(uint64_t a1)
{
  return unzOpenCurrentFile3(a1, 0, 0, 0, 0);
}

uint64_t unzOpenCurrentFilePassword(uint64_t a1, _BYTE *a2)
{
  return unzOpenCurrentFile3(a1, 0, 0, 0, a2);
}

uint64_t unzOpenCurrentFile2(uint64_t a1, _DWORD *a2, int *a3, int a4)
{
  return unzOpenCurrentFile3(a1, a2, a3, a4, 0);
}

uint64_t unzReadCurrentFile(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  const Bytef *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  if (!a1)
    return 4294967194;
  v4 = *(_QWORD *)(a1 + 288);
  if (!v4)
    return 4294967194;
  if (!*(_QWORD *)v4)
    return 4294967196;
  if (!a3)
    return 0;
  *(_QWORD *)(v4 + 32) = a2;
  *(_DWORD *)(v4 + 40) = a3;
  v5 = a3;
  v6 = *(_QWORD *)(v4 + 184);
  if (v6 < a3 && !*(_DWORD *)(v4 + 280))
  {
    *(_DWORD *)(v4 + 40) = v6;
    a3 = v6;
  }
  v7 = *(_QWORD *)(v4 + 176);
  v8 = *(unsigned int *)(v4 + 16);
  if (v7 + v8 < v5 && *(_DWORD *)(v4 + 280))
  {
    a3 = v8 + v7;
    *(_DWORD *)(v4 + 40) = v8 + v7;
  }
  if (!a3)
    return 0;
  v9 = 0;
  while (1)
  {
    LODWORD(v10) = *(_DWORD *)(v4 + 16);
    if (!(_DWORD)v10)
    {
      v11 = *(_QWORD *)(v4 + 176);
      if (v11)
      {
        if (v11 >= 0x4000)
          v10 = 0x4000;
        else
          v10 = *(_QWORD *)(v4 + 176);
        if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v4 + 224))(*(_QWORD *)(v4 + 248), *(_QWORD *)(v4 + 256), *(_QWORD *)(v4 + 272) + *(_QWORD *)(v4 + 120), 0)|| (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(v4 + 200))(*(_QWORD *)(v4 + 248), *(_QWORD *)(v4 + 256), *(_QWORD *)v4, v10) != v10)
        {
          return 0xFFFFFFFFLL;
        }
        if (*(_DWORD *)(a1 + 296))
        {
          v12 = 0;
          do
          {
            v13 = *(_QWORD *)(a1 + 328);
            v14 = *(unsigned __int8 *)(*(_QWORD *)v4 + v12) ^ (((*(_DWORD *)(a1 + 320) & 0xFFFD ^ 3)
                                                              * (*(_DWORD *)(a1 + 320) | 2u)) >> 8);
            *(_BYTE *)(*(_QWORD *)v4 + v12) ^= (unsigned __int16)((*(_WORD *)(a1 + 320) & 0xFFFD ^ 3)
                                                                * (*(_WORD *)(a1 + 320) | 2)) >> 8;
            v15 = *(_QWORD *)(v13 + 8 * (v14 ^ *(_QWORD *)(a1 + 304))) ^ (*(_QWORD *)(a1 + 304) >> 8);
            v16 = 134775813 * (*(_QWORD *)(a1 + 312) + v15) + 1;
            *(_QWORD *)(a1 + 304) = v15;
            *(_QWORD *)(a1 + 312) = v16;
            *(_QWORD *)(a1 + 320) = *(_QWORD *)(v13 + 8 * (*(_QWORD *)(a1 + 320) ^ BYTE3(v16))) ^ (*(_QWORD *)(a1 + 320) >> 8);
            *(_BYTE *)(*(_QWORD *)v4 + v12++) = v14;
          }
          while (v10 != v12);
        }
        *(_QWORD *)(v4 + 120) += v10;
        *(_QWORD *)(v4 + 176) -= v10;
        *(_QWORD *)(v4 + 8) = *(_QWORD *)v4;
        *(_DWORD *)(v4 + 16) = v10;
      }
      else
      {
        LODWORD(v10) = 0;
      }
    }
    v17 = *(_QWORD *)(v4 + 264);
    if (!v17 || *(_DWORD *)(v4 + 280))
    {
      if (!(_DWORD)v10 && !*(_QWORD *)(v4 + 176))
        return v9;
      v18 = *(_DWORD *)(v4 + 40);
      if (v18 >= v10)
        v10 = v10;
      else
        v10 = v18;
      if ((_DWORD)v10)
      {
        for (i = 0; i != v10; ++i)
          *(_BYTE *)(*(_QWORD *)(v4 + 32) + i) = *(_BYTE *)(*(_QWORD *)(v4 + 8) + i);
        v20 = v10;
      }
      else
      {
        v20 = 0;
      }
      *(_QWORD *)(v4 + 160) = crc32(*(_QWORD *)(v4 + 160), *(const Bytef **)(v4 + 32), v10);
      *(_QWORD *)(v4 + 184) -= v20;
      *(_DWORD *)(v4 + 16) -= v10;
      *(_DWORD *)(v4 + 40) -= v10;
      *(_QWORD *)(v4 + 32) += v20;
      *(_QWORD *)(v4 + 8) += v20;
      v9 = (v10 + v9);
      *(_QWORD *)(v4 + 48) += v20;
      goto LABEL_38;
    }
    if (v17 != 12)
    {
      v21 = *(_QWORD *)(v4 + 48);
      v22 = *(const Bytef **)(v4 + 32);
      v23 = inflate((z_streamp)(v4 + 8), 2);
      if ((v23 & 0x80000000) == 0 && *(_QWORD *)(v4 + 56))
      {
        v26 = *(_QWORD *)(v4 + 48);
        v27 = v26 - v21;
        *(_QWORD *)(v4 + 160) = crc32(*(_QWORD *)(v4 + 160), v22, (int)v26 - (int)v21);
        *(_QWORD *)(v4 + 184) -= v27;
        return 4294967293;
      }
      v24 = *(_QWORD *)(v4 + 48) - v21;
      *(_QWORD *)(v4 + 160) = crc32(*(_QWORD *)(v4 + 160), v22, v24);
      *(_QWORD *)(v4 + 184) -= v24;
      v9 = (v9 + v24);
      if (v23)
        break;
    }
LABEL_38:
    if (!*(_DWORD *)(v4 + 40))
      return v9;
  }
  if (v23 == 1)
    return v9;
  else
    return v23;
}

uint64_t unztell(uint64_t a1)
{
  uint64_t v1;

  if (a1 && (v1 = *(_QWORD *)(a1 + 288)) != 0)
    return *(_QWORD *)(v1 + 48);
  else
    return -102;
}

uint64_t unzeof(uint64_t a1)
{
  uint64_t v1;

  if (a1 && (v1 = *(_QWORD *)(a1 + 288)) != 0)
    return *(_QWORD *)(v1 + 184) == 0;
  else
    return 4294967194;
}

unint64_t unzGetLocalExtrafield(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;

  if (!a1)
    return 4294967194;
  v3 = *(_QWORD *)(a1 + 288);
  if (!v3)
    return 4294967194;
  v5 = *(_QWORD *)(v3 + 152);
  result = *(unsigned int *)(v3 + 144) - v5;
  if (a2)
  {
    if (result >= a3)
      v7 = a3;
    else
      v7 = result;
    if ((_DWORD)v7)
    {
      if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(v3 + 224))(*(_QWORD *)(v3 + 248), *(_QWORD *)(v3 + 256), *(_QWORD *)(v3 + 136) + v5, 0))
      {
        return 0xFFFFFFFFLL;
      }
      else if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v3 + 200))(*(_QWORD *)(v3 + 248), *(_QWORD *)(v3 + 256), a2, v7) == v7)
      {
        return v7;
      }
      else
      {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t unzGetGlobalComment(uint64_t a1, _BYTE *a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v8;

  if (!a1)
    return 4294967194;
  if (*(_QWORD *)(a1 + 80) >= a3)
    v6 = a3;
  else
    v6 = *(_QWORD *)(a1 + 80);
  if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 120) + 22, 0))
  {
    return 0xFFFFFFFFLL;
  }
  if (v6)
  {
    *a2 = 0;
    if ((*(uint64_t (**)(_QWORD, _QWORD, _BYTE *, unint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a2, v6) != v6)return 0xFFFFFFFFLL;
  }
  else if (!a2)
  {
    return v6;
  }
  v8 = *(_QWORD *)(a1 + 80);
  if (v8 < a3)
    a2[v8] = 0;
  return v6;
}

_QWORD *unzGetOffset(_QWORD *result)
{
  uint64_t v1;
  BOOL v2;

  if (result)
  {
    if (result[14] && ((v1 = result[9]) != 0 ? (v2 = v1 == 0xFFFF) : (v2 = 1), v2 || result[12] != v1))
      return (_QWORD *)result[13];
    else
      return 0;
  }
  return result;
}

uint64_t unzSetOffset(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  if (!a1)
    return 4294967194;
  a1[12] = a1[9];
  a1[13] = a2;
  result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0, 0, 0, 0, 0, 0);
  a1[14] = (_DWORD)result == 0;
  return result;
}

uint64_t unzlocal_getByte(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  unsigned __int8 v7;

  v7 = 0;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), a2, &v7, 1) == 1)
  {
    result = 0;
    *a3 = v7;
  }
  else if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), a2))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void *zipOpen2(uint64_t a1, int a2, _QWORD *a3, _OWORD *a4)
{
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  unint64_t v36;
  BOOL v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  char *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  int v47;
  unint64_t v48;
  int v49;
  _QWORD *v51;
  uint64_t v52;
  int Long;
  int Short;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  _OWORD __src[1046];

  memset(__src, 0, 512);
  if (a4)
  {
    v7 = a4[1];
    __src[0] = *a4;
    __src[1] = v7;
    v8 = a4[3];
    __src[2] = a4[2];
    __src[3] = v8;
  }
  else
  {
    fill_fopen_filefunc((FILE *(**)(int, char *, char))__src);
  }
  if (a2)
    v9 = 7;
  else
    v9 = 11;
  v10 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))&__src[0])(*((_QWORD *)&__src[3] + 1), a1, v9);
  *(_QWORD *)&__src[4] = v10;
  if (!v10)
    return 0;
  v11 = v10;
  if (a2 == 1)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))&__src[2])(*((_QWORD *)&__src[3] + 1), v10, 0, 2);
    v11 = *(_QWORD *)&__src[4];
  }
  *(_QWORD *)&__src[1044] = (*((uint64_t (**)(_QWORD, uint64_t))&__src[1] + 1))(*((_QWORD *)&__src[3] + 1), v11);
  *(_OWORD *)((char *)&__src[4] + 8) = 0u;
  LODWORD(__src[13]) = 0;
  DWORD2(__src[5]) = 0;
  *(_OWORD *)((char *)&__src[1044] + 8) = 0u;
  v12 = malloc_type_malloc(0x4160uLL, 0x10F0040221808EAuLL);
  if (!v12)
  {
    (*((void (**)(_QWORD, _QWORD))&__src[2] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4]);
    return v12;
  }
  *((_QWORD *)&__src[1045] + 1) = 0;
  if (a2 == 2)
  {
    v51 = a3;
    v63 = 0;
    v64 = 0;
    v60 = 0;
    v61 = 0;
    v58 = 0;
    v59 = 0;
    v57 = 0;
    v13 = *(_QWORD *)&__src[4];
    v14 = 0;
    if (!(*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))&__src[2])(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], 0, 2))
    {
      v15 = (*((uint64_t (**)(_QWORD, uint64_t))&__src[1] + 1))(*((_QWORD *)&__src[3] + 1), v13);
      v16 = v15;
      if (v15 >= 0xFFFF)
        v17 = 0xFFFFLL;
      else
        v17 = v15;
      v18 = malloc_type_malloc(0x404uLL, 0x204A60F4uLL);
      if (v18)
      {
        v19 = v18;
        if (v17 >= 5)
        {
          v20 = 4;
          do
          {
            v21 = v20 + 1024;
            v22 = v20 + 1024 >= v17 ? v17 : v20 + 1024;
            v23 = v22 >= 0x404 ? 1028 : v22;
            if ((*(uint64_t (**)(_QWORD, uint64_t, unint64_t, _QWORD))&__src[2])(*((_QWORD *)&__src[3] + 1), v13, v16 - v22, 0)|| (*((uint64_t (**)(_QWORD, uint64_t, _BYTE *, unint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), v13, v19, v23) != v23)
            {
              break;
            }
            if (v23 >= 4)
            {
              v24 = (v23 - 4) + 1;
              while (v19[v24 - 1] != 80 || v19[v24] != 75 || v19[v24 + 1] != 5 || v19[v24 + 2] != 6)
              {
                if (v24-- <= 1)
                  goto LABEL_35;
              }
              if (v16 - v22 + v24 != 1)
              {
                v26 = v20 + 1024;
                if (v16 < v20 + 1024)
                  v26 = v16;
                if (v26 >= 0xFFFF)
                  v26 = 0xFFFFLL;
                v14 = v16 - v26 + v24 - 1;
                goto LABEL_51;
              }
            }
LABEL_35:
            v20 = v22;
          }
          while (v17 > v21);
        }
        v14 = 0;
LABEL_51:
        free(v19);
      }
      else
      {
        v14 = 0;
      }
    }
    v52 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, _QWORD))&__src[2])(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v14, 0);
    Long = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v62);
    Short = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v61);
    v55 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v60);
    v28 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v59);
    v29 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v58);
    v30 = v59;
    v56 = v58;
    v32 = v60;
    v31 = v61;
    v33 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&v64);
    v34 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v63);
    v35 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v57);
    v36 = v64;
    v37 = v14 >= v64 + v63;
    v38 = v14 - (v64 + v63);
    if (!v37 || v35 || v34 || v33 || v56 != v30 || v32 || v31 || v29 || v28 || v55 || Short || Long || v52)
    {
      (*((void (**)(_QWORD, _QWORD))&__src[2] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4]);
LABEL_83:
      free(v12);
      return 0;
    }
    v39 = v63;
    v40 = v57;
    if (v57)
    {
      v41 = malloc_type_malloc(v57 + 1, 0x8B5E25EBuLL);
      *((_QWORD *)&__src[1045] + 1) = v41;
      if (v41)
      {
        v42 = (*((uint64_t (**)(_QWORD, _QWORD, void *, uint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v41, v40);
        *(_BYTE *)(*((_QWORD *)&__src[1045] + 1) + v42) = 0;
      }
    }
    *((_QWORD *)&__src[1044] + 1) = v38;
    v43 = (char *)malloc_type_malloc(0xFF0uLL, 0x43F3CCC4uLL);
    v44 = v38;
    v45 = v38 + v39;
    v46 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, _QWORD))&__src[2])(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v38 + v39, 0);
    if (v46)
      v47 = -1;
    else
      v47 = 0;
    if (v36 && !v46)
    {
      while (1)
      {
        v48 = v36 >= 0xFF0 ? 4080 : v36;
        if ((*((uint64_t (**)(_QWORD, _QWORD, char *, unint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v43, v48) != v48)break;
        v49 = add_data_in_datablock((_QWORD *)&__src[4] + 1, v43, v48);
        v47 = v49;
        v36 -= v48;
        if (!v36 || v49)
          goto LABEL_87;
      }
      v47 = -1;
    }
LABEL_87:
    if (v43)
      free(v43);
    *(_QWORD *)&__src[1044] = v44;
    *(_QWORD *)&__src[1045] = v56;
    if ((*(uint64_t (**)(_QWORD, _QWORD, unint64_t, _QWORD))&__src[2])(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v45, 0))
    {
      v27 = -1;
    }
    else
    {
      v27 = v47;
    }
    a3 = v51;
    if (!v51)
      goto LABEL_46;
    goto LABEL_45;
  }
  v27 = 0;
  if (a3)
LABEL_45:
    *a3 = *((_QWORD *)&__src[1045] + 1);
LABEL_46:
  if (v27)
  {
    if (*((_QWORD *)&__src[1045] + 1))
      free(*((void **)&__src[1045] + 1));
    goto LABEL_83;
  }
  memcpy(v12, __src, 0x4160uLL);
  return v12;
}

uint64_t add_data_in_datablock(_QWORD *a1, char *a2, unint64_t a3)
{
  unint64_t v3;
  _QWORD *v6;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  unsigned int v12;
  _BYTE *v13;
  uint64_t v14;
  char *v15;
  char v16;

  if (!a1)
    return 4294967192;
  v3 = a3;
  v6 = (_QWORD *)a1[1];
  if (v6)
  {
    if (!a3)
      return 0;
  }
  else
  {
    v8 = (char *)malloc_type_malloc(0x1010uLL, 0x1020040BBE2FE16uLL);
    if (!v8)
    {
      *a1 = 0;
      a1[1] = 0;
      return 4294967192;
    }
    v6 = v8;
    *(_QWORD *)v8 = 0;
    *(_OWORD *)(v8 + 8) = xmmword_E140;
    *a1 = v8;
    a1[1] = v8;
    if (!v3)
      return 0;
  }
  v9 = v6[1];
  while (v9)
  {
    v10 = v6[2];
LABEL_13:
    if (v9 >= v3)
      v12 = v3;
    else
      v12 = v9;
    if (v12)
    {
      v13 = (char *)v6 + v10 + 32;
      v14 = v12;
      v15 = a2;
      do
      {
        v16 = *v15++;
        *v13++ = v16;
        --v14;
      }
      while (v14);
      v9 = v6[1];
      v10 = v6[2];
    }
    v9 -= v12;
    v6[1] = v9;
    v6[2] = v10 + v12;
    a2 += v12;
    v3 -= v12;
    if (!v3)
      return 0;
  }
  v11 = (char *)malloc_type_malloc(0x1010uLL, 0x1020040BBE2FE16uLL);
  if (v11)
  {
    v10 = 0;
    *(_QWORD *)v11 = 0;
    *(_OWORD *)(v11 + 8) = xmmword_E140;
    *v6 = v11;
    v9 = 4080;
    v6 = v11;
    a1[1] = v11;
    goto LABEL_13;
  }
  *v6 = 0;
  return 4294967192;
}

void *zipOpen(uint64_t a1, int a2)
{
  return zipOpen2(a1, a2, 0, 0);
}

uint64_t zipOpenNewFileInZip4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *__s, int a9, int a10, int a11, int a12, int a13, int a14, _BYTE *a15, uint64_t a16, unint64_t a17, uint64_t a18)
{
  uint64_t result;
  const char *v27;
  unsigned int v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  size_t v36;
  _DWORD *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  _DWORD *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _DWORD *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  _DWORD *v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t i;
  uint64_t v62;
  uint64_t v63;
  char v64;
  unint64_t v65;
  char v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  int v79;
  _DWORD *v80;
  _BYTE *v81;
  uint64_t v82;
  const z_crc_t *crc_table;
  int v85;
  uint64_t j;
  unsigned int v87;
  unint64_t v88;
  z_crc_t v89;
  uint64_t v90;
  uint64_t v91;
  z_crc_t v92;
  z_crc_t v93;
  uint64_t v94;
  __int16 v95;
  char v96;
  int v97;
  z_crc_t v98;
  uint64_t v99;
  z_crc_t v100;
  z_crc_t v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  unsigned int v105;
  unsigned int v106;
  _DWORD v107[2];
  char v108;
  char v109;
  _BYTE v110[10];

  result = 4294967194;
  if (!a1)
    return result;
  if ((a9 & 0xFFFFFFF7) != 0)
    return result;
  if (*(_DWORD *)(a1 + 88) == 1)
  {
    result = zipCloseFileInZipRaw(a1, 0, 0);
    if ((_DWORD)result)
      return result;
  }
  v105 = a5;
  if (a2)
    v27 = a2;
  else
    v27 = "-";
  v104 = a4;
  if (__s)
    v106 = strlen(__s);
  else
    v106 = 0;
  v28 = strlen(v27);
  if (a3)
  {
    v29 = *(_QWORD *)(a3 + 24);
    if (!v29)
    {
      v30 = *(unsigned int *)(a3 + 20);
      v31 = v30 - 80;
      if (v30 <= 0x4F)
        v31 = *(unsigned int *)(a3 + 20);
      if (v30 <= 0x7BB)
        v32 = v31;
      else
        v32 = v30 - 1980;
      v29 = ((32 * *(_DWORD *)(a3 + 4) + (*(_DWORD *)a3 >> 1))
           + ((unint64_t)*(unsigned int *)(a3 + 8) << 11)) | (((unint64_t)(*(_DWORD *)(a3 + 12) + 32 * *(_DWORD *)(a3 + 16) + 32) << 16)
                                                                   + (v32 << 25));
    }
  }
  else
  {
    v29 = 0;
  }
  *(_QWORD *)(a1 + 16640) = v29;
  if ((a10 & 0xFFFFFFFE) == 8)
    v33 = a18 | 2;
  else
    v33 = a18;
  *(_QWORD *)(a1 + 240) = v33;
  if (a10 == 2)
  {
    v35 = 4;
    v34 = v28;
  }
  else
  {
    v34 = v28;
    if (a10 != 1)
      goto LABEL_28;
    v35 = 6;
  }
  v33 |= v35;
  *(_QWORD *)(a1 + 240) = v33;
LABEL_28:
  if (a15)
    *(_QWORD *)(a1 + 240) = v33 | 1;
  *(_QWORD *)(a1 + 16648) = 0;
  *(_DWORD *)(a1 + 16656) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_DWORD *)(a1 + 248) = a9;
  *(_DWORD *)(a1 + 252) = a11;
  *(_QWORD *)(a1 + 216) = (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 24))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v36 = a7 + v106 + v34 + 46;
  *(_QWORD *)(a1 + 232) = v36;
  v37 = malloc_type_malloc(v36, 0x34D9D5B9uLL);
  *(_QWORD *)(a1 + 224) = v37;
  *v37 = 33639248;
  v38 = *(_QWORD *)(a1 + 224);
  *(_WORD *)(v38 + 4) = a17;
  if (a17 >= 0x10000)
    *(_WORD *)(v38 + 4) = -1;
  *(_WORD *)(*(_QWORD *)(a1 + 224) + 6) = 20;
  v39 = *(_QWORD *)(a1 + 224);
  v40 = *(_QWORD *)(a1 + 240);
  *(_WORD *)(v39 + 8) = v40;
  if (v40 >= 0x10000)
    *(_WORD *)(v39 + 8) = -1;
  v41 = *(_QWORD *)(a1 + 224);
  v42 = *(_DWORD *)(a1 + 248);
  *(_WORD *)(v41 + 10) = v42;
  if (v42 >= 0x10000)
    *(_WORD *)(v41 + 10) = -1;
  v43 = 0;
  v44 = (_DWORD *)(*(_QWORD *)(a1 + 224) + 12);
  v45 = *(_QWORD *)(a1 + 16640);
  do
  {
    v46 = v45;
    *((_BYTE *)v44 + v43) = v45;
    v45 >>= 8;
    ++v43;
  }
  while (v43 != 4);
  if (v46 >= 0x100)
    *v44 = -1;
  *(_DWORD *)(*(_QWORD *)(a1 + 224) + 16) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 224) + 20) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 224) + 24) = 0;
  v47 = *(_QWORD *)(a1 + 224);
  *(_WORD *)(v47 + 28) = v34;
  if (v34 >= 0x10000uLL)
    *(_WORD *)(v47 + 28) = -1;
  v48 = *(_QWORD *)(a1 + 224);
  *(_WORD *)(v48 + 30) = a7;
  if (a7 >= 0x10000)
    *(_WORD *)(v48 + 30) = -1;
  v49 = *(_QWORD *)(a1 + 224);
  *(_WORD *)(v49 + 32) = v106;
  if (v106 >= 0x10000)
    *(_WORD *)(v49 + 32) = -1;
  v50 = v106;
  *(_WORD *)(*(_QWORD *)(a1 + 224) + 34) = 0;
  v51 = *(_QWORD *)(a1 + 224);
  if (a3)
  {
    v52 = *(_QWORD *)(a3 + 32);
    *(_WORD *)(v51 + 36) = v52;
    if (v52 >= 0x10000)
      *(_WORD *)(v51 + 36) = -1;
    v53 = 0;
    v54 = (_DWORD *)(*(_QWORD *)(a1 + 224) + 38);
    v55 = *(_QWORD *)(a3 + 40);
    do
    {
      v56 = v55;
      *((_BYTE *)v54 + v53) = v55;
      v55 >>= 8;
      ++v53;
    }
    while (v53 != 4);
    if (v56 >= 0x100)
      *v54 = -1;
  }
  else
  {
    *(_WORD *)(v51 + 36) = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 224) + 38) = 0;
  }
  v57 = 0;
  v58 = (_DWORD *)(*(_QWORD *)(a1 + 224) + 42);
  v59 = *(_QWORD *)(a1 + 216) - *(_QWORD *)(a1 + 16712);
  do
  {
    v60 = v59;
    *((_BYTE *)v58 + v57) = v59;
    v59 >>= 8;
    ++v57;
  }
  while (v57 != 4);
  if (v60 >= 0x100)
    *v58 = -1;
  if (v34)
  {
    for (i = 0; i != v34; ++i)
      *(_BYTE *)(*(_QWORD *)(a1 + 224) + i + 46) = v27[i];
  }
  if (a7)
  {
    v62 = v34 + 46;
    v63 = a7;
    do
    {
      v64 = *a6++;
      *(_BYTE *)(*(_QWORD *)(a1 + 224) + v62++) = v64;
      --v63;
    }
    while (v63);
  }
  if (v106)
  {
    v65 = a7 + (unint64_t)v34 + 46;
    do
    {
      v66 = *__s++;
      *(_BYTE *)(*(_QWORD *)(a1 + 224) + v65++) = v66;
      --v50;
    }
    while (v50);
  }
  if (!*(_QWORD *)(a1 + 224))
    return 4294967192;
  v107[0] = 67324752;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v107, 4) != 4)goto LABEL_97;
  LOWORD(v107[0]) = 20;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v107, 2) != 2)goto LABEL_97;
  v67 = *(_QWORD *)(a1 + 64);
  v68 = *(_QWORD *)(a1 + 240);
  LOWORD(v107[0]) = v68;
  if (v68 >= 0x10000)
    LOWORD(v107[0]) = -1;
  if ((*(uint64_t (**)(_QWORD, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v67, v107, 2) != 2)
    goto LABEL_97;
  v69 = *(_QWORD *)(a1 + 64);
  v70 = *(_DWORD *)(a1 + 248);
  LOWORD(v107[0]) = v70;
  if (v70 >= 0x10000)
    LOWORD(v107[0]) = -1;
  if ((*(uint64_t (**)(_QWORD, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v69, v107, 2) != 2)
    goto LABEL_97;
  v71 = 0;
  v72 = *(_QWORD *)(a1 + 64);
  v73 = *(_QWORD *)(a1 + 16640);
  do
  {
    v74 = v73;
    *((_BYTE *)v107 + v71) = v73;
    v73 >>= 8;
    ++v71;
  }
  while (v71 != 4);
  if (v74 >= 0x100)
    v107[0] = -1;
  if ((*(uint64_t (**)(_QWORD, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v72, v107, 4) != 4)
    goto LABEL_97;
  v107[0] = 0;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v107, 4) != 4)goto LABEL_97;
  v107[0] = 0;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v107, 4) != 4)goto LABEL_97;
  v107[0] = 0;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v107, 4) != 4)goto LABEL_97;
  v75 = *(_QWORD *)(a1 + 64);
  LOWORD(v107[0]) = v34;
  if (v34 >= 0x10000uLL)
    LOWORD(v107[0]) = -1;
  if ((*(uint64_t (**)(_QWORD, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v75, v107, 2) == 2)
  {
    v76 = *(_QWORD *)(a1 + 64);
    LOWORD(v107[0]) = v105;
    if (v105 >= 0x10000)
      LOWORD(v107[0]) = -1;
    v77 = (*(uint64_t (**)(_QWORD, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v76, v107, 2);
    v78 = v77 != 2;
    if (v77 == 2 && v34)
      v78 = (*(uint64_t (**)(_QWORD, _QWORD, const char *, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v27, v34) != v34;
    v79 = v78 << 31 >> 31;
    v80 = (_DWORD *)(a1 + 16656);
    v81 = a15;
    if (v105 && (v78 & 1) == 0)
    {
      v82 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v104, v105);
      v80 = (_DWORD *)(a1 + 16656);
      v81 = a15;
      if (v82 == v105)
        v79 = 0;
      else
        v79 = -1;
    }
  }
  else
  {
LABEL_97:
    v79 = -1;
    v80 = (_DWORD *)(a1 + 16656);
    v81 = a15;
  }
  *(_DWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 128) = 0x4000;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = a1 + 256;
  *(_QWORD *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 184) = 0;
  if (v79)
  {
    result = 0xFFFFFFFFLL;
LABEL_100:
    v80[10] = 0;
    return result;
  }
  if (*(_DWORD *)(a1 + 248) == 8 && !*(_DWORD *)(a1 + 252))
  {
    if (a12 < 0)
      v103 = a12;
    else
      v103 = -a12;
    *(_QWORD *)(a1 + 160) = 0;
    *(_QWORD *)(a1 + 168) = 0;
    *(_QWORD *)(a1 + 176) = 0;
    result = deflateInit2_((z_streamp)(a1 + 96), a10, 8, v103, a13, a14, "1.2.12", 112);
    v80 = (_DWORD *)(a1 + 16656);
    if ((_DWORD)result)
      goto LABEL_100;
    *(_DWORD *)(a1 + 208) = 1;
    v81 = a15;
  }
  v80[10] = 0;
  if (!v81)
    goto LABEL_112;
  *v80 = 1;
  crc_table = get_crc_table();
  *(_QWORD *)(a1 + 16688) = crc_table;
  if (!crypthead_calls++)
  {
    v85 = time(0);
    srand(v85 ^ 0xBB40E64E);
  }
  init_keys(a15, a1 + 16664, (uint64_t)crc_table);
  for (j = 0; j != 10; v110[j++] = ((unsigned __int16)((v88 & 0xFFFD ^ 3) * (v88 | 2)) >> 8) ^ (v87 >> 7))
  {
    v87 = rand();
    v88 = *(_QWORD *)(a1 + 16680);
    v89 = crc_table[(*(_QWORD *)(a1 + 16664) ^ (v87 >> 7))] ^ (*(_QWORD *)(a1 + 16664) >> 8);
    *(_QWORD *)(a1 + 16664) = v89;
    v90 = 134775813 * (*(_QWORD *)(a1 + 16672) + v89) + 1;
    *(_QWORD *)(a1 + 16672) = v90;
    *(_QWORD *)(a1 + 16680) = crc_table[(v88 ^ BYTE3(v90))] ^ (v88 >> 8);
  }
  init_keys(a15, a1 + 16664, (uint64_t)crc_table);
  v91 = 0;
  v92 = *(_QWORD *)(a1 + 16680);
  v93 = *(_QWORD *)(a1 + 16664);
  v94 = *(_QWORD *)(a1 + 16672);
  do
  {
    v95 = (v92 & 0xFFFD ^ 3) * (v92 | 2);
    v96 = v110[v91];
    v93 = crc_table[(v96 ^ v93)] ^ (v93 >> 8);
    *(_QWORD *)(a1 + 16664) = v93;
    v94 = 134775813 * (v94 + v93) + 1;
    *(_QWORD *)(a1 + 16672) = v94;
    v92 = crc_table[(v92 ^ BYTE3(v94))] ^ (v92 >> 8);
    *(_QWORD *)(a1 + 16680) = v92;
    *((_BYTE *)v107 + v91++) = v96 ^ HIBYTE(v95);
  }
  while (v91 != 10);
  v97 = ((v92 & 0xFFFFFFFD ^ 3) * (v92 | 2)) >> 8;
  v98 = crc_table[(v93 ^ BYTE2(a16))] ^ (v93 >> 8);
  *(_QWORD *)(a1 + 16664) = v98;
  v99 = 134775813 * (v94 + v98) + 1;
  *(_QWORD *)(a1 + 16672) = v99;
  v100 = crc_table[(v92 ^ BYTE3(v99))] ^ (v92 >> 8);
  *(_QWORD *)(a1 + 16680) = v100;
  v108 = v97 ^ BYTE2(a16);
  v101 = crc_table[v98 ^ BYTE3(a16)] ^ (v98 >> 8);
  *(_QWORD *)(a1 + 16664) = v101;
  v102 = 134775813 * (v99 + v101) + 1;
  *(_QWORD *)(a1 + 16672) = v102;
  *(_QWORD *)(a1 + 16680) = crc_table[(v100 ^ BYTE3(v102))] ^ (v100 >> 8);
  v109 = ((unsigned __int16)((v100 & 0xFFFD ^ 3) * (v100 | 2)) >> 8) ^ BYTE3(a16);
  *(_DWORD *)(a1 + 16696) = 12;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _DWORD *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v107, 12) != 12)return 0xFFFFFFFFLL;
LABEL_112:
  result = 0;
  *(_DWORD *)(a1 + 88) = 1;
  return result;
}

uint64_t zipCloseFileInZip(uint64_t a1)
{
  return zipCloseFileInZipRaw(a1, 0, 0);
}

uint64_t zipOpenNewFileInZip2(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10, int a11)
{
  return zipOpenNewFileInZip4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, -15, 8, 0, 0, 0, 0, 0);
}

uint64_t zipOpenNewFileInZip3(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10, uint64_t a11, int a12, int a13, _BYTE *a14, uint64_t a15)
{
  return zipOpenNewFileInZip4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, SHIDWORD(a11), a12, a13, a14, a15, 0, 0);
}

uint64_t zipOpenNewFileInZip(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10)
{
  return zipOpenNewFileInZip4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, -15, 8, 0, 0, 0, 0, 0);
}

uint64_t zipWriteInFileInZip(uint64_t a1, const Bytef *a2, uInt a3)
{
  unsigned int v4;
  uint64_t result;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  int v11;

  if (!a1)
    return 4294967194;
  if (!*(_DWORD *)(a1 + 88))
    return 4294967194;
  *(_QWORD *)(a1 + 96) = a2;
  *(_DWORD *)(a1 + 104) = a3;
  *(_QWORD *)(a1 + 16648) = crc32(*(_QWORD *)(a1 + 16648), a2, a3);
  while (*(_DWORD *)(a1 + 104))
  {
    v4 = *(_DWORD *)(a1 + 128);
    if (v4
      || (result = zipFlushWriteBuffer(a1),
          v4 = 0x4000,
          *(_DWORD *)(a1 + 128) = 0x4000,
          *(_QWORD *)(a1 + 120) = a1 + 256,
          (_DWORD)result != -1))
    {
      if (*(_DWORD *)(a1 + 248) == 8 && !*(_DWORD *)(a1 + 252))
      {
        v11 = *(_DWORD *)(a1 + 136);
        result = deflate((z_streamp)(a1 + 96), 0);
        LODWORD(v7) = *(_DWORD *)(a1 + 136) - v11;
      }
      else
      {
        v6 = *(_DWORD *)(a1 + 104);
        v7 = v6 >= v4 ? v4 : v6;
        if ((_DWORD)v7)
        {
          for (i = 0; i != v7; ++i)
            *(_BYTE *)(*(_QWORD *)(a1 + 120) + i) = *(_BYTE *)(*(_QWORD *)(a1 + 96) + i);
          v6 = *(_DWORD *)(a1 + 104);
          v4 = *(_DWORD *)(a1 + 128);
          v9 = v7;
        }
        else
        {
          v9 = 0;
        }
        result = 0;
        *(_DWORD *)(a1 + 104) = v6 - v7;
        *(_DWORD *)(a1 + 128) = v4 - v7;
        *(_QWORD *)(a1 + 96) += v9;
        v10 = *(_QWORD *)(a1 + 120) + v9;
        *(_QWORD *)(a1 + 112) += v9;
        *(_QWORD *)(a1 + 120) = v10;
        *(_QWORD *)(a1 + 136) += v9;
      }
      *(_DWORD *)(a1 + 212) += v7;
      if (!(_DWORD)result)
        continue;
    }
    return result;
  }
  return 0;
}

uint64_t zipFlushWriteBuffer(uint64_t a1)
{
  unsigned int v2;
  _BYTE *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 212);
  if (*(_DWORD *)(a1 + 16656) && v2)
  {
    v3 = (_BYTE *)(a1 + 256);
    v4 = *(unsigned int *)(a1 + 212);
    do
    {
      v5 = *(_QWORD *)(a1 + 16680);
      v6 = *(_QWORD *)(a1 + 16688);
      v7 = *(_QWORD *)(v6 + 8 * (*v3 ^ *(_QWORD *)(a1 + 16664))) ^ (*(_QWORD *)(a1 + 16664) >> 8);
      *(_QWORD *)(a1 + 16664) = v7;
      v8 = 134775813 * (*(_QWORD *)(a1 + 16672) + v7) + 1;
      *(_QWORD *)(a1 + 16672) = v8;
      *(_QWORD *)(a1 + 16680) = *(_QWORD *)(v6 + 8 * (v5 ^ BYTE3(v8))) ^ (v5 >> 8);
      *v3++ ^= (unsigned __int16)((v5 & 0xFFFD ^ 3) * (v5 | 2)) >> 8;
      --v4;
    }
    while (v4);
  }
  if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a1 + 256, v2) == *(_DWORD *)(a1 + 212))result = 0;
  else
    result = 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 212) = 0;
  return result;
}

uint64_t zipCloseFileInZipRaw(uint64_t a1, unint64_t a2, unint64_t a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _DWORD *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unsigned int v35;
  int v37;
  int v38;
  int v39;

  if (!a1 || !*(_DWORD *)(a1 + 88))
    return 4294967194;
  *(_DWORD *)(a1 + 104) = 0;
  if (*(_DWORD *)(a1 + 248) != 8 || *(_DWORD *)(a1 + 252))
    goto LABEL_66;
  do
  {
    if (!*(_DWORD *)(a1 + 128))
    {
      zipFlushWriteBuffer(a1);
      *(_DWORD *)(a1 + 128) = 0x4000;
      *(_QWORD *)(a1 + 120) = a1 + 256;
    }
    v6 = *(_DWORD *)(a1 + 136);
    v7 = deflate((z_streamp)(a1 + 96), 4);
    *(_DWORD *)(a1 + 212) += *(_DWORD *)(a1 + 136) - v6;
  }
  while (!(_DWORD)v7);
  v8 = v7;
  if ((_DWORD)v7 == 1)
  {
LABEL_66:
    if (*(_DWORD *)(a1 + 212))
    {
      if (zipFlushWriteBuffer(a1) == -1)
        v8 = 0xFFFFFFFFLL;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
  }
  if (*(_DWORD *)(a1 + 248) == 8 && !*(_DWORD *)(a1 + 252))
  {
    v9 = deflateEnd((z_streamp)(a1 + 96));
    if ((_DWORD)v8)
      v8 = v8;
    else
      v8 = v9;
    *(_DWORD *)(a1 + 208) = 0;
  }
  if (!*(_DWORD *)(a1 + 252))
  {
    a3 = *(_QWORD *)(a1 + 16648);
    a2 = *(_QWORD *)(a1 + 112);
  }
  v10 = 0;
  v11 = *(_QWORD *)(a1 + 136);
  v12 = *(int *)(a1 + 16696);
  v13 = (_DWORD *)(*(_QWORD *)(a1 + 224) + 16);
  v14 = a3;
  do
  {
    v15 = v14;
    *((_BYTE *)v13 + v10) = v14;
    v14 >>= 8;
    ++v10;
  }
  while (v10 != 4);
  v16 = v11 + v12;
  if (v15 >= 0x100)
    *v13 = -1;
  v17 = 0;
  v18 = (_DWORD *)(*(_QWORD *)(a1 + 224) + 20);
  v19 = v11 + v12;
  do
  {
    v20 = v19;
    *((_BYTE *)v18 + v17) = v19;
    v19 >>= 8;
    ++v17;
  }
  while (v17 != 4);
  if (v20 >= 0x100)
    *v18 = -1;
  if (*(_DWORD *)(a1 + 184) == 1)
    *(_WORD *)(*(_QWORD *)(a1 + 224) + 36) = 1;
  v21 = 0;
  v22 = (_DWORD *)(*(_QWORD *)(a1 + 224) + 24);
  v23 = a2;
  do
  {
    v24 = v23;
    *((_BYTE *)v22 + v21) = v23;
    v23 >>= 8;
    ++v21;
  }
  while (v21 != 4);
  if (v24 >= 0x100)
    *v22 = -1;
  if ((_DWORD)v8)
  {
    free(*(void **)(a1 + 224));
  }
  else
  {
    v8 = add_data_in_datablock((_QWORD *)(a1 + 72), *(char **)(a1 + 224), *(_QWORD *)(a1 + 232));
    free(*(void **)(a1 + 224));
    if (!(_DWORD)v8)
    {
      v25 = (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 24))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 216) + 14, 0))
      {
        goto LABEL_58;
      }
      v26 = 0;
      v27 = *(_QWORD *)(a1 + 64);
      do
      {
        v28 = a3;
        *((_BYTE *)&v37 + v26) = a3;
        a3 >>= 8;
        ++v26;
      }
      while (v26 != 4);
      if (v28 >= 0x100)
        v37 = -1;
      if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v27, &v37, 4) != 4)
        goto LABEL_58;
      v29 = 0;
      v30 = *(_QWORD *)(a1 + 64);
      do
      {
        v31 = v16;
        *((_BYTE *)&v38 + v29) = v16;
        v16 >>= 8;
        ++v29;
      }
      while (v29 != 4);
      if (v31 >= 0x100)
        v38 = -1;
      if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v30, &v38, 4) == 4)
      {
        v32 = 0;
        v33 = *(_QWORD *)(a1 + 64);
        do
        {
          v34 = a2;
          *((_BYTE *)&v39 + v32) = a2;
          a2 >>= 8;
          ++v32;
        }
        while (v32 != 4);
        if (v34 >= 0x100)
          v39 = -1;
        if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v33, &v39, 4) == 4)v35 = 0;
        else
          v35 = -1;
      }
      else
      {
LABEL_58:
        v35 = -1;
      }
      if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v25, 0))
      {
        v8 = 0xFFFFFFFFLL;
      }
      else
      {
        v8 = v35;
      }
    }
  }
  ++*(_QWORD *)(a1 + 16720);
  *(_DWORD *)(a1 + 88) = 0;
  return v8;
}

uint64_t zipClose(uint64_t a1, const char *a2)
{
  const char *v2;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  void *v29;
  int v31;

  if (!a1)
    return 4294967194;
  v2 = a2;
  if (*(_DWORD *)(a1 + 88) != 1)
  {
    v4 = 0;
    if (!a2)
      goto LABEL_7;
LABEL_8:
    v6 = strlen(v2);
    goto LABEL_9;
  }
  v4 = zipCloseFileInZipRaw(a1, 0, 0);
  if (v2)
    goto LABEL_8;
LABEL_7:
  v2 = *(const char **)(a1 + 16728);
  if (v2)
    goto LABEL_8;
  v6 = 0;
LABEL_9:
  v7 = (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 24))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  if (!v4)
  {
    v9 = *(_QWORD **)(a1 + 72);
    if (v9)
    {
      v8 = 0;
      v4 = 0;
      do
      {
        v10 = v9[2];
        if (v4)
        {
          v4 = -1;
        }
        else if (v10)
        {
          v11 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD *))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v9 + 4);
          v10 = v9[2];
          if (v11 == v10)
            v4 = 0;
          else
            v4 = -1;
        }
        else
        {
          v4 = 0;
        }
        v8 += v10;
        v9 = (_QWORD *)*v9;
      }
      while (v9);
      goto LABEL_21;
    }
    v4 = 0;
  }
  v8 = 0;
LABEL_21:
  v12 = *(_QWORD **)(a1 + 72);
  if (v12)
  {
    do
    {
      v13 = (_QWORD *)*v12;
      free(v12);
      v12 = v13;
    }
    while (v13);
  }
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  if (!v4)
  {
    v31 = 101010256;
    if ((*(uint64_t (**)(_QWORD, _QWORD, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &v31, 4) != 4)goto LABEL_53;
    LOWORD(v31) = 0;
    if ((*(uint64_t (**)(_QWORD, _QWORD, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &v31, 2) != 2)goto LABEL_53;
    LOWORD(v31) = 0;
    if ((*(uint64_t (**)(_QWORD, _QWORD, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &v31, 2) != 2)goto LABEL_53;
    v14 = *(_QWORD *)(a1 + 64);
    v15 = *(_QWORD *)(a1 + 16720);
    LOWORD(v31) = v15;
    if (v15 >= 0x10000)
      LOWORD(v31) = -1;
    if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v14, &v31, 2) != 2)
      goto LABEL_53;
    v16 = *(_QWORD *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 16720);
    LOWORD(v31) = v17;
    if (v17 >= 0x10000)
      LOWORD(v31) = -1;
    if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v16, &v31, 2) != 2)
      goto LABEL_53;
    v18 = 0;
    v19 = *(_QWORD *)(a1 + 64);
    do
    {
      v20 = v8;
      *((_BYTE *)&v31 + v18) = v8;
      v8 >>= 8;
      ++v18;
    }
    while (v18 != 4);
    if (v20 >= 0x100)
      v31 = -1;
    if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v19, &v31, 4) != 4)
      goto LABEL_53;
    v21 = 0;
    v22 = *(_QWORD *)(a1 + 64);
    v23 = v7 - *(_QWORD *)(a1 + 16712);
    do
    {
      v24 = v23;
      *((_BYTE *)&v31 + v21) = v23;
      v23 >>= 8;
      ++v21;
    }
    while (v21 != 4);
    if (v24 >= 0x100)
      v31 = -1;
    if ((*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v22, &v31, 4) == 4)
    {
      v25 = *(_QWORD *)(a1 + 64);
      LOWORD(v31) = v6;
      if (v6 >= 0x10000)
        LOWORD(v31) = -1;
      v26 = (*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 56), v25, &v31, 2);
      if (v26 == 2)
        v4 = 0;
      else
        v4 = -1;
      if (v26 == 2 && v6)
      {
        if ((*(uint64_t (**)(_QWORD, _QWORD, const char *, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v2, v6) == v6)v4 = 0;
        else
          v4 = -1;
      }
    }
    else
    {
LABEL_53:
      v4 = -1;
    }
  }
  v27 = (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  if (v4)
    v28 = v4;
  else
    v28 = -1;
  if (v27)
    v5 = v28;
  else
    v5 = v4;
  v29 = *(void **)(a1 + 16728);
  if (v29)
    free(v29);
  free((void *)a1);
  return v5;
}

_BYTE *init_keys(_BYTE *result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  int v4;
  unsigned __int8 *v5;
  unint64_t v6;
  uint64_t v7;
  int v8;

  v3 = 878082192;
  *(_OWORD *)a2 = xmmword_E0D0;
  *(_QWORD *)(a2 + 16) = 878082192;
  v4 = *result;
  if (*result)
  {
    v5 = result + 1;
    v6 = 305419896;
    v7 = 591751049;
    do
    {
      v6 = *(_QWORD *)(a3 + 8 * (v4 ^ v6)) ^ (v6 >> 8);
      v7 = 134775813 * (v7 + v6) + 1;
      *(_QWORD *)a2 = v6;
      *(_QWORD *)(a2 + 8) = v7;
      v3 = *(_QWORD *)(a3 + 8 * (v3 ^ BYTE3(v7))) ^ (v3 >> 8);
      *(_QWORD *)(a2 + 16) = v3;
      v8 = *v5++;
      v4 = v8;
    }
    while (v8);
  }
  return result;
}

FILE *fopen_file_func(int a1, char *__filename, char a3)
{
  int v3;
  const char *v4;
  const char *v5;
  int v6;
  char v7;
  const char *v8;

  v3 = a3 & 3;
  v4 = "r+b";
  v5 = "wb";
  if ((a3 & 8) == 0)
    v5 = 0;
  if ((a3 & 4) != 0)
    LOBYTE(v6) = 1;
  else
    v6 = (a3 & 8) >> 3;
  if ((a3 & 4) == 0)
    v4 = v5;
  if (v3 == 1)
    v7 = 1;
  else
    v7 = v6;
  if (v3 == 1)
    v8 = "rb";
  else
    v8 = v4;
  if (__filename && (v7 & 1) != 0)
    return fopen(__filename, v8);
  else
    return 0;
}

size_t fread_file_func(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fread(__ptr, 1uLL, __nitems, __stream);
}

size_t fwrite_file_func(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fwrite(__ptr, 1uLL, __nitems, __stream);
}

uint64_t ftell_file_func(int a1, FILE *a2)
{
  return ftell(a2);
}

uint64_t fseek_file_func(int a1, FILE *a2, uint64_t a3, unsigned int a4)
{
  if (a4 > 2)
    return -1;
  if (fseek(a2, a3, a4))
    return -1;
  return 0;
}

uint64_t fclose_file_func(int a1, FILE *a2)
{
  return fclose(a2);
}

uint64_t ferror_file_func(int a1, FILE *a2)
{
  return ferror(a2);
}

FILE *(**fill_fopen_filefunc(FILE *(**result)(int a1, char *__filename, char a3)))(int a1, char *__filename, char a3)
{
  *result = fopen_file_func;
  result[1] = (FILE *(*)(int, char *, char))fread_file_func;
  result[2] = (FILE *(*)(int, char *, char))fwrite_file_func;
  result[3] = (FILE *(*)(int, char *, char))ftell_file_func;
  result[4] = (FILE *(*)(int, char *, char))fseek_file_func;
  result[5] = (FILE *(*)(int, char *, char))fclose_file_func;
  result[6] = (FILE *(*)(int, char *, char))ferror_file_func;
  result[7] = 0;
  return result;
}

void sub_BBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void sub_C030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLsForDirectory_inDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLsForDirectory:inDomains:");
}

id objc_msgSend__setRequiresSystemGesturesToFail_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setRequiresSystemGesturesToFail:");
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionButton");
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addArrangedSubview:");
}

id objc_msgSend_addDescriptionToString_indentLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDescriptionToString:indentLevel:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_allViewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allViewControllers");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applicationDocumentsDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationDocumentsDirectory");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_buttonWithConfiguration_primaryAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithConfiguration:primaryAction:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childViewControllers");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToSystemSpacingBelowAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToSystemSpacingBelowAnchor:multiplier:");
}

id objc_msgSend_constraintGreaterThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToConstant:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDebugDataWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDebugDataWithCompletion:");
}

id objc_msgSend_createScreenShotOfPresentedViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createScreenShotOfPresentedViewController:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_dataUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUrl");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_debugData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugData");
}

id objc_msgSend_debugDataFileName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugDataFileName");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_debugViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugViewController");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_drawViewHierarchyInRect_afterScreenUpdates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawViewHierarchyInRect:afterScreenUpdates:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_filledButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filledButtonConfiguration");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_gatherData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gatherData");
}

id objc_msgSend_generateReportWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateReportWithCompletionHandler:");
}

id objc_msgSend_getIPAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIPAddress");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour");
}

id objc_msgSend_initWithActivityItems_applicationActivities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityItems:applicationActivities:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithManagedObjectContext_episodePropertiesToReport_showPropertiesToReport_allEpisodes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithManagedObjectContext:episodePropertiesToReport:showPropertiesToReport:allEpisodes:");
}

id objc_msgSend_initWithProgressViewStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProgressViewStyle:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_is17Net(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is17Net");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalInstall");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minute");
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "month");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popoverPresentationController");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_privateQueueContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateQueueContext");
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressView");
}

id objc_msgSend_progressViewContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressViewContainer");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reason");
}

id objc_msgSend_recursiveDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recursiveDescription");
}

id objc_msgSend_registerAsyncDataProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerAsyncDataProvider:");
}

id objc_msgSend_registerDataProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDataProvider:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_screenShotImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenShotImage");
}

id objc_msgSend_screenShotImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenShotImageView");
}

id objc_msgSend_screenShotPreviewImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenShotPreviewImage");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "second");
}

id objc_msgSend_setActionButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionButton:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setDataUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataUrl:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDefaultFormatterBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultFormatterBehavior:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNumberOfTapsRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfTapsRequired:");
}

id objc_msgSend_setNumberOfTouchesRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfTouchesRequired:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setProgressView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressView:");
}

id objc_msgSend_setProgressViewContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressViewContainer:");
}

id objc_msgSend_setScreenShotImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenShotImage:");
}

id objc_msgSend_setScreenShotImageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenShotImageView:");
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceView:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setStackView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStackView:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_shareData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareData");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedApplicationIfPossible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplicationIfPossible");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_stackView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackView");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_writeDebugData_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDebugData:completion:");
}

id objc_msgSend_writeDebugDataWithProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDebugDataWithProgress:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "year");
}
