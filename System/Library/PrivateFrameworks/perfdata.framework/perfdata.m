uint64_t pdwriter_new_value(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!a1)
    pdwriter_open_stream_cold_1();
  if (!a2)
    pdwriter_open_stream_cold_1();
  if (!a3)
    pdwriter_open_stream_cold_1();
  new_measurement(a1, a2, a3, a4, a5, a6, a7, a8);
  json_member_dbl(a1, (char)"value", v11, v12, v13, v14, v15, v16, a9);
  return json_multiline(a1);
}

uint64_t new_measurement(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  off_t v11;
  int v12;
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
  uint64_t result;

  v11 = *(_QWORD *)(a1 + 696);
  if ((v11 & 0x8000000000000000) == 0)
  {
    fseeko(*(FILE **)(a1 + 40), v11, 0);
    *(_QWORD *)(a1 + 696) = -1;
  }
  v12 = *(_DWORD *)(a1 + 688);
  if ((v12 - 2) >= 2)
  {
    if (!v12)
    {
      json_member_start_array(a1, (char)"data", a3, a4, a5, a6, a7, a8);
      json_start_array(a1);
    }
  }
  else
  {
    close_measurement(a1, 1);
  }
  *(_DWORD *)(a1 + 688) = 2;
  json_start_object(a1);
  json_member_str(a1, (char)"metric", a2, v13, v14, v15, v16, v17);
  json_oneline(a1);
  result = json_member_str(a1, (char)"unit", a3, v18, v19, v20, v21, v22);
  *(_DWORD *)(a1 + 688) = 2;
  return result;
}

uint64_t json_printf(uint64_t a1, char *__format, ...)
{
  va_list va;

  va_start(va, __format);
  return vfxprintf(*(FILE **)a1, *(printf_domain_t *)(a1 + 8), *(locale_t *)(a1 + 16), __format, va);
}

uint64_t json_printf_s()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  FILE *v3;
  const char ***v4;
  const char *v5;
  size_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  size_t v10;
  int v11;
  char v13[4097];
  uint64_t v14;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v3 = (FILE *)v0;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = **v4;
  v6 = strlen(v5);
  v7 = *(_DWORD *)(v2 + 24);
  if (!v6)
    return fprintf_l(v3, *(locale_t *)(v2 + 8), "%*s", *(_DWORD *)(v2 + 24), (const char *)&unk_1B9BDCD86);
  v8 = v6;
  LODWORD(v9) = 0;
  while (1)
  {
    v10 = v8 >= 0x400 ? 1024 : v8;
    if (strsnvisx(v13, 0x1001uLL, v5, v10, 66, "\\\"\b\f\n\r\t") == -1)
      break;
    v11 = fprintf_l(v3, *(locale_t *)(v2 + 8), "%*s", v7, v13);
    if (v11 == -1)
      break;
    v9 = (v11 + v9);
    v5 += v10;
    v8 -= v10;
    if (!v8)
      return v9;
  }
  return 0xFFFFFFFFLL;
}

FILE *pdwriter_open(const char *a1, uint64_t a2, uint64_t a3)
{
  FILE *result;

  result = fopen(a1, "w");
  if (result)
    return (FILE *)pdwriter_open_stream(result, a2, a3);
  return result;
}

uint64_t pdwriter_open_stream(FILE *a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v6;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;

  if (!a1)
    pdwriter_open_stream_cold_1();
  if (!a2)
    pdwriter_open_stream_cold_1();
  v6 = malloc_type_calloc(1uLL, 0x2C8uLL, 0x107004022D0B21BuLL);
  v7 = (uint64_t)v6;
  if (v6)
  {
    v6[172] = 0;
    *((_QWORD *)v6 + 5) = a1;
    json_init((uint64_t)v6, (uint64_t)a1, 0, 2);
    *(_QWORD *)(v7 + 696) = -1;
    json_start_object(v7);
    json_member_str(v7, (char)"$schema", (uint64_t)"https://perfdata.apple.com/schema/draft-03.json", v8, v9, v10, v11, v12);
    json_member_str(v7, (char)"!notice", (uint64_t)"Please use perfdata.framework (Swift/Objective-C), perfdata.py (Python 2/3), or perfdata.lua (Lua) to parse this data.", v13, v14, v15, v16, v17);
    json_member_str(v7, (char)"name", a2, v18, v19, v20, v21, v22);
    json_member_uint(v7, (char)"version", a3, v23, v24, v25, v26, v27);
    emit_curtime_field(v7, (char)"start_date");
    json_member_strf(v7, (char)"generator", "perfdata.framework:perfdata-%s", v28, v29, v30, v31, v32, (char)"119");
    v33 = getenv("PERFDATA_NOTES");
    if (v33)
      json_member_str(v7, (char)"notes", (uint64_t)v33, v34, v35, v36, v37, v38);
  }
  else
  {
    v39 = *__error();
    fclose(a1);
    *__error() = v39;
  }
  return v7;
}

