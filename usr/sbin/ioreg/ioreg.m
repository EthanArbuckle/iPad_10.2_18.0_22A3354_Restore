void start(int a1, char *const *a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  char *v8;
  CFStringRef v9;
  int v10;
  int v11;
  char *v12;
  uint64_t RootEntry;
  io_object_t v14;
  __CFArray *v15;
  __CFArray *v16;
  const __CFURL *v17;
  const __CFURL *v18;
  __CFWriteStream *v19;
  __CFWriteStream *v20;
  FILE *v21;
  const char *v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 error;
  CFStringRef v27;
  int v28;
  int v29;
  char *v30;
  char *v31;
  char *v32;
  int v33;
  int v34;
  uint64_t v35;
  __int128 v36;
  CFStringRef v37;
  int v38;
  int v39;
  char *v40;
  char *v41;
  char *v42;
  int v43;
  int v44;

  v35 = 0;
  v4 = fileno(__stdoutp);
  if (!isatty(v4) || (v5 = fileno(__stdoutp), ioctl(v5, 0x40087468uLL, &v35)))
    v6 = 0;
  else
    v6 = WORD1(v35);
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v23 = 0;
  v24 = 0;
  v25 = "IOService";
  while (2)
  {
    v11 = getopt(a1, a2, ":abc:d:fik:ln:p:rsStw:xy");
    switch(v11)
    {
      case 'S':
      case 's':
        continue;
      case 'T':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Y':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '^':
      case '_':
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'm':
      case 'o':
      case 'q':
      case 'u':
      case 'v':
        goto LABEL_37;
      case 'a':
        v7 |= 1u;
        continue;
      case 'b':
        v7 |= 2u;
        continue;
      case 'c':
        v8 = optarg;
        v9 = CFStringCreateWithCString(kCFAllocatorDefault, optarg, 0x8000100u);
        continue;
      case 'd':
        v10 = atoi(optarg);
        continue;
      case 'f':
        v7 |= 4u;
        continue;
      case 'i':
        v7 |= 0x10u;
        continue;
      case 'k':
        v23 = optarg;
        continue;
      case 'l':
        v7 |= 0x20u;
        continue;
      case 'n':
        v24 = optarg;
        continue;
      case 'p':
        v25 = optarg;
        continue;
      case 'r':
        v7 |= 0x40u;
        continue;
      case 't':
        v7 |= 0x80u;
        continue;
      case 'w':
        v6 = atoi(optarg);
        continue;
      case 'x':
        v7 |= 8u;
        continue;
      case 'y':
        v7 |= 0x100u;
        continue;
      default:
        if (v11 != -1)
        {
LABEL_37:
          fwrite("usage: ioreg [-abfilrtxy] [-c class] [-d depth] [-k key] [-n name] [-p plane] [-w width]\nwhere options are:\n\t-a archive output\n\t-b show object name in bold\n\t-c list properties of objects with the given class\n\t-d limit tree to the given depth\n\t-f enable smart formatting\n\t-i show object inheritance\n\t-k list properties of objects with the given key\n\t-l list properties of all objects\n\t-n list properties of objects with the given name\n\t-p traverse registry over the given plane (IOService is default)\n\t-r show subtrees rooted by the given criteria\n\t-t show location of each subtree\n\t-w clip output to the given line width (0 is unlimited)\n\t-x show data and numbers as hexadecimal\n\t-y do not consider DriverKit classes with -c\n", 0x2D5uLL, 1uLL,
            __stderrp);
          goto LABEL_38;
        }
        byte_10000C028 = (v7 & 8) != 0;
        if (v6
          && (qword_10000C010 = (uint64_t)malloc_type_malloc(v6, 0x172F7D99uLL),
              dword_10000C018 = v6,
              dword_10000C008 = v6,
              !qword_10000C010))
        {
          v21 = __stderrp;
          v22 = "can't allocate buffer";
        }
        else
        {
          if ((v7 & 2) == 0)
            goto LABEL_33;
          *(_QWORD *)&v36 = &unk_10000C029;
          v12 = getenv("TERM");
          if (!v12
            || tgetent(0, v12) < 1
            || (qword_10000C000 = (uint64_t)tgetstr("md", (char **)&v36),
                qword_10000C020 = (uint64_t)tgetstr("me", (char **)&v36),
                (_QWORD)v36 - (_QWORD)&unk_10000C029 < 0x41uLL))
          {
            if (!qword_10000C000)
              qword_10000C000 = (uint64_t)&unk_100007846;
            if (!qword_10000C020)
              qword_10000C020 = (uint64_t)&unk_100007846;
LABEL_33:
            RootEntry = IORegistryGetRootEntry(kIOMainPortDefault);
            if ((_DWORD)RootEntry)
            {
              v14 = RootEntry;
              if ((v7 & 1) == 0)
              {
                if ((v7 & 0x40) != 0)
                {
                  LOWORD(error) = v7;
                  *(_DWORD *)((char *)&error + 2) = 0;
                  WORD3(error) = 0;
                  *((_QWORD *)&error + 1) = v8;
                  v27 = v9;
                  v28 = v10;
                  v29 = 0;
                  v30 = v23;
                  v31 = v24;
                  v32 = v25;
                  v33 = v6;
                  v34 = 0;
                  sub_100003F2C(RootEntry, 0, 0, (uint64_t)&v36, &error);
                }
                else
                {
                  LOWORD(v36) = v7;
                  *(_DWORD *)((char *)&v36 + 2) = 0;
                  WORD3(v36) = 0;
                  *((_QWORD *)&v36 + 1) = v8;
                  v37 = v9;
                  v38 = v10;
                  v39 = 0;
                  v40 = v23;
                  v41 = v24;
                  v42 = v25;
                  v43 = v6;
                  v44 = 0;
                  sub_100004100(RootEntry, 0, 0, 0, (const char **)&v36);
                }
                goto LABEL_49;
              }
              if ((v7 & 0x40) != 0)
              {
                LOWORD(error) = v7;
                *(_DWORD *)((char *)&error + 2) = 0;
                WORD3(error) = 0;
                *((_QWORD *)&error + 1) = v8;
                v27 = v9;
                v28 = v10;
                v29 = 0;
                v30 = v23;
                v31 = v24;
                v32 = v25;
                v33 = v6;
                v34 = 0;
                v15 = sub_100003B00(RootEntry, 0, 0, (uint64_t)&v36, (uint64_t)&error);
              }
              else
              {
                LOWORD(v36) = v7;
                *(_DWORD *)((char *)&v36 + 2) = 0;
                WORD3(v36) = 0;
                *((_QWORD *)&v36 + 1) = v8;
                v37 = v9;
                v38 = v10;
                v39 = 0;
                v40 = v23;
                v41 = v24;
                v42 = v25;
                v43 = v6;
                v44 = 0;
                v15 = sub_100003D9C(RootEntry, 0, &v36);
              }
              v16 = v15;
              if (!v15)
              {
LABEL_49:
                IOObjectRelease(v14);
                exit(0);
              }
              *(_QWORD *)&error = 0;
              v17 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, CFSTR("/dev/stdout"), kCFURLPOSIXPathStyle, 0);
              if (v17)
              {
                v18 = v17;
                v19 = CFWriteStreamCreateWithFile(kCFAllocatorDefault, v17);
                if (v19)
                {
                  v20 = v19;
                  if (CFWriteStreamOpen(v19))
                  {
                    CFPropertyListWrite(v16, v20, kCFPropertyListXMLFormat_v1_0, 0, (CFErrorRef *)&error);
                    if (!(_QWORD)error)
                    {
                      CFWriteStreamClose(v20);
                      CFRelease(v20);
                      CFRelease(v18);
                      CFRelease(v16);
                      goto LABEL_49;
                    }
                    v21 = __stderrp;
                    v22 = "CFPropertyListWrite(): error";
                  }
                  else
                  {
                    v21 = __stderrp;
                    v22 = "can't open file";
                  }
                }
                else
                {
                  v21 = __stderrp;
                  v22 = "can't create file";
                }
              }
              else
              {
                v21 = __stderrp;
                v22 = "can't create path";
              }
            }
            else
            {
              v21 = __stderrp;
              v22 = "can't obtain I/O Kit's root service";
            }
            goto LABEL_57;
          }
          v21 = __stderrp;
          v22 = "can't obtain terminfo";
        }
LABEL_57:
        fprintf(v21, "ioreg: error: %s.\n", v22);
LABEL_38:
        exit(1);
    }
  }
}

