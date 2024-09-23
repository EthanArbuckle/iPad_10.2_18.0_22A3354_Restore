double sub_1000031A4(unint64_t a1)
{
  if (qword_1000165B0 != -1)
    dispatch_once(&qword_1000165B0, &stru_100010708);
  return *(double *)&qword_1000165A8 * (double)a1 * 0.000000001;
}

void sub_100003204(id a1)
{
  unint64_t v1;
  unint64_t v2;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v2) = info.denom;
  LODWORD(v1) = info.numer;
  *(double *)&qword_1000165A8 = (double)v1 / (double)v2;
}

id sub_10000407C()
{
  if (qword_1000165C0 != -1)
    dispatch_once(&qword_1000165C0, &stru_100010728);
  return (id)qword_1000165B8;
}

void sub_1000040BC(id a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  v1 = os_log_create("com.apple.tailspin", "library");
  v2 = (void *)qword_1000165B8;
  qword_1000165B8 = (uint64_t)v1;

  v3 = (id)qword_1000165B8;
  if (!v3)
    sub_10000A87C();

}

uint64_t sub_100004108(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result;

  result = snprintf(byte_1000165C8, 0x400uLL, "%d ", a1);
  if ((result - 1) <= 0x3FE)
    result = vsnprintf(&byte_1000165C8[result], 1024 - result, a2, &a9);
  qword_100016570 = (uint64_t)byte_1000165C8;
  return result;
}

uint64_t sub_100004184(uint64_t a1)
{
  uint64_t typefilter;
  uint64_t v3;
  BOOL v4;
  unsigned int i;
  int v7;
  int j;
  unint64_t v9;
  int v10;
  uint64_t timer_period_ns;
  uint64_t timer_action_id;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  int v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  FILE *v21;
  int v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  size_t __sizep;
  char *__bufp;
  _BYTE __dst[8192];

  __sizep = 0;
  __bufp = 0;
  if (qword_100016438 == (unint64_t)ktrace_config_kdebug_get_buffer_size() >> 20)
  {
    typefilter = ktrace_config_kdebug_get_typefilter(a1);
    if (typefilter)
    {
      v3 = typefilter;
      memcpy(__dst, &unk_100014414, sizeof(__dst));
      if (qword_100016460)
        v4 = 0;
      else
        v4 = qword_100016488 == 0;
      if (!v4 || dword_1000164D4 != 0)
      {
        for (i = 0; i != 256; ++i)
          __dst[(i >> 3) | 0x4A0] |= 1 << (i & 7);
      }
      v7 = 0;
      while (2)
      {
        for (j = 0; j != 256; ++j)
        {
          v9 = j | (v7 << 8);
          v10 = 1 << (j & 7);
          if ((v10 & __dst[v9 >> 3]) != 0 && (v10 & *(_BYTE *)(v3 + (v9 >> 3))) == 0)
          {
            v16 = *__error();
            v19 = sub_10000407C();
            v18 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              sub_10000AC28();
            goto LABEL_34;
          }
        }
        if (++v7 != 256)
          continue;
        break;
      }
      timer_period_ns = ktrace_config_kperf_get_timer_period_ns(a1, qword_100016520);
      if (timer_period_ns == qword_100016460)
      {
        if (!timer_period_ns)
          goto LABEL_23;
        timer_action_id = ktrace_config_kperf_get_timer_action_id(a1, qword_100016520);
        if ((_DWORD)timer_action_id == HIDWORD(qword_100016520))
        {
          if (ktrace_config_kperf_get_action_samplers(a1, timer_action_id) == dword_100016528)
          {
            if (ktrace_config_kperf_get_pet_mode(a1) == 2)
            {
LABEL_23:
              v13 = ktrace_config_kperf_get_timer_period_ns(a1, dword_10001652C);
              if (v13 == qword_100016488)
              {
                if (!v13)
                  return 1;
                v14 = ktrace_config_kperf_get_timer_action_id(a1, dword_10001652C);
                if ((_DWORD)v14 == dword_100016530)
                {
                  if (ktrace_config_kperf_get_action_samplers(a1, v14) == dword_100016534)
                    return 1;
                  v16 = *__error();
                  v37 = sub_10000407C();
                  v18 = objc_claimAutoreleasedReturnValue(v37);
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                    sub_10000A974();
                }
                else
                {
                  v16 = *__error();
                  v36 = sub_10000407C();
                  v18 = objc_claimAutoreleasedReturnValue(v36);
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                    sub_10000A9DC();
                }
              }
              else
              {
                v16 = *__error();
                v33 = sub_10000407C();
                v18 = objc_claimAutoreleasedReturnValue(v33);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                  sub_10000AA48();
              }
            }
            else
            {
              v16 = *__error();
              v35 = sub_10000407C();
              v18 = objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                sub_10000AAB8();
            }
          }
          else
          {
            v16 = *__error();
            v34 = sub_10000407C();
            v18 = objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              sub_10000AAE4();
          }
        }
        else
        {
          v16 = *__error();
          v32 = sub_10000407C();
          v18 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            sub_10000AB4C();
        }
      }
      else
      {
        v16 = *__error();
        v31 = sub_10000407C();
        v18 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_10000ABB8();
      }
    }
    else
    {
      v16 = *__error();
      v20 = sub_10000407C();
      v18 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10000A8FC(v18);
    }
  }
  else
  {
    v16 = *__error();
    v17 = sub_10000407C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10000AC8C();
  }
LABEL_34:

  *__error() = v16;
  result = (uint64_t)open_memstream(&__bufp, &__sizep);
  if (result)
  {
    v21 = (FILE *)result;
    if (!ktrace_config_print_description(a1, result))
    {
      v22 = *__error();
      v23 = sub_10000407C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_10000A894((uint64_t)&__bufp, v24, v25, v26, v27, v28, v29, v30);

      *__error() = v22;
    }
    fclose(v21);
    free(__bufp);
    return 0;
  }
  return result;
}

void sub_100004638()
{
  uint64_t tailspin_profile_config;
  uint64_t v1;
  uint64_t v2;
  int v3;
  id v4;
  NSObject *v5;
  uint64_t tailspin_tasking_config;

  tailspin_profile_config = get_tailspin_profile_config();
  if (tailspin_profile_config)
  {
    v1 = tailspin_profile_config;
LABEL_3:
    sub_100004700(v1);
    tailspin_config_free(v1);
    goto LABEL_4;
  }
  tailspin_tasking_config = get_tailspin_tasking_config();
  if (tailspin_tasking_config)
  {
    v1 = tailspin_tasking_config;
    if (dword_100014410 == 2)
    {
      tailspin_config_free(tailspin_tasking_config);
      return;
    }
    goto LABEL_3;
  }
  if ((dword_100014410 & 0xFFFFFFFD) != 1)
    return;
  sub_100004700(0);
LABEL_4:
  v2 = sub_100005B94();
  if ((v2 & 1) != 0)
  {
    sub_100005E70(v2);
    sub_100005A50();
  }
  else
  {
    v3 = *__error();
    v4 = sub_10000407C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10000AD04();

    *__error() = v3;
  }
}

uint64_t sub_100004700(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  int v4;
  id v5;
  NSObject *v6;
  char *v7;
  uint64_t v8;
  int v9;
  id v10;
  NSObject *v11;
  const char *v12;
  int v13;
  char v14;
  id v15;
  const char *v16;
  int v17;
  int *v18;
  int v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  int v23;
  char *v24;
  uint64_t v25;
  int v26;
  id v27;
  NSObject *v28;
  char *v29;
  uint64_t v30;
  int v31;
  id v32;
  NSObject *v33;
  const char *v34;
  int v35;
  uint64_t v36;
  id v37;
  const char *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  int v53;
  id v54;
  NSObject *v55;
  char *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  int v60;
  id v61;
  NSObject *v62;
  const char *v63;
  int v64;
  id v65;
  const char *v66;
  int v67;
  const void *v68;
  int *v69;
  const char *v70;
  NSObject *v71;
  uint32_t v72;
  char *v73;
  uint64_t v74;
  int v75;
  id v76;
  NSObject *v77;
  char *v78;
  uint64_t v79;
  int v80;
  id v81;
  NSObject *v82;
  const char *v83;
  int v84;
  uint64_t v85;
  id v86;
  const char *v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  int *v91;
  uint64_t v92;
  const char *v93;
  NSObject *v94;
  uint32_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  int v99;
  id v100;
  NSObject *v101;
  char *v102;
  uint64_t v103;
  int v104;
  id v105;
  NSObject *v106;
  const char *v107;
  int v108;
  uint64_t v109;
  id v110;
  const char *v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  int *v115;
  uint64_t v116;
  const char *v117;
  NSObject *v118;
  uint32_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  int v123;
  id v124;
  NSObject *v125;
  char *v126;
  uint64_t v127;
  int v128;
  id v129;
  NSObject *v130;
  const char *v131;
  int v132;
  int v133;
  int v134;
  id v135;
  const char *v136;
  int v137;
  int v138;
  int v139;
  int v140;
  uint64_t result;
  int v142;
  int v143;
  const char *v144;
  NSObject *v145;
  uint32_t v146;
  int v147;
  char *v148;
  int v149;
  void *v150;
  __int16 v151;
  _BYTE v152[20];
  uint64_t v153;

  v2 = (const char *)(a1 + 8204);
  if (a1 && (*(_BYTE *)a1 & 0x80) != 0)
  {
    v8 = qword_100014408;
    if ((qword_100014408 & 0x80) != 0)
    {
      v14 = byte_1000164B0;
      if (byte_1000164B0 == *(_BYTE *)(a1 + 8360) && !strncmp(&byte_1000164B1, (const char *)(a1 + 8361), 0x20uLL))
        goto LABEL_42;
      v9 = *__error();
      v15 = sub_10000407C();
      v11 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v2 + 157;
        if (!v2[157])
        {
          v17 = *(_DWORD *)(a1 + 8);
          if (v17 == 3)
          {
            v16 = "<profile>";
          }
          else if (v17 == 1)
          {
            v16 = "<tasking>";
          }
          else
          {
            v16 = "<unknown>";
          }
        }
        v23 = *((unsigned __int8 *)v2 + 156);
        v24 = &byte_1000164B1;
        if (!byte_1000164B1)
        {
          if (dword_100014410 == 3)
          {
            v24 = "<profile>";
          }
          else if (dword_100014410 == 1)
          {
            v24 = "<tasking>";
          }
          else
          {
            v24 = "<unknown>";
          }
        }
        v149 = 136446978;
        v150 = (void *)v16;
        v151 = 1024;
        *(_DWORD *)v152 = v23;
        *(_WORD *)&v152[4] = 2082;
        *(_QWORD *)&v152[6] = v24;
        *(_WORD *)&v152[14] = 1024;
        *(_DWORD *)&v152[16] = byte_1000164B0;
        v20 = "%{public}s requested to change tailspin enablement to %d, overriding previous request from %{public}s to c"
              "hange tailspin enablement to %d";
        v21 = v11;
        v22 = 34;
        goto LABEL_40;
      }
    }
    else
    {
      v9 = *__error();
      v10 = sub_10000407C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v2 + 157;
        if (!v2[157])
        {
          v13 = *(_DWORD *)(a1 + 8);
          if (v13 == 3)
          {
            v12 = "<profile>";
          }
          else if (v13 == 1)
          {
            v12 = "<tasking>";
          }
          else
          {
            v12 = "<unknown>";
          }
        }
        v19 = *((unsigned __int8 *)v2 + 156);
        v149 = 136446722;
        v150 = (void *)v12;
        v151 = 1024;
        *(_DWORD *)v152 = v19;
        *(_WORD *)&v152[4] = 1024;
        *(_DWORD *)&v152[6] = byte_1000164B0;
        v20 = "%{public}s requested to change tailspin enablement to %d from default %d";
        v21 = v11;
        v22 = 24;
LABEL_40:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v149, v22);
      }
    }

    *__error() = v9;
    v8 = qword_100014408;
    v14 = v2[156];
LABEL_42:
    qword_100014408 = v8 | 0x80;
    *((_BYTE *)&qword_100014408 + &unk_1000020A8) = v14;
    v18 = (int *)set_config_field_modifier((char *)&qword_100014408 + &unk_1000020A9, a1 + &unk_1000020A9);
    goto LABEL_43;
  }
  v3 = qword_100014408;
  if ((qword_100014408 & 0x80) != 0)
  {
    v4 = *__error();
    v5 = sub_10000407C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = &byte_1000164B1;
      if (!byte_1000164B1)
      {
        if (dword_100014410 == 3)
        {
          v7 = "<profile>";
        }
        else if (dword_100014410 == 1)
        {
          v7 = "<tasking>";
        }
        else
        {
          v7 = "<unknown>";
        }
      }
      v149 = 136446722;
      v150 = v7;
      v151 = 1024;
      *(_DWORD *)v152 = byte_1000164B0;
      *(_WORD *)&v152[4] = 1024;
      *(_DWORD *)&v152[6] = tailspin_enabled_get_default();
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reverted previous request by %{public}s to change tailspin enablement to %d to default %d", (uint8_t *)&v149, 0x18u);
    }

    *__error() = v4;
    v3 = qword_100014408;
  }
  qword_100014408 = v3 & 0xFFFFFFFFFFFFFF7FLL;
  *((_BYTE *)&qword_100014408 + &unk_1000020A8) = tailspin_enabled_get_default();
  v18 = (int *)set_config_field_modifier((char *)&qword_100014408 + &unk_1000020A9, 0);
  if (a1)
  {
LABEL_43:
    if ((*(_BYTE *)a1 & 2) == 0)
      goto LABEL_44;
    v30 = qword_100014408;
    if ((qword_100014408 & 2) != 0)
    {
      v36 = qword_100016438;
      if (qword_100016438 == *(_QWORD *)(a1 + 8240) && !strncmp(&byte_100016440, (const char *)(a1 + 8248), 0x20uLL))
        goto LABEL_83;
      v31 = *__error();
      v37 = sub_10000407C();
      v33 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v2 + 44;
        if (!v2[44])
        {
          v39 = *(_DWORD *)(a1 + 8);
          if (v39 == 3)
          {
            v38 = "<profile>";
          }
          else if (v39 == 1)
          {
            v38 = "<tasking>";
          }
          else
          {
            v38 = "<unknown>";
          }
        }
        v47 = *(_QWORD *)(a1 + 8240);
        v48 = &byte_100016440;
        if (!byte_100016440)
        {
          if (dword_100014410 == 3)
          {
            v48 = "<profile>";
          }
          else if (dword_100014410 == 1)
          {
            v48 = "<tasking>";
          }
          else
          {
            v48 = "<unknown>";
          }
        }
        v149 = 136446978;
        v150 = (void *)v38;
        v151 = 2048;
        *(_QWORD *)v152 = v47;
        *(_WORD *)&v152[8] = 2082;
        *(_QWORD *)&v152[10] = v48;
        *(_WORD *)&v152[18] = 2048;
        v153 = qword_100016438;
        v44 = "%{public}s requested to change tailspin buffer size to %zu MB, overriding previous request from %{public}s"
              " to change tailspin buffer size to %zu MB";
        v45 = v33;
        v46 = 42;
        goto LABEL_81;
      }
    }
    else
    {
      v31 = *__error();
      v32 = sub_10000407C();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = v2 + 44;
        if (!v2[44])
        {
          v35 = *(_DWORD *)(a1 + 8);
          if (v35 == 3)
          {
            v34 = "<profile>";
          }
          else if (v35 == 1)
          {
            v34 = "<tasking>";
          }
          else
          {
            v34 = "<unknown>";
          }
        }
        v43 = *(_QWORD *)(a1 + 8240);
        v149 = 136446722;
        v150 = (void *)v34;
        v151 = 2048;
        *(_QWORD *)v152 = v43;
        *(_WORD *)&v152[8] = 2048;
        *(_QWORD *)&v152[10] = qword_100016438;
        v44 = "%{public}s requested to change tailspin buffer size to %zu MB from default %zu MB";
        v45 = v33;
        v46 = 32;
LABEL_81:
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, v44, (uint8_t *)&v149, v46);
      }
    }

    *__error() = v31;
    v30 = qword_100014408;
    v36 = *(_QWORD *)(a1 + 8240);
