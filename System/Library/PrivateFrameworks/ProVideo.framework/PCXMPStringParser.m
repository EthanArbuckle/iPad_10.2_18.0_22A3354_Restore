@implementation PCXMPStringParser

- (PCXMPStringParser)init
{
  char *v2;
  PCXMPStringParser *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PCXMPStringParser;
  v2 = -[PCXMPStringParser init](&v5, sel_init);
  v3 = (PCXMPStringParser *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 9) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *((_QWORD *)v2 + 7) = 0;
    *((_QWORD *)v2 + 8) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 23);
    v3->parentTags1 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("rdf:SphericalVideo"), CFSTR("x:xmpmeta"), 0);
    v3->parentTags2 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("rdf:RDF"), 0);
    v3->parentTags3 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("rdf:Description"), 0);
  }
  return v3;
}

- (void)dealloc
{
  NSMutableDictionary *mDict;
  NSArray *parentTags1;
  NSArray *parentTags2;
  NSArray *parentTags3;
  objc_super v7;

  -[PCXMPStringParser parserDidEndDocument:](self, "parserDidEndDocument:", 0);
  mDict = self->mDict;
  if (mDict)

  parentTags1 = self->parentTags1;
  if (parentTags1)

  parentTags2 = self->parentTags2;
  if (parentTags2)

  parentTags3 = self->parentTags3;
  if (parentTags3)

  v7.receiver = self;
  v7.super_class = (Class)PCXMPStringParser;
  -[PCXMPStringParser dealloc](&v7, sel_dealloc);
}

- (void)parseXMPString:(id)a3
{
  void *v5;

  v5 = (void *)MEMORY[0x1B5E29C50](self, a2);
  -[PCXMPStringParser parseXMPData:](self, "parseXMPData:", objc_msgSend(a3, "dataUsingEncoding:", 4));
  objc_autoreleasePoolPop(v5);
}

- (void)parseXMPData:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithData:", a3);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "parse");

}

- (id)parsedData
{
  return self->mDict;
}

- (id)parseErrorString
{
  return self->xmlError;
}

