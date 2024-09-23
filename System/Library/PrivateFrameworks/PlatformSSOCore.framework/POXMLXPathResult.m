@implementation POXMLXPathResult

- (POXMLXPathResult)init
{
  POXMLXPathResult *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)POXMLXPathResult;
  result = -[POXMLXPathResult init](&v3, sel_init);
  if (result)
    result->_xpathObj = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (-[POXMLXPathResult xpathObj](self, "xpathObj"))
    xmlXPathFreeObject(-[POXMLXPathResult xpathObj](self, "xpathObj"));
  -[POXMLXPathResult setXpathObj:](self, "setXpathObj:", 0);
  v3.receiver = self;
  v3.super_class = (Class)POXMLXPathResult;
  -[POXMLXPathResult dealloc](&v3, sel_dealloc);
}

- (int)nodeCount
{
  int *v2;

  v2 = (int *)-[POXMLXPathResult xpathObj](self, "xpathObj")[8];
  if (v2)
    return *v2;
  else
    return 0;
}

- (NSArray)nodes
{
  id v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  POXMLNode *v9;

  if (-[POXMLXPathResult xpathObj](self, "xpathObj")
    && (_QWORD)-[POXMLXPathResult xpathObj](self, "xpathObj")[8]
    && *(_DWORD *)-[POXMLXPathResult xpathObj](self, "xpathObj")[8]
    && *(_QWORD *)((_QWORD)-[POXMLXPathResult xpathObj](self, "xpathObj")[8] + 8))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4 = (unsigned int *)-[POXMLXPathResult xpathObj](self, "xpathObj")[8];
    if (v4)
    {
      v5 = *v4;
      if ((int)v5 >= 1)
      {
        v6 = 0;
        v7 = 8 * v5;
        do
        {
          v8 = *(_QWORD *)(*((_QWORD *)v4 + 1) + v6);
          if (!v8)
            -[POXMLXPathResult nodes].cold.1();
          if (*(_DWORD *)(v8 + 8) == 1)
          {
            v9 = objc_alloc_init(POXMLNode);
            -[POXMLNode setNode:](v9, "setNode:", v8);
            -[POXMLNode setXpathResultSet:](v9, "setXpathResultSet:", self);
            objc_msgSend(v3, "addObject:", v9);

          }
          v6 += 8;
        }
        while (v7 != v6);
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (_xmlXPathObject)xpathObj
{
  return self->_xpathObj;
}

- (void)setXpathObj:(_xmlXPathObject *)a3
{
  self->_xpathObj = a3;
}

- (POXMLXPathContext)xpathContext
{
  return self->_xpathContext;
}

- (void)setXpathContext:(id)a3
{
  objc_storeStrong((id *)&self->_xpathContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpathContext, 0);
}

- (void)nodes
{
  __assert_rtn("-[POXMLXPathResult nodes]", "POXMLHelper.m", 182, "nodes->nodeTab[i]");
}

@end
