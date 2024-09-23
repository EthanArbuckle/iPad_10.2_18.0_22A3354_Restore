@implementation NSTextStorage(UIKitUndoExtensions)

- (uint64_t)_UIUndoRedoTextOperation:()UIKitUndoExtensions
{
  return objc_msgSend(a3, "undoRedo");
}

- (id)_UIUndoRedoAttributedSubstringFromRange:()UIKitUndoExtensions
{
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v20;
  unint64_t v21;

  objc_msgSend(a1, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a3 + a4;
  v9 = objc_msgSend(v7, "length");
  if (a3 + a4 >= v9)
    v10 = v9;
  else
    v10 = a3 + a4;
  if (v8 <= v9)
    v11 = a4;
  else
    v11 = v9 - a3;
  if (v11 == v9)
  {
    v12 = (void *)objc_msgSend(a1, "copyWithZone:", 0);
  }
  else
  {
    if (v8 <= v9)
      v13 = a4;
    else
      v13 = v9 - a3;
    objc_msgSend(v7, "substringWithRange:", a3, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v14);
    if (a3 < v10)
    {
      v15 = a3;
      do
      {
        v20 = 0;
        v21 = 0;
        objc_msgSend(a1, "attributesAtIndex:effectiveRange:", v15, &v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21 + v20 <= v10)
          v17 = v20 - v15 + v21;
        else
          v17 = v10 - v15;
        if (v20 != v15 || v21 + v20 > v10)
          v21 = v17;
        objc_msgSend(v12, "addAttributes:range:", v16, v15 - a3, v17);
        v15 += v21;

      }
      while (v15 < v10);
    }
    v7 = (void *)v14;
  }

  return v12;
}

@end
