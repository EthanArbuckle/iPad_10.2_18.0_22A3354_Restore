@implementation CFXIONSZipFileArchive

- (CFXIONSZipFileArchive)initWithPath:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  objc_super v24;

  if (!a3 || !objc_msgSend_length(a3, a2, (uint64_t)a3, a4))
    return 0;
  v24.receiver = self;
  v24.super_class = (Class)CFXIONSZipFileArchive;
  v9 = -[CFXIONSZipFileArchive init](&v24, sel_init);
  v13 = (uint64_t)v9;
  if (!v9)
    return (CFXIONSZipFileArchive *)v13;
  v14 = a4 & 3;
  *((_QWORD *)v9 + 9) = 0;
  *(_OWORD *)(v9 + 88) = 0u;
  *(_OWORD *)(v9 + 104) = 0u;
  *((_QWORD *)v9 + 15) = 0;
  switch(v14)
  {
    case 1uLL:
      v20 = sub_1B18F1D20(a3, v10, v11, v12);
      *(_QWORD *)(v13 + 32) = v20;
      if ((v20 & 0x8000000000000000) == 0)
      {
        *(_DWORD *)(v13 + 80) |= 0x10u;
        goto LABEL_15;
      }
LABEL_17:

      return 0;
    case 2uLL:
      v21 = objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x1E0C99D50], v10, (uint64_t)a3, 1, a5);
      break;
    case 3uLL:
      v15 = sub_1B18F1D20(a3, v10, v11, v12);
      if ((v15 & 0x8000000000000000) == 0)
      {
        v19 = v15;
        *(_QWORD *)(v13 + 40) = objc_msgSend_copy(a3, v16, v17, v18);
        close(v19);
        goto LABEL_15;
      }
      goto LABEL_17;
    default:
      v21 = objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x1E0C99D50], v10, (uint64_t)a3, 0, a5);
      break;
  }
  if (!v21)
    goto LABEL_17;
  v13 = objc_msgSend_initWithData_options_error_((void *)v13, v22, v21, a4, a5);
  if (!v13)
    goto LABEL_17;
LABEL_15:
  if ((a4 & 4) != 0)
    *(_DWORD *)(v13 + 80) |= 8u;
  return (CFXIONSZipFileArchive *)v13;
}