__CFArray *sub_100003B00(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  int v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __CFDictionary *v17;
  __CFArray *v18;
  __int128 v19;
  __int128 v20;
  __CFDictionary *v21;
  __CFDictionary *v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __CFDictionary *v28;
  uint64_t v29;
  __CFArray *Mutable;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  const __CFArray *v36;
  const __CFArray *v37;
  FILE *v39;
  const char *v40;
  int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  io_iterator_t iterator;
  CFRange v47;

  v8 = a2;
  v9 = a1;
  iterator = 0;
  v10 = a3 + 1;
  if (v10 <= a2
    || (v11 = *(_OWORD *)(a5 + 16),
        v42 = *(_OWORD *)a5,
        v43 = v11,
        v12 = *(_OWORD *)(a5 + 48),
        v44 = *(_OWORD *)(a5 + 32),
        v45 = v12,
        !sub_100004864(a1, (uint64_t)&v42)))
  {
    v18 = 0;
    goto LABEL_21;
  }
  v13 = *(_DWORD *)(a5 + 24);
  v14 = v13 + a3;
  if (v13)
    v8 = v14;
  else
    v8 = 0xFFFFFFFFLL;
  v41 = v9;
  if ((*(_WORD *)a5 & 0x80) != 0)
  {
    if (v13)
      *(_DWORD *)(a5 + 24) = v14;
    v19 = *(_OWORD *)(a5 + 16);
    v42 = *(_OWORD *)a5;
    v43 = v19;
    v20 = *(_OWORD *)(a5 + 48);
    v44 = *(_OWORD *)(a5 + 32);
    v45 = v20;
    v21 = sub_100003D9C(v9, a3, &v42);
    v22 = v21;
    v23 = *(_DWORD *)(a5 + 24);
    if (v23)
      *(_DWORD *)(a5 + 24) = v23 - a3;
    if (a3)
    {
      v24 = a3 - 1;
      while (1)
      {
        v25 = *(unsigned int *)(a4 + 4 * v24);
        v26 = *(_OWORD *)(a5 + 16);
        v42 = *(_OWORD *)a5;
        v43 = v26;
        v27 = *(_OWORD *)(a5 + 48);
        v44 = *(_OWORD *)(a5 + 32);
        v45 = v27;
        v28 = sub_100004248(v25, (uint64_t)&v42);
        if (!v28)
          break;
        v17 = v28;
        v29 = v24;
        CFDictionarySetValue(v28, CFSTR("IORegistryEntryChildren"), v22);
        CFRelease(v22);
        --v24;
        v22 = v17;
        if (!v29)
          goto LABEL_19;
      }
      v39 = __stderrp;
      v40 = "can't obtain parent";
LABEL_32:
      fprintf(v39, "ioreg: error: %s.\n", v40);
      exit(1);
    }
    v17 = v21;
  }
  else
  {
    v15 = *(_OWORD *)(a5 + 16);
    v42 = *(_OWORD *)a5;
    v43 = v15;
    v16 = *(_OWORD *)(a5 + 48);
    v44 = *(_OWORD *)(a5 + 32);
    v45 = v16;
    v17 = sub_100003D9C(v9, 0, &v42);
  }
LABEL_19:
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    v39 = __stderrp;
    v40 = "can't create array";
    goto LABEL_32;
  }
  v18 = Mutable;
  CFArrayAppendValue(Mutable, v17);
  CFRelease(v17);
  LODWORD(v9) = v41;
LABEL_21:
  *(_DWORD *)(a4 + 4 * a3) = v9;
  if (!IORegistryEntryGetChildIterator(v9, *(const char **)(a5 + 48), &iterator))
  {
    v31 = IOIteratorNext(iterator);
    if ((_DWORD)v31)
    {
      v32 = v31;
      do
      {
        v33 = IOIteratorNext(iterator);
        v34 = *(_OWORD *)(a5 + 16);
        v42 = *(_OWORD *)a5;
        v43 = v34;
        v35 = *(_OWORD *)(a5 + 48);
        v44 = *(_OWORD *)(a5 + 32);
        v45 = v35;
        v36 = (const __CFArray *)sub_100003B00(v32, v8, v10, a4, &v42);
        if (v36)
        {
          v37 = v36;
          if (v18)
          {
            v47.length = CFArrayGetCount(v36);
            v47.location = 0;
            CFArrayAppendArray(v18, v37, v47);
            CFRelease(v37);
          }
          else
          {
            v18 = v36;
          }
        }
        IOObjectRelease(v32);
        v32 = v33;
      }
      while ((_DWORD)v33);
    }
    IOObjectRelease(iterator);
  }
  return v18;
}

__CFDictionary *sub_100003D9C(uint64_t a1, int a2, __int128 *a3)
{
  __CFDictionary *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  unsigned int v10;
  CFMutableArrayRef Mutable;
  __CFArray *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  const void *v17;
  const void *v18;
  FILE *v20;
  const char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  io_iterator_t iterator;

  iterator = 0;
  if (IORegistryEntryGetChildIterator(a1, *((const char **)a3 + 6), &iterator))
    return 0;
  v7 = IOIteratorNext(iterator);
  v8 = a3[1];
  v22 = *a3;
  v23 = v8;
  v9 = a3[3];
  v24 = a3[2];
  v25 = v9;
  v6 = sub_100004248(a1, (uint64_t)&v22);
  v10 = *((_DWORD *)a3 + 6);
  if ((!v10 || v10 > a2 + 1) && (_DWORD)v7)
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      v12 = Mutable;
      v13 = (a2 + 1);
      while (1)
      {
        v14 = IOIteratorNext(iterator);
        v15 = a3[1];
        v22 = *a3;
        v23 = v15;
        v16 = a3[3];
        v24 = a3[2];
        v25 = v16;
        v17 = (const void *)sub_100003D9C(v7, v13, &v22);
        if (!v17)
          break;
        v18 = v17;
        CFArrayAppendValue(v12, v17);
        CFRelease(v18);
        IOObjectRelease(v7);
        v7 = v14;
        if (!(_DWORD)v14)
        {
          CFDictionarySetValue(v6, CFSTR("IORegistryEntryChildren"), v12);
          CFRelease(v12);
          goto LABEL_11;
        }
      }
      v20 = __stderrp;
      v21 = "can't obtain child";
    }
    else
    {
      v20 = __stderrp;
      v21 = "can't create array";
    }
    fprintf(v20, "ioreg: error: %s.\n", v21);
    exit(1);
  }
LABEL_11:
  IOObjectRelease(iterator);
  return v6;
}

uint64_t sub_100003F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  int v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  io_iterator_t iterator;

  v8 = a2;
  iterator = 0;
  v10 = (a3 + 1);
  if (v10 > a2)
  {
    v11 = a5[1];
    v36 = *a5;
    v37 = v11;
    v12 = a5[3];
    v38 = a5[2];
    v39 = v12;
    if (sub_100004864(a1, (uint64_t)&v36))
    {
      v13 = *((_DWORD *)a5 + 6);
      if (v13)
        v8 = (v13 + a3);
      else
        v8 = 0xFFFFFFFFLL;
      if ((*(_WORD *)a5 & 0x80) != 0)
      {
        if ((_DWORD)a3)
        {
          v23 = 0;
          do
          {
            v24 = *(unsigned int *)(a4 + 4 * v23);
            v25 = a5[1];
            v36 = *a5;
            v37 = v25;
            v26 = a5[3];
            v38 = a5[2];
            v39 = v26;
            sub_100004DC8(v24, v23, 2 << v23, (const char **)&v36);
            ++v23;
          }
          while (a3 != v23);
          v13 = *((_DWORD *)a5 + 6);
        }
        if (v13)
          *((_DWORD *)a5 + 6) = v13 + a3;
        v27 = a5[1];
        v36 = *a5;
        v37 = v27;
        v28 = a5[3];
        v38 = a5[2];
        v39 = v28;
        sub_100004100(a1, 0, a3, 0, (const char **)&v36);
        v29 = *((_DWORD *)a5 + 6);
        if (v29)
          *((_DWORD *)a5 + 6) = v29 - a3;
      }
      else
      {
        v14 = a5[1];
        v36 = *a5;
        v37 = v14;
        v15 = a5[3];
        v38 = a5[2];
        v39 = v15;
        sub_100004100(a1, 0, 0, 0, (const char **)&v36);
      }
      sub_1000054BC((char *)&unk_100007846, v16, v17, v18, v19, v20, v21, v22, v36);
    }
  }
  *(_DWORD *)(a4 + 4 * a3) = a1;
  result = IORegistryEntryGetChildIterator(a1, *((const char **)a5 + 6), &iterator);
  if (!(_DWORD)result)
  {
    v31 = IOIteratorNext(iterator);
    if ((_DWORD)v31)
    {
      v32 = v31;
      do
      {
        v33 = IOIteratorNext(iterator);
        v34 = a5[1];
        v36 = *a5;
        v37 = v34;
        v35 = a5[3];
        v38 = a5[2];
        v39 = v35;
        sub_100003F2C(v32, v8, v10, a4, &v36);
        IOObjectRelease(v32);
        v32 = v33;
      }
      while ((_DWORD)v33);
    }
    return IOObjectRelease(iterator);
  }
  return result;
}

uint64_t sub_100004100(uint64_t a1, int a2, uint64_t a3, unint64_t a4, const char **a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  io_iterator_t iterator;

  iterator = 0;
  result = IORegistryEntryGetChildIterator(a1, a5[6], &iterator);
  if (!(_DWORD)result)
  {
    v11 = IOIteratorNext(iterator);
    v12 = v11;
    v13 = (1 << a3) | a4;
    if (!a2)
      v13 = ~(1 << a3) & a4;
    v14 = (a3 + 1);
    v15 = *((_DWORD *)a5 + 6) - 1;
    v16 = v13 | (2 << a3);
    if (!(_DWORD)v11)
      v16 = v13 & ~(2 << a3);
    v17 = *((_OWORD *)a5 + 1);
    v23 = *(_OWORD *)a5;
    v24 = v17;
    v18 = *((_OWORD *)a5 + 3);
    if (v15 >= v14)
      v19 = v16;
    else
      v19 = v13;
    v25 = *((_OWORD *)a5 + 2);
    v26 = v18;
    sub_100004DC8(a1, a3, v19, (const char **)&v23);
    if (*((_DWORD *)a5 + 6) - 1 >= v14 && (_DWORD)v12)
    {
      do
      {
        v20 = IOIteratorNext(iterator);
        v21 = *((_OWORD *)a5 + 1);
        v23 = *(_OWORD *)a5;
        v24 = v21;
        v22 = *((_OWORD *)a5 + 3);
        v25 = *((_OWORD *)a5 + 2);
        v26 = v22;
        sub_100004100(v12, (_DWORD)v20 != 0, v14, v19, &v23);
        IOObjectRelease(v12);
        v12 = v20;
      }
      while ((_DWORD)v20);
    }
    return IOObjectRelease(iterator);
  }
  return result;
}