uint64_t config_emit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  CFTypeID v17;
  CFIndex Length;
  CFIndex v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFDictionary *v27;
  io_service_t MatchingService;
  CFAllocatorRef *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
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
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  const __CFDictionary *v104;
  io_service_t v105;
  io_registry_entry_t v106;
  const __CFAllocator *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  const void *v125;
  const void *Subscription;
  const void *Samples;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  int v152;
  timespec v153;
  statfs out;
  uuid_t uu;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  json_member_start_object(a1, (char)"configuration", a3, a4, a5, a6, a7, a8);
  emit_sysctl_str(a1, (char)"device_type", v9, v10, v11, v12, v13, v14, 6, 0, 2);
  v15 = (const __CFString *)MGCopyAnswer();
  if (!v15 || (v16 = v15, v17 = CFGetTypeID(v15), v17 != CFStringGetTypeID()))
    config_emit_cold_1();
  Length = CFStringGetLength(v16);
  v19 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v20 = (char *)malloc_type_malloc(v19, 0xE2D9B29CuLL);
  if (!v20)
    pdwriter_open_stream_cold_1();
  v21 = v20;
  if (!CFStringGetCString(v16, v20, v19, 0x8000100u))
    pdwriter_open_stream_cold_1();
  json_member_str(a1, (char)"product_type", (uint64_t)v21, v22, v23, v24, v25, v26);
  CFRelease(v16);
  free(v21);
  emit_sysctlbyname_num(a1, (char)"cpu_type", "hw.cputype");
  emit_sysctlbyname_num(a1, (char)"cpu_subtype", "hw.cpusubtype");
  emit_sysctlbyname_num(a1, (char)"cpu_family", "hw.cpufamily");
  emit_sysctlany_str(a1, (char)"cpu_brand_string", 0, 0, "machdep.cpu.brand_string");
  emit_sysctlbyname_num(a1, (char)"logical_cpus", "hw.logicalcpu_max");
  emit_sysctlbyname_num(a1, (char)"physical_cpus", "hw.physicalcpu_max");
  v27 = IOServiceMatching("AppleARMPE");
  MatchingService = IOServiceGetMatchingService(0, v27);
  v29 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (MatchingService)
  {
    v30 = (void *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("chip-revision"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1u);
    v31 = v30;
    if (v30 && objc_msgSend(v30, "length"))
    {
      strcpy((char *)&out, "A0");
      v32 = *(_BYTE *)objc_msgSend(objc_retainAutorelease(v31), "bytes");
      LOBYTE(out.f_bsize) = (v32 >> 4) + 65;
      BYTE1(out.f_bsize) = v32 & 0xF | 0x30;
      json_member_str(a1, (char)"chip_revision", (uint64_t)&out, v33, v34, v35, v36, v37);
    }

  }
  v38 = IORegistryEntryFromPath(0, "IODeviceTree:/chosen");
  v46 = v38;
  if ((_DWORD)v38)
  {
    *(_QWORD *)uu = 0;
    LODWORD(v153.tv_sec) = 8;
    if (!MEMORY[0x1BCCCB218](v38, "dram-size", uu, &v153))
      json_member_dbl(a1, (char)"memory_size", v47, v48, v49, v50, v51, v52, (double)*(unint64_t *)uu);
    memset(&out, 0, 128);
    v152 = 128;
    if (!MEMORY[0x1BCCCB218](v46, "dram-vendor", &out, &v152))
      json_member_str(a1, (char)"dram_vendor", (uint64_t)&out, v53, v54, v55, v56, v57);
    v152 = 128;
    if (!MEMORY[0x1BCCCB218](v46, "dram-type", &out, &v152))
      json_member_str(a1, (char)"dram_type", (uint64_t)&out, v58, v59, v60, v61, v62);
    IOObjectRelease(v46);
  }
  emit_sysctl_num(a1, v39, v40, v41, v42, v43, v44, v45, 6, 0, 7);
  emit_sysctlbyname_num(a1, (char)"vm_pagesize", "vm.pagesize");
  emit_sysctlbyname_num(a1, (char)"vm_pages", "vm.pages");
  emit_sysctlbyname_num(a1, (char)"max_vnodes", "kern.maxvnodes");
  emit_sysctl_str(a1, (char)"kernel_version", v63, v64, v65, v66, v67, v68, 1, 0, 4);
  emit_sysctl_str(a1, (char)"build", v69, v70, v71, v72, v73, v74, 1, 0, 65);
  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithFileAtPath:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75;
  if (v75)
  {
    objc_msgSend(v75, "open");
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", v76, 0, 0, 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("ReleaseType"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v78;
        if (v78)
        {
          v80 = objc_msgSend(objc_retainAutorelease(v78), "UTF8String");
          json_member_str(a1, (char)"release_type", v80, v81, v82, v83, v84, v85);
        }

      }
    }
    objc_msgSend(v76, "close");

  }
  v91 = (void *)os_variant_copy_description();
  if (v91)
  {
    json_member_str(a1, (char)"os_variant", (uint64_t)v91, v86, v87, v88, v89, v90);
    free(v91);
  }
  emit_sysctlbyname_BOOL(a1, (char)"thread_groups_supported", "kern.thread_groups_supported");
  emit_sysctlany_str(a1, (char)"boot_args", 0, 0, "kern.bootargs");
  emit_sysctlbyname_BOOL(a1, (char)"kernel_link_time_optimized", "kern.link_time_optimized");
  if (os_variant_allows_internal_security_policies())
  {
    getpid();
    if (!sandbox_check())
    {
      memset(uu, 0, sizeof(uu));
      v153 = (timespec)xmmword_1B9BDC8D0;
      if (!gethostuuid(uu, &v153) && !uuid_is_null(uu))
      {
        memset(&out, 0, 37);
        uuid_unparse(uu, (char *)&out);
        json_member_str(a1, (char)"device_uuid", (uint64_t)&out, v92, v93, v94, v95, v96);
      }
    }
  }
  memset(&out, 0, 512);
  if (statfs("/", &out))
    pdwriter_open_stream_cold_1();
  if (!is_mul_ok(out.f_bsize, out.f_blocks))
    pdwriter_open_stream_cold_1();
  json_member_dbl(a1, (char)"rootvol_size", v97, v98, v99, v100, v101, v102, (double)(out.f_bsize * out.f_blocks));
  v103 = strrchr(out.f_mntfromname, 47);
  v104 = IOBSDNameMatching(0, 0, v103 + 1);
  v105 = IOServiceGetMatchingService(0, v104);
  v106 = v105;
  if (v105)
  {
    v107 = *v29;
    v108 = (void *)IORegistryEntrySearchCFProperty(v105, "IOService", CFSTR("Device Characteristics"), *v29, 3u);
    v109 = v108;
    if (v108)
    {
      objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("Medium Type"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = objc_msgSend(v110, "isEqualToString:", CFSTR("Solid State"));
      json_member_BOOL(a1, (char)"rootvol_ssd", v111, v112, v113, v114, v115, v116);

    }
    v117 = (void *)IORegistryEntrySearchCFProperty(v106, "IOService", CFSTR("APFSComposited"), v107, 3u);
    v123 = v117;
    if (v117)
      v124 = objc_msgSend(v117, "BOOLValue");
    else
      v124 = 0;
    json_member_BOOL(a1, (char)"rootvol_fusion", v124, v118, v119, v120, v121, v122);

  }
  *(_QWORD *)uu = 0;
  *(_QWORD *)&uu[8] = uu;
  v156 = 0x2020000000;
  v157 = 0;
  v153.tv_sec = 0;
  v125 = (const void *)IOReportCopyChannelsInGroup();
  if (v125)
  {
    if (IOReportPrune() != 1)
    {
      Subscription = (const void *)IOReportCreateSubscription();
      if (Subscription)
      {
        Samples = (const void *)IOReportCreateSamples();
        if (Samples)
        {
          *(_QWORD *)&out.f_bsize = MEMORY[0x1E0C809B0];
          out.f_blocks = 3221225472;
          out.f_bfree = (uint64_t)__emit_battery_resistance_block_invoke_2;
          out.f_bavail = (uint64_t)&unk_1E7142CF8;
          out.f_files = (uint64_t)uu;
          if (IOReportIterate() != 1)
            json_member_dbl(a1, (char)"max_battery_resistance_milliohms", v128, v129, v130, v131, v132, v133, (double)*(uint64_t *)(*(_QWORD *)&uu[8] + 24));
          CFRelease(Samples);
        }
        CFRelease(Subscription);
      }
    }
    if (v153.tv_sec)
      CFRelease((CFTypeRef)v153.tv_sec);
    CFRelease(v125);
  }
  _Block_object_dispose(uu, 8);
  v134 = dyld_shared_cache_some_image_overridden();
  json_member_BOOL(a1, (char)"dsc_overriding_images_present", v134, v135, v136, v137, v138, v139);
  v140 = _dyld_shared_cache_optimized();
  json_member_BOOL(a1, (char)"dsc_optimized", v140, v141, v142, v143, v144, v145);
  json_member_BOOL(a1, (char)"metadata_indexing_enabled", 0, v146, v147, v148, v149, v150);
  return json_end_object(a1);
}

