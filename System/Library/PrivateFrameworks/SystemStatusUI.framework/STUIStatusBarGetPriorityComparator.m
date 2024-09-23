@implementation STUIStatusBarGetPriorityComparator

uint64_t __STUIStatusBarGetPriorityComparator_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "priority");
  if (v6 <= objc_msgSend(v5, "priority"))
  {
    v8 = objc_msgSend(v4, "priority");
    v7 = v8 < objc_msgSend(v5, "priority");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __STUIStatusBarGetPriorityComparator_block_invoke()
{
  void *v0;

  v0 = (void *)STUIStatusBarGetPriorityComparator_priorityComparator;
  STUIStatusBarGetPriorityComparator_priorityComparator = (uint64_t)&__block_literal_global_2;

}

@end
