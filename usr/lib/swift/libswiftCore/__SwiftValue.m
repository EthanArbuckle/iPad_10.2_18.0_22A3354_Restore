@implementation __SwiftValue

+ (id)allocWithZone:(_NSZone *)a3
{
  qword_1EDC1B980 = (uint64_t)"__SwiftValue cannot be instantiated";
  __break(1u);
  return result;
}

- (void)dealloc
{
  Class isa;
  uint64_t v4;
  uint64_t v5;

  isa = self[1].super.isa;
  v4 = *((_QWORD *)isa - 1);
  v5 = *(_DWORD *)(v4 + 80) & 0xF8;
  (*(void (**)(char *, Class))(v4 + 8))((char *)self + ((v5 + 39) & ~(v5 | 7)), isa);
  objc_destructInstance(self);
  swift_slowDealloc(self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v5;
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t HashableBaseType;
  uint64_t v11;
  unint64_t *v13;
  uint64_t *v15;
  unint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  __int16 v38;
  char *v39;
  int v40;
  unint64_t EquatableBaseType;
  unint64_t *v43;
  unint64_t v45;
  uint64_t v46;
  __int16 v47;
  char *v48;
  int v49;

  if (self == a3)
    return 1;
  if (!a3)
    goto LABEL_82;
  if (qword_1ECD25488 != -1)
    dispatch_once_f(&qword_1ECD25488, &getSwiftValueClass(void)::$_0::operator() const(void)::TheLazy, (dispatch_function_t)getSwiftValueClass(void)::$_0::operator() const(void)::{lambda(void *)#1}::__invoke);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_82:
    LOBYTE(EquatableBaseType) = 0;
    return EquatableBaseType & 1;
  }
  v5 = (uint64_t *)&self[1];
  v6 = (unint64_t *)&self[3];
  v7 = atomic_load((unint64_t *)&self[3]);
  if (!v7)
  {
    v8 = swift_conformsToProtocolCommon(*v5, (uint64_t)&protocol descriptor for Hashable);
    if (v8)
    {
      v7 = v8;
      HashableBaseType = (unint64_t)swift::hashable_support::findHashableBaseType(*v5);
    }
    else
    {
      v11 = swift_conformsToProtocolCommon(*v5, (uint64_t)&protocol descriptor for Equatable);
      v7 = v11 | 1;
      if (v11)
        HashableBaseType = (unint64_t)swift::findConformingSuperclass(*v5, *(_QWORD *)v11) | 1;
      else
        HashableBaseType = 1;
    }
    while (!__ldaxr(v6))
    {
      if (!__stlxr(v7, v6))
        goto LABEL_17;
    }
    __clrex();
LABEL_17:
    v13 = (unint64_t *)&self[2];
    while (!__ldaxr(v13))
    {
      if (!__stlxr(HashableBaseType, v13))
        goto LABEL_22;
    }
    __clrex();
  }
LABEL_22:
  v15 = (uint64_t *)((char *)a3 + 8);
  if ((v7 & 1) != 0)
    goto LABEL_62;
  v16 = (unint64_t *)&self[2];
  v17 = atomic_load((unint64_t *)&self[2]);
  if (!v17)
  {
    v18 = swift_conformsToProtocolCommon(*v5, (uint64_t)&protocol descriptor for Hashable);
    if (v18)
    {
      v19 = v18;
      v20 = (unint64_t)swift::hashable_support::findHashableBaseType(*v5);
    }
    else
    {
      v21 = swift_conformsToProtocolCommon(*v5, (uint64_t)&protocol descriptor for Equatable);
      v19 = v21 | 1;
      if (v21)
        v20 = (unint64_t)swift::findConformingSuperclass(*v5, *(_QWORD *)v21) | 1;
      else
        v20 = 1;
    }
    do
    {
      if (__ldaxr(v6))
      {
        __clrex();
        break;
      }
    }
    while (__stlxr(v19, v6));
    while (!__ldaxr(v16))
    {
      if (!__stlxr(v20, v16))
        goto LABEL_37;
    }
    __clrex();
LABEL_37:
    v17 = atomic_load(v16);
  }
  if (!v17 || (v17 & 1) != 0)
    goto LABEL_62;
  v25 = (unint64_t *)((char *)a3 + 16);
  v26 = atomic_load((unint64_t *)a3 + 2);
  if (!v26)
  {
    v27 = swift_conformsToProtocolCommon(*v15, (uint64_t)&protocol descriptor for Hashable);
    if (v27)
    {
      v28 = v27;
      v29 = (unint64_t)swift::hashable_support::findHashableBaseType(*v15);
    }
    else
    {
      v30 = swift_conformsToProtocolCommon(*v15, (uint64_t)&protocol descriptor for Equatable);
      v28 = v30 | 1;
      if (v30)
        v29 = (unint64_t)swift::findConformingSuperclass(*v15, *(_QWORD *)v30) | 1;
      else
        v29 = 1;
    }
    v31 = (unint64_t *)((char *)a3 + 24);
    do
    {
      if (__ldaxr(v31))
      {
        __clrex();
        break;
      }
    }
    while (__stlxr(v28, v31));
    while (!__ldaxr(v25))
    {
      if (!__stlxr(v29, v25))
        goto LABEL_58;
    }
    __clrex();
LABEL_58:
    v26 = atomic_load(v25);
  }
  if ((v26 & 1) != 0)
    v26 = 0;
  if (v26 != v17)
  {
LABEL_62:
    v34 = atomic_load(v6);
    if (!v34)
    {
      v35 = swift_conformsToProtocolCommon(*v5, (uint64_t)&protocol descriptor for Hashable);
      if (v35)
      {
        v34 = v35;
        v36 = (unint64_t)swift::hashable_support::findHashableBaseType(*v5);
      }
      else
      {
        v37 = swift_conformsToProtocolCommon(*v5, (uint64_t)&protocol descriptor for Equatable);
        v34 = v37 | 1;
        if (v37)
          v36 = (unint64_t)swift::findConformingSuperclass(*v5, *(_QWORD *)v37) | 1;
        else
          v36 = 1;
      }
      while (!__ldaxr(v6))
      {
        if (!__stlxr(v34, v6))
          goto LABEL_73;
      }
      __clrex();
LABEL_73:
      v43 = (unint64_t *)&self[2];
      while (!__ldaxr(v43))
      {
        if (!__stlxr(v36, v43))
          goto LABEL_78;
      }
      __clrex();
    }
LABEL_78:
    LOBYTE(EquatableBaseType) = 0;
    if ((v34 & 1) == 0)
      return EquatableBaseType & 1;
    v45 = v34 & 0xFFFFFFFFFFFFFFFELL;
    if (!v45)
      return EquatableBaseType & 1;
    EquatableBaseType = SwiftValueHeader::getEquatableBaseType((SwiftValueHeader *)&self[1]);
    if (!EquatableBaseType)
      return EquatableBaseType & 1;
    v46 = EquatableBaseType;
    if (EquatableBaseType == SwiftValueHeader::getEquatableBaseType((SwiftValueHeader *)((char *)a3 + 8)))
    {
      v47 = *(_DWORD *)(*((_QWORD *)self[1].super.isa - 1) + 80) & 0xF8;
      v48 = (char *)self + ((unsigned __int16)(v47 + 39) & (unsigned __int16)~v47 & 0x1F8);
      v49 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)a3 + 1) - 8) + 80) & 0xF8;
      LOBYTE(EquatableBaseType) = _swift_stdlib_Equatable_isEqual_indirect((uint64_t)v48, (uint64_t)a3 + ((unsigned __int16)(v49 + 39) & (unsigned __int16)~(_WORD)v49 & 0x1F8), v46, v45);
      return EquatableBaseType & 1;
    }
    goto LABEL_82;
  }
  v38 = *(_DWORD *)(*((_QWORD *)self[1].super.isa - 1) + 80) & 0xF8;
  v39 = (char *)self + ((unsigned __int16)(v38 + 39) & (unsigned __int16)~v38 & 0x1F8);
  v40 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)a3 + 1) - 8) + 80) & 0xF8;
  LOBYTE(EquatableBaseType) = _swift_stdlib_Hashable_isEqual_indirect((uint64_t)v39, (uint64_t)a3 + ((unsigned __int16)(v40 + 39) & (unsigned __int16)~(_WORD)v40 & 0x1F8), v17, v7);
  return EquatableBaseType & 1;
}