- (CFXIONSZipFileArchive)initWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v5;
  CFXIONSZipFileArchive *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CFXIONSZipFileArchive *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  const char *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  const char *v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  BOOL v43;
  BOOL v44;
  _BOOL4 v45;
  unint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  const char *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  _BOOL4 v56;
  unint64_t v57;
  BOOL v58;
  BOOL v59;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  unint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  unint64_t v79;
  int v81;
  id v84;
  char v85;
  CFXIONSZipFileArchive *v86;
  char v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  objc_super v99;
  _QWORD v100[5];
  _QWORD v101[7];

  v5 = a4;
  v101[5] = *MEMORY[0x1E0C80C00];
  v99.receiver = self;
  v99.super_class = (Class)CFXIONSZipFileArchive;
  v7 = -[CFXIONSZipFileArchive init](&v99, sel_init, a3, a4, a5);
  v11 = v7;
  if (!a3)
    goto LABEL_80;
  if (!v7)
    goto LABEL_80;
  v92 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10);
  v91 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v12, v13, v14);
  v18 = objc_msgSend_bytes(a3, v15, v16, v17);
  v22 = objc_msgSend_length(a3, v19, v20, v21);
  if (v22 < 0x15)
    goto LABEL_80;
  v24 = (const char *)v18;
  v25 = v22;
  v26 = 0;
  v27 = 0;
  v28 = -20;
  v29 = 20;
  v30 = v24;
  do
  {
    v31 = *(_DWORD *)&v30[v22 - 20];
    if (v31 == 117853008)
    {
      v32 = 0;
      if (v22 >= 0x39)
      {
        v33 = *(_QWORD *)&v30[v22 - 12];
        if (v33 <= v22 - 56)
        {
          v34 = &v24[v33];
          if (*(_DWORD *)&v24[v33] == 101075792)
          {
            v26 = *((_QWORD *)v34 + 3);
            v27 = *((_QWORD *)v34 + 6);
            v32 = *(_QWORD *)&v30[v22 - 12];
          }
          else
          {
            v32 = 0;
          }
        }
      }
    }
    else if (v31 == 101010256)
    {
      v32 = v22 - v29;
      v26 = *(unsigned __int16 *)&v30[v22 - 12];
      v27 = *(unsigned int *)&v30[v22 - 4];
    }
    else
    {
      v32 = 0;
      if (v29 >= 0x38 && v31 == 101075792)
      {
        v32 = v22 + v28;
        v26 = *(_QWORD *)&v30[v22 + 4];
        v27 = *(_QWORD *)&v30[v22 + 28];
      }
    }
    if (v29 > 0x101CE)
      break;
    if (v32)
      break;
    ++v29;
    --v28;
    --v30;
  }
  while (v29 < v22);
  if (!v26)
    goto LABEL_80;
  v84 = a3;
  v85 = v5;
  v86 = v11;
  v87 = 0;
  v35 = 0;
  v88 = v24 + 16;
  v89 = v24 + 8;
  v36 = v27;
  v98 = v24;
  do
  {
    if (v36 < v27)
      break;
    if (v36 >= v25)
      break;
    v37 = v36 + 46;
    if (v36 + 46 <= v27)
      break;
    if (v37 > v25)
      break;
    v38 = &v24[v36];
    if (*(_DWORD *)v38 != 33639248)
      break;
    v97 = v26;
    v40 = *((unsigned int *)v38 + 5);
    v39 = *((unsigned int *)v38 + 6);
    v41 = *((unsigned __int16 *)v38 + 14);
    v42 = *(unsigned int *)(v38 + 42);
    v43 = v40 == 0xFFFFFFFFLL || v39 == 0xFFFFFFFFLL;
    v44 = v43 || v42 == 0xFFFFFFFF;
    v45 = v44;
    v46 = v37 + v41;
    if (v37 + v41 <= v27 || v46 > v25)
      break;
    v47 = 0;
    v48 = *((unsigned __int16 *)v38 + 5);
    v93 = *((unsigned int *)v38 + 4);
    v94 = v35;
    v49 = *((unsigned __int16 *)v38 + 15);
    v96 = *((unsigned __int16 *)v38 + 16);
    if (*((_WORD *)v38 + 14))
    {
      if (v27 > v42)
      {
        v90 = *((unsigned __int16 *)v38 + 5);
        v50 = objc_alloc(MEMORY[0x1E0CB3940]);
        v51 = (uint64_t)&v98[v37];
        v47 = (id)objc_msgSend_initWithBytes_length_encoding_(v50, v52, v51, v41, 4);
        v48 = v90;
        if (!v47)
        {
          v53 = objc_alloc(MEMORY[0x1E0CB3940]);
          v47 = (id)objc_msgSend_initWithBytes_length_encoding_(v53, v54, v51, v41, 12);
          v48 = v90;
        }
      }
    }
    v55 = v49;
    v56 = v49 > 4 && v45;
    v43 = v56;
    v57 = v46 + v49;
    v58 = !v43 || v46 >= v57;
    v59 = !v58 && v57 > v27;
    if (!v59 || v57 > v25)
    {
      v24 = v98;
      v76 = v94;
    }
    else
    {
      v75 = v46;
      v24 = v98;
      v76 = v94;
      do
      {
        v77 = &v98[v75];
        v78 = *(unsigned __int16 *)&v98[v75 + 2];
        v79 = v75 + 4;
        v75 += 4 + v78;
        if (v75 <= v79 || v75 > v57)
          break;
        v81 = *(unsigned __int16 *)v77;
        if (v78 >= 0x18 && v81 == 1)
        {
          if (v39 == 0xFFFFFFFFLL)
            v39 = *(_QWORD *)&v98[v79];
          if (v40 == 0xFFFFFFFFLL)
            v40 = *(_QWORD *)&v89[v79];
          if (v42 == 0xFFFFFFFF)
            v42 = *(_QWORD *)&v88[v79];
        }
      }
      while (v75 < v57);
    }
    if (v47)
    {
      v100[0] = CFSTR("CFXIONSZipFileArchiveCompressionType");
      v61 = (uint64_t)v47;
      v95 = v55;
      v101[0] = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v24, v48, v23);
      v100[1] = CFSTR("CFXIONSZipFileArchiveHeaderOffset");
      v101[1] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v62, v42, v63);
      v100[2] = CFSTR("CFXIONSZipFileArchiveCRC");
      v101[2] = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v64, v93, v65);
      v100[3] = CFSTR("CFXIONSZipFileArchiveCompressedLength");
      v101[3] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v66, v40, v67);
      v100[4] = CFSTR("CFXIONSZipFileArchiveUncompressedLength");
      v101[4] = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v68, v39, v69);
      v71 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v70, (uint64_t)v101, (uint64_t)v100, 5);
      objc_msgSend_addObject_(v92, v72, v61, v73);
      objc_msgSend_setObject_forKey_(v91, v74, v71, v61);
      v55 = v95;
      v24 = v98;
      v87 = 1;
    }
    v26 = v97;
    v36 = v46 + v55 + v96;
    v35 = v76 + 1;
  }
  while (v35 != v97);
  v11 = v86;
  if ((v87 & 1) != 0)
  {
    v86->_data = (NSData *)v84;
    v86->_names = (NSArray *)v92;
    v86->_properties = (NSDictionary *)v91;
    if ((v85 & 4) != 0)
      *(_DWORD *)&v86->_zFlags |= 8u;
  }
  else
  {
LABEL_80:
    if (v11)
    {

      return 0;
    }
  }
  return v11;
}

