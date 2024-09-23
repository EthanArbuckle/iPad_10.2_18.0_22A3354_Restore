@implementation SAFrameDeserializationHelper

- (SAFrameDeserializationHelper)initWithFrame:(id)a3 buffer:(const void *)a4 bufferLength:(unint64_t)a5
{
  id v9;
  SAFrameDeserializationHelper *v10;
  SAFrameDeserializationHelper *v11;
  SAFrameDeserializationHelper *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SAFrameDeserializationHelper;
  v10 = -[SAFrameDeserializationHelper init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_frame, a3);
    v11->_buffer = a4;
    v11->_bufferLength = a5;
    v12 = v11;
  }

  return v11;
}

- (SAFrame)frame
{
  return (SAFrame *)objc_getProperty(self, a2, 8, 1);
}

- (const)buffer
{
  return self->_buffer;
}

- (unint64_t)bufferLength
{
  return self->_bufferLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frame, 0);
}

@end
