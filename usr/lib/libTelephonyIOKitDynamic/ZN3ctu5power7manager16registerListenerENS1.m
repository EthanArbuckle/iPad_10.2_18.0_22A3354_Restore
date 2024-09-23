@implementation ZN3ctu5power7manager16registerListenerENS1

_QWORD *___ZN3ctu5power7manager16registerListenerENS1_10parametersE_block_invoke_25(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  _QWORD *result;
  _QWORD *v9;
  uint64_t v10;

  v2 = a1[4];
  if (a1[5] == 1)
  {
    v3 = *(_DWORD *)(v2 + 80);
    *(_DWORD *)(v2 + 80) = v3 + 1;
    if (!v3)
    {
      ctu::power::manager::spawnRunLoopThread_sync((pthread_t *)v2);
      ctu::power::manager::addPowerSourceToRunLoop((ctu::power::manager *)v2, *(__CFRunLoop **)(v2 + 72));
    }
  }
  v5 = a1[12];
  v4 = a1[13];
  if (v4)
  {
    v6 = (unint64_t *)(v4 + 16);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  result = operator new(0x20uLL);
  result[2] = v5;
  result[3] = v4;
  v10 = *(_QWORD *)(v2 + 88);
  v9 = (_QWORD *)(v2 + 88);
  *result = v10;
  result[1] = v9;
  *(_QWORD *)(v10 + 8) = result;
  *v9 = result;
  ++v9[2];
  return result;
}

@end
