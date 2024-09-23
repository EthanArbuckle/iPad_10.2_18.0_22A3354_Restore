@implementation UILabelMetrics

uint64_t __37___UILabelMetrics__calculateIfNeeded__block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = (_QWORD *)result;
  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 64);
  v3 = 0;
  v4 = 0;
  if (*(_BYTE *)(result + 64))
  {
    if (v2)
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 64), "_calculateIfNecessary", 0.0);
      v4 = *(_QWORD *)(v2 + 56);
    }
    *(_QWORD *)(*(_QWORD *)(v1[5] + 8) + 24) = v4;
    v5 = v1[4];
    v6 = *(_QWORD *)(v5 + 64);
    if (v6)
    {
      result = objc_msgSend(*(id *)(v5 + 64), "_calculateIfNecessary");
      v3 = *(_QWORD *)(v6 + 56);
    }
    *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 24) = v3;
    v7 = v1[4];
    v8 = *(_QWORD *)(v7 + 64);
    if (!v8)
    {
      v12 = 0;
      goto LABEL_14;
    }
    result = objc_msgSend(*(id *)(v7 + 64), "_calculateIfNecessary");
    v9 = (uint64_t *)(v8 + 104);
  }
  else
  {
    if (v2)
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 64), "_calculateIfNecessary", 0.0);
      v4 = *(_QWORD *)(v2 + 48);
    }
    *(_QWORD *)(*(_QWORD *)(v1[5] + 8) + 24) = v4;
    v10 = v1[4];
    v11 = *(_QWORD *)(v10 + 64);
    if (v11)
    {
      result = objc_msgSend(*(id *)(v10 + 64), "_calculateIfNecessary");
      v3 = *(_QWORD *)(v11 + 56);
    }
    *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 24) = v3;
    v9 = (uint64_t *)(*(_QWORD *)(v1[5] + 8) + 24);
  }
  v12 = *v9;
LABEL_14:
  *(_QWORD *)(*(_QWORD *)(v1[7] + 8) + 24) = v12;
  return result;
}

uint64_t __37___UILabelMetrics__calculateIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = *(char **)(*(_QWORD *)(a1 + 32) + 64);
  if (v3)
  {
    if (*(_BYTE *)(a1 + 64))
      v4 = 32;
    else
      v4 = 96;
    if (*(_BYTE *)(a1 + 64))
      v5 = 24;
    else
      v5 = 88;
    result = objc_msgSend(v3, "_calculateIfNecessary");
    v6 = *(_QWORD *)&v3[v5];
    v7 = *(_QWORD *)&v3[v4];
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v8 + 32) = v6;
  *(_QWORD *)(v8 + 40) = v7;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(v9 + 64);
  if (v10)
  {
    result = objc_msgSend(*(id *)(v9 + 64), "_calculateIfNecessary");
    v11 = *(_QWORD *)(v10 + 72);
    v9 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v11 = 0;
  }
  *(_QWORD *)(v9 + 184) = v11;
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v12 >= 1)
  {
    v13 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v13 + 184) < v12)
      v12 = *(_QWORD *)(v13 + 184);
    *(_QWORD *)(v13 + 184) = v12;
  }
  return result;
}

@end
