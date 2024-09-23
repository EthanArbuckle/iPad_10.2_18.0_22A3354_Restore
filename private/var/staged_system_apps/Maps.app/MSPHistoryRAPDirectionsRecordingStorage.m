@implementation MSPHistoryRAPDirectionsRecordingStorage

+ (Class)recordingClass
{
  return (Class)objc_opt_class(RAPDirectionsRecording);
}

@end
