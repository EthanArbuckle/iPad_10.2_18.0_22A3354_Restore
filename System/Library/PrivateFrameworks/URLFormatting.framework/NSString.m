@implementation NSString

void __131__NSString_LPInternal___lp_highLevelDomainFromComponents_indexOfFirstHighLevelDomainComponent_indexOfFirstTopLevelDomainComponent___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  int IsDomainTopLevel;
  uint64_t v14;
  id v15;

  v15 = a2;
  v7 = objc_msgSend(v15, "copy");
  v8 = *(_QWORD *)(a1[4] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = (_QWORD *)a1[6];
  if (v10)
    *v10 = a1[7] + ~a3;
  v11 = (_QWORD *)a1[8];
  if (v11)
    *v11 = a1[7] - a3;
  objc_msgSend(v15, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IsDomainTopLevel = _CFHostIsDomainTopLevel();

  v14 = *(_QWORD *)(a1[5] + 8);
  if (IsDomainTopLevel)
  {
    *(_BYTE *)(v14 + 24) = 1;
  }
  else if (*(_BYTE *)(v14 + 24))
  {
    *a4 = 1;
  }

}

@end
