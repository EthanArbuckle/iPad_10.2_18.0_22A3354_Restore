@implementation _UIApplicationSceneDisplayHostComponent

- (void)setDisplayBasedSafeAreaInsets:(UIEdgeInsets)a3 forSettings:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  UIEdgeInsets v7;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  v7 = a3;
  v5 = a4;
  objc_msgSend(v4, "valueWithBytes:objCType:", &v7, "{UIEdgeInsets=dddd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayBasedSafeAreaInsetsValue:", v6, *(_QWORD *)&v7.top, *(_QWORD *)&v7.left, *(_QWORD *)&v7.bottom, *(_QWORD *)&v7.right);

}

@end