LABEL_83:
    qword_100014408 = v30 | 2;
    qword_100016438 = v36;
    v42 = set_config_field_modifier((char *)&qword_100014408 + &unk_100002038, a1 + &unk_100002038);
    goto LABEL_84;
  }
LABEL_44:
  v25 = qword_100014408;
  if ((qword_100014408 & 2) != 0)
  {
    v26 = *__error();
    v27 = sub_10000407C();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = &byte_100016440;
      if (!byte_100016440)
      {
        if (dword_100014410 == 3)
        {
          v29 = "<profile>";
        }
        else if (dword_100014410 == 1)
        {
          v29 = "<tasking>";
        }
        else
        {
          v29 = "<unknown>";
        }
      }
      v40 = qword_100016438;
      v41 = ((uint64_t (*)(void))tailspin_buffer_size_get_default)();
      v149 = 136446722;
      v150 = v29;
      v151 = 2048;
      *(_QWORD *)v152 = v40;
      *(_WORD *)&v152[8] = 2048;
      *(_QWORD *)&v152[10] = v41;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Reverted previous request by %{public}s to change tailspin buffer size to %zu MB to default %zu MB", (uint8_t *)&v149, 0x20u);
    }

    v18 = __error();
    *v18 = v26;
    v25 = qword_100014408;
  }
  qword_100014408 = v25 & 0xFFFFFFFFFFFFFFFDLL;
  qword_100016438 = tailspin_buffer_size_get_default(v18);
  v42 = set_config_field_modifier((char *)&qword_100014408 + &unk_100002038, 0);
  if (a1)
  {
LABEL_84:
    if ((*(_BYTE *)a1 & 1) == 0)
      goto LABEL_85;
    v57 = qword_100014408;
    if ((qword_100014408 & 1) != 0)
    {
      if (!memcmp(&unk_100014414, (const void *)(a1 + 12), 0x2000uLL)
        && !strncmp(&byte_100016414, (const char *)(a1 + 8204), 0x20uLL))
      {
        goto LABEL_124;
      }
      v58 = (void *)trace_print_filter(a1 + 12);
      v59 = (void *)trace_print_filter(&unk_100014414);
      v60 = *__error();
      v65 = sub_10000407C();
      v62 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v66 = v2;
        if (!*v2)
        {
          v67 = *(_DWORD *)(a1 + 8);
          if (v67 == 3)
          {
            v66 = "<profile>";
          }
          else if (v67 == 1)
          {
            v66 = "<tasking>";
          }
          else
          {
            v66 = "<unknown>";
          }
        }
        v73 = &byte_100016414;
        if (!byte_100016414)
        {
          if (dword_100014410 == 3)
          {
            v73 = "<profile>";
          }
          else if (dword_100014410 == 1)
          {
            v73 = "<tasking>";
          }
          else
          {
            v73 = "<unknown>";
          }
        }
        v149 = 136446978;
        v150 = (void *)v66;
        v151 = 2082;
        *(_QWORD *)v152 = v58;
        *(_WORD *)&v152[8] = 2082;
        *(_QWORD *)&v152[10] = v73;
        *(_WORD *)&v152[18] = 2082;
        v153 = (uint64_t)v59;
        v70 = "%{public}s requested to change tailspin typefilter to %{public}s, overriding previous request from %{publi"
              "c}s to change tailspin typefilter to %{public}s";
        v71 = v62;
        v72 = 42;
        goto LABEL_122;
      }
    }
    else
    {
      v58 = (void *)trace_print_filter(&unk_100014414);
      v59 = (void *)trace_print_filter(a1 + 12);
      v60 = *__error();
      v61 = sub_10000407C();
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = v2;
        if (!*v2)
        {
          v64 = *(_DWORD *)(a1 + 8);
          if (v64 == 3)
          {
            v63 = "<profile>";
          }
          else if (v64 == 1)
          {
            v63 = "<tasking>";
          }
          else
          {
            v63 = "<unknown>";
          }
        }
        v149 = 136446722;
        v150 = (void *)v63;
        v151 = 2082;
        *(_QWORD *)v152 = v59;
        *(_WORD *)&v152[8] = 2082;
        *(_QWORD *)&v152[10] = v58;
        v70 = "%{public}s requested to change tailspin typefilter to %{public}s from default %{public}s";
        v71 = v62;
        v72 = 32;
LABEL_122:
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, v70, (uint8_t *)&v149, v72);
      }
    }

    *__error() = v60;
    free(v59);
    free(v58);
    v57 = qword_100014408;
LABEL_124:
    qword_100014408 = v57 | 1;
    memcpy(&unk_100014414, (const void *)(a1 + 12), 0x2000uLL);
    v69 = (int *)set_config_field_modifier((char *)&qword_100014408 + &unk_10000200C, a1 + &unk_10000200C);
    goto LABEL_125;
  }
LABEL_85:
  v49 = qword_100014408;
  if ((qword_100014408 & 1) != 0)
  {
    v50 = (void *)trace_print_filter(&unk_100014414);
    v51 = ((uint64_t (*)(void))tailspin_kdbg_filter_get_default)();
    v52 = (void *)trace_print_filter(v51);
    v53 = *__error();
    v54 = sub_10000407C();
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = &byte_100016414;
      if (!byte_100016414)
      {
        if (dword_100014410 == 3)
        {
          v56 = "<profile>";
        }
        else if (dword_100014410 == 1)
        {
          v56 = "<tasking>";
        }
        else
        {
          v56 = "<unknown>";
        }
      }
      v149 = 136446722;
      v150 = v56;
      v151 = 2082;
      *(_QWORD *)v152 = v50;
      *(_WORD *)&v152[8] = 2082;
      *(_QWORD *)&v152[10] = v52;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Reverted previous request by %{public}s to change tailspin typefilter to %{public}s to default %{public}s", (uint8_t *)&v149, 0x20u);
    }

    *__error() = v53;
    free(v50);
    free(v52);
    v49 = qword_100014408;
  }
  qword_100014408 = v49 & 0xFFFFFFFFFFFFFFFELL;
  v68 = (const void *)tailspin_kdbg_filter_get_default(v42);
  memcpy(&unk_100014414, v68, 0x2000uLL);
  v69 = (int *)set_config_field_modifier((char *)&qword_100014408 + &unk_10000200C, 0);
  if (a1)
  {
LABEL_125:
    if ((*(_BYTE *)a1 & 8) == 0)
      goto LABEL_126;
    v79 = qword_100014408;
    if ((qword_100014408 & 8) != 0)
    {
      v85 = qword_100016460;
      if (qword_100016460 == *(_QWORD *)(a1 + 8280) && !strncmp(&byte_100016468, (const char *)(a1 + 8288), 0x20uLL))
        goto LABEL_165;
      v80 = *__error();
      v86 = sub_10000407C();
      v82 = objc_claimAutoreleasedReturnValue(v86);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        v87 = v2 + 84;
        if (!v2[84])
        {
          v88 = *(_DWORD *)(a1 + 8);
          if (v88 == 3)
          {
            v87 = "<profile>";
          }
          else if (v88 == 1)
          {
            v87 = "<tasking>";
          }
          else
          {
            v87 = "<unknown>";
          }
        }
        v96 = *(_QWORD *)(a1 + 8280);
        v97 = &byte_100016468;
        if (!byte_100016468)
        {
          if (dword_100014410 == 3)
          {
            v97 = "<profile>";
          }
          else if (dword_100014410 == 1)
          {
            v97 = "<tasking>";
          }
          else
          {
            v97 = "<unknown>";
          }
        }
        v149 = 136446978;
        v150 = (void *)v87;
        v151 = 2048;
        *(_QWORD *)v152 = v96;
        *(_WORD *)&v152[8] = 2082;
        *(_QWORD *)&v152[10] = v97;
        *(_WORD *)&v152[18] = 2048;
        v153 = qword_100016460;
        v93 = "%{public}s requested to change tailspin full system sampling period to %llu ns, overriding previous reques"
              "t from %{public}s to change tailspin full system sampling period to %llu ns";
        v94 = v82;
        v95 = 42;
        goto LABEL_163;
      }
    }
    else
    {
      v80 = *__error();
      v81 = sub_10000407C();
      v82 = objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        v83 = v2 + 84;
        if (!v2[84])
        {
          v84 = *(_DWORD *)(a1 + 8);
          if (v84 == 3)
          {
            v83 = "<profile>";
          }
          else if (v84 == 1)
          {
            v83 = "<tasking>";
          }
          else
          {
            v83 = "<unknown>";
          }
        }
        v92 = *(_QWORD *)(a1 + 8280);
        v149 = 136446722;
        v150 = (void *)v83;
        v151 = 2048;
        *(_QWORD *)v152 = v92;
        *(_WORD *)&v152[8] = 2048;
        *(_QWORD *)&v152[10] = qword_100016460;
        v93 = "%{public}s requested to change tailspin full system sampling period to %llu ns from default %llu ns";
        v94 = v82;
        v95 = 32;
LABEL_163:
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, v93, (uint8_t *)&v149, v95);
      }
    }

    *__error() = v80;
    v79 = qword_100014408;
    v85 = *(_QWORD *)(a1 + 8280);
LABEL_165:
    qword_100014408 = v79 | 8;
    qword_100016460 = v85;
    v91 = (int *)set_config_field_modifier((char *)&qword_100014408 + &unk_100002060, a1 + &unk_100002060);
    goto LABEL_166;
  }
LABEL_126:
  v74 = qword_100014408;
  if ((qword_100014408 & 8) != 0)
  {
    v75 = *__error();
    v76 = sub_10000407C();
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = &byte_100016468;
      if (!byte_100016468)
      {
        if (dword_100014410 == 3)
        {
          v78 = "<profile>";
        }
        else if (dword_100014410 == 1)
        {
          v78 = "<tasking>";
        }
        else
        {
          v78 = "<unknown>";
        }
      }
      v89 = qword_100016460;
      v90 = ((uint64_t (*)(void))tailspin_full_sampling_period_get_default)();
      v149 = 136446722;
      v150 = v78;
      v151 = 2048;
      *(_QWORD *)v152 = v89;
      *(_WORD *)&v152[8] = 2048;
      *(_QWORD *)&v152[10] = v90;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Reverted previous request by %{public}s to change tailspin full system sampling period to %llu ns to default %llu ns", (uint8_t *)&v149, 0x20u);
    }

    v69 = __error();
    *v69 = v75;
    v74 = qword_100014408;
  }
  qword_100014408 = v74 & 0xFFFFFFFFFFFFFFF7;
  qword_100016460 = tailspin_full_sampling_period_get_default(v69);
  v91 = (int *)set_config_field_modifier((char *)&qword_100014408 + &unk_100002060, 0);
  if (a1)
  {
LABEL_166:
    if ((*(_BYTE *)a1 & 0x10) == 0)
      goto LABEL_167;
    v103 = qword_100014408;
    if ((qword_100014408 & 0x10) != 0)
    {
      v109 = qword_100016488;
      if (qword_100016488 == *(_QWORD *)(a1 + 8320) && !strncmp(&byte_100016490, (const char *)(a1 + 8328), 0x20uLL))
        goto LABEL_206;
      v104 = *__error();
      v110 = sub_10000407C();
      v106 = objc_claimAutoreleasedReturnValue(v110);
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        v111 = v2 + 124;
        if (!v2[124])
        {
          v112 = *(_DWORD *)(a1 + 8);
          if (v112 == 3)
          {
            v111 = "<profile>";
          }
          else if (v112 == 1)
          {
            v111 = "<tasking>";
          }
          else
          {
            v111 = "<unknown>";
          }
        }
        v120 = *(_QWORD *)(a1 + 8320);
        v121 = &byte_100016490;
        if (!byte_100016490)
        {
          if (dword_100014410 == 3)
          {
            v121 = "<profile>";
          }
          else if (dword_100014410 == 1)
          {
            v121 = "<tasking>";
          }
          else
          {
            v121 = "<unknown>";
          }
        }
        v149 = 136446978;
        v150 = (void *)v111;
        v151 = 2048;
        *(_QWORD *)v152 = v120;
        *(_WORD *)&v152[8] = 2082;
        *(_QWORD *)&v152[10] = v121;
        *(_WORD *)&v152[18] = 2048;
        v153 = qword_100016488;
        v117 = "%{public}s requested to change tailspin oncore sampling period to %llu ns, overriding previous request fr"
               "om %{public}s to change tailspin oncore sampling period to %llu ns";
        v118 = v106;
        v119 = 42;
        goto LABEL_204;
      }
    }
    else
    {
      v104 = *__error();
      v105 = sub_10000407C();
      v106 = objc_claimAutoreleasedReturnValue(v105);
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        v107 = v2 + 124;
        if (!v2[124])
        {
          v108 = *(_DWORD *)(a1 + 8);
          if (v108 == 3)
          {
            v107 = "<profile>";
          }
          else if (v108 == 1)
          {
            v107 = "<tasking>";
          }
          else
          {
            v107 = "<unknown>";
          }
        }
        v116 = *(_QWORD *)(a1 + 8320);
        v149 = 136446722;
        v150 = (void *)v107;
        v151 = 2048;
        *(_QWORD *)v152 = v116;
        *(_WORD *)&v152[8] = 2048;
        *(_QWORD *)&v152[10] = qword_100016488;
        v117 = "%{public}s requested to change tailspin oncore sampling period to %llu ns from default %llu ns";
        v118 = v106;
        v119 = 32;
LABEL_204:
        _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, v117, (uint8_t *)&v149, v119);
      }
    }

    *__error() = v104;
    v103 = qword_100014408;
    v109 = *(_QWORD *)(a1 + 8320);
