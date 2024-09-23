@implementation _SVXDeactivationOptionsMutation

- (_SVXDeactivationOptionsMutation)init
{
  return -[_SVXDeactivationOptionsMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXDeactivationOptionsMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXDeactivationOptionsMutation *v6;
  _SVXDeactivationOptionsMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeactivationOptionsMutation;
  v6 = -[_SVXDeactivationOptionsMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setAudioSessionDeactivationDelay:(double)a3
{
  self->_audioSessionDeactivationDelay = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)generate
{
  SVXDeactivationOptions *baseModel;
  SVXDeactivationOptions *v4;
  SVXDeactivationOptions *v5;
  double audioSessionDeactivationDelay;
  double v7;
  double v8;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = [SVXDeactivationOptions alloc];
    audioSessionDeactivationDelay = self->_audioSessionDeactivationDelay;
LABEL_9:
    v4 = -[SVXDeactivationOptions initWithAudioSessionDeactivationDelay:](v5, "initWithAudioSessionDeactivationDelay:", audioSessionDeactivationDelay);
    return v4;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      v8 = self->_audioSessionDeactivationDelay;
    }
    else
    {
      -[SVXDeactivationOptions audioSessionDeactivationDelay](baseModel, "audioSessionDeactivationDelay");
      v8 = v7;
    }
    v5 = [SVXDeactivationOptions alloc];
    audioSessionDeactivationDelay = v8;
    goto LABEL_9;
  }
  v4 = (SVXDeactivationOptions *)-[SVXDeactivationOptions copy](baseModel, "copy");
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
