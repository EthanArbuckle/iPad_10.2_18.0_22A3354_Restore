@implementation UIActiveViewServiceSessionComparator

uint64_t _UIActiveViewServiceSessionComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    v6 = v4[5];
    if (v5)
      goto LABEL_3;
  }
  else
  {
    v6 = 0;
    if (v5)
    {
LABEL_3:
      v7 = v5[5];
      if (v4)
        goto LABEL_4;
LABEL_25:
      v8 = 0;
      if (v5)
        goto LABEL_5;
      goto LABEL_26;
    }
  }
  v7 = 0;
  if (!v4)
    goto LABEL_25;
LABEL_4:
  v8 = *((_DWORD *)v4 + 5);
  if (v5)
  {
LABEL_5:
    v9 = *((_DWORD *)v5 + 5);
    goto LABEL_6;
  }
LABEL_26:
  v9 = 0;
LABEL_6:
  v10 = v6 == 0;
  if (v8 == 3)
    v10 = 1;
  if (!v8)
    v10 = 1;
  v11 = v7 == 0;
  if (v9 == 3)
    v11 = 1;
  if (!v9)
    v11 = 1;
  if (v11 == v10)
  {
    if (v5)
    {
      v12 = v5[6];
      if (v4)
      {
LABEL_17:
        v13 = v4[6];
LABEL_18:
        v10 = v12 > v13;
        goto LABEL_19;
      }
    }
    else
    {
      v12 = 0;
      if (v4)
        goto LABEL_17;
    }
    v13 = 0;
    goto LABEL_18;
  }
LABEL_19:
  if (v10)
    v14 = -1;
  else
    v14 = 1;

  return v14;
}

@end
