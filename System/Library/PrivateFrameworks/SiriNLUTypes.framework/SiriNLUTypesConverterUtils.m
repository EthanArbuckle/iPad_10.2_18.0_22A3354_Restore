@implementation SiriNLUTypesConverterUtils

+ (Reader)getCppReaderFromObjCObject:(SEL)a3
{
  const unsigned __int8 *v5;
  Reader *result;
  id v7;

  objc_msgSend(a4, "data");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const unsigned __int8 *)objc_msgSend(v7, "bytes");
  objc_msgSend(v7, "length");
  PB::Reader::Reader((PB::Reader *)retstr, v5);

  return result;
}

+ (unique_ptr<sirinluinternalnlv4_parser::NLv4ParserRequest,)convertNLv4ParserRequestToCpp:(id)a3
{
  uint64_t *v3;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  unique_ptr<sirinluinternalnlv4_parser::NLv4ParserRequest, std::default_delete<sirinluinternalnlv4_parser::NLv4ParserRequest>> v8;
  uint64_t v9;

  v5 = v3;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "getCppReaderFromObjCObject:", v6);
    v7 = operator new();
    *(_QWORD *)v7 = &off_1E7BB2018;
    *(_OWORD *)(v7 + 8) = 0u;
    *(_OWORD *)(v7 + 24) = 0u;
    *(_OWORD *)(v7 + 48) = 0u;
    *(_OWORD *)(v7 + 64) = 0u;
    *(_DWORD *)(v7 + 80) = 0;
    *v5 = v7;
    sirinluinternalnlv4_parser::NLv4ParserRequest::readFrom((sirinluinternalnlv4_parser::NLv4ParserRequest *)v7, (PB::Reader *)&v9);
  }
  else
  {
    *v5 = 0;
  }

  return v8;
}

