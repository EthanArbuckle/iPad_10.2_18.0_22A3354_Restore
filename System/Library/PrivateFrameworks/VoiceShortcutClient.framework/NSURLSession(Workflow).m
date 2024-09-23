@implementation NSURLSession(Workflow)

+ (id)wf_sharedSession
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NSURLSession_Workflow__wf_sharedSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (wf_sharedSession_onceToken != -1)
    dispatch_once(&wf_sharedSession_onceToken, block);
  return (id)wf_sharedSession_sharedSession;
}

@end
