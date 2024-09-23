@implementation UIDeviceNativeUserInterfaceIdiom

void ___UIDeviceNativeUserInterfaceIdiom_block_invoke()
{
  void *v0;
  void *v1;
  unint64_t v2;
  int v3;
  uint64_t v4;
  id v5;

  qword_1ECD7E338 = -1;
  +[_UIDeviceInitialDeviceConfigurationLoader sharedLoader](_UIDeviceInitialDeviceConfigurationLoader, "sharedLoader");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialDeviceContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (!v0)
  {
LABEL_5:
    v2 = qword_1ECD7E338;
    if (qword_1ECD7E338 != -1)
      goto LABEL_10;
LABEL_8:
    v2 = _UIDeviceNativeUserInterfaceIdiomIgnoringClassic();
LABEL_9:
    qword_1ECD7E338 = v2;
LABEL_10:
    if (v2 == 4)
      goto LABEL_17;
    goto LABEL_14;
  }
  v2 = objc_msgSend(v0, "deviceInfoIntegerValueForKey:", *MEMORY[0x1E0DC5CC8]) - 1;
  if (v2 < 0xB)
    goto LABEL_9;
  qword_1ECD7E338 = -1;
  v3 = objc_msgSend(v1, "deviceInfoIntegerValueForKey:", *MEMORY[0x1E0DC5CB8]);
  v4 = 1;
  switch(v3)
  {
    case -1:
      qword_1ECD7E338 = -1;
      goto LABEL_8;
    case 0:
    case 1:
      v4 = 0;
      break;
    case 2:
      break;
    case 3:
      v4 = 2;
      break;
    case 4:
      goto LABEL_16;
    default:
      goto LABEL_5;
  }
  qword_1ECD7E338 = v4;
LABEL_14:
  if (+[UIDevice _isWatch](UIDevice, "_isWatch")
    || +[UIDevice _isWatchCompanion](UIDevice, "_isWatchCompanion"))
  {
LABEL_16:
    qword_1ECD7E338 = 4;
  }
LABEL_17:

}

@end
