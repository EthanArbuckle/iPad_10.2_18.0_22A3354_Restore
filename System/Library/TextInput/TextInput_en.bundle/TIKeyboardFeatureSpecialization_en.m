@implementation TIKeyboardFeatureSpecialization_en

- (id)terminatorsDeletingAutospace
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__TIKeyboardFeatureSpecialization_en_terminatorsDeletingAutospace__block_invoke;
  block[3] = &unk_2501204D0;
  block[4] = self;
  if (terminatorsDeletingAutospace_onceToken != -1)
    dispatch_once(&terminatorsDeletingAutospace_onceToken, block);
  return (id)terminatorsDeletingAutospace_result;
}

@end