LABEL_206:
    qword_100014408 = v103 | 0x10;
    qword_100016488 = v109;
    v115 = (int *)set_config_field_modifier((char *)&qword_100014408 + &unk_100002088, a1 + &unk_100002088);
    goto LABEL_207;
  }
LABEL_167:
  v98 = qword_100014408;
  if ((qword_100014408 & 0x10) != 0)
  {
    v99 = *__error();
    v100 = sub_10000407C();
    v101 = objc_claimAutoreleasedReturnValue(v100);
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      v102 = &byte_100016490;
      if (!byte_100016490)
      {
        if (dword_100014410 == 3)
        {
          v102 = "<profile>";
        }
        else if (dword_100014410 == 1)
        {
          v102 = "<tasking>";
        }
        else
        {
          v102 = "<unknown>";
        }
      }
      v113 = qword_100016488;
      v114 = ((uint64_t (*)(void))tailspin_oncore_sampling_period_get_default)();
      v149 = 136446722;
      v150 = v102;
      v151 = 2048;
      *(_QWORD *)v152 = v113;
      *(_WORD *)&v152[8] = 2048;
      *(_QWORD *)&v152[10] = v114;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Reverted previous request by %{public}s to change tailspin oncore sampling period to %llu ns to default %llu ns", (uint8_t *)&v149, 0x20u);
    }

    v91 = __error();
    *v91 = v99;
    v98 = qword_100014408;
  }
  qword_100014408 = v98 & 0xFFFFFFFFFFFFFFEFLL;
  qword_100016488 = tailspin_oncore_sampling_period_get_default(v91);
  v115 = (int *)set_config_field_modifier((char *)&qword_100014408 + &unk_100002088, 0);
  if (a1)
  {
LABEL_207:
    if ((*(_BYTE *)a1 & 0x20) == 0)
      goto LABEL_208;
    v127 = qword_100014408;
    if ((qword_100014408 & 0x20) != 0)
    {
      v134 = dword_1000164D4;
      if (dword_1000164D4 == *(_DWORD *)(a1 + 8396) && !strncmp(&byte_1000164D8, (const char *)(a1 + 8400), 0x20uLL))
        goto LABEL_247;
      v128 = *__error();
      v135 = sub_10000407C();
      v130 = objc_claimAutoreleasedReturnValue(v135);
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        v137 = *((unsigned __int8 *)v2 + 196);
        v136 = v2 + 196;
        if (!v137)
        {
          v138 = *(_DWORD *)(a1 + 8);
          if (v138 == 3)
          {
            v136 = "<profile>";
          }
          else if (v138 == 1)
          {
            v136 = "<tasking>";
          }
          else
          {
            v136 = "<unknown>";
          }
        }
        v147 = *(_DWORD *)(a1 + 8396);
        v148 = &byte_1000164D8;
        if (!byte_1000164D8)
        {
          if (dword_100014410 == 3)
          {
            v148 = "<profile>";
          }
          else if (dword_100014410 == 1)
          {
            v148 = "<tasking>";
          }
          else
          {
            v148 = "<unknown>";
          }
        }
        v149 = 136446978;
        v150 = (void *)v136;
        v151 = 1024;
        *(_DWORD *)v152 = v147;
        *(_WORD *)&v152[4] = 2082;
        *(_QWORD *)&v152[6] = v148;
        *(_WORD *)&v152[14] = 1024;
        *(_DWORD *)&v152[16] = dword_1000164D4;
        v144 = "%{public}s requested to change tailspin sampling modifers to 0x%x, overriding previous request from %{pub"
               "lic}s to change tailspin sampling modifiers to 0x%x";
        v145 = v130;
        v146 = 34;
        goto LABEL_245;
      }
    }
    else
    {
      v128 = *__error();
      v129 = sub_10000407C();
      v130 = objc_claimAutoreleasedReturnValue(v129);
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        v132 = *((unsigned __int8 *)v2 + 196);
        v131 = v2 + 196;
        if (!v132)
        {
          v133 = *(_DWORD *)(a1 + 8);
          if (v133 == 3)
          {
            v131 = "<profile>";
          }
          else if (v133 == 1)
          {
            v131 = "<tasking>";
          }
          else
          {
            v131 = "<unknown>";
          }
        }
        v143 = *(_DWORD *)(a1 + 8396);
        v149 = 136446722;
        v150 = (void *)v131;
        v151 = 1024;
        *(_DWORD *)v152 = v143;
        *(_WORD *)&v152[4] = 1024;
        *(_DWORD *)&v152[6] = dword_1000164D4;
        v144 = "%{public}s requested to change tailspin sampling modifiers to %x from default %x";
        v145 = v130;
        v146 = 24;
LABEL_245:
        _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, v144, (uint8_t *)&v149, v146);
      }
    }

    *__error() = v128;
    v127 = qword_100014408;
    v134 = *(_DWORD *)(a1 + 8396);
LABEL_247:
    qword_100014408 = v127 | 0x20;
    dword_1000164D4 = v134;
    result = set_config_field_modifier((char *)&qword_100014408 + &unk_1000020D0, a1 + &unk_1000020D0);
LABEL_248:
    v142 = *(_DWORD *)(a1 + 8);
    goto LABEL_249;
  }
LABEL_208:
  v122 = qword_100014408;
  if ((qword_100014408 & 0x20) != 0)
  {
    v123 = *__error();
    v124 = sub_10000407C();
    v125 = objc_claimAutoreleasedReturnValue(v124);
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      v126 = &byte_1000164D8;
      if (!byte_1000164D8)
      {
        if (dword_100014410 == 3)
        {
          v126 = "<profile>";
        }
        else if (dword_100014410 == 1)
        {
          v126 = "<tasking>";
        }
        else
        {
          v126 = "<unknown>";
        }
      }
      v139 = dword_1000164D4;
      v140 = ((uint64_t (*)(void))tailspin_sampling_options_get_default)();
      v149 = 136446722;
      v150 = v126;
      v151 = 1024;
      *(_DWORD *)v152 = v139;
      *(_WORD *)&v152[4] = 1024;
      *(_DWORD *)&v152[6] = v140;
      _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "Reverted previous request by %{public}s to change tailspin sampling options to %x to default %x", (uint8_t *)&v149, 0x18u);
    }

    v115 = __error();
    *v115 = v123;
    v122 = qword_100014408;
  }
  qword_100014408 = v122 & 0xFFFFFFFFFFFFFFDFLL;
  dword_1000164D4 = tailspin_sampling_options_get_default(v115);
  result = set_config_field_modifier((char *)&qword_100014408 + &unk_1000020D0, 0);
  if (a1)
    goto LABEL_248;
  v142 = 0;
LABEL_249:
  dword_100014410 = v142;
  return result;
}

void sub_100005A50()
{
  uint64_t ondisk_config;
  void *v1;
  void *v2;
  int v3;
  id v4;
  NSObject *v5;

  ondisk_config = tailspin_make_ondisk_config(&qword_100014408, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue(ondisk_config);
  v2 = v1;
  if (v1)
  {
    if ((objc_msgSend(v1, "writeToFile:atomically:", CFSTR("/var/db/tailspin_config.plist"), 1) & 1) == 0)
    {
      v3 = *__error();
      v4 = sub_10000407C();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_10000AD30();

      *__error() = v3;
    }
  }
  else
  {
    unlink("/var/db/tailspin_config.plist");
  }

}

uint64_t sub_100005AF4()
{
  int v0;
  id v1;
  NSObject *v2;
  uint64_t v3;
  int v5;
  id v6;
  NSObject *v7;

  v0 = *__error();
  v1 = sub_10000407C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_10000ADD4();

  *__error() = v0;
  v3 = sub_100005B94();
  if ((v3 & 1) != 0)
  {
    sub_100005E70(v3);
    return 0;
  }
  else
  {
    v5 = *__error();
    v6 = sub_10000407C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000ADA8();

    *__error() = v5;
    return 5;
  }
}

uint64_t sub_100005B94()
{
  uint64_t v0;
  int v1;
  BOOL v2;
  unsigned int i;
  int v5;
  _BOOL8 v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t v18[16];
  _WORD __dst[4100];

  if (byte_1000164B0)
  {
    v0 = ktrace_session_create();
    ktrace_session_set_event_names_enabled(v0, 0);
    ktrace_set_buffer_size(v0, qword_100016438);
    memcpy(__dst, &unk_100014414, 0x2000uLL);
    v1 = dword_1000164D4;
    if (qword_100016460)
      v2 = 0;
    else
      v2 = qword_100016488 == 0;
    if (!v2 || dword_1000164D4 != 0)
    {
      for (i = 0; i != 256; ++i)
        *((_BYTE *)__dst + ((i >> 3) | 0x4A0)) |= 1 << (i & 7);
      if (v1)
      {
        if (tailspin_sampling_option_get(&qword_100014408, 1))
          LOBYTE(__dst[20]) |= 1u;
        if (tailspin_sampling_option_get(&qword_100014408, 2))
        {
          HIBYTE(__dst[16]) |= 0x10u;
          HIBYTE(__dst[64]) |= 0x10u;
        }
        if (tailspin_sampling_option_get(&qword_100014408, 4))
          LOBYTE(__dst[19]) |= 1u;
      }
    }
    if (ktrace_events_filter_bitmap(v0, __dst, 0))
      sub_10000AEE8();
    v5 = ktrace_configure(v0);
    ktrace_session_free(v0);
    v6 = v5 == 0;
    v7 = *__error();
    v8 = sub_10000407C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000AE84();

      *__error() = v7;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Successfully enacted kdbg config", v18, 2u);
      }

      *__error() = v7;
      v16 = mach_absolute_time();
      sub_100006418(v16, "KDBG_STATE");
    }
  }
  else
  {
    v11 = ktrace_reset_existing();
    v12 = *__error();
    v13 = sub_10000407C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10000AE0C(v15);

      v6 = 0;
      *__error() = v12;
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __dst[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Successfully reset kdbg config", (uint8_t *)__dst, 2u);
      }

      *__error() = v12;
      return 1;
    }
  }
  return v6;
}

uint64_t sub_100005E70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  NSObject *v10;
  int *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  unsigned int v22;

  if (byte_1000164B0)
    v1 = qword_100016460;
  else
    v1 = 0;
  if (byte_1000164B0)
    v2 = qword_100016488;
  else
    v2 = 0;
  if (byte_1000164B0)
    v3 = dword_1000164D4;
  else
    v3 = 0;
  if (kperf_reset(a1))
  {
    v4 = 724;
    goto LABEL_33;
  }
  if (v1)
  {
    qword_100016520 = 0x200000000;
    v5 = 2;
    v6 = 1;
    if (!v2)
      goto LABEL_15;
    goto LABEL_14;
  }
  v6 = 0;
  v5 = 1;
  if (v2)
  {
LABEL_14:
    v5 = (v5 + 1);
    dword_10001652C = v6;
    dword_100016530 = v5;
    v6 = (v6 + 1);
  }
LABEL_15:
  if (v3)
  {
    v5 = (v5 + 1);
    dword_10001653C = v5;
  }
  v22 = 0;
  if (kperf_action_count_get(&v22))
  {
    v4 = 756;
    goto LABEL_33;
  }
  if (v22 < v5 && kperf_action_count_set(v5))
  {
    v4 = 760;
    goto LABEL_33;
  }
  v21 = 0;
  if (kperf_timer_count_get(&v21))
  {
    v4 = 765;
    goto LABEL_33;
  }
  if (v21 < v6 && kperf_timer_count_set(v6))
  {
    v4 = 768;
    goto LABEL_33;
  }
  if (kperf_lazy_cpu_action_set(1))
  {
    v4 = 773;
    goto LABEL_33;
  }
  v7 = kperf_ns_to_ticks(60000000000);
  if (kperf_lazy_cpu_time_threshold_set(v7))
  {
    v4 = 776;
    goto LABEL_33;
  }
  if (v1)
  {
    if (kperf_action_samplers_set(HIDWORD(qword_100016520), dword_100016528))
    {
      v4 = 781;
      goto LABEL_33;
    }
    if (kperf_timer_action_set(qword_100016520, HIDWORD(qword_100016520)))
    {
      v4 = 784;
      goto LABEL_33;
    }
    v13 = qword_100016520;
    v14 = kperf_ns_to_ticks(v1);
    if (kperf_timer_period_set(v13, v14))
    {
      v4 = 787;
      goto LABEL_33;
    }
    v20 = 1;
    if (sysctlbyname("kperf.lightweight_pet", 0, 0, &v20, 4uLL))
    {
      v4 = 790;
      goto LABEL_33;
    }
    if (kperf_timer_pet_set(qword_100016520))
    {
      v4 = 793;
      goto LABEL_33;
    }
  }
  if (v2)
  {
    if (kperf_action_samplers_set(dword_100016530, dword_100016534))
    {
      v4 = 799;
      goto LABEL_33;
    }
    if (kperf_timer_action_set(dword_10001652C, dword_100016530))
    {
      v4 = 802;
      goto LABEL_33;
    }
    v15 = dword_10001652C;
    v16 = kperf_ns_to_ticks(v2);
    if (kperf_timer_period_set(v15, v16))
    {
      v4 = 805;
      goto LABEL_33;
    }
  }
  if (!v3)
    goto LABEL_78;
  v17 = kperf_kdebug_filter_create();
  v18 = v17;
  if ((v3 & 1) == 0)
  {
    v19 = 0;
    if ((v3 & 2) == 0)
      goto LABEL_58;
LABEL_66:
    if (kperf_kdebug_filter_add_class_subclass_fn(v18, 17563650))
    {
      v4 = 826;
      goto LABEL_33;
    }
    if (kperf_kdebug_filter_add_class_subclass_fn(v18, 67895298))
    {
      v4 = 828;
      goto LABEL_33;
    }
    v19 = v19 | 8;
    if ((v3 & 4) != 0)
      goto LABEL_59;
    goto LABEL_72;
  }
  if (kperf_kdebug_filter_add_debugid(v17, 20971520))
  {
    v4 = 818;
    goto LABEL_33;
  }
  if (kperf_kdebug_filter_add_debugid(v18, 20971528))
  {
    v4 = 820;
    goto LABEL_33;
  }
  v19 = 16396;
  if ((v3 & 2) != 0)
    goto LABEL_66;
LABEL_58:
  if ((v3 & 4) != 0)
  {
LABEL_59:
    if (kperf_kdebug_filter_add_class_subclass_fn(v18, 19922946))
    {
      v4 = 834;
      goto LABEL_33;
    }
    v19 = v19 | 8;
  }
LABEL_72:
  if (kperf_action_samplers_set(dword_10001653C, v19))
  {
    v4 = 838;
    goto LABEL_33;
  }
  if (kperf_kdebug_filter_set(v18))
  {
    v4 = 841;
    goto LABEL_33;
  }
  if (kperf_kdebug_action_set(dword_10001653C))
  {
    v4 = 844;
    goto LABEL_33;
  }
