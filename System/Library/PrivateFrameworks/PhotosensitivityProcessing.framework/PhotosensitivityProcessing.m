uint64_t soft_AXSPhotosensitiveVisualDebuggingEnabled()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = get_AXSPhotosensitiveVisualDebuggingEnabledSymbolLoc_ptr;
  v8 = get_AXSPhotosensitiveVisualDebuggingEnabledSymbolLoc_ptr;
  if (!get_AXSPhotosensitiveVisualDebuggingEnabledSymbolLoc_ptr)
  {
    v1 = (void *)libAccessibilityLibrary();
    v0 = dlsym(v1, "_AXSPhotosensitiveVisualDebuggingEnabled");
    v6[3] = (uint64_t)v0;
    get_AXSPhotosensitiveVisualDebuggingEnabledSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)+[PSEVideoProcessor needsProcessing].cold.1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

uint64_t soft_AXSPhotosensitiveSourceCopyDebuggingEnabled()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = get_AXSPhotosensitiveSourceCopyDebuggingEnabledSymbolLoc_ptr;
  v8 = get_AXSPhotosensitiveSourceCopyDebuggingEnabledSymbolLoc_ptr;
  if (!get_AXSPhotosensitiveSourceCopyDebuggingEnabledSymbolLoc_ptr)
  {
    v1 = (void *)libAccessibilityLibrary();
    v0 = dlsym(v1, "_AXSPhotosensitiveSourceCopyDebuggingEnabled");
    v6[3] = (uint64_t)v0;
    get_AXSPhotosensitiveSourceCopyDebuggingEnabledSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)+[PSEVideoProcessor needsProcessing].cold.1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

uint64_t libAccessibilityLibrary()
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
  v0 = libAccessibilityLibraryCore_frameworkLibrary;
  v6 = libAccessibilityLibraryCore_frameworkLibrary;
  if (!libAccessibilityLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_2514EC2E0;
    v8 = 0;
    v0 = _sl_dlopen();
    v4[3] = v0;
    libAccessibilityLibraryCore_frameworkLibrary = v0;
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

void sub_2443BBAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary;
  }
  else
  {
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary;
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AXDeviceSupportsPhotosensitiveMitigation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_2443BBC10(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
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
  unint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;

  if (!a2)
    return 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735CE30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2443C5380;
  *(_QWORD *)(inited + 32) = sub_2443C4820();
  *(_QWORD *)(inited + 40) = v5;
  *(_DWORD *)(inited + 48) = 1;
  *(_QWORD *)(inited + 56) = sub_2443C4820();
  *(_QWORD *)(inited + 64) = v6;
  *(_DWORD *)(inited + 72) = 2;
  *(_QWORD *)(inited + 80) = sub_2443C4820();
  *(_QWORD *)(inited + 88) = v7;
  *(_DWORD *)(inited + 96) = 4;
  *(_QWORD *)(inited + 104) = sub_2443C4820();
  *(_QWORD *)(inited + 112) = v8;
  *(_DWORD *)(inited + 120) = 5;
  *(_QWORD *)(inited + 128) = sub_2443C4820();
  *(_QWORD *)(inited + 136) = v9;
  *(_DWORD *)(inited + 144) = 6;
  *(_QWORD *)(inited + 152) = sub_2443C4820();
  *(_QWORD *)(inited + 160) = v10;
  *(_DWORD *)(inited + 168) = 7;
  *(_QWORD *)(inited + 176) = sub_2443C4820();
  *(_QWORD *)(inited + 184) = v11;
  *(_DWORD *)(inited + 192) = 9;
  *(_QWORD *)(inited + 200) = sub_2443C4820();
  *(_QWORD *)(inited + 208) = v12;
  *(_DWORD *)(inited + 216) = 10;
  *(_QWORD *)(inited + 224) = sub_2443C4820();
  *(_QWORD *)(inited + 232) = v13;
  *(_DWORD *)(inited + 240) = 11;
  *(_QWORD *)(inited + 248) = sub_2443C4820();
  *(_QWORD *)(inited + 256) = v14;
  *(_DWORD *)(inited + 264) = 12;
  *(_QWORD *)(inited + 272) = sub_2443C4820();
  *(_QWORD *)(inited + 280) = v15;
  *(_DWORD *)(inited + 288) = 13;
  *(_QWORD *)(inited + 296) = sub_2443C4820();
  *(_QWORD *)(inited + 304) = v16;
  *(_DWORD *)(inited + 312) = 14;
  *(_QWORD *)(inited + 320) = sub_2443C4820();
  *(_QWORD *)(inited + 328) = v17;
  *(_DWORD *)(inited + 336) = 15;
  *(_QWORD *)(inited + 344) = sub_2443C4820();
  *(_QWORD *)(inited + 352) = v18;
  *(_DWORD *)(inited + 360) = 16;
  *(_QWORD *)(inited + 368) = sub_2443C4820();
  *(_QWORD *)(inited + 376) = v19;
  *(_DWORD *)(inited + 384) = 17;
  *(_QWORD *)(inited + 392) = sub_2443C4820();
  *(_QWORD *)(inited + 400) = v20;
  *(_DWORD *)(inited + 408) = 18;
  *(_QWORD *)(inited + 416) = sub_2443C4820();
  *(_QWORD *)(inited + 424) = v21;
  *(_DWORD *)(inited + 432) = 19;
  *(_QWORD *)(inited + 440) = sub_2443C4820();
  *(_QWORD *)(inited + 448) = v22;
  *(_DWORD *)(inited + 456) = 20;
  *(_QWORD *)(inited + 464) = sub_2443C4820();
  *(_QWORD *)(inited + 472) = v23;
  *(_DWORD *)(inited + 480) = 21;
  *(_QWORD *)(inited + 488) = sub_2443C4820();
  *(_QWORD *)(inited + 496) = v24;
  *(_DWORD *)(inited + 504) = 22;
  *(_QWORD *)(inited + 512) = sub_2443C4820();
  *(_QWORD *)(inited + 520) = v25;
  *(_DWORD *)(inited + 528) = 25;
  *(_QWORD *)(inited + 536) = sub_2443C4820();
  *(_QWORD *)(inited + 544) = v26;
  *(_DWORD *)(inited + 552) = 28;
  swift_bridgeObjectRetain();
  v27 = sub_2443BBF74(inited);
  if (*(_QWORD *)(v27 + 16) && (v28 = sub_2443BC394(a1, a2), (v29 & 1) != 0))
    v30 = *(unsigned int *)(*(_QWORD *)(v27 + 56) + 4 * v28);
  else
    v30 = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24950DB18]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2443BBF74(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25735CE40);
  v2 = (_QWORD *)sub_2443C48EC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_DWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_2443BC394(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_DWORD *)(v2[7] + 4 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 6;
    v2[2] = v13;
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

uint64_t sub_2443BC084(uint64_t a1)
{
  int v1;
  uint64_t result;
  int v4;
  int v5;
  unsigned int v6;

  v1 = *(unsigned __int8 *)(a1 + 59) - 1;
  result = 30;
  switch(v1)
  {
    case 0:
      result = 20;
      switch(*(_BYTE *)(a1 + 60))
      {
        case 1:
          return result;
        case 8:
          result = 6;
          break;
        case 0xD:
          result = 5;
          break;
        case 0x10:
          result = 35;
          break;
        default:
          goto LABEL_9;
      }
      break;
    case 4:
      result = 31;
      break;
    case 5:
      return result;
    case 8:
      result = 24;
      switch(*(_BYTE *)(a1 + 60))
      {
        case 1:
          result = 20;
          break;
        case 8:
          result = 25;
          break;
        case 0x10:
          return result;
        case 0x12:
          result = 34;
          break;
        default:
          result = 22;
          break;
      }
      break;
    case 10:
      if (*(_BYTE *)(a1 + 60) != 17)
        goto LABEL_9;
      result = 19;
      break;
    case 11:
      v4 = *(unsigned __int8 *)(a1 + 60);
      if (v4 == 18)
        v5 = 2;
      else
        v5 = 1;
      if (v4 == 16)
        v6 = 29;
      else
        v6 = v5;
      if (v4 == 8)
        result = 33;
      else
        result = v6;
      break;
    default:
LABEL_9:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_2443BC198(__IOSurface *a1)
{
  __CFString *v2;
  __CFString *v3;
  CGColorSpace *v4;
  CGColorSpace *v5;
  CFStringRef v6;
  __CFString *v7;
  CFTypeRef v8;
  CFTypeRef v9;
  CFTypeID v10;
  uint64_t v11;
  CGColorSpace *v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v16[7];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (__CFString *)IOSurfaceCopyValue(a1, (CFStringRef)*MEMORY[0x24BDD8E88]);
  v3 = v2;
  if (v2)
  {
    v4 = CGColorSpaceCreateWithPropertyList(v2);
    if (v4)
    {
      v5 = v4;
      v6 = CGColorSpaceCopyName(v4);
      if (v6)
      {
        v7 = (__CFString *)v6;
        v16[0] = 0uLL;
        sub_2443C4814();

        swift_unknownObjectRelease();
        v3 = 0;
        goto LABEL_7;
      }

    }
    swift_unknownObjectRelease();
    v3 = 0;
  }
LABEL_7:
  v8 = IOSurfaceCopyValue(a1, (CFStringRef)*MEMORY[0x24BDD8EB8]);
  if (v8)
  {
    v9 = v8;
    v10 = CFGetTypeID(v8);
    if (v10 == CFDataGetTypeID())
    {
      v11 = MEMORY[0x24950D638](v9);
      if (v11)
      {
        v12 = (CGColorSpace *)v11;
        swift_bridgeObjectRelease();
        v3 = (__CFString *)CGColorSpaceCopyName(v12);
        if (v3)
        {
          sub_2443C4814();

          swift_unknownObjectRelease();
          v3 = 0;
          goto LABEL_14;
        }

      }
    }
    swift_unknownObjectRelease();
  }
LABEL_14:
  memset(v16, 0, sizeof(v16));
  v17 = 0;
  if (IOSurfaceGetBulkAttachments() || (v13 = sub_2443BC084((uint64_t)v16), !(_DWORD)v13))
    v14 = sub_2443BBC10((uint64_t)v3, 0);
  else
    v14 = v13;
  swift_bridgeObjectRelease();
  return v14;
}

BOOL sub_2443BC364(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_2443BC378@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_2443BC388(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

unint64_t sub_2443BC394(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2443C4928();
  sub_2443C482C();
  v4 = sub_2443C4934();
  return sub_2443BC44C(a1, a2, v4);
}

void type metadata accessor for PSEColorSpace()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25735CE38)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25735CE38);
  }
}

unint64_t sub_2443BC44C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2443C48F8() & 1) == 0)
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
      while (!v14 && (sub_2443C48F8() & 1) == 0);
    }
  }
  return v6;
}

_QWORD *sub_2443BC52C(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = result;
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25735D320);
      v4 = (_QWORD *)sub_2443C4850();
      v4[2] = a2;
      v7 = v4;
      v4[4] = v3;
      if (a2 != 1)
      {
        v4[5] = v3;
        v5 = a2 - 2;
        if (v5)
        {
          v6 = v4 + 6;
          do
          {
            *v6++ = v3;
            swift_unknownObjectRetain();
            --v5;
          }
          while (v5);
        }
        swift_unknownObjectRetain();
      }
    }
    else
    {
      v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
      swift_unknownObjectRelease();
    }
    sub_2443C4844();
    return v7;
  }
  return result;
}

uint64_t VideoProcessor.validationCallback.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___SwiftVideoProcessor_validationCallback);
  swift_beginAccess();
  v2 = *v1;
  sub_2443BC6EC(*v1);
  return v2;
}

uint64_t sub_2443BC6EC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_2443BC6FC(uint64_t a1, double a2, double a3, double a4)
{
  void (*v7)(uint64_t, double, double, double);
  uint64_t v8;

  v7 = *(void (**)(uint64_t, double, double, double))(a1 + 32);
  v8 = swift_retain();
  v7(v8, a2, a3, a4);
  return swift_release();
}

uint64_t VideoProcessor.validationCallback.setter(uint64_t a1, uint64_t a2)
{
  sub_2443C26F8(a1, a2);
  return sub_2443C27EC(a1);
}

uint64_t sub_2443BC81C@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)(double *, double *, double *)@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(double *, double *, double *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR___SwiftVideoProcessor_validationCallback);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_2443C2820;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(double *, double *, double *))v6;
  return sub_2443BC6EC(v4);
}

uint64_t sub_2443BC8B0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(double, double, double);

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_2443C3360;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_2443BC6EC(v1);
  sub_2443C26F8((uint64_t)v4, v3);
  return sub_2443C27EC((uint64_t)v4);
}

void (*VideoProcessor.validationCallback.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___SwiftVideoProcessor_validationCallback;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_2443BC990;
}

void sub_2443BC990(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(double *, double *, double *);
  BOOL v10;
  uint64_t v11;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[3];
    v5 = (uint64_t *)(v4 + v3[4]);
    v6 = *v5;
    v7 = v5[1];
    if (*v5)
    {
      v8 = swift_allocObject();
      *(_QWORD *)(v8 + 16) = v6;
      *(_QWORD *)(v8 + 24) = v7;
      v9 = sub_2443C2820;
    }
    else
    {
      v9 = 0;
    }
    v10 = v6 != 0;
    sub_2443BC6EC(v6);
    sub_2443C27EC((uint64_t)v9);
    v11 = v4 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
    swift_beginAccess();
    *(_BYTE *)(v11 + 6) = v10;
  }
  free(v3);
}

uint64_t VideoProcessor.inTestingMode.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SwiftVideoProcessor_inTestingMode);
  swift_beginAccess();
  return *v1;
}

uint64_t VideoProcessor.inTestingMode.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SwiftVideoProcessor_inTestingMode);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*VideoProcessor.inTestingMode.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t VideoProcessor.debugMode.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SwiftVideoProcessor_debugMode);
  swift_beginAccess();
  return *v1;
}

uint64_t VideoProcessor.debugMode.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t v4;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SwiftVideoProcessor_debugMode);
  swift_beginAccess();
  *v3 = a1;
  v4 = v1 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  result = swift_beginAccess();
  *(_BYTE *)(v4 + 5) = a1;
  return result;
}

uint64_t sub_2443BCD30@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR___SwiftVideoProcessor_debugMode);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2443BCD80(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  v4 = (_BYTE *)(*a2 + OBJC_IVAR___SwiftVideoProcessor_debugMode);
  swift_beginAccess();
  *v4 = v2;
  v5 = v3 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  result = swift_beginAccess();
  *(_BYTE *)(v5 + 5) = v2;
  return result;
}

void (*VideoProcessor.debugMode.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___SwiftVideoProcessor_debugMode;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_2443BCE50;
}

void sub_2443BCE50(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[3];
    v5 = *(_BYTE *)(v4 + v3[4]);
    v6 = v4 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
    swift_beginAccess();
    *(_BYTE *)(v6 + 5) = v5;
  }
  free(v3);
}

uint64_t VideoProcessor.copySourceOnlyDebugging.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging);
  swift_beginAccess();
  return *v1;
}

uint64_t VideoProcessor.copySourceOnlyDebugging.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t v4;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging);
  swift_beginAccess();
  *v3 = a1;
  v4 = v1 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  result = swift_beginAccess();
  *(_BYTE *)(v4 + 7) = a1;
  return result;
}

uint64_t sub_2443BD028@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2443BD078(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  v4 = (_BYTE *)(*a2 + OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging);
  swift_beginAccess();
  *v4 = v2;
  v5 = v3 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  result = swift_beginAccess();
  *(_BYTE *)(v5 + 7) = v2;
  return result;
}

void (*VideoProcessor.copySourceOnlyDebugging.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_2443BD148;
}

void sub_2443BD148(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[3];
    v5 = *(_BYTE *)(v4 + v3[4]);
    v6 = v4 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
    swift_beginAccess();
    *(_BYTE *)(v6 + 7) = v5;
  }
  free(v3);
}

