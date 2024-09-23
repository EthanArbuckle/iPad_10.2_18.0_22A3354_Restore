@implementation VFXNSZipFileArchive

- (VFXNSZipFileArchive)initWithPath:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  VFXNSZipFileArchive *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VFXNSZipFileArchive;
  v8 = -[VFXNSZipFileArchive init](&v19, sel_init);
  v12 = (uint64_t)v8;
  if (!a3 || !v8)
  {
    if (!v8)
      return (VFXNSZipFileArchive *)v12;
    goto LABEL_10;
  }
  if (!objc_msgSend_length(a3, v9, v10, v11))
    goto LABEL_10;
  v13 = a4 & 3;
  if (v13 != 1)
  {
    if (v13 == 2)
    {
      v18 = objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x1E0C99D50], v9, (uint64_t)a3, 1, a5);
    }
    else
    {
      if (v13 == 3)
      {
        v14 = sub_1B18F1D20(a3, v9, v10, v11);
        if ((v14 & 0x8000000000000000) == 0)
        {
          v15 = v14;
          *(_QWORD *)(v12 + 40) = objc_msgSend_copy(a3, v9, v10, v11);
          close(v15);
          goto LABEL_18;
        }
LABEL_10:
        objc_msgSend_dealloc((void *)v12, v9, v10, v11);
        return 0;
      }
      v18 = objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x1E0C99D50], v9, (uint64_t)a3, 0, a5);
    }
    if (v18)
    {
      v12 = objc_msgSend_initWithData_options_error_((void *)v12, v9, v18, a4, a5);
      if (!v12)
        return (VFXNSZipFileArchive *)v12;
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  v17 = sub_1B18F1D20(a3, v9, v10, v11);
  *(_QWORD *)(v12 + 32) = v17;
  if (v17 < 0)
    goto LABEL_10;
  *(_DWORD *)(v12 + 80) |= 0x10u;
LABEL_18:
  if ((a4 & 4) != 0)
    *(_DWORD *)(v12 + 80) |= 8u;
  return (VFXNSZipFileArchive *)v12;
}

