@implementation AMFDRCopyDeviceKeys

void __AMFDRCopyDeviceKeys_block_invoke()
{
  CFMutableDictionaryRef v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  mach_port_t v4;
  _OWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  kern_return_t v9;
  int key_deterministic;
  size_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  UInt8 *v15;
  UInt8 *v16;
  int v17;
  const __CFAllocator *v18;
  char v19;
  size_t outputStructCnt[4];
  io_connect_t connect[534];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  connect[0] = 0;
  v0 = IOServiceMatching("IOAESAccelerator");
  if (!v0)
    goto LABEL_34;
  v1 = v0;
  CFRetain(v0);
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v1);
  if (!MatchingService)
  {
    CFRelease(v1);
    goto LABEL_34;
  }
  v3 = MatchingService;
  IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, connect);
  CFRelease(v1);
  IOObjectRelease(v3);
  v4 = connect[0];
  if (!connect[0])
  {
LABEL_34:
    AMFDRCopyDeviceKeys_error = 6;
    return;
  }
  v5 = CryptoBufferAllocate();
  if (v5)
  {
    v6 = v5;
    *v5 = kAMDDeviceKeySeed;
    v5[1] = unk_20D396630;
    v5[2] = xmmword_20D396640;
    v5[3] = unk_20D396650;
    v7 = CryptoBufferAllocate();
    if (v7)
    {
      v8 = v7;
      *(_QWORD *)&connect[20] = 0;
      *(_QWORD *)&connect[7] = 0;
      *(_QWORD *)&connect[5] = 0;
      memset(&connect[11], 0, 32);
      outputStructCnt[0] = 88;
      *(_QWORD *)connect = v6;
      *(_QWORD *)&connect[2] = v7;
      connect[4] = 64;
      *(_QWORD *)&connect[9] = 0x8000000000;
      connect[19] = 2105;
      v9 = IOConnectCallStructMethod(v4, 1u, connect, 0x58uLL, connect, outputStructCnt);
      switch(v9)
      {
        case -536870212:
        case -536870211:
        case -536870210:
        case -536870209:
        case -536870208:
        case -536870207:
        case -536870206:
        case -536870205:
        case -536870204:
        case -536870203:
        case -536870202:
        case -536870201:
        case -536870200:
        case -536870199:
        case -536870198:
        case -536870197:
        case -536870196:
        case -536870195:
        case -536870194:
        case -536870193:
        case -536870192:
        case -536870191:
        case -536870190:
        case -536870189:
        case -536870188:
          goto LABEL_17;
        default:
          if (v9)
          {
LABEL_17:
            AMSupportLogInternal();
            v17 = 6;
            goto LABEL_18;
          }
          AMSupportLogInternal();
          memset(connect, 170, 2132);
          if (!ccrng()
            || (strcpy((char *)outputStructCnt, "pseudo_ccrng_allocate"),
                key_deterministic = ccrsa_generate_key_deterministic(),
                AMSupportLogInternal(),
                key_deterministic))
          {
            v19 = 0;
            v17 = 6;
            goto LABEL_28;
          }
          v11 = ccrsa_export_priv_size();
          v12 = malloc_type_malloc(v11, 0x31A5EEB4uLL);
          v13 = ccrsa_ctx_public();
          v14 = MEMORY[0x212BA0F3C](v13);
          v15 = (UInt8 *)malloc_type_malloc(v14, 0x998B1B66uLL);
          v16 = v15;
          if (v12 && v15)
          {
            if (ccrsa_export_priv())
              goto LABEL_36;
            ccrsa_ctx_public();
            if (ccrsa_export_pub())
              goto LABEL_36;
            if (AMSupportDigestSha1())
              AMSupportLogInternal();
            else
              AMSupportLogDumpMemory();
            if (AMSupportRsaCreatePemFromData())
            {
LABEL_36:
              v19 = 0;
              v17 = 6;
            }
            else
            {
              v18 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
              AMFDRCopyDeviceKeys_privKey = (uint64_t)CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0);
              if (AMFDRCopyDeviceKeys_privKey
                && (AMSupportLogInternal(), (AMFDRCopyDeviceKeys_pubKey = (uint64_t)CFDataCreate(v18, v16, v14)) != 0))
              {
                AMSupportLogInternal();
                v17 = 0;
                v19 = 1;
              }
              else
              {
                v19 = 0;
                v17 = 2;
              }
            }
            goto LABEL_25;
          }
          v19 = 0;
          v17 = 2;
          if (v12)
LABEL_25:
            free(v12);
          if (v16)
            free(v16);
LABEL_28:
          if ((v19 & 1) == 0)
          {
            if (AMFDRCopyDeviceKeys_pubKey)
            {
              CFRelease((CFTypeRef)AMFDRCopyDeviceKeys_pubKey);
              AMFDRCopyDeviceKeys_pubKey = 0;
            }
            if (AMFDRCopyDeviceKeys_privKey)
            {
              CFRelease((CFTypeRef)AMFDRCopyDeviceKeys_privKey);
              AMFDRCopyDeviceKeys_privKey = 0;
            }
          }
LABEL_18:
          AMFDRCopyDeviceKeys_error = v17;
          IOServiceClose(v4);
          free(v8);
          break;
      }
    }
    else
    {
      AMFDRCopyDeviceKeys_error = 2;
      IOServiceClose(v4);
    }
    free(v6);
  }
  else
  {
    AMFDRCopyDeviceKeys_error = 2;
    IOServiceClose(v4);
  }
}

@end
