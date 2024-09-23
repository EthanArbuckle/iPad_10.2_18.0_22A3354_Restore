@implementation PTDisparityPostProcessingDescriptor

- (PTDisparityPostProcessingDescriptor)initWithCommandQueue:(id)a3 disparitySize:(id *)a4 filteredDisparitySize:(id *)a5 disparityPixelFormat:(unint64_t)a6 colorSize:(id *)a7 colorPixelFormat:(unint64_t)a8 sensorPort:(id)a9
{
  id v16;
  id v17;
  PTDisparityPostProcessingDescriptor *v18;
  PTDisparityPostProcessingDescriptor *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  PTDisparityPostProcessingDescriptor *v23;
  objc_super v25;

  v16 = a3;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)PTDisparityPostProcessingDescriptor;
  v18 = -[PTDisparityPostProcessingDescriptor init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_commandQueue, a3);
    v20 = *(_OWORD *)&a4->var0;
    v19->_disparitySize.depth = a4->var2;
    *(_OWORD *)&v19->_disparitySize.width = v20;
    v21 = *(_OWORD *)&a5->var0;
    v19->_filteredDisparitySize.depth = a5->var2;
    *(_OWORD *)&v19->_filteredDisparitySize.width = v21;
    v19->_disparityPixelFormat = a6;
    v22 = *(_OWORD *)&a7->var0;
    v19->_colorSize.depth = a7->var2;
    *(_OWORD *)&v19->_colorSize.width = v22;
    v19->_colorPixelFormat = a8;
    objc_storeStrong((id *)&v19->_sensorPort, a9);
    v23 = v19;
  }

  return v19;
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)objc_getProperty(self, a2, 8, 1);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)disparitySize
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  objc_copyStruct(retstr, &self->_disparitySize, 24, 1, 0);
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)filteredDisparitySize
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  objc_copyStruct(retstr, &self->_filteredDisparitySize, 24, 1, 0);
  return result;
}

- (unint64_t)disparityPixelFormat
{
  return self->_disparityPixelFormat;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)colorSize
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  objc_copyStruct(retstr, &self->_colorSize, 24, 1, 0);
  return result;
}

- (unint64_t)colorPixelFormat
{
  return self->_colorPixelFormat;
}

- (NSString)sensorPort
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorPort, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
}

@end
