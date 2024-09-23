@implementation WFContactPropertySetFromContactFieldProperties

void *__WFContactPropertySetFromContactFieldProperties_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Email")) & 1) != 0)
  {
    v3 = &unk_1E7B8B290;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("Phone")))
  {
    v3 = &unk_1E7B8B2A8;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