- (unint64_t)hash
{
  __SwiftValue *v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t HashableBaseType;
  uint64_t v7;
  unint64_t *v9;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  Class isa;
  int v15;
  uint64_t v17;
  unint64_t *v19;
  char v21;
  _BYTE *TypeName;
  const char *v23;
  char *v24;
  Class *v25;

  v2 = self;
  v3 = (unint64_t *)&self[3];
  v4 = atomic_load((unint64_t *)&self[3]);
  if (!v4)
  {
    v5 = swift_conformsToProtocolCommon((uint64_t)self[1].super.isa, (uint64_t)&protocol descriptor for Hashable);
    if (v5)
    {
      v4 = v5;
      HashableBaseType = (unint64_t)swift::hashable_support::findHashableBaseType((uint64_t)v2[1].super.isa);
    }
    else
    {
      v7 = swift_conformsToProtocolCommon((uint64_t)v2[1].super.isa, (uint64_t)&protocol descriptor for Equatable);
      v4 = v7 | 1;
      if (v7)
        HashableBaseType = (unint64_t)swift::findConformingSuperclass((uint64_t)v2[1].super.isa, *(_QWORD *)v7) | 1;
      else
        HashableBaseType = 1;
    }
    while (!__ldaxr(v3))
    {
      if (!__stlxr(v4, v3))
        goto LABEL_11;
    }
    __clrex();
LABEL_11:
    v9 = (unint64_t *)&v2[2];
    while (!__ldaxr(v9))
    {
      if (!__stlxr(HashableBaseType, v9))
        goto LABEL_16;
    }
    __clrex();
  }
LABEL_16:
  if ((v4 & 1) == 0)
  {
    isa = v2[1].super.isa;
    v15 = *(_DWORD *)(*((_QWORD *)isa - 1) + 80) & 0xF8;
    return _getErrorCode<A>(_:)((char *)v2 + ((unsigned __int16)(v15 + 39) & (unsigned __int16)~(_WORD)v15 & 0x1F8), isa, v4);
  }
  v11 = atomic_load(v3);
  if (!v11)
  {
    v12 = swift_conformsToProtocolCommon((uint64_t)v2[1].super.isa, (uint64_t)&protocol descriptor for Hashable);
    if (v12)
    {
      v11 = v12;
      v13 = (unint64_t)swift::hashable_support::findHashableBaseType((uint64_t)v2[1].super.isa);
    }
    else
    {
      v17 = swift_conformsToProtocolCommon((uint64_t)v2[1].super.isa, (uint64_t)&protocol descriptor for Equatable);
      v11 = v17 | 1;
      if (v17)
        v13 = (unint64_t)swift::findConformingSuperclass((uint64_t)v2[1].super.isa, *(_QWORD *)v17) | 1;
      else
        v13 = 1;
    }
    while (!__ldaxr(v3))
    {
      if (!__stlxr(v11, v3))
        goto LABEL_28;
    }
    __clrex();
LABEL_28:
    v19 = (unint64_t *)&v2[2];
    while (!__ldaxr(v19))
    {
      if (!__stlxr(v13, v19))
        goto LABEL_31;
    }
    __clrex();
    if (v11 < 2)
      return (unint64_t)v2;
    goto LABEL_32;
  }
LABEL_31:
  if (v11 >= 2)
  {
LABEL_32:
    if ((v11 & 1) != 0)
    {
      v25 = (Class *)v2[1].super.isa;
      os_unfair_lock_lock((os_unfair_lock_t)&-[__SwiftValue hash]::warnedLock);
      if (qword_1EDC2B8D8 != -1)
        dispatch_once_f(&qword_1EDC2B8D8, &-[__SwiftValue hash]::warned, (dispatch_function_t)swift::Lazy<std::unordered_set<swift::TargetMetadata<swift::InProcess> const*,std::hash<swift::TargetMetadata<swift::InProcess> const*>,std::equal_to<swift::TargetMetadata<swift::InProcess> const*>,std::allocator<swift::TargetMetadata<swift::InProcess> const*>>>::defaultInitCallback);
      std::__hash_table<swift::TargetMetadata<swift::InProcess> const*,std::hash<swift::TargetMetadata<swift::InProcess> const*>,std::equal_to<swift::TargetMetadata<swift::InProcess> const*>,std::allocator<swift::TargetMetadata<swift::InProcess> const*>>::__emplace_unique_key_args<swift::TargetMetadata<swift::InProcess> const*,swift::TargetMetadata<swift::InProcess> const* const&>((uint64_t)&-[__SwiftValue hash]::warned, &v25, &v25);
      if (v21)
      {
        TypeName = swift_getTypeName(v25, 1);
          "e performance problems.\n",
          v23,
          v24,
          TypeName);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&-[__SwiftValue hash]::warnedLock);
      return 1;
    }
  }
  return (unint64_t)v2;
}

