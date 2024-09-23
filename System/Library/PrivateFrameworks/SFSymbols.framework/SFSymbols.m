unint64_t sub_21FCB8558()
{
  unint64_t result;

  result = sub_21FCB8ABC((uint64_t)&unk_24E4BD0E0);
  qword_253F3CED8 = result;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207D1920]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

SFSSymbolAssetInfo *SFSResolveNameAndStatus(void *a1, void *a2, int a3)
{
  id v5;
  SFSSymbolAssetInfo *v6;
  void *v7;
  SFSSymbolAssetInfo *v8;
  id v9;
  void *v10;
  uint64_t v11;
  SFSSymbolAssetInfo *v12;
  SFSSymbolAssetInfo *v13;

  v5 = a1;
  if (objc_msgSend(a2, "integerValue") == 1)
  {
    if (!a3)
    {
      v13 = 0;
      goto LABEL_7;
    }
    v6 = [SFSSymbolAssetInfo alloc];
    +[SFSCoreGlyphsBundle private](SFSCoreGlyphsBundle, "private");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v5;
    v10 = v7;
    v11 = 1;
  }
  else
  {
    v12 = [SFSSymbolAssetInfo alloc];
    +[SFSCoreGlyphsBundle public](SFSCoreGlyphsBundle, "public");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    v9 = v5;
    v10 = v7;
    v11 = 0;
  }
  v13 = -[SFSSymbolAssetInfo initWithName:bundle:andType:](v8, "initWithName:bundle:andType:", v9, v10, v11);

LABEL_7:
  return v13;
}

unint64_t sub_21FCB8ABC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3CF00);
  v2 = (_QWORD *)sub_21FCE5614();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_21FCB8BDC(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21FCB8BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21FCE56EC();
  sub_21FCE54D0();
  v4 = sub_21FCE5710();
  return sub_21FCB8C40(a1, a2, v4);
}

unint64_t sub_21FCB8C40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21FCE5674() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21FCE5674() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_21FCB8D38()
{
  unint64_t result;

  result = sub_21FCB8ABC((uint64_t)&unk_24E4D6EA8);
  qword_253F3CE98 = result;
  return result;
}

uint64_t private_nofill_to_fill.getter()
{
  if (qword_253F3CEA0 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

void sub_21FCB8D9C()
{
  qword_253F3CEB8 = (uint64_t)&unk_24E4D26A8;
}

uint64_t private_symbol_order.getter()
{
  if (qword_253F3CEC0 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

unint64_t sub_21FCB8DF0()
{
  unint64_t result;

  result = sub_21FCB8ABC((uint64_t)&unk_24E4D18E8);
  qword_253F3CEB0 = result;
  return result;
}

uint64_t private_name_aliases.getter()
{
  if (qword_253F3CEA8 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t nofill_to_fill.getter()
{
  if (qword_253F3CEE0 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

void sub_21FCB8E94()
{
  qword_253F3CEF8 = (uint64_t)&unk_24E4A0540;
}

uint64_t symbol_order.getter()
{
  if (qword_253F3CEF0 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

unint64_t sub_21FCB8EE8()
{
  unint64_t result;

  result = sub_21FCB8ABC((uint64_t)&unk_24E499500);
  qword_253F3CEE8 = result;
  return result;
}

uint64_t name_aliases.getter()
{
  if (qword_253F3CED0 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

BOOL filter_denylist(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v4 = a1;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", a3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 && (objc_msgSend(v4, "containsObject:", v6) & 1) != 0;

  return v7;
}

uint64_t soft_AAFileStreamOpenWithPath(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = getAAFileStreamOpenWithPathSymbolLoc_ptr;
  v12 = getAAFileStreamOpenWithPathSymbolLoc_ptr;
  if (!getAAFileStreamOpenWithPathSymbolLoc_ptr)
  {
    v5 = (void *)libAppleArchiveLibrary();
    v4 = dlsym(v5, "AAFileStreamOpenWithPath");
    v10[3] = (uint64_t)v4;
    getAAFileStreamOpenWithPathSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
    v8 = v7;
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v4)(a1, a2, 420);
}

uint64_t soft_AAByteStreamClose(uint64_t a1)
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  _Unwind_Exception *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getAAByteStreamCloseSymbolLoc_ptr;
  v10 = getAAByteStreamCloseSymbolLoc_ptr;
  if (!getAAByteStreamCloseSymbolLoc_ptr)
  {
    v3 = (void *)libAppleArchiveLibrary();
    v2 = dlsym(v3, "AAByteStreamClose");
    v8[3] = (uint64_t)v2;
    getAAByteStreamCloseSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
    v6 = v5;
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t soft_AAArchiveStreamClose(uint64_t a1)
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  _Unwind_Exception *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getAAArchiveStreamCloseSymbolLoc_ptr;
  v10 = getAAArchiveStreamCloseSymbolLoc_ptr;
  if (!getAAArchiveStreamCloseSymbolLoc_ptr)
  {
    v3 = (void *)libAppleArchiveLibrary();
    v2 = dlsym(v3, "AAArchiveStreamClose");
    v8[3] = (uint64_t)v2;
    getAAArchiveStreamCloseSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
    v6 = v5;
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t libAppleArchiveLibrary()
{
  uint64_t v0;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = libAppleArchiveLibraryCore_frameworkLibrary;
  v6 = libAppleArchiveLibraryCore_frameworkLibrary;
  if (!libAppleArchiveLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24E4DA330;
    v8 = 0;
    v0 = _sl_dlopen();
    v4[3] = v0;
    libAppleArchiveLibraryCore_frameworkLibrary = v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    __break(1u);
    free(v2);
  }
  return v0;
}

void sub_21FCB9A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id resolveNumeralForLocale(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  objc_msgSend(a2, "numberingSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id resolveLanguageForLocale(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  objc_msgSend(a2, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

const __CFString *directionLookupKey(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(a1, "languageCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "characterDirectionForLanguage:", v2);

  if (v3 == 2)
    return CFSTR("rtl");
  else
    return 0;
}

id resolveDirectionForLocale(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  directionLookupKey(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t sub_21FCB9DBC()
{
  uint64_t v0;

  v0 = sub_21FCE5320();
  __swift_allocate_value_buffer(v0, qword_255573028);
  __swift_project_value_buffer(v0, (uint64_t)qword_255573028);
  return sub_21FCE52F0();
}

uint64_t sub_21FCB9E10()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CSVDecoder()
{
  return objc_opt_self();
}

_QWORD *sub_21FCB9E40()
{
  id v0;
  void *v1;
  id v2;
  _QWORD *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v28;
  unint64_t v29;

  v0 = objc_allocWithZone(MEMORY[0x24BDD17A8]);
  swift_bridgeObjectRetain();
  v1 = (void *)sub_21FCE547C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithString_, v1);

  objc_msgSend(v2, sel_setCharactersToBeSkipped_, 0);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v4 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if ((objc_msgSend(v2, sel_isAtEnd, v28, v29) & 1) == 0)
    {
      sub_21FCE5554();
      v6 = v5;
      swift_bridgeObjectRelease();
      if (!v6)
      {
        sub_21FCE5554();
        v8 = v7;
        swift_bridgeObjectRelease();
        if (!v8)
        {
          sub_21FCE5554();
          if (!v9)
            goto LABEL_12;
          swift_bridgeObjectRelease();
        }
      }
    }
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v3 = sub_21FCDEA00(0, v3[2] + 1, 1, v3);
    v11 = v3[2];
    v10 = v3[3];
    if (v11 >= v10 >> 1)
      v3 = sub_21FCDEA00((_QWORD *)(v10 > 1), v11 + 1, 1, v3);
    v3[2] = v11 + 1;
    v3[v11 + 4] = v4;
    swift_bridgeObjectRelease();
    v4 = (char *)MEMORY[0x24BEE4AF8];
LABEL_12:
    if ((objc_msgSend(v2, sel_isAtEnd) & 1) != 0)
      break;
    while (1)
    {
      sub_21FCE5554();
      v13 = v12;
      swift_bridgeObjectRelease();
      if (v13)
      {
        v28 = 0;
        v29 = 0xE000000000000000;
        do
        {
          while (1)
          {
            sub_21FCE5560();
            sub_21FCE54DC();
            swift_bridgeObjectRelease();
            sub_21FCE5554();
            v15 = v14;
            swift_bridgeObjectRelease();
            if (!v15)
              break;
            sub_21FCE54DC();
          }
          sub_21FCE5554();
          v17 = v16;
          swift_bridgeObjectRelease();
        }
        while (!v17);
        v18 = 0;
        v19 = 0xE000000000000000;
      }
      else
      {
        if (qword_255573020 != -1)
          swift_once();
        v20 = sub_21FCE5320();
        __swift_project_value_buffer(v20, (uint64_t)qword_255573028);
        v21 = sub_21FCE556C();
        v18 = v22 ? v21 : 0;
        v19 = v22 ? v22 : 0xE000000000000000;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v4 = sub_21FCDE900(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
      v24 = *((_QWORD *)v4 + 2);
      v23 = *((_QWORD *)v4 + 3);
      if (v24 >= v23 >> 1)
        v4 = sub_21FCDE900((char *)(v23 > 1), v24 + 1, 1, v4);
      *((_QWORD *)v4 + 2) = v24 + 1;
      v25 = &v4[16 * v24];
      *((_QWORD *)v25 + 4) = v18;
      *((_QWORD *)v25 + 5) = v19;
      sub_21FCE5554();
      if (!v26)
        break;
      swift_bridgeObjectRelease();
    }
  }

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id sub_21FCBA1F0()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for BundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_255575960 = (uint64_t)result;
  return result;
}

uint64_t SymbolCategory.Key.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

SFSymbols::SymbolCategory::Key __swiftcall SymbolCategory.Key.init(rawValue:)(SFSymbols::SymbolCategory::Key rawValue)
{
  SFSymbols::SymbolCategory::Key *v1;

  *v1 = rawValue;
  return rawValue;
}

void static SymbolCategory.Key.all.getter(_QWORD *a1@<X8>)
{
  *a1 = 7105633;
  a1[1] = 0xE300000000000000;
}

_QWORD *sub_21FCBA288@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_21FCBA294@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21FCBA2A0()
{
  sub_21FCE56EC();
  swift_bridgeObjectRetain();
  sub_21FCE54D0();
  swift_bridgeObjectRelease();
  return sub_21FCE5710();
}

uint64_t sub_21FCBA2F8()
{
  swift_bridgeObjectRetain();
  sub_21FCE54D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FCBA33C()
{
  sub_21FCE56EC();
  swift_bridgeObjectRetain();
  sub_21FCE54D0();
  swift_bridgeObjectRelease();
  return sub_21FCE5710();
}

uint64_t sub_21FCBA390(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_21FCE5674();
}

uint64_t SymbolCategory.key.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t SymbolCategory.iconName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SymbolCategory.localizedTitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_21FCBA428()
{
  unint64_t result;

  result = qword_255573058;
  if (!qword_255573058)
  {
    result = MEMORY[0x2207D1938](&protocol conformance descriptor for SymbolCategory.Key, &type metadata for SymbolCategory.Key);
    atomic_store(result, (unint64_t *)&qword_255573058);
  }
  return result;
}

uint64_t type metadata accessor for BundleClass()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for SymbolCategory(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SymbolCategory()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SymbolCategory(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SymbolCategory(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for SymbolCategory(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolCategory(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SymbolCategory(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolCategory()
{
  return &type metadata for SymbolCategory;
}

_QWORD *initializeBufferWithCopyOfBuffer for SymbolCategory.Key(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SymbolCategory.Key()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for SymbolCategory.Key(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for SymbolCategory.Key(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolCategory.Key(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SymbolCategory.Key(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolCategory.Key()
{
  return &type metadata for SymbolCategory.Key;
}

BOOL sub_21FCBA820(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21FCBA834()
{
  sub_21FCE56EC();
  sub_21FCE56F8();
  return sub_21FCE5710();
}

uint64_t sub_21FCBA878()
{
  return sub_21FCE56F8();
}

uint64_t sub_21FCBA8A0()
{
  sub_21FCE56EC();
  sub_21FCE56F8();
  return sub_21FCE5710();
}

uint64_t sub_21FCBA8E0()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6572706D6F437369;
  if (*v0 != 1)
    v1 = 0x617A696C61636F6CLL;
  if (*v0)
    return v1;
  else
    return 0x656D616E656C6966;
}

uint64_t sub_21FCBA94C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21FCC9A88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21FCBA970()
{
  return 0;
}

void sub_21FCBA97C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_21FCBA988()
{
  sub_21FCCC4D0();
  return sub_21FCE5740();
}

uint64_t sub_21FCBA9B0()
{
  sub_21FCCC4D0();
  return sub_21FCE574C();
}

uint64_t sub_21FCBA9D8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573260);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FCCBEF4();
  sub_21FCE5728();
  if (!v2)
  {
    v19 = 0;
    sub_21FCCBF38();
    sub_21FCE5650();
    v9 = v16;
    v14 = v18;
    v15 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573278);
    v19 = 1;
    sub_21FCCAF94(&qword_255573280, &qword_255573278, (uint64_t (*)(void))sub_21FCCBF7C);
    sub_21FCE5650();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v11 = v15;
    v10 = v16;
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v14;
    a2[3] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

double sub_21FCBAB88@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  sub_21FCC9C0C(a1, (uint64_t)v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

BOOL sub_21FCBABCC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21FCBABEC()
{
  _BYTE *v0;

  if (*v0)
    return 0x7365726F7473;
  else
    return 0x6E6F6973726576;
}

uint64_t sub_21FCBAC24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21FCC9DE4(a1, a2);
  *a3 = result;
  return result;
}

void sub_21FCBAC48(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_21FCBAC54()
{
  sub_21FCCBEF4();
  return sub_21FCE5740();
}

uint64_t sub_21FCBAC7C()
{
  sub_21FCCBEF4();
  return sub_21FCE574C();
}

uint64_t sub_21FCBACA4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_21FCBA9D8(a1, a2);
}

uint64_t SymbolMetadataStore.load(from:)(uint64_t a1)
{
  uint64_t inited;

  type metadata accessor for DirectoryDecompressor();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = sub_21FCD3028;
  *(_QWORD *)(inited + 24) = 0;
  sub_21FCBAD40(a1, inited);
  swift_setDeallocating();
  return swift_release();
}

unint64_t sub_21FCBAD40(uint64_t a1, uint64_t a2)
{
  id *v2;
  void *v3;
  void *v4;
  id *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  id v18;
  void *v19;
  id v20;
  void (*v21)(char *, uint64_t);
  unint64_t result;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  unint64_t v29;
  unint64_t v30;
  int64_t v31;
  char v32;
  unint64_t v33;
  int64_t v34;
  uint64_t *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  Swift::String v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  id *v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t);
  void *v74;
  id *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(uint64_t, uint64_t);
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;

  v4 = v3;
  v5 = v2;
  v82 = a2;
  v7 = sub_21FCE53E0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v74 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v74 - v15;
  sub_21FCE53BC();
  v84 = sub_21FCE53EC();
  v85 = v17;
  if (v3)
  {

    sub_21FCBB690(a1);
    sub_21FCE53BC();
    v18 = objc_allocWithZone(MEMORY[0x24BDD1488]);
    v19 = (void *)sub_21FCE53A4();
    v20 = objc_msgSend(v18, sel_initWithURL_, v19);

    v5[19] = v20;
    v21 = *(void (**)(char *, uint64_t))(v8 + 8);
    v21(v14, v7);
    return ((uint64_t (*)(char *, uint64_t))v21)(v16, v7);
  }
  v78 = v11;
  v101 = a1;
  v80 = v16;
  v79 = v14;
  sub_21FCE5380();
  swift_allocObject();
  sub_21FCE5374();
  sub_21FCCB358();
  sub_21FCE5368();
  result = swift_release();
  v76 = v8;
  v75 = v2;
  v74 = 0;
  v77 = v7;
  v88 = 0;
  v89 = 0;
  v23 = 0;
  v81 = 0;
  v83 = 0;
  v87 = 0;
  v24 = 0;
  v96 = (void (*)(uint64_t, uint64_t))v100;
  v25 = 1 << *(_BYTE *)(v100 + 32);
  v26 = -1;
  if (v25 < 64)
    v26 = ~(-1 << v25);
  v27 = v26 & *(_QWORD *)(v100 + 64);
  v91 = v100 + 64;
  v92 = (unint64_t)(v25 + 63) >> 6;
  v28 = v80;
LABEL_6:
  v86 = v4;
  v90 = v23;
  while (v27)
  {
    v29 = __clz(__rbit64(v27));
    v27 &= v27 - 1;
    v30 = v29 | (v24 << 6);
LABEL_24:
    v35 = (uint64_t *)(*((_QWORD *)v96 + 6) + 16 * v30);
    v37 = *v35;
    v36 = (void *)v35[1];
    v38 = *((_QWORD *)v96 + 7) + 40 * v30;
    v39 = *(_QWORD *)v38;
    v40 = *(_QWORD *)(v38 + 8);
    v94 = *(unsigned __int8 *)(v38 + 16);
    v95 = v39;
    v41 = *(void **)(v38 + 32);
    v93 = *(_QWORD *)(v38 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v42._countAndFlagsBits = v37;
    v42._object = v36;
    result = (unint64_t)Version.init(string:)(v42);
    if ((v100 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v43 = v97;
      if (v97 <= 1)
      {
        v44 = v28;
        v46 = v98;
        v45 = v99;
        if (!v88)
          goto LABEL_38;
        if (v87 == v97)
        {
          if (v83 == v98)
          {
            if (v81 < v99)
            {
              v43 = v87;
              v46 = v83;
LABEL_37:
              result = sub_21FCCB424(v87, v83, v81, v90, v88);
LABEL_38:
              v88 = v40;
              v89 = v94;
              v81 = v45;
              v83 = v46;
              v87 = v43;
              v23 = v95;
              v28 = v44;
              v4 = v41;
              goto LABEL_6;
            }
          }
          else if (v83 < v98)
          {
            v43 = v87;
            goto LABEL_37;
          }
        }
        else if (v87 < v97)
        {
          goto LABEL_37;
        }
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        v28 = v44;
        v23 = v90;
      }
      else
      {
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        v23 = v90;
      }
    }
  }
  v31 = v24 + 1;
  if (__OFADD__(v24, 1))
  {
    __break(1u);
LABEL_47:
    __break(1u);
    return result;
  }
  v32 = v89;
  if (v31 >= v92)
    goto LABEL_39;
  v33 = *(_QWORD *)(v91 + 8 * v31);
  ++v24;
  if (v33)
    goto LABEL_23;
  v24 = v31 + 1;
  if (v31 + 1 >= v92)
    goto LABEL_39;
  v33 = *(_QWORD *)(v91 + 8 * v24);
  if (v33)
    goto LABEL_23;
  v24 = v31 + 2;
  if (v31 + 2 >= v92)
    goto LABEL_39;
  v33 = *(_QWORD *)(v91 + 8 * v24);
  if (v33)
  {
LABEL_23:
    v27 = (v33 - 1) & v33;
    v30 = __clz(__rbit64(v33)) + (v24 << 6);
    goto LABEL_24;
  }
  v34 = v31 + 3;
  if (v34 < v92)
  {
    v33 = *(_QWORD *)(v91 + 8 * v34);
    if (!v33)
    {
      while (1)
      {
        v24 = v34 + 1;
        if (__OFADD__(v34, 1))
          goto LABEL_47;
        if (v24 >= v92)
          goto LABEL_39;
        v33 = *(_QWORD *)(v91 + 8 * v24);
        ++v34;
        if (v33)
          goto LABEL_23;
      }
    }
    v24 = v34;
    goto LABEL_23;
  }
LABEL_39:
  swift_release();
  v47 = v88;
  if (v88)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v48 = (uint64_t)v79;
    sub_21FCE53BC();
    swift_bridgeObjectRelease();
    v49 = objc_allocWithZone(MEMORY[0x24BDD1488]);
    v50 = (void *)sub_21FCE53A4();
    v51 = objc_msgSend(v49, sel_initWithURL_, v50);

    v52 = v48;
    v53 = v75;

    v53[19] = v51;
    v54 = v47;
    v55 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
    v56 = v77;
    v55(v52, v77);
    if ((v32 & 1) != 0)
    {
      v96 = v55;
      v58 = v78;
      v59 = v90;
      v60 = v54;
      sub_21FCE53BC();
      v61 = v74;
      v62 = sub_21FCE53EC();
      if (v61)
      {

        sub_21FCCB39C();
        swift_allocError();
        *(_QWORD *)v64 = v59;
        *(_QWORD *)(v64 + 8) = v54;
        *(_BYTE *)(v64 + 16) = 1;
        swift_willThrow();
        sub_21FCCB3E0(v84, v85);
        v65 = v58;
        v66 = v77;
        v67 = (void (*)(char *, uint64_t))v96;
        v96((uint64_t)v65, v77);
        v67(v28, v66);
        return sub_21FCCB424(v87, v83, v81, v59, v54);
      }
      else
      {
        v68 = v62;
        v69 = v63;
        v88 = v60;
        v70 = swift_bridgeObjectRelease();
        MEMORY[0x24BDAC7A8](v70);
        *(&v74 - 2) = v75;
        v71 = v82;
        swift_retain();
        sub_21FCCB47C(v68, v69);
        sub_21FCD29F0(v71, v68, v69, (void (*)(char *))sub_21FCCB454, (uint64_t)(&v74 - 4));
        sub_21FCCB3E0(v84, v85);
        sub_21FCCB3E0(v68, v69);
        v72 = v77;
        v73 = (void (*)(char *, uint64_t))v96;
        v96((uint64_t)v78, v77);
        v73(v28, v72);
        return sub_21FCCB424(v87, v83, v81, v90, v88);
      }
    }
    else
    {
      sub_21FCE53B0();
      swift_bridgeObjectRelease();
      sub_21FCBB690(v52);
      sub_21FCCB3E0(v84, v85);
      v55(v52, v56);
      v55((uint64_t)v80, v56);
      return sub_21FCCB424(v87, v83, v81, v90, v54);
    }
  }
  else
  {
    sub_21FCCB39C();
    swift_allocError();
    *(_QWORD *)v57 = 0;
    *(_QWORD *)(v57 + 8) = 0;
    *(_BYTE *)(v57 + 16) = 2;
    swift_willThrow();
    sub_21FCCB3E0(v84, v85);
    (*(void (**)(char *, uint64_t))(v76 + 8))(v28, v77);
    return sub_21FCCB424(v87, v83, v81, v23, 0);
  }
}

uint64_t SymbolMetadataStore.load(from:decryptor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t inited;

  type metadata accessor for DirectoryDecompressor();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = a2;
  *(_QWORD *)(inited + 24) = a3;
  swift_retain();
  sub_21FCBAD40(a1, inited);
  swift_setDeallocating();
  return swift_release();
}

uint64_t sub_21FCBB690(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  char *v101;
  char *v102;
  char *v103;
  char *v104;
  char *v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;

  v2 = v1;
  v109 = sub_21FCE53E0();
  v4 = *(_QWORD *)(v109 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v104 = (char *)&v101 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v102 = (char *)&v101 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v107 = (char *)&v101 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v106 = (char *)&v101 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v105 = (char *)&v101 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v101 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v101 = (char *)&v101 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v101 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v101 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v101 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v101 - v29;
  v110 = a1;
  sub_21FCE53B0();
  v103 = v30;
  v31 = sub_21FCE53EC();
  v33 = v32;
  SymbolMetadataStore.ingestCSVData(_:)(v31, v32);
  sub_21FCCB3E0(v31, v33);
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34 = *(void (**)(char *, uint64_t))(v4 + 8);
  v34(v25, v109);
  v35 = sub_21FCE53EC();
  v108 = v2;
  v36 = v35;
  v38 = v37;
  SymbolMetadataStore.ingestSymbolCategoriesPlistData(_:)();
  sub_21FCCB3E0(v36, v38);
  v39 = v109;
  v34(v28, v109);
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v39);
  v40 = sub_21FCE53EC();
  v42 = v41;
  SymbolMetadataStore.ingestSymbolCategoriesPlistData(_:)();
  sub_21FCCB3E0(v40, v42);
  v43 = v109;
  v34(v28, v109);
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v43);
  v44 = sub_21FCE53EC();
  v46 = v45;
  SymbolMetadataStore.ingestSymbolCategoriesPlistData(_:)();
  sub_21FCCB3E0(v44, v46);
  v47 = v109;
  v34(v28, v109);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v48 = sub_21FCE53EC();
  v50 = v49;
  SymbolMetadataStore.ingestNameAvailabilityPlistData(_:)();
  sub_21FCCB3E0(v48, v50);
  v34(v22, v47);
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v51 = sub_21FCE53EC();
  v53 = v52;
  SymbolMetadataStore.ingestNameAvailabilityPlistData(_:)();
  sub_21FCCB3E0(v51, v53);
  v34(v22, v47);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  v54 = v101;
  sub_21FCE53C8();
  v34(v25, v47);
  v55 = sub_21FCE53EC();
  v57 = v56;
  SymbolMetadataStore.ingestAliasStringsData(_:)();
  sub_21FCCB3E0(v55, v57);
  v34(v54, v47);
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v58 = sub_21FCE53EC();
  v60 = v59;
  SymbolMetadataStore.ingestAliasStringsData(_:)();
  sub_21FCCB3E0(v58, v60);
  v34(v54, v47);
  swift_arrayDestroy();
  v61 = 0;
  do
  {
    v62 = v61;
    swift_bridgeObjectRetain();
    sub_21FCE53B0();
    swift_bridgeObjectRelease();
    sub_21FCE53C8();
    v34(v25, v47);
    v63 = sub_21FCE53EC();
    v65 = v64;
    sub_21FCE5380();
    swift_allocObject();
    sub_21FCE5374();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573098);
    sub_21FCCA0BC();
    sub_21FCE5368();
    swift_release();
    v66 = v111;
    v67 = v108;
    swift_bridgeObjectRelease();
    sub_21FCCB3E0(v63, v65);
    *(_QWORD *)(v67 + 64) = v66;
    v47 = v109;
    v34(v17, v109);
    v61 = 1;
  }
  while ((v62 & 1) == 0);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v68 = sub_21FCE53EC();
  v70 = v69;
  SymbolMetadataStore.ingestLayerSetAvailabilityPlistData(_:)();
  sub_21FCCB3E0(v68, v70);
  v71 = v104;
  v72 = v102;
  v34(v105, v47);
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v73 = sub_21FCE53EC();
  v75 = v74;
  SymbolMetadataStore.ingestLayerSetAvailabilityPlistData(_:)();
  sub_21FCCB3E0(v73, v75);
  v34(v105, v47);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v76 = sub_21FCE53EC();
  v78 = v77;
  SymbolMetadataStore.ingestFeatureAvailabilityPlistData(_:)();
  sub_21FCCB3E0(v76, v78);
  v34(v106, v47);
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v79 = sub_21FCE53EC();
  v81 = v80;
  SymbolMetadataStore.ingestFeatureAvailabilityPlistData(_:)();
  sub_21FCCB3E0(v79, v81);
  v34(v106, v47);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v82 = sub_21FCE53EC();
  v84 = v83;
  SymbolMetadataStore.ingestSymbolPropertiesPlistData(_:)();
  sub_21FCCB3E0(v82, v84);
  v34(v107, v47);
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v85 = sub_21FCE53EC();
  v87 = v86;
  SymbolMetadataStore.ingestSymbolPropertiesPlistData(_:)();
  sub_21FCCB3E0(v85, v87);
  v34(v107, v47);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v88 = sub_21FCE53EC();
  v90 = v89;
  SymbolMetadataStore.ingestSymbolSearchPlistData(_:)();
  sub_21FCCB3E0(v88, v90);
  v34(v72, v47);
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v91 = sub_21FCE53EC();
  v93 = v92;
  SymbolMetadataStore.ingestSymbolSearchPlistData(_:)();
  sub_21FCCB3E0(v91, v93);
  v34(v72, v47);
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v94 = sub_21FCE53EC();
  v96 = v95;
  SymbolMetadataStore.ingestSymbolOrderPlistData(_:)();
  sub_21FCCB3E0(v94, v96);
  v34(v71, v47);
  swift_bridgeObjectRetain();
  sub_21FCE53B0();
  swift_bridgeObjectRelease();
  sub_21FCE53C8();
  v34(v25, v47);
  v97 = sub_21FCE53EC();
  v99 = v98;
  SymbolMetadataStore.ingestSymbolOrderPlistData(_:)();
  sub_21FCCB3E0(v97, v99);
  v34(v71, v47);
  swift_arrayDestroy();
  return ((uint64_t (*)(char *, uint64_t))v34)(v103, v47);
}

uint64_t SymbolMetadataStore.ingestCSVData(_:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  char v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t result;
  char **v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  __int128 v58;
  char *v59;

  v2 = (char *)MEMORY[0x24BEE4AF8];
  v3 = _s9SFSymbols18SystemSymbolCSVRowV6decode_22additionalColumnTitlesSayACG10Foundation4DataV_SaySSGtFZ_0(a1, a2, MEMORY[0x24BEE4AF8]);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = (_QWORD *)(v3 + 128);
    v6 = (char *)MEMORY[0x24BEE4B00];
    v7 = (char *)MEMORY[0x24BEE4B00];
    while (1)
    {
      v57 = *((_DWORD *)v5 - 24);
      v9 = *(v5 - 10);
      v48 = *(v5 - 11);
      v49 = *((_BYTE *)v5 - 72);
      v10 = *(v5 - 7);
      v50 = *(v5 - 8);
      v58 = *((_OWORD *)v5 - 3);
      v51 = *((_BYTE *)v5 - 32);
      v11 = *(v5 - 2);
      v52 = *(v5 - 3);
      v53 = *((_BYTE *)v5 - 8);
      v12 = *v5;
      swift_bridgeObjectRetain();
      v56 = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v2 = sub_21FCDED34(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
      v14 = *((_QWORD *)v2 + 2);
      v13 = *((_QWORD *)v2 + 3);
      if (v14 >= v13 >> 1)
        v2 = sub_21FCDED34((char *)(v13 > 1), v14 + 1, 1, v2);
      *((_QWORD *)v2 + 2) = v14 + 1;
      *(_DWORD *)&v2[4 * v14 + 32] = v57;
      swift_bridgeObjectRetain();
      v55 = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v54 = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v59 = v6;
      v17 = sub_21FCC0748(v57);
      v18 = *((_QWORD *)v6 + 2);
      v19 = (v16 & 1) == 0;
      v20 = v18 + v19;
      if (__OFADD__(v18, v19))
        break;
      v21 = v16;
      if (*((_QWORD *)v6 + 3) >= v20)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_21FCC4248();
      }
      else
      {
        sub_21FCC0D10(v20, isUniquelyReferenced_nonNull_native);
        v22 = sub_21FCC0748(v57);
        if ((v21 & 1) != (v23 & 1))
          goto LABEL_35;
        v17 = v22;
      }
      v6 = v59;
      v46 = v4;
      v47 = v2;
      if ((v21 & 1) != 0)
      {
        v24 = *((_QWORD *)v59 + 7) + 104 * v17;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(_DWORD *)v24 = v57;
        v25 = v48;
        *(_QWORD *)(v24 + 8) = v48;
        *(_QWORD *)(v24 + 16) = v9;
        *(_BYTE *)(v24 + 24) = v49;
        *(_QWORD *)(v24 + 32) = v50;
        *(_QWORD *)(v24 + 40) = v55;
        *(_OWORD *)(v24 + 48) = v58;
        *(_BYTE *)(v24 + 64) = v51;
        *(_QWORD *)(v24 + 72) = v52;
        *(_QWORD *)(v24 + 80) = v54;
        *(_BYTE *)(v24 + 88) = v53;
        *(_QWORD *)(v24 + 96) = v56;
      }
      else
      {
        *(_QWORD *)&v59[8 * (v17 >> 6) + 64] |= 1 << v17;
        *(_DWORD *)(*((_QWORD *)v6 + 6) + 4 * v17) = v57;
        v26 = *((_QWORD *)v6 + 7) + 104 * v17;
        *(_DWORD *)v26 = v57;
        *(_QWORD *)(v26 + 8) = v48;
        *(_QWORD *)(v26 + 16) = v9;
        *(_BYTE *)(v26 + 24) = v49;
        *(_QWORD *)(v26 + 32) = v50;
        *(_QWORD *)(v26 + 40) = v55;
        *(_OWORD *)(v26 + 48) = v58;
        *(_BYTE *)(v26 + 64) = v51;
        *(_QWORD *)(v26 + 72) = v52;
        *(_QWORD *)(v26 + 80) = v54;
        *(_BYTE *)(v26 + 88) = v53;
        *(_QWORD *)(v26 + 96) = v56;
        v27 = *((_QWORD *)v6 + 2);
        v28 = __OFADD__(v27, 1);
        v29 = v27 + 1;
        if (v28)
          goto LABEL_32;
        *((_QWORD *)v6 + 2) = v29;
        v25 = v48;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v30 = swift_isUniquelyReferenced_nonNull_native();
      v59 = v7;
      v32 = sub_21FCB8BDC(v25, v9);
      v33 = *((_QWORD *)v7 + 2);
      v34 = (v31 & 1) == 0;
      v35 = v33 + v34;
      if (__OFADD__(v33, v34))
        goto LABEL_31;
      v36 = v31;
      if (*((_QWORD *)v7 + 3) >= v35)
      {
        if ((v30 & 1) == 0)
          sub_21FCC3FFC();
      }
      else
      {
        sub_21FCC0940(v35, v30);
        v37 = sub_21FCB8BDC(v25, v9);
        if ((v36 & 1) != (v38 & 1))
          goto LABEL_34;
        v32 = v37;
      }
      v7 = v59;
      if ((v36 & 1) != 0)
      {
        v8 = *((_QWORD *)v59 + 7) + 104 * v32;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(_DWORD *)v8 = v57;
        *(_QWORD *)(v8 + 8) = v25;
        *(_QWORD *)(v8 + 16) = v9;
        *(_BYTE *)(v8 + 24) = v49;
        *(_QWORD *)(v8 + 32) = v50;
        *(_QWORD *)(v8 + 40) = v55;
        *(_OWORD *)(v8 + 48) = v58;
        *(_BYTE *)(v8 + 64) = v51;
        *(_QWORD *)(v8 + 72) = v52;
        *(_QWORD *)(v8 + 80) = v54;
        *(_BYTE *)(v8 + 88) = v53;
        *(_QWORD *)(v8 + 96) = v56;
      }
      else
      {
        *(_QWORD *)&v59[8 * (v32 >> 6) + 64] |= 1 << v32;
        v39 = (uint64_t *)(*((_QWORD *)v7 + 6) + 16 * v32);
        *v39 = v25;
        v39[1] = v9;
        v40 = *((_QWORD *)v7 + 7) + 104 * v32;
        *(_DWORD *)v40 = v57;
        *(_QWORD *)(v40 + 8) = v25;
        *(_QWORD *)(v40 + 16) = v9;
        *(_BYTE *)(v40 + 24) = v49;
        *(_QWORD *)(v40 + 32) = v50;
        *(_QWORD *)(v40 + 40) = v55;
        *(_OWORD *)(v40 + 48) = v58;
        *(_BYTE *)(v40 + 64) = v51;
        *(_QWORD *)(v40 + 72) = v52;
        *(_QWORD *)(v40 + 80) = v54;
        *(_BYTE *)(v40 + 88) = v53;
        *(_QWORD *)(v40 + 96) = v56;
        v41 = *((_QWORD *)v7 + 2);
        v28 = __OFADD__(v41, 1);
        v42 = v41 + 1;
        if (v28)
          goto LABEL_33;
        *((_QWORD *)v7 + 2) = v42;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v5 += 13;
      v2 = v47;
      v4 = v46 - 1;
      if (v46 == 1)
        goto LABEL_29;
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    sub_21FCE56A4();
    __break(1u);
LABEL_35:
    sub_21FCE56A4();
    __break(1u);
    result = swift_release();
    __break(1u);
  }
  else
  {
    v6 = (char *)MEMORY[0x24BEE4B00];
    v7 = (char *)MEMORY[0x24BEE4B00];
LABEL_29:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *v45 = v2;
    swift_bridgeObjectRelease();
    v45[2] = v7;
    swift_bridgeObjectRelease();
    v45[1] = v6;
    v59 = v2;
    swift_bridgeObjectRetain_n();
    sub_21FCC7F04(&v59, v45);
    swift_bridgeObjectRelease();
    v43 = v59;
    result = swift_bridgeObjectRelease();
    *v45 = v43;
  }
  return result;
}

uint64_t SymbolMetadataStore.ingestSymbolCategoriesPlistData(_:)()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(_QWORD *@<X8>);
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t i;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  char v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t result;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;

  v1 = v0;
  sub_21FCE5380();
  swift_allocObject();
  sub_21FCE5374();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573060);
  sub_21FCCAF94(&qword_255573068, &qword_255573060, (uint64_t (*)(void))sub_21FCCA01C);
  sub_21FCE5368();
  swift_release();
  v2 = 0;
  v3 = 0;
  v4 = v46;
  v5 = v46 + 64;
  v6 = 1 << *(_BYTE *)(v46 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(v46 + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  v41 = v46 + 64;
  v42 = v46;
  v40 = v9;
  if (!v8)
    goto LABEL_7;
LABEL_4:
  v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v10 | (v3 << 6); ; i = __clz(__rbit64(v15)) + (v3 << 6))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * i);
    v13 = *(_QWORD *)(v12 + 16);
    if (v13)
    {
      v43 = v8;
      v44 = v3;
      v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * i);
      v18 = v17[1];
      v45 = *v17;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v19 = (uint64_t *)(v12 + 40);
      do
      {
        v21 = *(v19 - 1);
        v20 = *v19;
        v22 = v18;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_21FCCB348((uint64_t)v2);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v46 = *(_QWORD *)(v1 + 24);
        v24 = v46;
        v25 = v1;
        *(_QWORD *)(v1 + 24) = 0x8000000000000000;
        v27 = sub_21FCC085C(v21, v20);
        v28 = *(_QWORD *)(v24 + 16);
        v29 = (v26 & 1) == 0;
        v30 = v28 + v29;
        if (__OFADD__(v28, v29))
        {
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        v31 = v26;
        if (*(_QWORD *)(v24 + 24) >= v30)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_21FCC4484();
            v24 = v46;
          }
        }
        else
        {
          sub_21FCC10B0(v30, isUniquelyReferenced_nonNull_native);
          v24 = v46;
          v32 = sub_21FCC085C(v21, v20);
          if ((v31 & 1) != (v33 & 1))
            goto LABEL_44;
          v27 = v32;
        }
        *(_QWORD *)(v25 + 24) = v24;
        swift_bridgeObjectRelease();
        v34 = *(_QWORD **)(v25 + 24);
        if ((v31 & 1) == 0)
        {
          v34[(v27 >> 6) + 8] |= 1 << v27;
          v35 = (uint64_t *)(v34[6] + 16 * v27);
          *v35 = v21;
          v35[1] = v20;
          *(_QWORD *)(v34[7] + 8 * v27) = MEMORY[0x24BEE4B08];
          v36 = v34[2];
          v37 = v36 + 1;
          v38 = __OFADD__(v36, 1);
          swift_bridgeObjectRetain();
          if (v38)
            goto LABEL_41;
          v34[2] = v37;
        }
        v19 += 2;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v18 = v22;
        sub_21FCC568C(&v46, v45, v22);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v2 = sub_21FCC0398;
        --v13;
        v1 = v25;
      }
      while (v13);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v5 = v41;
      v4 = v42;
      v9 = v40;
      v8 = v43;
      v3 = v44;
      if (v43)
        goto LABEL_4;
    }
    else if (v8)
    {
      goto LABEL_4;
    }
LABEL_7:
    if (__OFADD__(v3++, 1))
    {
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    if (v3 >= v9)
      goto LABEL_39;
    v15 = *(_QWORD *)(v5 + 8 * v3);
    if (!v15)
      break;
LABEL_17:
    v8 = (v15 - 1) & v15;
  }
  v16 = v3 + 1;
  if (v3 + 1 >= v9)
    goto LABEL_39;
  v15 = *(_QWORD *)(v5 + 8 * v16);
  if (v15)
    goto LABEL_16;
  v16 = v3 + 2;
  if (v3 + 2 >= v9)
    goto LABEL_39;
  v15 = *(_QWORD *)(v5 + 8 * v16);
  if (v15)
    goto LABEL_16;
  v16 = v3 + 3;
  if (v3 + 3 >= v9)
  {
LABEL_39:
    swift_release();
    return sub_21FCCB348((uint64_t)v2);
  }
  v15 = *(_QWORD *)(v5 + 8 * v16);
  if (v15)
  {
LABEL_16:
    v3 = v16;
    goto LABEL_17;
  }
  while (1)
  {
    v3 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v3 >= v9)
      goto LABEL_39;
    v15 = *(_QWORD *)(v5 + 8 * v3);
    ++v16;
    if (v15)
      goto LABEL_17;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  result = sub_21FCE56A4();
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.ingestNameAvailabilityPlistData(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  char v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  Swift::String v40;
  BOOL v41;
  unint64_t v42;
  int64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  int64_t v52;
  uint64_t *v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  Swift::String v57;
  char v58;
  char v59;
  unint64_t v60;
  uint64_t v61;
  _BOOL8 v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  int v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  char v72;
  uint64_t result;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  int64_t v82;
  int64_t v83;
  uint64_t v84;
  int64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  char v89;

  v1 = v0;
  sub_21FCE5380();
  swift_allocObject();
  sub_21FCE5374();
  sub_21FCCA078();
  sub_21FCE5368();
  swift_release();
  v2 = sub_21FCBFB6C((uint64_t)v86);
  v3 = 0;
  v80 = v2 + 64;
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(v2 + 64);
  v82 = (unint64_t)(v4 + 63) >> 6;
  v84 = v2;
  while (v6)
  {
    v11 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v12 = v11 | (v3 << 6);
LABEL_22:
    v16 = (uint64_t *)(*(_QWORD *)(v84 + 48) + 16 * v12);
    v18 = *v16;
    v17 = v16[1];
    v19 = (uint64_t *)(*(_QWORD *)(v84 + 56) + 24 * v12);
    v20 = *v19;
    v21 = v19[1];
    v22 = v19[2];
    v23 = v1;
    v24 = *(_QWORD *)(v1 + 96);
    v25 = *(_QWORD *)(v24 + 16);
    swift_bridgeObjectRetain_n();
    if (v25 && (v26 = sub_21FCB8BDC(v18, v17), (v27 & 1) != 0))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(v24 + 56) + 8 * v26);
      swift_bridgeObjectRetain();
    }
    else
    {
      v7 = sub_21FCBFEA0(MEMORY[0x24BEE4AF8]);
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_21FCC36E4(v20, v21, v22, 1701667182, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    v9 = swift_isUniquelyReferenced_nonNull_native();
    sub_21FCC36E4(v20, v21, v22, 0x6F7268636F6E6F6DLL, 0xEA0000000000656DLL, v9);
    swift_bridgeObjectRelease();
    v1 = v23;
    v10 = swift_isUniquelyReferenced_nonNull_native();
    v86 = *(_QWORD **)(v23 + 96);
    *(_QWORD *)(v23 + 96) = 0x8000000000000000;
    sub_21FCC3578(v7, v18, v17, v10);
    *(_QWORD *)(v23 + 96) = v86;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  if (v13 >= v82)
    goto LABEL_25;
  v14 = *(_QWORD *)(v80 + 8 * v13);
  ++v3;
  if (v14)
    goto LABEL_21;
  v3 = v13 + 1;
  if (v13 + 1 >= v82)
    goto LABEL_25;
  v14 = *(_QWORD *)(v80 + 8 * v3);
  if (v14)
    goto LABEL_21;
  v3 = v13 + 2;
  if (v13 + 2 >= v82)
    goto LABEL_25;
  v14 = *(_QWORD *)(v80 + 8 * v3);
  if (v14)
  {
LABEL_21:
    v6 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v3 << 6);
    goto LABEL_22;
  }
  v15 = v13 + 3;
  if (v15 < v82)
  {
    v14 = *(_QWORD *)(v80 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        v3 = v15 + 1;
        if (__OFADD__(v15, 1))
          break;
        if (v3 >= v82)
          goto LABEL_25;
        v14 = *(_QWORD *)(v80 + 8 * v3);
        ++v15;
        if (v14)
          goto LABEL_21;
      }
LABEL_88:
      __break(1u);
      goto LABEL_89;
    }
    v3 = v15;
    goto LABEL_21;
  }
LABEL_25:
  swift_release();
  v28 = v87;
  v75 = v1;
  v29 = *(_QWORD *)(v87 + 64);
  v81 = v87 + 64;
  v30 = 1 << *(_BYTE *)(v87 + 32);
  swift_bridgeObjectRelease();
  v31 = 0;
  if (v30 < 64)
    v32 = ~(-1 << v30);
  else
    v32 = -1;
  v33 = v32 & v29;
  v83 = (unint64_t)(v30 + 63) >> 6;
  v77 = (_QWORD *)MEMORY[0x24BEE4B00];
  if ((v32 & v29) == 0)
    goto LABEL_32;
  while (2)
  {
    while (1)
    {
      v34 = __clz(__rbit64(v33));
      v33 &= v33 - 1;
      v35 = v34 | (v31 << 6);
LABEL_30:
      v36 = (uint64_t *)(*(_QWORD *)(v28 + 48) + 16 * v35);
      v37 = *v36;
      v38 = (void *)v36[1];
      v39 = *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v35);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v40._countAndFlagsBits = v37;
      v40._object = v38;
      Version.init(string:)(v40);
      if ((v89 & 1) == 0)
        break;
      swift_bridgeObjectRelease();
      if (!v33)
        goto LABEL_32;
    }
    v44 = 0;
    v76 = (uint64_t)v86;
    v45 = v39 + 64;
    v46 = 1 << *(_BYTE *)(v39 + 32);
    if (v46 < 64)
      v47 = ~(-1 << v46);
    else
      v47 = -1;
    v48 = v47 & *(_QWORD *)(v39 + 64);
    v85 = (unint64_t)(v46 + 63) >> 6;
    v78 = MEMORY[0x24BEE4B00];
    while (v48)
    {
      v49 = __clz(__rbit64(v48));
      v48 &= v48 - 1;
      v50 = v49 | (v44 << 6);
LABEL_65:
      v53 = (uint64_t *)(*(_QWORD *)(v39 + 56) + 16 * v50);
      v55 = *v53;
      v54 = (void *)v53[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v56 = sub_21FCE5620();
      swift_bridgeObjectRelease();
      if (v56 >= 7)
        goto LABEL_51;
      v57._countAndFlagsBits = v55;
      v57._object = v54;
      Version.init(string:)(v57);
      if ((v89 & 1) == 0)
      {
        v74 = v86;
        v58 = swift_isUniquelyReferenced_nonNull_native();
        v86 = (_QWORD *)v78;
        v60 = sub_21FCC082C(v56);
        v61 = *(_QWORD *)(v78 + 16);
        v62 = (v59 & 1) == 0;
        v63 = v61 + v62;
        if (__OFADD__(v61, v62))
          goto LABEL_90;
        if (*(_QWORD *)(v78 + 24) >= v63)
        {
          if ((v58 & 1) == 0)
          {
            v71 = v59;
            sub_21FCC47F0();
            v59 = v71;
          }
        }
        else
        {
          v79 = v59;
          sub_21FCC16F0(v63, v58);
          v64 = sub_21FCC082C(v56);
          v66 = v65 & 1;
          v59 = v79;
          if ((v79 & 1) != v66)
            goto LABEL_92;
          v60 = v64;
        }
        v78 = (uint64_t)v86;
        if ((v59 & 1) != 0)
        {
          v67 = (_QWORD *)(v86[7] + 24 * v60);
          *v67 = v74;
          v67[1] = v87;
          v67[2] = v88;
        }
        else
        {
          v86[(v60 >> 6) + 8] |= 1 << v60;
          *(_BYTE *)(v86[6] + v60) = v56;
          v68 = (_QWORD *)(v86[7] + 24 * v60);
          *v68 = v74;
          v68[1] = v87;
          v68[2] = v88;
          v69 = v86[2];
          v41 = __OFADD__(v69, 1);
          v70 = v69 + 1;
          if (v41)
            goto LABEL_91;
          v86[2] = v70;
        }
LABEL_51:
        swift_bridgeObjectRelease();
        continue;
      }
    }
    v41 = __OFADD__(v44++, 1);
    if (v41)
    {
      __break(1u);
      goto LABEL_85;
    }
    if (v44 < v85)
    {
      v51 = *(_QWORD *)(v45 + 8 * v44);
      if (!v51)
      {
        v52 = v44 + 1;
        if (v44 + 1 >= v85)
          goto LABEL_81;
        v51 = *(_QWORD *)(v45 + 8 * v52);
        if (!v51)
        {
          v52 = v44 + 2;
          if (v44 + 2 >= v85)
            goto LABEL_81;
          v51 = *(_QWORD *)(v45 + 8 * v52);
          if (!v51)
          {
            v52 = v44 + 3;
            if (v44 + 3 >= v85)
              goto LABEL_81;
            v51 = *(_QWORD *)(v45 + 8 * v52);
            if (!v51)
            {
              while (1)
              {
                v44 = v52 + 1;
                if (__OFADD__(v52, 1))
                  goto LABEL_87;
                if (v44 >= v85)
                  goto LABEL_81;
                v51 = *(_QWORD *)(v45 + 8 * v44);
                ++v52;
                if (v51)
                  goto LABEL_64;
              }
            }
          }
        }
        v44 = v52;
      }
LABEL_64:
      v48 = (v51 - 1) & v51;
      v50 = __clz(__rbit64(v51)) + (v44 << 6);
      goto LABEL_65;
    }
LABEL_81:
    v28 = v87;
    swift_release();
    v72 = swift_isUniquelyReferenced_nonNull_native();
    v86 = v77;
    sub_21FCC3438(v78, v76, v87, v88, v72);
    swift_bridgeObjectRelease();
    if (v33)
      continue;
    break;
  }
LABEL_32:
  v41 = __OFADD__(v31++, 1);
  if (v41)
  {
LABEL_86:
    __break(1u);
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  if (v31 >= v83)
    goto LABEL_83;
  v42 = *(_QWORD *)(v81 + 8 * v31);
  if (v42)
    goto LABEL_42;
  v43 = v31 + 1;
  if (v31 + 1 >= v83)
    goto LABEL_83;
  v42 = *(_QWORD *)(v81 + 8 * v43);
  if (v42)
  {
LABEL_41:
    v31 = v43;
LABEL_42:
    v33 = (v42 - 1) & v42;
    v35 = __clz(__rbit64(v42)) + (v31 << 6);
    goto LABEL_30;
  }
  v43 = v31 + 2;
  if (v31 + 2 >= v83)
    goto LABEL_83;
  v42 = *(_QWORD *)(v81 + 8 * v43);
  if (v42)
    goto LABEL_41;
  v43 = v31 + 3;
  if (v31 + 3 >= v83)
  {
LABEL_83:
    swift_release();
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v75 + 88) = v77;
  }
  else
  {
    v42 = *(_QWORD *)(v81 + 8 * v43);
    if (v42)
      goto LABEL_41;
    while (1)
    {
      v31 = v43 + 1;
      if (__OFADD__(v43, 1))
        break;
      if (v31 >= v83)
        goto LABEL_83;
      v42 = *(_QWORD *)(v81 + 8 * v31);
      ++v43;
      if (v42)
        goto LABEL_42;
    }
LABEL_89:
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
LABEL_92:
    result = sub_21FCE56A4();
    __break(1u);
  }
  return result;
}

uint64_t SymbolMetadataStore.ingestAliasStringsData(_:)()
{
  _QWORD *v0;
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  _BOOL8 v26;
  uint64_t v27;
  char v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t result;
  char v35;
  unint64_t v36;
  void (*v37)(_QWORD *@<X8>);
  char v38;
  BOOL v39;
  int64_t v40;
  uint64_t v41;

  v1 = v0;
  sub_21FCE5380();
  swift_allocObject();
  sub_21FCE5374();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573088);
  sub_21FCCA26C(&qword_255573090, &qword_255573088, MEMORY[0x24BEE0D38]);
  sub_21FCE5368();
  swift_release();
  v2 = 0;
  v3 = v41;
  v4 = v41 + 64;
  v5 = 1 << *(_BYTE *)(v41 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(v41 + 64);
  v37 = 0;
  v40 = (unint64_t)(v5 + 63) >> 6;
  while (v7)
  {
    v8 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v9 = v8 | (v2 << 6);
LABEL_20:
    if (*(_QWORD *)(v1[12] + 16))
    {
      v13 = 16 * v9;
      v14 = (uint64_t *)(*(_QWORD *)(v3 + 48) + v13);
      v15 = (uint64_t *)(*(_QWORD *)(v3 + 56) + v13);
      v17 = *v15;
      v16 = v15[1];
      v19 = *v14;
      v18 = v14[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_21FCB8BDC(v19, v18);
      if ((v20 & 1) != 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v41 = v1[9];
        v1[9] = 0x8000000000000000;
        sub_21FCC382C(v17, v16, v19, v18, isUniquelyReferenced_nonNull_native);
        v1[9] = v41;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_21FCCB348((uint64_t)v37);
        v35 = swift_isUniquelyReferenced_nonNull_native();
        v41 = v1[10];
        v22 = v41;
        v1[10] = 0x8000000000000000;
        v23 = sub_21FCB8BDC(v17, v16);
        v24 = *(_QWORD *)(v22 + 16);
        v38 = v25;
        v26 = (v25 & 1) == 0;
        v27 = v24 + v26;
        if (__OFADD__(v24, v26))
          goto LABEL_39;
        if (*(_QWORD *)(v22 + 24) >= v27)
        {
          v36 = v23;
          if ((v35 & 1) == 0)
          {
            sub_21FCC4EC0(&qword_255573198);
            v22 = v41;
          }
        }
        else
        {
          sub_21FCC2758(v27, v35, &qword_255573198);
          v22 = v41;
          v36 = sub_21FCB8BDC(v17, v16);
          if ((v38 & 1) != (v28 & 1))
            goto LABEL_41;
        }
        v1[10] = v22;
        swift_bridgeObjectRelease();
        v29 = (_QWORD *)v1[10];
        if ((v38 & 1) == 0)
        {
          v29[(v36 >> 6) + 8] |= 1 << v36;
          v30 = (uint64_t *)(v29[6] + 16 * v36);
          *v30 = v17;
          v30[1] = v16;
          *(_QWORD *)(v29[7] + 8 * v36) = MEMORY[0x24BEE4B08];
          v31 = v29[2];
          v32 = v31 + 1;
          v33 = __OFADD__(v31, 1);
          v39 = v33;
          swift_bridgeObjectRetain();
          if (v39)
            goto LABEL_40;
          v29[2] = v32;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_21FCC568C(&v41, v19, v18);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v37 = sub_21FCC0398;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
  }
  v10 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v10 >= v40)
    goto LABEL_36;
  v11 = *(_QWORD *)(v4 + 8 * v10);
  ++v2;
  if (v11)
    goto LABEL_19;
  v2 = v10 + 1;
  if (v10 + 1 >= v40)
    goto LABEL_36;
  v11 = *(_QWORD *)(v4 + 8 * v2);
  if (v11)
    goto LABEL_19;
  v2 = v10 + 2;
  if (v10 + 2 >= v40)
    goto LABEL_36;
  v11 = *(_QWORD *)(v4 + 8 * v2);
  if (v11)
  {
LABEL_19:
    v7 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v2 << 6);
    goto LABEL_20;
  }
  v12 = v10 + 3;
  if (v12 >= v40)
  {
LABEL_36:
    swift_release();
    return sub_21FCCB348((uint64_t)v37);
  }
  v11 = *(_QWORD *)(v4 + 8 * v12);
  if (v11)
  {
    v2 = v12;
    goto LABEL_19;
  }
  while (1)
  {
    v2 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v2 >= v40)
      goto LABEL_36;
    v11 = *(_QWORD *)(v4 + 8 * v2);
    ++v12;
    if (v11)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  result = sub_21FCE56A4();
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.ingestCategoriesPlistData(_:)()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  sub_21FCE5380();
  swift_allocObject();
  sub_21FCE5374();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573098);
  sub_21FCCA0BC();
  sub_21FCE5368();
  swift_release();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 64) = v2;
  return result;
}

uint64_t SymbolMetadataStore.ingestLayerSetAvailabilityPlistData(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  int64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  int64_t v19;
  uint64_t v20;
  Swift::String v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  char v31;
  _QWORD *v32;
  unint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  _QWORD *v41;
  char v42;
  unint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  Swift::String v55;
  char v56;
  uint64_t v57;
  char v58;
  unint64_t v59;
  uint64_t v60;
  _BOOL8 v61;
  uint64_t v62;
  char v63;
  unint64_t v64;
  char v65;
  _QWORD *v66;
  unint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  int64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  _QWORD *v75;
  char v76;
  unint64_t v77;
  uint64_t v78;
  _BOOL8 v79;
  uint64_t v80;
  char v81;
  unint64_t v82;
  char v83;
  _QWORD *v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t result;
  uint64_t (*v90)();
  int64_t v91;
  _QWORD *v92;
  _QWORD *v93;
  uint64_t v94;
  _QWORD *v95;
  int64_t v96;
  uint64_t v97;
  uint64_t string;
  _QWORD *stringa;
  uint64_t string_8;
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  char v104;

  v1 = v0;
  sub_21FCE5380();
  swift_allocObject();
  sub_21FCE5374();
  sub_21FCCA164();
  sub_21FCE5368();
  swift_release();
  v2 = 0;
  v3 = 0;
  v4 = v101;
  v5 = v101 + 8;
  v6 = 1 << *((_BYTE *)v101 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v101[8];
  v9 = (unint64_t)(v6 + 63) >> 6;
  v93 = v101;
  v94 = v1;
  v92 = v101 + 8;
  v90 = 0;
  v91 = v9;
  if (v8)
    goto LABEL_7;
LABEL_8:
  v11 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v11 < v9)
    {
      v12 = v5[v11];
      ++v3;
      if (v12)
        goto LABEL_20;
      v3 = v11 + 1;
      if (v11 + 1 >= v9)
        goto LABEL_68;
      v12 = v5[v3];
      if (v12)
        goto LABEL_20;
      v3 = v11 + 2;
      if (v11 + 2 >= v9)
        goto LABEL_68;
      v12 = v5[v3];
      if (v12)
      {
LABEL_20:
        string_8 = (v12 - 1) & v12;
        for (i = __clz(__rbit64(v12)) + (v3 << 6); ; i = __clz(__rbit64(v8)) | (v3 << 6))
        {
          v14 = (uint64_t *)(v4[6] + 16 * i);
          v15 = v14[1];
          v16 = (uint64_t *)(v4[7] + 32 * i);
          v17 = (void *)v16[1];
          v97 = *v14;
          string = v16[2];
          v18 = (void *)v16[3];
          if (!v17)
            break;
          v19 = v3;
          v20 = *v16;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          v21._countAndFlagsBits = v20;
          v3 = v19;
          v21._object = v17;
          Version.init(string:)(v21);
          if (v104 == 1)
            goto LABEL_28;
          v95 = v101;
          swift_bridgeObjectRetain();
          sub_21FCCB348((uint64_t)v2);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v23 = *(_QWORD *)(v1 + 96);
          *(_QWORD *)(v1 + 96) = 0x8000000000000000;
          v25 = sub_21FCB8BDC(v97, v15);
          v26 = *(_QWORD *)(v23 + 16);
          v27 = (v24 & 1) == 0;
          v28 = v26 + v27;
          if (__OFADD__(v26, v27))
            goto LABEL_70;
          v29 = v24;
          if (*(_QWORD *)(v23 + 24) >= v28)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              sub_21FCC4EC0(&qword_255573188);
          }
          else
          {
            sub_21FCC2758(v28, isUniquelyReferenced_nonNull_native, &qword_255573188);
            v30 = sub_21FCB8BDC(v97, v15);
            if ((v29 & 1) != (v31 & 1))
              goto LABEL_79;
            v25 = v30;
          }
          *(_QWORD *)(v1 + 96) = v23;
          swift_bridgeObjectRelease();
          v32 = *(_QWORD **)(v1 + 96);
          swift_bridgeObjectRetain();
          if ((v29 & 1) == 0)
          {
            v33 = sub_21FCBFEA0(MEMORY[0x24BEE4AF8]);
            v32[(v25 >> 6) + 8] |= 1 << v25;
            v34 = (uint64_t *)(v32[6] + 16 * v25);
            *v34 = v97;
            v34[1] = v15;
            *(_QWORD *)(v32[7] + 8 * v25) = v33;
            v35 = v32[2];
            v36 = __OFADD__(v35, 1);
            v37 = v35 + 1;
            if (v36)
              goto LABEL_72;
            v32[2] = v37;
            swift_bridgeObjectRetain();
          }
          v38 = v32[7];
          swift_bridgeObjectRelease();
          v39 = 8 * v25;
          v40 = swift_isUniquelyReferenced_nonNull_native();
          v41 = *(_QWORD **)(v38 + 8 * v25);
          v101 = v41;
          *(_QWORD *)(v38 + 8 * v25) = 0x8000000000000000;
          v43 = sub_21FCC085C(0x6C6F6369746C756DLL, 0xEA0000000000726FLL);
          v44 = v41[2];
          v45 = (v42 & 1) == 0;
          v46 = v44 + v45;
          if (__OFADD__(v44, v45))
            goto LABEL_71;
          v47 = v42;
          if (v41[3] >= v46)
          {
            if ((v40 & 1) == 0)
              sub_21FCC4990();
          }
          else
          {
            sub_21FCC1AB4(v46, v40);
            v48 = sub_21FCC085C(0x6C6F6369746C756DLL, 0xEA0000000000726FLL);
            if ((v47 & 1) != (v49 & 1))
              goto LABEL_80;
            v43 = v48;
          }
          v3 = v19;
          if ((v47 & 1) != 0)
          {
            v50 = (_QWORD *)(v41[7] + 24 * v43);
            *v50 = v95;
            v50[1] = v102;
            v50[2] = v103;
          }
          else
          {
            v41[(v43 >> 6) + 8] |= 1 << v43;
            v51 = (_QWORD *)(v41[6] + 16 * v43);
            *v51 = 0x6C6F6369746C756DLL;
            v51[1] = 0xEA0000000000726FLL;
            v52 = (_QWORD *)(v41[7] + 24 * v43);
            *v52 = v95;
            v52[1] = v102;
            v52[2] = v103;
            v53 = v41[2];
            v36 = __OFADD__(v53, 1);
            v54 = v53 + 1;
            if (v36)
              goto LABEL_73;
            v41[2] = v54;
          }
          *(_QWORD *)(v38 + v39) = v41;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v2 = sub_21FCCC750;
          v4 = v93;
          v1 = v94;
          v9 = v91;
          v5 = v92;
          if (!v18)
          {
LABEL_5:
            swift_bridgeObjectRelease();
LABEL_6:
            swift_bridgeObjectRelease();
            v8 = string_8;
            if (!string_8)
              goto LABEL_8;
            goto LABEL_7;
          }
LABEL_46:
          swift_bridgeObjectRetain_n();
          v55._countAndFlagsBits = string;
          v55._object = v18;
          Version.init(string:)(v55);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          if (v104 == 1)
            goto LABEL_6;
          v96 = v3;
          stringa = v101;
          sub_21FCCB348((uint64_t)v90);
          v56 = swift_isUniquelyReferenced_nonNull_native();
          v57 = *(_QWORD *)(v1 + 96);
          *(_QWORD *)(v1 + 96) = 0x8000000000000000;
          v59 = sub_21FCB8BDC(v97, v15);
          v60 = *(_QWORD *)(v57 + 16);
          v61 = (v58 & 1) == 0;
          v62 = v60 + v61;
          if (__OFADD__(v60, v61))
            goto LABEL_75;
          v63 = v58;
          if (*(_QWORD *)(v57 + 24) >= v62)
          {
            if ((v56 & 1) == 0)
              sub_21FCC4EC0(&qword_255573188);
          }
          else
          {
            sub_21FCC2758(v62, v56, &qword_255573188);
            v64 = sub_21FCB8BDC(v97, v15);
            if ((v63 & 1) != (v65 & 1))
              goto LABEL_79;
            v59 = v64;
          }
          *(_QWORD *)(v94 + 96) = v57;
          swift_bridgeObjectRelease();
          v66 = *(_QWORD **)(v94 + 96);
          swift_bridgeObjectRetain();
          if ((v63 & 1) == 0)
          {
            v67 = sub_21FCBFEA0(MEMORY[0x24BEE4AF8]);
            v66[(v59 >> 6) + 8] |= 1 << v59;
            v68 = (uint64_t *)(v66[6] + 16 * v59);
            *v68 = v97;
            v68[1] = v15;
            *(_QWORD *)(v66[7] + 8 * v59) = v67;
            v69 = v66[2];
            v36 = __OFADD__(v69, 1);
            v70 = v69 + 1;
            if (v36)
              goto LABEL_77;
            v66[2] = v70;
            swift_bridgeObjectRetain();
          }
          v71 = v9;
          v72 = v66[7];
          swift_bridgeObjectRelease();
          v73 = 8 * v59;
          v74 = swift_isUniquelyReferenced_nonNull_native();
          v75 = *(_QWORD **)(v72 + 8 * v59);
          v101 = v75;
          *(_QWORD *)(v72 + 8 * v59) = 0x8000000000000000;
          v77 = sub_21FCC085C(0x6863726172656968, 0xEC0000006C616369);
          v78 = v75[2];
          v79 = (v76 & 1) == 0;
          v80 = v78 + v79;
          if (__OFADD__(v78, v79))
            goto LABEL_76;
          v81 = v76;
          if (v75[3] >= v80)
          {
            if ((v74 & 1) == 0)
              sub_21FCC4990();
          }
          else
          {
            sub_21FCC1AB4(v80, v74);
            v82 = sub_21FCC085C(0x6863726172656968, 0xEC0000006C616369);
            if ((v81 & 1) != (v83 & 1))
              goto LABEL_80;
            v77 = v82;
          }
          v9 = v71;
          if ((v81 & 1) != 0)
          {
            v84 = (_QWORD *)(v75[7] + 24 * v77);
            *v84 = stringa;
            v84[1] = v102;
            v84[2] = v103;
          }
          else
          {
            v75[(v77 >> 6) + 8] |= 1 << v77;
            v85 = v75[6] + 16 * v77;
            strcpy((char *)v85, "hierarchical");
            *(_BYTE *)(v85 + 13) = 0;
            *(_WORD *)(v85 + 14) = -5120;
            v86 = (_QWORD *)(v75[7] + 24 * v77);
            *v86 = stringa;
            v86[1] = v102;
            v86[2] = v103;
            v87 = v75[2];
            v36 = __OFADD__(v87, 1);
            v88 = v87 + 1;
            if (v36)
              goto LABEL_78;
            v75[2] = v88;
          }
          v4 = v93;
          v1 = v94;
          v5 = v92;
          *(_QWORD *)(v72 + v73) = v101;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v90 = sub_21FCCC750;
          v3 = v96;
          v8 = string_8;
          if (!string_8)
            goto LABEL_8;
LABEL_7:
          string_8 = (v8 - 1) & v8;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_28:
        if (!v18)
          goto LABEL_5;
        goto LABEL_46;
      }
      v13 = v11 + 3;
      if (v13 < v9)
      {
        v12 = v5[v13];
        v3 = v13;
        if (!v12)
        {
          while (1)
          {
            v3 = v13 + 1;
            if (__OFADD__(v13, 1))
              goto LABEL_74;
            if (v3 >= v9)
              goto LABEL_68;
            v12 = v5[v3];
            ++v13;
            if (v12)
              goto LABEL_20;
          }
        }
        goto LABEL_20;
      }
    }
LABEL_68:
    swift_release();
    sub_21FCCB348((uint64_t)v2);
    return sub_21FCCB348((uint64_t)v90);
  }
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  sub_21FCE56A4();
  __break(1u);
LABEL_80:
  result = sub_21FCE56A4();
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.ingestFeatureAvailabilityPlistData(_:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t (*v2)@<X0>(unint64_t *@<X8>);
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;
  Swift::String v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v33;
  char v34;
  unint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  char v41;
  _QWORD *v42;
  unint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  _QWORD *v51;
  char v52;
  unint64_t v53;
  uint64_t v54;
  _BOOL8 v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  char v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t *v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t result;
  _QWORD *v67;
  int64_t v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  int64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  char v82;

  v1 = v0;
  sub_21FCE5380();
  swift_allocObject();
  sub_21FCE5374();
  sub_21FCCA1A8();
  sub_21FCE5368();
  swift_release();
  v2 = 0;
  v3 = 0;
  v67 = v79 + 8;
  v69 = v79;
  v70 = v1;
  v4 = 1 << *((_BYTE *)v79 + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & v79[8];
  v68 = (unint64_t)(v4 + 63) >> 6;
LABEL_6:
  if (v6)
  {
    v71 = (v6 - 1) & v6;
    v72 = v3;
    v7 = __clz(__rbit64(v6)) | (v3 << 6);
    goto LABEL_22;
  }
  v8 = v3 + 1;
  if (__OFADD__(v3, 1))
    goto LABEL_72;
  if (v8 >= v68)
    goto LABEL_65;
  v9 = v67[v8];
  v10 = v3 + 1;
  if (!v9)
  {
    v10 = v3 + 2;
    if (v3 + 2 >= v68)
      goto LABEL_65;
    v9 = v67[v10];
    if (!v9)
    {
      v10 = v3 + 3;
      if (v3 + 3 >= v68)
        goto LABEL_65;
      v9 = v67[v10];
      if (!v9)
      {
        v11 = v3 + 4;
        if (v3 + 4 < v68)
        {
          v9 = v67[v11];
          if (v9)
          {
            v10 = v3 + 4;
            goto LABEL_21;
          }
          while (1)
          {
            v10 = v11 + 1;
            if (__OFADD__(v11, 1))
              goto LABEL_73;
            if (v10 >= v68)
              break;
            v9 = v67[v10];
            ++v11;
            if (v9)
              goto LABEL_21;
          }
        }
LABEL_65:
        swift_release();
        return sub_21FCCB348((uint64_t)v2);
      }
    }
  }
LABEL_21:
  v71 = (v9 - 1) & v9;
  v72 = v10;
  v7 = __clz(__rbit64(v9)) + (v10 << 6);
LABEL_22:
  v12 = (uint64_t *)(v69[6] + 16 * v7);
  v13 = *(_QWORD *)(v69[7] + 8 * v7);
  v14 = v12[1];
  v76 = *v12;
  v77 = v13 + 64;
  v15 = 1 << *(_BYTE *)(v13 + 32);
  if (v15 < 64)
    v16 = ~(-1 << v15);
  else
    v16 = -1;
  v17 = v16 & *(_QWORD *)(v13 + 64);
  v78 = (unint64_t)(v15 + 63) >> 6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18 = 0;
  v75 = v14;
  if (v17)
  {
LABEL_26:
    v19 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    v20 = v19 | (v18 << 6);
    goto LABEL_27;
  }
  while (1)
  {
    v29 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_67;
    }
    if (v29 >= v78)
      goto LABEL_5;
    v30 = *(_QWORD *)(v77 + 8 * v29);
    ++v18;
    if (v30)
      goto LABEL_42;
    v18 = v29 + 1;
    if (v29 + 1 >= v78)
      goto LABEL_5;
    v30 = *(_QWORD *)(v77 + 8 * v18);
    if (v30)
      goto LABEL_42;
    v18 = v29 + 2;
    if (v29 + 2 >= v78)
      goto LABEL_5;
    v30 = *(_QWORD *)(v77 + 8 * v18);
    if (v30)
      goto LABEL_42;
    v31 = v29 + 3;
    if (v31 >= v78)
    {
LABEL_5:
      swift_bridgeObjectRelease();
      swift_release();
      v6 = v71;
      v3 = v72;
      goto LABEL_6;
    }
    v30 = *(_QWORD *)(v77 + 8 * v31);
    if (!v30)
      break;
    v18 = v31;
LABEL_42:
    v17 = (v30 - 1) & v30;
    v20 = __clz(__rbit64(v30)) + (v18 << 6);
LABEL_27:
    v21 = 16 * v20;
    v22 = (uint64_t *)(*(_QWORD *)(v13 + 48) + v21);
    v24 = *v22;
    v23 = v22[1];
    v25 = (uint64_t *)(*(_QWORD *)(v13 + 56) + v21);
    v26 = *v25;
    v27 = (void *)v25[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28._countAndFlagsBits = v26;
    v28._object = v27;
    Version.init(string:)(v28);
    if (v82 == 1)
    {
      swift_bridgeObjectRelease();
      if (v17)
        goto LABEL_26;
    }
    else
    {
      v74 = v79;
      swift_bridgeObjectRetain();
      sub_21FCCB348((uint64_t)v2);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v33 = *(_QWORD *)(v1 + 96);
      *(_QWORD *)(v1 + 96) = 0x8000000000000000;
      v35 = sub_21FCB8BDC(v76, v14);
      v36 = *(_QWORD *)(v33 + 16);
      v37 = (v34 & 1) == 0;
      v38 = v36 + v37;
      if (__OFADD__(v36, v37))
        goto LABEL_68;
      v39 = v34;
      if (*(_QWORD *)(v33 + 24) >= v38)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_21FCC4EC0(&qword_255573188);
      }
      else
      {
        sub_21FCC2758(v38, isUniquelyReferenced_nonNull_native, &qword_255573188);
        v40 = sub_21FCB8BDC(v76, v75);
        if ((v39 & 1) != (v41 & 1))
          goto LABEL_74;
        v35 = v40;
      }
      *(_QWORD *)(v1 + 96) = v33;
      swift_bridgeObjectRelease();
      v42 = *(_QWORD **)(v1 + 96);
      swift_bridgeObjectRetain();
      if ((v39 & 1) == 0)
      {
        v43 = sub_21FCBFEA0(MEMORY[0x24BEE4AF8]);
        v42[(v35 >> 6) + 8] |= 1 << v35;
        v44 = (uint64_t *)(v42[6] + 16 * v35);
        *v44 = v76;
        v44[1] = v75;
        *(_QWORD *)(v42[7] + 8 * v35) = v43;
        v45 = v42[2];
        v46 = __OFADD__(v45, 1);
        v47 = v45 + 1;
        if (v46)
          goto LABEL_70;
        v42[2] = v47;
        swift_bridgeObjectRetain();
      }
      v48 = v42[7];
      swift_bridgeObjectRelease();
      v49 = 8 * v35;
      v50 = swift_isUniquelyReferenced_nonNull_native();
      v51 = *(_QWORD **)(v48 + 8 * v35);
      v79 = v51;
      v73 = v48;
      *(_QWORD *)(v48 + 8 * v35) = 0x8000000000000000;
      v53 = sub_21FCC085C(v24, v23);
      v54 = v51[2];
      v55 = (v52 & 1) == 0;
      v56 = v54 + v55;
      if (__OFADD__(v54, v55))
        goto LABEL_69;
      v57 = v52;
      if (v51[3] >= v56)
      {
        if ((v50 & 1) != 0)
        {
          v60 = v51;
          if ((v52 & 1) == 0)
            goto LABEL_61;
        }
        else
        {
          sub_21FCC4990();
          v60 = v51;
          if ((v57 & 1) == 0)
            goto LABEL_61;
        }
      }
      else
      {
        sub_21FCC1AB4(v56, v50);
        v58 = sub_21FCC085C(v24, v23);
        if ((v57 & 1) != (v59 & 1))
          goto LABEL_75;
        v53 = v58;
        v60 = v51;
        if ((v57 & 1) == 0)
        {
LABEL_61:
          v60[(v53 >> 6) + 8] |= 1 << v53;
          v62 = (uint64_t *)(v60[6] + 16 * v53);
          *v62 = v24;
          v62[1] = v23;
          v63 = (_QWORD *)(v60[7] + 24 * v53);
          *v63 = v74;
          v63[1] = v80;
          v63[2] = v81;
          v64 = v60[2];
          v46 = __OFADD__(v64, 1);
          v65 = v64 + 1;
          if (v46)
            goto LABEL_71;
          v60[2] = v65;
          swift_bridgeObjectRetain();
          goto LABEL_63;
        }
      }
      v61 = (_QWORD *)(v60[7] + 24 * v53);
      *v61 = v74;
      v61[1] = v80;
      v61[2] = v81;
LABEL_63:
      *(_QWORD *)(v73 + v49) = v60;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = v75;
      swift_bridgeObjectRelease();
      v2 = sub_21FCC02A0;
      v1 = v70;
      if (v17)
        goto LABEL_26;
    }
  }
  while (1)
  {
    v18 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v18 >= v78)
      goto LABEL_5;
    v30 = *(_QWORD *)(v77 + 8 * v18);
    ++v31;
    if (v30)
      goto LABEL_42;
  }
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  sub_21FCE56A4();
  __break(1u);
LABEL_75:
  result = sub_21FCE56A4();
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.ingestSymbolPropertiesPlistData(_:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t (*v2)@<X0>(unint64_t *@<X8>);
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t i;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v33;
  char v34;
  unint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  char v41;
  _QWORD *v42;
  unint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  _QWORD *v54;
  char v55;
  unint64_t v56;
  uint64_t v57;
  _BOOL8 v58;
  uint64_t v59;
  char v60;
  unint64_t v61;
  char v62;
  _QWORD *v63;
  uint64_t *v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t result;
  uint64_t v69;
  int64_t v70;
  uint64_t v71;
  int64_t v72;
  uint64_t v73;
  int64_t v74;
  uint64_t v75;
  unint64_t v76;
  int64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v1 = v0;
  sub_21FCE5380();
  swift_allocObject();
  sub_21FCE5374();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555730C0);
  sub_21FCCA1EC();
  sub_21FCE5368();
  swift_release();
  v2 = 0;
  v3 = 0;
  v69 = v81 + 64;
  v4 = 1 << *(_BYTE *)(v81 + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v81 + 64);
  v70 = (unint64_t)(v4 + 63) >> 6;
LABEL_6:
  if (!v6)
  {
    v8 = v3 + 1;
    if (__OFADD__(v3, 1))
      goto LABEL_71;
    if (v8 >= v70)
      goto LABEL_64;
    v9 = *(_QWORD *)(v69 + 8 * v8);
    v10 = v3 + 1;
    if (!v9)
    {
      v10 = v3 + 2;
      if (v3 + 2 >= v70)
        goto LABEL_64;
      v9 = *(_QWORD *)(v69 + 8 * v10);
      if (!v9)
      {
        v10 = v3 + 3;
        if (v3 + 3 >= v70)
          goto LABEL_64;
        v9 = *(_QWORD *)(v69 + 8 * v10);
        if (!v9)
        {
          v11 = v3 + 4;
          if (v3 + 4 < v70)
          {
            v9 = *(_QWORD *)(v69 + 8 * v11);
            if (v9)
            {
              v10 = v3 + 4;
              goto LABEL_21;
            }
            while (1)
            {
              v10 = v11 + 1;
              if (__OFADD__(v11, 1))
                goto LABEL_72;
              if (v10 >= v70)
                break;
              v9 = *(_QWORD *)(v69 + 8 * v10);
              ++v11;
              if (v9)
                goto LABEL_21;
            }
          }
LABEL_64:
          swift_release();
          return sub_21FCCB348((uint64_t)v2);
        }
      }
    }
LABEL_21:
    v71 = (v9 - 1) & v9;
    v72 = v10;
    v7 = __clz(__rbit64(v9)) + (v10 << 6);
    goto LABEL_22;
  }
  v71 = (v6 - 1) & v6;
  v72 = v3;
  v7 = __clz(__rbit64(v6)) | (v3 << 6);
LABEL_22:
  v12 = (uint64_t *)(*(_QWORD *)(v81 + 48) + 16 * v7);
  v13 = *(_QWORD *)(*(_QWORD *)(v81 + 56) + 8 * v7);
  v15 = *v12;
  v14 = v12[1];
  v73 = v13 + 64;
  v16 = 1 << *(_BYTE *)(v13 + 32);
  if (v16 < 64)
    v17 = ~(-1 << v16);
  else
    v17 = -1;
  v18 = v17 & *(_QWORD *)(v13 + 64);
  v74 = (unint64_t)(v16 + 63) >> 6;
  swift_bridgeObjectRetain();
  v75 = v13;
  swift_bridgeObjectRetain();
  for (i = 0; ; i = v77)
  {
    if (v18)
    {
      v21 = __clz(__rbit64(v18));
      v22 = (v18 - 1) & v18;
      v23 = v21 | (i << 6);
    }
    else
    {
      v24 = i + 1;
      if (__OFADD__(i, 1))
        goto LABEL_69;
      if (v24 >= v74)
      {
LABEL_5:
        swift_bridgeObjectRelease();
        swift_release();
        v6 = v71;
        v3 = v72;
        goto LABEL_6;
      }
      v25 = *(_QWORD *)(v73 + 8 * v24);
      ++i;
      if (!v25)
      {
        i = v24 + 1;
        if (v24 + 1 >= v74)
          goto LABEL_5;
        v25 = *(_QWORD *)(v73 + 8 * i);
        if (!v25)
        {
          i = v24 + 2;
          if (v24 + 2 >= v74)
            goto LABEL_5;
          v25 = *(_QWORD *)(v73 + 8 * i);
          if (!v25)
          {
            v26 = v24 + 3;
            if (v26 >= v74)
              goto LABEL_5;
            v25 = *(_QWORD *)(v73 + 8 * v26);
            if (!v25)
            {
              while (1)
              {
                i = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_70;
                if (i >= v74)
                  goto LABEL_5;
                v25 = *(_QWORD *)(v73 + 8 * i);
                ++v26;
                if (v25)
                  goto LABEL_43;
              }
            }
            i = v26;
          }
        }
      }
LABEL_43:
      v22 = (v25 - 1) & v25;
      v23 = __clz(__rbit64(v25)) + (i << 6);
    }
    v27 = 16 * v23;
    v28 = (uint64_t *)(*(_QWORD *)(v75 + 48) + v27);
    v29 = v28[1];
    v80 = *v28;
    v30 = (uint64_t *)(*(_QWORD *)(v75 + 56) + v27);
    v31 = v30[1];
    v78 = *v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v79 = v31;
    swift_bridgeObjectRetain();
    sub_21FCCB348((uint64_t)v2);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v33 = *(_QWORD *)(v1 + 104);
    *(_QWORD *)(v1 + 104) = 0x8000000000000000;
    v35 = sub_21FCB8BDC(v15, v14);
    v36 = *(_QWORD *)(v33 + 16);
    v37 = (v34 & 1) == 0;
    v38 = v36 + v37;
    if (__OFADD__(v36, v37))
      break;
    v39 = v34;
    if (*(_QWORD *)(v33 + 24) >= v38)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_21FCC4EC0(&qword_255573178);
    }
    else
    {
      sub_21FCC2758(v38, isUniquelyReferenced_nonNull_native, &qword_255573178);
      v40 = sub_21FCB8BDC(v15, v14);
      if ((v39 & 1) != (v41 & 1))
        goto LABEL_73;
      v35 = v40;
    }
    *(_QWORD *)(v1 + 104) = v33;
    swift_bridgeObjectRelease();
    v42 = *(_QWORD **)(v1 + 104);
    swift_bridgeObjectRetain();
    if ((v39 & 1) == 0)
    {
      v43 = sub_21FCBFFD0(MEMORY[0x24BEE4AF8]);
      v42[(v35 >> 6) + 8] |= 1 << v35;
      v44 = (uint64_t *)(v42[6] + 16 * v35);
      *v44 = v15;
      v44[1] = v14;
      *(_QWORD *)(v42[7] + 8 * v35) = v43;
      v45 = v42[2];
      v46 = __OFADD__(v45, 1);
      v47 = v45 + 1;
      if (v46)
        goto LABEL_67;
      v42[2] = v47;
      swift_bridgeObjectRetain();
    }
    v76 = v22;
    v77 = i;
    v48 = v15;
    v49 = v14;
    v50 = v1;
    v51 = v42[7];
    swift_bridgeObjectRelease();
    v52 = 8 * v35;
    v53 = swift_isUniquelyReferenced_nonNull_native();
    v54 = *(_QWORD **)(v51 + 8 * v35);
    *(_QWORD *)(v51 + 8 * v35) = 0x8000000000000000;
    v56 = sub_21FCC085C(v80, v29);
    v57 = v54[2];
    v58 = (v55 & 1) == 0;
    v59 = v57 + v58;
    if (__OFADD__(v57, v58))
      goto LABEL_66;
    v60 = v55;
    if (v54[3] >= v59)
    {
      if ((v53 & 1) != 0)
      {
        v63 = v54;
        if ((v55 & 1) != 0)
          goto LABEL_26;
      }
      else
      {
        sub_21FCC4D08();
        v63 = v54;
        if ((v60 & 1) != 0)
          goto LABEL_26;
      }
    }
    else
    {
      sub_21FCC2424(v59, v53);
      v61 = sub_21FCC085C(v80, v29);
      if ((v60 & 1) != (v62 & 1))
        goto LABEL_74;
      v56 = v61;
      v63 = v54;
      if ((v60 & 1) != 0)
      {
LABEL_26:
        v20 = (_QWORD *)(v63[7] + 16 * v56);
        swift_bridgeObjectRelease();
        *v20 = v78;
        v20[1] = v79;
        goto LABEL_27;
      }
    }
    v63[(v56 >> 6) + 8] |= 1 << v56;
    v64 = (uint64_t *)(v63[6] + 16 * v56);
    *v64 = v80;
    v64[1] = v29;
    v65 = (_QWORD *)(v63[7] + 16 * v56);
    *v65 = v78;
    v65[1] = v79;
    v66 = v63[2];
    v46 = __OFADD__(v66, 1);
    v67 = v66 + 1;
    if (v46)
      goto LABEL_68;
    v63[2] = v67;
    swift_bridgeObjectRetain();
LABEL_27:
    *(_QWORD *)(v51 + v52) = v63;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = v49;
    swift_bridgeObjectRelease();
    v2 = sub_21FCC06EC;
    v1 = v50;
    v15 = v48;
    v18 = v76;
  }
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  sub_21FCE56A4();
  __break(1u);
LABEL_74:
  result = sub_21FCE56A4();
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.ingestSymbolSearchPlistData(_:)()
{
  uint64_t v0;
  void (*v1)(_QWORD *@<X8>);
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t i;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t result;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  sub_21FCE5380();
  swift_allocObject();
  sub_21FCE5374();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573060);
  sub_21FCCAF94(&qword_255573068, &qword_255573060, (uint64_t (*)(void))sub_21FCCA01C);
  sub_21FCE5368();
  v42 = v0;
  swift_release();
  v1 = 0;
  v2 = 0;
  v3 = v44;
  v4 = v44 + 64;
  v5 = 1 << *(_BYTE *)(v44 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(v44 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  v38 = v44 + 64;
  v39 = v44;
  v37 = v8;
  if (!v7)
    goto LABEL_7;
LABEL_4:
  v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (i = v9 | (v2 << 6); ; i = __clz(__rbit64(v14)) + (v2 << 6))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * i);
    v12 = *(_QWORD *)(v11 + 16);
    if (v12)
    {
      v40 = v7;
      v41 = v2;
      v16 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * i);
      v17 = v16[1];
      v43 = *v16;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v18 = (uint64_t *)(v11 + 40);
      do
      {
        v19 = *(v18 - 1);
        v20 = *v18;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_21FCCB348((uint64_t)v1);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v44 = *(_QWORD *)(v42 + 32);
        v22 = v44;
        *(_QWORD *)(v42 + 32) = 0x8000000000000000;
        v24 = sub_21FCB8BDC(v43, v17);
        v25 = *(_QWORD *)(v22 + 16);
        v26 = (v23 & 1) == 0;
        v27 = v25 + v26;
        if (__OFADD__(v25, v26))
        {
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        v28 = v23;
        if (*(_QWORD *)(v22 + 24) >= v27)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_21FCC4EC0(&qword_255573198);
            v22 = v44;
          }
        }
        else
        {
          sub_21FCC2758(v27, isUniquelyReferenced_nonNull_native, &qword_255573198);
          v22 = v44;
          v29 = sub_21FCB8BDC(v43, v17);
          if ((v28 & 1) != (v30 & 1))
            goto LABEL_44;
          v24 = v29;
        }
        *(_QWORD *)(v42 + 32) = v22;
        swift_bridgeObjectRelease();
        v31 = *(_QWORD **)(v42 + 32);
        if ((v28 & 1) == 0)
        {
          v31[(v24 >> 6) + 8] |= 1 << v24;
          v32 = (uint64_t *)(v31[6] + 16 * v24);
          *v32 = v43;
          v32[1] = v17;
          *(_QWORD *)(v31[7] + 8 * v24) = MEMORY[0x24BEE4B08];
          v33 = v31[2];
          v34 = v33 + 1;
          v35 = __OFADD__(v33, 1);
          swift_bridgeObjectRetain();
          if (v35)
            goto LABEL_41;
          v31[2] = v34;
        }
        v18 += 2;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_21FCC568C(&v44, v19, v20);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v1 = sub_21FCC0398;
        --v12;
      }
      while (v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v4 = v38;
      v3 = v39;
      v8 = v37;
      v7 = v40;
      v2 = v41;
      if (v40)
        goto LABEL_4;
    }
    else if (v7)
    {
      goto LABEL_4;
    }
LABEL_7:
    if (__OFADD__(v2++, 1))
    {
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    if (v2 >= v8)
      goto LABEL_39;
    v14 = *(_QWORD *)(v4 + 8 * v2);
    if (!v14)
      break;
LABEL_17:
    v7 = (v14 - 1) & v14;
  }
  v15 = v2 + 1;
  if (v2 + 1 >= v8)
    goto LABEL_39;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_16;
  v15 = v2 + 2;
  if (v2 + 2 >= v8)
    goto LABEL_39;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_16;
  v15 = v2 + 3;
  if (v2 + 3 >= v8)
  {
LABEL_39:
    swift_release();
    return sub_21FCCB348((uint64_t)v1);
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_16:
    v2 = v15;
    goto LABEL_17;
  }
  while (1)
  {
    v2 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v2 >= v8)
      goto LABEL_39;
    v14 = *(_QWORD *)(v4 + 8 * v2);
    ++v15;
    if (v14)
      goto LABEL_17;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  result = sub_21FCE56A4();
  __break(1u);
  return result;
}

uint64_t SymbolMetadataStore.ingestSymbolOrderPlistData(_:)()
{
  char **v0;
  char **v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  char *v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  char *v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  char *v30;
  uint64_t result;
  char *v32;
  int64_t v33;
  char *v34;
  char *v35;

  v1 = v0;
  sub_21FCE5380();
  swift_allocObject();
  sub_21FCE5374();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555730D0);
  sub_21FCCA26C(&qword_2555730D8, &qword_2555730D0, MEMORY[0x24BEE1798]);
  sub_21FCE5368();
  swift_release();
  v2 = 0;
  v34 = v35;
  v3 = 1 << v35[32];
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *((_QWORD *)v35 + 8);
  v32 = v35 + 64;
  v33 = (unint64_t)(v3 + 63) >> 6;
  while (1)
  {
    if (v5)
    {
      v6 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v7 = v6 | (v2 << 6);
      goto LABEL_22;
    }
    v8 = v2 + 1;
    if (__OFADD__(v2, 1))
      goto LABEL_37;
    if (v8 >= v33)
      break;
    v9 = *(_QWORD *)&v32[8 * v8];
    ++v2;
    if (!v9)
    {
      v2 = v8 + 1;
      if (v8 + 1 >= v33)
        break;
      v9 = *(_QWORD *)&v32[8 * v2];
      if (!v9)
      {
        v2 = v8 + 2;
        if (v8 + 2 >= v33)
          break;
        v9 = *(_QWORD *)&v32[8 * v2];
        if (!v9)
        {
          v10 = v8 + 3;
          if (v10 >= v33)
            break;
          v9 = *(_QWORD *)&v32[8 * v10];
          if (!v9)
          {
            while (1)
            {
              v2 = v10 + 1;
              if (__OFADD__(v10, 1))
                goto LABEL_38;
              if (v2 >= v33)
                goto LABEL_33;
              v9 = *(_QWORD *)&v32[8 * v2];
              ++v10;
              if (v9)
                goto LABEL_21;
            }
          }
          v2 = v10;
        }
      }
    }
LABEL_21:
    v5 = (v9 - 1) & v9;
    v7 = __clz(__rbit64(v9)) + (v2 << 6);
LABEL_22:
    v11 = (uint64_t *)(*((_QWORD *)v34 + 6) + 16 * v7);
    v13 = *v11;
    v12 = v11[1];
    v14 = *(_QWORD *)(*((_QWORD *)v34 + 7) + 8 * v7);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v35 = v1[5];
    v16 = v35;
    v1[5] = (char *)0x8000000000000000;
    v18 = sub_21FCB8BDC(v13, v12);
    v19 = *((_QWORD *)v16 + 2);
    v20 = (v17 & 1) == 0;
    v21 = v19 + v20;
    if (__OFADD__(v19, v20))
    {
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      sub_21FCE56A4();
      __break(1u);
      result = swift_release();
      __break(1u);
      return result;
    }
    v22 = v17;
    if (*((_QWORD *)v16 + 3) >= v21)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v25 = v35;
        if ((v17 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_21FCC506C();
        v25 = v35;
        if ((v22 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_21FCC2A68(v21, isUniquelyReferenced_nonNull_native);
      v23 = sub_21FCB8BDC(v13, v12);
      if ((v22 & 1) != (v24 & 1))
        goto LABEL_39;
      v18 = v23;
      v25 = v35;
      if ((v22 & 1) != 0)
      {
LABEL_4:
        *(_QWORD *)(*((_QWORD *)v25 + 7) + 8 * v18) = v14;
        goto LABEL_5;
      }
    }
    *(_QWORD *)&v25[8 * (v18 >> 6) + 64] |= 1 << v18;
    v26 = (uint64_t *)(*((_QWORD *)v25 + 6) + 16 * v18);
    *v26 = v13;
    v26[1] = v12;
    *(_QWORD *)(*((_QWORD *)v25 + 7) + 8 * v18) = v14;
    v27 = *((_QWORD *)v25 + 2);
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
      goto LABEL_36;
    *((_QWORD *)v25 + 2) = v29;
    swift_bridgeObjectRetain();
LABEL_5:
    v1[5] = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_33:
  swift_release();
  v35 = *v1;
  swift_bridgeObjectRetain_n();
  sub_21FCC7F04(&v35, v1);
  swift_bridgeObjectRelease();
  v30 = v35;
  result = swift_bridgeObjectRelease();
  *v1 = v30;
  return result;
}

uint64_t sub_21FCBFA88()
{
  _BYTE *v0;

  if (*v0)
    return 0x5F6F745F72616579;
  else
    return 0x736C6F626D7973;
}

uint64_t sub_21FCBFAD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21FCCA528(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21FCBFAF4()
{
  sub_21FCCA84C();
  return sub_21FCE5740();
}

uint64_t sub_21FCBFB1C()
{
  sub_21FCCA84C();
  return sub_21FCE574C();
}

uint64_t sub_21FCBFB44@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_21FCCA63C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_21FCBFB6C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  Swift::String v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  char v39;
  uint64_t v40;

  v2 = a1 + 64;
  v36 = MEMORY[0x24BEE4B00];
  v40 = MEMORY[0x24BEE4B00];
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v6 = (unint64_t)(63 - v3) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  if (!v5)
    goto LABEL_8;
LABEL_5:
  v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v10 = v9 | (v8 << 6);
  while (1)
  {
    v11 = 16 * v10;
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v14 = *v12;
    v13 = v12[1];
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 56) + v11);
    v16 = *v15;
    v17 = (void *)v15[1];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v18._countAndFlagsBits = v16;
    v18._object = v17;
    Version.init(string:)(v18);
    if ((v39 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if (v5)
        goto LABEL_5;
    }
    else
    {
      v23 = v36;
      v24 = *(_QWORD *)(v36 + 16);
      if (*(_QWORD *)(v36 + 24) <= v24)
      {
        sub_21FCC1DEC(v24 + 1, 1);
        v23 = v40;
      }
      v36 = v23;
      sub_21FCE56EC();
      sub_21FCE54D0();
      result = sub_21FCE5710();
      v25 = v36 + 64;
      v26 = -1 << *(_BYTE *)(v36 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v36 + 64 + 8 * (v27 >> 6))) == 0)
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v26) >> 6;
        while (++v28 != v31 || (v30 & 1) == 0)
        {
          v32 = v28 == v31;
          if (v28 == v31)
            v28 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v25 + 8 * v28);
          if (v33 != -1)
          {
            v29 = __clz(__rbit64(~v33)) + (v28 << 6);
            goto LABEL_36;
          }
        }
        goto LABEL_40;
      }
      v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v36 + 64 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_36:
      *(_QWORD *)(v25 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
      v34 = (_QWORD *)(*(_QWORD *)(v36 + 48) + 16 * v29);
      *v34 = v14;
      v34[1] = v13;
      v35 = *(_QWORD *)(v36 + 56) + 24 * v29;
      *(_OWORD *)v35 = v37;
      *(_QWORD *)(v35 + 16) = v38;
      ++*(_QWORD *)(v36 + 16);
      result = swift_bridgeObjectRelease();
      if (v5)
        goto LABEL_5;
    }
LABEL_8:
    v19 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    if (v19 >= v6)
      goto LABEL_38;
    v20 = *(_QWORD *)(v2 + 8 * v19);
    v21 = v8 + 1;
    if (!v20)
    {
      v21 = v8 + 2;
      if (v8 + 2 >= v6)
        goto LABEL_38;
      v20 = *(_QWORD *)(v2 + 8 * v21);
      if (!v20)
      {
        v21 = v8 + 3;
        if (v8 + 3 >= v6)
          goto LABEL_38;
        v20 = *(_QWORD *)(v2 + 8 * v21);
        if (!v20)
        {
          v21 = v8 + 4;
          if (v8 + 4 >= v6)
            goto LABEL_38;
          v20 = *(_QWORD *)(v2 + 8 * v21);
          if (!v20)
            break;
        }
      }
    }
LABEL_23:
    v5 = (v20 - 1) & v20;
    v10 = __clz(__rbit64(v20)) + (v21 << 6);
    v8 = v21;
  }
  v22 = v8 + 5;
  if (v8 + 5 >= v6)
  {
LABEL_38:
    sub_21FCCB340();
    return v36;
  }
  v20 = *(_QWORD *)(v2 + 8 * v22);
  if (v20)
  {
    v21 = v8 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    v21 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v21 >= v6)
      goto LABEL_38;
    v20 = *(_QWORD *)(v2 + 8 * v21);
    ++v22;
    if (v20)
      goto LABEL_23;
  }
LABEL_41:
  __break(1u);
  return result;
}

unint64_t sub_21FCBFEA0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573190);
  v2 = (_QWORD *)sub_21FCE5614();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 64);
  while (1)
  {
    v5 = *(v4 - 4);
    v6 = *(v4 - 3);
    v8 = *(v4 - 2);
    v7 = *(v4 - 1);
    v9 = *v4;
    swift_bridgeObjectRetain();
    result = sub_21FCC085C(v5, v6);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v2[6] + 16 * result);
    *v12 = v5;
    v12[1] = v6;
    v13 = (_QWORD *)(v2[7] + 24 * result);
    *v13 = v8;
    v13[1] = v7;
    v13[2] = v9;
    v14 = v2[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4 += 5;
    v2[2] = v16;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21FCBFFD0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573180);
  v2 = (_QWORD *)sub_21FCE5614();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_21FCC085C(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21FCC00F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  _QWORD v24[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573160);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573158);
  v6 = sub_21FCE5614();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (uint64_t)&v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_21FCCB2B8(v12, (uint64_t)v5);
    result = sub_21FCC08DC((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_21FCE5440();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    v19 = v7[7];
    v20 = type metadata accessor for CustomSymbol();
    result = sub_21FCCB274(v9, v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v16, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
    v21 = v7[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_11;
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21FCC02A0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  result = sub_21FCBFEA0(MEMORY[0x24BEE4AF8]);
  *a1 = result;
  return result;
}

uint64_t sub_21FCC02CC()
{
  _BYTE *v0;

  if (*v0)
    return 1852793705;
  else
    return 7955819;
}

uint64_t sub_21FCC02F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21FCCA8B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21FCC031C()
{
  sub_21FCCAB2C();
  return sub_21FCE5740();
}

uint64_t sub_21FCC0344()
{
  sub_21FCCAB2C();
  return sub_21FCE574C();
}

uint64_t sub_21FCC036C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_21FCCA980(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

void sub_21FCC0398(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4B08];
}

uint64_t sub_21FCC03A8()
{
  _BYTE *v0;

  if (*v0)
    return 0x6863726172656968;
  else
    return 0x6C6F6369746C756DLL;
}

uint64_t sub_21FCC03F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21FCCAB70(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21FCC0414()
{
  sub_21FCCBEB0();
  return sub_21FCE5740();
}

uint64_t sub_21FCC043C()
{
  sub_21FCCBEB0();
  return sub_21FCE574C();
}

uint64_t sub_21FCC0464@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_21FCCAC84(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_21FCC0490()
{
  return 1;
}

uint64_t sub_21FCC04A0()
{
  return 0x736C6F626D7973;
}

void sub_21FCC04BC(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_21FCC04C8()
{
  sub_21FCCAF50();
  return sub_21FCE5740();
}

uint64_t sub_21FCC04F0()
{
  sub_21FCCAF50();
  return sub_21FCE574C();
}

_QWORD *sub_21FCC0518@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_21FCCAE0C(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_21FCC0540()
{
  sub_21FCE56EC();
  sub_21FCE56F8();
  return sub_21FCE5710();
}

uint64_t sub_21FCC0580()
{
  return sub_21FCE56F8();
}

uint64_t sub_21FCC05A4()
{
  sub_21FCE56EC();
  sub_21FCE56F8();
  return sub_21FCE5710();
}

uint64_t sub_21FCC05E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x736C6F626D7973 && a2 == 0xE700000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_21FCE5674();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_21FCC0674()
{
  sub_21FCCB170();
  return sub_21FCE5740();
}

uint64_t sub_21FCC069C()
{
  sub_21FCCB170();
  return sub_21FCE574C();
}

_QWORD *sub_21FCC06C4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_21FCCB044(a1);
  if (!v2)
    *a2 = result;
  return result;
}

unint64_t sub_21FCC06EC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  result = sub_21FCBFFD0(MEMORY[0x24BEE4AF8]);
  *a1 = result;
  return result;
}

unint64_t sub_21FCC0718(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21FCE56E0();
  return sub_21FCC3A94(a1, v2);
}

unint64_t sub_21FCC0748(int a1)
{
  uint64_t v2;

  sub_21FCE56EC();
  sub_21FCE5704();
  v2 = sub_21FCE5710();
  return sub_21FCC3B30(a1, v2);
}

unint64_t sub_21FCC07A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_21FCE56EC();
  sub_21FCE56F8();
  sub_21FCE56F8();
  sub_21FCE56F8();
  v6 = sub_21FCE5710();
  return sub_21FCC3BCC(a1, a2, a3, v6);
}

uint64_t sub_21FCC082C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  sub_21FCCC76C(*(_QWORD *)(v1 + 40), a1);
  return sub_21FCC3C54(a1, v3);
}

unint64_t sub_21FCC085C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21FCE56EC();
  swift_bridgeObjectRetain();
  sub_21FCE54D0();
  swift_bridgeObjectRelease();
  v4 = sub_21FCE5710();
  return sub_21FCB8C40(a1, a2, v4);
}

unint64_t sub_21FCC08DC(uint64_t a1)
{
  uint64_t v2;

  sub_21FCE5440();
  sub_21FCCB300(&qword_255573140, MEMORY[0x24BDCEA88]);
  v2 = sub_21FCE544C();
  return sub_21FCC3EC4(a1, v2);
}

uint64_t sub_21FCC0940(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  char v43;
  int64_t v44;
  int v45;
  char v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  __int128 v52;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731D0);
  v43 = a2;
  v6 = sub_21FCE5608();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v41 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v40 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    v42 = v5;
    while (1)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v44 = v13;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v40)
          goto LABEL_33;
        v23 = v41[v22];
        v24 = v13 + 1;
        if (!v23)
        {
          v24 = v13 + 2;
          if (v13 + 2 >= v40)
            goto LABEL_33;
          v23 = v41[v24];
          if (!v23)
          {
            v25 = v13 + 3;
            if (v13 + 3 >= v40)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v43 & 1) != 0)
              {
                v39 = 1 << *(_BYTE *)(v5 + 32);
                if (v39 >= 64)
                  bzero(v41, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v41 = -1 << v39;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v41[v25];
            if (!v23)
            {
              while (1)
              {
                v24 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_40;
                if (v24 >= v40)
                  goto LABEL_33;
                v23 = v41[v24];
                ++v25;
                if (v23)
                  goto LABEL_30;
              }
            }
            v24 = v13 + 3;
          }
        }
LABEL_30:
        v10 = (v23 - 1) & v23;
        v44 = v24;
        v21 = __clz(__rbit64(v23)) + (v24 << 6);
      }
      v30 = *(_QWORD *)(v5 + 56);
      v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v33 = *v31;
      v32 = v31[1];
      v34 = (int *)(v30 + 104 * v21);
      v35 = *((_QWORD *)v34 + 2);
      v51 = *((_QWORD *)v34 + 1);
      v50 = *((_BYTE *)v34 + 24);
      v36 = *((_QWORD *)v34 + 5);
      v49 = *((_QWORD *)v34 + 4);
      v52 = *((_OWORD *)v34 + 3);
      v48 = *((_BYTE *)v34 + 64);
      v37 = *((_QWORD *)v34 + 10);
      v47 = *((_QWORD *)v34 + 9);
      v45 = *v34;
      v46 = *((_BYTE *)v34 + 88);
      v38 = *((_QWORD *)v34 + 12);
      if ((v43 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_21FCE56EC();
      sub_21FCE54D0();
      result = sub_21FCE5710();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v16 == v27;
          if (v16 == v27)
            v16 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v29 == -1);
        v17 = __clz(__rbit64(~v29)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
      *v18 = v33;
      v18[1] = v32;
      v19 = *(_QWORD *)(v7 + 56) + 104 * v17;
      *(_DWORD *)v19 = v45;
      *(_QWORD *)(v19 + 8) = v51;
      *(_QWORD *)(v19 + 16) = v35;
      *(_BYTE *)(v19 + 24) = v50;
      *(_QWORD *)(v19 + 32) = v49;
      *(_QWORD *)(v19 + 40) = v36;
      *(_OWORD *)(v19 + 48) = v52;
      *(_BYTE *)(v19 + 64) = v48;
      *(_QWORD *)(v19 + 72) = v47;
      *(_QWORD *)(v19 + 80) = v37;
      *(_BYTE *)(v19 + 88) = v46;
      *(_QWORD *)(v19 + 96) = v38;
      ++*(_QWORD *)(v7 + 16);
      v5 = v42;
      v13 = v44;
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21FCC0D10(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  int v44;
  __int128 v45;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731C8);
  v37 = a2;
  result = sub_21FCE5608();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v35 = (_QWORD *)(v5 + 64);
    v36 = v5;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v34 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = (uint64_t)v35;
        if (v20 >= v34)
          goto LABEL_33;
        v21 = v35[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v34)
            goto LABEL_33;
          v21 = v35[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v34)
            {
LABEL_33:
              if ((v37 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v33 = 1 << *(_BYTE *)(v5 + 32);
              if (v33 >= 64)
                bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v35 = -1 << v33;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v35[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v34)
                  goto LABEL_33;
                v21 = v35[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(_DWORD *)(*(_QWORD *)(v5 + 48) + 4 * v19);
      v28 = *(_QWORD *)(v5 + 56) + 104 * v19;
      v44 = *(_DWORD *)v28;
      v29 = *(_QWORD *)(v28 + 16);
      v43 = *(_QWORD *)(v28 + 8);
      v42 = *(_BYTE *)(v28 + 24);
      v30 = *(_QWORD *)(v28 + 40);
      v41 = *(_QWORD *)(v28 + 32);
      v45 = *(_OWORD *)(v28 + 48);
      v40 = *(_BYTE *)(v28 + 64);
      v31 = *(_QWORD *)(v28 + 80);
      v39 = *(_QWORD *)(v28 + 72);
      v38 = *(_BYTE *)(v28 + 88);
      v32 = *(_QWORD *)(v28 + 96);
      if ((v37 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_21FCE56EC();
      sub_21FCE5704();
      result = sub_21FCE5710();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_DWORD *)(*(_QWORD *)(v7 + 48) + 4 * v16) = v27;
      v17 = *(_QWORD *)(v7 + 56) + 104 * v16;
      *(_DWORD *)v17 = v44;
      *(_QWORD *)(v17 + 8) = v43;
      *(_QWORD *)(v17 + 16) = v29;
      *(_BYTE *)(v17 + 24) = v42;
      *(_QWORD *)(v17 + 32) = v41;
      *(_QWORD *)(v17 + 40) = v30;
      *(_OWORD *)(v17 + 48) = v45;
      *(_BYTE *)(v17 + 64) = v40;
      *(_QWORD *)(v17 + 72) = v39;
      *(_QWORD *)(v17 + 80) = v31;
      *(_BYTE *)(v17 + 88) = v38;
      *(_QWORD *)(v17 + 96) = v32;
      ++*(_QWORD *)(v7 + 16);
      v5 = v36;
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_21FCC10B0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731B8);
  v36 = a2;
  v6 = sub_21FCE5608();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_21FCE56EC();
    swift_bridgeObjectRetain();
    sub_21FCE54D0();
    swift_bridgeObjectRelease();
    result = sub_21FCE5710();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21FCC13D4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;
  char v34;
  __int128 v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731A0);
  v34 = a2;
  result = sub_21FCE5608();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v33 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v32 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v21 >= v32)
          goto LABEL_33;
        v22 = v33[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v32)
            goto LABEL_33;
          v22 = v33[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v32)
            {
LABEL_33:
              if ((v34 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v31 = 1 << *(_BYTE *)(v5 + 32);
              if (v31 >= 64)
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v33 = -1 << v31;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v22 = v33[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_42;
                if (v8 >= v32)
                  goto LABEL_33;
                v22 = v33[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v11 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = *(_QWORD *)(v5 + 48) + 24 * v20;
      v35 = *(_OWORD *)v28;
      v29 = *(_QWORD *)(v28 + 16);
      v30 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
      if ((v34 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_21FCE56EC();
      sub_21FCE56F8();
      sub_21FCE56F8();
      sub_21FCE56F8();
      result = sub_21FCE5710();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
        v17 = v35;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v13) >> 6;
        v17 = v35;
        do
        {
          if (++v15 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v26 = v15 == v25;
          if (v15 == v25)
            v15 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v27 == -1);
        v16 = __clz(__rbit64(~v27)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v18 = *(_QWORD *)(v7 + 48) + 24 * v16;
      *(_OWORD *)v18 = v17;
      *(_QWORD *)(v18 + 16) = v29;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v16) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_21FCC16F0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  _QWORD *v18;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731A8);
  v6 = sub_21FCE5608();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_24;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  v18 = (_QWORD *)(v5 + 64);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v17 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v10 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v17 > 1)
  {
    v11 = *(_QWORD *)(v5 + 72);
    v12 = 1;
    if (v11)
      goto LABEL_17;
    v12 = 2;
    if (v17 > 2)
    {
      v11 = *(_QWORD *)(v5 + 80);
      if (!v11)
      {
        v13 = 3;
        if (v17 > 3)
        {
          v11 = *(_QWORD *)(v5 + 88);
          if (v11)
          {
            v12 = 3;
            goto LABEL_17;
          }
          while (1)
          {
            v12 = v13 + 1;
            if (__OFADD__(v13, 1))
            {
              __break(1u);
              JUMPOUT(0x21FCC1A98);
            }
            if (v12 >= v17)
              break;
            v11 = v18[v12];
            ++v13;
            if (v11)
              goto LABEL_17;
          }
        }
        goto LABEL_19;
      }
LABEL_17:
      v10 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_18:
      v14 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v10);
      sub_21FCE56EC();
      __asm { BR              X8 }
    }
  }
LABEL_19:
  swift_release();
  v3 = v2;
  if ((a2 & 1) != 0)
  {
    v15 = 1 << *(_BYTE *)(v5 + 32);
    if (v15 >= 64)
      bzero(v18, ((unint64_t)(v15 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v18 = -1 << v15;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_24:
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_21FCC1AB4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;
  __int128 v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573190);
  v39 = a2;
  v6 = sub_21FCE5608();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v36 = v2;
  v37 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v13);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v13 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v13);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v13 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(v5 + 56) + 24 * v21;
    v40 = *(_OWORD *)v33;
    v34 = *(_QWORD *)(v33 + 16);
    if ((v39 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_21FCE56EC();
    swift_bridgeObjectRetain();
    sub_21FCE54D0();
    swift_bridgeObjectRelease();
    result = sub_21FCE5710();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v16 == v27;
        if (v16 == v27)
          v16 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v32;
    v18[1] = v31;
    v19 = *(_QWORD *)(v7 + 56) + 24 * v17;
    *(_OWORD *)v19 = v40;
    *(_QWORD *)(v19 + 16) = v34;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21FCC1DEC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  char v37;
  __int128 v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731B0);
  v37 = a2;
  v6 = sub_21FCE5608();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v35)
          goto LABEL_33;
        v23 = v36[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v35)
            goto LABEL_33;
          v23 = v36[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v37 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v5 + 32);
                if (v34 >= 64)
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v34;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v35)
                  goto LABEL_33;
                v23 = v36[v13];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v13 = v24;
          }
        }
LABEL_30:
        v10 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v31 = *v29;
      v30 = v29[1];
      v32 = *(_QWORD *)(v5 + 56) + 24 * v21;
      v38 = *(_OWORD *)v32;
      v33 = *(_QWORD *)(v32 + 16);
      if ((v37 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_21FCE56EC();
      sub_21FCE54D0();
      result = sub_21FCE5710();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v16 == v26;
          if (v16 == v26)
            v16 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v28 == -1);
        v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
      *v18 = v31;
      v18[1] = v30;
      v19 = *(_QWORD *)(v7 + 56) + 24 * v17;
      *(_OWORD *)v19 = v38;
      *(_QWORD *)(v19 + 16) = v33;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21FCC2100(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3CF00);
  v42 = a2;
  v6 = sub_21FCE5608();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_21FCE56EC();
    sub_21FCE54D0();
    result = sub_21FCE5710();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21FCC2424(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573180);
  v42 = a2;
  v6 = sub_21FCE5608();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_21FCE56EC();
    swift_bridgeObjectRetain();
    sub_21FCE54D0();
    swift_bridgeObjectRelease();
    result = sub_21FCE5710();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21FCC2758(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v37 = a2;
  v7 = sub_21FCE5608();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v36 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v35)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_21FCE56EC();
    sub_21FCE54D0();
    result = sub_21FCE5710();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v23 = (_QWORD *)(v6 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v6 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_21FCC2A68(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573170);
  v37 = a2;
  v6 = sub_21FCE5608();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_21FCE56EC();
    sub_21FCE54D0();
    result = sub_21FCE5710();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21FCC2D70(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t *v34;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731D8);
  result = sub_21FCE5608();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v34 = (uint64_t *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v31 = -1 << v9;
    v32 = v9;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v33)
          goto LABEL_33;
        v21 = v34[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v33)
            goto LABEL_33;
          v21 = v34[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v32 >= 64)
                  bzero(v34, 8 * v33);
                else
                  *v34 = v31;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v21 = v34[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v8 >= v33)
                  goto LABEL_33;
                v21 = v34[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v19);
      v28 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v19);
      v29 = *v28;
      v30 = v28[1];
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      result = sub_21FCE56E0();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v16) = v27;
      v17 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v16);
      *v17 = v29;
      v17[1] = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21FCC3024(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t i;
  int v48;
  uint64_t v49;

  v3 = v2;
  v5 = type metadata accessor for CustomSymbol();
  v46 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v49 = (uint64_t)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21FCE5440();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573158);
  v48 = a2;
  v12 = sub_21FCE5608();
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_42;
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = *(_QWORD *)(v11 + 64);
  v45 = (_QWORD *)(v11 + 64);
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v43 = v2;
  v44 = (unint64_t)(v14 + 63) >> 6;
  v18 = v12 + 64;
  result = swift_retain();
  v20 = 0;
  v21 = v11;
  for (i = v11; ; v21 = i)
  {
    if (v17)
    {
      v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v24 = v23 | (v20 << 6);
      goto LABEL_22;
    }
    v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      return result;
    }
    if (v25 >= v44)
      break;
    v26 = v45;
    v27 = v45[v25];
    ++v20;
    if (!v27)
    {
      v20 = v25 + 1;
      if (v25 + 1 >= v44)
        goto LABEL_35;
      v27 = v45[v20];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v44)
        {
LABEL_35:
          swift_release();
          v3 = v43;
          if ((v48 & 1) == 0)
            goto LABEL_42;
          goto LABEL_36;
        }
        v27 = v45[v28];
        if (!v27)
        {
          while (1)
          {
            v20 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_44;
            if (v20 >= v44)
              goto LABEL_35;
            v27 = v45[v20];
            ++v28;
            if (v27)
              goto LABEL_21;
          }
        }
        v20 = v28;
      }
    }
LABEL_21:
    v17 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v20 << 6);
LABEL_22:
    v29 = *(_QWORD *)(v8 + 72);
    v30 = *(_QWORD *)(v21 + 48) + v29 * v24;
    if ((v48 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 32))(v10, v30, v7);
      v31 = *(_QWORD *)(v21 + 56);
      v32 = *(_QWORD *)(v46 + 72);
      sub_21FCCB274(v31 + v32 * v24, v49, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, v30, v7);
      v33 = *(_QWORD *)(v21 + 56);
      v32 = *(_QWORD *)(v46 + 72);
      sub_21FCCB230(v33 + v32 * v24, v49, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
    }
    sub_21FCCB300(&qword_255573140, MEMORY[0x24BDCEA88]);
    result = sub_21FCE544C();
    v34 = -1 << *(_BYTE *)(v13 + 32);
    v35 = result & ~v34;
    v36 = v35 >> 6;
    if (((-1 << v35) & ~*(_QWORD *)(v18 + 8 * (v35 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v18 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }
        v39 = v36 == v38;
        if (v36 == v38)
          v36 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v18 + 8 * v36);
      }
      while (v40 == -1);
      v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(_QWORD *)(v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v13 + 48) + v29 * v22, v10, v7);
    result = sub_21FCCB274(v49, *(_QWORD *)(v13 + 56) + v32 * v22, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
    ++*(_QWORD *)(v13 + 16);
  }
  swift_release();
  v3 = v43;
  v26 = v45;
  if ((v48 & 1) == 0)
    goto LABEL_42;
LABEL_36:
  v41 = 1 << *(_BYTE *)(i + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(i + 16) = 0;
LABEL_42:
  result = swift_release();
  *v3 = v13;
  return result;
}

uint64_t sub_21FCC3438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_21FCC07A4(a2, a3, a4);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a5 & 1) != 0)
    {
LABEL_7:
      v20 = *v6;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        result = swift_bridgeObjectRelease();
        *(_QWORD *)(v21 + 8 * v14) = a1;
        return result;
      }
      return sub_21FCC39A0(v14, a2, a3, a4, a1, v20);
    }
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_21FCC4638();
      goto LABEL_7;
    }
    sub_21FCC13D4(v17, a5 & 1);
    v23 = sub_21FCC07A4(a2, a3, a4);
    if ((v18 & 1) == (v24 & 1))
    {
      v14 = v23;
      v20 = *v6;
      if ((v18 & 1) != 0)
        goto LABEL_8;
      return sub_21FCC39A0(v14, a2, a3, a4, a1, v20);
    }
  }
  result = sub_21FCE56A4();
  __break(1u);
  return result;
}

uint64_t sub_21FCC3578(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_21FCB8BDC(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_21FCC4EC0(&qword_255573188);
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_21FCC2758(v15, a4 & 1, &qword_255573188);
  v21 = sub_21FCB8BDC(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_21FCE56A4();
  __break(1u);
  return result;
}

uint64_t sub_21FCC36E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v6;
  _QWORD **v7;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t result;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  char v24;

  v7 = (_QWORD **)v6;
  v14 = (_QWORD *)*v6;
  v16 = sub_21FCC085C(a4, a5);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  result = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
  }
  else
  {
    v20 = v15;
    v21 = v14[3];
    if (v21 >= result && (a6 & 1) != 0)
    {
LABEL_7:
      v22 = *v7;
      if ((v20 & 1) != 0)
      {
LABEL_8:
        v23 = (uint64_t *)(v22[7] + 24 * v16);
        *v23 = a1;
        v23[1] = a2;
        v23[2] = a3;
        return result;
      }
      goto LABEL_11;
    }
    if (v21 >= result && (a6 & 1) == 0)
    {
      result = (uint64_t)sub_21FCC4990();
      goto LABEL_7;
    }
    sub_21FCC1AB4(result, a6 & 1);
    result = sub_21FCC085C(a4, a5);
    if ((v20 & 1) == (v24 & 1))
    {
      v16 = result;
      v22 = *v7;
      if ((v20 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_21FCC39F0(v16, a4, a5, a1, a2, a3, v22);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_21FCE56A4();
  __break(1u);
  return result;
}

uint64_t sub_21FCC382C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_21FCB8BDC(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_21FCC4B50();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_21FCC2100(v17, a5 & 1);
  v23 = sub_21FCB8BDC(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_21FCE56A4();
  __break(1u);
  return result;
}

unint64_t sub_21FCC39A0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 24 * result);
  *v6 = a2;
  v6[1] = a3;
  v6[2] = a4;
  *(_QWORD *)(a6[7] + 8 * result) = a5;
  v7 = a6[2];
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
    __break(1u);
  else
    a6[2] = v9;
  return result;
}

unint64_t sub_21FCC39F0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  a7[(result >> 6) + 8] |= 1 << result;
  v7 = (_QWORD *)(a7[6] + 16 * result);
  *v7 = a2;
  v7[1] = a3;
  v8 = (_QWORD *)(a7[7] + 24 * result);
  *v8 = a4;
  v8[1] = a5;
  v8[2] = a6;
  v9 = a7[2];
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    a7[2] = v11;
  return result;
}

unint64_t sub_21FCC3A44(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

unint64_t sub_21FCC3A94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_21FCC3B30(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_21FCC3BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  unint64_t result;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = -1 << *(_BYTE *)(v4 + 32);
  result = a4 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v8 = ~v6;
    do
    {
      v9 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 24 * result);
      v10 = *v9;
      v11 = v9[1];
      v12 = v9[2];
      if (v10 == a1 && v11 == a2 && v12 == a3)
        break;
      result = (result + 1) & v8;
    }
    while (((*(_QWORD *)(v4 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

uint64_t sub_21FCC3C54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t sub_21FCC3EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_21FCE5440();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_21FCCB300(&qword_255573168, MEMORY[0x24BDCEA98]);
      v14 = sub_21FCE5470();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void *sub_21FCC3FFC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  uint64_t v5;
  unint64_t v6;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  _QWORD *v32;
  __int128 v33;
  uint64_t v34;
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  uint64_t *v38;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731D0);
  v38 = v0;
  v1 = *v0;
  v2 = sub_21FCE55FC();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v38 = v3;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = v1 + 64;
  v6 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v6)
    result = memmove(result, (const void *)(v1 + 64), 8 * v6);
  v8 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v9 = 1 << *(_BYTE *)(v1 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(v1 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    v35 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v35 >= v12)
      goto LABEL_26;
    v36 = *(_QWORD *)(v5 + 8 * v35);
    ++v8;
    if (!v36)
    {
      v8 = v35 + 1;
      if (v35 + 1 >= v12)
        goto LABEL_26;
      v36 = *(_QWORD *)(v5 + 8 * v8);
      if (!v36)
        break;
    }
LABEL_25:
    v11 = (v36 - 1) & v36;
    v14 = __clz(__rbit64(v36)) + (v8 << 6);
LABEL_12:
    v15 = 16 * v14;
    v16 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v14);
    v17 = *v16;
    v18 = v16[1];
    v19 = 104 * v14;
    v20 = *(_QWORD *)(v1 + 56) + v19;
    v21 = *(_DWORD *)v20;
    v22 = *(_QWORD *)(v20 + 8);
    v23 = *(_QWORD *)(v20 + 16);
    v24 = *(_BYTE *)(v20 + 24);
    v25 = *(_QWORD *)(v20 + 32);
    v26 = *(_QWORD *)(v20 + 40);
    v27 = *(_BYTE *)(v20 + 64);
    v29 = *(_QWORD *)(v20 + 72);
    v28 = *(_QWORD *)(v20 + 80);
    v30 = *(_BYTE *)(v20 + 88);
    v31 = *(_QWORD *)(v20 + 96);
    v32 = (_QWORD *)(*(_QWORD *)(v3 + 48) + v15);
    v33 = *(_OWORD *)(v20 + 48);
    *v32 = v17;
    v32[1] = v18;
    v34 = *(_QWORD *)(v3 + 56) + v19;
    *(_DWORD *)v34 = v21;
    *(_QWORD *)(v34 + 8) = v22;
    *(_QWORD *)(v34 + 16) = v23;
    *(_BYTE *)(v34 + 24) = v24;
    *(_QWORD *)(v34 + 32) = v25;
    *(_QWORD *)(v34 + 40) = v26;
    *(_OWORD *)(v34 + 48) = v33;
    *(_BYTE *)(v34 + 64) = v27;
    *(_QWORD *)(v34 + 72) = v29;
    *(_QWORD *)(v34 + 80) = v28;
    *(_BYTE *)(v34 + 88) = v30;
    *(_QWORD *)(v34 + 96) = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v37 = v35 + 2;
  if (v37 >= v12)
    goto LABEL_26;
  v36 = *(_QWORD *)(v5 + 8 * v37);
  if (v36)
  {
    v8 = v37;
    goto LABEL_25;
  }
  while (1)
  {
    v8 = v37 + 1;
    if (__OFADD__(v37, 1))
      break;
    if (v8 >= v12)
      goto LABEL_26;
    v36 = *(_QWORD *)(v5 + 8 * v8);
    ++v37;
    if (v36)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21FCC4248()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  uint64_t v5;
  unint64_t v6;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t *v35;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731C8);
  v35 = v0;
  v1 = *v0;
  v2 = sub_21FCE55FC();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v35 = v3;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = v1 + 64;
  v6 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v6)
    result = memmove(result, (const void *)(v1 + 64), 8 * v6);
  v8 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v9 = 1 << *(_BYTE *)(v1 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(v1 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    v32 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v32 >= v12)
      goto LABEL_26;
    v33 = *(_QWORD *)(v5 + 8 * v32);
    ++v8;
    if (!v33)
    {
      v8 = v32 + 1;
      if (v32 + 1 >= v12)
        goto LABEL_26;
      v33 = *(_QWORD *)(v5 + 8 * v8);
      if (!v33)
        break;
    }
LABEL_25:
    v11 = (v33 - 1) & v33;
    v14 = __clz(__rbit64(v33)) + (v8 << 6);
LABEL_12:
    v15 = 4 * v14;
    v16 = *(_DWORD *)(*(_QWORD *)(v1 + 48) + 4 * v14);
    v17 = 104 * v14;
    v18 = *(_QWORD *)(v1 + 56) + v17;
    v19 = *(_DWORD *)v18;
    v20 = *(_QWORD *)(v18 + 8);
    v21 = *(_QWORD *)(v18 + 16);
    v22 = *(_BYTE *)(v18 + 24);
    v23 = *(_QWORD *)(v18 + 32);
    v24 = *(_QWORD *)(v18 + 40);
    v25 = *(_BYTE *)(v18 + 64);
    v27 = *(_QWORD *)(v18 + 72);
    v26 = *(_QWORD *)(v18 + 80);
    v28 = *(_BYTE *)(v18 + 88);
    v29 = *(_QWORD *)(v18 + 96);
    v30 = *(_OWORD *)(v18 + 48);
    *(_DWORD *)(*(_QWORD *)(v3 + 48) + v15) = v16;
    v31 = *(_QWORD *)(v3 + 56) + v17;
    *(_DWORD *)v31 = v19;
    *(_QWORD *)(v31 + 8) = v20;
    *(_QWORD *)(v31 + 16) = v21;
    *(_BYTE *)(v31 + 24) = v22;
    *(_QWORD *)(v31 + 32) = v23;
    *(_QWORD *)(v31 + 40) = v24;
    *(_OWORD *)(v31 + 48) = v30;
    *(_BYTE *)(v31 + 64) = v25;
    *(_QWORD *)(v31 + 72) = v27;
    *(_QWORD *)(v31 + 80) = v26;
    *(_BYTE *)(v31 + 88) = v28;
    *(_QWORD *)(v31 + 96) = v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v34 = v32 + 2;
  if (v34 >= v12)
    goto LABEL_26;
  v33 = *(_QWORD *)(v5 + 8 * v34);
  if (v33)
  {
    v8 = v34;
    goto LABEL_25;
  }
  while (1)
  {
    v8 = v34 + 1;
    if (__OFADD__(v34, 1))
      break;
    if (v8 >= v12)
      goto LABEL_26;
    v33 = *(_QWORD *)(v5 + 8 * v8);
    ++v34;
    if (v33)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21FCC4484()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731B8);
  v2 = *v0;
  v3 = sub_21FCE55FC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21FCC4638()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731A0);
  v2 = *v0;
  v3 = sub_21FCE55FC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 24 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 24 * v15;
    v18 = *(_QWORD *)(v17 + 16);
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = *(_QWORD *)(v4 + 48) + v16;
    *(_OWORD *)v21 = *(_OWORD *)v17;
    *(_QWORD *)(v21 + 16) = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21FCC47F0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731A8);
  v2 = *v0;
  v3 = sub_21FCE55FC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v23 = __clz(__rbit64(v21));
    v12 = (v21 - 1) & v21;
    v15 = v23 + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(v2 + 56) + 24 * v15;
    v17 = *(_QWORD *)(v16 + 16);
    v18 = *(_OWORD *)v16;
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    v19 = *(_QWORD *)(v4 + 56) + 24 * v15;
    *(_OWORD *)v19 = v18;
    *(_QWORD *)(v19 + 16) = v17;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21FCC4990()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  __int128 v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573190);
  v2 = *v0;
  v3 = sub_21FCE55FC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      v9 = v26 + 1;
      if (v26 + 1 >= v13)
        goto LABEL_26;
      v27 = *(_QWORD *)(v6 + 8 * v9);
      if (!v27)
        break;
    }
LABEL_25:
    v12 = (v27 - 1) & v27;
    v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 24 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)(v21 + 16);
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v24 = *(_OWORD *)v21;
    *v23 = v19;
    v23[1] = v18;
    v25 = *(_QWORD *)(v4 + 56) + v20;
    *(_OWORD *)v25 = v24;
    *(_QWORD *)(v25 + 16) = v22;
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v13)
    goto LABEL_26;
  v27 = *(_QWORD *)(v6 + 8 * v28);
  if (v27)
  {
    v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v9);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21FCC4B50()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3CF00);
  v2 = *v0;
  v3 = sub_21FCE55FC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21FCC4D08()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573180);
  v2 = *v0;
  v3 = sub_21FCE55FC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21FCC4EC0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_21FCE55FC();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21FCC506C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573170);
  v2 = *v0;
  v3 = sub_21FCE55FC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21FCC5218()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731D8);
  v2 = *v0;
  v3 = sub_21FCE55FC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v18);
    v21 = *v19;
    v20 = v19[1];
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v18);
    *v22 = v21;
    v22[1] = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21FCC53C4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = type metadata accessor for CustomSymbol();
  v36 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v35 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_21FCE5440();
  v3 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v33 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573158);
  v30 = v0;
  v5 = *v0;
  v6 = sub_21FCE55FC();
  v7 = *(_QWORD *)(v5 + 16);
  v38 = v6;
  if (!v7)
  {
    result = (void *)swift_release();
    v28 = v38;
    v27 = v30;
LABEL_25:
    *v27 = v28;
    return result;
  }
  v8 = v6;
  result = (void *)(v6 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
  {
    result = memmove(result, (const void *)(v5 + 64), 8 * v10);
    v8 = v38;
  }
  v11 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v37 = v5;
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v31 = v5 + 64;
  v32 = (unint64_t)(v12 + 63) >> 6;
  v16 = v33;
  v15 = v34;
  v17 = (uint64_t)v35;
  for (i = v38;
        ;
        result = (void *)sub_21FCCB274(v17, *(_QWORD *)(i + 56) + v23, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol))
  {
    if (v14)
    {
      v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v20 = v19 | (v11 << 6);
      v21 = v37;
      goto LABEL_9;
    }
    v24 = v11 + 1;
    v21 = v37;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32)
      goto LABEL_23;
    v25 = *(_QWORD *)(v31 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v32)
        goto LABEL_23;
      v25 = *(_QWORD *)(v31 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_22:
    v14 = (v25 - 1) & v25;
    v20 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_9:
    v22 = *(_QWORD *)(v3 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v16, *(_QWORD *)(v21 + 48) + v22, v15);
    v23 = *(_QWORD *)(v36 + 72) * v20;
    sub_21FCCB230(*(_QWORD *)(v21 + 56) + v23, v17, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(i + 48) + v22, v16, v15);
  }
  v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    result = (void *)swift_release();
    v27 = v30;
    v28 = v38;
    goto LABEL_25;
  }
  v25 = *(_QWORD *)(v31 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v32)
      goto LABEL_23;
    v25 = *(_QWORD *)(v31 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_21FCC568C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_21FCE56EC();
  swift_bridgeObjectRetain();
  sub_21FCE54D0();
  v8 = sub_21FCE5710();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_21FCE5674() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_21FCE5674() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_21FCC6888(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_21FCC5838(_DWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v5 = *v2;
  sub_21FCE56EC();
  sub_21FCE5704();
  v6 = sub_21FCE5710();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_21FCC6A20(a2, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(_DWORD *)(v9 + 4 * v8) != (_DWORD)a2)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_DWORD *)(v9 + 4 * v8) != (_DWORD)a2);
  }
  result = 0;
  LODWORD(a2) = *(_DWORD *)(*(_QWORD *)(*v2 + 48) + 4 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_21FCC5954(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  int EnumCaseMultiPayload;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  uint64_t *v45;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v52 = a1;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573138);
  MEMORY[0x24BDAC7A8](v55);
  v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21FCE5440();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v53 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v50 - v10;
  v12 = type metadata accessor for SymbolKey(0);
  v59 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v54 = (char *)&v50 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v63 = (uint64_t)&v50 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v50 = (uint64_t)&v50 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v50 - v22;
  v51 = v2;
  v24 = *v2;
  sub_21FCE56EC();
  v62 = a2;
  sub_21FCCB230(a2, (uint64_t)v23, type metadata accessor for SymbolKey);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v57 = v7;
  if (EnumCaseMultiPayload == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v23, v6);
    sub_21FCE56F8();
    sub_21FCCB300(&qword_255573140, MEMORY[0x24BDCEA88]);
    swift_bridgeObjectRetain();
    sub_21FCE5458();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
  else
  {
    sub_21FCE56F8();
    sub_21FCE5704();
    swift_bridgeObjectRetain();
  }
  v26 = sub_21FCE5710();
  v27 = -1 << *(_BYTE *)(v24 + 32);
  v28 = v26 & ~v27;
  v61 = v24 + 56;
  v29 = v63;
  v30 = v24;
  if (((*(_QWORD *)(v24 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    v45 = v51;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v47 = v62;
    v48 = v50;
    sub_21FCCB230(v62, v50, type metadata accessor for SymbolKey);
    v64 = *v45;
    *v45 = 0x8000000000000000;
    sub_21FCC6B6C(v48, v28, isUniquelyReferenced_nonNull_native);
    *v45 = v64;
    swift_bridgeObjectRelease();
    sub_21FCCB274(v47, v52, type metadata accessor for SymbolKey);
    return 1;
  }
  v56 = v6;
  v58 = ~v27;
  v59 = *(_QWORD *)(v59 + 72);
  v31 = v54;
  v32 = v55;
  v33 = v57;
  v60 = v30;
  while (1)
  {
    v34 = v59 * v28;
    sub_21FCCB230(*(_QWORD *)(v30 + 48) + v59 * v28, v29, type metadata accessor for SymbolKey);
    v35 = v29;
    v36 = &v5[*(int *)(v32 + 48)];
    sub_21FCCB230(v35, (uint64_t)v5, type metadata accessor for SymbolKey);
    sub_21FCCB230(v62, (uint64_t)v36, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() != 1)
      break;
    sub_21FCCB230((uint64_t)v5, (uint64_t)v15, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v37 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
      v38 = v12;
      v39 = v53;
      v40 = v56;
      v37(v53, v36, v56);
      v41 = sub_21FCE5434();
      v42 = *(void (**)(char *, uint64_t))(v57 + 8);
      v43 = v39;
      v12 = v38;
      v31 = v54;
      v42(v43, v40);
      v44 = v40;
      v33 = v57;
      v42(v15, v44);
      v32 = v55;
      if ((v41 & 1) != 0)
        goto LABEL_17;
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t))(v33 + 8))(v15, v56);
LABEL_7:
    sub_21FCCB1B4((uint64_t)v5);
LABEL_8:
    v29 = v63;
    sub_21FCCB1F4(v63);
    v28 = (v28 + 1) & v58;
    v30 = v60;
    if (((*(_QWORD *)(v61 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
      goto LABEL_16;
  }
  sub_21FCCB230((uint64_t)v5, (uint64_t)v31, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
    goto LABEL_7;
  if (*v31 != *(_DWORD *)v36)
  {
LABEL_15:
    sub_21FCCB1F4((uint64_t)v5);
    goto LABEL_8;
  }
LABEL_17:
  sub_21FCCB1F4((uint64_t)v5);
  sub_21FCCB1F4(v63);
  swift_bridgeObjectRelease();
  sub_21FCCB1F4(v62);
  sub_21FCCB230(*(_QWORD *)(*v51 + 48) + v34, v52, type metadata accessor for SymbolKey);
  return 0;
}

uint64_t sub_21FCC5E6C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731C0);
  v3 = sub_21FCE55B4();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_21FCE56EC();
      sub_21FCE54D0();
      result = sub_21FCE5710();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_21FCC6148()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573150);
  result = sub_21FCE55B4();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v26;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v14);
      sub_21FCE56EC();
      sub_21FCE5704();
      result = sub_21FCE5710();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_21FCC63F0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  int64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  int64_t v54;

  v1 = v0;
  v2 = sub_21FCE5440();
  v47 = *(_QWORD *)(v2 - 8);
  v48 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v46 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SymbolKey(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v49 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v45 - v8;
  v10 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573148);
  v11 = sub_21FCE55B4();
  v52 = v10;
  if (*(_QWORD *)(v10 + 16))
  {
    v45 = v0;
    v12 = 1 << *(_BYTE *)(v52 + 32);
    v13 = *(_QWORD *)(v52 + 56);
    v51 = (_QWORD *)(v52 + 56);
    if (v12 < 64)
      v14 = ~(-1 << v12);
    else
      v14 = -1;
    v15 = v14 & v13;
    v50 = (unint64_t)(v12 + 63) >> 6;
    v16 = v11 + 56;
    result = swift_retain();
    v18 = 0;
    v19 = (uint64_t)v49;
    while (1)
    {
      if (v15)
      {
        v53 = (v15 - 1) & v15;
        v54 = v18;
        v21 = __clz(__rbit64(v15)) | (v18 << 6);
      }
      else
      {
        v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v22 >= v50)
          goto LABEL_36;
        v23 = v51[v22];
        v24 = v18 + 1;
        if (!v23)
        {
          v24 = v18 + 2;
          if (v18 + 2 >= v50)
            goto LABEL_36;
          v23 = v51[v24];
          if (!v23)
          {
            v24 = v18 + 3;
            if (v18 + 3 >= v50)
              goto LABEL_36;
            v23 = v51[v24];
            if (!v23)
            {
              v25 = v18 + 4;
              if (v18 + 4 >= v50)
              {
LABEL_36:
                swift_release();
                v1 = v45;
                v44 = 1 << *(_BYTE *)(v52 + 32);
                if (v44 > 63)
                  bzero(v51, ((unint64_t)(v44 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v51 = -1 << v44;
                *(_QWORD *)(v52 + 16) = 0;
                break;
              }
              v23 = v51[v25];
              if (!v23)
              {
                while (1)
                {
                  v24 = v25 + 1;
                  if (__OFADD__(v25, 1))
                    goto LABEL_43;
                  if (v24 >= v50)
                    goto LABEL_36;
                  v23 = v51[v24];
                  ++v25;
                  if (v23)
                    goto LABEL_23;
                }
              }
              v24 = v18 + 4;
            }
          }
        }
LABEL_23:
        v53 = (v23 - 1) & v23;
        v54 = v24;
        v21 = __clz(__rbit64(v23)) + (v24 << 6);
      }
      v26 = *(_QWORD *)(v5 + 72);
      sub_21FCCB274(*(_QWORD *)(v52 + 48) + v26 * v21, (uint64_t)v9, type metadata accessor for SymbolKey);
      sub_21FCE56EC();
      sub_21FCCB230((uint64_t)v9, v19, type metadata accessor for SymbolKey);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v27 = v47;
        v28 = v11;
        v29 = v9;
        v30 = v5;
        v31 = v4;
        v32 = v46;
        v33 = v19;
        v34 = v48;
        (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v46, v33, v48);
        sub_21FCE56F8();
        sub_21FCCB300(&qword_255573140, MEMORY[0x24BDCEA88]);
        sub_21FCE5458();
        v35 = v32;
        v4 = v31;
        v5 = v30;
        v9 = v29;
        v11 = v28;
        v36 = v34;
        v19 = (uint64_t)v49;
        (*(void (**)(char *, uint64_t))(v27 + 8))(v35, v36);
      }
      else
      {
        sub_21FCE56F8();
        sub_21FCE5704();
      }
      result = sub_21FCE5710();
      v37 = -1 << *(_BYTE *)(v11 + 32);
      v38 = result & ~v37;
      v39 = v38 >> 6;
      if (((-1 << v38) & ~*(_QWORD *)(v16 + 8 * (v38 >> 6))) != 0)
      {
        v20 = __clz(__rbit64((-1 << v38) & ~*(_QWORD *)(v16 + 8 * (v38 >> 6)))) | v38 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v40 = 0;
        v41 = (unint64_t)(63 - v37) >> 6;
        do
        {
          if (++v39 == v41 && (v40 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v42 = v39 == v41;
          if (v39 == v41)
            v39 = 0;
          v40 |= v42;
          v43 = *(_QWORD *)(v16 + 8 * v39);
        }
        while (v43 == -1);
        v20 = __clz(__rbit64(~v43)) + (v39 << 6);
      }
      *(_QWORD *)(v16 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      result = sub_21FCCB274((uint64_t)v9, *(_QWORD *)(v11 + 48) + v20 * v26, type metadata accessor for SymbolKey);
      ++*(_QWORD *)(v11 + 16);
      v15 = v53;
      v18 = v54;
    }
  }
  result = swift_release();
  *v1 = v11;
  return result;
}

uint64_t sub_21FCC6888(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_21FCC5E6C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_21FCC7044();
      goto LABEL_22;
    }
    sub_21FCC75A8();
  }
  v11 = *v4;
  sub_21FCE56EC();
  sub_21FCE54D0();
  result = sub_21FCE5710();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_21FCE5674(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_21FCE5698();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_21FCE5674();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_21FCC6A20(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_21FCC6148();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_21FCC71F4();
      goto LABEL_14;
    }
    sub_21FCC7854();
  }
  v8 = *v3;
  sub_21FCE56EC();
  sub_21FCE5704();
  result = sub_21FCE5710();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_DWORD *)(v10 + 4 * a2) == v5)
    {
LABEL_13:
      result = sub_21FCE5698();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_DWORD *)(v10 + 4 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_DWORD *)(*(_QWORD *)(v12 + 48) + 4 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t sub_21FCC6B6C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  _DWORD *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  _DWORD *v43;
  uint64_t v44;
  char v45;
  void (*v46)(char *, uint64_t);
  char *v47;
  uint64_t v48;
  int v49;
  int v50;
  BOOL v51;
  uint64_t v52;
  uint64_t result;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  uint64_t *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;

  v4 = v3;
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573138);
  MEMORY[0x24BDAC7A8](v68);
  v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21FCE5440();
  v63 = *(_QWORD *)(v10 - 8);
  v64 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v61 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v67 = (char *)&v57 - v13;
  v14 = type metadata accessor for SymbolKey(0);
  v59 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (_DWORD *)((char *)&v57 - v19);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v57 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v57 - v24;
  v26 = *(_QWORD *)(*v4 + 16);
  v27 = *(_QWORD *)(*v4 + 24);
  v57 = v4;
  if (v27 > v26 && (a3 & 1) != 0)
    goto LABEL_24;
  if ((a3 & 1) != 0)
  {
    sub_21FCC63F0();
  }
  else
  {
    if (v27 > v26)
    {
      sub_21FCC7388();
      goto LABEL_24;
    }
    sub_21FCC7ACC();
  }
  v60 = *v4;
  sub_21FCE56EC();
  sub_21FCCB230(a1, (uint64_t)v25, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v66 = (uint64_t)v17;
    v28 = v63;
    v29 = v67;
    v30 = v25;
    v31 = v20;
    v32 = v64;
    (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v67, v30, v64);
    sub_21FCE56F8();
    sub_21FCCB300(&qword_255573140, MEMORY[0x24BDCEA88]);
    sub_21FCE5458();
    v33 = *(void (**)(char *, uint64_t))(v28 + 8);
    v17 = (char *)v66;
    v34 = v32;
    v20 = v31;
    v33(v29, v34);
  }
  else
  {
    sub_21FCE56F8();
    sub_21FCE5704();
  }
  v35 = sub_21FCE5710();
  v36 = v60;
  v37 = -1 << *(_BYTE *)(v60 + 32);
  a2 = v35 & ~v37;
  v67 = (char *)(v60 + 56);
  if (((*(_QWORD *)(v60 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v66 = ~v37;
    v65 = *(_QWORD *)(v59 + 72);
    v62 = a1;
    v58 = v23;
    do
    {
      sub_21FCCB230(*(_QWORD *)(v36 + 48) + v65 * a2, (uint64_t)v23, type metadata accessor for SymbolKey);
      v38 = &v9[*(int *)(v68 + 48)];
      sub_21FCCB230((uint64_t)v23, (uint64_t)v9, type metadata accessor for SymbolKey);
      sub_21FCCB230(a1, (uint64_t)v38, type metadata accessor for SymbolKey);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_21FCCB230((uint64_t)v9, (uint64_t)v17, type metadata accessor for SymbolKey);
        if (swift_getEnumCaseMultiPayload() != 1)
        {
          (*(void (**)(char *, uint64_t))(v63 + 8))(v17, v64);
LABEL_14:
          sub_21FCCB1B4((uint64_t)v9);
          goto LABEL_15;
        }
        v39 = v63;
        v40 = v17;
        v41 = v61;
        v42 = v14;
        v43 = v20;
        v44 = v64;
        (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v61, v38, v64);
        v45 = sub_21FCE5434();
        v46 = *(void (**)(char *, uint64_t))(v39 + 8);
        v47 = v41;
        v17 = v40;
        v36 = v60;
        v46(v47, v44);
        v48 = v44;
        v20 = v43;
        v14 = v42;
        v23 = v58;
        v46(v17, v48);
        a1 = v62;
        sub_21FCCB1F4((uint64_t)v9);
        if ((v45 & 1) != 0)
          goto LABEL_23;
      }
      else
      {
        sub_21FCCB230((uint64_t)v9, (uint64_t)v20, type metadata accessor for SymbolKey);
        if (swift_getEnumCaseMultiPayload() == 1)
          goto LABEL_14;
        v49 = *v20;
        v50 = *(_DWORD *)v38;
        sub_21FCCB1F4((uint64_t)v9);
        v51 = v49 == v50;
        a1 = v62;
        if (v51)
        {
LABEL_23:
          sub_21FCCB1F4((uint64_t)v23);
          sub_21FCE5698();
          __break(1u);
          break;
        }
      }
LABEL_15:
      sub_21FCCB1F4((uint64_t)v23);
      a2 = (a2 + 1) & v66;
    }
    while (((*(_QWORD *)&v67[(a2 >> 3) & 0xFFFFFFFFFFFFF8] >> a2) & 1) != 0);
  }
LABEL_24:
  v52 = *v57;
  *(_QWORD *)(*v57 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = sub_21FCCB274(a1, *(_QWORD *)(v52 + 48) + *(_QWORD *)(v59 + 72) * a2, type metadata accessor for SymbolKey);
  v54 = *(_QWORD *)(v52 + 16);
  v55 = __OFADD__(v54, 1);
  v56 = v54 + 1;
  if (v55)
    __break(1u);
  else
    *(_QWORD *)(v52 + 16) = v56;
  return result;
}

void *sub_21FCC7044()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731C0);
  v2 = *v0;
  v3 = sub_21FCE55A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_21FCC71F4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573150);
  v2 = *v0;
  v3 = sub_21FCE55A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v15) = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_21FCC7388()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = type metadata accessor for SymbolKey(0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573148);
  v6 = *v0;
  v7 = sub_21FCE55A8();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    sub_21FCCB230(*(_QWORD *)(v6 + 48) + v20, (uint64_t)v5, type metadata accessor for SymbolKey);
    result = (void *)sub_21FCCB274((uint64_t)v5, *(_QWORD *)(v8 + 48) + v20, type metadata accessor for SymbolKey);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_21FCC75A8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731C0);
  v3 = sub_21FCE55B4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_21FCE56EC();
    swift_bridgeObjectRetain();
    sub_21FCE54D0();
    result = sub_21FCE5710();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21FCC7854()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573150);
  result = sub_21FCE55B4();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v14);
    sub_21FCE56EC();
    sub_21FCE5704();
    result = sub_21FCE5710();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21FCC7ACC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  int64_t v51;

  v1 = v0;
  v2 = sub_21FCE5440();
  v45 = *(_QWORD *)(v2 - 8);
  v46 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v44 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SymbolKey(0);
  v49 = *(_QWORD *)(v4 - 8);
  v50 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v42 - v8;
  v10 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573148);
  v11 = sub_21FCE55B4();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
  {
    result = swift_release();
LABEL_38:
    *v1 = v12;
    return result;
  }
  v42 = v0;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 56);
  v47 = v10 + 56;
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v48 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 56;
  result = swift_retain();
  v19 = 0;
  v43 = v12;
  while (1)
  {
    if (v16)
    {
      v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v51 = v19;
      v22 = v21 | (v19 << 6);
      goto LABEL_24;
    }
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v23 >= v48)
      goto LABEL_36;
    v24 = *(_QWORD *)(v47 + 8 * v23);
    v25 = v19 + 1;
    if (!v24)
    {
      v25 = v19 + 2;
      if (v19 + 2 >= v48)
        goto LABEL_36;
      v24 = *(_QWORD *)(v47 + 8 * v25);
      if (!v24)
      {
        v25 = v19 + 3;
        if (v19 + 3 >= v48)
          goto LABEL_36;
        v24 = *(_QWORD *)(v47 + 8 * v25);
        if (!v24)
          break;
      }
    }
LABEL_23:
    v16 = (v24 - 1) & v24;
    v51 = v25;
    v22 = __clz(__rbit64(v24)) + (v25 << 6);
LABEL_24:
    v27 = *(_QWORD *)(v49 + 72);
    sub_21FCCB230(*(_QWORD *)(v10 + 48) + v27 * v22, (uint64_t)v9, type metadata accessor for SymbolKey);
    sub_21FCE56EC();
    sub_21FCCB230((uint64_t)v9, (uint64_t)v7, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v28 = v9;
      v29 = v7;
      v30 = v44;
      v31 = v45;
      v32 = v46;
      (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v44, v29, v46);
      sub_21FCE56F8();
      sub_21FCCB300(&qword_255573140, MEMORY[0x24BDCEA88]);
      sub_21FCE5458();
      v33 = *(void (**)(char *, uint64_t))(v31 + 8);
      v7 = v29;
      v9 = v28;
      v34 = v30;
      v12 = v43;
      v33(v34, v32);
    }
    else
    {
      sub_21FCE56F8();
      sub_21FCE5704();
    }
    result = sub_21FCE5710();
    v35 = -1 << *(_BYTE *)(v12 + 32);
    v36 = result & ~v35;
    v37 = v36 >> 6;
    if (((-1 << v36) & ~*(_QWORD *)(v17 + 8 * (v36 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v36) & ~*(_QWORD *)(v17 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v38 = 0;
      v39 = (unint64_t)(63 - v35) >> 6;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v40 = v37 == v39;
        if (v37 == v39)
          v37 = 0;
        v38 |= v40;
        v41 = *(_QWORD *)(v17 + 8 * v37);
      }
      while (v41 == -1);
      v20 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    result = sub_21FCCB274((uint64_t)v9, *(_QWORD *)(v12 + 48) + v20 * v27, type metadata accessor for SymbolKey);
    ++*(_QWORD *)(v12 + 16);
    v19 = v51;
  }
  v26 = v19 + 4;
  if (v19 + 4 >= v48)
  {
LABEL_36:
    result = swift_release_n();
    v1 = v42;
    goto LABEL_38;
  }
  v24 = *(_QWORD *)(v47 + 8 * v26);
  if (v24)
  {
    v25 = v19 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    v25 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v25 >= v48)
      goto LABEL_36;
    v24 = *(_QWORD *)(v47 + 8 * v25);
    ++v26;
    if (v24)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_21FCC7F04(char **a1, _QWORD *a2)
{
  char *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7[2];

  v4 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v4 = sub_21FCD8A4C((uint64_t)v4);
  v5 = *((_QWORD *)v4 + 2);
  v7[0] = (uint64_t)(v4 + 32);
  v7[1] = v5;
  result = sub_21FCC7F74(v7, a2);
  *a1 = v4;
  return result;
}

uint64_t sub_21FCC7F74(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  _QWORD *v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  int *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t (*v57)(uint64_t);
  uint64_t v58;
  char v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  unsigned int *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t);
  uint64_t v78;
  char v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  uint64_t (*v89)(uint64_t);
  _QWORD *v90;
  uint64_t v91;
  char v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char v101;
  unsigned int v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  BOOL v118;
  unint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  BOOL v128;
  uint64_t v129;
  char v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  BOOL v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t v150;
  _QWORD *v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t v157;
  _QWORD *v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  unsigned int *v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  _QWORD *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;

  v5 = a1[1];
  result = sub_21FCE565C();
  if (result >= v5)
  {
    if (v5 < 0)
      goto LABEL_200;
    if (v5)
      return sub_21FCC8EAC(0, v5, 1, a1, a2);
    return result;
  }
  if (v5 >= 0)
    v7 = v5;
  else
    v7 = v5 + 1;
  if (v5 < -1)
    goto LABEL_199;
  v164 = result;
  v175 = v2;
  v161 = a1;
  if (v5 <= 1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    v171 = (char *)(MEMORY[0x24BEE4AF8] + 32);
    v163 = MEMORY[0x24BEE4AF8];
    if (v5 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_166:
      if (v12 >= 2)
      {
        v154 = *v161;
        do
        {
          v155 = v12 - 2;
          if (v12 < 2)
            goto LABEL_194;
          if (!v154)
            goto LABEL_207;
          v156 = *(_QWORD *)(v9 + 32 + 16 * v155);
          v157 = *(_QWORD *)(v9 + 32 + 16 * (v12 - 1) + 8);
          result = sub_21FCC9240((unsigned int *)(v154 + 4 * v156), (unsigned int *)(v154 + 4 * *(_QWORD *)(v9 + 32 + 16 * (v12 - 1))), v154 + 4 * v157, v171, a2);
          if (v175)
            break;
          if (v157 < v156)
            goto LABEL_195;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_21FCD8200(v9);
            v9 = result;
          }
          if (v155 >= *(_QWORD *)(v9 + 16))
            goto LABEL_196;
          v158 = (_QWORD *)(v9 + 32 + 16 * v155);
          *v158 = v156;
          v158[1] = v157;
          v159 = *(_QWORD *)(v9 + 16);
          if (v12 > v159)
            goto LABEL_197;
          result = (uint64_t)memmove((void *)(v9 + 32 + 16 * (v12 - 1)), (const void *)(v9 + 32 + 16 * v12), 16 * (v159 - v12));
          *(_QWORD *)(v9 + 16) = v159 - 1;
          v12 = v159 - 1;
        }
        while (v159 > 2);
      }
LABEL_177:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v163 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = v7 >> 1;
    result = sub_21FCE553C();
    *(_QWORD *)(result + 16) = v8;
    v163 = result;
    v171 = (char *)(result + 32);
  }
  v10 = 0;
  v11 = *a1;
  v162 = *a1 + 8;
  v160 = *a1 - 4;
  v9 = MEMORY[0x24BEE4AF8];
  v174 = a2;
  v168 = v5;
  v179 = *a1;
  while (2)
  {
    v13 = v10 + 1;
    v169 = v10;
    if (v10 + 1 >= v5)
      goto LABEL_73;
    v14 = *(unsigned int *)(v11 + 4 * v13);
    v15 = *(unsigned int *)(v11 + 4 * v10);
    v16 = (uint64_t (*)(uint64_t))a2[6];
    v165 = v9;
    v17 = a2;
    if (v16)
    {
      swift_retain();
      v18 = v16(v14);
      v20 = v19;
      result = sub_21FCCB348((uint64_t)v16);
      if ((v20 & 1) == 0)
        goto LABEL_26;
    }
    else
    {
      v21 = a2[1];
      if (*(_QWORD *)(v21 + 16))
      {
        v22 = a2[5];
        result = sub_21FCC0748(v14);
        if ((v23 & 1) != 0)
        {
          if (*(_QWORD *)(v22 + 16))
          {
            v24 = *(_QWORD *)(v21 + 56) + 104 * result;
            v25 = *(_QWORD *)(v24 + 16);
            v26 = *(_QWORD *)(v24 + 8);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v27 = sub_21FCB8BDC(v26, v25);
            if ((v28 & 1) != 0)
            {
              v29 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v27);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v18 = v29;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              result = swift_bridgeObjectRelease_n();
              a2 = v174;
              v5 = v168;
              goto LABEL_27;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            result = swift_bridgeObjectRelease_n();
            v17 = v174;
            v5 = v168;
          }
        }
      }
    }
    v18 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_26:
    a2 = v17;
LABEL_27:
    v30 = (uint64_t (*)(uint64_t))a2[6];
    if (v30)
    {
      swift_retain();
      v176 = v30(v15);
      v32 = v31;
      result = sub_21FCCB348((uint64_t)v30);
      if ((v32 & 1) == 0)
        goto LABEL_37;
      goto LABEL_36;
    }
    v33 = a2[1];
    if (!*(_QWORD *)(v33 + 16) || (v34 = a2[5], result = sub_21FCC0748(v15), (v35 & 1) == 0) || !*(_QWORD *)(v34 + 16))
    {
LABEL_36:
      v176 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_37;
    }
    v36 = *(_QWORD *)(v33 + 56) + 104 * result;
    v37 = *(_QWORD *)(v36 + 16);
    v38 = *(_QWORD *)(v36 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v39 = sub_21FCB8BDC(v38, v37);
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease_n();
      a2 = v174;
      goto LABEL_36;
    }
    v176 = *(_QWORD *)(*(_QWORD *)(v34 + 56) + 8 * v39);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease_n();
    a2 = v174;
LABEL_37:
    v10 = v169;
    v13 = v169 + 2;
    v11 = v179;
    if (v169 + 2 >= v5)
      goto LABEL_63;
    v41 = (int *)(v162 + 4 * v169);
    v172 = v18;
    do
    {
      v44 = *(v41 - 1);
      v43 = *v41;
      v45 = (uint64_t (*)(uint64_t))a2[6];
      if (!v45)
      {
        v42 = a2;
        v49 = a2[1];
        if (*(_QWORD *)(v49 + 16))
        {
          v50 = a2[5];
          result = sub_21FCC0748(*v41);
          if ((v51 & 1) != 0)
          {
            if (*(_QWORD *)(v50 + 16))
            {
              v52 = *(_QWORD *)(v49 + 56) + 104 * result;
              v53 = *(_QWORD *)(v52 + 16);
              v54 = *(_QWORD *)(v52 + 8);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v55 = sub_21FCB8BDC(v54, v53);
              if ((v56 & 1) != 0)
              {
                v46 = *(_QWORD *)(*(_QWORD *)(v50 + 56) + 8 * v55);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                result = swift_bridgeObjectRelease_n();
                v42 = v174;
                v18 = v172;
                goto LABEL_52;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              result = swift_bridgeObjectRelease_n();
              v42 = v174;
              v18 = v172;
            }
          }
        }
LABEL_51:
        v46 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_52;
      }
      v42 = a2;
      swift_retain();
      v46 = v45(v43);
      v48 = v47;
      result = sub_21FCCB348((uint64_t)v45);
      if ((v48 & 1) != 0)
        goto LABEL_51;
LABEL_52:
      v57 = (uint64_t (*)(uint64_t))v42[6];
      if (v57)
      {
        swift_retain();
        v58 = v57(v44);
        v60 = v59;
        result = sub_21FCCB348((uint64_t)v57);
        if ((v60 & 1) != 0)
          goto LABEL_40;
      }
      else
      {
        v61 = v42[1];
        if (!*(_QWORD *)(v61 + 16))
          goto LABEL_40;
        v62 = v42[5];
        result = sub_21FCC0748(v44);
        if ((v63 & 1) == 0 || !*(_QWORD *)(v62 + 16))
          goto LABEL_40;
        v64 = *(_QWORD *)(v61 + 56) + 104 * result;
        v65 = *(_QWORD *)(v64 + 16);
        v66 = *(_QWORD *)(v64 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v67 = sub_21FCB8BDC(v66, v65);
        if ((v68 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease_n();
          v42 = v174;
          v18 = v172;
LABEL_40:
          v11 = v179;
          if (v18 < v176 == (v46 == 0x7FFFFFFFFFFFFFFFLL))
            goto LABEL_61;
          goto LABEL_41;
        }
        v58 = *(_QWORD *)(*(_QWORD *)(v62 + 56) + 8 * v67);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease_n();
        v42 = v174;
        v18 = v172;
      }
      v11 = v179;
      if (v18 < v176 == v46 >= v58)
      {
LABEL_61:
        v5 = v168;
        v10 = v169;
        a2 = v42;
        goto LABEL_63;
      }
LABEL_41:
      ++v41;
      ++v13;
      a2 = v42;
    }
    while (v168 != v13);
    v5 = v168;
    v10 = v169;
    v13 = v168;
LABEL_63:
    if (v18 < v176)
    {
      v9 = v165;
      if (v13 < v10)
        goto LABEL_201;
      if (v10 >= v13)
        goto LABEL_73;
      v69 = v13 - 1;
      do
      {
        if (v10 != v69)
        {
          if (!v11)
            goto LABEL_206;
          v70 = *(_DWORD *)(v11 + 4 * v10);
          *(_DWORD *)(v11 + 4 * v10) = *(_DWORD *)(v11 + 4 * v69);
          *(_DWORD *)(v11 + 4 * v69) = v70;
        }
        v135 = ++v10 < v69--;
      }
      while (v135);
      v10 = v169;
      if (v13 < v5)
        goto LABEL_74;
LABEL_115:
      if (v13 < v10)
        goto LABEL_193;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_21FCD8058(0, *(_QWORD *)(v9 + 16) + 1, 1, (char *)v9);
        v9 = result;
      }
      v104 = *(_QWORD *)(v9 + 16);
      v103 = *(_QWORD *)(v9 + 24);
      v12 = v104 + 1;
      v11 = v179;
      if (v104 >= v103 >> 1)
      {
        result = (uint64_t)sub_21FCD8058((char *)(v103 > 1), v104 + 1, 1, (char *)v9);
        v11 = v179;
        v9 = result;
      }
      *(_QWORD *)(v9 + 16) = v12;
      v173 = v9 + 32;
      v105 = (uint64_t *)(v9 + 32 + 16 * v104);
      *v105 = v169;
      v105[1] = v13;
      v178 = v13;
      if (!v104)
      {
        v12 = 1;
LABEL_14:
        v5 = v168;
        v10 = v178;
        if (v178 >= v168)
          goto LABEL_166;
        continue;
      }
      v106 = v9 + 32;
      while (2)
      {
        v107 = v12 - 1;
        if (v12 >= 4)
        {
          v112 = v106 + 16 * v12;
          v113 = *(_QWORD *)(v112 - 64);
          v114 = *(_QWORD *)(v112 - 56);
          v118 = __OFSUB__(v114, v113);
          v115 = v114 - v113;
          if (v118)
            goto LABEL_182;
          v117 = *(_QWORD *)(v112 - 48);
          v116 = *(_QWORD *)(v112 - 40);
          v118 = __OFSUB__(v116, v117);
          v110 = v116 - v117;
          v111 = v118;
          if (v118)
            goto LABEL_183;
          v119 = v12 - 2;
          v120 = (uint64_t *)(v106 + 16 * (v12 - 2));
          v122 = *v120;
          v121 = v120[1];
          v118 = __OFSUB__(v121, v122);
          v123 = v121 - v122;
          if (v118)
            goto LABEL_184;
          v118 = __OFADD__(v110, v123);
          v124 = v110 + v123;
          if (v118)
            goto LABEL_186;
          if (v124 >= v115)
          {
            v142 = (uint64_t *)(v106 + 16 * v107);
            v144 = *v142;
            v143 = v142[1];
            v118 = __OFSUB__(v143, v144);
            v145 = v143 - v144;
            if (v118)
              goto LABEL_192;
            v135 = v110 < v145;
          }
          else
          {
LABEL_135:
            if ((v111 & 1) != 0)
              goto LABEL_185;
            v119 = v12 - 2;
            v125 = (uint64_t *)(v106 + 16 * (v12 - 2));
            v127 = *v125;
            v126 = v125[1];
            v128 = __OFSUB__(v126, v127);
            v129 = v126 - v127;
            v130 = v128;
            if (v128)
              goto LABEL_187;
            v131 = (uint64_t *)(v106 + 16 * v107);
            v133 = *v131;
            v132 = v131[1];
            v118 = __OFSUB__(v132, v133);
            v134 = v132 - v133;
            if (v118)
              goto LABEL_189;
            if (__OFADD__(v129, v134))
              goto LABEL_191;
            if (v129 + v134 < v110)
              goto LABEL_147;
            v135 = v110 < v134;
          }
          if (v135)
            v107 = v119;
        }
        else
        {
          if (v12 == 3)
          {
            v109 = *(_QWORD *)(v9 + 32);
            v108 = *(_QWORD *)(v9 + 40);
            v118 = __OFSUB__(v108, v109);
            v110 = v108 - v109;
            v111 = v118;
            goto LABEL_135;
          }
          v136 = *(_QWORD *)(v9 + 32);
          v137 = *(_QWORD *)(v9 + 40);
          v118 = __OFSUB__(v137, v136);
          v129 = v137 - v136;
          v130 = v118;
LABEL_147:
          if ((v130 & 1) != 0)
            goto LABEL_188;
          v138 = (uint64_t *)(v106 + 16 * v107);
          v140 = *v138;
          v139 = v138[1];
          v118 = __OFSUB__(v139, v140);
          v141 = v139 - v140;
          if (v118)
            goto LABEL_190;
          if (v141 < v129)
            goto LABEL_14;
        }
        v146 = v107 - 1;
        if (v107 - 1 >= v12)
        {
          __break(1u);
LABEL_179:
          __break(1u);
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
LABEL_185:
          __break(1u);
LABEL_186:
          __break(1u);
LABEL_187:
          __break(1u);
LABEL_188:
          __break(1u);
LABEL_189:
          __break(1u);
LABEL_190:
          __break(1u);
LABEL_191:
          __break(1u);
LABEL_192:
          __break(1u);
LABEL_193:
          __break(1u);
LABEL_194:
          __break(1u);
LABEL_195:
          __break(1u);
LABEL_196:
          __break(1u);
LABEL_197:
          __break(1u);
LABEL_198:
          __break(1u);
LABEL_199:
          __break(1u);
LABEL_200:
          __break(1u);
LABEL_201:
          __break(1u);
LABEL_202:
          __break(1u);
          goto LABEL_203;
        }
        if (!v11)
          goto LABEL_205;
        v147 = v9;
        v148 = (uint64_t *)(v106 + 16 * v146);
        v149 = v106;
        v150 = *v148;
        v151 = (_QWORD *)(v149 + 16 * v107);
        v152 = v151[1];
        result = sub_21FCC9240((unsigned int *)(v11 + 4 * *v148), (unsigned int *)(v11 + 4 * *v151), v11 + 4 * v152, v171, a2);
        if (v175)
          goto LABEL_177;
        if (v152 < v150)
          goto LABEL_179;
        if (v107 > *(_QWORD *)(v147 + 16))
          goto LABEL_180;
        *v148 = v150;
        v106 = v173;
        *(_QWORD *)(v173 + 16 * v146 + 8) = v152;
        v153 = *(_QWORD *)(v147 + 16);
        if (v107 >= v153)
          goto LABEL_181;
        v9 = v147;
        v12 = v153 - 1;
        result = (uint64_t)memmove(v151, v151 + 2, 16 * (v153 - 1 - v107));
        *(_QWORD *)(v147 + 16) = v153 - 1;
        v11 = v179;
        if (v153 <= 2)
          goto LABEL_14;
        continue;
      }
    }
    break;
  }
  v9 = v165;
LABEL_73:
  if (v13 >= v5)
    goto LABEL_115;
LABEL_74:
  if (__OFSUB__(v13, v10))
    goto LABEL_198;
  if (v13 - v10 >= v164)
  {
LABEL_114:
    v10 = v169;
    goto LABEL_115;
  }
  if (__OFADD__(v169, v164))
    goto LABEL_202;
  if (v169 + v164 >= v5)
    v71 = v5;
  else
    v71 = v169 + v164;
  if (v71 >= v169)
  {
    if (v13 == v71)
    {
      v10 = v169;
      goto LABEL_115;
    }
    v166 = v9;
    v167 = v71;
    v72 = (unsigned int *)(v160 + 4 * v13);
LABEL_88:
    v74 = *(unsigned int *)(v11 + 4 * v13);
    v75 = v169;
    v170 = v72;
    v177 = v13;
    while (2)
    {
      v76 = *v72;
      v77 = (uint64_t (*)(uint64_t))a2[6];
      if (v77)
      {
        swift_retain();
        v78 = v77(v74);
        v80 = v79;
        result = sub_21FCCB348((uint64_t)v77);
        if ((v80 & 1) == 0)
        {
LABEL_99:
          v89 = (uint64_t (*)(uint64_t))a2[6];
          if (v89)
          {
            v90 = a2;
            swift_retain();
            v91 = v89(v76);
            v93 = v92;
            result = sub_21FCCB348((uint64_t)v89);
            if ((v93 & 1) == 0)
            {
LABEL_101:
              v11 = v179;
              if (v78 >= v91)
                goto LABEL_86;
LABEL_110:
              v73 = v177;
              if (!v11)
                goto LABEL_204;
              v102 = *v72;
              v74 = v72[1];
              *v72 = v74;
              v72[1] = v102;
              --v72;
              if (v177 == ++v75)
                goto LABEL_87;
              continue;
            }
          }
          else
          {
            v90 = a2;
            v94 = a2[1];
            if (*(_QWORD *)(v94 + 16))
            {
              v95 = a2[5];
              result = sub_21FCC0748(v76);
              if ((v96 & 1) != 0)
              {
                if (*(_QWORD *)(v95 + 16))
                {
                  v97 = *(_QWORD *)(v94 + 56) + 104 * result;
                  v98 = *(_QWORD *)(v97 + 16);
                  v99 = *(_QWORD *)(v97 + 8);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain_n();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  v100 = sub_21FCB8BDC(v99, v98);
                  if ((v101 & 1) != 0)
                  {
                    v91 = *(_QWORD *)(*(_QWORD *)(v95 + 56) + 8 * v100);
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    result = swift_bridgeObjectRelease_n();
                    a2 = v174;
                    goto LABEL_101;
                  }
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  result = swift_bridgeObjectRelease_n();
                  v90 = v174;
                }
              }
            }
          }
          v11 = v179;
          a2 = v90;
          if (v78 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_86:
            v73 = v177;
LABEL_87:
            v13 = v73 + 1;
            v72 = v170 + 1;
            if (v13 == v167)
            {
              v13 = v167;
              v9 = v166;
              goto LABEL_114;
            }
            goto LABEL_88;
          }
          goto LABEL_110;
        }
      }
      else
      {
        v81 = a2[1];
        if (*(_QWORD *)(v81 + 16))
        {
          v82 = a2[5];
          result = sub_21FCC0748(v74);
          if ((v83 & 1) != 0)
          {
            if (*(_QWORD *)(v82 + 16))
            {
              v84 = *(_QWORD *)(v81 + 56) + 104 * result;
              v85 = *(_QWORD *)(v84 + 16);
              v86 = *(_QWORD *)(v84 + 8);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v87 = sub_21FCB8BDC(v86, v85);
              if ((v88 & 1) != 0)
              {
                v78 = *(_QWORD *)(*(_QWORD *)(v82 + 56) + 8 * v87);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                result = swift_bridgeObjectRelease_n();
                a2 = v174;
                goto LABEL_99;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              result = swift_bridgeObjectRelease_n();
              a2 = v174;
            }
          }
        }
      }
      break;
    }
    v78 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_99;
  }
LABEL_203:
  __break(1u);
LABEL_204:
  __break(1u);
LABEL_205:
  __break(1u);
LABEL_206:
  __break(1u);
LABEL_207:
  __break(1u);
  return result;
}

unint64_t sub_21FCC8EAC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4, _QWORD *a5)
{
  unsigned int *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t (*v21)(uint64_t);
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  unsigned int v33;
  unint64_t v35;
  unsigned int *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v35 = result;
  if (a3 != a2)
  {
    v39 = *a4;
    v6 = (unsigned int *)(*a4 + 4 * a3 - 4);
LABEL_5:
    v7 = *(unsigned int *)(v39 + 4 * a3);
    v8 = v35;
    v36 = v6;
    v40 = a3;
    while (1)
    {
      v9 = *v6;
      v10 = (uint64_t (*)(uint64_t))a5[6];
      if (!v10)
        break;
      swift_retain();
      v11 = v10(v7);
      v13 = v12;
      result = sub_21FCCB348((uint64_t)v10);
      if ((v13 & 1) != 0)
        goto LABEL_15;
LABEL_16:
      v21 = (uint64_t (*)(uint64_t))a5[6];
      if (v21)
      {
        swift_retain();
        v22 = v21(v9);
        v24 = v23;
        result = sub_21FCCB348((uint64_t)v21);
        if ((v24 & 1) == 0)
          goto LABEL_18;
      }
      else
      {
        v26 = a5[1];
        if (*(_QWORD *)(v26 + 16))
        {
          v27 = a5[5];
          result = sub_21FCC0748(v9);
          if ((v28 & 1) != 0)
          {
            if (*(_QWORD *)(v27 + 16))
            {
              v29 = *(_QWORD *)(v26 + 56) + 104 * result;
              v30 = *(_QWORD *)(v29 + 16);
              v38 = *(_QWORD *)(v29 + 8);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v31 = sub_21FCB8BDC(v38, v30);
              if ((v32 & 1) != 0)
              {
                v22 = *(_QWORD *)(*(_QWORD *)(v27 + 56) + 8 * v31);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                result = swift_bridgeObjectRelease_n();
LABEL_18:
                v25 = v40;
                if (v11 >= v22)
                  goto LABEL_4;
                goto LABEL_27;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              result = swift_bridgeObjectRelease_n();
            }
          }
        }
      }
      v25 = v40;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_4;
LABEL_27:
      if (!v39)
      {
        __break(1u);
        return result;
      }
      v33 = *v6;
      v7 = v6[1];
      *v6 = v7;
      v6[1] = v33;
      --v6;
      if (v25 == ++v8)
      {
LABEL_4:
        a3 = v25 + 1;
        v6 = v36 + 1;
        if (a3 == a2)
          return result;
        goto LABEL_5;
      }
    }
    v14 = a5[1];
    if (*(_QWORD *)(v14 + 16))
    {
      v15 = a5[5];
      result = sub_21FCC0748(v7);
      if ((v16 & 1) != 0)
      {
        if (*(_QWORD *)(v15 + 16))
        {
          v17 = *(_QWORD *)(v14 + 56) + 104 * result;
          v18 = *(_QWORD *)(v17 + 16);
          v37 = *(_QWORD *)(v17 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v19 = sub_21FCB8BDC(v37, v18);
          if ((v20 & 1) != 0)
          {
            v11 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v19);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            result = swift_bridgeObjectRelease_n();
            goto LABEL_16;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease_n();
        }
      }
    }
LABEL_15:
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_21FCC9240(unsigned int *__dst, unsigned int *__src, unint64_t a3, char *a4, _QWORD *a5)
{
  unsigned int *v7;
  unsigned int *v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  char *v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t (*v32)(uint64_t);
  uint64_t v33;
  char v34;
  char v35;
  BOOL v36;
  unsigned int *v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  unsigned int *v48;
  uint64_t v49;
  char *v50;
  unsigned int *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t);
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char *v64;
  uint64_t (*v65)(uint64_t);
  unsigned int *v66;
  char *v67;
  _QWORD *v68;
  unsigned int *v69;
  char *v70;
  uint64_t v71;
  char v72;
  char v73;
  BOOL v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  uint64_t v83;
  unsigned int *v84;
  unsigned int *v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int *v88;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;

  v7 = __src;
  v8 = __dst;
  v9 = (char *)__src - (char *)__dst;
  v10 = (char *)__src - (char *)__dst + 3;
  if ((char *)__src - (char *)__dst >= 0)
    v10 = (char *)__src - (char *)__dst;
  v11 = v10 >> 2;
  v12 = a3 - (_QWORD)__src;
  v13 = a3 - (_QWORD)__src + 3;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v13 = a3 - (_QWORD)__src;
  v14 = v13 >> 2;
  if (v11 >= v13 >> 2)
  {
    if (a4 != (char *)__src || &__src[v14] <= (unsigned int *)a4)
      memmove(a4, __src, 4 * v14);
    v16 = &a4[4 * v14];
    v15 = (unsigned int *)a4;
    if (v8 >= v7 || v12 < 4)
      goto LABEL_40;
    v48 = (unsigned int *)(a3 - 4);
    v84 = (unsigned int *)a4;
    while (1)
    {
      v93 = v16;
      v50 = v16 - 4;
      v49 = *((unsigned int *)v16 - 1);
      v88 = v7;
      v51 = v7 - 1;
      v52 = *(v7 - 1);
      v53 = (uint64_t (*)(uint64_t))a5[6];
      if (!v53)
        break;
      swift_retain();
      v90 = v53(v49);
      v55 = v54;
      sub_21FCCB348((uint64_t)v53);
      if ((v55 & 1) != 0)
        goto LABEL_59;
LABEL_60:
      v64 = (char *)(v48 + 1);
      v65 = (uint64_t (*)(uint64_t))a5[6];
      if (v65)
      {
        v85 = v48;
        v66 = v51;
        v67 = v50;
        v68 = a5;
        v69 = v8;
        v70 = v64;
        swift_retain();
        v71 = v65(v52);
        v73 = v72;
        sub_21FCCB348((uint64_t)v65);
        v64 = v70;
        v8 = v69;
        a5 = v68;
        v50 = v67;
        v51 = v66;
        v48 = v85;
        if ((v73 & 1) == 0)
          goto LABEL_62;
      }
      else
      {
        v75 = a5[1];
        if (*(_QWORD *)(v75 + 16))
        {
          v76 = a5[5];
          v77 = sub_21FCC0748(v52);
          v64 = (char *)(v48 + 1);
          if ((v78 & 1) != 0)
          {
            if (*(_QWORD *)(v76 + 16))
            {
              v79 = *(_QWORD *)(v75 + 56) + 104 * v77;
              v80 = *(_QWORD *)(v79 + 16);
              v83 = *(_QWORD *)(v79 + 8);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v81 = sub_21FCB8BDC(v83, v80);
              if ((v82 & 1) != 0)
              {
                v71 = *(_QWORD *)(*(_QWORD *)(v76 + 56) + 8 * v81);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
                v64 = (char *)(v48 + 1);
LABEL_62:
                v7 = v88;
                v16 = v93;
                if (v90 >= v71)
                  goto LABEL_63;
                goto LABEL_75;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
              v64 = (char *)(v48 + 1);
            }
          }
        }
      }
      v7 = v88;
      v16 = v93;
      if (v90 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_63:
        v51 = (unsigned int *)v50;
        if (v64 != v16)
        {
          v16 = v50;
LABEL_80:
          *v48 = *v51;
          goto LABEL_81;
        }
        v74 = v48 >= (unsigned int *)v16;
        v16 = v50;
        if (v74)
          goto LABEL_80;
        goto LABEL_81;
      }
LABEL_75:
      if (v64 != (char *)v7)
      {
        v7 = v51;
        goto LABEL_80;
      }
      v74 = v48 >= v7;
      v7 = v51;
      if (v74)
        goto LABEL_80;
LABEL_81:
      if (v7 <= v8)
      {
        v15 = v84;
        goto LABEL_40;
      }
      --v48;
      v15 = v84;
      if (v16 <= (char *)v84)
        goto LABEL_40;
    }
    v56 = a5[1];
    if (*(_QWORD *)(v56 + 16))
    {
      v57 = a5[5];
      v58 = sub_21FCC0748(v49);
      if ((v59 & 1) != 0)
      {
        if (*(_QWORD *)(v57 + 16))
        {
          v60 = *(_QWORD *)(v56 + 56) + 104 * v58;
          v61 = *(_QWORD *)(v60 + 16);
          v91 = *(_QWORD *)(v60 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v62 = sub_21FCB8BDC(v91, v61);
          if ((v63 & 1) != 0)
          {
            v90 = *(_QWORD *)(*(_QWORD *)(v57 + 56) + 8 * v62);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            goto LABEL_60;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
      }
    }
LABEL_59:
    v90 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_60;
  }
  v15 = (unsigned int *)a4;
  if (a4 != (char *)__dst || &__dst[v11] <= (unsigned int *)a4)
    memmove(a4, __dst, 4 * v11);
  v16 = &a4[4 * v11];
  if ((unint64_t)v7 < a3 && v9 >= 4)
  {
    v92 = &a4[4 * v11];
    while (1)
    {
      v17 = v7;
      v18 = *v7;
      v19 = *v15;
      v20 = (uint64_t (*)(uint64_t))a5[6];
      if (!v20)
        break;
      swift_retain();
      v21 = v20(v18);
      v23 = v22;
      sub_21FCCB348((uint64_t)v20);
      if ((v23 & 1) != 0)
        goto LABEL_21;
LABEL_22:
      v32 = (uint64_t (*)(uint64_t))a5[6];
      if (v32)
      {
        swift_retain();
        v33 = v32(v19);
        v35 = v34;
        sub_21FCCB348((uint64_t)v32);
        if ((v35 & 1) == 0)
          goto LABEL_24;
      }
      else
      {
        v39 = a5[1];
        if (*(_QWORD *)(v39 + 16))
        {
          v40 = a5[5];
          v41 = sub_21FCC0748(v19);
          if ((v42 & 1) != 0)
          {
            if (*(_QWORD *)(v40 + 16))
            {
              v43 = *(_QWORD *)(v39 + 56) + 104 * v41;
              v44 = *(_QWORD *)(v43 + 16);
              v87 = *(_QWORD *)(v43 + 8);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v45 = sub_21FCB8BDC(v87, v44);
              if ((v46 & 1) != 0)
              {
                v33 = *(_QWORD *)(*(_QWORD *)(v40 + 56) + 8 * v45);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
LABEL_24:
                v36 = v21 < v33;
                v7 = v17;
                v16 = v92;
                if (v36)
                  goto LABEL_35;
                goto LABEL_25;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
            }
          }
        }
      }
      v38 = v21 == 0x7FFFFFFFFFFFFFFFLL;
      v7 = v17;
      v16 = v92;
      if (!v38)
      {
LABEL_35:
        v37 = v7;
        v38 = v8 == v7++;
        if (v38)
          goto LABEL_37;
LABEL_36:
        *v8 = *v37;
        goto LABEL_37;
      }
LABEL_25:
      v37 = v15;
      v38 = v8 == v15++;
      if (!v38)
        goto LABEL_36;
LABEL_37:
      ++v8;
      if (v15 >= (unsigned int *)v16 || (unint64_t)v7 >= a3)
        goto LABEL_39;
    }
    v24 = a5[1];
    if (*(_QWORD *)(v24 + 16))
    {
      v25 = a5[5];
      v26 = sub_21FCC0748(v18);
      if ((v27 & 1) != 0)
      {
        if (*(_QWORD *)(v25 + 16))
        {
          v28 = *(_QWORD *)(v24 + 56) + 104 * v26;
          v29 = *(_QWORD *)(v28 + 16);
          v86 = *(_QWORD *)(v28 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v30 = sub_21FCB8BDC(v86, v29);
          if ((v31 & 1) != 0)
          {
            v21 = *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v30);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            goto LABEL_22;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
      }
    }
LABEL_21:
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_22;
  }
LABEL_39:
  v7 = v8;
LABEL_40:
  if (v7 != v15
    || v7 >= (unsigned int *)((char *)v15
                            + ((v16 - (char *)v15 + (v16 - (char *)v15 < 0 ? 3uLL : 0)) & 0xFFFFFFFFFFFFFFFCLL)))
  {
    memmove(v7, v15, 4 * ((v16 - (char *)v15) / 4));
  }
  return 1;
}

uint64_t sub_21FCC9A88(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000;
  if (v2 || (sub_21FCE5674() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572706D6F437369 && a2 == 0xEC00000064657373 || (sub_21FCE5674() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x617A696C61636F6CLL && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_21FCE5674();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_21FCC9C0C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  int v19;
  char v20;
  char v21;
  char v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555732C0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FCCC4D0();
  sub_21FCE5728();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v22 = 0;
  v9 = sub_21FCE5644();
  v11 = v10;
  v21 = 1;
  swift_bridgeObjectRetain();
  v19 = sub_21FCE5638();
  v20 = 2;
  v12 = sub_21FCE562C();
  v14 = v13;
  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16 = v12;
  v15(v8, v5);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v19;
  *(_QWORD *)(a2 + 24) = v16;
  *(_QWORD *)(a2 + 32) = v14;
  return result;
}

uint64_t sub_21FCC9DE4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_21FCE5674() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7365726F7473 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_21FCE5674();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_21FCC9ECC(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555731D8);
  v3 = (_QWORD *)sub_21FCE5614();
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  result = sub_21FCC0718(v4);
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v9 = a1 + 9;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v4;
    v10 = (_QWORD *)(v3[7] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    if (!--v1)
      goto LABEL_8;
    v14 = v9 + 3;
    v4 = *(v9 - 2);
    v5 = *(v9 - 1);
    v15 = *v9;
    swift_bridgeObjectRetain();
    result = sub_21FCC0718(v4);
    v9 = v14;
    v6 = v15;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207D192C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_21FCCA01C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255573070;
  if (!qword_255573070)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255573078);
    v2 = MEMORY[0x24BEE0D38];
    result = MEMORY[0x2207D1938](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255573070);
  }
  return result;
}

unint64_t sub_21FCCA078()
{
  unint64_t result;

  result = qword_255573080;
  if (!qword_255573080)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE5ED0, &_s21NameAvailabilityPlistVN);
    atomic_store(result, (unint64_t *)&qword_255573080);
  }
  return result;
}

unint64_t sub_21FCCA0BC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2555730A0;
  if (!qword_2555730A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255573098);
    v2 = sub_21FCCA120();
    result = MEMORY[0x2207D1938](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2555730A0);
  }
  return result;
}

unint64_t sub_21FCCA120()
{
  unint64_t result;

  result = qword_2555730A8;
  if (!qword_2555730A8)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE5EA8, &_s15CodableCategoryVN);
    atomic_store(result, (unint64_t *)&qword_2555730A8);
  }
  return result;
}

unint64_t sub_21FCCA164()
{
  unint64_t result;

  result = qword_2555730B0;
  if (!qword_2555730B0)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE5E80, &_s20LayerSetAvailabilityVN);
    atomic_store(result, (unint64_t *)&qword_2555730B0);
  }
  return result;
}

unint64_t sub_21FCCA1A8()
{
  unint64_t result;

  result = qword_2555730B8;
  if (!qword_2555730B8)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE5E58, &_s19FeatureAvailabilityVN);
    atomic_store(result, (unint64_t *)&qword_2555730B8);
  }
  return result;
}

unint64_t sub_21FCCA1EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2555730C8;
  if (!qword_2555730C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555730C0);
    v2[0] = MEMORY[0x24BEE0D38];
    v2[1] = sub_21FCCA26C(&qword_255573090, &qword_255573088, MEMORY[0x24BEE0D38]);
    result = MEMORY[0x2207D1938](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2555730C8);
  }
  return result;
}

uint64_t sub_21FCCA26C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = MEMORY[0x24BEE0D38];
    v7[1] = a3;
    result = MEMORY[0x2207D1938](MEMORY[0x24BEE04E0], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *_s19FeatureAvailabilityVMa()
{
  return &_s19FeatureAvailabilityVN;
}

ValueMetadata *_s20LayerSetAvailabilityVMa()
{
  return &_s20LayerSetAvailabilityVN;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t _s15CodableCategoryVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s15CodableCategoryVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s15CodableCategoryVMa()
{
  return &_s15CodableCategoryVN;
}

uint64_t _s21NameAvailabilityPlistVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s21NameAvailabilityPlistVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s21NameAvailabilityPlistVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *_s21NameAvailabilityPlistVwta(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s21NameAvailabilityPlistVwet(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s21NameAvailabilityPlistVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s21NameAvailabilityPlistVMa()
{
  return &_s21NameAvailabilityPlistVN;
}

uint64_t sub_21FCCA528(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x736C6F626D7973 && a2 == 0xE700000000000000;
  if (v2 || (sub_21FCE5674() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5F6F745F72616579 && a2 == 0xEF657361656C6572)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_21FCE5674();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21FCCA63C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555730E0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_21FCCA84C();
  sub_21FCE5728();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573088);
    HIBYTE(v9) = 0;
    sub_21FCCA26C(&qword_255573090, &qword_255573088, MEMORY[0x24BEE0D38]);
    sub_21FCE5650();
    v7 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555730C0);
    HIBYTE(v9) = 1;
    sub_21FCCA1EC();
    swift_bridgeObjectRetain();
    sub_21FCE5650();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_21FCCA84C()
{
  unint64_t result;

  result = qword_2555730E8;
  if (!qword_2555730E8)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6388, &_s21NameAvailabilityPlistV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555730E8);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21FCCA8B0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (sub_21FCE5674() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1852793705 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_21FCE5674();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21FCCA980(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555730F0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FCCAB2C();
  sub_21FCE5728();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v11 = 0;
    v7 = sub_21FCE5644();
    v10 = 1;
    swift_bridgeObjectRetain();
    sub_21FCE5644();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_21FCCAB2C()
{
  unint64_t result;

  result = qword_2555730F8;
  if (!qword_2555730F8)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6338, &_s15CodableCategoryV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555730F8);
  }
  return result;
}

uint64_t sub_21FCCAB70(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C6F6369746C756DLL && a2 == 0xEA0000000000726FLL;
  if (v2 || (sub_21FCE5674() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6863726172656968 && a2 == 0xEC0000006C616369)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_21FCE5674();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21FCCAC84(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573250);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FCCBEB0();
  sub_21FCE5728();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
    v7 = sub_21FCE562C();
    v10 = 1;
    sub_21FCE562C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

_QWORD *sub_21FCCAE0C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573100);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FCCAF50();
  sub_21FCE5728();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573110);
    sub_21FCCAF94(&qword_255573118, &qword_255573110, (uint64_t (*)(void))sub_21FCCB000);
    sub_21FCE5650();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_21FCCAF50()
{
  unint64_t result;

  result = qword_255573108;
  if (!qword_255573108)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE62E8, &_s20LayerSetAvailabilityV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573108);
  }
  return result;
}

uint64_t sub_21FCCAF94(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    v8[0] = MEMORY[0x24BEE0D38];
    v8[1] = v7;
    result = MEMORY[0x2207D1938](MEMORY[0x24BEE04E0], v6, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21FCCB000()
{
  unint64_t result;

  result = qword_255573120;
  if (!qword_255573120)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE62C0, &_s20LayerSetAvailabilityV9LayerSetsVN);
    atomic_store(result, (unint64_t *)&qword_255573120);
  }
  return result;
}

_QWORD *sub_21FCCB044(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573128);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FCCB170();
  sub_21FCE5728();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555730C0);
    sub_21FCCA1EC();
    sub_21FCE5650();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_21FCCB170()
{
  unint64_t result;

  result = qword_255573130;
  if (!qword_255573130)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6270, &_s19FeatureAvailabilityV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573130);
  }
  return result;
}

uint64_t sub_21FCCB1B4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573138);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21FCCB1F4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SymbolKey(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21FCCB230(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21FCCB274(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21FCCB2B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FCCB300(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_21FCE5440();
    result = MEMORY[0x2207D1938](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21FCCB340()
{
  return swift_release();
}

uint64_t sub_21FCCB348(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

unint64_t sub_21FCCB358()
{
  unint64_t result;

  result = qword_2555731E0;
  if (!qword_2555731E0)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6248, &_s13MetadataIndexVN);
    atomic_store(result, (unint64_t *)&qword_2555731E0);
  }
  return result;
}

unint64_t sub_21FCCB39C()
{
  unint64_t result;

  result = qword_2555731E8;
  if (!qword_2555731E8)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6208, &_s9LoadErrorON);
    atomic_store(result, (unint64_t *)&qword_2555731E8);
  }
  return result;
}

uint64_t sub_21FCCB3E0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_21FCCB424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a5)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21FCCB454(uint64_t a1)
{
  return sub_21FCBB690(a1);
}

uint64_t sub_21FCCB47C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

id sub_21FCCB4C4(id result, uint64_t a2, char a3)
{
  if (a3 == 1)
    return (id)swift_bridgeObjectRetain();
  if (!a3)
    return result;
  return result;
}

void _s9LoadErrorOwxx(uint64_t a1)
{
  sub_21FCCB4F4(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_21FCCB4F4(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!a3)
  {

  }
}

uint64_t _s9LoadErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21FCCB4C4(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s9LoadErrorOwca(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21FCCB4C4(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_21FCCB4F4(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t _s9LoadErrorOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_21FCCB4F4(v4, v5, v6);
  return a1;
}

uint64_t _s9LoadErrorOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s9LoadErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_21FCCB694(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_21FCCB6B0(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *_s9LoadErrorOMa()
{
  return &_s9LoadErrorON;
}

uint64_t _s13MetadataIndexVwxx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s13MetadataIndexVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s13MetadataIndexVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13MetadataIndexVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13MetadataIndexVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s13MetadataIndexVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s13MetadataIndexVMa()
{
  return &_s13MetadataIndexVN;
}

uint64_t sub_21FCCB844()
{
  return 0;
}

ValueMetadata *_s19FeatureAvailabilityV10CodingKeysOMa()
{
  return &_s19FeatureAvailabilityV10CodingKeysON;
}

uint64_t _s19FeatureAvailabilityV10CodingKeysOwet_0(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t _s19FeatureAvailabilityV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_21FCCB8EC + 4 * byte_21FCE5DCE[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21FCCB90C + 4 * byte_21FCE5DD3[v4]))();
}

_BYTE *sub_21FCCB8EC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21FCCB90C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21FCCB914(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21FCCB91C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21FCCB924(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21FCCB92C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s20LayerSetAvailabilityV10CodingKeysOMa()
{
  return &_s20LayerSetAvailabilityV10CodingKeysON;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *_s15CodableCategoryV10CodingKeysOMa()
{
  return &_s15CodableCategoryV10CodingKeysON;
}

ValueMetadata *_s21NameAvailabilityPlistV10CodingKeysOMa()
{
  return &_s21NameAvailabilityPlistV10CodingKeysON;
}

uint64_t _s20LayerSetAvailabilityV9LayerSetsVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s20LayerSetAvailabilityV9LayerSetsVwcp_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s20LayerSetAvailabilityV9LayerSetsVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *_s20LayerSetAvailabilityV9LayerSetsVwta_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s20LayerSetAvailabilityV9LayerSetsVwet(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s20LayerSetAvailabilityV9LayerSetsVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *_s20LayerSetAvailabilityV9LayerSetsVMa()
{
  return &_s20LayerSetAvailabilityV9LayerSetsVN;
}

unint64_t sub_21FCCBB54()
{
  unint64_t result;

  result = qword_2555731F0;
  if (!qword_2555731F0)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE5FB8, &_s21NameAvailabilityPlistV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555731F0);
  }
  return result;
}

unint64_t sub_21FCCBB9C()
{
  unint64_t result;

  result = qword_2555731F8;
  if (!qword_2555731F8)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6070, &_s15CodableCategoryV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555731F8);
  }
  return result;
}

unint64_t sub_21FCCBBE4()
{
  unint64_t result;

  result = qword_255573200;
  if (!qword_255573200)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6128, &_s20LayerSetAvailabilityV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573200);
  }
  return result;
}

unint64_t sub_21FCCBC2C()
{
  unint64_t result;

  result = qword_255573208;
  if (!qword_255573208)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE61E0, &_s19FeatureAvailabilityV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573208);
  }
  return result;
}

unint64_t sub_21FCCBC74()
{
  unint64_t result;

  result = qword_255573210;
  if (!qword_255573210)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6150, &_s19FeatureAvailabilityV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573210);
  }
  return result;
}

unint64_t sub_21FCCBCBC()
{
  unint64_t result;

  result = qword_255573218;
  if (!qword_255573218)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6178, &_s19FeatureAvailabilityV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573218);
  }
  return result;
}

unint64_t sub_21FCCBD04()
{
  unint64_t result;

  result = qword_255573220;
  if (!qword_255573220)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6098, &_s20LayerSetAvailabilityV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573220);
  }
  return result;
}

unint64_t sub_21FCCBD4C()
{
  unint64_t result;

  result = qword_255573228;
  if (!qword_255573228)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE60C0, &_s20LayerSetAvailabilityV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573228);
  }
  return result;
}

unint64_t sub_21FCCBD94()
{
  unint64_t result;

  result = qword_255573230;
  if (!qword_255573230)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE5FE0, &_s15CodableCategoryV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573230);
  }
  return result;
}

unint64_t sub_21FCCBDDC()
{
  unint64_t result;

  result = qword_255573238;
  if (!qword_255573238)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6008, &_s15CodableCategoryV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573238);
  }
  return result;
}

unint64_t sub_21FCCBE24()
{
  unint64_t result;

  result = qword_255573240;
  if (!qword_255573240)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE5F28, &_s21NameAvailabilityPlistV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573240);
  }
  return result;
}

unint64_t sub_21FCCBE6C()
{
  unint64_t result;

  result = qword_255573248;
  if (!qword_255573248)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE5F50, &_s21NameAvailabilityPlistV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573248);
  }
  return result;
}

unint64_t sub_21FCCBEB0()
{
  unint64_t result;

  result = qword_255573258;
  if (!qword_255573258)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE65CC, &_s20LayerSetAvailabilityV9LayerSetsV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573258);
  }
  return result;
}

unint64_t sub_21FCCBEF4()
{
  unint64_t result;

  result = qword_255573268;
  if (!qword_255573268)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE657C, &_s13MetadataIndexV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573268);
  }
  return result;
}

unint64_t sub_21FCCBF38()
{
  unint64_t result;

  result = qword_255573270;
  if (!qword_255573270)
  {
    result = MEMORY[0x2207D1938](&protocol conformance descriptor for Version, &type metadata for Version);
    atomic_store(result, (unint64_t *)&qword_255573270);
  }
  return result;
}

unint64_t sub_21FCCBF7C()
{
  unint64_t result;

  result = qword_255573288;
  if (!qword_255573288)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6554, &_s13MetadataIndexV10StoreIndexVN);
    atomic_store(result, (unint64_t *)&qword_255573288);
  }
  return result;
}

uint64_t sub_21FCCBFC0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21FCCBFC8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *_s13MetadataIndexV10CodingKeysOMa()
{
  return &_s13MetadataIndexV10CodingKeysON;
}

uint64_t _s15CodableCategoryV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s15CodableCategoryV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_21FCCC0C0 + 4 * byte_21FCE5DDD[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21FCCC0F4 + 4 * byte_21FCE5DD8[v4]))();
}

uint64_t sub_21FCCC0F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FCCC0FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FCCC104);
  return result;
}

uint64_t sub_21FCCC110(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FCCC118);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21FCCC11C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FCCC124(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s20LayerSetAvailabilityV9LayerSetsV10CodingKeysOMa()
{
  return &_s20LayerSetAvailabilityV9LayerSetsV10CodingKeysON;
}

uint64_t _s13MetadataIndexV10StoreIndexVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s13MetadataIndexV10StoreIndexVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s13MetadataIndexV10StoreIndexVwca(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s13MetadataIndexV10StoreIndexVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13MetadataIndexV10StoreIndexVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s13MetadataIndexV10StoreIndexVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s13MetadataIndexV10StoreIndexVMa()
{
  return &_s13MetadataIndexV10StoreIndexVN;
}

unint64_t sub_21FCCC324()
{
  unint64_t result;

  result = qword_255573290;
  if (!qword_255573290)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6474, &_s20LayerSetAvailabilityV9LayerSetsV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573290);
  }
  return result;
}

unint64_t sub_21FCCC36C()
{
  unint64_t result;

  result = qword_255573298;
  if (!qword_255573298)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE652C, &_s13MetadataIndexV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255573298);
  }
  return result;
}

unint64_t sub_21FCCC3B4()
{
  unint64_t result;

  result = qword_2555732A0;
  if (!qword_2555732A0)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE649C, &_s13MetadataIndexV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555732A0);
  }
  return result;
}

unint64_t sub_21FCCC3FC()
{
  unint64_t result;

  result = qword_2555732A8;
  if (!qword_2555732A8)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE64C4, &_s13MetadataIndexV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555732A8);
  }
  return result;
}

unint64_t sub_21FCCC444()
{
  unint64_t result;

  result = qword_2555732B0;
  if (!qword_2555732B0)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE63E4, &_s20LayerSetAvailabilityV9LayerSetsV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555732B0);
  }
  return result;
}

unint64_t sub_21FCCC48C()
{
  unint64_t result;

  result = qword_2555732B8;
  if (!qword_2555732B8)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE640C, &_s20LayerSetAvailabilityV9LayerSetsV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555732B8);
  }
  return result;
}

unint64_t sub_21FCCC4D0()
{
  unint64_t result;

  result = qword_2555732C8;
  if (!qword_2555732C8)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE66D4, &_s13MetadataIndexV10StoreIndexV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555732C8);
  }
  return result;
}

uint64_t _s13MetadataIndexV10StoreIndexV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s13MetadataIndexV10StoreIndexV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_21FCCC5F0 + 4 * byte_21FCE5DE7[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21FCCC624 + 4 * byte_21FCE5DE2[v4]))();
}

uint64_t sub_21FCCC624(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FCCC62C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FCCC634);
  return result;
}

uint64_t sub_21FCCC640(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FCCC648);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21FCCC64C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FCCC654(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21FCCC660(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *_s13MetadataIndexV10StoreIndexV10CodingKeysOMa()
{
  return &_s13MetadataIndexV10StoreIndexV10CodingKeysON;
}

unint64_t sub_21FCCC67C()
{
  unint64_t result;

  result = qword_2555732D0;
  if (!qword_2555732D0)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE66AC, &_s13MetadataIndexV10StoreIndexV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555732D0);
  }
  return result;
}

unint64_t sub_21FCCC6C4()
{
  unint64_t result;

  result = qword_2555732D8;
  if (!qword_2555732D8)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE661C, &_s13MetadataIndexV10StoreIndexV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555732D8);
  }
  return result;
}

unint64_t sub_21FCCC70C()
{
  unint64_t result;

  result = qword_2555732E0;
  if (!qword_2555732E0)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6644, &_s13MetadataIndexV10StoreIndexV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555732E0);
  }
  return result;
}

void sub_21FCCC76C(uint64_t a1, char a2)
{
  sub_21FCE56EC();
  __asm { BR              X10 }
}

uint64_t sub_21FCCC7BC()
{
  sub_21FCE54D0();
  swift_bridgeObjectRelease();
  return sub_21FCE5710();
}

void sub_21FCCC868(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21FCCC8C4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21FCCC92C + 4 * byte_21FCE672F[a2]))(0x6863726172656968);
}

uint64_t sub_21FCCC92C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6863726172656968 && v1 == 0xEC0000006C616369)
    v2 = 1;
  else
    v2 = sub_21FCE5674();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_21FCCC9DC(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21FCCCA38(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21FCCCAD4 + 4 * byte_21FCE673A[a2]))(0x534F63616DLL);
}

uint64_t sub_21FCCCAD4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x534F63616DLL && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = sub_21FCE5674();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

SFSymbols::Availability::Platform_optional __swiftcall Availability.Platform.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SFSymbols::Availability::Platform_optional result;
  char v5;

  v2 = v1;
  v3 = sub_21FCE5620();
  result.value = swift_bridgeObjectRelease();
  v5 = 7;
  if (v3 < 7)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t Availability.Platform.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21FCCCC58 + 4 * byte_21FCE6741[*v0]))(0x6F626D7953204653, 0xEA0000000000736CLL);
}

uint64_t sub_21FCCCC58()
{
  return 0x534F63616DLL;
}

uint64_t sub_21FCCCC6C()
{
  return 0x617461432063614DLL;
}

uint64_t sub_21FCCCC8C()
{
  return 5459817;
}

uint64_t sub_21FCCCC9C()
{
  return 0x534F6863746177;
}

uint64_t sub_21FCCCCB4()
{
  return 1397716596;
}

uint64_t sub_21FCCCCC4()
{
  return 0x534F6E6F69736976;
}

void sub_21FCCCCDC(char *a1)
{
  sub_21FCCC9DC(*a1);
}

SFSymbols::Availability::Platform_optional sub_21FCCCCE8(Swift::String *a1)
{
  return Availability.Platform.init(rawValue:)(*a1);
}

uint64_t sub_21FCCCCF4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_21FCCCD28 + 4 * byte_21FCE6748[*v0]))();
}

void sub_21FCCCD28(_QWORD *a1@<X8>)
{
  *a1 = 0x534F63616DLL;
  a1[1] = 0xE500000000000000;
}

void sub_21FCCCD40(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "Mac Catalyst");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_21FCCCD64(_QWORD *a1@<X8>)
{
  *a1 = 5459817;
  a1[1] = 0xE300000000000000;
}

void sub_21FCCCD78(_QWORD *a1@<X8>)
{
  *a1 = 0x534F6863746177;
  a1[1] = 0xE700000000000000;
}

void sub_21FCCCD94(_QWORD *a1@<X8>)
{
  *a1 = 1397716596;
  a1[1] = 0xE400000000000000;
}

void sub_21FCCCDA8(_QWORD *a1@<X8>)
{
  *a1 = 0x534F6E6F69736976;
  a1[1] = 0xE800000000000000;
}

void sub_21FCCCDC4()
{
  char *v0;

  sub_21FCCC76C(0, *v0);
}

void sub_21FCCCDD0()
{
  __asm { BR              X10 }
}

uint64_t sub_21FCCCE10()
{
  sub_21FCE54D0();
  return swift_bridgeObjectRelease();
}

void sub_21FCCCEA8(uint64_t a1)
{
  char *v1;

  sub_21FCCC76C(a1, *v1);
}

SFSymbols::Version_optional __swiftcall Availability.earliestSupportedRelease(for:)(SFSymbols::Availability::Platform a1)
{
  SFSymbols::Version_optional result;

  __asm { BR              X9 }
  return result;
}

uint64_t sub_21FCCCF08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  if (__OFSUB__(v1, 2018))
  {
    __break(1u);
    JUMPOUT(0x21FCCD268);
  }
  *(_QWORD *)v0 = v1 - 2018;
  *(_QWORD *)(v0 + 8) = v2;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 24) = 0;
  return result;
}

unint64_t sub_21FCCD2B8()
{
  unint64_t result;

  result = qword_2555732E8;
  if (!qword_2555732E8)
  {
    result = MEMORY[0x2207D1938](&protocol conformance descriptor for Availability.Platform, &type metadata for Availability.Platform);
    atomic_store(result, (unint64_t *)&qword_2555732E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for Availability()
{
  return &type metadata for Availability;
}

uint64_t getEnumTagSinglePayload for Availability.Platform(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Availability.Platform(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_21FCCD3E8 + 4 * byte_21FCE675B[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_21FCCD41C + 4 * byte_21FCE6756[v4]))();
}

uint64_t sub_21FCCD41C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FCCD424(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FCCD42CLL);
  return result;
}

uint64_t sub_21FCCD438(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FCCD440);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_21FCCD444(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FCCD44C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Availability.Platform()
{
  return &type metadata for Availability.Platform;
}

void static Version.sfSymbolsHost.getter(_QWORD *a1@<X8>)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 4;
}

uint64_t Alias.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Alias.availability.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 32);
  v2 = *(_QWORD *)(v1 + 40);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t destroy for Alias()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Alias(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Alias(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Alias(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for Alias()
{
  return &type metadata for Alias;
}

SFSymbols::SymbolProperty __swiftcall SymbolProperty.init(rawValue:)(SFSymbols::SymbolProperty rawValue)
{
  SFSymbols::SymbolProperty *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t SymbolProperty.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_21FCCD634()
{
  unint64_t result;

  result = qword_2555732F0;
  if (!qword_2555732F0)
  {
    result = MEMORY[0x2207D1938](&protocol conformance descriptor for SymbolProperty, &type metadata for SymbolProperty);
    atomic_store(result, (unint64_t *)&qword_2555732F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolProperty()
{
  return &type metadata for SymbolProperty;
}

uint64_t sub_21FCCD68C(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  uint64_t v20;
  unint64_t i;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v26;

  v3 = swift_bridgeObjectRetain();
  v4 = sub_21FCD8CDC(v3);
  swift_bridgeObjectRelease();
  v5 = a2[2];
  if (v5)
  {
    v6 = a2[4];
    v7 = a2[5];
    v8 = a2 + 4;
    swift_bridgeObjectRetain();
    LOBYTE(v6) = sub_21FCD32D4(v6, v7, v4);
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0 && v5 != 1)
    {
      v10 = v4 + 56;
      v9 = 1;
      v26 = v5;
      do
      {
        if (*(_QWORD *)(v4 + 16))
        {
          v11 = &v8[2 * v9];
          v13 = *v11;
          v12 = v11[1];
          sub_21FCE56EC();
          swift_bridgeObjectRetain();
          sub_21FCE54D0();
          v14 = sub_21FCE5710();
          v15 = -1 << *(_BYTE *)(v4 + 32);
          v16 = v14 & ~v15;
          if (((*(_QWORD *)(v10 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
          {
            v17 = *(_QWORD *)(v4 + 48);
            v18 = (_QWORD *)(v17 + 16 * v16);
            v19 = *v18 == v13 && v18[1] == v12;
            if (v19 || (sub_21FCE5674() & 1) != 0)
            {
LABEL_24:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              return v9;
            }
            v20 = ~v15;
            for (i = v16 + 1; ; i = v22 + 1)
            {
              v22 = i & v20;
              if (((*(_QWORD *)(v10 + (((i & v20) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v20)) & 1) == 0)
                break;
              v23 = (_QWORD *)(v17 + 16 * v22);
              v24 = *v23 == v13 && v23[1] == v12;
              if (v24 || (sub_21FCE5674() & 1) != 0)
                goto LABEL_24;
            }
          }
          swift_bridgeObjectRelease();
          v5 = v26;
        }
        ++v9;
      }
      while (v9 != v5);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

BOOL static AccessLevel.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

uint64_t AccessLevel.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

SFSymbols::AccessLevel_optional __swiftcall AccessLevel.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (SFSymbols::AccessLevel_optional)rawValue;
}

SFSymbols::AccessLevel_optional sub_21FCCD894(Swift::Int *a1)
{
  return AccessLevel.init(rawValue:)(*a1);
}

void sub_21FCCD89C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

BOOL sub_21FCCD8A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_21FCCD8BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_21FCCD8D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_21FCCD8E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

SFSymbols::RenderingMode_optional __swiftcall RenderingMode.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SFSymbols::RenderingMode_optional result;
  char v5;

  v2 = v1;
  v3 = sub_21FCE5620();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t RenderingMode.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21FCCD984 + 4 * byte_21FCE6920[*v0]))(0x6F7268636F6E6F6DLL, 0xEA0000000000656DLL);
}

uint64_t sub_21FCCD984()
{
  return 0x6863726172656968;
}

uint64_t sub_21FCCD9A4()
{
  return 0x6C6F6369746C756DLL;
}

uint64_t sub_21FCCD9BC()
{
  return 0x657474656C6170;
}

void sub_21FCCD9D4(char *a1)
{
  sub_21FCCC868(*a1);
}

void sub_21FCCD9E0()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_21FCE56EC();
  __asm { BR              X9 }
}

uint64_t sub_21FCCDA30()
{
  sub_21FCE54D0();
  swift_bridgeObjectRelease();
  return sub_21FCE5710();
}

void sub_21FCCDAA8()
{
  __asm { BR              X10 }
}

uint64_t sub_21FCCDAE8()
{
  sub_21FCE54D0();
  return swift_bridgeObjectRelease();
}

void sub_21FCCDB4C()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_21FCE56EC();
  __asm { BR              X9 }
}

uint64_t sub_21FCCDB98()
{
  sub_21FCE54D0();
  swift_bridgeObjectRelease();
  return sub_21FCE5710();
}

SFSymbols::RenderingMode_optional sub_21FCCDC10(Swift::String *a1)
{
  return RenderingMode.init(rawValue:)(*a1);
}

uint64_t sub_21FCCDC1C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_21FCCDC50 + 4 * byte_21FCE6930[*v0]))();
}

void sub_21FCCDC50(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "hierarchical");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_21FCCDC74(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x6C6F6369746C756DLL;
  a1[1] = v1 + 3330;
}

void sub_21FCCDC90(_QWORD *a1@<X8>)
{
  *a1 = 0x657474656C6170;
  a1[1] = 0xE700000000000000;
}

uint64_t SystemSymbolCSVRow.privateScalar.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t SystemSymbolCSVRow.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SystemSymbolCSVRow.mirrorForRTL.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t SystemSymbolCSVRow.locale.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SystemSymbolCSVRow.publicScalars.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SystemSymbolCSVRow.functions.getter()
{
  return swift_bridgeObjectRetain();
}

void SystemSymbolCSVRow.accessLevel.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 64);
}

uint64_t SystemSymbolCSVRow.useRestrictionText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

void SystemSymbolCSVRow.defaultRenderingMode.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 88);
}

uint64_t SystemSymbolCSVRow.additionalColumns.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21FCCDD70(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  BOOL v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char v13;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_21FCE5674() & 1) != 0)
    return 0;
  v9 = 0;
  v10 = a3 + 7;
  v11 = 1;
  while (1)
  {
    if (v3 == v11)
      return 0;
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2)
      break;
    v13 = sub_21FCE5674();
    result = v11++;
    v10 += 2;
    if ((v13 & 1) != 0)
      return result;
  }
  return v9;
}

char sub_21FCCDE54@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, unint64_t a16, char a17, unint64_t a18, char a19, unint64_t a20,char a21)
{
  unint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  char *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  unint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  unint64_t *v55;
  char *v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  int v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  unint64_t v82;
  unint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t *v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char isUniquelyReferenced_nonNull_native;
  unint64_t *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  unint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t *v114;
  uint64_t v115;
  Swift::String v116;
  _QWORD *v117;
  uint64_t v118;
  _QWORD v120[2];
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD *v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;

  v129 = a6;
  v130 = a8;
  LODWORD(v131) = a7;
  v138 = sub_21FCE5320();
  v133 = *(_QWORD *)(v138 - 8);
  LOBYTE(v27) = MEMORY[0x24BDAC7A8]();
  v29 = (char *)v120 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0x8000000000000000) == 0)
  {
    v30 = *a1;
    v31 = *(_QWORD *)(*a1 + 16);
    if (v31 > a2 && (a3 & 0x8000000000000000) == 0 && v31 > a3)
    {
      v32 = (uint64_t *)(v30 + 32 + 16 * a2);
      v34 = *v32;
      v33 = v32[1];
      v127 = v30 + 32;
      v35 = (unint64_t *)(v30 + 32 + 16 * a3);
      v36 = *v35;
      v37 = v35[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v27 = sub_21FCCFF84(v36, v37, 0x10uLL);
      if ((v27 & 0x100000000) == 0 && (v27 & 0xFFFFF800) != 0xD800 && v27 <= 0x10FFFF)
      {
        v124 = v33;
        v125 = (_QWORD *)a9;
        v122 = v27;
        v123 = v34;
        v126 = v31;
        if ((a5 & 1) != 0)
        {
          v39 = (char *)MEMORY[0x24BEE4AF8];
        }
        else
        {
          v39 = (char *)MEMORY[0x24BEE4AF8];
          if ((a4 & 0x8000000000000000) == 0 && v31 > a4)
          {
            if (*(_QWORD *)(v30 + 16) <= (unint64_t)a4)
            {
              __break(1u);
              goto LABEL_137;
            }
            v40 = (uint64_t *)(v127 + 16 * a4);
            v42 = *v40;
            v41 = v40[1];
            v136 = v42;
            v137 = v41;
            v134 = 44;
            v135 = 0xE100000000000000;
            v128 = sub_21FCCFF3C();
            v43 = sub_21FCE5584();
            v44 = *(_QWORD *)(v43 + 16);
            if (v44)
            {
              v121 = v30;
              v134 = (uint64_t)v39;
              sub_21FCD8230(0, v44, 0);
              v120[1] = v43;
              v45 = (uint64_t *)(v43 + 40);
              do
              {
                v46 = *v45;
                v136 = *(v45 - 1);
                v137 = v46;
                swift_bridgeObjectRetain();
                sub_21FCE52E4();
                v47 = sub_21FCE5590();
                v49 = v48;
                (*(void (**)(char *, uint64_t))(v133 + 8))(v29, v138);
                swift_bridgeObjectRelease();
                v50 = (_QWORD *)v134;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  sub_21FCD8230(0, v50[2] + 1, 1);
                  v50 = (_QWORD *)v134;
                }
                v52 = v50[2];
                v51 = v50[3];
                if (v52 >= v51 >> 1)
                {
                  sub_21FCD8230((char *)(v51 > 1), v52 + 1, 1);
                  v50 = (_QWORD *)v134;
                }
                v45 += 2;
                v50[2] = v52 + 1;
                v53 = &v50[2 * v52];
                v53[4] = v47;
                v53[5] = v49;
                --v44;
              }
              while (v44);
              swift_bridgeObjectRelease();
              v30 = v121;
              v31 = v126;
            }
            else
            {
              swift_bridgeObjectRelease();
              v50 = (_QWORD *)MEMORY[0x24BEE4AF8];
            }
            v54 = v50[2];
            if (v54)
            {
              swift_bridgeObjectRetain();
              v55 = v50 + 5;
              v56 = (char *)MEMORY[0x24BEE4AF8];
              do
              {
                v57 = *(v55 - 1);
                v58 = *v55;
                swift_bridgeObjectRetain();
                v59 = sub_21FCCFF84(v57, v58, 0x10uLL);
                if ((v59 & 0x100000000) == 0)
                {
                  v60 = v59;
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    v56 = sub_21FCDEE2C(0, *((_QWORD *)v56 + 2) + 1, 1, v56);
                  v62 = *((_QWORD *)v56 + 2);
                  v61 = *((_QWORD *)v56 + 3);
                  if (v62 >= v61 >> 1)
                    v56 = sub_21FCDEE2C((char *)(v61 > 1), v62 + 1, 1, v56);
                  *((_QWORD *)v56 + 2) = v62 + 1;
                  *(_DWORD *)&v56[4 * v62 + 32] = v60;
                }
                v55 += 2;
                --v54;
              }
              while (v54);
              swift_bridgeObjectRelease();
              v31 = v126;
            }
            else
            {
              v56 = (char *)MEMORY[0x24BEE4AF8];
            }
            swift_bridgeObjectRelease();
            v63 = *((_QWORD *)v56 + 2);
            if (v63)
            {
              swift_bridgeObjectRetain();
              v64 = 0;
              v39 = (char *)MEMORY[0x24BEE4AF8];
              do
              {
                v65 = *(_DWORD *)&v56[4 * v64 + 32];
                if (v65 <= 0x10FFFF && (v65 & 0xFFFFF800) != 55296)
                {
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    v39 = sub_21FCDED34(0, *((_QWORD *)v39 + 2) + 1, 1, v39);
                  v68 = *((_QWORD *)v39 + 2);
                  v67 = *((_QWORD *)v39 + 3);
                  v69 = v39;
                  if (v68 >= v67 >> 1)
                    v69 = sub_21FCDED34((char *)(v67 > 1), v68 + 1, 1, v39);
                  *((_QWORD *)v69 + 2) = v68 + 1;
                  v39 = v69;
                  *(_DWORD *)&v69[4 * v68 + 32] = v65;
                }
                ++v64;
              }
              while (v63 != v64);
              swift_bridgeObjectRelease();
              v31 = v126;
            }
            else
            {
              v39 = (char *)MEMORY[0x24BEE4AF8];
            }
            LOBYTE(v27) = swift_bridgeObjectRelease();
          }
        }
        v128 = (unint64_t)v39;
        if ((v131 & 1) != 0)
        {
          v70 = MEMORY[0x24BEE4AF8];
        }
        else
        {
          v70 = MEMORY[0x24BEE4AF8];
          if ((v129 & 0x8000000000000000) == 0 && v31 > v129)
          {
            if (*(_QWORD *)(v30 + 16) > (unint64_t)v129)
            {
              v121 = v30;
              v71 = (uint64_t *)(v127 + 16 * v129);
              v73 = *v71;
              v72 = v71[1];
              v136 = v73;
              v137 = v72;
              v134 = 44;
              v135 = 0xE100000000000000;
              v131 = sub_21FCCFF3C();
              v74 = sub_21FCE5584();
              v75 = *(_QWORD *)(v74 + 16);
              if (v75)
              {
                v134 = v70;
                sub_21FCD8230(0, v75, 0);
                v129 = v74;
                v76 = (uint64_t *)(v74 + 40);
                do
                {
                  v77 = *v76;
                  v136 = *(v76 - 1);
                  v137 = v77;
                  swift_bridgeObjectRetain();
                  sub_21FCE52E4();
                  v78 = sub_21FCE5590();
                  v80 = v79;
                  (*(void (**)(char *, uint64_t))(v133 + 8))(v29, v138);
                  swift_bridgeObjectRelease();
                  v81 = (_QWORD *)v134;
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  {
                    sub_21FCD8230(0, v81[2] + 1, 1);
                    v81 = (_QWORD *)v134;
                  }
                  v83 = v81[2];
                  v82 = v81[3];
                  if (v83 >= v82 >> 1)
                  {
                    sub_21FCD8230((char *)(v82 > 1), v83 + 1, 1);
                    v81 = (_QWORD *)v134;
                  }
                  v76 += 2;
                  v81[2] = v83 + 1;
                  v84 = &v81[2 * v83];
                  v84[4] = v78;
                  v84[5] = v80;
                  --v75;
                }
                while (v75);
                swift_bridgeObjectRelease();
              }
              else
              {
                swift_bridgeObjectRelease();
                v81 = (_QWORD *)MEMORY[0x24BEE4AF8];
              }
              v85 = v81[2];
              if (v85)
              {
                v86 = v81 + 5;
                v70 = MEMORY[0x24BEE4AF8];
                do
                {
                  v91 = *(v86 - 1);
                  v90 = *v86;
                  v92 = HIBYTE(*v86) & 0xF;
                  if ((*v86 & 0x2000000000000000) == 0)
                    v92 = v91 & 0xFFFFFFFFFFFFLL;
                  if (v92)
                  {
                    swift_bridgeObjectRetain();
                    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                    v136 = v70;
                    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                    {
                      sub_21FCD8230(0, *(_QWORD *)(v70 + 16) + 1, 1);
                      v70 = v136;
                    }
                    v88 = *(_QWORD *)(v70 + 16);
                    v87 = *(_QWORD *)(v70 + 24);
                    if (v88 >= v87 >> 1)
                    {
                      sub_21FCD8230((char *)(v87 > 1), v88 + 1, 1);
                      v70 = v136;
                    }
                    *(_QWORD *)(v70 + 16) = v88 + 1;
                    v89 = v70 + 16 * v88;
                    *(_QWORD *)(v89 + 32) = v91;
                    *(_QWORD *)(v89 + 40) = v90;
                  }
                  v86 += 2;
                  --v85;
                }
                while (v85);
              }
              else
              {
                v70 = MEMORY[0x24BEE4AF8];
              }
              LOBYTE(v27) = swift_bridgeObjectRelease();
              v30 = v121;
              v31 = v126;
              goto LABEL_79;
            }
LABEL_137:
            __break(1u);
            goto LABEL_138;
          }
        }
LABEL_79:
        if ((a10 & 1) != 0 || v130 < 0 || v31 <= v130)
          goto LABEL_87;
        if (*(_QWORD *)(v30 + 16) > (unint64_t)v130)
        {
          v94 = (unint64_t *)(v127 + 16 * v130);
          v27 = *v94;
          if (*v94 == 1163219540 && v94[1] == 0xE400000000000000 || (LOBYTE(v27) = sub_21FCE5674(), (v27 & 1) != 0))
          {
            v95 = 3;
            goto LABEL_95;
          }
LABEL_87:
          if ((a12 & 1) == 0 && (a11 & 0x8000000000000000) == 0 && v31 > a11)
          {
            if (*(_QWORD *)(v30 + 16) <= (unint64_t)a11)
            {
LABEL_143:
              __break(1u);
              return v27;
            }
            v96 = (uint64_t *)(v127 + 16 * a11);
            v97 = *v96;
            v98 = v96[1];
            if (*v96 != 0x63696C627550 || v98 != 0xE600000000000000)
            {
              LOBYTE(v27) = sub_21FCE5674();
              if ((v27 & 1) == 0)
              {
                if (v97 == 0xD000000000000017 && v98 == 0x800000021FD2E610
                  || (LOBYTE(v27) = sub_21FCE5674(), (v27 & 1) != 0))
                {
                  v95 = 1;
                  goto LABEL_95;
                }
                if (v97 == 0x65746176697250 && v98 == 0xE700000000000000
                  || (LOBYTE(v27) = sub_21FCE5674(), (v27 & 1) != 0))
                {
                  v95 = 2;
                  goto LABEL_95;
                }
              }
            }
          }
          v95 = 0;
LABEL_95:
          if ((a14 & 1) != 0)
            goto LABEL_103;
          v99 = 0;
          v100 = 0;
          if (a13 < 0 || v31 <= a13)
            goto LABEL_104;
          if (*(_QWORD *)(v30 + 16) > (unint64_t)a13)
          {
            v101 = (uint64_t *)(v127 + 16 * a13);
            v99 = *v101;
            v100 = v101[1];
            v102 = HIBYTE(v100) & 0xF;
            if ((v100 & 0x2000000000000000) == 0)
              v102 = v99 & 0xFFFFFFFFFFFFLL;
            if (v102)
            {
              swift_bridgeObjectRetain();
LABEL_104:
              v103 = sub_21FCB8ABC(MEMORY[0x24BEE4AF8]);
              swift_bridgeObjectRetain();
              v104 = (_QWORD *)v103;
              v105 = v132;
              v106 = sub_21FCCEE34(v104, a15, v30);
              v138 = v105;
              v107 = v30;
              LOBYTE(v27) = swift_bridgeObjectRelease();
              if ((a17 & 1) != 0)
                goto LABEL_112;
              v108 = 0;
              v109 = 0;
              if ((a16 & 0x8000000000000000) != 0 || v126 <= (uint64_t)a16)
                goto LABEL_113;
              if (*(_QWORD *)(v107 + 16) > a16)
              {
                v110 = (uint64_t *)(v127 + 16 * a16);
                v108 = *v110;
                v109 = v110[1];
                v111 = HIBYTE(v109) & 0xF;
                if ((v109 & 0x2000000000000000) == 0)
                  v111 = v108 & 0xFFFFFFFFFFFFLL;
                if (v111)
                {
                  LOBYTE(v27) = swift_bridgeObjectRetain();
                  goto LABEL_113;
                }
LABEL_112:
                v108 = 0;
                v109 = 0;
LABEL_113:
                v112 = v95;
                v113 = 0;
                if ((a19 & 1) != 0 || (a18 & 0x8000000000000000) != 0 || v126 <= (uint64_t)a18)
                {
LABEL_121:
                  if ((a21 & 1) != 0)
                  {
                    v115 = 4;
                    goto LABEL_127;
                  }
                  v115 = 4;
                  if ((a20 & 0x8000000000000000) != 0 || v126 <= (uint64_t)a20)
                    goto LABEL_127;
                  if (*(_QWORD *)(v107 + 16) > a20)
                  {
                    v116._countAndFlagsBits = sub_21FCE54B8();
                    LOBYTE(v27) = RenderingMode.init(rawValue:)(v116);
                    v115 = v136;
LABEL_127:
                    v117 = v125;
                    v118 = v123;
                    *v125 = v122;
                    v117[1] = v118;
                    v117[2] = v124;
                    v117[3] = v113;
                    v117[4] = v99;
                    v117[5] = v100;
                    v117[6] = v128;
                    v117[7] = v70;
                    v117[8] = v112;
                    v117[9] = v108;
                    v117[10] = v109;
                    v117[11] = v115;
                    v117[12] = v106;
                    return v27;
                  }
                  goto LABEL_142;
                }
                if (*(_QWORD *)(v107 + 16) > a18)
                {
                  v114 = (unint64_t *)(v127 + 16 * a18);
                  v27 = *v114;
                  if (*v114 == 1163219540 && v114[1] == 0xE400000000000000)
                  {
                    v113 = 1;
                  }
                  else
                  {
                    LOBYTE(v27) = sub_21FCE5674();
                    v113 = v27 & 1;
                  }
                  goto LABEL_121;
                }
LABEL_141:
                __break(1u);
LABEL_142:
                __break(1u);
                goto LABEL_143;
              }
LABEL_140:
              __break(1u);
              goto LABEL_141;
            }
LABEL_103:
            v99 = 0;
            v100 = 0;
            goto LABEL_104;
          }
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
LABEL_138:
        __break(1u);
        goto LABEL_139;
      }
      LOBYTE(v27) = swift_bridgeObjectRelease();
    }
  }
  *(_QWORD *)(a9 + 96) = 0;
  *(_OWORD *)(a9 + 64) = 0u;
  *(_OWORD *)(a9 + 80) = 0u;
  *(_OWORD *)(a9 + 32) = 0u;
  *(_OWORD *)(a9 + 48) = 0u;
  *(_OWORD *)a9 = 0u;
  *(_OWORD *)(a9 + 16) = 0u;
  return v27;
}

uint64_t sub_21FCCE8F8(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  _QWORD *v24;
  char v26;
  int64_t v27;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v10 = v9 | (v4 << 6);
      goto LABEL_25;
    }
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v27)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      v4 = v11 + 1;
      if (v11 + 1 >= v27)
        return 1;
      v12 = *(_QWORD *)(v5 + 8 * v4);
      if (!v12)
      {
        v4 = v11 + 2;
        if (v11 + 2 >= v27)
          return 1;
        v12 = *(_QWORD *)(v5 + 8 * v4);
        if (!v12)
        {
          v4 = v11 + 3;
          if (v11 + 3 >= v27)
            return 1;
          v12 = *(_QWORD *)(v5 + 8 * v4);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v8 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_25:
    v14 = 16 * v10;
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + v14);
    v16 = *v15;
    v17 = v15[1];
    v18 = (uint64_t *)(*(_QWORD *)(v3 + 56) + v14);
    v20 = *v18;
    v19 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = sub_21FCB8BDC(v16, v17);
    v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    v24 = (_QWORD *)(*(_QWORD *)(a2 + 56) + 16 * v21);
    if (*v24 == v20 && v24[1] == v19)
    {
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v26 = sub_21FCE5674();
      result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
        return 0;
    }
  }
  v13 = v11 + 4;
  if (v13 >= v27)
    return 1;
  v12 = *(_QWORD *)(v5 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v27)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_24;
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t _s9SFSymbols18SystemSymbolCSVRowV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  _QWORD *v23;

  if (*(_DWORD *)a1 != *(_DWORD *)a2)
    return 0;
  v2 = *(unsigned __int8 *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v23 = *(_QWORD **)(a1 + 56);
  v22 = *(unsigned __int8 *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 80);
  v15 = *(_QWORD *)(a1 + 96);
  v6 = *(unsigned __int8 *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 48);
  v9 = *(_QWORD **)(a2 + 56);
  v11 = *(unsigned __int8 *)(a2 + 64);
  v18 = *(_QWORD *)(a2 + 72);
  v19 = *(_QWORD *)(a1 + 72);
  v20 = *(_QWORD *)(a2 + 80);
  v16 = *(unsigned __int8 *)(a2 + 88);
  v17 = *(unsigned __int8 *)(a1 + 88);
  v14 = *(_QWORD *)(a2 + 96);
  if (*(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8) && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
  {
    if (v2 != v6)
      return 0;
  }
  else if ((sub_21FCE5674() & 1) == 0 || ((v2 ^ v6) & 1) != 0)
  {
    return 0;
  }
  if (v3)
  {
    if (!v8 || (v4 != v7 || v3 != v8) && (sub_21FCE5674() & 1) == 0)
      return 0;
  }
  else if (v8)
  {
    return 0;
  }
  if (!sub_21FCDCCE8(v5, v10) || (sub_21FCDCD5C(v23, v9) & 1) == 0 || v22 != v11)
    return 0;
  if (v21)
  {
    if (!v20 || (v19 != v18 || v21 != v20) && (sub_21FCE5674() & 1) == 0)
      return 0;
LABEL_25:
    if (v17 == 4)
    {
      if (v16 != 4)
        return 0;
    }
    else
    {
      if (v16 == 4)
        return 0;
      sub_21FCCC868(v17);
      if ((v12 & 1) == 0)
        return 0;
    }
    return sub_21FCCE8F8(v15, v14);
  }
  if (!v20)
    goto LABEL_25;
  return 0;
}

uint64_t sub_21FCCED18(uint64_t result, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_21FCDEA00(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573078);
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_19;
  v12 = v4[2];
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_25;
  v15 = (char *)&v4[a2 + 4];
  if (v6 != a2 || &v4[v6 + 4] >= (_QWORD *)&v15[8 * v14])
    result = (uint64_t)memmove(&v4[v6 + 4], v15, 8 * v14);
  v16 = v4[2];
  v13 = __OFADD__(v16, v8);
  v17 = v16 - v7;
  if (!v13)
  {
    v4[2] = v17;
LABEL_19:
    *(_QWORD *)v2 = v4;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_21FCCEE34(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  char v24;
  unint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v3 = a3;
  v6 = a2 + 64;
  v7 = 1 << *(_BYTE *)(a2 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a2 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v40 = a3 + 32;
  swift_bridgeObjectRetain();
  v11 = 0;
  v39 = v3;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v11 << 6);
      goto LABEL_19;
    }
    v14 = __OFADD__(v11++, 1);
    if (v14)
    {
      __break(1u);
      goto LABEL_38;
    }
    if (v11 >= v10)
      goto LABEL_36;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    if (!v15)
      break;
LABEL_18:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v11 << 6);
LABEL_19:
    v17 = *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * v13);
    if ((v17 & 0x8000000000000000) == 0 && v17 < *(_QWORD *)(v3 + 16))
    {
      v18 = (uint64_t *)(*(_QWORD *)(a2 + 56) + 16 * v13);
      v20 = *v18;
      v19 = v18[1];
      v21 = (uint64_t *)(v40 + 16 * v17);
      v22 = v21[1];
      v42 = *v21;
      swift_bridgeObjectRetain_n();
      v43 = v22;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v41 = v20;
      v44 = v19;
      v25 = sub_21FCB8BDC(v20, v19);
      v26 = a1[2];
      v27 = (v24 & 1) == 0;
      v28 = v26 + v27;
      if (__OFADD__(v26, v27))
        goto LABEL_39;
      v29 = v24;
      if (a1[3] >= v28)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_21FCC4B50();
        v30 = v44;
        if ((v29 & 1) != 0)
          goto LABEL_34;
      }
      else
      {
        sub_21FCC2100(v28, isUniquelyReferenced_nonNull_native);
        v30 = v44;
        v31 = sub_21FCB8BDC(v41, v44);
        if ((v29 & 1) != (v32 & 1))
          goto LABEL_41;
        v25 = v31;
        if ((v29 & 1) != 0)
        {
LABEL_34:
          v37 = (_QWORD *)(a1[7] + 16 * v25);
          swift_bridgeObjectRelease();
          *v37 = v42;
          v37[1] = v43;
          goto LABEL_35;
        }
      }
      a1[(v25 >> 6) + 8] |= 1 << v25;
      v33 = (uint64_t *)(a1[6] + 16 * v25);
      *v33 = v41;
      v33[1] = v30;
      v34 = (_QWORD *)(a1[7] + 16 * v25);
      *v34 = v42;
      v34[1] = v43;
      v35 = a1[2];
      v14 = __OFADD__(v35, 1);
      v36 = v35 + 1;
      if (v14)
        goto LABEL_40;
      a1[2] = v36;
      swift_bridgeObjectRetain();
LABEL_35:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v3 = v39;
    }
  }
  v16 = v11 + 1;
  if (v11 + 1 >= v10)
    goto LABEL_36;
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
    goto LABEL_17;
  v16 = v11 + 2;
  if (v11 + 2 >= v10)
    goto LABEL_36;
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
    goto LABEL_17;
  v16 = v11 + 3;
  if (v11 + 3 >= v10)
    goto LABEL_36;
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
    goto LABEL_17;
  v16 = v11 + 4;
  if (v11 + 4 >= v10)
  {
LABEL_36:
    swift_release();
    return (uint64_t)a1;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
LABEL_17:
    v11 = v16;
    goto LABEL_18;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v10)
      goto LABEL_36;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_18;
  }
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  result = sub_21FCE56A4();
  __break(1u);
  return result;
}

uint64_t _s9SFSymbols18SystemSymbolCSVRowV6decode_22additionalColumnTitlesSayACG10Foundation4DataV_SaySSGtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  _QWORD *v30;
  char isUniquelyReferenced_nonNull_native;
  char v32;
  unint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  char v39;
  _QWORD *v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  char *v47;
  uint64_t result;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  int v54;
  char v55;
  char v56;
  uint64_t v57;
  char v58;
  unint64_t v59;
  unint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  char v63;
  char v64;
  char v65;
  char v66;
  char v67;
  char v68;
  char v69;
  char v70;
  char v71;
  char v72;
  char v73;
  char v74;
  int v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  char v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  __int128 v96;
  _QWORD v97[2];
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  __int128 v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;

  sub_21FCE54AC();
  MEMORY[0x24BDAC7A8]();
  sub_21FCE54A0();
  sub_21FCE5494();
  if (!v4)
    return MEMORY[0x24BEE4AF8];
  v5 = sub_21FCB9E40();
  swift_bridgeObjectRelease();
  v107 = v5;
  if (!v5[2])
  {
LABEL_46:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  v6 = (_QWORD *)v5[4];
  swift_bridgeObjectRetain();
  sub_21FCCED18(0, 1);
  v86 = sub_21FCCD68C((uint64_t)&unk_24E4D1590, v6);
  v8 = v7;
  swift_arrayDestroy();
  if ((v8 & 1) != 0
    || (v85 = sub_21FCCD68C((uint64_t)&unk_24E4D1480, v6), v10 = v9, swift_arrayDestroy(), (v10 & 1) != 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_46;
  }
  v84 = sub_21FCCDD70(0x6E6F6974636E7546, 0xE900000000000073, v6);
  v12 = v11;
  v83 = sub_21FCCDD70(0x7365646F63696E55, 0xE800000000000000, v6);
  v91 = v13;
  v82 = sub_21FCCDD70(0x4C20737365636341, 0xEC0000006C657665, v6);
  v89 = v14;
  v81 = sub_21FCCDD70(0x6E656469666E6F43, 0xEC0000006C616974, v6);
  v87 = v15;
  v80 = sub_21FCCD68C((uint64_t)&unk_24E4D14D0, v6);
  v69 = v16;
  swift_arrayDestroy();
  v79 = sub_21FCCD68C((uint64_t)&unk_24E4D1510, v6);
  v67 = v17;
  swift_arrayDestroy();
  v78 = sub_21FCCDD70(0xD000000000000011, 0x800000021FD2E5F0, v6);
  v65 = v18;
  v77 = sub_21FCCD68C((uint64_t)&unk_24E4D1550, v6);
  v63 = v19;
  swift_arrayDestroy();
  v20 = (_QWORD *)sub_21FCC9ECC(MEMORY[0x24BEE4AF8]);
  v95 = *(_QWORD *)(a3 + 16);
  if (!v95)
  {
LABEL_50:
    swift_bridgeObjectRelease();
    v49 = v107;
    v76 = v107[2];
    if (v76)
    {
      v75 = v12 & 1;
      v73 = v91 & 1;
      v72 = v89 & 1;
      v71 = v87 & 1;
      v70 = v69 & 1;
      v68 = v67 & 1;
      v66 = v65 & 1;
      v64 = v63 & 1;
      swift_bridgeObjectRetain();
      v50 = 0;
      v51 = 0;
      v47 = (char *)MEMORY[0x24BEE4AF8];
      v62 = v20;
      v61 = v107;
      do
      {
        v106 = v49[v50 + 4];
        swift_bridgeObjectRetain();
        sub_21FCCDE54(&v106, v86, v85, v83, v73, v84, v75, v81, (uint64_t)v97, v71, v82, v72, v80, v70, (uint64_t)v20, v79, v68, v77, v64,
          v78,
          v66);
        swift_bridgeObjectRelease();
        v53 = v98;
        if (v98)
        {
          v54 = v97[0];
          v55 = v99;
          v94 = v100;
          v92 = v101;
          v56 = v102;
          v96 = v103;
          v58 = v104;
          v57 = v105;
          v90 = v51;
          v88 = v97[1];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v47 = sub_21FCDEC18(0, *((_QWORD *)v47 + 2) + 1, 1, v47);
          v60 = *((_QWORD *)v47 + 2);
          v59 = *((_QWORD *)v47 + 3);
          if (v60 >= v59 >> 1)
            v47 = sub_21FCDEC18((char *)(v59 > 1), v60 + 1, 1, v47);
          *((_QWORD *)v47 + 2) = v60 + 1;
          v52 = &v47[104 * v60];
          *((_DWORD *)v52 + 8) = v54;
          *((_QWORD *)v52 + 5) = v88;
          *((_QWORD *)v52 + 6) = v53;
          v52[56] = v55 & 1;
          *((_OWORD *)v52 + 4) = v94;
          *((_OWORD *)v52 + 5) = v92;
          v52[96] = v56;
          *(_OWORD *)(v52 + 104) = v96;
          v52[120] = v58;
          *((_QWORD *)v52 + 16) = v57;
          v20 = v62;
          v49 = v61;
          v51 = v90;
        }
        ++v50;
      }
      while (v76 != v50);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v47 = (char *)MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    return (uint64_t)v47;
  }
  v74 = v12;
  v93 = a3 + 32;
  v21 = v6[2];
  swift_bridgeObjectRetain();
  v22 = 0;
  while (1)
  {
    if (!v21)
      goto LABEL_9;
    v24 = v6[2];
    if (!v24)
      break;
    v25 = (uint64_t *)(v93 + 16 * v22);
    v27 = *v25;
    v26 = v25[1];
    v28 = v6[4] == *v25 && v6[5] == v26;
    if (v28 || (sub_21FCE5674() & 1) != 0)
    {
      v29 = 0;
    }
    else
    {
      if (v21 == 1)
        goto LABEL_9;
      if (v24 < 2)
        goto LABEL_66;
      if ((v6[6] != v27 || v6[7] != v26) && (sub_21FCE5674() & 1) == 0)
      {
        v44 = v6 + 9;
        v45 = 2;
        while (v21 != v45)
        {
          if (v24 == v45)
            goto LABEL_65;
          if (*(v44 - 1) == v27 && *v44 == v26)
          {
            v29 = v45;
            goto LABEL_18;
          }
          v29 = v45++;
          v44 += 2;
          if ((sub_21FCE5674() & 1) != 0)
            goto LABEL_18;
        }
        goto LABEL_9;
      }
      v29 = 1;
    }
LABEL_18:
    swift_bridgeObjectRetain_n();
    v30 = v20;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v97[0] = v30;
    v33 = sub_21FCC0718(v29);
    v34 = v30[2];
    v35 = (v32 & 1) == 0;
    v36 = v34 + v35;
    if (__OFADD__(v34, v35))
      goto LABEL_63;
    v37 = v32;
    if (v30[3] >= v36)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v20 = (_QWORD *)v97[0];
        if ((v32 & 1) == 0)
          goto LABEL_25;
      }
      else
      {
        sub_21FCC5218();
        v20 = (_QWORD *)v97[0];
        if ((v37 & 1) == 0)
          goto LABEL_25;
      }
    }
    else
    {
      sub_21FCC2D70(v36, isUniquelyReferenced_nonNull_native);
      v38 = sub_21FCC0718(v29);
      if ((v37 & 1) != (v39 & 1))
        goto LABEL_67;
      v33 = v38;
      v20 = (_QWORD *)v97[0];
      if ((v37 & 1) == 0)
      {
LABEL_25:
        v20[(v33 >> 6) + 8] |= 1 << v33;
        *(_QWORD *)(v20[6] + 8 * v33) = v29;
        v40 = (_QWORD *)(v20[7] + 16 * v33);
        *v40 = v27;
        v40[1] = v26;
        v41 = v20[2];
        v42 = __OFADD__(v41, 1);
        v43 = v41 + 1;
        if (v42)
          goto LABEL_64;
        v20[2] = v43;
        goto LABEL_8;
      }
    }
    v23 = (_QWORD *)(v20[7] + 16 * v33);
    swift_bridgeObjectRelease();
    *v23 = v27;
    v23[1] = v26;
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_9:
    if (++v22 == v95)
    {
      swift_bridgeObjectRelease();
      v12 = v74;
      goto LABEL_50;
    }
  }
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  result = sub_21FCE56A4();
  __break(1u);
  return result;
}

unint64_t sub_21FCCF9DC()
{
  unint64_t result;

  result = qword_2555732F8;
  if (!qword_2555732F8)
  {
    result = MEMORY[0x2207D1938](&protocol conformance descriptor for AccessLevel, &type metadata for AccessLevel);
    atomic_store(result, (unint64_t *)&qword_2555732F8);
  }
  return result;
}

unint64_t sub_21FCCFA24()
{
  unint64_t result;

  result = qword_255573300;
  if (!qword_255573300)
  {
    result = MEMORY[0x2207D1938](&protocol conformance descriptor for RenderingMode, &type metadata for RenderingMode);
    atomic_store(result, (unint64_t *)&qword_255573300);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessLevel()
{
  return &type metadata for AccessLevel;
}

uint64_t _s9SFSymbols11AccessLevelOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s9SFSymbols11AccessLevelOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_21FCCFB5C + 4 * byte_21FCE6939[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21FCCFB90 + 4 * byte_21FCE6934[v4]))();
}

uint64_t sub_21FCCFB90(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FCCFB98(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FCCFBA0);
  return result;
}

uint64_t sub_21FCCFBAC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FCCFBB4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21FCCFBB8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FCCFBC0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RenderingMode()
{
  return &type metadata for RenderingMode;
}

uint64_t destroy for SystemSymbolCSVRow()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SystemSymbolCSVRow(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SystemSymbolCSVRow(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for SystemSymbolCSVRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v5 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemSymbolCSVRow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemSymbolCSVRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemSymbolCSVRow()
{
  return &type metadata for SystemSymbolCSVRow;
}

unint64_t sub_21FCCFF3C()
{
  unint64_t result;

  result = qword_255573308;
  if (!qword_255573308)
  {
    result = MEMORY[0x2207D1938](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255573308);
  }
  return result;
}

unint64_t sub_21FCCFF84(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  unint64_t v22;
  unsigned __int8 v23;
  BOOL v24;
  uint64_t v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unsigned __int8 *v29;
  unsigned int v30;
  char v31;
  unint64_t v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 *v37;
  unsigned int v38;
  char v39;
  unint64_t v40;
  unsigned __int8 v41;
  _QWORD v42[2];
  char v43;

  if (a3 - 37 < 0xFFFFFFFFFFFFFFDDLL)
  {
    __break(1u);
LABEL_76:
    swift_bridgeObjectRelease();
    v13 = 0;
    LOBYTE(v12) = 1;
LABEL_14:
    LOBYTE(v42[0]) = v12;
    return v13 | ((unint64_t)v12 << 32);
  }
  v4 = HIBYTE(a2) & 0xF;
  v5 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v6 = v4;
  else
    v6 = result & 0xFFFFFFFFFFFFLL;
  if (!v6)
    goto LABEL_76;
  if ((a2 & 0x1000000000000000) != 0)
  {
    v10 = sub_21FCDF61C(result, a2, a3);
    swift_bridgeObjectRelease();
    v12 = HIDWORD(v10) & 1;
LABEL_12:
    v13 = v10;
    if ((_DWORD)v12)
      v13 = 0;
    goto LABEL_14;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
      v8 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v8 = (unsigned __int8 *)sub_21FCE55E4();
    v9 = sub_21FCDF3F0(v8, v5, a3);
    LODWORD(v10) = (_DWORD)v9;
    v43 = BYTE4(v9) & 1;
    v11 = BYTE4(v9) & 1;
    goto LABEL_11;
  }
  v42[0] = result;
  v42[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (v4)
    {
      v25 = v4 - 1;
      if (v25)
      {
        v15 = 0;
        v26 = a3 + 48;
        v27 = a3 + 55;
        v28 = a3 + 87;
        if (a3 > 0xA)
        {
          v26 = 58;
        }
        else
        {
          v28 = 97;
          v27 = 65;
        }
        v29 = (unsigned __int8 *)v42 + 1;
        v11 = 1;
        do
        {
          v30 = *v29;
          if (v30 < 0x30 || v30 >= v26)
          {
            if (v30 < 0x41 || v30 >= v27)
            {
              LODWORD(v10) = 0;
              if (v30 < 0x61 || v30 >= v28)
                goto LABEL_11;
              v31 = -87;
            }
            else
            {
              v31 = -55;
            }
          }
          else
          {
            v31 = -48;
          }
          v32 = v15 * (unint64_t)a3;
          if ((v32 & 0xFFFFFFFF00000000) != 0)
            goto LABEL_74;
          v33 = v30 + v31;
          v24 = __CFADD__((_DWORD)v32, v33);
          v15 = v32 + v33;
          if (v24)
            goto LABEL_74;
          ++v29;
          --v25;
        }
        while (v25);
LABEL_73:
        v11 = 0;
        LODWORD(v10) = v15;
        goto LABEL_11;
      }
      goto LABEL_74;
    }
  }
  else
  {
    if (result != 45)
    {
      if (v4)
      {
        v15 = 0;
        v34 = a3 + 48;
        v35 = a3 + 55;
        v36 = a3 + 87;
        if (a3 > 0xA)
        {
          v34 = 58;
        }
        else
        {
          v36 = 97;
          v35 = 65;
        }
        v37 = (unsigned __int8 *)v42;
        v11 = 1;
        while (1)
        {
          v38 = *v37;
          if (v38 < 0x30 || v38 >= v34)
          {
            if (v38 < 0x41 || v38 >= v35)
            {
              LODWORD(v10) = 0;
              if (v38 < 0x61 || v38 >= v36)
                goto LABEL_11;
              v39 = -87;
            }
            else
            {
              v39 = -55;
            }
          }
          else
          {
            v39 = -48;
          }
          v40 = v15 * (unint64_t)a3;
          if ((v40 & 0xFFFFFFFF00000000) != 0)
            goto LABEL_74;
          v41 = v38 + v39;
          v24 = __CFADD__((_DWORD)v40, v41);
          v15 = v40 + v41;
          if (v24)
            goto LABEL_74;
          ++v37;
          if (!--v4)
            goto LABEL_73;
        }
      }
      goto LABEL_74;
    }
    if (v4)
    {
      v14 = v4 - 1;
      if (v14)
      {
        v15 = 0;
        v16 = a3 + 48;
        v17 = a3 + 55;
        v18 = a3 + 87;
        if (a3 > 0xA)
        {
          v16 = 58;
        }
        else
        {
          v18 = 97;
          v17 = 65;
        }
        v19 = (unsigned __int8 *)v42 + 1;
        v11 = 1;
        while (1)
        {
          v20 = *v19;
          if (v20 < 0x30 || v20 >= v16)
          {
            if (v20 < 0x41 || v20 >= v17)
            {
              LODWORD(v10) = 0;
              if (v20 < 0x61 || v20 >= v18)
                goto LABEL_11;
              v21 = -87;
            }
            else
            {
              v21 = -55;
            }
          }
          else
          {
            v21 = -48;
          }
          v22 = v15 * (unint64_t)a3;
          if ((v22 & 0xFFFFFFFF00000000) != 0)
            break;
          v23 = v20 + v21;
          v24 = v22 >= v23;
          v15 = v22 - v23;
          if (!v24)
            break;
          ++v19;
          if (!--v14)
            goto LABEL_73;
        }
      }
LABEL_74:
      LODWORD(v10) = 0;
      v11 = 1;
LABEL_11:
      swift_bridgeObjectRelease();
      LODWORD(v12) = v11 & 1;
      goto LABEL_12;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21FCD02C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  v0 = sub_21FCE5320();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v10 - v6;
  __swift_allocate_value_buffer(v5, qword_255575968);
  __swift_project_value_buffer(v0, (uint64_t)qword_255575968);
  sub_21FCE5308();
  sub_21FCE52FC();
  sub_21FCE5314();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  return ((uint64_t (*)(char *, uint64_t))v8)(v7, v0);
}

uint64_t sub_21FCD0398(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _OWORD *v25;
  char *v26;
  int EnumCaseMultiPayload;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  char *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  char v63;
  uint64_t result;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  unint64_t v73;
  char *v74;
  uint64_t v75;
  float v76;
  float v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  BOOL v86;
  uint64_t v87;
  _QWORD *v88;
  BOOL v89;
  _OWORD *v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  char v96;
  char v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  char v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  char *v109;
  float v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  char v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  float v127;
  uint64_t v128;
  float v129;
  _QWORD *v130;
  uint64_t v131;
  char *v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  char v144;
  char v145;
  uint64_t v146;
  _QWORD *v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  _QWORD *v156;
  uint64_t v157;
  uint64_t v158;
  BOOL v159;
  uint64_t v160;
  __int128 *v161;
  unint64_t v162;
  _OWORD *v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  char *v172;
  char *v173;
  uint64_t v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _OWORD v179[2];
  _OWORD v180[11];
  uint64_t v181;
  unint64_t v182;
  _OWORD v183[5];
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;

  v169 = a4;
  v171 = type metadata accessor for CustomSymbol();
  MEMORY[0x24BDAC7A8](v171);
  v170 = (uint64_t)&v160 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = 0;
  v8 = type metadata accessor for SymbolMetadata.Backing(0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v160 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v160 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v168 = (char *)&v160 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v160 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v160 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v160 - v24;
  v172 = (char *)a2;
  if (!*(_QWORD *)(a2 + 16) && !*((_QWORD *)a3 + 2))
    return 0;
  v173 = a3;
  v163 = v25;
  sub_21FCD1764(a1, (uint64_t)&v160 - v24);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v174 = v8;
  v164 = v11;
  v167 = v14;
  if (EnumCaseMultiPayload == 1)
  {
    sub_21FCD196C((uint64_t)v26, type metadata accessor for SymbolMetadata.Backing);
  }
  else
  {
    LODWORD(v166) = *(_DWORD *)v26;
    v28 = *((_QWORD *)v26 + 10);
    v161 = (__int128 *)*((_QWORD *)v26 + 5);
    v162 = v28;
    v29 = *(_OWORD *)(v26 + 216);
    v180[0] = *(_OWORD *)(v26 + 200);
    v180[1] = v29;
    v30 = *(_OWORD *)(v26 + 248);
    v180[2] = *(_OWORD *)(v26 + 232);
    v180[3] = v30;
    v31 = *(_OWORD *)(v26 + 152);
    v177 = *(_OWORD *)(v26 + 136);
    v178 = v31;
    v32 = *(_OWORD *)(v26 + 184);
    v179[0] = *(_OWORD *)(v26 + 168);
    v179[1] = v32;
    v33 = *(_OWORD *)(v26 + 120);
    v175 = *(_OWORD *)(v26 + 104);
    v176 = v33;
    sub_21FCD20A4(&v175);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (sub_21FCD3408(v166, (uint64_t)v173))
      return 80;
  }
  v166 = a1;
  sub_21FCD1764(a1, (uint64_t)v23);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v34 = v173;
    swift_bridgeObjectRetain();
    sub_21FCD196C((uint64_t)v23, type metadata accessor for SymbolMetadata.Backing);
    v35 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v35 = *((_QWORD *)v23 + 6);
    v36 = *(_OWORD *)(v23 + 216);
    v180[0] = *(_OWORD *)(v23 + 200);
    v180[1] = v36;
    v37 = *(_OWORD *)(v23 + 248);
    v180[2] = *(_OWORD *)(v23 + 232);
    v180[3] = v37;
    v38 = *(_OWORD *)(v23 + 152);
    v177 = *(_OWORD *)(v23 + 136);
    v178 = v38;
    v39 = *(_OWORD *)(v23 + 184);
    v179[0] = *(_OWORD *)(v23 + 168);
    v179[1] = v39;
    v40 = *(_OWORD *)(v23 + 120);
    v175 = *(_OWORD *)(v23 + 104);
    v176 = v40;
    v34 = v173;
    swift_bridgeObjectRetain();
    sub_21FCD20A4(&v175);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v41 = sub_21FCD17A8(v35, (uint64_t)v34);
  swift_bridgeObjectRelease();
  v42 = *(_QWORD *)(v41 + 16);
  swift_release();
  if (v42)
    return 80;
  v44 = v166;
  sub_21FCD1764(v166, (uint64_t)v20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v45 = (uint64_t)v20;
    v46 = v170;
    sub_21FCD1928(v45, v170);
    v47 = (uint64_t *)(v46 + *(int *)(v171 + 20));
    v49 = *v47;
    v48 = v47[1];
    swift_bridgeObjectRetain();
    sub_21FCD196C(v46, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
  }
  else
  {
    v49 = *((_QWORD *)v20 + 1);
    v48 = *((_QWORD *)v20 + 2);
    v50 = *(_OWORD *)(v20 + 216);
    v180[0] = *(_OWORD *)(v20 + 200);
    v180[1] = v50;
    v51 = *(_OWORD *)(v20 + 248);
    v180[2] = *(_OWORD *)(v20 + 232);
    v180[3] = v51;
    v52 = *(_OWORD *)(v20 + 152);
    v177 = *(_OWORD *)(v20 + 136);
    v178 = v52;
    v53 = *(_OWORD *)(v20 + 184);
    v179[0] = *(_OWORD *)(v20 + 168);
    v179[1] = v53;
    v54 = *(_OWORD *)(v20 + 120);
    v175 = *(_OWORD *)(v20 + 104);
    v176 = v54;
    sub_21FCD20A4(&v175);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)&v175 = v49;
  *((_QWORD *)&v175 + 1) = v48;
  *(_QWORD *)&v183[0] = 46;
  *((_QWORD *)&v183[0] + 1) = 0xE100000000000000;
  v162 = sub_21FCCFF3C();
  v173 = (char *)sub_21FCE5584();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v183[0] = 46;
  *((_QWORD *)&v183[0] + 1) = 0xE100000000000000;
  v55 = (uint64_t)v168;
  sub_21FCD1764(v44, (uint64_t)v168);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v56 = v170;
    sub_21FCD1928(v55, v170);
    swift_bridgeObjectRetain();
    sub_21FCD196C(v56, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
  }
  else
  {
    v57 = *(_OWORD *)(v55 + 216);
    v180[0] = *(_OWORD *)(v55 + 200);
    v180[1] = v57;
    v58 = *(_OWORD *)(v55 + 248);
    v180[2] = *(_OWORD *)(v55 + 232);
    v180[3] = v58;
    v59 = *(_OWORD *)(v55 + 152);
    v177 = *(_OWORD *)(v55 + 136);
    v178 = v59;
    v60 = *(_OWORD *)(v55 + 184);
    v179[0] = *(_OWORD *)(v55 + 168);
    v179[1] = v60;
    v61 = *(_OWORD *)(v55 + 120);
    v175 = *(_OWORD *)(v55 + 104);
    v176 = v61;
    sub_21FCD20A4(&v175);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_21FCE54DC();
  swift_bridgeObjectRelease();
  sub_21FCE54DC();
  v62 = v183[0];
  *(_QWORD *)&v175 = 46;
  *((_QWORD *)&v175 + 1) = 0xE100000000000000;
  *(_QWORD *)&v183[0] = v169;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573078);
  sub_21FCD19A8();
  sub_21FCE5464();
  swift_bridgeObjectRelease();
  sub_21FCE54DC();
  swift_bridgeObjectRelease();
  sub_21FCE54DC();
  if (v175 == v62)
  {
    v43 = 1000;
LABEL_20:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  v63 = sub_21FCE5674();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v63 & 1) != 0)
  {
    v43 = 1000;
LABEL_23:
    swift_bridgeObjectRelease();
    return v43;
  }
  v65 = v173;
  v66 = swift_bridgeObjectRetain();
  v67 = sub_21FCD8CDC(v66);
  swift_bridgeObjectRelease();
  v68 = (uint64_t)v172;
  v69 = sub_21FCD19F4(v67, (uint64_t)v172);
  swift_bridgeObjectRelease();
  if ((v69 & 1) != 0)
  {
    v70 = *(_QWORD *)(v68 + 16);
    v71 = *((_QWORD *)v65 + 2);
    v72 = v65;
    if (v71)
    {
      v174 = *(_QWORD *)(v68 + 16);
      v73 = 0;
      v74 = v65 + 32;
      v75 = v68 + 56;
      v76 = 0.0;
      v77 = 20.0;
      v65 = (char *)v68;
      do
      {
        if (v73 >= *((_QWORD *)v72 + 2))
        {
          __break(1u);
LABEL_120:
          __break(1u);
          goto LABEL_121;
        }
        if (*((_QWORD *)v65 + 2))
        {
          v78 = &v74[16 * v73];
          v80 = *(_QWORD *)v78;
          v79 = *((_QWORD *)v78 + 1);
          sub_21FCE56EC();
          swift_bridgeObjectRetain();
          sub_21FCE54D0();
          v81 = sub_21FCE5710();
          v82 = v65;
          v83 = -1 << v65[32];
          v44 = v81 & ~v83;
          if (((*(_QWORD *)(v75 + ((v44 >> 3) & 0xFFFFFFFFFFFFF8)) >> v44) & 1) != 0)
          {
            v84 = *((_QWORD *)v82 + 6);
            v85 = (_QWORD *)(v84 + 16 * v44);
            v86 = *v85 == v80 && v85[1] == v79;
            if (v86 || (sub_21FCE5674() & 1) != 0)
            {
LABEL_38:
              swift_bridgeObjectRelease();
              v76 = v77 + v76;
            }
            else
            {
              v87 = ~v83;
              while (1)
              {
                v44 = (v44 + 1) & v87;
                if (((*(_QWORD *)(v75 + ((v44 >> 3) & 0xFFFFFFFFFFFFF8)) >> v44) & 1) == 0)
                  break;
                v88 = (_QWORD *)(v84 + 16 * v44);
                v89 = *v88 == v80 && v88[1] == v79;
                if (v89 || (sub_21FCE5674() & 1) != 0)
                  goto LABEL_38;
              }
              swift_bridgeObjectRelease();
            }
            v65 = v172;
            v72 = v173;
          }
          else
          {
            swift_bridgeObjectRelease();
            v72 = v173;
            v65 = v82;
          }
        }
        ++v73;
        v77 = v77 * 0.9;
      }
      while (v73 != v71);
      swift_bridgeObjectRelease();
      v70 = v174;
    }
    else
    {
      swift_bridgeObjectRelease();
      v76 = 0.0;
    }
    v110 = roundf((float)((float)v70 / (float)v71) * v76);
    if ((~LODWORD(v110) & 0x7F800000) == 0)
      goto LABEL_122;
    if (v110 <= -9.2234e18)
    {
LABEL_123:
      __break(1u);
    }
    else if (v110 < 9.2234e18)
    {
      v43 = (uint64_t)v110 + 800;
      if (!__OFADD__((uint64_t)v110, 800))
        return v43;
      __break(1u);
      goto LABEL_63;
    }
    __break(1u);
    goto LABEL_125;
  }
  v90 = v163;
  sub_21FCD1764(v44, (uint64_t)v163);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v90, type metadata accessor for SymbolMetadata.Backing);
    v91 = MEMORY[0x24BEE4AF8];
    v65 = v172;
    goto LABEL_65;
  }
  v92 = *(_DWORD *)v90;
  v94 = *((_QWORD *)v90 + 1);
  v93 = *((_QWORD *)v90 + 2);
  v95 = *((_BYTE *)v90 + 24);
  v96 = *((_BYTE *)v90 + 64);
  v97 = *((_BYTE *)v90 + 88);
  v98 = *((_QWORD *)v90 + 12);
  v99 = *(_OWORD *)((char *)v90 + 216);
  v185 = *(_OWORD *)((char *)v90 + 200);
  v186 = v99;
  v100 = *(_OWORD *)((char *)v90 + 248);
  v187 = *(_OWORD *)((char *)v90 + 232);
  v188 = v100;
  v101 = *(_OWORD *)((char *)v90 + 152);
  v183[2] = *(_OWORD *)((char *)v90 + 136);
  v183[3] = v101;
  v102 = *(_OWORD *)((char *)v90 + 184);
  v183[4] = *(_OWORD *)((char *)v90 + 168);
  v184 = v102;
  v103 = *(_OWORD *)((char *)v90 + 120);
  v183[0] = *(_OWORD *)((char *)v90 + 104);
  v183[1] = v103;
  *(_OWORD *)((char *)&v180[6] + 8) = *(_OWORD *)((char *)v90 + 200);
  *(_OWORD *)((char *)&v180[7] + 8) = *(_OWORD *)((char *)v90 + 216);
  *(_OWORD *)((char *)&v180[8] + 8) = *(_OWORD *)((char *)v90 + 232);
  *(_OWORD *)((char *)&v180[9] + 8) = *(_OWORD *)((char *)v90 + 248);
  *(_OWORD *)((char *)&v180[2] + 8) = *(_OWORD *)((char *)v90 + 136);
  *(_OWORD *)((char *)&v180[3] + 8) = *(_OWORD *)((char *)v90 + 152);
  *(_OWORD *)((char *)&v180[4] + 8) = *(_OWORD *)((char *)v90 + 168);
  *(_OWORD *)((char *)&v180[5] + 8) = *(_OWORD *)((char *)v90 + 184);
  *(_OWORD *)((char *)v180 + 8) = *(_OWORD *)((char *)v90 + 104);
  *(_OWORD *)((char *)&v180[1] + 8) = *(_OWORD *)((char *)v90 + 120);
  LODWORD(v175) = v92;
  *((_QWORD *)&v175 + 1) = v94;
  *(_QWORD *)&v176 = v93;
  BYTE8(v176) = v95;
  v104 = v90[3];
  v177 = v90[2];
  v178 = v104;
  LOBYTE(v179[0]) = v96;
  *(_OWORD *)((char *)v179 + 8) = *(_OWORD *)((char *)v90 + 72);
  BYTE8(v179[1]) = v97;
  *(_QWORD *)&v180[0] = v98;
  v65 = v172;
  if (!*(_QWORD *)(v184 + 16))
    goto LABEL_64;
  swift_bridgeObjectRetain();
  sub_21FCB8BDC(v94, v93);
  if ((v105 & 1) == 0)
  {
LABEL_63:
    swift_bridgeObjectRelease();
LABEL_64:
    sub_21FCD21C8(&v175);
    v91 = MEMORY[0x24BEE4AF8];
LABEL_65:
    v168 = *(char **)(v91 + 16);
    if (!v168)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_77:
      v121 = SymbolMetadata.tags.getter();
      v122 = sub_21FCD1494(v121);
      swift_bridgeObjectRelease();
      v181 = MEMORY[0x24BEE4B08];
      v123 = *((_QWORD *)v122 + 2);
      if (v123)
      {
        swift_bridgeObjectRetain();
        v124 = (uint64_t *)(v122 + 40);
        do
        {
          v125 = *(v124 - 1);
          v126 = *v124;
          swift_bridgeObjectRetain_n();
          sub_21FCC568C((uint64_t *)&v175, v125, v126);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v124 += 2;
          --v123;
        }
        while (v123);
        swift_bridgeObjectRelease_n();
        v173 = (char *)v181;
      }
      else
      {
        swift_bridgeObjectRelease();
        v173 = (char *)MEMORY[0x24BEE4B08];
      }
      v43 = *(_QWORD *)(v169 + 16);
      v130 = v167;
      if (v43)
      {
        v172 = (char *)(v169 + 32);
        v163 = v167 + 104;
        v161 = (__int128 *)(v164 + 104);
        swift_bridgeObjectRetain_n();
        v131 = 0;
        while (1)
        {
          v132 = &v172[16 * v131];
          v133 = *(char **)v132;
          v134 = *((_QWORD *)v132 + 1);
          sub_21FCD1764(v44, (uint64_t)v130);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            v135 = v170;
            sub_21FCD1928((uint64_t)v130, v170);
            v136 = (uint64_t *)(v135 + *(int *)(v171 + 20));
            v138 = *v136;
            v137 = v136[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_21FCD196C(v135, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
          }
          else
          {
            v138 = v130[1];
            v137 = v130[2];
            v165 = v130[5];
            v168 = (char *)v130[10];
            v139 = v163[7];
            v180[0] = v163[6];
            v180[1] = v139;
            v140 = v163[9];
            v180[2] = v163[8];
            v180[3] = v140;
            v141 = v163[3];
            v177 = v163[2];
            v178 = v141;
            v142 = v163[5];
            v179[0] = v163[4];
            v179[1] = v142;
            v143 = v163[1];
            v175 = *v163;
            v176 = v143;
            swift_bridgeObjectRetain();
            sub_21FCD20A4(&v175);
            v130 = v167;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          *(_QWORD *)&v175 = v138;
          *((_QWORD *)&v175 + 1) = v137;
          v181 = (uint64_t)v133;
          v182 = v134;
          v144 = sub_21FCE559C();
          swift_bridgeObjectRelease();
          if ((v144 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            v44 = v166;
          }
          else
          {
            v145 = sub_21FCD32D4((uint64_t)v133, v134, (uint64_t)v173);
            v44 = v166;
            if ((v145 & 1) != 0)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              v146 = (uint64_t)v164;
              sub_21FCD1764(v166, (uint64_t)v164);
              if (swift_getEnumCaseMultiPayload() == 1)
              {
                sub_21FCD196C(v146, type metadata accessor for SymbolMetadata.Backing);
                v147 = (_QWORD *)MEMORY[0x24BEE4AF8];
              }
              else
              {
                v165 = *(_QWORD *)(v146 + 40);
                v147 = *(_QWORD **)(v146 + 56);
                v168 = v133;
                v148 = v161[7];
                v180[0] = v161[6];
                v180[1] = v148;
                v149 = v161[9];
                v180[2] = v161[8];
                v180[3] = v149;
                v150 = v161[3];
                v177 = v161[2];
                v178 = v150;
                v151 = v161[5];
                v179[0] = v161[4];
                v179[1] = v151;
                v152 = v161[1];
                v175 = *v161;
                v176 = v152;
                sub_21FCD20A4(&v175);
                v44 = v166;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v133 = v168;
                swift_bridgeObjectRelease();
              }
              v153 = v147[2];
              v130 = v167;
              if (!v153)
                goto LABEL_118;
              if (((char *)v147[4] != v133 || v147[5] != v134) && (sub_21FCE5674() & 1) == 0)
              {
                if (v153 == 1)
                {
LABEL_118:
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  v43 = 0;
                  goto LABEL_20;
                }
                v154 = (uint64_t)v147;
                v155 = v133;
                v168 = (char *)v154;
                v156 = (_QWORD *)(v154 + 56);
                v157 = 1;
                while (1)
                {
                  v158 = v157 + 1;
                  if (__OFADD__(v157, 1))
                    break;
                  v159 = (char *)*(v156 - 1) == v155 && *v156 == v134;
                  if (v159 || (sub_21FCE5674() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    v130 = v167;
                    goto LABEL_90;
                  }
                  v156 += 2;
                  ++v157;
                  if (v158 == v153)
                    goto LABEL_118;
                }
LABEL_121:
                __break(1u);
LABEL_122:
                __break(1u);
                goto LABEL_123;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
          }
LABEL_90:
          if (++v131 == v43)
            goto LABEL_20;
        }
      }
      goto LABEL_23;
    }
    v111 = 0;
    v163 = (_OWORD *)(v91 + 32);
    while (1)
    {
      if (v111 >= *(_QWORD *)(v91 + 16))
        goto LABEL_120;
      v112 = *((_QWORD *)&v163[3 * v111] + 1);
      *(_QWORD *)&v175 = *(_QWORD *)&v163[3 * v111];
      *((_QWORD *)&v175 + 1) = v112;
      v181 = 46;
      v182 = 0xE100000000000000;
      v113 = sub_21FCE5584();
      v114 = (char *)sub_21FCE5548();
      v181 = (uint64_t)v114;
      v115 = *(_QWORD *)(v113 + 16);
      if (v115)
      {
        v116 = (uint64_t *)(v113 + 40);
        do
        {
          v117 = *(v116 - 1);
          v118 = *v116;
          swift_bridgeObjectRetain();
          sub_21FCC568C((uint64_t *)&v175, v117, v118);
          swift_bridgeObjectRelease();
          v116 += 2;
          --v115;
        }
        while (v115);
        swift_bridgeObjectRelease();
        v119 = (char *)v181;
        v65 = v172;
      }
      else
      {
        v119 = v114;
        swift_bridgeObjectRelease();
      }
      v120 = sub_21FCD19F4((uint64_t)v119, (uint64_t)v65);
      swift_bridgeObjectRelease();
      if ((v120 & 1) != 0)
        break;
      if ((char *)++v111 == v168)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v44 = v166;
        goto LABEL_77;
      }
    }
    swift_bridgeObjectRelease();
    v127 = (float)*((uint64_t *)v65 + 2);
    v128 = *((_QWORD *)v173 + 2);
    swift_bridgeObjectRelease();
    v129 = roundf((float)(v127 / (float)v128) * 100.0);
    if ((~LODWORD(v129) & 0x7F800000) != 0)
    {
      if (v129 > -9.2234e18)
      {
        if (v129 < 9.2234e18)
        {
          v43 = (uint64_t)v129 + 700;
          if (!__OFADD__((uint64_t)v129, 700))
            return v43;
          goto LABEL_128;
        }
LABEL_127:
        __break(1u);
LABEL_128:
        __break(1u);
        goto LABEL_129;
      }
LABEL_126:
      __break(1u);
      goto LABEL_127;
    }
LABEL_125:
    __break(1u);
    goto LABEL_126;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v106 = swift_bridgeObjectRetain();
  v107 = (char *)sub_21FCE1DFC(v106);
  swift_bridgeObjectRelease();
  v181 = (uint64_t)v107;
  v108 = v165;
  sub_21FCE1D94((char **)&v181);
  if (!v108)
  {
    swift_bridgeObjectRelease();
    v109 = (char *)v181;
    sub_21FCD2344(v183);
    v91 = sub_21FCE2A78((uint64_t)v109, (uint64_t)v183);
    v165 = 0;
    sub_21FCD20A4(v183);
    swift_release();
    sub_21FCD21C8(&v175);
    goto LABEL_65;
  }
LABEL_129:
  result = swift_release();
  __break(1u);
  return result;
}

char *sub_21FCD1494(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *result;
  int64_t v5;
  char *v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;

  v1 = 1 << *(_BYTE *)(a1 + 32);
  v2 = -1;
  if (v1 < 64)
    v2 = ~(-1 << v1);
  v3 = v2 & *(_QWORD *)(a1 + 56);
  v21 = (unint64_t)(v1 + 63) >> 6;
  result = (char *)swift_bridgeObjectRetain();
  v5 = 0;
  v6 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v3)
    {
      v3 &= v3 - 1;
    }
    else
    {
      v7 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_44;
      if (v7 >= v21)
      {
LABEL_39:
        swift_release();
        return v6;
      }
      v8 = *(_QWORD *)(v20 + 8 * v7);
      ++v5;
      if (!v8)
      {
        v5 = v7 + 1;
        if (v7 + 1 >= v21)
          goto LABEL_39;
        v8 = *(_QWORD *)(v20 + 8 * v5);
        if (!v8)
        {
          v5 = v7 + 2;
          if (v7 + 2 >= v21)
            goto LABEL_39;
          v8 = *(_QWORD *)(v20 + 8 * v5);
          if (!v8)
          {
            v5 = v7 + 3;
            if (v7 + 3 >= v21)
              goto LABEL_39;
            v8 = *(_QWORD *)(v20 + 8 * v5);
            if (!v8)
            {
              v9 = v7 + 4;
              if (v9 >= v21)
                goto LABEL_39;
              v8 = *(_QWORD *)(v20 + 8 * v9);
              if (!v8)
              {
                while (1)
                {
                  v5 = v9 + 1;
                  if (__OFADD__(v9, 1))
                    goto LABEL_45;
                  if (v5 >= v21)
                    goto LABEL_39;
                  v8 = *(_QWORD *)(v20 + 8 * v5);
                  ++v9;
                  if (v8)
                    goto LABEL_23;
                }
              }
              v5 = v9;
            }
          }
        }
      }
LABEL_23:
      v3 = (v8 - 1) & v8;
    }
    v10 = qword_255573048;
    swift_bridgeObjectRetain();
    if (v10 != -1)
      swift_once();
    v11 = sub_21FCE5320();
    __swift_project_value_buffer(v11, (uint64_t)qword_255575968);
    sub_21FCCFF3C();
    v12 = sub_21FCE5578();
    result = (char *)swift_bridgeObjectRelease();
    v13 = *(_QWORD *)(v12 + 16);
    v14 = *((_QWORD *)v6 + 2);
    v15 = v14 + v13;
    if (__OFADD__(v14, v13))
      break;
    result = (char *)swift_isUniquelyReferenced_nonNull_native();
    if ((_DWORD)result && v15 <= *((_QWORD *)v6 + 3) >> 1)
    {
      if (!*(_QWORD *)(v12 + 16))
        goto LABEL_4;
    }
    else
    {
      if (v14 <= v15)
        v16 = v14 + v13;
      else
        v16 = v14;
      result = sub_21FCDE900(result, v16, 1, v6);
      v6 = result;
      if (!*(_QWORD *)(v12 + 16))
      {
LABEL_4:
        if (v13)
          goto LABEL_41;
        goto LABEL_5;
      }
    }
    if ((*((_QWORD *)v6 + 3) >> 1) - *((_QWORD *)v6 + 2) < v13)
      goto LABEL_42;
    result = (char *)swift_arrayInitWithCopy();
    if (v13)
    {
      v17 = *((_QWORD *)v6 + 2);
      v18 = __OFADD__(v17, v13);
      v19 = v17 + v13;
      if (v18)
        goto LABEL_43;
      *((_QWORD *)v6 + 2) = v19;
    }
LABEL_5:
    result = (char *)swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_21FCD1764(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SymbolMetadata.Backing(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FCD17A8(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_21FCD1CE4((_QWORD *)((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, v3, a2);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_21FCD1CE4((unint64_t *)v8, v5, v3, a2);
    swift_release();
    MEMORY[0x2207D19C8](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_21FCD1928(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CustomSymbol();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FCD196C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_21FCD19A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255573310;
  if (!qword_255573310)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255573078);
    result = MEMORY[0x2207D1938](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_255573310);
  }
  return result;
}

uint64_t sub_21FCD19F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  int64_t i;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (*(_QWORD *)(a1 + 16) < *(_QWORD *)(a2 + 16))
    return 0;
  v3 = a2;
  v4 = a1;
  v31 = a2 + 56;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  if (-v5 < 64)
    v6 = ~(-1 << -(char)v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(a2 + 56);
  v30 = (unint64_t)(63 - v5) >> 6;
  v32 = a1 + 56;
  result = swift_bridgeObjectRetain();
  for (i = 0; ; i = v12)
  {
    if (v7)
    {
      v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v11 = v10 | (i << 6);
      v12 = i;
      if (!*(_QWORD *)(v4 + 16))
        goto LABEL_40;
      goto LABEL_25;
    }
    v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v13 >= v30)
      goto LABEL_41;
    v14 = *(_QWORD *)(v31 + 8 * v13);
    v12 = i + 1;
    if (!v14)
    {
      v12 = i + 2;
      if (i + 2 >= v30)
        goto LABEL_41;
      v14 = *(_QWORD *)(v31 + 8 * v12);
      if (!v14)
      {
        v12 = i + 3;
        if (i + 3 >= v30)
          goto LABEL_41;
        v14 = *(_QWORD *)(v31 + 8 * v12);
        if (!v14)
          break;
      }
    }
LABEL_24:
    v7 = (v14 - 1) & v14;
    v11 = __clz(__rbit64(v14)) + (v12 << 6);
    if (!*(_QWORD *)(v4 + 16))
    {
LABEL_40:
      v2 = 0;
      goto LABEL_42;
    }
LABEL_25:
    v16 = v3;
    v17 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v11);
    v19 = *v17;
    v18 = v17[1];
    sub_21FCE56EC();
    swift_bridgeObjectRetain();
    sub_21FCE54D0();
    v20 = sub_21FCE5710();
    v21 = v4;
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = v20 & ~v22;
    if (((*(_QWORD *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
      goto LABEL_39;
    v24 = *(_QWORD *)(v21 + 48);
    v25 = (_QWORD *)(v24 + 16 * v23);
    v26 = *v25 == v19 && v25[1] == v18;
    if (!v26 && (sub_21FCE5674() & 1) == 0)
    {
      v27 = ~v22;
      while (1)
      {
        v23 = (v23 + 1) & v27;
        if (((*(_QWORD *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
          break;
        v28 = (_QWORD *)(v24 + 16 * v23);
        v29 = *v28 == v19 && v28[1] == v18;
        if (v29 || (sub_21FCE5674() & 1) != 0)
          goto LABEL_7;
      }
LABEL_39:
      swift_bridgeObjectRelease();
      v2 = 0;
LABEL_42:
      sub_21FCCB340();
      return v2;
    }
LABEL_7:
    result = swift_bridgeObjectRelease();
    v3 = v16;
    v4 = v21;
  }
  v15 = i + 4;
  if (i + 4 >= v30)
  {
LABEL_41:
    v2 = 1;
    goto LABEL_42;
  }
  v14 = *(_QWORD *)(v31 + 8 * v15);
  if (v14)
  {
    v12 = i + 4;
    goto LABEL_24;
  }
  while (1)
  {
    v12 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v12 >= v30)
      goto LABEL_41;
    v14 = *(_QWORD *)(v31 + 8 * v12);
    ++v15;
    if (v14)
      goto LABEL_24;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_21FCD1CE4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t i;
  unint64_t v21;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = 0;
  if (v6)
  {
    v8 = 0;
    v9 = a4 + 56;
    v10 = a3 + 32;
    do
    {
      v15 = *(_DWORD *)(v10 + 4 * v8);
      sub_21FCE56EC();
      sub_21FCE5704();
      v16 = sub_21FCE5710();
      v17 = -1 << *(_BYTE *)(a4 + 32);
      v18 = v16 & ~v17;
      v11 = v18 >> 6;
      v12 = 1 << v18;
      if (((1 << v18) & *(_QWORD *)(v9 + 8 * (v18 >> 6))) != 0)
      {
        v19 = *(_QWORD *)(a4 + 48);
        if (*(_DWORD *)(v19 + 4 * v18) == v15)
        {
LABEL_4:
          v13 = v11;
          v14 = a1[v11];
          a1[v13] = v12 | v14;
          if ((v12 & v14) == 0 && __OFADD__(v7++, 1))
          {
            __break(1u);
            break;
          }
        }
        else
        {
          for (i = v18 + 1; ; i = v21 + 1)
          {
            v21 = i & ~v17;
            if (((*(_QWORD *)(v9 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
              break;
            if (*(_DWORD *)(v19 + 4 * v21) == v15)
            {
              v11 = v21 >> 6;
              v12 = 1 << v21;
              goto LABEL_4;
            }
          }
        }
      }
      ++v8;
    }
    while (v8 != v6);
  }
  swift_retain();
  return sub_21FCD1E3C(a1, a2, v7, a4);
}

uint64_t sub_21FCD1E3C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t *v28;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573150);
  result = sub_21FCE55C0();
  v9 = result;
  v28 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = v28[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = v28[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v14);
    sub_21FCE56EC();
    sub_21FCE5704();
    result = sub_21FCE5710();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_DWORD *)(*(_QWORD *)(v9 + 48) + 4 * v22) = v18;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = v28[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = v28[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

_QWORD *sub_21FCD20A4(_QWORD *a1)
{
  uint64_t v2;
  void *v4;
  void *v5;

  v2 = a1[6];
  v4 = (void *)a1[16];
  v5 = (void *)a1[19];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21FCCB348(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_21FCD21C8(_QWORD *a1)
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = a1[19];
  v4 = (void *)a1[29];
  v5 = (void *)a1[32];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21FCCB348(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_21FCD2344(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v7;

  v2 = a1[6];
  v7 = (void *)a1[16];
  v3 = (void *)a1[19];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21FCD2464(v2);
  v4 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = v7;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21FCD2464(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_21FCD2474(unint64_t a1, unint64_t a2, char a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 *v39;
  uint64_t v40;
  unsigned __int8 *v41;
  int v42;
  unsigned __int8 v43;
  unsigned int v44;
  unsigned __int8 *v45;
  int v46;
  unsigned __int8 v47;
  unint64_t *v48;
  int v49;
  unsigned __int8 v50;
  uint64_t v52;
  unint64_t v54;
  uint64_t v55;

  v3 = a2;
  v4 = a1;
  v54 = a1;
  v55 = a2;
  if (qword_255573048 != -1)
    goto LABEL_97;
  while (1)
  {
    v5 = sub_21FCE5320();
    __swift_project_value_buffer(v5, (uint64_t)qword_255575968);
    sub_21FCCFF3C();
    v6 = sub_21FCE5578();
    v7 = *(_QWORD *)(v6 + 16);
    v8 = MEMORY[0x24BEE4AF8];
    if (v7)
    {
      v9 = (uint64_t *)(v6 + 40);
      do
      {
        v14 = *(v9 - 1);
        v13 = *v9;
        v15 = HIBYTE(*v9) & 0xF;
        if ((*v9 & 0x2000000000000000) == 0)
          v15 = v14 & 0xFFFFFFFFFFFFLL;
        if (v15)
        {
          swift_bridgeObjectRetain();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v54 = v8;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_21FCD8230(0, *(_QWORD *)(v8 + 16) + 1, 1);
            v8 = v54;
          }
          v11 = *(_QWORD *)(v8 + 16);
          v10 = *(_QWORD *)(v8 + 24);
          if (v11 >= v10 >> 1)
          {
            sub_21FCD8230((char *)(v10 > 1), v11 + 1, 1);
            v8 = v54;
          }
          *(_QWORD *)(v8 + 16) = v11 + 1;
          v12 = v8 + 16 * v11;
          *(_QWORD *)(v12 + 32) = v14;
          *(_QWORD *)(v12 + 40) = v13;
        }
        v9 += 2;
        --v7;
      }
      while (v7);
    }
    swift_bridgeObjectRelease();
    v17 = *(_QWORD *)(v8 + 16);
    if (v17)
    {
      v54 = MEMORY[0x24BEE4AF8];
      sub_21FCD8230(0, v17, 0);
      v18 = v54;
      v19 = v8 + 40;
      do
      {
        v20 = sub_21FCE54B8();
        v22 = v21;
        v54 = v18;
        v24 = *(_QWORD *)(v18 + 16);
        v23 = *(_QWORD *)(v18 + 24);
        if (v24 >= v23 >> 1)
        {
          sub_21FCD8230((char *)(v23 > 1), v24 + 1, 1);
          v18 = v54;
        }
        v19 += 16;
        *(_QWORD *)(v18 + 16) = v24 + 1;
        v25 = v18 + 16 * v24;
        *(_QWORD *)(v25 + 32) = v20;
        *(_QWORD *)(v25 + 40) = v22;
        --v17;
      }
      while (v17);
      swift_release();
      v26 = v18;
    }
    else
    {
      swift_release();
      v26 = MEMORY[0x24BEE4AF8];
    }
    v27 = swift_bridgeObjectRetain();
    v52 = sub_21FCD8CDC(v27);
    swift_bridgeObjectRelease();
    if ((v3 & 0x2000000000000000) != 0)
      v28 = HIBYTE(v3) & 0xF;
    else
      v28 = v4 & 0xFFFFFFFFFFFFLL;
    if (v28)
    {
      v29 = 0;
      do
      {
        if ((v3 & 0x1000000000000000) != 0)
        {
          v30 = sub_21FCE55CC();
        }
        else
        {
          if ((v3 & 0x2000000000000000) != 0)
          {
            v54 = v4;
            v55 = v3 & 0xFFFFFFFFFFFFFFLL;
          }
          else if ((v4 & 0x1000000000000000) == 0)
          {
            sub_21FCE55E4();
          }
          v30 = sub_21FCE55F0();
        }
        v29 += v31;
        sub_21FCC5838(&v54, v30);
      }
      while (v29 < v28);
    }
    swift_bridgeObjectRelease();
    if ((a3 & 1) == 0)
      return v52;
    v4 = *(_QWORD *)(v26 + 16);
    if (!v4)
      return v52;
    swift_bridgeObjectRetain();
    v32 = v26;
    v33 = 0;
    while (v33 < *(_QWORD *)(v32 + 16))
    {
      v34 = (unint64_t *)(v26 + 32 + 16 * v33);
      v3 = *v34;
      v35 = v34[1];
      v36 = HIBYTE(v35) & 0xF;
      v37 = v3 & 0xFFFFFFFFFFFFLL;
      if ((v35 & 0x2000000000000000) != 0)
        v38 = HIBYTE(v35) & 0xF;
      else
        v38 = v3 & 0xFFFFFFFFFFFFLL;
      if (!v38)
        goto LABEL_36;
      if ((v35 & 0x1000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        v3 = sub_21FCDF61C(v3, v35, 16);
        swift_bridgeObjectRelease();
        v32 = v26;
        v40 = v3;
        if ((v3 & 0x100000000) == 0)
          goto LABEL_85;
      }
      else
      {
        if ((v35 & 0x2000000000000000) == 0)
        {
          if ((v3 & 0x1000000000000000) != 0)
            v39 = (unsigned __int8 *)((v35 & 0xFFFFFFFFFFFFFFFLL) + 32);
          else
            v39 = (unsigned __int8 *)sub_21FCE55E4();
          v40 = (uint64_t)sub_21FCDF3F0(v39, v37, 16);
          v32 = v26;
          if ((v40 & 0x100000000) != 0)
            goto LABEL_36;
          goto LABEL_85;
        }
        v54 = v3;
        v55 = v35 & 0xFFFFFFFFFFFFFFLL;
        if (v3 == 43)
        {
          if (!v36)
            goto LABEL_96;
          if (--v36)
          {
            LODWORD(v40) = 0;
            v45 = (unsigned __int8 *)&v54 + 1;
            while (1)
            {
              v46 = *v45;
              v47 = v46 - 48;
              if ((v46 - 48) >= 0xA)
              {
                if ((v46 - 65) < 6)
                {
                  v47 = v46 - 55;
                }
                else
                {
                  if ((v46 - 97) > 5)
                    goto LABEL_83;
                  v47 = v46 - 87;
                }
              }
              if (v40 >> 28)
                goto LABEL_83;
              v40 = 16 * (_DWORD)v40 + v47;
              ++v45;
              if (!--v36)
                goto LABEL_84;
            }
          }
        }
        else if (v3 == 45)
        {
          if (!v36)
            goto LABEL_95;
          if (--v36)
          {
            LODWORD(v40) = 0;
            v41 = (unsigned __int8 *)&v54 + 1;
            while (1)
            {
              v42 = *v41;
              v43 = v42 - 48;
              if ((v42 - 48) >= 0xA)
              {
                if ((v42 - 65) < 6)
                {
                  v43 = v42 - 55;
                }
                else
                {
                  if ((v42 - 97) > 5)
                    goto LABEL_83;
                  v43 = v42 - 87;
                }
              }
              if (v40 >> 28)
                goto LABEL_83;
              v44 = 16 * v40;
              v40 = 16 * (_DWORD)v40 - v43;
              if (v44 < v43)
                goto LABEL_83;
              ++v41;
              if (!--v36)
                goto LABEL_84;
            }
          }
        }
        else if (v36)
        {
          LODWORD(v40) = 0;
          v48 = &v54;
          while (1)
          {
            v49 = *(unsigned __int8 *)v48;
            v50 = v49 - 48;
            if ((v49 - 48) >= 0xA)
            {
              if ((v49 - 65) < 6)
              {
                v50 = v49 - 55;
              }
              else
              {
                if ((v49 - 97) > 5)
                  break;
                v50 = v49 - 87;
              }
            }
            if (v40 >> 28)
              break;
            v40 = 16 * (_DWORD)v40 + v50;
            v48 = (unint64_t *)((char *)v48 + 1);
            if (!--v36)
              goto LABEL_84;
          }
LABEL_83:
          v40 = 0;
          LOBYTE(v36) = 1;
LABEL_84:
          if ((v36 & 1) != 0)
            goto LABEL_36;
LABEL_85:
          if (WORD1(v40) <= 0x10u && (v40 & 0xFFFFF800) != 0xD800)
          {
            sub_21FCC5838(&v54, v40);
            v32 = v26;
          }
        }
      }
LABEL_36:
      if (++v33 == v4)
      {
        swift_bridgeObjectRelease();
        return v52;
      }
    }
    __break(1u);
LABEL_95:
    __break(1u);
LABEL_96:
    __break(1u);
LABEL_97:
    swift_once();
  }
}

uint64_t sub_21FCD29F0(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(char *), uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  NSString *v16;
  void *v17;
  void (*v18)(char *, uint64_t);
  id v19;
  id v20;
  uint64_t (*v21)(uint64_t, unint64_t);
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v36;
  uint64_t v37;
  id v38;
  void *v39;
  unsigned __int8 v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void (*v47)(char *);
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  id v54[2];

  v46 = a5;
  v47 = a4;
  v52 = a2;
  v53 = a3;
  v51 = a1;
  v54[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = sub_21FCE53E0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v44 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v44 - v13;
  v45 = (id)objc_opt_self();
  v15 = objc_msgSend(v45, sel_defaultManager);
  v16 = NSTemporaryDirectory();
  sub_21FCE5488();

  sub_21FCE5398();
  swift_bridgeObjectRelease();
  v17 = (void *)sub_21FCE53A4();
  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v50 = v5;
  v18(v12, v5);
  v54[0] = 0;
  v19 = objc_msgSend(v15, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 99, 1, v17, 1, v54);

  v20 = v54[0];
  if (v19)
  {
    sub_21FCE53D4();

    v48 = v14;
    sub_21FCE53B0();
    v21 = *(uint64_t (**)(uint64_t, unint64_t))(v51 + 16);
    swift_retain();
    v22 = v52;
    v23 = v53;
    v24 = v49;
    v25 = v21(v52, v53);
    if (v24)
    {
      swift_release();
      v31 = v48;
      v32 = v50;
      v18(v9, v50);
      v33 = v31;
      v34 = v32;
    }
    else
    {
      v28 = v25;
      v29 = v26;
      v30 = swift_release();
      MEMORY[0x24BDAC7A8](v30);
      *(&v44 - 4) = v28;
      *(&v44 - 3) = v29;
      *(&v44 - 2) = (uint64_t)v9;
      sub_21FCD2D9C((void (*)(char *))sub_21FCD3280, (uint64_t)(&v44 - 6));
      sub_21FCCB3E0(v28, v29);
      v47(v9);
      v36 = v9;
      v37 = v50;
      v18(v36, v50);
      v38 = objc_msgSend(v45, sel_defaultManager);
      v39 = (void *)sub_21FCE53A4();
      v54[0] = 0;
      v40 = objc_msgSend(v38, sel_removeItemAtURL_error_, v39, v54);

      if ((v40 & 1) != 0)
      {
        v41 = v54[0];
      }
      else
      {
        v42 = v54[0];
        v43 = (void *)sub_21FCE538C();

        swift_willThrow();
      }
      v33 = v48;
      v34 = v37;
    }
    v18(v33, v34);
    swift_release();
  }
  else
  {
    v27 = v20;
    sub_21FCE538C();

    swift_willThrow();
    swift_release();
    v22 = v52;
    v23 = v53;
  }
  return sub_21FCCB3E0(v22, v23);
}

uint64_t sub_21FCD2D9C(void (*a1)(char *), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  NSString *v11;
  void *v12;
  void (*v13)(char *, uint64_t);
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  id v23;
  void *v24;
  _QWORD v25[2];
  void (*v26)(char *);
  uint64_t v27;
  id v28[2];

  v26 = a1;
  v25[1] = a2;
  v28[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_21FCE53E0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v25 - v7;
  v9 = (void *)objc_opt_self();
  v10 = objc_msgSend(v9, sel_defaultManager);
  v11 = NSTemporaryDirectory();
  sub_21FCE5488();

  sub_21FCE5398();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_21FCE53A4();
  v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  v13(v6, v2);
  v28[0] = 0;
  v14 = objc_msgSend(v10, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 99, 1, v12, 1, v28);

  v15 = v28[0];
  if (v14)
  {
    sub_21FCE53D4();

    v16 = v27;
    v26(v8);
    if (!v16)
    {
      v17 = objc_msgSend(v9, sel_defaultManager);
      v18 = (void *)sub_21FCE53A4();
      v28[0] = 0;
      v19 = objc_msgSend(v17, sel_removeItemAtURL_error_, v18, v28);

      if ((v19 & 1) != 0)
      {
        v20 = v28[0];
      }
      else
      {
        v23 = v28[0];
        v24 = (void *)sub_21FCE538C();

        swift_willThrow();
      }
    }
    return ((uint64_t (*)(char *, uint64_t))v13)(v8, v2);
  }
  else
  {
    v21 = v15;
    sub_21FCE538C();

    return swift_willThrow();
  }
}

uint64_t type metadata accessor for DirectoryCompressor()
{
  return objc_opt_self();
}

uint64_t sub_21FCD3028(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  sub_21FCCB47C(a1, a2);
  sub_21FCDCFAC(1, a1, a2);
  v5 = v4;
  v7 = v6;
  sub_21FCCB3E0(a1, a2);
  if (v7 >> 60 == 15)
    return 0;
  else
    return v5;
}

uint64_t sub_21FCD309C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t (*v9)(char *, uint64_t);
  id v10;
  id v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = sub_21FCE53E0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCE53BC();
  sub_21FCE541C();
  if (!v0)
  {
    v5 = (void *)objc_opt_self();
    v6 = (void *)sub_21FCE53A4();
    v7 = (void *)sub_21FCE53A4();
    v13[0] = 0;
    v8 = objc_msgSend(v5, sel_decompressDataAtURL_toURL_error_, v6, v7, v13);

    if ((v8 & 1) != 0)
    {
      v9 = *(uint64_t (**)(char *, uint64_t))(v2 + 8);
      v10 = v13[0];
      return v9(v4, v1);
    }
    v12 = v13[0];
    sub_21FCE538C();

    swift_willThrow();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_21FCD323C()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DirectoryDecompressor()
{
  return objc_opt_self();
}

uint64_t sub_21FCD3280()
{
  return sub_21FCD309C();
}

double SymbolMetadataStore.availability(forSystemName:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4[2];

  v4[0] = 1701667182;
  v4[1] = 0xE400000000000000;
  return sub_21FCD5B0C(v4, a1, a2, a3);
}

uint64_t sub_21FCD32D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_21FCE56EC();
    sub_21FCE54D0();
    v6 = sub_21FCE5710();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_21FCE5674() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_21FCE5674() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

BOOL sub_21FCD3408(int a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  int v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  sub_21FCE56EC();
  sub_21FCE5704();
  v4 = sub_21FCE5710();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_DWORD *)(v8 + 4 * v6) == a1)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(_DWORD *)(v8 + 4 * v11);
    result = v12 == a1;
    if (v12 == a1)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_21FCD34F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  int EnumCaseMultiPayload;
  uint64_t v25;
  _DWORD *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  _DWORD *v39;
  uint64_t v40;
  char v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  int v45;
  int v46;
  BOOL v47;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573138);
  MEMORY[0x24BDAC7A8](v58);
  v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21FCE5440();
  v53 = *(_QWORD *)(v6 - 8);
  v54 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v50 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v49 - v9;
  v11 = type metadata accessor for SymbolKey(0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (_DWORD *)((char *)&v49 - v16);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v49 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v49 - v22;
  if (*(_QWORD *)(a2 + 16))
  {
    v56 = v21;
    sub_21FCE56EC();
    sub_21FCCB230(a1, (uint64_t)v23, type metadata accessor for SymbolKey);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v57 = a1;
    if (EnumCaseMultiPayload == 1)
    {
      v25 = v53;
      v26 = v17;
      v27 = v14;
      v28 = v54;
      (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v10, v23, v54);
      sub_21FCE56F8();
      sub_21FCDB568(&qword_255573140, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_21FCE5458();
      v29 = v28;
      v14 = v27;
      v17 = v26;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v29);
    }
    else
    {
      sub_21FCE56F8();
      sub_21FCE5704();
    }
    v30 = sub_21FCE5710();
    v31 = -1 << *(_BYTE *)(a2 + 32);
    v32 = v30 & ~v31;
    v51 = a2 + 56;
    if (((*(_QWORD *)(a2 + 56 + ((v32 >> 3) & 0xFFFFFFFFFFFFF8)) >> v32) & 1) != 0)
    {
      v55 = ~v31;
      v56 = *(_QWORD *)(v56 + 72);
      v52 = a2;
      v33 = v51;
      v49 = v20;
      do
      {
        sub_21FCCB230(*(_QWORD *)(a2 + 48) + v56 * v32, (uint64_t)v20, type metadata accessor for SymbolKey);
        v34 = &v5[*(int *)(v58 + 48)];
        sub_21FCCB230((uint64_t)v20, (uint64_t)v5, type metadata accessor for SymbolKey);
        sub_21FCCB230(v57, (uint64_t)v34, type metadata accessor for SymbolKey);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_21FCCB230((uint64_t)v5, (uint64_t)v14, type metadata accessor for SymbolKey);
          if (swift_getEnumCaseMultiPayload() != 1)
          {
            (*(void (**)(char *, uint64_t))(v53 + 8))(v14, v54);
LABEL_8:
            sub_21FCDC0F4((uint64_t)v5, &qword_255573138);
            goto LABEL_9;
          }
          v35 = v53;
          v36 = v14;
          v37 = v50;
          v38 = v11;
          v39 = v17;
          v40 = v54;
          (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v50, v34, v54);
          v41 = sub_21FCE5434();
          v42 = *(void (**)(char *, uint64_t))(v35 + 8);
          v43 = v37;
          v14 = v36;
          v33 = v51;
          v42(v43, v40);
          v44 = v40;
          v17 = v39;
          v11 = v38;
          v20 = v49;
          v42(v14, v44);
          a2 = v52;
          sub_21FCD196C((uint64_t)v5, type metadata accessor for SymbolKey);
          if ((v41 & 1) != 0)
            goto LABEL_17;
        }
        else
        {
          sub_21FCCB230((uint64_t)v5, (uint64_t)v17, type metadata accessor for SymbolKey);
          if (swift_getEnumCaseMultiPayload() == 1)
            goto LABEL_8;
          v45 = *v17;
          v46 = *(_DWORD *)v34;
          sub_21FCD196C((uint64_t)v5, type metadata accessor for SymbolKey);
          v47 = v45 == v46;
          a2 = v52;
          if (v47)
          {
LABEL_17:
            sub_21FCD196C((uint64_t)v20, type metadata accessor for SymbolKey);
            return 1;
          }
        }
LABEL_9:
        sub_21FCD196C((uint64_t)v20, type metadata accessor for SymbolKey);
        v32 = (v32 + 1) & v55;
      }
      while (((*(_QWORD *)(v33 + ((v32 >> 3) & 0xFFFFFFFFFFFFF8)) >> v32) & 1) != 0);
    }
  }
  return 0;
}

uint64_t SymbolKey.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(_QWORD);
  uint64_t v10;

  v1 = sub_21FCE5440();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for SymbolKey(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCCB230(v0, (uint64_t)v7, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_21FCE56F8();
    sub_21FCDB568(&qword_255573140, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_21FCE5458();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    sub_21FCE56F8();
    return sub_21FCE5704();
  }
}

uint64_t SymbolKey.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v1 = v0;
  v2 = sub_21FCE5440();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SymbolKey(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCE56EC();
  sub_21FCCB230(v1, (uint64_t)v8, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_21FCE56F8();
    sub_21FCDB568(&qword_255573140, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_21FCE5458();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_21FCE56F8();
    sub_21FCE5704();
  }
  return sub_21FCE5710();
}

uint64_t sub_21FCD3BF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v1 = sub_21FCE5440();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCCB230(v0, (uint64_t)v7, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v7, v1);
    sub_21FCE56F8();
    sub_21FCDB568(&qword_255573140, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_21FCE5458();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  else
  {
    sub_21FCE56F8();
    return sub_21FCE5704();
  }
}

uint64_t sub_21FCD3D38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v1 = v0;
  v2 = sub_21FCE5440();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCE56EC();
  sub_21FCCB230(v1, (uint64_t)v8, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_21FCE56F8();
    sub_21FCDB568(&qword_255573140, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_21FCE5458();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    sub_21FCE56F8();
    sub_21FCE5704();
  }
  return sub_21FCE5710();
}

double sub_21FCD3E9C()
{
  return sub_21FCD3EA8(&xmmword_255573318);
}

double sub_21FCD3EA8@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  void *v12;
  void *v13;
  id v14;
  void (*v15)(_BYTE *, _BYTE *, uint64_t);
  uint64_t inited;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  double result;
  __int128 v22;
  _BYTE v23[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573430);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v23[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_21FCE53E0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v11 = &v23[-v10];
  v24 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v25 = MEMORY[0x24BEE4B00];
  *((_QWORD *)&v25 + 1) = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v26 = MEMORY[0x24BEE4B00];
  *((_QWORD *)&v26 + 1) = MEMORY[0x24BEE4B00];
  v27 = 0uLL;
  v28 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v29 = MEMORY[0x24BEE4B00];
  *((_QWORD *)&v29 + 1) = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v30 = MEMORY[0x24BEE4B00];
  *((_QWORD *)&v30 + 1) = MEMORY[0x24BEE4B00];
  v31 = MEMORY[0x24BEE4AF8];
  v32 = 0u;
  v33 = 0u;
  if (qword_255573040 != -1)
    swift_once();
  v12 = (void *)qword_255575960;
  v13 = (void *)sub_21FCE547C();
  v14 = objc_msgSend(v12, sel_URLForResource_withExtension_, v13, 0);

  if (!v14)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_7;
  }
  sub_21FCE53D4();

  v15 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 32);
  v15(v4, v9, v5);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_7:
    sub_21FCDC0F4((uint64_t)v4, &qword_255573430);
    goto LABEL_8;
  }
  v15(v11, v4, v5);
  type metadata accessor for DirectoryDecompressor();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = sub_21FCD3028;
  *(_QWORD *)(inited + 24) = 0;
  sub_21FCBAD40((uint64_t)v11, inited);
  swift_setDeallocating();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v5);
LABEL_8:
  v17 = v31;
  a1[6] = v30;
  a1[7] = v17;
  v18 = v33;
  a1[8] = v32;
  a1[9] = v18;
  v19 = v27;
  a1[2] = v26;
  a1[3] = v19;
  v20 = v29;
  a1[4] = v28;
  a1[5] = v20;
  result = *(double *)&v24;
  v22 = v25;
  *a1 = v24;
  a1[1] = v22;
  return result;
}

double SymbolMetadataStore.init()@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  v1 = MEMORY[0x24BEE4AF8];
  v2 = MEMORY[0x24BEE4B00];
  *(_QWORD *)a1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v2;
  *(_QWORD *)(a1 + 24) = v2;
  *(_QWORD *)(a1 + 32) = v2;
  *(_QWORD *)(a1 + 40) = v2;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = v1;
  *(_QWORD *)(a1 + 72) = v2;
  *(_QWORD *)(a1 + 80) = v2;
  *(_QWORD *)(a1 + 88) = v2;
  *(_QWORD *)(a1 + 96) = v2;
  *(_QWORD *)(a1 + 104) = v2;
  *(_QWORD *)(a1 + 112) = v1;
  *(_QWORD *)(a1 + 120) = v2;
  result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  return result;
}

_QWORD *static SymbolMetadataStore.system.getter@<X0>(__int128 *a1@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v12[10];

  if (qword_255573050 != -1)
    swift_once();
  swift_beginAccess();
  v2 = xmmword_255573368;
  v12[6] = xmmword_255573378;
  v3 = xmmword_255573388;
  v12[7] = xmmword_255573388;
  v12[8] = xmmword_255573398;
  v4 = xmmword_255573398;
  v12[9] = xmmword_2555733A8;
  v5 = xmmword_255573338;
  v6 = xmmword_255573328;
  v12[2] = xmmword_255573338;
  v12[3] = xmmword_255573348;
  v7 = xmmword_255573348;
  v8 = xmmword_255573358;
  v12[4] = xmmword_255573358;
  v12[5] = xmmword_255573368;
  v12[0] = xmmword_255573318;
  v9 = xmmword_255573318;
  v12[1] = xmmword_255573328;
  a1[6] = xmmword_255573378;
  a1[7] = v3;
  v10 = xmmword_2555733A8;
  a1[8] = v4;
  a1[9] = v10;
  a1[2] = v5;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v2;
  *a1 = v9;
  a1[1] = v6;
  return sub_21FCD2344(v12);
}

_QWORD *static SymbolMetadataStore.system.setter(__int128 *a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[10];

  if (qword_255573050 != -1)
    swift_once();
  swift_beginAccess();
  v8[7] = xmmword_255573388;
  v8[8] = xmmword_255573398;
  v8[9] = xmmword_2555733A8;
  v8[2] = xmmword_255573338;
  v8[3] = xmmword_255573348;
  v8[4] = xmmword_255573358;
  v8[5] = xmmword_255573368;
  v8[6] = xmmword_255573378;
  v8[0] = xmmword_255573318;
  v8[1] = xmmword_255573328;
  v2 = a1[7];
  xmmword_255573378 = a1[6];
  xmmword_255573388 = v2;
  v3 = a1[9];
  xmmword_255573398 = a1[8];
  xmmword_2555733A8 = v3;
  v4 = a1[3];
  xmmword_255573338 = a1[2];
  xmmword_255573348 = v4;
  v5 = a1[5];
  xmmword_255573358 = a1[4];
  xmmword_255573368 = v5;
  v6 = a1[1];
  xmmword_255573318 = *a1;
  xmmword_255573328 = v6;
  return sub_21FCD20A4(v8);
}

uint64_t (*static SymbolMetadataStore.system.modify())()
{
  if (qword_255573050 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

size_t sub_21FCD43A8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t v24;
  unint64_t v25;
  unint64_t v26;
  size_t v27;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  size_t v34;

  v1 = type metadata accessor for CustomSymbol();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = type metadata accessor for SymbolKey(0);
  v5 = *(_QWORD *)(v32 - 8);
  v6 = MEMORY[0x24BDAC7A8](v32);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (_DWORD *)((char *)&v29 - v9);
  v11 = *v0;
  v12 = v0[14];
  v13 = *(_QWORD *)(*v0 + 16);
  v31 = v12;
  if (v13)
  {
    v30 = v4;
    v33 = v2;
    v34 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    v14 = v13;
    sub_21FCD824C(0, v13, 0);
    v15 = 0;
    v16 = v34;
    do
    {
      v17 = v11;
      *v10 = *(_DWORD *)(v11 + 4 * v15 + 32);
      swift_storeEnumTagMultiPayload();
      v34 = v16;
      v19 = *(_QWORD *)(v16 + 16);
      v18 = *(_QWORD *)(v16 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_21FCD824C(v18 > 1, v19 + 1, 1);
        v16 = v34;
      }
      ++v15;
      *(_QWORD *)(v16 + 16) = v19 + 1;
      sub_21FCCB274((uint64_t)v10, v16+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v19, type metadata accessor for SymbolKey);
      v11 = v17;
    }
    while (v14 != v15);
    swift_bridgeObjectRelease();
    v4 = v30;
    v12 = v31;
    v2 = v33;
  }
  v20 = *(_QWORD *)(v12 + 16);
  v21 = MEMORY[0x24BEE4AF8];
  if (v20)
  {
    v34 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_21FCD824C(0, v20, 0);
    v22 = v12 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v33 = *(_QWORD *)(v2 + 72);
    do
    {
      sub_21FCCB230(v22, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      v23 = sub_21FCE5440();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v8, v4, v23);
      swift_storeEnumTagMultiPayload();
      sub_21FCD196C((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      v24 = v34;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21FCD824C(0, *(_QWORD *)(v24 + 16) + 1, 1);
        v24 = v34;
      }
      v26 = *(_QWORD *)(v24 + 16);
      v25 = *(_QWORD *)(v24 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_21FCD824C(v25 > 1, v26 + 1, 1);
        v24 = v34;
      }
      *(_QWORD *)(v24 + 16) = v26 + 1;
      sub_21FCCB274((uint64_t)v8, v24+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v26, type metadata accessor for SymbolKey);
      v22 += v33;
      --v20;
    }
    while (v20);
    swift_bridgeObjectRelease();
    v21 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v24 = MEMORY[0x24BEE4AF8];
  }
  v34 = v21;
  v27 = swift_bridgeObjectRetain();
  sub_21FCD894C(v27);
  sub_21FCD894C(v24);
  swift_bridgeObjectRelease();
  return v34;
}

uint64_t sub_21FCD46EC(uint64_t *a1)
{
  _OWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _OWORD v27[11];

  v3 = type metadata accessor for SymbolKey(0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (_DWORD *)((char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *a1;
  v7 = a1[1];
  v9 = v1[5];
  v27[4] = v1[4];
  v27[5] = v9;
  v10 = v1[3];
  v27[2] = v1[2];
  v27[3] = v10;
  v11 = v1[9];
  v27[8] = v1[8];
  v27[9] = v11;
  v12 = v1[7];
  v27[6] = v1[6];
  v27[7] = v12;
  v13 = v1[1];
  v27[0] = *v1;
  v27[1] = v13;
  v14 = *((_QWORD *)&v13 + 1);
  if (!*(_QWORD *)(*((_QWORD *)&v13 + 1) + 16))
    return MEMORY[0x24BEE4B08];
  swift_bridgeObjectRetain();
  v15 = sub_21FCC07A0(v8, v7);
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  v17 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_21FCD2344(v27);
  v18 = sub_21FCD9234(v17, (uint64_t)v27);
  sub_21FCD20A4(v27);
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(v18 + 16);
  if (v19)
  {
    v26 = MEMORY[0x24BEE4AF8];
    sub_21FCD824C(0, v19, 0);
    v20 = 0;
    v21 = v26;
    do
    {
      *v6 = *(_DWORD *)(v18 + 4 * v20 + 32);
      swift_storeEnumTagMultiPayload();
      v26 = v21;
      v23 = *(_QWORD *)(v21 + 16);
      v22 = *(_QWORD *)(v21 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_21FCD824C(v22 > 1, v23 + 1, 1);
        v21 = v26;
      }
      ++v20;
      *(_QWORD *)(v21 + 16) = v23 + 1;
      sub_21FCCB274((uint64_t)v6, v21+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v23, type metadata accessor for SymbolKey);
    }
    while (v19 != v20);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v21 = MEMORY[0x24BEE4AF8];
  }
  v24 = sub_21FCD9114(v21);
  swift_bridgeObjectRelease();
  return v24;
}

uint64_t sub_21FCD4914(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;

  v2 = v1;
  v4 = *(uint64_t (**)(uint64_t))(v1 + 48);
  if (!v4)
  {
    v6 = *(_QWORD *)(v1 + 8);
    if (*(_QWORD *)(v6 + 16))
    {
      v7 = *(_QWORD *)(v2 + 40);
      v8 = sub_21FCC0748(a1);
      if ((v9 & 1) != 0)
      {
        if (*(_QWORD *)(v7 + 16))
        {
          v10 = *(_QWORD *)(v6 + 56) + 104 * v8;
          v11 = *(_QWORD *)(v10 + 16);
          v12 = *(_QWORD *)(v10 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v13 = sub_21FCB8BDC(v12, v11);
          if ((v14 & 1) != 0)
          {
            v5 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v13);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            return v5;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
      }
    }
    return 0;
  }
  swift_retain();
  v5 = v4(a1);
  sub_21FCCB348((uint64_t)v4);
  return v5;
}

uint64_t SymbolMetadataStore.categories.getter()
{
  _OWORD *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v9[10];

  v1 = v0[7];
  v9[6] = v0[6];
  v9[7] = v1;
  v2 = v0[9];
  v9[8] = v0[8];
  v9[9] = v2;
  v3 = v0[3];
  v9[2] = v0[2];
  v9[3] = v3;
  v4 = v0[5];
  v9[4] = v0[4];
  v9[5] = v4;
  v5 = v0[1];
  v9[0] = *v0;
  v9[1] = v5;
  sub_21FCD2344(v9);
  v6 = swift_bridgeObjectRetain();
  v7 = sub_21FCD8D70(v6, (uint64_t)v9);
  sub_21FCD20A4(v9);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_21FCD4B34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  v5 = *(void **)(v2 + 128);
  v6 = *(void **)(v2 + 152);
  if (!v5)
  {
LABEL_8:
    if (!v6)
      goto LABEL_19;
LABEL_11:
    v13 = v6;
    v14 = sub_21FCE535C();
    if (v14 == a1 && v15 == a2)
    {
      swift_bridgeObjectRelease();

      goto LABEL_19;
    }
    v11 = v14;
    v17 = sub_21FCE5674();

    if ((v17 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    return v11;
  }
  v7 = v5;
  v8 = sub_21FCE535C();
  if (v8 != a1 || v9 != a2)
  {
    v11 = v8;
    v12 = sub_21FCE5674();

    if ((v12 & 1) == 0)
      return v11;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();

  if (v6)
    goto LABEL_11;
LABEL_19:
  if (qword_255573040 != -1)
    swift_once();
  return sub_21FCE535C();
}

uint64_t SymbolMetadataStore.sortPrivateScalars(_:)(char *a1, char *a2)
{
  char **v2;
  uint64_t v5;
  char *v6;
  uint64_t result;
  char *v8;

  v5 = (uint64_t)v2[6];
  swift_retain();
  sub_21FCCB348(v5);
  v2[6] = a1;
  v2[7] = a2;
  v8 = *v2;
  swift_bridgeObjectRetain_n();
  sub_21FCC7F04(&v8, v2);
  swift_bridgeObjectRelease();
  v6 = v8;
  result = swift_bridgeObjectRelease();
  *v2 = v6;
  return result;
}

uint64_t SymbolMetadataStore.symbolMetadata(forSystemName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v6 = type metadata accessor for SymbolKey(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555733B8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  SymbolMetadataStore.symbolKey(forSystemName:)(a1, a2, (uint64_t *)((char *)&v18 - v14));
  sub_21FCD90D0((uint64_t)v15, (uint64_t)v13, &qword_2555733B8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6) == 1)
  {
    v16 = type metadata accessor for SymbolMetadata(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
  else
  {
    sub_21FCCB274((uint64_t)v13, (uint64_t)v9, type metadata accessor for SymbolKey);
    SymbolMetadataStore.symbolMetadata(for:)((uint64_t)v9, a3);
    sub_21FCD196C((uint64_t)v9, type metadata accessor for SymbolKey);
  }
  return sub_21FCDC0F4((uint64_t)v15, &qword_2555733B8);
}

uint64_t SymbolMetadataStore.symbolKey(forSystemName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int v11;
  uint64_t v12;
  unint64_t v14;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v7 = *(_QWORD *)(v3 + 16);
  v8 = *(_QWORD *)(v3 + 72);
  if (*(_QWORD *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    v9 = sub_21FCB8BDC(a1, a2);
    if ((v10 & 1) != 0)
    {
      v11 = *(_DWORD *)(*(_QWORD *)(v7 + 56) + 104 * v9);
      swift_bridgeObjectRelease();
      *a3 = v11;
      v12 = type metadata accessor for SymbolKey(0);
      swift_storeEnumTagMultiPayload();
      return (*(uint64_t (**)(_DWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a3, 0, 1, v12);
    }
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    v14 = sub_21FCB8BDC(a1, a2);
    if ((v15 & 1) != 0)
    {
      v16 = (uint64_t *)(*(_QWORD *)(v8 + 56) + 16 * v14);
      v17 = *v16;
      v18 = v16[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      SymbolMetadataStore.symbolKey(forSystemName:)(v17, v18);
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  v19 = type metadata accessor for SymbolKey(0);
  return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a3, 1, 1, v19);
}

_QWORD *SymbolMetadataStore.symbolMetadata(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t (*v26)(_QWORD);
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;

  v5 = type metadata accessor for CustomSymbol();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v62 = (uint64_t)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555733C0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v62 - v12;
  v65 = sub_21FCE5440();
  v64 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v63 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for SymbolKey(0);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (int *)((char *)&v62 - v19);
  v21 = v2[7];
  v72 = v2[6];
  v73 = v21;
  v22 = v2[9];
  v74 = v2[8];
  v75 = v22;
  v23 = v2[3];
  v68 = v2[2];
  v69 = v23;
  v24 = v2[5];
  v70 = v2[4];
  v71 = v24;
  v25 = v2[1];
  v66 = *v2;
  v67 = v25;
  sub_21FCCB230(a1, (uint64_t)&v62 - v19, v26);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v20, type metadata accessor for SymbolKey);
  }
  else
  {
    v27 = *((_QWORD *)&v66 + 1);
    if (*(_QWORD *)(*((_QWORD *)&v66 + 1) + 16))
    {
      v28 = sub_21FCC0748(*v20);
      if ((v29 & 1) != 0)
      {
        v30 = *(_QWORD *)(v27 + 56) + 104 * v28;
        v31 = *(_DWORD *)v30;
        v32 = *(_QWORD *)(v30 + 8);
        v33 = *(_QWORD *)(v30 + 16);
        v34 = *(_BYTE *)(v30 + 24);
        v35 = *(_QWORD *)(v30 + 32);
        v36 = *(_QWORD *)(v30 + 40);
        v38 = *(_QWORD *)(v30 + 48);
        v37 = *(_QWORD *)(v30 + 56);
        v39 = *(_BYTE *)(v30 + 64);
        v40 = *(_QWORD *)(v30 + 72);
        v41 = *(_QWORD *)(v30 + 80);
        v42 = *(_BYTE *)(v30 + 88);
        v43 = *(_QWORD *)(v30 + 96);
        v44 = v73;
        *(_OWORD *)(a2 + 200) = v72;
        *(_OWORD *)(a2 + 216) = v44;
        v45 = v75;
        *(_OWORD *)(a2 + 232) = v74;
        *(_OWORD *)(a2 + 248) = v45;
        v46 = v69;
        *(_OWORD *)(a2 + 136) = v68;
        *(_OWORD *)(a2 + 152) = v46;
        v47 = v71;
        *(_OWORD *)(a2 + 168) = v70;
        *(_OWORD *)(a2 + 184) = v47;
        v48 = v67;
        *(_OWORD *)(a2 + 104) = v66;
        *(_DWORD *)a2 = v31;
        *(_QWORD *)(a2 + 8) = v32;
        *(_QWORD *)(a2 + 16) = v33;
        *(_BYTE *)(a2 + 24) = v34;
        *(_QWORD *)(a2 + 32) = v35;
        *(_QWORD *)(a2 + 40) = v36;
        *(_QWORD *)(a2 + 48) = v38;
        *(_QWORD *)(a2 + 56) = v37;
        *(_BYTE *)(a2 + 64) = v39;
        *(_QWORD *)(a2 + 72) = v40;
        *(_QWORD *)(a2 + 80) = v41;
        *(_BYTE *)(a2 + 88) = v42;
        *(_QWORD *)(a2 + 96) = v43;
        *(_OWORD *)(a2 + 120) = v48;
        type metadata accessor for SymbolMetadata.Backing(0);
        swift_storeEnumTagMultiPayload();
        v49 = type metadata accessor for SymbolMetadata(0);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(a2, 0, 1, v49);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        return sub_21FCD2344(&v66);
      }
    }
  }
  sub_21FCCB230(a1, (uint64_t)v18, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v51 = v64;
    v52 = (uint64_t)v63;
    v53 = v65;
    (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v63, v18, v65);
    v54 = *((_QWORD *)&v73 + 1);
    if (*(_QWORD *)(*((_QWORD *)&v73 + 1) + 16) && (v55 = sub_21FCC08DC(v52), (v56 & 1) != 0))
    {
      sub_21FCCB230(*(_QWORD *)(v54 + 56) + *(_QWORD *)(v6 + 72) * v55, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      v57 = 0;
    }
    else
    {
      v57 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v13, v57, 1, v5);
    sub_21FCD90D0((uint64_t)v13, (uint64_t)v11, &qword_2555733C0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1)
    {
      v59 = type metadata accessor for SymbolMetadata(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(a2, 1, 1, v59);
    }
    else
    {
      v60 = v62;
      sub_21FCCB274((uint64_t)v11, v62, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      sub_21FCCB230(v60, a2, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      type metadata accessor for SymbolMetadata.Backing(0);
      swift_storeEnumTagMultiPayload();
      sub_21FCD196C(v60, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      v61 = type metadata accessor for SymbolMetadata(0);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(a2, 0, 1, v61);
    }
    sub_21FCDC0F4((uint64_t)v13, &qword_2555733C0);
    return (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(v51 + 8))(v52, v53);
  }
  else
  {
    sub_21FCD196C((uint64_t)v18, type metadata accessor for SymbolKey);
    v58 = type metadata accessor for SymbolMetadata(0);
    return (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(a2, 1, 1, v58);
  }
}

Swift::String_optional __swiftcall SymbolMetadataStore.modernSystemName(forAlias:)(Swift::String forAlias)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  Swift::String_optional result;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;

  object = forAlias._object;
  countAndFlagsBits = forAlias._countAndFlagsBits;
  v50 = type metadata accessor for CustomSymbol();
  MEMORY[0x24BDAC7A8](v50);
  v49 = (uint64_t)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = type metadata accessor for SymbolMetadata.Backing(0);
  v4 = MEMORY[0x24BDAC7A8](v54);
  v48 = (uint64_t)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v53 = (char *)&v45 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555733C8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = type metadata accessor for SymbolMetadata(0);
  v51 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555733B8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (_DWORD *)((char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = type metadata accessor for SymbolKey(0);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  SymbolMetadataStore.symbolKey(forSystemName:)(countAndFlagsBits, (uint64_t)object, v14);
  if ((*(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_21FCDC0F4((uint64_t)v14, &qword_2555733B8);
LABEL_13:
    v32 = 0;
    v33 = 0;
    goto LABEL_14;
  }
  v19 = (uint64_t)v53;
  v46 = countAndFlagsBits;
  v47 = object;
  sub_21FCCB274((uint64_t)v14, (uint64_t)v18, type metadata accessor for SymbolKey);
  SymbolMetadataStore.symbolMetadata(for:)((uint64_t)v18, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v9, 1, v52) == 1)
  {
    sub_21FCD196C((uint64_t)v18, type metadata accessor for SymbolKey);
    sub_21FCDC0F4((uint64_t)v9, &qword_2555733C8);
    goto LABEL_13;
  }
  v20 = (uint64_t)v11;
  sub_21FCCB274((uint64_t)v9, (uint64_t)v11, type metadata accessor for SymbolMetadata);
  sub_21FCCB230((uint64_t)v11, v19, type metadata accessor for SymbolMetadata.Backing);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v21 = v49;
    sub_21FCCB274(v19, v49, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
    v22 = v50;
    v23 = (uint64_t *)(v21 + *(int *)(v50 + 20));
    v25 = *v23;
    v24 = (void *)v23[1];
    swift_bridgeObjectRetain();
    sub_21FCD196C(v21, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
  }
  else
  {
    v25 = *(_QWORD *)(v19 + 8);
    v24 = *(void **)(v19 + 16);
    v52 = *(_QWORD *)(v19 + 40);
    v26 = *(_OWORD *)(v19 + 216);
    v61 = *(_OWORD *)(v19 + 200);
    v62 = v26;
    v27 = *(_OWORD *)(v19 + 248);
    v63 = *(_OWORD *)(v19 + 232);
    v64 = v27;
    v28 = *(_OWORD *)(v19 + 152);
    v57 = *(_OWORD *)(v19 + 136);
    v58 = v28;
    v29 = *(_OWORD *)(v19 + 184);
    v59 = *(_OWORD *)(v19 + 168);
    v60 = v29;
    v30 = *(_OWORD *)(v19 + 120);
    v55 = *(_OWORD *)(v19 + 104);
    v56 = v30;
    sub_21FCD20A4(&v55);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v21 = v49;
    v22 = v50;
  }
  if (v25 == v46 && v24 == v47)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    sub_21FCD196C(v20, type metadata accessor for SymbolMetadata);
    sub_21FCD196C((uint64_t)v18, type metadata accessor for SymbolKey);
    goto LABEL_13;
  }
  v31 = sub_21FCE5674();
  swift_bridgeObjectRelease();
  if ((v31 & 1) != 0)
    goto LABEL_12;
  v36 = v48;
  sub_21FCCB230(v20, v48, type metadata accessor for SymbolMetadata.Backing);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCCB274(v36, v21, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
    v37 = (uint64_t *)(v21 + *(int *)(v22 + 20));
    v32 = *v37;
    v33 = (void *)v37[1];
    swift_bridgeObjectRetain();
    sub_21FCD196C(v21, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
  }
  else
  {
    v38 = v36;
    v32 = *(_QWORD *)(v36 + 8);
    v33 = *(void **)(v38 + 16);
    v39 = *(_OWORD *)(v38 + 216);
    v61 = *(_OWORD *)(v38 + 200);
    v62 = v39;
    v40 = *(_OWORD *)(v38 + 248);
    v63 = *(_OWORD *)(v38 + 232);
    v64 = v40;
    v41 = *(_OWORD *)(v38 + 152);
    v57 = *(_OWORD *)(v38 + 136);
    v58 = v41;
    v42 = *(_OWORD *)(v38 + 184);
    v59 = *(_OWORD *)(v38 + 168);
    v60 = v42;
    v43 = *(_OWORD *)(v38 + 120);
    v55 = *(_OWORD *)(v38 + 104);
    v56 = v43;
    sub_21FCD20A4(&v55);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_21FCD196C(v20, type metadata accessor for SymbolMetadata);
  sub_21FCD196C((uint64_t)v18, type metadata accessor for SymbolKey);
LABEL_14:
  v34 = v32;
  v35 = v33;
  result.value._object = v35;
  result.value._countAndFlagsBits = v34;
  return result;
}

double sub_21FCD5B0C@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  double result;
  __int128 v21;

  v5 = v4;
  v7 = *(_QWORD *)(v4 + 96);
  if (*(_QWORD *)(v7 + 16))
  {
    v11 = *a1;
    v10 = a1[1];
    v12 = *(_QWORD *)(v5 + 88);
    swift_bridgeObjectRetain();
    v13 = sub_21FCB8BDC(a2, a3);
    if ((v14 & 1) != 0)
    {
      v15 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v13);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v15 + 16))
      {
        swift_bridgeObjectRetain();
        v16 = sub_21FCC07A0(v11, v10);
        if ((v17 & 1) != 0)
        {
          v18 = *(_QWORD *)(v15 + 56) + 24 * v16;
          v21 = *(_OWORD *)v18;
          v19 = *(_QWORD *)(v18 + 16);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *(_OWORD *)a4 = v21;
          *(_QWORD *)(a4 + 16) = v19;
          *(_QWORD *)(a4 + 24) = v12;
          swift_bridgeObjectRetain();
          return result;
        }
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
  }
  result = 0.0;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  return result;
}

uint64_t type metadata accessor for SymbolKey(uint64_t a1)
{
  return sub_21FCDC054(a1, (uint64_t *)&unk_2555733E8);
}

uint64_t sub_21FCD5C40(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;

  v4 = *(_QWORD *)(v3 + 104);
  if (!*(_QWORD *)(v4 + 16))
    return 0;
  v8 = *a1;
  v7 = a1[1];
  swift_bridgeObjectRetain();
  v9 = sub_21FCB8BDC(a2, a3);
  if ((v10 & 1) == 0
    || (v11 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v9),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        !*(_QWORD *)(v11 + 16)))
  {
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v12 = sub_21FCC07A0(v8, v7);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 16 * v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t SymbolMetadataStore.customSymbols.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SymbolMetadataStore.customSymbols.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 112) = a1;
  return sub_21FCD5D50();
}

uint64_t sub_21FCD5D50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int isUniquelyReferenced_nonNull_native;
  char v26;
  unint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t result;
  _QWORD v39[2];
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;

  v1 = sub_21FCE5440();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v43 = (uint64_t)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for CustomSymbol();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v39 - v9;
  v11 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  v12 = (_QWORD *)sub_21FCC00F0(MEMORY[0x24BEE4AF8]);
  v13 = *(_QWORD *)(v11 + 16);
  if (v13)
  {
    v39[1] = v11;
    v40 = v0;
    v14 = v11 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v15 = *(_QWORD *)(v5 + 72);
    swift_bridgeObjectRetain();
    v16 = v43;
    v41 = v10;
    v42 = v15;
    while (1)
    {
      v44 = v13;
      sub_21FCCB230(v14, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      v20 = v2;
      v21 = *(void (**)(uint64_t, char *, uint64_t))(v2 + 16);
      v22 = v1;
      v21(v16, v10, v1);
      v23 = (uint64_t)v10;
      v24 = (uint64_t)v8;
      sub_21FCCB230(v23, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v45 = v12;
      v27 = sub_21FCC08DC(v16);
      v28 = v12[2];
      v29 = (v26 & 1) == 0;
      v30 = v28 + v29;
      if (__OFADD__(v28, v29))
        break;
      v31 = v26;
      if (v12[3] >= v30)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_21FCC53C4();
      }
      else
      {
        sub_21FCC3024(v30, isUniquelyReferenced_nonNull_native);
        v32 = sub_21FCC08DC(v43);
        if ((v31 & 1) != (v33 & 1))
          goto LABEL_18;
        v27 = v32;
      }
      v1 = v22;
      v16 = v43;
      v12 = v45;
      v2 = v20;
      if ((v31 & 1) != 0)
      {
        v17 = v42;
        v18 = v45[7] + v27 * v42;
        v8 = (char *)v24;
        sub_21FCDC0B0(v24, v18);
        v19 = v44;
      }
      else
      {
        v45[(v27 >> 6) + 8] |= 1 << v27;
        v21(v12[6] + *(_QWORD *)(v20 + 72) * v27, (char *)v16, v1);
        v17 = v42;
        v34 = v12[7] + v27 * v42;
        v8 = (char *)v24;
        sub_21FCCB274(v24, v34, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
        v35 = v12[2];
        v36 = __OFADD__(v35, 1);
        v37 = v35 + 1;
        v19 = v44;
        if (v36)
          goto LABEL_17;
        v12[2] = v37;
        v12 = v45;
      }
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v16, v1);
      v10 = v41;
      sub_21FCD196C((uint64_t)v41, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      v14 += v17;
      v13 = v19 - 1;
      if (!v13)
      {
        swift_bridgeObjectRelease();
        v0 = v40;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    result = sub_21FCE56A4();
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 120) = v12;
  }
  return result;
}

uint64_t (*SymbolMetadataStore.customSymbols.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *a1 = v1;
  return sub_21FCD606C;
}

uint64_t sub_21FCD606C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return sub_21FCD5D50();
  return result;
}

size_t SymbolMetadataStore.symbolKeys(matching:)(__int128 *a1)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  size_t result;
  uint64_t v34;
  uint64_t v35;
  size_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int EnumCaseMultiPayload;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  size_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  _OWORD v80[4];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[16];
  _BYTE v106[16];
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;

  v68 = 0;
  v3 = type metadata accessor for SymbolKey(0);
  v78 = *(_QWORD *)(v3 - 8);
  v79 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v75 = (uint64_t)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v74 = (uint64_t)&v68 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v68 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v76 = (uint64_t)&v68 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v72 = (char *)&v68 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v71 = (char *)&v68 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v68 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v68 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v68 - v23;
  v25 = a1[1];
  v101 = *a1;
  v102 = v25;
  v26 = a1[3];
  v103 = a1[2];
  v104 = v26;
  v27 = v1[7];
  v97 = v1[6];
  v98 = v27;
  v28 = v1[9];
  v99 = v1[8];
  v100 = v28;
  v29 = v1[3];
  v93 = v1[2];
  v94 = v29;
  v30 = v1[5];
  v95 = v1[4];
  v96 = v30;
  v31 = v1[1];
  v91 = *v1;
  v92 = v31;
  v32 = sub_21FCD43A8();
  sub_21FCDB4F8((uint64_t)&v101, (uint64_t)v106, &qword_2555733D0);
  result = sub_21FCDB4F8((uint64_t)v106, (uint64_t)&v107, &qword_2555733D0);
  v34 = v108;
  v77 = v10;
  if (!v108)
  {
LABEL_18:
    v43 = v68;
    goto LABEL_19;
  }
  v35 = v107;
  swift_bridgeObjectRelease();
  if (v35 == 7105633 && v34 == 0xE300000000000000 || (sub_21FCE5674() & 1) != 0)
  {
    v87 = v97;
    v88 = v98;
    v89 = v99;
    v90 = v100;
    v83 = v93;
    v84 = v94;
    v85 = v95;
    v86 = v96;
    v81 = v91;
    v82 = v92;
    result = sub_21FCD43A8();
    v36 = result;
    v32 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)&v81 = MEMORY[0x24BEE4AF8];
    v73 = *(_QWORD *)(result + 16);
    if (v73)
    {
      v37 = 0;
      v38 = MEMORY[0x24BEE4AF8];
      v69 = v24;
      v70 = v22;
      while (v37 < *(_QWORD *)(v36 + 16))
      {
        v39 = (*(unsigned __int8 *)(v78 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
        v40 = *(_QWORD *)(v78 + 72);
        sub_21FCCB230(v36 + v39 + v40 * v37, (uint64_t)v24, type metadata accessor for SymbolKey);
        sub_21FCCB230((uint64_t)v24, (uint64_t)v22, type metadata accessor for SymbolKey);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_21FCD196C((uint64_t)v22, type metadata accessor for SymbolKey);
          result = sub_21FCD196C((uint64_t)v24, type metadata accessor for SymbolKey);
        }
        else
        {
          sub_21FCCB274((uint64_t)v24, (uint64_t)v19, type metadata accessor for SymbolKey);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            sub_21FCD824C(0, *(_QWORD *)(v38 + 16) + 1, 1);
          v38 = v81;
          v42 = *(_QWORD *)(v81 + 16);
          v41 = *(_QWORD *)(v81 + 24);
          if (v42 >= v41 >> 1)
          {
            sub_21FCD824C(v41 > 1, v42 + 1, 1);
            v38 = v81;
          }
          *(_QWORD *)(v38 + 16) = v42 + 1;
          result = sub_21FCCB274((uint64_t)v19, v38 + v39 + v42 * v40, type metadata accessor for SymbolKey);
          v24 = v69;
          v22 = v70;
        }
        ++v37;
        v10 = v77;
        if (v73 == v37)
        {
          v32 = v81;
          goto LABEL_17;
        }
      }
      __break(1u);
      goto LABEL_58;
    }
LABEL_17:
    result = swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  v87 = v97;
  v88 = v98;
  v89 = v99;
  v90 = v100;
  v83 = v93;
  v84 = v94;
  v85 = v95;
  v86 = v96;
  v81 = v91;
  v82 = v92;
  *(_QWORD *)&v80[0] = v35;
  *((_QWORD *)&v80[0] + 1) = v34;
  v66 = sub_21FCD46EC((uint64_t *)v80);
  if (!*(_QWORD *)(v66 + 16))
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  v87 = v97;
  v88 = v98;
  v89 = v99;
  v90 = v100;
  v83 = v93;
  v84 = v94;
  v85 = v95;
  v86 = v96;
  v81 = v91;
  v82 = v92;
  v67 = sub_21FCD43A8();
  v43 = v68;
  v32 = sub_21FCDA96C(v67, v66);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
LABEL_19:
  v45 = (uint64_t)v71;
  v44 = (uint64_t)v72;
  if ((BYTE1(v103) & 1) != 0)
  {
LABEL_32:
    if ((BYTE2(v103) & 1) == 0)
    {
      *(_QWORD *)&v81 = MEMORY[0x24BEE4AF8];
      v53 = *(_QWORD *)(v32 + 16);
      v68 = v43;
      if (v53)
      {
        v54 = 0;
        while (v54 < *(_QWORD *)(v32 + 16))
        {
          v55 = (*(unsigned __int8 *)(v78 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
          v56 = *(_QWORD *)(v78 + 72);
          sub_21FCCB230(v32 + v55 + v56 * v54, (uint64_t)v10, type metadata accessor for SymbolKey);
          v57 = v74;
          sub_21FCCB230((uint64_t)v10, v74, type metadata accessor for SymbolKey);
          EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          sub_21FCD196C(v57, type metadata accessor for SymbolKey);
          if (EnumCaseMultiPayload == 1)
          {
            result = sub_21FCD196C((uint64_t)v10, type metadata accessor for SymbolKey);
          }
          else
          {
            sub_21FCCB274((uint64_t)v10, v75, type metadata accessor for SymbolKey);
            v59 = v81;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_21FCD824C(0, *(_QWORD *)(v59 + 16) + 1, 1);
              v59 = v81;
            }
            v61 = *(_QWORD *)(v59 + 16);
            v60 = *(_QWORD *)(v59 + 24);
            if (v61 >= v60 >> 1)
            {
              sub_21FCD824C(v60 > 1, v61 + 1, 1);
              v59 = v81;
            }
            *(_QWORD *)(v59 + 16) = v61 + 1;
            result = sub_21FCCB274(v75, v59 + v55 + v61 * v56, type metadata accessor for SymbolKey);
            v10 = v77;
          }
          if (v53 == ++v54)
            goto LABEL_44;
        }
        goto LABEL_59;
      }
LABEL_44:
      swift_bridgeObjectRelease();
      v32 = v81;
    }
    if ((BYTE3(v103) & 1) == 0)
    {
      sub_21FCD2344(&v91);
      v62 = sub_21FCDAB28(v32, (uint64_t)&v91);
      sub_21FCD20A4(&v91);
      swift_bridgeObjectRelease();
      v32 = v62;
    }
    if (*(_QWORD *)(*((_QWORD *)&v103 + 1) + 16))
    {
      sub_21FCDB108((uint64_t)&v101);
      v63 = sub_21FCDAEF4(v32, (uint64_t)&v101);
      sub_21FCDB16C((uint64_t)&v101);
      swift_bridgeObjectRelease();
      v32 = v63;
    }
    if (*(_QWORD *)(v104 + 16))
    {
      sub_21FCD2344(&v91);
      sub_21FCDB108((uint64_t)&v101);
      v64 = sub_21FCDB1D0(v32, (uint64_t)&v91, (uint64_t)&v101);
      sub_21FCDB16C((uint64_t)&v101);
      sub_21FCD20A4(&v91);
      swift_bridgeObjectRelease();
      v32 = v64;
    }
    sub_21FCDB4F8((uint64_t)&v102, (uint64_t)v105, &qword_2555733D8);
    sub_21FCDB4F8((uint64_t)v105, (uint64_t)&v109, &qword_2555733D8);
    if (v110)
    {
      v87 = v97;
      v88 = v98;
      v89 = v99;
      v90 = v100;
      v83 = v93;
      v84 = v94;
      v85 = v95;
      v86 = v96;
      v81 = v91;
      v82 = v92;
      v80[0] = v101;
      v80[1] = v102;
      v80[2] = v103;
      v80[3] = v104;
      v65 = sub_21FCD68FC(v32, v109, v110, (uint64_t)v80, v103);
      swift_bridgeObjectRelease();
      return v65;
    }
    return v32;
  }
  *(_QWORD *)&v81 = MEMORY[0x24BEE4AF8];
  v46 = *(_QWORD *)(v32 + 16);
  v68 = v43;
  if (!v46)
  {
LABEL_31:
    result = swift_bridgeObjectRelease();
    v32 = v81;
    v43 = v68;
    goto LABEL_32;
  }
  v47 = 0;
  while (v47 < *(_QWORD *)(v32 + 16))
  {
    v48 = (*(unsigned __int8 *)(v78 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
    v49 = *(_QWORD *)(v78 + 72);
    sub_21FCCB230(v32 + v48 + v49 * v47, v45, type metadata accessor for SymbolKey);
    sub_21FCCB230(v45, v44, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_21FCD196C(v44, type metadata accessor for SymbolKey);
      sub_21FCCB274(v45, v76, type metadata accessor for SymbolKey);
      v50 = v81;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21FCD824C(0, *(_QWORD *)(v50 + 16) + 1, 1);
        v50 = v81;
      }
      v52 = *(_QWORD *)(v50 + 16);
      v51 = *(_QWORD *)(v50 + 24);
      if (v52 >= v51 >> 1)
      {
        sub_21FCD824C(v51 > 1, v52 + 1, 1);
        v50 = v81;
      }
      *(_QWORD *)(v50 + 16) = v52 + 1;
      result = sub_21FCCB274(v76, v50 + v48 + v52 * v49, type metadata accessor for SymbolKey);
      v10 = v77;
      v45 = (uint64_t)v71;
      v44 = (uint64_t)v72;
    }
    else
    {
      result = sub_21FCD196C(v45, type metadata accessor for SymbolKey);
    }
    if (v46 == ++v47)
      goto LABEL_31;
  }
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_21FCD68FC(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  _OWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  unint64_t v43;
  unint64_t v44;
  _QWORD v46[3];
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _DWORD *v54;
  uint64_t v55;
  _OWORD v56[10];
  uint64_t v57;
  _OWORD v58[11];

  v10 = type metadata accessor for CustomSymbol();
  MEMORY[0x24BDAC7A8](v10);
  v47 = (uint64_t)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = type metadata accessor for SymbolMetadataStore.RelevantSymbol(0);
  v50 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v55 = (uint64_t)v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for SymbolKey(0);
  v51 = *(_QWORD *)(v16 - 8);
  v52 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v54 = (_DWORD *)((char *)v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = v5[7];
  v58[6] = v5[6];
  v58[7] = v18;
  v19 = v5[9];
  v58[8] = v5[8];
  v58[9] = v19;
  v20 = v5[3];
  v58[2] = v5[2];
  v58[3] = v20;
  v21 = v5[5];
  v58[4] = v5[4];
  v58[5] = v21;
  v22 = v5[1];
  v58[0] = *v5;
  v58[1] = v22;
  swift_bridgeObjectRetain();
  v24 = sub_21FCD2474(a2, a3, a5);
  v25 = (char *)v23;
  v27 = v26;
  if (*(_QWORD *)(v24 + 16) || *(_QWORD *)(v23 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28 = swift_bridgeObjectRetain();
    v29 = sub_21FCDA6F8(v28, v24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21FCD2344(v58);
    swift_bridgeObjectRetain();
    v30 = sub_21FCD9458(a1, v58, v24, v25, v27, v29);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21FCD20A4(v58);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v56[0] = v30;
    swift_bridgeObjectRetain();
    sub_21FCD6FC4((_QWORD **)v56);
    swift_bridgeObjectRelease();
    v31 = *(_QWORD *)&v56[0];
    v32 = *(_QWORD *)(*(_QWORD *)&v56[0] + 16);
    if (v32)
    {
      v57 = MEMORY[0x24BEE4AF8];
      sub_21FCD824C(0, v32, 0);
      v33 = *(unsigned __int8 *)(v50 + 80);
      v46[1] = v31;
      v46[2] = v12;
      v34 = v31 + ((v33 + 32) & ~v33);
      v50 = *(_QWORD *)(v50 + 72);
      do
      {
        v35 = v55;
        sub_21FCCB230(v34, v55, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        sub_21FCCB230(v35 + *(int *)(v53 + 20), (uint64_t)v14, type metadata accessor for SymbolMetadata.Backing);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          v36 = v47;
          sub_21FCCB274((uint64_t)v14, v47, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
          v37 = sub_21FCE5440();
          (*(void (**)(_DWORD *, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v54, v36, v37);
          sub_21FCD196C(v36, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
        }
        else
        {
          v49 = *(_DWORD *)v14;
          v48 = *((_QWORD *)v14 + 10);
          v38 = *(_OWORD *)(v14 + 216);
          v56[6] = *(_OWORD *)(v14 + 200);
          v56[7] = v38;
          v39 = *(_OWORD *)(v14 + 248);
          v56[8] = *(_OWORD *)(v14 + 232);
          v56[9] = v39;
          v40 = *(_OWORD *)(v14 + 152);
          v56[2] = *(_OWORD *)(v14 + 136);
          v56[3] = v40;
          v41 = *(_OWORD *)(v14 + 184);
          v56[4] = *(_OWORD *)(v14 + 168);
          v56[5] = v41;
          v42 = *(_OWORD *)(v14 + 120);
          v56[0] = *(_OWORD *)(v14 + 104);
          v56[1] = v42;
          sub_21FCD20A4(v56);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *v54 = v49;
        }
        swift_storeEnumTagMultiPayload();
        sub_21FCD196C(v55, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        a1 = v57;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21FCD824C(0, *(_QWORD *)(a1 + 16) + 1, 1);
          a1 = v57;
        }
        v44 = *(_QWORD *)(a1 + 16);
        v43 = *(_QWORD *)(a1 + 24);
        if (v44 >= v43 >> 1)
        {
          sub_21FCD824C(v43 > 1, v44 + 1, 1);
          a1 = v57;
        }
        *(_QWORD *)(a1 + 16) = v44 + 1;
        sub_21FCCB274((uint64_t)v54, a1+ ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80))+ *(_QWORD *)(v51 + 72) * v44, type metadata accessor for SymbolKey);
        v34 += v50;
        --v32;
      }
      while (v32);
      swift_release();
    }
    else
    {
      swift_release();
      return MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return a1;
}

_QWORD *SymbolMetadataStore.symbolMetadata(matching:)(uint64_t a1)
{
  __int128 *v1;
  char v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  size_t v13;
  _QWORD *v14;
  __int128 v16[2];
  char v17;
  char v18;
  char v19;
  char v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23[10];

  v2 = *(_BYTE *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 33);
  v4 = *(_BYTE *)(a1 + 34);
  v5 = *(_BYTE *)(a1 + 35);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = v1[7];
  v23[6] = v1[6];
  v23[7] = v7;
  v8 = v1[9];
  v23[8] = v1[8];
  v23[9] = v8;
  v9 = v1[3];
  v23[2] = v1[2];
  v23[3] = v9;
  v10 = v1[5];
  v23[4] = v1[4];
  v23[5] = v10;
  v11 = v1[1];
  v23[0] = *v1;
  v23[1] = v11;
  v12 = *(_OWORD *)(a1 + 16);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v12;
  v17 = v2;
  v18 = v3;
  v19 = v4;
  v20 = v5;
  v21 = *(_OWORD *)(a1 + 40);
  v22 = v6;
  v13 = SymbolMetadataStore.symbolKeys(matching:)(v16);
  sub_21FCD2344(v23);
  v14 = sub_21FCD9F10(v13, v23);
  sub_21FCD20A4(v23);
  swift_bridgeObjectRelease();
  return v14;
}

void *SymbolMetadataStore.localizationOverrideBundle.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 128);
  v2 = v1;
  return v1;
}

void SymbolMetadataStore.localizationOverrideBundle.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = a1;
}

uint64_t (*SymbolMetadataStore.localizationOverrideBundle.modify())()
{
  return nullsub_1;
}

uint64_t SymbolMetadataStore.localizationOverrideTableName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 136);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SymbolMetadataStore.localizationOverrideTableName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 136) = a1;
  *(_QWORD *)(v2 + 144) = a2;
  return result;
}

uint64_t (*SymbolMetadataStore.localizationOverrideTableName.modify())()
{
  return nullsub_1;
}

uint64_t sub_21FCD6FC4(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(type metadata accessor for SymbolMetadataStore.RelevantSymbol(0) - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_21FCD8A74(v3);
  v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_21FCD7044(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_21FCD7044(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int v36;
  uint64_t *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  BOOL v80;
  unint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  uint64_t v91;
  char v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  BOOL v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _QWORD *v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;

  v2 = v1;
  v131 = type metadata accessor for SymbolMetadataStore.RelevantSymbol(0);
  v4 = *(_QWORD *)(v131 - 8);
  v5 = MEMORY[0x24BDAC7A8](v131);
  v7 = (char *)&v121 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v137 = (uint64_t)&v121 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v134 = (uint64_t *)((char *)&v121 - v11);
  MEMORY[0x24BDAC7A8](v10);
  v133 = (uint64_t *)((char *)&v121 - v12);
  v13 = a1[1];
  result = sub_21FCE565C();
  if (result >= v13)
  {
    if (v13 < 0)
      goto LABEL_140;
    if (v13)
      return sub_21FCD79E4(0, v13, 1, a1);
    return result;
  }
  if (v13 >= 0)
    v15 = v13;
  else
    v15 = v13 + 1;
  if (v13 < -1)
    goto LABEL_139;
  v123 = result;
  if (v13 > 1)
  {
    v127 = v7;
    v16 = v15 >> 1;
    result = sub_21FCE553C();
    *(_QWORD *)(result + 16) = v16;
    v17 = *(unsigned __int8 *)(v4 + 80);
    v122 = result;
    v129 = result + ((v17 + 32) & ~v17);
LABEL_13:
    v19 = 0;
    v18 = MEMORY[0x24BEE4AF8];
    v136 = a1;
    v20 = v13;
    v130 = v4;
    while (1)
    {
      v125 = v18;
      v22 = v19;
      v23 = v19 + 1;
      v128 = v19;
      v138 = v20;
      if (v19 + 1 >= v20)
      {
        v30 = v19 + 1;
        v18 = v125;
      }
      else
      {
        v24 = v20;
        v25 = *a1;
        v26 = *(_QWORD *)(v4 + 72);
        v27 = v133;
        sub_21FCCB230(*a1 + v26 * v23, (uint64_t)v133, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        v28 = v134;
        sub_21FCCB230(v25 + v26 * v22, (uint64_t)v134, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        v135 = *v27;
        v132 = *v28;
        sub_21FCD196C((uint64_t)v28, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        result = sub_21FCD196C((uint64_t)v27, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        v29 = v25;
        v30 = v22 + 2;
        v126 = v29;
        v139 = v26;
        if (v22 + 2 >= v24)
        {
          v4 = v130;
        }
        else
        {
          v124 = v2;
          v31 = v26 * v23;
          v32 = v29;
          v33 = v26 * v30;
          while (1)
          {
            v34 = v30;
            v35 = v133;
            v36 = v132 < v135;
            sub_21FCCB230(v32 + v33, (uint64_t)v133, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
            v37 = v134;
            sub_21FCCB230(v32 + v31, (uint64_t)v134, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
            v38 = *v37 >= *v35;
            sub_21FCD196C((uint64_t)v37, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
            result = sub_21FCD196C((uint64_t)v35, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
            if (v36 == v38)
              break;
            ++v30;
            v32 += v139;
            if (v138 == v34 + 1)
            {
              v30 = v138;
              v4 = v130;
              a1 = v136;
              goto LABEL_25;
            }
          }
          v4 = v130;
          a1 = v136;
LABEL_25:
          v2 = v124;
          v22 = v128;
        }
        v18 = v125;
        if (v132 < v135)
        {
          if (v30 < v22)
            goto LABEL_141;
          if (v22 < v30)
          {
            v124 = v2;
            v39 = 0;
            v40 = v139;
            v41 = v139 * (v30 - 1);
            v42 = v22;
            v43 = v30 * v139;
            v44 = v42;
            v45 = v42 * v139;
            do
            {
              if (v44 != v30 + v39 - 1)
              {
                v46 = v126;
                if (!v126)
                  goto LABEL_146;
                v47 = v126 + v45;
                v48 = v126 + v41;
                sub_21FCCB274(v126 + v45, (uint64_t)v127, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                if (v45 < v41 || v47 >= v46 + v43)
                {
                  swift_arrayInitWithTakeFrontToBack();
                  v40 = v139;
                }
                else
                {
                  v40 = v139;
                  if (v45 != v41)
                    swift_arrayInitWithTakeBackToFront();
                }
                result = sub_21FCCB274((uint64_t)v127, v48, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
              }
              ++v44;
              --v39;
              v41 -= v40;
              v43 -= v40;
              v45 += v40;
            }
            while (v44 < v30 + v39);
            v2 = v124;
            v18 = v125;
            a1 = v136;
            v4 = v130;
            v22 = v128;
          }
        }
      }
      if (v30 < v138)
      {
        if (__OFSUB__(v30, v22))
          goto LABEL_138;
        if (v30 - v22 < v123)
        {
          if (__OFADD__(v22, v123))
            goto LABEL_142;
          v49 = v138;
          if (v22 + v123 < v138)
            v49 = v22 + v123;
          if (v49 < v22)
          {
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
            return result;
          }
          if (v30 != v49)
          {
            v124 = v2;
            v50 = *(_QWORD *)(v4 + 72);
            v139 = v50 * (v30 - 1);
            v132 = v50;
            v51 = v30 * v50;
            v126 = v49;
            do
            {
              v53 = 0;
              v54 = v128;
              v135 = v30;
              while (1)
              {
                v55 = v136;
                v56 = *v136;
                v57 = v51;
                v58 = v51 + v53 + *v136;
                v59 = v133;
                sub_21FCCB230(v58, (uint64_t)v133, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                v60 = v134;
                sub_21FCCB230(v139 + v53 + v56, (uint64_t)v134, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                v138 = *v59;
                v61 = *v60;
                sub_21FCD196C((uint64_t)v60, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                result = sub_21FCD196C((uint64_t)v59, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                if (v61 >= v138)
                  break;
                v62 = *v55;
                if (!*v55)
                  goto LABEL_144;
                v51 = v57;
                v63 = v62 + v139 + v53;
                sub_21FCCB274(v62 + v57 + v53, v137, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                swift_arrayInitWithTakeFrontToBack();
                result = sub_21FCCB274(v137, v63, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
                v53 -= v132;
                ++v54;
                v52 = v135;
                if (v135 == v54)
                  goto LABEL_50;
              }
              v52 = v135;
              v51 = v57;
LABEL_50:
              v30 = v52 + 1;
              v139 += v132;
              v51 += v132;
            }
            while (v30 != v126);
            v30 = v126;
            v2 = v124;
            v18 = v125;
            a1 = v136;
            v22 = v128;
          }
        }
      }
      if (v30 < v22)
        goto LABEL_133;
      result = swift_isUniquelyReferenced_nonNull_native();
      v135 = v30;
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_21FCD8058(0, *(_QWORD *)(v18 + 16) + 1, 1, (char *)v18);
        v18 = result;
      }
      v65 = *(_QWORD *)(v18 + 16);
      v64 = *(_QWORD *)(v18 + 24);
      v21 = v65 + 1;
      if (v65 >= v64 >> 1)
      {
        result = (uint64_t)sub_21FCD8058((char *)(v64 > 1), v65 + 1, 1, (char *)v18);
        v18 = result;
      }
      *(_QWORD *)(v18 + 16) = v21;
      v66 = v18 + 32;
      v67 = (_QWORD *)(v18 + 32 + 16 * v65);
      v68 = v135;
      *v67 = v128;
      v67[1] = v68;
      if (v65)
      {
        while (1)
        {
          v69 = v21 - 1;
          if (v21 >= 4)
          {
            v74 = v66 + 16 * v21;
            v75 = *(_QWORD *)(v74 - 64);
            v76 = *(_QWORD *)(v74 - 56);
            v80 = __OFSUB__(v76, v75);
            v77 = v76 - v75;
            if (v80)
              goto LABEL_122;
            v79 = *(_QWORD *)(v74 - 48);
            v78 = *(_QWORD *)(v74 - 40);
            v80 = __OFSUB__(v78, v79);
            v72 = v78 - v79;
            v73 = v80;
            if (v80)
              goto LABEL_123;
            v81 = v21 - 2;
            v82 = (uint64_t *)(v66 + 16 * (v21 - 2));
            v84 = *v82;
            v83 = v82[1];
            v80 = __OFSUB__(v83, v84);
            v85 = v83 - v84;
            if (v80)
              goto LABEL_124;
            v80 = __OFADD__(v72, v85);
            v86 = v72 + v85;
            if (v80)
              goto LABEL_126;
            if (v86 >= v77)
            {
              v104 = (uint64_t *)(v66 + 16 * v69);
              v106 = *v104;
              v105 = v104[1];
              v80 = __OFSUB__(v105, v106);
              v107 = v105 - v106;
              if (v80)
                goto LABEL_132;
              v97 = v72 < v107;
              goto LABEL_94;
            }
          }
          else
          {
            if (v21 != 3)
            {
              v98 = *(_QWORD *)(v18 + 32);
              v99 = *(_QWORD *)(v18 + 40);
              v80 = __OFSUB__(v99, v98);
              v91 = v99 - v98;
              v92 = v80;
              goto LABEL_88;
            }
            v71 = *(_QWORD *)(v18 + 32);
            v70 = *(_QWORD *)(v18 + 40);
            v80 = __OFSUB__(v70, v71);
            v72 = v70 - v71;
            v73 = v80;
          }
          if ((v73 & 1) != 0)
            goto LABEL_125;
          v81 = v21 - 2;
          v87 = (uint64_t *)(v66 + 16 * (v21 - 2));
          v89 = *v87;
          v88 = v87[1];
          v90 = __OFSUB__(v88, v89);
          v91 = v88 - v89;
          v92 = v90;
          if (v90)
            goto LABEL_127;
          v93 = (uint64_t *)(v66 + 16 * v69);
          v95 = *v93;
          v94 = v93[1];
          v80 = __OFSUB__(v94, v95);
          v96 = v94 - v95;
          if (v80)
            goto LABEL_129;
          if (__OFADD__(v91, v96))
            goto LABEL_131;
          if (v91 + v96 >= v72)
          {
            v97 = v72 < v96;
LABEL_94:
            if (v97)
              v69 = v81;
            goto LABEL_96;
          }
LABEL_88:
          if ((v92 & 1) != 0)
            goto LABEL_128;
          v100 = (uint64_t *)(v66 + 16 * v69);
          v102 = *v100;
          v101 = v100[1];
          v80 = __OFSUB__(v101, v102);
          v103 = v101 - v102;
          if (v80)
            goto LABEL_130;
          if (v103 < v91)
            goto LABEL_15;
LABEL_96:
          v108 = v69 - 1;
          if (v69 - 1 >= v21)
          {
            __break(1u);
LABEL_119:
            __break(1u);
LABEL_120:
            __break(1u);
LABEL_121:
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
            goto LABEL_143;
          }
          v109 = *a1;
          if (!*a1)
            goto LABEL_145;
          v110 = (uint64_t *)(v66 + 16 * v108);
          v111 = *v110;
          v112 = (_QWORD *)(v66 + 16 * v69);
          v113 = v112[1];
          result = sub_21FCD7C24(v109 + *(_QWORD *)(v130 + 72) * *v110, v109 + *(_QWORD *)(v130 + 72) * *v112, v109 + *(_QWORD *)(v130 + 72) * v113, v129);
          if (v2)
            goto LABEL_116;
          if (v113 < v111)
            goto LABEL_119;
          if (v69 > *(_QWORD *)(v18 + 16))
            goto LABEL_120;
          *v110 = v111;
          *(_QWORD *)(v66 + 16 * v108 + 8) = v113;
          v114 = *(_QWORD *)(v18 + 16);
          if (v69 >= v114)
            goto LABEL_121;
          v21 = v114 - 1;
          result = (uint64_t)memmove((void *)(v66 + 16 * v69), v112 + 2, 16 * (v114 - 1 - v69));
          *(_QWORD *)(v18 + 16) = v114 - 1;
          a1 = v136;
          if (v114 <= 2)
            goto LABEL_15;
        }
      }
      v21 = 1;
LABEL_15:
      v20 = a1[1];
      v19 = v135;
      v4 = v130;
      if (v135 >= v20)
        goto LABEL_105;
    }
  }
  v18 = MEMORY[0x24BEE4AF8];
  v129 = MEMORY[0x24BEE4AF8]
       + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v122 = MEMORY[0x24BEE4AF8];
  if (v13 == 1)
  {
    v127 = v7;
    goto LABEL_13;
  }
  v21 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_105:
  if (v21 >= 2)
  {
    v115 = *a1;
    do
    {
      v116 = v21 - 2;
      if (v21 < 2)
        goto LABEL_134;
      if (!v115)
        goto LABEL_147;
      v117 = *(_QWORD *)(v18 + 32 + 16 * v116);
      v118 = *(_QWORD *)(v18 + 32 + 16 * (v21 - 1) + 8);
      result = sub_21FCD7C24(v115 + *(_QWORD *)(v4 + 72) * v117, v115 + *(_QWORD *)(v4 + 72) * *(_QWORD *)(v18 + 32 + 16 * (v21 - 1)), v115 + *(_QWORD *)(v4 + 72) * v118, v129);
      if (v2)
        break;
      if (v118 < v117)
        goto LABEL_135;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_21FCD8200(v18);
        v18 = result;
      }
      if (v116 >= *(_QWORD *)(v18 + 16))
        goto LABEL_136;
      v119 = (_QWORD *)(v18 + 32 + 16 * v116);
      *v119 = v117;
      v119[1] = v118;
      v120 = *(_QWORD *)(v18 + 16);
      if (v21 > v120)
        goto LABEL_137;
      result = (uint64_t)memmove((void *)(v18 + 32 + 16 * (v21 - 1)), (const void *)(v18 + 32 + 16 * v21), 16 * (v120 - v21));
      *(_QWORD *)(v18 + 16) = v120 - 1;
      v21 = v120 - 1;
    }
    while (v120 > 2);
  }
LABEL_116:
  swift_bridgeObjectRelease();
  *(_QWORD *)(v122 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FCD79E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;

  v36 = a1;
  v37 = type metadata accessor for SymbolMetadataStore.RelevantSymbol(0);
  v7 = MEMORY[0x24BDAC7A8](v37);
  v43 = (uint64_t)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v39 = (uint64_t *)((char *)&v34 - v10);
  result = MEMORY[0x24BDAC7A8](v9);
  v38 = (uint64_t *)((char *)&v34 - v13);
  v42 = a3;
  v35 = a2;
  if (a3 != a2)
  {
    v14 = *(_QWORD *)(v12 + 72);
    v15 = v14 * (v42 - 1);
    v40 = v14;
    v16 = v14 * v42;
    v17 = type metadata accessor for SymbolMetadataStore.RelevantSymbol;
    v45 = a4;
LABEL_5:
    v18 = 0;
    v19 = v36;
    v41 = v16;
    while (1)
    {
      v21 = *v45;
      v22 = v16 + v18 + *v45;
      v23 = v38;
      sub_21FCCB230(v22, (uint64_t)v38, v17);
      v24 = v15 + v18 + v21;
      v25 = v15;
      v26 = v39;
      sub_21FCCB230(v24, (uint64_t)v39, v17);
      v44 = *v23;
      v27 = v17;
      v28 = *v26;
      v29 = (uint64_t)v26;
      v15 = v25;
      sub_21FCD196C(v29, v27);
      v30 = (uint64_t)v23;
      v16 = v41;
      result = sub_21FCD196C(v30, v27);
      v31 = v28 < v44;
      v17 = v27;
      if (!v31)
      {
LABEL_4:
        v15 = v25 + v40;
        v16 += v40;
        if (++v42 == v35)
          return result;
        goto LABEL_5;
      }
      v32 = *v45;
      if (!*v45)
        break;
      v33 = v32 + v25 + v18;
      sub_21FCCB274(v32 + v16 + v18, v43, v27);
      swift_arrayInitWithTakeFrontToBack();
      v20 = v33;
      v17 = v27;
      result = sub_21FCCB274(v43, v20, v27);
      v18 -= v40;
      if (v42 == ++v19)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_21FCD7C24(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v27;
  unint64_t v29;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;

  v47 = type metadata accessor for SymbolMetadataStore.RelevantSymbol(0);
  v8 = MEMORY[0x24BDAC7A8](v47);
  v49 = (uint64_t *)((char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (uint64_t *)((char *)&v44 - v11);
  v14 = *(_QWORD *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    return result;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1)
    goto LABEL_68;
  v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1)
    goto LABEL_69;
  v16 = (uint64_t)(a2 - a1) / v14;
  v52 = a1;
  v51 = a4;
  if (v16 >= v15 / v14)
  {
    v18 = v15 / v14 * v14;
    if (a4 < a2 || a2 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v29 = a4 + v18;
    v50 = a4 + v18;
    v52 = a2;
    if (v18 >= 1 && a1 < a2)
    {
      v31 = -v14;
      v45 = a1;
      v46 = a4;
      do
      {
        v48 = a3 + v31;
        sub_21FCCB230(v29 + v31, (uint64_t)v12, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        v32 = a2 + v31;
        v33 = a3;
        v34 = v12;
        v35 = v49;
        sub_21FCCB230(a2 + v31, (uint64_t)v49, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        v36 = *v34;
        v37 = *v35;
        v38 = (uint64_t)v35;
        v12 = v34;
        sub_21FCD196C(v38, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        sub_21FCD196C((uint64_t)v34, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        if (v37 >= v36)
        {
          v42 = v50;
          v50 += v31;
          a3 = v48;
          if (v33 < v42 || v48 >= v42)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v33 != v42)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v32 = a2;
          v41 = v45;
          v40 = v46;
        }
        else
        {
          a3 = v48;
          if (v33 < a2 || v48 >= a2)
          {
            swift_arrayInitWithTakeFrontToBack();
            v41 = v45;
            v40 = v46;
          }
          else
          {
            v39 = v33 == a2;
            v41 = v45;
            v40 = v46;
            if (!v39)
              swift_arrayInitWithTakeBackToFront();
          }
          v52 += v31;
        }
        v29 = v50;
        if (v50 <= v40)
          break;
        a2 = v32;
      }
      while (v32 > v41);
    }
  }
  else
  {
    v17 = v16 * v14;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v48 = a4 + v17;
    v50 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      do
      {
        sub_21FCCB230(a2, (uint64_t)v12, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        v20 = a4;
        v21 = v49;
        sub_21FCCB230(v20, (uint64_t)v49, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        v22 = *v12;
        v23 = *v21;
        sub_21FCD196C((uint64_t)v21, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        sub_21FCD196C((uint64_t)v12, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        v24 = v52;
        if (v23 >= v22)
        {
          v27 = v51 + v14;
          if (v52 < v51 || v52 >= v27)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v52 != v51)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v51 = v27;
          v25 = a2;
        }
        else
        {
          v25 = a2 + v14;
          if (v52 < a2 || v52 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v52 == a2)
          {
            v24 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v52 = v24 + v14;
        a4 = v51;
        if (v51 >= v48)
          break;
        a2 = v25;
      }
      while (v25 < a3);
    }
  }
  sub_21FCD8150(&v52, &v51, (uint64_t *)&v50);
  return 1;
}

char *sub_21FCD8058(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573400);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_21FCD8150(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for SymbolMetadataStore.RelevantSymbol(0);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_13;
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_21FCD8200(uint64_t a1)
{
  return sub_21FCD8058(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_21FCD8214(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21FCD83A8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_21FCD8230(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21FCD84C0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_21FCD824C(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_21FCD86D8(a1, a2, a3, (_QWORD *)*v3, &qword_255573420, type metadata accessor for SymbolKey);
  *v3 = result;
  return result;
}

char *sub_21FCD8278(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21FCD85C0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_21FCD8294(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21FCD884C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_21FCD82B0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573440);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

char *sub_21FCD83A8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573438);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8])
      memmove(v12, v13, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_21FCD84C0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3CEC8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_21FCD85C0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573428);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8])
      memmove(v12, v13, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_21FCD86D8(size_t result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  unint64_t v19;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_29;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  v18 = *(_QWORD *)(a6(0) - 8);
  if ((v8 & 1) != 0)
  {
    if (v16 < a4
      || (v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(_QWORD *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v16;
}

char *sub_21FCD884C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573418);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_21FCD894C(size_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v11 = v4 + v2;
  else
    v11 = v4;
  result = sub_21FCDF00C(result, v11, 1, v3);
  v3 = (_QWORD *)result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = (v3[3] >> 1) - v3[2];
  result = type metadata accessor for SymbolKey(0);
  if (v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v8 = v3[2];
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_21FCD8A4C(uint64_t a1)
{
  return sub_21FCD82B0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_21FCD8A60(uint64_t a1)
{
  return sub_21FCD84C0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

size_t sub_21FCD8A74(_QWORD *a1)
{
  return sub_21FCD86D8(0, a1[2], 0, a1, &qword_255573408, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
}

uint64_t _s9SFSymbols9SymbolKeyO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;

  v4 = sub_21FCE5440();
  v23 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SymbolKey(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (_DWORD *)((char *)&v22 - v11);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573138);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = &v16[*(int *)(v14 + 48)];
  sub_21FCCB230(a1, (uint64_t)v16, type metadata accessor for SymbolKey);
  sub_21FCCB230(a2, (uint64_t)v17, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_21FCCB230((uint64_t)v16, (uint64_t)v12, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      v19 = *v12 == *(_DWORD *)v17;
      goto LABEL_6;
    }
LABEL_8:
    sub_21FCDC0F4((uint64_t)v16, &qword_255573138);
    v19 = 0;
    return v19 & 1;
  }
  sub_21FCCB230((uint64_t)v16, (uint64_t)v10, type metadata accessor for SymbolKey);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v4);
    goto LABEL_8;
  }
  v18 = v23;
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v6, v17, v4);
  v19 = sub_21FCE5434();
  v20 = *(void (**)(char *, uint64_t))(v18 + 8);
  v20(v6, v4);
  v20(v10, v4);
LABEL_6:
  sub_21FCD196C((uint64_t)v16, type metadata accessor for SymbolKey);
  return v19 & 1;
}

uint64_t sub_21FCD8CDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_21FCE5548();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_21FCC568C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_21FCD8D70(uint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t result;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v28 = MEMORY[0x24BEE4AF8];
    sub_21FCD8278(0, v3, 0);
    result = v28;
    v23 = a2;
    v24 = *(void **)(a2 + 128);
    v6 = (uint64_t *)(a1 + 56);
    while (1)
    {
      v27 = result;
      v7 = *(v6 - 3);
      v8 = *(v6 - 2);
      v9 = *v6;
      v25 = *(v6 - 1);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      sub_21FCE55D8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v26 = v7;
      sub_21FCE54DC();
      swift_bridgeObjectRelease();
      if (!v24)
        goto LABEL_7;
      v10 = v24;
      v12 = sub_21FCE535C();
      v13 = v11;
      if (v12 == 0xD000000000000013 && v11 == 0x800000021FD2E690)
        break;
      v17 = sub_21FCE5674();

      if ((v17 & 1) == 0)
        goto LABEL_19;
      swift_bridgeObjectRelease();
      a2 = v23;
      v14 = *(void **)(v23 + 152);
      if (!v14)
        goto LABEL_16;
LABEL_8:
      v15 = v14;
      v12 = sub_21FCE535C();
      v13 = v16;
      if (v12 == 0xD000000000000013 && v16 == 0x800000021FD2E690)
      {
        swift_bridgeObjectRelease();

        a2 = v23;
LABEL_16:
        if (qword_255573040 != -1)
          swift_once();
        v12 = sub_21FCE535C();
        v13 = v19;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      v18 = sub_21FCE5674();

      if ((v18 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        a2 = v23;
        goto LABEL_16;
      }
LABEL_19:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a2 = v23;
LABEL_20:
      swift_bridgeObjectRelease();
      result = v27;
      v21 = *(_QWORD *)(v27 + 16);
      v20 = *(_QWORD *)(v27 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_21FCD8278((char *)(v20 > 1), v21 + 1, 1);
        result = v27;
      }
      v6 += 4;
      *(_QWORD *)(result + 16) = v21 + 1;
      v22 = (_QWORD *)(result + 48 * v21);
      v22[4] = v26;
      v22[5] = v8;
      v22[6] = v25;
      v22[7] = v9;
      v22[8] = v12;
      v22[9] = v13;
      if (!--v3)
        return result;
    }
    swift_bridgeObjectRelease();

    a2 = v23;
LABEL_7:
    v14 = *(void **)(a2 + 152);
    if (!v14)
      goto LABEL_16;
    goto LABEL_8;
  }
  return result;
}

uint64_t sub_21FCD90D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21FCD9114(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = type metadata accessor for SymbolKey(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  sub_21FCDB568(&qword_2555733F8, v10, (uint64_t)&protocol conformance descriptor for SymbolKey);
  result = sub_21FCE5548();
  v15 = result;
  if (v9)
  {
    v12 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v13 = *(_QWORD *)(v3 + 72);
    do
    {
      sub_21FCCB230(v12, (uint64_t)v6, type metadata accessor for SymbolKey);
      sub_21FCC5954((uint64_t)v8, (uint64_t)v6);
      sub_21FCD196C((uint64_t)v8, type metadata accessor for SymbolKey);
      v12 += v13;
      --v9;
    }
    while (v9);
    return v15;
  }
  return result;
}

uint64_t sub_21FCD9234(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  int v25;

  v4 = a1 + 56;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  v11 = MEMORY[0x24BEE4AF8];
  while (v7)
  {
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v13 = v12 | (v10 << 6);
LABEL_22:
    v17 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(v17 + 16))
    {
      v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v13);
      v19 = *v18;
      v20 = v18[1];
      swift_bridgeObjectRetain();
      v21 = sub_21FCB8BDC(v19, v20);
      if ((v22 & 1) != 0)
      {
        v25 = *(_DWORD *)(*(_QWORD *)(v17 + 56) + 104 * v21);
        swift_bridgeObjectRelease();
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_21FCDED34(0, *(_QWORD *)(v11 + 16) + 1, 1, (char *)v11);
          v11 = result;
        }
        v24 = *(_QWORD *)(v11 + 16);
        v23 = *(_QWORD *)(v11 + 24);
        if (v24 >= v23 >> 1)
        {
          result = (uint64_t)sub_21FCDED34((char *)(v23 > 1), v24 + 1, 1, (char *)v11);
          v11 = result;
        }
        *(_QWORD *)(v11 + 16) = v24 + 1;
        *(_DWORD *)(v11 + 4 * v24 + 32) = v25;
      }
      else
      {
        result = swift_bridgeObjectRelease();
      }
    }
  }
  v14 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v14 >= v8)
    goto LABEL_30;
  v15 = *(_QWORD *)(v4 + 8 * v14);
  ++v10;
  if (v15)
    goto LABEL_21;
  v10 = v14 + 1;
  if (v14 + 1 >= v8)
    goto LABEL_30;
  v15 = *(_QWORD *)(v4 + 8 * v10);
  if (v15)
    goto LABEL_21;
  v10 = v14 + 2;
  if (v14 + 2 >= v8)
    goto LABEL_30;
  v15 = *(_QWORD *)(v4 + 8 * v10);
  if (v15)
    goto LABEL_21;
  v10 = v14 + 3;
  if (v14 + 3 >= v8)
    goto LABEL_30;
  v15 = *(_QWORD *)(v4 + 8 * v10);
  if (v15)
  {
LABEL_21:
    v7 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
    goto LABEL_22;
  }
  v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_30:
    swift_release();
    return v11;
  }
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v10 = v16;
    goto LABEL_21;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v8)
      goto LABEL_30;
    v15 = *(_QWORD *)(v4 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_21;
  }
LABEL_32:
  __break(1u);
  return result;
}

_QWORD *sub_21FCD9458(uint64_t a1, _OWORD *a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  __int128 v56;
  char *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t);
  char v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  _QWORD *v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  _QWORD v96[3];
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  int *v124;
  uint64_t v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint64_t v136;

  v107 = a6;
  v106 = a5;
  v105 = a4;
  v104 = a3;
  v7 = a2;
  v9 = a2[7];
  v132 = a2[6];
  v133 = v9;
  v10 = a2[9];
  v134 = a2[8];
  v135 = v10;
  v11 = a2[3];
  v128 = a2[2];
  v129 = v11;
  v12 = a2[5];
  v130 = a2[4];
  v131 = v12;
  v13 = a2[1];
  v126 = *a2;
  v127 = v13;
  v109 = type metadata accessor for CustomSymbol();
  v112 = *(_QWORD *)(v109 - 8);
  MEMORY[0x24BDAC7A8](v109);
  v100 = (uint64_t)v96 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555733C0);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v96 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v117 = (uint64_t)v96 - v19;
  v115 = sub_21FCE5440();
  v114 = *(_QWORD *)(v115 - 8);
  MEMORY[0x24BDAC7A8](v115);
  v21 = (char *)v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = type metadata accessor for SymbolKey(0);
  v22 = *(_QWORD *)(v125 - 8);
  v23 = MEMORY[0x24BDAC7A8](v125);
  v113 = (uint64_t)v96 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v124 = (int *)((char *)v96 - v25);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555733C8);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)v96 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = type metadata accessor for SymbolMetadata(0);
  v123 = *(_QWORD *)(v121 - 8);
  MEMORY[0x24BDAC7A8](v121);
  v136 = (uint64_t)v96 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_255573410);
  MEMORY[0x24BDAC7A8](v30);
  v32 = (_QWORD *)((char *)v96 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  v120 = type metadata accessor for SymbolMetadataStore.RelevantSymbol(0);
  v122 = *(_QWORD *)(v120 - 8);
  v33 = MEMORY[0x24BDAC7A8](v120);
  v103 = (uint64_t)v96 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v33);
  v99 = (uint64_t)v96 - v35;
  v36 = *(_QWORD *)(a1 + 16);
  if (v36)
  {
    v96[2] = v6;
    v119 = a1 + ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80));
    v118 = *(_QWORD *)(v22 + 72);
    v98 = v28 + 104;
    v96[1] = a1;
    swift_bridgeObjectRetain();
    v37 = 0;
    v97 = v107 + 56;
    v111 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v101 = v7;
    v108 = v18;
    v116 = v21;
    v38 = (uint64_t)v124;
    v102 = v32;
    v110 = v36;
    while (1)
    {
      v39 = v119 + v118 * v37;
      sub_21FCCB230(v39, v38, type metadata accessor for SymbolKey);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_21FCD196C(v38, type metadata accessor for SymbolKey);
      }
      else
      {
        v40 = v7[1];
        if (*(_QWORD *)(v40 + 16))
        {
          v41 = sub_21FCC0748(*v124);
          if ((v42 & 1) != 0)
          {
            v43 = *(_QWORD *)(v40 + 56) + 104 * v41;
            v44 = *(_QWORD *)(v43 + 8);
            v45 = *(_QWORD *)(v43 + 16);
            v46 = *(_BYTE *)(v43 + 24);
            v47 = *(_QWORD *)(v43 + 32);
            v48 = *(_QWORD *)(v43 + 40);
            v50 = *(_QWORD *)(v43 + 48);
            v49 = *(_QWORD *)(v43 + 56);
            v51 = *(_BYTE *)(v43 + 64);
            v52 = *(_QWORD *)(v43 + 72);
            v53 = *(_QWORD *)(v43 + 80);
            v54 = *(_BYTE *)(v43 + 88);
            v55 = *(_QWORD *)(v43 + 96);
            *(_DWORD *)v28 = *(_DWORD *)v43;
            *((_QWORD *)v28 + 1) = v44;
            *((_QWORD *)v28 + 2) = v45;
            v28[24] = v46;
            *((_QWORD *)v28 + 4) = v47;
            *((_QWORD *)v28 + 5) = v48;
            *((_QWORD *)v28 + 6) = v50;
            *((_QWORD *)v28 + 7) = v49;
            v28[64] = v51;
            *((_QWORD *)v28 + 9) = v52;
            *((_QWORD *)v28 + 10) = v53;
            v28[88] = v54;
            *((_QWORD *)v28 + 12) = v55;
            v56 = v133;
            v57 = v98;
            *((_OWORD *)v98 + 6) = v132;
            *((_OWORD *)v57 + 7) = v56;
            v58 = v135;
            *((_OWORD *)v57 + 8) = v134;
            *((_OWORD *)v57 + 9) = v58;
            v59 = v129;
            *((_OWORD *)v57 + 2) = v128;
            *((_OWORD *)v57 + 3) = v59;
            v60 = v131;
            *((_OWORD *)v57 + 4) = v130;
            *((_OWORD *)v57 + 5) = v60;
            v61 = v127;
            *(_OWORD *)v57 = v126;
            *((_OWORD *)v57 + 1) = v61;
            type metadata accessor for SymbolMetadata.Backing(0);
            swift_storeEnumTagMultiPayload();
            v62 = v121;
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v123 + 56))(v28, 0, 1, v121);
            v7 = v101;
            swift_bridgeObjectRetain();
            v36 = v110;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v32 = v102;
            swift_bridgeObjectRetain();
            v21 = v116;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_21FCD2344(v7);
            goto LABEL_20;
          }
        }
      }
      v63 = v39;
      v64 = v113;
      sub_21FCCB230(v63, v113, type metadata accessor for SymbolKey);
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        sub_21FCD196C(v64, type metadata accessor for SymbolKey);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v123 + 56))(v28, 1, 1, v121);
        v38 = (uint64_t)v124;
LABEL_4:
        sub_21FCDC0F4((uint64_t)v28, &qword_2555733C8);
        (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v122 + 56))(v32, 1, 1, v120);
        goto LABEL_5;
      }
      (*(void (**)(char *, uint64_t, uint64_t))(v114 + 32))(v21, v64, v115);
      v65 = v7[15];
      if (*(_QWORD *)(v65 + 16) && (v66 = sub_21FCC08DC((uint64_t)v21), (v67 & 1) != 0))
      {
        sub_21FCCB230(*(_QWORD *)(v65 + 56) + *(_QWORD *)(v112 + 72) * v66, v117, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
        v68 = 0;
      }
      else
      {
        v68 = 1;
      }
      v69 = v112;
      v70 = 1;
      v71 = v117;
      v72 = v109;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v112 + 56))(v117, v68, 1, v109);
      v73 = v71;
      v74 = (uint64_t)v108;
      sub_21FCD90D0(v73, (uint64_t)v108, &qword_2555733C0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48))(v74, 1, v72) != 1)
      {
        v75 = v100;
        sub_21FCCB274(v74, v100, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
        sub_21FCCB230(v75, (uint64_t)v28, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
        type metadata accessor for SymbolMetadata.Backing(0);
        swift_storeEnumTagMultiPayload();
        sub_21FCD196C(v75, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
        v70 = 0;
      }
      v76 = v70;
      v62 = v121;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v123 + 56))(v28, v76, 1, v121);
      sub_21FCDC0F4(v117, &qword_2555733C0);
      v21 = v116;
      (*(void (**)(char *, uint64_t))(v114 + 8))(v116, v115);
LABEL_20:
      v38 = (uint64_t)v124;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v123 + 48))(v28, 1, v62) == 1)
        goto LABEL_4;
      v77 = v136;
      sub_21FCCB274((uint64_t)v28, v136, type metadata accessor for SymbolMetadata);
      v78 = sub_21FCD0398(v77, v104, v105, v106);
      if ((v79 & 1) != 0)
      {
        v84 = *(_QWORD *)(v107 + 16);
        if (v84)
        {
          swift_bridgeObjectRetain();
          v85 = v97;
          while (1)
          {
            v86 = *(uint64_t (**)(uint64_t))(v85 - 8);
            swift_bridgeObjectRetain();
            swift_retain();
            v87 = v86(v136);
            swift_release();
            swift_bridgeObjectRelease();
            if ((v87 & 1) == 0)
              break;
            v85 += 32;
            if (!--v84)
            {
              swift_bridgeObjectRelease();
              v81 = v120;
              v32 = v102;
              v77 = v136;
              sub_21FCCB230(v136, (uint64_t)v102 + *(int *)(v120 + 20), type metadata accessor for SymbolMetadata);
              v83 = 0;
              *v32 = 1000;
              v82 = v101;
              goto LABEL_28;
            }
          }
          swift_bridgeObjectRelease();
          v83 = 1;
          v82 = v101;
        }
        else
        {
          v82 = v7;
          v83 = 1;
        }
        v38 = (uint64_t)v124;
        v77 = v136;
        v32 = v102;
        v81 = v120;
      }
      else
      {
        v80 = v78;
        v81 = v120;
        v82 = v7;
        sub_21FCCB230(v77, (uint64_t)v32 + *(int *)(v120 + 20), type metadata accessor for SymbolMetadata);
        v83 = 0;
        *v32 = v80;
LABEL_28:
        v38 = (uint64_t)v124;
      }
      sub_21FCD196C(v77, type metadata accessor for SymbolMetadata);
      v88 = v122;
      (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v122 + 56))(v32, v83, 1, v81);
      v89 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v88 + 48))(v32, 1, v81);
      v7 = v82;
      v36 = v110;
      v21 = v116;
      if (v89 != 1)
      {
        v90 = v99;
        sub_21FCCB274((uint64_t)v32, v99, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        sub_21FCCB274(v90, v103, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
          v91 = v111;
        else
          v91 = (_QWORD *)sub_21FCDF020(0, v111[2] + 1, 1, v111);
        v93 = v91[2];
        v92 = v91[3];
        if (v93 >= v92 >> 1)
          v91 = (_QWORD *)sub_21FCDF020(v92 > 1, v93 + 1, 1, v91);
        v91[2] = v93 + 1;
        v94 = (*(unsigned __int8 *)(v122 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v122 + 80);
        v111 = v91;
        sub_21FCCB274(v103, (uint64_t)v91 + v94 + *(_QWORD *)(v122 + 72) * v93, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
        v38 = (uint64_t)v124;
        goto LABEL_6;
      }
LABEL_5:
      sub_21FCDC0F4((uint64_t)v32, &qword_255573410);
LABEL_6:
      if (++v37 == v36)
      {
        swift_bridgeObjectRelease();
        return v111;
      }
    }
  }
  return (_QWORD *)MEMORY[0x24BEE4AF8];
}

_QWORD *sub_21FCD9F10(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  __int128 v53;
  char *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  size_t v82;
  _QWORD v84[3];
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;

  v4 = a2[7];
  v112 = a2[6];
  v113 = v4;
  v5 = a2[9];
  v114 = a2[8];
  v115 = v5;
  v6 = a2[3];
  v108 = a2[2];
  v109 = v6;
  v7 = a2[5];
  v110 = a2[4];
  v111 = v7;
  v8 = *a2;
  v9 = a2[1];
  v105 = a2;
  v106 = v8;
  v107 = v9;
  v92 = type metadata accessor for CustomSymbol();
  v93 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v87 = (uint64_t)v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555733C0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v97 = (uint64_t)v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v84 - v14;
  v101 = sub_21FCE5440();
  v100 = *(_QWORD *)(v101 - 8);
  MEMORY[0x24BDAC7A8](v101);
  v17 = (char *)v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for SymbolKey(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v102 = (char *)v84 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (int *)((char *)v84 - v22);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555733C8);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)v84 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = type metadata accessor for SymbolMetadata(0);
  v27 = MEMORY[0x24BDAC7A8](v104);
  v96 = (uint64_t)v84 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v91 = (uint64_t)v84 - v30;
  v31 = *(_QWORD *)(a1 + 16);
  if (!v31)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v116 = v29;
  v84[2] = v2;
  v32 = a1 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
  v103 = *(_QWORD *)(v19 + 72);
  v85 = v26 + 104;
  v84[1] = a1;
  swift_bridgeObjectRetain();
  v33 = v17;
  v34 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v99 = (uint64_t)v33;
  v95 = v18;
  v35 = (uint64_t)v102;
  v94 = v23;
  v86 = v15;
  do
  {
    sub_21FCCB230(v32, (uint64_t)v23, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_21FCD196C((uint64_t)v23, type metadata accessor for SymbolKey);
    }
    else
    {
      v36 = v105[1];
      if (*(_QWORD *)(v36 + 16))
      {
        v37 = sub_21FCC0748(*v23);
        if ((v38 & 1) != 0)
        {
          v39 = *(_QWORD *)(v36 + 56) + 104 * v37;
          v40 = *(_DWORD *)v39;
          v41 = *(_QWORD *)(v39 + 8);
          v88 = *(_QWORD *)(v39 + 16);
          v42 = v88;
          v43 = *(_BYTE *)(v39 + 24);
          v44 = *(_QWORD *)(v39 + 32);
          v45 = *(_QWORD *)(v39 + 40);
          v46 = *(_QWORD *)(v39 + 56);
          v89 = *(_QWORD *)(v39 + 48);
          v47 = v89;
          v90 = v46;
          v48 = *(_BYTE *)(v39 + 64);
          v49 = *(_QWORD *)(v39 + 72);
          v50 = *(_QWORD *)(v39 + 80);
          v51 = *(_BYTE *)(v39 + 88);
          v52 = *(_QWORD *)(v39 + 96);
          *(_DWORD *)v26 = v40;
          *((_QWORD *)v26 + 1) = v41;
          *((_QWORD *)v26 + 2) = v42;
          v26[24] = v43;
          *((_QWORD *)v26 + 4) = v44;
          *((_QWORD *)v26 + 5) = v45;
          *((_QWORD *)v26 + 6) = v47;
          *((_QWORD *)v26 + 7) = v46;
          v26[64] = v48;
          *((_QWORD *)v26 + 9) = v49;
          *((_QWORD *)v26 + 10) = v50;
          v26[88] = v51;
          *((_QWORD *)v26 + 12) = v52;
          v53 = v113;
          v54 = v85;
          *((_OWORD *)v85 + 6) = v112;
          *((_OWORD *)v54 + 7) = v53;
          v55 = v115;
          *((_OWORD *)v54 + 8) = v114;
          *((_OWORD *)v54 + 9) = v55;
          v56 = v109;
          *((_OWORD *)v54 + 2) = v108;
          *((_OWORD *)v54 + 3) = v56;
          v57 = v111;
          *((_OWORD *)v54 + 4) = v110;
          *((_OWORD *)v54 + 5) = v57;
          v58 = v107;
          *(_OWORD *)v54 = v106;
          *((_OWORD *)v54 + 1) = v58;
          type metadata accessor for SymbolMetadata.Backing(0);
          swift_storeEnumTagMultiPayload();
          v59 = v34;
          v60 = v116;
          v61 = v104;
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v116 + 56))(v26, 0, 1, v104);
          swift_bridgeObjectRetain();
          v35 = (uint64_t)v102;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v15 = v86;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_21FCD2344(v105);
          v62 = v60;
          v34 = v59;
          goto LABEL_19;
        }
      }
    }
    sub_21FCCB230(v32, v35, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      sub_21FCD196C(v35, type metadata accessor for SymbolKey);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v116 + 56))(v26, 1, 1, v104);
LABEL_4:
      sub_21FCDC0F4((uint64_t)v26, &qword_2555733C8);
      goto LABEL_5;
    }
    v63 = v99;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v100 + 32))(v99, v35, v101);
    v64 = v105[15];
    v65 = *(_QWORD *)(v64 + 16);
    v98 = v34;
    if (v65 && (v66 = sub_21FCC08DC(v63), (v67 & 1) != 0))
    {
      sub_21FCCB230(*(_QWORD *)(v64 + 56) + *(_QWORD *)(v93 + 72) * v66, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      v68 = 0;
    }
    else
    {
      v68 = 1;
    }
    v69 = v93;
    v70 = 1;
    v71 = v92;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v93 + 56))(v15, v68, 1, v92);
    v72 = (uint64_t)v15;
    v73 = (uint64_t)v15;
    v74 = v97;
    sub_21FCD90D0(v72, v97, &qword_2555733C0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48))(v74, 1, v71) != 1)
    {
      v75 = v87;
      sub_21FCCB274(v97, v87, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      sub_21FCCB230(v75, (uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      type metadata accessor for SymbolMetadata.Backing(0);
      swift_storeEnumTagMultiPayload();
      sub_21FCD196C(v75, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
      v70 = 0;
    }
    v76 = v116;
    v77 = v70;
    v61 = v104;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v116 + 56))(v26, v77, 1, v104);
    sub_21FCDC0F4(v73, &qword_2555733C0);
    (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v99, v101);
    v62 = v76;
    v15 = (char *)v73;
    v35 = (uint64_t)v102;
    v34 = v98;
LABEL_19:
    v23 = v94;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48))(v26, 1, v61) == 1)
      goto LABEL_4;
    v78 = v91;
    sub_21FCCB274((uint64_t)v26, v91, type metadata accessor for SymbolMetadata);
    sub_21FCCB274(v78, v96, type metadata accessor for SymbolMetadata);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v34 = (_QWORD *)sub_21FCDF034(0, v34[2] + 1, 1, v34);
    v80 = v34[2];
    v79 = v34[3];
    v81 = v116;
    if (v80 >= v79 >> 1)
    {
      v82 = sub_21FCDF034(v79 > 1, v80 + 1, 1, v34);
      v81 = v116;
      v34 = (_QWORD *)v82;
    }
    v34[2] = v80 + 1;
    sub_21FCCB274(v96, (uint64_t)v34+ ((*(unsigned __int8 *)(v81 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80))+ *(_QWORD *)(v81 + 72) * v80, type metadata accessor for SymbolMetadata);
    v35 = (uint64_t)v102;
LABEL_5:
    v32 += v103;
    --v31;
  }
  while (v31);
  swift_bridgeObjectRelease();
  return v34;
}

uint64_t sub_21FCDA6F8(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  uint64_t v20;
  _QWORD *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v33;
  unint64_t v34;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v3 = a2;
    v4 = 0;
    v31 = result + 32;
    v5 = a2 + 56;
    v28 = MEMORY[0x24BEE4AF8];
    v29 = *(_QWORD *)(result + 16);
    while (1)
    {
      if (v4 <= v2)
        v6 = v2;
      else
        v6 = v4;
      v34 = v6;
      while (1)
      {
        if (v4 == v34)
        {
          __break(1u);
          return result;
        }
        v7 = v31 + 32 * v4;
        v8 = *(_QWORD *)v7;
        v9 = *(_QWORD *)(v7 + 24);
        ++v4;
        v33 = *(_OWORD *)(v7 + 8);
        v10 = sub_21FCE54B8();
        v12 = v11;
        if (*(_QWORD *)(v3 + 16))
          break;
LABEL_8:
        result = swift_bridgeObjectRelease();
        if (v4 == v2)
          return v28;
      }
      v13 = v10;
      v30 = v8;
      sub_21FCE56EC();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_21FCE54D0();
      v14 = sub_21FCE5710();
      v15 = -1 << *(_BYTE *)(v3 + 32);
      v16 = v14 & ~v15;
      if (((*(_QWORD *)(v5 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
        goto LABEL_7;
      v17 = *(_QWORD *)(a2 + 48);
      v18 = (_QWORD *)(v17 + 16 * v16);
      v19 = *v18 == v13 && v18[1] == v12;
      if (!v19 && (sub_21FCE5674() & 1) == 0)
        break;
LABEL_24:
      swift_bridgeObjectRelease();
      v23 = v28;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_21FCD8294(0, *(_QWORD *)(v28 + 16) + 1, 1);
        v23 = v28;
      }
      v2 = v29;
      v24 = v30;
      v26 = *(_QWORD *)(v23 + 16);
      v25 = *(_QWORD *)(v23 + 24);
      if (v26 >= v25 >> 1)
      {
        result = (uint64_t)sub_21FCD8294((char *)(v25 > 1), v26 + 1, 1);
        v24 = v30;
        v23 = v28;
      }
      *(_QWORD *)(v23 + 16) = v26 + 1;
      v28 = v23;
      v27 = v23 + 32 * v26;
      *(_QWORD *)(v27 + 32) = v24;
      *(_OWORD *)(v27 + 40) = v33;
      *(_QWORD *)(v27 + 56) = v9;
      v3 = a2;
      if (v4 == v29)
        return v28;
    }
    v20 = ~v15;
    while (1)
    {
      v16 = (v16 + 1) & v20;
      if (((*(_QWORD *)(v5 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
        break;
      v21 = (_QWORD *)(v17 + 16 * v16);
      v22 = *v21 == v13 && v21[1] == v12;
      if (v22 || (sub_21FCE5674() & 1) != 0)
        goto LABEL_24;
    }
LABEL_7:
    swift_release();
    swift_bridgeObjectRelease();
    v3 = a2;
    v2 = v29;
    goto LABEL_8;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_21FCDA96C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v19[2];
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v5 = type metadata accessor for SymbolKey(0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v19 - v10;
  result = MEMORY[0x24BEE4AF8];
  v22 = MEMORY[0x24BEE4AF8];
  v13 = *(_QWORD *)(a1 + 16);
  if (v13)
  {
    v19[1] = v2;
    v14 = *(_QWORD *)(v9 + 72);
    v21 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v15 = a1 + v21;
    v16 = MEMORY[0x24BEE4AF8];
    v20 = a2;
    do
    {
      sub_21FCCB230(v15, (uint64_t)v11, type metadata accessor for SymbolKey);
      if ((sub_21FCD34F4((uint64_t)v11, a2) & 1) != 0)
      {
        sub_21FCCB274((uint64_t)v11, (uint64_t)v8, type metadata accessor for SymbolKey);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_21FCD824C(0, *(_QWORD *)(v16 + 16) + 1, 1);
        v16 = v22;
        v18 = *(_QWORD *)(v22 + 16);
        v17 = *(_QWORD *)(v22 + 24);
        if (v18 >= v17 >> 1)
        {
          sub_21FCD824C(v17 > 1, v18 + 1, 1);
          v16 = v22;
        }
        *(_QWORD *)(v16 + 16) = v18 + 1;
        sub_21FCCB274((uint64_t)v8, v16 + v21 + v18 * v14, type metadata accessor for SymbolKey);
        a2 = v20;
      }
      else
      {
        sub_21FCD196C((uint64_t)v11, type metadata accessor for SymbolKey);
      }
      v15 += v14;
      --v13;
    }
    while (v13);
    return v22;
  }
  return result;
}

uint64_t sub_21FCDAB28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _OWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _OWORD v41[11];
  uint64_t v42;

  v39 = a2;
  v36 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v36);
  v5 = (uint64_t *)((char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555733C8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SymbolKey(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v40 = (uint64_t)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v31 - v13;
  result = MEMORY[0x24BEE4AF8];
  v42 = MEMORY[0x24BEE4AF8];
  v16 = *(_QWORD *)(a1 + 16);
  if (v16)
  {
    v31 = v2;
    v17 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v38 = *(_QWORD *)(v12 + 72);
    v37 = v17;
    v18 = a1 + v17;
    v32 = v5 + 13;
    v19 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      sub_21FCCB230(v18, (uint64_t)v14, type metadata accessor for SymbolKey);
      SymbolMetadataStore.symbolMetadata(for:)((uint64_t)v14, (uint64_t)v8);
      v27 = type metadata accessor for SymbolMetadata(0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 48))(v8, 1, v27) == 1)
        break;
      sub_21FCCB230((uint64_t)v8, (uint64_t)v5, type metadata accessor for SymbolMetadata.Backing);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_21FCD196C((uint64_t)v5, type metadata accessor for SymbolMetadata.Backing);
        sub_21FCD196C((uint64_t)v8, type metadata accessor for SymbolMetadata);
        goto LABEL_10;
      }
      v35 = v5[2];
      v20 = v5[5];
      v33 = v5[6];
      v34 = v5[10];
      v21 = v32[7];
      v41[6] = v32[6];
      v41[7] = v21;
      v22 = v32[9];
      v41[8] = v32[8];
      v41[9] = v22;
      v23 = v32[3];
      v41[2] = v32[2];
      v41[3] = v23;
      v24 = v32[5];
      v41[4] = v32[4];
      v41[5] = v24;
      v25 = v32[1];
      v41[0] = *v32;
      v41[1] = v25;
      sub_21FCD20A4(v41);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21FCD196C((uint64_t)v8, type metadata accessor for SymbolMetadata);
      if (!v20)
        goto LABEL_10;
      swift_bridgeObjectRelease();
      sub_21FCD196C((uint64_t)v14, type metadata accessor for SymbolKey);
      v26 = v38;
LABEL_5:
      v18 += v26;
      if (!--v16)
        return v42;
    }
    sub_21FCDC0F4((uint64_t)v8, &qword_2555733C8);
LABEL_10:
    v28 = v5;
    sub_21FCCB274((uint64_t)v14, v40, type metadata accessor for SymbolKey);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_21FCD824C(0, *(_QWORD *)(v19 + 16) + 1, 1);
    v19 = v42;
    v30 = *(_QWORD *)(v42 + 16);
    v29 = *(_QWORD *)(v42 + 24);
    if (v30 >= v29 >> 1)
    {
      sub_21FCD824C(v29 > 1, v30 + 1, 1);
      v19 = v42;
    }
    *(_QWORD *)(v19 + 16) = v30 + 1;
    v26 = v38;
    sub_21FCCB274(v40, v19 + v37 + v30 * v38, type metadata accessor for SymbolKey);
    v5 = v28;
    goto LABEL_5;
  }
  return result;
}

uint64_t sub_21FCDAEF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *__return_ptr, char *);
  unint64_t v18;
  unint64_t v19;
  _QWORD v20[2];
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;

  v24 = a2;
  v4 = type metadata accessor for SymbolKey(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)v20 - v9;
  result = MEMORY[0x24BEE4AF8];
  v26 = MEMORY[0x24BEE4AF8];
  v23 = *(_QWORD *)(a1 + 16);
  if (v23)
  {
    v20[1] = v2;
    v12 = 0;
    v13 = *(_QWORD *)(v8 + 72);
    v21 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v22 = a1 + v21;
    v14 = MEMORY[0x24BEE4AF8];
    do
    {
      sub_21FCCB230(v22 + v13 * v12, (uint64_t)v10, type metadata accessor for SymbolKey);
      v27 = *(_QWORD *)(v24 + 40);
      v15 = *(_QWORD *)(v27 + 16);
      if (v15)
      {
        v16 = swift_bridgeObjectRetain() + 40;
        do
        {
          v17 = *(void (**)(char *__return_ptr, char *))(v16 - 8);
          swift_retain();
          v17(&v25, v10);
          swift_release();
          if (v25 != 1)
          {
            sub_21FCDC088((uint64_t)&v27);
            sub_21FCD196C((uint64_t)v10, type metadata accessor for SymbolKey);
            goto LABEL_4;
          }
          v16 += 16;
          --v15;
        }
        while (v15);
        sub_21FCDC088((uint64_t)&v27);
      }
      sub_21FCCB274((uint64_t)v10, (uint64_t)v7, type metadata accessor for SymbolKey);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_21FCD824C(0, *(_QWORD *)(v14 + 16) + 1, 1);
      v14 = v26;
      v19 = *(_QWORD *)(v26 + 16);
      v18 = *(_QWORD *)(v26 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_21FCD824C(v18 > 1, v19 + 1, 1);
        v14 = v26;
      }
      *(_QWORD *)(v14 + 16) = v19 + 1;
      sub_21FCCB274((uint64_t)v7, v14 + v21 + v19 * v13, type metadata accessor for SymbolKey);
LABEL_4:
      ++v12;
    }
    while (v12 != v23);
    return v26;
  }
  return result;
}

uint64_t sub_21FCDB108(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21FCDB16C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21FCDB1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t result;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *__return_ptr, char *);
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;

  v35 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555733C8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SymbolMetadata(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SymbolKey(0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v36 = (uint64_t)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v30 - v16;
  result = MEMORY[0x24BEE4AF8];
  v40 = MEMORY[0x24BEE4AF8];
  v38 = *(_QWORD *)(a1 + 16);
  if (v38)
  {
    v19 = 0;
    v20 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v21 = *(_QWORD *)(v15 + 72);
    v30[1] = v3;
    v31 = v20;
    v37 = a1 + v20;
    v22 = v21;
    v23 = MEMORY[0x24BEE4AF8];
    v32 = v21;
    v33 = v9;
    v34 = v8;
    while (1)
    {
      sub_21FCCB230(v37 + v22 * v19, (uint64_t)v17, type metadata accessor for SymbolKey);
      SymbolMetadataStore.symbolMetadata(for:)((uint64_t)v17, (uint64_t)v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
      {
        sub_21FCDC0F4((uint64_t)v7, &qword_2555733C8);
      }
      else
      {
        sub_21FCCB274((uint64_t)v7, (uint64_t)v11, type metadata accessor for SymbolMetadata);
        v41 = *(_QWORD *)(v35 + 48);
        v24 = *(_QWORD *)(v41 + 16);
        if (!v24)
        {
LABEL_12:
          sub_21FCD196C((uint64_t)v11, type metadata accessor for SymbolMetadata);
          sub_21FCCB274((uint64_t)v17, v36, type metadata accessor for SymbolKey);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            sub_21FCD824C(0, *(_QWORD *)(v23 + 16) + 1, 1);
          v23 = v40;
          v28 = *(_QWORD *)(v40 + 16);
          v27 = *(_QWORD *)(v40 + 24);
          if (v28 >= v27 >> 1)
          {
            sub_21FCD824C(v27 > 1, v28 + 1, 1);
            v23 = v40;
          }
          *(_QWORD *)(v23 + 16) = v28 + 1;
          v29 = v23 + v31 + v28 * v32;
          v22 = v32;
          sub_21FCCB274(v36, v29, type metadata accessor for SymbolKey);
          v9 = v33;
          v8 = v34;
          goto LABEL_5;
        }
        v25 = swift_bridgeObjectRetain() + 40;
        while (1)
        {
          v26 = *(void (**)(char *__return_ptr, char *))(v25 - 8);
          swift_retain();
          v26(&v39, v11);
          swift_release();
          if (v39 != 1)
            break;
          v25 += 16;
          if (!--v24)
          {
            sub_21FCDC088((uint64_t)&v41);
            goto LABEL_12;
          }
        }
        sub_21FCDC088((uint64_t)&v41);
        sub_21FCD196C((uint64_t)v11, type metadata accessor for SymbolMetadata);
        v9 = v33;
        v8 = v34;
        v22 = v32;
      }
      sub_21FCD196C((uint64_t)v17, type metadata accessor for SymbolKey);
LABEL_5:
      if (++v19 == v38)
        return v40;
    }
  }
  return result;
}

uint64_t sub_21FCDB4F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21FCDB53C()
{
  return sub_21FCDB568(&qword_2555733E0, type metadata accessor for SymbolKey, (uint64_t)&protocol conformance descriptor for SymbolKey);
}

uint64_t sub_21FCDB568(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2207D1938](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21FCDB5A8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(a1 + 112);
  return swift_bridgeObjectRetain();
}

uint64_t sub_21FCDB5B4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a2 + 112) = v3;
  return sub_21FCD5D50();
}

uint64_t *initializeBufferWithCopyOfBuffer for SymbolKey(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_21FCE5440();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t destroy for SymbolKey(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
  {
    v3 = sub_21FCE5440();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for SymbolKey(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_21FCE5440();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for SymbolKey(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_21FCD196C((uint64_t)a1, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_21FCE5440();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *initializeWithTake for SymbolKey(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_21FCE5440();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for SymbolKey(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_21FCD196C((uint64_t)a1, type metadata accessor for SymbolKey);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_21FCE5440();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolKey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SymbolKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_21FCDB974()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21FCDB984()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21FCE5440();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void destroy for SymbolMetadataStore(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 48))
    swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SymbolMetadataStore(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v20;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v8 = a2 + 6;
  v7 = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    v9 = a2[7];
    a1[6] = v7;
    a1[7] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *v8;
  }
  v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  v12 = a2[13];
  a1[12] = a2[12];
  a1[13] = v12;
  v13 = a2[15];
  a1[14] = a2[14];
  a1[15] = v13;
  v14 = a2[17];
  v20 = (void *)a2[16];
  a1[16] = v20;
  a1[17] = v14;
  v16 = a2[18];
  v15 = (void *)a2[19];
  a1[18] = v16;
  a1[19] = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = v20;
  swift_bridgeObjectRetain();
  v18 = v15;
  return a1;
}

_QWORD *assignWithCopy for SymbolMetadataStore(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[6];
  if (!a1[6])
  {
    if (v4)
    {
      v6 = a2[7];
      a1[6] = v4;
      a1[7] = v6;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[7];
  a1[6] = v4;
  a1[7] = v5;
  swift_retain();
  swift_release();
LABEL_8:
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[15] = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = (void *)a1[16];
  v8 = (void *)a2[16];
  a1[16] = v8;
  v9 = v8;

  a1[17] = a2[17];
  a1[18] = a2[18];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = (void *)a1[19];
  v11 = (void *)a2[19];
  a1[19] = v11;
  v12 = v11;

  return a1;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t assignWithTake for SymbolMetadataStore(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 48);
  if (!*(_QWORD *)(a1 + 48))
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 48) = v4;
      *(_QWORD *)(a1 + 56) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = v5;
  swift_release();
LABEL_8:
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 128);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);

  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRelease();
  v8 = *(void **)(a1 + 152);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);

  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolMetadataStore(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 160))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SymbolMetadataStore(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 160) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 160) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolMetadataStore()
{
  return &type metadata for SymbolMetadataStore;
}

uint64_t type metadata accessor for SymbolMetadataStore.RelevantSymbol(uint64_t a1)
{
  return sub_21FCDC054(a1, (uint64_t *)&unk_255573448);
}

uint64_t sub_21FCDC054(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21FCDC088(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21FCDC0B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CustomSymbol();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FCDC0F4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_21FCDC130(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v33;
  void *v34;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    type metadata accessor for SymbolMetadata.Backing(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = sub_21FCE5440();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
      v9 = *(int *)(type metadata accessor for CustomSymbol() + 20);
      v10 = &v6[v9];
      v11 = &v7[v9];
      v12 = *((_QWORD *)v11 + 1);
      *(_QWORD *)v10 = *(_QWORD *)v11;
      *((_QWORD *)v10 + 1) = v12;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_DWORD *)v6 = *(_DWORD *)v7;
      v14 = *((_QWORD *)v7 + 2);
      *((_QWORD *)v6 + 1) = *((_QWORD *)v7 + 1);
      *((_QWORD *)v6 + 2) = v14;
      v6[24] = v7[24];
      v15 = *((_QWORD *)v7 + 5);
      *((_QWORD *)v6 + 4) = *((_QWORD *)v7 + 4);
      *((_QWORD *)v6 + 5) = v15;
      v16 = *((_QWORD *)v7 + 7);
      *((_QWORD *)v6 + 6) = *((_QWORD *)v7 + 6);
      *((_QWORD *)v6 + 7) = v16;
      v6[64] = v7[64];
      v17 = *((_QWORD *)v7 + 10);
      *((_QWORD *)v6 + 9) = *((_QWORD *)v7 + 9);
      *((_QWORD *)v6 + 10) = v17;
      v6[88] = v7[88];
      v18 = *((_QWORD *)v7 + 13);
      *((_QWORD *)v6 + 12) = *((_QWORD *)v7 + 12);
      *((_QWORD *)v6 + 13) = v18;
      v19 = *((_QWORD *)v7 + 15);
      *((_QWORD *)v6 + 14) = *((_QWORD *)v7 + 14);
      *((_QWORD *)v6 + 15) = v19;
      v20 = *((_QWORD *)v7 + 17);
      *((_QWORD *)v6 + 16) = *((_QWORD *)v7 + 16);
      *((_QWORD *)v6 + 17) = v20;
      *((_QWORD *)v6 + 18) = *((_QWORD *)v7 + 18);
      v33 = *((_QWORD *)v7 + 19);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v33)
      {
        v21 = *((_QWORD *)v7 + 20);
        *((_QWORD *)v6 + 19) = v33;
        *((_QWORD *)v6 + 20) = v21;
        swift_retain();
      }
      else
      {
        *(_OWORD *)(v6 + 152) = *(_OWORD *)(v7 + 152);
      }
      v22 = *((_QWORD *)v7 + 22);
      *((_QWORD *)v6 + 21) = *((_QWORD *)v7 + 21);
      *((_QWORD *)v6 + 22) = v22;
      v23 = *((_QWORD *)v7 + 24);
      *((_QWORD *)v6 + 23) = *((_QWORD *)v7 + 23);
      *((_QWORD *)v6 + 24) = v23;
      v24 = *((_QWORD *)v7 + 26);
      *((_QWORD *)v6 + 25) = *((_QWORD *)v7 + 25);
      *((_QWORD *)v6 + 26) = v24;
      v25 = *((_QWORD *)v7 + 28);
      *((_QWORD *)v6 + 27) = *((_QWORD *)v7 + 27);
      *((_QWORD *)v6 + 28) = v25;
      v27 = (void *)*((_QWORD *)v7 + 29);
      v26 = *((_QWORD *)v7 + 30);
      *((_QWORD *)v6 + 29) = v27;
      *((_QWORD *)v6 + 30) = v26;
      v28 = *((_QWORD *)v7 + 31);
      v29 = (void *)*((_QWORD *)v7 + 32);
      v34 = v27;
      *((_QWORD *)v6 + 31) = v28;
      *((_QWORD *)v6 + 32) = v29;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v30 = v34;
      swift_bridgeObjectRetain();
      v31 = v29;
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

void sub_21FCDC3C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  type metadata accessor for SymbolMetadata.Backing(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_21FCE5440();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
    type metadata accessor for CustomSymbol();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v2 + 152))
      swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
}

_QWORD *sub_21FCDC500(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD *v32;

  v3 = a1;
  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  type metadata accessor for SymbolMetadata.Backing(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_21FCE5440();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
    v8 = *(int *)(type metadata accessor for CustomSymbol() + 20);
    v9 = &v5[v8];
    v10 = &v6[v8];
    v11 = *((_QWORD *)v10 + 1);
    *(_QWORD *)v9 = *(_QWORD *)v10;
    *((_QWORD *)v9 + 1) = v11;
    swift_bridgeObjectRetain();
  }
  else
  {
    v32 = v3;
    *(_DWORD *)v5 = *(_DWORD *)v6;
    v12 = *((_QWORD *)v6 + 2);
    *((_QWORD *)v5 + 1) = *((_QWORD *)v6 + 1);
    *((_QWORD *)v5 + 2) = v12;
    v5[24] = v6[24];
    v13 = *((_QWORD *)v6 + 5);
    *((_QWORD *)v5 + 4) = *((_QWORD *)v6 + 4);
    *((_QWORD *)v5 + 5) = v13;
    v14 = *((_QWORD *)v6 + 7);
    *((_QWORD *)v5 + 6) = *((_QWORD *)v6 + 6);
    *((_QWORD *)v5 + 7) = v14;
    v5[64] = v6[64];
    v15 = *((_QWORD *)v6 + 10);
    *((_QWORD *)v5 + 9) = *((_QWORD *)v6 + 9);
    *((_QWORD *)v5 + 10) = v15;
    v5[88] = v6[88];
    v16 = *((_QWORD *)v6 + 13);
    *((_QWORD *)v5 + 12) = *((_QWORD *)v6 + 12);
    *((_QWORD *)v5 + 13) = v16;
    v17 = *((_QWORD *)v6 + 15);
    *((_QWORD *)v5 + 14) = *((_QWORD *)v6 + 14);
    *((_QWORD *)v5 + 15) = v17;
    v29 = *((_QWORD *)v6 + 17);
    *((_QWORD *)v5 + 16) = *((_QWORD *)v6 + 16);
    *((_QWORD *)v5 + 17) = v29;
    *((_QWORD *)v5 + 18) = *((_QWORD *)v6 + 18);
    v30 = *((_QWORD *)v6 + 19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v30)
    {
      v18 = *((_QWORD *)v6 + 20);
      *((_QWORD *)v5 + 19) = v30;
      *((_QWORD *)v5 + 20) = v18;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(v5 + 152) = *(_OWORD *)(v6 + 152);
    }
    v19 = *((_QWORD *)v6 + 22);
    *((_QWORD *)v5 + 21) = *((_QWORD *)v6 + 21);
    *((_QWORD *)v5 + 22) = v19;
    v20 = *((_QWORD *)v6 + 24);
    *((_QWORD *)v5 + 23) = *((_QWORD *)v6 + 23);
    *((_QWORD *)v5 + 24) = v20;
    v21 = *((_QWORD *)v6 + 26);
    *((_QWORD *)v5 + 25) = *((_QWORD *)v6 + 25);
    *((_QWORD *)v5 + 26) = v21;
    v22 = *((_QWORD *)v6 + 28);
    *((_QWORD *)v5 + 27) = *((_QWORD *)v6 + 27);
    *((_QWORD *)v5 + 28) = v22;
    v23 = *((_QWORD *)v6 + 30);
    v31 = (void *)*((_QWORD *)v6 + 29);
    *((_QWORD *)v5 + 29) = v31;
    *((_QWORD *)v5 + 30) = v23;
    v25 = *((_QWORD *)v6 + 31);
    v24 = (void *)*((_QWORD *)v6 + 32);
    *((_QWORD *)v5 + 31) = v25;
    *((_QWORD *)v5 + 32) = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26 = v31;
    swift_bridgeObjectRetain();
    v27 = v24;
    v3 = v32;
  }
  swift_storeEnumTagMultiPayload();
  return v3;
}

_QWORD *sub_21FCDC75C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v16;
  void *v17;

  *a1 = *a2;
  if (a1 != a2)
  {
    v4 = *(int *)(a3 + 20);
    v5 = (char *)a1 + v4;
    v6 = (char *)a2 + v4;
    sub_21FCD196C((uint64_t)a1 + v4, type metadata accessor for SymbolMetadata.Backing);
    type metadata accessor for SymbolMetadata.Backing(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_21FCE5440();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
      v8 = *(int *)(type metadata accessor for CustomSymbol() + 20);
      v9 = &v5[v8];
      v10 = &v6[v8];
      *(_QWORD *)v9 = *(_QWORD *)v10;
      *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_DWORD *)v5 = *(_DWORD *)v6;
      *((_QWORD *)v5 + 1) = *((_QWORD *)v6 + 1);
      *((_QWORD *)v5 + 2) = *((_QWORD *)v6 + 2);
      v5[24] = v6[24];
      *((_QWORD *)v5 + 4) = *((_QWORD *)v6 + 4);
      *((_QWORD *)v5 + 5) = *((_QWORD *)v6 + 5);
      *((_QWORD *)v5 + 6) = *((_QWORD *)v6 + 6);
      *((_QWORD *)v5 + 7) = *((_QWORD *)v6 + 7);
      v5[64] = v6[64];
      *((_QWORD *)v5 + 9) = *((_QWORD *)v6 + 9);
      *((_QWORD *)v5 + 10) = *((_QWORD *)v6 + 10);
      v5[88] = v6[88];
      *((_QWORD *)v5 + 12) = *((_QWORD *)v6 + 12);
      *((_QWORD *)v5 + 13) = *((_QWORD *)v6 + 13);
      *((_QWORD *)v5 + 14) = *((_QWORD *)v6 + 14);
      *((_QWORD *)v5 + 15) = *((_QWORD *)v6 + 15);
      *((_QWORD *)v5 + 16) = *((_QWORD *)v6 + 16);
      *((_QWORD *)v5 + 17) = *((_QWORD *)v6 + 17);
      *((_QWORD *)v5 + 18) = *((_QWORD *)v6 + 18);
      v16 = *((_QWORD *)v6 + 19);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v16)
      {
        v11 = *((_QWORD *)v6 + 20);
        *((_QWORD *)v5 + 19) = v16;
        *((_QWORD *)v5 + 20) = v11;
        swift_retain();
      }
      else
      {
        *(_OWORD *)(v5 + 152) = *(_OWORD *)(v6 + 152);
      }
      *((_QWORD *)v5 + 21) = *((_QWORD *)v6 + 21);
      *((_QWORD *)v5 + 22) = *((_QWORD *)v6 + 22);
      *((_QWORD *)v5 + 23) = *((_QWORD *)v6 + 23);
      *((_QWORD *)v5 + 24) = *((_QWORD *)v6 + 24);
      *((_QWORD *)v5 + 25) = *((_QWORD *)v6 + 25);
      *((_QWORD *)v5 + 26) = *((_QWORD *)v6 + 26);
      *((_QWORD *)v5 + 27) = *((_QWORD *)v6 + 27);
      *((_QWORD *)v5 + 28) = *((_QWORD *)v6 + 28);
      v17 = (void *)*((_QWORD *)v6 + 29);
      *((_QWORD *)v5 + 29) = v17;
      *((_QWORD *)v5 + 30) = *((_QWORD *)v6 + 30);
      *((_QWORD *)v5 + 31) = *((_QWORD *)v6 + 31);
      v12 = (void *)*((_QWORD *)v6 + 32);
      *((_QWORD *)v5 + 32) = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13 = v17;
      swift_bridgeObjectRetain();
      v14 = v12;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *sub_21FCDCA4C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = type metadata accessor for SymbolMetadata.Backing(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_21FCE5440();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    v9 = type metadata accessor for CustomSymbol();
    *(_OWORD *)&v5[*(int *)(v9 + 20)] = *(_OWORD *)&v6[*(int *)(v9 + 20)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

_QWORD *sub_21FCDCB04(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  if (a1 != a2)
  {
    v4 = *(int *)(a3 + 20);
    v5 = (char *)a1 + v4;
    v6 = (char *)a2 + v4;
    sub_21FCD196C((uint64_t)a1 + v4, type metadata accessor for SymbolMetadata.Backing);
    v7 = type metadata accessor for SymbolMetadata.Backing(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = sub_21FCE5440();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
      v9 = type metadata accessor for CustomSymbol();
      *(_OWORD *)&v5[*(int *)(v9 + 20)] = *(_OWORD *)&v6[*(int *)(v9 + 20)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_21FCDCBD4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FCDCBE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = type metadata accessor for SymbolMetadata(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t sub_21FCDCC20()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FCDCC2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = type metadata accessor for SymbolMetadata(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t sub_21FCDCC70()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SymbolMetadata.Backing(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

BOOL sub_21FCDCCE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  int *v5;
  int *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (*(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32))
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = (int *)(a1 + 36);
  v6 = (int *)(a2 + 36);
  do
  {
    v8 = *v5++;
    v7 = v8;
    v10 = *v6++;
    v9 = v10;
    v12 = v4-- != 0;
    result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t sub_21FCDCD5C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_21FCE5674(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_21FCE5674() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

BOOL sub_21FCDCE20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32))
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = (unsigned __int8 *)(a1 + 33);
  v6 = (unsigned __int8 *)(a2 + 33);
  do
  {
    v8 = *v5++;
    v7 = v8;
    v10 = *v6++;
    v9 = v10;
    v12 = v4-- != 0;
    result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

void static Crypton.encryptObfuscateFontTable(tableTag:from:)(CTFontTableTag table, CTFontRef font)
{
  CFDataRef v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = CTFontCopyTable(font, table, 0);
  if (v2)
  {
    v3 = sub_21FCE5410();
    v5 = v4;

    sub_21FCDCFAC(0, v3, v5);
    if (v6 >> 60 == 15)
      __break(1u);
    else
      sub_21FCCB3E0(v3, v5);
  }
}

CFDataRef static Crypton.decryptObfuscatedFontTable(tableTag:from:)(CTFontTableTag table, CTFontRef font)
{
  CFDataRef v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  const __CFData *v6;

  v2 = CTFontCopyTable(font, table, 0);
  if (v2)
  {
    v3 = sub_21FCE5410();
    v5 = v4;

    sub_21FCDCFAC(1, v3, v5);
    v2 = v6;
    sub_21FCCB3E0(v3, v5);
  }
  return v2;
}

void sub_21FCDCFAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X10 }
}

void sub_21FCDD024()
{
  char v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 - 136);
  if (!__OFADD__(v3, 8 * v0))
  {
    *(_QWORD *)(v2 - 112) = sub_21FCDDB30(v3 + 8 * v0);
    *(_QWORD *)(v2 - 104) = v4;
    __asm { BR              X10 }
  }
  __break(1u);
  JUMPOUT(0x21FCDDAA0);
}

ValueMetadata *type metadata accessor for Crypton()
{
  return &type metadata for Crypton;
}

uint64_t sub_21FCDDB30(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_21FCE5350();
      swift_allocObject();
      sub_21FCE5338();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_21FCE53F8();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

SFSymbols::Version_optional __swiftcall Version.init(string:)(Swift::String string)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  Swift::Int isUniquelyReferenced_nonNull_native;
  Swift::Int v15;
  Swift::Bool v16;
  uint64_t v17;
  Swift::Int v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unsigned __int8 *v39;
  unsigned int v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  SFSymbols::Version_optional result;

  object = string._object;
  countAndFlagsBits = string._countAndFlagsBits;
  v4 = v1;
  v5 = sub_21FCE5320();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = countAndFlagsBits;
  v55 = (uint64_t)object;
  sub_21FCE52E4();
  sub_21FCCFF3C();
  v9 = sub_21FCE5590();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  v54 = v9;
  v55 = v11;
  v52 = 46;
  v53 = 0xE100000000000000;
  v12 = sub_21FCE5584();
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(v12 + 16);
  if (v13 - 4 < 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_59:
    isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    *(_QWORD *)(v4 + 16) = 0;
    *(_BYTE *)(v4 + 24) = 1;
    goto LABEL_71;
  }
  v50 = (char *)&v54 + 1;
  v51 = (char *)&v54 + 2;
  isUniquelyReferenced_nonNull_native = swift_bridgeObjectRetain();
  v17 = 0;
  v18 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v19 = (uint64_t *)(v12 + 32 + 16 * v17);
    v20 = *v19;
    v21 = v19[1];
    v22 = HIBYTE(v21) & 0xF;
    v23 = v20 & 0xFFFFFFFFFFFFLL;
    if ((v21 & 0x2000000000000000) != 0)
      v24 = HIBYTE(v21) & 0xF;
    else
      v24 = v20 & 0xFFFFFFFFFFFFLL;
    if (!v24)
      goto LABEL_4;
    if ((v21 & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v27 = (uint64_t)sub_21FCDF404(v20, v21, 10);
      v43 = v42;
      isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
      if ((v43 & 1) == 0)
        goto LABEL_41;
      goto LABEL_4;
    }
    if ((v21 & 0x2000000000000000) != 0)
      break;
    if ((v20 & 0x1000000000000000) != 0)
      v25 = (unsigned __int8 *)((v21 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v25 = (unsigned __int8 *)sub_21FCE55E4();
    isUniquelyReferenced_nonNull_native = (Swift::Int)sub_21FCDF700(v25, v23, 10);
    if ((v26 & 1) == 0)
    {
      v27 = isUniquelyReferenced_nonNull_native;
LABEL_41:
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = (Swift::Int)sub_21FCDEB20(0, *(_QWORD *)(v18 + 16) + 1, 1, (char *)v18);
        v18 = isUniquelyReferenced_nonNull_native;
      }
      v38 = *(_QWORD *)(v18 + 16);
      v37 = *(_QWORD *)(v18 + 24);
      if (v38 >= v37 >> 1)
      {
        isUniquelyReferenced_nonNull_native = (Swift::Int)sub_21FCDEB20((char *)(v37 > 1), v38 + 1, 1, (char *)v18);
        v18 = isUniquelyReferenced_nonNull_native;
      }
      *(_QWORD *)(v18 + 16) = v38 + 1;
      *(_QWORD *)(v18 + 8 * v38 + 32) = v27;
    }
LABEL_4:
    if (++v17 == v13)
    {
      swift_bridgeObjectRelease();
      v44 = *(_QWORD *)(v18 + 16);
      isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
      if (v44 != v13)
        goto LABEL_59;
      v45 = *(_QWORD *)(v18 + 16);
      if (!v45)
        goto LABEL_68;
      v46 = *(_QWORD *)(v18 + 32);
      if (v13 >= 2)
      {
        if (v45 < 2)
          goto LABEL_69;
        v48 = *(_QWORD *)(v18 + 40);
        if (v13 >= 3)
        {
          if (v45 < 3)
            goto LABEL_70;
          v47 = *(_QWORD *)(v18 + 48);
        }
        else
        {
          v47 = 0;
        }
      }
      else
      {
        v47 = 0;
        v48 = 0;
      }
      isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
      *(_QWORD *)v4 = v46;
      *(_QWORD *)(v4 + 8) = v48;
      *(_QWORD *)(v4 + 16) = v47;
      *(_BYTE *)(v4 + 24) = 0;
      goto LABEL_71;
    }
  }
  v54 = v20;
  v55 = v21 & 0xFFFFFFFFFFFFFFLL;
  if (v20 == 43)
  {
    if (!v22)
      goto LABEL_67;
    if (v22 == 1 || (BYTE1(v20) - 48) > 9u)
      goto LABEL_4;
    v27 = (BYTE1(v20) - 48);
    v32 = v22 - 2;
    if (v22 != 2)
    {
      v33 = (unsigned __int8 *)v51;
      while (1)
      {
        v34 = *v33 - 48;
        if (v34 > 9)
          goto LABEL_4;
        v35 = 10 * v27;
        if ((unsigned __int128)(v27 * (__int128)10) >> 64 != (10 * v27) >> 63)
          goto LABEL_4;
        v27 = v35 + v34;
        if (__OFADD__(v35, v34))
          goto LABEL_4;
        ++v33;
        if (!--v32)
          goto LABEL_41;
      }
    }
    goto LABEL_41;
  }
  if (v20 != 45)
  {
    if (v22 && (v20 - 48) <= 9u)
    {
      v27 = (v20 - 48);
      v36 = v22 - 1;
      if (v22 != 1)
      {
        v39 = (unsigned __int8 *)v50;
        while (1)
        {
          v40 = *v39 - 48;
          if (v40 > 9)
            goto LABEL_4;
          v41 = 10 * v27;
          if ((unsigned __int128)(v27 * (__int128)10) >> 64 != (10 * v27) >> 63)
            goto LABEL_4;
          v27 = v41 + v40;
          if (__OFADD__(v41, v40))
            goto LABEL_4;
          ++v39;
          if (!--v36)
            goto LABEL_41;
        }
      }
      goto LABEL_41;
    }
    goto LABEL_4;
  }
  if (v22)
  {
    if (v22 != 1 && (BYTE1(v20) - 48) <= 9u)
    {
      v27 = -(uint64_t)(BYTE1(v20) - 48);
      v28 = v22 - 2;
      if (v22 != 2)
      {
        v29 = (unsigned __int8 *)v51;
        while (1)
        {
          v30 = *v29 - 48;
          if (v30 > 9)
            goto LABEL_4;
          v31 = 10 * v27;
          if ((unsigned __int128)(v27 * (__int128)10) >> 64 != (10 * v27) >> 63)
            goto LABEL_4;
          v27 = v31 - v30;
          if (__OFSUB__(v31, v30))
            goto LABEL_4;
          ++v29;
          if (!--v28)
            goto LABEL_41;
        }
      }
      goto LABEL_41;
    }
    goto LABEL_4;
  }
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  result.value.patch = v15;
  result.value.minor = v23;
  result.value.major = isUniquelyReferenced_nonNull_native;
  result.is_nil = v16;
  return result;
}

SFSymbols::Version __swiftcall Version.init(major:minor:patch:)(Swift::Int major, Swift::Int minor, Swift::Int patch)
{
  Swift::Int *v3;
  SFSymbols::Version result;

  *v3 = major;
  v3[1] = minor;
  v3[2] = patch;
  result.patch = patch;
  result.minor = minor;
  result.major = major;
  return result;
}

uint64_t Version.major.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t Version.minor.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t Version.patch.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t Version.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  void *v7;
  Swift::String v8;
  uint64_t *v9;
  __int128 v11;
  uint64_t v12;
  char v13;
  _QWORD v14[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FCE571C();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v14, v14[3]);
    v5 = sub_21FCE5680();
    v7 = v6;
    swift_bridgeObjectRetain();
    v8._countAndFlagsBits = v5;
    v8._object = v7;
    Version.init(string:)(v8);
    if (v13 == 1)
    {
      sub_21FCDF4E8();
      swift_allocError();
      *v9 = v5;
      v9[1] = (uint64_t)v7;
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    }
    else
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      *(_OWORD *)a2 = v11;
      *(_QWORD *)(a2 + 16) = v12;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t Version.encode(to:)(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FCE5734();
  Version.description.getter();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_21FCE568C();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

uint64_t Version.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  int64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573460);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21FCE6CC0;
  *(_QWORD *)(inited + 32) = v1;
  *(_QWORD *)(inited + 40) = v2;
  if (v3)
  {
    v5 = 3;
    v6 = sub_21FCDEB20((char *)1, 3, 1, (char *)inited);
    *((_QWORD *)v6 + 2) = 3;
    *((_QWORD *)v6 + 6) = v3;
  }
  else
  {
    v5 = 2;
  }
  v28 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  sub_21FCD8230(0, v5, 0);
  v7 = v28;
  v8 = sub_21FCE5668();
  v10 = v9;
  v12 = *(_QWORD *)(v28 + 16);
  v11 = *(_QWORD *)(v28 + 24);
  if (v12 >= v11 >> 1)
  {
    sub_21FCD8230((char *)(v11 > 1), v12 + 1, 1);
    v7 = v28;
  }
  *(_QWORD *)(v7 + 16) = v12 + 1;
  v13 = v7 + 16 * v12;
  *(_QWORD *)(v13 + 32) = v8;
  *(_QWORD *)(v13 + 40) = v10;
  v14 = sub_21FCE5668();
  v16 = v15;
  v18 = *(_QWORD *)(v7 + 16);
  v17 = *(_QWORD *)(v7 + 24);
  if (v18 >= v17 >> 1)
    sub_21FCD8230((char *)(v17 > 1), v18 + 1, 1);
  *(_QWORD *)(v7 + 16) = v18 + 1;
  v19 = v7 + 16 * v18;
  *(_QWORD *)(v19 + 32) = v14;
  *(_QWORD *)(v19 + 40) = v16;
  if (v3)
  {
    v20 = sub_21FCE5668();
    v22 = v21;
    v24 = *(_QWORD *)(v7 + 16);
    v23 = *(_QWORD *)(v7 + 24);
    if (v24 >= v23 >> 1)
      sub_21FCD8230((char *)(v23 > 1), v24 + 1, 1);
    *(_QWORD *)(v7 + 16) = v24 + 1;
    v25 = v7 + 16 * v24;
    *(_QWORD *)(v25 + 32) = v20;
    *(_QWORD *)(v25 + 40) = v22;
  }
  swift_bridgeObjectRelease_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573078);
  sub_21FCD19A8();
  v26 = sub_21FCE5464();
  swift_bridgeObjectRelease();
  return v26;
}

BOOL static Version.< infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  v6 = v3 == v5;
  v7 = v3 < v5;
  if (v6)
    v7 = a1[2] < a2[2];
  v6 = v2 == v4;
  v8 = v2 < v4;
  if (v6)
    return v7;
  else
    return v8;
}

uint64_t Version.hash(into:)()
{
  sub_21FCE56F8();
  sub_21FCE56F8();
  return sub_21FCE56F8();
}

BOOL static Version.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t Version.hashValue.getter()
{
  sub_21FCE56EC();
  sub_21FCE56F8();
  sub_21FCE56F8();
  sub_21FCE56F8();
  return sub_21FCE5710();
}

uint64_t sub_21FCDE5FC()
{
  sub_21FCE56EC();
  sub_21FCE56F8();
  sub_21FCE56F8();
  sub_21FCE56F8();
  return sub_21FCE5710();
}

uint64_t sub_21FCDE664()
{
  sub_21FCE56F8();
  sub_21FCE56F8();
  return sub_21FCE56F8();
}

uint64_t sub_21FCDE6A8()
{
  sub_21FCE56EC();
  sub_21FCE56F8();
  sub_21FCE56F8();
  sub_21FCE56F8();
  return sub_21FCE5710();
}

BOOL sub_21FCDE70C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  _BOOL4 v5;

  v2 = a1[1];
  v3 = a2[1];
  v4 = v2 == v3;
  v5 = v2 < v3;
  if (v4)
    v5 = a1[2] < a2[2];
  if (*a1 == *a2)
    return v5;
  else
    return *a1 < *a2;
}

BOOL sub_21FCDE744(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v2 = a1[1];
  v3 = a2[1];
  v4 = v3 == v2;
  v5 = v3 < v2;
  if (v4)
    v5 = a2[2] < a1[2];
  if (*a2 == *a1)
    v6 = v5;
  else
    v6 = *a2 < *a1;
  return !v6;
}

BOOL sub_21FCDE780(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v2 = a1[1];
  v3 = a2[1];
  v4 = v2 == v3;
  v5 = v2 < v3;
  if (v4)
    v5 = a1[2] < a2[2];
  if (*a1 == *a2)
    v6 = v5;
  else
    v6 = *a1 < *a2;
  return !v6;
}

BOOL sub_21FCDE7BC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  _BOOL4 v5;

  v2 = a1[1];
  v3 = a2[1];
  v4 = v3 == v2;
  v5 = v3 < v2;
  if (v4)
    v5 = a2[2] < a1[2];
  if (*a2 == *a1)
    return v5;
  else
    return *a2 < *a1;
}

uint64_t sub_21FCDE7F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Version.init(from:)(a1, a2);
}

uint64_t sub_21FCDE80C(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FCE5734();
  Version.description.getter();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_21FCE568C();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

BOOL sub_21FCDE8D0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

char *sub_21FCDE900(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3CEC8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_21FCDEA00(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555734A8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573078);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21FCDEB20(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573460);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21FCDEC18(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573498);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 104);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[104 * v8])
      memmove(v12, v13, 104 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21FCDED34(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573440);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21FCDEE2C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555734A0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21FCDEF24(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573488);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_21FCDF00C(size_t a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_21FCDF048(a1, a2, a3, a4, &qword_255573420, type metadata accessor for SymbolKey);
}

size_t sub_21FCDF020(size_t a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_21FCDF048(a1, a2, a3, a4, &qword_255573408, type metadata accessor for SymbolMetadataStore.RelevantSymbol);
}

size_t sub_21FCDF034(size_t a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_21FCDF048(a1, a2, a3, a4, &qword_255573490, type metadata accessor for SymbolMetadata);
}

size_t sub_21FCDF048(size_t result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  unint64_t v19;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_29;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  v18 = *(_QWORD *)(a6(0) - 8);
  if ((v8 & 1) != 0)
  {
    if (v16 < a4
      || (v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(_QWORD *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v16;
}

_QWORD *sub_21FCDF1BC(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_21FCDF1D4(a1, a2, a3, a4, &qword_255573480);
}

_QWORD *sub_21FCDF1C8(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_21FCDF1D4(a1, a2, a3, a4, &qword_255573470);
}

_QWORD *sub_21FCDF1D4(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = a4[3];
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = a4[2];
  if (v8 <= v9)
    v10 = a4[2];
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (_QWORD *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    v11[2] = v9;
    v11[3] = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[2 * v9 + 4])
      memmove(v11 + 4, a4 + 4, 16 * v9);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573478);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_21FCDF2F0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255573418);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unsigned __int8 *sub_21FCDF3F0(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_21FCDF97C(a1, a2, a3);
}

unsigned __int8 *sub_21FCDF404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_21FCE5524();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_21FCDFBFC();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_21FCE55E4();
  }
LABEL_7:
  v11 = sub_21FCDF700(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_21FCDF4E8()
{
  unint64_t result;

  result = qword_255573458;
  if (!qword_255573458)
  {
    result = MEMORY[0x2207D1938](&unk_21FCE6E28, &type metadata for Version.DecodingError);
    atomic_store(result, (unint64_t *)&qword_255573458);
  }
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_21FCDF558()
{
  unint64_t result;

  result = qword_255573468;
  if (!qword_255573468)
  {
    result = MEMORY[0x2207D1938](&protocol conformance descriptor for Version, &type metadata for Version);
    atomic_store(result, (unint64_t *)&qword_255573468);
  }
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Version(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Version(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Version()
{
  return &type metadata for Version;
}

ValueMetadata *type metadata accessor for Version.DecodingError()
{
  return &type metadata for Version.DecodingError;
}

uint64_t sub_21FCDF61C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_21FCE5524();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_21FCDFBFC();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_21FCE55E4();
  }
LABEL_7:
  v11 = sub_21FCDF97C(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_21FCDF700(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  v13 = 0;
                  if (v11 < 0x61 || v11 >= v8)
                    return (unsigned __int8 *)v13;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v14 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v14 - (v11 + v12);
              if (__OFSUB__(v14, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      v23 = a3 + 48;
      v24 = a3 + 55;
      v25 = a3 + 87;
      if (a3 > 10)
      {
        v23 = 58;
      }
      else
      {
        v25 = 97;
        v24 = 65;
      }
      if (result)
      {
        v26 = 0;
        do
        {
          v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              v13 = 0;
              if (v27 < 0x61 || v27 >= v25)
                return (unsigned __int8 *)v13;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v29 = v26 * a3;
          if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
            return 0;
          v26 = v29 + (v27 + v28);
          if (__OFADD__(v29, (v27 + v28)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  v15 = a2 - 1;
  if (a2 == 1)
    return 0;
  v16 = a3 + 48;
  v17 = a3 + 55;
  v18 = a3 + 87;
  if (a3 > 10)
  {
    v16 = 58;
  }
  else
  {
    v18 = 97;
    v17 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v19 = result + 1;
  do
  {
    v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        v13 = 0;
        if (v20 < 0x61 || v20 >= v18)
          return (unsigned __int8 *)v13;
        v21 = -87;
      }
      else
      {
        v21 = -55;
      }
    }
    else
    {
      v21 = -48;
    }
    v22 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v22 + (v20 + v21);
    if (__OFADD__(v22, (v20 + v21)))
      return 0;
    ++v19;
    --v15;
  }
  while (v15);
  return (unsigned __int8 *)v9;
}

unsigned __int8 *sub_21FCDF97C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  unint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  unint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__CFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__CFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (v14 < v15)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21FCDFBFC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_21FCE5530();
  v4 = sub_21FCDFC78(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21FCDFC78(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_21FCDFDBC(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_21FCDFEA8(v9, 0);
      v12 = sub_21FCDFF0C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x2207D1320](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x2207D1320);
LABEL_9:
      sub_21FCE55E4();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2207D1320]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_21FCDFDBC(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_21FCE011C(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_21FCE011C(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_21FCE5500();
  }
  __break(1u);
  return result;
}

_QWORD *sub_21FCDFEA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255573488);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_21FCDFF0C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_21FCE011C(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_21FCE550C();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_21FCE55E4();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_21FCE011C(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_21FCE54E8();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_21FCE011C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_21FCE5518();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2207D1350](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unint64_t SymbolMetadata.privateScalar.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  int EnumCaseMultiPayload;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[10];

  v1 = v0;
  v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (unsigned int *)((char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21FCD1764(v1, (uint64_t)v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    sub_21FCD196C((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    v6 = 0;
  }
  else
  {
    v6 = *v4;
    v7 = *(_OWORD *)(v4 + 54);
    v13[6] = *(_OWORD *)(v4 + 50);
    v13[7] = v7;
    v8 = *(_OWORD *)(v4 + 62);
    v13[8] = *(_OWORD *)(v4 + 58);
    v13[9] = v8;
    v9 = *(_OWORD *)(v4 + 38);
    v13[2] = *(_OWORD *)(v4 + 34);
    v13[3] = v9;
    v10 = *(_OWORD *)(v4 + 46);
    v13[4] = *(_OWORD *)(v4 + 42);
    v13[5] = v10;
    v11 = *(_OWORD *)(v4 + 30);
    v13[0] = *(_OWORD *)(v4 + 26);
    v13[1] = v11;
    sub_21FCD20A4(v13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v6 | ((unint64_t)(EnumCaseMultiPayload == 1) << 32);
}

uint64_t type metadata accessor for SymbolMetadata.Backing(uint64_t a1)
{
  return sub_21FCDC054(a1, (uint64_t *)&unk_2555734C0);
}

uint64_t SymbolMetadata.publicScalars.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v12[10];

  v1 = v0;
  v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCD1764(v1, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    v5 = *((_QWORD *)v4 + 6);
    v6 = *(_OWORD *)(v4 + 216);
    v12[6] = *(_OWORD *)(v4 + 200);
    v12[7] = v6;
    v7 = *(_OWORD *)(v4 + 248);
    v12[8] = *(_OWORD *)(v4 + 232);
    v12[9] = v7;
    v8 = *(_OWORD *)(v4 + 152);
    v12[2] = *(_OWORD *)(v4 + 136);
    v12[3] = v8;
    v9 = *(_OWORD *)(v4 + 184);
    v12[4] = *(_OWORD *)(v4 + 168);
    v12[5] = v9;
    v10 = *(_OWORD *)(v4 + 120);
    v12[0] = *(_OWORD *)(v4 + 104);
    v12[1] = v10;
    sub_21FCD20A4(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t SymbolMetadata.name.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v14[10];

  v1 = type metadata accessor for CustomSymbol();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCD1764(v0, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD1928((uint64_t)v6, (uint64_t)v3);
    v7 = *(_QWORD *)&v3[*(int *)(v1 + 20)];
    swift_bridgeObjectRetain();
    sub_21FCD196C((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
  }
  else
  {
    v7 = *((_QWORD *)v6 + 1);
    v8 = *(_OWORD *)(v6 + 216);
    v14[6] = *(_OWORD *)(v6 + 200);
    v14[7] = v8;
    v9 = *(_OWORD *)(v6 + 248);
    v14[8] = *(_OWORD *)(v6 + 232);
    v14[9] = v9;
    v10 = *(_OWORD *)(v6 + 152);
    v14[2] = *(_OWORD *)(v6 + 136);
    v14[3] = v10;
    v11 = *(_OWORD *)(v6 + 184);
    v14[4] = *(_OWORD *)(v6 + 168);
    v14[5] = v11;
    v12 = *(_OWORD *)(v6 + 120);
    v14[0] = *(_OWORD *)(v6 + 104);
    v14[1] = v12;
    sub_21FCD20A4(v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t SymbolMetadata.aliases.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v24;
  char *v25;
  _QWORD v26[3];
  char v27;
  __int128 v28;
  __int128 v29;
  char v30;
  __int128 v31;
  char v32;
  uint64_t v33;
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
  _OWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;

  v1 = v0;
  v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCD1764(v1, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    return MEMORY[0x24BEE4AF8];
  }
  v5 = *(_DWORD *)v4;
  v7 = *((_QWORD *)v4 + 1);
  v6 = *((_QWORD *)v4 + 2);
  v8 = v4[24];
  v9 = v4[64];
  v10 = v4[88];
  v11 = *((_QWORD *)v4 + 12);
  v12 = *(_OWORD *)(v4 + 216);
  v46 = *(_OWORD *)(v4 + 200);
  v47 = v12;
  v13 = *(_OWORD *)(v4 + 248);
  v48 = *(_OWORD *)(v4 + 232);
  v49 = v13;
  v14 = *(_OWORD *)(v4 + 152);
  v44[2] = *(_OWORD *)(v4 + 136);
  v44[3] = v14;
  v15 = *(_OWORD *)(v4 + 184);
  v44[4] = *(_OWORD *)(v4 + 168);
  v45 = v15;
  v16 = *(_OWORD *)(v4 + 120);
  v44[0] = *(_OWORD *)(v4 + 104);
  v44[1] = v16;
  v40 = *(_OWORD *)(v4 + 200);
  v41 = *(_OWORD *)(v4 + 216);
  v42 = *(_OWORD *)(v4 + 232);
  v43 = *(_OWORD *)(v4 + 248);
  v36 = *(_OWORD *)(v4 + 136);
  v37 = *(_OWORD *)(v4 + 152);
  v38 = *(_OWORD *)(v4 + 168);
  v39 = *(_OWORD *)(v4 + 184);
  v34 = *(_OWORD *)(v4 + 104);
  v35 = *(_OWORD *)(v4 + 120);
  LODWORD(v26[0]) = v5;
  v26[1] = v7;
  v26[2] = v6;
  v27 = v8;
  v17 = *((_OWORD *)v4 + 3);
  v28 = *((_OWORD *)v4 + 2);
  v29 = v17;
  v30 = v9;
  v31 = *(_OWORD *)(v4 + 72);
  v32 = v10;
  v33 = v11;
  if (!*(_QWORD *)(v45 + 16))
  {
LABEL_7:
    sub_21FCD21C8(v26);
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  sub_21FCB8BDC(v7, v6);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = swift_bridgeObjectRetain();
  v20 = (char *)sub_21FCE1DFC(v19);
  swift_bridgeObjectRelease();
  v25 = v20;
  sub_21FCE1D94(&v25);
  swift_bridgeObjectRelease();
  v21 = v25;
  sub_21FCD2344(v44);
  v22 = sub_21FCE2A78((uint64_t)v21, (uint64_t)v44);
  sub_21FCD20A4(v44);
  swift_release();
  sub_21FCD21C8(v26);
  return v22;
}

uint64_t SymbolMetadata.tags.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD v22[3];
  char v23;
  __int128 v24;
  __int128 v25;
  char v26;
  __int128 v27;
  char v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v1 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v22[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCD1764(v0, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v3, type metadata accessor for SymbolMetadata.Backing);
    return MEMORY[0x24BEE4B08];
  }
  v4 = *(_DWORD *)v3;
  v6 = *((_QWORD *)v3 + 1);
  v5 = *((_QWORD *)v3 + 2);
  v7 = v3[24];
  v8 = v3[64];
  v9 = v3[88];
  v10 = *((_QWORD *)v3 + 12);
  v11 = *(_OWORD *)(v3 + 120);
  v30 = *(_OWORD *)(v3 + 104);
  v31 = v11;
  v12 = *((_QWORD *)v3 + 17);
  v13 = *((_OWORD *)v3 + 14);
  v37 = *((_OWORD *)v3 + 13);
  v38 = v13;
  v39 = *((_OWORD *)v3 + 15);
  v40 = *((_QWORD *)v3 + 32);
  v14 = *((_OWORD *)v3 + 10);
  v33 = *((_OWORD *)v3 + 9);
  v34 = v14;
  v15 = *((_OWORD *)v3 + 12);
  v35 = *((_OWORD *)v3 + 11);
  v36 = v15;
  LODWORD(v22[0]) = v4;
  v22[1] = v6;
  v22[2] = v5;
  v23 = v7;
  v16 = *((_OWORD *)v3 + 3);
  v24 = *((_OWORD *)v3 + 2);
  v25 = v16;
  v26 = v8;
  v27 = *(_OWORD *)(v3 + 72);
  v28 = v9;
  v29 = v10;
  v32 = v12;
  if (!*(_QWORD *)(v12 + 16))
  {
LABEL_7:
    sub_21FCD21C8(v22);
    return MEMORY[0x24BEE4B08];
  }
  swift_bridgeObjectRetain();
  v17 = sub_21FCB8BDC(v6, v5);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v19 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_21FCD21C8(v22);
  return v19;
}

uint64_t SymbolMetadata.functions.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v12[10];

  v1 = v0;
  v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCD1764(v1, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    v5 = *((_QWORD *)v4 + 7);
    v6 = *(_OWORD *)(v4 + 216);
    v12[6] = *(_OWORD *)(v4 + 200);
    v12[7] = v6;
    v7 = *(_OWORD *)(v4 + 248);
    v12[8] = *(_OWORD *)(v4 + 232);
    v12[9] = v7;
    v8 = *(_OWORD *)(v4 + 152);
    v12[2] = *(_OWORD *)(v4 + 136);
    v12[3] = v8;
    v9 = *(_OWORD *)(v4 + 184);
    v12[4] = *(_OWORD *)(v4 + 168);
    v12[5] = v9;
    v10 = *(_OWORD *)(v4 + 120);
    v12[0] = *(_OWORD *)(v4 + 104);
    v12[1] = v10;
    sub_21FCD20A4(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t SymbolMetadata.localeSuffix.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[10];

  v1 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCD1764(v0, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v3, type metadata accessor for SymbolMetadata.Backing);
    return 0;
  }
  else
  {
    v4 = *((_QWORD *)v3 + 4);
    v5 = *(_OWORD *)(v3 + 216);
    v11[6] = *(_OWORD *)(v3 + 200);
    v11[7] = v5;
    v6 = *(_OWORD *)(v3 + 248);
    v11[8] = *(_OWORD *)(v3 + 232);
    v11[9] = v6;
    v7 = *(_OWORD *)(v3 + 152);
    v11[2] = *(_OWORD *)(v3 + 136);
    v11[3] = v7;
    v8 = *(_OWORD *)(v3 + 184);
    v11[4] = *(_OWORD *)(v3 + 168);
    v11[5] = v8;
    v9 = *(_OWORD *)(v3 + 120);
    v11[0] = *(_OWORD *)(v3 + 104);
    v11[1] = v9;
    sub_21FCD20A4(v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t SymbolMetadata.key.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v18[10];

  v2 = v1;
  v4 = type metadata accessor for CustomSymbol();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCD1764(v2, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD1928((uint64_t)v9, (uint64_t)v6);
    v10 = sub_21FCE5440();
    (*(void (**)(_DWORD *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, v6, v10);
    sub_21FCD196C((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for CustomSymbol);
  }
  else
  {
    v11 = *(_DWORD *)v9;
    v12 = *(_OWORD *)(v9 + 216);
    v18[6] = *(_OWORD *)(v9 + 200);
    v18[7] = v12;
    v13 = *(_OWORD *)(v9 + 248);
    v18[8] = *(_OWORD *)(v9 + 232);
    v18[9] = v13;
    v14 = *(_OWORD *)(v9 + 152);
    v18[2] = *(_OWORD *)(v9 + 136);
    v18[3] = v14;
    v15 = *(_OWORD *)(v9 + 184);
    v18[4] = *(_OWORD *)(v9 + 168);
    v18[5] = v15;
    v16 = *(_OWORD *)(v9 + 120);
    v18[0] = *(_OWORD *)(v9 + 104);
    v18[1] = v16;
    sub_21FCD20A4(v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *a1 = v11;
  }
  type metadata accessor for SymbolKey(0);
  return swift_storeEnumTagMultiPayload();
}

unint64_t SymbolMetadata.additionalCSVColumns.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v12[10];

  v1 = v0;
  v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCD1764(v1, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    return sub_21FCB8ABC(MEMORY[0x24BEE4AF8]);
  }
  else
  {
    v5 = *((_QWORD *)v4 + 12);
    v6 = *(_OWORD *)(v4 + 216);
    v12[6] = *(_OWORD *)(v4 + 200);
    v12[7] = v6;
    v7 = *(_OWORD *)(v4 + 248);
    v12[8] = *(_OWORD *)(v4 + 232);
    v12[9] = v7;
    v8 = *(_OWORD *)(v4 + 152);
    v12[2] = *(_OWORD *)(v4 + 136);
    v12[3] = v8;
    v9 = *(_OWORD *)(v4 + 184);
    v12[4] = *(_OWORD *)(v4 + 168);
    v12[5] = v9;
    v10 = *(_OWORD *)(v4 + 120);
    v12[0] = *(_OWORD *)(v4 + 104);
    v12[1] = v10;
    sub_21FCD20A4(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t SymbolMetadata.useRestrictionsDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[10];

  v1 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCD1764(v0, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v3, type metadata accessor for SymbolMetadata.Backing);
    return 0;
  }
  else
  {
    v4 = *((_QWORD *)v3 + 9);
    v5 = *(_OWORD *)(v3 + 216);
    v11[6] = *(_OWORD *)(v3 + 200);
    v11[7] = v5;
    v6 = *(_OWORD *)(v3 + 248);
    v11[8] = *(_OWORD *)(v3 + 232);
    v11[9] = v6;
    v7 = *(_OWORD *)(v3 + 152);
    v11[2] = *(_OWORD *)(v3 + 136);
    v11[3] = v7;
    v8 = *(_OWORD *)(v3 + 184);
    v11[4] = *(_OWORD *)(v3 + 168);
    v11[5] = v8;
    v9 = *(_OWORD *)(v3 + 120);
    v11[0] = *(_OWORD *)(v3 + 104);
    v11[1] = v9;
    sub_21FCD20A4(v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t SymbolMetadata.useRestrictionsLocalizedDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _OWORD v30[10];
  _OWORD v31[10];
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
  _QWORD v42[3];
  char v43;
  __int128 v44;
  __int128 v45;
  char v46;
  __int128 v47;
  char v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;

  v1 = v0;
  v2 = type metadata accessor for SymbolMetadata.Backing(0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v30 - v6;
  sub_21FCD1764(v1, (uint64_t)v30 - v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v7, type metadata accessor for SymbolMetadata.Backing);
    return 0;
  }
  v8 = *(_DWORD *)v7;
  v9 = *((_QWORD *)v7 + 1);
  v10 = *((_QWORD *)v7 + 2);
  v11 = v7[24];
  v12 = v7[64];
  v13 = v7[88];
  v14 = *((_QWORD *)v7 + 12);
  v15 = *(_OWORD *)(v7 + 216);
  v38 = *(_OWORD *)(v7 + 200);
  v39 = v15;
  v16 = *(_OWORD *)(v7 + 248);
  v40 = *(_OWORD *)(v7 + 232);
  v41 = v16;
  v17 = *(_OWORD *)(v7 + 152);
  v34 = *(_OWORD *)(v7 + 136);
  v35 = v17;
  v18 = *(_OWORD *)(v7 + 184);
  v36 = *(_OWORD *)(v7 + 168);
  v37 = v18;
  v19 = *(_OWORD *)(v7 + 120);
  v32 = *(_OWORD *)(v7 + 104);
  v33 = v19;
  LODWORD(v42[0]) = v8;
  v42[1] = v9;
  v42[2] = v10;
  v43 = v11;
  v20 = *((_OWORD *)v7 + 3);
  v44 = *((_OWORD *)v7 + 2);
  v45 = v20;
  v46 = v12;
  v47 = *(_OWORD *)(v7 + 72);
  v48 = v13;
  v49 = v14;
  v56 = *(_OWORD *)(v7 + 200);
  v57 = *(_OWORD *)(v7 + 216);
  v58 = *(_OWORD *)(v7 + 232);
  v59 = *(_OWORD *)(v7 + 248);
  v52 = *(_OWORD *)(v7 + 136);
  v53 = *(_OWORD *)(v7 + 152);
  v54 = *(_OWORD *)(v7 + 168);
  v55 = *(_OWORD *)(v7 + 184);
  v50 = *(_OWORD *)(v7 + 104);
  v51 = *(_OWORD *)(v7 + 120);
  sub_21FCD1764(v1, (uint64_t)v5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v5, type metadata accessor for SymbolMetadata.Backing);
LABEL_7:
    sub_21FCD21C8(v42);
    return 0;
  }
  v22 = *((_QWORD *)v5 + 9);
  v21 = *((_QWORD *)v5 + 10);
  v23 = *(_OWORD *)(v5 + 216);
  v31[6] = *(_OWORD *)(v5 + 200);
  v31[7] = v23;
  v24 = *(_OWORD *)(v5 + 248);
  v31[8] = *(_OWORD *)(v5 + 232);
  v31[9] = v24;
  v25 = *(_OWORD *)(v5 + 152);
  v31[2] = *(_OWORD *)(v5 + 136);
  v31[3] = v25;
  v26 = *(_OWORD *)(v5 + 184);
  v31[4] = *(_OWORD *)(v5 + 168);
  v31[5] = v26;
  v27 = *(_OWORD *)(v5 + 120);
  v31[0] = *(_OWORD *)(v5 + 104);
  v31[1] = v27;
  sub_21FCD20A4(v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v21)
    goto LABEL_7;
  v30[6] = v38;
  v30[7] = v39;
  v30[8] = v40;
  v30[9] = v41;
  v30[2] = v34;
  v30[3] = v35;
  v30[4] = v36;
  v30[5] = v37;
  v30[0] = v32;
  v30[1] = v33;
  v28 = sub_21FCD4B34(v22, v21);
  swift_bridgeObjectRelease();
  sub_21FCD21C8(v42);
  return v28;
}

uint64_t SymbolMetadata.accessLevel.getter@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  char v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[10];

  v2 = v1;
  v4 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCD1764(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    result = sub_21FCD196C((uint64_t)v6, type metadata accessor for SymbolMetadata.Backing);
    v8 = 0;
  }
  else
  {
    v8 = v6[64];
    v9 = *(_OWORD *)(v6 + 216);
    v14[6] = *(_OWORD *)(v6 + 200);
    v14[7] = v9;
    v10 = *(_OWORD *)(v6 + 248);
    v14[8] = *(_OWORD *)(v6 + 232);
    v14[9] = v10;
    v11 = *(_OWORD *)(v6 + 152);
    v14[2] = *(_OWORD *)(v6 + 136);
    v14[3] = v11;
    v12 = *(_OWORD *)(v6 + 184);
    v14[4] = *(_OWORD *)(v6 + 168);
    v14[5] = v12;
    v13 = *(_OWORD *)(v6 + 120);
    v14[0] = *(_OWORD *)(v6 + 104);
    v14[1] = v13;
    sub_21FCD20A4(v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  *a1 = v8;
  return result;
}

uint64_t SymbolMetadata.mirrorForRTL.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v12[10];

  v1 = v0;
  v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCD1764(v1, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    return 0;
  }
  else
  {
    v5 = v4[24];
    v6 = *(_OWORD *)(v4 + 216);
    v12[6] = *(_OWORD *)(v4 + 200);
    v12[7] = v6;
    v7 = *(_OWORD *)(v4 + 248);
    v12[8] = *(_OWORD *)(v4 + 232);
    v12[9] = v7;
    v8 = *(_OWORD *)(v4 + 152);
    v12[2] = *(_OWORD *)(v4 + 136);
    v12[3] = v8;
    v9 = *(_OWORD *)(v4 + 184);
    v12[4] = *(_OWORD *)(v4 + 168);
    v12[5] = v9;
    v10 = *(_OWORD *)(v4 + 120);
    v12[0] = *(_OWORD *)(v4 + 104);
    v12[1] = v10;
    sub_21FCD20A4(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t SymbolMetadata.glyphOrder.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v20[10];
  _QWORD v21[3];
  char v22;
  __int128 v23;
  __int128 v24;
  char v25;
  __int128 v26;
  char v27;
  uint64_t v28;
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

  v1 = v0;
  v2 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (unsigned int *)((char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21FCD1764(v1, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v4, type metadata accessor for SymbolMetadata.Backing);
    return 0;
  }
  else
  {
    v6 = *v4;
    v7 = *((_QWORD *)v4 + 1);
    v8 = *((_QWORD *)v4 + 2);
    v9 = *((_BYTE *)v4 + 24);
    v10 = *((_BYTE *)v4 + 64);
    v11 = *((_BYTE *)v4 + 88);
    v12 = *((_QWORD *)v4 + 12);
    v13 = *(_OWORD *)(v4 + 54);
    v20[6] = *(_OWORD *)(v4 + 50);
    v20[7] = v13;
    v14 = *(_OWORD *)(v4 + 62);
    v20[8] = *(_OWORD *)(v4 + 58);
    v20[9] = v14;
    v15 = *(_OWORD *)(v4 + 38);
    v20[2] = *(_OWORD *)(v4 + 34);
    v20[3] = v15;
    v16 = *(_OWORD *)(v4 + 46);
    v20[4] = *(_OWORD *)(v4 + 42);
    v20[5] = v16;
    v17 = *(_OWORD *)(v4 + 30);
    v20[0] = *(_OWORD *)(v4 + 26);
    v20[1] = v17;
    LODWORD(v21[0]) = v6;
    v21[1] = v7;
    v21[2] = v8;
    v22 = v9;
    v18 = *((_OWORD *)v4 + 3);
    v23 = *((_OWORD *)v4 + 2);
    v24 = v18;
    v25 = v10;
    v26 = *(_OWORD *)(v4 + 18);
    v27 = v11;
    v28 = v12;
    v35 = *(_OWORD *)(v4 + 50);
    v36 = *(_OWORD *)(v4 + 54);
    v37 = *(_OWORD *)(v4 + 58);
    v38 = *(_OWORD *)(v4 + 62);
    v31 = *(_OWORD *)(v4 + 34);
    v32 = *(_OWORD *)(v4 + 38);
    v33 = *(_OWORD *)(v4 + 42);
    v34 = *(_OWORD *)(v4 + 46);
    v29 = *(_OWORD *)(v4 + 26);
    v30 = *(_OWORD *)(v4 + 30);
    v5 = sub_21FCD4914(v6);
    sub_21FCD21C8(v21);
  }
  return v5;
}

_QWORD *SymbolMetadata.availability(for:)@<X0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *result;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25[2];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  char v37;
  __int128 v38;
  __int128 v39;
  char v40;
  __int128 v41;
  char v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  v3 = v2;
  v6 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  v10 = a1[1];
  sub_21FCD1764(v3, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    result = (_QWORD *)sub_21FCD196C((uint64_t)v8, type metadata accessor for SymbolMetadata.Backing);
    *a2 = 0u;
    a2[1] = 0u;
  }
  else
  {
    v12 = *(_DWORD *)v8;
    v13 = *((_QWORD *)v8 + 1);
    v14 = *((_QWORD *)v8 + 2);
    v15 = v8[24];
    v16 = v8[64];
    v17 = v8[88];
    v18 = *((_QWORD *)v8 + 12);
    v19 = *(_OWORD *)(v8 + 216);
    v32 = *(_OWORD *)(v8 + 200);
    v33 = v19;
    v20 = *(_OWORD *)(v8 + 248);
    v34 = *(_OWORD *)(v8 + 232);
    v35 = v20;
    v21 = *(_OWORD *)(v8 + 152);
    v28 = *(_OWORD *)(v8 + 136);
    v29 = v21;
    v22 = *(_OWORD *)(v8 + 184);
    v30 = *(_OWORD *)(v8 + 168);
    v31 = v22;
    v23 = *(_OWORD *)(v8 + 120);
    v26 = *(_OWORD *)(v8 + 104);
    v27 = v23;
    LODWORD(v36[0]) = v12;
    v36[1] = v13;
    v36[2] = v14;
    v37 = v15;
    v24 = *((_OWORD *)v8 + 3);
    v38 = *((_OWORD *)v8 + 2);
    v39 = v24;
    v40 = v16;
    v41 = *(_OWORD *)(v8 + 72);
    v42 = v17;
    v43 = v18;
    v50 = *(_OWORD *)(v8 + 200);
    v51 = *(_OWORD *)(v8 + 216);
    v52 = *(_OWORD *)(v8 + 232);
    v53 = *(_OWORD *)(v8 + 248);
    v46 = *(_OWORD *)(v8 + 136);
    v47 = *(_OWORD *)(v8 + 152);
    v48 = *(_OWORD *)(v8 + 168);
    v49 = *(_OWORD *)(v8 + 184);
    v44 = *(_OWORD *)(v8 + 104);
    v45 = *(_OWORD *)(v8 + 120);
    v25[0] = v9;
    v25[1] = v10;
    sub_21FCE2C4C(v36);
    sub_21FCD5B0C(v25, v13, v14, (uint64_t)a2);
    sub_21FCD21C8(v36);
    return sub_21FCD21C8(v36);
  }
  return result;
}

uint64_t SymbolMetadata.defaultRenderingMode.getter@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  char v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  _QWORD v18[3];
  char v19;
  __int128 v20;
  __int128 v21;
  char v22;
  __int128 v23;
  char v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v2 = v1;
  v4 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FCD1764(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    result = sub_21FCD196C((uint64_t)v6, type metadata accessor for SymbolMetadata.Backing);
    v8 = 4;
  }
  else
  {
    v9 = *(_DWORD *)v6;
    v10 = *((_QWORD *)v6 + 1);
    v11 = *((_QWORD *)v6 + 2);
    v12 = v6[24];
    v13 = v6[64];
    v8 = v6[88];
    v14 = *((_QWORD *)v6 + 12);
    v32 = *(_OWORD *)(v6 + 200);
    v33 = *(_OWORD *)(v6 + 216);
    v34 = *(_OWORD *)(v6 + 232);
    v35 = *(_OWORD *)(v6 + 248);
    v28 = *(_OWORD *)(v6 + 136);
    v29 = *(_OWORD *)(v6 + 152);
    v30 = *(_OWORD *)(v6 + 168);
    v31 = *(_OWORD *)(v6 + 184);
    v15 = *(_OWORD *)(v6 + 120);
    v26 = *(_OWORD *)(v6 + 104);
    v27 = v15;
    LODWORD(v18[0]) = v9;
    v18[1] = v10;
    v18[2] = v11;
    v19 = v12;
    v16 = *((_OWORD *)v6 + 3);
    v20 = *((_OWORD *)v6 + 2);
    v21 = v16;
    v22 = v13;
    v23 = *(_OWORD *)(v6 + 72);
    v24 = v8;
    v25 = v14;
    result = (uint64_t)sub_21FCD21C8(v18);
  }
  *a1 = v8;
  return result;
}

uint64_t SymbolMetadata.csvRow.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD v26[11];

  v2 = v1;
  v4 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (unsigned int *)((char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21FCD1764(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    result = sub_21FCD196C((uint64_t)v6, type metadata accessor for SymbolMetadata.Backing);
    v8 = 0;
    v9 = 0;
    v10 = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
  }
  else
  {
    v25 = *v6;
    v11 = *((_QWORD *)v6 + 2);
    v24 = *((_QWORD *)v6 + 1);
    v12 = *((unsigned __int8 *)v6 + 24);
    v14 = *((_QWORD *)v6 + 4);
    v13 = *((_QWORD *)v6 + 5);
    v23 = *((unsigned __int8 *)v6 + 64);
    v15 = *((_QWORD *)v6 + 9);
    v8 = *((_QWORD *)v6 + 10);
    v9 = *((unsigned __int8 *)v6 + 88);
    v10 = *((_QWORD *)v6 + 12);
    v16 = *(_OWORD *)(v6 + 54);
    v26[6] = *(_OWORD *)(v6 + 50);
    v26[7] = v16;
    v17 = *(_OWORD *)(v6 + 62);
    v26[8] = *(_OWORD *)(v6 + 58);
    v26[9] = v17;
    v18 = *(_OWORD *)(v6 + 38);
    v26[2] = *(_OWORD *)(v6 + 34);
    v26[3] = v18;
    v19 = *(_OWORD *)(v6 + 46);
    v26[4] = *(_OWORD *)(v6 + 42);
    v26[5] = v19;
    v20 = *(_OWORD *)(v6 + 30);
    v26[0] = *(_OWORD *)(v6 + 26);
    v26[1] = v20;
    v22 = *((_OWORD *)v6 + 3);
    result = (uint64_t)sub_21FCD20A4(v26);
    v21 = v24;
    *(_QWORD *)a1 = v25;
    *(_QWORD *)(a1 + 8) = v21;
    *(_QWORD *)(a1 + 16) = v11;
    *(_QWORD *)(a1 + 24) = v12;
    *(_QWORD *)(a1 + 32) = v14;
    *(_QWORD *)(a1 + 40) = v13;
    *(_OWORD *)(a1 + 48) = v22;
    *(_QWORD *)(a1 + 64) = v23;
    *(_QWORD *)(a1 + 72) = v15;
  }
  *(_QWORD *)(a1 + 80) = v8;
  *(_QWORD *)(a1 + 88) = v9;
  *(_QWORD *)(a1 + 96) = v10;
  return result;
}

Swift::String_optional __swiftcall SymbolMetadata.string(for:)(SFSymbols::SymbolProperty a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  uint64_t v25;
  void *v26;
  Swift::String_optional result;
  uint64_t v28[2];
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
  _QWORD v39[3];
  char v40;
  __int128 v41;
  __int128 v42;
  char v43;
  __int128 v44;
  char v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;

  v2 = v1;
  countAndFlagsBits = (uint64_t *)a1.rawValue._countAndFlagsBits;
  v4 = type metadata accessor for SymbolMetadata.Backing(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *countAndFlagsBits;
  v8 = countAndFlagsBits[1];
  sub_21FCD1764(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21FCD196C((uint64_t)v6, type metadata accessor for SymbolMetadata.Backing);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v11 = *(_DWORD *)v6;
    v12 = *((_QWORD *)v6 + 1);
    v13 = *((_QWORD *)v6 + 2);
    v14 = v6[24];
    v15 = v6[64];
    v16 = v6[88];
    v17 = *((_QWORD *)v6 + 12);
    v18 = *(_OWORD *)(v6 + 216);
    v35 = *(_OWORD *)(v6 + 200);
    v36 = v18;
    v19 = *(_OWORD *)(v6 + 248);
    v37 = *(_OWORD *)(v6 + 232);
    v38 = v19;
    v20 = *(_OWORD *)(v6 + 152);
    v31 = *(_OWORD *)(v6 + 136);
    v32 = v20;
    v21 = *(_OWORD *)(v6 + 184);
    v33 = *(_OWORD *)(v6 + 168);
    v34 = v21;
    v22 = *(_OWORD *)(v6 + 120);
    v29 = *(_OWORD *)(v6 + 104);
    v30 = v22;
    LODWORD(v39[0]) = v11;
    v39[1] = v12;
    v39[2] = v13;
    v40 = v14;
    v23 = *((_OWORD *)v6 + 3);
    v41 = *((_OWORD *)v6 + 2);
    v42 = v23;
    v43 = v15;
    v44 = *(_OWORD *)(v6 + 72);
    v45 = v16;
    v46 = v17;
    v53 = *(_OWORD *)(v6 + 200);
    v54 = *(_OWORD *)(v6 + 216);
    v55 = *(_OWORD *)(v6 + 232);
    v56 = *(_OWORD *)(v6 + 248);
    v49 = *(_OWORD *)(v6 + 136);
    v50 = *(_OWORD *)(v6 + 152);
    v51 = *(_OWORD *)(v6 + 168);
    v52 = *(_OWORD *)(v6 + 184);
    v47 = *(_OWORD *)(v6 + 104);
    v48 = *(_OWORD *)(v6 + 120);
    v28[0] = v7;
    v28[1] = v8;
    sub_21FCE2C4C(v39);
    v9 = sub_21FCD5C40(v28, v12, v13);
    v10 = v24;
    sub_21FCD21C8(v39);
    sub_21FCD21C8(v39);
  }
  v25 = v9;
  v26 = v10;
  result.value._object = v26;
  result.value._countAndFlagsBits = v25;
  return result;
}

uint64_t sub_21FCE1D94(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21FCD8A60((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  result = sub_21FCE1EE0(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_21FCE1DFC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3CEC8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_21FCE287C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21FCCB340();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_21FCE1EE0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  unint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  char v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  unint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;

  v3 = a1[1];
  result = sub_21FCE565C();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_21FCE2584(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_151;
  v101 = result;
  v98 = a1;
  if (v3 <= 1)
  {
    v7 = MEMORY[0x24BEE4AF8];
    v104 = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v10 = MEMORY[0x24BEE4AF8];
LABEL_117:
      result = v10;
      v100 = v7;
      if (v11 >= 2)
      {
        v91 = *v98;
        do
        {
          v92 = v11 - 2;
          if (v11 < 2)
            goto LABEL_146;
          if (!v91)
            goto LABEL_159;
          v93 = result;
          v94 = *(_QWORD *)(result + 32 + 16 * v92);
          v95 = *(_QWORD *)(result + 32 + 16 * (v11 - 1) + 8);
          result = sub_21FCE2650((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(_QWORD *)(result + 32 + 16 * (v11 - 1))), v91 + 16 * v95, v104);
          if (v1)
            break;
          if (v95 < v94)
            goto LABEL_147;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_21FCD8200(v93);
            v93 = result;
          }
          if (v92 >= *(_QWORD *)(v93 + 16))
            goto LABEL_148;
          v96 = (_QWORD *)(v93 + 32 + 16 * v92);
          *v96 = v94;
          v96[1] = v95;
          v97 = *(_QWORD *)(v93 + 16);
          if (v11 > v97)
            goto LABEL_149;
          memmove((void *)(v93 + 32 + 16 * (v11 - 1)), (const void *)(v93 + 32 + 16 * v11), 16 * (v97 - v11));
          result = v93;
          *(_QWORD *)(v93 + 16) = v97 - 1;
          v11 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v100 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v100 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    result = sub_21FCE553C();
    *(_QWORD *)(result + 16) = v6;
    v100 = result;
    v104 = (char *)(result + 32);
  }
  v8 = 0;
  v9 = *a1;
  v99 = v9 + 8;
  v10 = MEMORY[0x24BEE4AF8];
  v102 = v3;
  while (1)
  {
    v12 = v8++;
    if (v8 >= v3)
      goto LABEL_45;
    v13 = (uint64_t *)(v9 + 16 * v8);
    result = *v13;
    v14 = v13[1];
    v15 = (_QWORD *)(v9 + 16 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_44;
      v17 = 0;
    }
    else
    {
      result = sub_21FCE5674();
      v17 = result;
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_36;
    }
    v19 = (_QWORD *)(v99 + 16 * v18);
    do
    {
      result = *(v19 - 1);
      v21 = (_QWORD *)(v9 + 16 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if ((v17 & 1) != 0)
          goto LABEL_37;
      }
      else
      {
        result = sub_21FCE5674();
        if (((v17 ^ result) & 1) != 0)
          goto LABEL_36;
      }
      v19 += 2;
      v20 = v18 + 1;
      v8 = v18;
      v18 = v20;
    }
    while (v20 < v3);
    v18 = v20;
LABEL_36:
    v8 = v18;
    if ((v17 & 1) != 0)
    {
LABEL_37:
      if (v18 < v12)
        goto LABEL_155;
      if (v12 < v18)
      {
        v23 = 16 * v18;
        v24 = 16 * v12;
        v25 = v18;
        v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9)
              goto LABEL_158;
            v27 = v9 + v23;
            v28 = *(_QWORD *)(v9 + v24);
            v29 = *(_QWORD *)(v9 + v24 + 8);
            *(_OWORD *)(v9 + v24) = *(_OWORD *)(v9 + v23 - 16);
            *(_QWORD *)(v27 - 16) = v28;
            *(_QWORD *)(v27 - 8) = v29;
          }
          ++v26;
          v23 -= 16;
          v24 += 16;
        }
        while (v26 < v25);
      }
LABEL_44:
      v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12))
        goto LABEL_150;
      if (v8 - v12 < v101)
        break;
    }
LABEL_66:
    if (v8 < v12)
      goto LABEL_145;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_21FCD8058(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
      v10 = result;
    }
    v38 = *(_QWORD *)(v10 + 16);
    v37 = *(_QWORD *)(v10 + 24);
    v11 = v38 + 1;
    if (v38 >= v37 >> 1)
    {
      result = (uint64_t)sub_21FCD8058((char *)(v37 > 1), v38 + 1, 1, (char *)v10);
      v10 = result;
    }
    *(_QWORD *)(v10 + 16) = v11;
    v39 = v10 + 32;
    v40 = (uint64_t *)(v10 + 32 + 16 * v38);
    *v40 = v12;
    v40[1] = v8;
    if (v38)
    {
      v103 = v8;
      while (1)
      {
        v41 = v11 - 1;
        if (v11 >= 4)
        {
          v46 = v39 + 16 * v11;
          v47 = *(_QWORD *)(v46 - 64);
          v48 = *(_QWORD *)(v46 - 56);
          v52 = __OFSUB__(v48, v47);
          v49 = v48 - v47;
          if (v52)
            goto LABEL_134;
          v51 = *(_QWORD *)(v46 - 48);
          v50 = *(_QWORD *)(v46 - 40);
          v52 = __OFSUB__(v50, v51);
          v44 = v50 - v51;
          v45 = v52;
          if (v52)
            goto LABEL_135;
          v53 = v11 - 2;
          v54 = (uint64_t *)(v39 + 16 * (v11 - 2));
          v56 = *v54;
          v55 = v54[1];
          v52 = __OFSUB__(v55, v56);
          v57 = v55 - v56;
          if (v52)
            goto LABEL_136;
          v52 = __OFADD__(v44, v57);
          v58 = v44 + v57;
          if (v52)
            goto LABEL_138;
          if (v58 >= v49)
          {
            v76 = (uint64_t *)(v39 + 16 * v41);
            v78 = *v76;
            v77 = v76[1];
            v52 = __OFSUB__(v77, v78);
            v79 = v77 - v78;
            if (v52)
              goto LABEL_144;
            v69 = v44 < v79;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v70 = *(_QWORD *)(v10 + 32);
            v71 = *(_QWORD *)(v10 + 40);
            v52 = __OFSUB__(v71, v70);
            v63 = v71 - v70;
            v64 = v52;
            goto LABEL_98;
          }
          v43 = *(_QWORD *)(v10 + 32);
          v42 = *(_QWORD *)(v10 + 40);
          v52 = __OFSUB__(v42, v43);
          v44 = v42 - v43;
          v45 = v52;
        }
        if ((v45 & 1) != 0)
          goto LABEL_137;
        v53 = v11 - 2;
        v59 = (uint64_t *)(v39 + 16 * (v11 - 2));
        v61 = *v59;
        v60 = v59[1];
        v62 = __OFSUB__(v60, v61);
        v63 = v60 - v61;
        v64 = v62;
        if (v62)
          goto LABEL_139;
        v65 = (uint64_t *)(v39 + 16 * v41);
        v67 = *v65;
        v66 = v65[1];
        v52 = __OFSUB__(v66, v67);
        v68 = v66 - v67;
        if (v52)
          goto LABEL_141;
        if (__OFADD__(v63, v68))
          goto LABEL_143;
        if (v63 + v68 >= v44)
        {
          v69 = v44 < v68;
LABEL_104:
          if (v69)
            v41 = v53;
          goto LABEL_106;
        }
LABEL_98:
        if ((v64 & 1) != 0)
          goto LABEL_140;
        v72 = (uint64_t *)(v39 + 16 * v41);
        v74 = *v72;
        v73 = v72[1];
        v52 = __OFSUB__(v73, v74);
        v75 = v73 - v74;
        if (v52)
          goto LABEL_142;
        if (v75 < v63)
          goto LABEL_15;
LABEL_106:
        v80 = v41 - 1;
        if (v41 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        v81 = v9;
        if (!v9)
          goto LABEL_157;
        v82 = v10;
        v83 = (uint64_t *)(v39 + 16 * v80);
        v84 = *v83;
        v85 = v39;
        v86 = v41;
        v87 = (_QWORD *)(v39 + 16 * v41);
        v88 = v87[1];
        v89 = v81;
        result = sub_21FCE2650((char *)(v81 + 16 * *v83), (char *)(v81 + 16 * *v87), v81 + 16 * v88, v104);
        if (v1)
          goto LABEL_114;
        if (v88 < v84)
          goto LABEL_131;
        if (v86 > *(_QWORD *)(v82 + 16))
          goto LABEL_132;
        *v83 = v84;
        *(_QWORD *)(v85 + 16 * v80 + 8) = v88;
        v90 = *(_QWORD *)(v82 + 16);
        if (v86 >= v90)
          goto LABEL_133;
        v10 = v82;
        v11 = v90 - 1;
        result = (uint64_t)memmove(v87, v87 + 2, 16 * (v90 - 1 - v86));
        v39 = v85;
        *(_QWORD *)(v82 + 16) = v90 - 1;
        v9 = v89;
        v8 = v103;
        if (v90 <= 2)
          goto LABEL_15;
      }
    }
    v11 = 1;
LABEL_15:
    v3 = v102;
    if (v8 >= v102)
    {
      v7 = v100;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v101))
    goto LABEL_153;
  if (v12 + v101 >= v3)
    v30 = v3;
  else
    v30 = v12 + v101;
  if (v30 >= v12)
  {
    if (v8 != v30)
    {
      v31 = (uint64_t *)(v9 + 16 * v8);
      do
      {
        v32 = (uint64_t *)(v9 + 16 * v8);
        result = *v32;
        v33 = v32[1];
        v34 = v12;
        v35 = v31;
        do
        {
          if (result == *(v35 - 2) && v33 == *(v35 - 1))
            break;
          result = sub_21FCE5674();
          if ((result & 1) == 0)
            break;
          if (!v9)
            goto LABEL_156;
          result = *v35;
          v33 = v35[1];
          *(_OWORD *)v35 = *((_OWORD *)v35 - 1);
          *(v35 - 1) = v33;
          *(v35 - 2) = result;
          v35 -= 2;
          ++v34;
        }
        while (v8 != v34);
        ++v8;
        v31 += 2;
      }
      while (v8 != v30);
      v8 = v30;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

uint64_t sub_21FCE2584(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = sub_21FCE5674(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_21FCE2650(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  BOOL v20;
  BOOL v21;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = __src - __dst + 15;
  if (__src - __dst >= 0)
    v9 = __src - __dst;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 15;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 4;
  if (v10 >= v12 >> 4)
  {
    if (a4 != __src || &__src[16 * v13] <= a4)
      memmove(a4, __src, 16 * v13);
    v14 = &v4[16 * v13];
    if (v7 >= v6 || v11 < 16)
      goto LABEL_48;
    v17 = (char *)(a3 - 16);
    while (1)
    {
      v18 = v17 + 16;
      v19 = v6 - 16;
      v20 = *((_QWORD *)v14 - 2) == *((_QWORD *)v6 - 2) && *((_QWORD *)v14 - 1) == *((_QWORD *)v6 - 1);
      if (v20 || (sub_21FCE5674() & 1) == 0)
      {
        v19 = v14 - 16;
        if (v18 != v14)
        {
          v14 -= 16;
LABEL_45:
          *(_OWORD *)v17 = *(_OWORD *)v19;
          goto LABEL_46;
        }
        v21 = v17 >= v14;
        v14 -= 16;
        if (v21)
          goto LABEL_45;
      }
      else
      {
        if (v18 != v6)
        {
          v6 -= 16;
          goto LABEL_45;
        }
        v21 = v17 >= v6;
        v6 -= 16;
        if (v21)
          goto LABEL_45;
      }
LABEL_46:
      if (v6 > v7)
      {
        v17 -= 16;
        if (v14 > v4)
          continue;
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[16 * v10] <= a4)
    memmove(a4, __dst, 16 * v10);
  v14 = &v4[16 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (v15 || (sub_21FCE5674() & 1) == 0)
        break;
      v16 = v6;
      v15 = v7 == v6;
      v6 += 16;
      if (!v15)
        goto LABEL_20;
LABEL_21:
      v7 += 16;
      if (v4 >= v14 || (unint64_t)v6 >= a3)
        goto LABEL_23;
    }
    v16 = v4;
    v15 = v7 == v4;
    v4 += 16;
    if (v15)
      goto LABEL_21;
LABEL_20:
    *(_OWORD *)v7 = *(_OWORD *)v16;
    goto LABEL_21;
  }
LABEL_23:
  v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0])
    memmove(v6, v4, 16 * ((v14 - v4) / 16));
  return 1;
}

uint64_t sub_21FCE287C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_21FCE2A78(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v27 = MEMORY[0x24BEE4AF8];
    sub_21FCD8214(0, v2, 0);
    v3 = v27;
    v24 = a2;
    v6 = *(_QWORD *)(a2 + 96);
    v7 = (uint64_t *)(a1 + 40);
    do
    {
      v8 = *(v7 - 1);
      v9 = *v7;
      v10 = *(_QWORD *)(v6 + 16);
      swift_bridgeObjectRetain();
      v26 = 0u;
      v25 = v8;
      if (v10)
      {
        swift_bridgeObjectRetain();
        v11 = sub_21FCB8BDC(v8, v9);
        if ((v12 & 1) != 0)
        {
          v13 = v6;
          v14 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v11);
          if (*(_QWORD *)(v14 + 16))
          {
            swift_bridgeObjectRetain();
            v15 = sub_21FCC07A0(1701667182, 0xE400000000000000);
            if ((v16 & 1) != 0)
            {
              v17 = *(_QWORD *)(v24 + 88);
              v18 = *(_QWORD *)(v14 + 56) + 24 * v15;
              v26 = *(_OWORD *)v18;
              v19 = *(_QWORD *)(v18 + 16);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
LABEL_13:
              v6 = v13;
              goto LABEL_14;
            }
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          v19 = 0;
          v17 = 0;
          goto LABEL_13;
        }
        swift_bridgeObjectRelease();
      }
      v19 = 0;
      v17 = 0;
LABEL_14:
      v21 = *(_QWORD *)(v27 + 16);
      v20 = *(_QWORD *)(v27 + 24);
      if (v21 >= v20 >> 1)
        sub_21FCD8214((char *)(v20 > 1), v21 + 1, 1);
      v7 += 2;
      *(_QWORD *)(v27 + 16) = v21 + 1;
      v22 = v27 + 48 * v21;
      *(_QWORD *)(v22 + 32) = v25;
      *(_QWORD *)(v22 + 40) = v9;
      *(_OWORD *)(v22 + 48) = v26;
      *(_QWORD *)(v22 + 64) = v19;
      *(_QWORD *)(v22 + 72) = v17;
      --v2;
    }
    while (v2);
  }
  return v3;
}

_QWORD *sub_21FCE2C4C(_QWORD *a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v6;
  void *v7;

  v6 = a1[19];
  v2 = (void *)a1[32];
  v7 = (void *)a1[29];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21FCD2464(v6);
  v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v4 = v7;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for SymbolMetadata(uint64_t a1, uint64_t *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v30;
  void *v31;

  v4 = *(_DWORD *)(*(_QWORD *)(type metadata accessor for SymbolMetadata.Backing(0) - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v10 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v5 = sub_21FCE5440();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
      v6 = *(int *)(type metadata accessor for CustomSymbol() + 20);
      v7 = (_QWORD *)(a1 + v6);
      v8 = (uint64_t *)((char *)a2 + v6);
      v9 = v8[1];
      *v7 = *v8;
      v7[1] = v9;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      v11 = a2[2];
      *(_QWORD *)(a1 + 8) = a2[1];
      *(_QWORD *)(a1 + 16) = v11;
      *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
      v12 = a2[5];
      *(_QWORD *)(a1 + 32) = a2[4];
      *(_QWORD *)(a1 + 40) = v12;
      v13 = a2[7];
      *(_QWORD *)(a1 + 48) = a2[6];
      *(_QWORD *)(a1 + 56) = v13;
      *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
      v14 = a2[10];
      *(_QWORD *)(a1 + 72) = a2[9];
      *(_QWORD *)(a1 + 80) = v14;
      *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
      v15 = a2[13];
      *(_QWORD *)(a1 + 96) = a2[12];
      *(_QWORD *)(a1 + 104) = v15;
      v16 = a2[15];
      *(_QWORD *)(a1 + 112) = a2[14];
      *(_QWORD *)(a1 + 120) = v16;
      v17 = a2[17];
      *(_QWORD *)(a1 + 128) = a2[16];
      *(_QWORD *)(a1 + 136) = v17;
      *(_QWORD *)(a1 + 144) = a2[18];
      v30 = a2[19];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v30)
      {
        v18 = a2[20];
        *(_QWORD *)(a1 + 152) = v30;
        *(_QWORD *)(a1 + 160) = v18;
        swift_retain();
      }
      else
      {
        *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 19);
      }
      v19 = a2[22];
      *(_QWORD *)(a1 + 168) = a2[21];
      *(_QWORD *)(a1 + 176) = v19;
      v20 = a2[24];
      *(_QWORD *)(a1 + 184) = a2[23];
      *(_QWORD *)(a1 + 192) = v20;
      v21 = a2[26];
      *(_QWORD *)(a1 + 200) = a2[25];
      *(_QWORD *)(a1 + 208) = v21;
      v22 = a2[28];
      *(_QWORD *)(a1 + 216) = a2[27];
      *(_QWORD *)(a1 + 224) = v22;
      v24 = (void *)a2[29];
      v23 = a2[30];
      *(_QWORD *)(a1 + 232) = v24;
      *(_QWORD *)(a1 + 240) = v23;
      v25 = a2[31];
      v26 = (void *)a2[32];
      v31 = v24;
      *(_QWORD *)(a1 + 248) = v25;
      *(_QWORD *)(a1 + 256) = v26;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v27 = v31;
      swift_bridgeObjectRetain();
      v28 = v26;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void destroy for SymbolMetadata(uint64_t a1)
{
  uint64_t v2;

  type metadata accessor for SymbolMetadata.Backing(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_21FCE5440();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
    type metadata accessor for CustomSymbol();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(a1 + 152))
      swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for SymbolMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  type metadata accessor for SymbolMetadata.Backing(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_21FCE5440();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    v5 = *(int *)(type metadata accessor for CustomSymbol() + 20);
    v6 = (_QWORD *)(a1 + v5);
    v7 = (_QWORD *)(a2 + v5);
    v8 = v7[1];
    *v6 = *v7;
    v6[1] = v8;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    v9 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = v9;
    *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
    v10 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = v10;
    v11 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = v11;
    *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
    v12 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 80) = v12;
    *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
    v13 = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 104) = v13;
    v14 = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 120) = v14;
    v26 = *(_QWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    *(_QWORD *)(a1 + 136) = v26;
    *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
    v27 = *(_QWORD *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v27)
    {
      v15 = *(_QWORD *)(a2 + 160);
      *(_QWORD *)(a1 + 152) = v27;
      *(_QWORD *)(a1 + 160) = v15;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
    }
    v16 = *(_QWORD *)(a2 + 176);
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 176) = v16;
    v17 = *(_QWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
    *(_QWORD *)(a1 + 192) = v17;
    v18 = *(_QWORD *)(a2 + 208);
    *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
    *(_QWORD *)(a1 + 208) = v18;
    v19 = *(_QWORD *)(a2 + 224);
    *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
    *(_QWORD *)(a1 + 224) = v19;
    v20 = *(_QWORD *)(a2 + 240);
    v28 = *(void **)(a2 + 232);
    *(_QWORD *)(a1 + 232) = v28;
    *(_QWORD *)(a1 + 240) = v20;
    v22 = *(_QWORD *)(a2 + 248);
    v21 = *(void **)(a2 + 256);
    *(_QWORD *)(a1 + 248) = v22;
    *(_QWORD *)(a1 + 256) = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23 = v28;
    swift_bridgeObjectRetain();
    v24 = v21;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for SymbolMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v13;
  void *v14;

  if (a1 != a2)
  {
    sub_21FCD196C(a1, type metadata accessor for SymbolMetadata.Backing);
    type metadata accessor for SymbolMetadata.Backing(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = sub_21FCE5440();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
      v5 = *(int *)(type metadata accessor for CustomSymbol() + 20);
      v6 = (_QWORD *)(a1 + v5);
      v7 = (_QWORD *)(a2 + v5);
      *v6 = *v7;
      v6[1] = v7[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
      *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
      v13 = *(_QWORD *)(a2 + 152);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v13)
      {
        v8 = *(_QWORD *)(a2 + 160);
        *(_QWORD *)(a1 + 152) = v13;
        *(_QWORD *)(a1 + 160) = v8;
        swift_retain();
      }
      else
      {
        *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
      }
      *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
      *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
      *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
      *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
      *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
      *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
      *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
      *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
      v14 = *(void **)(a2 + 232);
      *(_QWORD *)(a1 + 232) = v14;
      *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
      *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
      v9 = *(void **)(a2 + 256);
      *(_QWORD *)(a1 + 256) = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v10 = v14;
      swift_bridgeObjectRetain();
      v11 = v9;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for SymbolMetadata(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for SymbolMetadata.Backing(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_21FCE5440();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    v6 = type metadata accessor for CustomSymbol();
    *(_OWORD *)&a1[*(int *)(v6 + 20)] = *(_OWORD *)&a2[*(int *)(v6 + 20)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for SymbolMetadata(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 != a2)
  {
    sub_21FCD196C((uint64_t)a1, type metadata accessor for SymbolMetadata.Backing);
    v4 = type metadata accessor for SymbolMetadata.Backing(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v5 = sub_21FCE5440();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
      v6 = type metadata accessor for CustomSymbol();
      *(_OWORD *)&a1[*(int *)(v6 + 20)] = *(_OWORD *)&a2[*(int *)(v6 + 20)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FCE3814(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SymbolMetadata.Backing(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SymbolMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FCE385C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SymbolMetadata.Backing(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SymbolMetadata(uint64_t a1)
{
  return sub_21FCDC054(a1, (uint64_t *)&unk_2555734B0);
}

uint64_t sub_21FCE38B0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SymbolMetadata.Backing(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21FCE3918(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v31;
  void *v32;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_21FCE5440();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = *(int *)(type metadata accessor for CustomSymbol() + 20);
      v8 = (_QWORD *)(a1 + v7);
      v9 = (uint64_t *)((char *)a2 + v7);
      v10 = v9[1];
      *v8 = *v9;
      v8[1] = v10;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      v12 = a2[2];
      *(_QWORD *)(a1 + 8) = a2[1];
      *(_QWORD *)(a1 + 16) = v12;
      *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
      v13 = a2[5];
      *(_QWORD *)(a1 + 32) = a2[4];
      *(_QWORD *)(a1 + 40) = v13;
      v14 = a2[7];
      *(_QWORD *)(a1 + 48) = a2[6];
      *(_QWORD *)(a1 + 56) = v14;
      *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
      v15 = a2[10];
      *(_QWORD *)(a1 + 72) = a2[9];
      *(_QWORD *)(a1 + 80) = v15;
      *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
      v16 = a2[13];
      *(_QWORD *)(a1 + 96) = a2[12];
      *(_QWORD *)(a1 + 104) = v16;
      v17 = a2[15];
      *(_QWORD *)(a1 + 112) = a2[14];
      *(_QWORD *)(a1 + 120) = v17;
      v18 = a2[17];
      *(_QWORD *)(a1 + 128) = a2[16];
      *(_QWORD *)(a1 + 136) = v18;
      *(_QWORD *)(a1 + 144) = a2[18];
      v31 = a2[19];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v31)
      {
        v19 = a2[20];
        *(_QWORD *)(a1 + 152) = v31;
        *(_QWORD *)(a1 + 160) = v19;
        swift_retain();
      }
      else
      {
        *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 19);
      }
      v20 = a2[22];
      *(_QWORD *)(a1 + 168) = a2[21];
      *(_QWORD *)(a1 + 176) = v20;
      v21 = a2[24];
      *(_QWORD *)(a1 + 184) = a2[23];
      *(_QWORD *)(a1 + 192) = v21;
      v22 = a2[26];
      *(_QWORD *)(a1 + 200) = a2[25];
      *(_QWORD *)(a1 + 208) = v22;
      v23 = a2[28];
      *(_QWORD *)(a1 + 216) = a2[27];
      *(_QWORD *)(a1 + 224) = v23;
      v25 = (void *)a2[29];
      v24 = a2[30];
      *(_QWORD *)(a1 + 232) = v25;
      *(_QWORD *)(a1 + 240) = v24;
      v26 = a2[31];
      v27 = (void *)a2[32];
      v32 = v25;
      *(_QWORD *)(a1 + 248) = v26;
      *(_QWORD *)(a1 + 256) = v27;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28 = v32;
      swift_bridgeObjectRetain();
      v29 = v27;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_21FCE3B90(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_21FCE5440();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
    type metadata accessor for CustomSymbol();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(a1 + 152))
      swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_21FCE3CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_21FCE5440();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    v5 = *(int *)(type metadata accessor for CustomSymbol() + 20);
    v6 = (_QWORD *)(a1 + v5);
    v7 = (_QWORD *)(a2 + v5);
    v8 = v7[1];
    *v6 = *v7;
    v6[1] = v8;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    v9 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = v9;
    *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
    v10 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = v10;
    v11 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = v11;
    *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
    v12 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 80) = v12;
    *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
    v13 = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 104) = v13;
    v14 = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 120) = v14;
    v26 = *(_QWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    *(_QWORD *)(a1 + 136) = v26;
    *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
    v27 = *(_QWORD *)(a2 + 152);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v27)
    {
      v15 = *(_QWORD *)(a2 + 160);
      *(_QWORD *)(a1 + 152) = v27;
      *(_QWORD *)(a1 + 160) = v15;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
    }
    v16 = *(_QWORD *)(a2 + 176);
    *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 176) = v16;
    v17 = *(_QWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
    *(_QWORD *)(a1 + 192) = v17;
    v18 = *(_QWORD *)(a2 + 208);
    *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
    *(_QWORD *)(a1 + 208) = v18;
    v19 = *(_QWORD *)(a2 + 224);
    *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
    *(_QWORD *)(a1 + 224) = v19;
    v20 = *(_QWORD *)(a2 + 240);
    v28 = *(void **)(a2 + 232);
    *(_QWORD *)(a1 + 232) = v28;
    *(_QWORD *)(a1 + 240) = v20;
    v22 = *(_QWORD *)(a2 + 248);
    v21 = *(void **)(a2 + 256);
    *(_QWORD *)(a1 + 248) = v22;
    *(_QWORD *)(a1 + 256) = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23 = v28;
    swift_bridgeObjectRetain();
    v24 = v21;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_21FCE3F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v13;
  void *v14;

  if (a1 != a2)
  {
    sub_21FCD196C(a1, type metadata accessor for SymbolMetadata.Backing);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = sub_21FCE5440();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
      v5 = *(int *)(type metadata accessor for CustomSymbol() + 20);
      v6 = (_QWORD *)(a1 + v5);
      v7 = (_QWORD *)(a2 + v5);
      *v6 = *v7;
      v6[1] = v7[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
      *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
      *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
      v13 = *(_QWORD *)(a2 + 152);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v13)
      {
        v8 = *(_QWORD *)(a2 + 160);
        *(_QWORD *)(a1 + 152) = v13;
        *(_QWORD *)(a1 + 160) = v8;
        swift_retain();
      }
      else
      {
        *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
      }
      *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
      *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
      *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
      *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
      *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
      *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
      *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
      *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
      v14 = *(void **)(a2 + 232);
      *(_QWORD *)(a1 + 232) = v14;
      *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
      *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
      v9 = *(void **)(a2 + 256);
      *(_QWORD *)(a1 + 256) = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v10 = v14;
      swift_bridgeObjectRetain();
      v11 = v9;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_21FCE41D4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_21FCE5440();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    v7 = type metadata accessor for CustomSymbol();
    *(_OWORD *)&a1[*(int *)(v7 + 20)] = *(_OWORD *)&a2[*(int *)(v7 + 20)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_21FCE4274(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_21FCD196C((uint64_t)a1, type metadata accessor for SymbolMetadata.Backing);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_21FCE5440();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      v7 = type metadata accessor for CustomSymbol();
      *(_OWORD *)&a1[*(int *)(v7 + 20)] = *(_OWORD *)&a2[*(int *)(v7 + 20)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_21FCE432C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for CustomSymbol();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t CustomSymbol.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21FCE5440();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t CustomSymbol.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for CustomSymbol() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for CustomSymbol()
{
  uint64_t result;

  result = qword_2555734D0;
  if (!qword_2555734D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CustomSymbol.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for CustomSymbol() + 20));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*CustomSymbol.name.modify())()
{
  type metadata accessor for CustomSymbol();
  return nullsub_1;
}

uint64_t CustomSymbol.init(uuid:name:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t result;
  _QWORD *v10;

  v8 = sub_21FCE5440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a4, a1, v8);
  result = type metadata accessor for CustomSymbol();
  v10 = (_QWORD *)(a4 + *(int *)(result + 20));
  *v10 = a2;
  v10[1] = a3;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for CustomSymbol(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_21FCE5440();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for CustomSymbol(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21FCE5440();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CustomSymbol(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_21FCE5440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CustomSymbol(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_21FCE5440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for CustomSymbol(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_21FCE5440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for CustomSymbol(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_21FCE5440();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CustomSymbol()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FCE47B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_21FCE5440();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for CustomSymbol()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FCE483C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_21FCE5440();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_21FCE48B8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21FCE5440();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void __swiftcall SymbolMetadataQuery.init()(SFSymbols::SymbolMetadataQuery *__return_ptr retstr)
{
  void *v1;

  retstr->limitingCategoryKey = 0u;
  retstr->searchString = 0u;
  *(_DWORD *)&retstr->matchPrivateScalarsInSearchString = 65792;
  v1 = (void *)MEMORY[0x24BEE4AF8];
  retstr->keyFilters._rawValue = (void *)MEMORY[0x24BEE4AF8];
  retstr->metadataFilters._rawValue = v1;
  retstr->termMetadataFilters._rawValue = v1;
}

Swift::Void __swiftcall SymbolMetadataQuery.limitResults(to:)(SFSymbols::SymbolCategory::Key to)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)to.rawValue._countAndFlagsBits;
  v2 = *(_QWORD *)(to.rawValue._countAndFlagsBits + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *v1 = v3;
  v1[1] = v2;
}

uint64_t SymbolMetadataQuery.searchString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SymbolMetadataQuery.searchString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*SymbolMetadataQuery.searchString.modify())()
{
  return nullsub_1;
}

uint64_t SymbolMetadataQuery.matchPrivateScalarsInSearchString.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t SymbolMetadataQuery.matchPrivateScalarsInSearchString.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = result;
  return result;
}

uint64_t (*SymbolMetadataQuery.matchPrivateScalarsInSearchString.modify())()
{
  return nullsub_1;
}

uint64_t SymbolMetadataQuery.includeSystemSymbols.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t SymbolMetadataQuery.includeSystemSymbols.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 33) = result;
  return result;
}

uint64_t (*SymbolMetadataQuery.includeSystemSymbols.modify())()
{
  return nullsub_1;
}

uint64_t SymbolMetadataQuery.includeCustomSymbols.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 34);
}

uint64_t SymbolMetadataQuery.includeCustomSymbols.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 34) = result;
  return result;
}

uint64_t (*SymbolMetadataQuery.includeCustomSymbols.modify())()
{
  return nullsub_1;
}

uint64_t SymbolMetadataQuery.includeLocalizedVariants.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 35);
}

uint64_t SymbolMetadataQuery.includeLocalizedVariants.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 35) = result;
  return result;
}

uint64_t (*SymbolMetadataQuery.includeLocalizedVariants.modify())()
{
  return nullsub_1;
}

uint64_t SymbolMetadataQuery.addSymbolKeyFilter(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v6 = *(_QWORD **)(v2 + 40);
  swift_retain();
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_21FCDF1BC(0, v6[2] + 1, 1, v6);
    v6 = (_QWORD *)result;
  }
  v9 = v6[2];
  v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    result = (uint64_t)sub_21FCDF1BC((_QWORD *)(v8 > 1), v9 + 1, 1, v6);
    v6 = (_QWORD *)result;
  }
  v6[2] = v9 + 1;
  v10 = &v6[2 * v9];
  v10[4] = sub_21FCE5134;
  v10[5] = v5;
  *(_QWORD *)(v2 + 40) = v6;
  return result;
}

uint64_t sub_21FCE4B48()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t SymbolMetadataQuery.addSymbolMetadataFilter(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v6 = *(_QWORD **)(v2 + 48);
  swift_retain();
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_21FCDF1C8(0, v6[2] + 1, 1, v6);
    v6 = (_QWORD *)result;
  }
  v9 = v6[2];
  v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    result = (uint64_t)sub_21FCDF1C8((_QWORD *)(v8 > 1), v9 + 1, 1, v6);
    v6 = (_QWORD *)result;
  }
  v6[2] = v9 + 1;
  v10 = &v6[2 * v9];
  v10[4] = sub_21FCE4CFC;
  v10[5] = v5;
  *(_QWORD *)(v2 + 48) = v6;
  return result;
}

uint64_t SymbolMetadataQuery.addSearchTermFilter(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v9 = *(_QWORD *)(v4 + 56);
  swift_bridgeObjectRetain();
  swift_retain();
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_21FCDF2F0(0, *(_QWORD *)(v9 + 16) + 1, 1, (char *)v9);
    v9 = result;
  }
  v12 = *(_QWORD *)(v9 + 16);
  v11 = *(_QWORD *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    result = (uint64_t)sub_21FCDF2F0((char *)(v11 > 1), v12 + 1, 1, (char *)v9);
    v9 = result;
  }
  *(_QWORD *)(v9 + 16) = v12 + 1;
  v13 = (_QWORD *)(v9 + 32 * v12);
  v13[4] = a1;
  v13[5] = a2;
  v13[6] = a3;
  v13[7] = a4;
  *(_QWORD *)(v4 + 56) = v9;
  return result;
}

uint64_t sub_21FCE4CFC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result & 1;
  return result;
}

uint64_t destroy for SymbolMetadataQuery()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SymbolMetadataQuery(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SymbolMetadataQuery(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  *(_BYTE *)(a1 + 35) = *(_BYTE *)(a2 + 35);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SymbolMetadataQuery(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  *(_BYTE *)(a1 + 35) = *(_BYTE *)(a2 + 35);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolMetadataQuery(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SymbolMetadataQuery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolMetadataQuery()
{
  return &type metadata for SymbolMetadataQuery;
}

uint64_t destroy for SymbolMetadataQuery.TermMetadataFilter()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SymbolMetadataQuery.TermMetadataFilter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SymbolMetadataQuery.TermMetadataFilter(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SymbolMetadataQuery.TermMetadataFilter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SymbolMetadataQuery.TermMetadataFilter()
{
  return &type metadata for SymbolMetadataQuery.TermMetadataFilter;
}

SFSymbols::SymbolFeature __swiftcall SymbolFeature.init(rawValue:)(SFSymbols::SymbolFeature rawValue)
{
  SFSymbols::SymbolFeature *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t SymbolFeature.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void static SymbolFeature.name.getter(_QWORD *a1@<X8>)
{
  *a1 = 1701667182;
  a1[1] = 0xE400000000000000;
}

void static SymbolFeature.monochrome.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x6F7268636F6E6F6DLL;
  a1[1] = 0xEA0000000000656DLL;
}

void static SymbolFeature.multicolor.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x6C6F6369746C756DLL;
  a1[1] = 0xEA0000000000726FLL;
}

void static SymbolFeature.hierarchical.getter(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "hierarchical");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

unint64_t sub_21FCE51E8()
{
  unint64_t result;

  result = qword_2555734E0;
  if (!qword_2555734E0)
  {
    result = MEMORY[0x2207D1938](&protocol conformance descriptor for SymbolFeature, &type metadata for SymbolFeature);
    atomic_store(result, (unint64_t *)&qword_2555734E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolFeature()
{
  return &type metadata for SymbolFeature;
}

uint64_t sub_21FCE52E4()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_21FCE52F0()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t sub_21FCE52FC()
{
  return MEMORY[0x24BDCB6B0]();
}

uint64_t sub_21FCE5308()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_21FCE5314()
{
  return MEMORY[0x24BDCB6D8]();
}

uint64_t sub_21FCE5320()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_21FCE532C()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_21FCE5338()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_21FCE5344()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_21FCE5350()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_21FCE535C()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_21FCE5368()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_21FCE5374()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_21FCE5380()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_21FCE538C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21FCE5398()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_21FCE53A4()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21FCE53B0()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_21FCE53BC()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_21FCE53C8()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_21FCE53D4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21FCE53E0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21FCE53EC()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_21FCE53F8()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_21FCE5404()
{
  return MEMORY[0x24BDCDC68]();
}

uint64_t sub_21FCE5410()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21FCE541C()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_21FCE5428()
{
  return MEMORY[0x24BDCDE70]();
}

uint64_t sub_21FCE5434()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_21FCE5440()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21FCE544C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21FCE5458()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21FCE5464()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_21FCE5470()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21FCE547C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21FCE5488()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21FCE5494()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_21FCE54A0()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_21FCE54AC()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_21FCE54B8()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_21FCE54C4()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_21FCE54D0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21FCE54DC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21FCE54E8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_21FCE54F4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_21FCE5500()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_21FCE550C()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_21FCE5518()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_21FCE5524()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_21FCE5530()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21FCE553C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21FCE5548()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21FCE5554()
{
  return MEMORY[0x24BDD0410]();
}

uint64_t sub_21FCE5560()
{
  return MEMORY[0x24BDD0440]();
}

uint64_t sub_21FCE556C()
{
  return MEMORY[0x24BDD0448]();
}

uint64_t sub_21FCE5578()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t sub_21FCE5584()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_21FCE5590()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_21FCE559C()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_21FCE55A8()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21FCE55B4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21FCE55C0()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_21FCE55CC()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_21FCE55D8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21FCE55E4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21FCE55F0()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_21FCE55FC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21FCE5608()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21FCE5614()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21FCE5620()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21FCE562C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_21FCE5638()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_21FCE5644()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_21FCE5650()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_21FCE565C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_21FCE5668()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21FCE5674()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21FCE5680()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t sub_21FCE568C()
{
  return MEMORY[0x24BEE3AF0]();
}

uint64_t sub_21FCE5698()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21FCE56A4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21FCE56B0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21FCE56BC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21FCE56C8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21FCE56D4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21FCE56E0()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_21FCE56EC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21FCE56F8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21FCE5704()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_21FCE5710()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21FCE571C()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_21FCE5728()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_21FCE5734()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_21FCE5740()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21FCE574C()
{
  return MEMORY[0x24BEE4A10]();
}

CFDataRef CTFontCopyTable(CTFontRef font, CTFontTableTag table, CTFontTableOptions options)
{
  return (CFDataRef)MEMORY[0x24BDC4758](font, *(_QWORD *)&table, *(_QWORD *)&options);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

