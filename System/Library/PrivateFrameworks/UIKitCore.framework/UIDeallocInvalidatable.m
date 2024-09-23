@implementation UIDeallocInvalidatable

id __53___UIDeallocInvalidatable_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("identifier"));
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v5 = objc_msgSend(*(id *)(v3 + 16), "hasBeenSignalled") ^ 1;
  else
    v5 = 0;
  return (id)objc_msgSend(v4, "appendBool:withName:", v5, CFSTR("isValid"));
}

@end
