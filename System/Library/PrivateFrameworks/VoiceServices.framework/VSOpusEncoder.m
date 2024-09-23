@implementation VSOpusEncoder

- (VSOpusEncoder)initWithSourceASBD:(AudioStreamBasicDescription *)a3
{
  VSOpusEncoder *v4;
  uint64_t v5;
  AVAudioFormat *fromFormat;
  uint64_t v7;
  AVAudioFormat *toFormat;
  uint64_t v9;
  AVAudioConverter *converter;
  NSObject *v11;
  NSObject *v12;
  id v13;
  AVAudioFormat *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  AVAudioCompressedBuffer *outputBuffer;
  AVAudioConverter *v20;
  objc_super v21;
  uint8_t buf[4];
  AVAudioConverter *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)VSOpusEncoder;
  v4 = -[VSOpusEncoder init](&v21, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithStreamDescription:", a3);
    fromFormat = v4->_fromFormat;
    v4->_fromFormat = (AVAudioFormat *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithStreamDescription:", &VSAudioFormat48khzOpus);
    toFormat = v4->_toFormat;
    v4->_toFormat = (AVAudioFormat *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89A80]), "initFromFormat:toFormat:", v4->_fromFormat, v4->_toFormat);
    converter = v4->_converter;
    v4->_converter = (AVAudioConverter *)v9;

    if (!-[AVAudioConverter maximumOutputPacketSize](v4->_converter, "maximumOutputPacketSize"))
    {
      VSGetLogDefault();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v20 = v4->_converter;
        *(_DWORD *)buf = 138412290;
        v23 = v20;
        _os_log_error_impl(&dword_1DE15E000, v11, OS_LOG_TYPE_ERROR, "converter.maximumOutputPacketSize is 0. Falling back to maximumPacketSize 1024. Converter is %@", buf, 0xCu);
      }

      VSGetLogDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1DE15E000, v12, OS_LOG_TYPE_FAULT, "AVAudioConverter.maximumOutputPacketSize is 0.", buf, 2u);
      }

    }
    v13 = objc_alloc(MEMORY[0x1E0C89A68]);
    v14 = v4->_toFormat;
    v15 = -[AVAudioConverter maximumOutputPacketSize](v4->_converter, "maximumOutputPacketSize");
    if (v15)
      v16 = v15;
    else
      v16 = 1024;
    v17 = objc_msgSend(v13, "initWithFormat:packetCapacity:maximumPacketSize:", v14, 50, v16);
    outputBuffer = v4->_outputBuffer;
    v4->_outputBuffer = (AVAudioCompressedBuffer *)v17;

  }
  return v4;
}

- (void)setOpusDataHandler:(id)a3
{
  void *v4;
  id opusDataHandler;

  v4 = (void *)MEMORY[0x1DF0E94A4](a3, a2);
  opusDataHandler = self->_opusDataHandler;
  self->_opusDataHandler = v4;

}

- (void)setErrorHandler:(id)a3
{
  void *v4;
  id errorHandler;

  v4 = (void *)MEMORY[0x1DF0E94A4](a3, a2);
  errorHandler = self->_errorHandler;
  self->_errorHandler = v4;

}

- (void)beginEncoding
{
  -[AVAudioConverter reset](self->_converter, "reset");
  self->_opusDataOffset = 0;
}