void sub_1B9BD58A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 104), 8);
  _Unwind_Resume(a1);
}

uint64_t json_printf_s_arginfo(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a2)
    *a3 = 8;
  return 1;
}

uint64_t pdwriter_new_group(uint64_t result)
{
  uint64_t v1;
  off_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result + 696);
  if ((v2 & 0x8000000000000000) == 0)
  {
    result = fseeko(*(FILE **)(result + 40), v2, 0);
    *(_QWORD *)(v1 + 696) = -1;
  }
  if ((*(_DWORD *)(v1 + 688) & 0xFFFFFFFE) == 2)
  {
    close_measurement(v1, 1);
    json_end_array(v1);
    result = json_start_array(v1);
    *(_DWORD *)(v1 + 688) = 1;
  }
  return result;
}

uint64_t json_value_raw_internal(uint64_t a1, int a2, char *__format, va_list __ap)
{
  uint64_t result;

  if (a2)
  {
    json_printf(a1, "\"");
    vfxprintf(*(FILE **)a1, *(printf_domain_t *)(a1 + 8), *(locale_t *)(a1 + 16), __format, __ap);
    result = json_printf(a1, "\"");
  }
  else
  {
    result = vfxprintf(*(FILE **)a1, *(printf_domain_t *)(a1 + 8), *(locale_t *)(a1 + 16), __format, __ap);
  }
  *(_BYTE *)(a1 + 24) = 1;
  return result;
}

uint64_t json_value_raw(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result;

  json_comma(a1);
  result = vfxprintf(*(FILE **)a1, *(printf_domain_t *)(a1 + 8), *(locale_t *)(a1 + 16), a3, &a9);
  *(_BYTE *)(a1 + 24) = 1;
  return result;
}

void pddefer_flush(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (*(_BYTE *)(a1 + 73) && ftello(*(FILE **)a1) >= 1)
  {
    fflush(*(FILE **)a1);
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
    {
      if (*(_BYTE *)(a1 + 72))
        json_member_start_array(a2, v12, v6, v7, v8, v9, v10, v11);
      else
        json_member_start_object(a2, v12, v6, v7, v8, v9, v10, v11);
      json_printf(a2, "\n%*s", *(_DWORD *)(a1 + 40) * *(_DWORD *)(a2 + 36), " ");
    }
    else
    {
      json_comma(a2);
    }
    fwrite(*(const void **)(a1 + 56), *(_QWORD *)(a1 + 64), 1uLL, *(FILE **)a2);
    if (!*(_QWORD *)(a1 + 48))
    {
LABEL_12:
      if (!a3)
        return;
      goto LABEL_13;
    }
    if (*(_BYTE *)(a1 + 72))
    {
      json_end_array(a2);
      goto LABEL_12;
    }
    json_end_object(a2);
    if (a3)
    {
LABEL_13:
      json_reset(a1 + 8);
      rewind(*(FILE **)a1);
    }
  }
}

void close_measurement(uint64_t a1, int a2)
{
  pddefer_flush(a1 + 448, a1, a2);
  pddefer_flush(a1 + 528, a1, a2);
  pddefer_flush(a1 + 368, a1, a2);
  pddefer_flush(a1 + 208, a1, a2);
  pddefer_flush(a1 + 288, a1, a2);
  if (a2)
    json_end_object(a1);
}