- (CFXIONSZipFileArchive)initWithEntryNames:(id)a3 contents:(id)a4 properties:(id)a5 options:(unint64_t)a6
{
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CFXIONSZipFileArchive *v14;
  unint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  BOOL v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v10 = objc_msgSend_count(a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6);
  v29.receiver = self;
  v29.super_class = (Class)CFXIONSZipFileArchive;
  v14 = -[CFXIONSZipFileArchive init](&v29, sel_init);
  if (v10)
  {
    v15 = 1;
    do
    {
      v16 = objc_msgSend_objectAtIndex_(a3, v11, v15 - 1, v13);
      v19 = objc_msgSend_objectForKey_(a4, v17, v16, v18);
      v20 = v19 != 0;
      if (v19)
        v21 = v15 >= v10;
      else
        v21 = 1;
      ++v15;
    }
    while (!v21);
    if (!a3)
      goto LABEL_16;
  }
  else
  {
    v20 = 1;
    if (!a3)
      goto LABEL_16;
  }
  if (a4 && v20 && v14 && v10)
  {
    v14->_contents = (NSDictionary *)objc_msgSend_copy(a4, v11, v12, v13);
    v14->_names = (NSArray *)objc_msgSend_copy(a3, v22, v23, v24);
    v14->_properties = (NSDictionary *)objc_msgSend_copy(a5, v25, v26, v27);
    *(_DWORD *)&v14->_zFlags |= 8u;
    return v14;
  }
LABEL_16:
  if (v14)
  {

    return 0;
  }
  return v14;
}

- (CFXIONSZipFileArchive)initWithEntryNames:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  objc_super v14;

  v5 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CFXIONSZipFileArchive;
  v8 = -[CFXIONSZipFileArchive init](&v14, sel_init);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *((_DWORD *)v8 + 20) |= 1u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *((_DWORD *)v8 + 20) |= 2u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = *((_DWORD *)v8 + 20) | 4;
    *((_DWORD *)v8 + 20) = v12;
  }
  else
  {
    if (!v8)
      return (CFXIONSZipFileArchive *)v8;
    v12 = *((_DWORD *)v8 + 20);
  }
  if ((v12 & 3) != 0)
  {
    *((_QWORD *)v8 + 3) = a4;
    *((_QWORD *)v8 + 6) = objc_msgSend_copy(a3, v9, v10, v11);
    if ((v5 & 4) != 0)
      *((_DWORD *)v8 + 20) |= 8u;
  }
  else
  {

    return 0;
  }
  return (CFXIONSZipFileArchive *)v8;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_invalidate(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CFXIONSZipFileArchive;
  -[CFXIONSZipFileArchive dealloc](&v5, sel_dealloc);
}

- (id)entryNames
{
  return self->_names;
}

