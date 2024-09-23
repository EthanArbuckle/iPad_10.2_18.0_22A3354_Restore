@implementation TICharSequenceForTokenSequence

void __TICharSequenceForTokenSequence_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "length");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __TICharSequenceForTokenSequence_block_invoke_2;
  v5[3] = &unk_24FD484F0;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v5);

}

uint64_t __TICharSequenceForTokenSequence_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
