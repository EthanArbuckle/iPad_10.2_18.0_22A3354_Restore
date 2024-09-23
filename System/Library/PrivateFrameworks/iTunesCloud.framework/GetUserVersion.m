@implementation GetUserVersion

void ____GetUserVersion_block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(a2, "firstInt64Value");
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a3);
  }

}

@end