+ (id)convertNLv4ParserRequestFromCppToObjC:(void *)a3
{
  PB::Writer *v4;
  uint64_t v5;
  SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest *v6;
  void *v7;
  SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest *v8;

  if (*(_QWORD *)a3)
  {
    v4 = (PB::Writer *)operator new();
    PB::Writer::Writer(v4);
    (*(void (**)(_QWORD, PB::Writer *))(**(_QWORD **)a3 + 24))(*(_QWORD *)a3, v4);
    v5 = *((_QWORD *)v4 + 1);
    v6 = [SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, *(_QWORD *)v4 - *((_QWORD *)v4 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest initWithData:](v6, "initWithData:", v7);

    PB::Writer::~Writer(v4);
    MEMORY[0x1C3BB720C]();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)convertNLv4ParserResponseFromCppToObjC:(void *)a3
{
  PB::Writer *v4;
  uint64_t v5;
  SIRINLUINTERNALNLV4_PARSERNLv4ParserResponse *v6;
  void *v7;
  SIRINLUINTERNALNLV4_PARSERNLv4ParserResponse *v8;

  if (*(_QWORD *)a3)
  {
    v4 = (PB::Writer *)operator new();
    PB::Writer::Writer(v4);
    (*(void (**)(_QWORD, PB::Writer *))(**(_QWORD **)a3 + 24))(*(_QWORD *)a3, v4);
    v5 = *((_QWORD *)v4 + 1);
    v6 = [SIRINLUINTERNALNLV4_PARSERNLv4ParserResponse alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, *(_QWORD *)v4 - *((_QWORD *)v4 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SIRINLUINTERNALNLV4_PARSERNLv4ParserResponse initWithData:](v6, "initWithData:", v7);

    PB::Writer::~Writer(v4);
    MEMORY[0x1C3BB720C]();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (unique_ptr<sirinluinternal::MatchingSpan,)convertMatchingSpanFromObjCToCpp:(id)a3
{
  uint64_t *v3;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  unique_ptr<sirinluinternal::MatchingSpan, std::default_delete<sirinluinternal::MatchingSpan>> v8;
  uint64_t v9;

  v5 = v3;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "getCppReaderFromObjCObject:", v6);
    v7 = operator new();
    *(_QWORD *)v7 = &off_1E7BB1540;
    *(_DWORD *)(v7 + 80) = 0;
    *(_OWORD *)(v7 + 8) = 0u;
    *(_OWORD *)(v7 + 24) = 0u;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *v5 = v7;
    sirinluinternal::MatchingSpan::readFrom((sirinluinternal::MatchingSpan *)v7, (PB::Reader *)&v9);
  }
  else
  {
    *v5 = 0;
  }

  return v8;
}

+ (id)convertMatchingSpanFromCppToObjC:(void *)a3
{
  PB::Writer *v4;
  uint64_t v5;
  SIRINLUINTERNALMatchingSpan *v6;
  void *v7;
  SIRINLUINTERNALMatchingSpan *v8;

  if (*(_QWORD *)a3)
  {
    v4 = (PB::Writer *)operator new();
    PB::Writer::Writer(v4);
    (*(void (**)(_QWORD, PB::Writer *))(**(_QWORD **)a3 + 24))(*(_QWORD *)a3, v4);
    v5 = *((_QWORD *)v4 + 1);
    v6 = [SIRINLUINTERNALMatchingSpan alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, *(_QWORD *)v4 - *((_QWORD *)v4 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SIRINLUINTERNALMatchingSpan initWithData:](v6, "initWithData:", v7);

    PB::Writer::~Writer(v4);
    MEMORY[0x1C3BB720C]();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (unique_ptr<sirinluinternal::TokenChain,)convertTokenChainFromObjCToCpp:(id)a3
{
  uint64_t *v3;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  unique_ptr<sirinluinternal::TokenChain, std::default_delete<sirinluinternal::TokenChain>> v8;
  uint64_t v9;

  v5 = v3;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "getCppReaderFromObjCObject:", v6);
    v7 = operator new();
    *(_QWORD *)v7 = &off_1E7BB0140;
    *(_OWORD *)(v7 + 8) = 0u;
    *(_OWORD *)(v7 + 24) = 0u;
    *(_QWORD *)(v7 + 40) = 0;
    *v5 = v7;
    sirinluinternal::TokenChain::readFrom((sirinluinternal::TokenChain *)v7, (PB::Reader *)&v9);
  }
  else
  {
    *v5 = 0;
  }

  return v8;
}

+ (unique_ptr<sirinluinternal::NLv4EmbeddingTensor,)convertNLv4EmbeddingTensorFromObjCToCpp:(id)a3
{
  uint64_t *v3;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  unique_ptr<sirinluinternal::NLv4EmbeddingTensor, std::default_delete<sirinluinternal::NLv4EmbeddingTensor>> v8;
  uint64_t v9;

  v5 = v3;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "getCppReaderFromObjCObject:", v6);
    v7 = operator new();
    *(_QWORD *)v7 = &off_1E7BB1DD0;
    *(_DWORD *)(v7 + 64) = 0;
    *(_OWORD *)(v7 + 8) = 0u;
    *(_OWORD *)(v7 + 24) = 0u;
    *v5 = v7;
    sirinluinternal::NLv4EmbeddingTensor::readFrom((sirinluinternal::NLv4EmbeddingTensor *)v7, (PB::Reader *)&v9);
  }
  else
  {
    *v5 = 0;
  }

  return v8;
}

+ (unique_ptr<sirinluexternal::EntityCandidate,)convertEntityCandidateFromObjCToCpp:(id)a3
{
  uint64_t *v3;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  unique_ptr<sirinluexternal::EntityCandidate, std::default_delete<sirinluexternal::EntityCandidate>> v8;
  uint64_t v9;

  v5 = v3;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "getCppReaderFromObjCObject:", v6);
    v7 = operator new();
    *(_QWORD *)v7 = &off_1E7BAE4B8;
    *(_OWORD *)(v7 + 8) = 0u;
    *(_OWORD *)(v7 + 24) = 0u;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *(_QWORD *)(v7 + 72) = 0;
    *v5 = v7;
    sirinluexternal::EntityCandidate::readFrom((sirinluexternal::EntityCandidate *)v7, (PB::Reader *)&v9);
  }
  else
  {
    *v5 = 0;
  }

  return v8;
}

