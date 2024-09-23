@implementation ZN5dyld4L19optimizeObjCClassesERNS

_QWORD *___ZN5dyld4L19optimizeObjCClassesERNS_12RuntimeStateEPKN4objc14ClassHashTableERN5dyld33MapItNSt3__14pairI9VMAddressPKNS_6LoaderEEENS_10HashUInt16ENS_11EqualUInt16EEERNS7_IPKcNSB_10BindTargetENS6_11HashCStringENS6_12EqualCStringEEERNS_12PrebuiltObjC18ObjCOptimizerImageE_block_invoke(uint64_t a1, objc_visitor::Class *a2)
{
  char v4;
  uint64_t VMAddress;
  char v6;
  char v7;
  uint64_t NameVMAddr;
  char v9;
  char v10;
  char *v11;
  const char *Name;
  uint64_t v14;
  const char *v15;
  _QWORD v16[3];

  if ((objc_visitor::Class::isRootClass((uint64_t)a2, (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)) & 1) == 0)
  {
    objc_visitor::Class::getSuperclassField((uint64_t)a2, (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v16);
    metadata_visitor::ResolvedValue::vmAddress((metadata_visitor::ResolvedValue *)v16);
    if (!v4)
      goto LABEL_11;
    if (!*(_QWORD *)lsl::Allocator::Pool::allocator((lsl::Allocator::Pool *)v16))
    {
      Name = (const char *)objc_visitor::Class::getName((uint64_t)a2, (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      v14 = *(_QWORD *)(a1 + 40);
      v15 = (const char *)dyld4::JustInTimeLoader::path(*(dyld4::JustInTimeLoader **)v14, *(const dyld4::RuntimeState **)(a1 + 48));
      return (_QWORD *)Diagnostics::error((vm_address_t *)(v14 + 32), "Missing weak superclass of class %s in %s", Name, v15);
    }
  }
  if (objc_visitor::Class::isUnfixedBackwardDeployingStableSwift((uint64_t)a2, (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)))*(_BYTE *)(*(_QWORD *)(a1 + 40) + 544) = 1;
  VMAddress = objc_visitor::Class::getVMAddress(a2);
  v7 = v6;
  NameVMAddr = objc_visitor::Class::getNameVMAddr((uint64_t)a2, (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v10 = v9;
  v11 = (char *)objc_visitor::Class::getName((uint64_t)a2, (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  if (!v7 || !v10)
LABEL_11:
    std::__throw_bad_optional_access[abi:nn180100]();
  return dyld4::PrebuiltObjC::ObjCOptimizerImage::visitClass(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned int **)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), VMAddress, 1, NameVMAddr, 1, v11);
}

@end
