@implementation VFXWorldLoader

- (VFXWorldLoader)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXWorldLoader;
  return -[VFXWorldLoader init](&v3, sel_init);
}

+ (id)loader
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)loadURL:(id)a3 into:(id)a4 options:(id)a5 statusHandler:(id)a6 error:(id *)a7
{
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  char URL_into_options_statusHandler_error;
  NSObject *v19;
  NSObject *v20;
  uint8_t v22[16];
  uint8_t buf[16];

  v13 = sub_1B17C439C();
  v14 = os_signpost_id_generate(v13);
  v15 = sub_1B17C439C();
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = v15;
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B178D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "LoadWorld", ", buf, 2u);
    }
  }
  URL_into_options_statusHandler_error = objc_msgSend__loadURL_into_options_statusHandler_error_(self, v16, (uint64_t)a3, (uint64_t)a4, a5, a6, a7);
  v19 = sub_1B17C439C();
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v20 = v19;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B178D000, v20, OS_SIGNPOST_INTERVAL_END, v14, "LoadWorld", ", v22, 2u);
    }
  }
  return URL_into_options_statusHandler_error;
}

- (BOOL)_loadURL:(id)a3 into:(id)a4 options:(id)a5 statusHandler:(id)a6 error:(id *)a7
{
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  int CoreEntityManagerFromURL_options_infoOut_error;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  int WorldDescriptionAt_into_options_compressed_statusHandler_error;
  const char *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t isEqualToString;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;

  if (a5)
    v13 = (id)objc_msgSend_mutableCopy(a5, a2, (uint64_t)a3, (uint64_t)a4);
  else
    v13 = (id)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, (uint64_t)a3, (uint64_t)a4);
  v17 = v13;
  v18 = (void *)objc_msgSend_pathExtension(a3, v14, v15, v16);
  v22 = (void *)objc_msgSend_lowercaseString(v18, v19, v20, v21);
  if ((objc_msgSend_isEqualToString_(v22, v23, (uint64_t)CFSTR("vfxproj"), v24) & 1) == 0
    && !objc_msgSend_isEqualToString_(v22, v25, (uint64_t)CFSTR("vfx"), v27))
  {
    isEqualToString = objc_msgSend_isEqualToString_(v22, v25, (uint64_t)CFSTR("vfxz-world"), v27);
    v72 = (void *)objc_msgSend_valueForKey_(a5, v70, (uint64_t)CFSTR("kWorldSourceFormat"), v71);
    if ((objc_msgSend_isEqualToString_(v72, v73, (uint64_t)CFSTR("vfx-world"), v74) & 1) == 0
      && (objc_msgSend_isEqualToString_(v22, v75, (uint64_t)CFSTR("plist"), v76) & 1) == 0
      && (objc_msgSend_isEqualToString_(v22, v75, (uint64_t)CFSTR("vfx-world"), v77) | isEqualToString) != 1
      || !objc_msgSend_loadWorldDescriptionAt_into_options_compressed_statusHandler_error_(self, v75, (uint64_t)a3, (uint64_t)a4, a5, isEqualToString, a6, a7))
    {
      LOBYTE(CoreEntityManagerFromURL_options_infoOut_error) = MEMORY[0x1E0DE7D20](self, sel_loadNonNativeFormatAt_into_options_statusHandler_error_, a3, a4);
      return CoreEntityManagerFromURL_options_infoOut_error;
    }
    objc_msgSend_resolveVFXCoreAndTagReferences(a4, v78, v79, v80);
    goto LABEL_18;
  }
  v28 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v25, v26, v27);
  CoreEntityManagerFromURL_options_infoOut_error = objc_msgSend_loadCoreEntityManagerFromURL_options_infoOut_error_(a4, v29, (uint64_t)a3, (uint64_t)v17, v28, a7);
  if (CoreEntityManagerFromURL_options_infoOut_error)
  {
    v33 = objc_msgSend_objectForKeyedSubscript_(v28, v31, (uint64_t)CFSTR("serializationContext"), v32);
    objc_msgSend_setObject_forKeyedSubscript_(v17, v34, v33, (uint64_t)CFSTR("serializationContext"));
    v37 = objc_msgSend_URLByAppendingPathComponent_(a3, v35, (uint64_t)CFSTR("world.plist"), v36);
    WorldDescriptionAt_into_options_compressed_statusHandler_error = objc_msgSend_loadWorldDescriptionAt_into_options_compressed_statusHandler_error_(self, v38, v37, (uint64_t)a4, v17, 0, a6, a7);
    LOBYTE(CoreEntityManagerFromURL_options_infoOut_error) = 0;
    if (WorldDescriptionAt_into_options_compressed_statusHandler_error)
    {
      objc_msgSend_resolveVFXCoreAndTagReferences(a4, v39, v40, v41);
      CoreEntityManagerFromURL_options_infoOut_error = objc_msgSend_migrateCoreEntityManagerWithInfo_error_(a4, v43, (uint64_t)v28, (uint64_t)a7);
      if (CoreEntityManagerFromURL_options_infoOut_error)
      {
        objc_msgSend_replicateToRuntimeAndStartReplicationWithOptions_(a4, v44, (uint64_t)a5, v45);
        CoreEntityManagerFromURL_options_infoOut_error = objc_msgSend_initializeCoreEntityManagerWithInfo_error_(a4, v46, (uint64_t)v28, (uint64_t)a7);
        if (CoreEntityManagerFromURL_options_infoOut_error)
        {
          v49 = (void *)objc_msgSend_objectForKeyedSubscript_(v28, v47, (uint64_t)CFSTR("version"), v48);
          self->_version = (int)objc_msgSend_intValue(v49, v50, v51, v52);
          self->_documentUUID = (NSUUID *)objc_msgSend_objectForKeyedSubscript_(v28, v53, (uint64_t)CFSTR("documentUUID"), v54);
          self->_warnings = (NSError *)objc_msgSend_objectForKeyedSubscript_(v28, v55, (uint64_t)CFSTR("warnings"), v56);
          v59 = (void *)objc_msgSend_objectForKeyedSubscript_(v28, v57, (uint64_t)CFSTR("precompiled"), v58);
          self->_precompiled = objc_msgSend_BOOLValue(v59, v60, v61, v62);
          if (a7 && *a7)
          {
            sub_1B17C4408(16, (uint64_t)CFSTR("Error: error loading core entity manager: %@"), v63, v64, v65, v66, v67, v68, (uint64_t)*a7);
            LOBYTE(CoreEntityManagerFromURL_options_infoOut_error) = 0;
            return CoreEntityManagerFromURL_options_infoOut_error;
          }
LABEL_18:
          LOBYTE(CoreEntityManagerFromURL_options_infoOut_error) = 1;
        }
      }
    }
  }
  return CoreEntityManagerFromURL_options_infoOut_error;
}