CFMutableDictionaryRef sub_100004248(uint64_t object, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  CFMutableDictionaryRef v6;
  CFStringRef v7;
  CFStringRef v8;
  CFStringRef v9;
  CFStringRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFStringRef v13;
  CFStringRef v14;
  CFMutableArrayRef Mutable;
  __CFArray *v16;
  CFStringRef v17;
  CFNumberRef v18;
  CFNumberRef v19;
  CFNumberRef v20;
  CFNumberRef v21;
  CFNumberRef v22;
  CFNumberRef v23;
  CFNumberRef v24;
  CFNumberRef v25;
  FILE *v27;
  const char *v28;
  _OWORD v29[4];
  uint64_t v30;
  uint64_t v31;
  uint64_t entryID;
  CFMutableDictionaryRef properties;
  uint32_t valuePtr;
  io_name_t name;
  io_name_t location;
  char cStr[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  *(_OWORD *)cStr = 0u;
  v38 = 0u;
  valuePtr = 0;
  entryID = 0;
  properties = 0;
  memset(location, 0, sizeof(location));
  memset(name, 0, sizeof(name));
  v30 = 0;
  v31 = 0;
  if ((*(_WORD *)a2 & 0x20) != 0
    || (v4 = *(_OWORD *)(a2 + 16),
        v29[0] = *(_OWORD *)a2,
        v29[1] = v4,
        v5 = *(_OWORD *)(a2 + 48),
        v29[2] = *(_OWORD *)(a2 + 32),
        v29[3] = v5,
        sub_100004864(object, (uint64_t)v29)))
  {
    if (IORegistryEntryCreateCFProperties(object, &properties, kCFAllocatorDefault, 0))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain properties");
      v6 = 0;
      properties = 0;
    }
    else
    {
      v6 = properties;
    }
    sub_100004AF4(v6);
  }
  if (!properties)
  {
    properties = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!properties)
    {
      v27 = __stderrp;
      v28 = "can't create dictionary";
      goto LABEL_47;
    }
  }
  if (IORegistryEntryGetNameInPlane(object, *(const char **)(a2 + 48), name))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain name");
    strcpy(name, "<name error>");
  }
  v7 = CFStringCreateWithCString(kCFAllocatorDefault, name, 0x8000100u);
  if (!v7)
  {
    v27 = __stderrp;
    v28 = "can't create name";
    goto LABEL_47;
  }
  v8 = v7;
  CFDictionarySetValue(properties, CFSTR("IORegistryEntryName"), v7);
  CFRelease(v8);
  if (!IORegistryEntryGetLocationInPlane(object, *(const char **)(a2 + 48), location))
  {
    v9 = CFStringCreateWithCString(kCFAllocatorDefault, location, 0x8000100u);
    if (!v9)
    {
      v27 = __stderrp;
      v28 = "can't create location";
      goto LABEL_47;
    }
    v10 = v9;
    CFDictionarySetValue(properties, CFSTR("IORegistryEntryLocation"), v9);
    CFRelease(v10);
  }
  if (IORegistryEntryGetRegistryEntryID(object, &entryID))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain identifier");
    entryID = -1;
  }
  v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &entryID);
  if (!v11)
  {
    v27 = __stderrp;
    v28 = "can't create identifier";
    goto LABEL_47;
  }
  v12 = v11;
  CFDictionarySetValue(properties, CFSTR("IORegistryEntryID"), v11);
  CFRelease(v12);
  if (_IOObjectGetClass(object, (char *)1))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain class");
    strcpy(cStr, "<class error>");
  }
  v13 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v13)
  {
    v27 = __stderrp;
    v28 = "can't create class";
    goto LABEL_47;
  }
  v14 = v13;
  CFDictionarySetValue(properties, CFSTR("IOObjectClass"), v13);
  if ((*(_WORD *)a2 & 0x10) != 0)
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    if (!Mutable)
    {
      v27 = __stderrp;
      v28 = "can't create array";
      goto LABEL_47;
    }
    v16 = Mutable;
    while (1)
    {
      v17 = v14;
      CFArrayInsertValueAtIndex(v16, 0, v14);
      v14 = IOObjectCopySuperclassForClass(v14);
      CFRelease(v17);
      if (!v14)
        break;
      if (CFEqual(v14, CFSTR("OSObject")))
      {
        CFDictionarySetValue(properties, CFSTR("IOObjectInheritance"), v16);
        CFRelease(v16);
        goto LABEL_27;
      }
    }
    CFDictionarySetValue(properties, CFSTR("IOObjectInheritance"), v16);
    v14 = (CFStringRef)v16;
  }
LABEL_27:
  CFRelease(v14);
  valuePtr = IOObjectGetKernelRetainCount(object);
  v18 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (!v18)
  {
    v27 = __stderrp;
    v28 = "can't create retain count";
    goto LABEL_47;
  }
  v19 = v18;
  CFDictionarySetValue(properties, CFSTR("IOObjectRetainCount"), v18);
  CFRelease(v19);
  if (_IOObjectConformsTo(object, "IOService"))
  {
    if (IOServiceGetBusyStateAndTime(object, &v31, &valuePtr, &v30))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain state");
      valuePtr = 0;
      v30 = 0;
      v31 = 0;
    }
    v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v31);
    if (v20)
    {
      v21 = v20;
      CFDictionarySetValue(properties, CFSTR("IOServiceState"), v20);
      CFRelease(v21);
      v22 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      if (v22)
      {
        v23 = v22;
        CFDictionarySetValue(properties, CFSTR("IOServiceBusyState"), v22);
        CFRelease(v23);
        v24 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v30);
        if (v24)
        {
          v25 = v24;
          CFDictionarySetValue(properties, CFSTR("IOServiceBusyTime"), v24);
          CFRelease(v25);
          return properties;
        }
        v27 = __stderrp;
        v28 = "can't create busy time";
      }
      else
      {
        v27 = __stderrp;
        v28 = "can't create busy state";
      }
    }
    else
    {
      v27 = __stderrp;
      v28 = "can't create state";
    }
LABEL_47:
    fprintf(v27, "ioreg: error: %s.\n", v28);
    exit(1);
  }
  return properties;
}

BOOL sub_100004864(io_object_t object, uint64_t a2)
{
  const __CFArray *CFProperty;
  const __CFArray *v5;
  CFTypeID TypeID;
  int v7;
  uint64_t v8;
  const char *v9;
  const __CFString *v10;
  const __CFString *v11;
  io_name_t name;
  char location[136];
  CFRange v15;

  if (*(_QWORD *)(a2 + 8))
  {
    if (*(_QWORD *)(a2 + 16))
    {
      if ((*(_WORD *)a2 & 0x100) == 0)
      {
        CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(object, CFSTR("IOUserClasses"), kCFAllocatorDefault, 0);
        if (CFProperty)
        {
          v5 = CFProperty;
          TypeID = CFArrayGetTypeID();
          if (TypeID == CFGetTypeID(v5))
          {
            v15.length = CFArrayGetCount(v5);
            v15.location = 0;
            v7 = CFArrayContainsValue(v5, v15, *(const void **)(a2 + 16));
            CFRelease(v5);
            if (v7)
            {
              v8 = 1;
              goto LABEL_11;
            }
            return 0;
          }
          CFRelease(v5);
        }
      }
    }
    v8 = 1;
    if (!_IOObjectConformsTo(object, *(const char **)(a2 + 8)))
      return 0;
  }
  else
  {
    v8 = 0;
  }
LABEL_11:
  v9 = *(const char **)(a2 + 32);
  if (v9)
  {
    v10 = CFStringCreateWithCString(kCFAllocatorDefault, v9, 0x8000100u);
    if (!v10)
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't create key");
      exit(1);
    }
    v11 = v10;
    v8 = (uint64_t)IORegistryEntryCreateCFProperty(object, v10, kCFAllocatorDefault, 0);
    CFRelease(v11);
    if (!v8)
      return v8;
    CFRelease((CFTypeRef)v8);
    v8 = 1;
  }
  if (*(_QWORD *)(a2 + 40))
  {
    memset(location, 0, 128);
    memset(name, 0, sizeof(name));
    if (IORegistryEntryGetNameInPlane(object, *(const char **)(a2 + 48), name))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain name");
      strcpy(name, "<name error>");
    }
    if (strchr(*(char **)(a2 + 40), 64))
    {
      __strlcat_chk(name, "@", 128, 128);
      if (!IORegistryEntryGetLocationInPlane(object, *(const char **)(a2 + 48), location))
        __strlcat_chk(name, location, 128, 128);
    }
    return !strcmp(*(const char **)(a2 + 40), name);
  }
  return v8;
}

