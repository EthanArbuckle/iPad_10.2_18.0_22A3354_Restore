@implementation CRCHPatternNetwork

+ (id)kDefaultPatternsPlusUrlsAndEmails
{
  return &unk_1E993CEA8;
}

+ (id)kDefaultPatterns
{
  return &unk_1E993CEC0;
}

+ (id)kEmailPatterns
{
  return &unk_1E993CED8;
}

+ (id)kUrlPatterns
{
  return &unk_1E993CEF0;
}

+ (id)patternToSymbolMap
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Prefix_DATE"), CFSTR("0xc50a218"), CFSTR("Prefix_EMOTICON"), CFSTR("0x68ed49c"), CFSTR("Prefix_URL"), CFSTR("0x88ea31a"), CFSTR("Extendable_PUNC_LOOP"), CFSTR("0x099c12f"), CFSTR("Extendable_EMOTICON"), CFSTR("0x23cc72f"), CFSTR("Extendable_TIME"), CFSTR("0xdb53409"), CFSTR("EMAIL"), CFSTR("0x61a649a"), CFSTR("Prefix_TIME"), CFSTR("0x7186a84"), CFSTR("Extendable_URL"),
               CFSTR("0x1070ba2"),
               CFSTR("Prefix_PHONE_NUMBER"),
               CFSTR("0x4374d28"),
               CFSTR("NUMBER"),
               CFSTR("0x34f55ec"),
               CFSTR("PUNC_LOOP"),
               CFSTR("0x7f7446f"),
               CFSTR("Prefix_EMAIL"),
               CFSTR("0xd23b9c8"),
               CFSTR("EMOTICON"),
               CFSTR("0x08d4b39"),
               CFSTR("Extendable_EMAIL"),
               CFSTR("0xed4db98"),
               CFSTR("Extendable_WORD_CASE_SENSITIVE"),
               CFSTR("0x87eab3b"),
               CFSTR("URL"),
               CFSTR("0xe6b391a"),
               CFSTR("DATE"),
               CFSTR("0x633a6c7"),
               CFSTR("Extendable_NUMBER"),
               CFSTR("0x3ba3922"),
               CFSTR("Extendable_WORD_CASE_INSENSITIVE"),
               CFSTR("0x355486d"),
               CFSTR("PHONE_NUMBER"),
               CFSTR("0x837697b"),
               CFSTR("Prefix_NUMBER"),
               CFSTR("0x8005b66"),
               CFSTR("WORD_CASE_INSENSITIVE"),
               CFSTR("0x156f831"),
               CFSTR("Extendable_DATE"),
               CFSTR("0x9ddc000"),
               CFSTR("Prefix_WORD_CASE_INSENSITIVE"),
               CFSTR("0x8554b05"),
               CFSTR("Prefix_WORD_CASE_SENSITIVE"),
               CFSTR("0xe71cc3a"),
               CFSTR("WORD_CASE_SENSITIVE"),
               CFSTR("0x8aa8704"),
               CFSTR("TIME"),
               CFSTR("0x346ff32"),
               0);
}