LABEL_78:
  result = kperf_sample_on();
  if (!(_DWORD)result)
    return result;
  v4 = 848;
LABEL_33:
  v8 = *__error();
  v9 = sub_10000407C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_10000AEFC(v4, v10);

  v11 = __error();
  *v11 = v8;
  return kperf_reset(v11);
}

void start()
{
  dispatch_queue_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  xpc_connection_t mach_service;
  void *v5;
  dispatch_source_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  _os_crash_callback = sub_100006520;
  v0 = dispatch_queue_create("com.apple.tailspind.ipc_queue", 0);
  v1 = (void *)qword_1000169D0;
  qword_1000169D0 = (uint64_t)v0;

  if (!qword_1000169D0)
  {
    v8 = _os_assert_log(0);
    _os_crash(v8);
    __break(1u);
    goto LABEL_9;
  }
  v2 = dispatch_queue_create("com.apple.tailspind.timeout_queue", 0);
  v3 = (void *)qword_1000169D8;
  qword_1000169D8 = (uint64_t)v2;

  if (!qword_1000169D8)
  {
LABEL_9:
    v9 = _os_assert_log(0);
    _os_crash(v9);
    __break(1u);
    goto LABEL_10;
  }
  mach_service = xpc_connection_create_mach_service("com.apple.tailspind", 0, 1uLL);
  v5 = (void *)qword_1000169C8;
  qword_1000169C8 = (uint64_t)mach_service;

  if (qword_1000169C8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000664C;
    block[3] = &unk_1000107A8;
    block[4] = &v12;
    dispatch_sync((dispatch_queue_t)qword_1000169D0, block);
    if (*((_DWORD *)v13 + 6))
    {
      xpc_connection_set_event_handler((xpc_connection_t)qword_1000169C8, &stru_1000107C8);
      xpc_connection_resume((xpc_connection_t)qword_1000169C8);
    }
    else
    {
      xpc_connection_set_event_handler((xpc_connection_t)qword_1000169C8, &stru_1000107E8);
      xpc_connection_resume((xpc_connection_t)qword_1000169C8);
      v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
      v7 = (void *)qword_1000169E0;
      qword_1000169E0 = (uint64_t)v6;

      dispatch_source_set_event_handler((dispatch_source_t)qword_1000169E0, &stru_100010830);
      dispatch_resume((dispatch_object_t)qword_1000169E0);
      xpc_activity_register("com.apple.tailspin.cleanup", XPC_ACTIVITY_CHECK_IN, &stru_100010850);
    }
    dispatch_main();
  }
LABEL_10:
  v10 = _os_assert_log(0);
  _os_crash(v10);
  __break(1u);
}

void sub_1000063F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

char *sub_100006418(uint64_t a1, const char *a2)
{
  int v4;
  id v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  uint64_t v15;

  v4 = *__error();
  v5 = sub_10000407C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315906;
    v9 = a2;
    v10 = 2048;
    v11 = a1;
    v12 = 2080;
    v13 = asc_100016548;
    v14 = 2048;
    v15 = qword_100016540;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating trace buffer start info: %s at %llu (was %s at %llu)", (uint8_t *)&v8, 0x2Au);
  }

  *__error() = v4;
  qword_100016540 = a1;
  return strncpy(asc_100016548, a2, 0x20uLL);
}

uint64_t sub_100006520(uint64_t a1)
{
  int v2;
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v10[6];

  v2 = *__error();
  v3 = sub_10000407C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10[0] = 136315138;
    *(_QWORD *)&v10[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Cleaning up kernel state before exiting because: %s", (uint8_t *)v10, 0xCu);
  }

  *__error() = v2;
  v10[2] = 7;
  *(_QWORD *)v10 = 0x1800000001;
  if (sysctl(v10, 3u, 0, 0, 0, 0) < 0)
  {
    v5 = *__error();
    v6 = sub_10000407C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000AF78(v7);

    *__error() = v5;
  }
  v8 = kperf_sample_off();
  return kperf_reset(v8);
}

void sub_10000664C(uint64_t a1)
{
  uint64_t tailspin_ondisk_config;
  int v3;
  int v4;
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  int v9;
  int v10;
  id v11;
  NSObject *v12;
  id v13;
  dispatch_source_t v14;
  void *v15;
  int v16;
  mach_port_t special_port;

  tailspin_ondisk_config = get_tailspin_ondisk_config();
  sub_100004700(tailspin_ondisk_config);
  if (tailspin_ondisk_config)
    tailspin_config_free(tailspin_ondisk_config);
  if (dword_1000169F0)
    goto LABEL_4;
  if (qword_1000169E8)
    sub_10000AEE8();
  special_port = 0;
  if (task_get_special_port(mach_task_self_, 4, &special_port))
  {
    v4 = *__error();
    v5 = sub_10000407C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000B110();
LABEL_17:

    *__error() = v4;
    v3 = -1;
    goto LABEL_18;
  }
  if (bootstrap_check_in(special_port, "com.apple.tailspind.ktrace_background", (mach_port_t *)&dword_1000169F0))
  {
    v4 = *__error();
    v7 = sub_10000407C();
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000B0AC();
    goto LABEL_17;
  }
  v16 = 1;
  v8 = sysctlbyname("ktrace.init_background", 0, 0, &v16, 4uLL);
  if (v8)
  {
    v9 = v8;
    v10 = *__error();
    v11 = sub_10000407C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10000B080();

    *__error() = v10;
    v4 = *__error();
    v13 = sub_10000407C();
    v6 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000AFF0(v9, v6);
    goto LABEL_17;
  }
  v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, dword_1000169F0, 0, (dispatch_queue_t)qword_1000169D0);
  v15 = (void *)qword_1000169E8;
  qword_1000169E8 = (uint64_t)v14;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000169E8, &stru_100010898);
  dispatch_resume((dispatch_object_t)qword_1000169E8);
LABEL_4:
  v3 = 0;
LABEL_18:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)qword_1000169D0, &stru_100010780);
}

void sub_10000686C(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  const char *string;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  int v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  int v16;
  int v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  int v25;
  id v26;
  NSObject *v27;
  void *v28;
  unsigned __int8 v29;
  id v30;
  int v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  id v36;
  NSObject *v37;
  int v38;
  id v39;
  NSObject *v40;
  void *v41;
  unsigned __int8 v42;
  int v43;
  id v44;
  NSObject *v45;
  const char *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  mode_t v61;
  id v62;
  uint64_t v63;
  void *v64;
  int v65;
  id v66;
  NSObject *v67;
  uint64_t ondisk_config;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;
  int v73;
  id v74;
  NSObject *v75;
  int v76;
  id v77;
  NSObject *v78;
  uint8_t buf[8];
  uint64_t v80;
  void (*v81)(uint64_t, int);
  void *v82;
  id v83;
  id v84;
  int v85;
  id v86;
  unsigned __int8 v87;
  id v88;
  NSFileAttributeKey v89;
  const __CFString *v90;
  _BYTE v91[12];
  __int16 v92;
  const __CFString *v93;

  v2 = a2;
  string = xpc_dictionary_get_string(v2, "XPCEventName");
  v10 = xpc_dictionary_get_string(v2, "Notification");
  if (!string)
LABEL_57:
    sub_10000B174((char)string, (uint64_t)v10, v4, v5, v6, v7, v8, v9);
  if (!strcmp(string, "com.apple.tailspin.tasking_changed") && v10 && !strcmp(v10, "com.apple.da.tasking_changed"))
  {
    v43 = *__error();
    v44 = sub_10000407C();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v46 = "Resolving tasking change";
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, v46, buf, 2u);
    }
LABEL_35:

    *__error() = v43;
    sub_100004638();
    goto LABEL_56;
  }
  if (!strcmp(string, "com.apple.tailspin.profile_changed")
    && v10
    && !strcmp(v10, "com.apple.ManagedConfiguration.profileListChanged"))
  {
    v43 = *__error();
    v47 = sub_10000407C();
    v45 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v46 = "Resolving profile change";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (strcmp(string, "com.apple.tailspin.dump_on_reset")
    || !v10
    || strcmp(v10, "com.apple.system.logging.power_button_notification"))
  {
    goto LABEL_57;
  }
  v11 = *__error();
  v12 = sub_10000407C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "notification to dump tailspin on reset", buf, 2u);
  }

  *__error() = v11;
  if (byte_1000164B0)
  {
    v14 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v14, "setDateStyle:", 1);
    objc_msgSend(v14, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
    v86 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v87 = 0;
    if ((objc_msgSend(v15, "fileExistsAtPath:isDirectory:", CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins"), &v87) & 1) != 0)
    {
      v16 = v87;
      v17 = *__error();
      v18 = sub_10000407C();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = v19;
      if (v16)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v91 = 138412290;
          *(_QWORD *)&v91[4] = CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins");
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Directory at path: %@ already exists", v91, 0xCu);
        }

        *__error() = v17;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "attributesOfItemAtPath:error:", CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins"), 0));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fileOwnerAccountName"));
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("mobile"));

        if ((v24 & 1) == 0)
        {
          v25 = *__error();
          v26 = sub_10000407C();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v91 = 138543618;
            *(_QWORD *)&v91[4] = CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins");
            v92 = 2114;
            v93 = CFSTR("mobile");
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Attempting to update owner for directory at %{public}@ to %{public}@", v91, 0x16u);
          }

          *__error() = v25;
          v89 = NSFileOwnerAccountName;
          v90 = CFSTR("mobile");
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
          v88 = 0;
          v29 = objc_msgSend(v21, "setAttributes:ofItemAtPath:error:", v28, CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins"), &v88);
          v30 = v88;
          v31 = *__error();
          v32 = sub_10000407C();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          v34 = v33;
          if ((v29 & 1) != 0)
          {
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v91 = 138543618;
              *(_QWORD *)&v91[4] = CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins");
              v92 = 2114;
              v93 = CFSTR("mobile");
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Successfully updated owner for directory at %{public}@ to %{public}@", v91, 0x16u);
            }
          }
          else if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            sub_10000B2D4((uint64_t)v30, v34);
          }

          *__error() = v31;
        }

        v42 = 1;
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_10000B264(v20, v48, v49, v50, v51, v52, v53, v54);

        *__error() = v17;
        v90 = (const __CFString *)NSLocalizedDescriptionKey;
        *(_QWORD *)v91 = CFSTR("Path exists but is not a directory");
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v91, &v90, 1));
        v86 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ForceResetTailspinErrorDomain"), 1, v55));

        v42 = 0;
      }
    }
    else
    {
      v38 = *__error();
      v39 = sub_10000407C();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v91 = 138412290;
        *(_QWORD *)&v91[4] = CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins");
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Creating directory at path %@", v91, 0xCu);
      }

      *__error() = v38;
      v90 = (const __CFString *)NSFileOwnerAccountName;
      *(_QWORD *)v91 = CFSTR("mobile");
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v91, &v90, 1));
      v42 = objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins"), 1, v41, &v86);

    }
    v56 = v86;
    if ((v42 & 1) != 0)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringFromDate:", v57));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tailspin-trace_reset_%@.tailspin"), v58));

      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins"), "stringByAppendingPathComponent:", v59));
      v61 = umask(0);
      v62 = objc_retainAutorelease(v60);
      v63 = open((const char *)objc_msgSend(v62, "UTF8String"), 2562, 432);
      umask(v61);
      if ((v63 & 0x80000000) != 0)
      {
        v76 = *__error();
        v77 = sub_10000407C();
        v78 = objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          sub_10000B1A0();

        *__error() = v76;
      }
      else
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        objc_msgSend(v64, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, UnsafePointer);
        objc_msgSend(v64, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, UnsafePointer);
        objc_msgSend(v64, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, UnsafePointer);
        objc_msgSend(v64, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, UnsafePointer);
        objc_msgSend(v64, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, UnsafePointer);
        objc_msgSend(v64, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, UnsafePointer);
        objc_msgSend(v64, "setObject:forKeyedSubscript:", &off_100010E70, UnsafePointer);
        objc_msgSend(v64, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, UnsafePointer);
        objc_msgSend(v64, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, UnsafePointer);
        v65 = *__error();
        v66 = sub_10000407C();
        v67 = objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v91 = 138543362;
          *(_QWORD *)&v91[4] = v64;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "Saving tailspin file for reset with options = %{public}@", v91, 0xCu);
        }

        *__error() = v65;
        ondisk_config = tailspin_make_ondisk_config(&qword_100014408, 1);
        v69 = (void *)objc_claimAutoreleasedReturnValue(ondisk_config);
        v70 = (void *)os_transaction_create("com.apple.tailspin.dump_on_reset");
        v71 = qword_1000169D0;
        *(_QWORD *)buf = _NSConcreteStackBlock;
        v80 = 3221225472;
        v81 = sub_100009538;
        v82 = &unk_1000108C0;
        v85 = v63;
        v83 = v62;
        v84 = v70;
        v72 = v70;
        tailspin_save_trace_with_standard_chunks(v63, "<Force reset tailspin>", 0xFFFFFFFFLL, v64, v69, v71, 0, buf);

      }
    }
    else
    {
      v73 = *__error();
      v74 = sub_10000407C();
      v75 = objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        sub_10000B204();

      *__error() = v73;
    }

  }
  else
  {
    v35 = *__error();
    v36 = sub_10000407C();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v91 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Unable to save tailspin for reset: tailspin currently disabled", v91, 2u);
    }

    *__error() = v35;
  }
LABEL_56:

}