+ (unique_ptr<sirinluexternal::UsoGraph,)convertUsoGraphFromObjCToCpp:(id)a3
{
  uint64_t *v3;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  unique_ptr<sirinluexternal::UsoGraph, std::default_delete<sirinluexternal::UsoGraph>> v8;
  uint64_t v9;

  v5 = v3;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "getCppReaderFromObjCObject:", v6);
    v7 = operator new();
    *(_QWORD *)v7 = &off_1E7BB2398;
    *(_OWORD *)(v7 + 8) = 0u;
    *(_OWORD *)(v7 + 24) = 0u;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *(_OWORD *)(v7 + 72) = 0u;
    *(_OWORD *)(v7 + 88) = 0u;
    *(_OWORD *)(v7 + 104) = 0u;
    *(_OWORD *)(v7 + 120) = 0u;
    *v5 = v7;
    sirinluexternal::UsoGraph::readFrom((sirinluexternal::UsoGraph *)v7, (PB::Reader *)&v9);
  }
  else
  {
    *v5 = 0;
  }

  return v8;
}

+ (id)convertUsoGraphFromCppToObjC:(void *)a3
{
  PB::Writer *v4;
  uint64_t v5;
  SIRINLUEXTERNALUsoGraph *v6;
  void *v7;
  SIRINLUEXTERNALUsoGraph *v8;

  if (*(_QWORD *)a3)
  {
    v4 = (PB::Writer *)operator new();
    PB::Writer::Writer(v4);
    (*(void (**)(_QWORD, PB::Writer *))(**(_QWORD **)a3 + 24))(*(_QWORD *)a3, v4);
    v5 = *((_QWORD *)v4 + 1);
    v6 = [SIRINLUEXTERNALUsoGraph alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, *(_QWORD *)v4 - *((_QWORD *)v4 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SIRINLUEXTERNALUsoGraph initWithData:](v6, "initWithData:", v7);

    PB::Writer::~Writer(v4);
    MEMORY[0x1C3BB720C]();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (unique_ptr<sirinluinternalssu::SSURequest,)convertSSURequestFromObjCToCpp:(id)a3
{
  uint64_t *v3;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  unique_ptr<sirinluinternalssu::SSURequest, std::default_delete<sirinluinternalssu::SSURequest>> v8;
  uint64_t v9;

  v5 = v3;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "getCppReaderFromObjCObject:", v6);
    v7 = operator new();
    *(_QWORD *)v7 = &off_1E7BB1400;
    *(_OWORD *)(v7 + 8) = 0u;
    *(_OWORD *)(v7 + 24) = 0u;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *(_OWORD *)(v7 + 72) = 0u;
    *v5 = v7;
    sirinluinternalssu::SSURequest::readFrom((sirinluinternalssu::SSURequest *)v7, (PB::Reader *)&v9);
  }
  else
  {
    *v5 = 0;
  }

  return v8;
}

+ (id)convertSSUResponseFromCppToObjC:(void *)a3
{
  PB::Writer *v4;
  uint64_t v5;
  SIRINLUINTERNALSSUSSUResponse *v6;
  void *v7;
  SIRINLUINTERNALSSUSSUResponse *v8;

  if (*(_QWORD *)a3)
  {
    v4 = (PB::Writer *)operator new();
    PB::Writer::Writer(v4);
    (*(void (**)(_QWORD, PB::Writer *))(**(_QWORD **)a3 + 24))(*(_QWORD *)a3, v4);
    v5 = *((_QWORD *)v4 + 1);
    v6 = [SIRINLUINTERNALSSUSSUResponse alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, *(_QWORD *)v4 - *((_QWORD *)v4 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SIRINLUINTERNALSSUSSUResponse initWithData:](v6, "initWithData:", v7);

    PB::Writer::~Writer(v4);
    MEMORY[0x1C3BB720C]();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
