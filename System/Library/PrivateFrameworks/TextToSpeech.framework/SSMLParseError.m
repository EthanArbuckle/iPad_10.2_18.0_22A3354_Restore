@implementation SSMLParseError

+ (SSMLParseError)errorWith:(id)a3 hint:(id)a4 errorLocation:(id)a5
{
  id v7;
  id v8;
  id v9;
  SSMLParseError *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(SSMLParseError);
  objc_msgSend_setError_(v10, v11, (uint64_t)v9, v12, v13);

  objc_msgSend_setHint_(v10, v14, (uint64_t)v8, v15, v16);
  objc_msgSend_setLocation_(v10, v17, (uint64_t)v7, v18, v19);

  return v10;
}

- (NSString)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSString)hint
{
  return self->_hint;
}

- (void)setHint:(id)a3
{
  objc_storeStrong((id *)&self->_hint, a3);
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
