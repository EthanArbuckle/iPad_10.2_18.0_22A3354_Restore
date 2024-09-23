void start(int a1, char *const *a2)
{
  int v4;
  int v5;
  double v6;
  double v7;
  int v8;
  int v9;

  qword_100008000 = (uint64_t)*a2;
  setlinebuf(__stdoutp);
  v4 = 0;
  while (1)
  {
    v5 = getopt(a1, a2, "c:");
    if (v5 != 99)
      break;
    v4 = strtol(optarg, 0, 10);
    if (v4 <= 0)
    {
      warnx("count must be positive");
      goto LABEL_15;
    }
  }
  if (v5 == -1)
  {
    if (a1 - optind == 1)
    {
      v6 = strtod(a2[optind], 0);
      if (v6 >= 0.0)
      {
        v7 = v6;
        dword_100008008 = mach_host_self();
        if (v7 != 0.0)
        {
          sub_100003614();
          if (v4 != 1)
          {
            v8 = 2;
            do
            {
              do
              {
                v9 = v8;
                usleep((int)(v7 * 1000000.0));
                sub_100003614();
                v8 = v9 + 1;
              }
              while (!v4);
            }
            while (v9 < v4);
          }
LABEL_18:
          exit(0);
        }
LABEL_17:
        sub_1000033A8();
        goto LABEL_18;
      }
    }
    else if (a1 - optind < 2)
    {
      dword_100008008 = mach_host_self();
      goto LABEL_17;
    }
  }
LABEL_15:
  fprintf(__stderrp, "usage: %s [[-c count] interval]\n", (const char *)qword_100008000);
  exit(1);
}

uint64_t sub_1000033A8()
{
  sub_10000380C((host_info64_t)&xmmword_100008010);
  printf("Mach Virtual Memory Statistics: (page size of %llu bytes)\n", vm_kernel_page_size);
  printf("%-30s %16llu.\n", "Pages free:", (xmmword_100008010 - dword_10000806C));
  printf("%-30s %16llu.\n", "Pages active:", DWORD1(xmmword_100008010));
  printf("%-30s %16llu.\n", "Pages inactive:", DWORD2(xmmword_100008010));
  printf("%-30s %16llu.\n", "Pages speculative:", dword_10000806C);
  printf("%-30s %16llu.\n", "Pages throttled:", DWORD1(xmmword_100008090));
  printf("%-30s %16llu.\n", "Pages wired down:", HIDWORD(xmmword_100008010));
  printf("%-30s %16llu.\n", "Pages purgeable:", dword_100008068);
  printf("%-30s %16llu.\n", "\"Translation faults\":", qword_100008040);
  printf("%-30s %16llu.\n", "Pages copy-on-write:", qword_100008048);
  printf("%-30s %16llu.\n", "Pages zero filled:", qword_100008020);
  printf("%-30s %16llu.\n", "Pages reactivated:", qword_100008028);
  printf("%-30s %16llu.\n", "Pages purged:", qword_100008060);
  printf("%-30s %16llu.\n", "File-backed pages:", DWORD2(xmmword_100008090));
  printf("%-30s %16llu.\n", "Anonymous pages:", HIDWORD(xmmword_100008090));
  printf("%-30s %16llu.\n", "Pages stored in compressor:", qword_1000080A0);
  printf("%-30s %16llu.\n", "Pages occupied by compressor:", xmmword_100008090);
  printf("%-30s %16llu.\n", "Decompressions:", (_QWORD)xmmword_100008070);
  printf("%-30s %16llu.\n", "Compressions:", *((_QWORD *)&xmmword_100008070 + 1));
  printf("%-30s %16llu.\n", "Pageins:", (_QWORD)xmmword_100008030);
  printf("%-30s %16llu.\n", "Pageouts:", *((_QWORD *)&xmmword_100008030 + 1));
  printf("%-30s %16llu.\n", "Swapins:", qword_100008080);
  return printf("%-30s %16llu.\n", "Swapouts:", qword_100008088);
}