void pdwriter_close(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;

  if ((*(_QWORD *)(a1 + 696) & 0x8000000000000000) == 0)
    goto LABEL_13;
  v2 = *(_DWORD *)(a1 + 688);
  if ((v2 - 2) < 2)
  {
    close_measurement(a1, 1);
LABEL_5:
    json_end_array(a1);
    json_end_array(a1);
    goto LABEL_6;
  }
  if (v2 == 1)
    goto LABEL_5;
LABEL_6:
  if (!*(_BYTE *)(a1 + 705))
  {
    v3 = pdwriter_defer(a1, 0);
    config_emit(v3, v4, v5, v6, v7, v8, v9, v10);
    *(_BYTE *)(a1 + 705) = 1;
  }
  emit_curtime_field(a1, (char)"end_date");
  for (i = 0; i != 640; i += 80)
  {
    v12 = a1 + i;
    pddefer_flush(a1 + i + 48, a1, 1);
    if (*(_BYTE *)(a1 + i + 121))
    {
      json_destroy(v12 + 56);
      fclose(*(FILE **)(a1 + i + 48));
      free(*(void **)(v12 + 104));
    }
  }
  json_end_object(a1);
  json_destroy(a1);
LABEL_13:
  fclose(*(FILE **)(a1 + 40));
  free((void *)a1);
}

uint64_t json_value_strf(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  json_comma(a1);
  return json_value_raw_internal(a1, 1, a2, &a9);
}

uint64_t json_comma(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 25))
  {
    if (*(_BYTE *)(result + 26))
      result = json_printf(result, " ");
    else
      result = json_printf(result, "\n%*s");
    *(_BYTE *)(v1 + 25) = 0;
  }
  if (*(_BYTE *)(v1 + 24))
  {
    json_printf(v1, ",");
    if (*(_BYTE *)(v1 + 26))
      return json_printf(v1, " ");
    else
      return json_printf(v1, "\n%*s", *(_DWORD *)(v1 + 36) * *(_DWORD *)(v1 + 28), (const char *)&unk_1B9BDCD86);
  }
  return result;
}

