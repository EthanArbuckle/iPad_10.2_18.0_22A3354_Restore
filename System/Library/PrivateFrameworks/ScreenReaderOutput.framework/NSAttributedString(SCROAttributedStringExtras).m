@implementation NSAttributedString(SCROAttributedStringExtras)

- (uint64_t)getRange:()SCROAttributedStringExtras ofAttribute:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;

  v6 = a4;
  v7 = objc_msgSend(a1, "length");
  v14 = 0uLL;
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    while (1)
    {
      objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v6, v9, &v14, v9, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        break;
      v11 = v9 + v8;
      v9 = *((_QWORD *)&v14 + 1) + v14;
      v8 = v11 - (*((_QWORD *)&v14 + 1) + v14);
      if (v11 == *((_QWORD *)&v14 + 1) + (_QWORD)v14)
        goto LABEL_5;
    }
    *a3 = v14;

    v12 = 1;
  }
  else
  {
LABEL_5:
    v12 = 0;
  }

  return v12;
}

- (uint64_t)getRange:()SCROAttributedStringExtras ofAttribute:withValue:
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;

  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(a1, "length");
  v18 = 0uLL;
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    while (1)
    {
      objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v8, v12, &v18, v12, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        if (objc_msgSend(v13, "isEqual:", v9))
          break;
      }
      v15 = *((_QWORD *)&v18 + 1) + v18;
      v11 = v12 + v11 - (*((_QWORD *)&v18 + 1) + v18);

      v12 = v15;
      if (!v11)
        goto LABEL_6;
    }
    *a3 = v18;

    v16 = 1;
  }
  else
  {
LABEL_6:
    v16 = 0;
  }

  return v16;
}

- (void)deepCopyWithZone:()SCROAttributedStringExtras
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a1, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v2);
  v4 = objc_msgSend(v2, "length");
  v11 = 0;
  v12 = 0;
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    do
    {
      objc_msgSend(a1, "attributesAtIndex:longestEffectiveRange:inRange:", v6, &v11, v6, v5 - v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && v12)
      {
        v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", v7, 0);

        objc_msgSend(v3, "setAttributes:range:", v8, v11, v12);
        v9 = v12;
        v7 = (void *)v8;
      }
      else
      {
        v9 = 1;
      }
      v6 += v9;

    }
    while (v6 < v5);
  }

  return v3;
}

- (id)scrAttributedStringByTrimmingTrailingNewlines
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "scrAttributedStringTrimTrailingNewlines");
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

@end