id VideoProcessor.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id VideoProcessor.init()()
{
  _BYTE *v0;
  _BYTE *v1;
  objc_class *ObjectType;
  uint64_t v3;
  _BYTE *v4;
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
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  objc_super v19;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v0[OBJC_IVAR___SwiftVideoProcessor_needsInitialization] = 1;
  *(_QWORD *)&v0[OBJC_IVAR___SwiftVideoProcessor_device] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SwiftVideoProcessor_commandQueue] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SwiftVideoProcessor_library] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SwiftVideoProcessor_previousSurfaceTime] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass0] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass2] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass3] = 0;
  v3 = OBJC_IVAR___SwiftVideoProcessor_bufferFrameLumaSum;
  v4 = v0;
  *(_QWORD *)&v1[v3] = sub_2443BC52C(0, 2);
  v5 = OBJC_IVAR___SwiftVideoProcessor_bufferData;
  *(_QWORD *)&v4[v5] = sub_2443BC52C(0, 2);
  v6 = OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
  *(_QWORD *)&v4[v6] = sub_2443BC52C(0, 2);
  v7 = OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel;
  *(_QWORD *)&v4[v7] = sub_2443BC52C(0, 2);
  v8 = OBJC_IVAR___SwiftVideoProcessor_bufferEnergy;
  *(_QWORD *)&v4[v8] = sub_2443BC52C(0, 2);
  v9 = OBJC_IVAR___SwiftVideoProcessor_bufferEnergy2;
  *(_QWORD *)&v4[v9] = sub_2443BC52C(0, 2);
  v10 = OBJC_IVAR___SwiftVideoProcessor_bufferContrastKernel;
  *(_QWORD *)&v4[v10] = sub_2443BC52C(0, 2);
  v11 = OBJC_IVAR___SwiftVideoProcessor_bufferContrast;
  *(_QWORD *)&v4[v11] = sub_2443BC52C(0, 2);
  v12 = OBJC_IVAR___SwiftVideoProcessor_bufferResponses;
  *(_QWORD *)&v4[v12] = sub_2443BC52C(0, 2);
  v13 = OBJC_IVAR___SwiftVideoProcessor_bufferResponsesNorm;
  *(_QWORD *)&v4[v13] = sub_2443BC52C(0, 2);
  v14 = OBJC_IVAR___SwiftVideoProcessor_bufferResults;
  *(_QWORD *)&v4[v14] = sub_2443BC52C(0, 2);
  *(_QWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_bufferDataDebug] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_sourceTexture] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_sourceCbCrTexture] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_processedTexture] = 0;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_fps] = 1114636288;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_nits] = 0;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_area] = 1151218729;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_avl] = 1041865114;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_gain] = 1065353216;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_energyPoolGammaShape] = 0x40000000;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_energyPoolExponent] = 0x40000000;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_energyPoolGammaScale] = 1041865114;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_probabilityPoolGammaShape] = 1082130432;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_probabilityPoolExponent] = 1082130432;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_cA] = 1049012208;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_tauAdapt] = 1065353216;
  *(_DWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_tauMitigation] = 0x40000000;
  *(_QWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_idxFrameRate] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_idxEquivalentSize] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_idxEquivalentKernelIndex] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_framePoolIndex] = 0;
  v15 = &v4[OBJC_IVAR___SwiftVideoProcessor_validationCallback];
  *v15 = 0;
  v15[1] = 0;
  v4[OBJC_IVAR___SwiftVideoProcessor_inTestingMode] = 0;
  v4[OBJC_IVAR___SwiftVideoProcessor_debugMode] = 0;
  v4[OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging] = 0;
  v16 = sub_2443C4850();
  *(_QWORD *)(v16 + 16) = 10;
  memset_pattern16((void *)(v16 + 32), &unk_2443C5550, 0x50uLL);
  *(_QWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_frameDeltas] = v16;
  *(_QWORD *)&v4[OBJC_IVAR___SwiftVideoProcessor_protectionStatus] = 0;
  v17 = &v4[OBJC_IVAR___SwiftVideoProcessor_bufferConstants];
  *((_QWORD *)v17 + 5) = 0;
  v17[48] = 0;
  *((_DWORD *)v17 + 13) = 0;
  *(_QWORD *)v17 = 0;
  *((_WORD *)v17 + 4) = 0;
  *(_QWORD *)(v17 + 12) = 0;
  *(_QWORD *)(v17 + 28) = 0;
  *(_QWORD *)(v17 + 20) = 0;

  v19.receiver = v4;
  v19.super_class = ObjectType;
  return objc_msgSendSuper2(&v19, sel_init);
}

uint64_t sub_2443BD588(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  unint64_t v66;
  unint64_t v67;
  id v68;
  char v69;
  unint64_t v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t *v73;
  char v74;
  id v75;
  id v76;
  uint64_t v77;
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  id v82;
  uint64_t v83;
  id v84;
  id v85;
  uint64_t v86;
  id v87;
  id v88;
  uint64_t v89;
  id v90;
  id v91;
  uint64_t v92;
  id v93;
  id v94;
  uint64_t v95;
  id v96;
  id v97;
  uint64_t v98;
  id v99;
  id v100;
  uint64_t v101;
  id v102;
  id v103;
  uint64_t v104;
  id v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t *v110;
  uint64_t *v111;
  uint64_t *v112;
  uint64_t *v113;
  uint64_t *v114;
  uint64_t *v115;
  uint64_t *v116;
  uint64_t *v117;
  void *v118;

  v2 = *(void **)(v1 + OBJC_IVAR___SwiftVideoProcessor_device);
  if (v2)
  {
    v3 = v1;
    v4 = result;
    result = (uint64_t)objc_msgSend((id)swift_unknownObjectRetain(), sel_heapBufferSizeAndAlignWithLength_options_, 4, 544);
    v6 = result + v5;
    if (__OFADD__(result, v5))
      goto LABEL_119;
    v7 = v6 - 1;
    if (__OFSUB__(v6, 1))
    {
LABEL_120:
      __break(1u);
    }
    else
    {
      v8 = v5 - 1;
      if (!__OFSUB__(v5, 1))
      {
        result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 56, 544);
        v10 = result + v9;
        if (!__OFADD__(result, v9))
        {
          v11 = __OFSUB__(v10, 1);
          v12 = v10 - 1;
          if (!v11)
          {
            if (!__OFSUB__(v9, 1))
            {
              v13 = v7 & ~v8;
              v14 = v12 & ~(v9 - 1);
              v15 = v13 + v14;
              if (!__OFADD__(v13, v14))
              {
                result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 144, 544);
                v17 = result + v16;
                if (!__OFADD__(result, v16))
                {
                  v11 = __OFSUB__(v17, 1);
                  v18 = v17 - 1;
                  if (!v11)
                  {
                    if (!__OFSUB__(v16, 1))
                    {
                      v19 = v18 & ~(v16 - 1);
                      v11 = __OFADD__(v15, v19);
                      v20 = v15 + v19;
                      if (!v11)
                      {
                        result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 1024, 544);
                        v22 = result + v21;
                        if (!__OFADD__(result, v21))
                        {
                          v11 = __OFSUB__(v22, 1);
                          v23 = v22 - 1;
                          if (!v11)
                          {
                            if (!__OFSUB__(v21, 1))
                            {
                              v24 = v23 & ~(v21 - 1);
                              v11 = __OFADD__(v20, v24);
                              v25 = v20 + v24;
                              if (!v11)
                              {
                                result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 5120, 544);
                                v27 = result + v26;
                                if (!__OFADD__(result, v26))
                                {
                                  v11 = __OFSUB__(v27, 1);
                                  v28 = v27 - 1;
                                  if (!v11)
                                  {
                                    if (!__OFSUB__(v26, 1))
                                    {
                                      v29 = v28 & ~(v26 - 1);
                                      v11 = __OFADD__(v25, v29);
                                      v30 = v25 + v29;
                                      if (!v11)
                                      {
                                        result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 5120, 544);
                                        v32 = result + v31;
                                        if (!__OFADD__(result, v31))
                                        {
                                          v11 = __OFSUB__(v32, 1);
                                          v33 = v32 - 1;
                                          if (!v11)
                                          {
                                            if (!__OFSUB__(v31, 1))
                                            {
                                              v34 = v33 & ~(v31 - 1);
                                              v11 = __OFADD__(v30, v34);
                                              v35 = v30 + v34;
                                              if (!v11)
                                              {
                                                result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 640, 544);
                                                v37 = result + v36;
                                                if (!__OFADD__(result, v36))
                                                {
                                                  v11 = __OFSUB__(v37, 1);
                                                  v38 = v37 - 1;
                                                  if (!v11)
                                                  {
                                                    if (!__OFSUB__(v36, 1))
                                                    {
                                                      v39 = v38 & ~(v36 - 1);
                                                      v11 = __OFADD__(v35, v39);
                                                      v40 = v35 + v39;
                                                      if (!v11)
                                                      {
                                                        result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 640, 544);
                                                        v42 = result + v41;
                                                        if (!__OFADD__(result, v41))
                                                        {
                                                          v11 = __OFSUB__(v42, 1);
                                                          v43 = v42 - 1;
                                                          if (!v11)
                                                          {
                                                            if (!__OFSUB__(v41, 1))
                                                            {
                                                              v44 = v43 & ~(v41 - 1);
                                                              v11 = __OFADD__(v40, v44);
                                                              v45 = v40 + v44;
                                                              if (!v11)
                                                              {
                                                                result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 20, 544);
                                                                v47 = result + v46;
                                                                if (!__OFADD__(result, v46))
                                                                {
                                                                  v11 = __OFSUB__(v47, 1);
                                                                  v48 = v47 - 1;
                                                                  if (!v11)
                                                                  {
                                                                    if (!__OFSUB__(v46, 1))
                                                                    {
                                                                      v49 = v48 & ~(v46 - 1);
                                                                      v11 = __OFADD__(v45, v49);
                                                                      v50 = v45 + v49;
                                                                      if (!v11)
                                                                      {
                                                                        result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 20, 544);
                                                                        v52 = result + v51;
                                                                        if (!__OFADD__(result, v51))
                                                                        {
                                                                          v11 = __OFSUB__(v52, 1);
                                                                          v53 = v52 - 1;
                                                                          if (!v11)
                                                                          {
                                                                            if (!__OFSUB__(v51, 1))
                                                                            {
                                                                              v54 = v53 & ~(v51 - 1);
                                                                              v11 = __OFADD__(v50, v54);
                                                                              v55 = v50 + v54;
                                                                              if (!v11)
                                                                              {
                                                                                result = (uint64_t)objc_msgSend(v2, sel_heapBufferSizeAndAlignWithLength_options_, 40, 544);
                                                                                v57 = result + v56;
                                                                                if (!__OFADD__(result, v56))
                                                                                {
                                                                                  v11 = __OFSUB__(v57, 1);
                                                                                  v58 = v57 - 1;
                                                                                  if (!v11)
                                                                                  {
                                                                                    if (!__OFSUB__(v56, 1))
                                                                                    {
                                                                                      v59 = v58 & ~(v56 - 1);
                                                                                      v60 = v55 + v59;
                                                                                      if (!__OFADD__(v55, v59))
                                                                                      {
                                                                                        v61 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDD5F0]), sel_init);
                                                                                        objc_msgSend(v61, sel_setSize_, v60);
                                                                                        objc_msgSend(v61, sel_setHazardTrackingMode_, 2);
                                                                                        v62 = objc_msgSend(v2, sel_newHeapWithDescriptor_, v61);
                                                                                        objc_msgSend(v61, sel_setProtectionOptions_, v4);
                                                                                        v109 = v61;
                                                                                        result = (uint64_t)objc_msgSend(v2, sel_newHeapWithDescriptor_, v61);
                                                                                        v118 = (void *)result;
                                                                                        if (PSELog)
                                                                                        {
                                                                                          v63 = (id)PSELog;
                                                                                          sub_2443C4880();
                                                                                          __swift_instantiateConcreteTypeFromMangledName(&qword_25735CFD0);
                                                                                          v64 = swift_allocObject();
                                                                                          *(_OWORD *)(v64 + 16) = xmmword_2443C5470;
                                                                                          v108 = v4;
                                                                                          v65 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedLongLong_, v4);
                                                                                          v66 = sub_2443C2824();
                                                                                          *(_QWORD *)(v64 + 56) = v66;
                                                                                          v67 = sub_2443C2860();
                                                                                          *(_QWORD *)(v64 + 64) = v67;
                                                                                          *(_QWORD *)(v64 + 32) = v65;
                                                                                          v68 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v60);
                                                                                          *(_QWORD *)(v64 + 96) = v66;
                                                                                          *(_QWORD *)(v64 + 104) = v67;
                                                                                          *(_QWORD *)(v64 + 72) = v68;
                                                                                          sub_2443C47FC();

                                                                                          swift_bridgeObjectRelease();
                                                                                          v69 = 0;
                                                                                          v70 = 0;
                                                                                          v117 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferFrameLumaSum);
                                                                                          v71 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferData);
                                                                                          v72 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState);
                                                                                          v73 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel);
                                                                                          v116 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy);
                                                                                          v115 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy2);
                                                                                          v114 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferContrastKernel);
                                                                                          v113 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferContrast);
                                                                                          v112 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferResponses);
                                                                                          v111 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferResponsesNorm);
                                                                                          v110 = (uint64_t *)(v3 + OBJC_IVAR___SwiftVideoProcessor_bufferResults);
                                                                                          while (1)
                                                                                          {
                                                                                            v74 = v69;
                                                                                            if (v62)
                                                                                            {
                                                                                              v75 = objc_msgSend((id)swift_unknownObjectRetain(), sel_newBufferWithLength_options_, 4, 544);
                                                                                              if (v75)
                                                                                              {
                                                                                                v76 = v75;
                                                                                                swift_beginAccess();
                                                                                                v77 = *v117;
                                                                                                swift_unknownObjectRetain();
                                                                                                result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                *v117 = v77;
                                                                                                if ((result & 1) == 0)
                                                                                                  sub_2443C25D8();
                                                                                                if (v70 >= *(_QWORD *)(v77 + 16))
                                                                                                {
                                                                                                  __break(1u);
LABEL_109:
                                                                                                  __break(1u);
LABEL_110:
                                                                                                  __break(1u);
LABEL_111:
                                                                                                  __break(1u);
LABEL_112:
                                                                                                  __break(1u);
LABEL_113:
                                                                                                  __break(1u);
LABEL_114:
                                                                                                  __break(1u);
LABEL_115:
                                                                                                  __break(1u);
LABEL_116:
                                                                                                  __break(1u);
LABEL_117:
                                                                                                  __break(1u);
LABEL_118:
                                                                                                  __break(1u);
LABEL_119:
                                                                                                  __break(1u);
                                                                                                  goto LABEL_120;
                                                                                                }
                                                                                                *(_QWORD *)(v77 + 8 * v70 + 32) = v76;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_2443C4844();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              v78 = objc_msgSend(v62, sel_newBufferWithLength_options_, 56, 544);
                                                                                              if (v78)
                                                                                              {
                                                                                                v79 = v78;
                                                                                                swift_beginAccess();
                                                                                                v80 = *v71;
                                                                                                swift_unknownObjectRetain();
                                                                                                result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                *v71 = v80;
                                                                                                if ((result & 1) == 0)
                                                                                                  sub_2443C25D8();
                                                                                                if (v70 >= *(_QWORD *)(v80 + 16))
                                                                                                  goto LABEL_109;
                                                                                                *(_QWORD *)(v80 + 8 * v70 + 32) = v79;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_2443C4844();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              v81 = objc_msgSend(v62, sel_newBufferWithLength_options_, 144, 544);
                                                                                              if (v81)
                                                                                              {
                                                                                                v82 = v81;
                                                                                                swift_beginAccess();
                                                                                                v83 = *v72;
                                                                                                swift_unknownObjectRetain();
                                                                                                result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                *v72 = v83;
                                                                                                if ((result & 1) == 0)
                                                                                                  sub_2443C25D8();
                                                                                                if (v70 >= *(_QWORD *)(v83 + 16))
                                                                                                  goto LABEL_110;
                                                                                                *(_QWORD *)(v83 + 8 * v70 + 32) = v82;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_2443C4844();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              v84 = objc_msgSend(v62, sel_newBufferWithLength_options_, 1024, 544);
                                                                                              if (v84)
                                                                                              {
                                                                                                v85 = v84;
                                                                                                swift_beginAccess();
                                                                                                v86 = *v73;
                                                                                                swift_unknownObjectRetain();
                                                                                                result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                *v73 = v86;
                                                                                                if ((result & 1) == 0)
                                                                                                  sub_2443C25D8();
                                                                                                if (v70 >= *(_QWORD *)(v86 + 16))
                                                                                                  goto LABEL_111;
                                                                                                *(_QWORD *)(v86 + 8 * v70 + 32) = v85;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_2443C4844();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              v87 = objc_msgSend(v62, sel_newBufferWithLength_options_, 5120, 544);
                                                                                              if (v87)
                                                                                              {
                                                                                                v88 = v87;
                                                                                                swift_beginAccess();
                                                                                                v89 = *v116;
                                                                                                swift_unknownObjectRetain();
                                                                                                result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                *v116 = v89;
                                                                                                if ((result & 1) == 0)
                                                                                                  sub_2443C25D8();
                                                                                                if (v70 >= *(_QWORD *)(v89 + 16))
                                                                                                  goto LABEL_112;
                                                                                                *(_QWORD *)(v89 + 8 * v70 + 32) = v88;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_2443C4844();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              v90 = objc_msgSend(v62, sel_newBufferWithLength_options_, 5120, 544);
                                                                                              if (v90)
                                                                                              {
                                                                                                v91 = v90;
                                                                                                swift_beginAccess();
                                                                                                v92 = *v115;
                                                                                                swift_unknownObjectRetain();
                                                                                                result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                *v115 = v92;
                                                                                                if ((result & 1) == 0)
                                                                                                  sub_2443C25D8();
                                                                                                if (v70 >= *(_QWORD *)(v92 + 16))
                                                                                                  goto LABEL_113;
                                                                                                *(_QWORD *)(v92 + 8 * v70 + 32) = v91;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_2443C4844();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              v93 = objc_msgSend(v62, sel_newBufferWithLength_options_, 640, 544);
                                                                                              if (v93)
                                                                                              {
                                                                                                v94 = v93;
                                                                                                swift_beginAccess();
                                                                                                v95 = *v114;
                                                                                                swift_unknownObjectRetain();
                                                                                                result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                *v114 = v95;
                                                                                                if ((result & 1) == 0)
                                                                                                  sub_2443C25D8();
                                                                                                if (v70 >= *(_QWORD *)(v95 + 16))
                                                                                                  goto LABEL_114;
                                                                                                *(_QWORD *)(v95 + 8 * v70 + 32) = v94;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_2443C4844();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              v96 = objc_msgSend(v62, sel_newBufferWithLength_options_, 640, 544);
                                                                                              if (v96)
                                                                                              {
                                                                                                v97 = v96;
                                                                                                swift_beginAccess();
                                                                                                v98 = *v113;
                                                                                                swift_unknownObjectRetain();
                                                                                                result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                *v113 = v98;
                                                                                                if ((result & 1) == 0)
                                                                                                  sub_2443C25D8();
                                                                                                if (v70 >= *(_QWORD *)(v98 + 16))
                                                                                                  goto LABEL_115;
                                                                                                *(_QWORD *)(v98 + 8 * v70 + 32) = v97;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_2443C4844();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              v99 = objc_msgSend(v62, sel_newBufferWithLength_options_, 20, 544);
                                                                                              if (v99)
                                                                                              {
                                                                                                v100 = v99;
                                                                                                swift_beginAccess();
                                                                                                v101 = *v112;
                                                                                                swift_unknownObjectRetain();
                                                                                                result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                *v112 = v101;
                                                                                                if ((result & 1) == 0)
                                                                                                  sub_2443C25D8();
                                                                                                if (v70 >= *(_QWORD *)(v101 + 16))
                                                                                                  goto LABEL_116;
                                                                                                *(_QWORD *)(v101 + 8 * v70 + 32) = v100;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_2443C4844();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              v102 = objc_msgSend(v62, sel_newBufferWithLength_options_, 20, 544);
                                                                                              if (v102)
                                                                                              {
                                                                                                v103 = v102;
                                                                                                swift_beginAccess();
                                                                                                v104 = *v111;
                                                                                                swift_unknownObjectRetain();
                                                                                                result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                *v111 = v104;
                                                                                                if ((result & 1) == 0)
                                                                                                  sub_2443C25D8();
                                                                                                if (v70 >= *(_QWORD *)(v104 + 16))
                                                                                                  goto LABEL_117;
                                                                                                *(_QWORD *)(v104 + 8 * v70 + 32) = v103;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_2443C4844();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              v105 = objc_msgSend(v62, sel_newBufferWithLength_options_, 40, 544);
                                                                                              if (v105)
                                                                                              {
                                                                                                v106 = v105;
                                                                                                swift_beginAccess();
                                                                                                v107 = *v110;
                                                                                                swift_unknownObjectRetain();
                                                                                                result = swift_isUniquelyReferenced_nonNull_native();
                                                                                                *v110 = v107;
                                                                                                if ((result & 1) == 0)
                                                                                                  sub_2443C25D8();
                                                                                                if (v70 >= *(_QWORD *)(v107 + 16))
                                                                                                  goto LABEL_118;
                                                                                                *(_QWORD *)(v107 + 8 * v70 + 32) = v106;
                                                                                                swift_unknownObjectRelease();
                                                                                                sub_2443C4844();
                                                                                                swift_endAccess();
                                                                                                swift_unknownObjectRelease();
                                                                                              }
                                                                                              swift_unknownObjectRelease();
                                                                                            }
                                                                                            v69 = 1;
                                                                                            v62 = v118;
                                                                                            v70 = 1;
                                                                                            if ((v74 & 1) != 0)
                                                                                            {
                                                                                              swift_unknownObjectRelease();

                                                                                              swift_unknownObjectRelease();
                                                                                              result = swift_unknownObjectRelease();
                                                                                              *(_QWORD *)(v3 + OBJC_IVAR___SwiftVideoProcessor_protectionStatus) = v108;
                                                                                              return result;
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                        goto LABEL_162;
                                                                                      }
LABEL_161:
                                                                                      __break(1u);
LABEL_162:
                                                                                      __break(1u);
                                                                                      return result;
                                                                                    }
LABEL_160:
                                                                                    __break(1u);
                                                                                    goto LABEL_161;
                                                                                  }
LABEL_159:
                                                                                  __break(1u);
                                                                                  goto LABEL_160;
                                                                                }
LABEL_158:
                                                                                __break(1u);
                                                                                goto LABEL_159;
                                                                              }
LABEL_157:
                                                                              __break(1u);
                                                                              goto LABEL_158;
                                                                            }
LABEL_156:
                                                                            __break(1u);
                                                                            goto LABEL_157;
                                                                          }
LABEL_155:
                                                                          __break(1u);
                                                                          goto LABEL_156;
                                                                        }
LABEL_154:
                                                                        __break(1u);
                                                                        goto LABEL_155;
                                                                      }
LABEL_153:
                                                                      __break(1u);
                                                                      goto LABEL_154;
                                                                    }
LABEL_152:
                                                                    __break(1u);
                                                                    goto LABEL_153;
                                                                  }
LABEL_151:
                                                                  __break(1u);
                                                                  goto LABEL_152;
                                                                }
LABEL_150:
                                                                __break(1u);
                                                                goto LABEL_151;
                                                              }
LABEL_149:
                                                              __break(1u);
                                                              goto LABEL_150;
                                                            }
LABEL_148:
                                                            __break(1u);
                                                            goto LABEL_149;
                                                          }
LABEL_147:
                                                          __break(1u);
                                                          goto LABEL_148;
                                                        }
LABEL_146:
                                                        __break(1u);
                                                        goto LABEL_147;
                                                      }
LABEL_145:
                                                      __break(1u);
                                                      goto LABEL_146;
                                                    }
LABEL_144:
                                                    __break(1u);
                                                    goto LABEL_145;
                                                  }
LABEL_143:
                                                  __break(1u);
                                                  goto LABEL_144;
                                                }
LABEL_142:
                                                __break(1u);
                                                goto LABEL_143;
                                              }
LABEL_141:
                                              __break(1u);
                                              goto LABEL_142;
                                            }
LABEL_140:
                                            __break(1u);
                                            goto LABEL_141;
                                          }
LABEL_139:
                                          __break(1u);
                                          goto LABEL_140;
                                        }
LABEL_138:
                                        __break(1u);
                                        goto LABEL_139;
                                      }
LABEL_137:
                                      __break(1u);
                                      goto LABEL_138;
                                    }
LABEL_136:
                                    __break(1u);
                                    goto LABEL_137;
                                  }
LABEL_135:
                                  __break(1u);
                                  goto LABEL_136;
                                }
LABEL_134:
                                __break(1u);
                                goto LABEL_135;
                              }
LABEL_133:
                              __break(1u);
                              goto LABEL_134;
                            }
LABEL_132:
                            __break(1u);
                            goto LABEL_133;
                          }
LABEL_131:
                          __break(1u);
                          goto LABEL_132;
                        }
LABEL_130:
                        __break(1u);
                        goto LABEL_131;
                      }
