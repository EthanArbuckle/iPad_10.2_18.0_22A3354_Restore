@implementation SDActivityDecryptionKey

- (BOOL)getResultWhileDecryptingBytesInPlace:(unsigned __int8)a3[10] andCounter:(unsigned __int8)a4[2] withTag:(unsigned __int8)a5 version:(unsigned __int8)a6
{
  int v6;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  unsigned __int8 v16;
  unsigned __int8 v17;

  v6 = a5;
  v17 = a6;
  v16 = 0;
  v10 = ccaes_gcm_decrypt_mode(self, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData"));
  v12 = objc_msgSend(v11, "length");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData")));
  ccgcm_one_shot(v10, v12, objc_msgSend(v13, "bytes"), 2, a4, 1, &v17, 10, a3, a3, 1, &v16);

  v14 = v16;
  if (v16 == v6)
    -[SDActivityKey setLastUsedCounter:](self, "setLastUsedCounter:", *(unsigned __int16 *)a4);
  return v14 == v6;
}

@end
