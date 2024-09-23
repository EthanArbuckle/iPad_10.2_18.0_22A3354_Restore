@implementation NSDictionary(UIStringDrawingKeyCompatibility)

- (id)_ui_attributesForDictionaryContainingUIStringDrawingKeys
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v2 = (void *)objc_msgSend(a1, "allKeys");
  if (objc_msgSend(v2, "containsObject:", CFSTR("Font"))
    && (v3 = *(_QWORD *)off_1E1678D90, (objc_msgSend(v2, "containsObject:", *(_QWORD *)off_1E1678D90) & 1) == 0))
  {
    v4 = (id)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v4, "setValue:forKey:", objc_msgSend(a1, "valueForKey:", CFSTR("Font")), v3);
  }
  else
  {
    v4 = 0;
  }
  if (objc_msgSend(v2, "containsObject:", CFSTR("TextColor")))
  {
    v5 = *(_QWORD *)off_1E1678D98;
    if ((objc_msgSend(v2, "containsObject:", *(_QWORD *)off_1E1678D98) & 1) == 0)
    {
      if (!v4)
        v4 = (id)objc_msgSend(a1, "mutableCopy");
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(a1, "valueForKey:", CFSTR("TextColor")), v5);
    }
  }
  if ((objc_msgSend(v2, "containsObject:", CFSTR("TextShadowColor")) & 1) != 0
    || objc_msgSend(v2, "containsObject:", CFSTR("TextShadowOffset")))
  {
    v6 = *(_QWORD *)off_1E1679048;
    if ((objc_msgSend(v2, "containsObject:", *(_QWORD *)off_1E1679048) & 1) == 0)
    {
      if (!v4)
        v4 = (id)objc_msgSend(a1, "mutableCopy");
      v7 = objc_alloc_init((Class)off_1E1679CA0);
      if (objc_msgSend(v2, "containsObject:", CFSTR("TextShadowColor")))
        objc_msgSend(v7, "setShadowColor:", objc_msgSend(a1, "valueForKey:", CFSTR("TextShadowColor")));
      if (objc_msgSend(v2, "containsObject:", CFSTR("TextShadowOffset")))
      {
        objc_msgSend((id)objc_msgSend(a1, "valueForKey:", CFSTR("TextShadowOffset")), "CGSizeValue");
        objc_msgSend(v7, "setShadowOffset:");
      }
      objc_msgSend(v4, "setValue:forKey:", v7, v6);
    }
  }
  if (v4)
    return v4;
  else
    return a1;
}

- (uint64_t)_ui_dictionaryContainsUIStringDrawingKeys
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "allKeys");
  if ((objc_msgSend(v1, "containsObject:", CFSTR("Font")) & 1) != 0
    || (objc_msgSend(v1, "containsObject:", CFSTR("TextColor")) & 1) != 0
    || (objc_msgSend(v1, "containsObject:", CFSTR("TextShadowColor")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(v1, "containsObject:", CFSTR("TextShadowOffset"));
  }
}

@end