LABEL_129:
                      __break(1u);
                      goto LABEL_130;
                    }
LABEL_128:
                    __break(1u);
                    goto LABEL_129;
                  }
LABEL_127:
                  __break(1u);
                  goto LABEL_128;
                }
LABEL_126:
                __break(1u);
                goto LABEL_127;
              }
LABEL_125:
              __break(1u);
              goto LABEL_126;
            }
LABEL_124:
            __break(1u);
            goto LABEL_125;
          }
LABEL_123:
          __break(1u);
          goto LABEL_124;
        }
LABEL_122:
        __break(1u);
        goto LABEL_123;
      }
    }
    __break(1u);
    goto LABEL_122;
  }
  return result;
}

uint64_t sub_2443BE250(uint64_t a1)
{
  uint64_t v1;
  float v2;
  float v3;
  float v4;
  uint64_t v5;
  float v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  int v12;
  id v13;
  uint64_t v14;
  id v15;
  double v16;
  id v17;
  uint64_t v18;
  void *v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  float v28;
  uint64_t v29;
  float v30;
  unint64_t v31;
  unint64_t v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v38;
  float v39;
  float v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  double *v54;
  float v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  float v59;
  uint64_t v60;
  id v61;
  double v62;
  id v63;
  int v64;
  id v65;
  double v66;
  id v67;
  unsigned int v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  id v75;
  uint64_t v76;
  id v77;
  double v78;
  id v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  float32x4_t *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  float v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  float32x4_t *v98;
  float32x4_t v99;
  float32x4_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  id v106;
  double v107;
  uint64_t v108;
  void *v109;
  id v110;
  void *v111;
  uint64_t v112;
  id v113;
  id v114;
  uint64_t v115;
  id v116;
  id v117;
  _BYTE *v118;
  uint64_t result;
  id v120;
  uint64_t v121;
  id v122;
  void *v123;
  unint64_t i;
  id v125;
  uint64_t v126;
  _QWORD *v127;
  int v128;
  id v129;
  double v130;
  id v131;
  void *v132;
  id v133;
  id v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  _BYTE *v168;
  unint64_t v169;
  unint64_t v170;
  uint64_t v171;
  id v172;
  uint64_t v173;
  uint64_t v174;
  float v175;
  uint64_t (*v176)(void);
  id v177;
  double v178;
  uint64_t v179;
  __int128 v180;
  uint64_t v181;
  __int128 v182;
  __int128 v183;
  int v184;
  __int128 v185;
  _OWORD v186[3];
  __int128 v187;
  int v188;
  void *v189;
  void *v190;
  _BYTE v191[20];
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  uint64_t v199;
  _BYTE v200[32];
  uint64_t v201;

  v201 = *MEMORY[0x24BDAC8D0];
  v2 = *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_fps);
  v3 = fminf(vabds_f32(24.0, v2), 1000.0);
  v4 = vabds_f32(25.0, v2);
  v5 = v4 <= v3;
  if (v4 <= v3)
    v3 = v4;
  v6 = vabds_f32(30.0, v2);
  if (v6 <= v3)
  {
    v3 = v6;
    v5 = 2;
  }
  v7 = vabds_f32(50.0, v2);
  if (v7 <= v3)
  {
    v3 = v7;
    v5 = 3;
  }
  v8 = vabds_f32(60.0, v2);
  if (v8 <= v3)
  {
    v3 = v8;
    v5 = 4;
  }
  v9 = vabds_f32(90.0, v2);
  if (v9 <= v3)
  {
    v3 = v9;
    v5 = 5;
  }
  LODWORD(v182) = 1123024896;
  if (vabds_f32(120.0, v2) > v3)
    v10 = v5;
  else
    v10 = 6;
  v180 = xmmword_2443C5480;
  v181 = 0x42B4000042700000;
  if (!PSELog)
  {
LABEL_182:
    __break(1u);
LABEL_183:
    __break(1u);
    goto LABEL_184;
  }
  v12 = *((_DWORD *)&v180 + v10);
  v13 = (id)PSELog;
  sub_2443C485C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735CFD0);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2443C5490;
  v15 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  LODWORD(v16) = v12;
  v17 = objc_msgSend(v15, sel_initWithFloat_, v16);
  v170 = sub_2443C2824();
  *(_QWORD *)(v14 + 56) = v170;
  v169 = sub_2443C2860();
  *(_QWORD *)(v14 + 64) = v169;
  *(_QWORD *)(v14 + 32) = v17;
  v18 = 2;
  sub_2443C47FC();
  swift_bridgeObjectRelease();

  *(_QWORD *)(v1 + OBJC_IVAR___SwiftVideoProcessor_idxFrameRate) = v10;
  v19 = (void *)sub_2443C4808();
  v20 = MGGetSInt32Answer();

  v21 = v20 - 1;
  if ((v20 - 1) > 5)
  {
    v24 = 1151218688;
    v23 = 3;
  }
  else
  {
    v22 = 8 * v21;
    v18 = *(_QWORD *)((char *)&unk_2443C5680 + v22);
    v23 = *(_QWORD *)((char *)&unk_2443C56B0 + v22);
    v24 = dword_2443C56E0[v21];
  }
  *(_QWORD *)(v1 + OBJC_IVAR___SwiftVideoProcessor_idxEquivalentKernelIndex) = v18;
  *(_QWORD *)(v1 + OBJC_IVAR___SwiftVideoProcessor_idxEquivalentSize) = v23;
  *(_DWORD *)(v1 + OBJC_IVAR___SwiftVideoProcessor_area) = v24;
  v25 = v1 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  swift_beginAccess();
  *(_BYTE *)(v25 + 48) = 0;
  *(_BYTE *)(v25 + 8) = 0;
  v26 = OBJC_IVAR___SwiftVideoProcessor_fps;
  v175 = *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_fps);
  v27 = *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_energyPoolGammaShape);
  v28 = *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_energyPoolGammaScale);
  v29 = sub_2443C4850();
  *(_QWORD *)(v29 + 16) = 256;
  bzero((void *)(v29 + 32), 0x400uLL);
  v30 = v27 + -1.0;
  if ((~COERCE_INT(v27 + -1.0) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_170;
  }
  if (v30 <= -9.2234e18)
  {
LABEL_170:
    __break(1u);
    goto LABEL_171;
  }
  if (v30 >= 9.2234e18)
  {
LABEL_171:
    __break(1u);
    goto LABEL_172;
  }
  v31 = (uint64_t)v30;
  if ((uint64_t)v30 < 0)
  {
LABEL_172:
    __break(1u);
LABEL_173:
    __break(1u);
LABEL_174:
    __break(1u);
    goto LABEL_175;
  }
  if (v31 > 7)
    goto LABEL_173;
  v32 = 0;
  v33 = flt_2514EBFC0[v31 + 8];
  v34 = -v27;
  v35 = 0.0;
  v36 = 0.0;
  v174 = v1;
  v162 = a1;
  v164 = v29 + 32;
  v166 = v29;
  v167 = v26;
  do
  {
    if ((float)(v35 / v175) > 0.99 && v36 >= 2.0)
      break;
    v36 = (float)(1.0 / v175) + v36;
    v38 = expf((float)-v36 / v28);
    v39 = v38 * powf(v28, v34);
    v40 = (float)(v39 * powf(v36, v30)) / v33;
    v35 = v35 + v40;
    *(float *)(v29 + 4 * v32++ + 32) = v40;
  }
  while (v32 != 256);
  v41 = sub_2443C4850();
  *(_QWORD *)(v41 + 16) = 640;
  v42 = v41 + 32;
  bzero((void *)(v41 + 32), 0xA00uLL);
  v43 = sub_2443C4850();
  *(_QWORD *)(v43 + 16) = 5;
  *(_OWORD *)(v43 + 32) = 0u;
  v44 = v43 + 32;
  *(_OWORD *)(v43 + 48) = 0u;
  *(_QWORD *)(v43 + 64) = 0;
  type metadata accessor for UMFKernels();
  v45 = 0;
  v176 = *(uint64_t (**)(void))(*(_QWORD *)sub_2443C350C() + 120);
  v171 = OBJC_IVAR___SwiftVideoProcessor_idxFrameRate;
  v173 = OBJC_IVAR___SwiftVideoProcessor_idxEquivalentKernelIndex;
  while (1)
  {
    if (v45 >= *(_QWORD *)(v43 + 16))
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
      goto LABEL_136;
    }
    *(_QWORD *)(v44 + 8 * v45) = 0;
    v46 = *(_QWORD *)(v1 + v173);
    v47 = *(_QWORD *)(v1 + v171);
    v48 = v176();
    if ((v46 & 0x8000000000000000) != 0)
      goto LABEL_131;
    if (v46 >= *(_QWORD *)(v48 + 16))
      goto LABEL_132;
    v49 = *(_QWORD *)(v48 + 8 * v46 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v45 >= *(_QWORD *)(v49 + 16))
      goto LABEL_133;
    v50 = *(_QWORD *)(v49 + 8 * v45 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((v47 & 0x8000000000000000) != 0)
      goto LABEL_134;
    if (v47 >= *(_QWORD *)(v50 + 16))
      goto LABEL_135;
    v51 = *(_QWORD *)(v50 + 8 * v47 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v52 = *(_QWORD *)(v51 + 16);
    if (v52)
      break;
LABEL_31:
    ++v45;
    swift_bridgeObjectRelease();
    if (v45 == 5)
    {
      swift_release();
      v180 = xmmword_2443C54A0;
      if (!PSELog)
      {
LABEL_190:
        __break(1u);
LABEL_191:
        __break(1u);
      }
      v59 = *((float *)&v180 + *(_QWORD *)(v1 + OBJC_IVAR___SwiftVideoProcessor_idxEquivalentSize));
      v177 = (id)PSELog;
      sub_2443C485C();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735CFD0);
      v60 = swift_allocObject();
      *(_OWORD *)(v60 + 16) = xmmword_2443C5470;
      v61 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
      *(float *)&v62 = v59;
      v63 = objc_msgSend(v61, sel_initWithFloat_, v62);
      *(_QWORD *)(v60 + 56) = v170;
      *(_QWORD *)(v60 + 64) = v169;
      *(_QWORD *)(v60 + 32) = v63;
      v64 = *(_DWORD *)(v1 + v167);
      v65 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
      LODWORD(v66) = v64;
      v67 = objc_msgSend(v65, sel_initWithFloat_, v66);
      *(_QWORD *)(v60 + 96) = v170;
      *(_QWORD *)(v60 + 104) = v169;
      *(_QWORD *)(v60 + 72) = v67;
      sub_2443C47FC();

      swift_bridgeObjectRelease();
      if (!HIDWORD(v32))
      {
        *(float *)&v68 = *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_nits)
                       * *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_avl);
        v69 = *(float *)(v1 + v167);
        v70 = 1.0 - expf(-1.0 / (float)(*(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_tauAdapt) * v69));
        v71 = 1.0 - expf(-1.0 / (float)(v69 * *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_tauMitigation)));
        v72 = powf(sqrtf(*(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_area) * 1.6) / v59, *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_cA)+ *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_cA));
        v73 = *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_gain);
        v74 = powf(v69, 1.0 / *(float *)(v1 + OBJC_IVAR___SwiftVideoProcessor_energyPoolExponent));
        LODWORD(v180) = 0;
        *(_QWORD *)((char *)&v180 + 4) = __PAIR64__(v68, v32);
        *((float *)&v180 + 3) = v70;
        *(float *)&v181 = v71;
        *((float *)&v181 + 1) = v72 * (float)(v73 / v74);
        v182 = 0u;
        v183 = 0u;
        v184 = 1065353216;
        v185 = 0u;
        memset(v186, 0, sizeof(v186));
        v187 = 0u;
        v188 = 0;
        if (!PSELog)
          goto LABEL_191;
        v75 = (id)PSELog;
        sub_2443C485C();
        v76 = swift_allocObject();
        *(_OWORD *)(v76 + 16) = xmmword_2443C5490;
        v77 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
        *(float *)&v78 = v70;
        v79 = objc_msgSend(v77, sel_initWithFloat_, v78);
        *(_QWORD *)(v76 + 56) = v170;
        *(_QWORD *)(v76 + 64) = v169;
        *(_QWORD *)(v76 + 32) = v79;
        sub_2443C47FC();

        swift_bridgeObjectRelease();
        if (*(_QWORD *)(v43 + 16))
        {
          v80 = 0;
          v81 = 0;
          v82 = 0;
          v83 = (float32x4_t *)(v41 + 48);
          v84 = v41 + 32;
          while (1)
          {
            v85 = *(_QWORD *)(v44 + 8 * v82);
            if (HIDWORD(v85))
              break;
            *((_DWORD *)v186 + v82 + 2) = v85;
            v86 = *(_QWORD *)(v44 + 8 * v82);
            if (v86 < 0)
              goto LABEL_165;
            if (v86)
            {
              v87 = 32 * v82;
              v88 = *(_QWORD *)(v41 + 16);
              if (v88 > 32 * v82)
                v87 = *(_QWORD *)(v41 + 16);
              v89 = v87 - 32 * v82;
              v90 = v86 - 1;
              if (v89 >= v86 - 1)
                v89 = v86 - 1;
              v91 = v89 + 1;
              if (v91 >= 9)
              {
                v94 = v91 & 7;
                if ((v91 & 7) == 0)
                  v94 = 8;
                v92 = v91 - v94;
                if (v88 <= v81)
                  v95 = v81;
                else
                  v95 = *(_QWORD *)(v41 + 16);
                v96 = v95 + v80;
                if (v96 < v90)
                  v90 = v96;
                v97 = v90 - v94 + 1;
                v93 = 0.0;
                v98 = v83;
                do
                {
                  v99 = vmulq_f32(v98[-1], v98[-1]);
                  v100 = vmulq_f32(*v98, *v98);
                  v93 = (float)((float)((float)((float)((float)((float)((float)(v93 + v99.f32[0]) + v99.f32[1])
                                                              + v99.f32[2])
                                                      + v99.f32[3])
                                              + v100.f32[0])
                                      + v100.f32[1])
                              + v100.f32[2])
                      + v100.f32[3];
                  v98 += 2;
                  v97 -= 8;
                }
                while (v97);
              }
              else
              {
                v92 = 0;
                v93 = 0.0;
              }
              while (v81 + v92 < v88)
              {
                v93 = v93 + (float)(*(float *)(v84 + 4 * v92) * *(float *)(v84 + 4 * v92));
                if (v86 == ++v92)
                  goto LABEL_71;
              }
              goto LABEL_93;
            }
            v93 = 0.0;
LABEL_71:
            v101 = 4 * v82;
            *(float *)((char *)&v186[1] + v101 + 12) = v93;
            *(_OWORD *)v200 = xmmword_2443C54B0;
            *(_OWORD *)&v200[16] = xmmword_2443C54C0;
            *(_DWORD *)v191 = 1068708659;
            *(_OWORD *)&v191[4] = *(_OWORD *)&v200[4];
            v192 = xmmword_2443C54B0;
            v193 = xmmword_2443C54D0;
            v194 = xmmword_2443C54E0;
            v195 = xmmword_2443C54F0;
            v196 = xmmword_2443C5500;
            v197 = xmmword_2443C5510;
            v198 = xmmword_2443C5520;
            v199 = 0x4000000040000000;
            *(_DWORD *)((char *)&v187 + v101) = *(_DWORD *)&v191[4 * v82];
            if (v82 == 4)
              goto LABEL_74;
            ++v82;
            v81 += 32;
            v80 -= 32;
            v83 += 8;
            v84 += 128;
            if (v82 >= *(_QWORD *)(v43 + 16))
              goto LABEL_73;
          }
          __break(1u);
LABEL_165:
          __break(1u);
          goto LABEL_168;
        }