- (id)description
{
  Class *isa;
  int v3;
  char *v4;
  _QWORD *BufferIn;
  id Description;
  void *v8[3];

  isa = (Class *)self[1].super.isa;
  v3 = *((_DWORD *)*(isa - 1) + 20) & 0xF8;
  v4 = (char *)self + ((unsigned __int16)(v3 + 39) & (unsigned __int16)~(_WORD)v3 & 0x1F8);
  BufferIn = swift::TargetMetadata<swift::InProcess>::allocateBufferIn((uint64_t)isa, v8);
  (*((void (**)(_QWORD *, char *, Class *))*(isa - 1) + 2))(BufferIn, v4, isa);
  Description = swift::getDescription((uint64_t)BufferIn, isa);
  swift::TargetMetadata<swift::InProcess>::deallocateBufferIn((uint64_t)isa, v8);
  return Description;
}

- (id)debugDescription
{
  Class *isa;
  int v3;
  char *v4;
  _QWORD *BufferIn;
  id Description;
  void *v8[3];

  isa = (Class *)self[1].super.isa;
  v3 = *((_DWORD *)*(isa - 1) + 20) & 0xF8;
  v4 = (char *)self + ((unsigned __int16)(v3 + 39) & (unsigned __int16)~(_WORD)v3 & 0x1F8);
  BufferIn = swift::TargetMetadata<swift::InProcess>::allocateBufferIn((uint64_t)isa, v8);
  (*((void (**)(_QWORD *, char *, Class *))*(isa - 1) + 2))(BufferIn, v4, isa);
  Description = swift::getDescription((uint64_t)BufferIn, isa);
  swift::TargetMetadata<swift::InProcess>::deallocateBufferIn((uint64_t)isa, v8);
  return Description;
}

- (const)_swiftTypeMetadata
{
  return self[1].super.isa;
}

- (id)_swiftTypeName
{
  uint8x16_t *TypeName;
  uint64_t v3;

  TypeName = (uint8x16_t *)swift_getTypeName((Class *)self[1].super.isa, 1);
  return (id)swift_stdlib_NSStringFromUTF8(TypeName, v3);
}

- (const)_swiftValue
{
  int v2;

  v2 = *(_DWORD *)(*((_QWORD *)self[1].super.isa - 1) + 80) & 0xF8;
  return (const OpaqueValue *)((char *)self + ((unsigned __int16)(v2 + 39) & (unsigned __int16)~(_WORD)v2 & 0x1F8));
}

@end
