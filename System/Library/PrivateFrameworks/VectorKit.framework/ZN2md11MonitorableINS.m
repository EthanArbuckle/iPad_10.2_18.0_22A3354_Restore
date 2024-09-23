@implementation ZN2md11MonitorableINS

_QWORD *___ZN2md11MonitorableINS_11ConfigValueI16GEOConfigKeyBOOLbEEE16setCallbackQueueEPU28objcproto17OS_dispatch_queue8NSObjectNSt3__18functionIFvbEEE_block_invoke(_QWORD *result)
{
  _BYTE *v1;
  uint64_t v2;
  char v3;
  BOOL v4;
  char v5;

  v1 = (_BYTE *)result[5];
  if (v1)
  {
    v2 = result[4];
    if ((*v1 & 1) != 0)
    {
      v3 = *(_BYTE *)(v2 + 16);
      if (*(_QWORD *)v2)
        v4 = *(_QWORD *)(v2 + 8) == 0;
      else
        v4 = 1;
      if (!v4)
        *(_BYTE *)(v2 + 16) = GEOConfigGetBOOL();
      result = *(_QWORD **)(v2 + 72);
      if (result)
      {
        v5 = v3;
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, char *))(*result + 48))(result, &v5);
      }
    }
  }
  return result;
}

_QWORD *___ZN2md11MonitorableINS_11ConfigValueI20GEOConfigKeyUIntegerjEEE16setCallbackQueueEPU28objcproto17OS_dispatch_queue8NSObjectNSt3__18functionIFvjEEE_block_invoke(_QWORD *result)
{
  _BYTE *v1;
  uint64_t v2;
  int v3;
  BOOL v4;
  int v5;

  v1 = (_BYTE *)result[5];
  if (v1)
  {
    v2 = result[4];
    if ((*v1 & 1) != 0)
    {
      v3 = *(_DWORD *)(v2 + 16);
      if (*(_QWORD *)v2)
        v4 = *(_QWORD *)(v2 + 8) == 0;
      else
        v4 = 1;
      if (!v4)
        *(_DWORD *)(v2 + 16) = GEOConfigGetUInteger();
      result = *(_QWORD **)(v2 + 72);
      if (result)
      {
        v5 = v3;
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, int *))(*result + 48))(result, &v5);
      }
    }
  }
  return result;
}

_QWORD *___ZN2md11MonitorableINS_11ConfigValueI18GEOConfigKeyDoubledEEE16setCallbackQueueEPU28objcproto17OS_dispatch_queue8NSObjectNSt3__18functionIFvdEEE_block_invoke(_QWORD *result)
{
  _BYTE *v1;
  _QWORD *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (_BYTE *)result[5];
  if (v1)
  {
    v2 = (_QWORD *)result[4];
    if ((*v1 & 1) != 0)
    {
      v3 = v2[2];
      if (*v2)
        v4 = v2[1] == 0;
      else
        v4 = 1;
      if (!v4)
      {
        GEOConfigGetDouble();
        v2[2] = v5;
      }
      result = (_QWORD *)v2[9];
      if (result)
      {
        v6 = v3;
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t *))(*result + 48))(result, &v6);
      }
    }
  }
  return result;
}

_QWORD *___ZN2md11MonitorableINS_13TransformableINS_11ConfigValueI16GEOConfigKeyBOOLbEEEEE16setCallbackQueueEPU28objcproto17OS_dispatch_queue8NSObjectNSt3__18functionIFvbEEE_block_invoke(_QWORD *result)
{
  _BYTE *v1;
  uint64_t v2;
  char v3;
  BOOL v4;
  uint64_t v5;
  char v6;

  v1 = (_BYTE *)result[5];
  if (v1)
  {
    v2 = result[4];
    if ((*v1 & 1) != 0)
    {
      v3 = *(_BYTE *)(v2 + 17);
      if (*(_QWORD *)v2)
        v4 = *(_QWORD *)(v2 + 8) == 0;
      else
        v4 = 1;
      if (!v4)
        *(_BYTE *)(v2 + 16) = GEOConfigGetBOOL();
      v5 = *(_QWORD *)(v2 + 48);
      if (!v5)
      {
        std::__throw_bad_function_call[abi:nn180100]();
        md::Logic<md::LightingLogic,md::LightingLogicContext,md::LogicDependencies<gdc::TypeList<md::CameraContext,md::StyleLogicContext,md::SceneContext,md::ElevationContext>,gdc::TypeList<>>>::~Logic();
      }
      *(_BYTE *)(v2 + 17) = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 48))(v5, v2 + 16);
      result = *(_QWORD **)(v2 + 104);
      if (result)
      {
        v6 = v3;
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, char *))(*result + 48))(result, &v6);
      }
    }
  }
  return result;
}

_QWORD *___ZN2md11MonitorableINS_11ConfigValueI19GEOConfigKeyIntegeriEEE16setCallbackQueueEPU28objcproto17OS_dispatch_queue8NSObjectNSt3__18functionIFviEEE_block_invoke(_QWORD *result)
{
  _BYTE *v1;
  uint64_t v2;
  int v3;
  BOOL v4;
  int v5;

  v1 = (_BYTE *)result[5];
  if (v1)
  {
    v2 = result[4];
    if ((*v1 & 1) != 0)
    {
      v3 = *(_DWORD *)(v2 + 16);
      if (*(_QWORD *)v2)
        v4 = *(_QWORD *)(v2 + 8) == 0;
      else
        v4 = 1;
      if (!v4)
        *(_DWORD *)(v2 + 16) = GEOConfigGetInteger();
      result = *(_QWORD **)(v2 + 72);
      if (result)
      {
        v5 = v3;
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, int *))(*result + 48))(result, &v5);
      }
    }
  }
  return result;
}

_QWORD *___ZN2md11MonitorableINS_13TransformableINS_11ConfigValueI18GEOConfigKeyDoubledEEEEE16setCallbackQueueEPU28objcproto17OS_dispatch_queue8NSObjectNSt3__18functionIFvdEEE_block_invoke(_QWORD *result)
{
  _BYTE *v1;
  double *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  md::ARWalkingLabeler *v7;
  md::LabelManager *v8;
  uint64_t v9;

  v1 = (_BYTE *)result[5];
  if (v1)
  {
    v2 = (double *)result[4];
    if ((*v1 & 1) != 0)
    {
      v3 = *((_QWORD *)v2 + 3);
      if (*(_QWORD *)v2)
        v4 = *((_QWORD *)v2 + 1) == 0;
      else
        v4 = 1;
      if (!v4)
      {
        GEOConfigGetDouble();
        *((_QWORD *)v2 + 2) = v5;
      }
      v6 = *((_QWORD *)v2 + 7);
      if (v6)
      {
        v2[3] = (*(double (**)(uint64_t, _QWORD *))(*(_QWORD *)v6 + 48))(v6, (_QWORD *)v2 + 2);
        result = (_QWORD *)*((_QWORD *)v2 + 14);
        if (result)
        {
          v9 = v3;
          return (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t *))(*result + 48))(result, &v9);
        }
      }
      else
      {
        std::__throw_bad_function_call[abi:nn180100]();
        return (_QWORD *)md::ARWalkingLabeler::ARWalkingLabeler(v7, v8);
      }
    }
  }
  return result;
}

@end
