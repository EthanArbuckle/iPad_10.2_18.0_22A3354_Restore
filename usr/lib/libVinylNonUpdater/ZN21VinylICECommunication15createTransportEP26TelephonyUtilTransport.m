@implementation ZN21VinylICECommunication15createTransportEP26TelephonyUtilTransport

const void **___ZN21VinylICECommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke(uint64_t a1, uint64_t a2)
{
  return VinylICECommunication::statusCallback(*(_QWORD *)(a1 + 32), a2, a2);
}

_BYTE *___ZN21VinylICECommunication15createTransportEP26TelephonyUtilTransport_tag_block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  _BYTE *result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  int v8;
  void *exception;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v2 = a1[6];
  *(_QWORD *)(v2 + 48) = a1[7];
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = TelephonyBasebandPCITransportCreate();
  result = (_BYTE *)gBBULogMaskGet();
  if ((*result & 4) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
      v7 = "success";
    else
      v7 = "failure";
    result = (_BYTE *)_BBULog(2, 0, "BBUICE16Communication", ", " TelephonyBasebandPCITransportCreate returns: %s\n", v4, v5, v6, (char)v7);
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    if (!*(_QWORD *)(v2 + 48))
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 67, "/Library/Caches/com.apple.xbs/Sources/VinylRestore/Communication/ICE/VinylICECommunication.cpp", 0x82u, (ctu::LogMessageBuffer *)"Assertion failure(nullptr != fTransportCreated && \"Telephony util transport error.\")", v10, v11, v12, v13);
    }
    v8 = 0;
  }
  else
  {
    result = (_BYTE *)VinylICECommunication::freeTransportSync(v2, a1[7]);
    v8 = 3;
  }
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v8;
  return result;
}

@end