LABEL_73:
        __break(1u);
LABEL_74:
        v102 = (void *)PSELog;
        if (PSELog)
        {
          v178 = *(double *)((char *)&v186[1] + 12);
          v103 = 4;
          while (1)
          {
            v104 = v102;
            sub_2443C485C();
            v105 = swift_allocObject();
            *(_OWORD *)(v105 + 16) = xmmword_2443C5490;
            v106 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithFloat_, v178);
            *(_QWORD *)(v105 + 56) = v170;
            *(_QWORD *)(v105 + 64) = v169;
            *(_QWORD *)(v105 + 32) = v106;
            sub_2443C47FC();

            swift_bridgeObjectRelease();
            if (v103 == 20)
              break;
            *(_OWORD *)v191 = *(_OWORD *)((char *)&v186[1] + 12);
            *(_DWORD *)&v191[16] = HIDWORD(v186[2]);
            LODWORD(v107) = *(_DWORD *)&v191[v103];
            v178 = v107;
            v102 = (void *)PSELog;
            v103 += 4;
            if (!PSELog)
              goto LABEL_78;
          }
        }
        else
        {
LABEL_78:
          __break(1u);
        }
        v108 = v174;
        v109 = *(void **)(v174 + OBJC_IVAR___SwiftVideoProcessor_device);
        if (!v109)
          goto LABEL_95;
        v110 = objc_msgSend((id)swift_unknownObjectRetain(), sel_newBufferWithBytes_length_options_, v42, 640, 0);
        if (!v110)
          goto LABEL_94;
        v111 = v110;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25735D308);
        v112 = swift_allocObject();
        *(_OWORD *)(v112 + 16) = xmmword_2443C5490;
        v113 = objc_msgSend((id)swift_unknownObjectRetain(), sel_contents);
        v114 = v111;
        *(_QWORD *)(v112 + 56) = MEMORY[0x24BEE1EF0];
        *(_QWORD *)(v112 + 32) = v113;
        sub_2443C491C();
        swift_bridgeObjectRelease();
        *(_QWORD *)v191 = v41;
        v115 = swift_allocObject();
        *(_OWORD *)(v115 + 16) = xmmword_2443C5490;
        *(_QWORD *)(v115 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_25735D310);
        *(_QWORD *)(v115 + 32) = v191;
        swift_bridgeObjectRetain();
        sub_2443C491C();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v116 = objc_msgSend(v109, sel_newBufferWithBytes_length_options_, v164, 4 * v32, 0);
        if (!v116)
        {
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v117 = v116;
        v179 = 4 * v32;
        v118 = (_BYTE *)(v174 + OBJC_IVAR___SwiftVideoProcessor_inTestingMode);
        result = swift_beginAccess();
        v168 = v118;
        if (*v118 == 1)
        {
          v172 = v114;
          if (!PSELog)
          {
            __break(1u);
            return result;
          }
          v120 = (id)PSELog;
          sub_2443C4868();
          v121 = swift_allocObject();
          *(_OWORD *)(v121 + 16) = xmmword_2443C5490;
          v122 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInt_, DWORD1(v180));
          *(_QWORD *)(v121 + 56) = v170;
          *(_QWORD *)(v121 + 64) = v169;
          *(_QWORD *)(v121 + 32) = v122;
          sub_2443C47FC();

          swift_bridgeObjectRelease();
          if (v32)
          {
            v123 = v109;
            for (i = 0; i != v32; ++i)
            {
              if (!PSELog)
                goto LABEL_183;
              v125 = (id)PSELog;
              sub_2443C4868();
              v126 = swift_allocObject();
              *(_OWORD *)(v126 + 16) = xmmword_2443C5490;
              if (i >= *(_QWORD *)(v166 + 16))
                goto LABEL_174;
              v127 = (_QWORD *)v126;
              v128 = *(_DWORD *)(v166 + 4 * i + 32);
              v129 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
              LODWORD(v130) = v128;
              v131 = objc_msgSend(v129, sel_initWithFloat_, v130);
              v127[7] = v170;
              v127[8] = v169;
              v127[4] = v131;
              sub_2443C47FC();

              swift_bridgeObjectRelease();
            }
            swift_bridgeObjectRelease();
            v108 = v174;
            v109 = v123;
            v114 = v172;
          }
          else
          {
            swift_bridgeObjectRelease();
            v108 = v174;
            v114 = v172;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        v132 = *(void **)(v108 + OBJC_IVAR___SwiftVideoProcessor_commandQueue);
        if (!v132)
        {
LABEL_138:
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          return swift_unknownObjectRelease();
        }
        swift_unknownObjectRetain();
        v133 = objc_msgSend(v109, sel_newBufferWithBytes_length_options_, &v180, 144, 0);
        if (!v133)
        {
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          return swift_unknownObjectRelease();
        }
        v134 = v133;
        if (!objc_msgSend(v132, sel_commandBuffer))
        {
LABEL_137:
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          goto LABEL_138;
        }
        v190 = &unk_25736E8A0;
        v135 = (void *)swift_dynamicCastObjCProtocolConditional();
        if (v135)
        {
          v136 = v135;
          v137 = objc_msgSend(v135, sel_blitCommandEncoder);
          if (!v137)
            goto LABEL_126;
          v138 = v137;
          v165 = v117;
          v139 = v114;
          v140 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
          swift_beginAccess();
          if (*(_QWORD *)(*(_QWORD *)v140 + 16))
          {
            v141 = *(_QWORD *)(*(_QWORD *)v140 + 32);
            if (v141)
              objc_msgSend(v138, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v134, 0, v141, 0, 144);
            v142 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel;
            swift_beginAccess();
            if (*(_QWORD *)(*(_QWORD *)v142 + 16))
            {
              v143 = *(_QWORD *)(*(_QWORD *)v142 + 32);
              if (v143)
                objc_msgSend(v138, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v165, 0, v143, 0, v179);
              v144 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferContrastKernel;
              swift_beginAccess();
              if (*(_QWORD *)(*(_QWORD *)v144 + 16))
              {
                v145 = *(_QWORD *)(*(_QWORD *)v144 + 32);
                if (v145)
                  objc_msgSend(v138, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v139, 0, v145, 0, 640);
                v146 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferContrast;
                swift_beginAccess();
                if (*(_QWORD *)(*(_QWORD *)v146 + 16))
                {
                  if (*(_QWORD *)(*(_QWORD *)v146 + 32))
                  {
                    swift_getObjectType();
                    swift_unknownObjectRetain();
                    sub_2443C488C();
                    swift_unknownObjectRelease();
                  }
                  v147 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy;
                  swift_beginAccess();
                  if (*(_QWORD *)(*(_QWORD *)v147 + 16))
                  {
                    if (*(_QWORD *)(*(_QWORD *)v147 + 32))
                    {
                      swift_getObjectType();
                      swift_unknownObjectRetain();
                      sub_2443C488C();
                      swift_unknownObjectRelease();
                    }
                    v148 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy2;
                    swift_beginAccess();
                    if (*(_QWORD *)(*(_QWORD *)v148 + 16))
                    {
                      if (*(_QWORD *)(*(_QWORD *)v148 + 32))
                      {
                        swift_getObjectType();
                        swift_unknownObjectRetain();
                        sub_2443C488C();
                        swift_unknownObjectRelease();
                      }
                      if (*(_QWORD *)(v174 + OBJC_IVAR___SwiftVideoProcessor_bufferDataDebug))
                      {
                        swift_getObjectType();
                        swift_unknownObjectRetain();
                        sub_2443C488C();
                        swift_unknownObjectRelease();
                      }
                      objc_msgSend(v138, sel_endEncoding, v162);
                      swift_unknownObjectRelease();
                      v114 = v139;
                      v117 = v165;
LABEL_126:
                      objc_msgSend(v136, sel_commit, v162);
                      if (*v168 == 1)
                      {
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        return swift_unknownObjectRelease();
                      }
                      if (!objc_msgSend(v132, sel_commandBuffer))
                        goto LABEL_168;
                      v189 = &unk_25736E8A0;
                      v149 = (void *)swift_dynamicCastObjCProtocolConditional();
                      if (!v149)
                      {
                        swift_unknownObjectRelease();
LABEL_168:
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        goto LABEL_138;
                      }
                      v150 = v149;
                      if ((objc_msgSend(v149, sel_respondsToSelector_, sel_setProtectionOptions_) & 1) != 0)
                        objc_msgSend(v150, sel_setProtectionOptions_, v163);
                      v151 = objc_msgSend(v150, sel_blitCommandEncoder);
                      if (!v151)
                      {
LABEL_163:
                        objc_msgSend(v150, sel_commit);
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        swift_unknownObjectRelease();
                        return swift_unknownObjectRelease();
                      }
                      v152 = v151;
                      v153 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
                      swift_beginAccess();
                      if (*(_QWORD *)(*(_QWORD *)v153 + 16) >= 2uLL)
                      {
                        v154 = *(_QWORD *)(*(_QWORD *)v153 + 40);
                        if (v154)
                          objc_msgSend(v152, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v134, 0, v154, 0, 144);
                        v155 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel;
                        swift_beginAccess();
                        if (*(_QWORD *)(*(_QWORD *)v155 + 16) >= 2uLL)
                        {
                          v156 = *(_QWORD *)(*(_QWORD *)v155 + 40);
                          if (v156)
                            objc_msgSend(v152, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v117, 0, v156, 0, v179);
                          v157 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferContrastKernel;
                          swift_beginAccess();
                          if (*(_QWORD *)(*(_QWORD *)v157 + 16) >= 2uLL)
                          {
                            v158 = *(_QWORD *)(*(_QWORD *)v157 + 40);
                            if (v158)
                              objc_msgSend(v152, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, v114, 0, v158, 0, 640);
                            v159 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferContrast;
                            swift_beginAccess();
                            if (*(_QWORD *)(*(_QWORD *)v159 + 16) >= 2uLL)
                            {
                              if (*(_QWORD *)(*(_QWORD *)v159 + 40))
                              {
                                swift_getObjectType();
                                swift_unknownObjectRetain();
                                sub_2443C488C();
                                swift_unknownObjectRelease();
                              }
                              v160 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy;
                              swift_beginAccess();
                              if (*(_QWORD *)(*(_QWORD *)v160 + 16) >= 2uLL)
                              {
                                if (*(_QWORD *)(*(_QWORD *)v160 + 40))
                                {
                                  swift_getObjectType();
                                  swift_unknownObjectRetain();
                                  sub_2443C488C();
                                  swift_unknownObjectRelease();
                                }
                                v161 = v174 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy2;
                                swift_beginAccess();
                                if (*(_QWORD *)(*(_QWORD *)v161 + 16) >= 2uLL)
                                {
                                  if (*(_QWORD *)(*(_QWORD *)v161 + 40))
                                  {
                                    swift_getObjectType();
                                    swift_unknownObjectRetain();
                                    sub_2443C488C();
                                    swift_unknownObjectRelease();
                                  }
                                  objc_msgSend(v152, sel_endEncoding);
                                  swift_unknownObjectRelease();
                                  goto LABEL_163;
                                }
                                goto LABEL_189;
                              }
LABEL_188:
                              __break(1u);
LABEL_189:
                              __break(1u);
                              goto LABEL_190;
                            }
LABEL_187:
                            __break(1u);
                            goto LABEL_188;
                          }
LABEL_186:
                          __break(1u);
                          goto LABEL_187;
                        }
LABEL_185:
                        __break(1u);
                        goto LABEL_186;
                      }
LABEL_184:
                      __break(1u);
                      goto LABEL_185;
                    }
                    goto LABEL_181;
                  }
LABEL_180:
                  __break(1u);
LABEL_181:
                  __break(1u);
                  goto LABEL_182;
                }
LABEL_179:
                __break(1u);
                goto LABEL_180;
              }
LABEL_178:
              __break(1u);
              goto LABEL_179;
            }
LABEL_177:
            __break(1u);
            goto LABEL_178;
          }
LABEL_176:
          __break(1u);
          goto LABEL_177;
        }
LABEL_136:
        swift_unknownObjectRelease();
        goto LABEL_137;
      }
LABEL_175:
      __break(1u);
      goto LABEL_176;
    }
  }
  v53 = 32 * v45;
  v54 = (double *)(v51 + 32);
  while (v53 < *(_QWORD *)(v41 + 16))
  {
    v55 = *v54;
    *(float *)(v42 + 4 * v53) = v55;
    if (v45 >= *(_QWORD *)(v43 + 16))
      goto LABEL_91;
    v56 = *(_QWORD *)(v44 + 8 * v45);
    v57 = __CFADD__(v56, 1);
    v58 = v56 + 1;
    if (v57)
      goto LABEL_92;
    *(_QWORD *)(v44 + 8 * v45) = v58;
    ++v53;
    ++v54;
    if (!--v52)
      goto LABEL_31;
  }
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  swift_unknownObjectRelease();
LABEL_95:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall VideoProcessor.processSurface(sourceSurface:timestamp:destinationSurface:options:)(IOSurfaceRef sourceSurface, Swift::Double timestamp, IOSurfaceRef destinationSurface, NSDictionary options)
{
  uint64_t v4;
  __IOSurface *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t ObjCClassFromMetadata;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  double v73;
  double v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  char *v78;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  float v95;
  double v96;
  BOOL v97;
  double v98;
  float v99;
  BOOL v100;
  uint64_t v101;
  size_t Width;
  uint64_t v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  id v107;
  int v108;
  id v109;
  uint64_t v110;
  id v111;
  int v112;
  int v113;
  uint64_t v114;
  uint64_t ProtectionOptions;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  id v120;
  id v121;
  void *v122;
  void *v123;
  OSType PixelFormat;
  unsigned __int8 v125;
  uint64_t v126;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  id v129;
  id v130;
  uint64_t v131;
  id v132;
  id v133;
  uint64_t v134;
  void *v135;
  id v136;
  id v137;
  id v138;
  id v139;
  int v140;
  int v141;
  id v142;
  id v143;
  int v144;
  int v145;
  id v146;
  id v147;
  int v148;
  int v149;
  id v150;
  uint64_t v151;
  int v152;
  id v153;
  double v154;
  id v155;
  int v156;
  id v157;
  double v158;
  id v159;
  int v160;
  id v161;
  double v162;
  id v163;
  id v164;
  id v165;
  float v166;
  float v167;
  void *v168;
  dispatch_semaphore_t v169;
  void *v170;
  void *v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  void *v175;
  char v176;
  unint64_t v177;
  uint64_t v178;
  int64_t v179;
  int64_t v180;
  uint64_t v181;
  id v182;
  void *v183;
  uint64_t v184;
  id v185;
  void *v186;
  void *v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  __int128 v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  __int128 v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  __int128 v249;
  char v250;
  char v251;
  char v252;
  char v253;
  char v254;
  char v255;
  uint64_t v256;
  char v257;
  int v258;
  id v259;
  void *v260;
  uint64_t v261;
  void *v262;
  void *v263;
  id v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  id v269;
  size_t Height;
  uint64_t v272;
  __int128 v273;
  IOSurfaceRef buffera[2];
  IOSurfaceRef bufferb[2];
  IOSurfaceRef bufferc[2];
  unint64_t v278;
  NSObject *v280;
  id v281;
  id v282;
  uint64_t v283;
  __int128 v284;
  __int128 v285;
  void *v286;
  __int128 v287;
  uint64_t v288;
  __int128 v289;
  uint64_t v290;
  _BYTE aBlock[40];
  uint64_t v292;
  char v293;
  int v294;
  void *v295;

  v6 = sourceSurface;
  v7 = 0x25735C000uLL;
  if (*(_BYTE *)(v4 + OBJC_IVAR___SwiftVideoProcessor_needsInitialization) == 1)
  {
    swift_getObjectType();
    if (!PSELog)
    {
LABEL_295:
      __break(1u);
      goto LABEL_296;
    }
    v8 = (id)PSELog;
    sub_2443C4880();
    sub_2443C47FC();

    type metadata accessor for UMFKernels();
    v9 = sub_2443C350C();
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 152))(v9);
    swift_release();
    v10 = MTLCreateSystemDefaultDevice();
    v11 = OBJC_IVAR___SwiftVideoProcessor_device;
    *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_device) = v10;
    swift_unknownObjectRelease();
    v12 = *(void **)(v283 + v11);
    if (v12)
    {
      *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_commandQueue) = objc_msgSend((id)swift_unknownObjectRetain(), sel_newCommandQueue);
      swift_unknownObjectRelease();
      v13 = (void *)objc_opt_self();
      v14 = objc_msgSend(v13, sel_sharedCaptureManager);
      v15 = objc_msgSend(v14, sel_newCaptureScopeWithDevice_, v12);

      v16 = objc_msgSend(v13, sel_sharedCaptureManager);
      objc_msgSend(v16, sel_setDefaultCaptureScope_, v15);

      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v18 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
      *(_QWORD *)aBlock = 0;
      v19 = objc_msgSend(v12, sel_newDefaultLibraryWithBundle_error_, v18, aBlock);

      v20 = *(void **)aBlock;
      if (v19)
      {
        *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_library) = v19;
        v21 = v20;
        swift_unknownObjectRelease();
      }
      else
      {
        v22 = *(id *)aBlock;
        v23 = (void *)sub_2443C47F0();

        swift_willThrow();
        if (!PSELog)
        {
LABEL_297:
          __break(1u);
          goto LABEL_298;
        }
        v24 = (id)PSELog;
        sub_2443C4874();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25735CFD0);
        v25 = swift_allocObject();
        *(_OWORD *)(v25 + 16) = xmmword_2443C5490;
        swift_getErrorValue();
        v26 = sub_2443C4910();
        v28 = v27;
        *(_QWORD *)(v25 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v25 + 64) = sub_2443C339C();
        *(_QWORD *)(v25 + 32) = v26;
        *(_QWORD *)(v25 + 40) = v28;
        sub_2443C47FC();
        swift_bridgeObjectRelease();

        v6 = sourceSurface;
        v7 = 0x25735C000uLL;
      }
      sub_2443BD588(0);
      v29 = objc_msgSend(v12, sel_newBufferWithLength_options_, 56, 0);
      *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_bufferDataDebug) = v29;
      swift_unknownObjectRelease();
      sub_2443BE250(0);
      v30 = OBJC_IVAR___SwiftVideoProcessor_library;
      v31 = *(void **)(v283 + OBJC_IVAR___SwiftVideoProcessor_library);
      if (!v31)
        goto LABEL_30;
      swift_unknownObjectRetain();
      v32 = (void *)sub_2443C4808();
      v33 = objc_msgSend(v31, sel_newFunctionWithName_, v32);

      swift_unknownObjectRelease();
      if (v33)
      {
        *(_QWORD *)&v284 = 0;
        v34 = objc_msgSend(v12, sel_newComputePipelineStateWithFunction_error_, v33, &v284);
        v35 = (id)v284;
        if (v34)
        {
          swift_unknownObjectRelease();
          *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass0) = v34;
          swift_unknownObjectRelease();
        }
        else
        {
          v36 = v35;
          v37 = (void *)sub_2443C47F0();

          swift_willThrow();
          if (!PSELog)
          {
LABEL_298:
            __break(1u);
            goto LABEL_299;
          }
          v38 = (id)PSELog;
          sub_2443C4874();
          __swift_instantiateConcreteTypeFromMangledName(&qword_25735CFD0);
          v39 = swift_allocObject();
          *(_OWORD *)(v39 + 16) = xmmword_2443C5490;
          swift_getErrorValue();
          v40 = sub_2443C4910();
          v42 = v41;
          *(_QWORD *)(v39 + 56) = MEMORY[0x24BEE0D00];
          *(_QWORD *)(v39 + 64) = sub_2443C339C();
          *(_QWORD *)(v39 + 32) = v40;
          *(_QWORD *)(v39 + 40) = v42;
          sub_2443C47FC();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          v6 = sourceSurface;
          v7 = 0x25735C000;
        }
      }
      v43 = *(void **)(v283 + v30);
      if (!v43)
        goto LABEL_30;
      swift_unknownObjectRetain();
      v44 = (void *)sub_2443C4808();
      v45 = objc_msgSend(v43, sel_newFunctionWithName_, v44);

      swift_unknownObjectRelease();
      if (v45)
      {
        *(_QWORD *)&v284 = 0;
        v46 = objc_msgSend(v12, sel_newComputePipelineStateWithFunction_error_, v45, &v284);
        v47 = (id)v284;
        if (v46)
        {
          swift_unknownObjectRelease();
          *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass1) = v46;
          swift_unknownObjectRelease();
        }
        else
        {
          v48 = v47;
          v49 = (void *)sub_2443C47F0();

          swift_willThrow();
          if (!PSELog)
          {
LABEL_299:
            __break(1u);
            goto LABEL_300;
          }
          v50 = (id)PSELog;
          sub_2443C4874();
          __swift_instantiateConcreteTypeFromMangledName(&qword_25735CFD0);
          v51 = swift_allocObject();
          *(_OWORD *)(v51 + 16) = xmmword_2443C5490;
          swift_getErrorValue();
          v52 = sub_2443C4910();
          v54 = v53;
          *(_QWORD *)(v51 + 56) = MEMORY[0x24BEE0D00];
          *(_QWORD *)(v51 + 64) = sub_2443C339C();
          *(_QWORD *)(v51 + 32) = v52;
          *(_QWORD *)(v51 + 40) = v54;
          sub_2443C47FC();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          v6 = sourceSurface;
          v7 = 0x25735C000;
        }
      }
      v55 = *(void **)(v283 + v30);
      if (!v55)
        goto LABEL_30;
      swift_unknownObjectRetain();
      v56 = (void *)sub_2443C4808();
      v57 = objc_msgSend(v55, sel_newFunctionWithName_, v56);

      swift_unknownObjectRelease();
      if (v57)
      {
        *(_QWORD *)&v284 = 0;
        v58 = objc_msgSend(v12, sel_newComputePipelineStateWithFunction_error_, v57, &v284);
        v59 = (id)v284;
        if (v58)
        {
          swift_unknownObjectRelease();
          *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass2) = v58;
          swift_unknownObjectRelease();
        }
        else
        {
          v60 = v59;
          v61 = (void *)sub_2443C47F0();

          swift_willThrow();
          if (!PSELog)
          {
LABEL_300:
            __break(1u);
            goto LABEL_301;
          }
          v62 = (id)PSELog;
          sub_2443C4874();
          __swift_instantiateConcreteTypeFromMangledName(&qword_25735CFD0);
          v63 = swift_allocObject();
          *(_OWORD *)(v63 + 16) = xmmword_2443C5490;
          swift_getErrorValue();
          v64 = sub_2443C4910();
          v66 = v65;
          *(_QWORD *)(v63 + 56) = MEMORY[0x24BEE0D00];
          *(_QWORD *)(v63 + 64) = sub_2443C339C();
          *(_QWORD *)(v63 + 32) = v64;
          *(_QWORD *)(v63 + 40) = v66;
          sub_2443C47FC();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          v6 = sourceSurface;
          v7 = 0x25735C000;
        }
      }
      v67 = *(void **)(v283 + v30);
      if (v67
        && (swift_unknownObjectRetain(),
            v68 = (void *)sub_2443C4808(),
            v69 = objc_msgSend(v67, sel_newFunctionWithName_, v68),
            v68,
            swift_unknownObjectRelease(),
            v69))
      {
        *(_QWORD *)&v284 = 0;
        v70 = objc_msgSend(v12, sel_newComputePipelineStateWithFunction_error_, v69, &v284);
        v71 = (id)v284;
        if (!v70)
        {
          v262 = v71;
          v263 = (void *)sub_2443C47F0();

          swift_willThrow();
          if (!PSELog)
          {
LABEL_301:
            __break(1u);
            return;
          }
          v264 = (id)PSELog;
          sub_2443C4874();
          __swift_instantiateConcreteTypeFromMangledName(&qword_25735CFD0);
          v265 = swift_allocObject();
          *(_OWORD *)(v265 + 16) = xmmword_2443C5490;
          swift_getErrorValue();
          v266 = sub_2443C4910();
          v268 = v267;
          *(_QWORD *)(v265 + 56) = MEMORY[0x24BEE0D00];
          *(_QWORD *)(v265 + 64) = sub_2443C339C();
          *(_QWORD *)(v265 + 32) = v266;
          *(_QWORD *)(v265 + 40) = v268;
          sub_2443C47FC();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();

          v6 = sourceSurface;
          v7 = 0x25735C000;
          goto LABEL_32;
        }
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass3) = v70;
      }
      else
      {
LABEL_30:
        swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();
LABEL_32:
      *(_BYTE *)(v283 + *(_QWORD *)(v7 + 3704)) = 0;
    }
  }
  v72 = OBJC_IVAR___SwiftVideoProcessor_previousSurfaceTime;
  v73 = timestamp - *(double *)(v283 + OBJC_IVAR___SwiftVideoProcessor_previousSurfaceTime);
  if (v73 <= 0.00833333333)
    v73 = 0.00833333333;
  if (v73 <= 0.0416666667)
    v74 = v73;
  else
    v74 = 0.0416666667;
  v75 = OBJC_IVAR___SwiftVideoProcessor_framePoolIndex;
  v76 = *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_framePoolIndex);
  v77 = OBJC_IVAR___SwiftVideoProcessor_frameDeltas;
  v78 = *(char **)(v283 + OBJC_IVAR___SwiftVideoProcessor_frameDeltas);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v283 + v77) = v78;
  if ((isUniquelyReferenced_nonNull_native & 1) != 0)
  {
    if ((v76 & 0x8000000000000000) == 0)
      goto LABEL_40;
LABEL_259:
    __break(1u);
    goto LABEL_260;
  }
  v78 = sub_2443C25EC((uint64_t)v78);
  *(_QWORD *)(v283 + v77) = v78;
  if ((v76 & 0x8000000000000000) != 0)
    goto LABEL_259;
