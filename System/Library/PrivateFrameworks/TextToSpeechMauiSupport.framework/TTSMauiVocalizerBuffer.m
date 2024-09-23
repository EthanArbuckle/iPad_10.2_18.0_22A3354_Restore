@implementation TTSMauiVocalizerBuffer

- (TTSMauiVocalizerBuffer)init
{
  TTSMauiVocalizerBuffer *v2;
  TTSMauiVocalizerBuffer *v3;
  NSArray *markers;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TTSMauiVocalizerBuffer;
  v2 = -[TTSMauiVocalizerBuffer init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    markers = v2->_markers;
    v2->_markers = (NSArray *)MEMORY[0x24BDBD1A8];

    v5 = objc_alloc(MEMORY[0x24BDB1840]);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1820]), "initWithStreamDescription:", &kMauiAudioFormat);
    v7 = (void *)objc_msgSend(v5, "initWithPCMFormat:frameCapacity:", v6, 256);
    -[TTSMauiVocalizerBuffer setAudioBuffer:](v3, "setAudioBuffer:", v7);

  }
  return v3;
}

- (void)computeMarkers:(id)a3
{
  void *v4;
  unint64_t v5;
  char **p_szValue;
  int v7;
  unint64_t v8;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->markerCount)
  {
    v5 = 0;
    p_szValue = &self->markerBuffer[0].szValue;
    do
    {
      v7 = *((_DWORD *)p_szValue - 12);
      if (v7 == 8)
      {
        v16 = *p_szValue;
        v11 = objc_alloc_init(MEMORY[0x24BEB6228]);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setName:", v17);

      }
      else
      {
        v8 = (unint64_t)*(p_szValue - 4);
        if (v7 != 2 || v8 == 0)
          goto LABEL_12;
        v10 = (unint64_t)*(p_szValue - 5);
        v11 = objc_alloc_init(MEMORY[0x24BEB6278]);
        objc_msgSend(v11, "setWordRange:", v10 >> 1, v8 >> 1);
        if (v18)
        {
          v12 = objc_msgSend(v11, "wordRange");
          v14 = objc_msgSend(v18, "translateRangeInTransformedString:", v12, v13);
          objc_msgSend(v11, "setWordRange:", v14, v15);
        }
      }
      objc_msgSend(v4, "addObject:", v11);

LABEL_12:
      ++v5;
      p_szValue += 7;
    }
    while (self->markerCount > v5);
  }
  -[TTSMauiVocalizerBuffer setMarkers:](self, "setMarkers:", v4);

}

- (void)rawAudioBufferPointer
{
  void *v2;
  void *v3;

  -[TTSMauiVocalizerBuffer audioBuffer](self, "audioBuffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(objc_msgSend(v2, "audioBufferList") + 16);

  return v3;
}

- (void)reset
{
  void *v3;

  -[TTSMauiVocalizerBuffer audioBuffer](self, "audioBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrameLength:", 0);

  -[TTSMauiVocalizerBuffer setMarkers:](self, "setMarkers:", MEMORY[0x24BDBD1A8]);
  self->markerCount = 0;
}

- (void)fillInOutDataForBuffer:(id *)a3
{
  void *v5;
  id v6;

  a3->var4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->markerBuffer;
  a3->var2 = -[TTSMauiVocalizerBuffer rawAudioBufferPointer](self, "rawAudioBufferPointer");
  a3->var3 = 1792;
  -[TTSMauiVocalizerBuffer audioBuffer](self, "audioBuffer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  a3->var1 = (*(_DWORD *)(objc_msgSend(v5, "streamDescription") + 24) << 8);

}

- (id)copyWithZone:(_NSZone *)a3
{
  TTSMauiVocalizerBuffer *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t markerCount;
  unint64_t v9;
  char **p_szValue;
  char **v11;
  size_t v12;
  char *v13;

  v4 = objc_alloc_init(TTSMauiVocalizerBuffer);
  memcpy(v4->markerBuffer, self->markerBuffer, 0x708uLL);
  -[TTSMauiVocalizerBuffer audioBuffer](self, "audioBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[TTSMauiVocalizerBuffer setAudioBuffer:](v4, "setAudioBuffer:", v6);

  -[TTSMauiVocalizerBuffer markers](self, "markers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSMauiVocalizerBuffer setMarkers:](v4, "setMarkers:", v7);

  markerCount = v4->markerCount;
  if (markerCount)
  {
    v9 = 0;
    p_szValue = &v4->markerBuffer[0].szValue;
    v11 = &self->markerBuffer[0].szValue;
    do
    {
      if (*v11)
      {
        v12 = strlen(*v11);
        v13 = (char *)malloc_type_calloc(v12, 1uLL, 0x100004077774924uLL);
        *p_szValue = v13;
        strncpy(v13, *v11, v12);
        markerCount = v4->markerCount;
      }
      ++v9;
      p_szValue += 7;
      v11 += 7;
    }
    while (markerCount > v9);
  }
  return v4;
}

- (AVAudioPCMBuffer)audioBuffer
{
  return self->_audioBuffer;
}

- (void)setAudioBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_audioBuffer, a3);
}

- (NSArray)markers
{
  return self->_markers;
}

- (void)setMarkers:(id)a3
{
  objc_storeStrong((id *)&self->_markers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markers, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
}

@end
