@implementation PXVideoProcessingOperationSpec

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->_inputVideoURL);
  return v4;
}

- (NSURL)inputVideoURL
{
  return self->_inputVideoURL;
}

- (void)setInputVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_inputVideoURL, a3);
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
  objc_storeStrong((id *)&self->_outputURL, a3);
}

- (NSURL)debugInfoOutputURL
{
  return self->_debugInfoOutputURL;
}

- (void)setDebugInfoOutputURL:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfoOutputURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfoOutputURL, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_inputVideoURL, 0);
}

@end
