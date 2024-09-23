@implementation ODXIteratorSpecification

+ (id)axisTypeMap
{
  void *v2;
  unsigned __int8 v3;
  TCXmlEnumMap *v4;
  void *v5;

  v2 = (void *)+[ODXIteratorSpecification axisTypeMap]::axisTypeMap;
  if (!+[ODXIteratorSpecification axisTypeMap]::axisTypeMap)
  {
    if ((v3 & 1) == 0
    {
      qword_255AD3120 = (uint64_t)"self";
      dword_255AD3128 = 1;
      qword_255AD3130 = (uint64_t)"ch";
      dword_255AD3138 = 2;
      qword_255AD3140 = (uint64_t)"des";
      dword_255AD3148 = 3;
      qword_255AD3150 = (uint64_t)"desOrSelf";
      dword_255AD3158 = 4;
      qword_255AD3160 = (uint64_t)"par";
      dword_255AD3168 = 5;
      qword_255AD3170 = (uint64_t)"ancst";
      dword_255AD3178 = 6;
      qword_255AD3180 = (uint64_t)"ancstOrSelf";
      dword_255AD3188 = 7;
      qword_255AD3190 = (uint64_t)"followSib";
      dword_255AD3198 = 8;
      qword_255AD31A0 = (uint64_t)"precedSib";
      dword_255AD31A8 = 9;
      qword_255AD31B0 = (uint64_t)"follow";
      dword_255AD31B8 = 10;
      qword_255AD31C0 = (uint64_t)"preced";
      dword_255AD31C8 = 11;
      qword_255AD31D0 = (uint64_t)"root";
      dword_255AD31D8 = 12;
      +[ODXIteratorSpecification axisTypeMap]::axisTypeDescriptions = 0;
      qword_255AD31E0 = (uint64_t)"none";
      xmmword_255AD31E8 = TCXmlEnumSentinel;
    }
    v4 = -[TCXmlEnumMap initWithDescriptions:]([TCXmlEnumMap alloc], "initWithDescriptions:", &+[ODXIteratorSpecification axisTypeMap]::axisTypeDescriptions);
    v5 = (void *)+[ODXIteratorSpecification axisTypeMap]::axisTypeMap;
    +[ODXIteratorSpecification axisTypeMap]::axisTypeMap = (uint64_t)v4;

    v2 = (void *)+[ODXIteratorSpecification axisTypeMap]::axisTypeMap;
  }
  return v2;
}

+ (id)elementTypeMap
{
  void *v2;
  unsigned __int8 v3;
  TCXmlEnumMap *v4;
  void *v5;

  v2 = (void *)+[ODXIteratorSpecification elementTypeMap]::elementTypeMap;
  if (!+[ODXIteratorSpecification elementTypeMap]::elementTypeMap)
  {
    if ((v3 & 1) == 0
    {
      qword_255AD3210 = (uint64_t)"all";
      dword_255AD3218 = 1;
      qword_255AD3220 = (uint64_t)"doc";
      dword_255AD3228 = 2;
      qword_255AD3230 = (uint64_t)"node";
      dword_255AD3238 = 3;
      qword_255AD3240 = (uint64_t)"norm";
      dword_255AD3248 = 4;
      qword_255AD3250 = (uint64_t)"nonNorm";
      dword_255AD3258 = 5;
      qword_255AD3260 = (uint64_t)"asst";
      dword_255AD3268 = 6;
      qword_255AD3270 = (uint64_t)"nonAsst";
      dword_255AD3278 = 7;
      qword_255AD3280 = (uint64_t)"parTrans";
      dword_255AD3288 = 8;
      qword_255AD3290 = (uint64_t)"pres";
      dword_255AD3298 = 9;
      +[ODXIteratorSpecification elementTypeMap]::elementTypeDescriptions = 0;
      qword_255AD32A0 = (uint64_t)"sibTrans";
      xmmword_255AD32A8 = TCXmlEnumSentinel;
    }
    v4 = -[TCXmlEnumMap initWithDescriptions:]([TCXmlEnumMap alloc], "initWithDescriptions:", &+[ODXIteratorSpecification elementTypeMap]::elementTypeDescriptions);
    v5 = (void *)+[ODXIteratorSpecification elementTypeMap]::elementTypeMap;
    +[ODXIteratorSpecification elementTypeMap]::elementTypeMap = (uint64_t)v4;

    v2 = (void *)+[ODXIteratorSpecification elementTypeMap]::elementTypeMap;
  }
  return v2;
}

+ (void)readFromNode:(_xmlNode *)a3 toSpecification:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  ODDIteratorAttributes *v11;
  void *v12;
  CXNamespace *v13;
  CXNamespace *v14;
  CXNamespace *v15;
  id v16;

  v16 = a4;
  v8 = a5;
  objc_msgSend(a1, "axisTypeMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "readFromNode:ns:name:def:", a3, 0, "axis", 12);

  if ((_DWORD)v10 != 12)
  {
    v11 = objc_alloc_init(ODDIteratorAttributes);
    objc_msgSend(v16, "addAttributes:", v11);
    -[ODDIteratorAttributes setAxis:](v11, "setAxis:", v10);
    objc_msgSend(a1, "elementTypeMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ODDIteratorAttributes setPointType:](v11, "setPointType:", objc_msgSend(v12, "readFromNode:ns:name:def:", a3, 0, "ptType", 0));

    -[ODDIteratorAttributes setHideLastTransition:](v11, "setHideLastTransition:", OCXReadBool(a3, 0, (xmlChar *)"hideLastTrans", 1));
    objc_msgSend(v8, "ODXDiagramNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    -[ODDIteratorAttributes setStart:](v11, "setStart:", CXDefaultLongAttribute(a3, v13, (xmlChar *)"st", 1));

    objc_msgSend(v8, "ODXDiagramNamespace");
    v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    -[ODDIteratorAttributes setCount:](v11, "setCount:", CXDefaultUnsignedLongAttribute(a3, v14, (xmlChar *)"cnt", 0));

    objc_msgSend(v8, "ODXDiagramNamespace");
    v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    -[ODDIteratorAttributes setStep:](v11, "setStep:", CXDefaultLongAttribute(a3, v15, (xmlChar *)"step", 1));

  }
}

@end
