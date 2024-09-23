@implementation SPReparsedProcess

- (SPReparsedProcess)initWithSampleStore:(id)a3
{
  SPReparsedProcess *v4;
  NSObject *v5;
  double v6;
  objc_super v8;
  char __str[64];

  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)SPReparsedProcess;
    v4 = -[SPProcessEvent init](&v8, "init");
    if (v4)
    {
      snprintf(__str, 0x40uLL, "com.apple.spindump.reparsed_process_%d", objc_msgSend(a3, "targetProcessId"));
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->super._processingQueue = (OS_dispatch_queue *)dispatch_queue_create(__str, v5);
      dispatch_release(v5);
      v4->super._targetProcessId = objc_msgSend(a3, "targetProcessId");
      v4->super._targetThreadId = (unint64_t)objc_msgSend(a3, "targetThreadId");
      v4->super._targetHIDEventMachAbs = (unint64_t)objc_msgSend(a3, "targetHIDEventMachAbs");
      v4->super._targetHIDEventEndMachAbs = (unint64_t)objc_msgSend(a3, "targetHIDEventEndMachAbs");
      v4->super._event = (NSString *)objc_msgSend(a3, "event");
      v4->super._eventNote = (NSString *)objc_msgSend(a3, "eventNote");
      -[SPProcessEvent setEventTimeRange:](v4, "setEventTimeRange:", objc_msgSend(a3, "eventTimeRange"));
      v4->super._signature = (NSString *)objc_msgSend(a3, "signature");
      objc_msgSend(a3, "extraDuration");
      v4->super._extraDuration = v6;
      v4->super._durationNote = (NSString *)objc_msgSend(a3, "durationNote");
      v4->super._stepsNote = (NSString *)objc_msgSend(a3, "stepsNote");
      v4->super._customOutput = (NSString *)objc_msgSend(a3, "customOutput");
      v4->_sampleStore = (SASampleStore *)a3;
      v4->super._isLiveSampling = 0;
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (BOOL)setTargetProcessWithHint:(id)a3
{
  unsigned __int8 v4;

  v4 = -[SASampleStore setTargetProcessWithHint:](self->_sampleStore, "setTargetProcessWithHint:", a3);
  self->super._targetProcessId = -[SASampleStore targetProcessId](self->_sampleStore, "targetProcessId");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPReparsedProcess;
  -[SPProcessEvent dealloc](&v3, "dealloc");
}

- (void)_saveReportToStream:(__sFILE *)a3
{
  if (a3)
    -[SPProcessEvent _saveReportToStream:withSampleStore:](self, "_saveReportToStream:withSampleStore:");
}

- (void)_performSamplePrinterWork:(id)a3
{
  (*((void (**)(id, id))a3 + 2))(a3, -[SPProcessEvent _samplePrinterForSampleStore:](self, "_samplePrinterForSampleStore:", self->_sampleStore));
}

@end
