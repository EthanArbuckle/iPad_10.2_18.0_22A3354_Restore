@implementation ZN3ggl20MetalResourceManager22commandBufferCompletedEy

_QWORD *___ZN3ggl20MetalResourceManager22commandBufferCompletedEy_block_invoke(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  NSObject *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t *i;
  unint64_t v9;
  uint64_t *v10;
  int64_t v11;
  _QWORD *result;
  uint64_t v13;
  __int16 v14;
  _QWORD v15[3];
  _QWORD *v16;
  _QWORD v17[3];
  _QWORD *v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v18 = v17;
  v15[0] = &off_1E42D7F70;
  v16 = v15;
  v17[0] = &off_1E42D7F28;
  v20 = v19;
  v19[0] = &off_1E42D7F70;
  if (GEOGetGeoGLPerformanceLog_onceToken != -1)
    dispatch_once(&GEOGetGeoGLPerformanceLog_onceToken, &__block_literal_global_4_40479);
  v3 = (id)GEOGetGeoGLPerformanceLog_log;
  if (os_signpost_enabled(v3))
  {
    v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DestroyResources", (const char *)&unk_1A0189141, (uint8_t *)&v14, 2u);
  }

  v4 = v16;
  if (v16 == v15)
  {
    v5 = 4;
    v4 = v15;
  }
  else
  {
    if (!v16)
      goto LABEL_10;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_10:
  v6 = v18;
  if (v18 == v17)
  {
    v7 = 4;
    v6 = v17;
    goto LABEL_14;
  }
  if (v18)
  {
    v7 = 5;
LABEL_14:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }
  for (i = *(uint64_t **)(v1 + 280); i != *(uint64_t **)(v1 + 288); ++i)
  {
    while (1)
    {
      v9 = atomic_load((unint64_t *)(*i + 16));
      if (v9 > v2)
        break;
      ggl::MetalResourceManager::deleteResource(v1, *i);
      v10 = *(uint64_t **)(v1 + 288);
      v11 = (char *)v10 - (char *)(i + 1);
      if (v10 != i + 1)
        memmove(i, i + 1, (char *)v10 - (char *)(i + 1));
      *(_QWORD *)(v1 + 288) = (char *)i + v11;
      if (i == (uint64_t *)((char *)i + v11))
        goto LABEL_22;
    }
  }
LABEL_22:
  if (!v20)
  {
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
    JUMPOUT(0x19F242908);
  }
  (*(void (**)(_QWORD *))(*v20 + 48))(v20);
  result = v20;
  if (v20 == v19)
  {
    v13 = 4;
    result = v19;
  }
  else
  {
    if (!v20)
      return result;
    v13 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v13))();
}

@end