- (void)parserDidStartDocument:(id)a3
{
  -[PCXMPStringParser parserDidEndDocument:](self, "parserDidEndDocument:", a3);
  self->tagParent1 = (NSMutableString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E65EDDA0);
  self->tagParent2 = (NSMutableString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E65EDDA0);
  self->tagParent3 = (NSMutableString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E65EDDA0);
  -[NSMutableDictionary removeAllObjects](self->mDict, "removeAllObjects");
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  NSMutableDictionary *tagDict1;
  NSMutableDictionary *tagDict2;
  NSMutableDictionary *v12;
  NSMutableDictionary *tagDict3;
  NSMutableString *valueString;
  NSMutableDictionary *mDict;

  if (-[NSArray containsObject:](self->parentTags1, "containsObject:", a4))
  {
    -[NSMutableString setString:](self->tagParent1, "setString:", a4);
    -[NSMutableString setString:](self->tagParent2, "setString:", &stru_1E65EDDA0);
    -[NSMutableString setString:](self->tagParent3, "setString:", &stru_1E65EDDA0);
    tagDict1 = self->tagDict1;
    if (tagDict1)

    self->tagDict1 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 47);
    tagDict2 = self->tagDict2;
    if (tagDict2)
    {

      self->tagDict2 = 0;
    }
  }
  else if (-[NSArray containsObject:](self->parentTags2, "containsObject:", a4))
  {
    -[NSMutableString setString:](self->tagParent2, "setString:", a4);
    -[NSMutableString setString:](self->tagParent3, "setString:", &stru_1E65EDDA0);
    v12 = self->tagDict2;
    if (v12)

    self->tagDict2 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 47);
  }
  else if (-[NSArray containsObject:](self->parentTags3, "containsObject:", a4))
  {
    -[NSMutableString setString:](self->tagParent3, "setString:", a4);
    tagDict3 = self->tagDict3;
    if (tagDict3)

    self->tagDict3 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 47);
  }
  valueString = self->valueString;
  if (valueString)

  self->valueString = (NSMutableString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E65EDDA0);
  if (a7 && objc_msgSend(a7, "count"))
  {
    mDict = self->tagDict3;
    if (!mDict)
    {
      mDict = self->tagDict2;
      if (!mDict)
      {
        mDict = self->tagDict1;
        if (!mDict)
          mDict = self->mDict;
      }
    }
    -[NSMutableDictionary setObject:forKey:](mDict, "setObject:forKey:", a7, a4);
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  NSMutableString *valueString;

  valueString = self->valueString;
  if (valueString)
    -[NSMutableString appendString:](valueString, "appendString:", a4);
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  NSMutableDictionary *tagDict3;
  NSMutableDictionary *tagDict2;
  NSMutableDictionary *v10;
  NSMutableDictionary *tagDict1;
  NSMutableDictionary *v12;
  NSMutableString *tagParent1;
  NSMutableDictionary *v14;
  NSMutableDictionary *mDict;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableString *v23;
  NSMutableString *v24;
  NSMutableString *valueString;
  id v26;
  NSMutableString *v27;

  if (-[NSArray containsObject:](self->parentTags1, "containsObject:", a4))
  {
    tagDict3 = self->tagDict3;
    if (tagDict3)
    {
      tagDict2 = self->tagDict2;
      if (!tagDict2)
      {
        tagDict2 = self->tagDict1;
        if (!tagDict2)
          tagDict2 = self->mDict;
      }
      if (-[NSMutableDictionary count](tagDict3, "count"))
        -[NSMutableDictionary setValue:forKey:](tagDict2, "setValue:forKey:", self->tagDict3, (id)-[NSMutableString copy](self->tagParent3, "copy"));

      self->tagDict3 = 0;
      -[NSMutableString setString:](self->tagParent3, "setString:", &stru_1E65EDDA0);
    }
    v10 = self->tagDict2;
    if (v10)
    {
      tagDict1 = self->tagDict1;
      if (!tagDict1)
        tagDict1 = self->mDict;
      if (-[NSMutableDictionary count](v10, "count"))
        -[NSMutableDictionary setValue:forKey:](tagDict1, "setValue:forKey:", self->tagDict2, (id)-[NSMutableString copy](self->tagParent2, "copy"));

      self->tagDict2 = 0;
      -[NSMutableString setString:](self->tagParent2, "setString:", &stru_1E65EDDA0);
    }
    v12 = self->tagDict1;
    if (v12)
    {
      if (-[NSMutableDictionary count](v12, "count"))
        -[NSMutableDictionary setValue:forKey:](self->mDict, "setValue:forKey:", self->tagDict1, (id)-[NSMutableString copy](self->tagParent1, "copy"));

      self->tagDict1 = 0;
    }
    tagParent1 = self->tagParent1;
LABEL_44:
    -[NSMutableString setString:](tagParent1, "setString:", &stru_1E65EDDA0);
    return;
  }
  if (-[NSArray containsObject:](self->parentTags2, "containsObject:", a4))
  {
    v14 = self->tagDict3;
    if (v14)
    {
      mDict = self->tagDict2;
      if (!mDict)
      {
        mDict = self->tagDict1;
        if (!mDict)
          mDict = self->mDict;
      }
      if (-[NSMutableDictionary count](v14, "count"))
        -[NSMutableDictionary setValue:forKey:](mDict, "setValue:forKey:", self->tagDict3, (id)-[NSMutableString copy](self->tagParent3, "copy"));

      self->tagDict3 = 0;
      -[NSMutableString setString:](self->tagParent3, "setString:", &stru_1E65EDDA0);
    }
    v16 = self->tagDict2;
    if (v16)
    {
      v17 = self->tagDict1;
      if (!v17)
        v17 = self->mDict;
      if (-[NSMutableDictionary count](v16, "count"))
        -[NSMutableDictionary setValue:forKey:](v17, "setValue:forKey:", self->tagDict2, (id)-[NSMutableString copy](self->tagParent2, "copy"));

      self->tagDict2 = 0;
    }
    tagParent1 = self->tagParent2;
    goto LABEL_44;
  }
  if (-[NSArray containsObject:](self->parentTags3, "containsObject:", a4))
  {
    v18 = self->tagDict3;
    if (v18)
    {
      v19 = self->tagDict2;
      if (!v19)
      {
        v19 = self->tagDict1;
        if (!v19)
          v19 = self->mDict;
      }
      if (-[NSMutableDictionary count](v18, "count"))
        -[NSMutableDictionary setValue:forKey:](v19, "setValue:forKey:", self->tagDict3, (id)-[NSMutableString copy](self->tagParent3, "copy"));

      self->tagDict3 = 0;
    }
    tagParent1 = self->tagParent3;
    goto LABEL_44;
  }
  if (self->valueString)
  {
    v20 = self->tagDict3;
    if (!v20)
    {
      v20 = self->tagDict2;
      if (!v20)
      {
        v20 = self->tagDict1;
        if (!v20)
          v20 = self->mDict;
      }
    }
    v21 = -[NSMutableDictionary objectForKey:](v20, "objectForKey:", a4);
    if (v21)
    {
      v22 = v21;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = (NSMutableString *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v22);
        v24 = v23;
        valueString = self->valueString;
        v26 = a4;
      }
      else
      {
        v24 = (NSMutableString *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        -[NSMutableString setObject:forKey:](v24, "setObject:forKey:", v22, objc_msgSend(a4, "stringByAppendingString:", CFSTR("-0")));
        v27 = self->valueString;
        v26 = (id)objc_msgSend(a4, "stringByAppendingString:", CFSTR("-1"));
        v23 = v24;
        valueString = v27;
      }
      -[NSMutableString setObject:forKey:](v23, "setObject:forKey:", valueString, v26);
    }
    else
    {
      v24 = self->valueString;
    }
    -[NSMutableDictionary setValue:forKey:](v20, "setValue:forKey:", v24, a4);

    self->valueString = 0;
  }
}

