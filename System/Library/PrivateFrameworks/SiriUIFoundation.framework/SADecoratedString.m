@implementation SADecoratedString

uint64_t __102__SADecoratedString_SiriUIFoundationAdditions__sruif_enumerateRangesOfRegionsWithProperty_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2);
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

unint64_t __118__SADecoratedString_SiriUIFoundationAdditions__sruif_attributedStringValueWithAttribute_value_forRegionsWithProperty___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "length");
  if (result >= a2 + a3)
    return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, a3);
  return result;
}

@end
