@implementation _PASZoneSupport

+ (id)newMutableArrayInZone:(_NSZone *)a3
{
  return (id)objc_msgSend(a1, "newMutableArrayInZone:capacity:", a3, 0);
}

+ (id)newMutableArrayInZone:(_NSZone *)a3 capacity:(unint64_t)a4
{
  CFMutableArrayRef Mutable;
  void *v10;

  if (!a3 || (_NSZone *)MEMORY[0x1A1AFD650]() == a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  Mutable = CFArrayCreateMutable(a3, a4, MEMORY[0x1E0C9B378]);
  if (!Mutable)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 27, CFSTR("Unexpected CFArrayCreateMutable() failure"));

  }
  return Mutable;
}

+ (id)copyArray:(id)a3 toZone:(_NSZone *)a4
{
  id v7;
  CFArrayRef Copy;
  void *v9;

  v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A1AFD650]() == a4)
  {
    Copy = (CFArrayRef)objc_msgSend(v7, "copy");
  }
  else
  {
    Copy = CFArrayCreateCopy(a4, (CFArrayRef)v7);
    if (!Copy)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 38, CFSTR("Unexpected CFArrayCreateCopy() failure"));

    }
  }

  return Copy;
}

+ (id)mutableCopyArray:(id)a3 toZone:(_NSZone *)a4
{
  id v7;
  CFMutableArrayRef MutableCopy;
  void *v9;

  v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A1AFD650]() == a4)
  {
    MutableCopy = (CFMutableArrayRef)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    MutableCopy = CFArrayCreateMutableCopy(a4, 0, (CFArrayRef)v7);
    if (!MutableCopy)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 49, CFSTR("Unexpected CFArrayCreateMutableCopy() failure"));

    }
  }

  return MutableCopy;
}

+ (id)newMutableDictionaryInZone:(_NSZone *)a3
{
  return (id)objc_msgSend(a1, "newMutableDictionaryInZone:capacity:", a3, 0);
}

+ (id)newMutableDictionaryInZone:(_NSZone *)a3 capacity:(unint64_t)a4
{
  CFMutableDictionaryRef Mutable;
  void *v10;

  if (!a3 || (_NSZone *)MEMORY[0x1A1AFD650]() == a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a4);
  Mutable = CFDictionaryCreateMutable(a3, a4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 66, CFSTR("Unexpected CFDictionaryCreateMutable() failure"));

  }
  return Mutable;
}

+ (id)copyDictionary:(id)a3 toZone:(_NSZone *)a4
{
  id v7;
  CFDictionaryRef Copy;
  void *v9;

  v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A1AFD650]() == a4)
  {
    Copy = (CFDictionaryRef)objc_msgSend(v7, "copy");
  }
  else
  {
    Copy = CFDictionaryCreateCopy(a4, (CFDictionaryRef)v7);
    if (!Copy)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 77, CFSTR("Unexpected CFDictionaryCreateCopy() failure"));

    }
  }

  return Copy;
}

+ (id)mutableCopyDictionary:(id)a3 toZone:(_NSZone *)a4
{
  id v7;
  CFMutableDictionaryRef MutableCopy;
  void *v9;

  v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A1AFD650]() == a4)
  {
    MutableCopy = (CFMutableDictionaryRef)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutableCopy(a4, 0, (CFDictionaryRef)v7);
    if (!MutableCopy)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 88, CFSTR("Unexpected CFDictionaryCreateMutableCopy() failure"));

    }
  }

  return MutableCopy;
}

+ (id)newMutableSetInZone:(_NSZone *)a3
{
  return (id)objc_msgSend(a1, "newMutableSetInZone:capacity:", a3, 0);
}

+ (id)newMutableSetInZone:(_NSZone *)a3 capacity:(unint64_t)a4
{
  CFMutableSetRef Mutable;
  void *v10;

  if (!a3 || (_NSZone *)MEMORY[0x1A1AFD650]() == a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", a4);
  Mutable = CFSetCreateMutable(a3, a4, MEMORY[0x1E0C9B3B0]);
  if (!Mutable)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 104, CFSTR("Unexpected CFSetCreateMutable() failure"));

  }
  return Mutable;
}

