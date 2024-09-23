@implementation PFXHtmlStylePropertyInfo

+ (void)propertyInfos
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&qword_543390);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_543390))
  {
    qword_543388 = 0;
    qword_543380 = 0;
    qword_543378 = (uint64_t)&qword_543380;
    __cxa_guard_release(&qword_543390);
  }
  return &qword_543378;
}

+ (void)addInfoForProperty:(const char *)a3 isInherited:(BOOL)a4
{
  const xmlChar *v4;
  const xmlChar **v5;

  v4 = (const xmlChar *)a3;
  v5 = &v4;
  *((_BYTE *)sub_1CAE9C((uint64_t **)objc_msgSend(a1, "propertyInfos"), &v4, (uint64_t)&std::piecewise_construct, &v5) + 40) = a4;
}

+ (void)initialize
{
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "background", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "background-color", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "background-image", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "background-repeat", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border-bottom", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border-bottom-width", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border-color", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border-collapse", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border-left", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border-left-width", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border-right", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border-right-width", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border-style", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border-top", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border-top-width", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "border-width", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "visibility", 0);
  objc_msgSend(a1, "addInfoForProperty:isInherited:", "vertical-align", 0);
}

+ (BOOL)propertyIsInherited:(const char *)a3
{
  char *v3;
  uint64_t v4;
  const xmlChar *v6;

  v6 = (const xmlChar *)a3;
  v3 = (char *)objc_msgSend(a1, "propertyInfos");
  v4 = sub_1C95FC((uint64_t)v3, &v6);
  return v3 + 8 == (char *)v4 || *(_BYTE *)(v4 + 40) != 0;
}

@end
