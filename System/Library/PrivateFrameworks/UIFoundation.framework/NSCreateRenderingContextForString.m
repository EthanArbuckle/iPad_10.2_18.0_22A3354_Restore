@implementation NSCreateRenderingContextForString

void ____NSCreateRenderingContextForString_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  CFIndex Length;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v8 = (id)objc_msgSend(objc_allocWithZone((Class)_NSCachedAttributedString), "initWithString:attributes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(v8, "copyCachedInstance");
  Length = CFStringGetLength(*(CFStringRef *)(a1 + 32));
  if (v4)
  {

    v6 = (id)v4;
  }
  else
  {
    objc_msgSend(v8, "fixAttributesInRange:", 0, Length);
    v6 = v8;
  }
  v9 = v6;
  objc_msgSend(a2, "setAttributedString:", v6);
  objc_msgSend(a2, "setDefaultTighteningFactor:", *(double *)(a1 + 56));
  objc_msgSend(a2, "setLimitsLayoutForSuspiciousContents:", 1);
  LOBYTE(v7) = *(_BYTE *)(a1 + 83);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a2, "createRenderingContextForCharacterRange:typesetterBehavior:usesScreenFonts:hasStrongRight:syncDirection:mirrorsTextAlignment:maximumWidth:", 0, Length, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(unsigned __int8 *)(a1 + 82), *(double *)(a1 + 72), v7);
  objc_msgSend(a2, "setDefaultTighteningFactor:", 0.0);
  if (!v4 && !*(_BYTE *)(a1 + 84))
    objc_msgSend(v9, "cache");

}

@end
