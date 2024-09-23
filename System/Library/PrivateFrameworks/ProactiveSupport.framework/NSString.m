@implementation NSString

void __60__NSString__PASDistilledString___pas_distilledStringClasses__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x1A1AFDC98]();
  v1 = (void *)MEMORY[0x1A1AFDC98]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v1);
  v8 = (void *)_pas_distilledStringClasses__pasExprOnceResult;
  _pas_distilledStringClasses__pasExprOnceResult = v7;

  objc_autoreleasePoolPop(v0);
}

+ (_PASUTF8String)_pas_stringWithDataNoCopy:(uint64_t)a3 encoding:(uint64_t)a4 nullTerminated:(Boolean)a5 isExternalRepresentation:(unint64_t)a6 utf8StringThreshold:
{
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  const char *v15;
  unint64_t v16;
  int8x16_t *v17;
  int8x16_t *v18;
  unint64_t v19;
  BOOL v20;
  int8x16_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  CFAllocatorRef v32;
  uint64_t v33;
  const char *v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  Boolean v38;
  const __CFAllocator *v39;
  _PASUTF8String *v40;
  void *v42;
  void *v43;
  void *v44;
  CFAllocatorContext context;

  v10 = a2;
  objc_opt_self();
  if (!v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("data must be nonnull"));
  objc_msgSend(v10, "_pas_dataWithNonnullBytes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "length");
  v13 = objc_retainAutorelease(v11);
  v14 = objc_msgSend(v13, "bytes");
  v15 = (const char *)v14;
  if ((_DWORD)a4 && !v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nullTerminated is true but the buffer is zero-length"));
LABEL_28:
    v28 = v13;
    v29 = objc_opt_self();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", sel__pas_foundationStringNoCopyWithBufferStart_bufferEnd_encoding_nullTerminated_isExternalRepresentation_backedByObject_, v29, CFSTR("NSString+_PASAdditions.m"), 914, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("buffer"));

    }
    v30 = (unint64_t)&v15[v12];
    if (!v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", sel__pas_foundationStringNoCopyWithBufferStart_bufferEnd_encoding_nullTerminated_isExternalRepresentation_backedByObject_, v29, CFSTR("NSString+_PASAdditions.m"), 915, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("backingObject"));

    }
    context.version = 0;
    v31 = v28;
    context.info = v31;
    memset(&context.retain, 0, 24);
    context.allocate = (CFAllocatorAllocateCallBack)cfAllocateAlwaysFailing_1689;
    context.reallocate = 0;
    context.deallocate = (CFAllocatorDeallocateCallBack)cfDeallocateReleaseBackingObject;
    context.preferredSize = 0;
    v32 = CFAllocatorCreate(0, &context);
    if (v32)
    {
      v33 = v29;
      v34 = v15;
      v35 = v30;
      v36 = a3;
      v37 = a4;
      v38 = a5;
      v39 = v32;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", sel__pas_foundationStringNoCopyWithBufferStart_bufferEnd_encoding_nullTerminated_isExternalRepresentation_backedByObject_, v29, CFSTR("NSString+_PASAdditions.m"), 922, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deallocator"));

      v33 = v29;
      v34 = v15;
      v35 = v30;
      v36 = a3;
      v37 = a4;
      v38 = a5;
      v39 = 0;
    }
    +[NSString _pas_foundationStringNoCopyWithBufferStart:bufferEnd:encoding:nullTerminated:isExternalRepresentation:allocator:](v33, v34, v35, v36, v37, v38, v39);
    v40 = (_PASUTF8String *)objc_claimAutoreleasedReturnValue();
    CFRelease(v32);

    goto LABEL_35;
  }
  if (a3 != 4)
    goto LABEL_28;
  if (!v12)
    goto LABEL_28;
  a3 = 4;
  if (v12 < a6 || HIDWORD(v12))
    goto LABEL_28;
  v16 = v12;
  v17 = (int8x16_t *)v14;
  do
  {
    v18 = v17;
    v19 = v16;
    v20 = v16 >= 0x20;
    v16 -= 32;
    if (!v20)
      break;
    v21 = vorrq_s8(*v17, v17[1]);
    v17 += 2;
  }
  while ((*(_QWORD *)&vorr_s8(*(int8x8_t *)v21.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL)) & 0x8080808080808080) == 0);
  do
  {
    v22 = (uint64_t *)v18;
    v23 = v19;
    v20 = v19 >= 0x10;
    v19 -= 16;
    if (!v20)
      break;
    ++v18;
  }
  while (((v22[1] | *v22) & 0x8080808080808080) == 0);
  do
  {
    v24 = v22;
    v25 = v23;
    v20 = v23 >= 8;
    v23 -= 8;
    if (!v20)
      break;
    ++v22;
  }
  while ((*v24 & 0x8080808080808080) == 0);
  while (1)
  {
    v27 = v25 - 4;
    if (v25 < 4)
      break;
    v26 = *(_DWORD *)v24;
    v24 = (uint64_t *)((char *)v24 + 4);
    v25 -= 4;
    if ((v26 & 0x80808080) != 0)
    {
      v25 = v27 + 4;
      v24 = (uint64_t *)((char *)v24 - 4);
      goto LABEL_25;
    }
  }
  if (!v25)
  {
    a3 = 1;
    goto LABEL_28;
  }