void sub_100004AF4(void *a1)
{
  CFTypeID v2;
  CFIndex Count;
  const void **v4;
  const void **v5;
  CFTypeRef *v6;
  const void **v7;
  CFTypeID v8;
  CFIndex v9;
  const void **v10;
  CFArrayRef v11;
  CFArrayRef v12;
  CFTypeRef v13;
  CFIndex v14;
  CFIndex v15;
  CFIndex i;
  const void *ValueAtIndex;
  CFTypeID v18;
  CFIndex v19;
  const void **v20;
  CFArrayRef v21;
  FILE *v22;
  const char *v23;

  if (a1)
  {
    v2 = CFGetTypeID(a1);
    if (v2 == CFSetGetTypeID())
    {
      v22 = __stderrp;
      v23 = "Root object cannot be a CFSet";
LABEL_20:
      fprintf(v22, "ioreg: error: %s.\n", v23);
      exit(1);
    }
    if (v2 == CFDictionaryGetTypeID())
    {
      Count = CFDictionaryGetCount((CFDictionaryRef)a1);
      v4 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
      v5 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)a1, v4, v5);
      if (Count >= 1)
      {
        v6 = v5;
        v7 = v4;
        do
        {
          v8 = CFGetTypeID(*v6);
          if (v8 == CFSetGetTypeID())
          {
            v9 = CFSetGetCount((CFSetRef)*v6);
            v10 = (const void **)malloc_type_malloc(8 * v9, 0xC0040B8AA526DuLL);
            CFSetGetValues((CFSetRef)*v6, v10);
            v11 = CFArrayCreate(kCFAllocatorDefault, v10, v9, &kCFTypeArrayCallBacks);
            if (!v11)
              goto LABEL_19;
            v12 = v11;
            CFDictionaryReplaceValue((CFMutableDictionaryRef)a1, *v7, v11);
            *v6 = v12;
            CFRelease(v12);
            free(v10);
          }
          v13 = *v6++;
          sub_100004AF4(v13);
          ++v7;
          --Count;
        }
        while (Count);
      }
      free(v4);
      free(v5);
    }
    else if (v2 == CFArrayGetTypeID())
    {
      v14 = CFArrayGetCount((CFArrayRef)a1);
      if (v14 >= 1)
      {
        v15 = v14;
        for (i = 0; v15 != i; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, i);
          v18 = CFGetTypeID(ValueAtIndex);
          if (v18 == CFSetGetTypeID())
          {
            v19 = CFSetGetCount((CFSetRef)ValueAtIndex);
            v20 = (const void **)malloc_type_malloc(8 * v19, 0xC0040B8AA526DuLL);
            CFSetGetValues((CFSetRef)ValueAtIndex, v20);
            v21 = CFArrayCreate(kCFAllocatorDefault, v20, v19, &kCFTypeArrayCallBacks);
            if (!v21)
            {
LABEL_19:
              v22 = __stderrp;
              v23 = "can't create array for set replacement";
              goto LABEL_20;
            }
            ValueAtIndex = v21;
            CFArraySetValueAtIndex((CFMutableArrayRef)a1, i, v21);
            CFRelease(ValueAtIndex);
            free(v20);
          }
          sub_100004AF4(ValueAtIndex);
        }
      }
    }
  }
}

void sub_100004DC8(uint64_t a1, uint64_t a2, uint64_t a3, const char **a4)
{
  __int128 v8;
  __int128 v9;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CFStringRef v36;
  const __CFString *v37;
  __CFString *Mutable;
  __CFString *v39;
  const __CFString *Copy;
  const __CFString *v41;
  const __CFString *v42;
  CFStringRef v43;
  const char *CStringPtr;
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
  char v66;
  void *v67;
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
  uint64_t v79;
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
  uint64_t v91;
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
  __int128 v103;
  __int128 v104;
  unsigned int v105;
  unsigned int v106;
  char *v107;
  const __CFDictionary *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unsigned int v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unsigned int v125;
  char *v126;
  char v127;
  char v128;
  char v129;
  char v130;
  char v131;
  char v132;
  _OWORD v133[4];
  uint64_t entryID;
  CFMutableDictionaryRef properties;
  unint64_t v136;
  uint64_t v137;
  uint32_t KernelRetainCount;
  _DWORD context[2];
  uint64_t v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  io_name_t name;
  io_name_t location;
  _OWORD v147[8];

  memset(v147, 0, sizeof(v147));
  context[0] = a1;
  context[1] = a2;
  v140 = a3;
  v8 = *((_OWORD *)a4 + 1);
  v141 = *(_OWORD *)a4;
  v142 = v8;
  v9 = *((_OWORD *)a4 + 3);
  v143 = *((_OWORD *)a4 + 2);
  v144 = v9;
  KernelRetainCount = 0;
  v136 = 0;
  v137 = 0;
  memset(location, 0, sizeof(location));
  memset(name, 0, sizeof(name));
  properties = 0;
  if (IORegistryEntryGetNameInPlane(a1, a4[6], name))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain name");
    strcpy(name, "<name error>");
  }
  sub_1000053CC(1, a2, a3, v10, v11, v12, v13, v14, v127);
  if ((*(_WORD *)a4 & 2) != 0)
    tputs((const char *)qword_10000C000, 1, j__putchar);
  sub_100005494("%s", v15, v16, v17, v18, v19, v20, v21, (char)name);
  if ((*(_WORD *)a4 & 2) != 0)
    tputs((const char *)qword_10000C020, 1, j__putchar);
  if (!IORegistryEntryGetLocationInPlane(a1, a4[6], location))
    sub_100005494("@%s", v22, v23, v24, v25, v26, v27, v28, (char)location);
  sub_100005494("  <class ", v22, v23, v24, v25, v26, v27, v28, v128);
  if ((*(_WORD *)a4 & 0x10) != 0)
  {
    v36 = _IOObjectCopyClass(a1);
    if (v36)
    {
      v37 = v36;
      Mutable = CFStringCreateMutable(0, 512);
      if (Mutable)
      {
        v39 = Mutable;
        CFStringInsert(Mutable, 0, v37);
        Copy = CFStringCreateCopy(0, v37);
        if (Copy)
        {
          v41 = Copy;
          v42 = IOObjectCopySuperclassForClass(Copy);
          CFRelease(v41);
          if (v42)
          {
            while (!CFEqual(v42, CFSTR("OSObject")))
            {
              CFStringInsert(v39, 0, CFSTR(":"));
              CFStringInsert(v39, 0, v42);
              v43 = IOObjectCopySuperclassForClass(v42);
              CFRelease(v42);
              v42 = v43;
              if (!v43)
                goto LABEL_21;
            }
            CFRelease(v42);
          }
        }
LABEL_21:
        CStringPtr = CFStringGetCStringPtr(v39, 0x8000100u);
        if (CStringPtr)
          sub_100005494("%s", v45, v46, v47, v48, v49, v50, v51, (char)CStringPtr);
        CFRelease(v39);
      }
      CFRelease(v37);
    }
  }
  else
  {
    if (_IOObjectGetClass(a1, (char *)1))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain class");
      strcpy((char *)v147, "<class error>");
    }
    sub_100005494("%s", v29, v30, v31, v32, v33, v34, v35, (char)v147);
  }
  entryID = 0;
  if (!IORegistryEntryGetRegistryEntryID(a1, &entryID))
    sub_100005494(", id 0x%llx", v52, v53, v54, v55, v56, v57, v58, entryID);
  if (_IOObjectConformsTo(a1, "IOService"))
  {
    if (IOServiceGetBusyStateAndTime(a1, &v137, &KernelRetainCount, &v136))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain state");
      v66 = 0;
      v136 = 0;
      v137 = 0;
      KernelRetainCount = 0;
    }
    else
    {
      v66 = v137;
    }
    v67 = (v66 & 2) != 0 ? &unk_100007846 : "!";
    sub_100005494(", %sregistered, %smatched, %sactive", v59, v60, v61, v62, v63, v64, v65, (char)v67);
    sub_100005494(", busy %ld", v68, v69, v70, v71, v72, v73, v74, KernelRetainCount);
    if (v136)
      sub_100005494(" (%lld ms)", v75, v76, v77, v78, v79, v80, v81, v136 / 0xF4240);
  }
  KernelRetainCount = IOObjectGetKernelRetainCount(a1);
  sub_100005494(", retain %ld", v82, v83, v84, v85, v86, v87, v88, KernelRetainCount);
  sub_1000054BC(">", v89, v90, v91, v92, v93, v94, v95, v129);
  if ((*(_WORD *)a4 & 0x20) != 0
    || (v103 = *((_OWORD *)a4 + 1),
        v133[0] = *(_OWORD *)a4,
        v133[1] = v103,
        v104 = *((_OWORD *)a4 + 3),
        v133[2] = *((_OWORD *)a4 + 2),
        v133[3] = v104,
        sub_100004864(a1, (uint64_t)v133)))
  {
    v105 = 0;
    v106 = a2 + 1;
    do
    {
      if (((1 << v105) & (unint64_t)a3) != 0)
        v107 = "| ";
      else
        v107 = "  ";
      sub_100005494(v107, v96, v97, v98, v99, v100, v101, v102, v130);
      ++v105;
    }
    while (v105 <= v106);
    sub_1000054BC("{", v96, v97, v98, v99, v100, v101, v102, v130);
    if (IORegistryEntryCreateCFProperties(a1, &properties, kCFAllocatorDefault, 0))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain properties");
      properties = 0;
    }
    else
    {
      v108 = properties;
      if (properties)
      {
LABEL_45:
        CFDictionaryApplyFunction(v108, (CFDictionaryApplierFunction)sub_100005520, context);
        v116 = 0;
        do
        {
          if (((1 << v116) & (unint64_t)a3) != 0)
            v117 = "| ";
          else
            v117 = "  ";
          sub_100005494(v117, v109, v110, v111, v112, v113, v114, v115, v131);
          ++v116;
        }
        while (v116 <= v106);
        sub_1000054BC("}", v109, v110, v111, v112, v113, v114, v115, v131);
        v125 = 0;
        do
        {
          if (((1 << v125) & (unint64_t)a3) != 0)
            v126 = "| ";
          else
            v126 = "  ";
          sub_100005494(v126, v118, v119, v120, v121, v122, v123, v124, v132);
          ++v125;
        }
        while (v125 <= v106);
        sub_1000054BC((char *)&unk_100007846, v118, v119, v120, v121, v122, v123, v124, v132);
        CFRelease(properties);
        return;
      }
    }
    v108 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    properties = v108;
    if (!v108)
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't create dictionary");
      exit(1);
    }
    goto LABEL_45;
  }
}

