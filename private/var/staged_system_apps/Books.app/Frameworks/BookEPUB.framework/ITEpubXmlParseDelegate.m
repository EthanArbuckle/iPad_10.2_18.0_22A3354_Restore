@implementation ITEpubXmlParseDelegate

- (void)dealloc
{
  ITRetain *decoder;
  NSString *foundCharacters;
  objc_super v5;

  decoder = (ITRetain *)self->decoder;
  if (decoder)
  {
    ITRetain::release(decoder);
    self->decoder = 0;
  }
  foundCharacters = self->foundCharacters;
  self->foundCharacters = 0;

  v5.receiver = self;
  v5.super_class = (Class)ITEpubXmlParseDelegate;
  -[ITEpubXmlParseDelegate dealloc](&v5, "dealloc");
}

- (void)setDecoder:(void *)a3
{
  ITRetain *decoder;

  decoder = (ITRetain *)self->decoder;
  if (decoder)
    ITRetain::release(decoder);
  self->decoder = a3;
  if (a3)
    ITRetain::retain((ITRetain *)a3);
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  __CFString *foundCharacters;
  __CFString *v6;
  NSString *v7;
  NSString *v8;
  void *decoder;
  NSString *v10;
  id v11;

  v11 = a4;
  foundCharacters = (__CFString *)self->foundCharacters;
  if (!foundCharacters)
    foundCharacters = &stru_38FF08;
  v6 = foundCharacters;
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v11));
  v8 = self->foundCharacters;
  self->foundCharacters = v7;

  if (-[NSString length](self->foundCharacters, "length"))
  {
    decoder = self->decoder;
    if (decoder)
      (*(void (**)(void *, NSString *))(*(_QWORD *)decoder + 24))(decoder, self->foundCharacters);
  }
  v10 = self->foundCharacters;
  self->foundCharacters = 0;

}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v10;
  id v11;
  void *decoder;
  id v13;

  v13 = a4;
  v10 = a5;
  v11 = a7;
  decoder = self->decoder;
  if (decoder)
  {
    (*(void (**)(void *, id))(*(_QWORD *)decoder + 40))(decoder, v10);
    (*(void (**)(void *, id, id))(*(_QWORD *)self->decoder + 16))(self->decoder, v13, v11);
  }

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v8;
  void *decoder;
  id v10;

  v10 = a4;
  v8 = a5;
  decoder = self->decoder;
  if (decoder)
  {
    (*(void (**)(void *, id))(*(_QWORD *)decoder + 40))(decoder, v8);
    (*(void (**)(void *, id))(*(_QWORD *)self->decoder + 32))(self->decoder, v10);
  }

}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  NSLog(CFSTR("CDATA %@ \n"), a2, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->foundCharacters, 0);
}

@end
