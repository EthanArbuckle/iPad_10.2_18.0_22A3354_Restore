@implementation ZN2RB15FunctionLibrary14compile

uint64_t *___ZN2RB15FunctionLibrary14compile_shaderERNS_6DeviceERKNS_12CustomShader7ClosureENS3_4TypeEPP7NSError_block_invoke(uint64_t a1)
{
  uint64_t *result;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = RB::Device::should_compile_binary_functions(*(RB::Device **)(a1 + 64));
  result = RB::Device::function_library(*(RB::Device **)(a1 + 64), *(RB::CustomShader::Library **)(*(_QWORD *)(a1 + 72) + 16));
  if (result)
  {
    v3 = result;
    *((_BYTE *)result + 112) = 1;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = (void *)result[1];
    v6 = *(void **)(v4 + 48);
    if (v6 != v5)
    {

      *(_QWORD *)(v4 + 48) = v5;
    }
    v7 = (void *)RB::Device::library(*(RB::Device **)(a1 + 64));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 48);
    if (v9 != v7)
    {

      *(_QWORD *)(v8 + 48) = v7;
    }
    result = RB::UntypedTable::lookup((RB::UntypedTable *)(v3 + 4), (uint64_t *)*(unsigned int *)(a1 + 80), 0);
    if (result)
    {
      v10 = result;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) || *((_BYTE *)result + 104))
      {
        v11 = (uint64_t *)result[1];
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        result = *(uint64_t **)(v12 + 48);
        if (result != v11)
        {

          result = v11;
          *(_QWORD *)(v12 + 48) = result;
        }
      }
      *((_BYTE *)v10 + 105) = 1;
    }
  }
  return result;
}

@end