uint64_t sub_1000053CC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  int v11;
  char *v12;
  uint64_t result;
  unsigned int v14;
  unsigned int v15;
  char *v16;
  char v17;

  v10 = a2;
  if (a1)
  {
    if ((_DWORD)a2)
    {
      v11 = 0;
      do
      {
        if (((1 << v11) & (unint64_t)a3) != 0)
          v12 = "| ";
        else
          v12 = "  ";
        sub_100005494(v12, a2, a3, a4, a5, a6, a7, a8, v17);
        ++v11;
      }
      while (v10 != v11);
    }
    return sub_100005494("+-o ", a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    v14 = 0;
    v15 = a2 + 1;
    do
    {
      if (((1 << v14) & (unint64_t)a3) != 0)
        v16 = "| ";
      else
        v16 = "  ";
      result = sub_100005494(v16, a2, a3, a4, a5, a6, a7, a8, v17);
      ++v14;
    }
    while (v14 <= v15);
  }
  return result;
}

uint64_t sub_100005494(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_1000064C4(a1, &a9);
}

uint64_t sub_1000054BC(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result;

  sub_1000064C4(a1, &a9);
  if (byte_10000C01C == 1)
    putchar(36);
  result = putchar(10);
  byte_10000C01C = 0;
  dword_10000C018 = dword_10000C008;
  return result;
}