LABEL_40:
  if (v76 >= *((_QWORD *)v78 + 2))
  {
LABEL_260:
    __break(1u);
    goto LABEL_261;
  }
  *(double *)&v78[8 * v76 + 32] = v74;
  v80 = *(_QWORD *)(v283 + v77);
  *(_QWORD *)(v283 + v75) = (v76 + 1) % 0xA;
  if (*(_QWORD *)(v80 + 16) < 0xAuLL)
  {
LABEL_261:
    __break(1u);
    goto LABEL_262;
  }
  v82 = *(double *)(v80 + 32);
  v81 = *(double *)(v80 + 40);
  v84 = *(double *)(v80 + 48);
  v83 = *(double *)(v80 + 56);
  v86 = *(double *)(v80 + 64);
  v85 = *(double *)(v80 + 72);
  v88 = *(double *)(v80 + 80);
  v87 = *(double *)(v80 + 88);
  v89 = *(double *)(v80 + 96);
  v90 = *(double *)(v80 + 104);
  v91 = fmax(v82, 0.001);
  if (v91 <= v81)
    v91 = *(double *)(v80 + 40);
  if (v91 <= v84)
    v91 = *(double *)(v80 + 48);
  if (v91 <= v83)
    v91 = *(double *)(v80 + 56);
  if (v91 <= v86)
    v91 = *(double *)(v80 + 64);
  if (v91 <= v85)
    v91 = *(double *)(v80 + 72);
  if (v91 <= v88)
    v91 = *(double *)(v80 + 80);
  if (v91 <= v87)
    v91 = *(double *)(v80 + 88);
  if (v91 <= v89)
    v91 = *(double *)(v80 + 96);
  v92 = fmin(v82, 10.0);
  if (v81 < v92)
    v92 = *(double *)(v80 + 40);
  if (v84 < v92)
    v92 = *(double *)(v80 + 48);
  if (v83 < v92)
    v92 = *(double *)(v80 + 56);
  if (v86 < v92)
    v92 = *(double *)(v80 + 64);
  if (v85 < v92)
    v92 = *(double *)(v80 + 72);
  if (v88 < v92)
    v92 = *(double *)(v80 + 80);
  if (v87 < v92)
    v92 = *(double *)(v80 + 88);
  if (v89 < v92)
    v92 = *(double *)(v80 + 96);
  if (v90 < v92)
    v92 = *(double *)(v80 + 104);
  if (v91 <= v90)
    v91 = *(double *)(v80 + 104);
  v93 = v82 + 0.0 + v81 + v84 + v83 + v86 + v85 + v88 + v87 + v89 + v90;
  v94 = (v82 - v93 / 10.0) * (v82 - v93 / 10.0) / 10.0
      + (v81 - v93 / 10.0) * (v81 - v93 / 10.0) / 10.0
      + (v84 - v93 / 10.0) * (v84 - v93 / 10.0) / 10.0
      + (v83 - v93 / 10.0) * (v83 - v93 / 10.0) / 10.0
      + (v86 - v93 / 10.0) * (v86 - v93 / 10.0) / 10.0
      + (v85 - v93 / 10.0) * (v85 - v93 / 10.0) / 10.0
      + (v88 - v93 / 10.0) * (v88 - v93 / 10.0) / 10.0
      + (v87 - v93 / 10.0) * (v87 - v93 / 10.0) / 10.0
      + (v89 - v93 / 10.0) * (v89 - v93 / 10.0) / 10.0
      + (v90 - v93 / 10.0) * (v90 - v93 / 10.0) / 10.0;
  v95 = *(float *)(v283 + OBJC_IVAR___SwiftVideoProcessor_fps);
  v96 = fabs(sqrt(v94));
  v97 = v94 == -INFINITY;
  v98 = INFINITY;
  if (!v97)
    v98 = v96;
  v99 = v93 - v92 - v91;
  v272 = OBJC_IVAR___SwiftVideoProcessor_fps;
  *(float *)(v283 + OBJC_IVAR___SwiftVideoProcessor_fps) = 8.0 / v99;
  *(Swift::Double *)(v283 + v72) = timestamp;
  v100 = v98 / (v93 / 10.0) > 0.1;
  v101 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  swift_beginAccess();
  *(_BYTE *)(v101 + 7) = v100;
  Width = IOSurfaceGetWidth(v6);
  Height = IOSurfaceGetHeight(v6);
  v103 = sub_2443BC198(v6);
  if (!PSELog)
    goto LABEL_291;
  v104 = v103;
  v105 = (id)PSELog;
  sub_2443C4868();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735CFD0);
  v106 = swift_allocObject();
  *(_OWORD *)(v106 + 16) = xmmword_2443C5490;
  v107 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInt_, v104);
  v281 = (id)sub_2443C2824();
  *(_QWORD *)(v106 + 56) = v281;
  v278 = sub_2443C2860();
  *(_QWORD *)(v106 + 64) = v278;
  *(_QWORD *)(v106 + 32) = v107;
  sub_2443C47FC();

  swift_bridgeObjectRelease();
  v108 = v104 - 1;
  if ((v104 - 1) < 0x1E && ((0x29AB10FBu >> v108) & 1) != 0)
  {
    v114 = 4 * v108;
    v113 = *(_DWORD *)((char *)&unk_2443C56F8 + v114);
    v112 = *(_DWORD *)((char *)&unk_2443C5770 + v114);
  }
  else
  {
    if (!PSELog)
    {
LABEL_292:
      __break(1u);
      goto LABEL_293;
    }
    v109 = (id)PSELog;
    sub_2443C4868();
    v110 = swift_allocObject();
    *(_OWORD *)(v110 + 16) = xmmword_2443C5490;
    v111 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInt_, v104);
    *(_QWORD *)(v110 + 56) = v281;
    *(_QWORD *)(v110 + 64) = v278;
    *(_QWORD *)(v110 + 32) = v111;
    sub_2443C47FC();

    swift_bridgeObjectRelease();
    v112 = 0;
    v113 = 1;
  }
  *(_DWORD *)(v101 + 12) = v113;
  *(_DWORD *)(v101 + 16) = v112;
  ProtectionOptions = IOSurfaceGetProtectionOptions();
  v116 = ProtectionOptions;
  if (ProtectionOptions)
  {
    v117 = OBJC_IVAR___SwiftVideoProcessor_protectionStatus;
    if (ProtectionOptions != *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_protectionStatus))
    {
      if (!PSELog)
      {
LABEL_296:
        __break(1u);
        goto LABEL_297;
      }
      v269 = (id)PSELog;
      sub_2443C485C();
      v119 = swift_allocObject();
      *(_OWORD *)(v119 + 16) = xmmword_2443C5470;
      v120 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedLongLong_, v116);
      *(_QWORD *)(v119 + 56) = v281;
      *(_QWORD *)(v119 + 64) = v278;
      *(_QWORD *)(v119 + 32) = v120;
      v121 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedLongLong_, *(_QWORD *)(v283 + v117));
      *(_QWORD *)(v119 + 96) = v281;
      *(_QWORD *)(v119 + 104) = v278;
      *(_QWORD *)(v119 + 72) = v121;
      sub_2443C47FC();

      swift_bridgeObjectRelease();
      sub_2443BD588(v116);