LABEL_25:
  a3 = 1;
  while ((*(char *)v24 & 0x80000000) == 0)
  {
    v24 = (uint64_t *)((char *)v24 + 1);
    if (!--v25)
      goto LABEL_28;
  }
  if ((_DWORD)a4 && *(_BYTE *)(v12 + v14 - 1))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nullTerminated is true but the buffer is not null-terminated"));
  v40 = -[_PASUTF8String initWithUTF8Data:asciiPrefixLength:nullTerminated:]([_PASUTF8String alloc], "initWithUTF8Data:asciiPrefixLength:nullTerminated:", v13, ((_DWORD)v24 - (_DWORD)v15), a4);
LABEL_35:

  return v40;
}

+ (__CFString)_pas_foundationStringNoCopyWithBufferStart:(unint64_t)a3 bufferEnd:(unint64_t)a4 encoding:(int)a5 nullTerminated:(Boolean)a6 isExternalRepresentation:(const __CFAllocator *)a7 allocator:
{
  uint64_t v13;
  CFStringEncoding v14;
  __CFString *v15;
  BOOL v16;
  CFIndex v17;
  void *v19;
  void *v20;
  void *v21;

  v13 = objc_opt_self();
  if (a2)
  {
    if (a7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__pas_foundationStringNoCopyWithBufferStart_bufferEnd_encoding_nullTerminated_isExternalRepresentation_allocator_, v13, CFSTR("NSString+_PASAdditions.m"), 872, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("buffer"));

    if (a7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__pas_foundationStringNoCopyWithBufferStart_bufferEnd_encoding_nullTerminated_isExternalRepresentation_allocator_, v13, CFSTR("NSString+_PASAdditions.m"), 873, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deallocator"));

LABEL_3:
  v14 = CFStringConvertNSStringEncodingToEncoding(a4);
  if (a5)
  {
    if (!a3)
      goto LABEL_8;
    if (a3 <= (unint64_t)a2 || *(_BYTE *)(a3 - 1))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nullTerminated is true but the buffer is not null-terminated"));
    if (strnlen(a2, a3 + ~(unint64_t)a2) == a3 + ~(unint64_t)a2)
    {
LABEL_8:
      v15 = (__CFString *)CFStringCreateWithCStringNoCopy(0, a2, v14, a7);
      return v15;
    }
    --a3;
  }
  v16 = a3 >= (unint64_t)a2;
  v17 = a3 - (_QWORD)a2;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__pas_foundationStringNoCopyWithBufferStart_bufferEnd_encoding_nullTerminated_isExternalRepresentation_allocator_, v13, CFSTR("NSString+_PASAdditions.m"), 901, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferEnd >= buffer"));

  }
  v15 = (__CFString *)CFStringCreateWithBytesNoCopy(0, (const UInt8 *)a2, v17, v14, a6, a7);
  return v15;
}

id __65__NSString__PASAdditions___pas_proxyArrayOfSubstringsWithRanges___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeValue");
  objc_msgSend(v2, "substringWithRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __65__NSString__PASAdditions___pas_proxyArrayOfSubstringsWithRanges___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "count");
}

@end
