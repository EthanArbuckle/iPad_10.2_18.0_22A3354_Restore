@implementation CACVoiceOverAnnouncement

- (CACVoiceOverAnnouncement)initWithMessage:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v9;
  id v10;
  CACVoiceOverAnnouncement *v11;
  CACVoiceOverAnnouncement *v12;
  uint64_t v13;
  id completion;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CACVoiceOverAnnouncement;
  v11 = -[CACVoiceOverAnnouncement init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_message, a3);
    v12->_type = a4;
    v13 = MEMORY[0x22E2D5D40](v10);
    completion = v12->_completion;
    v12->_completion = (id)v13;

  }
  return v12;
}

- (NSString)message
{
  return self->_message;
}

- (int64_t)type
{
  return self->_type;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