LABEL_94:
      sub_2443BE250(v116);
      goto LABEL_95;
    }
  }
  if (timestamp - *(double *)(v283 + v72) > 1.0 || vabds_f32(*(float *)(v283 + v272), v95) >= 5.0)
  {
    if (!PSELog)
    {
LABEL_294:
      __break(1u);
      goto LABEL_295;
    }
    v118 = (id)PSELog;
    sub_2443C485C();
    sub_2443C47FC();

    goto LABEL_94;
  }
LABEL_95:
  v122 = *(void **)(v283 + OBJC_IVAR___SwiftVideoProcessor_device);
  if (!v122)
    return;
  v286 = &unk_25736E030;
  v123 = (void *)swift_dynamicCastObjCProtocolConditional();
  swift_unknownObjectRetain();
  if (v123)
  {
    PixelFormat = IOSurfaceGetPixelFormat(sourceSurface);
    if (PixelFormat == 1953903154)
    {
      if ((objc_msgSend(v123, sel_supportsYCBCRFormats12) & 1) != 0)
        goto LABEL_104;
      v126 = 0x100000002;
    }
    else
    {
      if (PixelFormat != 1953903152)
        goto LABEL_104;
      v125 = objc_msgSend(v123, sel_supportsYCBCRFormats12);
      v126 = 0x200000002;
      if ((v125 & 1) != 0)
        goto LABEL_104;
    }
    *(_BYTE *)(v101 + 48) = 1;
    *(_BYTE *)(v101 + 8) = 1;
    *(_QWORD *)(v101 + 40) = v126;
  }
LABEL_104:
  if (*(_BYTE *)(v101 + 48) == 1)
  {
    WidthOfPlane = IOSurfaceGetWidthOfPlane(sourceSurface, 0);
    HeightOfPlane = IOSurfaceGetHeightOfPlane(sourceSurface, 0);
    v129 = objc_msgSend((id)objc_opt_self(), sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 115, WidthOfPlane, HeightOfPlane, 0);
    objc_msgSend(v129, sel_setUsage_, 2);
    objc_msgSend(v129, sel_setProtectionOptions_, v116);
    v130 = objc_msgSend(v122, sel_newTextureWithDescriptor_iosurface_plane_, v129, destinationSurface, 0);
    v131 = v283;
    *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_processedTexture) = v130;
    swift_unknownObjectRelease();
    objc_msgSend(v129, sel_setUsage_, 1);
    objc_msgSend(v129, sel_setPixelFormat_, 20);
    v132 = objc_msgSend(v122, sel_newTextureWithDescriptor_iosurface_plane_, v129, sourceSurface, 0);
    *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_sourceTexture) = v132;
    swift_unknownObjectRelease();
    objc_msgSend(v129, sel_setWidth_, IOSurfaceGetWidthOfPlane(sourceSurface, 1uLL));
    objc_msgSend(v129, sel_setHeight_, IOSurfaceGetHeightOfPlane(sourceSurface, 1uLL));
    objc_msgSend(v129, sel_setPixelFormat_, 60);
    v133 = objc_msgSend(v122, sel_newTextureWithDescriptor_iosurface_plane_, v129, sourceSurface, 1);

    v134 = OBJC_IVAR___SwiftVideoProcessor_sourceCbCrTexture;
  }
  else
  {
    v135 = (void *)objc_opt_self();
    v136 = objc_msgSend(v135, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, sub_2443C28A8(sourceSurface), Width, Height, 0);
    objc_msgSend(v136, sel_setUsage_, 1);
    objc_msgSend(v136, sel_setProtectionOptions_, v116);
    v137 = objc_msgSend(v122, sel_newTextureWithDescriptor_iosurface_plane_, v136, sourceSurface, 0);
    v131 = v283;
    *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_sourceTexture) = v137;
    swift_unknownObjectRelease();
    *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_sourceCbCrTexture) = 0;
    swift_unknownObjectRelease();
    objc_msgSend(v136, sel_setUsage_, 2);
    objc_msgSend(v136, sel_setPixelFormat_, sub_2443C28A8(destinationSurface));
    v133 = objc_msgSend(v122, sel_newTextureWithDescriptor_iosurface_plane_, v136, destinationSurface, 0);

    v134 = OBJC_IVAR___SwiftVideoProcessor_processedTexture;
  }
  *(_QWORD *)(v131 + v134) = v133;
  swift_unknownObjectRelease();
  strcpy((char *)&v284, "displayMaxNits");
  HIBYTE(v284) = -18;
  v138 = -[objc_class __swift_objectForKeyedSubscript:](options.super.isa, sel___swift_objectForKeyedSubscript_, sub_2443C4904());
  swift_unknownObjectRelease();
  if (v138)
  {
    sub_2443C48C8();
    swift_unknownObjectRelease();
  }
  else
  {
    v284 = 0u;
    v285 = 0u;
  }
  sub_2443C2AEC((uint64_t)&v284, (uint64_t)aBlock);
  if (*(_QWORD *)&aBlock[24])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v139 = (id)v289;
      goto LABEL_115;
    }
  }
  else
  {
    sub_2443C2B34((uint64_t)aBlock);
  }
  v139 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, 0);
LABEL_115:
  objc_msgSend(v139, sel_floatValue);
  v141 = v140;

  *(_DWORD *)(v101 + 20) = v141;
  *(_QWORD *)&v284 = 0xD000000000000010;
  *((_QWORD *)&v284 + 1) = 0x80000002443C5AD0;
  v142 = -[objc_class __swift_objectForKeyedSubscript:](options.super.isa, sel___swift_objectForKeyedSubscript_, sub_2443C4904());
  swift_unknownObjectRelease();
  if (v142)
  {
    sub_2443C48C8();
    swift_unknownObjectRelease();
  }
  else
  {
    v284 = 0u;
    v285 = 0u;
  }
  sub_2443C2AEC((uint64_t)&v284, (uint64_t)aBlock);
  if (*(_QWORD *)&aBlock[24])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v143 = (id)v289;
      goto LABEL_123;
    }
  }
  else
  {
    sub_2443C2B34((uint64_t)aBlock);
  }
  v143 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, 0);
LABEL_123:
  objc_msgSend(v143, sel_floatValue);
  v145 = v144;

  *(_DWORD *)(v101 + 24) = v145;
  *(_QWORD *)&v284 = 0xD000000000000010;
  *((_QWORD *)&v284 + 1) = 0x80000002443C5AF0;
  v146 = -[objc_class __swift_objectForKeyedSubscript:](options.super.isa, sel___swift_objectForKeyedSubscript_, sub_2443C4904());
  swift_unknownObjectRelease();
  if (v146)
  {
    sub_2443C48C8();
    swift_unknownObjectRelease();
  }
  else
  {
    v284 = 0u;
    v285 = 0u;
  }
  sub_2443C2AEC((uint64_t)&v284, (uint64_t)aBlock);
  if (*(_QWORD *)&aBlock[24])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v147 = (id)v289;
      goto LABEL_131;
    }
  }
  else
  {
    sub_2443C2B34((uint64_t)aBlock);
  }
  v147 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, 1);
LABEL_131:
  objc_msgSend(v147, sel_floatValue);
  v149 = v148;

  *(_DWORD *)(v101 + 28) = v149;
  if (!PSELog)
  {
LABEL_293:
    __break(1u);
    goto LABEL_294;
  }
  v150 = (id)PSELog;
  sub_2443C485C();
  v151 = swift_allocObject();
  *(_OWORD *)(v151 + 16) = xmmword_2443C5530;
  v152 = *(_DWORD *)(v101 + 20);
  v153 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  LODWORD(v154) = v152;
  v155 = objc_msgSend(v153, sel_initWithFloat_, v154);
  *(_QWORD *)(v151 + 56) = v281;
  *(_QWORD *)(v151 + 64) = v278;
  *(_QWORD *)(v151 + 32) = v155;
  v156 = *(_DWORD *)(v101 + 24);
  v157 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  LODWORD(v158) = v156;
  v159 = objc_msgSend(v157, sel_initWithFloat_, v158);
  *(_QWORD *)(v151 + 96) = v281;
  *(_QWORD *)(v151 + 104) = v278;
  *(_QWORD *)(v151 + 72) = v159;
  v160 = *(_DWORD *)(v101 + 28);
  v161 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  LODWORD(v162) = v160;
  v163 = objc_msgSend(v161, sel_initWithFloat_, v162);
  *(_QWORD *)(v151 + 136) = v281;
  *(_QWORD *)(v151 + 144) = v278;
  *(_QWORD *)(v151 + 112) = v163;
  sub_2443C47FC();

  swift_bridgeObjectRelease();
  *(_QWORD *)&v284 = 0x46746E6572727563;
  *((_QWORD *)&v284 + 1) = 0xEA00000000005350;
  v164 = -[objc_class __swift_objectForKeyedSubscript:](options.super.isa, sel___swift_objectForKeyedSubscript_, sub_2443C4904());
  swift_unknownObjectRelease();
  if (v164)
  {
    sub_2443C48C8();
    swift_unknownObjectRelease();
  }
  else
  {
    v284 = 0u;
    v285 = 0u;
  }
  sub_2443C2AEC((uint64_t)&v284, (uint64_t)aBlock);
  if (*(_QWORD *)&aBlock[24])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v165 = (id)v289;
      goto LABEL_140;
    }
  }
  else
  {
    sub_2443C2B34((uint64_t)aBlock);
  }
  v165 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, 0);