+ (id)copySet:(id)a3 toZone:(_NSZone *)a4
{
  id v7;
  CFSetRef Copy;
  void *v9;

  v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A1AFD650]() == a4)
  {
    Copy = (CFSetRef)objc_msgSend(v7, "copy");
  }
  else
  {
    Copy = CFSetCreateCopy(a4, (CFSetRef)v7);
    if (!Copy)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 115, CFSTR("Unexpected CFSetCreateCopy() failure"));

    }
  }

  return Copy;
}

+ (id)mutableCopySet:(id)a3 toZone:(_NSZone *)a4
{
  id v7;
  CFMutableSetRef MutableCopy;
  void *v9;

  v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A1AFD650]() == a4)
  {
    MutableCopy = (CFMutableSetRef)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    MutableCopy = CFSetCreateMutableCopy(a4, 0, (CFSetRef)v7);
    if (!MutableCopy)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 126, CFSTR("Unexpected CFSetCreateCopy() failure"));

    }
  }

  return MutableCopy;
}

+ (id)newMutableStringInZone:(_NSZone *)a3
{
  return (id)objc_msgSend(a1, "newMutableStringInZone:capacity:", a3, 0);
}

+ (id)newMutableStringInZone:(_NSZone *)a3 capacity:(unint64_t)a4
{
  CFMutableStringRef Mutable;
  void *v10;

  if (!a3 || (_NSZone *)MEMORY[0x1A1AFD650]() == a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", a4);
  Mutable = CFStringCreateMutable(a3, 0);
  if (!Mutable)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 143, CFSTR("Unexpected CFStringCreateMutable() failure"));

  }
  return Mutable;
}

+ (id)copyString:(id)a3 toZone:(_NSZone *)a4
{
  __CFString *v7;
  CFStringRef Copy;
  void *v9;

  v7 = (__CFString *)a3;
  if (a4 && (_NSZone *)MEMORY[0x1A1AFD650]() != a4 && malloc_size(v7))
  {
    Copy = CFStringCreateCopy(a4, v7);
    if (!Copy)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 156, CFSTR("Unexpected CFStringCreateCopy() failure"));

    }
  }
  else
  {
    Copy = (CFStringRef)-[__CFString copy](v7, "copy");
  }

  return (id)Copy;
}

+ (id)mutableCopyString:(id)a3 toZone:(_NSZone *)a4
{
  __CFString *v7;
  CFMutableStringRef MutableCopy;
  void *v9;

  v7 = (__CFString *)a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A1AFD650]() == a4)
  {
    MutableCopy = (CFMutableStringRef)-[__CFString mutableCopy](v7, "mutableCopy");
  }
  else
  {
    MutableCopy = CFStringCreateMutableCopy(a4, 0, v7);
    if (!MutableCopy)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 167, CFSTR("Unexpected CFStringCreateMutableCopy() failure"));

    }
  }

  return MutableCopy;
}

+ (id)newMutableDataInZone:(_NSZone *)a3
{
  return (id)objc_msgSend(a1, "newMutableDataInZone:capacity:", a3, 0);
}

+ (id)newMutableDataInZone:(_NSZone *)a3 capacity:(unint64_t)a4
{
  CFMutableDataRef Mutable;
  void *v10;

  if (!a3 || (_NSZone *)MEMORY[0x1A1AFD650]() == a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", a4);
  Mutable = CFDataCreateMutable(a3, 0);
  if (!Mutable)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 184, CFSTR("Unexpected CFDataCreateMutable() failure"));

  }
  return Mutable;
}