- (id)contentsForEntryName:(id)a3
{
  uint64_t v3;
  NSDictionary *contents;
  uint64_t v7;
  const char *v8;
  void *v9;
  NSMutableDictionary *cachedContents;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSData *data;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  const char *v57;
  uint64_t v58;
  unsigned __int16 *v59;
  unint64_t v60;
  unint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  __zFlags zFlags;
  NSString *path;
  uint64_t v68;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  Bytef *v74;
  const Bytef *v75;
  int v76;
  int v77;
  z_stream v78;

  contents = self->_contents;
  if (contents)
  {
    v7 = objc_msgSend_objectForKey_(contents, a2, (uint64_t)a3, v3);
LABEL_3:
    v9 = (void *)v7;
    goto LABEL_4;
  }
  if (self->_data)
  {
    v11 = (void *)objc_msgSend_objectForKey_(self->_properties, a2, (uint64_t)a3, v3);
    if (v11)
    {
      v14 = v11;
      v15 = (void *)objc_msgSend_objectForKey_(v11, v12, (uint64_t)CFSTR("CFXIONSZipFileArchiveHeaderOffset"), v13);
      v19 = objc_msgSend_unsignedIntegerValue(v15, v16, v17, v18);
      v22 = (void *)objc_msgSend_objectForKey_(v14, v20, (uint64_t)CFSTR("CFXIONSZipFileArchiveCompressionType"), v21);
      v26 = objc_msgSend_unsignedIntegerValue(v22, v23, v24, v25);
      v29 = (void *)objc_msgSend_objectForKey_(v14, v27, (uint64_t)CFSTR("CFXIONSZipFileArchiveCRC"), v28);
      v33 = objc_msgSend_unsignedIntegerValue(v29, v30, v31, v32);
      v36 = (void *)objc_msgSend_objectForKey_(v14, v34, (uint64_t)CFSTR("CFXIONSZipFileArchiveCompressedLength"), v35);
      v40 = objc_msgSend_unsignedIntegerValue(v36, v37, v38, v39);
      v43 = (void *)objc_msgSend_objectForKey_(v14, v41, (uint64_t)CFSTR("CFXIONSZipFileArchiveUncompressedLength"), v42);
      v47 = objc_msgSend_unsignedIntegerValue(v43, v44, v45, v46);
      data = self->_data;
      v52 = objc_msgSend_bytes(data, v49, v50, v51);
      v56 = objc_msgSend_length(data, v53, v54, v55);
      if (v56 > v19 && v19 <= 0xFFFFFFFFFFFFFFE1)
      {
        v9 = 0;
        if (!v47 || !v40 || v19 + 30 >= v56)
          return v9;
        v59 = (unsigned __int16 *)(v52 + v19);
        if (*(_DWORD *)(v52 + v19) == 67324752 && v26 == v59[4])
        {
          v60 = v19 + 30 + v59[13] + v59[14];
          if (v60 < v56)
          {
            v9 = 0;
            v61 = v60 + v40;
            if (v60 + v40 >= v56 || v61 <= v60 || v61 <= v19)
              return v9;
            if (v26 == 8)
            {
              v70 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v57, v47, v58);
              v74 = (Bytef *)objc_msgSend_mutableBytes(v70, v71, v72, v73);
              *(_OWORD *)&v78.avail_in = 0u;
              memset(&v78.total_out, 0, 72);
              v78.next_in = (Bytef *)(v52 + v60);
              v78.avail_in = v40;
              v78.next_out = v74;
              *(_QWORD *)&v78.avail_out = v47;
              if (v70
                && (v75 = v74, !inflateInit2_(&v78, -15, "1.2.12", 112))
                && (v76 = inflate(&v78, 4), v77 = inflateEnd(&v78), v76 == 1))
              {
                v9 = 0;
                if (!v77 && v78.total_out == v47)
                {
                  if (v33 == sub_1B18F2F54(v75, v47))
                    v9 = v70;
                  else
                    v9 = 0;
                }
              }
              else
              {
                v9 = 0;
              }
LABEL_4:
              if (!v9)
                return v9;
              goto LABEL_5;
            }
            if (!v26 && v33 == sub_1B18F2F54((const Bytef *)(v52 + v60), v40))
            {
              v7 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v62, v52 + v60, v40);
              goto LABEL_3;
            }
          }
        }
      }
    }
    return 0;
  }
  if (!objc_msgSend_containsObject_(self->_names, a2, (uint64_t)a3, v3))
    return 0;
  zFlags = self->_zFlags;
  if ((*(_BYTE *)&zFlags & 1) == 0)
  {
    if ((*(_BYTE *)&zFlags & 2) != 0)
    {
      objc_msgSend_archive_streamForEntryName_(self->_provider, v63, (uint64_t)self, (uint64_t)a3);
    }
    else if ((*(_BYTE *)&zFlags & 0x10) == 0)
    {
      path = self->_path;
      if (path)
      {
        v68 = sub_1B18F1D20(path, v63, v64, v65);
        if ((v68 & 0x8000000000000000) == 0)
          close(v68);
      }
    }
    return 0;
  }
  v9 = (void *)objc_msgSend_objectForKey_(self->_cachedContents, v63, (uint64_t)a3, v65);
  if (!v9)
  {
    v7 = objc_msgSend_archive_contentsForEntryName_(self->_provider, v8, (uint64_t)self, (uint64_t)a3);
    goto LABEL_3;
  }
