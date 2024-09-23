@implementation ZN5dyld414PrebuiltLoader9serializeER11DiagnosticsRNS

void *___ZN5dyld414PrebuiltLoader9serializeER11DiagnosticsRNS_12RuntimeStateERKNS_16JustInTimeLoaderENS_6Loader9LoaderRefEU13block_pointerFvjjRKNS8_14ResolvedSymbolEERNS_12PrebuiltObjCERKNS_13PrebuiltSwiftERNS_13BumpAllocatorE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dyld4::BumpAllocator *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  dyld4::BumpAllocator *v12;
  const void *v13;
  size_t v14;
  uint64_t v15;

  v5 = *(dyld4::BumpAllocator **)(a1 + 32);
  v6 = *((_QWORD *)v5 + 2);
  v7 = *(_QWORD *)v5;
  if ((((_BYTE)v6 - *(_QWORD *)v5) & 7) != 0)
  {
    v5 = (dyld4::BumpAllocator *)dyld4::BumpAllocator::zeroFill(v5, 8 - (((_BYTE)v6 - *(_QWORD *)v5) & 7));
    v8 = *(uint64_t **)(a1 + 32);
    v6 = v8[2];
    v7 = *v8;
  }
  v9 = v6 - *(_QWORD *)(a1 + 40) - v7;
  v10 = **(_QWORD **)(a1 + 48) + *(_QWORD *)(a1 + 56);
  *(_WORD *)(v10 + 46) = v9;
  if (v9 >= 0x10000)
    ___ZN5dyld414PrebuiltLoader9serializeER11DiagnosticsRNS_12RuntimeStateERKNS_16JustInTimeLoaderENS_6Loader9LoaderRefEU13block_pointerFvjjRKNS8_14ResolvedSymbolEERNS_12PrebuiltObjCERKNS_13PrebuiltSwiftERNS_13BumpAllocatorE_block_invoke_cold_2();
  *(_WORD *)(v10 + 44) = *(_WORD *)(v10 + 44) & 0xF | (16 * *(_WORD *)(a2 + 16));
  v11 = *(_QWORD *)(a2 + 16);
  if (!v11)
    dyld3::MultiMapBase<prebuilt_objc::ObjCStringKey,prebuilt_objc::ObjCObjectLocation,prebuilt_objc::HashObjCStringKey,prebuilt_objc::EqualObjCStringKey>::forEachEntry<prebuilt_objc::ObjCStringKey>((uint64_t)v5, a2, a3);
  v12 = *(dyld4::BumpAllocator **)(a1 + 32);
  v13 = *(const void **)a2;
  v14 = 16 * v11;
  v15 = *((_QWORD *)v12 + 2) - *(_QWORD *)v12;
  dyld4::BumpAllocator::zeroFill(v12, 16 * v11);
  return memmove((void *)(*(_QWORD *)v12 + v15), v13, v14);
}

_QWORD *___ZN5dyld414PrebuiltLoader9serializeER11DiagnosticsRNS_12RuntimeStateERKNS_16JustInTimeLoaderENS_6Loader9LoaderRefEU13block_pointerFvjjRKNS8_14ResolvedSymbolEERNS_12PrebuiltObjCERKNS_13PrebuiltSwiftERNS_13BumpAllocatorE_block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  dyld4::PrebuiltLoader::BindTargetRef::BindTargetRef(&v9, *(vm_address_t **)(a1 + 40), a2);
  result = (_QWORD *)Diagnostics::hasError(*(Diagnostics **)(a1 + 40));
  if ((_DWORD)result)
  {
    *a3 = 1;
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    result = dyld3::OverflowSafeArray<dyld4::Loader *,4294967295ull>::verifySpace((_QWORD *)(v6 + 40), 1);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_QWORD *)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v8 + 1;
    *(_QWORD *)(v7 + 8 * v8) = v9;
  }
  return result;
}

@end
