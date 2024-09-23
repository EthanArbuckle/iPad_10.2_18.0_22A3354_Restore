uint64_t start(int a1, char *const *a2)
{
  int v4;
  char *v5;
  int v6;
  int v7;
  char *v8;
  passwd *v9;
  char *v10;
  uid_t pw_uid;
  char v12;
  int v13;
  group *v14;
  char *v15;
  gid_t gr_gid;
  char v17;
  int v18;
  char *v19;
  unint64_t v20;
  FILE *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  FILE *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  int v37;
  unint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  size_t v42;
  size_t v43;
  char *v44;
  uint64_t v45;
  char v46;
  char v47;
  char v48;
  const char *v49;
  const char *v50;
  int v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *const *v55;
  const char **v56;
  const char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  int v67;
  uint64_t v68;
  stat v69;
  char *__endptr;
  uint8_t buf[4];
  int v72;
  int v73;
  __int128 v74;
  int v75;
  char v76[1024];
  char v77[1024];
  char v78[64];
  int v79;
  uid_t st_uid;
  gid_t st_gid;
  unsigned __int16 v82;

  memset(&v69, 0, sizeof(v69));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_1000038F8();
  bzero(&v73, 0x8A8uLL);
  v4 = 0;
  v5 = 0;
  v68 = 0;
  v6 = 0;
  v75 = 16;
  v74 = xmmword_100003A90;
  do
LABEL_4:
    v7 = getopt(a1, a2, "dg:m:no:u:v");
  while (v7 == 118);
  switch(v7)
  {
    case 'd':
      v73 = 1024;
      goto LABEL_4;
    case 'e':
    case 'f':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
      goto LABEL_30;
    case 'g':
      v8 = optarg;
      v14 = getgrnam(optarg);
      v15 = v8;
      if (v14)
      {
        gr_gid = v14->gr_gid;
      }
      else
      {
        do
        {
          v18 = *v15++;
          v17 = v18;
        }
        while ((v18 - 48) < 0xA);
        if (v17)
          goto LABEL_128;
        gr_gid = strtol(v8, 0, 10);
      }
      st_gid = gr_gid;
      v4 = 1;
      goto LABEL_4;
    case 'm':
      v19 = optarg;
      __endptr = 0;
      if ((*optarg & 0xF8) != 0x30 || (v20 = strtol(optarg, &__endptr, 8), v20 >> 31) || *__endptr)
        errx(64, "invalid file mode: %s", v19);
      v82 = v20;
      HIDWORD(v68) = 1;
      goto LABEL_4;
    case 'n':
      LODWORD(v68) = 1;
      goto LABEL_4;
    case 'o':
      v5 = optarg;
      if (optarg && *optarg != 63)
        goto LABEL_4;
      v21 = __stderrp;
      v22 = getprogname();
      fprintf(v21, "usage: %s [-d] [-g <gid>] [-m <mask>] [-o options] [-u <uid>] [-v] <mount_from_location> <mount_on_location>\n", v22);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000038B8();
      return 64;
    default:
      if (v7 != -1)
      {
        if (v7 != 117)
        {
LABEL_30:
          fwrite("usage: mount_lifs [-d] [-g <gid>] [-m <mask>] [-o options] [-u <uid>] [-v] <mount_from_location> <mount_on_location>\n", 0x75uLL, 1uLL, __stderrp);
          return 64;
        }
        v8 = optarg;
        v9 = getpwnam(optarg);
        v10 = v8;
        if (v9)
        {
          pw_uid = v9->pw_uid;
        }
        else
        {
          do
          {
            v13 = *v10++;
            v12 = v13;
          }
          while ((v13 - 48) < 0xA);
          if (v12)
LABEL_128:
            errx(67, "unknown user id: %s", v8);
          pw_uid = strtol(v8, 0, 10);
        }
        st_uid = pw_uid;
        v6 = 1;
        goto LABEL_4;
      }
      v23 = optind;
      v24 = (a1 - optind);
      if ((int)v24 > 1)
      {
        if (!v5)
        {
          v37 = 0;
          goto LABEL_93;
        }
        LODWORD(__endptr) = 0;
        v72 = 0;
        v35 = getmntopts(v5, &off_100008000, &__endptr, &v72);
        if (!v35)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100003730();
          exit(64);
        }
        v36 = v35;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          sub_100003830();
        v37 = (int)__endptr;
        if ((__endptr & 0x80000000) != 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "ignoring strictatime options", buf, 2u);
            v37 = (int)__endptr;
          }
          v37 &= ~0x80000000;
          LODWORD(__endptr) = v37;
        }
        if ((v72 & 1) != 0)
        {
          v38 = getmntoptnum(v36, "actimeo");
          if (v38 <= 0x3C)
            HIDWORD(v74) = v38;
        }
        if ((v72 & 2) != 0)
        {
          v39 = getmntoptnum(v36, "dsize");
          if (!((unint64_t)(v39 - 1) >> 17))
            DWORD2(v74) = v39;
        }
        if ((v72 & 4) != 0)
        {
          v40 = (const char *)getmntoptstr(v36, "fh");
          if (v40)
          {
            v41 = v40;
            v42 = strlen(v40);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
              sub_1000037C0();
            if (v42 > 0x80)
              sub_100003798();
            if (v42)
            {
              v43 = 0;
              v44 = v78;
              do
              {
                if (v42 <= v43 + 1)
                  break;
                v45 = v41[v43];
                v46 = v41[v43] - 48;
                if ((v45 - 48) >= 0xA)
                {
                  if ((v45 - 97) > 5)
                  {
                    if ((v45 - 65) > 5)
                      goto LABEL_129;
                    v46 = v41[v43] - 55;
                  }
                  else
                  {
                    v46 = v41[v43] - 87;
                  }
                }
                v45 = v41[v43 + 1];
                v47 = v41[v43 + 1] - 48;
                if ((v45 - 48) >= 0xA)
                {
                  if ((v45 - 97) > 5)
                  {
                    if ((v45 - 65) > 5)
LABEL_129:
                      errx(65, "Illegal hex character '%c'", v45);
                    v47 = v41[v43 + 1] - 55;
                  }
                  else
                  {
                    v47 = v41[v43 + 1] - 87;
                  }
                }
                *v44++ = v47 | (16 * v46);
                v43 += 2;
              }
              while (v42 > v43);
            }
            v79 = 64;
          }
        }
        v48 = v72;
        if ((v72 & 8) != 0)
          v73 |= 1u;
        if ((v72 & 0x10) != 0)
          v73 |= 4u;
        if ((~v72 & 0x24) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setting PFH when FH is active, ignoring", buf, 2u);
          v48 = v72;
        }
        if (v48 < 0)
        {
          v49 = (const char *)getmntoptstr(v36, "proto");
          if (v49)
          {
            v50 = v49;
            if (!strcmp(v49, "tcp"))
            {
              v51 = 128;
            }
            else
            {
              if (*v50)
                goto LABEL_84;
              v51 = 256;
            }
            v73 |= v51;
          }
        }