LABEL_5:
  if ((*(_BYTE *)&self->_zFlags & 8) == 0)
  {
    cachedContents = self->_cachedContents;
    if (!cachedContents)
    {
      cachedContents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_cachedContents = cachedContents;
    }
    objc_msgSend_setObject_forKey_(cachedContents, v8, (uint64_t)v9, (uint64_t)a3, v78.next_in, *(_OWORD *)&v78.avail_in, *(_OWORD *)&v78.next_out);
  }
  return v9;
}

- (id)streamForEntryName:(id)a3
{
  uint64_t v3;
  NSDictionary *contents;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  __zFlags zFlags;
  NSString *path;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  NSMutableDictionary *cachedContents;

  contents = self->_contents;
  if (contents)
  {
    v7 = objc_msgSend_objectForKey_(contents, a2, (uint64_t)a3, v3);
    if (v7)
    {
      v9 = v7;
      v10 = MEMORY[0x1E0C99DB0];
      return (id)MEMORY[0x1E0DE7D20](v10, sel_inputStreamWithData_, v9, v8);
    }
    return 0;
  }
  if (!self->_data && objc_msgSend_containsObject_(self->_names, a2, (uint64_t)a3, v3))
  {
    zFlags = self->_zFlags;
    if ((*(_BYTE *)&zFlags & 1) != 0)
    {
      v18 = objc_msgSend_objectForKey_(self->_cachedContents, v11, (uint64_t)a3, v13);
      if (!v18)
      {
        v19 = objc_msgSend_archive_contentsForEntryName_(self->_provider, v17, (uint64_t)self, (uint64_t)a3);
        if (!v19)
          return 0;
        v18 = v19;
        if ((*(_BYTE *)&self->_zFlags & 8) == 0)
        {
          cachedContents = self->_cachedContents;
          if (!cachedContents)
          {
            cachedContents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            self->_cachedContents = cachedContents;
          }
          objc_msgSend_setObject_forKey_(cachedContents, v20, v18, (uint64_t)a3);
        }
      }
      v10 = MEMORY[0x1E0C99DB0];
      v9 = v18;
      return (id)MEMORY[0x1E0DE7D20](v10, sel_inputStreamWithData_, v9, v8);
    }
    if ((*(_BYTE *)&zFlags & 2) != 0)
      return (id)objc_msgSend_archive_streamForEntryName_(self->_provider, v11, (uint64_t)self, (uint64_t)a3);
    if ((*(_BYTE *)&zFlags & 0x10) == 0)
    {
      path = self->_path;
      if (path)
      {
        v16 = sub_1B18F1D20(path, v11, v12, v13);
        if ((v16 & 0x8000000000000000) == 0)
          close(v16);
      }
    }
  }
  return 0;
}

- (BOOL)writeContentsForEntryName:(id)a3 toFile:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v8;

  v8 = objc_msgSend_contentsForEntryName_(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (v8)
    LOBYTE(v8) = MEMORY[0x1E0DE7D20](v8, sel_writeToFile_options_error_, a4, a5);
  return v8;
}