void sub_10000722C(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  OS_xpc_object *connection;

  connection = a2;
  if (xpc_get_type(connection) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_cancel(connection);
    v2 = connection;
  }
  else
  {
    v2 = connection;
    if (connection == (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      fwrite("tailspind is not intended to be run manually", 0x2CuLL, 1uLL, __stderrp);
      exit(1);
    }
  }

}

void sub_1000072A8(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  char *v3;
  uint64_t pid;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int responsible_pid_and_name;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  BOOL v14;
  _xpc_connection_s *v15;
  xpc_type_t type;
  int v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  _QWORD handler[4];
  OS_xpc_object *v22;
  char *v23;
  char *v24;
  int v25;
  int v26;
  BOOL v27;
  BOOL v28;
  uint8_t buf[4];
  char *v30;
  __int16 v31;
  int v32;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    v3 = (char *)malloc_type_calloc(1uLL, 0x40uLL, 0x1000040FA0F61DDuLL);
    pid = xpc_connection_get_pid(v2);
    proc_name(pid, v3, 0x20u);
    v5 = *__error();
    v6 = sub_10000407C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if ((pid - 1) <= 0xFFFFFFFD && os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 136446466;
      v30 = v3;
      v31 = 1024;
      v32 = pid;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, (int)pid, "NewClientConnection", "New connection for client %{public}s [%d]", buf, 0x12u);
    }

    *__error() = v5;
    responsible_pid_and_name = get_responsible_pid_and_name(pid, v3 + 32, 32);
    v10 = (void *)xpc_connection_copy_entitlement_value(v2, "com.apple.tailspin.dump-output");
    v11 = v10;
    v12 = v10 && xpc_get_type(v10) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v11);
    v13 = (void *)xpc_connection_copy_entitlement_value(v2, "com.apple.tailspin.config-apply");

    v14 = v13 && xpc_get_type(v13) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v13);
    xpc_connection_set_context(v2, v3);
    xpc_connection_set_finalizer_f(v2, (xpc_finalizer_t)&_free);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000075AC;
    handler[3] = &unk_100010810;
    v25 = responsible_pid_and_name;
    v26 = pid;
    v23 = v3 + 32;
    v24 = v3;
    v27 = v12;
    v28 = v14;
    v22 = v2;
    v15 = v2;
    xpc_connection_set_event_handler(v15, handler);
    xpc_connection_set_target_queue(v15, (dispatch_queue_t)qword_1000169D0);
    xpc_connection_resume(v15);

  }
  else
  {
    type = xpc_get_type(v2);
    v17 = *__error();
    v18 = sub_10000407C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      if (v20)
        sub_10000B368(v2, v19);

      *__error() = v17;
      _os_crash("XPC error object received in main handler");
      __break(1u);
    }
    if (v20)
      sub_10000B3E8(v2, v19);

    *__error() = v17;
    _os_crash("unknown XPC object received in main handler");
    __break(1u);
  }
}

void sub_1000075AC(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  int v5;
  int v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  int uint64;
  int v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  int v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  _BOOL4 v24;
  uint64_t v25;
  int v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  id v35;
  NSObject *v36;
  int v37;
  int v38;
  int v39;
  id v40;
  NSObject *v41;
  _BOOL4 v42;
  uint64_t v43;
  int v44;
  const char *v45;
  NSObject *v46;
  uint32_t v47;
  int v48;
  int v49;
  int v50;
  id v51;
  NSObject *v52;
  _BOOL4 v53;
  uint64_t v54;
  int v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  int v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  TSPSaveMeasurements *v69;
  uint64_t v70;
  uint64_t v71;
  off_t v72;
  off_t v73;
  int v74;
  id v75;
  NSObject *v76;
  _BOOL4 v77;
  char *v78;
  id v79;
  const char *v80;
  id v81;
  void *v82;
  int v83;
  TSPSaveMeasurements *v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  int v88;
  int *data;
  int *v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  int v95;
  void *v96;
  uint64_t current;
  uint64_t v98;
  int owner_pid;
  TSPSaveMeasurements *reply;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v102;
  _xpc_connection_s *v103;
  int v104;
  id v105;
  NSObject *v106;
  int v107;
  id v108;
  NSObject *v109;
  BOOL v110;
  int v111;
  id v112;
  NSObject *v113;
  int v114;
  id v115;
  NSObject *v116;
  id v117;
  int v118;
  id v119;
  NSObject *v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  int v124;
  int v125;
  int v126;
  id v127;
  NSObject *v128;
  const void *tailspin_tasking_config;
  const void *v130;
  uint64_t v131;
  int v132;
  id v133;
  NSObject *v134;
  id v135;
  id v136;
  int *v137;
  void *v138;
  id v139;
  const void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  id v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  double v148;
  double v149;
  double v150;
  void *v151;
  double v152;
  uint64_t v153;
  double v154;
  int v155;
  id v156;
  NSObject *v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  int v161;
  id v162;
  NSObject *v163;
  int v164;
  id v165;
  NSObject *v166;
  id v167;
  void *v168;
  id v169;
  void *v170;
  const char *v171;
  int v172;
  id v173;
  NSObject *v174;
  int v175;
  id v176;
  NSObject *v177;
  void *v178;
  NSObject *v179;
  TSPSaveMeasurements *v180;
  id v181;
  uint64_t ondisk_config;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  int v186;
  id v187;
  NSObject *v188;
  id v189;
  double when;
  dispatch_time_t whena;
  uint64_t v192;
  id v193;
  id v194;
  id v195;
  int v196;
  void *v197;
  uint8_t v198[8];
  uint64_t v199;
  void (*v200)(uint64_t, int);
  void *v201;
  TSPSaveMeasurements *v202;
  id v203;
  uint64_t v204;
  id v205;
  size_t length;
  uint8_t buf[8480];

  v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    type = xpc_get_type(v3);
    v5 = *(_DWORD *)(a1 + 60);
    v6 = *(_DWORD *)(a1 + 56);
    v7 = *__error();
    v8 = sub_10000407C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (v6 == v5)
      {
        if (v11)
          sub_10000B760();
      }
      else if (v11)
      {
        v30 = *(_QWORD *)(a1 + 40);
        v31 = *(_QWORD *)(a1 + 48);
        v32 = *(_DWORD *)(a1 + 56);
        v33 = *(_DWORD *)(a1 + 60);
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v32;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = v31;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v33;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "client %{public}s [%d] (via %{public}s [%d]) received unknown request type", buf, 0x22u);
      }
      goto LABEL_24;
    }
    v24 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v6 == v5)
    {
      if (v24)
      {
        v25 = *(_QWORD *)(a1 + 48);
        v26 = *(_DWORD *)(a1 + 60);
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v26;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = xpc_dictionary_get_string(v3, _xpc_error_key_description);
        v27 = "client %{public}s [%d] received error %{public}s";
        v28 = v10;
        v29 = 28;
LABEL_90:
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, v27, buf, v29);
      }
    }
    else if (v24)
    {
      v122 = *(_QWORD *)(a1 + 40);
      v123 = *(_QWORD *)(a1 + 48);
      v124 = *(_DWORD *)(a1 + 56);
      v125 = *(_DWORD *)(a1 + 60);
      *(_DWORD *)buf = 136447234;
      *(_QWORD *)&buf[4] = v122;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v124;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = v123;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v125;
      *(_WORD *)&buf[34] = 2082;
      *(_QWORD *)&buf[36] = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      v27 = "client %{public}s [%d] (via %{public}s [%d]) received error %{public}s";
      v28 = v10;
      v29 = 44;
      goto LABEL_90;
    }
LABEL_24:

    *__error() = v7;
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    goto LABEL_25;
  }
  uint64 = xpc_dictionary_get_uint64(v3, "tailspin_request_type");
  if (uint64 < 0)
  {
    if (uint64 == -559035649)
    {
      v59 = *__error();
      v60 = sub_10000407C();
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "tailspin has been poked!", buf, 2u);
      }

      *__error() = v59;
    }
    else if (uint64 == -559035648)
    {
      v34 = *__error();
      v35 = sub_10000407C();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "tailspin has been asked to resolve ondisk, profile and tasking configs", buf, 2u);
      }

      *__error() = v34;
      sub_100004638();
    }
    goto LABEL_25;
  }
  if (!uint64)
  {
    v37 = *(_DWORD *)(a1 + 60);
    v38 = *(_DWORD *)(a1 + 56);
    v39 = *__error();
    v40 = sub_10000407C();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    if (v38 == v37)
    {
      if (v42)
      {
        v43 = *(_QWORD *)(a1 + 48);
        v44 = *(_DWORD *)(a1 + 60);
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v44;
        v45 = "client %{public}s [%d] is setting tailspin config (TAILSPIN_APPLY_CONFIG)";
        v46 = v41;
        v47 = 18;
LABEL_51:
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, v45, buf, v47);
      }
    }
    else if (v42)
    {
      v85 = *(_QWORD *)(a1 + 40);
      v86 = *(_QWORD *)(a1 + 48);
      v87 = *(_DWORD *)(a1 + 56);
      v88 = *(_DWORD *)(a1 + 60);
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = v85;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v87;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = v86;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v88;
      v45 = "client %{public}s [%d] (via %{public}s [%d]) is setting tailspin config (TAILSPIN_APPLY_CONFIG)";
      v46 = v41;
      v47 = 34;
      goto LABEL_51;
    }

    *__error() = v39;
    if (*(_BYTE *)(a1 + 65))
    {
      v68 = v3;
      *(_QWORD *)buf = 0;
      data = (int *)xpc_dictionary_get_data(v68, "tailspin_config", (size_t *)buf);
      if (*(_QWORD *)buf == 8472)
      {
        v90 = data;
        v91 = data[2];
        if ((v91 | 2) != 2)
          sub_10000B6B8(v91, v91 == 0);
        switch(dword_100014410)
        {
          case 0:
            if (v91)
              goto LABEL_97;
            goto LABEL_101;
          case 1:
            if (v91)
              goto LABEL_97;
            v126 = *__error();
            v127 = sub_10000407C();
            v128 = objc_claimAutoreleasedReturnValue(v127);
            if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
              sub_10000B734();
            goto LABEL_106;
          case 2:
            if (!v91)
            {
              tailspin_tasking_config = (const void *)get_tailspin_tasking_config();
              if (tailspin_tasking_config)
              {
                v130 = tailspin_tasking_config;
                memcpy(v90, tailspin_tasking_config, 0x2118uLL);
                tailspin_config_free(v130);
              }
            }
            goto LABEL_97;
          case 3:
            v126 = *__error();
            v136 = sub_10000407C();
            v128 = objc_claimAutoreleasedReturnValue(v136);
            if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
              sub_10000B708();
            goto LABEL_106;
          default:
LABEL_97:
            sub_100004700((uint64_t)v90);
            v131 = sub_100005B94();
            if ((v131 & 1) != 0)
            {
              sub_100005E70(v131);
              v132 = *__error();
              v133 = sub_10000407C();
              v134 = objc_claimAutoreleasedReturnValue(v133);
              if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v198 = 0;
                _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_INFO, "tailspin state enacted", v198, 2u);
              }

              *__error() = v132;
              sub_100005A50();
LABEL_101:
              v110 = 1;
            }
            else
            {
              v126 = *__error();
              v135 = sub_10000407C();
              v128 = objc_claimAutoreleasedReturnValue(v135);
              if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
                sub_10000B6DC();
LABEL_106:

              v137 = __error();
              v110 = 0;
              *v137 = v126;
            }
            break;
        }
      }
      else
      {
        v110 = 0;
      }
      sub_1000089E0(v68, v110);
      goto LABEL_108;
    }
    v107 = *__error();
    v108 = sub_10000407C();
    v109 = objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
      sub_10000B658();

    *__error() = v107;
    sub_1000089E0(v3, 0);
    goto LABEL_25;
  }
  if (uint64 == 1)
  {
    v48 = *(_DWORD *)(a1 + 56);
    v49 = *(_DWORD *)(a1 + 60);
    v50 = *__error();
    v51 = sub_10000407C();
    v52 = objc_claimAutoreleasedReturnValue(v51);
    v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
    if (v48 == v49)
    {
      if (!v53)
        goto LABEL_61;
      v54 = *(_QWORD *)(a1 + 48);
      v55 = *(_DWORD *)(a1 + 60);
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v54;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v55;
      v56 = "client %{public}s [%d] asked for tailspin config (TAILSPIN_GET_CONFIG)";
      v57 = v52;
      v58 = 18;
    }
    else
    {
      if (!v53)
        goto LABEL_61;
      v92 = *(_QWORD *)(a1 + 40);
      v93 = *(_QWORD *)(a1 + 48);
      v94 = *(_DWORD *)(a1 + 56);
      v95 = *(_DWORD *)(a1 + 60);
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = v92;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v94;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = v93;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v95;
      v56 = "client %{public}s [%d] (via %{public}s [%d]) asked for tailspin config (TAILSPIN_GET_CONFIG)";
      v57 = v52;
      v58 = 34;
    }
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, v56, buf, v58);
LABEL_61:

    *__error() = v50;
    v68 = v3;
    v96 = memcpy(buf, &qword_100014408, 0x2118uLL);
    if (is_apple_internal_setting(v96))
    {
      current = ktrace_config_create_current();
      if (current)
      {
        v98 = current;
        owner_pid = ktrace_config_get_owner_pid();
        if (ktrace_config_get_owner_kind(v98) == 2 && owner_pid == getpid())
          sub_100004184(v98);
        ktrace_config_destroy(v98);
      }
    }
    reply = (TSPSaveMeasurements *)xpc_dictionary_create_reply(v68);
    if (!reply)
      sub_10000AEE8();
    v69 = reply;
    xpc_dictionary_set_BOOL(reply, "tailspin_succeeded", 1);
    xpc_dictionary_set_data(v69, "tailspin_config", buf, 0x2118uLL);
    remote_connection = xpc_dictionary_get_remote_connection(v68);
    v102 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    if (!v102)
      sub_10000AEE8();
    v103 = v102;
    xpc_connection_send_message(v102, v69);

    goto LABEL_88;
  }
  if (uint64 != 2)
    goto LABEL_25;
  v13 = *(_DWORD *)(a1 + 60);
  v14 = *(_DWORD *)(a1 + 56);
  v15 = *__error();
  v16 = sub_10000407C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v14 == v13)
  {
    if (v18)
    {
      v19 = *(_QWORD *)(a1 + 48);
      v20 = *(_DWORD *)(a1 + 60);
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v20;
      v21 = "client %{public}s [%d] asked for tailspin output (TAILSPIN_DUMP_OUTPUT)";
      v22 = v17;
      v23 = 18;
LABEL_37:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    }
  }
  else if (v18)
  {
    v62 = *(_QWORD *)(a1 + 40);
    v63 = *(_QWORD *)(a1 + 48);
    v64 = *(_DWORD *)(a1 + 56);
    v65 = *(_DWORD *)(a1 + 60);
    *(_DWORD *)buf = 136446978;
    *(_QWORD *)&buf[4] = v62;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v64;
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = v63;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v65;
    v21 = "client %{public}s [%d] (via %{public}s [%d]) asked for tailspin output (TAILSPIN_DUMP_OUTPUT)";
    v22 = v17;
    v23 = 34;
    goto LABEL_37;
  }

  *__error() = v15;
  sub_10000A540(*(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 64))
  {
    v66 = *(_QWORD *)(a1 + 40);
    v67 = *(unsigned int *)(a1 + 60);
    v68 = v3;
    v69 = objc_alloc_init(TSPSaveMeasurements);
    -[TSPSaveMeasurements startRecordingTimeForDumpRequestPhase:pid:](v69, "startRecordingTimeForDumpRequestPhase:pid:", v66, v67);
    if (byte_1000164B0)
    {
      v70 = xpc_dictionary_dup_fd(v68, "tailspin_dump_fd");
      v71 = v70;
      if ((v70 & 0x80000000) != 0)
      {
        v114 = *__error();
        v115 = sub_10000407C();
        v116 = objc_claimAutoreleasedReturnValue(v115);
        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = v66;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v67;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v71;
          _os_log_error_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, "Unable to save tailspin for %{public}s [%d]: bad file descriptor %d", buf, 0x18u);
        }

        *__error() = v114;
        v117 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Bad file descriptor %d"), v71);
        -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:](v69, "stopRecordingTimeForDumpRequestPhase:", v117);

        v82 = v68;
        v83 = 6;
      }
      else
      {
        if (fcntl(v70, 3) == 2)
        {
          v72 = sub_1000096AC(v71);
          if (v72 >= 1)
          {
            v73 = v72;
            *(_QWORD *)v198 = 0;
            v196 = sub_100009708(v71, (uint64_t *)v198);
            v74 = *__error();
            v75 = sub_10000407C();
            v76 = objc_claimAutoreleasedReturnValue(v75);
            v77 = os_log_type_enabled(v76, OS_LOG_TYPE_FAULT);
            v78 = *(char **)v198;
            if (v77)
            {
              v171 = "<unknown>";
              if (v196 != -1)
                v171 = *(const char **)v198;
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)&buf[4] = v71;
              *(_WORD *)&buf[8] = 2082;
              *(_QWORD *)&buf[10] = v66;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v67;
              *(_WORD *)&buf[24] = 2048;
              *(_QWORD *)&buf[26] = v73;
              *(_WORD *)&buf[34] = 2080;
              *(_QWORD *)&buf[36] = v171;
              _os_log_fault_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_FAULT, "Detected fd %d from %{public}s [%d] with non-zero file size %lld! Path: %s", buf, 0x2Cu);
            }

            *__error() = v74;
            v79 = objc_alloc((Class)NSString);
            v80 = "<unknown>";
            if (v196 != -1)
              v80 = v78;
            v81 = objc_msgSend(v79, "initWithFormat:", CFSTR("Detected fd %d from %s [%d] with non-zero file size %lld! Path: %s"), v71, v66, v67, v73, v80);
            -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:](v69, "stopRecordingTimeForDumpRequestPhase:", v81);

            -[TSPSaveMeasurements setFileSizeBytes:](v69, "setFileSizeBytes:", v73);
            if (v78)
              free(v78);
            v82 = v68;
            v83 = 25;
            v84 = v69;
            goto LABEL_87;
          }
          v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          objc_msgSend(v138, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, UnsafePointer);
          objc_msgSend(v138, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, UnsafePointer);
          objc_msgSend(v138, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, UnsafePointer);
          objc_msgSend(v138, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, UnsafePointer);
          objc_msgSend(v138, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, UnsafePointer);
          objc_msgSend(v138, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, UnsafePointer);
          v139 = objc_msgSend(v138, "copy");
          length = 0;
          v140 = xpc_dictionary_get_data(v68, "tailspin_dump_options", &length);
          if (v140)
          {
            v141 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v140, length));
            if (v141)
            {
              v142 = (void *)v141;
              v197 = v138;
              v205 = 0;
              v143 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v141, 0, 0, &v205));
              v144 = v205;
              if (v143)
              {

                v139 = (id)v143;
                goto LABEL_114;
              }
              v160 = v139;
              v164 = *__error();
              v165 = sub_10000407C();
              v166 = objc_claimAutoreleasedReturnValue(v165);
              if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
              {
                v195 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "description")));
                v189 = objc_msgSend(v195, "UTF8String");
                *(_DWORD *)buf = 136446722;
                *(_QWORD *)&buf[4] = v66;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v67;
                *(_WORD *)&buf[18] = 2080;
                *(_QWORD *)&buf[20] = v189;
                _os_log_error_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_ERROR, "Unable to save tailspin for %{public}s [%d]: Failed to deserialize dump options due to %s", buf, 0x1Cu);

              }
              *__error() = v164;
              v167 = objc_alloc((Class)NSString);
              v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "description"));
              v169 = objc_msgSend(v167, "initWithFormat:", CFSTR("Failed to deserialize dump options due to %@"), v168);
              -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:](v69, "stopRecordingTimeForDumpRequestPhase:", v169);

              sub_100008910(v68, 9, 0);
              v138 = v197;
            }
            else
            {
              v160 = v139;
              v161 = *__error();
              v162 = sub_10000407C();
              v163 = objc_claimAutoreleasedReturnValue(v162);
              if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
                sub_10000B5F8();

              *__error() = v161;
              -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:](v69, "stopRecordingTimeForDumpRequestPhase:", CFSTR("Can't parse client dump output options"));
              sub_100008910(v68, 8, 0);
            }
            v170 = v160;
            goto LABEL_139;
          }
          v197 = v138;
