@implementation SFIESOperation

_SFIESCiphertext *__41___SFIESOperation_encrypt_withKey_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _SFIESCiphertext *v6;
  void *v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  void *v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _SFIESCiphertext *v19;
  _SFECPublicKey *v20;
  void *v21;
  _SFECPublicKey *v22;
  id obj;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    v6 = 0;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v8 + 40);
    v6 = (_SFIESCiphertext *)objc_msgSend(v7, "_ccDigestInfoWithError:", &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    if (v6)
    {
      ccaes_gcm_encrypt_mode();
      ccecies_encrypt_gcm_setup();
      objc_msgSend(*(id *)(a1 + 40), "length");
      v9 = ccecies_encrypt_gcm_ciphertext_size();
      v10 = malloc_type_malloc(v9, 0xF235518AuLL);
      v11 = malloc_type_malloc(0, 0xFD778C36uLL);
      v12 = ccecies_pub_key_size();
      v13 = malloc_type_malloc(v12, 0xA97080A9uLL);
      objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
      if (ccecies_encrypt_gcm_composite())
      {
        free(v10);
        free(v11);
        free(v13);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 2, 0, 0, 0, 0);
        v14 = objc_claimAutoreleasedReturnValue();
        v6 = 0;
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;
      }
      else
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v10, v9, 0, 0, 0);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v11, 0);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v13, v12);
        free(v10);
        free(v11);
        free(v13);
        v19 = [_SFIESCiphertext alloc];
        v20 = [_SFECPublicKey alloc];
        objc_msgSend(*(id *)(a1 + 48), "keySpecifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[_SFPublicKey initWithData:specifier:error:](v20, "initWithData:specifier:error:", v18, v21, 0);
        v6 = -[_SFIESCiphertext initWithCiphertext:ephemeralSenderPublicKey:authenticationCode:](v19, "initWithCiphertext:ephemeralSenderPublicKey:authenticationCode:", v16, v22, v17);

      }
    }
  }

  return v6;
}

id __41___SFIESOperation_decrypt_withKey_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  size_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  id obj;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
LABEL_3:
    v6 = 0;
    goto LABEL_9;
  }
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "_ccDigestInfoWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (!v9)
    goto LABEL_3;
  objc_msgSend(*(id *)(a1 + 40), "ciphertext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "authenticationCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "ephemeralSenderPublicKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v10, "length");
  ccaes_gcm_decrypt_mode();
  objc_msgSend(v11, "length");
  ccecies_decrypt_gcm_setup();
  v15 = ccecies_decrypt_gcm_plaintext_size();
  v16 = malloc_type_malloc(v14, 0x230DB9D6uLL);
  v17 = objc_retainAutorelease(v10);
  v18 = objc_msgSend(v17, "bytes");
  v19 = objc_retainAutorelease(v13);
  v20 = objc_msgSend(v19, "bytes");
  v21 = objc_retainAutorelease(v11);
  v26 = objc_msgSend(v21, "bytes");
  if (ccecies_decrypt_gcm_composite())
  {
    free(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFCryptoServicesErrorDomain"), 3, 0, v18, v20, v26);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v16, v15, v18, v20, v26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    free(v16);
  }

LABEL_9:
  return v6;
}

@end
