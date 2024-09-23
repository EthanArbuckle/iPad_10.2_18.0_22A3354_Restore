@implementation AVAudioPCMBuffer(RCAdditions)

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (void)initWithCoder:()RCAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  const void *v15;
  void *v17;
  size_t __n;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("format"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(a1, "initWithPCMFormat:frameCapacity:", v17, objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("frameCapacity")));
  if (v5)
  {
    objc_msgSend(v5, "setFrameLength:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("frameLength")));
    v6 = objc_msgSend(v5, "audioBufferList");
    v7 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("mNumberBuffers"));
    if (v7)
    {
      v8 = 0;
      v9 = v7;
      v10 = (void **)(v6 + 16);
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mNumberChannels_%d"), v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "decodeInt32ForKey:", v11);

        if (v12 == *((_DWORD *)v10 - 2))
        {
          __n = 0;
          v13 = objc_retainAutorelease(v4);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mData_%d"), v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (const void *)objc_msgSend(v13, "decodeBytesForKey:returnedLength:", v14, &__n);

          if (v15)
          {
            if (__n == *((_DWORD *)v10 - 1))
              memcpy(*v10, v15, __n);
          }
        }
        v10 += 2;
        ++v8;
      }
      while (v9 != v8);
    }
  }

  return v5;
}

- (void)encodeWithCoder:()RCAdditions
{
  void *v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(a1, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("format"));

  objc_msgSend(v14, "encodeInt32:forKey:", objc_msgSend(a1, "frameCapacity"), CFSTR("frameCapacity"));
  objc_msgSend(v14, "encodeInt32:forKey:", objc_msgSend(a1, "frameLength"), CFSTR("frameLength"));
  v5 = (unsigned int *)objc_msgSend(a1, "audioBufferList");
  objc_msgSend(v14, "encodeInt32:forKey:", *v5, CFSTR("mNumberBuffers"));
  v6 = *v5;
  if ((_DWORD)v6)
  {
    v7 = 0;
    v8 = (uint64_t *)(v5 + 4);
    do
    {
      v9 = *((unsigned int *)v8 - 2);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mNumberChannels_%d"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "encodeInt32:forKey:", v9, v10);

      v11 = *v8;
      v12 = *((unsigned int *)v8 - 1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mData_%d"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "encodeBytes:length:forKey:", v11, v12, v13);

      ++v7;
      v8 += 2;
    }
    while (v6 != v7);
  }

}

- (id)extractChannels:()RCAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[7];
  _QWORD v15[4];

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(a1, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C89AA8]);
  v8 = objc_msgSend(v6, "commonFormat");
  objc_msgSend(v6, "sampleRate");
  v9 = (void *)objc_msgSend(v7, "initWithCommonFormat:sampleRate:channels:interleaved:", v8, v5, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC0]), "initWithPCMFormat:frameCapacity:", v9, objc_msgSend(a1, "frameCapacity"));
  objc_msgSend(v10, "setFrameLength:", objc_msgSend(a1, "frameLength"));
  v11 = objc_msgSend(a1, "audioBufferList");
  v12 = objc_msgSend(v10, "audioBufferList");
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__AVAudioPCMBuffer_RCAdditions__extractChannels___block_invoke;
  v14[3] = &unk_1E769CE40;
  v14[5] = v11;
  v14[6] = v12;
  v14[4] = v15;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v14);
  _Block_object_dispose(v15, 8);

  return v10;
}

@end
