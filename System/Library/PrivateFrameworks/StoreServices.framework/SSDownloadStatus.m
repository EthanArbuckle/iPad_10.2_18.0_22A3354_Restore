@implementation SSDownloadStatus

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadStatus;
  -[SSDownloadStatus dealloc](&v3, sel_dealloc);
}

- (BOOL)isFailedTransient
{
  return !-[SSDownloadStatus isFailed](self, "isFailed") && -[SSDownloadStatus error](self, "error") != 0;
}

- (BOOL)isPausable
{
  return -[SSOperationProgress canPause](-[SSDownloadPhase operationProgress](self->_activePhase, "operationProgress"), "canPause");
}

- (float)percentComplete
{
  SSOperationProgress *v2;
  float v3;
  SSOperationProgress *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = -[SSDownloadPhase operationProgress](self->_activePhase, "operationProgress");
  v3 = 0.0;
  if (v2)
  {
    v4 = v2;
    v5 = -[SSOperationProgress normalizedCurrentValue](v2, "normalizedCurrentValue");
    v6 = -[SSOperationProgress normalizedMaxValue](v4, "normalizedMaxValue");
    if (v6 >= 1)
      return (float)v5 / (float)v6;
  }
  return v3;
}

- (void)setOperationProgress:(id)a3
{
  SSDownloadPhase *v5;

  if (a3)
    v5 = -[SSDownloadPhase initWithOperationProgress:]([SSDownloadPhase alloc], "initWithOperationProgress:", a3);
  else
    v5 = 0;
  self->_activePhase = v5;
}

- (void)setOperationType:(int64_t)a3
{
  -[SSOperationProgress setOperationType:](-[SSDownloadPhase operationProgress](self->_activePhase, "operationProgress"), "setOperationType:", a3);
}

- (void)setPausable:(BOOL)a3
{
  -[SSOperationProgress setCanPause:](-[SSDownloadPhase operationProgress](self->_activePhase, "operationProgress"), "setCanPause:", a3);
}

- (void)setPercentComplete:(float)a3
{
  SSOperationProgress *v4;

  v4 = -[SSDownloadPhase operationProgress](self->_activePhase, "operationProgress");
  -[SSOperationProgress setNormalizedCurrentValue:](v4, "setNormalizedCurrentValue:", (uint64_t)(float)((float)-[SSOperationProgress normalizedMaxValue](v4, "normalizedMaxValue") * a3));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = -[SSDownloadPhase copyWithZone:](self->_activePhase, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 16) = self->_contentRestricted;
  *(_QWORD *)(v5 + 24) = -[NSError copyWithZone:](self->_error, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 32) = self->_failed;
  *(_BYTE *)(v5 + 33) = self->_paused;
  return (id)v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_activePhase);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_error);
  xpc_dictionary_set_BOOL(v3, "4", self->_contentRestricted);
  xpc_dictionary_set_BOOL(v3, "2", self->_failed);
  xpc_dictionary_set_BOOL(v3, "3", self->_paused);
  return v3;
}

- (SSDownloadStatus)initWithXPCEncoding:(id)a3
{
  SSDownloadStatus *v5;
  objc_super v7;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSDownloadStatus;
    v5 = -[SSDownloadStatus init](&v7, sel_init);
    if (v5)
    {
      v5->_activePhase = -[SSDownloadPhase initWithXPCEncoding:]([SSDownloadPhase alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "0"));
      v5->_error = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
      v5->_contentRestricted = xpc_dictionary_get_BOOL(a3, "4");
      v5->_failed = xpc_dictionary_get_BOOL(a3, "2");
      v5->_paused = xpc_dictionary_get_BOOL(a3, "3");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (SSDownloadPhase)activePhase
{
  return self->_activePhase;
}

- (BOOL)isContentRestricted
{
  return self->_contentRestricted;
}

- (void)setContentRestricted:(BOOL)a3
{
  self->_contentRestricted = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)isFailed
{
  return self->_failed;
}

- (void)setFailed:(BOOL)a3
{
  self->_failed = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

@end