char *json_init(uint64_t a1, uint64_t a2, int a3, int a4)
{
  _printf_domain *v5;

  *(_QWORD *)a1 = a2;
  *(_DWORD *)(a1 + 32) = a3;
  *(_DWORD *)(a1 + 36) = a4;
  *(_WORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = a3;
  v5 = new_printf_domain();
  *(_QWORD *)(a1 + 8) = v5;
  if (!v5)
    pdwriter_open_stream_cold_1();
  if (register_printf_domain_function(v5, 115, (printf_function *)json_printf_s, (printf_arginfo_function *)json_printf_s_arginfo, 0))
  {
    pdwriter_open_stream_cold_1();
  }
  *(_QWORD *)(a1 + 16) = newlocale(2, "UTF-8", 0);
  return setlocale(2, "UTF-8");
}

uint64_t emit_curtime_field(uint64_t a1, char a2)
{
  tm *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  time_t v11;
  char v12[21];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  time(&v11);
  v4 = gmtime(&v11);
  strftime(v12, 0x15uLL, "%FT%TZ", v4);
  return json_member_str(a1, a2, (uint64_t)v12, v5, v6, v7, v8, v9);
}

uint64_t pdwriter_open_fd(int a1, uint64_t a2, uint64_t a3)
{
  FILE *v6;

  v6 = fdopen(a1, "w");
  if (v6)
    return pdwriter_open_stream(v6, a2, a3);
  close(a1);
  return 0;
}

uint64_t pdwriter_open_tmp(const char *a1, const char *a2, uint64_t a3, uint64_t a4, char *a5, size_t a6)
{
  unsigned int v11;
  char *v12;
  const char *v13;
  unsigned int v14;
  int *v15;
  uint64_t result;
  int v17;
  int v18;
  int v19;
  int *v20;
  stat v21;
  char __str[1024];
  char v23[1024];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  bzero(v23, 0x400uLL);
  v11 = pdwriter_name(a1, a2, v23, 0x400uLL);
  if ((v11 & 0x80000000) != 0)
    return 0;
  if (v11 >= 0x401)
  {
LABEL_10:
    v15 = __error();
    result = 0;
    *v15 = 22;
    return result;
  }
  bzero(__str, 0x400uLL);
  v12 = getenv("TMPDIR");
  memset(&v21, 0, sizeof(v21));
  if (stat(v12, &v21) || (v21.st_mode & 0x4000) == 0)
    v12 = 0;
  v13 = "/tmp";
  if (v12)
    v13 = v12;
  v14 = snprintf(__str, 0x400uLL, "%s/%s.XXXXX%s", v13, v23, ".pdj");
  if ((v14 & 0x80000000) != 0)
    return 0;
  if (v14 >= 0x401)
    goto LABEL_10;
  v17 = mkstemps(__str, 4);
  if (v17 < 0)
    return 0;
  v18 = v17;
  if (fchmod(v17, 0x1A4u) == -1)
  {
    v19 = *__error();
    close(v18);
    unlink(__str);
    v20 = __error();
    result = 0;
    *v20 = v19;
  }
  else
  {
    if (a5)
      strlcpy(a5, __str, a6);
    return pdwriter_open_fd(v18, (uint64_t)v23, a3);
  }
  return result;
}

uint64_t pdwriter_name(const char *a1, const char *a2, char *a3, size_t a4)
{
  size_t v8;
  size_t v9;

  if (!a1)
    pdwriter_open_stream_cold_1();
  if (!a2)
    pdwriter_open_stream_cold_1();
  if (!a3)
    pdwriter_open_stream_cold_1();
  v8 = strcspn(a1, " \t\v\n");
  if (v8 == strlen(a1))
  {
    v9 = strcspn(a2, " \t\v\n");
    if (v9 == strlen(a2))
      return snprintf(a3, a4, "%s.%s", a1, a2);
  }
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

uint64_t pdwriter_defer(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  FILE *v8;
  uint64_t v9;
  char *v10;

  v3 = a2;
  v4 = a1 + 80 * a2;
  v6 = *(unsigned __int8 *)(v4 + 121);
  v5 = (_BYTE *)(v4 + 121);
  if (!v6)
  {
    v7 = a1 + 80 * a2;
    *(_QWORD *)(v7 + 96) = pddconfigs[2 * a2];
    v8 = open_memstream((char **)(v7 + 104), (size_t *)(v7 + 112));
    *(_QWORD *)(v7 + 48) = v8;
    if (!v8)
      pdwriter_open_stream_cold_1();
    v9 = a1 + 80 * v3;
    v10 = (char *)&pddconfigs[2 * v3];
    json_init(v9 + 56, (uint64_t)v8, *((_DWORD *)v10 + 2), 2);
    *(_BYTE *)(v9 + 120) = v10[12];
    *v5 = 1;
  }
  return a1 + 80 * v3 + 56;
}

uint64_t pdwriter_flush(uint64_t result)
{
  uint64_t v1;
  __int128 v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _OWORD v13[2];
  uint64_t v14;

  if ((*(_QWORD *)(result + 696) & 0x8000000000000000) == 0)
    return result;
  v1 = result;
  *(_QWORD *)(result + 696) = ftello(*(FILE **)(result + 40));
  v2 = *(_OWORD *)(v1 + 16);
  v13[0] = *(_OWORD *)v1;
  v13[1] = v2;
  v14 = *(_QWORD *)(v1 + 32);
  v3 = *(_DWORD *)(v1 + 688);
  if ((v3 - 2) < 2)
  {
    close_measurement(v1, 0);
    json_end_object((uint64_t)v13);
LABEL_5:
    json_end_array((uint64_t)v13);
    json_end_array((uint64_t)v13);
    goto LABEL_6;
  }
  if (v3 == 1)
    goto LABEL_5;
LABEL_6:
  if (!*(_BYTE *)(v1 + 705))
  {
    v4 = pdwriter_defer(v1, 0);
    config_emit(v4, v5, v6, v7, v8, v9, v10, v11);
    *(_BYTE *)(v1 + 705) = 1;
  }
  emit_curtime_field((uint64_t)v13, (char)"end_date");
  for (i = 0; i != 640; i += 80)
  {
    if (*(_BYTE *)(v1 + i + 121))
      pddefer_flush(v1 + i + 48, (uint64_t)v13, 0);
  }
  json_end_object((uint64_t)v13);
  return fflush(*(FILE **)(v1 + 40));
}

uint64_t pdwriter_set_description(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = pdwriter_defer(a1, 0);
  return json_member_str(v3, (char)"description", a2, v4, v5, v6, v7, v8);
}

uint64_t pdwriter_start_extension(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*(_BYTE *)(a1 + 704))
    pdwriter_start_extension_cold_1();
  *(_BYTE *)(a1 + 704) = 1;
  v3 = pdwriter_defer(a1, 1u);
  json_member_start_object(v3, a2, v4, v5, v6, v7, v8, v9);
  return v3;
}

uint64_t pdwriter_end_extension(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (!*(_BYTE *)(a1 + 704))
    pdwriter_end_extension_cold_1();
  if (pdwriter_defer(a1, 1u) != a2)
    pdwriter_open_stream_cold_1();
  *(_BYTE *)(a1 + 704) = 0;
  v3 = pdwriter_defer(a1, 1u);
  return json_end_object(v3);
}

uint64_t pdwriter_apply_variable_str(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = pdwriter_defer(a1, 7u);
  return json_member_str(v5, a2, a3, v6, v7, v8, v9, v10);
}

uint64_t pdwriter_apply_variable_dbl(uint64_t a1, char a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = pdwriter_defer(a1, 7u);
  return json_member_dbl(v5, a2, v6, v7, v8, v9, v10, v11, a3);
}

uint64_t pdwriter_set_primary_metric(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = pdwriter_defer(a1, 0);
  return json_member_str(v3, (char)"primary_metric", a2, v4, v5, v6, v7, v8);
}

uint64_t pdwriter_record_variable_str(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  check_measurement(a1);
  v6 = pdwriter_defer(a1, 2u);
  return json_member_str(v6, a2, a3, v7, v8, v9, v10, v11);
}

uint64_t check_measurement(uint64_t result)
{
  uint64_t v1;
  off_t v2;

  if ((*(_DWORD *)(result + 688) & 0xFFFFFFFE) != 2)
    check_measurement_cold_1();
  v1 = result;
  v2 = *(_QWORD *)(result + 696);
  if ((v2 & 0x8000000000000000) == 0)
  {
    result = fseeko(*(FILE **)(result + 40), v2, 0);
    *(_QWORD *)(v1 + 696) = -1;
  }
  return result;
}

uint64_t pdwriter_record_variable_dbl(uint64_t a1, char a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  check_measurement(a1);
  v6 = pdwriter_defer(a1, 2u);
  return json_member_dbl(v6, a2, v7, v8, v9, v10, v11, v12, a3);
}

uint64_t pdwriter_record_label_str(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  check_measurement(a1);
  v6 = pdwriter_defer(a1, 3u);
  return json_member_str(v6, a2, a3, v7, v8, v9, v10, v11);
}

uint64_t pdwriter_record_label_dbl(uint64_t a1, char a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  check_measurement(a1);
  v6 = pdwriter_defer(a1, 3u);
  return json_member_dbl(v6, a2, v7, v8, v9, v10, v11, v12, a3);
}

uint64_t pdwriter_record_tag(uint64_t a1, char *a2)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  check_measurement(a1);
  if (pdtag_summary != a2 && pdtag_context != a2)
    pdwriter_record_tag_cold_1();
  v5 = pdwriter_defer(a1, 4u);
  return json_value_str(v5, (char)a2, v6, v7, v8, v9, v10, v11);
}

uint64_t pdwriter_record_larger_better(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  check_measurement(a1);
  return json_member_BOOL(a1, (char)"larger_better", 1, v2, v3, v4, v5, v6);
}

uint64_t pdwriter_new_stats(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  new_measurement(a1, a2, a3, a4, a5, a6, a7, a8);
  *(_DWORD *)(a1 + 688) = 3;
  json_member_dbl(a1, (char)"samples", v10, v11, v12, v13, v14, v15, (double)(unint64_t)a4);
  return json_multiline(a1);
}

