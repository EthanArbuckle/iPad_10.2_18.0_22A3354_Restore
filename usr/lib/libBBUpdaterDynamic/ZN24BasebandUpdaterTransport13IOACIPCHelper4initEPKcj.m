@implementation ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj

_QWORD *___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke(ACFULogging *a1, int a2)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  _QWORD v7[3];
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  *(_DWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 4) + 8) + 24) = a2;
  IOObjectRetain(*(_DWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 4) + 8) + 24));
  v7[0] = off_24CE85E18;
  v8 = v7;
  ACFUSynchronize::Syncher::notify();
  result = v8;
  if (v8 == v7)
  {
    v6 = 4;
    result = v7;
  }
  else
  {
    if (!v8)
      return result;
    v6 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t))(*result + 8 * v6))(result, v4);
}

@end
