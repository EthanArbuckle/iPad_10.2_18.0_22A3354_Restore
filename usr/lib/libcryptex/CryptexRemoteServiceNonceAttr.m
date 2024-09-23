@implementation CryptexRemoteServiceNonceAttr

- (CryptexRemoteServiceNonceAttr)init
{
  CryptexRemoteServiceNonceAttr *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CryptexRemoteServiceNonceAttr;
  result = -[CryptexRemoteServiceNonceAttr init](&v3, sel_init);
  *(_OWORD *)&result->_image_type = xmmword_21271F450;
  result->_ndom_handle = -1;
  return result;
}

- (unint64_t)getNonceDomainIndex
{
  unint64_t v3;
  uint64_t v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = -[CryptexRemoteServiceNonceAttr image_type](self, "image_type");
  if (!v3)
    return 3;
  if (v3 != 1)
    -[CryptexRemoteServiceNonceAttr getNonceDomainIndex].cold.1(&v5, v6, self);
  if (-[CryptexRemoteServiceNonceAttr persistence](self, "persistence"))
    return 4;
  else
    return 2;
}

- (unsigned)ndom_handle
{
  uint64_t v4;
  _OWORD v5[5];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (-[CryptexRemoteServiceNonceAttr image_type](self, "image_type") != 2)
    -[CryptexRemoteServiceNonceAttr getNonceDomainIndex].cold.1(&v4, v5, self);
  return self->_ndom_handle;
}

- (unint64_t)image_type
{
  return self->_image_type;
}

- (void)setImage_type:(unint64_t)a3
{
  self->_image_type = a3;
}

- (unint64_t)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(unint64_t)a3
{
  self->_persistence = a3;
}

- (void)setNdom_handle:(unsigned int)a3
{
  self->_ndom_handle = a3;
}

- (void)getNonceDomainIndex
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_2_0();
  objc_msgSend(a3, "image_type");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

@end
