@implementation MSPHistoryRAPSearchRecordingStorage

+ (Class)recordingClass
{
  return (Class)objc_opt_class(RAPSearchRecording);
}

@end