- (BOOL)loadData:(id)a3 into:(id)a4 options:(id)a5 statusHandler:(id)a6 error:(id *)a7
{
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  char WorldDescriptionFromData_into_options_compressed_sourceURL_statusHandler_error;
  NSObject *v19;
  NSObject *v20;
  uint8_t v22[16];
  uint8_t buf[16];

  v13 = sub_1B17C439C();
  v14 = os_signpost_id_generate(v13);
  v15 = sub_1B17C439C();
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = v15;
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B178D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "LoadWorld", ", buf, 2u);
    }
  }
  WorldDescriptionFromData_into_options_compressed_sourceURL_statusHandler_error = objc_msgSend_loadWorldDescriptionFromData_into_options_compressed_sourceURL_statusHandler_error_(self, v16, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, a6, a7);
  v19 = sub_1B17C439C();
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v20 = v19;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B178D000, v20, OS_SIGNPOST_INTERVAL_END, v14, "LoadWorld", ", v22, 2u);
    }
  }
  return WorldDescriptionFromData_into_options_compressed_sourceURL_statusHandler_error;
}

- (BOOL)loadNonNativeFormatAt:(id)a3 into:(id)a4 options:(id)a5 statusHandler:(id)a6 error:(id *)a7
{
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;

  v11 = (void *)MEMORY[0x1E0CC7780];
  v12 = objc_msgSend_pathExtension(a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7);
  LODWORD(v11) = objc_msgSend_canImportFileExtension_(v11, v13, v12, v14);
  objc_msgSend_begin(VFXTransaction, v15, v16, v17);
  objc_msgSend_setImmediateMode_(VFXTransaction, v18, 1, v19);
  if ((_DWORD)v11)
  {
    sub_1B18318EC(a4, (char *)a3, a5, (uint64_t)a6);
    objc_msgSend_commit(VFXTransaction, v21, v22, v23);
    if (a4)
    {
      v27 = objc_msgSend_worldRef(a4, v24, v25, v26);
      sub_1B19235FC(v27, (uint64_t)a5, 0, -1, v28, v29, v30, v31);
    }
  }
  else
  {
    v40 = 0;
    objc_msgSend_loadSCN_options_error_(a4, v20, (uint64_t)a3, (uint64_t)a5, &v40);
    if (v40)
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: error importing VFX world: %@"), v33, v34, v35, v36, v37, v38, v40);
    objc_msgSend_commit(VFXTransaction, v32, v33, v34);
  }
  return 1;
}

