@implementation ZNK2KB26InputManagerSpecialization27create

unsigned int *___ZNK2KB26InputManagerSpecialization27create_input_segment_filterEN3WTF10PassRefPtrIN2TI8Favonius14KeyboardLayoutEEE_block_invoke()
{
  uint64_t v0;
  unsigned int *result;
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  v0 = operator new();
  *(_QWORD *)v0 = &unk_250120DC0;
  *(_QWORD *)(v0 + 8) = 0;
  *(_DWORD *)(v0 + 8) = 1;
  result = (unsigned int *)KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::filter;
  KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::filter = (_UNKNOWN *)v0;
  if (result)
  {
    v2 = result + 2;
    v3 = atomic_load(result + 2);
    if (v3 == 1)
    {
      return (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)result + 8))(result);
    }
    else
    {
      do
        v4 = __ldaxr(v2);
      while (__stlxr(v4 - 1, v2));
    }
  }
  return result;
}

@end
