@implementation URLQueryAllowedCharacterSet

uint64_t ___URLQueryAllowedCharacterSet_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  v1 = (void *)qword_1ED05F1D8;
  qword_1ED05F1D8 = (uint64_t)v0;

  v2 = (void *)qword_1ED05F1D8;
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

  return objc_msgSend((id)qword_1ED05F1D8, "removeCharactersInString:", CFSTR("="));
}

@end
