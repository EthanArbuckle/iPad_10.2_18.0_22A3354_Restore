@implementation RAPAuxiliaryControlsRecording

- (RAPAuxiliaryControlsRecording)initWithControlsGeo:(id)a3 originatingIndex:(unint64_t)a4
{
  id v6;
  RAPAuxiliaryControlsRecording *v7;
  NSArray *v8;
  NSArray *auxiliaryControls;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RAPAuxiliaryControlsRecording;
  v7 = -[RAPAuxiliaryControlsRecording init](&v11, "init");
  if (v7)
  {
    v8 = (NSArray *)objc_msgSend(v6, "copy");
    auxiliaryControls = v7->_auxiliaryControls;
    v7->_auxiliaryControls = v8;

    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7->_hasOriginatingAuxiliaryControlIndex = 1;
      v7->_originatingAuxiliaryControlIndex = a4;
    }
  }

  return v7;
}

- (NSArray)auxiliaryControls
{
  return self->_auxiliaryControls;
}

- (unint64_t)originatingAuxiliaryControlIndex
{
  return self->_originatingAuxiliaryControlIndex;
}

- (BOOL)hasOriginatingAuxiliaryControlIndex
{
  return self->_hasOriginatingAuxiliaryControlIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryControls, 0);
}

@end
