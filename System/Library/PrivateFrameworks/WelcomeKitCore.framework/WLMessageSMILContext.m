@implementation WLMessageSMILContext

- (WLMessageSMILContext)init
{
  WLMessageSMILContext *v2;
  WLMessageSMILContext *v3;
  NSString *characters;
  NSArray *parts;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WLMessageSMILContext;
  v2 = -[WLMessageSMILContext init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    characters = v2->_characters;
    v2->_characters = (NSString *)&stru_24E376E00;

    parts = v3->_parts;
    v3->_parts = (NSArray *)MEMORY[0x24BDBD1A8];

    *(_WORD *)&v3->_inBody = 0;
  }
  return v3;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v11;
  id v12;
  WLMessageSMILPart *v13;
  NSArray *v14;
  NSArray *parts;
  id v16;

  v11 = a7;
  v12 = a4;
  _WLLog();
  objc_msgSend(v12, "lowercaseString", self, v12, a5, a6, v11);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_inBody)
  {
    if (self->_inPar)
    {
      v13 = -[WLMessageSMILPart initWithElementName:attributes:]([WLMessageSMILPart alloc], "initWithElementName:attributes:", v16, v11);
      -[NSArray arrayByAddingObject:](self->_parts, "arrayByAddingObject:", v13);
      v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
      parts = self->_parts;
      self->_parts = v14;

    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("par")))
    {
      self->_inPar = 1;
    }
  }
  else if (objc_msgSend(v16, "isEqualToString:", CFSTR("body")))
  {
    self->_inBody = 1;
  }

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v9;
  BOOL *p_inBody;
  BOOL *p_inPar;
  _BOOL4 inPar;
  id v13;

  v9 = a4;
  _WLLog();
  objc_msgSend(v9, "lowercaseString", self, v9, a5, a6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  p_inBody = &self->_inBody;
  if (self->_inBody)
  {
    inPar = self->_inPar;
    p_inPar = &self->_inPar;
    if (!inPar)
    {
      p_inPar = p_inBody;
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("body")))
        goto LABEL_5;
      goto LABEL_4;
    }
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("par")) & 1) != 0)
LABEL_4:
      *p_inPar = 0;
  }
LABEL_5:

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5;
  NSString *v6;
  NSString *characters;

  v5 = a4;
  _WLLog();
  -[NSString stringByAppendingString:](self->_characters, "stringByAppendingString:", v5, self, v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  characters = self->_characters;
  self->_characters = v6;

}

- (NSString)characters
{
  return self->_characters;
}

- (NSArray)parts
{
  return self->_parts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_characters, 0);
}

@end
