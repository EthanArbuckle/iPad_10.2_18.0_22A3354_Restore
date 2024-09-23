@implementation TVRMSControlInterface

- (TVRMSControlInterface)initWithProtobuf:(id)a3
{
  id v4;
  TVRMSControlInterface *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TVRMSControlInterface;
  v5 = -[TVRMSControlInterface init](&v7, sel_init);
  if (v5)
  {
    v5->_supportsSpeakerSelection = objc_msgSend(v4, "supportsSpeakerSelection");
    v5->_supportsVolumeControl = objc_msgSend(v4, "supportsVolumeControl");
    v5->_supportsDirectionalControl = objc_msgSend(v4, "supportsDirectionalControl");
  }

  return v5;
}

- (id)protobuf
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setSupportsSpeakerSelection:", self->_supportsSpeakerSelection);
  objc_msgSend(v3, "setSupportsVolumeControl:", self->_supportsVolumeControl);
  objc_msgSend(v3, "setSupportsDirectionalControl:", self->_supportsDirectionalControl);
  return v3;
}

- (BOOL)supportsSpeakerSelection
{
  return self->_supportsSpeakerSelection;
}

- (void)setSupportsSpeakerSelection:(BOOL)a3
{
  self->_supportsSpeakerSelection = a3;
}

- (BOOL)supportsVolumeControl
{
  return self->_supportsVolumeControl;
}

- (void)setSupportsVolumeControl:(BOOL)a3
{
  self->_supportsVolumeControl = a3;
}

- (BOOL)supportsDirectionalControl
{
  return self->_supportsDirectionalControl;
}

- (void)setSupportsDirectionalControl:(BOOL)a3
{
  self->_supportsDirectionalControl = a3;
}

@end