LABEL_140:
  objc_msgSend(v165, sel_floatValue);
  v167 = v166;

  if (v167 <= 0.0)
    v167 = *(float *)(v283 + v272);
  *(float *)(v101 + 32) = v167;
  v168 = *(void **)(v283 + OBJC_IVAR___SwiftVideoProcessor_commandQueue);
  if (!v168)
    goto LABEL_253;
  swift_unknownObjectRetain();
  v169 = dispatch_semaphore_create(0);
  if (objc_msgSend(v168, sel_commandBuffer))
  {
    v170 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (!v170)
    {
LABEL_251:
      swift_unknownObjectRelease();
      goto LABEL_252;
    }
    v171 = v170;
    if ((objc_msgSend(v170, sel_respondsToSelector_, sel_setProtectionOptions_) & 1) != 0)
      objc_msgSend(v171, sel_setProtectionOptions_, v116);
    v172 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v173 = swift_allocObject();
    *(_QWORD *)(v173 + 16) = v172;
    *(_QWORD *)(v173 + 24) = v169;
    *(_QWORD *)&aBlock[32] = sub_2443C2BC4;
    v292 = v173;
    *(_QWORD *)aBlock = MEMORY[0x24BDAC760];
    *(_QWORD *)&aBlock[8] = 1107296256;
    *(_QWORD *)&aBlock[16] = sub_2443C22FC;
    *(_QWORD *)&aBlock[24] = &block_descriptor;
    v174 = _Block_copy(aBlock);
    v280 = v169;
    v169;
    swift_release();
    objc_msgSend(v171, sel_addCompletedHandler_, v174);
    _Block_release(v174);
    swift_unknownObjectRetain();
    v295 = &unk_25736E8A0;
    v175 = (void *)swift_dynamicCastObjCProtocolUnconditional();
    v282 = v171;
    if ((objc_msgSend(v175, sel_respondsToSelector_, sel_protectionOptions) & 1) != 0
      && !objc_msgSend(v175, sel_protectionOptions))
    {
      v176 = 0;
      v177 = 0;
    }
    else
    {
      v176 = 1;
      v177 = 1;
    }
    v178 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
    swift_beginAccess();
    *(_BYTE *)(v178 + 9) = v176;
    v179 = IOSurfaceGetWidth(sourceSurface);
    v180 = IOSurfaceGetHeight(sourceSurface);
    if ((unsigned __int128)(v179 * (__int128)v180) >> 64 == (v179 * v180) >> 63)
    {
      v181 = v180;
      *(float *)v178 = (float)(v179 * v180);
      v182 = objc_msgSend(v282, sel_blitCommandEncoder);
      if (!v182)
        goto LABEL_157;
      v183 = v182;
      v184 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferFrameLumaSum;
      swift_beginAccess();
      if (v177 < *(_QWORD *)(*(_QWORD *)v184 + 16))
      {
        if (!*(_QWORD *)(*(_QWORD *)v184 + 8 * v177 + 32))
        {
LABEL_156:
          swift_unknownObjectRelease();
LABEL_157:
          v185 = objc_msgSend(v282, sel_computeCommandEncoder);
          if (!v185)
          {
LABEL_248:
            swift_unknownObjectRelease();
            objc_msgSend(v282, sel_commit);
            sub_2443C4898();
            v169 = v280;
            goto LABEL_251;
          }
          v186 = v185;
          v187 = (void *)sub_2443C4808();
          objc_msgSend(v186, sel_setLabel_, v187);

          v188 = *(void **)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass0);
          if (!v188)
            goto LABEL_175;
          swift_unknownObjectRetain();
          objc_msgSend(v186, sel_setComputePipelineState_, v188);
          objc_msgSend(v186, sel_setTexture_atIndex_, *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_sourceTexture), 0);
          objc_msgSend(v186, sel_setTexture_atIndex_, *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_sourceCbCrTexture), 1);
          objc_msgSend(v186, sel_setTexture_atIndex_, *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_processedTexture), 2);
          swift_beginAccess();
          objc_msgSend(v186, sel_setBytes_length_atIndex_, v178, 56, 0);
          swift_endAccess();
          v189 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferFrameLumaSum;
          swift_beginAccess();
          if (v177 < *(_QWORD *)(*(_QWORD *)v189 + 16))
          {
            v190 = *(_QWORD *)(*(_QWORD *)v189 + 8 * v177 + 32);
            if (v190)
              objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v190, 0, 1);
            v191 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferData;
            swift_beginAccess();
            if (v177 < *(_QWORD *)(*(_QWORD *)v191 + 16))
            {
              v192 = *(_QWORD *)(*(_QWORD *)v191 + 8 * v177 + 32);
              if (v192)
                objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v192, 0, 2);
              v193 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel;
              swift_beginAccess();
              if (v177 < *(_QWORD *)(*(_QWORD *)v193 + 16))
              {
                v194 = *(_QWORD *)(*(_QWORD *)v193 + 8 * v177 + 32);
                if (v194)
                  objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v194, 0, 3);
                v195 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
                swift_beginAccess();
                if (v177 < *(_QWORD *)(*(_QWORD *)v195 + 16))
                {
                  v196 = *(_QWORD *)(*(_QWORD *)v195 + 8 * v177 + 32);
                  if (v196)
                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v196, 0, 4);
                  v197 = (uint64_t)objc_msgSend(v188, sel_threadExecutionWidth);
                  v198 = (uint64_t)objc_msgSend(v188, sel_maxTotalThreadsPerThreadgroup);
                  if (v197)
                  {
                    if (v198 == 0x8000000000000000 && v197 == -1)
                      goto LABEL_272;
                    MTLSizeMake(v197, v198 / v197, aBlock);
                    v273 = *(_OWORD *)aBlock;
                    v199 = *(_QWORD *)&aBlock[16];
                    MTLSizeMake(v179, v181, aBlock);
                    v289 = v273;
                    v290 = v199;
                    objc_msgSend(v186, sel_dispatchThreads_threadsPerThreadgroup_, aBlock, &v289);
                    swift_unknownObjectRelease();
LABEL_175:
                    if ((*(_BYTE *)(v178 + 7) & 1) != 0)
                    {
LABEL_239:
                      objc_msgSend(v186, sel_endEncoding);
                      v250 = *(_BYTE *)(v178 + 4);
                      v251 = *(_BYTE *)(v178 + 5);
                      v252 = *(_BYTE *)(v178 + 6);
                      v253 = *(_BYTE *)(v178 + 7);
                      v254 = *(_BYTE *)(v178 + 8);
                      v255 = *(_BYTE *)(v178 + 9);
                      v256 = *(_QWORD *)(v178 + 40);
                      v257 = *(_BYTE *)(v178 + 48);
                      v258 = *(_DWORD *)(v178 + 52);
                      *(_DWORD *)aBlock = *(_DWORD *)v178;
                      aBlock[4] = v250;
                      aBlock[5] = v251;
                      aBlock[6] = v252;
                      aBlock[7] = v253;
                      aBlock[8] = v254;
                      aBlock[9] = v255;
                      *(_QWORD *)&aBlock[12] = *(_QWORD *)(v178 + 12);
                      *(_OWORD *)&aBlock[20] = *(_OWORD *)(v178 + 20);
                      v292 = v256;
                      v293 = v257;
                      v294 = v258;
                      if (!IncludesDebugInfo((uint64_t)aBlock)
                        || (v255 & 1) != 0
                        || (v259 = objc_msgSend(v282, sel_blitCommandEncoder)) == 0)
                      {
LABEL_247:
                        swift_unknownObjectRelease();
                        goto LABEL_248;
                      }
                      v260 = v259;
                      v261 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferData;
                      swift_beginAccess();
                      if (*(_QWORD *)(*(_QWORD *)v261 + 16))
                      {
                        if (*(_QWORD *)(*(_QWORD *)v261 + 32))
                        {
                          if (*(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_bufferDataDebug))
                            objc_msgSend(v260, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_);
                        }
                        objc_msgSend(v260, sel_endEncoding);
                        swift_unknownObjectRelease();
                        goto LABEL_247;
                      }
                      goto LABEL_278;
                    }
                    v200 = *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass1);
                    if (!v200)
                      goto LABEL_202;
                    swift_unknownObjectRetain();
                    objc_msgSend(v186, sel_setComputePipelineState_, v200);
                    swift_beginAccess();
                    objc_msgSend(v186, sel_setBytes_length_atIndex_, v178, 56, 0);
                    swift_endAccess();
                    v201 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferFrameLumaSum;
                    swift_beginAccess();
                    if (v177 < *(_QWORD *)(*(_QWORD *)v201 + 16))
                    {
                      v202 = *(_QWORD *)(*(_QWORD *)v201 + 8 * v177 + 32);
                      if (v202)
                        objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v202, 0, 1);
                      v203 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferData;
                      swift_beginAccess();
                      if (v177 < *(_QWORD *)(*(_QWORD *)v203 + 16))
                      {
                        v204 = *(_QWORD *)(*(_QWORD *)v203 + 8 * v177 + 32);
                        if (v204)
                          objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v204, 0, 2);
                        v205 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel;
                        swift_beginAccess();
                        if (v177 < *(_QWORD *)(*(_QWORD *)v205 + 16))
                        {
                          v206 = *(_QWORD *)(*(_QWORD *)v205 + 8 * v177 + 32);
                          if (v206)
                            objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v206, 0, 3);
                          v207 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
                          swift_beginAccess();
                          if (v177 < *(_QWORD *)(*(_QWORD *)v207 + 16))
                          {
                            v208 = *(_QWORD *)(*(_QWORD *)v207 + 8 * v177 + 32);
                            if (v208)
                              objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v208, 0, 4);
                            v209 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferContrastKernel;
                            swift_beginAccess();
                            if (v177 < *(_QWORD *)(*(_QWORD *)v209 + 16))
                            {
                              v210 = *(_QWORD *)(*(_QWORD *)v209 + 8 * v177 + 32);
                              if (v210)
                                objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v210, 0, 5);
                              v211 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferContrast;
                              swift_beginAccess();
                              if (v177 < *(_QWORD *)(*(_QWORD *)v211 + 16))
                              {
                                v212 = *(_QWORD *)(*(_QWORD *)v211 + 8 * v177 + 32);
                                if (v212)
                                  objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v212, 0, 6);
                                v213 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferResponses;
                                swift_beginAccess();
                                if (v177 >= *(_QWORD *)(*(_QWORD *)v213 + 16))
                                  goto LABEL_279;
                                v214 = *(_QWORD *)(*(_QWORD *)v213 + 8 * v177 + 32);
                                if (v214)
                                  objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v214, 0, 7);
                                v215 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferResponsesNorm;
                                swift_beginAccess();
                                if (v177 >= *(_QWORD *)(*(_QWORD *)v215 + 16))
                                  goto LABEL_281;
                                v216 = *(_QWORD *)(*(_QWORD *)v215 + 8 * v177 + 32);
                                if (v216)
                                  objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v216, 0, 8);
                                MTLSizeMake(160, 1, aBlock);
                                *(_OWORD *)buffera = *(_OWORD *)aBlock;
                                v217 = *(_QWORD *)&aBlock[16];
                                MTLSizeMake(32, 1, aBlock);
                                v218 = *(_QWORD *)&aBlock[16];
                                v219 = *(_OWORD *)aBlock;
                                *(_OWORD *)aBlock = *(_OWORD *)buffera;
                                *(_QWORD *)&aBlock[16] = v217;
                                v289 = v219;
                                v290 = v218;
                                objc_msgSend(v186, sel_dispatchThreads_threadsPerThreadgroup_, aBlock, &v289);
                                swift_unknownObjectRelease();
LABEL_202:
                                v220 = *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass2);
                                if (!v220)
                                {
LABEL_228:
                                  v240 = *(_QWORD *)(v283 + OBJC_IVAR___SwiftVideoProcessor_cptPSO_RiskComputePass3);
                                  if (v240)
                                  {
                                    swift_unknownObjectRetain();
                                    objc_msgSend(v186, sel_setComputePipelineState_, v240);
                                    swift_beginAccess();
                                    objc_msgSend(v186, sel_setBytes_length_atIndex_, v178, 56, 0);
                                    swift_endAccess();
                                    v241 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
                                    swift_beginAccess();
                                    if (v177 >= *(_QWORD *)(*(_QWORD *)v241 + 16))
                                    {
LABEL_286:
                                      __break(1u);
LABEL_287:
                                      __break(1u);
LABEL_288:
                                      __break(1u);
LABEL_289:
                                      __break(1u);
LABEL_290:
                                      __break(1u);
LABEL_291:
                                      __break(1u);
                                      goto LABEL_292;
                                    }
                                    v242 = *(_QWORD *)(*(_QWORD *)v241 + 8 * v177 + 32);
                                    if (v242)
                                      objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v242, 0, 4);
                                    v243 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferData;
                                    swift_beginAccess();
                                    if (v177 >= *(_QWORD *)(*(_QWORD *)v243 + 16))
                                      goto LABEL_288;
                                    v244 = *(_QWORD *)(*(_QWORD *)v243 + 8 * v177 + 32);
                                    if (v244)
                                      objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v244, 0, 2);
                                    v245 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferResults;
                                    swift_beginAccess();
                                    if (v177 >= *(_QWORD *)(*(_QWORD *)v245 + 16))
                                      goto LABEL_290;
                                    v246 = *(_QWORD *)(*(_QWORD *)v245 + 8 * v177 + 32);
                                    if (v246)
                                      objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v246, 0, 11);
                                    MTLSizeMake(1, 1, aBlock);
                                    *(_OWORD *)bufferc = *(_OWORD *)aBlock;
                                    v247 = *(_QWORD *)&aBlock[16];
                                    MTLSizeMake(1, 1, aBlock);
                                    v248 = *(_QWORD *)&aBlock[16];
                                    v249 = *(_OWORD *)aBlock;
                                    *(_OWORD *)aBlock = *(_OWORD *)bufferc;
                                    *(_QWORD *)&aBlock[16] = v247;
                                    v287 = v249;
                                    v288 = v248;
                                    objc_msgSend(v186, sel_dispatchThreads_threadsPerThreadgroup_, aBlock, &v287);
                                    swift_unknownObjectRelease();
                                  }
                                  goto LABEL_239;
                                }
                                swift_unknownObjectRetain();
                                objc_msgSend(v186, sel_setComputePipelineState_, v220);
                                swift_beginAccess();
                                objc_msgSend(v186, sel_setBytes_length_atIndex_, v178, 56, 0);
                                swift_endAccess();
                                v221 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferData;
                                swift_beginAccess();
                                if (v177 < *(_QWORD *)(*(_QWORD *)v221 + 16))
                                {
                                  v222 = *(_QWORD *)(*(_QWORD *)v221 + 8 * v177 + 32);
                                  if (v222)
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v222, 0, 2);
                                  v223 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferGammaKernel;
                                  swift_beginAccess();
                                  if (v177 >= *(_QWORD *)(*(_QWORD *)v223 + 16))
                                    goto LABEL_280;
                                  v224 = *(_QWORD *)(*(_QWORD *)v223 + 8 * v177 + 32);
                                  if (v224)
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v224, 0, 3);
                                  v225 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferCurState;
                                  swift_beginAccess();
                                  if (v177 >= *(_QWORD *)(*(_QWORD *)v225 + 16))
                                    goto LABEL_282;
                                  v226 = *(_QWORD *)(*(_QWORD *)v225 + 8 * v177 + 32);
                                  if (v226)
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v226, 0, 4);
                                  v227 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferResponses;
                                  swift_beginAccess();
                                  if (v177 >= *(_QWORD *)(*(_QWORD *)v227 + 16))
                                    goto LABEL_283;
                                  v228 = *(_QWORD *)(*(_QWORD *)v227 + 8 * v177 + 32);
                                  if (v228)
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v228, 0, 7);
                                  v229 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferResponsesNorm;
                                  swift_beginAccess();
                                  if (v177 >= *(_QWORD *)(*(_QWORD *)v229 + 16))
                                    goto LABEL_284;
                                  v230 = *(_QWORD *)(*(_QWORD *)v229 + 8 * v177 + 32);
                                  if (v230)
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v230, 0, 8);
                                  v231 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy;
                                  swift_beginAccess();
                                  if (v177 >= *(_QWORD *)(*(_QWORD *)v231 + 16))
                                    goto LABEL_285;
                                  v232 = *(_QWORD *)(*(_QWORD *)v231 + 8 * v177 + 32);
                                  if (v232)
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v232, 0, 9);
                                  v233 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferEnergy2;
                                  swift_beginAccess();
                                  if (v177 >= *(_QWORD *)(*(_QWORD *)v233 + 16))
                                    goto LABEL_287;
                                  v234 = *(_QWORD *)(*(_QWORD *)v233 + 8 * v177 + 32);
                                  if (v234)
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v234, 0, 10);
                                  v235 = v283 + OBJC_IVAR___SwiftVideoProcessor_bufferResults;
                                  swift_beginAccess();
                                  if (v177 >= *(_QWORD *)(*(_QWORD *)v235 + 16))
                                    goto LABEL_289;
                                  v236 = *(_QWORD *)(*(_QWORD *)v235 + 8 * v177 + 32);
                                  if (v236)
                                    objc_msgSend(v186, sel_setBuffer_offset_atIndex_, v236, 0, 11);
                                  MTLSizeMake(1280, 1, aBlock);
                                  *(_OWORD *)bufferb = *(_OWORD *)aBlock;
                                  v237 = *(_QWORD *)&aBlock[16];
                                  MTLSizeMake(256, 1, aBlock);
                                  v238 = *(_QWORD *)&aBlock[16];
                                  v239 = *(_OWORD *)aBlock;
                                  *(_OWORD *)aBlock = *(_OWORD *)bufferb;
                                  *(_QWORD *)&aBlock[16] = v237;
                                  v289 = v239;
                                  v290 = v238;
                                  objc_msgSend(v186, sel_dispatchThreads_threadsPerThreadgroup_, aBlock, &v289);
                                  swift_unknownObjectRelease();
                                  goto LABEL_228;
                                }
LABEL_277:
                                __break(1u);
LABEL_278:
                                __break(1u);
LABEL_279:
                                __break(1u);
LABEL_280:
                                __break(1u);
LABEL_281:
                                __break(1u);
LABEL_282:
                                __break(1u);
LABEL_283:
                                __break(1u);
LABEL_284:
                                __break(1u);
LABEL_285:
                                __break(1u);
                                goto LABEL_286;
                              }
LABEL_276:
                              __break(1u);
                              goto LABEL_277;
                            }
LABEL_275:
                            __break(1u);
                            goto LABEL_276;
                          }
LABEL_274:
                          __break(1u);
                          goto LABEL_275;
                        }
LABEL_273:
                        __break(1u);
                        goto LABEL_274;
                      }
                      goto LABEL_271;
                    }
LABEL_270:
                    __break(1u);
LABEL_271:
                    __break(1u);
LABEL_272:
                    __break(1u);
                    goto LABEL_273;
                  }
LABEL_269:
                  __break(1u);
                  goto LABEL_270;
                }
LABEL_268:
                __break(1u);
                goto LABEL_269;
              }
LABEL_267:
              __break(1u);
              goto LABEL_268;
            }
LABEL_266:
            __break(1u);
            goto LABEL_267;
          }
LABEL_265:
          __break(1u);
          goto LABEL_266;
        }
        swift_getObjectType();
        if (((unint64_t)objc_msgSend((id)swift_unknownObjectRetain(), sel_length) & 0x8000000000000000) == 0)
        {
          sub_2443C488C();
          objc_msgSend(v183, sel_endEncoding);
          swift_unknownObjectRelease();
          goto LABEL_156;
        }
LABEL_264:
        __break(1u);
        goto LABEL_265;
      }
LABEL_263:
      __break(1u);
      goto LABEL_264;
    }
LABEL_262:
    __break(1u);
    goto LABEL_263;
  }
LABEL_252:
  swift_unknownObjectRelease();

LABEL_253:
  swift_unknownObjectRelease();
}

uint64_t sub_2443C22FC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id VideoProcessor.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_2443C25A8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_2443C25BC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2443C25CC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_2443C25D8()
{
  JUMPOUT(0x24950D5A8);
}

char *sub_2443C25EC(uint64_t a1)
{
  return sub_2443C2600(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_2443C2600(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735D318);
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

uint64_t sub_2443C26F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(double *, double *, double *);
  BOOL v11;
  uint64_t v12;
  uint64_t result;

  v5 = (uint64_t *)(v2 + OBJC_IVAR___SwiftVideoProcessor_validationCallback);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  sub_2443BC6EC(a1);
  sub_2443C27EC(v6);
  v7 = *v5;
  v8 = v5[1];
  if (*v5)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = sub_2443C2820;
  }
  else
  {
    v10 = 0;
  }
  v11 = v7 != 0;
  sub_2443BC6EC(v7);
  sub_2443C27EC((uint64_t)v10);
  v12 = v2 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  result = swift_beginAccess();
  *(_BYTE *)(v12 + 6) = v11;
  return result;
}

uint64_t sub_2443C27EC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2443C27FC()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_2443C2824()
{
  unint64_t result;

  result = qword_25735CFD8;
  if (!qword_25735CFD8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25735CFD8);
  }
  return result;
}

unint64_t sub_2443C2860()
{
  unint64_t result;
  unint64_t v1;

  result = qword_25735CFE0;
  if (!qword_25735CFE0)
  {
    v1 = sub_2443C2824();
    result = MEMORY[0x24950DB24](MEMORY[0x24BEE5BE8], v1);
    atomic_store(result, (unint64_t *)&qword_25735CFE0);
  }
  return result;
}

uint64_t sub_2443C28A8(__IOSurface *a1)
{
  signed int PixelFormat;
  uint64_t result;
  int v3;

  PixelFormat = IOSurfaceGetPixelFormat(a1);
  result = 508;
  if (PixelFormat <= 1380401728)
  {
    if (PixelFormat <= 645166643)
    {
      if (PixelFormat > 645166639)
      {
        if (PixelFormat == 645166640)
          return 580;
        if (PixelFormat == 645166642)
          return 581;
        return 70;
      }
      if (PixelFormat != 641230384 && PixelFormat != 641234480)
        return 70;
    }
    else
    {
      if (PixelFormat <= 875704421)
      {
        if (PixelFormat == 645166644)
          return 582;
        v3 = 645428784;
LABEL_25:
        if (PixelFormat == v3)
          return result;
        return 70;
      }
      if (PixelFormat != 875704422 && PixelFormat != 875704438)
      {
        if (PixelFormat == 1111970369)
          return 80;
        return 70;
      }
    }
    return 500;
  }
  if (PixelFormat > 1953903151)
  {
    if (PixelFormat <= 1999843441)
    {
      if (PixelFormat == 1953903152)
        return 570;
      if (PixelFormat == 1953903154)
        return 571;
      return 70;
    }
    if (PixelFormat == 1999843442)
      return 554;
    if (PixelFormat == 2016686640)
      return 505;
    v3 = 2019963440;
    goto LABEL_25;
  }
  if (PixelFormat <= 1815162993)
  {
    if (PixelFormat == 1380411457)
      return 115;
    return 70;
  }
  if (PixelFormat == 1815162994)
    return 94;
  if (PixelFormat != 1882468912)
  {
    v3 = 1885745712;
    goto LABEL_25;
  }
  return result;
}

