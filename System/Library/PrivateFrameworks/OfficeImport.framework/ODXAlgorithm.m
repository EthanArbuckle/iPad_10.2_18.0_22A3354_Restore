@implementation ODXAlgorithm

+ (id)typeMap
{
  void *v2;
  unsigned __int8 v3;
  TCXmlEnumMap *v4;
  void *v5;

  v2 = (void *)+[ODXAlgorithm typeMap]::typeMap;
  if (!+[ODXAlgorithm typeMap]::typeMap)
  {
    {
      qword_255AD2FC0 = (uint64_t)"unknown";
      dword_255AD2FC8 = 1;
      qword_255AD2FD0 = (uint64_t)"composite";
      dword_255AD2FD8 = 2;
      qword_255AD2FE0 = (uint64_t)"conn";
      dword_255AD2FE8 = 3;
      qword_255AD2FF0 = (uint64_t)"cycle";
      dword_255AD2FF8 = 4;
      qword_255AD3000 = (uint64_t)"hierChild";
      dword_255AD3008 = 5;
      qword_255AD3010 = (uint64_t)"hierRoot";
      dword_255AD3018 = 6;
      qword_255AD3020 = (uint64_t)"pyra";
      dword_255AD3028 = 7;
      qword_255AD3030 = (uint64_t)"lin";
      dword_255AD3038 = 8;
      qword_255AD3040 = (uint64_t)"sp";
      dword_255AD3048 = 9;
      qword_255AD3050 = (uint64_t)"tx";
      dword_255AD3058 = 10;
      +[ODXAlgorithm typeMap]::typeDescriptions = 0;
      qword_255AD3060 = (uint64_t)"snake";
      xmmword_255AD3068 = TCXmlEnumSentinel;
    }
    v4 = -[TCXmlEnumMap initWithDescriptions:]([TCXmlEnumMap alloc], "initWithDescriptions:", &+[ODXAlgorithm typeMap]::typeDescriptions);
    v5 = (void *)+[ODXAlgorithm typeMap]::typeMap;
    +[ODXAlgorithm typeMap]::typeMap = (uint64_t)v4;

    v2 = (void *)+[ODXAlgorithm typeMap]::typeMap;
  }
  return v2;
}

+ (void)readNode:(_xmlNode *)a3 toAlgorithm:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a1, "typeMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setType:", objc_msgSend(v6, "readFromNode:ns:name:", a3, 0, "type"));

}

@end
