@implementation SSDownloadPhase

- (SSDownloadPhase)init
{
  return -[SSDownloadPhase initWithOperationProgress:](self, "initWithOperationProgress:", 0);
}

- (SSDownloadPhase)initWithOperationProgress:(id)a3
{
  SSDownloadPhase *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSDownloadPhase;
  v4 = -[SSDownloadPhase init](&v6, sel_init);
  if (v4)
    v4->_operationProgress = (SSOperationProgress *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadPhase;
  -[SSDownloadPhase dealloc](&v3, sel_dealloc);
}

- (double)estimatedSecondsRemaining
{
  double result;

  -[SSOperationProgress estimatedTimeRemaining](self->_operationProgress, "estimatedTimeRemaining");
  return result;
}

- (int64_t)phaseType
{
  int64_t v2;

  v2 = -[SSOperationProgress operationType](self->_operationProgress, "operationType");
  if ((unint64_t)(v2 - 1) > 2)
    return 2;
  else
    return qword_1A27A0D10[v2 - 1];
}

- (int64_t)progressUnits
{
  return -[SSOperationProgress units](self->_operationProgress, "units") != 1;
}

- (float)progressChangeRate
{
  double v2;

  -[SSOperationProgress changeRate](self->_operationProgress, "changeRate");
  return v2;
}

- (int64_t)progressValue
{
  return -[SSOperationProgress currentValue](self->_operationProgress, "currentValue");
}

- (int64_t)totalProgressValue
{
  return -[SSOperationProgress maxValue](self->_operationProgress, "maxValue");
}

- (SSOperationProgress)operationProgress
{
  return self->_operationProgress;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = -[SSOperationProgress copyWithZone:](self->_operationProgress, "copyWithZone:", a3);
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_operationProgress);
  return v3;
}

- (SSDownloadPhase)initWithXPCEncoding:(id)a3
{
  SSDownloadPhase *v5;
  objc_super v7;

  if (!a3 || MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {

    return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SSDownloadPhase;
    v5 = -[SSDownloadPhase init](&v7, sel_init);
    if (v5)
      v5->_operationProgress = -[SSOperationProgress initWithXPCEncoding:]([SSOperationProgress alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "0"));
  }
  return v5;
}

@end
