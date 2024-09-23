@implementation VMUSwiftRuntimeInfo

- (VMUSwiftRuntimeInfo)initWithSwiftCore:(_CSTypeRef)a3 memoryReader:(id)a4 task:(id)a5
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  id v9;
  id v10;
  char *v11;
  int v12;
  id v13;
  int v14;
  char v15;
  uint64_t Range;
  _WORD *v17;
  VMUSwiftRuntimeInfo *v18;
  FILE *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  char v28;
  uint64_t v34;
  uint64_t Path;
  void *v36;
  void *v37;
  void *v38;
  VMUMutableFieldInfo *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  FILE *v53;
  _QWORD v54[6];
  objc_super v55;
  VMUMutableFieldInfo *v56;
  id v57;
  _QWORD v58[2];

  opaque_2 = a3._opaque_2;
  opaque_1 = a3._opaque_1;
  v58[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v55.receiver = self;
  v55.super_class = (Class)VMUSwiftRuntimeInfo;
  v11 = -[VMUSwiftRuntimeInfo init](&v55, sel_init);
  if (!v11)
    goto LABEL_12;
  v12 = objc_msgSend(v10, "isExclave");
  v13 = v9;
  v14 = CSIsNull();
  v15 = v14;
  if (((v12 | v14) & 1) != 0)
  {

    if ((v15 & 1) != 0)
      goto LABEL_12;
  }
  else
  {
    CSSymbolOwnerGetSymbolWithMangledName();
    if ((CSIsNull() & 1) != 0
      || (Range = CSSymbolGetRange(),
          (v17 = (_WORD *)(*((uint64_t (**)(id, uint64_t, uint64_t))v13 + 2))(v13, Range, 2)) == 0)
      || !*v17)
    {

LABEL_12:
      v18 = 0;
      goto LABEL_13;
    }

  }
  if (!_copy_remote_mangled_symbol_value(v13, (uint64_t)"_swift_debug_nativeWeakReferenceMarkerMask", opaque_1, opaque_2, 8uLL, v11 + 8))
  {
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x3010000000;
    v54[5] = 0;
    v54[3] = &unk_1A4E39779;
    v54[4] = 0;
    CSSymbolOwnerForeachSection();
    if (CSIsNull())
    {
      v20 = (FILE *)*MEMORY[0x1E0C80C10];
      CSSymbolOwnerGetPath();
      fprintf(v20, "NO __DATA_DIRTY,__objc_imageinfo section in %s\n");
LABEL_16:
      _Block_object_dispose(v54, 8);
      goto LABEL_12;
    }
    if ((objc_msgSend(v10, "isExclave") & 1) != 0)
    {
      v21 = 7;
    }
    else
    {
      v22 = CSRegionGetRange();
      if (v22)
      {
        v23 = (*((uint64_t (**)(id, uint64_t, uint64_t))v13 + 2))(v13, v22, 8);
        if (!v23)
        {
          v53 = (FILE *)*MEMORY[0x1E0C80C10];
          CSSymbolOwnerGetPath();
          fprintf(v53, "Unable to read __DATA __objc_imageinfo from %s\n");
          goto LABEL_16;
        }
        v21 = *(unsigned __int8 *)(v23 + 5);
      }
      else
      {
        v21 = 0;
      }
    }
    v24 = objc_msgSend(v10, "isExclaveCore");
    v25 = 0x8000000000000001;
    if (v24)
      v25 = 0;
    *((_QWORD *)v11 + 1) = v25;
    *((_QWORD *)v11 + 2) = v24 ^ 1u;
    v26 = objc_msgSend(v10, "isExclaveCore");
    v27 = -8;
    if (v26)
      v27 = -1;
    *((_QWORD *)v11 + 3) = v27;
    if (v21 <= 4)
    {
      v28 = 0;
      v11[32] = 0;
      *(_OWORD *)(v11 + 40) = xmmword_1A4E21BC0;
      *((_QWORD *)v11 + 7) = 0;
      v11[64] = 0;
      v34 = 65;
    }
    else
    {
      v28 = 1;
      v11[32] = 1;
      __asm { FMOV            V0.2D, #-2.0 }
      *(_OWORD *)(v11 + 40) = _Q0;
      *((_QWORD *)v11 + 7) = 0x3FFFFFFFFFFFFFFFLL;
      *((_WORD *)v11 + 32) = 768;
      if (v21 < 7)
      {
LABEL_32:
        _Block_object_dispose(v54, 8);
        goto LABEL_33;
      }
      v34 = 96;
    }
    v11[v34] = v28;
    goto LABEL_32;
  }
  _copy_remote_mangled_symbol_value(v13, (uint64_t)"_swift_debug_nativeWeakReferenceMarkerValue", opaque_1, opaque_2, 8uLL, v11 + 16);
  _copy_remote_mangled_symbol_value(v13, (uint64_t)"_swift_debug_nativeWeakReferencePointerMask", opaque_1, opaque_2, 8uLL, v11 + 24);
  _copy_remote_mangled_symbol_value(v13, (uint64_t)"_swift_debug_nativeWeakReferencePointerIsSideTable", opaque_1, opaque_2, 1uLL, v11 + 32);
  _copy_remote_mangled_symbol_value(v13, (uint64_t)"_swift_debug_refcountIsSideTableMarkerMask", opaque_1, opaque_2, 8uLL, v11 + 40);
  _copy_remote_mangled_symbol_value(v13, (uint64_t)"_swift_debug_refcountIsSideTableMarkerValue", opaque_1, opaque_2, 8uLL, v11 + 48);
  _copy_remote_mangled_symbol_value(v13, (uint64_t)"_swift_debug_sideTablePointerMask", opaque_1, opaque_2, 8uLL, v11 + 56);
  _copy_remote_mangled_symbol_value(v13, (uint64_t)"_swift_debug_sideTablePointerRightShift", opaque_1, opaque_2, 1uLL, v11 + 64);
  _copy_remote_mangled_symbol_value(v13, (uint64_t)"_swift_debug_sideTablePointerLeftShift", opaque_1, opaque_2, 1uLL, v11 + 65);
  v11[96] = 1;
LABEL_33:
  Path = CSSymbolOwnerGetPath();
  if (Path)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Path);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    VMUSanitizePath(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUMutableClassInfo, "classInfoWithClassName:binaryPath:type:", CFSTR("Swift weak reference storage"), v37, 16);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setDefaultScanType:", 4);
    v39 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("_owner"), CFSTR("^@"), 4, 0, 8);
    v40 = objc_msgSend(v38, "mutableCopy");
    v41 = (void *)*((_QWORD *)v11 + 9);
    *((_QWORD *)v11 + 9) = v40;

    v42 = (void *)*((_QWORD *)v11 + 9);
    v58[0] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addFields:", v43);

    v44 = -[VMUFieldInfo mutableCopy](v39, "mutableCopy");
    objc_msgSend(v44, "setScanType:", 0);
    v45 = objc_msgSend(v38, "mutableCopy");
    v46 = (void *)*((_QWORD *)v11 + 10);
    *((_QWORD *)v11 + 10) = v45;

    v47 = (void *)*((_QWORD *)v11 + 10);
    v57 = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addFields:", v48);

    +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUMutableClassInfo, "classInfoWithClassName:binaryPath:type:", CFSTR("Swift unowned reference storage"), v37, 16);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)*((_QWORD *)v11 + 11);
    *((_QWORD *)v11 + 11) = v49;

    objc_msgSend(*((id *)v11 + 11), "setDefaultScanType:", 4);
    v51 = (void *)*((_QWORD *)v11 + 11);
    v56 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addFields:", v52);

  }
  v18 = v11;
