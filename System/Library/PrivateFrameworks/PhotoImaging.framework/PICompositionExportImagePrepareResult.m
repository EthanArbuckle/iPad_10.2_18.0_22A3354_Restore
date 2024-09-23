@implementation PICompositionExportImagePrepareResult

- (NUImageExportRequest)request
{
  return (NUImageExportRequest *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)inputSize
{
  int64_t v2;
  int64_t v3;
  _QWORD v4[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_copyStruct(v4, &self->_inputSize, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setInputSize:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = a3;
  objc_copyStruct(&self->_inputSize, &v3, 16, 1, 0);
}

- (BOOL)inputIsHDR
{
  return self->_inputIsHDR;
}

- (void)setInputIsHDR:(BOOL)a3
{
  self->_inputIsHDR = a3;
}

- (NUColorSpace)inputColorSpace
{
  return (NUColorSpace *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInputColorSpace:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputColorSpace, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