uint64_t sub_100005520(const __CFString *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  char *v15;
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
  char *v44;
  uint64_t result;
  io_registry_entry_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int *v53;
  io_registry_entry_t v54;
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
  BOOL v75;
  CFTypeID v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  CFIndex v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  CFIndex v93;
  unsigned int v94;
  unsigned int v95;
  uint64_t v96;
  CFTypeID v97;
  const UInt8 *BytePtr;
  const UInt8 *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i;
  unsigned int v109;
  uint64_t v110;
  unsigned int v111;
  char *v112;
  CFTypeID v113;
  CFIndex Length;
  CFIndex v115;
  const UInt8 *v116;
  io_registry_entry_t v117;
  int v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unsigned int v134;
  uint64_t v135;
  unsigned int v136;
  char *v137;
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
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  int v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unsigned int v169;
  uint64_t v170;
  unsigned int v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  int v181;
  int v182;
  int v183;
  int *v184;
  int64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
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
  char v200;
  unsigned int v201;
  uint64_t v202;
  unsigned int v203;
  char *v204;
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
  uint64_t v219;
  int v220;
  io_registry_entry_t v221;
  int v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  unsigned int v230;
  uint64_t v231;
  unsigned int v232;
  char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  unsigned int v241;
  uint64_t v242;
  unsigned int v243;
  char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  int v253;
  const UInt8 *v254;
  unint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  char v270;
  uint64_t v271;
  uint64_t v272;
  unsigned int v273;
  uint64_t v274;
  unsigned int v275;
  char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  int v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  int v292;
  const char *v293;
  char *v294;
  CFIndex v295;
  BOOL v296;
  CFIndex v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  int v305;
  uint64_t j;
  char v307;
  char *v308;
  CFIndex v309;
  unsigned int v310;
  unsigned int v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  char *v321;
  unsigned int v322;
  char v323;
  uint64_t v324;
  char *v325;
  unsigned int v326;
  int v327;
  unsigned int v328;
  char v329;
  char v330;
  _BYTE *v331;
  size_t v332;
  _BYTE *v333;
  unsigned int v334;
  int v335;
  unsigned int v337;
  uint64_t v338;
  unsigned int v339;
  char *v340;
  char v341;
  FILE *v342;
  const char *v343;
  char v344;
  char v345;
  char v346;
  char v347;
  char v348;
  char v349;
  char v350;
  char v351;
  char v352;
  char v353;
  char v354;
  char v355;
  char v356;
  char v357;
  char v358;
  char v359;
  char v360;
  char v361;
  char v362;
  char v363;
  uint64_t v364;
  uint64_t v365;
  unint64_t v366;
  uint64_t v367;
  int *v368;
  CFIndex v369;
  CFIndex v370;
  int v371;
  int v372;
  const UInt8 *v373;
  uint64_t v374;
  io_registry_entry_t parent;
  _DWORD name[130];

  v9 = a3;
  v12 = 0;
  v13 = *(_QWORD *)(a3 + 8);
  v14 = *(_DWORD *)(a3 + 4) + 1;
  do
  {
    if ((v13 & (1 << v12)) != 0)
      v15 = "| ";
    else
      v15 = "  ";
    sub_100005494(v15, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v344);
    ++v12;
  }
  while (v12 <= v14);
  sub_100005494("  ", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v344);
  sub_100006594(a1, v16, v17, v18, v19, v20, v21, v22, v345);
  sub_100005494(" = ", v23, v24, v25, v26, v27, v28, v29, v346);
  if ((*(_WORD *)(v9 + 16) & 4) == 0)
  {
    sub_100006594(a2, v30, v31, v32, v33, v34, v35, v36, v347);
    v44 = (char *)&unk_100007846;
    return sub_1000054BC(v44, v37, v38, v39, v40, v41, v42, v43, a9);
  }
  v46 = *(_DWORD *)v9;
  v374 = v9;
  if (CFStringCompare(a1, CFSTR("reg"), 0) == kCFCompareEqualTo)
  {
    parent = 0;
    memset(name, 0, 128);
    if (!IORegistryEntryGetParentEntry(v46, "IODeviceTree", &parent))
    {
      if (IORegistryEntryGetNameInPlane(parent, "IODeviceTree", (char *)name))
      {
        fprintf(__stderrp, "ioreg: error: %s.\n", "could not get name of parent");
        strcpy((char *)name, "<name error>");
      }
      IOObjectRelease(parent);
      v75 = LOWORD(name[0]) == 25456 && BYTE2(name[0]) == 105;
      if (v75)
        return sub_100006B20(a2, v9, v69, v70, v71, v72, v73, v74, v347);
    }
    goto LABEL_27;
  }
  if (CFStringCompare(a1, CFSTR("assigned-addresses"), 0) == kCFCompareEqualTo)
    return sub_100006B20(a2, v9, v47, v48, v49, v50, v51, v52, a9);
  if (CFStringCompare(a1, CFSTR("slot-names"), 0) == kCFCompareEqualTo)
  {
    v97 = CFGetTypeID(a2);
    if (v97 == CFDataGetTypeID())
    {
      if (!CFDataGetLength((CFDataRef)a2) || (BytePtr = CFDataGetBytePtr((CFDataRef)a2), !*(_DWORD *)BytePtr))
      {
        v44 = "<>";
        return sub_1000054BC(v44, v37, v38, v39, v40, v41, v42, v43, a9);
      }
      v99 = BytePtr;
      v100 = (const char *)(BytePtr + 4);
      result = sub_1000054BC((char *)&unk_100007846, v37, v38, v39, v40, v41, v42, v43, v347);
      for (i = 0; i != 32; ++i)
      {
        if (((*(_DWORD *)v99 >> i) & 1) != 0)
        {
          v109 = 0;
          v110 = *(_QWORD *)(v374 + 8);
          v111 = *(_DWORD *)(v374 + 4) + 1;
          do
          {
            if ((v110 & (1 << v109)) != 0)
              v112 = "| ";
            else
              v112 = "  ";
            sub_100005494(v112, v101, v102, v103, v104, v105, v106, v107, v349);
            ++v109;
          }
          while (v109 <= v111);
          sub_1000054BC("    %02lu: %s", v101, v102, v103, v104, v105, v106, v107, i);
          result = strlen(v100);
          v100 += result + 1;
        }
      }
      return result;
    }
    v342 = __stderrp;
    v343 = "invalid phys addr";
    goto LABEL_218;
  }
  if (CFStringCompare(a1, CFSTR("ranges"), 0) == kCFCompareEqualTo)
  {
    v113 = CFGetTypeID(a2);
    if (v113 == CFDataGetTypeID())
    {
      Length = CFDataGetLength((CFDataRef)a2);
      if (!Length)
      {
        v294 = "<>";
        return sub_1000054BC(v294, v85, v86, v87, v88, v89, v90, v91, v347);
      }
      v115 = Length;
      parent = 0;
      v116 = CFDataGetBytePtr((CFDataRef)a2);
      v366 = v115;
      if (IORegistryEntryGetParentEntry(*(_DWORD *)v9, "IODeviceTree", &parent))
      {
        fprintf(__stderrp, "ioreg: error: %s.\n", "unable to get device tree parent");
        v117 = 0;
        parent = 0;
      }
      else
      {
        v117 = parent;
      }
      v118 = sub_100006E0C(v117, CFSTR("#address-cells"));
      IOObjectRelease(parent);
      v119 = sub_100006E0C(*(_DWORD *)v9, CFSTR("#address-cells"));
      v371 = sub_100006E0C(*(_DWORD *)v9, CFSTR("#size-cells"));
      sub_1000054BC((char *)&unk_100007846, v120, v121, v122, v123, v124, v125, v126, v347);
      v134 = 0;
      v135 = *(_QWORD *)(v9 + 8);
      v136 = *(_DWORD *)(v9 + 4) + 1;
      do
      {
        if ((v135 & (1 << v134)) != 0)
          v137 = "| ";
        else
          v137 = "  ";
        sub_100005494(v137, v127, v128, v129, v130, v131, v132, v133, v350);
        ++v134;
      }
      while (v134 <= v136);
      sub_100005494("    ", v127, v128, v129, v130, v131, v132, v133, v350);
      v145 = 0;
      name[0] = v119;
      name[1] = v118;
      name[2] = v371;
      do
      {
        sub_100005494("%s", v138, v139, v140, v141, v142, v143, v144, (char)(&off_100008348)[v145]);
        v153 = name[v145];
        if ((int)v153 < 2)
        {
          sub_100005494(" ", v146, v147, v148, v149, v150, v151, v152, v351);
        }
        else
        {
          sub_100005494("-", v146, v147, v148, v149, v150, v151, v152, v351);
          v154 = v153 - 1;
          do
          {
            if (--v154)
              v155 = "---------";
            else
              v155 = "-------- ";
            sub_100005494(v155, v138, v139, v140, v141, v142, v143, v144, v352);
          }
          while (v154);
        }
        ++v145;
      }
      while (v145 != 3);
      v156 = v119 + v118 + v371;
      result = sub_1000054BC((char *)&unk_100007846, v138, v139, v140, v141, v142, v143, v144, v352);
      v164 = 4 * v156;
      if (v164 <= v366)
      {
        v165 = 0;
        v166 = v366 / v164;
        if ((unint64_t)v156 <= 1)
          v167 = 1;
        else
          v167 = v156;
        v367 = v167;
        if (v166 <= 1)
          v168 = 1;
        else
          v168 = v166;
        do
        {
          v169 = 0;
          v170 = *(_QWORD *)(v374 + 8);
          v171 = *(_DWORD *)(v374 + 4) + 1;
          do
          {
            if ((v170 & (1 << v169)) != 0)
              v172 = "| ";
            else
              v172 = "  ";
            sub_100005494(v172, v157, v158, v159, v160, v161, v162, v163, v353);
            ++v169;
          }
          while (v169 <= v171);
          sub_100005494("    ", v157, v158, v159, v160, v161, v162, v163, v353);
          if (v156)
          {
            v180 = v367;
            do
            {
              v181 = *(_DWORD *)v116;
              v116 += 4;
              sub_100005494("%08lx ", v173, v174, v175, v176, v177, v178, v179, v181);
              --v180;
            }
            while (v180);
          }
          result = sub_1000054BC((char *)&unk_100007846, v173, v174, v175, v176, v177, v178, v179, v354);
          ++v165;
        }
        while (v165 != v168);
      }
      return result;
    }
    v342 = __stderrp;
    v343 = "invalid ranges";
LABEL_218:
    fprintf(v342, "ioreg: error: %s.\n", v343);
    exit(1);
  }
  if (CFStringCompare(a1, CFSTR("interrupt-map"), 0))
  {
    if (CFStringCompare(a1, CFSTR("interrupts"), 0))
    {
      if (CFStringCompare(a1, CFSTR("interrupt-parent"), 0) == kCFCompareEqualTo)
      {
        parent = 0;
        memset((char *)name + 1, 0, 511);
        v53 = (int *)CFDataGetBytePtr((CFDataRef)a2);
        result = sub_100006E94(*v53, &parent);
        if ((_DWORD)result)
        {
          LOBYTE(name[0]) = 0;
          v54 = parent;
          sub_100006F6C(parent, (char *)name);
          sub_100005494("<%08lx>", v55, v56, v57, v58, v59, v60, v61, *v53);
          if (LOBYTE(name[0]))
            sub_100005494(" (%s)", v62, v63, v64, v65, v66, v67, v68, (char)name);
          sub_1000054BC((char *)&unk_100007846, v62, v63, v64, v65, v66, v67, v68, v348);
          return IOObjectRelease(v54);
        }
        return result;
      }
LABEL_27:
      v76 = CFGetTypeID(a2);
      if (v76 == CFDataGetTypeID())
      {
        v84 = CFDataGetLength((CFDataRef)a2);
        v92 = (char *)CFDataGetBytePtr((CFDataRef)a2);
        v370 = v84;
        if (v84 < 1)
        {
          v95 = 0;
          v94 = 0;
          v93 = 0;
          goto LABEL_147;
        }
        v93 = 0;
        v94 = 0;
        v95 = 0;
LABEL_30:
        if (v92[v93])
        {
          if (v93 >= v84)
            goto LABEL_147;
          while (1)
          {
            v96 = v92[v93];
            if (v92[v93] < 0)
            {
              if (__maskrune(v92[v93], 0x40000uLL))
              {
LABEL_34:
                ++v95;
                goto LABEL_38;
              }
            }
            else if ((_DefaultRuneLocale.__runetype[v96] & 0x40000) != 0)
            {
              goto LABEL_34;
            }
            if ((char)v96 > -2)
            {
              v84 = v370;
              if (v92[v93])
                goto LABEL_147;
              if (++v93 >= v370)
                goto LABEL_147;
              goto LABEL_30;
            }
            ++v94;
LABEL_38:
            v84 = v370;
            if (v370 == ++v93)
              goto LABEL_146;
          }
        }
        if (v93 < v84)
        {
          while (!v92[v93])
          {
            if (v84 == ++v93)
            {
LABEL_146:
              v93 = v84;
              break;
            }
          }
        }
LABEL_147:
        if (byte_10000C028)
          v295 = 0;
        else
          v295 = v93;
        v296 = v84 != 1 && v95 >> 2 >= v94;
        if (v296)
          v297 = v295;
        else
          v297 = 0;
        if (v95 && v297 >= v84)
        {
          sub_100005494("<", v85, v86, v87, v88, v89, v90, v91, v347);
          if (v84 >= 1)
          {
            v305 = 0;
            for (j = 0; j != v84; ++j)
            {
              while (1)
              {
                v307 = v92[j];
                if (v307)
                  break;
                if (v305 == 1)
                {
                  sub_100005494("\"", v298, v299, v300, v301, v302, v303, v304, v362);
                  v305 = 0;
                  if (++j != v84)
                    continue;
                }
                goto LABEL_212;
              }
              if (!v305)
              {
                if (j)
                  v308 = ",\"";
                else
                  v308 = "\"";
                sub_100005494(v308, v298, v299, v300, v301, v302, v303, v304, v362);
                v307 = v92[j];
                v305 = 1;
              }
              sub_100005494("%c", v298, v299, v300, v301, v302, v303, v304, v307);
            }
            sub_100005494("\"", v298, v299, v300, v301, v302, v303, v304, v362);
          }
        }
        else
        {
          if (v84 >= 9)
          {
            v309 = 0;
            v310 = 0;
            v311 = (*(_DWORD *)(v9 + 72) - 2 * *(_DWORD *)(v9 + 4) - 20) >> 2;
            if (v311 >= 0x20)
              v312 = 32;
            else
              v312 = v311;
            v365 = v312;
            do
            {
              sub_1000054BC((char *)&unk_100007846, v85, v86, v87, v88, v89, v90, v91, v347);
              v369 = v310 + v312;
              if (v84 >= v369)
                v320 = v312;
              else
                v320 = v84 - v309;
              LOBYTE(name[2]) = 58;
              v321 = (char *)&name[1] + 3;
              v322 = v310;
              if (!v310)
                goto LABEL_185;
              do
              {
                if ((v322 & 0xF) >= 0xA)
                  v323 = (v322 & 0xF) + 55;
                else
                  v323 = v322 & 0xF | 0x30;
                *v321-- = v323;
                v296 = v322 >= 0x10;
                v322 >>= 4;
              }
              while (v296);
              if (v321 >= (char *)name)
LABEL_185:
                memset(name, 48, v321 - (char *)name + 1);
              if (v320 < 1)
              {
                LODWORD(v324) = 0;
                v331 = (char *)&name[2] + 1;
              }
              else
              {
                LODWORD(v324) = 0;
                v325 = (char *)&name[2] + 1;
                do
                {
                  v326 = v92[v310 + v324];
                  *v325 = 32;
                  v327 = (v326 >> 4) + 55;
                  if (v326 < 0xA0)
                    LOBYTE(v327) = (v326 >> 4) | 0x30;
                  v325[1] = v327;
                  v328 = v326 & 0xF;
                  v329 = v326 & 0xF | 0x30;
                  v330 = (v326 & 0xF) + 55;
                  if (v328 < 0xA)
                    v330 = v329;
                  v331 = v325 + 3;
                  v325[2] = v330;
                  v324 = (v324 + 1);
                  v325 += 3;
                }
                while (v320 > v324);
              }
              if (v324 < v312)
              {
                v332 = 3 * (v312 + ~(_DWORD)v324) + 3;
                memset(v331, 32, v332);
                v331 += v332;
              }
              *v331 = 32;
              v333 = v331 + 1;
              if (v320 >= 1)
              {
                v334 = 1;
                do
                {
                  v335 = v92[v310 - 1 + v334];
                  if ((v335 - 127) < 0xFFFFFFA1)
                    LOBYTE(v335) = 46;
                  *v333++ = v335;
                }
                while (v320 > v334++);
              }
              v337 = 0;
              *v333 = 0;
              v338 = *(_QWORD *)(v9 + 8);
              v339 = *(_DWORD *)(v9 + 4) + 1;
              do
              {
                if ((v338 & (1 << v337)) != 0)
                  v340 = "| ";
                else
                  v340 = "  ";
                sub_100005494(v340, v313, v314, v315, v316, v317, v318, v319, v363);
                ++v337;
              }
              while (v337 <= v339);
              sub_100005494("    %s", v313, v314, v315, v316, v317, v318, v319, (char)name);
              v309 = v369;
              v84 = v370;
              v310 = v369;
              v312 = v365;
            }
            while (v370 > v369);
            goto LABEL_213;
          }
          sub_100005494("<", v85, v86, v87, v88, v89, v90, v91, v347);
          if (v84 >= 1)
          {
            do
            {
              v341 = *v92++;
              sub_100005494("%02x", v298, v299, v300, v301, v302, v303, v304, v341);
              --v84;
            }
            while (v84);
          }
        }
LABEL_212:
        sub_100005494(">", v298, v299, v300, v301, v302, v303, v304, v362);
      }
      else
      {
        sub_100006594(a2, v77, v78, v79, v80, v81, v82, v83, v347);
      }
LABEL_213:
      v294 = (char *)&unk_100007846;
      return sub_1000054BC(v294, v85, v86, v87, v88, v89, v90, v91, v347);
    }
    v254 = CFDataGetBytePtr((CFDataRef)a2);
    v255 = CFDataGetLength((CFDataRef)a2);
    result = sub_1000054BC((char *)&unk_100007846, v256, v257, v258, v259, v260, v261, v262, v347);
    if ((uint64_t)(v255 & 0xFFFFFFFFFFFFFFFCLL) >= 1)
    {
      v270 = 0;
      v271 = 0;
      v373 = &v254[4 * (v255 >> 2)];
      v272 = (v255 >> 2) - 1;
      do
      {
        v273 = 0;
        v274 = *(_QWORD *)(v374 + 8);
        v275 = *(_DWORD *)(v374 + 4) + 1;
        do
        {
          if ((v274 & (1 << v273)) != 0)
            v276 = "| ";
          else
            v276 = "  ";
          sub_100005494(v276, v263, v264, v265, v266, v267, v268, v269, v361);
          ++v273;
        }
        while (v273 <= v275);
        sub_100005494("    %02ld: ", v263, v264, v265, v266, v267, v268, v269, v270);
        v284 = *(_DWORD *)v254;
        if (v271 >= v272)
        {
          result = sub_1000054BC("parent interrupt-map entry: %08lx", v277, v278, v279, v280, v281, v282, v283, *(_DWORD *)v254);
        }
        else
        {
          v254 += 4;
          sub_100005494("specifier: %08lx (vector: %02lx) sense: %08lx (", v277, v278, v279, v280, v281, v282, v283, v284);
          v292 = *(_DWORD *)v254;
          if ((*(_DWORD *)v254 & 2) != 0)
          {
            sub_100005494("HyperTransport vector: %04lx, ", v285, v286, v287, v288, v289, v290, v291, SBYTE2(v292));
            v292 = *(_DWORD *)v254;
          }
          ++v271;
          v75 = (v292 & 1) == 0;
          v293 = "level";
          if (v75)
            v293 = "edge";
          result = sub_1000054BC("%s)", v285, v286, v287, v288, v289, v290, v291, (char)v293);
        }
        v254 += 4;
        ++v271;
        ++v270;
      }
      while (v254 < v373);
    }
  }
  else
  {
    parent = 0;
    memset(name, 0, 512);
    v182 = sub_100006E0C(*(_DWORD *)v9, CFSTR("#address-cells"));
    v183 = sub_100006E0C(*(_DWORD *)v9, CFSTR("#interrupt-cells"));
    v184 = (int *)CFDataGetBytePtr((CFDataRef)a2);
    v185 = CFDataGetLength((CFDataRef)a2) & 0xFFFFFFFFFFFFFFFCLL;
    result = sub_1000054BC((char *)&unk_100007846, v186, v187, v188, v189, v190, v191, v192, v347);
    if (v185 >= 1)
    {
      v200 = 0;
      v368 = (int *)((char *)v184 + v185);
      v364 = v183 + v182;
      do
      {
        v201 = 0;
        v202 = *(_QWORD *)(v9 + 8);
        v203 = *(_DWORD *)(v9 + 4) + 1;
        do
        {
          if ((v202 & (1 << v201)) != 0)
            v204 = "| ";
          else
            v204 = "  ";
          sub_100005494(v204, v193, v194, v195, v196, v197, v198, v199, v355);
          ++v201;
        }
        while (v201 <= v203);
        sub_100005494("    %02ld: ", v193, v194, v195, v196, v197, v198, v199, v200);
        sub_100005494("  child: ", v205, v206, v207, v208, v209, v210, v211, v356);
        v219 = v364;
        if ((int)v364 >= 1)
        {
          do
          {
            v220 = *v184++;
            sub_100005494("%08lx ", v212, v213, v214, v215, v216, v217, v218, v220);
            --v219;
          }
          while (v219);
        }
        sub_1000054BC((char *)&unk_100007846, v212, v213, v214, v215, v216, v217, v218, v357);
        if (sub_100006E94(*v184, &parent))
        {
          v221 = parent;
        }
        else
        {
          fprintf(__stderrp, "ioreg: error: %s.\n", "error looking up phandle");
          v221 = 0;
          parent = 0;
        }
        v372 = sub_100006E0C(v221, CFSTR("#address-cells"));
        v222 = sub_100006E0C(v221, CFSTR("#interrupt-cells"));
        LOBYTE(name[0]) = 0;
        sub_100006F6C(v221, (char *)name);
        IOObjectRelease(v221);
        v230 = 0;
        v231 = *(_QWORD *)(v374 + 8);
        v232 = *(_DWORD *)(v374 + 4) + 1;
        do
        {
          if ((v231 & (1 << v230)) != 0)
            v233 = "| ";
          else
            v233 = "  ";
          sub_100005494(v233, v223, v224, v225, v226, v227, v228, v229, v358);
          ++v230;
        }
        while (v230 <= v232);
        sub_1000054BC("        phandle: %08lx (%s)", v223, v224, v225, v226, v227, v228, v229, *v184);
        v241 = 0;
        v242 = *(_QWORD *)(v374 + 8);
        v243 = *(_DWORD *)(v374 + 4) + 1;
        do
        {
          if ((v242 & (1 << v241)) != 0)
            v244 = "| ";
          else
            v244 = "  ";
          sub_100005494(v244, v234, v235, v236, v237, v238, v239, v240, v359);
          ++v241;
        }
        while (v241 <= v243);
        sub_100005494("         parent: ", v234, v235, v236, v237, v238, v239, v240, v359);
        ++v184;
        if (v222 + v372 < 1)
        {
          v9 = v374;
        }
        else
        {
          v252 = v222 + v372;
          v9 = v374;
          do
          {
            v253 = *v184++;
            sub_100005494("%08lx ", v245, v246, v247, v248, v249, v250, v251, v253);
            --v252;
          }
          while (v252);
        }
        result = sub_1000054BC((char *)&unk_100007846, v245, v246, v247, v248, v249, v250, v251, v360);
        ++v200;
      }
      while (v184 < v368);
    }
  }
  return result;
}