- (id)propertiesForEntryName:(id)a3
{
  uint64_t v3;
  id result;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  result = (id)objc_msgSend_objectForKey_(self->_properties, a2, (uint64_t)a3, v3);
  if (!result)
  {
    if (objc_msgSend_containsObject_(self->_names, v7, (uint64_t)a3, v8))
    {
      if ((*(_BYTE *)&self->_zFlags & 4) == 0)
        return (id)objc_msgSend_dictionary(MEMORY[0x1E0C99D80], v9, v10, v11);
      result = (id)objc_msgSend_archive_propertiesForEntryName_(self->_provider, v9, (uint64_t)self, (uint64_t)a3);
      if (!result)
        return (id)objc_msgSend_dictionary(MEMORY[0x1E0C99D80], v9, v10, v11);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)archiveData
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
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
  const char *v20;
  size_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  BOOL v30;
  int v31;
  const Bytef *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uInt v36;
  uLong v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  unsigned int v50;
  Bytef *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  __int16 v67;
  int v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  CFXIONSZipFileArchive *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  __int16 v117;
  int v118;
  int v119;
  z_stream strm;

  v115 = (void *)objc_msgSend_data(MEMORY[0x1E0C99DF0], a2, v2, v3);
  v116 = (void *)objc_msgSend_data(MEMORY[0x1E0C99DF0], v5, v6, v7);
  v11 = objc_msgSend_count(self->_names, v8, v9, v10);
  v14 = v11;
  if (v11)
  {
    v15 = 0;
    v113 = self;
    v114 = v11;
    do
    {
      v16 = (void *)objc_msgSend_objectAtIndex_(self->_names, v12, v15, v13);
      v20 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19);
      v21 = strlen(v20);
      v24 = (void *)objc_msgSend_contentsForEntryName_(self, v22, (uint64_t)v16, v23);
      v28 = objc_msgSend_length(v24, v25, v26, v27);
      if (v21)
        v30 = v24 == 0;
      else
        v30 = 1;
      if (!v30)
      {
        v31 = v28;
        v32 = (const Bytef *)objc_msgSend_bytes(v24, v12, v29, v13);
        v36 = objc_msgSend_length(v24, v33, v34, v35);
        v37 = crc32(0, 0, 0);
        LODWORD(v32) = crc32(v37, v32, v36);
        v41 = (unsigned __int8 *)objc_msgSend_bytes(v24, v38, v39, v40);
        v45 = objc_msgSend_length(v24, v42, v43, v44);
        v119 = (int)v32;
        if (v45)
        {
          while (1)
          {
            v50 = *v41++;
            v49 = v50;
            if (v50 <= 0x1F && v49 - 7 >= 7 && v49 - 26 > 1)
              break;
            if (!--v45)
              goto LABEL_12;
          }
          v117 = 0;
        }
        else
        {
LABEL_12:
          v117 = 1;
        }
        v51 = (Bytef *)objc_msgSend_bytes(v24, v46, v47, v48);
        v55 = objc_msgSend_length(v24, v52, v53, v54);
        v59 = 0;
        v118 = v31;
        if (v51)
        {
          v60 = v55;
          if (v55)
          {
            v61 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v56, v55 - 1, v58);
            memset(&strm.avail_in, 0, 104);
            strm.next_in = v51;
            strm.avail_in = v60;
            strm.next_out = (Bytef *)objc_msgSend_mutableBytes(v61, v62, v63, v64);
            strm.avail_out = v60 - 1;
            if (v61
              && !deflateInit2_(&strm, 6, 8, -15, 8, 0, "1.2.12", 112)
              && (v65 = deflate(&strm, 4), v66 = deflateEnd(&strm), v65 == 1))
            {
              v59 = 0;
              if (!v66 && v60 == strm.total_in)
              {
                objc_msgSend_setLength_(v61, v56, strm.total_out, v58);
                v59 = v61;
              }
            }
            else
            {
              v59 = 0;
            }
          }
        }
        v67 = 8 * (v59 != 0);
        if (v59)
          v24 = v59;
        v68 = objc_msgSend_length(v24, v56, v57, v58);
        v71 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v69, v21 + 30, v70);
        objc_msgSend_replaceBytesInRange_withBytes_(v71, v72, 0, 30, &unk_1B2247F4B);
        objc_msgSend_replaceBytesInRange_withBytes_(v71, v73, 30, v21, v20);
        v77 = objc_msgSend_mutableBytes(v71, v74, v75, v76);
        *(_WORD *)(v77 + 4) = 20;
        *(_WORD *)(v77 + 8) = v67;
        *(_DWORD *)(v77 + 10) = 0;
        *(_DWORD *)(v77 + 14) = v119;
        *(_DWORD *)(v77 + 18) = v68;
        *(_DWORD *)(v77 + 22) = v118;
        *(_WORD *)(v77 + 26) = v21;
        v80 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v78, v21 + 46, v79);
        objc_msgSend_replaceBytesInRange_withBytes_(v80, v81, 0, 46, &unk_1B2247F69);
        objc_msgSend_replaceBytesInRange_withBytes_(v80, v82, 46, v21, v20);
        v86 = objc_msgSend_mutableBytes(v80, v83, v84, v85);
        *(_WORD *)(v86 + 6) = 20;
        *(_WORD *)(v86 + 10) = v67;
        *(_DWORD *)(v86 + 12) = 0;
        *(_DWORD *)(v86 + 16) = v119;
        *(_DWORD *)(v86 + 20) = v68;
        *(_DWORD *)(v86 + 24) = v118;
        *(_WORD *)(v86 + 28) = v21;
        *(_WORD *)(v86 + 36) = v117;
        *(_DWORD *)(v86 + 42) = objc_msgSend_length(v116, v87, v88, v89);
        objc_msgSend_appendData_(v116, v90, (uint64_t)v71, v91);
        objc_msgSend_appendData_(v116, v92, (uint64_t)v24, v93);
        objc_msgSend_appendData_(v115, v94, (uint64_t)v80, v95);
        self = v113;
        v14 = v114;
      }
      ++v15;
    }
    while (v15 != v14);
  }
  v96 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v12, 22, v13);
  objc_msgSend_replaceBytesInRange_withBytes_(v96, v97, 0, 22, &unk_1B2247F97);
  v101 = objc_msgSend_mutableBytes(v96, v98, v99, v100);
  *(_WORD *)(v101 + 8) = v14;
  *(_WORD *)(v101 + 10) = v14;
  *(_DWORD *)(v101 + 12) = objc_msgSend_length(v115, v102, v103, v104);
  *(_DWORD *)(v101 + 16) = objc_msgSend_length(v116, v105, v106, v107);
  objc_msgSend_appendData_(v116, v108, (uint64_t)v115, v109);
  objc_msgSend_appendData_(v116, v110, (uint64_t)v96, v111);
  return v116;
}