uint64_t pdwriter_record_range(uint64_t a1, double a2, double a3)
{
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

  check_stats(a1);
  json_member_dbl(a1, (char)"minimum", v6, v7, v8, v9, v10, v11, a2);
  return json_member_dbl(a1, (char)"maximum", v12, v13, v14, v15, v16, v17, a3);
}

uint64_t check_stats(uint64_t result)
{
  uint64_t v1;
  off_t v2;

  if (*(_DWORD *)(result + 688) != 3)
    check_stats_cold_1();
  v1 = result;
  v2 = *(_QWORD *)(result + 696);
  if ((v2 & 0x8000000000000000) == 0)
  {
    result = fseeko(*(FILE **)(result + 40), v2, 0);
    *(_QWORD *)(v1 + 696) = -1;
  }
  return result;
}

uint64_t pdwriter_record_mean(uint64_t a1, double a2, double a3)
{
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

  check_stats(a1);
  json_member_dbl(a1, (char)"mean", v6, v7, v8, v9, v10, v11, a2);
  return json_member_dbl(a1, (char)"std_dev", v12, v13, v14, v15, v16, v17, a3);
}

uint64_t pdwriter_record_median(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  check_stats(a1);
  return json_member_dbl(a1, (char)"median", v4, v5, v6, v7, v8, v9, a2);
}

uint64_t pdwriter_record_percentile(uint64_t a1, double a2, double a3)
{
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

  if (a2 < 0.0 || a2 > 100.0)
    pdwriter_open_stream_cold_1();
  check_stats(a1);
  v7 = pdwriter_defer(a1, 5u);
  json_start_object(v7);
  json_oneline(v7);
  json_member_dbl(v7, (char)"%", v8, v9, v10, v11, v12, v13, a2);
  json_member_dbl(v7, (char)"value", v14, v15, v16, v17, v18, v19, a3);
  return json_end_object(v7);
}

uint64_t pdwriter_record_bucket(uint64_t a1, unint64_t a2, char *a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
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

  check_stats(a1);
  v14 = pdwriter_defer(a1, 6u);
  json_start_object(v14);
  json_oneline(v14);
  json_member_dbl(v14, (char)">=", v15, v16, v17, v18, v19, v20, a4);
  json_member_dbl(v14, (char)"count", v21, v22, v23, v24, v25, v26, (double)a2);
  if (a3)
    json_member_strvf(v14, (char)"label", a3, &a10, v27, v28, v29, v30);
  return json_end_object(v14);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_assert_log();
}

uint64_t emit_sysctlbyname_num(uint64_t a1, char a2, char *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  size_t v13;

  v12 = 0;
  v13 = 4;
  result = sysctlbyname(a3, &v12, &v13, 0, 0);
  if (!(_DWORD)result)
    return json_member_dbl(a1, a2, v6, v7, v8, v9, v10, v11, (double)v12);
  return result;
}

uint64_t emit_sysctl_num(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, int a11)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  size_t v20[2];
  int v21[2];
  uint64_t v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20[0] = 4;
  v23 = 0;
  v22 = 0;
  v19[1] = &a9;
  v21[0] = a9;
  v21[1] = a11;
  v19[0] = 0;
  result = sysctl(v21, 2u, v19, v20, 0, 0);
  if (!(_DWORD)result)
    return json_member_dbl(a1, (char)"hw_pagesize", v13, v14, v15, v16, v17, v18, (double)v19[0]);
  return result;
}

void emit_sysctl_str(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, int a11)
{
  int v11[2];
  uint64_t v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v12 = 0;
  v11[0] = a9;
  v11[1] = a11;
  emit_sysctlany_str(a1, a2, 2u, v11, 0);
}

uint64_t emit_sysctlbyname_BOOL(uint64_t a1, char a2, char *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  int v12;

  v12 = 0;
  v11 = 4;
  result = sysctlbyname(a3, &v12, &v11, 0, 0);
  if (!(_DWORD)result)
    return json_member_BOOL(a1, a2, v12 != 0, v6, v7, v8, v9, v10);
  return result;
}

void emit_sysctlany_str(uint64_t a1, char a2, u_int a3, int *a4, char *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  size_t v22;

  v22 = 0;
  if (a5)
    sysctlbyname(a5, 0, &v22, 0, 0);
  else
    sysctl(a4, a3, 0, &v22, 0, 0);
  if (v22)
  {
    v15 = malloc_type_malloc(v22 + 1, 0x9A2F24A1uLL);
    if (!v15)
      pdwriter_open_stream_cold_1();
    v16 = v15;
    if (a5)
    {
      if (sysctlbyname(a5, v15, &v22, 0, 0))
      {
LABEL_9:
        free(v16);
        return;
      }
    }
    else if (sysctl(a4, a3, v15, &v22, 0, 0))
    {
      goto LABEL_9;
    }
    *((_BYTE *)v16 + v22) = 0;
    json_member_str(a1, a2, (uint64_t)v16, v17, v18, v19, v20, v21);
    goto LABEL_9;
  }
  json_member_str(a1, a2, (uint64_t)&unk_1B9BDCD86, v10, v11, v12, v13, v14);
}

uint64_t __emit_battery_resistance_block_invoke()
{
  const void *ChannelName;

  ChannelName = (const void *)IOReportChannelGetChannelName();
  return 16 * (CFEqual(ChannelName, CFSTR("BatteryMaxRa0-8")) == 0);
}

uint64_t __emit_battery_resistance_block_invoke_2(uint64_t a1)
{
  const void *ChannelName;
  uint64_t result;

  ChannelName = (const void *)IOReportChannelGetChannelName();
  result = CFEqual(ChannelName, CFSTR("BatteryMaxRa0-8"));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = IOReportSimpleGetIntegerValue();
    return 273;
  }
  return result;
}

