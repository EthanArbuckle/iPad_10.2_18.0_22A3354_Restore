@implementation STStorageDeviceIsiPad

void __STStorageDeviceIsiPad_block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  STStorageDeviceIsiPad_isiPad = objc_msgSend(v0, "intValue") == 3;

}

@end
