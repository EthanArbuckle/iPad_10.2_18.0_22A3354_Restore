@implementation SFIncrementingIVGenerator

- (SFIncrementingIVGenerator)initWithRandomMessageID
{
  void *v3;
  const __SecRandom *v4;
  id v5;
  SFIncrementingIVGenerator *v6;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLength:", 32);
  v4 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v5 = objc_retainAutorelease(v3);
  if (SecRandomCopyBytes(v4, 0x20uLL, (void *)objc_msgSend(v5, "mutableBytes")))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("could not get a random initialization vector"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  v6 = -[SFIncrementingIVGenerator initWithMessageID:](self, "initWithMessageID:", v5);

  return v6;
}

- (SFIncrementingIVGenerator)initWithMessageID:(id)a3
{
  id v4;
  SFIncrementingIVGenerator *v5;
  SFIncrementingIVGenerator_Ivars *v6;
  id incrementingIVGeneratorInternal;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFIncrementingIVGenerator;
  v5 = -[SFIncrementingIVGenerator init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(SFIncrementingIVGenerator_Ivars);
    incrementingIVGeneratorInternal = v5->_incrementingIVGeneratorInternal;
    v5->_incrementingIVGeneratorInternal = v6;

    v8 = objc_msgSend(v4, "mutableCopy");
    v9 = v5->_incrementingIVGeneratorInternal;
    v10 = (void *)v9[1];
    v9[1] = v8;

  }
  return v5;
}

- (id)generateIVWithLength:(int64_t)a3 error:(id *)a4
{
  id incrementingIVGeneratorInternal;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  _QWORD *v17;
  __int16 v18;

  incrementingIVGeneratorInternal = self->_incrementingIVGeneratorInternal;
  if (*((_QWORD *)incrementingIVGeneratorInternal + 2) >= (unint64_t)a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    incrementingIVGeneratorInternal = self->_incrementingIVGeneratorInternal;
  }
  else
  {
    v8 = 0;
  }
  if (a3 - 1 >= (unint64_t)objc_msgSend(*((id *)incrementingIVGeneratorInternal + 1), "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 7, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  if (a4 && v8)
  {
    v10 = 0;
    *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    objc_msgSend(*((id *)self->_incrementingIVGeneratorInternal + 1), "subdataWithRange:", objc_msgSend(*((id *)self->_incrementingIVGeneratorInternal + 1), "length") - a3, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*((id *)self->_incrementingIVGeneratorInternal + 1), "length");
    v12 = objc_msgSend(*((id *)self->_incrementingIVGeneratorInternal + 1), "mutableBytes");
    v13 = (*(_BYTE *)(v12 + v11 - 1))++ + 1;
    if ((v13 & 0x100) != 0 && v11 != 1)
    {
      v14 = 1 - v11;
      v15 = (_BYTE *)(v11 + v12 - 2);
      do
      {
        v16 = objc_msgSend(*((id *)self->_incrementingIVGeneratorInternal + 1), "length") + v14;
        v17 = self->_incrementingIVGeneratorInternal;
        if (v16 <= v17[2])
          v16 = v17[2];
        v17[2] = v16;
        v18 = (*v15--)++ + 1;
        if ((v18 & 0x100) == 0)
          break;
        ++v14;
      }
      while (v14);
    }
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_incrementingIVGeneratorInternal, 0);
}

- (NSData)messageID
{
  return (NSData *)(id)objc_msgSend(*((id *)self->_incrementingIVGeneratorInternal + 1), "copy");
}

- (void)setMessageID:(id)a3
{
  uint64_t v4;
  _QWORD *incrementingIVGeneratorInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  incrementingIVGeneratorInternal = self->_incrementingIVGeneratorInternal;
  v6 = (void *)incrementingIVGeneratorInternal[1];
  incrementingIVGeneratorInternal[1] = v4;

}

@end
