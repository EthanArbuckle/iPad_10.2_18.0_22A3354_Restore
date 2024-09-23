@implementation _PIVideoStabilizeResult

- (_PIVideoStabilizeResult)initWithKeyframes:(id)a3 stabCropRect:(id *)a4 analysisType:(unint64_t)a5 rawHomographies:(id)a6
{
  id v10;
  id v11;
  _PIVideoStabilizeResult *v12;
  _PIVideoStabilizeResult *v13;
  uint64_t v14;
  NSArray *keyframes;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  uint64_t v17;
  NSDictionary *rawHomographies;
  objc_super v20;

  v10 = a3;
  v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_PIVideoStabilizeResult;
  v12 = -[_PIVideoStabilizeResult init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_analysisType = a5;
    v14 = objc_msgSend(v10, "copy");
    keyframes = v13->_keyframes;
    v13->_keyframes = (NSArray *)v14;

    var1 = a4->var1;
    v13->_stabCropRect.origin = ($86B46DF249C2B4242DBB096758D29184)a4->var0;
    v13->_stabCropRect.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
    v17 = objc_msgSend(v11, "copy");
    rawHomographies = v13->_rawHomographies;
    v13->_rawHomographies = (NSDictionary *)v17;

  }
  return v13;
}

- (NSArray)keyframes
{
  return self->_keyframes;
}

- ($B5E4F2499D3E0A90C7E8AF059312C337)stabCropRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var1.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var0.var1;
  retstr->var1 = v3;
  return self;
}

- (unint64_t)analysisType
{
  return self->_analysisType;
}

- (NSDictionary)rawHomographies
{
  return self->_rawHomographies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawHomographies, 0);
  objc_storeStrong((id *)&self->_keyframes, 0);
}

@end