uint64_t sub_1000064C4(char *__format, va_list a2)
{
  int v2;
  char *v3;
  char *i;
  uint64_t result;

  if (!dword_10000C008)
    return vprintf(__format, a2);
  v2 = vsnprintf((char *)qword_10000C010, dword_10000C018, __format, a2);
  v3 = (char *)qword_10000C010;
  for (i = strchr((char *)qword_10000C010, 10); i; i = strchr(v3, 10))
    *i = 32;
  result = printf("%s", v3);
  if (v2 >= dword_10000C018)
  {
    v2 = dword_10000C018 - 1;
    byte_10000C01C = 1;
  }
  dword_10000C018 -= v2;
  return result;
}

void sub_100006594(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFTypeID v10;
  CFIndex Count;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CFIndex Length;
  char *BytePtr;
  CFIndex v44;
  unsigned int v45;
  unsigned int v46;
  BOOL v47;
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
  char *v63;
  CFIndex v64;
  CFIndex v66;
  int v67;
  uint64_t i;
  char v69;
  char *v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  char v80;
  char v81;
  char context;
  char v83;
  uint64_t valuePtr;
  CFRange v85;

  v10 = CFGetTypeID(a1);
  if (v10 == CFArrayGetTypeID())
  {
    context = 1;
    Count = CFArrayGetCount((CFArrayRef)a1);
    sub_100005494("(", v12, v13, v14, v15, v16, v17, v18, v79);
    v85.location = 0;
    v85.length = Count;
    CFArrayApplyFunction((CFArrayRef)a1, v85, (CFArrayApplierFunction)sub_100006A54, &context);
    v26 = ")";
LABEL_3:
    sub_100005494(v26, v19, v20, v21, v22, v23, v24, v25, v80);
    return;
  }
  if (v10 == CFBooleanGetTypeID())
  {
    if (CFBooleanGetValue((CFBooleanRef)a1))
      v34 = "Yes";
    else
      v34 = "No";
    goto LABEL_64;
  }
  if (v10 == CFDataGetTypeID())
  {
    sub_100005494("<", v35, v36, v37, v38, v39, v40, v41, v79);
    Length = CFDataGetLength((CFDataRef)a1);
    BytePtr = (char *)CFDataGetBytePtr((CFDataRef)a1);
    if (Length < 1)
    {
      v46 = 0;
      v45 = 0;
      v44 = 0;
LABEL_37:
      if (byte_10000C028)
        v64 = 0;
      else
        v64 = v44;
      if (Length != 1 && v46 >> 2 >= v45)
        v66 = v64;
      else
        v66 = 0;
      if (v46 && v66 >= Length)
      {
        if (Length >= 1)
        {
          v67 = 0;
          for (i = 0; i != Length; ++i)
          {
            while (1)
            {
              v69 = BytePtr[i];
              if (v69)
                break;
              if (v67 == 1)
              {
                sub_100005494("\"", v27, v28, v29, v30, v31, v32, v33, v81);
                v67 = 0;
                if (++i != Length)
                  continue;
              }
              goto LABEL_63;
            }
            if (!v67)
            {
              if (i)
                v70 = ",\"";
              else
                v70 = "\"";
              sub_100005494(v70, v27, v28, v29, v30, v31, v32, v33, v81);
              v69 = BytePtr[i];
              v67 = 1;
            }
            sub_100005494("%c", v27, v28, v29, v30, v31, v32, v33, v69);
          }
          sub_100005494("\"", v27, v28, v29, v30, v31, v32, v33, v81);
        }
      }
      else if (Length >= 1)
      {
        do
        {
          v71 = *BytePtr++;
          sub_100005494("%02x", v27, v28, v29, v30, v31, v32, v33, v71);
          --Length;
        }
        while (Length);
      }
LABEL_63:
      v34 = ">";
      goto LABEL_64;
    }
    v44 = 0;
    v45 = 0;
    v46 = 0;
LABEL_12:
    if (BytePtr[v44])
      v47 = v44 < Length;
    else
      v47 = 0;
    if (!v47)
      goto LABEL_37;
    while (1)
    {
      v48 = BytePtr[v44];
      if (BytePtr[v44] < 0)
      {
        if (__maskrune(BytePtr[v44], 0x40000uLL))
        {
LABEL_19:
          ++v46;
          goto LABEL_23;
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v48] & 0x40000) != 0)
      {
        goto LABEL_19;
      }
      if ((char)v48 > -2)
      {
        if (BytePtr[v44])
          goto LABEL_37;
        if (++v44 >= Length)
          goto LABEL_37;
        goto LABEL_12;
      }
      ++v45;
LABEL_23:
      if (Length == ++v44)
      {
        v44 = Length;
        goto LABEL_37;
      }
    }
  }
  if (v10 == CFDictionaryGetTypeID())
  {
    v83 = 1;
    sub_100005494("{", v49, v50, v51, v52, v53, v54, v55, v79);
    CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)sub_100006A90, &v83);
    v26 = "}";
    goto LABEL_3;
  }
  if (v10 != CFNumberGetTypeID())
  {
    if (v10 == CFSetGetTypeID())
    {
      sub_100006948((const __CFSet *)a1, v72, v73, v74, v75, v76, v77, v78);
      return;
    }
    if (v10 == CFStringGetTypeID())
    {
      sub_1000069A0(a1);
      return;
    }
    v34 = "<unknown object>";
LABEL_64:
    sub_100005494(v34, v27, v28, v29, v30, v31, v32, v33, a9);
    return;
  }
  valuePtr = 0;
  if (CFNumberGetValue((CFNumberRef)a1, kCFNumberLongLongType, &valuePtr))
  {
    if (byte_10000C028)
      v63 = "0x%qx";
    else
      v63 = "%qu";
    sub_100005494(v63, v56, v57, v58, v59, v60, v61, v62, valuePtr);
  }
}

