@implementation TRIFBFactorMetadataKeyValueBuilder

- (void)dealloc
{
  FactorMetadataKeyValueBuilder *bldr;
  objc_super v4;

  bldr = self->_bldr;
  if (bldr)
    MEMORY[0x1A1AC6820](bldr, 0x1020C403A5D3213);
  v4.receiver = self;
  v4.super_class = (Class)TRIFBFactorMetadataKeyValueBuilder;
  -[TRIFBFactorMetadataKeyValueBuilder dealloc](&v4, sel_dealloc);
}

- (void)setKey:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2826, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 4, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setVal:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2836, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 6, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