- (void)encodeChunk:(id)a3
{
  id v4;
  unsigned int v5;
  int v6;
  void *v7;
  uint64_t v8;
  AVAudioConverter *converter;
  AVAudioCompressedBuffer *outputBuffer;
  id v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void (**errorHandler)(id, id);
  void (**opusDataHandler)(id, void *, _QWORD, void *);
  void *v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  int v23;
  id v24;
  _QWORD v25[3];
  int v26;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = v5 / (_DWORD)-[AVAudioFormat streamDescription](self->_fromFormat, "streamDescription")[24];
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  do
  {
    converter = self->_converter;
    outputBuffer = self->_outputBuffer;
    v24 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __29__VSOpusEncoder_encodeChunk___block_invoke;
    v20[3] = &unk_1EA8AF7A8;
    v23 = v6;
    v22 = v25;
    v20[4] = self;
    v11 = v4;
    v21 = v11;
    v12 = -[AVAudioConverter convertToBuffer:error:withInputFromBlock:](converter, "convertToBuffer:error:withInputFromBlock:", outputBuffer, &v24, v20);
    v13 = v24;
    if (v12 <= 1)
    {
      objc_msgSend(v18, "appendBytes:length:", *(_QWORD *)(-[AVAudioCompressedBuffer audioBufferList](self->_outputBuffer, "audioBufferList") + 16), *(unsigned int *)(-[AVAudioCompressedBuffer audioBufferList](self->_outputBuffer, "audioBufferList") + 12));
      v14 = 0;
      v15 = 0;
      v19 = 0uLL;
      while (v15 < -[AVAudioCompressedBuffer packetCount](self->_outputBuffer, "packetCount"))
      {
        v19 = (__int128)-[AVAudioCompressedBuffer packetDescriptions](self->_outputBuffer, "packetDescriptions")[v14];
        *(_QWORD *)&v19 = v19 + self->_opusDataOffset;
        objc_msgSend(v7, "appendBytes:length:", &v19, 16);
        ++v15;
        v14 += 16;
      }
      self->_opusDataOffset = v19 + HIDWORD(v19);
      v8 += -[AVAudioCompressedBuffer packetCount](self->_outputBuffer, "packetCount");
    }

  }
  while (!v12 && !v13);
  if (v13)
  {
    errorHandler = (void (**)(id, id))self->_errorHandler;
    if (errorHandler)
      errorHandler[2](errorHandler, v13);
  }
  else
  {
    opusDataHandler = (void (**)(id, void *, _QWORD, void *))self->_opusDataHandler;
    if (opusDataHandler)
      opusDataHandler[2](opusDataHandler, v18, v8, v7);
  }

  _Block_object_dispose(v25, 8);
}

- (void)endEncoding
{
  -[VSOpusEncoder encodeChunk:](self, "encodeChunk:", 0);
  -[AVAudioConverter reset](self->_converter, "reset");
}

- (id)opusDataHandler
{
  return self->_opusDataHandler;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (AVAudioFormat)fromFormat
{
  return self->_fromFormat;
}

- (void)setFromFormat:(id)a3
{
  objc_storeStrong((id *)&self->_fromFormat, a3);
}

- (AVAudioFormat)toFormat
{
  return self->_toFormat;
}

- (void)setToFormat:(id)a3
{
  objc_storeStrong((id *)&self->_toFormat, a3);
}

- (AVAudioConverter)converter
{
  return self->_converter;
}

- (void)setConverter:(id)a3
{
  objc_storeStrong((id *)&self->_converter, a3);
}

- (AVAudioCompressedBuffer)outputBuffer
{
  return self->_outputBuffer;
}

- (void)setOutputBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_outputBuffer, a3);
}

- (int64_t)opusDataOffset
{
  return self->_opusDataOffset;
}

- (void)setOpusDataOffset:(int64_t)a3
{
  self->_opusDataOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBuffer, 0);
  objc_storeStrong((id *)&self->_converter, 0);
  objc_storeStrong((id *)&self->_toFormat, 0);
  objc_storeStrong((id *)&self->_fromFormat, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_opusDataHandler, 0);
}

id __29__VSOpusEncoder_encodeChunk___block_invoke(uint64_t a1, int a2, uint64_t *a3)
{
  int v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  size_t v12;
  unsigned int v13;
  uint64_t v14;

  if (!*(_DWORD *)(a1 + 56))
  {
    v11 = 0;
    v14 = 2;
LABEL_12:
    *a3 = v14;
    return v11;
  }
  v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v7 = (*(_DWORD *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "streamDescription") + 24) * v6);
  if (objc_msgSend(*(id *)(a1 + 40), "length") <= v7)
  {
    v11 = 0;
    v14 = 1;
    goto LABEL_12;
  }
  v8 = *(_DWORD *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "streamDescription") + 20) * a2;
  v9 = *(_DWORD *)(a1 + 56) - *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v8 >= v9)
    v10 = v9;
  else
    v10 = v8;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC0]), "initWithPCMFormat:frameCapacity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v10);
  objc_msgSend(v11, "setFrameLength:", v10);
  LODWORD(v12) = *(_DWORD *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "streamDescription") + 24) * v10;
  v13 = objc_msgSend(*(id *)(a1 + 40), "length") - v7;
  if (v12 >= v13)
    v12 = v13;
  else
    v12 = v12;
  memcpy(*(void **)(objc_msgSend(v11, "mutableAudioBufferList") + 16), (const void *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes") + v7), v12);
  *(_DWORD *)(objc_msgSend(v11, "mutableAudioBufferList") + 12) = v12;
  *a3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v10;
  return v11;
}

@end
