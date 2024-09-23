@implementation OAXFontReference

+ (void)readFromNode:(_xmlNode *)a3 fontReference:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (+[OAXFontReference readFromNode:fontReference:]::once != -1)
    dispatch_once(&+[OAXFontReference readFromNode:fontReference:]::once, &__block_literal_global_48);
  objc_msgSend(v6, "setIndex:", objc_msgSend((id)+[OAXFontReference readFromNode:fontReference:]::indexMap, "readFromNode:ns:name:", a3, 0, "idx"));
  +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v5);

}

void __47__OAXFontReference_readFromNode_fontReference___block_invoke()
{
  unsigned __int8 v0;
  TCXmlEnumMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ47__OAXFontReference_readFromNode_fontReference__EUb_E17indexDescriptions);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ47__OAXFontReference_readFromNode_fontReference__EUb_E17indexDescriptions))
  {
    qword_255AD2A10 = (uint64_t)"major";
    dword_255AD2A18 = 1;
    qword_255AD2A20 = (uint64_t)"minor";
    dword_255AD2A28 = -1;
    _ZZZ47__OAXFontReference_readFromNode_fontReference__EUb_E17indexDescriptions = 0;
    qword_255AD2A30 = (uint64_t)"none";
    xmmword_255AD2A38 = TCXmlEnumSentinel;
    __cxa_guard_release(&_ZGVZZ47__OAXFontReference_readFromNode_fontReference__EUb_E17indexDescriptions);
  }
  v1 = -[TCXmlEnumMap initWithDescriptions:]([TCXmlEnumMap alloc], "initWithDescriptions:", &_ZZZ47__OAXFontReference_readFromNode_fontReference__EUb_E17indexDescriptions);
  v2 = (void *)+[OAXFontReference readFromNode:fontReference:]::indexMap;
  +[OAXFontReference readFromNode:fontReference:]::indexMap = (uint64_t)v1;

}

+ (void)writeReference:(id)a3 to:(id)a4 state:(id)a5
{
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "startElement:", CFSTR("fontRef"));
  v7 = objc_msgSend(v10, "index") + 1;
  if (v7 < 3)
    objc_msgSend(v6, "writeAttribute:content:", CFSTR("idx"), off_24F39D170[v7]);
  objc_msgSend(v10, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v10, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXColor writeColor:to:](OAXColor, "writeColor:to:", v9, v6);

  }
  objc_msgSend(v6, "endElement");

}

@end