double sub_100003614()
{
  int v0;
  int v1;
  double result;

  v0 = dword_100008140;
  v1 = ++dword_100008140;
  if (!v0)
  {
    sub_100003878();
    v1 = dword_100008140;
  }
  if (v1 >= 21)
    dword_100008140 = 0;
  sub_10000380C((host_info64_t)&xmmword_100008010);
  sub_1000039D0((xmmword_100008010 - dword_10000806C), 8u);
  sub_1000039D0(DWORD1(xmmword_100008010), 8u);
  sub_1000039D0(dword_10000806C, 8u);
  sub_1000039D0(DWORD2(xmmword_100008010), 8u);
  sub_1000039D0(DWORD1(xmmword_100008090), 8u);
  sub_1000039D0(HIDWORD(xmmword_100008010), 8u);
  sub_1000039D0(dword_100008068, 8u);
  sub_1000039D0(qword_100008040 - qword_1000080D8, 8u);
  sub_1000039D0(qword_100008048 - qword_1000080E0, 8u);
  sub_1000039D0(qword_100008020 - qword_1000080B8, 8u);
  sub_1000039D0(qword_100008028 - qword_1000080C0, 8u);
  sub_1000039D0(qword_100008060 - qword_1000080F8, 8u);
  sub_1000039D0(DWORD2(xmmword_100008090), 0xBu);
  sub_1000039D0(HIDWORD(xmmword_100008090), 9u);
  sub_1000039D0(qword_1000080A0, 8u);
  sub_1000039D0(xmmword_100008090, 8u);
  sub_1000039D0(xmmword_100008070 - xmmword_100008108, 8u);
  sub_1000039D0(*((_QWORD *)&xmmword_100008070 + 1) - *((_QWORD *)&xmmword_100008108 + 1), 8u);
  sub_1000039D0(xmmword_100008030 - xmmword_1000080C8, 8u);
  sub_1000039D0(*((_QWORD *)&xmmword_100008030 + 1) - *((_QWORD *)&xmmword_1000080C8 + 1), 8u);
  sub_1000039D0(qword_100008080 - qword_100008118, 8u);
  sub_1000039D0(qword_100008088 - qword_100008120, 8u);
  putchar(10);
  xmmword_100008108 = xmmword_100008070;
  *(_OWORD *)&qword_100008118 = *(_OWORD *)&qword_100008080;
  xmmword_100008128 = xmmword_100008090;
  qword_100008138 = qword_1000080A0;
  xmmword_1000080C8 = xmmword_100008030;
  *(_OWORD *)&qword_1000080D8 = *(_OWORD *)&qword_100008040;
  xmmword_1000080E8 = xmmword_100008050;
  *(_OWORD *)&qword_1000080F8 = *(_OWORD *)&qword_100008060;
  result = *(double *)&xmmword_100008010;
  xmmword_1000080A8 = xmmword_100008010;
  *(_OWORD *)&qword_1000080B8 = *(_OWORD *)&qword_100008020;
  return result;
}

uint64_t sub_10000380C(host_info64_t host_info64_out)
{
  uint64_t result;
  mach_msg_type_number_t host_info64_outCnt;

  host_info64_outCnt = 38;
  result = host_statistics64(dword_100008008, 4, host_info64_out, &host_info64_outCnt);
  if ((_DWORD)result)
  {
    fprintf(__stderrp, "%s: failed to get statistics. error %d\n", (const char *)qword_100008000, 1);
    exit(1);
  }
  return result;
}

double sub_100003878()
{
  double result;

  sub_10000380C((host_info64_t)&xmmword_100008010);
  printf("Mach Virtual Memory Statistics: ");
  printf("(page size of %llu bytes)\n", vm_kernel_page_size);
  printf("%8s %8s %8s %8s %8s %8s %8s %8s %8s %8s %8s %8s %11s %9s %8s %8s %8s %8s %8s %8s %8s %8s\n", "free", "active", "specul", "inactive", "throttle", "wired", "prgable", "faults", "copy", "0fill", "reactive", "purged", "file-backed", "anonymous", "cmprssed", "cmprssor", "dcomprs", "comprs",
    "pageins",
    "pageout",
    "swapins",
    "swapouts");
  result = 0.0;
  xmmword_1000080A8 = 0u;
  *(_OWORD *)&qword_1000080B8 = 0u;
  xmmword_1000080C8 = 0u;
  *(_OWORD *)&qword_1000080D8 = 0u;
  xmmword_1000080E8 = 0u;
  *(_OWORD *)&qword_1000080F8 = 0u;
  xmmword_100008108 = 0u;
  *(_OWORD *)&qword_100008118 = 0u;
  xmmword_100008128 = 0u;
  qword_100008138 = 0;
  return result;
}

uint64_t sub_1000039D0(unint64_t a1, unsigned int a2)
{
  int v3;
  char __str[80];

  if (a2 >= 0x4F)
    v3 = 79;
  else
    v3 = a2;
  if (snprintf(__str, 0x50uLL, "%*llu", v3, a1) > v3
    && snprintf(__str, 0x50uLL, "%*lluK", v3 - 1, a1 / 0x3E8) > v3
    && snprintf(__str, 0x50uLL, "%*lluM", v3 - 1, a1 / 0xF4240) > v3)
  {
    snprintf(__str, 0x50uLL, "%*lluG", v3 - 1, a1 / 0x3B9ACA00);
  }
  fputs(__str, __stdoutp);
  return putchar(32);
}
