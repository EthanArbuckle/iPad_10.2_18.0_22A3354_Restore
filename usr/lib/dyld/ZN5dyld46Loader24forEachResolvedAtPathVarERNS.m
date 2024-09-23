@implementation ZN5dyld46Loader24forEachResolvedAtPathVarERNS

char *___ZN5dyld46Loader24forEachResolvedAtPathVarERNS_12RuntimeStateEPKcRKNS0_11LoadOptionsENS_13ProcessConfig13PathOverrides4TypeERbU13block_pointerFvS4_SA_SB_E_block_invoke(uint64_t a1, char *a2, _BYTE *a3)
{
  const dyld4::RuntimeState *v6;
  const char *v7;
  uint64_t v8;
  char *result;
  const char *v10;

  v6 = *(const dyld4::RuntimeState **)(a1 + 40);
  if (*(_BYTE *)(*((_QWORD *)v6 + 1) + 208))
  {
    v7 = (const char *)dyld4::Loader::path(*(dyld4::Loader **)(*(_QWORD *)(a1 + 48) + 8), v6);
    dyld4::RuntimeState::log(v6, "  LC_RPATH '%s' from '%s'\n", a2, v7);
    v6 = *(const dyld4::RuntimeState **)(a1 + 40);
  }
  if ((dyld4::Loader::expandAtLoaderPath(v6, a2, *(_QWORD *)(a1 + 56), *(dyld4::Loader **)(*(_QWORD *)(a1 + 48) + 8), 1, *(char **)(a1 + 64)) & 1) != 0)goto LABEL_5;
  result = dyld4::Loader::expandAtExecutablePath(*(dyld4::RuntimeState **)(a1 + 40), a2, v8, 0, *(char **)(a1 + 64));
  if ((_DWORD)result)
    goto LABEL_5;
  if (*a2 != 47)
  {
LABEL_6:
    if (!*a3)
      return result;
    goto LABEL_7;
  }
  strlcpy(*(char **)(a1 + 64), a2, 0x400uLL);
  dyld4::Utils::concatenatePaths(*(dyld4::Utils **)(a1 + 64), *(char **)(a1 + 72), (const char *)0x400);
  result = (char *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*a3)
  {
LABEL_7:
    **(_BYTE **)(a1 + 80) = 1;
    return result;
  }
  v10 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 520);
  if (v10)
  {
    strlcpy(*(char **)(a1 + 64), v10, 0x400uLL);
    strlcat(*(char **)(a1 + 64), a2, 0x400uLL);
LABEL_5:
    dyld4::Utils::concatenatePaths(*(dyld4::Utils **)(a1 + 64), *(char **)(a1 + 72), (const char *)0x400);
    result = (char *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_6;
  }
  return result;
}

@end