- (BOOL)loadWorldDescriptionAt:(id)a3 into:(id)a4 options:(id)a5 compressed:(BOOL)a6 statusHandler:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  uint64_t v15;
  const char *v16;
  id v18;
  char v19;

  v10 = a6;
  v15 = objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E0C99D50], a2, (uint64_t)a3, 0, a8);
  if (v15)
    return objc_msgSend_loadWorldDescriptionFromData_into_options_compressed_sourceURL_statusHandler_error_(self, v16, v15, (uint64_t)a4, a5, v10, a3, a7, a8);
  if (a7)
  {
    v19 = 1;
    if (a8)
      v18 = *a8;
    else
      v18 = 0;
    (*((void (**)(id, uint64_t, id, char *, float))a7 + 2))(a7, -1, v18, &v19, 1.0);
  }
  return 0;
}

- (BOOL)loadWorldDescriptionFromData:(id)a3 into:(id)a4 options:(id)a5 compressed:(BOOL)a6 sourceURL:(id)a7 statusHandler:(id)a8 error:(id *)a9
{
  _BOOL4 v10;
  uint64_t v15;
  void *v16;
  VFXKeyedUnarchiver *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __CFDictionary *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  _QWORD v66[3];

  v10 = a6;
  v66[2] = *MEMORY[0x1E0C80C00];
  if (!a7)
  {
    v15 = 1;
    if (!a6)
      goto LABEL_6;
LABEL_5:
    v16 = (void *)objc_msgSend_vfx_uncompressedDataUsingCompressionAlgorithm_(a3, a2, 517, (uint64_t)a4);
    a3 = v16;
    if (!v16)
      return (char)v16;
    goto LABEL_6;
  }
  v15 = sub_1B192486C((const __CFURL *)a7, (CFDictionaryRef)a5);
  if (v10)
    goto LABEL_5;
LABEL_6:
  v17 = [VFXKeyedUnarchiver alloc];
  v19 = (void *)objc_msgSend_initForReadingWithData_secure_(v17, v18, (uint64_t)a3, v15);
  v22 = v19;
  if (v19)
  {
    v23 = objc_msgSend_setDelegate_(v19, v20, (uint64_t)self, v21);
    v27 = (void *)MEMORY[0x1B5E23520](v23);
    if (a7)
    {
      v28 = sub_1B193C5C4((CFDictionaryRef)a5, (const __CFURL *)a7);
      objc_msgSend_setContext_(v22, v29, (uint64_t)v28, v30);
      objc_msgSend_setDocumentURL_(v22, v31, (uint64_t)a7, v32);
    }
    else
    {
      v28 = 0;
    }
    v33 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v24, v25, v26);
    v36 = v33;
    if (a7)
      objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)a7, (uint64_t)CFSTR("url"));
    v37 = objc_msgSend_objectForKeyedSubscript_(a5, v34, (uint64_t)CFSTR("serializationContext"), v35);
    objc_msgSend_setObject_forKeyedSubscript_(v36, v38, v37, (uint64_t)CFSTR("serializationContext"));
    objc_msgSend_setValue_forKey_(VFXTransaction, v39, (uint64_t)v36, (uint64_t)CFSTR("VFXWorldLoadingContextKey"));
    v40 = (void *)MEMORY[0x1E0C99E60];
    v66[0] = objc_opt_class();
    v66[1] = objc_opt_class();
    v42 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v41, (uint64_t)v66, 2);
    v45 = objc_msgSend_setWithArray_(v40, v43, v42, v44);
    v47 = (void *)objc_msgSend_decodeObjectOfClasses_forKey_(v22, v46, v45, (uint64_t)CFSTR("root"));
    objc_msgSend_transferWorld_to_(VFXWorldLoader, v48, (uint64_t)v47, (uint64_t)a4);
    v52 = (void *)objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v49, v50, v51);
    v56 = (void *)objc_msgSend_processName(v52, v53, v54, v55);
    if (!objc_msgSend_isEqualToString_(v56, v57, (uint64_t)CFSTR("VFX Studio"), v58)
      || !objc_msgSend_assetPathResolver(a4, v59, v60, v61))
    {
      v62 = objc_msgSend_assetPathResolver(v47, v59, v60, v61);
      objc_msgSend_setAssetPathResolver_(a4, v63, v62, v64);
    }
    objc_msgSend_finishDecoding(v22, v59, v60, v61);

    if (v28)
      CFRelease(v28);
    objc_autoreleasePoolPop(v27);
    LOBYTE(v16) = 1;
  }
  else
  {
    LOBYTE(v16) = 0;
  }
  return (char)v16;
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = (void *)sub_1B1881E00();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(a5, v8, (uint64_t)&v37, (uint64_t)v42, 16);
  if (!v9)
    return 0;
  v12 = v9;
  v13 = *(_QWORD *)v38;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v38 != v13)
        objc_enumerationMutation(a5);
      v15 = objc_msgSend_classNamed_(v7, v10, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i), v11);
      if (v15)
      {
        v17 = (objc_class *)v15;
        if (!objc_msgSend_requiresSecureCoding(a3, v10, v16, v11))
          return v17;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v21 = (void *)objc_msgSend_allowedClasses(a3, v18, v19, v20);
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v33, (uint64_t)v41, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v34;
          v32 = v12;
LABEL_10:
          v26 = a3;
          v27 = a5;
          v28 = v7;
          v29 = v13;
          v30 = 0;
          while (1)
          {
            if (*(_QWORD *)v34 != v25)
              objc_enumerationMutation(v21);
            if ((objc_msgSend_isSubclassOfClass_(v17, v10, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v30), v11) & 1) != 0)
              return v17;
            if (v24 == ++v30)
            {
              v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v10, (uint64_t)&v33, (uint64_t)v41, 16);
              v13 = v29;
              v7 = v28;
              a5 = v27;
              a3 = v26;
              v12 = v32;
              if (v24)
                goto LABEL_10;
              break;
            }
          }
        }
      }
    }
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a5, v10, (uint64_t)&v37, (uint64_t)v42, 16);
    v17 = 0;
    if (v12)
      continue;
    return v17;
  }
}

