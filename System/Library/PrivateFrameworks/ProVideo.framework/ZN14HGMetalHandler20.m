@implementation ZN14HGMetalHandler20

HGMetalHandler::CommandEncoderCargo *___ZN14HGMetalHandler20_commitCommandBufferEv_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  HGMetalHandler::CommandEncoderCargo ***v8;
  HGMetalHandler::CommandEncoderCargo **v9;
  HGMetalHandler::CommandEncoderCargo **v10;
  HGMetalHandler::CommandEncoderCargo *result;

  v2 = a1[6];
  std::mutex::lock((std::mutex *)(v2 + 1808));
  v3 = (unint64_t *)(v2 + 1792);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 - 1, v3));
  v5 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v6 = (unint64_t *)(v2 + 1800);
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - v5, v6));
  std::mutex::unlock((std::mutex *)(v2 + 1808));
  std::condition_variable::notify_all((std::condition_variable *)(v2 + 1872));
  atomic_load((unint64_t *)(v2 + 1792));
  atomic_load((unint64_t *)(v2 + 1800));
  kdebug_trace();
  v8 = *(HGMetalHandler::CommandEncoderCargo ****)(*(_QWORD *)(a1[5] + 8) + 24);
  v9 = *v8;
  v10 = v8[1];
  if (*v8 == v10)
  {
    if (!v9)
      goto LABEL_16;
    goto LABEL_7;
  }
  do
  {
    result = *v9;
    if (*v9)
    {
      HGMetalHandler::CommandEncoderCargo::~CommandEncoderCargo(result);
      result = (HGMetalHandler::CommandEncoderCargo *)MEMORY[0x1B5E29170]();
    }
    ++v9;
  }
  while (v9 != v10);
  v8 = *(HGMetalHandler::CommandEncoderCargo ****)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v8)
  {
    v9 = *v8;
    if (!*v8)
LABEL_16:
      JUMPOUT(0x1B5E29170);
LABEL_7:
    v8[1] = v9;
    operator delete(v9);
    goto LABEL_16;
  }
  return result;
}

@end
