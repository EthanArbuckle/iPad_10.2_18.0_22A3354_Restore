@implementation PFStoryDurationInfoDescription

id __PFStoryDurationInfoDescription_block_invoke(CMTime *a1)
{
  id v2;
  CMTime time;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  time = *a1;
  return (id)objc_msgSend(v2, "initWithFormat:", CFSTR("%0.1f"), CMTimeGetSeconds(&time));
}

@end