LABEL_114:
          v145 = v139;
          v146 = mach_absolute_time();
          v147 = qword_100016540;
          v150 = sub_100009BC0(v146 - qword_100016540, v148, v149);
          v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "objectForKeyedSubscript:", UnsafePointer));

          v152 = 0.5;
          v192 = v147;
          v194 = v145;
          if (v151)
          {
            v153 = objc_opt_class(NSNumber);
            if ((objc_opt_isKindOfClass(v151, v153) & 1) != 0)
            {
              objc_msgSend(v151, "doubleValue");
              if (v154 >= 0.0)
              {
                v152 = v154;
              }
              else
              {
                when = v154;
                v155 = *__error();
                v156 = sub_10000407C();
                v157 = objc_claimAutoreleasedReturnValue(v156);
                if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
                  sub_10000B57C(v157, when, v158, v159);

                *__error() = v155;
              }
            }
          }
          sub_10000A568((uint64_t)asc_100016548, v66, v150);
          v172 = *__error();
          v173 = sub_10000407C();
          v174 = objc_claimAutoreleasedReturnValue(v173);
          if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218752;
            *(double *)&buf[4] = v150;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v146;
            *(_WORD *)&buf[22] = 2048;
            *(_QWORD *)&buf[24] = v192;
            *(_WORD *)&buf[32] = 2048;
            *(double *)&buf[34] = v152;
            _os_log_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_DEFAULT, "Duration since trace buffer start: %0.3fs (%llu - %llu), minimum acceptable duration: %.3f", buf, 0x2Au);
          }

          *__error() = v172;
          if (v152 == 0.0)
          {
            v175 = *__error();
            v176 = sub_10000407C();
            v177 = objc_claimAutoreleasedReturnValue(v176);
            if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEFAULT, "Not enforcing minimum acceptable duration since trace buffer start because of client override", buf, 2u);
            }

            *__error() = v175;
          }
          else
          {

            if (v150 < v152)
            {
              v186 = *__error();
              v187 = sub_10000407C();
              v188 = objc_claimAutoreleasedReturnValue(v187);
              if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR))
                sub_10000B51C();

              *__error() = v186;
              -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:](v69, "stopRecordingTimeForDumpRequestPhase:", CFSTR("Resulting trace would be shorter than desired duration"));
              sub_100008910(v68, 10, 0);
              v170 = v194;
              v138 = v197;
              goto LABEL_139;
            }
          }
          v178 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v66));
          whena = dispatch_time(0, 90000000000);
          v179 = qword_1000169D8;
          *(_QWORD *)buf = _NSConcreteStackBlock;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = sub_100009844;
          *(_QWORD *)&buf[24] = &unk_1000108E8;
          v180 = v69;
          *(_QWORD *)&buf[32] = v180;
          *(_QWORD *)&buf[40] = v178;
          *(_DWORD *)&buf[64] = v67;
          *(_DWORD *)&buf[68] = v71;
          *(_QWORD *)&buf[56] = v66;
          v181 = v68;
          *(_QWORD *)&buf[48] = v181;
          v193 = v178;
          dispatch_after(whena, v179, buf);
          atomic_store(-[TSPSaveMeasurements request_id](v180, "request_id"), &dword_1000169F4);
          ondisk_config = tailspin_make_ondisk_config(&qword_100014408, 1);
          v183 = (void *)objc_claimAutoreleasedReturnValue(ondisk_config);
          v184 = qword_1000169D0;
          *(_QWORD *)v198 = _NSConcreteStackBlock;
          v199 = 3221225472;
          v200 = sub_100009AB8;
          v201 = &unk_100010910;
          v204 = v66;
          v202 = v180;
          v203 = v181;
          v185 = v66;
          v170 = v194;
          tailspin_save_trace_with_standard_chunks(v71, v185, v67, v194, v183, v184, v202, v198);

          v138 = v197;
LABEL_139:

          goto LABEL_88;
        }
        v118 = *__error();
        v119 = sub_10000407C();
        v120 = objc_claimAutoreleasedReturnValue(v119);
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = v66;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v67;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v71;
          _os_log_error_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "Unable to save tailspin for %{public}s [%d]: file descriptor is not read-write %d", buf, 0x18u);
        }

        *__error() = v118;
        v121 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("File descriptor is not read-write %d"), v71);
        -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:](v69, "stopRecordingTimeForDumpRequestPhase:", v121);

        v82 = v68;
        v83 = 7;
      }
    }
    else
    {
      v111 = *__error();
      v112 = sub_10000407C();
      v113 = objc_claimAutoreleasedReturnValue(v112);
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        sub_10000B4BC();

      *__error() = v111;
      -[TSPSaveMeasurements stopRecordingTimeForDumpRequestPhase:](v69, "stopRecordingTimeForDumpRequestPhase:", CFSTR("tailspin is disabled"));
      v82 = v68;
      v83 = 2;
    }
    v84 = 0;
LABEL_87:
    sub_100008910(v82, v83, v84);
LABEL_88:

LABEL_108:
    goto LABEL_25;
  }
  v104 = *__error();
  v105 = sub_10000407C();
  v106 = objc_claimAutoreleasedReturnValue(v105);
  if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    sub_10000B45C();

  *__error() = v104;
  sub_100008910(v3, 3, 0);
LABEL_25:

}

void sub_100008910(void *a1, int a2, void *a3)
{
  id v5;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  void *context;
  int v10;
  id v11;
  NSObject *v12;
  xpc_object_t xdict;

  xdict = a1;
  v5 = a3;
  remote_connection = xpc_dictionary_get_remote_connection(xdict);
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  if (!v7)
    sub_10000AEE8();
  v8 = v7;
  context = xpc_connection_get_context(v7);
  sub_10000A550((uint64_t)context + 32, a2, v5);
  sub_1000089E0(xdict, a2 == 0);
  if ((a2 - 25) <= 1)
  {
    v10 = *__error();
    v11 = sub_10000407C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10000B7C0();

    *__error() = v10;
    exit(-1);
  }

}

void sub_1000089E0(void *a1, BOOL a2)
{
  xpc_object_t reply;
  void *v4;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  xpc_object_t xdict;

  xdict = a1;
  reply = xpc_dictionary_create_reply(xdict);
  if (!reply)
    sub_10000AEE8();
  v4 = reply;
  xpc_dictionary_set_BOOL(reply, "tailspin_succeeded", a2);
  remote_connection = xpc_dictionary_get_remote_connection(xdict);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  if (!v6)
    sub_10000AEE8();
  v7 = v6;
  xpc_connection_send_message(v6, v4);

}

void sub_100008A58(id a1)
{
  int v1;
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *__error();
  v2 = sub_10000407C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "server has been SIGTERMed", v4, 2u);
  }

  *__error() = v1;
  sub_100006520((uint64_t)"exiting for SIGTERM");
  exit(0);
}

void sub_100008AD0(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  int v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  OS_xpc_object *v9;
  uint8_t buf[16];

  v2 = a2;
  if (xpc_activity_get_state(v2) == 2)
  {
    v3 = *__error();
    v4 = sub_10000407C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "com.apple.tailspin.cleanup invoked", buf, 2u);
    }

    *__error() = v3;
    v6 = sub_100008BBC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008BFC;
    block[3] = &unk_100010878;
    v9 = v2;
    dispatch_sync(v7, block);

  }
}

id sub_100008BBC()
{
  if (qword_100016A08 != -1)
    dispatch_once(&qword_100016A08, &stru_100010950);
  return (id)qword_100016A10;
}

void sub_100008BFC(uint64_t a1)
{
  if (!xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
    sub_100008C24(0);
}

void sub_100008C24(int a1)
{
  void *v1;
  int v2;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  int v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  char v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  NSObject *v33;
  int v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  BOOL v40;
  int v41;
  id v42;
  NSObject *v43;
  void *v44;
  double v45;
  int v46;
  id v47;
  NSObject *v48;
  unsigned int v49;
  id v50;
  void *v51;
  BOOL v52;
  int v53;
  id v54;
  NSObject *v55;
  id v56;
  id v57;
  id v58;
  NSObject *v59;
  NSObject *v60;
  int v61;
  id v62;
  NSObject *v63;
  id v64;
  NSObject *v65;
  const char *v66;
  id v67;
  uint32_t v68;
  id v69;
  int v70;
  id v71;
  NSObject *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  unint64_t v77;
  void *v78;
  id obj;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[5];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  _BYTE v96[128];
  _BYTE v97[128];

  v1 = objc_autoreleasePoolPush();
  v2 = *__error();
  v3 = sub_10000407C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Trying tailspin_server_cleanup_force_reset_tailspins()", buf, 2u);
  }

  *__error() = v2;
  v5 = sub_100008BBC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v91 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins"), &v91));
  v9 = v91;
  v10 = v9;
  if (!v8 || v9)
  {
    v70 = *__error();
    v71 = sub_10000407C();
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      sub_10000B7EC((uint64_t)v10, v72, v73);

    *__error() = v70;
  }
  else
  {
    v78 = v7;
    v75 = v1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v74 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v88 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pathExtension"));
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("tailspin"));

          if ((v19 & 1) != 0)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins"), "stringByAppendingPathComponent:", v17));
            objc_msgSend(v11, "addObject:", v20);

          }
          else
          {
            v21 = *__error();
            v22 = sub_10000407C();
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v93 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "WARNING: Some file that is not a tailspin is in our folder. We will not delete this: %@", buf, 0xCu);
            }

            *__error() = v21;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
      }
      while (v14);
    }

    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_100009CAC;
    v86[3] = &unk_100010978;
    v86[4] = v7;
    objc_msgSend(v11, "sortUsingComparator:", v86);
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    obj = v11;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v77 = 0;
      v27 = 0;
      v28 = *(_QWORD *)v83;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v83 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)v29);
          if (v27 >= 3)
          {
            v31 = *__error();
            v32 = sub_10000407C();
            v33 = objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              v93 = v30;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Removing %{public}@ due to exceeding max number of tailspins", buf, 0xCu);
            }

            *__error() = v31;
            goto LABEL_44;
          }
          if ((v26 & 1) != 0)
          {
            v34 = *__error();
            v35 = sub_10000407C();
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              v93 = v30;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Removing %{public}@ due to exceeding max age of tailspins", buf, 0xCu);
            }

            *__error() = v34;
            v26 = 1;
            goto LABEL_44;
          }
          v81 = 0;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributesOfItemAtPath:error:", v30, &v81));
          v38 = v81;
          v39 = v38;
          if (v37)
            v40 = v38 == 0;
          else
            v40 = 0;
          if (!v40)
          {
            v41 = *__error();
            v42 = sub_10000407C();
            v43 = objc_claimAutoreleasedReturnValue(v42);
            if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              goto LABEL_35;
            *(_DWORD *)buf = 138543618;
            v93 = v30;
            v94 = 2114;
            v95 = v39;
            v65 = v43;
            v66 = "Unable to get attributes of %{public}@ : %{public}@";
            v68 = 22;
LABEL_73:
            _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, v66, buf, v68);