- (VFXNSZipFileArchive)initWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v5;
  VFXNSZipFileArchive *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  VFXNSZipFileArchive *v11;
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
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  const char *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  BOOL v40;
  BOOL v41;
  _BOOL4 v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  const char *v48;
  id v49;
  const char *v50;
  _BOOL4 v51;
  unint64_t v52;
  BOOL v53;
  BOOL v54;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  unint64_t v75;
  unsigned __int16 *v76;
  uint64_t v77;
  unint64_t v78;
  int v80;
  uint64_t v83;
  id v84;
  char v85;
  VFXNSZipFileArchive *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  objc_super v100;

  v5 = a4;
  v100.receiver = self;
  v100.super_class = (Class)VFXNSZipFileArchive;
  v7 = -[VFXNSZipFileArchive init](&v100, sel_init, a3, a4, a5);
  v11 = v7;
  if (!a3 || !v7)
    goto LABEL_80;
  v90 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10);
  v89 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v12, v13, v14);
  v18 = objc_msgSend_bytes(a3, v15, v16, v17);
  v22 = objc_msgSend_length(a3, v19, v20, v21);
  if (v22 < 0x15)
    goto LABEL_81;
  v23 = v22;
  v8 = 0;
  v24 = 0;
  v25 = -20;
  v26 = 20;
  v27 = v18;
  do
  {
    v28 = *(_DWORD *)(v27 + v22 - 20);
    if (v28 == 117853008)
    {
      v29 = 0;
      if (v22 >= 0x39)
      {
        v30 = *(_QWORD *)(v27 + v22 - 12);
        if (v30 <= v22 - 56)
        {
          v31 = v18 + v30;
          if (*(_DWORD *)(v18 + v30) == 101075792)
          {
            v8 = *(const char **)(v31 + 24);
            v24 = *(_QWORD *)(v31 + 48);
            v29 = *(_QWORD *)(v27 + v22 - 12);
          }
          else
          {
            v29 = 0;
          }
        }
      }
    }
    else if (v28 == 101010256)
    {
      v29 = v22 - v26;
      v8 = (const char *)*(unsigned __int16 *)(v27 + v22 - 12);
      v24 = *(unsigned int *)(v27 + v22 - 4);
    }
    else
    {
      v29 = 0;
      if (v26 >= 0x38 && v28 == 101075792)
      {
        v29 = v22 + v25;
        v8 = *(const char **)(v27 + v22 + 4);
        v24 = *(_QWORD *)(v27 + v22 + 28);
      }
    }
    if (v26 > 0x101CE)
      break;
    if (v29)
      break;
    ++v26;
    --v25;
    --v27;
  }
  while (v26 < v22);
  if (!v8)
    goto LABEL_80;
  v84 = a3;
  v85 = v5;
  v91 = 0;
  v32 = 0;
  v88 = v18 + 8;
  v86 = v11;
  v87 = v18 + 16;
  v33 = v24;
  v98 = v18;
  do
  {
    if (v33 < v24)
      break;
    if (v33 >= v23)
      break;
    v34 = v33 + 46;
    if (v33 + 46 <= v24)
      break;
    if (v34 > v23)
      break;
    v35 = v18 + v33;
    if (*(_DWORD *)v35 != 33639248)
      break;
    v97 = v8;
    v37 = *(unsigned int *)(v35 + 20);
    v36 = *(unsigned int *)(v35 + 24);
    v38 = *(unsigned __int16 *)(v35 + 28);
    v39 = *(unsigned int *)(v35 + 42);
    v40 = v37 == 0xFFFFFFFFLL || v36 == 0xFFFFFFFFLL;
    v41 = v40 || v39 == 0xFFFFFFFF;
    v42 = v41;
    v43 = v34 + v38;
    if (v34 + v38 <= v24 || v43 > v23)
      break;
    v44 = 0;
    v9 = *(unsigned __int16 *)(v35 + 10);
    v45 = *(unsigned __int16 *)(v35 + 30);
    v95 = *(unsigned int *)(v35 + 16);
    v96 = *(unsigned __int16 *)(v35 + 32);
    v99 = v45;
    if (*(_WORD *)(v35 + 28))
    {
      if (v24 > v39)
      {
        v93 = *(unsigned __int16 *)(v35 + 10);
        v46 = objc_alloc(MEMORY[0x1E0CB3940]);
        v47 = v98 + v34;
        v44 = (id)objc_msgSend_initWithBytes_length_encoding_(v46, v48, v47, v38, 4);
        v9 = v93;
        v45 = v99;
        if (!v44)
        {
          v49 = objc_alloc(MEMORY[0x1E0CB3940]);
          v44 = (id)objc_msgSend_initWithBytes_length_encoding_(v49, v50, v47, v38, 12);
          v9 = v93;
          v45 = v99;
        }
      }
    }
    v51 = v45 > 4 && v42;
    v40 = v51;
    v52 = v43 + v45;
    v53 = !v40 || v43 >= v52;
    v54 = !v53 && v52 > v24;
    if (!v54 || v52 > v23)
    {
      v18 = v98;
    }
    else
    {
      v75 = v43;
      v18 = v98;
      do
      {
        v76 = (unsigned __int16 *)(v98 + v75);
        v77 = *(unsigned __int16 *)(v98 + v75 + 2);
        v78 = v75 + 4;
        v75 += 4 + v77;
        if (v75 <= v78 || v75 > v52)
          break;
        v80 = *v76;
        if (v77 >= 0x18 && v80 == 1)
        {
          if (v36 == 0xFFFFFFFFLL)
            v36 = *(_QWORD *)(v98 + v78);
          if (v37 == 0xFFFFFFFFLL)
            v37 = *(_QWORD *)(v88 + v78);
          if (v39 == 0xFFFFFFFF)
            v39 = *(_QWORD *)(v87 + v78);
        }
      }
      while (v75 < v52);
    }
    if (v44)
    {
      v94 = (void *)MEMORY[0x1E0C99D80];
      v56 = (uint64_t)v44;
      v92 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v8, v9, v10);
      v59 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v57, v39, v58);
      v62 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v60, v95, v61);
      v65 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v63, v37, v64);
      v68 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v66, v36, v67);
      v83 = v62;
      v18 = v98;
      v71 = objc_msgSend_dictionaryWithObjectsAndKeys_(v94, v69, v92, v70, CFSTR("NSZipFileArchiveCompressionType"), v59, CFSTR("NSZipFileArchiveHeaderOffset"), v83, CFSTR("NSZipFileArchiveCRC"), v65, CFSTR("NSZipFileArchiveCompressedLength"), v68, CFSTR("NSZipFileArchiveUncompressedLength"), 0);
      objc_msgSend_addObject_(v90, v72, v56, v73);
      objc_msgSend_setObject_forKey_(v89, v74, v71, v56);
      v45 = v99;
      v91 = 1;
    }
    v8 = v97;
    v33 = v43 + v45 + v96;
    ++v32;
  }
  while (v32 != v97);
  v11 = v86;
  if ((v91 & 1) == 0)
  {
LABEL_80:
    if (!v11)
      return v11;
LABEL_81:
    objc_msgSend_dealloc(v11, v8, v9, v10);
    return 0;
  }
  v86->_data = (NSData *)v84;
  v86->_names = (NSArray *)v90;
  v86->_properties = (NSDictionary *)v89;
  if ((v85 & 4) != 0)
    *(_DWORD *)&v86->_zFlags |= 8u;
  return v11;
}