+ (void)transferWorld:(id)a3 to:(id)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  int v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  double v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  double v133;
  double v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  double v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  _BYTE v286[128];
  _BYTE v287[128];
  _BYTE v288[128];
  _BYTE v289[128];
  uint64_t v290;

  v290 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_rootNode(a4, a2, (uint64_t)a3, (uint64_t)a4);
  v10 = (void *)objc_msgSend_childNodes(v6, v7, v8, v9);
  v14 = objc_msgSend_count(v10, v11, v12, v13);
  v18 = (void *)objc_msgSend_physicsWorld(a3, v15, v16, v17);
  v22 = (void *)objc_msgSend_physicsJoints(v18, v19, v20, v21);
  v26 = (void *)objc_msgSend_copy(v22, v23, v24, v25);
  v30 = (void *)objc_msgSend_rootNode(a3, v27, v28, v29);
  objc_msgSend_setWorld_(v30, v31, 0, v32);
  v36 = (void *)objc_msgSend_assetRegistry(a3, v33, v34, v35);
  objc_msgSend_setWorld_(v36, v37, 0, v38);
  v284 = 0u;
  v285 = 0u;
  v282 = 0u;
  v283 = 0u;
  v42 = (void *)objc_msgSend_rootNode(a3, v39, v40, v41);
  v46 = (void *)objc_msgSend_childNodes(v42, v43, v44, v45);
  v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v282, (uint64_t)v289, 16);
  if (v48)
  {
    v52 = v48;
    v53 = *(_QWORD *)v283;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v283 != v53)
          objc_enumerationMutation(v46);
        v55 = *(_QWORD *)(*((_QWORD *)&v282 + 1) + 8 * v54);
        v56 = (void *)objc_msgSend_rootNode(a4, v49, v50, v51);
        objc_msgSend_addChildNode_(v56, v57, v55, v58);
        ++v54;
      }
      while (v52 != v54);
      v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v282, (uint64_t)v289, 16);
    }
    while (v52);
  }
  v59 = (void *)objc_msgSend_rootNode(a3, v49, v50, v51);
  objc_msgSend_setWorld_(v59, v60, (uint64_t)a3, v61);
  v280 = 0u;
  v281 = 0u;
  v278 = 0u;
  v279 = 0u;
  v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v62, (uint64_t)&v278, (uint64_t)v288, 16);
  if (v63)
  {
    v67 = v63;
    v68 = *(_QWORD *)v279;
    do
    {
      v69 = 0;
      do
      {
        if (*(_QWORD *)v279 != v68)
          objc_enumerationMutation(v26);
        v70 = *(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * v69);
        v71 = (void *)objc_msgSend_physicsWorld(a4, v64, v65, v66);
        objc_msgSend_addPhysicsJoint_(v71, v72, v70, v73);
        ++v69;
      }
      while (v67 != v69);
      v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v64, (uint64_t)&v278, (uint64_t)v288, 16);
    }
    while (v67);
  }

  if (!v14)
  {
    if (objc_msgSend_background(a3, v74, v75, v76))
    {
      v80 = (void *)objc_msgSend_background(a4, v77, v78, v79);
      v84 = objc_msgSend_background(a3, v81, v82, v83);
      objc_msgSend_copyPropertiesFrom_(v80, v85, v84, v86);
    }
    if (objc_msgSend_lightingEnvironment(a3, v77, v78, v79))
    {
      v90 = (void *)objc_msgSend_lightingEnvironment(a4, v87, v88, v89);
      v94 = objc_msgSend_lightingEnvironment(a3, v91, v92, v93);
      objc_msgSend_copyPropertiesFrom_(v90, v95, v94, v96);
    }
    v97 = (void *)objc_msgSend_physicsWorld(a3, v87, v88, v89);
    objc_msgSend_gravity(v97, v98, v99, v100);
    v269 = v101;
    v105 = (void *)objc_msgSend_physicsWorld(a4, v102, v103, v104);
    objc_msgSend_setGravity_(v105, v106, v107, v108, v269);
    v112 = (void *)objc_msgSend_physicsWorld(a3, v109, v110, v111);
    objc_msgSend_speed(v112, v113, v114, v115);
    v117 = v116;
    v121 = (void *)objc_msgSend_physicsWorld(a4, v118, v119, v120);
    LODWORD(v122) = v117;
    objc_msgSend_setSpeed_(v121, v123, v124, v125, v122);
    v129 = (void *)objc_msgSend_physicsWorld(a3, v126, v127, v128);
    objc_msgSend_timeStep(v129, v130, v131, v132);
    v134 = v133;
    v138 = (void *)objc_msgSend_physicsWorld(a4, v135, v136, v137);
    objc_msgSend_setTimeStep_(v138, v139, v140, v141, v134);
    objc_msgSend_endTime(a3, v142, v143, v144);
    objc_msgSend_setEndTime_(a4, v145, v146, v147);
    objc_msgSend_startTime(a3, v148, v149, v150);
    objc_msgSend_setStartTime_(a4, v151, v152, v153);
    objc_msgSend_fogStartDistance(a3, v154, v155, v156);
    objc_msgSend_setFogStartDistance_(a4, v157, v158, v159);
    objc_msgSend_fogEndDistance(a3, v160, v161, v162);
    objc_msgSend_setFogEndDistance_(a4, v163, v164, v165);
    objc_msgSend_fogDensityExponent(a3, v166, v167, v168);
    objc_msgSend_setFogDensityExponent_(a4, v169, v170, v171);
    v175 = objc_msgSend_fogColor(a3, v172, v173, v174);
    objc_msgSend_setFogColor_(a4, v176, v175, v177);
    v181 = objc_msgSend_wantsScreenSpaceReflection(a3, v178, v179, v180);
    objc_msgSend_setWantsScreenSpaceReflection_(a4, v182, v181, v183);
    v187 = objc_msgSend_screenSpaceReflectionSampleCount(a3, v184, v185, v186);
    objc_msgSend_setScreenSpaceReflectionSampleCount_(a4, v188, v187, v189);
    objc_msgSend_screenSpaceReflectionMaximumDistance(a3, v190, v191, v192);
    objc_msgSend_setScreenSpaceReflectionMaximumDistance_(a4, v193, v194, v195);
    objc_msgSend_screenSpaceReflectionStride(a3, v196, v197, v198);
    objc_msgSend_setScreenSpaceReflectionStride_(a4, v199, v200, v201);
  }
  v202 = (void *)objc_msgSend_assetRegistry(a3, v74, v75, v76);
  v206 = (void *)objc_msgSend_rootNode(v202, v203, v204, v205);
  v210 = (void *)objc_msgSend_childNodes(v206, v207, v208, v209);
  v214 = (void *)objc_msgSend_copy(v210, v211, v212, v213);
  v274 = 0u;
  v275 = 0u;
  v276 = 0u;
  v277 = 0u;
  v216 = objc_msgSend_countByEnumeratingWithState_objects_count_(v214, v215, (uint64_t)&v274, (uint64_t)v287, 16);
  if (v216)
  {
    v220 = v216;
    v221 = *(_QWORD *)v275;
    do
    {
      v222 = 0;
      do
      {
        if (*(_QWORD *)v275 != v221)
          objc_enumerationMutation(v214);
        v223 = *(_QWORD *)(*((_QWORD *)&v274 + 1) + 8 * v222);
        v224 = (void *)objc_msgSend_assetRegistry(a4, v217, v218, v219);
        v228 = (void *)objc_msgSend_rootNode(v224, v225, v226, v227);
        objc_msgSend_addChildNode_(v228, v229, v223, v230);
        ++v222;
      }
      while (v220 != v222);
      v220 = objc_msgSend_countByEnumeratingWithState_objects_count_(v214, v217, (uint64_t)&v274, (uint64_t)v287, 16);
    }
    while (v220);
  }
  v272 = 0u;
  v273 = 0u;
  v270 = 0u;
  v271 = 0u;
  v231 = (void *)objc_msgSend_stateManager(a3, v217, v218, v219);
  v235 = (void *)objc_msgSend_states(v231, v232, v233, v234);
  v237 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v236, (uint64_t)&v270, (uint64_t)v286, 16);
  if (v237)
  {
    v241 = v237;
    v242 = *(_QWORD *)v271;
    do
    {
      v243 = 0;
      do
      {
        if (*(_QWORD *)v271 != v242)
          objc_enumerationMutation(v235);
        v244 = *(_QWORD *)(*((_QWORD *)&v270 + 1) + 8 * v243);
        v245 = (void *)objc_msgSend_stateManager(a4, v238, v239, v240);
        objc_msgSend_addState_(v245, v246, v244, v247);
        ++v243;
      }
      while (v241 != v243);
      v241 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v238, (uint64_t)&v270, (uint64_t)v286, 16);
    }
    while (v241);
  }
  v248 = (void *)objc_msgSend_assetRegistry(a3, v238, v239, v240);
  objc_msgSend_setWorld_(v248, v249, (uint64_t)a3, v250);
  v254 = objc_msgSend_defaultRenderGraph(a3, v251, v252, v253);
  objc_msgSend_setDefaultRenderGraph_(a4, v255, v254, v256);
  v260 = objc_msgSend_behaviorGraph(a3, v257, v258, v259);
  objc_msgSend_setBehaviorGraph_(a4, v261, v260, v262);
  v266 = objc_msgSend_identifier(a3, v263, v264, v265);
  objc_msgSend_setIdentifier_(a4, v267, v266, v268);

}

- (int64_t)version
{
  return self->_version;
}

- (NSUUID)documentUUID
{
  return self->_documentUUID;
}

- (BOOL)isPrecompiled
{
  return self->_precompiled;
}

- (NSError)warnings
{
  return self->_warnings;
}

@end
