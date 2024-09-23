@implementation TTSGenericMarker

- (int64_t)markType
{
  return 3;
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
  objc_msgSend_name(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_byteOffset(self, v9, v10, v11, v12);
  v16 = (void *)objc_msgSend_initWithBookmarkName_atByteSampleOffset_(v3, v14, (uint64_t)v8, v13, v15);

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

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
