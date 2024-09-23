@implementation PICompositionExportResult

- (NUImageGeometry)geometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGeometry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
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

- (NSString)digest
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDigest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSURL)exportedFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExportedFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedFileURL, 0);
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
}

@end
