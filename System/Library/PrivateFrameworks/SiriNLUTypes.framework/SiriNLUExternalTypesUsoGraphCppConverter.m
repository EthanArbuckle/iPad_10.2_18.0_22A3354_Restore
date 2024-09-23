@implementation SiriNLUExternalTypesUsoGraphCppConverter

+ (id)convertCppGraph:(const void *)a3
{
  uint64_t v3;
  PB::Writer *v4;
  uint64_t v5;
  SIRINLUEXTERNALUsoGraph *v6;
  void *v7;
  SIRINLUEXTERNALUsoGraph *v8;
  uint64_t v10;

  if (!a3)
    return 0;
  siri::ontology::UsoGraphProtoWriter::toProtobuf((siri::ontology::UsoGraphProtoWriter *)a3, &v10);
  v3 = v10;
  if (!v10)
    return 0;
  v4 = (PB::Writer *)operator new();
  PB::Writer::Writer(v4);
  (*(void (**)(uint64_t, PB::Writer *))(*(_QWORD *)v3 + 24))(v3, v4);
  v5 = *((_QWORD *)v4 + 1);
  v6 = [SIRINLUEXTERNALUsoGraph alloc];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, *(_QWORD *)v4 - *((_QWORD *)v4 + 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SIRINLUEXTERNALUsoGraph initWithData:](v6, "initWithData:", v7);

  PB::Writer::~Writer(v4);
  MEMORY[0x1C3BB720C]();
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return v8;
}

@end
