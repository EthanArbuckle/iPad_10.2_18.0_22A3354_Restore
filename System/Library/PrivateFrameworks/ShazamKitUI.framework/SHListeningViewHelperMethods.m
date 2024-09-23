@implementation SHListeningViewHelperMethods

+ (id)animationFromAnimation:(id)a3 withStartOffset:(double)a4 duration:(double)a5
{
  double v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = -a4;
  v7 = a3;
  objc_msgSend(v7, "setBeginTime:", v6);
  objc_msgSend(MEMORY[0x24BDE5638], "animation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAnimations:", v9);
  objc_msgSend(v8, "setDuration:", a5);
  return v8;
}

@end