- (void)parserDidEndDocument:(id)a3
{
  NSMutableString *tagParent1;
  NSMutableString *tagParent2;
  NSMutableString *tagParent3;
  NSMutableString *valueString;
  NSMutableDictionary *tagDict1;
  NSMutableDictionary *tagDict2;
  NSMutableDictionary *tagDict3;
  NSString *xmlError;

  tagParent1 = self->tagParent1;
  if (tagParent1)
  {

    self->tagParent1 = 0;
  }
  tagParent2 = self->tagParent2;
  if (tagParent2)
  {

    self->tagParent2 = 0;
  }
  tagParent3 = self->tagParent3;
  if (tagParent3)
  {

    self->tagParent3 = 0;
  }
  valueString = self->valueString;
  if (valueString)
  {

    self->valueString = 0;
  }
  tagDict1 = self->tagDict1;
  if (tagDict1)
  {

    self->tagDict1 = 0;
  }
  tagDict2 = self->tagDict2;
  if (tagDict2)
  {

    self->tagDict2 = 0;
  }
  tagDict3 = self->tagDict3;
  if (tagDict3)
  {

    self->tagDict3 = 0;
  }
  xmlError = self->xmlError;
  if (xmlError)
  {

    self->xmlError = 0;
  }
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  NSString *xmlError;
  NSString *v8;
  NSString *v9;

  xmlError = self->xmlError;
  if (xmlError)

  v8 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XML Parse Error %i, Description: %@, Line: %i"), objc_msgSend(a4, "code"), objc_msgSend(a4, "localizedDescription"), objc_msgSend(a3, "lineNumber"));
  self->xmlError = v8;
  v9 = v8;
}

@end
