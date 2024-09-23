@implementation PXVideoFormatMetadataObjc

- (PXVideoFormatMetadataObjc)initWithMetadata:(id)a3
{
  id v4;
  PXVideoFormatMetadataObjc *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXVideoFormatMetadataObjc;
  v5 = -[PXVideoFormatMetadataObjc init](&v7, sel_init);
  if (v5)
    v5->_isProResLog = objc_msgSend(v4, "isProResLog");

  return v5;
}

- (BOOL)isProResLog
{
  return self->_isProResLog;
}

@end
