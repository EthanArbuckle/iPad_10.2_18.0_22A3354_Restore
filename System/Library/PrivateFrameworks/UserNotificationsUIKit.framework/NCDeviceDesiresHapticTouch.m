@implementation NCDeviceDesiresHapticTouch

void ___NCDeviceDesiresHapticTouch_block_invoke()
{
  id v0;

  if (MGGetBoolAnswer() && !MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    _NCDeviceDesiresHapticTouch___deviceDesiresHapticTouch = objc_msgSend(v0, "homeButtonType") == 2;

  }
  else
  {
    _NCDeviceDesiresHapticTouch___deviceDesiresHapticTouch = 0;
  }
}

@end
