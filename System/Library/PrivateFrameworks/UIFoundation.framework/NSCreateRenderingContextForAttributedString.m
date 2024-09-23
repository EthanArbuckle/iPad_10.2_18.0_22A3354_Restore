@implementation NSCreateRenderingContextForAttributedString

void ____NSCreateRenderingContextForAttributedString_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v8 = (id)objc_msgSend(objc_allocWithZone((Class)_NSCachedAttributedString), "initWithAttributedString:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(v8, "copyCachedInstance");
  v5 = objc_msgSend(*(id *)(a1 + 32), "length");
  if (v4)
  {

    v6 = (id)v4;
  }
  else
  {
    objc_msgSend(v8, "fixAttributesInRange:", 0, v5);
    v6 = v8;
  }
  v9 = v6;
  objc_msgSend(a2, "setAttributedString:", v6);
  objc_msgSend(a2, "setDefaultTighteningFactor:", *(double *)(a1 + 48));
  objc_msgSend(a2, "setLimitsLayoutForSuspiciousContents:", 1);
  LOBYTE(v7) = *(_BYTE *)(a1 + 75);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "createRenderingContextForCharacterRange:typesetterBehavior:usesScreenFonts:hasStrongRight:syncDirection:mirrorsTextAlignment:maximumWidth:", 0, v5, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(unsigned __int8 *)(a1 + 74), *(double *)(a1 + 64), v7);
  objc_msgSend(a2, "setDefaultTighteningFactor:", 0.0);
  if (!v4 && !*(_BYTE *)(a1 + 76))
    objc_msgSend(v9, "cache");

}

@end
