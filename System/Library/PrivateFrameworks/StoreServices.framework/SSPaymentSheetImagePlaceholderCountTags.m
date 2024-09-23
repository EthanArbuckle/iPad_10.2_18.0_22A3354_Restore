@implementation SSPaymentSheetImagePlaceholderCountTags

void __SSPaymentSheetImagePlaceholderCountTags_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t i;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v3;
          i != 0x7FFFFFFFFFFFFFFFLL;
          i = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", v5, 0, i + 1, objc_msgSend(*(id *)(a1 + 32), "length") + ~i))
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
  }

}

@end