_BYTE *pdunit_create(const char *a1)
{
  size_t v2;
  _BYTE *v3;
  _BYTE *v4;

  v2 = strlen(a1);
  v3 = malloc_type_calloc(v2 + 2, 1uLL, 0x100004077774924uLL);
  v4 = v3;
  if (v3)
  {
    *v3 = 35;
    strlcpy(v3 + 1, a1, v2 + 1);
  }
  return v4;
}

void pdunit_destroy(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t json_reset(uint64_t result)
{
  *(_WORD *)(result + 24) = 0;
  *(_DWORD *)(result + 28) = *(_DWORD *)(result + 32);
  return result;
}

uint64_t json_destroy(uint64_t a1)
{
  json_printf(a1, "\n");
  free_printf_domain(*(printf_domain_t *)(a1 + 8));
  return freelocale(*(locale_t *)(a1 + 16));
}

uint64_t json_start_object(uint64_t a1)
{
  uint64_t result;

  json_comma(a1);
  result = json_printf(a1, "%s", "{");
  ++*(_DWORD *)(a1 + 28);
  *(_WORD *)(a1 + 24) = 256;
  return result;
}

uint64_t json_end_object(uint64_t a1)
{
  unsigned int v1;
  uint64_t result;

  v1 = *(_DWORD *)(a1 + 28);
  if (v1 <= *(_DWORD *)(a1 + 32))
    pdwriter_open_stream_cold_1();
  *(_DWORD *)(a1 + 28) = v1 - 1;
  if (*(_BYTE *)(a1 + 26))
    json_printf(a1, " ");
  else
    json_printf(a1, "\n%*s");
  result = json_printf(a1, "%s", "}");
  *(_BYTE *)(a1 + 26) = 0;
  *(_WORD *)(a1 + 24) = 1;
  return result;
}

uint64_t json_start_array(uint64_t a1)
{
  uint64_t result;

  json_comma(a1);
  result = json_printf(a1, "%s", "[");
  ++*(_DWORD *)(a1 + 28);
  *(_WORD *)(a1 + 24) = 256;
  return result;
}

uint64_t json_end_array(uint64_t a1)
{
  unsigned int v1;
  uint64_t result;

  v1 = *(_DWORD *)(a1 + 28);
  if (v1 <= *(_DWORD *)(a1 + 32))
    pdwriter_open_stream_cold_1();
  *(_DWORD *)(a1 + 28) = v1 - 1;
  if (*(_BYTE *)(a1 + 26))
    json_printf(a1, " ");
  else
    json_printf(a1, "\n%*s");
  result = json_printf(a1, "%s", "]");
  *(_BYTE *)(a1 + 26) = 0;
  *(_WORD *)(a1 + 24) = 1;
  return result;
}

uint64_t json_oneline(uint64_t result)
{
  *(_BYTE *)(result + 26) = 1;
  return result;
}

uint64_t json_multiline(uint64_t result)
{
  *(_BYTE *)(result + 26) = 0;
  return result;
}

uint64_t json_value_strvf(uint64_t a1, char *__format, va_list __ap)
{
  return json_value_raw_internal(a1, 1, __format, __ap);
}

uint64_t json_value_dbl(uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (fabs(a2) == INFINITY)
    pdwriter_open_stream_cold_1();
  return json_value_raw(a1, 0, "%.17g", a5, a6, a7, a8, a9, SLOBYTE(a2));
}

uint64_t json_value_int(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return json_value_raw(a1, 0, "%d", a4, a5, a6, a7, a8, a2);
}

uint64_t json_value_uint(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return json_value_raw(a1, 0, "%u", a4, a5, a6, a7, a8, a2);
}

uint64_t json_value_BOOL(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v8;

  v8 = "false";
  if (a2)
    v8 = "true";
  return json_value_raw(a1, 0, "%s", a4, a5, a6, a7, a8, (char)v8);
}

uint64_t json_value_str(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
}

uint64_t json_key(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
  result = json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  return result;
}

uint64_t json_member_str(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = a3;
  json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
  json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  return json_value_strf(a1, "%s", v10, v11, v12, v13, v14, v15, v8);
}

uint64_t json_member_dbl(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
  json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  return json_value_dbl(a1, a9, v11, v12, v13, v14, v15, v16, v17);
}

uint64_t json_member_int(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a3;
  json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
  json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  return json_value_raw(a1, 0, "%d", v10, v11, v12, v13, v14, v8);
}

uint64_t json_member_uint(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a3;
  json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
  json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  return json_value_raw(a1, 0, "%u", v10, v11, v12, v13, v14, v8);
}

uint64_t json_member_BOOL(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;

  v8 = a3;
  json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
  json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  v15 = "false";
  if (v8)
    v15 = "true";
  return json_value_raw(a1, 0, "%s", v10, v11, v12, v13, v14, (char)v15);
}

uint64_t json_member_strf(uint64_t a1, char a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return json_member_strvf(a1, a2, a3, &a9, a5, a6, a7, a8);
}

uint64_t json_member_strvf(uint64_t a1, char a2, char *a3, va_list a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  json_value_strf(a1, "%s", (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, a2);
  json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  return json_value_raw_internal(a1, 1, a3, a4);
}

uint64_t json_member_start_array(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
  json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  json_comma(a1);
  result = json_printf(a1, "%s", "[");
  ++*(_DWORD *)(a1 + 28);
  *(_WORD *)(a1 + 24) = 256;
  return result;
}

uint64_t json_member_start_object(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  json_value_strf(a1, "%s", a3, a4, a5, a6, a7, a8, a2);
  json_printf(a1, ": ");
  *(_BYTE *)(a1 + 24) = 0;
  json_comma(a1);
  result = json_printf(a1, "%s", "{");
  ++*(_DWORD *)(a1 + 28);
  *(_WORD *)(a1 + 24) = 256;
  return result;
}

uint64_t handle_malformed_data(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = a2;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a2;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PDError"), 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    *a1 = v7;
  }
  return 0;
}

uint64_t not_a_number(void *a1, _QWORD *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = a1;
  v6 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v8 = (id)handle_malformed_data(a2, v6);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id expect_dictionary(void *a1, uint64_t a2, _QWORD *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_5;
  }
  v9 = (void *)v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_5:
    v10 = v9;
    v9 = v10;
    goto LABEL_6;
  }
  handle_malformed_data(a3, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v10;
}

void sub_1B9BDA24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id strip_container_prefix(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@."), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hasPrefix:", v6))
  {
    objc_msgSend(v3, "substringWithRange:", objc_msgSend(v6, "length"), objc_msgSend(v3, "length") - objc_msgSend(v6, "length"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v3;
  }
  v8 = v7;

  return v8;
}

id get_metric_filter_metric(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR(","));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(v1, "substringWithRange:", 0, v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

id get_metric_filter_variables(void *a1, _QWORD *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    v4 = (id)MEMORY[0x1E0C9AA70];
  }
  else
  {
    objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    v24 = a2;
    if (get_metric_filter_variables_formatter_once != -1)
      dispatch_once(&get_metric_filter_variables_formatter_once, &__block_literal_global_0);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      obj = v7;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "rangeOfString:", CFSTR("="));
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v24)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid metric filter component: %@"), v12);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (void *)MEMORY[0x1E0CB35C8];
              v30 = *MEMORY[0x1E0CB2D50];
              v31 = v20;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("PDError"), 2, v22);
              *v24 = (id)objc_claimAutoreleasedReturnValue();

            }
            v7 = obj;

            v4 = 0;
            goto LABEL_20;
          }
          v14 = v13;
          objc_msgSend(v12, "substringWithRange:", 0, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "substringWithRange:", v14 + 1, objc_msgSend(v12, "length") + ~v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)get_metric_filter_variables_formatter, "numberFromString:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (v17)
            v19 = (void *)v17;
          else
            v19 = v16;
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v15);

        }
        v7 = obj;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        if (v9)
          continue;
        break;
      }
    }

    v4 = v6;
