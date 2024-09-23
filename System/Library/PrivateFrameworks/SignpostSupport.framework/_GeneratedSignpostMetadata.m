@implementation _GeneratedSignpostMetadata

- (_GeneratedSignpostMetadata)initWithName:(id)a3
{
  id v5;
  _GeneratedSignpostMetadata *v6;
  _GeneratedSignpostMetadata *v7;
  _GeneratedSignpostMetadata *v8;
  NSObject *v9;
  objc_super v11;

  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)_GeneratedSignpostMetadata;
    v6 = -[_GeneratedSignpostMetadata init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_name, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    _signpost_debug_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_GeneratedSignpostMetadata initWithName:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(id)a3
{
  objc_storeStrong((id *)&self->_signpostId, a3);
}

- (NSNumber)beginMct
{
  return self->_beginMct;
}

- (void)setBeginMct:(id)a3
{
  objc_storeStrong((id *)&self->_beginMct, a3);
}

- (NSNumber)endMct
{
  return self->_endMct;
}

- (void)setEndMct:(id)a3
{
  objc_storeStrong((id *)&self->_endMct, a3);
}

- (NSNumber)emitMct
{
  return self->_emitMct;
}

- (void)setEmitMct:(id)a3
{
  objc_storeStrong((id *)&self->_emitMct, a3);
}

- (NSNumber)baseMct
{
  return self->_baseMct;
}

- (void)setBaseMct:(id)a3
{
  objc_storeStrong((id *)&self->_baseMct, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseMct, 0);
  objc_storeStrong((id *)&self->_emitMct, 0);
  objc_storeStrong((id *)&self->_endMct, 0);
  objc_storeStrong((id *)&self->_beginMct, 0);
  objc_storeStrong((id *)&self->_signpostId, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1A1A28000, v0, v1, "nil name when trying to initialize _GeneratedSignpostMetadata", v2);
  OUTLINED_FUNCTION_9();
}

@end