LABEL_84:
        if ((v72 & 0x100) != 0)
        {
          v52 = getmntoptnum(v36, "readahead");
          if (v52 <= 0xFF)
            v75 = v52;
        }
        if ((v72 & 0x200) != 0)
        {
          v53 = getmntoptnum(v36, "rsize");
          if (!((unint64_t)(v53 - 1) >> 20))
            LODWORD(v74) = v53;
        }
        if ((v72 & 0x400) != 0)
        {
          v54 = getmntoptnum(v36, "wsize");
          if (!((unint64_t)(v54 - 1) >> 20))
            DWORD1(v74) = v54;
        }
LABEL_93:
        v55 = &a2[v23];
        if ((unint64_t)__strlcpy_chk(v76, *v55, 1024, 1024) >= 0x400)
        {
          fprintf(__stderrp, "Name %s is too long.\n", *(const char **)v55);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_1000034D4();
          return 65;
        }
        if ((v37 & 0x8000000) != 0)
        {
          v58 = v77;
          __strlcpy_chk(v77, *((_QWORD *)v55 + 1), 1024, 1024);
        }
        else
        {
          v57 = (const char *)*((_QWORD *)v55 + 1);
          v56 = (const char **)(v55 + 1);
          v58 = realpath_DARWIN_EXTSN(v57, v77);
          if (!v58)
          {
            fprintf(__stderrp, "Failed to resolve path %s\n", *v56);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_10000353C((uint64_t)v56, v59, v60, v61, v62, v63, v64, v65);
            return 71;
          }
        }
        if (!v6 || !v4 || !HIDWORD(v68))
        {
          if (stat(v58, &v69))
          {
            fprintf(__stderrp, "Failed to stat the mounton path: %s\n", v58);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_1000036C8();
            return 71;
          }
          if (!v6)
            st_uid = v69.st_uid;
          if (!v4)
            st_gid = v69.st_gid;
          if (!HIDWORD(v68))
          {
            v82 = v69.st_mode & 0x1FF;
            if (!(v6 | v4))
            {
              v82 = 511;
              v73 |= 0x200000u;
            }
          }
        }
        if ((_DWORD)v68)
        {
          printf("mount(\"lifs\", %s, mntflags:0x%x, args:%p\n", v58, v37, &v73);
          printf("args:flags:0x%x,rsize=%d,wsize=%d,dsize=%d,actimeo=%d:readahead=%d:%s:%s:%d:%d:%o\n", v73, (_DWORD)v74, DWORD1(v74), DWORD2(v74), HIDWORD(v74), v75, v76, v77, st_uid, st_gid, v82);
          printf("args:fhlen:%d\n", v79);
          if (v79 >= 1)
          {
            v66 = sub_100003378(v78, v79);
            printf("args:fh:%s\n", v66);
          }
        }
        else if (mount("lifs", v58, v37, &v73))
        {
          sub_100003620((int *)&__endptr);
          v67 = (int)__endptr;
          goto LABEL_114;
        }
        v67 = 0;