- (id)archiveStream
{
  uint64_t v2;
  uint64_t v3;
  id result;
  uint64_t v5;

  result = (id)objc_msgSend_archiveData(self, a2, v2, v3);
  if (result)
    return (id)MEMORY[0x1E0DE7D20](MEMORY[0x1E0C99DB0], sel_inputStreamWithData_, result, v5);
  return result;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7;

  v7 = objc_msgSend_archiveData(self, a2, (uint64_t)a3, a4);
  if (v7)
    LOBYTE(v7) = MEMORY[0x1E0DE7D20](v7, sel_writeToFile_options_error_, a3, a4);
  return v7;
}

- (void)invalidate
{
  NSDictionary *contents;
  NSData *data;
  __zFlags zFlags;
  NSString *path;
  NSArray *names;
  NSDictionary *properties;
  NSMutableDictionary *cachedContents;

  contents = self->_contents;
  if (contents)
  {

    self->_contents = 0;
  }
  data = self->_data;
  if (data)
  {

    self->_data = 0;
  }
  self->_provider = 0;
  zFlags = self->_zFlags;
  self->_zFlags = (__zFlags)(*(_DWORD *)&zFlags & 0xFFFFFFF8);
  if ((*(_BYTE *)&zFlags & 0x10) != 0)
  {
    close(self->_desc);
    *(_DWORD *)&self->_zFlags &= ~0x10u;
  }
  path = self->_path;
  if (path)
  {

    self->_path = 0;
  }
  names = self->_names;
  if (names)
  {

    self->_names = 0;
  }
  properties = self->_properties;
  if (properties)
  {

    self->_properties = 0;
  }
  cachedContents = self->_cachedContents;
  if (cachedContents)
  {

    self->_cachedContents = 0;
  }
}

- (BOOL)isValid
{
  return self->_contents || self->_data || (*(_BYTE *)&self->_zFlags & 0x13) != 0 || self->_path != 0;
}

@end
