@implementation TTSPhonemeMarker

- (int64_t)markType
{
  return 4;
}

- (id)toAVMarkAtOffset:(int64_t)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_alloc(MEMORY[0x1E0C89B58]);
  objc_msgSend_phoneme(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_initWithPhonemeString_atByteSampleOffset_(v5, v11, (uint64_t)v10, a3, v12);

  return v13;
}

- (AVSpeechSynthesisMarker)avMark
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v3 = objc_alloc(MEMORY[0x1E0C89B58]);
  objc_msgSend_phoneme(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_byteOffset(self, v9, v10, v11, v12);
  v16 = (void *)objc_msgSend_initWithPhonemeString_atByteSampleOffset_(v3, v14, (uint64_t)v8, v13, v15);

  return (AVSpeechSynthesisMarker *)v16;
}

- (int64_t)byteOffset
{
  return self->_byteOffset;
}

- (void)setByteOffset:(int64_t)a3
{
  self->_byteOffset = a3;
}

- (NSString)phoneme
{
  return self->_phoneme;
}

- (void)setPhoneme:(id)a3
{
  objc_storeStrong((id *)&self->_phoneme, a3);
}

- (int64_t)alphabet
{
  return self->_alphabet;
}

- (void)setAlphabet:(int64_t)a3
{
  self->_alphabet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneme, 0);
}

@end