LABEL_13:

  return v18;
}

char *__59__VMUSwiftRuntimeInfo_initWithSwiftCore_memoryReader_task___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *Name;
  char *result;
  uint64_t v8;

  Name = (char *)CSRegionGetName();
  result = strstr(Name, " __objc_imageinfo");
  if (result)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(v8 + 32) = a2;
    *(_QWORD *)(v8 + 40) = a3;
  }
  return result;
}

- (unint64_t)nativeWeakReferenceMarkerMask
{
  return self->_nativeWeakReferenceMarkerMask;
}

- (unint64_t)nativeWeakReferenceMarkerValue
{
  return self->_nativeWeakReferenceMarkerValue;
}

- (unint64_t)nativeWeakReferencePointerMask
{
  return self->_nativeWeakReferencePointerMask;
}

- (BOOL)nativeWeakReferencePointerIsSideTable
{
  return self->_nativeWeakReferencePointerIsSideTable;
}

- (unint64_t)refcountIsSideTableMarkerMask
{
  return self->_refcountIsSideTableMarkerMask;
}

- (unint64_t)refcountIsSideTableMarkerValue
{
  return self->_refcountIsSideTableMarkerValue;
}

- (unint64_t)sideTablePointerMask
{
  return self->_sideTablePointerMask;
}

- (unsigned)sideTablePointerRightShift
{
  return self->_sideTablePointerRightShift;
}

- (unsigned)sideTablePointerLeftShift
{
  return self->_sideTablePointerLeftShift;
}

- (VMUMutableClassInfo)sideTableLayoutWithScannableOwnerPointer
{
  return self->_sideTableLayoutWithScannableOwnerPointer;
}

- (VMUMutableClassInfo)sideTableLayoutWithUnscannableOwnerPointer
{
  return self->_sideTableLayoutWithUnscannableOwnerPointer;
}

- (VMUMutableClassInfo)unownedExtraDataLayout
{
  return self->_unownedExtraDataLayout;
}

- (BOOL)runtimeHasStableABI
{
  return self->_runtimeHasStableABI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unownedExtraDataLayout, 0);
  objc_storeStrong((id *)&self->_sideTableLayoutWithUnscannableOwnerPointer, 0);
  objc_storeStrong((id *)&self->_sideTableLayoutWithScannableOwnerPointer, 0);
}

@end