+ (id)newMutableDataInZone:(_NSZone *)a3 length:(unint64_t)a4
{
  __CFData *Mutable;
  void *v10;

  if (!a3 || (_NSZone *)MEMORY[0x1A1AFD650]() == a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a4);
  Mutable = CFDataCreateMutable(a3, 0);
  if (!Mutable)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 195, CFSTR("Unexpected CFDataCreateMutable() failure"));

  }
  CFDataSetLength(Mutable, a4);
  return Mutable;
}

+ (id)copyData:(id)a3 toZone:(_NSZone *)a4
{
  id v7;
  CFDataRef Copy;
  void *v9;

  v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A1AFD650]() == a4)
  {
    Copy = (CFDataRef)objc_msgSend(v7, "copy");
  }
  else
  {
    Copy = CFDataCreateCopy(a4, (CFDataRef)v7);
    if (!Copy)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 207, CFSTR("Unexpected CFDataCreateCopy() failure"));

    }
  }

  return Copy;
}

+ (id)mutableCopyData:(id)a3 toZone:(_NSZone *)a4
{
  id v7;
  CFMutableDataRef MutableCopy;
  void *v9;

  v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A1AFD650]() == a4)
  {
    MutableCopy = (CFMutableDataRef)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    MutableCopy = CFDataCreateMutableCopy(a4, 0, (CFDataRef)v7);
    if (!MutableCopy)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 218, CFSTR("Unexpected CFDataCreateMutableCopy() failure"));

    }
  }

  return MutableCopy;
}

+ (id)copyNumber:(id)a3 toZone:(_NSZone *)a4
{
  const __CFNumber *v7;
  CFIndex ByteSize;
  size_t v9;
  char *v10;
  CFNumberType Type;
  CFNumberType v12;
  CFNumberRef v13;
  size_t v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *memptr;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = (const __CFNumber *)a3;
  if (a4 && (_NSZone *)MEMORY[0x1A1AFD650]() != a4 && malloc_size(v7))
  {
    ByteSize = CFNumberGetByteSize(v7);
    v9 = ByteSize + 7;
    memptr = 0;
    v22 = 0;
    if ((unint64_t)(ByteSize + 7) > 0x400)
    {
      v15 = CFNumberGetByteSize(v7);
      v16 = malloc_type_posix_memalign(&memptr, 8uLL, v15, 0x28FF9D6DuLL);
      LOBYTE(v22) = 0;
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v19);
      }
      v10 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1E0C80A78](ByteSize);
      v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v10, v9);
    }
    Type = CFNumberGetType(v7);
    if (!CFNumberGetValue(v7, Type, v10))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 231, CFSTR("Unexpected value conversion error from CFNumberGetValue"));

    }
    v12 = CFNumberGetType(v7);
    v13 = CFNumberCreate(a4, v12, v10);
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 233, CFSTR("Unexpected CFNumberCreate() failure"));

    }
    if (v9 >= 0x401)
      free(v10);
  }
  else
  {
    v13 = (CFNumberRef)-[__CFNumber copy](v7, "copy");
  }

  return v13;
}

+ (id)copyDate:(id)a3 toZone:(_NSZone *)a4
{
  id v7;
  CFAbsoluteTime v8;
  CFDateRef v9;
  void *v10;

  v7 = a3;
  if (a4 && (_NSZone *)MEMORY[0x1A1AFD650]() != a4 && malloc_size(v7))
  {
    v8 = MEMORY[0x1A1AFD32C](v7);
    v9 = CFDateCreate(a4, v8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 246, CFSTR("Unexpected CFDateCreate() failure"));

    }
  }
  else
  {
    v9 = (CFDateRef)objc_msgSend(v7, "copy");
  }

  return v9;
}

+ (id)copyUUID:(id)a3 toZone:(_NSZone *)a4
{
  id v7;
  CFUUIDRef v8;
  void *v9;
  CFUUIDBytes v11;

  v7 = a3;
  if (!a4 || (_NSZone *)MEMORY[0x1A1AFD650]() == a4)
  {
    v8 = (CFUUIDRef)objc_msgSend(v7, "copy");
  }
  else
  {
    v11 = CFUUIDGetUUIDBytes((CFUUIDRef)v7);
    v8 = CFUUIDCreateFromUUIDBytes(a4, v11);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASZoneSupport.m"), 258, CFSTR("Unexpected CFUUIDCreateFromUUIDBytes() failure"));

    }
  }

  return v8;
}