LABEL_20:

  }
  return v4;
}

uint64_t __get_metric_filter_variables_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)get_metric_filter_variables_formatter;
  get_metric_filter_variables_formatter = (uint64_t)v0;

  return objc_msgSend((id)get_metric_filter_variables_formatter, "setNumberStyle:", 1);
}

void pdwriter_open_stream_cold_1()
{
  OUTLINED_FUNCTION_0();
  _os_crash();
  __break(1u);
}

void pdwriter_start_extension_cold_1()
{
  _os_crash();
  __break(1u);
}

void pdwriter_end_extension_cold_1()
{
  _os_crash();
  __break(1u);
}

void check_measurement_cold_1()
{
  _os_crash();
  __break(1u);
}

void pdwriter_record_tag_cold_1()
{
  _os_crash();
  __break(1u);
}

void check_stats_cold_1()
{
  _os_crash();
  __break(1u);
}

void config_emit_cold_1()
{
  _os_crash();
  __break(1u);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBAD28](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

kern_return_t IORegistryEntryGetProperty(io_registry_entry_t entry, const io_name_t propertyName, io_struct_inband_t buffer, uint32_t *size)
{
  return MEMORY[0x1E0CBB978](*(_QWORD *)&entry, propertyName, buffer, size);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB9A0](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

uint64_t IOReportChannelGetChannelName()
{
  return MEMORY[0x1E0DE0290]();
}

uint64_t IOReportCopyChannelsInGroup()
{
  return MEMORY[0x1E0DE02D8]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x1E0DE02F8]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x1E0DE0310]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x1E0DE0338]();
}

uint64_t IOReportPrune()
{
  return MEMORY[0x1E0DE0348]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x1E0DE0360]();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _dyld_shared_cache_optimized()
{
  return MEMORY[0x1E0C80F68]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

uint64_t dyld_shared_cache_some_image_overridden()
{
  return MEMORY[0x1E0C831A8]();
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C83318](*(_QWORD *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf_l(FILE *a1, locale_t a2, const char *a3, ...)
{
  return MEMORY[0x1E0C83480](a1, a2, a3);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void free_printf_domain(printf_domain_t __domain)
{
  MEMORY[0x1E0C834B8](__domain);
}

int freelocale(locale_t a1)
{
  return MEMORY[0x1E0C834D8](a1);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1E0C83538](__stream, a2, *(_QWORD *)&__whence);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1E0C83588](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1E0C836C0](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1E0C83858](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1E0C841B0](a1, *(_QWORD *)&a2);
}

printf_domain_t new_printf_domain(void)
{
  return (printf_domain_t)MEMORY[0x1E0C84398]();
}

locale_t newlocale(int a1, const char *a2, locale_t a3)
{
  return (locale_t)MEMORY[0x1E0C843A0](*(_QWORD *)&a1, a2, a3);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

FILE *__cdecl open_memstream(char **__bufp, size_t *__sizep)
{
  return (FILE *)MEMORY[0x1E0C84498](__bufp, __sizep);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_copy_description()
{
  return MEMORY[0x1E0C849E0]();
}

int register_printf_domain_function(printf_domain_t __domain, int __spec, printf_function *__render, printf_arginfo_function *__arginfo, void *__context)
{
  return MEMORY[0x1E0C850A0](__domain, *(_QWORD *)&__spec, __render, __arginfo, __context);
}

void rewind(FILE *a1)
{
  MEMORY[0x1E0C85120](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return (char *)MEMORY[0x1E0C85358](*(_QWORD *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85538](__s, __charset);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

int strsnvisx(char *a1, size_t a2, const char *a3, size_t a4, int a5, const char *a6)
{
  return MEMORY[0x1E0C85600](a1, a2, a3, a4, *(_QWORD *)&a5, a6);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

int vfxprintf(FILE *__stream, printf_domain_t __domain, locale_t __loc, const char *__format, va_list __ap)
{
  return MEMORY[0x1E0C85A78](__stream, __domain, __loc, __format, __ap);
}

