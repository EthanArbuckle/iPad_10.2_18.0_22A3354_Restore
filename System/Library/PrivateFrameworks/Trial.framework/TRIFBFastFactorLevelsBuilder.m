@implementation TRIFBFastFactorLevelsBuilder

- (void)dealloc
{
  FastFactorLevelsBuilder *bldr;
  objc_super v4;

  bldr = self->_bldr;
  if (bldr)
    MEMORY[0x1A1AC6820](bldr, 0x1020C403A5D3213);
  v4.receiver = self;
  v4.super_class = (Class)TRIFBFastFactorLevelsBuilder;
  -[TRIFBFastFactorLevelsBuilder dealloc](&v4, sel_dealloc);
}

- (void)setLevels:(id)a3
{
  id v5;
  void *v6;
  id v7;
  unsigned int v8;
  FlatBufferBuilder *var0;
  int v10;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4622, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    v8 = objc_msgSend(v7, "unsignedIntValue");
    if (v8)
    {
      var0 = self->_bldr->var0;
      v10 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)var0, v8);
      apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)var0, 4, v10);
    }

  }
}

- (void)setSourceWithTreatmentId:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4631, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 6, 1);
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 8, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setSourceWithFactorPackId:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4641, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 6, 2);
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 8, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setNamespaceName:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4652, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 10, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setNcvs:(id)a3
{
  id v5;
  void *v6;
  id v7;
  unsigned int v8;
  FlatBufferBuilder *var0;
  int v10;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4662, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    v8 = objc_msgSend(v7, "unsignedIntValue");
    if (v8)
    {
      var0 = self->_bldr->var0;
      v10 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)var0, v8);
      apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)var0, 12, v10);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
