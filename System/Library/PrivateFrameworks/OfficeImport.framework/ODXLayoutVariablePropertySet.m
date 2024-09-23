@implementation ODXLayoutVariablePropertySet

+ (id)directionMap
{
  void *v2;
  unsigned __int8 v3;
  TCXmlEnumMap *v4;
  void *v5;

  v2 = (void *)+[ODXLayoutVariablePropertySet directionMap]::directionMap;
  if (!+[ODXLayoutVariablePropertySet directionMap]::directionMap)
  {
    if ((v3 & 1) == 0
    {
      +[ODXLayoutVariablePropertySet directionMap]::directionDescriptions = 0;
      qword_255AD32D0 = (uint64_t)"norm";
      dword_255AD32D8 = 1;
      qword_255AD32E0 = (uint64_t)"rev";
      xmmword_255AD32E8 = TCXmlEnumSentinel;
    }
    v4 = -[TCXmlEnumMap initWithDescriptions:]([TCXmlEnumMap alloc], "initWithDescriptions:", &+[ODXLayoutVariablePropertySet directionMap]::directionDescriptions);
    v5 = (void *)+[ODXLayoutVariablePropertySet directionMap]::directionMap;
    +[ODXLayoutVariablePropertySet directionMap]::directionMap = (uint64_t)v4;

    v2 = (void *)+[ODXLayoutVariablePropertySet directionMap]::directionMap;
  }
  return v2;
}

+ (void)readNode:(_xmlNode *)a3 toSet:(id)a4 state:(id)a5
{
  id v8;
  CXNamespace *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  objc_msgSend(v8, "ODXDiagramNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "dir");

  if (v10)
  {
    objc_msgSend(a1, "directionMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDirection:", objc_msgSend(v11, "readFromNode:ns:name:def:", v10, 0, "val", 0));

  }
}

@end