LABEL_114:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          sub_1000035AC();
        if (v67)
          return 71;
        else
          return 0;
      }
      v25 = __stderrp;
      v26 = getprogname();
      fprintf(v25, "usage: %s [-d] [-g <gid>] [-m <mask>] [-o options] [-u <uid>] [-v] <mount_from_location> <mount_on_location>\n", v26);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100003468(v24, v27, v28, v29, v30, v31, v32, v33);
      return 64;
  }
}

char *sub_100003378(char *a1, int a2)
{
  size_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;

  v4 = (2 * a2 + 3);
  v5 = (char *)malloc_type_calloc(1uLL, v4, 0x318D0169uLL);
  v6 = v5;
  if (v5)
  {
    strlcpy(v5, "0x", v4);
    if (a2 >= 1)
    {
      v7 = a2;
      v8 = v6 + 3;
      do
      {
        *(v8 - 1) = off_100008348[(unint64_t)*a1 >> 4];
        v9 = *a1++;
        *v8 = off_100008348[v9 & 0xF];
        v8 += 2;
        --v7;
      }
      while (v7);
    }
  }
  return v6;
}

void sub_100003420(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003438(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100003468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003438((void *)&_mh_execute_header, &_os_log_default, a3, "Wrong number of command line parameters:%d", a5, a6, a7, a8, 0);
  sub_100003448();
}

void sub_1000034D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100003450();
  sub_100003420((void *)&_mh_execute_header, &_os_log_default, v0, "mount from is too long: %zu", v1, v2, v3, v4, v5);
  sub_100003430();
}

void sub_10000353C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003420((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to resolve mounton path:%s", a5, a6, a7, a8, 2u);
  sub_100003430();
}

void sub_1000035AC()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_10000345C();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 8u);
  sub_100003448();
}

void sub_100003620(int *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *__error();
  perror("mount error:");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100003438((void *)&_mh_execute_header, &_os_log_default, v3, "mount(2) error: %d", v4, v5, v6, v7, 0);
  *a1 = v2;
  sub_100003430();
}

void sub_1000036C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100003450();
  sub_100003420((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to stat the mounton path:%s", v1, v2, v3, v4, v5);
  sub_100003430();
}

void sub_100003730()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100003450();
  sub_100003420((void *)&_mh_execute_header, &_os_log_default, v0, "failed to parse mount options:%s", v1, v2, v3, v4, v5);
  sub_100003430();
}

void sub_100003798()
{
  errx(65, "File handle capped at %d bytes (%d characters)", 64, 128);
}

void sub_1000037C0()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_100003450();
  sub_10000345C();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
  sub_100003430();
}

void sub_100003830()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_10000345C();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xEu);
  sub_100003430();
}

void sub_1000038B8()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "usage error", v0, 2u);
  sub_100003448();
}

void sub_1000038F8()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_10000345C();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 2u);
  sub_100003448();
}
