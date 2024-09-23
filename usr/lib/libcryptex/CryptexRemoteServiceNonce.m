@implementation CryptexRemoteServiceNonce

- (CryptexRemoteServiceNonce)initWithNonce:(const _img4_nonce *)a3
{
  CryptexRemoteServiceNonce *v4;
  _img4_nonce *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  objc_super v10;
  uint64_t v11;
  _OWORD v12[5];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)CryptexRemoteServiceNonce;
  v4 = -[CryptexRemoteServiceNonce init](&v10, sel_init);
  v5 = (_img4_nonce *)malloc_type_calloc(1uLL, 0x38uLL, 0x61D5536CuLL);
  if (!v5)
    -[CryptexRemoteServiceNonce initWithNonce:].cold.1(&v11, v12);
  v4->_nonce = v5;
  v6 = *(_OWORD *)&a3->var0;
  v7 = *(_OWORD *)&a3->var1[14];
  v8 = *(_OWORD *)&a3->var1[30];
  *(_QWORD *)&v5->var1[46] = *(_QWORD *)&a3->var1[46];
  *(_OWORD *)&v5->var1[14] = v7;
  *(_OWORD *)&v5->var1[30] = v8;
  *(_OWORD *)&v5->var0 = v6;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (-[CryptexRemoteServiceNonce nonce](self, "nonce"))
  {
    free(self->_nonce);
    self->_nonce = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CryptexRemoteServiceNonce;
  -[CryptexRemoteServiceNonce dealloc](&v3, sel_dealloc);
}

- (_img4_nonce)nonce
{
  return self->_nonce;
}

- (void)initWithNonce:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_5();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

@end
