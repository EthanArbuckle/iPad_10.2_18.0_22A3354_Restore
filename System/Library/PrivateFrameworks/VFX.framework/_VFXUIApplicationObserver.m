@implementation _VFXUIApplicationObserver

+ (id)sharedInstance
{
  if (qword_1EEF65F60 != -1)
    dispatch_once(&qword_1EEF65F60, &unk_1E63D1610);
  return (id)qword_1EEF65F58;
}

@end
