@implementation PLPTPConversionResult

- (PLPTPConversionResult)initWithRequiresConversion:(BOOL)a3 pathExtension:(id)a4 estimatedFileLength:(unint64_t)a5 inputVideoCodec:(unsigned int)a6 inputContentType:(id)a7 outputVideoCodec:(unsigned int)a8 outputContentType:(id)a9
{
  id v15;
  id v16;
  id v17;
  PLPTPConversionResult *v18;
  PLPTPConversionResult *v19;
  uint64_t v20;
  NSString *pathExtension;
  PLPTPConversionResult *v22;
  objc_super v24;

  v15 = a4;
  v16 = a7;
  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)PLPTPConversionResult;
  v18 = -[PLPTPConversionResult init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_requiresConversion = a3;
    v20 = objc_msgSend(v15, "copy");
    pathExtension = v19->_pathExtension;
    v19->_pathExtension = (NSString *)v20;

    v19->_estimatedFileLength = a5;
    v19->_inputVideoCodec = a6;
    objc_storeStrong((id *)&v19->_inputContentType, a7);
    v19->_outputVideoCodec = a8;
    objc_storeStrong((id *)&v19->_outputContentType, a9);
    v22 = v19;
  }

  return v19;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<PLPTPConversionResult requiresConversion=%d extension=%@ estimatedFileLength=%llu outputContentType=%@>"), self->_requiresConversion, self->_pathExtension, self->_estimatedFileLength, self->_outputContentType);
}

- (BOOL)requiresConversion
{
  return self->_requiresConversion;
}

- (NSString)pathExtension
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)estimatedFileLength
{
  return self->_estimatedFileLength;
}

- (unsigned)inputVideoCodec
{
  return self->_inputVideoCodec;
}

- (UTType)inputContentType
{
  return (UTType *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)outputVideoCodec
{
  return self->_outputVideoCodec;
}

- (UTType)outputContentType
{
  return (UTType *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContentType, 0);
  objc_storeStrong((id *)&self->_inputContentType, 0);
  objc_storeStrong((id *)&self->_pathExtension, 0);
}

@end
