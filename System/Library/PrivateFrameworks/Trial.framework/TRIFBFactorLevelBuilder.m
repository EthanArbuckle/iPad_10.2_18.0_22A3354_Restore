@implementation TRIFBFactorLevelBuilder

- (void)dealloc
{
  FactorLevelBuilder *bldr;
  objc_super v4;

  bldr = self->_bldr;
  if (bldr)
    MEMORY[0x1A1AC6820](bldr, 0x1020C403A5D3213);
  v4.receiver = self;
  v4.super_class = (Class)TRIFBFactorLevelBuilder;
  -[TRIFBFactorLevelBuilder dealloc](&v4, sel_dealloc);
}

- (void)setName:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3669, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 4, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setLevelWithBoolVal:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3679, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

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

- (void)setLevelWithStringVal:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3689, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

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

- (void)setLevelWithInt64Val:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3700, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 6, 3);
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 8, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setLevelWithDoubleVal:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3711, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 6, 4);
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 8, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setLevelWithTrialAssetVal:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3722, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 6, 5);
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 8, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setLevelWithMaRefVal:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3733, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 6, 6);
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 8, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setMetadata:(id)a3
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
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3744, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

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
      apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)var0, 10, v10);
    }

  }
}

- (void)setCacheKey:(unsigned int)a3
{
  void *v5;

  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)self->_bldr->var0, 12, a3);
}

- (void)setAlias:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3761, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 14, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setFactorNamespaceName:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3771, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 16, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setFactorId:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3781, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 18, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setNamespaceId:(unsigned int)a3
{
  void *v5;

  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)self->_bldr->var0, 20, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
