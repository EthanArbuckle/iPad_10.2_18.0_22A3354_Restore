@implementation EDTokenTree

+ (id)buildSubtree:(unsigned int)a3 formula:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "tokenCount") > a3)
  {
    objc_msgSend(a1, "buildSubtreeAtIndex:formula:", &v10, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)buildSubtreeAtIndex:(unsigned int *)a3 formula:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = objc_msgSend(v6, "tokenTypeAtIndex:", *a3);
  if ((_DWORD)v7)
  {
    +[EDTokenTreeNode tokenTreeNodeWithIndexAndType:type:](EDTokenTreeNode, "tokenTreeNodeWithIndexAndType:type:", *a3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(a1, "childCountForToken:formula:", *a3, v6);
    if (v9)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        if (!*a3)
          break;
        --*a3;
        objc_msgSend(a1, "buildSubtreeAtIndex:formula:", a3, v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(a1, "isTokenNoOp:formula:", objc_msgSend(v12, "tokenIndex"), v6) & 1) == 0)
        {
          objc_msgSend(v8, "setFirstChild:", v12);
          objc_msgSend(v12, "setSibling:", v11);
          v13 = v12;

          ++v10;
          v11 = v13;
        }

      }
      while (v10 < v9);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (unsigned)childCountForToken:(unsigned int)a3 formula:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  int v8;
  unsigned int v9;
  int v10;
  unsigned int v12;
  int v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "tokenCount") <= v4)
    goto LABEL_11;
  v8 = categoryForType(objc_msgSend(v7, "tokenTypeAtIndex:", v4));
  v9 = 0;
  if (!v8 || v8 == 3)
    goto LABEL_12;
  v13 = 0;
  v10 = objc_msgSend(v7, "tokenTypeAtIndex:", v4);
  if (v10 <= 64)
  {
    v9 = 2;
    switch(v10)
    {
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
        goto LABEL_12;
      case 18:
      case 19:
      case 20:
      case 21:
        v9 = 1;
        break;
      case 25:
        v12 = objc_msgSend(a1, "isTokenAttrASum:", *(unsigned __int16 *)objc_msgSend(v7, "lastExtendedDataForTokenAtIndex:length:", v4, &v13));
        goto LABEL_18;
      case 33:
        goto LABEL_16;
      case 34:
        goto LABEL_15;
      default:
        goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (v10 > 96)
  {
    if (v10 != 97)
    {
      if (v10 != 98)
        goto LABEL_11;
      goto LABEL_15;
    }
  }
  else if (v10 != 65)
  {
    if (v10 != 66)
    {
LABEL_11:
      v9 = 0;
      goto LABEL_12;
    }
LABEL_15:
    v9 = *(unsigned __int16 *)objc_msgSend(v7, "lastExtendedDataForTokenAtIndex:length:", v4, &v13);
    goto LABEL_12;
  }
LABEL_16:
  v12 = XlArgumentCountForFunction(*(_WORD *)objc_msgSend(v7, "lastExtendedDataForTokenAtIndex:length:", v4, &v13));
LABEL_18:
  v9 = v12;
LABEL_12:

  return v9;
}

+ (BOOL)isTokenNoOp:(unsigned int)a3 formula:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  unsigned int v8;
  int v9;
  int v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "tokenCount") <= v4)
  {
    LOBYTE(v9) = 1;
    goto LABEL_10;
  }
  v8 = objc_msgSend(v7, "tokenTypeAtIndex:", v4);
  LOBYTE(v9) = 1;
  if (v8 - 70 > 0x32 || ((1 << (v8 - 70)) & 0x4030F0004030FLL) == 0)
  {
    if (v8 > 0x2F)
      goto LABEL_11;
    if (((1 << v8) & 0xC3C008000004) == 0)
    {
      if (v8 == 25)
      {
        v11 = 0;
        v9 = objc_msgSend(a1, "isTokenAttrASum:", *(unsigned __int16 *)objc_msgSend(v7, "lastExtendedDataForTokenAtIndex:length:", v4, &v11)) ^ 1;
        goto LABEL_10;
      }
LABEL_11:
      LOBYTE(v9) = 0;
    }
  }
LABEL_10:

  return v9;
}

+ (BOOL)isTokenAttrASum:(unsigned __int16)a3
{
  return (a3 >> 4) & 1;
}

@end