uint64_t sub_100006948(const __CFSet *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  char v18;
  char context;

  context = 1;
  sub_100005494("[", a2, a3, a4, a5, a6, a7, a8, v17);
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_100006AE4, &context);
  return sub_100005494("]", v9, v10, v11, v12, v13, v14, v15, v18);
}

void sub_1000069A0(const __CFString *a1)
{
  const char *CStringPtr;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFIndex v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    sub_100005494("\"%s\"", v3, v4, v5, v6, v7, v8, v9, (char)CStringPtr);
  }
  else
  {
    v10 = CFStringGetLength(a1) + 1;
    v11 = (char *)malloc_type_malloc(v10, 0x50DF42A6uLL);
    if (v11)
    {
      v12 = v11;
      if (CFStringGetCString(a1, v11, v10, 0x8000100u))
        sub_100005494("\"%s\"", v13, v14, v15, v16, v17, v18, v19, (char)v12);
      free(v12);
    }
  }
}

uint64_t sub_100006A54(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v10;

  if (*a2)
    *a2 = 0;
  else
    sub_100005494(",", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v10);
  return sub_100006594(a1);
}

uint64_t sub_100006A90(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  if (*a3)
    *a3 = 0;
  else
    sub_100005494(",", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v18);
  sub_100006594(a1);
  sub_100005494("=", v10, v11, v12, v13, v14, v15, v16, v18);
  return sub_100006594(a2);
}

uint64_t sub_100006AE4(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v10;

  if (*a2)
    *a2 = 0;
  else
    sub_100005494(",", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v10);
  return sub_100006594(a1);
}

uint64_t sub_100006B20(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFTypeID v11;
  CFIndex Length;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  const UInt8 *BytePtr;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  const UInt8 *v39;
  const UInt8 *v40;
  uint64_t v41;
  unsigned int v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  unsigned int v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  unsigned int v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unsigned int v73;
  uint64_t v74;
  unsigned int v75;
  char *v76;
  char v77;
  char v78;
  char v79;
  char v80;
  char v81;
  char v82;
  char *v83;

  v11 = CFGetTypeID(a1);
  if (v11 != CFDataGetTypeID())
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "invalid phys addr");
    exit(1);
  }
  Length = CFDataGetLength((CFDataRef)a1);
  if (!Length)
    return sub_1000054BC("<>", v13, v14, v15, v16, v17, v18, v19, a9);
  v20 = Length;
  BytePtr = CFDataGetBytePtr((CFDataRef)a1);
  result = sub_1000054BC((char *)&unk_100007846, v22, v23, v24, v25, v26, v27, v28, v77);
  if (v20 >= 0x14)
  {
    v37 = 0;
    do
    {
      v38 = 0;
      v39 = BytePtr;
      v40 = &BytePtr[20 * v37];
      v82 = BYTE2(*(_DWORD *)v40);
      v83 = (&off_100008360)[((unint64_t)*(unsigned int *)v40 >> 24) & 3];
      v41 = *(_QWORD *)(a2 + 8);
      v42 = *(_DWORD *)(a2 + 4) + 1;
      do
      {
        if ((v41 & (1 << v38)) != 0)
          v43 = "| ";
        else
          v43 = "  ";
        sub_100005494(v43, v30, v31, v32, v33, v34, v35, v36, v78);
        ++v38;
      }
      while (v38 <= v42);
      BytePtr = v39;
      sub_1000054BC("    %02lu: phys.hi: %08lx phys.mid: %08lx phys.lo: %08lx", v30, v31, v32, v33, v34, v35, v36, v37);
      v51 = 0;
      v52 = *(_QWORD *)(a2 + 8);
      v53 = *(_DWORD *)(a2 + 4) + 1;
      do
      {
        if ((v52 & (1 << v51)) != 0)
          v54 = "| ";
        else
          v54 = "  ";
        sub_100005494(v54, v44, v45, v46, v47, v48, v49, v50, v79);
        ++v51;
      }
      while (v51 <= v53);
      sub_1000054BC("        size.hi: %08lx size.lo: %08lx", v44, v45, v46, v47, v48, v49, v50, *(_DWORD *)&v39[20 * v37 + 12]);
      v62 = 0;
      v63 = *(_QWORD *)(a2 + 8);
      v64 = *(_DWORD *)(a2 + 4) + 1;
      do
      {
        if ((v63 & (1 << v62)) != 0)
          v65 = "| ";
        else
          v65 = "  ";
        sub_100005494(v65, v55, v56, v57, v58, v59, v60, v61, v80);
        ++v62;
      }
      while (v62 <= v64);
      sub_1000054BC("        bus: %lu dev: %lu func: %lu reg: %lu", v55, v56, v57, v58, v59, v60, v61, v82);
      v73 = 0;
      v74 = *(_QWORD *)(a2 + 8);
      v75 = *(_DWORD *)(a2 + 4) + 1;
      do
      {
        if ((v74 & (1 << v73)) != 0)
          v76 = "| ";
        else
          v76 = "  ";
        sub_100005494(v76, v66, v67, v68, v69, v70, v71, v72, v81);
        ++v73;
      }
      while (v73 <= v75);
      result = sub_1000054BC("        type: %s flags: %s%s%s", v66, v67, v68, v69, v70, v71, v72, (char)v83);
      ++v37;
    }
    while (v37 != v20 / 0x14);
  }
  return result;
}

uint64_t sub_100006E0C(io_registry_entry_t a1, CFStringRef key)
{
  const __CFData *v2;
  const __CFData *v3;
  uint64_t v4;

  v2 = (const __CFData *)IORegistryEntrySearchCFProperty(a1, "IODeviceTree", key, kCFAllocatorDefault, 3u);
  if (v2)
  {
    v3 = v2;
    v4 = *(unsigned int *)CFDataGetBytePtr(v2);
    CFRelease(v3);
  }
  else
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "unable to get properties");
    return 0;
  }
  return v4;
}

BOOL sub_100006E94(int a1, io_service_t *a2)
{
  const __CFDictionary *v3;
  io_service_t MatchingService;
  _BOOL8 v5;
  void *values;
  void *keys;
  void *v9;
  CFTypeRef cf;
  UInt8 bytes[4];

  *(_DWORD *)bytes = a1;
  keys = CFSTR("AAPL,phandle");
  v9 = CFSTR("IOPropertyMatch");
  values = CFDataCreate(0, bytes, 4);
  cf = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v3 = CFDictionaryCreate(0, (const void **)&v9, &cf, 1, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  *a2 = MatchingService;
  v5 = MatchingService != 0;
  CFRelease(cf);
  CFRelease(values);
  return v5;
}

void *sub_100006F6C(io_registry_entry_t a1, io_string_t path)
{
  const char *v3;
  size_t v4;

  if (IORegistryEntryGetPath(a1, "IODeviceTree", path))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "unable to get path");
    strcpy(path, "<path error");
  }
  v3 = strchr(path, 58) + 1;
  v4 = strlen(v3) + 1;
  return memmove(path, v3, v4);
}