+ (id)rootCursorForContentType:(int)a3 inNetwork:(id)a4
{
  if (a4)
    return (id)objc_msgSend(*((id *)a4 + 4), "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3));
  else
    return 0;
}

+ (id)cursorByAdvancingWithString:(id)a3 fromCursor:(id)a4 inNetwork:(id)a5
{
  id result;
  unint64_t v9;
  uint64_t v10;

  result = 0;
  if (a4)
  {
    if (a5)
    {
      result = (id)objc_msgSend(a4, "edgeIndexCount");
      if (result)
      {
        if (objc_msgSend(a3, "length"))
        {
          v10 = objc_msgSend(a3, "rangeOfComposedCharacterSequenceAtIndex:", 0);
          result = 0;
          if (v9 <= 1)
            return +[CRCHPatternNetwork cursorByAdvancingWithString:fromCursor:inNetwork:](CRCHPatternNetwork, "cursorByAdvancingWithString:fromCursor:inNetwork:", objc_msgSend(a3, "substringFromIndex:", v10 + v9), objc_msgSend(a5, "advanceCursor:withSymbol:", a4, objc_msgSend((id)objc_msgSend(a3, "substringWithRange:", v10, v9), "characterAtIndex:", 0)), a5);
        }
        else
        {
          return a4;
        }
      }
    }
  }
  return result;
}

+ (id)cursorByAdvancingWithSymbol:(id)a3 fromCursor:(id)a4 inNetwork:(id)a5
{
  id result;
  void *v9;

  result = 0;
  if (a4)
  {
    if (a5)
    {
      result = (id)objc_msgSend(a4, "edgeIndexCount");
      if (result)
      {
        if (objc_msgSend(a3, "length"))
        {
          if ((unint64_t)objc_msgSend(a3, "length") <= 1)
          {
            v9 = (void *)objc_msgSend(a5, "advanceCursor:withSymbol:", a4, objc_msgSend(a3, "characterAtIndex:", 0));
            if (objc_msgSend(v9, "edgeIndexCount"))
              return v9;
            else
              return 0;
          }
          else
          {
            return 0;
          }
        }
        else
        {
          return a4;
        }
      }
    }
  }
  return result;
}

- (id)advanceCursor:(id)a3 withSymbol:(unint64_t)a4
{
  CRCHNetworkCursor *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];
  uint64_t v14;
  void *__p;
  void *v16;
  _BYTE v17[8];
  uint64_t v18;
  void *v19;
  void *v20;

  v7 = objc_alloc_init(CRCHNetworkCursor);
  if (objc_msgSend(a3, "edgeIndexCount"))
  {
    v8 = 0;
    do
    {
      NetworkEdge::NetworkEdge((NetworkEdge *)v17, (const NetworkEdge *)(*((_QWORD *)self->_network + 11) + 80 * objc_msgSend(a3, "edgeIndexAtPosition:", v8)));
      v9 = v18;
      v10 = *(_QWORD *)(*((_QWORD *)self->_network + 5) + 56 * v18);
      if (v10)
      {
        v11 = 0;
        while (1)
        {
          NetworkEdge::NetworkEdge((NetworkEdge *)v13, (const NetworkEdge *)(*((_QWORD *)self->_network + 11)+ 80 * (v11 + *(_QWORD *)(*((_QWORD *)self->_network + 5) + 56 * v9 + 16))));
          if (v14 == a4)
            break;
          if (__p)
          {
            v16 = __p;
            operator delete(__p);
          }
          if (v10 == ++v11)
            goto LABEL_12;
        }
        -[CRCHNetworkCursor addEdgeIndex:](v7, "addEdgeIndex:", *(_QWORD *)(*((_QWORD *)self->_network + 5) + 56 * v9 + 16) + v11);
        if (__p)
        {
          v16 = __p;
          operator delete(__p);
        }
      }
LABEL_12:
      if (v19)
      {
        v20 = v19;
        operator delete(v19);
      }
      ++v8;
    }
    while (v8 < objc_msgSend(a3, "edgeIndexCount"));
  }
  return v7;
}