uint64_t sub_2443C2AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735D048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2443C2B34(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735D048);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2443C2B74()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2443C2B98()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_2443C2BC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  char v12;
  int v13;
  void *v14;
  float *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(uint64_t, double, double, double);
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  int v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  char v37;
  int v38;

  v1 = *(_QWORD *)(v0 + 16) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x24950DB90](v1);
  if (v2)
  {
    v3 = (char *)v2;
    v4 = v2 + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
    swift_beginAccess();
    v5 = *(_BYTE *)(v4 + 4);
    v6 = *(_BYTE *)(v4 + 5);
    v7 = *(_BYTE *)(v4 + 6);
    v8 = *(_BYTE *)(v4 + 7);
    v9 = *(_BYTE *)(v4 + 8);
    v10 = *(_BYTE *)(v4 + 9);
    v11 = *(_QWORD *)(v4 + 40);
    v12 = *(_BYTE *)(v4 + 48);
    v13 = *(_DWORD *)(v4 + 52);
    v27 = *(_DWORD *)v4;
    v28 = v5;
    v29 = v6;
    v30 = v7;
    v31 = v8;
    v32 = v9;
    v33 = v10;
    v34 = *(_QWORD *)(v4 + 12);
    v35 = *(_OWORD *)(v4 + 20);
    v36 = v11;
    v37 = v12;
    v38 = v13;
    if (!IncludesDebugInfo((uint64_t)&v27))
      goto LABEL_10;
    if ((v10 & 1) != 0)
      goto LABEL_10;
    v14 = *(void **)&v3[OBJC_IVAR___SwiftVideoProcessor_bufferDataDebug];
    if (!v14)
      goto LABEL_10;
    v15 = (float *)objc_msgSend((id)swift_unknownObjectRetain(), sel_contents);
    v16 = v14;
    if (*(_BYTE *)(v4 + 5) != 1)
    {
LABEL_8:
      v21 = &v3[OBJC_IVAR___SwiftVideoProcessor_validationCallback];
      swift_beginAccess();
      v22 = *(void (**)(uint64_t, double, double, double))v21;
      if (*(_QWORD *)v21)
      {
        v23 = *v15;
        v24 = v15[7];
        v25 = v15[8] * 100.0;
        v26 = swift_retain();
        v22(v26, v23, v24, v25);
        sub_2443C27EC((uint64_t)v22);
      }
LABEL_10:
      sub_2443C48A4();

      return;
    }
    if (PSELog)
    {
      v17 = (id)PSELog;
      sub_2443C4880();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735CFD0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_2443C5540;
      v19 = MEMORY[0x24BEE14E8];
      v20 = MEMORY[0x24BEE1568];
      *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE14E8];
      *(_QWORD *)(v18 + 64) = v20;
      *(float *)(v18 + 32) = *v15;
      *(_QWORD *)(v18 + 96) = v19;
      *(_QWORD *)(v18 + 104) = v20;
      *(float *)(v18 + 72) = v15[1];
      *(_QWORD *)(v18 + 136) = v19;
      *(_QWORD *)(v18 + 144) = v20;
      *(float *)(v18 + 112) = v15[2];
      *(_QWORD *)(v18 + 176) = v19;
      *(_QWORD *)(v18 + 184) = v20;
      *(float *)(v18 + 152) = v15[3];
      *(_QWORD *)(v18 + 216) = v19;
      *(_QWORD *)(v18 + 224) = v20;
      *(float *)(v18 + 192) = v15[4];
      *(_QWORD *)(v18 + 256) = v19;
      *(_QWORD *)(v18 + 264) = v20;
      *(float *)(v18 + 232) = v15[5];
      *(_QWORD *)(v18 + 296) = v19;
      *(_QWORD *)(v18 + 304) = v20;
      *(float *)(v18 + 272) = v15[6];
      *(_QWORD *)(v18 + 336) = v19;
      *(_QWORD *)(v18 + 344) = v20;
      *(float *)(v18 + 312) = v15[7];
      *(_QWORD *)(v18 + 376) = v19;
      *(_QWORD *)(v18 + 384) = v20;
      *(float *)(v18 + 352) = v15[13];
      *(_QWORD *)(v18 + 416) = v19;
      *(_QWORD *)(v18 + 424) = v20;
      *(float *)(v18 + 392) = v15[8];
      *(_QWORD *)(v18 + 456) = v19;
      *(_QWORD *)(v18 + 464) = v20;
      *(float *)(v18 + 432) = v15[11];
      *(_QWORD *)(v18 + 496) = v19;
      *(_QWORD *)(v18 + 504) = v20;
      *(float *)(v18 + 472) = v15[12];
      *(_QWORD *)(v18 + 536) = v19;
      *(_QWORD *)(v18 + 544) = v20;
      *(float *)(v18 + 512) = v15[9];
      *(_QWORD *)(v18 + 576) = v19;
      *(_QWORD *)(v18 + 584) = v20;
      *(float *)(v18 + 552) = v15[10];
      sub_2443C47FC();
      swift_bridgeObjectRelease();

      goto LABEL_8;
    }
    __break(1u);
  }
  else
  {
    sub_2443C48A4();
  }
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t type metadata accessor for VideoProcessor()
{
  return objc_opt_self();
}

uint64_t destroy for VideoProcessor.KernelData()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s26PhotosensitivityProcessing14VideoProcessorC10KernelDataVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for VideoProcessor.KernelData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_OWORD *assignWithTake for VideoProcessor.KernelData(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoProcessor.KernelData(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for VideoProcessor.KernelData(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for VideoProcessor.KernelData()
{
  return &type metadata for VideoProcessor.KernelData;
}

_QWORD *initializeBufferWithCopyOfBuffer for VideoProcessor.ArrayData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for VideoProcessor.ArrayData()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for VideoProcessor.ArrayData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for VideoProcessor.ArrayData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoProcessor.ArrayData(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for VideoProcessor.ArrayData(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for VideoProcessor.ArrayData()
{
  return &type metadata for VideoProcessor.ArrayData;
}

uint64_t sub_2443C31D0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_2443C3220(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 4);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_2443C3274(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = a2 + 1;
  }
  return result;
}

void type metadata accessor for ConstBuf(uint64_t a1)
{
  sub_2443C32EC(a1, &qword_25735D2F0);
}

void type metadata accessor for IOSurfaceProtectionOptions(uint64_t a1)
{
  sub_2443C32EC(a1, &qword_25735D2F8);
}

void sub_2443C32EC(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_2443C3330()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2443C3354()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_2443C3360(double a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t (*v4)(double *, double *, double *);
  double v6;
  double v7;
  double v8;

  v4 = *(uint64_t (**)(double *, double *, double *))(v3 + 16);
  v7 = a2;
  v8 = a1;
  v6 = a3;
  return v4(&v8, &v7, &v6);
}

unint64_t sub_2443C339C()
{
  unint64_t result;

  result = qword_25735D300;
  if (!qword_25735D300)
  {
    result = MEMORY[0x24950DB24](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25735D300);
  }
  return result;
}

BOOL IncludesDebugInfo(uint64_t a1)
{
  return *(_BYTE *)(a1 + 6) || *(_BYTE *)(a1 + 5) != 0;
}

uint64_t MTLSizeMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  a3[2] = 1;
  return result;
}

uint64_t sub_2443C3414(double *a1, double *a2, double *a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(double, double, double))(v3 + 16))(*a1, *a2, *a3);
}

uint64_t sub_2443C3458()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2443C348C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 48) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2443C34D0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2443C350C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2443C57F0;
  *(_OWORD *)(v0 + 32) = xmmword_2443C5800;
  v1 = sub_2443C4850();
  *(_QWORD *)(v1 + 16) = 10;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735D4B0);
  v2 = (_QWORD *)sub_2443C4850();
  v2[2] = 7;
  v2[4] = v1;
  v2[5] = v1;
  v2[6] = v1;
  v2[7] = v1;
  v2[8] = v1;
  v2[9] = v1;
  v2[10] = v1;
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735D4B8);
  v3 = (_QWORD *)sub_2443C4850();
  v3[2] = 5;
  v3[4] = v2;
  v3[5] = v2;
  v3[6] = v2;
  v3[7] = v2;
  v3[8] = v2;
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735D4C0);
  v4 = (_QWORD *)sub_2443C4850();
  v4[2] = 3;
  v4[4] = v3;
  v4[5] = v3;
  v4[6] = v3;
  *(_QWORD *)(v0 + 48) = v4;
  swift_bridgeObjectRetain_n();
  sub_2443C363C();
  return v0;
}

void sub_2443C363C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _BYTE *v33;
  double v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t *, _QWORD);
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD *v49;
  char v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  char v54;
  unint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t *);
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  double v74;
  uint64_t v75;
  unint64_t v76;

  v1 = v0;
  v2 = sub_2443C47E4();
  v3 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for VideoProcessor();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v8 = (void *)sub_2443C4808();
  v9 = (void *)sub_2443C4808();
  v10 = objc_msgSend(v7, sel_pathForResource_ofType_, v8, v9);

  if (!v10)
    return;
  v11 = sub_2443C4820();
  v13 = v12;

  v14 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
  v15 = sub_2443C3D78(v11, v13, 1);
  if (!v15)
    return;
  v60 = 0;
  v16 = v15;
  v17 = (void *)sub_2443C4808();
  v18 = objc_msgSend(v16, sel_componentsSeparatedByString_, v17);

  v19 = sub_2443C4838();
  v65 = *(_QWORD *)(v19 + 16);
  if (!v65)
    goto LABEL_52;
  v59 = v16;
  v20 = 0;
  v21 = 0;
  v64 = *(uint64_t (**)(uint64_t *))(*(_QWORD *)v1 + 136);
  v63 = v19 + 32;
  v61 = v1;
  v62 = v19;
  do
  {
    v66 = v20;
    v67 = 0;
    while (1)
    {
      v22 = 0;
      while (1)
      {
        if (v21 >= *(_QWORD *)(v19 + 16))
        {
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
          __break(1u);
          return;
        }
        v70 = v21;
        v23 = *(_QWORD *)(v63 + 16 * v21 + 8);
        v71 = *(_QWORD *)(v63 + 16 * v21);
        v72 = v23;
        v75 = 44;
        v76 = 0xE100000000000000;
        sub_2443C4010();
        v24 = sub_2443C48B0();
        v25 = *(_QWORD *)(v24 + 16);
        if (v25)
        {
          v69 = v22;
          v75 = MEMORY[0x24BEE4AF8];
          sub_2443C4054(0, v25, 0);
          v68 = v24;
          v26 = (uint64_t *)(v24 + 40);
          while (1)
          {
            v27 = *v26;
            v71 = *(v26 - 1);
            v72 = v27;
            swift_bridgeObjectRetain();
            sub_2443C47D8();
            v28 = sub_2443C48BC();
            v30 = v29;
            v31 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
            v74 = 0.0;
            MEMORY[0x24BDAC7A8](v31);
            *(&v59 - 2) = &v74;
            if ((v30 & 0x1000000000000000) != 0)
            {
LABEL_30:
              v38 = v60;
              sub_2443C48D4();
              v60 = v38;
              goto LABEL_21;
            }
            if ((v30 & 0x2000000000000000) != 0)
            {
              v71 = v28;
              v72 = v30 & 0xFFFFFFFFFFFFFFLL;
              if (v28 <= 0x20u && ((0x100003E01uLL >> v28) & 1) != 0)
                goto LABEL_20;
            }
            else
            {
              if ((v28 & 0x1000000000000000) == 0)
                goto LABEL_30;
              v32 = *(unsigned __int8 *)(v30 + 32);
              if (v32 < 0x21 && ((0x100003E01uLL >> v32) & 1) != 0)
              {
LABEL_20:
                v73 = 0;
                goto LABEL_21;
              }
            }
            v33 = (_BYTE *)_swift_stdlib_strtod_clocale();
            if (!v33)
              goto LABEL_20;
            v73 = *v33 == 0;
LABEL_21:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v73)
              v34 = v74;
            else
              v34 = 0.0;
            v35 = v75;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_2443C4054(0, *(_QWORD *)(v35 + 16) + 1, 1);
              v35 = v75;
            }
            v37 = *(_QWORD *)(v35 + 16);
            v36 = *(_QWORD *)(v35 + 24);
            if (v37 >= v36 >> 1)
            {
              sub_2443C4054((char *)(v36 > 1), v37 + 1, 1);
              v35 = v75;
            }
            v26 += 2;
            *(_QWORD *)(v35 + 16) = v37 + 1;
            *(double *)(v35 + 8 * v37 + 32) = v34;
            if (!--v25)
            {
              swift_bridgeObjectRelease();
              v1 = v61;
              v22 = v69;
              goto LABEL_32;
            }
          }
        }
        swift_bridgeObjectRelease();
        v35 = MEMORY[0x24BEE4AF8];
LABEL_32:
        v39 = (void (*)(uint64_t *, _QWORD))v64(&v71);
        v41 = v40;
        v42 = (_QWORD *)*v40;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *v41 = v42;
        v44 = v66;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v56 = v42;
          v57 = v66;
          v58 = sub_2443C3EB8(v56);
          v44 = v57;
          v42 = v58;
          *v41 = v58;
        }
        if (v44 >= v42[2])
          goto LABEL_55;
        v45 = v1;
        v46 = v22;
        v47 = v42 + 4;
        v48 = v44;
        v49 = (_QWORD *)v42[v44 + 4];
        v50 = swift_isUniquelyReferenced_nonNull_native();
        v47[v48] = v49;
        if ((v50 & 1) == 0)
        {
          v49 = sub_2443C3E84(v49);
          v47[v66] = v49;
        }
        if (v67 >= v49[2])
          goto LABEL_56;
        v51 = v49 + 4;
        v52 = v67;
        v53 = (_QWORD *)v49[v67 + 4];
        v54 = swift_isUniquelyReferenced_nonNull_native();
        v51[v52] = v53;
        if ((v54 & 1) == 0)
        {
          v53 = sub_2443C3E50(v53);
          v51[v67] = v53;
        }
        v55 = v46;
        if (v46 >= v53[2])
          goto LABEL_57;
        v1 = v45;
        v21 = v70 + 1;
        v53[v55 + 4] = v35;
        swift_bridgeObjectRelease();
        v39(&v71, 0);
        if (v55 == 6)
          break;
        v22 = v55 + 1;
        v19 = v62;
        if (v21 == v65)
          goto LABEL_51;
      }
      v19 = v62;
      if (v67 == 4)
        break;
      ++v67;
      if (v21 == v65)
        goto LABEL_51;
    }
    if (v66 > 1)
      v20 = 0;
    else
      v20 = v66 + 1;
  }
  while (v21 != v65);
LABEL_51:
  v16 = v59;
LABEL_52:

  swift_bridgeObjectRelease();
}

uint64_t sub_2443C3D54()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

id sub_2443C3D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_2443C4808();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithContentsOfFile_encoding_error_, v5, a3, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_2443C47F0();

    swift_willThrow();
  }
  return v6;
}

_QWORD *sub_2443C3E50(_QWORD *a1)
{
  return sub_2443C3EEC(0, a1[2], 0, a1, &qword_25735D4D0, &qword_25735D4B0);
}

_QWORD *sub_2443C3E84(_QWORD *a1)
{
  return sub_2443C3EEC(0, a1[2], 0, a1, &qword_25735D4D8, &qword_25735D4B8);
}

_QWORD *sub_2443C3EB8(_QWORD *a1)
{
  return sub_2443C3EEC(0, a1[2], 0, a1, (uint64_t *)&unk_25735D4E0, &qword_25735D4C0);
}

_QWORD *sub_2443C3EEC(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;

  v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
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
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    v15 = v14 - 32;
    if (v14 < 32)
      v15 = v14 - 25;
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v8 & 1) != 0)
  {
    if (v13 != a4 || v13 + 4 >= &a4[v11 + 4])
      memmove(v13 + 4, a4 + 4, 8 * v11);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_2443C4010()
{
  unint64_t result;

  result = qword_25735D4C8;
  if (!qword_25735D4C8)
  {
    result = MEMORY[0x24950DB24](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25735D4C8);
  }
  return result;
}

char *sub_2443C4054(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_2443C40FC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_BYTE *sub_2443C4070@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t type metadata accessor for UMFKernels()
{
  return objc_opt_self();
}

char *sub_2443C40FC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735D318);
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
  swift_release();
  return v10;
}

uint64_t sub_2443C47D8()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_2443C47E4()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_2443C47F0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2443C47FC()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_2443C4808()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2443C4814()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2443C4820()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2443C482C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2443C4838()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2443C4844()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2443C4850()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2443C485C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2443C4868()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2443C4874()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2443C4880()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2443C488C()
{
  return MEMORY[0x24BEE5B00]();
}

uint64_t sub_2443C4898()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_2443C48A4()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_2443C48B0()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_2443C48BC()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_2443C48C8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2443C48D4()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_2443C48E0()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2443C48EC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2443C48F8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2443C4904()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_2443C4910()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2443C491C()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_2443C4928()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2443C4934()
{
  return MEMORY[0x24BEE4328]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x24BDBDB60](space);
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBA8](data);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBC0](plist);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x24BDBDC18](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8B48](buffer, key);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x24BDD8BB0]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8C58](buffer, planeIndex);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

uint64_t IOSurfaceGetProtectionOptions()
{
  return MEMORY[0x24BDD8CA0]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8CE0](buffer, planeIndex);
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x24BEE4C78]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

