@implementation _SVXDeviceSetupFlowDisplayKeyFrameMutation

- (_SVXDeviceSetupFlowDisplayKeyFrameMutation)init
{
  return -[_SVXDeviceSetupFlowDisplayKeyFrameMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXDeviceSetupFlowDisplayKeyFrameMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXDeviceSetupFlowDisplayKeyFrameMutation *v6;
  _SVXDeviceSetupFlowDisplayKeyFrameMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeviceSetupFlowDisplayKeyFrameMutation;
  v6 = -[_SVXDeviceSetupFlowDisplayKeyFrameMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setKeyFrameID:(int64_t)a3
{
  self->_keyFrameID = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)generate
{
  SVXDeviceSetupFlowDisplayKeyFrame *baseModel;
  SVXDeviceSetupFlowDisplayKeyFrame *v4;
  SVXDeviceSetupFlowDisplayKeyFrame *v5;
  int64_t keyFrameID;
  NSString *v7;
  NSString *v8;
  double v9;
  double offset;
  double duration;
  double v12;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXDeviceSetupFlowDisplayKeyFrame initWithKeyFrameID:text:offset:duration:]([SVXDeviceSetupFlowDisplayKeyFrame alloc], "initWithKeyFrameID:text:offset:duration:", self->_keyFrameID, self->_text, self->_offset, self->_duration);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      keyFrameID = self->_keyFrameID;
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
        goto LABEL_8;
    }
    else
    {
      keyFrameID = -[SVXDeviceSetupFlowDisplayKeyFrame keyFrameID](baseModel, "keyFrameID");
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
      {
LABEL_8:
        v7 = self->_text;
        goto LABEL_11;
      }
    }
    -[SVXDeviceSetupFlowDisplayKeyFrame text](self->_baseModel, "text");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v8 = v7;
    if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    {
      offset = self->_offset;
      if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
        goto LABEL_13;
    }
    else
    {
      -[SVXDeviceSetupFlowDisplayKeyFrame offset](self->_baseModel, "offset");
      offset = v9;
      if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
      {
LABEL_13:
        duration = self->_duration;
LABEL_16:
        v5 = -[SVXDeviceSetupFlowDisplayKeyFrame initWithKeyFrameID:text:offset:duration:]([SVXDeviceSetupFlowDisplayKeyFrame alloc], "initWithKeyFrameID:text:offset:duration:", keyFrameID, v8, offset, duration);

        return v5;
      }
    }
    -[SVXDeviceSetupFlowDisplayKeyFrame duration](self->_baseModel, "duration");
    duration = v12;
    goto LABEL_16;
  }
  v4 = (SVXDeviceSetupFlowDisplayKeyFrame *)-[SVXDeviceSetupFlowDisplayKeyFrame copy](baseModel, "copy");
LABEL_5:
  v5 = v4;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