+ (BOOL)isFinalCursor:(id)a3 inNetwork:(id)a4
{
  BOOL v4;
  unint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD v11[7];
  void *__p;
  void *v13;

  v4 = 0;
  if (a3 && a4)
  {
    if (objc_msgSend(a3, "edgeIndexCount"))
    {
      v7 = 0;
      do
      {
        NetworkEdge::NetworkEdge((NetworkEdge *)v11, (const NetworkEdge *)(*(_QWORD *)(*((_QWORD *)a4 + 1) + 88)+ 80 * objc_msgSend(a3, "edgeIndexAtPosition:", v7)));
        v8 = *(_QWORD *)(*((_QWORD *)a4 + 1) + 40) + 56 * v11[1];
        v9 = *(unsigned __int8 *)(v8 + 48);
        v4 = *(_BYTE *)(v8 + 48) != 0;
        if (__p)
        {
          v13 = __p;
          operator delete(__p);
        }
        if (v9)
          break;
        ++v7;
      }
      while (v7 < objc_msgSend(a3, "edgeIndexCount"));
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (CRCHPatternNetwork)initWithFile:(id)a3
{
  CRCHPatternNetwork *v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  CRCHNetworkCursor *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  CRCHNetworkCursor *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  CRCHNetworkCursor *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  CRCHNetworkCursor *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  uint64_t v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59[16];
  uint64_t v60;
  uint64_t v61;
  void *__p;
  void *v63;
  objc_super v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  char v68[128];
  char __s[1024];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v64.receiver = self;
  v64.super_class = (Class)CRCHPatternNetwork;
  v4 = -[CRCHPatternNetwork init](&v64, sel_init);
  if (pathForResource((const char *)objc_msgSend(a3, "UTF8String"), 0, (UInt8 *)__s))
  {
    v5 = operator new();
    *(_QWORD *)v5 = &latticePresets;
    v6 = (uint64_t *)(v5 + 8);
    std::string::basic_string[abi:ne180100]<0>((_QWORD *)(v5 + 8), __s);
    *(_QWORD *)(v5 + 40) = 0;
    *(_QWORD *)(v5 + 72) = 0;
    *(_QWORD *)(v5 + 48) = 0;
    *(_QWORD *)(v5 + 56) = 0;
    *(_QWORD *)(v5 + 64) = v5 + 72;
    *(_QWORD *)(v5 + 80) = 0;
    *(_OWORD *)(v5 + 88) = 0u;
    *(_OWORD *)(v5 + 104) = 0u;
    *(_OWORD *)(v5 + 120) = 0u;
    CRCHSymbolMap::CRCHSymbolMap((CRCHSymbolMap *)(v5 + 136));
    *(_QWORD *)(v5 + 208) = 0;
    *(_QWORD *)(v5 + 200) = v5 + 208;
    *(_BYTE *)(v5 + 192) = 1;
    *(_QWORD *)(v5 + 232) = 0;
    *(_QWORD *)(v5 + 224) = v5 + 232;
    *(_QWORD *)(v5 + 216) = 0;
    *(_QWORD *)(v5 + 248) = 0;
    *(_QWORD *)(v5 + 256) = 0;
    *(_QWORD *)(v5 + 240) = 0;
    if (*(char *)(v5 + 31) < 0)
      v7 = *(_QWORD *)(v5 + 16);
    else
      v7 = *(unsigned __int8 *)(v5 + 31);
    if (v7 < 4)
      goto LABEL_16;
    v8 = v5 + 8;
    if ((*(_BYTE *)(v5 + 31) & 0x80) != 0)
      v8 = *v6;
    if (*(_BYTE *)(v8 + v7 - 3) != 102)
      goto LABEL_16;
    v9 = v5 + 8;
    if ((*(_BYTE *)(v5 + 31) & 0x80) != 0)
      v9 = *v6;
    if (*(_BYTE *)(v9 + v7 - 2) != 115)
      goto LABEL_16;
    v10 = v7 - 1;
    v11 = v5 + 8;
    if ((*(_BYTE *)(v5 + 31) & 0x80) != 0)
      v11 = *v6;
    if (*(_BYTE *)(v11 + v10) == 116)
      CRCHNetwork::readDataFile((CRCHNetwork *)v5);
    else
LABEL_16:
      CRCHNetwork::deserialize((CRCHNetwork *)v5, __s);
    v4->_network = (void *)v5;
  }
  v4->_symbols = (NSDictionary *)+[CRCHPatternNetwork patternToSymbolMap](CRCHPatternNetwork, "patternToSymbolMap");
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = *((_QWORD *)v4->_network + 11);
  if (*((_QWORD *)v4->_network + 12) != v13)
  {
    v14 = 0;
    v15 = 0;
    do
    {
      NetworkEdge::NetworkEdge((NetworkEdge *)v59, (const NetworkEdge *)(v13 + v14));
      if (v60 == v61)
      {
        v16 = -[NSDictionary objectForKey:](v4->_symbols, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%07lx"), v60));
        if (v16)
          objc_msgSend(v12, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v15), v16);
      }
      if (__p)
      {
        v63 = __p;
        operator delete(__p);
      }
      ++v15;
      v13 = *((_QWORD *)v4->_network + 11);
      v14 += 80;
    }
    while (v15 < 0xCCCCCCCCCCCCCCCDLL * ((*((_QWORD *)v4->_network + 12) - v13) >> 4));
  }
  v4->_startEdges = (NSDictionary *)v12;
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = objc_alloc_init(CRCHNetworkCursor);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v19 = +[CRCHPatternNetwork kDefaultPatternsPlusUrlsAndEmails](CRCHPatternNetwork, "kDefaultPatternsPlusUrlsAndEmails");
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v56 != v21)
          objc_enumerationMutation(v19);
        v23 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (-[NSDictionary objectForKey:](v4->_startEdges, "objectForKey:", v23))
          -[CRCHNetworkCursor addEdgeIndex:](v18, "addEdgeIndex:", objc_msgSend(-[NSDictionary objectForKey:](v4->_startEdges, "objectForKey:", v23), "unsignedLongValue"));
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    }
    while (v20);
  }
  objc_msgSend(v17, "setObject:forKey:", v18, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1));
  v24 = objc_alloc_init(CRCHNetworkCursor);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v25 = +[CRCHPatternNetwork kDefaultPatterns](CRCHPatternNetwork, "kDefaultPatterns");
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v52 != v27)
          objc_enumerationMutation(v25);
        v29 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
        if (-[NSDictionary objectForKey:](v4->_startEdges, "objectForKey:", v29))
          -[CRCHNetworkCursor addEdgeIndex:](v24, "addEdgeIndex:", objc_msgSend(-[NSDictionary objectForKey:](v4->_startEdges, "objectForKey:", v29), "unsignedLongValue"));
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    }
    while (v26);
  }
  objc_msgSend(v17, "setObject:forKey:", v24, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0));
  v30 = objc_alloc_init(CRCHNetworkCursor);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v31 = +[CRCHPatternNetwork kEmailPatterns](CRCHPatternNetwork, "kEmailPatterns");
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v48 != v33)
          objc_enumerationMutation(v31);
        v35 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k);
        if (-[NSDictionary objectForKey:](v4->_startEdges, "objectForKey:", v35))
          -[CRCHNetworkCursor addEdgeIndex:](v30, "addEdgeIndex:", objc_msgSend(-[NSDictionary objectForKey:](v4->_startEdges, "objectForKey:", v35), "unsignedLongValue"));
      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
    }
    while (v32);
  }
  objc_msgSend(v17, "setObject:forKey:", v30, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2));
  v36 = objc_alloc_init(CRCHNetworkCursor);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v37 = +[CRCHPatternNetwork kUrlPatterns](CRCHPatternNetwork, "kUrlPatterns");
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v38; ++m)
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(v37);
        v41 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * m);
        if (-[NSDictionary objectForKey:](v4->_startEdges, "objectForKey:", v41))
          -[CRCHNetworkCursor addEdgeIndex:](v36, "addEdgeIndex:", objc_msgSend(-[NSDictionary objectForKey:](v4->_startEdges, "objectForKey:", v41), "unsignedLongValue"));
      }
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
    }
    while (v38);
  }
  objc_msgSend(v17, "setObject:forKey:", v36, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3));
  v4->_startCursorForContentTypes = (NSDictionary *)v17;
  return v4;
}

- (void)dealloc
{
  CRCHNetwork *network;
  NSDictionary *symbols;
  NSDictionary *startEdges;
  NSDictionary *startCursorForContentTypes;
  objc_super v7;

  network = (CRCHNetwork *)self->_network;
  if (network)
  {
    CRCHNetwork::~CRCHNetwork(network);
    MEMORY[0x1D826E294]();
    self->_network = 0;
  }
  symbols = self->_symbols;
  if (symbols)
  {

    self->_symbols = 0;
  }
  startEdges = self->_startEdges;
  if (startEdges)
  {

    self->_startEdges = 0;
  }
  startCursorForContentTypes = self->_startCursorForContentTypes;
  if (startCursorForContentTypes)
  {

    self->_startCursorForContentTypes = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CRCHPatternNetwork;
  -[CRCHPatternNetwork dealloc](&v7, sel_dealloc);
}

@end