LABEL_35:

LABEL_36:
            v26 = 0;
            *__error() = v41;
LABEL_43:

            v7 = v78;
LABEL_44:
            v80 = 0;
            v49 = objc_msgSend(v7, "removeItemAtPath:error:", v30, &v80);
            v50 = v80;
            v51 = v50;
            if (v49)
              v52 = v50 == 0;
            else
              v52 = 0;
            if (!v52)
            {
              v53 = *__error();
              v54 = sub_10000407C();
              v55 = objc_claimAutoreleasedReturnValue(v54);
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v93 = v30;
                v94 = 2114;
                v95 = v51;
                _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Unable to remove %{public}@ : %{public}@", buf, 0x16u);
              }

              *__error() = v53;
            }

            goto LABEL_52;
          }
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "fileCreationDate"));
          if (!v44)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "fileModificationDate"));
            if (!v44)
            {
              v41 = *__error();
              v67 = sub_10000407C();
              v43 = objc_claimAutoreleasedReturnValue(v67);
              if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                goto LABEL_35;
              *(_DWORD *)buf = 138543362;
              v93 = v30;
              v65 = v43;
              v66 = "Unable to get file date for %{public}@";
LABEL_68:
              v68 = 12;
              goto LABEL_73;
            }
          }
          objc_msgSend(v44, "timeIntervalSinceNow");
          if (v45 < -2592000.0)
          {
            v46 = *__error();
            v47 = sub_10000407C();
            v48 = objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              v93 = v30;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Removing %{public}@ due to exceeding max age of tailspins", buf, 0xCu);
            }

            *__error() = v46;
            v26 = 1;
            goto LABEL_43;
          }

          v56 = objc_msgSend(v37, "fileSize");
          if (!v56)
          {
            v41 = *__error();
            v64 = sub_10000407C();
            v43 = objc_claimAutoreleasedReturnValue(v64);
            if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              goto LABEL_35;
            *(_DWORD *)buf = 138543362;
            v93 = v30;
            v65 = v43;
            v66 = "Unable to get file size for %{public}@";
            goto LABEL_68;
          }
          v57 = v56;
          v77 += (unint64_t)v56;
          if (v77 >= 0xAF00001)
          {
            v41 = *__error();
            v58 = sub_10000407C();
            v59 = objc_claimAutoreleasedReturnValue(v58);
            v60 = v59;
            if (!a1 || v27 >= 1)
            {
              if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v93 = v30;
                _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Removing %{public}@ due to exceeding max size of tailspins", buf, 0xCu);
              }

              goto LABEL_36;
            }
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v93 = v30;
              v94 = 2048;
              v95 = v57;
              _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "Not removing most recent tailspin %{public}@ that exceeds max size: %llu", buf, 0x16u);
            }

            *__error() = v41;
          }

          v61 = *__error();
          v62 = sub_10000407C();
          v63 = objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v93 = v30;
            _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "Not removing %{public}@", buf, 0xCu);
          }

          v26 = 0;
          *__error() = v61;
          ++v27;
          v7 = v78;
LABEL_52:
          v29 = (char *)v29 + 1;
        }
        while (v25 != v29);
        v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
        v25 = v69;
      }
      while (v69);
    }

    v8 = v74;
    v1 = v75;
    v10 = 0;
  }

  objc_autoreleasePoolPop(v1);
}

void sub_100009520(id a1)
{
  dispatch_mig_server(qword_1000169E8, 36, sub_10000A7A8);
}

void sub_100009538(uint64_t a1, int a2)
{
  int v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v19;
  uint8_t buf[4];
  uint64_t v21;

  if (a2)
  {
    v3 = *__error();
    v4 = sub_10000407C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10000B868(a1, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    fcntl(*(_DWORD *)(a1 + 48), 51);
    v3 = *__error();
    v12 = sub_10000407C();
    v5 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Saved tailspin output for reset to file '%{public}@'", buf, 0xCu);
    }
  }

  *__error() = v3;
  v14 = (void *)os_transaction_create("com.apple.tailspin.cleanup");
  v15 = sub_100008BBC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000096A4;
  block[3] = &unk_100010878;
  v19 = v14;
  v17 = v14;
  dispatch_async(v16, block);

}

void sub_1000096A4()
{
  sub_100008C24(1);
}

off_t sub_1000096AC(int a1)
{
  off_t v2;
  off_t v3;

  v2 = lseek(a1, 0, 1);
  v3 = lseek(a1, 0, 2);
  lseek(a1, v2, 0);
  return v3;
}

uint64_t sub_100009708(uint64_t a1, uint64_t *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  uint64_t v15;

  v4 = malloc_type_calloc(1uLL, 0x400uLL, 0x75783066uLL);
  *a2 = (uint64_t)v4;
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = fcntl(a1, 50, v4);
  v6 = *__error();
  v7 = sub_10000407C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if ((_DWORD)v5 == -1)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000B8D0(a1, v9);
    v5 = 0xFFFFFFFFLL;
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *a2;
    *(_DWORD *)buf = 67109378;
    v13 = a1;
    v14 = 2080;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received request for fd %d, path: %s", buf, 0x12u);
  }

  *__error() = v6;
  return v5;
}

int *sub_100009844(uint64_t a1)
{
  signed int v2;
  int v3;
  int v4;
  id v5;
  NSObject *v6;
  int *result;
  int v8;
  off_t v9;
  int v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  id v19;
  id v20;
  const char *v21;
  id v22;
  int v23;
  id v24;
  NSObject *v25;
  const char *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  __int16 v33;
  int v34;
  __int16 v35;
  off_t v36;
  __int16 v37;
  const char *v38;

  v2 = atomic_load(&dword_1000169F4);
  v3 = v2;
  if (v2 != -1 && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "request_id") >= v2)
  {
    v26 = 0;
    v8 = sub_100009708(*(unsigned int *)(a1 + 68), (uint64_t *)&v26);
    v9 = sub_1000096AC(*(_DWORD *)(a1 + 68));
    v10 = *__error();
    v11 = sub_10000407C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_DWORD *)(a1 + 64);
      v15 = objc_msgSend(*(id *)(a1 + 32), "request_id");
      v16 = (uint64_t)v26;
      if (v8 == -1)
        v17 = "<unknown>";
      else
        v17 = v26;
      *(_DWORD *)buf = 136447490;
      v28 = v13;
      v29 = 1024;
      v30 = v14;
      v31 = 2048;
      v32 = v15;
      v33 = 1024;
      v34 = 90;
      v35 = 2048;
      v36 = v9;
      v37 = 2080;
      v38 = v17;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Save from %{public}s [%d] (request ID %llu) exceeded %ds timeout! Size: %lld, Path: %s", buf, 0x36u);
    }
    else
    {
      v16 = (uint64_t)v26;
    }

    *__error() = v10;
    v18 = *(void **)(a1 + 32);
    v19 = objc_alloc((Class)NSString);
    v20 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    if (v8 == -1)
      v21 = "<unknown>";
    else
      v21 = (const char *)v16;
    v22 = objc_msgSend(v19, "initWithFormat:", CFSTR("Save from %s [%d] exceeded %ds timeout! Size: %lld, Path: %s"), v20, *(unsigned int *)(a1 + 64), 90, v9, v21);
    objc_msgSend(v18, "stopRecordingTimeForDumpRequestPhase:", v22);

    objc_msgSend(*(id *)(a1 + 32), "setFileSizeBytes:", v9);
    sub_100008910(*(void **)(a1 + 48), 27, *(void **)(a1 + 32));
    v23 = *__error();
    v24 = sub_10000407C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_10000B7C0();

    *__error() = v23;
    exit(-1);
  }
  v4 = *__error();
  v5 = sub_10000407C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10000B94C(a1, v3, v6);

  result = __error();
  *result = v4;
  return result;
}

void sub_100009AB8(uint64_t a1, int a2)
{
  int v4;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;

  if (!a2)
  {
    v10 = 8;
    v11 = 0;
    v4 = sysctlbyname("kern.kdbg.oldest_time", &v11, &v10, 0, 0);
    v5 = *__error();
    v6 = sub_10000407C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (v4 < 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10000BA24(v8);

      *__error() = v5;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        sub_10000BA9C((uint64_t *)&v11, v8);

      *__error() = v5;
      v9 = v11;
      if (v11)
        goto LABEL_11;
    }
    v9 = mach_absolute_time();
LABEL_11:
    sub_100006418(v9, *(const char **)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 32), "stopRecordingTimeForDumpRequestPhase:", 0);
  sub_100008910(*(void **)(a1 + 40), a2, *(void **)(a1 + 32));
  atomic_store(0xFFFFFFFF, &dword_1000169F4);
}

double sub_100009BC0(unint64_t a1, double a2, double a3)
{
  if (qword_100016A00 != -1)
    dispatch_once(&qword_100016A00, &stru_100010930);
  LODWORD(a3) = dword_1000169F8;
  return (double)*(unint64_t *)&a3
       / (double)(1000000000 * (unint64_t)dword_1000169FC)
       * (double)a1;
}

void sub_100009C34(id a1)
{
  if (mach_timebase_info((mach_timebase_info_t)&dword_1000169F8))
    sub_10000AEE8();
}

void sub_100009C58(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)5u, 0);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.apple.tailspin.cleanup", v4);
  v3 = (void *)qword_100016A10;
  qword_100016A10 = (uint64_t)v2;

}

id sub_100009CAC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  int v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  NSObject *v25;
  int v26;
  id v27;
  NSObject *v28;
  int v29;
  id v30;
  NSObject *v31;
  id v33;
  id v34;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v34 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributesOfItemAtPath:error:", v5, &v34));
  v9 = v34;
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 0;
  if (v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NSFileCreationDate));
    if (v16)
    {
      v17 = *(void **)(a1 + 32);
      v33 = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attributesOfItemAtPath:error:", v6, &v33));
      v19 = v33;
      v20 = v19;
      if (!v18 || v19)
      {
        v26 = *__error();
        v27 = sub_10000407C();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_10000BB4C();

        v15 = 0;
        *__error() = v26;
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", NSFileCreationDate));
        v22 = v21;
        if (v21)
        {
          v15 = objc_msgSend(v21, "compare:", v16);
        }
        else
        {
          v29 = *__error();
          v30 = sub_10000407C();
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            sub_10000BBB4();

          v15 = 0;
          *__error() = v29;
        }

      }
    }
    else
    {
      v23 = *__error();
      v24 = sub_10000407C();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_10000BBB4();

      v15 = 0;
      *__error() = v23;
    }

  }
  else
  {
    v12 = *__error();
    v13 = sub_10000407C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10000BB4C();

    v15 = 0;
    *__error() = v12;
  }

  return v15;
}

void sub_100009EF8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100009F08(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100009F18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_100009F24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100009F30(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100009F4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_100009F58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_100009F64()
{
  return _os_assert_log(0);
}

void sub_10000A014(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

int *sub_10000A028()
{
  return __error();
}

void sub_10000A030(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_10000A040(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x14u);
}

void sub_10000A0A4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

int *sub_10000A0B4()
{
  return __error();
}

void sub_10000A0C8(void *a1, uint64_t a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  _QWORD v6[4];
  __CFString *v7;

  v3 = a1;
  if (a2)
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
  else
    v4 = CFSTR("Unknown");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000A16C;
  v6[3] = &unk_1000109A0;
  v7 = v4;
  v5 = v4;
  AnalyticsSendEventLazy(v3, v6);

}

id sub_10000A16C(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("Execname");
  v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

void sub_10000A1DC(void *a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  id v8;
  __CFString *v9;
  id v10;
  __CFString *v11;
  _QWORD v12[4];
  __CFString *v13;
  id v14;
  int v15;

  v7 = a1;
  v8 = a4;
  if (a2)
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
  else
    v9 = CFSTR("Unknown");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000A2B4;
  v12[3] = &unk_1000109C8;
  v15 = a3;
  v13 = v9;
  v14 = v8;
  v10 = v8;
  v11 = v9;
  AnalyticsSendEventLazy(v7, v12);

}

id sub_10000A2B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[2];
  _QWORD v29[2];

  v1 = a1;
  v2 = *(_QWORD *)(a1 + 32);
  v28[1] = CFSTR("SaveResultEnum");
  v29[0] = v2;
  v28[0] = CFSTR("ExecName");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  v29[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

  v6 = *(void **)(v1 + 40);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v6, "fileSizeBytes")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("FileSize"));

    objc_msgSend(*(id *)(v1 + 40), "tailspinDurationSecs");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("TailspinDuration"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 40), "timeSpentByPhases"));
    if (v9)
    {
      v10 = v5;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 40), "timeSpentByPhases"));
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Duration_%@"), v15));
            if (v16)
            {
              v17 = v1;
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 40), "timeSpentByPhases"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v15));
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v16);

              v1 = v17;
            }

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v12);
      }

      v5 = v10;
    }
  }
  v20 = objc_msgSend(v5, "copy");

  return v20;
}

void sub_10000A540(uint64_t a1)
{
  sub_10000A0C8(CFSTR("com.apple.tailspind.saverequest.v1"), a1);
}

void sub_10000A550(uint64_t a1, int a2, void *a3)
{
  sub_10000A1DC(CFSTR("com.apple.tailspind.saveresult.v2"), a1, a2, a3);
}

void sub_10000A568(uint64_t a1, uint64_t a2, double a3)
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  _QWORD v9[4];
  __CFString *v10;
  __CFString *v11;
  double v12;

  if (!a1)
  {
    v5 = CFSTR("Unknown");
    if (a2)
      goto LABEL_3;
LABEL_5:
    v6 = CFSTR("Unknown");
    goto LABEL_6;
  }
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  if (!a2)
    goto LABEL_5;
LABEL_3:
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
LABEL_6:
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A654;
  v9[3] = &unk_1000109F0;
  v10 = v5;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  v8 = v5;
  AnalyticsSendEventLazy(CFSTR("com.apple.tailspind.durationsincetracebufferstart.v1"), v9);

}

id sub_10000A654(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[3];

  v5[0] = CFSTR("TraceBufferStartEventName");
  v5[1] = CFSTR("SaveExecname");
  v1 = *(_QWORD *)(a1 + 40);
  v6[0] = *(_QWORD *)(a1 + 32);
  v6[1] = v1;
  v5[2] = CFSTR("DurationSinceTraceBufferStartSec");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  v6[2] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 3));

  return v3;
}

void sub_10000A710(uint64_t a1)
{
  sub_10000A0C8(CFSTR("com.apple.tailspin.saverequest.v1"), a1);
}