- (VFXNSZipFileArchive)initWithEntryNames:(id)a3 contents:(id)a4 properties:(id)a5 options:(unint64_t)a6
{
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  VFXNSZipFileArchive *v14;
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
  v29.super_class = (Class)VFXNSZipFileArchive;
  v14 = -[VFXNSZipFileArchive init](&v29, sel_init);
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
    objc_msgSend_dealloc(v14, v11, v12, v13);
    return 0;
  }
  return v14;
}

- (VFXNSZipFileArchive)initWithEntryNames:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5
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
  v14.super_class = (Class)VFXNSZipFileArchive;
  v8 = -[VFXNSZipFileArchive init](&v14, sel_init);
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
      return (VFXNSZipFileArchive *)v8;
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
    objc_msgSend_dealloc(v8, v9, v10, v11);
    return 0;
  }
  return (VFXNSZipFileArchive *)v8;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_invalidate(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)VFXNSZipFileArchive;
  -[VFXNSZipFileArchive dealloc](&v5, sel_dealloc);
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
      v15 = (void *)objc_msgSend_objectForKey_(v11, v12, (uint64_t)CFSTR("NSZipFileArchiveHeaderOffset"), v13);
      v19 = objc_msgSend_unsignedIntegerValue(v15, v16, v17, v18);
      v22 = (void *)objc_msgSend_objectForKey_(v14, v20, (uint64_t)CFSTR("NSZipFileArchiveCompressionType"), v21);
      v26 = objc_msgSend_unsignedIntegerValue(v22, v23, v24, v25);
      v29 = (void *)objc_msgSend_objectForKey_(v14, v27, (uint64_t)CFSTR("NSZipFileArchiveCRC"), v28);
      v33 = objc_msgSend_unsignedIntegerValue(v29, v30, v31, v32);
      v36 = (void *)objc_msgSend_objectForKey_(v14, v34, (uint64_t)CFSTR("NSZipFileArchiveCompressedLength"), v35);
      v40 = objc_msgSend_unsignedIntegerValue(v36, v37, v38, v39);
      v43 = (void *)objc_msgSend_objectForKey_(v14, v41, (uint64_t)CFSTR("NSZipFileArchiveUncompressedLength"), v42);
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
                  if (v33 == sub_1B19D1370(v75, v47))
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
            if (!v26 && v33 == sub_1B19D1370((const Bytef *)(v52 + v60), v40))
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
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  const char *v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  size_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  BOOL v64;
  int v65;
  const Bytef *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uInt v70;
  unsigned int v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  unsigned __int8 *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  unsigned int v84;
  Bytef *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  int v100;
  __int16 v101;
  void *v102;
  int v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  __int16 v148;
  __int16 v149;
  uint64_t v150;
  void *v151;
  void *v152;
  __int16 v153;
  uint64_t v154;
  int v155;
  int v156;
  VFXNSZipFileArchive *v157;
  z_stream strm;

  v151 = (void *)objc_msgSend_data(MEMORY[0x1E0C99DF0], a2, v2, v3);
  v152 = (void *)objc_msgSend_data(MEMORY[0x1E0C99DF0], v5, v6, v7);
  v157 = self;
  v11 = objc_msgSend_count(self->_names, v8, v9, v10);
  v12 = objc_alloc(MEMORY[0x1E0C99D48]);
  v15 = (id)objc_msgSend_initWithCalendarIdentifier_(v12, v13, *MEMORY[0x1E0C996C8], v14);
  v19 = objc_msgSend_date(MEMORY[0x1E0C99D68], v16, v17, v18);
  v21 = (void *)objc_msgSend_components_fromDate_(v15, v20, 252, v19);
  v25 = objc_msgSend_year(v21, v22, v23, v24);
  v29 = objc_msgSend_month(v21, v26, v27, v28);
  v33 = objc_msgSend_day(v21, v30, v31, v32);
  v37 = objc_msgSend_hour(v21, v34, v35, v36);
  v41 = objc_msgSend_minute(v21, v38, v39, v40);
  v45 = objc_msgSend_second(v21, v42, v43, v44);
  v48 = ((_WORD)v25 << 9) - 30720;
  if (v25 < 0x7BC)
    v48 = 0;
  if (v11)
  {
    v49 = 0;
    v148 = v33 | (32 * v29) | v48;
    v149 = (32 * v41) | (v37 << 11) | (v45 >> 1);
    v150 = v11;
    do
    {
      v50 = (void *)objc_msgSend_objectAtIndex_(v157->_names, v46, v49, v47);
      v54 = (const char *)objc_msgSend_UTF8String(v50, v51, v52, v53);
      v55 = strlen(v54);
      v58 = (void *)objc_msgSend_contentsForEntryName_(v157, v56, (uint64_t)v50, v57);
      v62 = objc_msgSend_length(v58, v59, v60, v61);
      if (v55)
        v64 = v58 == 0;
      else
        v64 = 1;
      if (!v64)
      {
        v65 = v62;
        v66 = (const Bytef *)objc_msgSend_bytes(v58, v46, v63, v47);
        v70 = objc_msgSend_length(v58, v67, v68, v69);
        v71 = crc32(0, 0, 0);
        LODWORD(v66) = crc32(v71, v66, v70);
        v75 = (unsigned __int8 *)objc_msgSend_bytes(v58, v72, v73, v74);
        v79 = objc_msgSend_length(v58, v76, v77, v78);
        v155 = (int)v66;
        if (v79)
        {
          while (1)
          {
            v84 = *v75++;
            v83 = v84;
            if (v84 <= 0x1F && v83 - 7 >= 7 && v83 - 26 > 1)
              break;
            if (!--v79)
              goto LABEL_14;
          }
          v153 = 0;
        }
        else
        {
LABEL_14:
          v153 = 1;
        }
        v85 = (Bytef *)objc_msgSend_bytes(v58, v80, v81, v82);
        v89 = objc_msgSend_length(v58, v86, v87, v88);
        v93 = 0;
        v156 = v65;
        if (v85)
        {
          v94 = v89;
          if (v89)
          {
            v95 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v90, v89 - 1, v92);
            memset(&strm.avail_in, 0, 104);
            strm.next_in = v85;
            strm.avail_in = v94;
            strm.next_out = (Bytef *)objc_msgSend_mutableBytes(v95, v96, v97, v98);
            strm.avail_out = v94 - 1;
            if (v95
              && !deflateInit2_(&strm, 6, 8, -15, 8, 0, "1.2.12", 112)
              && (v99 = deflate(&strm, 4), v100 = deflateEnd(&strm), v99 == 1))
            {
              v93 = 0;
              if (!v100 && v94 == strm.total_in)
              {
                objc_msgSend_setLength_(v95, v90, strm.total_out, v92);
                v93 = v95;
              }
            }
            else
            {
              v93 = 0;
            }
          }
        }
        v101 = 8 * (v93 != 0);
        if (v93)
          v102 = v93;
        else
          v102 = v58;
        v154 = (uint64_t)v102;
        v103 = objc_msgSend_length(v102, v90, v91, v92);
        v106 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v104, v55 + 30, v105);
        objc_msgSend_replaceBytesInRange_withBytes_(v106, v107, 0, 30, &unk_1B2268F40);
        objc_msgSend_replaceBytesInRange_withBytes_(v106, v108, 30, v55, v54);
        v112 = objc_msgSend_mutableBytes(v106, v109, v110, v111);
        *(_WORD *)(v112 + 4) = 20;
        *(_WORD *)(v112 + 8) = v101;
        *(_WORD *)(v112 + 10) = v149;
        *(_WORD *)(v112 + 12) = v148;
        *(_DWORD *)(v112 + 14) = v155;
        *(_DWORD *)(v112 + 18) = v103;
        *(_DWORD *)(v112 + 22) = v156;
        *(_WORD *)(v112 + 26) = v55;
        v115 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v113, v55 + 46, v114);
        objc_msgSend_replaceBytesInRange_withBytes_(v115, v116, 0, 46, &unk_1B2268F5E);
        objc_msgSend_replaceBytesInRange_withBytes_(v115, v117, 46, v55, v54);
        v121 = objc_msgSend_mutableBytes(v115, v118, v119, v120);
        *(_WORD *)(v121 + 6) = 20;
        *(_WORD *)(v121 + 10) = v101;
        *(_WORD *)(v121 + 12) = v149;
        *(_WORD *)(v121 + 14) = v148;
        *(_DWORD *)(v121 + 16) = v155;
        *(_DWORD *)(v121 + 20) = v103;
        *(_DWORD *)(v121 + 24) = v156;
        *(_WORD *)(v121 + 28) = v55;
        *(_WORD *)(v121 + 36) = v153;
        *(_DWORD *)(v121 + 42) = objc_msgSend_length(v152, v122, v123, v124);
        objc_msgSend_appendData_(v152, v125, (uint64_t)v106, v126);
        objc_msgSend_appendData_(v152, v127, v154, v128);
        objc_msgSend_appendData_(v151, v129, (uint64_t)v115, v130);
        v11 = v150;
      }
      ++v49;
    }
    while (v49 != v11);
  }
  v131 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v46, 22, v47);
  objc_msgSend_replaceBytesInRange_withBytes_(v131, v132, 0, 22, &unk_1B2268F8C);
  v136 = objc_msgSend_mutableBytes(v131, v133, v134, v135);
  *(_WORD *)(v136 + 8) = v11;
  *(_WORD *)(v136 + 10) = v11;
  *(_DWORD *)(v136 + 12) = objc_msgSend_length(v151, v137, v138, v139);
  *(_DWORD *)(v136 + 16) = objc_msgSend_length(v152, v140, v141, v142);
  objc_msgSend_appendData_(v152, v143, (uint64_t)v151, v144);
  objc_msgSend_appendData_(v152, v145, (uint64_t)v131, v146);
  return v152;
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