+ (id)deepCopyObject:(id)a3 toZone:(_NSZone *)a4 strategy:(id)a5
{
  char v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  id v31;
  char v33;
  char v34;
  void *context;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _NSZone *v43;
  char v44;
  __int16 v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = (char)a5;
  v9 = a3;
  v10 = (void *)MEMORY[0x1A1AFDC98]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v8;
    context = v10;
    v11 = v9;
    v12 = (void *)objc_msgSend(a1, "newMutableArrayInZone:capacity:", a4, objc_msgSend(v11, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v48 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(a1, "deepCopyObject:toZone:strategy:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i), a4, *(unsigned int *)&a5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v15);
    }

    if ((v33 & 1) == 0)
    {
      v19 = (id)objc_msgSend(a1, "copyArray:toZone:", v12, a4);
LABEL_25:
      v30 = v19;

      v10 = context;
      goto LABEL_49;
    }
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v9;
    v21 = (void *)objc_msgSend(a1, "newMutableDictionaryInZone:capacity:", a4, objc_msgSend(v20, "count"));
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __50___PASZoneSupport_deepCopyObject_toZone_strategy___block_invoke;
    v40[3] = &unk_1E442FB38;
    v42 = a1;
    v43 = a4;
    v44 = v8;
    v46 = *((_BYTE *)&a5 + 3);
    v45 = *(unsigned int *)&a5 >> 8;
    v22 = v21;
    v41 = v22;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v40);

    if ((v8 & 2) != 0)
      v23 = v22;
    else
      v23 = (id)objc_msgSend(a1, "copyDictionary:toZone:", v22, a4);
    v30 = v23;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v8;
      context = v10;
      v24 = v9;
      v12 = (void *)objc_msgSend(a1, "newMutableSetInZone:capacity:", a4, objc_msgSend(v24, "count"));
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v13 = v24;
      v25 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v37 != v27)
              objc_enumerationMutation(v13);
            objc_msgSend(a1, "deepCopyObject:toZone:strategy:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j), a4, *(unsigned int *)&a5);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v29);

          }
          v26 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
        }
        while (v26);
      }

      if ((v34 & 4) == 0)
      {
        v19 = (id)objc_msgSend(a1, "copySet:toZone:", v12, a4);
        goto LABEL_25;
      }
LABEL_24:
      v19 = v12;
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((v8 & 0x10) != 0)
        v31 = (id)objc_msgSend(a1, "mutableCopyData:toZone:", v9, a4);
      else
        v31 = (id)objc_msgSend(a1, "copyData:toZone:", v9, a4);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((v8 & 8) != 0)
          v31 = (id)objc_msgSend(a1, "mutableCopyString:toZone:", v9, a4);
        else
          v31 = (id)objc_msgSend(a1, "copyString:toZone:", v9, a4);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = (id)objc_msgSend(a1, "copyNumber:toZone:", v9, a4);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v31 = (id)objc_msgSend(a1, "copyDate:toZone:", v9, a4);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = (id)objc_msgSend(a1, "copyUUID:toZone:", v9, a4);
            }
            else if ((v8 & 0x20) != 0 && objc_msgSend(v9, "conformsToProtocol:", &unk_1EE5ADA68))
            {
              v31 = (id)objc_msgSend(v9, "mutableCopyWithZone:", a4);
            }
            else if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE5AD428))
            {
              v31 = (id)objc_msgSend(v9, "copyWithZone:", a4);
            }
            else
            {
              v31 = v9;
            }
          }
        }
      }
    }
    v30 = v31;
  }
LABEL_49:
  objc_autoreleasePoolPop(v10);

  return v30;
}

@end