void sub_10000A720(uint64_t a1, int a2)
{
  sub_10000A1DC(CFSTR("com.apple.tailspin.saveresult.v1"), a1, a2, 0);
}

_DWORD *(*sub_10000A738(uint64_t a1))(_DWORD *result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 670)
    return sub_10000A750;
  else
    return 0;
}

_DWORD *sub_10000A750(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_100005AF4();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

uint64_t sub_10000A7A8(_DWORD *a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_QWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (a1[5] == 670)
  {
    if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
    {
      *(_DWORD *)(a2 + 32) = -304;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
    }
    else
    {
      *(_DWORD *)(a2 + 32) = sub_100005AF4();
    }
    return 1;
  }
  else
  {
    result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_10000A854()
{
  __assert_rtn("-[TSPSaveMeasurements _stopRecordingTimeForPhase:]", "TSPSaveMeasurements.m", 211, "startTime != nil");
}

void sub_10000A87C()
{
  uint64_t v0;

  v0 = _os_assert_log(0);
  _os_crash(v0);
  __break(1u);
}

void sub_10000A894(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009F08((void *)&_mh_execute_header, a2, a3, "Current system config = \n%{public}s", a5, a6, a7, a8, 2u);
  sub_100009EF0();
}

void sub_10000A8FC(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[8];

  sub_10000A028();
  sub_10000A0BC();
  sub_100009F18((void *)&_mh_execute_header, a1, v2, "unable to get config typefilter: %{errno}d", v3);
  sub_100009EF0();
}

void sub_10000A974()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;
  int v4;

  sub_100009FB0();
  sub_10000A014((void *)&_mh_execute_header, v0, v1, "action %u's samplers = %llu != %u = tailspin_fss_samplers", v2, v3, v4);
  sub_100009EF0();
}

void sub_10000A9DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009FF4();
  sub_10000A040((void *)&_mh_execute_header, v0, v1, "timer %u's action id = %u != %u = tailspin_oncore_action_id", v2, v3, v4, v5, v6);
  sub_100009EF0();
}

void sub_10000AA48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009FD4();
  sub_10000A030((void *)&_mh_execute_header, v0, v1, "timer %u's period = %llu != %llu = tailspin_oncore_timer_period", v2, v3, v4, v5, v6);
  sub_100009F84();
}

void sub_10000AAB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009F78();
  sub_100009EF8((void *)&_mh_execute_header, v0, v1, "FSS timer LWP mode isn't enabled", v2, v3, v4, v5, v6);
  sub_100009F44();
}

void sub_10000AAE4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;
  int v4;

  sub_100009FB0();
  sub_10000A014((void *)&_mh_execute_header, v0, v1, "action %u's samplers = %llu != %u = tailspin_fss_samplers", v2, v3, v4);
  sub_100009EF0();
}

void sub_10000AB4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009FF4();
  sub_10000A040((void *)&_mh_execute_header, v0, v1, "timer %u's action id = %u != %u = tailspin_fss_action_id", v2, v3, v4, v5, v6);
  sub_100009EF0();
}

void sub_10000ABB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009FD4();
  sub_10000A030((void *)&_mh_execute_header, v0, v1, "timer %u's period = %llu != %llu = tailspin_fss_timer_period", v2, v3, v4, v5, v6);
  sub_100009F84();
}

void sub_10000AC28()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_10000A098();
  sub_100009F18((void *)&_mh_execute_header, v0, v1, "tailspin_typefilter contains %#x but system typefilter doesn't", v2);
  sub_100009F44();
}

void sub_10000AC8C()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;

  sub_100009FA4();
  v4 = 2048;
  v5 = v0;
  sub_100009F58((void *)&_mh_execute_header, v1, v2, "actual_buf_size = %llu != %zu = tailspin_buf_size", v3);
  sub_100009EF0();
}

void sub_10000AD04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009F78();
  sub_100009EF8((void *)&_mh_execute_header, v0, v1, "Unable to enact state", v2, v3, v4, v5, v6);
  sub_100009F44();
}

void sub_10000AD30()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[12];
  __int16 v3;
  const char *v4;

  sub_100009FA4();
  v3 = 2082;
  v4 = "/var/db/tailspin_config.plist";
  sub_100009F58((void *)&_mh_execute_header, v0, v1, "Unable to write config property list %@ to '%{public}s'", v2);
  sub_100009EF0();
}

void sub_10000ADA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009F78();
  sub_100009EF8((void *)&_mh_execute_header, v0, v1, "Unable to enact kdbg state after ktrace bg notification!", v2, v3, v4, v5, v6);
  sub_100009F44();
}

void sub_10000ADD4()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100009F78();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Received a ktrace background notification", v1, 2u);
  sub_100009F44();
}

void sub_10000AE0C(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[8];

  sub_10000A028();
  sub_10000A0BC();
  sub_100009F18((void *)&_mh_execute_header, a1, v2, "Unable to reset existing ktrace: %{errno}d", v3);
  sub_100009EF0();
}

void sub_10000AE84()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_10000A098();
  sub_100009F18((void *)&_mh_execute_header, v0, v1, "Unable to configure ktrace, failure with ret %{errno}d", v2);
  sub_100009F44();
}

void sub_10000AEE8()
{
  uint64_t v0;

  v0 = sub_100009F64();
  _os_crash(v0);
  __break(1u);
}

void sub_10000AEFC(uint64_t a1, NSObject *a2)
{
  int *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = sub_10000A0B4();
  strerror(*v3);
  sub_10000A080();
  sub_100009F4C((void *)&_mh_execute_header, a2, v4, "Failed to configure kperf sampling (line %u): %s", v5);
  sub_100009F6C();
}

void sub_10000AF78(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[8];

  sub_10000A028();
  sub_10000A0BC();
  sub_100009F18((void *)&_mh_execute_header, a1, v2, "sysctl(KERN_KDREMOVE) failed: %{errno}d", v3);
  sub_100009EF0();
}

void sub_10000AFF0(int a1, NSObject *a2)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;

  v4 = *sub_10000A0B4();
  v5[0] = 67109376;
  v5[1] = a1;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "sysctlbyname(ktrace.init_background): ret %d, %d errno", (uint8_t *)v5, 0xEu);
  sub_100009F6C();
}

void sub_10000B080()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009F78();
  sub_100009EF8((void *)&_mh_execute_header, v0, v1, "Unable check as background tool", v2, v3, v4, v5, v6);
  sub_100009F44();
}

void sub_10000B0AC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_10000A098();
  sub_100009F18((void *)&_mh_execute_header, v0, v1, "Unable check in with bootstrap port (%#x)", v2);
  sub_100009F44();
}

void sub_10000B110()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_10000A098();
  sub_100009F18((void *)&_mh_execute_header, v0, v1, "Unable to get the bootstrap port (%#x)", v2);
  sub_100009F44();
}

void sub_10000B174(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  sub_100004108(2082, "Unknown message: %s : %s", a3, a4, a5, a6, a7, a8, a1);
  v8 = sub_100009F64();
  _os_crash(v8);
  __break(1u);
}

void sub_10000B1A0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_10000A098();
  sub_100009F18((void *)&_mh_execute_header, v0, v1, "Unable to save tailspin for reset: bad file descriptor %{public}d", v2);
  sub_100009F44();
}

void sub_10000B204()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009FA4();
  sub_100009F08((void *)&_mh_execute_header, v0, v1, "Unable to save tailspin for reset: error creating directory: %{public}@", v2, v3, v4, v5, v6);
  sub_100009EF0();
}

void sub_10000B264(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009F08((void *)&_mh_execute_header, a1, a3, "%@ exists but is not a directory", a5, a6, a7, a8, 2u);
  sub_100009EF0();
}

void sub_10000B2D4(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;

  v2 = 138543874;
  v3 = CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins");
  v4 = 2114;
  v5 = CFSTR("mobile");
  v6 = 2114;
  v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to update owner for directory at %{public}@ to %{public}@: %{public}@", (uint8_t *)&v2, 0x20u);
  sub_100009F84();
}

void sub_10000B368(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  xpc_dictionary_get_string(a1, _xpc_error_key_description);
  sub_100009FA4();
  sub_100009F24((void *)&_mh_execute_header, a2, v3, "Server received %s", v4);
  sub_100009F6C();
}

void sub_10000B3E8(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  xpc_get_type(a1);
  sub_100009FA4();
  sub_100009F24((void *)&_mh_execute_header, a2, v3, "main connection received unknown event of type %p", v4);
  sub_100009F6C();
}

void sub_10000B45C()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  sub_10000A0A4(__stack_chk_guard);
  sub_100009F8C();
  sub_100009F30((void *)&_mh_execute_header, v0, v1, "client %s [%d] does not bear entitlement \"com.apple.tailspin.dump-output\"; refusing TAILSPIN_DUMP_OUTPUT command",
    v2,
    v3);
  sub_100009EF0();
}

void sub_10000B4BC()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000A068();
  sub_100009F30((void *)&_mh_execute_header, v0, v1, "Unable to save tailspin for %{public}s [%d]: tailspin currently disabled");
  sub_100009EF0();
}

void sub_10000B51C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009FA4();
  sub_100009F08((void *)&_mh_execute_header, v0, v1, "Unable to save tailspin for %{public}s: resulting trace would be shorter than desired duration", v2, v3, v4, v5, v6);
  sub_100009EF0();
}

void sub_10000B57C(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  __int16 v6;
  uint64_t v7;

  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = 0x3FE0000000000000;
  sub_100009F58((void *)&_mh_execute_header, a1, a4, "Invalid value for TSPDumpOptions_MinTraceBufferDurationSec: %f, using default: %f", (uint8_t *)&v4);
  sub_100009EF0();
}

void sub_10000B5F8()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000A068();
  sub_100009F30((void *)&_mh_execute_header, v0, v1, "Unable to save tailspin for %{public}s [%d]: Can't parse client dump output options");
  sub_100009EF0();
}

void sub_10000B658()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  sub_10000A0A4(__stack_chk_guard);
  sub_100009F8C();
  sub_100009F30((void *)&_mh_execute_header, v0, v1, "client %s [%d] does not bear entitlement \"com.apple.tailspin.config-apply\"; refusing TAILSPIN_APPLY_CONFIG command",
    v2,
    v3);
  sub_100009EF0();
}

void sub_10000B6B8(int a1, char a2)
{
  uint64_t v2;

  v2 = _os_assert_log((a1 == 2) | (a2 & 1));
  _os_crash(v2);
  __break(1u);
}

void sub_10000B6DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009F78();
  sub_100009EF8((void *)&_mh_execute_header, v0, v1, "tailspin server state could not be enacted immediately", v2, v3, v4, v5, v6);
  sub_100009F44();
}

void sub_10000B708()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009F78();
  sub_100009EF8((void *)&_mh_execute_header, v0, v1, "Received a request to apply a config when a profile is installed or when tasking is present - rejecting request", v2, v3, v4, v5, v6);
  sub_100009F44();
}

void sub_10000B734()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009F78();
  sub_100009EF8((void *)&_mh_execute_header, v0, v1, "Received a request to apply default config when tasking is currently enabled - rejecting request", v2, v3, v4, v5, v6);
  sub_100009F44();
}

void sub_10000B760()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000A0A4(__stack_chk_guard);
  sub_100009F8C();
  sub_100009F30((void *)&_mh_execute_header, v0, v1, "client %{public}s [%d] received unknown request type");
  sub_100009EF0();
}

void sub_10000B7C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009F78();
  sub_100009EF8((void *)&_mh_execute_header, v0, v1, "tailspind exiting to avoid bad state in 129116852", v2, v3, v4, v5, v6);
  sub_100009F44();
}

void sub_10000B7EC(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138543618;
  v4 = CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins");
  v5 = 2114;
  v6 = a1;
  sub_100009F58((void *)&_mh_execute_header, a2, a3, "Unable to get directory contents of %{public}@ : %{public}@", (uint8_t *)&v3);
  sub_100009EF0();
}

void sub_10000B868(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009F08((void *)&_mh_execute_header, a2, a3, "Unable to save tailspin data for reset to file '%{public}@'", a5, a6, a7, a8, 2u);
  sub_100009EF0();
}

void sub_10000B8D0(uint64_t a1, NSObject *a2)
{
  int *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = sub_10000A0B4();
  strerror(*v3);
  sub_10000A080();
  sub_100009F4C((void *)&_mh_execute_header, a2, v4, "Failed to get file path for fd %d: %{errno}s", v5);
  sub_100009F6C();
}

void sub_10000B94C(uint64_t a1, int a2, NSObject *a3)
{
  id v6;
  int v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;

  v6 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
  v7 = *(_DWORD *)(a1 + 64);
  v8 = objc_msgSend(*(id *)(a1 + 32), "request_id");
  v9 = 136446978;
  v10 = v6;
  v11 = 1024;
  v12 = v7;
  v13 = 2048;
  v14 = v8;
  v15 = 1024;
  v16 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "tailspin request for %{public}s [%d] (request ID: %llu) successfully completed before timeout (val = %d).", (uint8_t *)&v9, 0x22u);
}

void sub_10000BA24(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[8];

  sub_10000A028();
  sub_10000A0BC();
  sub_100009F18((void *)&_mh_execute_header, a1, v2, "Unable to get oldest kdebug time: %{errno}d", v3);
  sub_100009EF0();
}

void sub_10000BA9C(uint64_t *a1, NSObject *a2)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  double v12;

  v4 = *a1;
  v5 = mach_absolute_time();
  v8 = sub_100009BC0(v5 - *a1, v6, v7);
  v9 = 134218240;
  v10 = v4;
  v11 = 2048;
  v12 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Successfully got oldest kdebug time (%llu, %.2fs ago)", (uint8_t *)&v9, 0x16u);
}

void sub_10000BB4C()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_10000A050();
  sub_100009F58((void *)&_mh_execute_header, v0, (uint64_t)v0, "Error getting attrs of file: %{public}@ err: %{public}@", v1);
  sub_100009EF0();
}

void sub_10000BBB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100009FA4();
  sub_100009F08((void *)&_mh_execute_header, v0, v1, "No creation date of file: %{public}@", v2, v3, v4, v5, v6);
  sub_100009EF0();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__startRecordingTimeForPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startRecordingTimeForPhase:");
}

id objc_msgSend__stopRecordingTimeForPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopRecordingTimeForPhase:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileCreationDate");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileModificationDate");
}

id objc_msgSend_fileOwnerAccountName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileOwnerAccountName");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileSizeBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSizeBytes");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_request_id(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request_id");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setFileSizeBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileSizeBytes:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_startRecordingTimeForDumpRequestPhase_pid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRecordingTimeForDumpRequestPhase:pid:");
}

id objc_msgSend_stopRecordingTimeForDumpRequestPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopRecordingTimeForDumpRequestPhase:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_tailspinDurationSecs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tailspinDurationSecs");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeSpentByPhases(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeSpentByPhases");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}
