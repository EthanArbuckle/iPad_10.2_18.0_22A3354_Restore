@implementation SPSentencePieceModel

- (SPSentencePieceModel)initWithModelPath:(id)a3
{
  id v4;
  SPSentencePieceModel *v5;
  utils *v6;
  uint64_t v7;
  SPSentencePieceModel *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SPSentencePieceModel;
  v5 = -[SPSentencePieceModel init](&v10, sel_init);
  if (v5
    && (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4),
        v6 = (utils *)objc_claimAutoreleasedReturnValue(),
        v7 = SPSentencePieceProcessorCreate(v6),
        v5->_processor = (__SPSentencePieceProcessorWrapper *)v7,
        v6,
        !v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)dealloc
{
  __SPSentencePieceProcessorWrapper *processor;
  objc_super v4;

  processor = self->_processor;
  if (processor)
    CFRelease(processor);
  v4.receiver = self;
  v4.super_class = (Class)SPSentencePieceModel;
  -[SPSentencePieceModel dealloc](&v4, sel_dealloc);
}

- (id)encodeAsIDsFrom:(id)a3
{
  return SPSentencePieceProcessorCreateEncodedIDs((uint64_t)self->_processor, (const __CFString *)a3, 0);
}

- (id)encodeAsTokensFrom:(id)a3
{
  return SPSentencePieceProcessorCreateEncodedPieces((uint64_t)self->_processor, (const __CFString *)a3, 0);
}

- (id)decodeFromTokens:(id)a3
{
  return (id)SPSentencePieceProcessorCreateDecodedStringFromPieces((uint64_t)self->_processor, (utils *)a3, 0);
}

- (id)decodeFromIDs:(id)a3
{
  return (id)SPSentencePieceProcessorCreateDecodedStringFromIDs((uint64_t)self->_processor, (utils *)a3, 0);
}

@end
